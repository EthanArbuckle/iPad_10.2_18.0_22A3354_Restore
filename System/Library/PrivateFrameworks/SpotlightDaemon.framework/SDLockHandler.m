@implementation SDLockHandler

+ (id)sharedLockHandler
{
  return (id)sSDLockHandler;
}

- (BOOL)unlocked
{
  unsigned int v2;
  NSObject *v3;
  const char *v4;
  BOOL v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = MKBGetDeviceLockState();
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v2 > 7)
      v4 = "unknown";
    else
      v4 = getMobileKeyBagStateCStr_sKeyBagStates[v2];
    v8[0] = 67109378;
    v8[1] = v2;
    v9 = 2080;
    v10 = v4;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "[LOCK] MKBGetDeviceLockState returned ret:%d %s", (uint8_t *)v8, 0x12u);
  }
  v6 = v2 == 3 || v2 == 0;

  return v6;
}

- (void)checkMigrationComplete
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_didMigrationComplete);
  if ((v2 & 1) == 0)
  {
    if (_getDeviceMigrationComplete())
      -[SDLockHandler handleMigrationComplete](self, "handleMigrationComplete");
  }
}

+ (void)setLockHandlerWithDelegate:(id)a3 options:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  unint64_t v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SDLockHandler_setLockHandlerWithDelegate_options___block_invoke;
  block[3] = &unk_24D0EAAC0;
  v9 = v5;
  v10 = a4;
  v6 = setLockHandlerWithDelegate_options__onceToken;
  v7 = v5;
  if (v6 != -1)
    dispatch_once(&setLockHandlerWithDelegate_options__onceToken, block);

}

void __52__SDLockHandler_setLockHandlerWithDelegate_options___block_invoke(uint64_t a1)
{
  SDLockHandler *v1;
  void *v2;

  v1 = -[SDLockHandler initWithDelegate:options:]([SDLockHandler alloc], "initWithDelegate:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)sSDLockHandler;
  sSDLockHandler = (uint64_t)v1;

}

- (void)handleFirstUnlock
{
  BOOL *p_didFirstUnlockSinceBoot;
  unsigned __int8 v3;
  NSObject *v4;
  uint8_t v5[16];

  p_didFirstUnlockSinceBoot = &self->_didFirstUnlockSinceBoot;
  do
    v3 = __ldaxr((unsigned __int8 *)p_didFirstUnlockSinceBoot);
  while (__stlxr(1u, (unsigned __int8 *)p_didFirstUnlockSinceBoot));
  if ((v3 & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "[LOCK] device unlocked since boot", v5, 2u);
    }

  }
}

- (void)handleMigrationComplete
{
  BOOL *p_didMigrationComplete;
  unsigned __int8 v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *notificationQueue;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[16];

  p_didMigrationComplete = &self->_didMigrationComplete;
  do
    v4 = __ldaxr((unsigned __int8 *)p_didMigrationComplete);
  while (__stlxr(1u, (unsigned __int8 *)p_didMigrationComplete));
  if ((v4 & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "[LOCK] Migration Complete", buf, 2u);
    }

    -[SDLockHandlerDelegate indexQueue](self->_delegate, "indexQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__SDLockHandler_handleMigrationComplete__block_invoke;
    block[3] = &unk_24D0EA758;
    block[4] = self;
    dispatch_async(v6, block);

    notificationQueue = self->_notificationQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __40__SDLockHandler_handleMigrationComplete__block_invoke_2;
    v9[3] = &unk_24D0EA758;
    v9[4] = self;
    dispatch_async(notificationQueue, v9);
  }
}

uint64_t __40__SDLockHandler_handleMigrationComplete__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "migrationCompleted");
}

uint64_t __40__SDLockHandler_handleMigrationComplete__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 44) != -1)
  {
    v1 = result;
    logForCSLogCategoryIndex();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_DWORD *)(*(_QWORD *)(v1 + 32) + 44);
      v4[0] = 67109378;
      v4[1] = v3;
      v5 = 2080;
      v6 = "com.apple.springboard.homescreenunlocked";
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "[LOCK] cancel token %d %s", (uint8_t *)v4, 0x12u);
    }

    result = notify_cancel(*(_DWORD *)(*(_QWORD *)(v1 + 32) + 44));
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 44) = -1;
  }
  return result;
}

- (void)handleFirstUnlockHomeScreen
{
  BOOL *p_didFirstUnlockInHomeScreen;
  unsigned __int8 v4;
  NSObject *v5;
  uint8_t v6[16];

  p_didFirstUnlockInHomeScreen = &self->_didFirstUnlockInHomeScreen;
  do
    v4 = __ldaxr((unsigned __int8 *)p_didFirstUnlockInHomeScreen);
  while (__stlxr(1u, (unsigned __int8 *)p_didFirstUnlockInHomeScreen));
  if ((v4 & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "[LOCK] Home Screen first unlock", v6, 2u);
    }

    -[SDLockHandler handleMigrationComplete](self, "handleMigrationComplete");
  }
}

- (void)handleFirstUnlockInSpringBoard
{
  unsigned __int8 v3;
  BOOL *p_didFirstUnlockInSpringBoard;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = atomic_load((unsigned __int8 *)&self->_didMigrationComplete);
  if ((v3 & 1) == 0)
  {
    if (!_getDeviceMigrationComplete())
      return;
    -[SDLockHandler handleMigrationComplete](self, "handleMigrationComplete");
  }
  p_didFirstUnlockInSpringBoard = &self->_didFirstUnlockInSpringBoard;
  do
    v5 = __ldaxr((unsigned __int8 *)p_didFirstUnlockInSpringBoard);
  while (__stlxr(1u, (unsigned __int8 *)p_didFirstUnlockInSpringBoard));
  if ((v5 & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "[LOCK] SpringBoard first unlock", buf, 2u);
    }

    -[SDLockHandlerDelegate indexQueue](self->_delegate, "indexQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke;
    block[3] = &unk_24D0EA758;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

void __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstUnlockSBCompleted");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke_2;
  block[3] = &unk_24D0EA758;
  block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 48) != -1)
  {
    v1 = result;
    logForCSLogCategoryIndex();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_DWORD *)(*(_QWORD *)(v1 + 32) + 48);
      v4 = *MEMORY[0x24BEB0ED0];
      v5[0] = 67109378;
      v5[1] = v3;
      v6 = 2080;
      v7 = v4;
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "[LOCK] cancel token %d %s", (uint8_t *)v5, 0x12u);
    }

    result = notify_cancel(*(_DWORD *)(*(_QWORD *)(v1 + 32) + 48));
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 48) = -1;
  }
  return result;
}

- (SDLockHandler)initWithDelegate:(id)a3 options:(unint64_t)a4
{
  id v7;
  SDLockHandler *v8;
  SDLockHandler *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *notificationQueue;
  char v14;
  uint64_t v15;
  const char **v16;
  const char *v17;
  int v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  SDLockHandler *v22;
  uint32_t v23;
  NSObject *v24;
  NSObject *v25;
  int notifyTokenSBLockState;
  NSObject *v27;
  uint32_t v28;
  NSObject *v29;
  NSObject *v30;
  int notifyTokenSBHomescreenUnlocked;
  NSObject *v32;
  SDLockHandler *v33;
  uint32_t v34;
  NSObject *v35;
  NSObject *v36;
  int notifyTokenKeybagLockStateNotifyToken;
  SDLockHandler *v38;
  uint64_t v39;
  NSObject *v41;
  _QWORD v42[4];
  SDLockHandler *v43;
  _QWORD v44[4];
  SDLockHandler *v45;
  _QWORD handler[4];
  SDLockHandler *v47;
  objc_super v48;
  int check;
  uint64_t state64;
  int out_token;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SDLockHandler;
  v8 = -[SDLockHandler init](&v48, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    *(_QWORD *)&v9->_notifyTokenKeybagLockStateNotifyToken = -1;
    v9->_options = a4;
    v9->_notifyTokenSBLockState = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.spotlight.locknotification", v11);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v12;

    if (MKBDeviceUnlockedSinceBoot() || MKBGetDeviceLockState() == 3)
    {
      -[SDLockHandler handleFirstUnlock](v9, "handleFirstUnlock");
      v14 = 0;
    }
    else
    {
      v14 = 1;
    }
    v15 = MEMORY[0x24BDAC760];
    v16 = (const char **)MEMORY[0x24BEB0ED0];
    if ((v9->_options & 5) != 0 || (_getDeviceMigrationComplete() & 1) != 0)
    {
      -[SDLockHandler handleMigrationComplete](v9, "handleMigrationComplete");
      v17 = *v16;
      if ((v14 & 1) != 0 || (out_token = -1, state64 = -1, notify_register_check(v17, &out_token)))
      {
        v18 = 0;
      }
      else
      {
        check = 0;
        if (!notify_check(out_token, &check) && check && !notify_get_state(out_token, &state64))
        {
          logForCSLogCategoryIndex();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109634;
            v53 = out_token;
            v54 = 2080;
            v55 = v17;
            v56 = 2048;
            v57 = state64;
            _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_DEFAULT, "[LOCK] check %d %s %lu", buf, 0x1Cu);
          }

        }
        notify_cancel(out_token);
        v18 = 0;
        v20 = 0;
        if (!state64)
        {
LABEL_32:
          v32 = v9->_notificationQueue;
          v42[0] = v15;
          v42[1] = 3221225472;
          v42[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_8;
          v42[3] = &unk_24D0EAAE8;
          v33 = v9;
          v43 = v33;
          v34 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v9->_notifyTokenKeybagLockStateNotifyToken, v32, v42);
          logForCSLogCategoryIndex();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v34)
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[SDLockHandler initWithDelegate:options:].cold.2();
          }
          else if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            notifyTokenKeybagLockStateNotifyToken = v9->_notifyTokenKeybagLockStateNotifyToken;
            *(_DWORD *)buf = 67109378;
            v53 = notifyTokenKeybagLockStateNotifyToken;
            v54 = 2080;
            v55 = "com.apple.mobile.keybagd.lock_status";
            _os_log_impl(&dword_213CF1000, v36, OS_LOG_TYPE_DEFAULT, "[LOCK] token %d %s", buf, 0x12u);
          }

          v38 = v33;
          v39 = AKSEventsRegister();
          v38->_aksEvent = (_AKSEvent *)v39;
          if (v39)
          {
            if ((v20 & 1) != 0)
            {
LABEL_40:

              goto LABEL_41;
            }
          }
          else
          {
            logForCSLogCategoryIndex();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              -[SDLockHandler initWithDelegate:options:].cold.1(v41);

            if ((v20 & 1) != 0)
              goto LABEL_40;
          }
          -[SDLockHandler handleFirstUnlockInSpringBoard](v38, "handleFirstUnlockInSpringBoard");
          goto LABEL_40;
        }
      }
    }
    else
    {
      v17 = *v16;
      v18 = 1;
    }
    v21 = v9->_notificationQueue;
    handler[0] = v15;
    handler[1] = 3221225472;
    handler[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke;
    handler[3] = &unk_24D0EAAE8;
    v22 = v9;
    v47 = v22;
    v23 = notify_register_dispatch(v17, &v9->_notifyTokenSBLockState, v21, handler);
    logForCSLogCategoryIndex();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SDLockHandler initWithDelegate:options:].cold.4((uint64_t)v17, v23, v25);
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      notifyTokenSBLockState = v9->_notifyTokenSBLockState;
      *(_DWORD *)buf = 67109378;
      v53 = notifyTokenSBLockState;
      v54 = 2080;
      v55 = v17;
      _os_log_impl(&dword_213CF1000, v25, OS_LOG_TYPE_DEFAULT, "[LOCK] token %d %s", buf, 0x12u);
    }

    if (v18)
    {
      v27 = v9->_notificationQueue;
      v44[0] = v15;
      v44[1] = 3221225472;
      v44[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_6;
      v44[3] = &unk_24D0EAAE8;
      v45 = v22;
      v28 = notify_register_dispatch("com.apple.springboard.homescreenunlocked", &v9->_notifyTokenSBHomescreenUnlocked, v27, v44);
      logForCSLogCategoryIndex();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[SDLockHandler initWithDelegate:options:].cold.3();
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        notifyTokenSBHomescreenUnlocked = v9->_notifyTokenSBHomescreenUnlocked;
        *(_DWORD *)buf = 67109378;
        v53 = notifyTokenSBHomescreenUnlocked;
        v54 = 2080;
        v55 = "com.apple.springboard.homescreenunlocked";
        _os_log_impl(&dword_213CF1000, v30, OS_LOG_TYPE_DEFAULT, "[LOCK] token %d %s", buf, 0x12u);
      }

    }
    v20 = 1;
    goto LABEL_32;
  }
LABEL_41:

  return v9;
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke(uint64_t a1, int token)
{
  uint64_t state;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t state64;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  state = notify_get_state(token, &state64);
  if ((_DWORD)state)
  {
    v4 = state;
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __42__SDLockHandler_initWithDelegate_options___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  else
  {
    v12 = state64;
    logForCSLogCategoryIndex();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "NO";
      if (!v12)
        v14 = "YES";
      *(_DWORD *)buf = 136315138;
      v17 = v14;
      _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_DEFAULT, "[LOCK] SpringBoard unlocked: %s", buf, 0xCu);
    }

    if (!v12)
      objc_msgSend(*(id *)(a1 + 32), "handleFirstUnlockInSpringBoard");
  }
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_6(uint64_t a1, int token)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t state64;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  if (notify_get_state(token, &state64))
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__SDLockHandler_initWithDelegate_options___block_invoke_6_cold_1();

  }
  else
  {
    v4 = state64;
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      if (v4 == 1)
        v6 = "YES";
      *(_DWORD *)buf = 136315138;
      v9 = v6;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "[LOCK] Home Screen: %s", buf, 0xCu);
    }

    if (v4 == 1)
      objc_msgSend(*(id *)(a1 + 32), "handleFirstUnlockHomeScreen");
  }
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_8(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  const char *v5;
  char v7;
  qos_class_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unsigned int v16;
  _QWORD block[4];
  id v18;
  char v19;
  uint8_t buf[4];
  unsigned int v21;
  __int16 v22;
  const char *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v24 = CFSTR("ExtendedDeviceLockState");
  v25[0] = *MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MKBGetDeviceLockState();
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 7)
      v5 = "unknown";
    else
      v5 = getMobileKeyBagStateCStr_sKeyBagStates[v3];
    *(_DWORD *)buf = 67109378;
    v21 = v3;
    v22 = 2080;
    v23 = v5;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "[LOCK] Device state changed: %d %s", buf, 0x12u);
  }

  if (v3 > 7 || ((1 << v3) & 0xC9) == 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "handleFirstUnlock");
    v7 = 1;
  }
  v8 = qos_class_self();
  dispatch_get_global_queue(v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_11;
  block[3] = &unk_24D0EAB10;
  v18 = *(id *)(a1 + 32);
  v19 = v7;
  dispatch_async(v9, block);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_2;
  v13[3] = &unk_24D0EAB38;
  v14 = v2;
  v16 = v3;
  v15 = *(id *)(a1 + 32);
  v12 = v2;
  dispatch_async(v11, v13);

}

uint64_t __42__SDLockHandler_initWithDelegate_options___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deviceStateWillChange:", *(unsigned __int8 *)(a1 + 40));
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_2(uint64_t a1)
{
  unsigned int v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const char *v12;
  int v13;
  unsigned int v14;
  __int16 v15;
  _BYTE v16[14];
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = MKBGetDeviceLockState();
  v3 = *(_DWORD *)(a1 + 48);
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (!v5)
      goto LABEL_16;
    if (v2 > 7)
      v6 = "unknown";
    else
      v6 = getMobileKeyBagStateCStr_sKeyBagStates[v2];
    v13 = 67109378;
    v14 = v2;
    v15 = 2080;
    *(_QWORD *)v16 = v6;
    v9 = "[LOCK] Device state %d %s";
    v10 = v4;
    v11 = 18;
  }
  else
  {
    if (!v5)
      goto LABEL_16;
    v7 = *(unsigned int *)(a1 + 48);
    if (v7 > 7)
      v8 = "unknown";
    else
      v8 = getMobileKeyBagStateCStr_sKeyBagStates[v7];
    if (v2 > 7)
      v12 = "unknown";
    else
      v12 = getMobileKeyBagStateCStr_sKeyBagStates[v2];
    v13 = 67109890;
    v14 = v7;
    v15 = 1024;
    *(_DWORD *)v16 = v2;
    *(_WORD *)&v16[4] = 2080;
    *(_QWORD *)&v16[6] = v8;
    v17 = 2080;
    v18 = v12;
    v9 = "[LOCK] Device state:(%d/%d) (%s/%s)";
    v10 = v4;
    v11 = 34;
  }
  _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
LABEL_16:

  if (v2 <= 7)
  {
    if (((1 << v2) & 0xC9) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "unlocked");
    }
    else if (v2 == 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "locked");
    }
    else if (v2 == 2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "locking");
    }
  }
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_12(uint64_t a1, int a2, CFDictionaryRef theDict)
{
  void *v3;
  void *v4;
  CFTypeID v7;
  NSObject *v8;
  CFTypeID v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[8];
  void *value[7];

  if (a2 == 1)
  {
    value[5] = v3;
    value[6] = v4;
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x24BE07948], (const void **)value))
    {
      v7 = CFGetTypeID(value[0]);
      if (v7 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          logForCSLogCategoryIndex();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Received Cx expiring notification", buf, 2u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lockingCx");
        }
      }
    }
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x24BE07940], (const void **)value))
    {
      v9 = CFGetTypeID(value[0]);
      if (v9 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lockedCx");
          logForCSLogCategoryIndex();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, "Received Cx expired notification", v11, 2u);
          }

        }
      }
    }
  }
}

- (void)start
{
  BOOL *p_didStart;
  unsigned __int8 v4;
  NSObject *v5;
  uint8_t v6[16];

  p_didStart = &self->_didStart;
  do
    v4 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  if ((v4 & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "[LOCK] handler started", v6, 2u);
    }

    dispatch_activate((dispatch_object_t)self->_notificationQueue);
  }
}

- (BOOL)unlockedSinceBoot
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_didFirstUnlockSinceBoot);
  return v2 & 1;
}

- (BOOL)migrationComplete
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_didMigrationComplete);
  return v2 & 1;
}

- (BOOL)firstUnlockedInSB
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_didFirstUnlockInSpringBoard);
  return v2 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(os_log_t)log options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213CF1000, log, OS_LOG_TYPE_ERROR, "Failed register: AKSEventsRegister", v1, 2u);
}

- (void)initWithDelegate:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_213CF1000, v0, v1, "Error %u setting up notification handler for %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDelegate:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_213CF1000, v0, v1, "Error %u setting up notification handler for %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDelegate:(os_log_t)log options:.cold.4(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl(&dword_213CF1000, log, OS_LOG_TYPE_ERROR, "Error %u setting up notification handler for %s", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_213CF1000, a2, a3, "Error %u getting state for %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_213CF1000, v0, v1, "Error %u getting state for %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
