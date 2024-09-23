@implementation TVRMSSessionManager

- (TVRMSSessionManager)init
{
  TVRMSSessionManager *v2;
  uint64_t v3;
  NSMutableDictionary *sessions;
  dispatch_queue_t v5;
  OS_dispatch_queue *sessionManagerQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRMSSessionManager;
  v2 = -[TVRMSSessionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("com.apple.rms.sessionqueue", 0);
    sessionManagerQueue = v2->_sessionManagerQueue;
    v2->_sessionManagerQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (id)sessionWithIdentifier:(int)a3
{
  NSMutableDictionary *sessions;
  void *v4;
  void *v5;
  void *v6;

  sessions = self->_sessions;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)identifierForSession:(id)a3
{
  id v4;
  NSMutableDictionary *sessions;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  sessions = self->_sessions;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TVRMSSessionManager_identifierForSession___block_invoke;
  v8[3] = &unk_24DCD7AE0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v8);
  LODWORD(sessions) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)sessions;
}

void __44__TVRMSSessionManager_identifierForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "intValue");

}

- (void)beginSession:(id)a3 timeout:(int)a4 shouldTakePowerAssertion:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *sessionManagerQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  sessionManagerQueue = self->_sessionManagerQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__TVRMSSessionManager_beginSession_timeout_shouldTakePowerAssertion_completionHandler___block_invoke;
  v15[3] = &unk_24DCD7B08;
  v18 = a4;
  v15[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(sessionManagerQueue, v15);

}

void __87__TVRMSSessionManager_beginSession_timeout_shouldTakePowerAssertion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  TVRMSPowerAssertion *v4;
  objc_class *v5;
  void *v6;
  TVRMSPowerAssertion *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_uniqueSessionIdentifier");
  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setRefreshCount:", 0);
  objc_msgSend(v10, "setTimeout:", *(unsigned int *)(a1 + 56));
  objc_msgSend(v10, "setSession:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_opt_new();
  objc_msgSend(v10, "setRunAssertion:", v3);

  if (*(_BYTE *)(a1 + 60))
  {
    v4 = [TVRMSPowerAssertion alloc];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TVRMSPowerAssertion initWithName:](v4, "initWithName:", v6);

    objc_msgSend(v10, "setPowerAssertion:", v7);
  }
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  objc_msgSend(*(id *)(a1 + 32), "_updatePersistedSessionIdentifiers");
  objc_msgSend(*(id *)(a1 + 32), "_scheduleSessionExpirationWithIdentifier:timeout:", v2, *(unsigned int *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)endSessionWithIdentifier:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *sessionManagerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  sessionManagerQueue = self->_sessionManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__TVRMSSessionManager_endSessionWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24DCD7B30;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(sessionManagerQueue, block);

}

void __66__TVRMSSessionManager_endSessionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _TVRCRMSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (id)objc_opt_class();
      v7 = v13;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Ending session: %@", (uint8_t *)&v12, 0xCu);

    }
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    objc_msgSend(*(id *)(a1 + 32), "_updatePersistedSessionIdentifiers");
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v4, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

- (void)refreshSessionWithIdentifier:(int)a3
{
  NSObject *sessionManagerQueue;
  _QWORD v4[5];
  int v5;

  sessionManagerQueue = self->_sessionManagerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TVRMSSessionManager_refreshSessionWithIdentifier___block_invoke;
  v4[3] = &unk_24DCD7B58;
  v4[4] = self;
  v5 = a3;
  dispatch_async(sessionManagerQueue, v4);
}

void __52__TVRMSSessionManager_refreshSessionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing session: %@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v4, "setRefreshCount:", objc_msgSend(v4, "refreshCount") + 1);
  objc_msgSend(v4, "powerAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "refresh");
  objc_msgSend(*(id *)(a1 + 32), "_scheduleSessionExpirationWithIdentifier:timeout:", *(unsigned int *)(a1 + 40), objc_msgSend(v4, "timeout"));

}

- (id)persistedSessionIdentifiers
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("SessionIdentifiers"), CFSTR("com.apple.TVRemoteMediaServices"));
}

- (void)_scheduleSessionExpirationWithIdentifier:(int)a3 timeout:(int)a4
{
  dispatch_time_t v7;
  NSObject *sessionManagerQueue;
  _QWORD block[4];
  id v10;
  int v11;
  id location;

  objc_initWeak(&location, self);
  v7 = dispatch_time(0, 1000000000 * a4);
  sessionManagerQueue = self->_sessionManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__TVRMSSessionManager__scheduleSessionExpirationWithIdentifier_timeout___block_invoke;
  block[3] = &unk_24DCD7B80;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  dispatch_after(v7, sessionManagerQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __72__TVRMSSessionManager__scheduleSessionExpirationWithIdentifier_timeout___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (objc_msgSend(v6, "refreshCount"))
      {
        objc_msgSend(v6, "setRefreshCount:", objc_msgSend(v6, "refreshCount") - 1);
      }
      else
      {
        _TVRCRMSLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "session");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v10;
          _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Session expired: %@", (uint8_t *)&v14, 0xCu);

        }
        v11 = (void *)*((_QWORD *)v3 + 1);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

        v13 = objc_loadWeakRetained((id *)v3 + 3);
        objc_msgSend(v13, "sessionManager:sessionDidTimeout:", v3, *(unsigned int *)(a1 + 40));

        objc_msgSend(v3, "_updatePersistedSessionIdentifiers");
      }
    }

  }
}

- (int)_uniqueSessionIdentifier
{
  uint64_t v3;
  int v4;
  NSMutableDictionary *sessions;
  void *v6;
  void *v7;

  do
  {
    do
      v3 = arc4random();
    while (!(_DWORD)v3);
    v4 = v3;
    sessions = self->_sessions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sessions, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v7);
  return v4;
}

- (void)_updatePersistedSessionIdentifiers
{
  id v2;

  -[NSMutableDictionary allKeys](self->_sessions, "allKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("SessionIdentifiers"), v2, CFSTR("com.apple.TVRemoteMediaServices"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));

}

- (TVRMSSessionManagerDelegate)delegate
{
  return (TVRMSSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionManagerQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
