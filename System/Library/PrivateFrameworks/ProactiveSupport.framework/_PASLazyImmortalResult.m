@implementation _PASLazyImmortalResult

- (id)_initWithBlock:(id)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PASLazyImmortalResult;
  result = -[_PASLazyResult _initWithBlock:](&v4, sel__initWithBlock_, a3);
  if (result)
    atomic_store(0, (unsigned __int8 *)result + 88);
  return result;
}

- (_PASLazyImmortalResult)initWithResult:(id)a3
{
  id v5;
  _PASLazyImmortalResult *v6;

  v5 = a3;
  v6 = -[_PASLazyResult _init]([_PASLazyImmortalResult alloc], "_init");

  if (v6)
  {
    objc_storeStrong(&v6->super._data, a3);
    atomic_store(1u, (unsigned __int8 *)&v6->_done);
  }

  return v6;
}

- (id)result
{
  BOOL *p_done;
  unsigned __int8 v4;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id data;
  id block;

  p_done = &self->_done;
  v4 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v4 & 1) == 0)
  {
    v6 = pthread_mutex_lock(&self->super._lock);
    v7 = atomic_load((unsigned __int8 *)p_done);
    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1A1AFDC98](v6);
      (*((void (**)(void))self->super._block + 2))();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v8);
      data = self->super._data;
      self->super._data = v9;

      block = self->super._block;
      self->super._block = 0;

      atomic_store(1u, (unsigned __int8 *)&self->_done);
    }
    pthread_mutex_unlock(&self->super._lock);
  }
  return self->super._data;
}

- (id)resultIfAvailable
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v2 & 1) != 0)
    return self->super._data;
  else
    return 0;
}

@end
