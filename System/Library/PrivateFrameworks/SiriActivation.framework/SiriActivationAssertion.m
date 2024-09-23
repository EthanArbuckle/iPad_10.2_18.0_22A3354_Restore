@implementation SiriActivationAssertion

- (SiriActivationAssertion)initWithIdentifier:(id)a3 reason:(unint64_t)a4
{
  id v6;
  SiriActivationAssertion *v7;
  SiriActivationAssertion *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriActivationAssertion;
  v7 = -[SiriActivationSource init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SiriActivationSource setIdentifier:](v7, "setIdentifier:", v6);
    -[SiriActivationAssertion setReason:](v8, "setReason:", a4);
    -[SiriActivationAssertion configureConnection](v8, "configureConnection");
  }

  return v8;
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
  v14 = __46__SiriActivationAssertion_configureConnection__block_invoke;
  v15 = &unk_1E91FC4A8;
  objc_copyWeak(&v16, &location);
  -[BSServiceConnection configureConnection:](v11, "configureConnection:", &v12);
  -[BSServiceConnection activate](self->super._connection, "activate", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __46__SiriActivationAssertion_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
    objc_msgSend(WeakRetained, "identifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    +[SASSignalServer serviceQuality](SASSignalServer, "serviceQuality");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceQuality:", v7);

    +[SASSignalServer interface](SASSignalServer, "interface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterface:", v8);

    objc_msgSend(v3, "setInterfaceTarget:", v6);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__SiriActivationAssertion_configureConnection__block_invoke_16;
    v14[3] = &unk_1E91FC988;
    v14[4] = v6;
    objc_copyWeak(&v15, v4);
    objc_msgSend(v3, "setInvalidationHandler:", v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __46__SiriActivationAssertion_configureConnection__block_invoke_18;
    v12[3] = &unk_1E91FC988;
    v12[4] = v6;
    objc_copyWeak(&v13, v4);
    objc_msgSend(v3, "setInterruptionHandler:", v12);
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __46__SiriActivationAssertion_configureConnection__block_invoke_19;
    v10[3] = &unk_1E91FC9B0;
    objc_copyWeak(&v11, v4);
    v10[4] = v6;
    v10[5] = v16;
    objc_msgSend(v3, "setActivationHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    _Block_object_dispose(v16, 8);

  }
}

void __46__SiriActivationAssertion_configureConnection__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SiriActivationAssertion configureConnection]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation Received Invalidation for Assertion - %@, Invalidating…", (uint8_t *)&v5, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __46__SiriActivationAssertion_configureConnection__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SiriActivationAssertion configureConnection]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation Received Interruption for Assertion - %@, Invalidating…", (uint8_t *)&v5, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __46__SiriActivationAssertion_configureConnection__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v18 = 136315650;
    v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
    v20 = 2048;
    v21 = v7;
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated for assertion strongSelf=%p connection=%@", (uint8_t *)&v18, 0x20u);
  }
  if (WeakRetained)
  {
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x1E0CB3978];
      v10 = v8;
      objc_msgSend(v9, "currentThread");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "qualityOfService");
      v18 = 136315394;
      v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
      v20 = 2048;
      v21 = v12;
      _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);

    }
    os_unfair_lock_lock(WeakRetained + 4);
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
      _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock successfully locked", (uint8_t *)&v18, 0xCu);
    }
    objc_msgSend(v3, "remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)&WeakRetained[8]._os_unfair_lock_opaque);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerAssertionWithIdentifier:reason:", v15, v16);

    os_unfair_lock_unlock(WeakRetained + 4);
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[SiriActivationAssertion configureConnection]_block_invoke";
      _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock unlocked", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (void)invalidate
{
  -[SiriActivationAssertion invalidatedAtTimestamp:](self, "invalidatedAtTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)invalidatedAtTimestamp:(double)a3
{
  os_log_t *v4;
  NSObject *v5;
  BSServiceConnection *connection;
  os_log_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BSServiceConnection *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  SiriActivationAssertion *v20;
  __int16 v21;
  BSServiceConnection *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->super._connection;
    v17 = 136315650;
    v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = connection;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Unregistering & invalidating assertion self=%@ connection=%@", (uint8_t *)&v17, 0x20u);
  }
  v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB3978];
    v9 = v7;
    objc_msgSend(v8, "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "qualityOfService");
    v17 = 136315394;
    v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    v19 = 2048;
    v20 = (SiriActivationAssertion *)v11;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v17, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v12 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v17, 0xCu);
  }
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriActivationSource identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unregisterAssertionWithIdentifier:", v14);

  -[BSServiceConnection invalidate](self->super._connection, "invalidate");
  v15 = self->super._connection;
  self->super._connection = 0;

  os_unfair_lock_unlock(&self->super._lock);
  v16 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[SiriActivationAssertion invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v17, 0xCu);
  }
}

- (id)connection
{
  return self->super._connection;
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->super._connection, a3);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SiriActivationAssertion dealloc]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation SiriActivationAssertion got deallocated", buf, 0xCu);
  }
  -[SiriActivationAssertion invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SiriActivationAssertion;
  -[SiriActivationSource dealloc](&v4, sel_dealloc);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end
