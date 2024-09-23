@implementation _PASCachedResult

- (_PASCachedResult)init
{
  _PASCachedResult *v2;
  _PASCachedResult *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PASCachedResult;
  v2 = -[_PASCachedResult init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_done);
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASCachedResult;
  -[_PASCachedResult dealloc](&v3, sel_dealloc);
}

- (_PASCachedResult)resultWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  unsigned __int8 v5;
  _PASCachedResult *v6;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id data;

  v4 = (void (**)(_QWORD))a3;
  v5 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v5 & 1) == 0)
  {
    v8 = pthread_mutex_lock(&self->_lock);
    v9 = atomic_load((unsigned __int8 *)&self->_done);
    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A1AFDC98](v8);
      v4[2](v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v10);
      data = self->_data;
      self->_data = v11;

      atomic_store(1u, (unsigned __int8 *)&self->_done);
    }
    pthread_mutex_unlock(&self->_lock);
  }
  v6 = (_PASCachedResult *)self->_data;

  return v6;
}

- (id)resultNonnullWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  unsigned __int8 v5;
  id v6;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id data;

  v4 = (void (**)(_QWORD))a3;
  v5 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v5 & 1) == 0)
  {
    v8 = pthread_mutex_lock(&self->_lock);
    v9 = atomic_load((unsigned __int8 *)&self->_done);
    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A1AFDC98](v8);
      v4[2](v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v10);
      data = self->_data;
      self->_data = v11;

      atomic_store(1u, (unsigned __int8 *)&self->_done);
    }
    pthread_mutex_unlock(&self->_lock);
  }
  v6 = self->_data;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
}

@end
