@implementation WBDatabaseLockAcquisitor

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBDatabaseLockAcquisitor)initWithWebBookmarkCollectionClass:(Class)a3
{
  WBDatabaseLockAcquisitor *v4;
  WBDatabaseLockAcquisitor *v5;
  WBDatabaseLockAcquisitor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBDatabaseLockAcquisitor;
  v4 = -[WBDatabaseLockAcquisitor init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_webBookmarkCollectionClass = a3;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WBDatabaseLockAcquisitor releaseLock](self, "releaseLock");
  v3.receiver = self;
  v3.super_class = (Class)WBDatabaseLockAcquisitor;
  -[WBDatabaseLockAcquisitor dealloc](&v3, sel_dealloc);
}

- (void)acquireLockWithTimeout:(double)a3
{
  -[WBDatabaseLockAcquisitor acquireLockWithTimeout:retryInterval:](self, "acquireLockWithTimeout:retryInterval:", a3, 4.0);
}

- (void)acquireLockWithTimeout:(double)a3 retryInterval:(double)a4
{
  _QWORD block[7];

  -[objc_class holdLockSync:](self->_webBookmarkCollectionClass, "holdLockSync:", self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WBDatabaseLockAcquisitor_acquireLockWithTimeout_retryInterval___block_invoke;
  block[3] = &unk_24CB35070;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __65__WBDatabaseLockAcquisitor_acquireLockWithTimeout_retryInterval___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "_attemptToLockSyncAndNotifyDelegateOnFailure:", v2 < v3);
  if (v2 >= v3 && (result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_startTimerWithTimeout:retryInterval:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return result;
}

- (void)releaseLock
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "WBDatabaseLockAcquisitor: releasing database lock", buf, 2u);
  }
  -[WBDatabaseLockAcquisitor _stopTimer](self, "_stopTimer");
  -[objc_class unholdLockSync:](self->_webBookmarkCollectionClass, "unholdLockSync:", self);
  if (self->_lockAcquired)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_DEFAULT, "Unlocking sync since lock was previously acquired", v5, 2u);
    }
    -[objc_class unlockSync](self->_webBookmarkCollectionClass, "unlockSync");
  }
}

- (BOOL)_attemptToLockSyncAndNotifyDelegateOnFailure:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  char v6;
  int v7;
  int v8;
  NSObject *v9;
  _BOOL4 lockAcquired;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  LODWORD(v3) = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();
  v7 = -[objc_class isLockedSync](self->_webBookmarkCollectionClass, "isLockedSync");
  if ((v7 & 1) == 0)
  {
    v8 = -[objc_class lockSync](self->_webBookmarkCollectionClass, "lockSync");
    self->_lockAcquired = v8;
    if (!v8)
    {
      if (!v3)
        goto LABEL_10;
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      v3 = 0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_DEFAULT, "WBDatabaseLockAcquisitor: failed to acquire database lock", (uint8_t *)v13, 2u);
        v3 = 0;
      }
      goto LABEL_6;
    }
  }
  v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    lockAcquired = self->_lockAcquired;
    v13[0] = 67109632;
    v13[1] = v7;
    v14 = 1024;
    v15 = lockAcquired;
    v16 = 1024;
    v17 = v6 & 1;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_DEFAULT, "WBDatabaseLockAcquisitor: successfully acquired database lock (was locked: %d, lock acquired: %d, should notify: %d)", (uint8_t *)v13, 0x14u);
  }
  -[WBDatabaseLockAcquisitor _stopTimer](self, "_stopTimer");
  v3 = 1;
  if ((v6 & 1) != 0)
LABEL_6:
    objc_msgSend(WeakRetained, "databaseLockAcquisitor:acquiredLock:", self, v3);
LABEL_10:

  return v3;
}

- (void)_stopTimer
{
  NSTimer **p_timer;
  id WeakRetained;
  int v4;
  id v5;

  p_timer = &self->_timer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_timer);
  v4 = objc_msgSend(WeakRetained, "isValid");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_timer);
    objc_msgSend(v5, "invalidate");

    objc_storeWeak((id *)p_timer, 0);
  }
}

- (void)_startTimerWithTimeout:(double)a3 retryInterval:(double)a4
{
  id v7;

  -[WBDatabaseLockAcquisitor _stopTimer](self, "_stopTimer");
  self->_maxRetryCount = llround(a3 / a4);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__retryTimerFired_, 0, 1, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_timer, v7);

}

- (void)_retryTimerFired:(id)a3
{
  id v4;
  int64_t maxRetryCount;
  int64_t v6;
  id v7;

  v4 = a3;
  maxRetryCount = self->_maxRetryCount;
  v6 = self->_retryCount + 1;
  self->_retryCount = v6;
  if (v6 >= maxRetryCount)
  {
    v7 = v4;
    if (-[WBDatabaseLockAcquisitor _attemptToLockSyncAndNotifyDelegateOnFailure:](self, "_attemptToLockSyncAndNotifyDelegateOnFailure:", 1))
    {
      -[WBDatabaseLockAcquisitor _stopTimer](self, "_stopTimer");
    }
    else
    {
      -[WBDatabaseLockAcquisitor releaseLock](self, "releaseLock");
    }
    v4 = v7;
  }

}

- (WBDatabaseLockAcquisitorDelegate)delegate
{
  return (WBDatabaseLockAcquisitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_timer);
}

@end
