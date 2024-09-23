@implementation SASPresentationServer

+ (id)serverForConnection:(id)a3
{
  id v4;
  SASPresentationServer *v5;
  SASPresentationServer *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  SASPresentationServer *v15;
  id v16;

  v4 = a3;
  objc_msgSend((id)serversByConnection, "objectForKey:", v4);
  v5 = (SASPresentationServer *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc_init(SASPresentationServer);
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    v7 = (void *)serversByConnection;
    if (!serversByConnection)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 4);
      v9 = (void *)serversByConnection;
      serversByConnection = v8;

      v7 = (void *)serversByConnection;
    }
    objc_msgSend(v7, "setObject:forKey:", v6, v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __45__SASPresentationServer_serverForConnection___block_invoke;
    v14 = &unk_1E91FC128;
    v5 = v6;
    v15 = v5;
    v16 = a1;
    objc_msgSend(v4, "configureConnection:", &v11);
    -[SASPresentationServer _setConnection:](v5, "_setConnection:", v4, v11, v12, v13, v14);

  }
  return v5;
}

void __45__SASPresentationServer_serverForConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__SASPresentationServer_serverForConnection___block_invoke_2;
  v10[3] = &unk_1E91FC0D8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v7 = a2;
  objc_msgSend(v7, "setInvalidationHandler:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45__SASPresentationServer_serverForConnection___block_invoke_15;
  v8[3] = &unk_1E91FC100;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "setInterruptionHandler:", v8);

}

void __45__SASPresentationServer_serverForConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "+[SASPresentationServer serverForConnection:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation invalidated presentationServer: %@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_unregisterConnection:", v3);

}

void __45__SASPresentationServer_serverForConnection___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "+[SASPresentationServer serverForConnection:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation interrupted presentationServer: %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (void)_unregisterConnection:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  objc_msgSend((id)serversByConnection, "objectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SiriActivationService service](SiriActivationService, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterSiriPresentationIdentifier:", objc_msgSend(v5, "presentationIdentifier"));

  objc_msgSend((id)serversByConnection, "removeObjectForKey:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

}

- (SASPresentationServer)init
{
  SASPresentationServer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SASPresentationServer;
  v2 = -[SASPresentationServer init](&v4, sel_init);
  if (v2 && os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
    -[SASPresentationServer init].cold.1();
  return v2;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D132F000, v0, v1, "%s %p", v2, v3, v4, v5, 2u);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SASPresentationServer connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", -[SASPresentationServer presentationIdentifier](self, "presentationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SASPresentationServer connection:%@, presentationIdentifier:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BSServiceConnectionHost *connection;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  SASPresentationServer *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.siri.activation.service")) & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SASPresentationServer _setConnection:].cold.1((uint64_t)self, v8, v6);
    objc_msgSend(v4, "invalidate");
  }
  else
  {
    -[SASPresentationServer connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

LABEL_9:
      v9 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[SASPresentationServer _setConnection:]";
        v26 = 2114;
        v27 = self;
        _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly attempted to assign a new connection to the activation server with an existing connection: %{public}@", buf, 0x16u);
      }
      objc_msgSend(v4, "invalidate");
      goto LABEL_12;
    }
    if (-[SASPresentationServer invalidated](self, "invalidated"))
      goto LABEL_9;
    -[SASPresentationServer setConnection:](self, "setConnection:", v4);
    objc_initWeak((id *)buf, self);
    connection = self->_connection;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __40__SASPresentationServer__setConnection___block_invoke;
    v21[3] = &unk_1E91FC178;
    v21[4] = self;
    objc_copyWeak(&v22, (id *)buf);
    -[BSServiceConnectionHost configureConnection:](connection, "configureConnection:", v21);
    -[BSServiceConnectionHost activate](self->_connection, "activate");
    -[SASPresentationServer waitForConnectBlocks](self, "waitForConnectBlocks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASPresentationServer setWaitForConnectBlocks:](self, "setWaitForConnectBlocks:", 0);
    if (objc_msgSend(v11, "count"))
    {
      -[BSServiceConnectionHost remoteTarget](self->_connection, "remoteTarget");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v18;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v18 != v15)
              objc_enumerationMutation(v13);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v14);
      }

    }
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
LABEL_12:

}

void __40__SASPresentationServer__setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[SASPresentationServer serviceQuality](SASPresentationServer, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SASPresentationServer interface](SASPresentationServer, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SASPresentationServer__setConnection___block_invoke_2;
  v6[3] = &unk_1E91FC150;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);

}

void __40__SASPresentationServer__setConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v5, "serverDidInvalidateConnection:", v4);

    +[SASPresentationServer _unregisterConnection:](SASPresentationServer, "_unregisterConnection:", v6);
  }

}

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EFC69E10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EFC69E70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)serviceQuality
{
  return (id)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

- (void)pong
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__SASPresentationServer_pong__block_invoke;
  v2[3] = &unk_1E91FBE70;
  objc_copyWeak(&v3, &location);
  SiriInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __29__SASPresentationServer_pong__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  +[SiriActivationService service](SiriActivationService, "service");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "pongWithPresentationIdentifier:", objc_msgSend(WeakRetained, "presentationIdentifier"));

}

- (void)registerPresentationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SASPresentationServer *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  kdebug_trace();
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    objc_msgSend(v6, "stringWithSiriPresentationIdentifier:", objc_msgSend(v4, "siriPresentationIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v14 = "-[SASPresentationServer registerPresentationIdentifier:]";
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s %p #activation registerPresentationIdentifier:%@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SASPresentationServer_registerPresentationIdentifier___block_invoke;
  v10[3] = &unk_1E91FBF68;
  objc_copyWeak(&v12, (id *)buf);
  v9 = v4;
  v11 = v9;
  SiriInvokeOnMainQueue(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __56__SASPresentationServer_registerPresentationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "siriPresentationIdentifier");
    objc_msgSend(WeakRetained, "setPresentationIdentifier:", v2);
    +[SiriActivationService service](SiriActivationService, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerSiriPresentation:withIdentifier:", WeakRetained, v2);

  }
}

- (void)unregisterPresentationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SASPresentationServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  kdebug_trace();
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[SASPresentationServer unregisterPresentationIdentifier:]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s %p #activation unregisterPresentationIdentifier:%@", buf, 0x20u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SASPresentationServer_unregisterPresentationIdentifier___block_invoke;
  v7[3] = &unk_1E91FC1A0;
  v8 = v4;
  v6 = v4;
  SiriInvokeOnMainQueue(v7);

}

void __58__SASPresentationServer_unregisterPresentationIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  +[SiriActivationService service](SiriActivationService, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterSiriPresentationIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriPresentationIdentifier"));

}

- (void)willDismiss
{
  NSObject *v3;
  int64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SASPresentationServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SASPresentationServer willDismiss]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation willDismiss", buf, 0x16u);
  }
  v4 = -[SASPresentationServer presentationIdentifier](self, "presentationIdentifier");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SASPresentationServer_willDismiss__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v4;
  SiriInvokeOnMainQueue(v5);
}

void __36__SASPresentationServer_willDismiss__block_invoke(uint64_t a1)
{
  id v2;

  +[SiriActivationService service](SiriActivationService, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriPresentationWillDismissWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)didDismiss
{
  NSObject *v3;
  int64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SASPresentationServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SASPresentationServer didDismiss]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation didDismiss", buf, 0x16u);
  }
  v4 = -[SASPresentationServer presentationIdentifier](self, "presentationIdentifier");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SASPresentationServer_didDismiss__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v4;
  SiriInvokeOnMainQueue(v5);
}

void __35__SASPresentationServer_didDismiss__block_invoke(uint64_t a1)
{
  id v2;

  +[SiriActivationService service](SiriActivationService, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriPresentationDismissedWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)didPresentSiri
{
  NSObject *v3;
  int64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SASPresentationServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SASPresentationServer didPresentSiri]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation Shell indicates Siri is presented", buf, 0x16u);
  }
  v4 = -[SASPresentationServer presentationIdentifier](self, "presentationIdentifier");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SASPresentationServer_didPresentSiri__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v4;
  SiriInvokeOnMainQueue(v5);
}

void __39__SASPresentationServer_didPresentSiri__block_invoke(uint64_t a1)
{
  id v2;

  +[SiriActivationService service](SiriActivationService, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriPresentationDisplayedWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)resetSiriToActive
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  SASPresentationServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SASPresentationServer resetSiriToActive]";
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation resetSiriToActive", (uint8_t *)&v4, 0x16u);
  }
  -[SASPresentationServer didPresentSiri](self, "didPresentSiri");
}

- (void)failedToPresentSiriWithError:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v4 = a3;
  kdebug_trace();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SASPresentationServer failedToPresentSiriWithError:].cold.1();
  v5 = -[SASPresentationServer presentationIdentifier](self, "presentationIdentifier");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SASPresentationServer_failedToPresentSiriWithError___block_invoke;
  v7[3] = &unk_1E91FC1E8;
  v8 = v4;
  v9 = v5;
  v6 = v4;
  SiriInvokeOnMainQueue(v7);

}

void __54__SASPresentationServer_failedToPresentSiriWithError___block_invoke(uint64_t a1)
{
  id v2;

  +[SiriActivationService service](SiriActivationService, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriPresentationFailureWithIdentifier:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)didUpdatePresentationState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SASPresentationServer *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[SASPresentationServer didUpdatePresentationState:]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s %p #activation Presentation state did update: %@", buf, 0x20u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SASPresentationServer_didUpdatePresentationState___block_invoke;
  v7[3] = &unk_1E91FC1A0;
  v8 = v4;
  v6 = v4;
  SiriInvokeOnMainQueue(v7);

}

void __52__SASPresentationServer_didUpdatePresentationState___block_invoke(uint64_t a1)
{
  id v2;

  +[SiriActivationService service](SiriActivationService, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriPresentationDidUpdateState:", *(_QWORD *)(a1 + 32));

}

- (void)speechRequestStartedFromSiriOrb
{
  SiriInvokeOnMainQueue(&__block_literal_global_3);
}

void __56__SASPresentationServer_speechRequestStartedFromSiriOrb__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "-[SASPresentationServer speechRequestStartedFromSiriOrb]_block_invoke";
    _os_log_impl(&dword_1D132F000, v0, OS_LOG_TYPE_DEFAULT, "%s #activation Shell indicates that speech request was started via Siri orb", (uint8_t *)&v2, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "speechRequestStateDidChange:", 1);

}

- (void)speechRequestCancelledFromSiriOrb
{
  SiriInvokeOnMainQueue(&__block_literal_global_90);
}

void __58__SASPresentationServer_speechRequestCancelledFromSiriOrb__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "-[SASPresentationServer speechRequestCancelledFromSiriOrb]_block_invoke";
    _os_log_impl(&dword_1D132F000, v0, OS_LOG_TYPE_DEFAULT, "%s #activation Shell indicates that speech request was cancelled via Siri orb", (uint8_t *)&v2, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "speechRequestStateDidChange:", 2);

}

- (id)allBulletins
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SASPresentationServer allBulletins]";
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation allBulletins", (uint8_t *)&v6, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allBulletins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bulletinsOnLockScreen
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SASPresentationServer bulletinsOnLockScreen]";
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation bulletinsOnLockScreen", (uint8_t *)&v6, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bulletinsOnLockScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bulletinForIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SASPresentationServer bulletinForIdentifier:]";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation bulletinForIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bulletinForIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BSServiceConnectionEndpointInjector)workspaceServiceInjector
{
  return self->_workspaceServiceInjector;
}

- (void)setWorkspaceServiceInjector:(id)a3
{
  objc_storeStrong((id *)&self->_workspaceServiceInjector, a3);
}

- (BSServiceConnectionHost)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSMutableArray)waitForConnectBlocks
{
  return self->_waitForConnectBlocks;
}

- (void)setWaitForConnectBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_waitForConnectBlocks, a3);
}

- (SASPresentationServerDelegate)weak_delegate
{
  return (SASPresentationServerDelegate *)objc_loadWeakRetained((id *)&self->_weak_delegate);
}

- (void)setWeak_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_weak_delegate, a3);
}

- (int64_t)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(int64_t)a3
{
  self->_presentationIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_delegate);
  objc_storeStrong((id *)&self->_waitForConnectBlocks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workspaceServiceInjector, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D132F000, v0, v1, "%s %p", v2, v3, v4, v5, 2u);
}

- (void)_setConnection:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[SASPresentationServer _setConnection:]";
  v10 = 2048;
  v11 = a1;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_2_0(&dword_1D132F000, v5, v7, "%s %p #activation Unable to establish connection to un-entitled remote process: %@", (uint8_t *)&v8);

}

- (void)failedToPresentSiriWithError:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  int v2[5];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2_0(&dword_1D132F000, v1, (uint64_t)v1, "%s %p #activation Shell indicates Siri presentation failed : %@", (uint8_t *)v2);
}

@end
