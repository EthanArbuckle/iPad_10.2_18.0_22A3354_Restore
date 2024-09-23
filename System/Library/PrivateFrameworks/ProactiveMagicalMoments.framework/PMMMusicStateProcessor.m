@implementation PMMMusicStateProcessor

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  return (id)shared___sharedInstance;
}

void __32__PMMMusicStateProcessor_shared__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PMMMusicStateProcessor _init]([PMMMusicStateProcessor alloc], "_init");
  v1 = (void *)shared___sharedInstance;
  shared___sharedInstance = (uint64_t)v0;

}

- (PMMMusicStateProcessor)init
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PMMMusicStateProcessor init].cold.1();
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Create a MusicStateProcessor using [... shared]"));

  return 0;
}

- (id)_init
{
  PMMMusicStateProcessor *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PMMMusicContainer *lastPlayed;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PMMMusicContainer *lastPlayedInCar;
  uint64_t v22;
  PMMMusicContainer *v23;
  uint64_t v24;
  PMMMusicContainer *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PMMMusicStateProcessor;
  v2 = -[PMMMusicStateProcessor init](&v35, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.MagicalMoments"));
    v12 = (void *)MEMORY[0x219A1C610]();
    objc_msgSend(v11, "objectForKey:", CFSTR("lastPlayed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v13, 0);
      objc_msgSend(v14, "decodeObject");
      v15 = objc_claimAutoreleasedReturnValue();
      lastPlayed = v2->_lastPlayed;
      v2->_lastPlayed = (PMMMusicContainer *)v15;

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void *)MEMORY[0x219A1C610]();
    objc_msgSend(v11, "objectForKey:", CFSTR("lastPlayedInCar"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v18, 0);
      objc_msgSend(v19, "decodeObject");
      v20 = objc_claimAutoreleasedReturnValue();
      lastPlayedInCar = v2->_lastPlayedInCar;
      v2->_lastPlayedInCar = (PMMMusicContainer *)v20;

    }
    objc_autoreleasePoolPop(v17);
    if (!v2->_lastPlayed)
    {
      v22 = objc_opt_new();
      v23 = v2->_lastPlayed;
      v2->_lastPlayed = (PMMMusicContainer *)v22;

    }
    if (!v2->_lastPlayedInCar)
    {
      v24 = objc_opt_new();
      v25 = v2->_lastPlayedInCar;
      v2->_lastPlayedInCar = (PMMMusicContainer *)v24;

    }
    +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fetchContextValueForKeyPath:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = objc_msgSend(v28, "BOOLValue");
    else
      v29 = 0;
    -[PMMMusicStateProcessor setInCar:](v2, "setInCar:", v29);
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNowPlayingDataDictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fetchDataDictionaryForKeyPath:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingBundleIdKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v33, "isEqualToString:", CFSTR("unknown")))
        -[PMMMusicStateProcessor _handlePause](v2, "_handlePause");
      else
        -[PMMMusicStateProcessor _handlePlay](v2, "_handlePlay");

    }
    -[PMMMusicStateProcessor _initStarkConnect](v2, "_initStarkConnect");
    -[PMMMusicStateProcessor _initStarkDisconnect](v2, "_initStarkDisconnect");
    -[PMMMusicStateProcessor _initNowPlayingPause](v2, "_initNowPlayingPause");
    -[PMMMusicStateProcessor _initNowPlayingPlay](v2, "_initNowPlayingPlay");

  }
  return v2;
}

- (void)_handlePause
{
  -[PMMMusicContainer setPauseIfUnset](self->_lastPlayed, "setPauseIfUnset");
  -[PMMMusicContainer setPauseIfUnset](self->_lastPlayedInCar, "setPauseIfUnset");
  -[PMMMusicStateProcessor _persist](self, "_persist");
}

- (void)_handlePlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNowPlayingDataDictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchDataDictionaryForKeyPath:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingBundleIdKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingTrackKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "nowPlayingCreationDateKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PMMMusicContainer setPlayingWithBundleId:trackIdentifier:playTime:](self->_lastPlayed, "setPlayingWithBundleId:trackIdentifier:playTime:", v6, v8, v10);
    if (-[PMMMusicStateProcessor inCar](self, "inCar"))
      -[PMMMusicContainer setPlayingWithBundleId:trackIdentifier:playTime:](self->_lastPlayedInCar, "setPlayingWithBundleId:trackIdentifier:playTime:", v6, v8, v10);
    -[PMMMusicStateProcessor _persist](self, "_persist");

  }
}

- (void)_persist
{
  NSObject *v3;
  PMMMusicContainer *lastPlayed;
  NSObject *v5;
  PMMMusicContainer *lastPlayedInCar;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PMMMusicContainer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    lastPlayed = self->_lastPlayed;
    v11 = 138412290;
    v12 = lastPlayed;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_INFO, "Persisting playing: %@", (uint8_t *)&v11, 0xCu);
  }

  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    lastPlayedInCar = self->_lastPlayedInCar;
    v11 = 138412290;
    v12 = lastPlayedInCar;
    _os_log_impl(&dword_2188D0000, v5, OS_LOG_TYPE_INFO, "Persisting playing in car: %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = (void *)MEMORY[0x219A1C610]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.MagicalMoments"));
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_lastPlayed, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("lastPlayed"));

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_lastPlayedInCar, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("lastPlayedInCar"));

  objc_msgSend(v8, "synchronize");
  objc_autoreleasePoolPop(v7);
}

- (void)_initStarkConnect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B1A0], "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__PMMMusicStateProcessor__initStarkConnect__block_invoke;
  v8[3] = &unk_24D972690;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x219A1C784](v8);
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.ms.carplayconnect"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForNotifications:", v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __43__PMMMusicStateProcessor__initStarkConnect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    v6 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__PMMMusicStateProcessor__initStarkConnect__block_invoke_24;
    v9[3] = &unk_24D9723C8;
    v9[4] = WeakRetained;
    v10 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

id __43__PMMMusicStateProcessor__initStarkConnect__block_invoke_24(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInCar:", 1);
  return (id)objc_opt_self();
}

- (void)_initStarkDisconnect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarplayConnectedStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B1A0], "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke;
  v8[3] = &unk_24D972690;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x219A1C784](v8);
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.ms.carplaydisconnect"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForNotifications:", v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    v6 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke_29;
    v9[3] = &unk_24D9723C8;
    v9[4] = WeakRetained;
    v10 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

id __46__PMMMusicStateProcessor__initStarkDisconnect__block_invoke_29(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInCar:", 0);
  return (id)objc_opt_self();
}

- (void)_initNowPlayingPause
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNowPlayingDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B1A0], "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke;
  v8[3] = &unk_24D972690;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x219A1C784](v8);
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.ms.nowplayingpause"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForNotifications:", v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    v6 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke_32;
    v9[3] = &unk_24D9723C8;
    v9[4] = WeakRetained;
    v10 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

id __46__PMMMusicStateProcessor__initNowPlayingPause__block_invoke_32(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x219A1C610]();
  objc_msgSend(*(id *)(a1 + 32), "_handlePause");
  objc_autoreleasePoolPop(v2);
  return (id)objc_opt_self();
}

- (void)_initNowPlayingPlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNowPlayingDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B1A0], "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke;
  v8[3] = &unk_24D972690;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a2;
  v5 = (void *)MEMORY[0x219A1C784](v8);
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.ms.nowplayingplay"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForNotifications:", v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_INFO, "Identifier called: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sel_getName(*(SEL *)(a1 + 40));
    v6 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke_35;
    v9[3] = &unk_24D9723C8;
    v9[4] = WeakRetained;
    v10 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

id __45__PMMMusicStateProcessor__initNowPlayingPlay__block_invoke_35(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x219A1C610]();
  objc_msgSend(*(id *)(a1 + 32), "_handlePlay");
  objc_autoreleasePoolPop(v2);
  return (id)objc_opt_self();
}

- (void)lastPlayedWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  if (v5)
  {
    -[PMMMusicStateProcessor queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__PMMMusicStateProcessor_lastPlayedWithHandler___block_invoke;
    block[3] = &unk_24D9726B8;
    block[4] = self;
    v9 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMMMusicStateProcessor.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
}

uint64_t __48__PMMMusicStateProcessor_lastPlayedWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)lastPlayedInCarWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  if (v5)
  {
    -[PMMMusicStateProcessor queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PMMMusicStateProcessor_lastPlayedInCarWithHandler___block_invoke;
    block[3] = &unk_24D9726B8;
    block[4] = self;
    v9 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMMMusicStateProcessor.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
}

uint64_t __53__PMMMusicStateProcessor_lastPlayedInCarWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)inCar
{
  return self->_inCar;
}

- (void)setInCar:(BOOL)a3
{
  self->_inCar = a3;
}

- (PMMMusicContainer)lastPlayed
{
  return self->_lastPlayed;
}

- (void)setLastPlayed:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayed, a3);
}

- (PMMMusicContainer)lastPlayedInCar
{
  return self->_lastPlayedInCar;
}

- (void)setLastPlayedInCar:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedInCar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedInCar, 0);
  objc_storeStrong((id *)&self->_lastPlayed, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2188D0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Create a MusicStateProcessor using [... shared]", v0, 2u);
}

@end
