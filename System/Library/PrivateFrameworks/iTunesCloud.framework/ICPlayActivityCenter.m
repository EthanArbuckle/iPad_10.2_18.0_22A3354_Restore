@implementation ICPlayActivityCenter

- (ICPlayActivityCenter)init
{
  ICPlayActivityCenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICPlayActivityCenter;
  v2 = -[ICPlayActivityCenter init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.iTunesCloud.ICPlayActivityCenter.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_daemonPlayActivityControllerConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICPlayActivityCenter;
  -[ICPlayActivityCenter dealloc](&v3, sel_dealloc);
}

- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (void)recordPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E4390B20;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(serialQueue, v13);

}

- (id)_daemonPlayActivityControllerConnection
{
  NSXPCConnection *daemonPlayActivityControllerConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  daemonPlayActivityControllerConnection = self->_daemonPlayActivityControllerConnection;
  if (!daemonPlayActivityControllerConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloudd.playactivity"), 0);
    v5 = self->_daemonPlayActivityControllerConnection;
    self->_daemonPlayActivityControllerConnection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDA28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_insertPlayActivityEvents_shouldFlush_withCompletionHandler_, 0, 0);

    -[NSXPCConnection setRemoteObjectInterface:](self->_daemonPlayActivityControllerConnection, "setRemoteObjectInterface:", v6);
    -[NSXPCConnection setInterruptionHandler:](self->_daemonPlayActivityControllerConnection, "setInterruptionHandler:", &__block_literal_global_65);
    -[NSXPCConnection setInvalidationHandler:](self->_daemonPlayActivityControllerConnection, "setInvalidationHandler:", &__block_literal_global_67);
    -[NSXPCConnection resume](self->_daemonPlayActivityControllerConnection, "resume");

    daemonPlayActivityControllerConnection = self->_daemonPlayActivityControllerConnection;
  }
  return daemonPlayActivityControllerConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_daemonPlayActivityControllerConnection, 0);
}

void __63__ICPlayActivityCenter__daemonPlayActivityControllerConnection__block_invoke_66()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to daemon play activity controller invalidated.", v1, 2u);
  }

}

void __63__ICPlayActivityCenter__daemonPlayActivityControllerConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "Connection to daemon play activity controller interrupted.", v1, 2u);
  }

}

void __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_daemonPlayActivityControllerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E438EF88;
  v4 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2_10;
  v8[3] = &unk_1E438EF88;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "insertPlayActivityEvents:shouldFlush:withCompletionHandler:", v9, v6, v8);

}

void __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138543874;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    v16 = 2048;
    v17 = v6;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Error %{public}@ recording %lu play activity events", buf, 0x20u);
  }

  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_9;
    v9[3] = &unk_1E4390EF8;
    v11 = v7;
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

void __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138543874;
    v14 = v6;
    v15 = 2048;
    v16 = v7;
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished recording %lu play activity events with error %{public}@", buf, 0x20u);

  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_11;
    v10[3] = &unk_1E4390EF8;
    v12 = v8;
    v11 = v3;
    dispatch_async(v9, v10);

  }
}

uint64_t __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_daemonPlayActivityControllerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E43915E8;
  v4 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2_7;
  v7[3] = &unk_1E43915E8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "flushPendingPlayActivityEventsWithCompletionHandler:", v7);

}

void __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@  Error %{public}@ flushing play activity events", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_5;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

void __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@  Finished flushing play activity events with error %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_8;
    v8[3] = &unk_1E4390EF8;
    v10 = v6;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (ICPlayActivityCenter)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_20120);
  return (ICPlayActivityCenter *)(id)_sharedInstance;
}

void __30__ICPlayActivityCenter_shared__block_invoke()
{
  ICPlayActivityCenter *v0;
  void *v1;

  v0 = objc_alloc_init(ICPlayActivityCenter);
  v1 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v0;

}

@end
