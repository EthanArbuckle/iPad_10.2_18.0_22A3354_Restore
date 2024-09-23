@implementation TSClockInterface

- (TSClockInterface)initWithClockIdentifier:(unint64_t)a3
{
  TSClockInterface *v4;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *notificationsQueue;
  int v8;
  void *v9;
  uint64_t v10;
  TSClock *clock;
  TSClock *v12;
  BOOL v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)TSClockInterface;
  v4 = -[TSClockInterface init](&v15, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.timesync.TSClockInterface.0x%016llx.notifications"), a3);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    notificationsQueue = v4->_notificationsQueue;
    v4->_notificationsQueue = (OS_dispatch_queue *)v6;

    v8 = 20;
    while (1)
    {
      +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clockWithClockIdentifier:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      clock = v4->_clock;
      v4->_clock = (TSClock *)v10;

      -[TSClock addClient:](v4->_clock, "addClient:", v4);
      if (v4->_clock)
        break;
      usleep(0x186A0u);
      v12 = v4->_clock;
      v13 = v8-- != 0;
      if (v12 || v8 == 0 || !v13)
      {
        if (!v12)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v17 = "_clock != nil";
            v18 = 2048;
            v19 = 0;
            v20 = 2048;
            v21 = 0;
            v22 = 2080;
            v23 = "";
            v24 = 2080;
            v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
            v26 = 1024;
            v27 = 150;
            _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
          }

          return 0;
        }
        return v4;
      }
    }
  }
  return v4;
}

- (void)setLockStateNotificationCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TSClockInterface_setLockStateNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

_QWORD *__60__TSClockInterface_setLockStateNotificationCallback_refcon___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 16) = result[5];
  *(_QWORD *)(result[4] + 24) = result[6];
  return result;
}

- (void)setMasterChangeNotificationCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__TSClockInterface_setMasterChangeNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

_QWORD *__63__TSClockInterface_setMasterChangeNotificationCallback_refcon___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 32) = result[5];
  *(_QWORD *)(result[4] + 40) = result[6];
  return result;
}

- (void)setTimeSyncTimeChangeNotificationCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__TSClockInterface_setTimeSyncTimeChangeNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void __69__TSClockInterface_setTimeSyncTimeChangeNotificationCallback_refcon___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id v7;

  +[TSClockManager sharedClockManager](TSClockManager, "sharedClockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "translationClock");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = a1[4];
  v4 = a1[5];
  v5 = *(_QWORD *)(v3 + 48);
  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    objc_msgSend(v7, "removeClient:");
    v3 = a1[4];
    v4 = a1[5];
  }
  *(_QWORD *)(v3 + 48) = v4;
  *(_QWORD *)(a1[4] + 56) = a1[6];
  if (a1[5] && !v5)
    objc_msgSend(v7, "addClient:", a1[4]);

}

- (void)setgPTPGrandmasterNotificationCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__TSClockInterface_setgPTPGrandmasterNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

_QWORD *__66__TSClockInterface_setgPTPGrandmasterNotificationCallback_refcon___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 64) = result[5];
  *(_QWORD *)(result[4] + 72) = result[6];
  return result;
}

- (void)setgPTPGrandmasterIDAndPortNotificationCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__TSClockInterface_setgPTPGrandmasterIDAndPortNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

_QWORD *__75__TSClockInterface_setgPTPGrandmasterIDAndPortNotificationCallback_refcon___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 80) = result[5];
  *(_QWORD *)(result[4] + 88) = result[6];
  return result;
}

- (void)setgPTPLocalPortNotificationCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__TSClockInterface_setgPTPLocalPortNotificationCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

_QWORD *__64__TSClockInterface_setgPTPLocalPortNotificationCallback_refcon___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 96) = result[5];
  *(_QWORD *)(result[4] + 104) = result[6];
  return result;
}

- (void)didChangeClockMasterForClock:(id)a3
{
  TSClock *v4;
  id v5;
  NSObject *notificationsQueue;
  void (*v7)(uint64_t);
  uint64_t *p_block;
  uint64_t v9;
  uint64_t block;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (TSClock *)a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v12 = objc_msgSend(v5, "UTF8String");
    v13 = 2048;
    v14 = -[TSClock clockIdentifier](v4, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s didChangeClockMasterForClock:0x%016llx\n", buf, 0x16u);

  }
  notificationsQueue = self->_notificationsQueue;
  if (self->_clock == v4)
  {
    block = MEMORY[0x1E0C809B0];
    v7 = __49__TSClockInterface_didChangeClockMasterForClock___block_invoke;
    p_block = &block;
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v7 = __49__TSClockInterface_didChangeClockMasterForClock___block_invoke_70;
    p_block = &v9;
  }
  p_block[1] = 3221225472;
  p_block[2] = (uint64_t)v7;
  p_block[3] = (uint64_t)&unk_1E694AF60;
  p_block[4] = (uint64_t)self;
  dispatch_async(notificationsQueue, p_block);

}

void __49__TSClockInterface_didChangeClockMasterForClock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v5 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      v13 = 136315650;
      v14 = v4;
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling master changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      v10 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v10 + 32);
      v11 = *(_QWORD *)(v10 + 40);
      v13 = 136315650;
      v14 = v9;
      v15 = 2048;
      v16 = v12;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished master changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
  }
}

void __49__TSClockInterface_didChangeClockMasterForClock___block_invoke_70(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v5 + 48);
      v6 = *(_QWORD *)(v5 + 56);
      v13 = 136315650;
      v14 = v4;
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling tiesynctime changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 48))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      v10 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v10 + 48);
      v11 = *(_QWORD *)(v10 + 56);
      v13 = 136315650;
      v14 = v9;
      v15 = 2048;
      v16 = v12;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished tiesynctime changed callback function %p refcon %p\n", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
  }
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *notificationsQueue;
  _QWORD v12[5];
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  _BYTE v17[14];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v15 = objc_msgSend(v7, "UTF8String");
    v16 = 1024;
    *(_DWORD *)v17 = a3;
    *(_WORD *)&v17[4] = 2048;
    *(_QWORD *)&v17[6] = objc_msgSend(v6, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s didChangeLockStateTo:%d forClock:0x%016llx\n", buf, 0x1Cu);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");
    v10 = objc_msgSend(v6, "clockIdentifier");
    *(_DWORD *)buf = 136315650;
    v15 = v9;
    v16 = 2048;
    *(_QWORD *)v17 = v10;
    *(_WORD *)&v17[8] = 1024;
    *(_DWORD *)&v17[10] = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Lock state] Client %s received lock state change for clock 0x%016llx to %d", buf, 0x1Cu);

  }
  notificationsQueue = self->_notificationsQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__TSClockInterface_didChangeLockStateTo_forClock___block_invoke;
  v12[3] = &unk_1E694B1B0;
  v12[4] = self;
  v13 = a3;
  dispatch_async(notificationsQueue, v12);

}

void __50__TSClockInterface_didChangeLockStateTo_forClock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v5 + 16);
      v6 = *(_QWORD *)(v5 + 24);
      v8 = *(_DWORD *)(a1 + 40);
      v15 = 136315906;
      v16 = v4;
      v17 = 2048;
      v18 = v7;
      v19 = 2048;
      v20 = v6;
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling lock state callback function %p refcon %p lockstate %d\n", (uint8_t *)&v15, 0x26u);

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(a1 + 40));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "UTF8String");
      v11 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(v11 + 16);
      v12 = *(_QWORD *)(v11 + 24);
      v14 = *(_DWORD *)(a1 + 40);
      v15 = 136315906;
      v16 = v10;
      v17 = 2048;
      v18 = v13;
      v19 = 2048;
      v20 = v12;
      v21 = 1024;
      v22 = v14;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished lock state callback function %p refcon %p lockstate %d\n", (uint8_t *)&v15, 0x26u);

    }
    objc_autoreleasePoolPop(v2);
  }
}

- (void)didEndClockGrandmasterChangeForClock:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *notificationsQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v15 = objc_msgSend(v5, "UTF8String");
    v16 = 2048;
    v17 = objc_msgSend(v4, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s didEndClockGrandmasterChangeForClock:0x%016llx\n", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");
    v8 = objc_msgSend(v4, "clockIdentifier");
    v9 = objc_msgSend(v4, "grandmasterIdentity");
    *(_DWORD *)buf = 136315650;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[GM Change] Client %s received GM change callback for clock 0x%016llx to GMID 0x%016llx", buf, 0x20u);

  }
  notificationsQueue = self->_notificationsQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__TSClockInterface_didEndClockGrandmasterChangeForClock___block_invoke;
  v12[3] = &unk_1E694B118;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(notificationsQueue, v12);

}

void __57__TSClockInterface_didEndClockGrandmasterChangeForClock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 64);
      v7 = *(_QWORD *)(v5 + 72);
      v8 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v9 = objc_msgSend(*(id *)(a1 + 40), "grandmasterIdentity");
      v17 = 136316162;
      v18 = v4;
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = v7;
      v23 = 2048;
      v24 = v8;
      v25 = 2048;
      v26 = v9;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling end grandmaster changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx\n", (uint8_t *)&v17, 0x34u);

    }
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 64))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), objc_msgSend(*(id *)(a1 + 40), "grandmasterIdentity"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(v12 + 64);
      v14 = *(_QWORD *)(v12 + 72);
      v15 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v16 = objc_msgSend(*(id *)(a1 + 40), "grandmasterIdentity");
      v17 = 136316162;
      v18 = v11;
      v19 = 2048;
      v20 = v13;
      v21 = 2048;
      v22 = v14;
      v23 = 2048;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished end grandmaster changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx\n", (uint8_t *)&v17, 0x34u);

    }
    objc_autoreleasePoolPop(v2);
  }
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *notificationsQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  __int16 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315906;
    v20 = objc_msgSend(v9, "UTF8String");
    v21 = 2048;
    v22 = a3;
    v23 = 1024;
    v24 = v5;
    v25 = 2048;
    v26 = objc_msgSend(v8, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s didEndClockGrandmasterChangeWithGrandmasterID:0x%016llx localPort:%hu forClock:0x%016llx\n", buf, 0x26u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    v12 = objc_msgSend(v8, "clockIdentifier");
    *(_DWORD *)buf = 136315906;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 1024;
    v24 = v5;
    v25 = 2048;
    v26 = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[GM Change] Client %s received GM change callback for clock 0x%016llx, port %hu, to GMID 0x%016llx", buf, 0x26u);

  }
  notificationsQueue = self->_notificationsQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__TSClockInterface_didEndClockGrandmasterChangeWithGrandmasterID_localPort_forClock___block_invoke;
  v15[3] = &unk_1E694B980;
  v15[4] = self;
  v16 = v8;
  v17 = a3;
  v18 = v5;
  v14 = v8;
  dispatch_async(notificationsQueue, v15);

}

void __85__TSClockInterface_didEndClockGrandmasterChangeWithGrandmasterID_localPort_forClock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 80);
      v7 = *(_QWORD *)(v5 + 88);
      v8 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(unsigned __int16 *)(a1 + 56);
      v19 = 136316418;
      v20 = v4;
      v21 = 2048;
      v22 = v6;
      v23 = 2048;
      v24 = v7;
      v25 = 2048;
      v26 = v8;
      v27 = 2048;
      v28 = v9;
      v29 = 1024;
      v30 = v10;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling end grandmaster and port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 80))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 80);
      v15 = *(_QWORD *)(v13 + 88);
      v16 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(unsigned __int16 *)(a1 + 56);
      v19 = 136316418;
      v20 = v12;
      v21 = 2048;
      v22 = v14;
      v23 = 2048;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      v27 = 2048;
      v28 = v17;
      v29 = 1024;
      v30 = v18;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished end grandmaster and port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);

    }
    objc_autoreleasePoolPop(v2);
  }
}

- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5;
  id v8;
  id v9;
  NSObject *notificationsQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  __int16 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSClockInterface description](self, "description");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315906;
    v17 = objc_msgSend(v9, "UTF8String");
    v18 = 2048;
    v19 = a3;
    v20 = 1024;
    v21 = v5;
    v22 = 2048;
    v23 = objc_msgSend(v8, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s didChangeLocalPortWithGrandmasterID:0x%016llx localPort:%hu forClock:0x%016llx\n", buf, 0x26u);

  }
  notificationsQueue = self->_notificationsQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__TSClockInterface_didChangeLocalPortWithGrandmasterID_localPort_forClock___block_invoke;
  v12[3] = &unk_1E694B980;
  v12[4] = self;
  v13 = v8;
  v14 = a3;
  v15 = v5;
  v11 = v8;
  dispatch_async(notificationsQueue, v12);

}

void __75__TSClockInterface_didChangeLocalPortWithGrandmasterID_localPort_forClock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 96);
      v7 = *(_QWORD *)(v5 + 104);
      v8 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(unsigned __int16 *)(a1 + 56);
      v19 = 136316418;
      v20 = v4;
      v21 = 2048;
      v22 = v6;
      v23 = 2048;
      v24 = v7;
      v25 = 2048;
      v26 = v8;
      v27 = 2048;
      v28 = v9;
      v29 = 1024;
      v30 = v10;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling local port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 96))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 96);
      v15 = *(_QWORD *)(v13 + 104);
      v16 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(unsigned __int16 *)(a1 + 56);
      v19 = 136316418;
      v20 = v12;
      v21 = 2048;
      v22 = v14;
      v23 = 2048;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      v27 = 2048;
      v28 = v17;
      v29 = 1024;
      v30 = v18;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished local port changed callback function %p refcon %p clock 0x%016llx grandmaster 0x%016llx localport %hu\n", (uint8_t *)&v19, 0x3Au);

    }
    objc_autoreleasePoolPop(v2);
  }
}

- (TSClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
}

@end
