@implementation TSDCTranslationClock

- (TSDCTranslationClock)initWithClockIdentifier:(unint64_t)a3
{
  TSDCTranslationClock *v5;
  _TSF_TSDKernelClock *v6;
  TSXTranslationClock *v7;
  TSXTranslationClock *translationClock;
  void *v9;
  uint64_t v10;
  _TSF_TSDClockSync *clockSync;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = (const char *)a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDCTranslationClock (0x%016llx) initWithClockIdentifier", buf, 0xCu);
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDCTranslationClock;
  v5 = -[TSDCTranslationClock init](&v13, sel_init);
  if (v5)
  {
    v6 = -[_TSF_TSDKernelClock initWithClockIdentifier:]([_TSF_TSDKernelClock alloc], "initWithClockIdentifier:", a3);
    if (v6)
    {
      v7 = -[TSXTranslationClock initWithClockIdentifier:]([TSXTranslationClock alloc], "initWithClockIdentifier:", a3);
      translationClock = v5->_translationClock;
      v5->_translationClock = v7;

      objc_storeStrong((id *)&v5->_translationKernelClock, v6);
      -[_TSF_TSDKernelClock addClient:](v5->_translationKernelClock, "addClient:", v5);
      +[_TSF_TSDClockSyncManager sharedClockSyncManager](_TSF_TSDClockSyncManager, "sharedClockSyncManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clockSyncForClockIdentifier:pid:", a3, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      clockSync = v5->_clockSync;
      v5->_clockSync = (_TSF_TSDClockSync *)v10;

      -[_TSF_TSDClockSync addUpdateClient:](v5->_clockSync, "addUpdateClient:", v5);
      -[TSDCTranslationClock getInitialSyncInfo](v5, "getInitialSyncInfo");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v15 = "kernelClock";
        v16 = 2048;
        v17 = 0;
        v18 = 2048;
        v19 = 0;
        v20 = 2080;
        v21 = "";
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
        v24 = 1024;
        v25 = 84;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_TSF_TSDClockSync removeUpdateClient:](self->_clockSync, "removeUpdateClient:", self);
  +[_TSF_TSDClockSyncManager sharedClockSyncManager](_TSF_TSDClockSyncManager, "sharedClockSyncManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseClockSyncForClockIdentifier:", -[_TSF_TSDKernelClock clockIdentifier](self->_translationKernelClock, "clockIdentifier"));

  -[_TSF_TSDKernelClock removeClient:](self->_translationKernelClock, "removeClient:", self);
  v4.receiver = self;
  v4.super_class = (Class)TSDCTranslationClock;
  -[TSDCTranslationClock dealloc](&v4, sel_dealloc);
}

- (void)getInitialSyncInfo
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error getting initial sync info \"%s\", buf, 0xCu);

}

- (void)didChangeClockMasterForClock:(id)a3
{
  id v3;

  -[TSDCTranslationClock translationClock](self, "translationClock", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_changedClockMaster");

}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&a3;
  -[TSDCTranslationClock translationClock](self, "translationClock", *(_QWORD *)&a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateLockState:", v4);

}

- (void)updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6
{
  -[TSXTranslationClock _updateTimeSyncTime:timeSyncInterval:domainTime:domainInterval:](self->_translationClock, "_updateTimeSyncTime:timeSyncInterval:domainTime:domainInterval:", a3, a4, a5, a6);
}

- (_TSF_TSDKernelClock)translationKernelClock
{
  return self->_translationKernelClock;
}

- (TSXTranslationClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_translationKernelClock, 0);
  objc_storeStrong((id *)&self->_clockSync, 0);
}

@end
