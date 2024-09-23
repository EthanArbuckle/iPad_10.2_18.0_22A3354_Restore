@implementation OITSUCFSetEnumerator

- (void)dealloc
{
  void **mObjects;
  BOOL v4;
  objc_super v5;

  mObjects = (void **)self->mObjects;
  if (mObjects)
    v4 = mObjects == self->mInlineObjects;
  else
    v4 = 1;
  if (!v4)
    free(mObjects);
  v5.receiver = self;
  v5.super_class = (Class)OITSUCFSetEnumerator;
  -[OITSUCFSetEnumerator dealloc](&v5, sel_dealloc);
}

- (OITSUCFSetEnumerator)initWithCFSet:(__CFSet *)a3
{
  OITSUCFSetEnumerator *v4;
  OITSUCFSetEnumerator *v5;
  CFIndex Count;
  const void **mInlineObjects;

  v4 = -[OITSUCFSetEnumerator init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      Count = CFSetGetCount(a3);
      v5->mCount = Count;
      if (Count > 15)
        mInlineObjects = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      else
        mInlineObjects = (const void **)v5->mInlineObjects;
      v5->mObjects = mInlineObjects;
      CFSetGetValues(a3, mInlineObjects);
    }
    else
    {
      v4->mCount = 0;
    }
  }
  return v5;
}

- (id)nextObject
{
  int64_t mIndex;
  void *v3;

  mIndex = self->mIndex;
  if (mIndex >= self->mCount)
    return 0;
  v3 = (void *)self->mObjects[mIndex];
  self->mIndex = mIndex + 1;
  return v3;
}

- (id)allObjects
{
  CFArrayRef v2;

  v2 = CFArrayCreate(0, &self->mObjects[self->mIndex], self->mCount - self->mIndex, 0);
  return (id)(id)CFMakeCollectable(v2);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  const void **mObjects;

  if (a3->var0)
    return 0;
  mObjects = self->mObjects;
  a3->var0 = 1;
  a3->var1 = (id *)mObjects;
  a3->var2 = a3->var3;
  return self->mCount;
}

@end
