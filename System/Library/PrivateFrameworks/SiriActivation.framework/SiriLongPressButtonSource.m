@implementation SiriLongPressButtonSource

+ (id)longPressButtonForIdentifier:(int64_t)a3
{
  id v3;
  SiriLongPressButtonContext *v4;
  void *v5;
  void *v6;

  v3 = -[SiriLongPressButtonSource _initWithButtonIdentifier:]([SiriLongPressButtonSource alloc], "_initWithButtonIdentifier:", a3);
  v4 = objc_alloc_init(SiriLongPressButtonContext);
  objc_msgSend(v3, "setContext:", v4);

  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonDownTimestamp:", 0.0);

  objc_msgSend(v3, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLongPressBehavior:", -1);

  return v3;
}

- (SiriLongPressButtonSource)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (id)_initWithButtonIdentifier:(int64_t)a3
{
  SiriLongPressButtonSource *v4;
  SiriLongPressButtonSource *v5;
  id v6;
  SiriLongPressButtonContext *v7;
  SiriLongPressButtonConfiguration *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriLongPressButtonSource;
  v4 = -[SiriActivationSource init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SiriLongPressButtonSource setButtonIdentifier:](v4, "setButtonIdentifier:", a3);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SiriLongPressButtonSource setLock_activityAssertions:](v5, "setLock_activityAssertions:", v6);

    -[SiriLongPressButtonSource configureConnection](v5, "configureConnection");
    v7 = objc_alloc_init(SiriLongPressButtonContext);
    -[SiriLongPressButtonSource setContext:](v5, "setContext:", v7);

    v8 = -[SiriLongPressButtonConfiguration initWithButtonIdentifier:]([SiriLongPressButtonConfiguration alloc], "initWithButtonIdentifier:", a3);
    -[SiriLongPressButtonSource setConfiguration:](v5, "setConfiguration:", v8);

    -[SiriLongPressButtonSource setCurrentTimeGenerator:](v5, "setCurrentTimeGenerator:", &__block_literal_global_11);
  }
  return v5;
}

- (double)hintGlowTimeIntervalInMs
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
  objc_msgSend(v2, "valueForKey:", CFSTR("HintGlowIntervalInMs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 250.0;
  }

  return v5;
}

- (double)longPressInterval
{
  double result;

  -[SiriLongPressButtonConfiguration longPressInterval](self->_configuration, "longPressInterval");
  return result;
}

- (int64_t)longPressBehavior
{
  return -[SiriLongPressButtonConfiguration longPressBehavior](self->_configuration, "longPressBehavior");
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
  v14 = __48__SiriLongPressButtonSource_configureConnection__block_invoke;
  v15 = &unk_1E91FC4A8;
  objc_copyWeak(&v16, &location);
  -[BSServiceConnection configureConnection:](v11, "configureConnection:", &v12);
  -[BSServiceConnection activate](self->super._connection, "activate", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  _QWORD v17[4];
  id v18;
  void *v19;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)objc_msgSend(WeakRetained, "buttonIdentifier");
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SASSignalServer serviceQuality](SASSignalServer, "serviceQuality");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceQuality:", v9);

    +[SASSignalServer interface](SASSignalServer, "interface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterface:", v10);

    objc_msgSend(v3, "setInterfaceTarget:", v6);
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__SiriLongPressButtonSource_configureConnection__block_invoke_2;
    v17[3] = &unk_1E91FC0D8;
    v19 = v7;
    v12 = v8;
    v18 = v12;
    objc_msgSend(v3, "setInvalidationHandler:", v17);
    objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_37);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __48__SiriLongPressButtonSource_configureConnection__block_invoke_38;
    v14[3] = &unk_1E91FC7A0;
    objc_copyWeak(v16, v4);
    v16[1] = v7;
    v13 = v12;
    v15 = v13;
    objc_msgSend(v3, "setActivationHandler:", v14);

    objc_destroyWeak(v16);
  }

}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  SASButtonIdentifierTransport *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SiriLongPressButtonSource configureConnection]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Invalidated %@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(v3, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "unregisterButtonIdentifier:withUUID:", v6, *(_QWORD *)(a1 + 32));

}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_36(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    __48__SiriLongPressButtonSource_configureConnection__block_invoke_36_cold_1((uint64_t)v2, v3);
  objc_msgSend(v2, "activate");

}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  NSObject *v5;
  void *v6;
  SASButtonIdentifierTransport *v7;
  _UNKNOWN **v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  SASTimeIntervalTransport *v19;
  SASTimeIntervalTransport *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  os_unfair_lock_s *v26;
  _UNKNOWN **v27;
  id v28;
  SASTimeIntervalTransport *v29;
  SASTimeIntervalTransport *v30;
  os_unfair_lock_s *lock;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  os_unfair_lock_s *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[SiriLongPressButtonSource configureConnection]_block_invoke";
    v41 = 2048;
    v42 = WeakRetained;
    v43 = 2112;
    v44 = v3;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated strongSelf=%p connection=%@", buf, 0x20u);
  }
  if (WeakRetained)
  {
    lock = WeakRetained + 4;
    os_unfair_lock_lock(WeakRetained + 4);
    objc_msgSend(v3, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "registerButtonIdentifier:withUUID:", v7, *(_QWORD *)(a1 + 32));

    v8 = &off_1E91FB000;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[os_unfair_lock_s lock_activityAssertions](WeakRetained, "lock_activityAssertions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (!v33)
      goto LABEL_16;
    v10 = *(_QWORD *)v35;
    v32 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "reason");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("prepare"));

        if (v14)
        {
          objc_msgSend(v3, "remoteTarget");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc((Class)v8[123]);
          objc_msgSend(v12, "reference");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithString:", v17);
          v19 = [SASTimeIntervalTransport alloc];
          -[os_unfair_lock_s longPressInterval](WeakRetained, "longPressInterval");
          v20 = -[SASTimeIntervalTransport initWithTimeInterval:](v19, "initWithTimeInterval:");
          objc_msgSend(v15, "prewarmFromButtonIdentifier:longPressInterval:", v18, v20);
        }
        else
        {
          objc_msgSend(v12, "reason");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("speechInteraction"));

          if (!v22)
            continue;
          v23 = objc_alloc((Class)v8[123]);
          objc_msgSend(v12, "reference");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v23, "initWithString:", v24);

          -[os_unfair_lock_s context](WeakRetained, "context");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_unfair_lock_s setupHintGlowTimerIfNeededWithButtonIdentifier:buttonContext:](WeakRetained, "setupHintGlowTimerIfNeededWithButtonIdentifier:buttonContext:", v15, v17);
          objc_msgSend(v3, "remoteTarget");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v9;
          v26 = WeakRetained;
          v27 = v8;
          v28 = v3;
          v29 = [SASTimeIntervalTransport alloc];
          objc_msgSend(v12, "timestamp");
          v30 = v29;
          v3 = v28;
          v8 = v27;
          WeakRetained = v26;
          v9 = v25;
          v10 = v32;
          v20 = -[SASTimeIntervalTransport initWithTimeInterval:](v30, "initWithTimeInterval:");
          objc_msgSend(v18, "buttonDownFromButtonIdentifier:timestamp:context:", v15, v20, v17);
        }

      }
      v33 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v33)
      {
LABEL_16:

        os_unfair_lock_unlock(lock);
        break;
      }
    }
  }

}

- (id)prepareForActivationWithTimestamp:(double)a3
{
  double v4;
  SiriActivityAssertion *v5;
  void *v6;
  void *v7;
  void *v8;
  SiriActivityAssertion *v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  SASButtonIdentifierTransport *v12;
  void *v13;
  SASButtonIdentifierTransport *v14;
  SASTimeIntervalTransport *v15;
  SASTimeIntervalTransport *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;

  v4 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
  objc_initWeak(&location, self);
  v5 = [SiriActivityAssertion alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __63__SiriLongPressButtonSource_prepareForActivationWithTimestamp___block_invoke;
  v21 = &unk_1E91FC7C8;
  objc_copyWeak(&v22, &location);
  v9 = -[SiriActivityAssertion initWithIdentifier:reference:reason:timestamp:invalidationBlock:](v5, "initWithIdentifier:reference:reason:timestamp:invalidationBlock:", v7, v8, CFSTR("prepare"), &v18, v4);

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[NSMutableArray addObject:](self->_lock_activityAssertions, "addObject:", v9, v18, v19, v20, v21);
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [SASButtonIdentifierTransport alloc];
  -[SiriActivityAssertion reference](v9, "reference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SASButtonIdentifierTransport initWithString:](v12, "initWithString:", v13);
  v15 = [SASTimeIntervalTransport alloc];
  -[SiriLongPressButtonSource longPressInterval](self, "longPressInterval");
  v16 = -[SASTimeIntervalTransport initWithTimeInterval:](v15, "initWithTimeInterval:");
  objc_msgSend(v11, "prewarmFromButtonIdentifier:longPressInterval:", v14, v16);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v9;
}

void __63__SiriLongPressButtonSource_prepareForActivationWithTimestamp___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  void *v5;
  SASButtonIdentifierTransport *v6;
  void *v7;
  SASButtonIdentifierTransport *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    objc_msgSend(*(id *)&v4[2]._os_unfair_lock_opaque, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SASButtonIdentifierTransport alloc];
    objc_msgSend(v10, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SASButtonIdentifierTransport initWithString:](v6, "initWithString:", v7);
    objc_msgSend(v5, "cancelPrewarmFromButtonIdentifier:", v8);

    -[os_unfair_lock_s lock_activityAssertions](v4, "lock_activityAssertions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v10);

    os_unfair_lock_unlock(v4 + 4);
  }

}

- (void)setupHintGlowTimerIfNeededWithButtonIdentifier:(id)a3 buttonContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSTimer *v13;
  NSTimer *saeHintGlowTimer;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_saeHintGlowTimer)
  {
    v8 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SiriLongPressButtonSource setupHintGlowTimerIfNeededWithButtonIdentifier:buttonContext:]";
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation setup hint glow activation timer", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x1E0C99E88];
    -[SiriLongPressButtonSource hintGlowTimeIntervalInMs](self, "hintGlowTimeIntervalInMs");
    v15[0] = CFSTR("buttonIdentifier");
    v15[1] = CFSTR("buttonContext");
    v16[0] = v6;
    v16[1] = v7;
    v11 = v10 / 1000.0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_signalForHintGlow_, v12, 0, v11);
    v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    saeHintGlowTimer = self->_saeHintGlowTimer;
    self->_saeHintGlowTimer = v13;

  }
}

- (void)invalidateHintGlowTimer
{
  NSObject *v3;
  NSTimer *saeHintGlowTimer;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_saeHintGlowTimer)
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[SiriLongPressButtonSource invalidateHintGlowTimer]";
      _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation invalidate hint glow activation timer", (uint8_t *)&v5, 0xCu);
    }
    -[NSTimer invalidate](self->_saeHintGlowTimer, "invalidate");
    saeHintGlowTimer = self->_saeHintGlowTimer;
    self->_saeHintGlowTimer = 0;

  }
}

- (void)signalForHintGlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[SiriLongPressButtonSource signalForHintGlow:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation hint glow activation timer fired", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buttonIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("buttonContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHintGlowAssertionFromButtonIdentifier:context:", v7, v9);

}

- (id)prepareForActivation
{
  double (**v3)(void);
  double v4;

  -[SiriLongPressButtonSource currentTimeGenerator](self, "currentTimeGenerator");
  v3 = (double (**)(void))objc_claimAutoreleasedReturnValue();
  v4 = v3[2]();

  return -[SiriLongPressButtonSource prepareForActivationWithTimestamp:](self, "prepareForActivationWithTimestamp:", v4);
}

- (id)speechInteractionActivityWithTimestamp:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  SiriActivityAssertion *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  SiriActivityAssertion *v15;
  os_unfair_lock_s *p_lock;
  SASButtonIdentifierTransport *v17;
  void *v18;
  SASButtonIdentifierTransport *v19;
  void *v20;
  SASTimeIntervalTransport *v21;
  SASTimeIntervalTransport *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  objc_initWeak(&location, self);
  -[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:](self, "_timestampForSpeechInteractionActivityWithTimestamp:", a3);
  v6 = v5;
  -[SiriLongPressButtonSource context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setButtonDownTimestamp:", v6);

  -[SiriLongPressButtonSource context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLongPressBehavior:", -[SiriLongPressButtonSource longPressBehavior](self, "longPressBehavior"));

  -[SiriLongPressButtonSource context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [SiriActivityAssertion alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__SiriLongPressButtonSource_speechInteractionActivityWithTimestamp___block_invoke;
  v25[3] = &unk_1E91FC7F0;
  objc_copyWeak(&v27, &location);
  v14 = v9;
  v26 = v14;
  v15 = -[SiriActivityAssertion initWithIdentifier:reference:reason:timestamp:invalidationBlock:](v10, "initWithIdentifier:reference:reason:timestamp:invalidationBlock:", v12, v13, CFSTR("speechInteraction"), v25, v6);

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[NSMutableArray addObject:](self->_lock_activityAssertions, "addObject:", v15);
  v17 = [SASButtonIdentifierTransport alloc];
  -[SiriActivityAssertion reference](v15, "reference");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SASButtonIdentifierTransport initWithString:](v17, "initWithString:", v18);

  -[SiriLongPressButtonSource setupHintGlowTimerIfNeededWithButtonIdentifier:buttonContext:](self, "setupHintGlowTimerIfNeededWithButtonIdentifier:buttonContext:", v19, v14);
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [SASTimeIntervalTransport alloc];
  -[SiriActivityAssertion timestamp](v15, "timestamp");
  v22 = -[SASTimeIntervalTransport initWithTimeInterval:](v21, "initWithTimeInterval:");
  -[SiriLongPressButtonSource context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "buttonDownFromButtonIdentifier:timestamp:context:", v19, v22, v23);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
  return v15;
}

void __68__SiriLongPressButtonSource_speechInteractionActivityWithTimestamp___block_invoke(uint64_t a1, void *a2, double a3)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v6;
  void *v7;
  SASButtonIdentifierTransport *v8;
  void *v9;
  SASButtonIdentifierTransport *v10;
  void *v11;
  SASTimeIntervalTransport *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    -[os_unfair_lock_s invalidateHintGlowTimer](v6, "invalidateHintGlowTimer");
    objc_msgSend(*(id *)&v6[2]._os_unfair_lock_opaque, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [SASButtonIdentifierTransport alloc];
    objc_msgSend(v14, "reference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SASButtonIdentifierTransport initWithString:](v8, "initWithString:", v9);
    -[os_unfair_lock_s _deviceIdentifier](v6, "_deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", a3);
    objc_msgSend(v7, "buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", v10, v11, v12, *(_QWORD *)(a1 + 32));

    -[os_unfair_lock_s lock_activityAssertions](v6, "lock_activityAssertions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);

    os_unfair_lock_unlock(v6 + 4);
  }

}

- (void)didRecognizeButtonSinglePressUp
{
  os_unfair_lock_s *p_lock;
  void *v4;
  SASButtonIdentifierTransport *v5;
  SASTimeIntervalTransport *v6;
  void *v7;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
  v6 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", CFAbsoluteTimeGetCurrent());
  -[SiriLongPressButtonSource context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonTapFromButtonIdentifier:timestamp:context:", v5, v6, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)didRecognizeLongPress
{
  SiriLongPressButtonInteraction *v3;

  v3 = objc_alloc_init(SiriLongPressButtonInteraction);
  -[SiriLongPressButtonSource didRecognizeLongPressInteraction:](self, "didRecognizeLongPressInteraction:", v3);

}

- (void)didRecognizeLongPressInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double (**v19)(void);
  double v20;
  void *v21;
  void *v22;
  SASButtonIdentifierTransport *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  SASButtonIdentifierTransport *v43;
  void *v44;
  SASTimeIntervalTransport *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[SiriLongPressButtonSource context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongPressBehavior:", -[SiriLongPressButtonSource longPressBehavior](self, "longPressBehavior"));

  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    objc_msgSend(v6, "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v53 = "-[SiriLongPressButtonSource didRecognizeLongPressInteraction:]";
    v54 = 2112;
    v55 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation %@ didRecognizeLongPress", buf, 0x16u);

  }
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (-[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier") == 4)
  {
    -[SiriLongPressButtonSource context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buttonDownTimestamp");
    v12 = v11;

    if (v12 == 0.0)
    {
      -[NSMutableArray lastObject](self->_lock_activityAssertions, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("prepare"));

      if (v15)
      {
        -[NSMutableArray lastObject](self->_lock_activityAssertions, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timestamp");
        v18 = v17;

      }
      else
      {
        -[SiriLongPressButtonSource currentTimeGenerator](self, "currentTimeGenerator");
        v19 = (double (**)(void))objc_claimAutoreleasedReturnValue();
        v20 = v19[2]();

        v18 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(v20);
      }
      -[SiriLongPressButtonSource context](self, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setButtonDownTimestamp:", v18);

    }
  }
  -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
  -[SiriLongPressButtonSource context](self, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "buttonLongPressFromButtonIdentifier:context:", v23, v24);

  if (-[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier") == 2
    || -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier") == 1)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v25 = self->_lock_activityAssertions;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v48;
LABEL_13:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v29), "reason", (_QWORD)v47);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("speechInteraction"));

        if ((v31 & 1) != 0)
          break;
        if (v27 == ++v29)
        {
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v27)
            goto LABEL_13;
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:

      v32 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        -[SiriLongPressButtonSource didRecognizeLongPressInteraction:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier", (_QWORD)v47));
      v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:](self, "_timestampForSpeechInteractionActivityWithTimestamp:", CFAbsoluteTimeGetCurrent());
      v41 = v40;
      -[SiriLongPressButtonSource invalidateHintGlowTimer](self, "invalidateHintGlowTimer");
      -[BSServiceConnection remoteTarget](self->super._connection, "remoteTarget");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SASButtonIdentifierTransport initWithString:]([SASButtonIdentifierTransport alloc], "initWithString:", v25);
      -[SiriLongPressButtonSource _deviceIdentifier](self, "_deviceIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", v41);
      -[SiriLongPressButtonSource context](self, "context");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", v43, v44, v45, v46);

    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_deviceIdentifier
{
  return 0;
}

- (BOOL)_shouldReplaceSpeechInteractionActivityTimestampWithPrewarmTimestamp
{
  return -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier") == 6;
}

- (double)_timestampForSpeechInteractionActivityWithTimestamp:(double)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[SiriLongPressButtonSource _shouldReplaceSpeechInteractionActivityTimestampWithPrewarmTimestamp](self, "_shouldReplaceSpeechInteractionActivityTimestampWithPrewarmTimestamp"))
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    -[NSMutableArray lastObject](self->_lock_activityAssertions, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("prepare"));

    if (v8)
    {
      -[NSMutableArray lastObject](self->_lock_activityAssertions, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timestamp");
      v11 = v10;

      v12 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x1E0CB37E8];
        v14 = v12;
        objc_msgSend(v13, "numberWithDouble:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 136315394;
        v30 = "-[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:]";
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #zll carplay steering wheel button with previous prepare assertion, replaced timestamp with %@", (uint8_t *)&v29, 0x16u);

      }
    }
    else
    {
      v20 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        -[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      v11 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v11 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
    v16 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v16;
      objc_msgSend(v17, "numberWithDouble:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315394;
      v30 = "-[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:]";
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #zll not a carplay steering wheel button, converted passed in timestamp: %@", (uint8_t *)&v29, 0x16u);

    }
  }
  return v11;
}

- (BOOL)_sourceSupportsAutomaticConfigurationUpdates
{
  return (unint64_t)(self->_buttonIdentifier - 1) < 2;
}

- (void)requestConfigurationUpdatesBasedOnDeviceSettings
{
  SiriLongPressButtonConfigurationUpdateManager *v3;
  SiriLongPressButtonConfigurationUpdateManager *updateManager;

  if (-[SiriLongPressButtonSource _sourceSupportsAutomaticConfigurationUpdates](self, "_sourceSupportsAutomaticConfigurationUpdates"))
  {
    if (!self->_updateManager)
    {
      v3 = objc_alloc_init(SiriLongPressButtonConfigurationUpdateManager);
      updateManager = self->_updateManager;
      self->_updateManager = v3;

      -[SiriLongPressButtonConfigurationUpdateManager startManagingConfigurationFromSource:withDelegate:](self->_updateManager, "startManagingConfigurationFromSource:withDelegate:", self, self);
    }
  }
}

- (void)stopConfigurationUpdates
{
  SiriLongPressButtonConfigurationUpdateManager *updateManager;
  SiriLongPressButtonConfigurationUpdateManager *v4;

  updateManager = self->_updateManager;
  if (updateManager)
  {
    -[SiriLongPressButtonConfigurationUpdateManager stopManagingAllConfigurations](updateManager, "stopManagingAllConfigurations");
    v4 = self->_updateManager;
    self->_updateManager = 0;

  }
}

- (void)configurationUpdateManager:(id)a3 configurationDidUpdateForLongPressSource:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[SiriLongPressButtonSource delegate](self, "delegate", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[SiriLongPressButtonSource delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[SiriLongPressButtonSource delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configurationDidUpdateOnLongPressSource:", self);

    }
  }
}

- (SiriLongPressButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SiriLongPressButtonSourceDelegate)delegate
{
  return (SiriLongPressButtonSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int64_t)a3
{
  self->_buttonIdentifier = a3;
}

- (NSMutableArray)lock_activityAssertions
{
  return self->_lock_activityAssertions;
}

- (void)setLock_activityAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_lock_activityAssertions, a3);
}

- (SiriLongPressButtonContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)currentTimeGenerator
{
  return self->_currentTimeGenerator;
}

- (void)setCurrentTimeGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SiriLongPressButtonConfigurationUpdateManager)updateManager
{
  return self->_updateManager;
}

- (void)setUpdateManager:(id)a3
{
  objc_storeStrong((id *)&self->_updateManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_storeStrong(&self->_currentTimeGenerator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lock_activityAssertions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_saeHintGlowTimer, 0);
}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_36_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SiriLongPressButtonSource configureConnection]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1D132F000, a2, OS_LOG_TYPE_ERROR, "%s #activation BSServiceConnection Interrupted, re-activating %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)didRecognizeLongPressInteraction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D132F000, a1, a3, "%s #activation Board sent a long press without a Speech interaction", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_timestampForSpeechInteractionActivityWithTimestamp:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D132F000, a1, a3, "%s #activation #zll carplay steering wheel button with no previous prepare assertion", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
