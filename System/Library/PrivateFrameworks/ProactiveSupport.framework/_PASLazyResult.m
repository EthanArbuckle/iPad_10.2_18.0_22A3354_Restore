@implementation _PASLazyResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_data, 0);
}

- (_PASLazyResult)initWithBlock:(id)a3
{
  id v4;
  _PASLazyResult *v5;

  v4 = a3;
  v5 = -[_PASLazyImmortalResult _initWithBlock:]([_PASLazyImmortalResult alloc], "_initWithBlock:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASLazyResult;
  -[_PASLazyResult dealloc](&v3, sel_dealloc);
}

- (id)_initWithBlock:(id)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v5 = a3;
  v6 = -[_PASLazyResult _init](self, "_init");
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_PASCachedResult.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    }
    v7 = objc_msgSend(v5, "copy");
    v8 = (void *)v6[10];
    v6[10] = v7;

  }
  return v6;
}

- (id)_init
{
  _PASLazyResult *v2;
  _PASLazyResult *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PASLazyResult;
  v2 = -[_PASLazyResult init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_lock, 0);
  return v3;
}

- (_PASLazyResult)initWithResult:(id)a3
{
  id v4;
  _PASLazyImmortalResult *v5;

  v4 = a3;
  v5 = -[_PASLazyImmortalResult initWithResult:]([_PASLazyImmortalResult alloc], "initWithResult:", v4);

  return &v5->super;
}

@end
