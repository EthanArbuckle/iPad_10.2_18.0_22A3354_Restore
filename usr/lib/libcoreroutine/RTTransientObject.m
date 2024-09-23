@implementation RTTransientObject

- (RTTransientObject)initWithCreationBlock:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  RTTransientObject *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[RTTransientObject initWithCreationBlock:timeout:timerManager:](self, "initWithCreationBlock:timeout:timerManager:", v6, v7, a4);

  return v8;
}

- (RTTransientObject)initWithCreationBlock:(id)a3 timeout:(double)a4 timerManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  RTTransientObject *v14;
  void *v15;
  id backingObjectCreationBlock;
  NSRecursiveLock *v17;
  NSRecursiveLock *lock;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v20 = 136315394;
    v21 = "-[RTTransientObject initWithCreationBlock:timeout:timerManager:]";
    v22 = 1024;
    v23 = 29;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationBlock (in %s:%d)", (uint8_t *)&v20, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[RTTransientObject initWithCreationBlock:timeout:timerManager:]";
      v22 = 1024;
      v23 = 30;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timerManager (in %s:%d)", (uint8_t *)&v20, 0x12u);
    }

  }
LABEL_10:
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[RTTransientObject initWithCreationBlock:timeout:timerManager:]";
      v22 = 1024;
      v23 = 31;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "timeout must be greater than 0. (in %s:%d)", (uint8_t *)&v20, 0x12u);
    }

  }
  v14 = 0;
  if (v8 && a4 > 0.0 && v10)
  {
    self->_backingObjectExpirationTimeInterval = a4;
    v15 = (void *)MEMORY[0x1D8232094](v8);
    backingObjectCreationBlock = self->_backingObjectCreationBlock;
    self->_backingObjectCreationBlock = v15;

    v17 = (NSRecursiveLock *)objc_opt_new();
    lock = self->_lock;
    self->_lock = v17;

    objc_storeStrong((id *)&self->_timerManager, a5);
    self->_lastForwardedMessageTimeInterval = 0.0;
    v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[RTTimer invalidate](self->_backingObjectExpirationTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RTTransientObject;
  -[RTTransientObject dealloc](&v3, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  NSRecursiveLock *lock;
  id v5;
  NSObject *v6;
  double v7;
  void *v8;
  void *v9;
  double lastForwardedMessageTimeInterval;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[RTTransientObject backingObject](self, "backingObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    lastForwardedMessageTimeInterval = self->_lastForwardedMessageTimeInterval;
    v11 = 138412546;
    v12 = v9;
    v13 = 2048;
    v14 = lastForwardedMessageTimeInterval;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "updating last forwarded message time interval for transient object, %@ to %lf", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastForwardedMessageTimeInterval = v7;
  -[RTTransientObject backingObject](self, "backingObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invokeWithTarget:", v8);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[RTTransientObject backingObject](self, "backingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (void)touch
{
  -[RTTransientObject backingObject](self, "backingObject");

}

- (id)backingObject
{
  id backingObject;
  void *v4;
  id v5;
  id WeakRetained;

  backingObject = self->_backingObject;
  if (!backingObject)
  {
    -[RTTransientObject __createBackingObject](self, "__createBackingObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_backingObject;
    self->_backingObject = v4;

    backingObject = self->_backingObject;
    if (backingObject)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_transientObjectDelegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "transientObjectDidCreateBackingObject:", self);

      backingObject = self->_backingObject;
    }
  }
  return backingObject;
}

- (id)__createBackingObject
{
  void *v3;
  void (**backingObjectCreationBlock)(void);
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D8231EA8](self, a2);
  backingObjectCreationBlock = (void (**)(void))self->_backingObjectCreationBlock;
  if (backingObjectCreationBlock)
  {
    backingObjectCreationBlock[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTransientObject __createTimerAssociatedWithBackingObject](self, "__createTimerAssociatedWithBackingObject");
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "(re)created transient object, %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    v5 = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)__createTimerAssociatedWithBackingObject
{
  RTTimerManager *timerManager;
  objc_class *v4;
  void *v5;
  void *v6;
  RTTimer *v7;
  RTTimer *backingObjectExpirationTimer;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  timerManager = self->_timerManager;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __61__RTTransientObject___createTimerAssociatedWithBackingObject__block_invoke;
  v12 = &unk_1E92983E8;
  objc_copyWeak(&v13, &location);
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v5, v6, &v9);
  v7 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  backingObjectExpirationTimer = self->_backingObjectExpirationTimer;
  self->_backingObjectExpirationTimer = v7;

  -[RTTimer fireAfterDelay:](self->_backingObjectExpirationTimer, "fireAfterDelay:", self->_backingObjectExpirationTimeInterval, v9, v10, v11, v12);
  -[RTTimer resume](self->_backingObjectExpirationTimer, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __61__RTTransientObject___createTimerAssociatedWithBackingObject__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "__handleBackingObjectTimerExpired");
    WeakRetained = v2;
  }

}

- (void)__handleBackingObjectTimerExpired
{
  void *v3;
  double v4;
  double v5;
  double lastForwardedMessageTimeInterval;
  double v7;
  NSObject *v8;
  id backingObject;
  int v10;
  double v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -self->_backingObjectExpirationTimeInterval);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  lastForwardedMessageTimeInterval = self->_lastForwardedMessageTimeInterval;
  if (lastForwardedMessageTimeInterval <= v5)
  {
    -[RTTransientObject __invalidateBackingObject](self, "__invalidateBackingObject");
  }
  else
  {
    v7 = lastForwardedMessageTimeInterval - v5;
    -[RTTimer suspend](self->_backingObjectExpirationTimer, "suspend");
    -[RTTimer fireAfterDelay:](self->_backingObjectExpirationTimer, "fireAfterDelay:", v7);
    -[RTTimer resume](self->_backingObjectExpirationTimer, "resume");
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      backingObject = self->_backingObject;
      v10 = 134218242;
      v11 = v7;
      v12 = 2112;
      v13 = backingObject;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "moving timer out, %lf on object, %@", (uint8_t *)&v10, 0x16u);
    }

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)__invalidateBackingObject
{
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  id backingObject;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D8231EA8](self, a2);
  -[NSRecursiveLock lock](self->_lock, "lock");
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    backingObject = self->_backingObject;
    v8 = 138412290;
    v9 = backingObject;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "releasing transient object, %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = self->_backingObject;
  self->_backingObject = 0;

  self->_lastForwardedMessageTimeInterval = 0.0;
  -[RTTimer invalidate](self->_backingObjectExpirationTimer, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_transientObjectDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "transientObjectDidReleaseBackingObject:", self);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  objc_autoreleasePoolPop(v3);
}

- (RTTransientObjectProtocol)transientObjectDelegate
{
  return (RTTransientObjectProtocol *)objc_loadWeakRetained((id *)&self->_transientObjectDelegate);
}

- (void)setTransientObjectDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transientObjectDelegate, a3);
}

- (id)backingObjectCreationBlock
{
  return self->_backingObjectCreationBlock;
}

- (void)setBackingObjectCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBackingObject:(id)a3
{
  objc_storeStrong(&self->_backingObject, a3);
}

- (double)backingObjectExpirationTimeInterval
{
  return self->_backingObjectExpirationTimeInterval;
}

- (void)setBackingObjectExpirationTimeInterval:(double)a3
{
  self->_backingObjectExpirationTimeInterval = a3;
}

- (RTTimer)backingObjectExpirationTimer
{
  return self->_backingObjectExpirationTimer;
}

- (void)setBackingObjectExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backingObjectExpirationTimer, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (double)lastForwardedMessageTimeInterval
{
  return self->_lastForwardedMessageTimeInterval;
}

- (void)setLastForwardedMessageTimeInterval:(double)a3
{
  self->_lastForwardedMessageTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_backingObjectExpirationTimer, 0);
  objc_storeStrong(&self->_backingObject, 0);
  objc_storeStrong(&self->_backingObjectCreationBlock, 0);
  objc_destroyWeak((id *)&self->_transientObjectDelegate);
}

@end
