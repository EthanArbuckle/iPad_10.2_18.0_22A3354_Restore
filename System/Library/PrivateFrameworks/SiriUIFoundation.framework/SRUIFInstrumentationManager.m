@implementation SRUIFInstrumentationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  return (id)sharedManager_sharedManager;
}

void __44__SRUIFInstrumentationManager_sharedManager__block_invoke()
{
  SRUIFInstrumentationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SRUIFInstrumentationManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (SRUIFInstrumentationManager)init
{
  SRUIFInstrumentationManager *v2;
  SRUIFInstrumentationManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *instrumentationManagerQueue;
  uint64_t v7;
  NSUserDefaults *userDefaults;
  uint64_t v9;
  NSMutableDictionary *cardInfo;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SRUIFInstrumentationManager;
  v2 = -[SRUIFInstrumentationManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentSiriUIState = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.siri.SerialInstrumentationManagerQueue", v4);
    instrumentationManagerQueue = v3->_instrumentationManagerQueue;
    v3->_instrumentationManagerQueue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.SiriViewService"));
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v7;

    v3->_shouldInstrument = 1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    cardInfo = v3->_cardInfo;
    v3->_cardInfo = (NSMutableDictionary *)v9;

  }
  return v3;
}

- (void)storeCurrentInstrumentationTurnContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "turnIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[SRUIFInstrumentationManager storeCurrentInstrumentationTurnContext:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New turn provided %@", buf, 0x16u);

  }
  -[SRUIFInstrumentationManager setPreviousInstrumentationTurnContext:](self, "setPreviousInstrumentationTurnContext:", self->_currentInstrumentationTurnContext);
  -[SRUIFInstrumentationManager setCurrentInstrumentationTurnContext:](self, "setCurrentInstrumentationTurnContext:", v4);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SRUIFInstrumentationManager_storeCurrentInstrumentationTurnContext___block_invoke;
  block[3] = &unk_24DC1A838;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__SRUIFInstrumentationManager_storeCurrentInstrumentationTurnContext___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "turnIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LastStoredInstrumentationTurn"));

    objc_msgSend(v6[6], "synchronize");
    WeakRetained = v6;
  }

}

- (void)_storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn
{
  NSObject *v3;
  void *v4;
  NSObject *instrumentationManagerQueue;
  _QWORD block[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v9[5], "turnIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[SRUIFInstrumentationManager _storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New turn produced output %@", buf, 0x16u);

  }
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__SRUIFInstrumentationManager__storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn__block_invoke;
  block[3] = &unk_24DC1B618;
  objc_copyWeak(&v7, &location);
  block[4] = &v8;
  dispatch_async(instrumentationManagerQueue, block);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
}

void __99__SRUIFInstrumentationManager__storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    v6 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "turnIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LatestResponseProducingTurnIdentifier"));

    objc_msgSend(v6[6], "synchronize");
    WeakRetained = v6;
  }

}

- (id)latestStoredTurn
{
  void *v2;
  void *v3;

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("LastStoredInstrumentationTurn"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);

  return v3;
}

- (id)latestResponseProducingTurn
{
  void *v2;
  void *v3;

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("LatestResponseProducingTurnIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);

  return v3;
}

- (void)hostWillResignActive
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SRUIFInstrumentationManager hostWillResignActive]";
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation", (uint8_t *)&v3, 0xCu);
  }
}

- (void)hostDidBecomeActive
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SRUIFInstrumentationManager hostDidBecomeActive]";
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation", (uint8_t *)&v3, 0xCu);
  }
}

- (id)cardIDforSnippetAceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cardInfo, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cardInfo, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setDialogIdentifiers:(id)a3 forAceViewSpeakableTextWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *aceViewDialogIdentifiers;
  NSObject *instrumentationManagerQueue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id location;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v20 = v7;
  v21[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v9);
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  aceViewDialogIdentifiers = self->_aceViewDialogIdentifiers;
  self->_aceViewDialogIdentifiers = v10;

  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__SRUIFInstrumentationManager_setDialogIdentifiers_forAceViewSpeakableTextWithIdentifier___block_invoke;
  block[3] = &unk_24DC1A7C0;
  objc_copyWeak(&v18, &location);
  v16 = v7;
  v17 = v6;
  v13 = v6;
  v14 = v7;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __90__SRUIFInstrumentationManager_setDialogIdentifiers_forAceViewSpeakableTextWithIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    v4 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithDictionary:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)WeakRetained[4];
    WeakRetained[4] = v6;

  }
}

- (void)emitInstrumentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SRUIFInstrumentationManager_emitInstrumentation___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v13, &location);
  v11 = v4;
  v12 = v5;
  v13[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __51__SRUIFInstrumentationManager_emitInstrumentation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)emitInstrumentation:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *instrumentationManagerQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SRUIFInstrumentationManager_emitInstrumentation_atTime___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v14, &location);
  v12 = v6;
  v13 = v7;
  v14[1] = (id)a4;
  v9 = v7;
  v10 = v6;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __58__SRUIFInstrumentationManager_emitInstrumentation_atTime___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)_emitInstrumentation:(id)a3 forTurn:(id)a4 atTime:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFInstrumentationManager _emitInstrumentation:forTurn:atTime:].cold.1(v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    objc_msgSend(v11, "startedOrChanged");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 || (objc_msgSend(v11, "ended"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
      -[SRUIFInstrumentationManager setHasNotYetEmittedLaunchContextEnd:](self, "setHasNotYetEmittedLaunchContextEnd:", v12 != 0);

  }
  -[SRUIFInstrumentationManager _willInstrument:forTurn:](self, "_willInstrument:forTurn:", v8, v9);
  if (self->_shouldInstrument)
    objc_msgSend(v9, "emitInstrumentation:machAbsoluteTime:", v8, a5);

}

- (void)_willInstrument:(id)a3 forTurn:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(a4, "turnIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "-[SRUIFInstrumentationManager _willInstrument:forTurn:]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, "%s #noisy #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v10, 0x2Au);

  }
}

- (void)storeClientGeneratedDUC:(id)a3
{
  id v4;
  NSObject *instrumentationManagerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SRUIFInstrumentationManager_storeClientGeneratedDUC___block_invoke;
  block[3] = &unk_24DC1A838;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__SRUIFInstrumentationManager_storeClientGeneratedDUC___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 13;
    v5 = WeakRetained;
    v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", WeakRetained[13]);
    WeakRetained = v5;
    if ((v4 & 1) == 0)
    {
      objc_storeStrong(v3, *(id *)(a1 + 32));
      WeakRetained = v5;
    }
  }

}

- (void)storeCardID:(id)a3 forSnippetAceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *instrumentationManagerQueue;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_initWeak(&location, self);
    instrumentationManagerQueue = self->_instrumentationManagerQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__SRUIFInstrumentationManager_storeCardID_forSnippetAceID___block_invoke;
    v11[3] = &unk_24DC1A7C0;
    objc_copyWeak(&v14, &location);
    v12 = v8;
    v13 = v6;
    dispatch_async(instrumentationManagerQueue, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFInstrumentationManager storeCardID:forSnippetAceID:].cold.1((uint64_t)v6, (uint64_t)v8, v10);
  }

}

void __59__SRUIFInstrumentationManager_storeCardID_forSnippetAceID___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    v4 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithDictionary:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)WeakRetained[5];
    WeakRetained[5] = v6;

  }
}

- (void)emitUIStateTransitionEventWithFromState:(int)a3 toState:(int)a4 withPresentationType:(int)a5 machAbsoluteTransitionTime:(double)a6
{
  void *v11;
  NSObject *instrumentationManagerQueue;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  int v17;
  int v18;
  int v19;
  id location;

  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __127__SRUIFInstrumentationManager_emitUIStateTransitionEventWithFromState_toState_withPresentationType_machAbsoluteTransitionTime___block_invoke;
  v14[3] = &unk_24DC1BA38;
  objc_copyWeak(v16, &location);
  v15 = v11;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v16[1] = *(id *)&a6;
  v13 = v11;
  dispatch_async(instrumentationManagerQueue, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __127__SRUIFInstrumentationManager_emitUIStateTransitionEventWithFromState_toState_withPresentationType_machAbsoluteTransitionTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  NSObject *v7;
  id v8;
  int v9;
  BOOL v10;
  int v12;
  id v13;
  id v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_msgSend(WeakRetained, "_hasDismissedForTurnContext:", *(_QWORD *)(a1 + 32)))
    {
      v7 = objc_alloc_init(MEMORY[0x24BE95C30]);
      -[NSObject setPreviousState:](v7, "setPreviousState:", *(unsigned int *)(a1 + 56));
      -[NSObject setCurrentState:](v7, "setCurrentState:", *(unsigned int *)(a1 + 60));
      v8 = objc_alloc_init(MEMORY[0x24BE95C28]);
      -[NSObject setPresenting:](v7, "setPresenting:", v8);
      objc_msgSend(v8, "setPresentationType:", *(unsigned int *)(a1 + 64));
      objc_msgSend(v3, "setCurrentSiriUIState:", -[NSObject currentState](v7, "currentState"));
      objc_msgSend(v3, "_emitInstrumentation:forTurn:atTime:", v7, *(_QWORD *)(a1 + 32), (unint64_t)*(double *)(a1 + 48));
      v9 = *(_DWORD *)(a1 + 60);
      v10 = (v9 & 0xFFFFFFFE) != 2 && (v9 != 5 || *(_DWORD *)(a1 + 64) != 3);
      v12 = objc_msgSend(v3, "hasNotYetEmittedLaunchContextEnd");
      if (!v10 && v12)
      {
        v13 = objc_alloc_init(MEMORY[0x24BE95BE8]);
        objc_msgSend(v13, "setExists:", 1);
        v14 = objc_alloc_init(MEMORY[0x24BE95BE0]);
        objc_msgSend(v14, "setEnded:", v13);
        objc_msgSend(v3, "_emitInstrumentation:forTurn:atTime:", v14, *(_QWORD *)(a1 + 32), (unint64_t)*(double *)(a1 + 48));

      }
      goto LABEL_22;
    }
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(a1 + 56) - 1;
      if (v5 > 4)
        v6 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
      else
        v6 = off_24DC1BC38[v5];
      v15 = *(_DWORD *)(a1 + 60) - 1;
      if (v15 > 4)
        v16 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
      else
        v16 = off_24DC1BC38[v15];
      v17 = *(void **)(a1 + 32);
      v7 = v4;
      objc_msgSend(v17, "turnIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "-[SRUIFInstrumentationManager emitUIStateTransitionEventWithFromState:toState:withPresentationType:machAbsol"
            "uteTransitionTime:]_block_invoke";
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Not instrumenting state transition %@ -> %@ for turn %@ after dismissal", (uint8_t *)&v19, 0x2Au);

LABEL_22:
    }
  }

}

- (void)emitUIStateTransitionForSiriDismissalWithReason:(int)a3
{
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11[2];
  int v12;
  id location;

  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__SRUIFInstrumentationManager_emitUIStateTransitionForSiriDismissalWithReason___block_invoke;
  block[3] = &unk_24DC1BA60;
  objc_copyWeak(v11, &location);
  v12 = a3;
  v10 = v5;
  v11[1] = v6;
  v8 = v5;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __79__SRUIFInstrumentationManager_emitUIStateTransitionForSiriDismissalWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_hasDismissedForTurnContext:", *(_QWORD *)(a1 + 32));
    v3 = v10;
    if ((v4 & 1) == 0)
    {
      v5 = objc_alloc_init(MEMORY[0x24BE95C30]);
      objc_msgSend(v5, "setPreviousState:", objc_msgSend(v10, "currentSiriUIState"));
      objc_msgSend(v5, "setCurrentState:", 4);
      v6 = objc_alloc_init(MEMORY[0x24BE95C20]);
      objc_msgSend(v6, "setDismissalReason:", *(unsigned int *)(a1 + 56));
      objc_msgSend(v5, "setDismissed:", v6);
      objc_msgSend(v10, "setCurrentSiriUIState:", objc_msgSend(v5, "currentState"));
      objc_msgSend(v10, "_emitInstrumentation:forTurn:atTime:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "turnIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v10[1];
      v10[1] = v8;

      v3 = v10;
    }
  }

}

- (void)emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__SRUIFInstrumentationManager_emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v13, &location);
  v11 = v4;
  v12 = v5;
  v13[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __93__SRUIFInstrumentationManager_emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95B78]);
    objc_msgSend(v2, "setAceID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setSpeechTranscriptionType:", 1);
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  }
}

- (void)emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__SRUIFInstrumentationManager_emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v13, &location);
  v11 = v4;
  v12 = v5;
  v13[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __91__SRUIFInstrumentationManager_emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95B78]);
    objc_msgSend(v2, "setAceID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setSpeechTranscriptionType:", 2);
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  }
}

- (void)emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__SRUIFInstrumentationManager_emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v13, &location);
  v11 = v4;
  v12 = v5;
  v13[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __92__SRUIFInstrumentationManager_emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95B78]);
    objc_msgSend(v2, "setAceID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setSpeechTranscriptionType:", 3);
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  }
}

- (void)emitTextToSpeechRequestReceivedEventFor:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *instrumentationManagerQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SRUIFInstrumentationManager *v13;
  id v14;
  unint64_t v15;

  v6 = a3;
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__SRUIFInstrumentationManager_emitTextToSpeechRequestReceivedEventFor_atTime___block_invoke;
  v11[3] = &unk_24DC1BA88;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v15 = a4;
  v9 = v7;
  v10 = v6;
  dispatch_async(instrumentationManagerQueue, v11);

}

void __78__SRUIFInstrumentationManager_emitTextToSpeechRequestReceivedEventFor_atTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x24BE95B48]);
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("voice_asset_key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceAssetKey:", v2);

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("voice_resource_asset_key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceResourceAssetKey:", v3);

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("is_warm_start"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsWarmStart:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("is_synthesis_cached"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsSynthesisCached:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("source_of_tts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceOfTTS:", objc_msgSend(v6, "intValue"));

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("error_code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSpeechError:", objc_msgSend(v7, "intValue"));

  objc_msgSend(*(id *)(a1 + 40), "_emitInstrumentation:forTurn:atTime:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)emitTextToSpeechBeginEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SRUIFInstrumentationManager *v12;
  id v13;
  id v14[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SRUIFInstrumentationManager_emitTextToSpeechBeginEvent___block_invoke;
  v10[3] = &unk_24DC1BAB0;
  objc_copyWeak(v14, &location);
  v11 = v4;
  v12 = self;
  v13 = v5;
  v14[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, v10);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __58__SRUIFInstrumentationManager_emitTextToSpeechBeginEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_alloc_init(MEMORY[0x24BE95B90]);
    objc_msgSend(v3, "setAceID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_routeInfoForOutputRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE648F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE64880]))
    {
      objc_msgSend(*(id *)(a1 + 40), "_populateDefaultHardwareInformationWithRouteInfo:forTTSEvent:", v4, v3);
    }
    else if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE64890]))
    {
      objc_msgSend(*(id *)(a1 + 40), "_populateWirelessHardwareInformationWithRouteInfo:forTTSEvent:", v4, v3);
    }
    objc_msgSend(v6, "_emitInstrumentation:forTurn:atTime:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

    WeakRetained = v6;
  }

}

- (id)_routeInfoForOutputRoute
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x24BE648A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_populateDefaultHardwareInformationWithRouteInfo:(id)a3 forTTSEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "valueForKey:", *MEMORY[0x24BE648C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Speaker")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("CarAudioOutput")) & 1) == 0)
  {
    objc_msgSend(v15, "valueForKey:", *MEMORY[0x24BE648E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFInstrumentationManager _convertVirtualAudioSubTypeToString:](self, "_convertVirtualAudioSubTypeToString:", 1751410292);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    {
      -[SRUIFInstrumentationManager _convertVirtualAudioSubTypeToString:](self, "_convertVirtualAudioSubTypeToString:", 1214539380);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) == 0)
      {
        -[SRUIFInstrumentationManager _convertVirtualAudioSubTypeToString:](self, "_convertVirtualAudioSubTypeToString:", 1752709424);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v11))
        {

        }
        else
        {
          -[SRUIFInstrumentationManager _convertVirtualAudioSubTypeToString:](self, "_convertVirtualAudioSubTypeToString:", 2004367664);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v8, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
LABEL_11:

            goto LABEL_12;
          }
          v9 = objc_alloc_init(MEMORY[0x24BE95B10]);
          objc_msgSend(v15, "valueForKey:", *MEMORY[0x24BE648C8]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(&unk_24DC26548, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setInterfaceVendorID:", v14);

          objc_msgSend(v9, "setInterfaceProductID:", v10);
          objc_msgSend(v6, "setHardwareInterfaceVendorID:", v9);
        }
      }

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_populateWirelessHardwareInformationWithRouteInfo:(id)a3 forTTSEvent:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BE95B10];
  v6 = a4;
  v7 = a3;
  v12 = objc_alloc_init(v5);
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BE648C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterfaceVendorID:", v10);
  objc_msgSend(v12, "setInterfaceProductID:", v11);
  objc_msgSend(v6, "setHardwareInterfaceVendorID:", v12);

}

- (id)_convertVirtualAudioSubTypeToString:(unsigned int)a3
{
  char cStr[5];

  if (!a3)
    return 0;
  cStr[0] = HIBYTE(a3);
  cStr[1] = BYTE2(a3);
  cStr[2] = BYTE1(a3);
  cStr[3] = a3;
  cStr[4] = 0;
  return (id)(id)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0);
}

- (void)emitTextToSpeechEndEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SRUIFInstrumentationManager_emitTextToSpeechEndEvent___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v13, &location);
  v11 = v4;
  v12 = v5;
  v13[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __56__SRUIFInstrumentationManager_emitTextToSpeechEndEvent___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95B98]);
    objc_msgSend(v2, "setAceID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  }
}

- (void)emitUUFRPresentedEventWith:(id)a3 snippetClass:(id)a4 dialogIdentifier:(id)a5 dialogPhase:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *instrumentationManagerQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)mach_absolute_time();
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __100__SRUIFInstrumentationManager_emitUUFRPresentedEventWith_snippetClass_dialogIdentifier_dialogPhase___block_invoke;
  v22[3] = &unk_24DC1BAD8;
  objc_copyWeak(v28, &location);
  v23 = v10;
  v24 = v11;
  v25 = v13;
  v26 = v12;
  v27 = v14;
  v28[1] = v15;
  v17 = v14;
  v18 = v12;
  v19 = v13;
  v20 = v11;
  v21 = v10;
  dispatch_async(instrumentationManagerQueue, v22);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __100__SRUIFInstrumentationManager_emitUUFRPresentedEventWith_snippetClass_dialogIdentifier_dialogPhase___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = objc_alloc_init(MEMORY[0x24BE95C98]);
    objc_msgSend(v3, "setViewID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setSnippetClass:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "aceDialogPhaseValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDialogPhase:", v4);

    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v3, "setDialogIdentifier:");
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isErrorDialogPhase") && v7[13])
    {
      objc_msgSend(v3, "setDialogIdentifier:");
      v5 = (void *)v7[13];
      v7[13] = 0;

    }
    v6 = objc_alloc_init(MEMORY[0x24BE95C48]);
    objc_msgSend(v6, "setViewContainer:", v3);
    objc_msgSend(v7, "_emitInstrumentation:forTurn:atTime:", v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));

    WeakRetained = v7;
  }

}

- (void)emitCasinoRelationshipEventWithViewIDFrom:(id)a3 ViewIDTo:(id)a4 casinoFromType:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *instrumentationManagerQueue;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20[2];
  int v21;
  id location;

  v8 = a3;
  v9 = a4;
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__SRUIFInstrumentationManager_emitCasinoRelationshipEventWithViewIDFrom_ViewIDTo_casinoFromType___block_invoke;
  block[3] = &unk_24DC1BB00;
  objc_copyWeak(v20, &location);
  v17 = v8;
  v18 = v9;
  v21 = a5;
  v19 = v10;
  v20[1] = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __97__SRUIFInstrumentationManager_emitCasinoRelationshipEventWithViewIDFrom_ViewIDTo_casinoFromType___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95AD0]);
    objc_msgSend(v2, "setViewIDFrom:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setViewIDTo:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setCasinoFromType:", *(unsigned int *)(a1 + 72));
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

  }
}

- (void)emitUserViewRegionInteractionEventWithViewRegion:(int)a3 userViewInteraction:(int)a4
{
  void *v7;
  void *v8;
  NSObject *instrumentationManagerQueue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  int v14;
  int v15;
  id location;

  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__SRUIFInstrumentationManager_emitUserViewRegionInteractionEventWithViewRegion_userViewInteraction___block_invoke;
  block[3] = &unk_24DC1BB28;
  objc_copyWeak(v13, &location);
  v14 = a3;
  v15 = a4;
  v12 = v7;
  v13[1] = v8;
  v10 = v7;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __100__SRUIFInstrumentationManager_emitUserViewRegionInteractionEventWithViewRegion_userViewInteraction___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95C80]);
    objc_msgSend(v2, "setViewRegionDesignation:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v2, "setUserViewInteraction:", *(unsigned int *)(a1 + 60));
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (void)emitUUFRShownForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5
{
  -[SRUIFInstrumentationManager emitUUFRShownForAceObject:presentationType:dialogPhase:mode:viewRegion:](self, "emitUUFRShownForAceObject:presentationType:dialogPhase:mode:viewRegion:", a3, *(_QWORD *)&a4, a5, 0, 0);
}

- (void)emitUUFRShownForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 viewRegion:(int)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *instrumentationManagerQueue;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  SRUIFInstrumentationManager *v22;
  id v23;
  id v24;
  id v25[2];
  int v26;
  int v27;
  int v28;
  id location;

  v12 = a3;
  v13 = a5;
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__SRUIFInstrumentationManager_emitUUFRShownForAceObject_presentationType_dialogPhase_mode_viewRegion___block_invoke;
  block[3] = &unk_24DC1BB50;
  v21 = v12;
  v22 = self;
  v23 = v13;
  v26 = a4;
  v27 = a6;
  v28 = a7;
  v17 = v13;
  v18 = v12;
  objc_copyWeak(v25, &location);
  v24 = v14;
  v25[1] = v15;
  v19 = v14;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __102__SRUIFInstrumentationManager_emitUUFRShownForAceObject_presentationType_dialogPhase_mode_viewRegion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_uufrShownRequestedByInstrumentationManager:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_responseContextWithPresentationType:dialogPhase:mode:", *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 84));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSiriResponseContext:", v2);
  objc_msgSend(v9, "setViewRegionDesignation:", *(unsigned int *)(a1 + 88));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v3 = *(id *)(a1 + 32);
  if ((objc_msgSend(v3, "canUseServerTTS") & 1) == 0)
  {

    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_displayedDialogForAssistantUtteranceView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:
    v5 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v5, "_emitInstrumentation:forTurn:atTime:", v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
    goto LABEL_7;
  }
  objc_msgSend(v5, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLinkId:", v6);

  v7 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v7, "_emitInstrumentation:forTurn:atTime:", v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

  v8 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v8, "_emitInstrumentation:forTurn:atTime:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "_storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn");

}

- (id)_displayedDialogForAssistantUtteranceView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BE95C68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc(MEMORY[0x24BE95C78]);
  v7 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v8 = (void *)objc_msgSend(v6, "initWithNSUUID:", v7);

  objc_msgSend(v4, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDisplayedSiriDialogOutput:", v9);
  objc_msgSend(v5, "setLinkId:", v8);

  return v5;
}

- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6
{
  -[SRUIFInstrumentationManager emitUUFRSpokenForAceObject:presentationType:dialogPhase:mode:speakableText:](self, "emitUUFRSpokenForAceObject:presentationType:dialogPhase:mode:speakableText:", a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, &stru_24DC1C4B0);
}

- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 speakableText:(id)a7
{
  -[SRUIFInstrumentationManager emitUUFRSpokenForAceObject:presentationType:dialogPhase:mode:speakableText:dialogIdentifierOverride:](self, "emitUUFRSpokenForAceObject:presentationType:dialogPhase:mode:speakableText:dialogIdentifierOverride:", a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, 0);
}

- (void)emitUUFRSpokenForAceObject:(id)a3 presentationType:(int)a4 dialogPhase:(id)a5 mode:(int)a6 speakableText:(id)a7 dialogIdentifierOverride:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *queue;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  SRUIFInstrumentationManager *v32;
  id v33[2];
  int v34;
  int v35;
  id location;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_initWeak(&location, self);
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)mach_absolute_time();
  queue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __131__SRUIFInstrumentationManager_emitUUFRSpokenForAceObject_presentationType_dialogPhase_mode_speakableText_dialogIdentifierOverride___block_invoke;
  block[3] = &unk_24DC1BB78;
  objc_copyWeak(v33, &location);
  v34 = a4;
  v35 = a6;
  v27 = v15;
  v28 = v14;
  v29 = v16;
  v30 = v18;
  v33[1] = v19;
  v31 = v17;
  v32 = self;
  v20 = v17;
  v21 = v18;
  v22 = v16;
  v23 = v14;
  v24 = v15;
  dispatch_async(queue, block);

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __131__SRUIFInstrumentationManager_emitUUFRSpokenForAceObject_presentationType_dialogPhase_mode_speakableText_dialogIdentifierOverride___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_responseContextWithPresentationType:dialogPhase:mode:", *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 100));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "sruif__uufrSaid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "setSiriResponseContext:", v4);
          if (objc_msgSend(*(id *)(a1 + 48), "containsString:", CFSTR("\\audio=/successSonicResponse")))
          {
            objc_msgSend(v10, "setHasSonicResponse:", 1);
            if (objc_msgSend(*(id *)(a1 + 48), "containsString:", CFSTR("\\audio=/successSonicResponse&overlap")))v11 = 2;
            else
              v11 = 4;
            objc_msgSend(v10, "setSonicResponse:", v11);
          }
          objc_msgSend(v3, "_emitInstrumentation:forTurn:atTime:", v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    v12 = (void *)v3[4];
    objc_msgSend(*(id *)(a1 + 40), "aceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v14;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v20 = objc_alloc_init(MEMORY[0x24BE95C50]);
          v21 = *(void **)(a1 + 64);
          if (!v21)
            v21 = v19;
          v22 = v21;
          objc_msgSend(v20, "setDialogIdentifier:", v22);
          objc_msgSend(*(id *)(a1 + 40), "aceId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAceViewID:", v23);

          objc_msgSend(*(id *)(a1 + 40), "encodedClassName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAceViewClass:", v24);

          objc_msgSend(v20, "setSiriResponseContext:", v4);
          objc_msgSend(v3, "_emitInstrumentation:forTurn:atTime:", v20, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v16);
    }

    objc_msgSend(*(id *)(a1 + 72), "_storeCurrentInstrumentationTurnContextInLatestResponseProducingTurn");
  }

}

- (void)emitUUFRCasinoCardSelectedEventWithCardSectionID:(id)a3 ordinalCardSectionPosition:(int64_t)a4 snippetAceId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *instrumentationManagerQueue;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20[3];
  id location;

  v8 = a3;
  v9 = a5;
  v10 = (void *)mach_absolute_time();
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__SRUIFInstrumentationManager_emitUUFRCasinoCardSelectedEventWithCardSectionID_ordinalCardSectionPosition_snippetAceId___block_invoke;
  block[3] = &unk_24DC1BBA0;
  objc_copyWeak(v20, &location);
  v17 = v8;
  v18 = v9;
  v20[1] = (id)a4;
  v20[2] = v10;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __120__SRUIFInstrumentationManager_emitUUFRCasinoCardSelectedEventWithCardSectionID_ordinalCardSectionPosition_snippetAceId___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95C58]);
    v3 = objc_alloc_init(MEMORY[0x24BE95C38]);
    objc_msgSend(v3, "setCardSectionId:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setOrdinalCardSectionPosition:", *(unsigned int *)(a1 + 64));
    objc_msgSend(v3, "setSnippetAceId:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setCasinoCardSelected:", v3);
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));

  }
}

- (void)emitUserBargeInEventForBargedInTurn
{
  id v3;

  -[SRUIFInstrumentationManager previousInstrumentationTurnContext](self, "previousInstrumentationTurnContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SRUIFInstrumentationManager emitUserBargeInEventForBargedInTurn:machAbsoluteTime:](self, "emitUserBargeInEventForBargedInTurn:machAbsoluteTime:", v3, (double)mach_absolute_time());

}

- (void)emitUserBargeInEventForBargedInTurn:(id)a3 machAbsoluteTime:(double)a4
{
  id v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__SRUIFInstrumentationManager_emitUserBargeInEventForBargedInTurn_machAbsoluteTime___block_invoke;
  v9[3] = &unk_24DC1A770;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = *(id *)&a4;
  v8 = v6;
  dispatch_async(instrumentationManagerQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __84__SRUIFInstrumentationManager_emitUserBargeInEventForBargedInTurn_machAbsoluteTime___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95C10]);
    objc_msgSend(v2, "setExists:", 1);
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 32), (unint64_t)*(double *)(a1 + 48));

  }
}

- (void)processSessionEvent:(int64_t)a3 isSpeechSynthesisSpeaking:(BOOL)a4 machAbsoluteTime:(double)a5
{
  void *v9;
  NSObject *instrumentationManagerQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[3];
  BOOL v15;
  id location;

  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__SRUIFInstrumentationManager_processSessionEvent_isSpeechSynthesisSpeaking_machAbsoluteTime___block_invoke;
  v12[3] = &unk_24DC1BBC8;
  objc_copyWeak(v14, &location);
  v15 = a4;
  v14[2] = *(id *)&a5;
  v14[1] = (id)a3;
  v13 = v9;
  v11 = v9;
  dispatch_async(instrumentationManagerQueue, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __94__SRUIFInstrumentationManager_processSessionEvent_isSpeechSynthesisSpeaking_machAbsoluteTime___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 13)
    {
      if (*((_BYTE *)WeakRetained + 57))
      {
        v4 = WeakRetained;
        objc_msgSend(WeakRetained, "_resetBargeInDetectedEvent");
        goto LABEL_12;
      }
    }
    else if (v3 == 12)
    {
      if (*((_BYTE *)WeakRetained + 57))
      {
        *((_BYTE *)WeakRetained + 57) = 0;
        v4 = WeakRetained;
        objc_msgSend(WeakRetained, "emitUserBargeInEventForBargedInTurn:machAbsoluteTime:", WeakRetained[9], *((double *)WeakRetained + 8));
        objc_msgSend(v4, "_resetBargeInDetectedEvent");
        goto LABEL_12;
      }
    }
    else if (v3 == 11 && *(_BYTE *)(a1 + 64) && !*((_BYTE *)WeakRetained + 57))
    {
      *((_BYTE *)WeakRetained + 57) = 1;
      WeakRetained[8] = *(id *)(a1 + 56);
      v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 9, *(id *)(a1 + 32));
LABEL_12:
      WeakRetained = v4;
    }
  }

}

- (void)emitPunchOutEventWithURL:(id)a3 appID:(id)a4
{
  -[SRUIFInstrumentationManager emitPunchOutEventWithURL:appID:punchoutOrigin:](self, "emitPunchOutEventWithURL:appID:punchoutOrigin:", a3, a4, 0);
}

- (void)emitPunchOutEventWithURL:(id)a3 appID:(id)a4 punchoutOrigin:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *instrumentationManagerQueue;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20[2];
  int v21;
  id location;

  v8 = a3;
  v9 = a4;
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__SRUIFInstrumentationManager_emitPunchOutEventWithURL_appID_punchoutOrigin___block_invoke;
  block[3] = &unk_24DC1BB00;
  objc_copyWeak(v20, &location);
  v17 = v8;
  v18 = v9;
  v21 = a5;
  v19 = v10;
  v20[1] = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __77__SRUIFInstrumentationManager_emitPunchOutEventWithURL_appID_punchoutOrigin___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "scheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@"), v5, CFSTR("#TRUNCATED"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v8 = objc_alloc_init(MEMORY[0x24BE95B58]);
    objc_msgSend(v7, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUrlScheme:", v9);

    objc_msgSend(v8, "setAppID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v8, "setPunchOutUI:", *(unsigned int *)(a1 + 72));
    objc_msgSend(v10, "_emitInstrumentation:forTurn:atTime:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

    WeakRetained = v10;
  }

}

- (void)emitRequestFailedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *instrumentationManagerQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13[2];
  id location;

  v4 = a3;
  -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self, "currentInstrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)mach_absolute_time();
  objc_initWeak(&location, self);
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SRUIFInstrumentationManager_emitRequestFailedWithError___block_invoke;
  block[3] = &unk_24DC1BA10;
  objc_copyWeak(v13, &location);
  v11 = v4;
  v12 = v5;
  v13[1] = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(instrumentationManagerQueue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __58__SRUIFInstrumentationManager_emitRequestFailedWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE95C40]);
    objc_msgSend(v2, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setErrorDomain:", v3);

    objc_msgSend(WeakRetained, "_pnrErrorMessageWithError:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "_emitInstrumentation:forTurn:atTime:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  }
}

- (BOOL)_hasDismissedForTurnContext:(id)a3
{
  void *v4;
  void *v5;
  NSString *lastDismissedIdentifier;
  BOOL v7;
  BOOL v8;

  objc_msgSend(a3, "turnIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  lastDismissedIdentifier = self->_lastDismissedIdentifier;
  if (lastDismissedIdentifier)
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7 && -[NSString isEqualToString:](lastDismissedIdentifier, "isEqualToString:", v5);

  return v8;
}

- (id)_responseContextWithPresentationType:(int)a3 dialogPhase:(id)a4 mode:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE95B70]);
  objc_msgSend(v8, "setSiriResponseMode:", v5);
  if (v7)
  {
    objc_msgSend(v7, "aceDialogPhaseValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDialogPhase:", v9);

  }
  objc_msgSend(v8, "setPresentationType:", v6);

  return v8;
}

- (id)_pnrErrorMessageWithError:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (objc_class *)MEMORY[0x24BE95B38];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x24BE95B40]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld"), objc_msgSend(v5, "code"));
  objc_msgSend(v7, "setErrorCode:", v8);

  objc_msgSend(v5, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setErrorDomain:", v9);

  objc_msgSend(v6, "setError:", v7);
  objc_msgSend(v5, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDD1398]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SRUIFInstrumentationManager _pnrErrorMessageWithError:](self, "_pnrErrorMessageWithError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUnderlyingError:", v14);

    }
    objc_msgSend(v12, "underlyingError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "underlyingError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUnderUnderlyingError:", v16);

    }
  }

  return v6;
}

- (void)_resetBargeInDetectedEvent
{
  AFAnalyticsTurnBasedInstrumentationContext *potentialBargedInTurn;

  self->_potentialBargeInDetected = 0;
  potentialBargedInTurn = self->_potentialBargedInTurn;
  self->_potentialBargeInDetectedTime = 0.0;
  self->_potentialBargedInTurn = 0;

}

- (id)associatedDialogIdentifiersForAceObjectIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aceViewDialogIdentifiers, "objectForKeyedSubscript:", a3);
}

- (void)_prepareForTesting
{
  NSUserDefaults *userDefaults;

  userDefaults = self->_userDefaults;
  self->_userDefaults = 0;

  self->_shouldInstrument = 0;
}

- (void)_barrierWithCompletion:(id)a3
{
  id v4;
  NSObject *instrumentationManagerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  instrumentationManagerQueue = self->_instrumentationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SRUIFInstrumentationManager__barrierWithCompletion___block_invoke;
  block[3] = &unk_24DC1BBF0;
  v8 = v4;
  v6 = v4;
  dispatch_sync(instrumentationManagerQueue, block);

}

uint64_t __54__SRUIFInstrumentationManager__barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)boostQueuedMessagesAndPerformOnQueueCompletion:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  dispatch_time_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__71;
  v25[4] = __Block_byref_object_dispose__72;
  v7 = (void *)MEMORY[0x220736DE0]();
  v8 = MEMORY[0x24BDAC760];
  v26 = v7;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke;
  v24[3] = &unk_24DC1BC18;
  v24[4] = v25;
  v9 = (void *)MEMORY[0x220736DE0](v24);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_3;
  block[3] = &unk_24DC1ACD8;
  v12 = v11;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async((dispatch_queue_t)self->_instrumentationManagerQueue, v14);
  v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_74;
  v18[3] = &unk_24DC1ACD8;
  v19 = v12;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  dispatch_after(v15, MEMORY[0x24BDAC9B8], v18);

  _Block_object_dispose(v25, 8);
}

void __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_2;
  v1[3] = &unk_24DC1BC18;
  v1[4] = *(_QWORD *)(a1 + 32);
  SRUIFInvokeOnMainQueue(v1);
}

void __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(void);

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void (***)(void))(v2 + 40);
  if (v3)
  {
    v3[2]();
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(void (***)(void))(v2 + 40);
  }
  *(_QWORD *)(v2 + 40) = 0;

}

void __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_4;
  v3[3] = &unk_24DC1ACD8;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "boostQueuedEvents:", v3);

}

uint64_t __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SRUIFInstrumentationManager boostQueuedMessagesAndPerformOnQueueCompletion:timeout:]_block_invoke_4";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Flushed queued events - %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __86__SRUIFInstrumentationManager_boostQueuedMessagesAndPerformOnQueueCompletion_timeout___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SRUIFInstrumentationManager boostQueuedMessagesAndPerformOnQueueCompletion:timeout:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Instrumentation message flush timeout - %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationTurnContext
{
  return (AFAnalyticsTurnBasedInstrumentationContext *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentInstrumentationTurnContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (AFAnalyticsTurnBasedInstrumentationContext)previousInstrumentationTurnContext
{
  return (AFAnalyticsTurnBasedInstrumentationContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPreviousInstrumentationTurnContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int)currentSiriUIState
{
  return self->_currentSiriUIState;
}

- (void)setCurrentSiriUIState:(int)a3
{
  self->_currentSiriUIState = a3;
}

- (NSString)clientGeneratedDialogIdentifier
{
  return self->_clientGeneratedDialogIdentifier;
}

- (void)setClientGeneratedDialogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)hasNotYetEmittedLaunchContextEnd
{
  return self->_hasNotYetEmittedLaunchContextEnd;
}

- (void)setHasNotYetEmittedLaunchContextEnd:(BOOL)a3
{
  self->_hasNotYetEmittedLaunchContextEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientGeneratedDialogIdentifier, 0);
  objc_storeStrong((id *)&self->_previousInstrumentationTurnContext, 0);
  objc_storeStrong((id *)&self->_currentInstrumentationTurnContext, 0);
  objc_storeStrong((id *)&self->_potentialBargedInTurn, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_cardInfo, 0);
  objc_storeStrong((id *)&self->_aceViewDialogIdentifiersForMessageConstruction, 0);
  objc_storeStrong((id *)&self->_aceViewDialogIdentifiers, 0);
  objc_storeStrong((id *)&self->_instrumentationManagerQueue, 0);
  objc_storeStrong((id *)&self->_lastDismissedIdentifier, 0);
}

- (void)_emitInstrumentation:(os_log_t)log forTurn:atTime:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SRUIFInstrumentationManager _emitInstrumentation:forTurn:atTime:]";
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s #noisy #instrumentation Emit instrumentation event requested but turn context provided is nil", (uint8_t *)&v1, 0xCu);
}

- (void)storeCardID:(os_log_t)log forSnippetAceID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[SRUIFInstrumentationManager storeCardID:forSnippetAceID:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s SiriIUIInstrumentationManager: Attempted to store cardID or aceID that was nil: %@ %@", (uint8_t *)&v3, 0x20u);
}

@end
