@implementation SiriSimpleActivationSource

- (SiriSimpleActivationSource)init
{
  SiriSimpleActivationSource *v2;
  SiriSimpleActivationSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriSimpleActivationSource;
  v2 = -[SiriActivationSource init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SiriSimpleActivationSource configureConnection](v2, "configureConnection");
  return v3;
}

- (void)configureConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BSServiceConnection *v9;
  BSServiceConnection *connection;
  BSServiceConnection *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v3 = (void *)MEMORY[0x1E0D03458];
  +[SASBoardServicesConfiguration configuration](SASBoardServicesConfiguration, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "machServiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SASBoardServicesConfiguration configuration](SASBoardServicesConfiguration, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForService:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v8);
  v9 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->super._connection;
  self->super._connection = v9;

  objc_initWeak(&location, self);
  v11 = self->super._connection;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __49__SiriSimpleActivationSource_configureConnection__block_invoke;
  v15 = &unk_1E91FC4A8;
  objc_copyWeak(&v16, &location);
  -[BSServiceConnection configureConnection:](v11, "configureConnection:", &v12);
  -[BSServiceConnection activate](self->super._connection, "activate", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __49__SiriSimpleActivationSource_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SASSignalServer serviceQuality](SASSignalServer, "serviceQuality");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceQuality:", v8);

    +[SASSignalServer interface](SASSignalServer, "interface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterface:", v9);

    objc_msgSend(v3, "setInterfaceTarget:", v6);
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__SiriSimpleActivationSource_configureConnection__block_invoke_2;
    v16[3] = &unk_1E91FC438;
    v11 = v7;
    v17 = v11;
    objc_msgSend(v3, "setInvalidationHandler:", v16);
    objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_9);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __49__SiriSimpleActivationSource_configureConnection__block_invoke_20;
    v13[3] = &unk_1E91FC480;
    objc_copyWeak(&v15, v4);
    v12 = v11;
    v14 = v12;
    objc_msgSend(v3, "setActivationHandler:", v13);

    objc_destroyWeak(&v15);
  }

}

void __49__SiriSimpleActivationSource_configureConnection__block_invoke_2(uint64_t a1, void *a2)
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
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SiriSimpleActivationSource configureConnection]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Invalidated %@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(v3, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterNonButtonSourceWithType:withUUID:", &unk_1E920E340, *(_QWORD *)(a1 + 32));

}

void __49__SiriSimpleActivationSource_configureConnection__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    __49__SiriSimpleActivationSource_configureConnection__block_invoke_18_cold_1((uint64_t)v2, v3);

}

void __49__SiriSimpleActivationSource_configureConnection__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    v6 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[SiriSimpleActivationSource configureConnection]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated %@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(v3, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerNonButtonSourceWithType:withUUID:", &unk_1E920E340, *(_QWORD *)(a1 + 32));

    os_unfair_lock_unlock(v5 + 4);
  }

}

- (void)activateFromSource:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activationRequestFromSimpleActivation:", v7);

  os_unfair_lock_unlock(p_lock);
}

void __49__SiriSimpleActivationSource_configureConnection__block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SiriSimpleActivationSource configureConnection]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1D132F000, a2, OS_LOG_TYPE_ERROR, "%s #activation BSServiceConnection Interrupted %@", (uint8_t *)&v2, 0x16u);
}

@end
