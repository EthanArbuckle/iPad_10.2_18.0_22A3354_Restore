@implementation SiriActivationButtonEventListener

+ (id)listener
{
  if (listener_onceToken != -1)
    dispatch_once(&listener_onceToken, &__block_literal_global_12);
  return (id)listener_sharedListener;
}

void __45__SiriActivationButtonEventListener_listener__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SiriActivationButtonEventListener _init]([SiriActivationButtonEventListener alloc], "_init");
  v1 = (void *)listener_sharedListener;
  listener_sharedListener = (uint64_t)v0;

}

- (id)_init
{
  SiriActivationButtonEventListener *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *listeners;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriActivationButtonEventListener;
  v2 = -[SiriActivationSource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    listeners = v2->_listeners;
    v2->_listeners = v3;

  }
  return v2;
}

- (void)registerWithListener:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[SiriActivationButtonEventListener registerWithListener:identifier:]";
    v19 = 2048;
    v20 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v17, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[SiriActivationButtonEventListener registerWithListener:identifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v17, 0xCu);
  }
  -[SiriActivationButtonEventListener listeners](self, "listeners");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v6, v7);

  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->super._lock);
  v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[SiriActivationButtonEventListener registerWithListener:identifier:]";
    _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v17, 0xCu);
  }
  if (v15)
    -[SiriActivationButtonEventListener _registerListenerWithIdentifier:](self, "_registerListenerWithIdentifier:", v7);
  else
    -[SiriActivationButtonEventListener configureConnectionForIdentifier:](self, "configureConnectionForIdentifier:", v7);

}

- (void)configureConnectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BSServiceConnection *v11;
  BSServiceConnection *connection;
  BSServiceConnection *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D03458];
  +[SASBoardServicesConfiguration configuration](SASBoardServicesConfiguration, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "machServiceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SASBoardServicesConfiguration configuration](SASBoardServicesConfiguration, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierForService:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointForMachName:service:instance:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v10);
  v11 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->super._connection;
  self->super._connection = v11;

  objc_initWeak(&location, self);
  v13 = self->super._connection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke;
  v15[3] = &unk_1E91FC960;
  objc_copyWeak(&v17, &location);
  v14 = v4;
  v16 = v14;
  -[BSServiceConnection configureConnection:](v13, "configureConnection:", v15);
  -[BSServiceConnection activate](self->super._connection, "activate");

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[SASSignalServer serviceQuality](SASSignalServer, "serviceQuality");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceQuality:", v5);

    +[SASSignalServer interface](SASSignalServer, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterface:", v6);

    objc_msgSend(v3, "setInterfaceTarget:", WeakRetained);
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_2;
    v13[3] = &unk_1E91FC150;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    objc_msgSend(v3, "setInvalidationHandler:", v13);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_3;
    v11[3] = &unk_1E91FC150;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    objc_msgSend(v3, "setInterruptionHandler:", v11);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_4;
    v8[3] = &unk_1E91FC938;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v8[4] = WeakRetained;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v3, "setActivationHandler:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
  }

}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __70__SiriActivationButtonEventListener_configureConnectionForIdentifier___block_invoke_4(uint64_t a1, void *a2)
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
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v16 = 136315650;
    v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke_4";
    v18 = 2048;
    v19 = v7;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated for button event listener strongSelf=%p connection=%@", (uint8_t *)&v16, 0x20u);
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
      v16 = 136315394;
      v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke";
      v18 = 2048;
      v19 = v12;
      _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock about to lock with qos: %zd", (uint8_t *)&v16, 0x16u);

    }
    os_unfair_lock_lock(WeakRetained + 4);
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke";
      _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock successfully locked", (uint8_t *)&v16, 0xCu);
    }
    objc_msgSend(v3, "remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerButtonEventListenerWithIdentifier:", *(_QWORD *)(a1 + 40));

    os_unfair_lock_unlock(WeakRetained + 4);
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[SiriActivationButtonEventListener configureConnectionForIdentifier:]_block_invoke";
      _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_lock unlocked", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)unregisterListenerWithIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  BSServiceConnection *connection;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  BSServiceConnection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
    v22 = 2048;
    v23 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v20, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v20, 0xCu);
  }
  -[NSMutableDictionary allKeys](self->_listeners, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v4);

  v13 = *v5;
  v14 = *v5;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->super._connection;
      v20 = 136315650;
      v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
      v22 = 2112;
      v23 = (uint64_t)v4;
      v24 = 2112;
      v25 = connection;
      _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Unregistering SiriActivationButtonEventListenerDelegate delegate=%@ connection=%@", (uint8_t *)&v20, 0x20u);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_listeners, "removeObjectForKey:", v4);
    -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unregisterButtonEventListenerWithIdentifier:", v4);

    v17 = -[NSMutableDictionary count](self->_listeners, "count");
    os_unfair_lock_unlock(&self->super._lock);
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
      _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v20, 0xCu);
    }
    if (!v17)
      -[SiriActivationButtonEventListener invalidate](self, "invalidate");
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SiriActivationButtonEventListener unregisterListenerWithIdentifier:].cold.1((uint64_t)v4, v13);
    os_unfair_lock_unlock(&self->super._lock);
    v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
      _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v20, 0xCu);
    }
  }

}

- (void)_registerListenerWithIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[SiriActivationButtonEventListener _registerListenerWithIdentifier:]";
    v16 = 2048;
    v17 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v14, 0x16u);

  }
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[SiriActivationButtonEventListener _registerListenerWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v14, 0xCu);
  }
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerButtonEventListenerWithIdentifier:", v4);

  os_unfair_lock_unlock(p_lock);
  v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[SiriActivationButtonEventListener _registerListenerWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v14, 0xCu);
  }

}

- (void)invalidate
{
  -[SiriActivationButtonEventListener invalidatedAtTimestamp:](self, "invalidatedAtTimestamp:", CFAbsoluteTimeGetCurrent());
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
  BSServiceConnection *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->super._connection;
    v15 = 136315394;
    v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    v17 = 2112;
    v18 = (uint64_t)connection;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection invalidating listener connection=%@", (uint8_t *)&v15, 0x16u);
  }
  v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB3978];
    v9 = v7;
    objc_msgSend(v8, "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "qualityOfService");
    v15 = 136315394;
    v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    v17 = 2048;
    v18 = v11;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", (uint8_t *)&v15, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v12 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", (uint8_t *)&v15, 0xCu);
  }
  -[BSServiceConnection invalidate](self->super._connection, "invalidate");
  v13 = self->super._connection;
  self->super._connection = 0;

  os_unfair_lock_unlock(&self->super._lock);
  v14 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SiriActivationButtonEventListener invalidatedAtTimestamp:]";
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", (uint8_t *)&v15, 0xCu);
  }
}

- (id)connection
{
  return self->super._connection;
}

- (void)buttonDownWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  os_unfair_lock_s *lock;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v25 = a4;
  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    v34 = 2048;
    v35 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v13 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", buf, 0xCu);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allKeys](self->_listeners, "allKeys", &self->super._lock);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_listeners, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
          v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy Forwarding Button down event to Listener with identifier %@", buf, 0x16u);
        }
        objc_msgSend(v8, "timeInterval");
        objc_msgSend(v20, "buttonEventListenerDidReceiveButtonDownWithButtonIdentifier:atTimestamp:", objc_msgSend(v26, "integerValue"), v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  v23 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", buf, 0xCu);
  }

}

- (void)buttonUpWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  os_unfair_lock_s *lock;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v25 = a4;
  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    v34 = 2048;
    v35 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v13 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", buf, 0xCu);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allKeys](self->_listeners, "allKeys", &self->super._lock);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_listeners, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
          v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy Forwarding Button down event to Listener with identifier %@", buf, 0x16u);
        }
        objc_msgSend(v8, "timeInterval");
        objc_msgSend(v20, "buttonEventListenerDidReceiveButtonUpWithButtonIdentifier:atTimestamp:", objc_msgSend(v26, "integerValue"), v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  v23 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", buf, 0xCu);
  }

}

- (void)buttonLongPressWithButtonIdentifier:(id)a3 forListenerIdentifier:(id)a4 atTimestamp:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  os_unfair_lock_s *lock;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v25 = a4;
  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    v34 = 2048;
    v35 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->super._lock);
  v13 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock successfully locked", buf, 0xCu);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allKeys](self->_listeners, "allKeys", &self->super._lock);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_listeners, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
          v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy Forwarding Button down event to Listener with identifier %@", buf, 0x16u);
        }
        objc_msgSend(v8, "timeInterval");
        objc_msgSend(v20, "buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier:atTimestamp:", objc_msgSend(v26, "integerValue"), v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  v23 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriActivationButtonEventListener buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _lock unlocked", buf, 0xCu);
  }

}

- (NSMutableDictionary)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

- (void)unregisterListenerWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SiriActivationButtonEventListener unregisterListenerWithIdentifier:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1D132F000, a2, OS_LOG_TYPE_ERROR, "%s #activation Unregister listener '%@' when it is not connected.", (uint8_t *)&v2, 0x16u);
}

@end
