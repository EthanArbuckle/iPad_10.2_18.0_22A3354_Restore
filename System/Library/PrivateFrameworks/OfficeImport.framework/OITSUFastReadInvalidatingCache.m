@implementation OITSUFastReadInvalidatingCache

- (id)initForReentrant:(BOOL)a3 withGenerator:(id)a4
{
  OITSUFastReadInvalidatingCache *v6;
  OITSUFastReadInvalidatingCache *v7;
  OITSUFastReadInvalidatingCache *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OITSUFastReadInvalidatingCache;
  v6 = -[OITSUFastReadInvalidatingCache init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a4)
    {
      v6->mGenerator = _Block_copy(a4);
      v7->mReentrant = a3;
      if (!a3)
        v7->mCondition = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    }
    else
    {
      v8 = v6;
      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  id mGenerator;
  void *v4;
  void *v5;
  objc_super v6;

  mGenerator = self->mGenerator;
  if (mGenerator)
    _Block_release(mGenerator);
  v4 = (void *)atomic_load((unint64_t *)&self->mValue);

  v5 = (void *)atomic_load((unint64_t *)&self->mToDispose);
  v6.receiver = self;
  v6.super_class = (Class)OITSUFastReadInvalidatingCache;
  -[OITSUFastReadInvalidatingCache dealloc](&v6, sel_dealloc);
}

- (void)p_setValue:(id)a3
{
  id v5;
  unint64_t *p_mValue;
  unint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t *p_mToDispose;
  void *v11;
  unint64_t v12;
  id v13;

  v5 = a3;
  p_mValue = (unint64_t *)&self->mValue;
LABEL_2:
  v7 = atomic_load(p_mValue);
  do
  {
    v8 = __ldaxr(p_mValue);
    if (v8 != v7)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr((unint64_t)a3, p_mValue));
  if (v7)
  {
    v13 = (id)v8;
    v9 = 0;
    p_mToDispose = (unint64_t *)&self->mToDispose;
LABEL_9:

    v11 = (void *)atomic_load(p_mToDispose);
    if (v11)
      v9 = (id)objc_msgSend(v11, "arrayByAddingObject:", v13);
    else
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v13, 0);
    do
    {
      v12 = __ldaxr(p_mToDispose);
      if ((void *)v12 != v11)
      {
        __clrex();
        goto LABEL_9;
      }
    }
    while (__stlxr((unint64_t)v9, p_mToDispose));

  }
}

- (id)value
{
  int64_t *p_mReaderCount;
  unint64_t v4;
  void *v5;
  id v6;
  unint64_t *p_mToDispose;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *global_queue;
  _QWORD block[5];

  p_mReaderCount = &self->mReaderCount;
  do
    v4 = __ldaxr((unint64_t *)p_mReaderCount);
  while (__stlxr(v4 + 1, (unint64_t *)p_mReaderCount));
  v5 = (void *)atomic_load((unint64_t *)&self->mValue);
  v6 = v5;
  p_mToDispose = (unint64_t *)&self->mToDispose;
  v8 = atomic_load((unint64_t *)&self->mToDispose);
  do
    v9 = __ldaxr((unint64_t *)p_mReaderCount);
  while (__stlxr(v9 - 1, (unint64_t *)p_mReaderCount));
  while (!v6)
  {
    if (self->mReentrant)
      goto LABEL_21;
    -[NSCondition lock](self->mCondition, "lock");
    if (!self->mIsGenerating)
    {
      self->mIsGenerating = 1;
      -[NSCondition unlock](self->mCondition, "unlock");
LABEL_21:
      v6 = (id)(*((uint64_t (**)(void))self->mGenerator + 2))();
      -[OITSUFastReadInvalidatingCache p_setValue:](self, "p_setValue:", v6);
      if (!self->mReentrant)
      {
        -[NSCondition lock](self->mCondition, "lock");
        self->mIsGenerating = 0;
        -[NSCondition broadcast](self->mCondition, "broadcast");
        -[NSCondition unlock](self->mCondition, "unlock");
      }
      break;
    }
    -[NSCondition wait](self->mCondition, "wait");
    -[NSCondition unlock](self->mCondition, "unlock");
    do
      v10 = __ldaxr((unint64_t *)p_mReaderCount);
    while (__stlxr(v10 + 1, (unint64_t *)p_mReaderCount));
    v11 = (void *)atomic_load((unint64_t *)&self->mValue);
    v6 = v11;
    v8 = atomic_load((unint64_t *)&self->mToDispose);
    do
      v9 = __ldaxr((unint64_t *)p_mReaderCount);
    while (__stlxr(v9 - 1, (unint64_t *)p_mReaderCount));
  }
  if (v9 == 1 && v8)
  {
    while (1)
    {
      v12 = __ldaxr(p_mToDispose);
      if (v12 != v8)
        break;
      if (!__stlxr(0, p_mToDispose))
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __39__OITSUFastReadInvalidatingCache_value__block_invoke;
        block[3] = &unk_24F39A608;
        block[4] = v8;
        dispatch_async(global_queue, block);
        return v6;
      }
    }
    __clrex();
  }
  return v6;
}

void __39__OITSUFastReadInvalidatingCache_value__block_invoke(uint64_t a1)
{

}

- (void)invalidate
{
  -[OITSUFastReadInvalidatingCache p_setValue:](self, "p_setValue:", 0);
}

@end
