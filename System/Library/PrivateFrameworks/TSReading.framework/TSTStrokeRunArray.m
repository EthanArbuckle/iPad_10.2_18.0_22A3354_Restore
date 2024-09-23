@implementation TSTStrokeRunArray

- (TSTStrokeRunArray)initWithCount:(unsigned int)a3
{
  TSTStrokeRunArray *v4;
  TSTStrokeRunArray *v5;
  size_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSTStrokeRunArray;
  v4 = -[TSTStrokeRunArray init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1)
      v6 = 1;
    else
      v6 = a3;
    v4->mCount = a3;
    v4->mAllocCount = v6;
    v4->mStrokes = (TSTStrokeRun *)malloc_type_calloc(0x20uLL, v6, 0x5F09CD24uLL);
    v5->mLastLookup = 0;
    v5->mMaxWidth = 0.0;
    v5->mHasCustomStrokes = 0;
    pthread_rwlock_init(&v5->mRWLock, 0);
  }
  return v5;
}

- (void)dealloc
{
  unsigned int mCount;
  unsigned int v4;
  uint64_t v5;
  TSTStrokeRun *v6;
  TSTStrokeRun *mStrokes;
  objc_super v8;

  mCount = self->mCount;
  if (mCount)
  {
    v4 = mCount - 1;
    v5 = mCount - 1;
    do
    {
      if (self->mCount <= v4)
        v6 = 0;
      else
        v6 = &self->mStrokes[v5];
      TSTStrokeRunSet(v6, 0, 0, 0, 0, 0);
      --v5;
      --v4;
    }
    while (v4 != -1);
  }
  mStrokes = self->mStrokes;
  if (mStrokes)
  {
    free(mStrokes);
    self->mStrokes = 0;
  }
  *(_QWORD *)&self->mCount = 0;
  pthread_rwlock_destroy(&self->mRWLock);
  v8.receiver = self;
  v8.super_class = (Class)TSTStrokeRunArray;
  -[TSTStrokeRunArray dealloc](&v8, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  TSTStrokeRun *v12;
  uint64_t var0;
  uint64_t var1;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mHasCustomStrokes)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p count=%u hasCustomStrokes=%@ maxWidth=%f"), v5, self, self->mCount, v6, *(_QWORD *)&self->mMaxWidth);
  v8 = v7;
  if (self->mStrokes)
  {
    objc_msgSend(v7, "appendString:", CFSTR(" strokeRuns={"));
    if (self->mCount)
    {
      v9 = 0;
      v10 = 0;
      v11 = CFSTR("}>");
      do
      {
        v12 = &self->mStrokes[v9];
        var0 = v12->var0;
        var1 = v12->var1;
        v15 = objc_msgSend(v12->var2, "description");
        if ((*((_BYTE *)&self->mStrokes[v9] + 24) & 1) != 0)
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        if ((*((_BYTE *)&self->mStrokes[v9] + 24) & 2) != 0)
          v17 = CFSTR("YES");
        else
          v17 = CFSTR("NO");
        objc_msgSend(v8, "appendFormat:", CFSTR("\n  { start=%u -> stop=%u stroke=%@ valid=%@ custom=%@}"), var0, var1, v15, v16, v17);
        ++v10;
        ++v9;
      }
      while (v10 < self->mCount);
    }
    else
    {
      v11 = CFSTR("}>");
    }
  }
  else
  {
    v11 = CFSTR(" strokeRuns={empty}>");
  }
  objc_msgSend(v8, "appendString:", v11);
  return v8;
}

- (double)maxWidth
{
  return self->mMaxWidth;
}

@end
