@implementation _PASDeviceState

+ (BOOL)isUnlocked
{
  unint64_t v2;
  int v3;

  v2 = atomic_load((unint64_t *)&cb);
  v3 = (*(uint64_t (**)(id, SEL))(v2 + 16))(a1, a2);
  return !v3 || v3 == 3;
}

+ (void)unregisterForAKSEventsNotifications:(void *)a3
{
  unint64_t v3;

  if (a3)
  {
    v3 = atomic_load((unint64_t *)&cb);
    (*(void (**)(void *))(v3 + 56))(a3);
  }
}

+ (void)registerForAKSEventsNotifications:(id)a3
{
  unint64_t v3;
  uint64_t (*v4)(void *, id);
  id v5;
  void *v6;
  void *v7;

  v3 = atomic_load((unint64_t *)&cb);
  v4 = *(uint64_t (**)(void *, id))(v3 + 48);
  v5 = a3;
  getLockStateChangedQueue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v4(v6, v5);

  return v7;
}

+ (void)runBlockWhenDeviceIsClassCUnlockedWithQoS:(unsigned int)a3 block:(id)a4
{
  void (**v5)(void);
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (**v16)(void);

  v5 = (void (**)(void))a4;
  if (v5)
  {
    v16 = v5;
    v6 = atomic_load((unint64_t *)&cb);
    v7 = (*(uint64_t (**)(void))(v6 + 8))();
    if ((_DWORD)v7)
      v7 = +[_PASDeviceState isClassCLocked](_PASDeviceState, "isClassCLocked");
    v8 = atomic_load((unint64_t *)&cb);
    if ((*(unsigned int (**)(uint64_t))(v8 + 8))(v7)
      && !+[_PASDeviceState isClassCLocked](_PASDeviceState, "isClassCLocked"))
    {
      v15 = (void *)MEMORY[0x1A1AFDC98]();
      v16[2]();
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      pthread_mutex_lock(&cUnlockMutex);
      v9 = atomic_load((unint64_t *)&cb);
      (*(void (**)(void *))(v9 + 64))(&__block_literal_global_2887);
      if (!cUnlockBlocks)
      {
        v10 = objc_opt_new();
        v11 = (void *)cUnlockBlocks;
        cUnlockBlocks = v10;

      }
      v12 = objc_opt_new();
      v13 = MEMORY[0x1A1AFDE78](v16);
      v14 = *(void **)(v12 + 8);
      *(_QWORD *)(v12 + 8) = v13;

      *(_DWORD *)(v12 + 16) = a3;
      objc_msgSend((id)cUnlockBlocks, "addObject:", v12);
      pthread_mutex_unlock(&cUnlockMutex);
      +[_PASDeviceState isClassCLocked](_PASDeviceState, "isClassCLocked");

    }
    v5 = v16;
  }

}

+ (BOOL)isClassCLocked
{
  uint64_t (**v2)(id, SEL);
  int v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  int v26;
  dispatch_queue_t v27;
  NSObject *v28;
  NSObject *v29;
  char v31;
  dispatch_queue_t v32;
  dispatch_queue_t v33;
  dispatch_queue_t v34;
  dispatch_queue_t v35;
  dispatch_queue_t v36;
  id obj;
  _QWORD block[5];
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t (**)(id, SEL))atomic_load((unint64_t *)&cb);
  v3 = (*v2)(a1, a2);
  if (v3)
  {
    v31 = v3;
    pthread_mutex_lock(&cUnlockMutex);
    v4 = (id)cUnlockBlocks;
    v5 = (void *)cUnlockBlocks;
    cUnlockBlocks = 0;

    pthread_mutex_unlock(&cUnlockMutex);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.user_interactive", v6, v7);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.user_initiated", v8, v9);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.default", v10, v11);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.utility", v13, v14);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(9, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.background", v15, v16);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.unspecified", v17, v18);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v4;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (!v19)
      goto LABEL_24;
    v20 = v19;
    v21 = *(_QWORD *)v41;
    v22 = MEMORY[0x1E0C809B0];
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v25 = v12;
        v26 = *(_DWORD *)(v24 + 16);
        if (v26 > 20)
        {
          switch(v26)
          {
            case 21:
              goto LABEL_22;
            case 25:
              v27 = v35;
              goto LABEL_21;
            case 33:
              v27 = v36;
              goto LABEL_21;
          }
        }
        else if (v26)
        {
          if (v26 == 9)
          {
            v27 = v33;
            goto LABEL_21;
          }
          if (v26 == 17)
          {
            v27 = v34;
LABEL_21:
            v29 = v27;

            v25 = v29;
            goto LABEL_22;
          }
        }
        else
        {
          v28 = v32;

          v25 = v28;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Using default QOS for unlock block", buf, 2u);
        }
LABEL_22:
        block[0] = v22;
        block[1] = 3221225472;
        block[2] = __runUnlockBlocks_block_invoke;
        block[3] = &unk_1E44311E8;
        block[4] = v24;
        dispatch_async(v25, block);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v20)
      {
LABEL_24:

        LOBYTE(v3) = v31;
        return v3 ^ 1;
      }
    }
  }
  return v3 ^ 1;
}

+ (void)runBlockWhenDeviceIsClassCUnlocked:(id)a3
{
  objc_msgSend(a1, "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", 17, a3);
}

+ (void)setSystemCallbacks:(const _PASDeviceStateSystemCallbacks *)a3
{
  atomic_store((unint64_t)a3, (unint64_t *)&cb);
}

+ (void)setDefaultSystemCallbacks
{
  atomic_store((unint64_t)kDefaultSystemCallbacks, (unint64_t *)&cb);
}

+ (int)lockState
{
  unint64_t v2;

  v2 = atomic_load((unint64_t *)&cb);
  return (*(uint64_t (**)(void))(v2 + 16))();
}

+ (id)registerForLockStateChangeNotifications:(id)a3
{
  unint64_t v3;
  void (*v4)(void *, id);
  id v5;
  void *v6;
  void *v7;

  v3 = atomic_load((unint64_t *)&cb);
  v4 = *(void (**)(void *, id))(v3 + 32);
  v5 = a3;
  getLockStateChangedQueue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)unregisterForLockStateChangeNotifications:(id)a3
{
  unint64_t v3;

  if (a3)
  {
    v3 = atomic_load((unint64_t *)&cb);
    (*(void (**)(id))(v3 + 40))(a3);
  }
}

+ (BOOL)isDeviceFormattedForProtection
{
  unint64_t v2;

  v2 = atomic_load((unint64_t *)&cb);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

+ (id)currentOsBuild
{
  unint64_t v2;

  v2 = atomic_load((unint64_t *)&cb);
  return (id)(*(uint64_t (**)(void))(v2 + 24))();
}

@end
