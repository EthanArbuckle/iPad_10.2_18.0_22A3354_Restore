@implementation UpgradeInterfaceLock

+ (id)getSharedInstance
{
  if (getSharedInstance_onceToken != -1)
    dispatch_once(&getSharedInstance_onceToken, &__block_literal_global_3);
  return (id)getSharedInstance_gLockState;
}

void __41__UpgradeInterfaceLock_getSharedInstance__block_invoke()
{
  UpgradeInterfaceLock *v0;
  void *v1;

  v0 = objc_alloc_init(UpgradeInterfaceLock);
  v1 = (void *)getSharedInstance_gLockState;
  getSharedInstance_gLockState = (uint64_t)v0;

}

- (UpgradeInterfaceLock)init
{
  UpgradeInterfaceLock *v2;
  UpgradeInterfaceLock *v3;
  OS_xpc_object *lockConn;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  os_log_t v7;
  OS_os_log *log;
  NSMutableArray *v9;
  NSMutableArray *onNextLockReleaseCallbacks;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UpgradeInterfaceLock;
  v2 = -[UpgradeInterfaceLock init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    lockConn = v2->_lockConn;
    v2->_lockConn = 0;

    v5 = dispatch_queue_create("com.apple.security.libcryptex.interface.upgrade_lock", MEMORY[0x24BDAC9C0]);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = os_log_create("com.apple.libcryptex", "upgrade_lock");
    log = v3->_log;
    v3->_log = (OS_os_log *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    onNextLockReleaseCallbacks = v3->_onNextLockReleaseCallbacks;
    v3->_onNextLockReleaseCallbacks = v9;

  }
  return v3;
}

- (void)dealloc
{
  OS_xpc_object *lockConn;
  OS_xpc_object *v4;
  objc_super v5;

  lockConn = self->_lockConn;
  if (lockConn)
  {
    xpc_connection_cancel(lockConn);
    v4 = self->_lockConn;
    self->_lockConn = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)UpgradeInterfaceLock;
  -[UpgradeInterfaceLock dealloc](&v5, sel_dealloc);
}

- (BOOL)isLocked
{
  UpgradeInterfaceLock *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[UpgradeInterfaceLock queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__UpgradeInterfaceLock_isLocked__block_invoke;
  v5[3] = &unk_24CCF5C40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __32__UpgradeInterfaceLock_isLocked__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isLockedOnQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)releaseLock
{
  dispatch_group_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  uint64_t *v8;
  int v9;
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  v3 = dispatch_group_create();
  if (v3)
  {
    -[UpgradeInterfaceLock queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__UpgradeInterfaceLock_releaseLock__block_invoke;
    block[3] = &unk_24CCF5C68;
    block[4] = self;
    v13 = &v14;
    v5 = v3;
    v12 = v5;
    dispatch_barrier_sync(v4, block);

    v6 = dispatch_time(0, 10000000000);
    v7 = dispatch_group_wait(v5, v6);
    v8 = v15;
    if (!v7)
    {
      v9 = 0;
      *((_DWORD *)v15 + 6) = 0;
      goto LABEL_7;
    }
    v9 = 60;
  }
  else
  {
    v8 = v15;
    v9 = 12;
  }
  *((_DWORD *)v8 + 6) = v9;
LABEL_7:
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __35__UpgradeInterfaceLock_releaseLock__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _xpc_connection_s *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "lockConn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __35__UpgradeInterfaceLock_releaseLock__block_invoke_2;
    v5[3] = &unk_24CCF59D8;
    v3 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_onNextLockRelease:", v5);
    objc_msgSend(*(id *)(a1 + 32), "lockConn");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v4);

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 57;
  }
}

void __35__UpgradeInterfaceLock_releaseLock__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)acquireLock
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[UpgradeInterfaceLock queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__UpgradeInterfaceLock_acquireLock__block_invoke;
  v6[3] = &unk_24CCF5C40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__UpgradeInterfaceLock_acquireLock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_acquireLockOnQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_onNextLockRelease:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UpgradeInterfaceLock queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  -[UpgradeInterfaceLock onNextLockReleaseCallbacks](self, "onNextLockReleaseCallbacks");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x212BE6C08](v4);

  objc_msgSend(v7, "addObject:", v6);
}

- (id)_createXPCRequest
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "SUBSYSTEM", "UPGRADE_LOCK");
  return empty;
}

- (BOOL)_isLockedOnQueue
{
  UpgradeInterfaceLock *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[UpgradeInterfaceLock queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[UpgradeInterfaceLock lockConn](v2, "lockConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)_acquireLockOnQueue
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  __CFError *v6;
  void *v7;
  void *v8;
  _xpc_connection_s *connection;
  NSObject *v10;
  xpc_object_t v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  CFErrorRef v21;
  void *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  CFErrorRef Error;
  CFErrorRef v27;
  int cferr;
  void *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  NSObject *v33;
  char *v34;
  _xpc_connection_s *v35;
  CFErrorRef v36;
  __CFError *v37;
  CFErrorRef v38;
  CFErrorRef v39;
  __CFError *v40;
  _QWORD handler[5];
  CFTypeRef cf;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  -[UpgradeInterfaceLock queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v3);

  if (!-[UpgradeInterfaceLock _isLockedOnQueue](self, "_isLockedOnQueue"))
  {
    -[UpgradeInterfaceLock queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    connection = cryptex_xpc_create_connection(v10);

    if (connection)
    {
      -[UpgradeInterfaceLock _createXPCRequest](self, "_createXPCRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[UpgradeInterfaceLock log](self, "log");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[UpgradeInterfaceLock log](self, "log");
          v16 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v17 = (char *)_os_log_send_and_compose_impl();

        }
        else
        {
          *(_WORD *)buf = 0;
          v17 = (char *)_os_log_send_and_compose_impl();
        }
        Error = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 170, "com.apple.security.cryptex", 24, 0, v17);
        free(v17);
        v6 = Error;
        v8 = 0;
        goto LABEL_39;
      }
      v11 = xpc_connection_send_message_with_reply_sync(connection, v7);
      v8 = v11;
      if (v11)
      {
        if (MEMORY[0x212BE6E54](v11) == MEMORY[0x24BDACFB8])
        {
          v22 = (void *)MEMORY[0x212BE6D7C](v8);
          -[UpgradeInterfaceLock log](self, "log");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[UpgradeInterfaceLock log](self, "log");
            v24 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 136446210;
            v45 = v22;
            v25 = (char *)_os_log_send_and_compose_impl();

          }
          else
          {
            *(_DWORD *)buf = 136446210;
            v45 = v22;
            v25 = (char *)_os_log_send_and_compose_impl();
          }
          v39 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 186, "com.apple.security.cryptex", 16, 0, v25);
          free(v25);
          v6 = v39;
          free(v22);
          goto LABEL_39;
        }
        v6 = 0;
      }
      else
      {
        -[UpgradeInterfaceLock log](self, "log");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[UpgradeInterfaceLock log](self, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v20 = (char *)_os_log_send_and_compose_impl();

        }
        else
        {
          *(_WORD *)buf = 0;
          v20 = (char *)_os_log_send_and_compose_impl();
        }
        v27 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 179, "com.apple.security.cryptex", 16, 0, v20);
        free(v20);
        v6 = v27;
      }
      cferr = _xpc_dictionary_try_get_cferr(v8, "upgrade_lock_error", (CFErrorRef *)&cf);
      if ((cferr | 2) != 2)
      {
        -[UpgradeInterfaceLock log](self, "log");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          -[UpgradeInterfaceLock log](self, "log");
          v33 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = cferr;
          v34 = (char *)_os_log_send_and_compose_impl();

        }
        else
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = cferr;
          v34 = (char *)_os_log_send_and_compose_impl();
        }
        v38 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 201, "com.apple.security.cryptex", 16, 0, v34);
        free(v34);
        v37 = v38;

        goto LABEL_36;
      }
      if (cf)
      {
        -[UpgradeInterfaceLock log](self, "log");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          -[UpgradeInterfaceLock log](self, "log");
          v30 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v31 = (char *)_os_log_send_and_compose_impl();

        }
        else
        {
          *(_WORD *)buf = 0;
          v31 = (char *)_os_log_send_and_compose_impl();
        }
        v36 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 210, "com.apple.security.cryptex", 25, cf, v31);
        free(v31);
        v37 = v36;

LABEL_36:
        v6 = v37;
LABEL_39:
        xpc_connection_cancel(connection);
        goto LABEL_40;
      }
      -[UpgradeInterfaceLock setLockConn:](self, "setLockConn:", connection);

      -[UpgradeInterfaceLock lockConn](self, "lockConn");
      v35 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __43__UpgradeInterfaceLock__acquireLockOnQueue__block_invoke;
      handler[3] = &unk_24CCF5C90;
      handler[4] = self;
      xpc_connection_set_event_handler(v35, handler);

    }
    else
    {
      -[UpgradeInterfaceLock log](self, "log");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[UpgradeInterfaceLock log](self, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        *(_WORD *)buf = 0;
        v14 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        *(_WORD *)buf = 0;
        v14 = (char *)_os_log_send_and_compose_impl();
      }
      v21 = createError("-[UpgradeInterfaceLock _acquireLockOnQueue]", "upgrade_lock_interface.m", 161, "com.apple.security.cryptex", 23, 0, v14);
      free(v14);
      v6 = v21;
      v7 = 0;
      v8 = 0;
    }
    connection = 0;
    goto LABEL_40;
  }
  v4 = *__error();
  -[UpgradeInterfaceLock log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211B06000, v5, OS_LOG_TYPE_DEBUG, "Upgrade interface is already locked by the current process.", buf, 2u);
  }

  v6 = 0;
  v7 = 0;
  v8 = 0;
  connection = 0;
  *__error() = v4;
LABEL_40:
  v40 = v6;

  if (cf)
    CFRelease(cf);
  return v40;
}

uint64_t __43__UpgradeInterfaceLock__acquireLockOnQueue__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleXPCMessage:", a2);
}

- (void)_handleXPCMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  int v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x212BE6D7C](v4);
    if (MEMORY[0x212BE6E54](v5) == MEMORY[0x24BDACFB8])
    {
      v12 = *__error();
      -[UpgradeInterfaceLock log](self, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v17 = v6;
        _os_log_impl(&dword_211B06000, v13, OS_LOG_TYPE_DEBUG, "XPC error while upgrade interface was locked: %{public}s", buf, 0xCu);
      }

      *__error() = v12;
      -[UpgradeInterfaceLock queue](self, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__UpgradeInterfaceLock__handleXPCMessage___block_invoke;
      block[3] = &unk_24CCF59D8;
      block[4] = self;
      dispatch_barrier_async(v14, block);

    }
    else
    {
      v7 = *__error();
      -[UpgradeInterfaceLock log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v17 = v6;
        v18 = 1024;
        v19 = 5;
        _os_log_impl(&dword_211B06000, v8, OS_LOG_TYPE_ERROR, "Unexpected message: %{public}s: %{darwin.errno}d", buf, 0x12u);
      }

      *__error() = v7;
      -[UpgradeInterfaceLock lockConn](self, "lockConn");
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_cancel(v9);

    }
  }
  else
  {
    v10 = *__error();
    -[UpgradeInterfaceLock log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 22;
      _os_log_impl(&dword_211B06000, v11, OS_LOG_TYPE_ERROR, "Invalid input.: %{darwin.errno}d", buf, 8u);
    }

    v6 = 0;
    *__error() = v10;
  }
  free(v6);

}

uint64_t __42__UpgradeInterfaceLock__handleXPCMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "onNextLockReleaseCallbacks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "onNextLockReleaseCallbacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "setLockConn:", 0);
}

- (OS_xpc_object)lockConn
{
  return self->_lockConn;
}

- (void)setLockConn:(id)a3
{
  objc_storeStrong((id *)&self->_lockConn, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableArray)onNextLockReleaseCallbacks
{
  return self->_onNextLockReleaseCallbacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onNextLockReleaseCallbacks, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockConn, 0);
}

@end
