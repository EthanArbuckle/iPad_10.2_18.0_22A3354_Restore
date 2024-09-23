@implementation _PASLazyPurgeableResult

- (id)result
{
  unsigned __int8 v2;
  _opaque_pthread_mutex_t *p_lock;
  id WeakRetained;
  id data;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  NSObject *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *memoryPressureSource;
  void *v16;
  OS_dispatch_source *v17;
  OS_dispatch_source *idleTimeoutSource;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v2 = atomic_load((unsigned __int8 *)&self->_nil);
  if ((v2 & 1) != 0)
    return 0;
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (self->super._data)
    goto LABEL_14;
  WeakRetained = objc_loadWeakRetained(&self->_weakData);
  data = self->super._data;
  self->super._data = WeakRetained;

  if (self->super._data)
  {
LABEL_8:
    v12 = atomic_load((unsigned __int8 *)&self->_nil);
    if ((v12 & 1) != 0)
      __assert_rtn("-[_PASLazyPurgeableResult _createDispatchSources]", "_PASCachedResult.m", 167, "!atomic_load(&_nil)");
    if (_createDispatchSources__pasOnceToken4 != -1)
      dispatch_once(&_createDispatchSources__pasOnceToken4, &__block_literal_global_2756);
    v13 = (id)_createDispatchSources__pasExprOnceResult;
    v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 0x30uLL, v13);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v14;

    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49___PASLazyPurgeableResult__createDispatchSources__block_invoke_2;
    v21[3] = &unk_1E4430440;
    objc_copyWeak(&v22, &location);
    v16 = (void *)MEMORY[0x1A1AFDE78](v21);
    dispatch_source_set_event_handler((dispatch_source_t)self->_memoryPressureSource, v16);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
    if (fabs(self->_idleTimeout) != INFINITY)
    {
      v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v13);
      idleTimeoutSource = self->_idleTimeoutSource;
      self->_idleTimeoutSource = v17;

      dispatch_source_set_event_handler((dispatch_source_t)self->_idleTimeoutSource, v16);
      dispatch_resume((dispatch_object_t)self->_idleTimeoutSource);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

LABEL_14:
    if (fabs(self->_idleTimeout) != INFINITY)
    {
      v19 = self->_idleTimeoutSource;
      if (!v19)
        __assert_rtn("-[_PASLazyPurgeableResult result]", "_PASCachedResult.m", 234, "_idleTimeoutSource");
      dispatch_suspend(v19);
      dispatch_source_set_timer((dispatch_source_t)self->_idleTimeoutSource, +[_PASDispatch dispatchTimeWithSecondsFromNow:](_PASDispatch, "dispatchTimeWithSecondsFromNow:", self->_idleTimeout), 0xFFFFFFFFFFFFFFFFLL, (uint64_t)fmin(self->_idleTimeout * 1000000000.0, 1.0e10));
      dispatch_resume((dispatch_object_t)self->_idleTimeoutSource);
    }
    v20 = self->super._data;
    goto LABEL_18;
  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  (*((void (**)(void))self->super._block + 2))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    v10 = self->super._data;
    self->super._data = v9;
    v11 = v9;

    objc_storeWeak(&self->_weakData, self->super._data);
    goto LABEL_8;
  }
  v20 = 0;
  atomic_store(1u, (unsigned __int8 *)&self->_nil);
LABEL_18:
  pthread_mutex_unlock(p_lock);
  return v20;
}

- (_PASLazyPurgeableResult)initWithBlock:(id)a3
{
  return -[_PASLazyPurgeableResult initWithBlock:idleTimeout:](self, "initWithBlock:idleTimeout:", a3, 60.0);
}

- (_PASLazyPurgeableResult)initWithBlock:(id)a3 idleTimeout:(double)a4
{
  _PASLazyPurgeableResult *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASLazyPurgeableResult;
  result = -[_PASLazyResult _initWithBlock:](&v6, sel__initWithBlock_, a3);
  if (result)
  {
    atomic_store(0, (unsigned __int8 *)&result->_nil);
    result->_idleTimeout = a4;
  }
  return result;
}

- (void)dealloc
{
  _opaque_pthread_mutex_t *p_lock;
  NSObject *memoryPressureSource;
  NSObject *idleTimeoutSource;
  objc_super v6;

  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
    dispatch_source_cancel(memoryPressureSource);
  idleTimeoutSource = self->_idleTimeoutSource;
  if (idleTimeoutSource)
    dispatch_source_cancel(idleTimeoutSource);
  pthread_mutex_unlock(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)_PASLazyPurgeableResult;
  -[_PASLazyResult dealloc](&v6, sel_dealloc);
}

- (id)resultIfAvailable
{
  unsigned __int8 v2;
  _opaque_pthread_mutex_t *p_lock;
  id WeakRetained;

  v2 = atomic_load((unsigned __int8 *)&self->_nil);
  if ((v2 & 1) != 0)
  {
    WeakRetained = 0;
  }
  else
  {
    p_lock = &self->super._lock;
    pthread_mutex_lock(&self->super._lock);
    WeakRetained = objc_loadWeakRetained(&self->_weakData);
    pthread_mutex_unlock(p_lock);
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimeoutSource, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_destroyWeak(&self->_weakData);
}

@end
