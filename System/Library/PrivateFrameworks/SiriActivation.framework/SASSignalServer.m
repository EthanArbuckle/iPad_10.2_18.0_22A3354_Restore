@implementation SASSignalServer

+ (id)serverForConnection:(id)a3
{
  id v3;
  SASSignalServer *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)serversByConnection_0, "objectForKey:", v3);
  v4 = (SASSignalServer *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(SASSignalServer);
    v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v6 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3978];
      v8 = v6;
      objc_msgSend(v7, "currentThread");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "+[SASSignalServer serverForConnection:]";
      v18 = 2048;
      v19 = objc_msgSend(v9, "qualityOfService");
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock about to lock with qos: %zd", (uint8_t *)&v16, 0x16u);

    }
    os_unfair_lock_lock(&lock_0);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "+[SASSignalServer serverForConnection:]";
      _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock successfully locked", (uint8_t *)&v16, 0xCu);
    }
    v11 = (void *)serversByConnection_0;
    if (!serversByConnection_0)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 4);
      v13 = (void *)serversByConnection_0;
      serversByConnection_0 = v12;

      v11 = (void *)serversByConnection_0;
    }
    objc_msgSend(v11, "setObject:forKey:", v4, v3);
    os_unfair_lock_unlock(&lock_0);
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "+[SASSignalServer serverForConnection:]";
      _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock unlocked", (uint8_t *)&v16, 0xCu);
    }
    -[SASSignalServer _setConnection:](v4, "_setConnection:", v3);
  }

  return v4;
}

- (void)_setConnection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BSServiceConnectionHost *connection;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  SASSignalServer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.siri.activation.service"));
  if (!v5 || (v6 & 1) != 0)
  {
    -[SASSignalServer connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else if (!-[SASSignalServer invalidated](self, "invalidated"))
    {
      -[SASSignalServer setConnection:](self, "setConnection:", v4);
      connection = self->_connection;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __34__SASSignalServer__setConnection___block_invoke;
      v11[3] = &unk_1E91FD2C8;
      v11[4] = self;
      -[BSServiceConnectionHost configureConnection:](connection, "configureConnection:", v11);
      -[BSServiceConnectionHost activate](self->_connection, "activate");
      goto LABEL_11;
    }
    v9 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SASSignalServer _setConnection:]";
      v14 = 2114;
      v15 = self;
      _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly attempted to assign a new connection to the activation server with an existing connection: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SASSignalServer _setConnection:].cold.1((uint64_t)self, v7, v5);
  }
  objc_msgSend(v4, "invalidate");
LABEL_11:

}

void __34__SASSignalServer__setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v3 = a2;
  +[SASSignalServer serviceQuality](SASSignalServer, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SASSignalServer interface](SASSignalServer, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __34__SASSignalServer__setConnection___block_invoke_2;
  v9 = &unk_1E91FC150;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_23, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __34__SASSignalServer__setConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _BYTE v13[24];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[7];
    v7 = *MEMORY[0x1E0CFE6A0];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = v5[7];
        *(_DWORD *)v13 = 136315650;
        *(_QWORD *)&v13[4] = "-[SASSignalServer _setConnection:]_block_invoke_2";
        *(_WORD *)&v13[12] = 2112;
        *(_QWORD *)&v13[14] = v3;
        *(_WORD *)&v13[22] = 2112;
        v14 = v9;
        v10 = "%s #activation Invalidating connection - %@ as client %@ terminated";
        v11 = v7;
        v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, v10, v13, v12);
      }
    }
    else if (v8)
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[SASSignalServer _setConnection:]_block_invoke";
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v3;
      v10 = "%s #activation Invalidating connection - %@";
      v11 = v7;
      v12 = 22;
      goto LABEL_7;
    }
    +[SASSignalServer _unregisterConnection:](SASSignalServer, "_unregisterConnection:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  }

}

void __34__SASSignalServer__setConnection___block_invoke_17(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)serversByConnection_0;
    v5 = v3;
    objc_msgSend(v4, "objectForKey:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SASSignalServer _setConnection:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation interrupted signalserver: %@", (uint8_t *)&v7, 0x16u);

  }
}

+ (void)_unregisterConnection:(id)a3
{
  id v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3978];
    v7 = v5;
    objc_msgSend(v6, "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "+[SASSignalServer _unregisterConnection:]";
    v16 = 2048;
    v17 = objc_msgSend(v8, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock about to lock with qos: %zd", (uint8_t *)&v14, 0x16u);

  }
  os_unfair_lock_lock(&lock_0);
  v9 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "+[SASSignalServer _unregisterConnection:]";
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock successfully locked", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend((id)serversByConnection_0, "objectForKey:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriActivationService service](SiriActivationService, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertionClientIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unregisterActivationAssertionWithIdentifier:", v12);

  objc_msgSend((id)serversByConnection_0, "removeObjectForKey:", v3);
  os_unfair_lock_unlock(&lock_0);
  v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "+[SASSignalServer _unregisterConnection:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock unlocked", (uint8_t *)&v14, 0xCu);
  }

}

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EFC69ED0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EFC69F30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)serviceQuality
{
  return (id)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

- (void)_registerSourceForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerActivationSource:withIdentifier:", self, v4);

}

- (void)_unregisterSourceForIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SiriActivationService service](SiriActivationService, "service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterActivationSourceIdentifier:", v3);

}

- (void)registerButtonIdentifier:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  kdebug_trace();
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SASSignalServer connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[SASSignalServer registerButtonIdentifier:withUUID:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Button identifier %@ with uuid '%@' registered by %@", (uint8_t *)&v13, 0x2Au);

  }
  -[SASSignalServer _registerSourceForIdentifier:](self, "_registerSourceForIdentifier:", v7);

}

- (void)unregisterButtonIdentifier:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  kdebug_trace();
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SASSignalServer connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[SASSignalServer unregisterButtonIdentifier:withUUID:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Button identifier %@ with uuid '%@' unregistered by %@", (uint8_t *)&v13, 0x2Au);

  }
  -[SASSignalServer _unregisterSourceForIdentifier:](self, "_unregisterSourceForIdentifier:", v7);

}

- (void)registerNonButtonSourceWithType:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SASSignalServer connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[SASSignalServer registerNonButtonSourceWithType:withUUID:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Non-button source of type %@ with uuid '%@' registered by %@", (uint8_t *)&v13, 0x2Au);

  }
  -[SASSignalServer _registerSourceForIdentifier:](self, "_registerSourceForIdentifier:", v7);

}

- (void)unregisterNonButtonSourceWithType:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SASSignalServer connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[SASSignalServer unregisterNonButtonSourceWithType:withUUID:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Non-button source of type %@ with uuid '%@' unregistered by %@", (uint8_t *)&v13, 0x2Au);

  }
  -[SASSignalServer _unregisterSourceForIdentifier:](self, "_unregisterSourceForIdentifier:", v7);

}

- (void)activationRequestFromButtonIdentifier:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  kdebug_trace();
  v7 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[SASSignalServer activationRequestFromButtonIdentifier:context:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromButtonIdentifier:%@ context:%@", (uint8_t *)&v9, 0x20u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activationRequestFromButtonIdentifier:context:", objc_msgSend(v5, "siriButtonIdentifier"), v6);

}

- (void)deactivationRequestFromButtonIdentifier:(id)a3 context:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[SASSignalServer deactivationRequestFromButtonIdentifier:context:options:]";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation deactivationRequestFromButtonIdentifier:%@ context:%@", (uint8_t *)&v12, 0x20u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivationRequestFromButtonIdentifier:context:options:", objc_msgSend(v7, "siriButtonIdentifier"), v8, v9);

}

- (void)activationRequestFromDirectActionEventWithContext:(id)a3
{
  -[SASSignalServer _activationRequestFromDirectActionEventWithContext:completion:](self, "_activationRequestFromDirectActionEventWithContext:completion:", a3, 0);
}

- (void)_activationRequestFromDirectActionEventWithContext:(id)a3 completion:(id)a4
{
  SiriDirectActionContext *v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  SiriDirectActionContext *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  SiriDirectActionContext *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  SiriDirectActionContext *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (SiriDirectActionContext *)a3;
  v7 = a4;
  kdebug_trace();
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315394;
    v24 = "-[SASSignalServer _activationRequestFromDirectActionEventWithContext:completion:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation _activationRequestFromDirectActionEventWithContext:%@", (uint8_t *)&v23, 0x16u);
  }
  -[SiriDirectActionContext payload](v6, "payload");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[SiriDirectActionContext payload](v6, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", CFSTR("SBSAssistantActivationContextBundleID"));

    if ((v14 & 1) == 0)
    {
      -[SASSignalServer connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "remoteProcess");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifier");
      v17 = (SiriDirectActionContext *)objc_claimAutoreleasedReturnValue();

      v18 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315394;
        v24 = "-[SASSignalServer _activationRequestFromDirectActionEventWithContext:completion:]";
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation _activationRequestFromDirectActionEventWithContext payload missing bundleId, using connection bundle id:%@", (uint8_t *)&v23, 0x16u);
      }
      -[SiriDirectActionContext payload](v6, "payload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v20, "setValue:forKey:", v17, CFSTR("SBSAssistantActivationContextBundleID"));
      v21 = -[SiriDirectActionContext initWithPayload:]([SiriDirectActionContext alloc], "initWithPayload:", v20);

      v6 = v21;
    }
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activationRequestFromDirectActionEventWithContext:completion:", v6, v7);

}

- (void)activationRequestFromContinuityWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer activationRequestFromContinuityWithContext:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuityWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromContinuityWithContext:", v3);

}

- (void)activationRequestFromRemotePresentationBringUpWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer activationRequestFromRemotePresentationBringUpWithContext:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromRemotePresentationBringUpWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromRemotePresentationBringUpWithContext:", v3);

}

- (void)activationRequestFromBreadcrumb
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SASSignalServer activationRequestFromBreadcrumb]";
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromBreadcrumb", (uint8_t *)&v4, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activationRequestFromBreadcrumb");

}

- (void)activationRequestFromBluetoothKeyboardActivation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SASSignalServer activationRequestFromBluetoothKeyboardActivation:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromBluetoothKeyboardActivation", (uint8_t *)&v6, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromBluetoothKeyboardActivation:", objc_msgSend(v3, "integerValue"));

}

- (void)activationRequestFromSimpleActivation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SASSignalServer activationRequestFromSimpleActivation:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSimpleActivation", (uint8_t *)&v6, 0xCu);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromSimpleActivation:", objc_msgSend(v3, "integerValue"));

}

- (void)activationRequestFromSpotlightWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer activationRequestFromSpotlightWithContext:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSpotlightWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromSpotlightWithContext:", v3);

}

- (void)activationRequestFromTestingWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer activationRequestFromTestingWithContext:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromTestingWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromTestingWithContext:", v3);

}

- (void)activationRequestFromVocalShortcutWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer activationRequestFromVocalShortcutWithContext:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVocalShortcutWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationRequestFromVocalShortcutWithContext:", v3);

}

- (void)setHintGlowAssertionFromButtonIdentifier:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[SASSignalServer setHintGlowAssertionFromButtonIdentifier:context:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation setHintGlowAssertionFromButtonIdentifier: %@, context: %@", (uint8_t *)&v9, 0x20u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHintGlowAssertionFromButtonIdentifier:context:", objc_msgSend(v5, "siriButtonIdentifier"), v6);

}

- (void)prewarmFromButtonIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer prewarmFromButtonIdentifier:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s prewarmFromButtonIdentifier:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prewarmFromButtonIdentifier:longPressInterval:", objc_msgSend(v3, "siriButtonIdentifier"), 0.0);

}

- (void)prewarmFromButtonIdentifier:(id)a3 longPressInterval:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  kdebug_trace();
  v7 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[SASSignalServer prewarmFromButtonIdentifier:longPressInterval:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s prewarmFromButtonIdentifier:%@", (uint8_t *)&v12, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "siriButtonIdentifier");
  objc_msgSend(v6, "timeInterval");
  v11 = v10;

  objc_msgSend(v8, "prewarmFromButtonIdentifier:longPressInterval:", v9, v11);
}

- (void)cancelPrewarmFromButtonIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer cancelPrewarmFromButtonIdentifier:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s cancelPrewarmFromButtonIdentifier:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelPrewarmFromButtonIdentifier:", objc_msgSend(v3, "siriButtonIdentifier"));

}

- (void)buttonDownFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SASActivationInstrumentation *activationInstrumentation;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  v11 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[SASSignalServer buttonDownFromButtonIdentifier:timestamp:context:]";
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s buttonDownFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assistantIsEnabled");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", objc_msgSend(v8, "siriButtonIdentifier", CFSTR("eventSource")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsEventCreateCurrent();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logEvent:", v17);

    activationInstrumentation = self->_activationInstrumentation;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", objc_msgSend(v8, "siriButtonIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASActivationInstrumentation buttonDownWithIdentifier:](activationInstrumentation, "buttonDownWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setActivationEventInstrumentationIdentifier:", v20);
    v21 = objc_msgSend(v8, "siriButtonIdentifier");
    if ((unint64_t)(v21 - 1) <= 8 && ((0x173u >> (v21 - 1)) & 1) != 0)
      kdebug_trace();

  }
  +[SiriActivationService service](SiriActivationService, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v8, "siriButtonIdentifier");
  objc_msgSend(v9, "timeInterval");
  objc_msgSend(v22, "buttonDownFromButtonIdentifier:timestamp:context:", v23, v10);

}

- (void)buttonUpFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SASActivationInstrumentation *activationInstrumentation;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  kdebug_trace();
  v14 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[SASSignalServer buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s buttonUpFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "assistantIsEnabled");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", objc_msgSend(v10, "siriButtonIdentifier", CFSTR("eventSource")));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsEventCreateCurrent();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logEvent:", v20);

    activationInstrumentation = self->_activationInstrumentation;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", objc_msgSend(v10, "siriButtonIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASActivationInstrumentation buttonUpWithIdentifier:](activationInstrumentation, "buttonUpWithIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setActivationEventInstrumentationIdentifier:", v23);
    v24 = objc_msgSend(v10, "siriButtonIdentifier");
    if ((unint64_t)(v24 - 1) <= 8 && ((0x173u >> (v24 - 1)) & 1) != 0)
      kdebug_trace();

  }
  +[SiriActivationService service](SiriActivationService, "service");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v10, "siriButtonIdentifier");
  objc_msgSend(v11, "timeInterval");
  objc_msgSend(v25, "buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", v26, v13, v12);

}

- (void)buttonTapFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SASActivationInstrumentation *activationInstrumentation;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  kdebug_trace();
  v11 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[SASSignalServer buttonTapFromButtonIdentifier:timestamp:context:]";
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s buttonTapFromButtonIdentifier:%@", (uint8_t *)&v19, 0x16u);
  }
  activationInstrumentation = self->_activationInstrumentation;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", objc_msgSend(v8, "siriButtonIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASActivationInstrumentation buttonTapWithIdentifier:associateWithButtonDown:](activationInstrumentation, "buttonTapWithIdentifier:associateWithButtonDown:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setActivationEventInstrumentationIdentifier:", v14);
  +[SiriActivationService service](SiriActivationService, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "siriButtonIdentifier");
  objc_msgSend(v10, "timeInterval");
  v18 = v17;

  objc_msgSend(v15, "buttonTapFromButtonIdentifier:timestamp:context:", v16, v9, v18);
}

- (void)buttonLongPressFromButtonIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  kdebug_trace();
  v8 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[SASSignalServer buttonLongPressFromButtonIdentifier:context:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s buttonLongPressFromButtonIdentifier:%@ context:%@", (uint8_t *)&v11, 0x20u);
  }
  -[SASActivationInstrumentation mostRecentAtivationEvenIdentifier](self->_activationInstrumentation, "mostRecentAtivationEvenIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivationEventInstrumentationIdentifier:", v9);

  +[SiriActivationService service](SiriActivationService, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buttonLongPressFromButtonIdentifier:context:", objc_msgSend(v6, "siriButtonIdentifier"), v7);

}

- (void)specifySenderForInstrumentation:(id)a3
{
  id v4;
  SASActivationInstrumentation *v5;
  SASActivationInstrumentation *activationInstrumentation;
  NSObject *v7;
  SASActivationInstrumentation *v8;
  int v9;
  const char *v10;
  __int16 v11;
  SASActivationInstrumentation *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SASActivationInstrumentation initWithSender:]([SASActivationInstrumentation alloc], "initWithSender:", v4);

  activationInstrumentation = self->_activationInstrumentation;
  self->_activationInstrumentation = v5;

  v7 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_activationInstrumentation;
    v9 = 136315394;
    v10 = "-[SASSignalServer specifySenderForInstrumentation:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)registerAssertionWithIdentifier:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[SASSignalServer registerAssertionWithIdentifier:reason:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation registerAssertionWithIdentifier:%@ reason:%@", (uint8_t *)&v10, 0x20u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerActivationAssertion:withIdentifier:", self, v6);

  -[SASSignalServer setAssertionClientIdentifier:](self, "setAssertionClientIdentifier:", v6);
}

- (void)unregisterAssertionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SASSignalServer unregisterAssertionWithIdentifier:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation unregisterAssertionWithIdentifier:%@", (uint8_t *)&v7, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterActivationAssertionWithIdentifier:", v4);

  -[SASSignalServer setAssertionClientIdentifier:](self, "setAssertionClientIdentifier:", 0);
}

- (void)registerButtonEventListenerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SASSignalServer registerButtonEventListenerWithIdentifier:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s registerButtonEventListenerWithIdentifier:%@", (uint8_t *)&v7, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerButtonEventListenerServer:identifier:", self, v4);

}

- (void)unregisterButtonEventListenerWithIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASSignalServer unregisterButtonEventListenerWithIdentifier:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s unregisterButtonEventListenerWithIdentifier:%@", (uint8_t *)&v6, 0x16u);
  }
  +[SiriActivationService service](SiriActivationService, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterButtonEventListenerWithIdentifier:", v3);

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

- (SASSignalServerDelegate)weak_delegate
{
  return (SASSignalServerDelegate *)objc_loadWeakRetained((id *)&self->_weak_delegate);
}

- (void)setWeak_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_weak_delegate, a3);
}

- (NSString)assertionClientIdentifier
{
  return self->_assertionClientIdentifier;
}

- (void)setAssertionClientIdentifier:(id)a3
{
  self->_assertionClientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_delegate);
  objc_storeStrong((id *)&self->_waitForConnectBlocks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workspaceServiceInjector, 0);
  objc_storeStrong((id *)&self->_activationInstrumentation, 0);
}

- (void)_setConnection:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[SASSignalServer _setConnection:]";
  v9 = 2048;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1D132F000, v5, OS_LOG_TYPE_ERROR, "%s %p #activation Unable to establish connection to un-entitled remote process: %@", (uint8_t *)&v7, 0x20u);

}

@end
