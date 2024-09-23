@implementation HDSPNotificationListener

- (HDSPNotificationListener)initWithEnvironment:(id)a3
{
  id v4;
  HDSPNotificationListener *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  HKSPObserverSet *observers;
  NSMutableDictionary *v13;
  NSMutableDictionary *launchNotificationRegistrations;
  HDSPNotificationListener *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  HDSPNotificationListener *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPNotificationListener;
  v5 = -[HDSPNotificationListener init](&v17, sel_init);
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2048;
      v21 = v5;
      v8 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_environment, v4);
    v9 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v4, "defaultCallbackScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithCallbackScheduler:", v10);
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    launchNotificationRegistrations = v5->_launchNotificationRegistrations;
    v5->_launchNotificationRegistrations = v13;

    v5->_launchNotificationRegistrationLock._os_unfair_lock_opaque = 0;
    v15 = v5;
  }

  return v5;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_launchNotificationRegistrationLock;
  void (**v4)(_QWORD);

  p_launchNotificationRegistrationLock = &self->_launchNotificationRegistrationLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_launchNotificationRegistrationLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_launchNotificationRegistrationLock);
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[HKSPObserverSet addObserver:](self->_observers, "addObserver:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:");
}

- (void)registerForLaunchNotificationWithName:(const char *)a3 key:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *);
  void *v12;
  HDSPNotificationListener *v13;
  id v14;
  uint64_t *v15;
  const char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __70__HDSPNotificationListener_registerForLaunchNotificationWithName_key___block_invoke;
  v12 = &unk_24D4E63F0;
  v16 = a3;
  v13 = self;
  v7 = v6;
  v14 = v7;
  v15 = &v17;
  -[HDSPNotificationListener _withLock:](self, "_withLock:", &v9);
  if (*((_BYTE *)v18 + 24))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "Notification", a3);
    objc_msgSend(CFSTR("com.apple.notifyd.matching"), "UTF8String", v9, v10, v11, v12, v13);
    xpc_set_event();

  }
  _Block_object_dispose(&v17, 8);

}

void __70__HDSPNotificationListener_registerForLaunchNotificationWithName_key___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a1[7]);
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v2, v3);
  }
  objc_msgSend(v2, "addObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "count") == 1;

}

- (void)unregisterForLaunchNotificationWithName:(const char *)a3 key:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *);
  void *v11;
  HDSPNotificationListener *v12;
  id v13;
  uint64_t *v14;
  const char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __72__HDSPNotificationListener_unregisterForLaunchNotificationWithName_key___block_invoke;
  v11 = &unk_24D4E63F0;
  v15 = a3;
  v12 = self;
  v7 = v6;
  v13 = v7;
  v14 = &v16;
  -[HDSPNotificationListener _withLock:](self, "_withLock:", &v8);
  if (*((_BYTE *)v17 + 24))
  {
    objc_msgSend(CFSTR("com.apple.notifyd.matching"), "UTF8String", v8, v9, v10, v11, v12);
    xpc_set_event();
  }

  _Block_object_dispose(&v16, 8);
}

void __72__HDSPNotificationListener_unregisterForLaunchNotificationWithName_key___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a1[7]);
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "count") == 0;

}

- (void)startListening
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startListening", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPNotificationListener _registerForStream:](self, "_registerForStream:", CFSTR("com.apple.distnoted.matching"));
  -[HDSPNotificationListener _registerForStream:](self, "_registerForStream:", CFSTR("com.apple.notifyd.matching"));
  -[HDSPNotificationListener _registerForStream:](self, "_registerForStream:", CFSTR("com.apple.alarm"));
}

- (void)_registerForStream:(id)a3
{
  const char *v4;
  _QWORD handler[5];

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __47__HDSPNotificationListener__registerForStream___block_invoke;
  handler[3] = &unk_24D4E6418;
  handler[4] = self;
  xpc_set_event_stream_handler(v4, MEMORY[0x24BDAC9B8], handler);
}

void __47__HDSPNotificationListener__registerForStream___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v5 = v13;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received notification %{public}@, taking assertion", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "assertionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "takeAssertionWithIdentifier:type:", v3, 2);

  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__HDSPNotificationListener__registerForStream___block_invoke_194;
  v10[3] = &unk_24D4E3680;
  v10[4] = v8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "_handleNotificationWithName:completion:", v9, v10);

}

void __47__HDSPNotificationListener__registerForStream___block_invoke_194(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "assertionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseAssertionWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)_handleNotificationWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke;
  v11[3] = &unk_24D4E6490;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(WeakRetained, "performWhenEnvironmentIsReady:", v11);

}

void __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_2;
  v10[3] = &unk_24D4E6440;
  v10[4] = v3;
  v11 = v4;
  objc_msgSend(v5, "enumerateObserversWithFutureBlock:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_3;
  v8[3] = &unk_24D4E6468;
  v9 = *(id *)(a1 + 48);
  v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v8);

}

uint64_t __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationListener:didReceiveNotificationWithName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSMutableDictionary)launchNotificationRegistrations
{
  return self->_launchNotificationRegistrations;
}

- (os_unfair_lock_s)launchNotificationRegistrationLock
{
  return self->_launchNotificationRegistrationLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchNotificationRegistrations, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
