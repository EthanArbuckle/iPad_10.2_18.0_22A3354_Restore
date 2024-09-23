@implementation _PASLock

- (void).cxx_destruct
{
  objc_storeStrong(&self->_guardedData, 0);
}

- (void)runWithLockAcquired:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[_PASLock _runThenUnlock:]((uint64_t)self, v5);

}

- (void)_runThenUnlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);

  v3 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 72) = pthread_self();
    v3[2](v3, *(_QWORD *)(a1 + 80));
    *(_QWORD *)(a1 + 72) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
  }

}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASLock;
  -[_PASLock dealloc](&v3, sel_dealloc);
}

- (_PASLock)initWithGuardedData:(id)a3
{
  id v5;
  _PASLock *v6;
  objc_super v8;
  pthread_mutexattr_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PASLock;
  v6 = -[_PASLock init](&v8, sel_init);
  if (v6)
  {
    v9.__sig = 0;
    *(_QWORD *)v9.__opaque = 0;
    pthread_mutexattr_init(&v9);
    pthread_mutexattr_settype(&v9, 2);
    pthread_mutex_init(&v6->_lock, &v9);
    pthread_mutexattr_destroy(&v9);
    objc_storeStrong(&v6->_guardedData, a3);
  }

  return v6;
}

- (unsigned)tryWithLockAcquired:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (pthread_mutex_trylock(&self->_lock))
  {
    v5 = 1;
  }
  else
  {
    -[_PASLock _runThenUnlock:]((uint64_t)self, v4);
    v5 = 0;
  }

  return v5;
}

- (unsigned)runWithLockAcquired:(id)a3 shouldContinueBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  void *v8;
  int v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  v9 = v7[2](v7);
  objc_autoreleasePoolPop(v8);
  v10 = 1;
  if (v9)
  {
    while (-[_PASLock tryWithLockAcquired:](self, "tryWithLockAcquired:", v6))
    {
      v11 = sleep(1u);
      v12 = (void *)MEMORY[0x1A1AFDC98](v11);
      v13 = v7[2](v7);
      objc_autoreleasePoolPop(v12);
      if ((v13 & 1) == 0)
        goto LABEL_6;
    }
    v10 = 0;
  }
LABEL_6:

  return v10;
}

- (id)guardedDataAssertingLockContext
{
  _opaque_pthread_mutex_t *p_lock;
  id result;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  p_lock = &self->_lock;
  if (pthread_mutex_trylock(&self->_lock))
  {
    result = (id)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      v9 = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "_PASLock:guardedDataAssertingLockContext called with lock acquired by different thread";
      v7 = (uint8_t *)&v9;
LABEL_8:
      _os_log_error_impl(&dword_1A0957000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
    }
  }
  else
  {
    if (self->_owner)
    {
      pthread_mutex_unlock(p_lock);
      return -[_PASLock unsafeGuardedData](self, "unsafeGuardedData");
    }
    result = (id)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      v8 = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "_PASLock:guardedDataAssertingLockContext called with lock not acquired";
      v7 = (uint8_t *)&v8;
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

- (id)unsafeGuardedData
{
  return self->_guardedData;
}

@end
