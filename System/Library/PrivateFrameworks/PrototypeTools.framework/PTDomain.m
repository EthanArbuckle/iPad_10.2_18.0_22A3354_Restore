@implementation PTDomain

void __27__PTDomain__sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_sharedInstance___sharedInstancesByClassName;
  _sharedInstance___sharedInstancesByClassName = (uint64_t)v0;

  if (PTInstallIsAppleInternal())
  {
    +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "prototypeSettingsEnabled");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __27__PTDomain__sharedInstance__block_invoke_2;
    v20[3] = &unk_1E7058228;
    v5 = v2;
    v21 = v5;
    v6 = MEMORY[0x1E0C80D38];
    v7 = (id)objc_msgSend(v5, "observeDefault:onQueue:withBlock:", v3, MEMORY[0x1E0C80D38], v20);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "activePrototypingEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __27__PTDomain__sharedInstance__block_invoke_2_10;
    v18[3] = &unk_1E7058228;
    v9 = v5;
    v19 = v9;
    v10 = (id)objc_msgSend(v9, "observeDefault:onQueue:withBlock:", v8, v6, v18);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "remotePrototypingEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    v16[1] = 3221225472;
    v16[2] = __27__PTDomain__sharedInstance__block_invoke_2_14;
    v16[3] = &unk_1E7058228;
    v17 = v9;
    v12 = v9;
    v13 = (id)-[NSObject observeDefault:onQueue:withBlock:](v12, "observeDefault:onQueue:withBlock:", v11, v6, v16);

    v14 = (id)-[NSObject observeTestRecipeDefaultsOnQueue:withBlock:](v12, "observeTestRecipeDefaultsOnQueue:withBlock:", v6, &__block_literal_global_18);
  }
  else
  {
    PTLogObjectForTopic(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B966F000, v12, OS_LOG_TYPE_DEFAULT, "Not observing PTDefaults on customer install.", v15, 2u);
    }
  }

}

+ (id)rootSettings
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_rootSettings
{
  return self->_rootSettings;
}

+ (id)_sharedInstance
{
  void *v3;
  void *v4;

  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_0);
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstance___lock);
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_sharedInstance___sharedInstancesByClassName, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_init");
    objc_msgSend((id)_sharedInstance___sharedInstancesByClassName, "setObject:forKey:", v4, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstance___lock);

  return v4;
}

- (id)_init
{
  PTDomain *v2;
  uint64_t v3;
  PTSettings *rootSettings;
  NSMutableDictionary *v5;
  NSMutableDictionary *testRecipesByIdentifier;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTDomain;
  v2 = -[PTDomain init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rootSettingsClass")), "initWithDefaultValues");
    rootSettings = v2->_rootSettings;
    v2->_rootSettings = (PTSettings *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    testRecipesByIdentifier = v2->_testRecipesByIdentifier;
    v2->_testRecipesByIdentifier = v5;

    if (PTInstallIsAppleInternal())
    {
      -[PTDomain _updateServerConnectionStatusIfNecessary](v2, "_updateServerConnectionStatusIfNecessary");
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handlePrototypingIsActiveNotification, CFSTR("com.apple.PrototypeTools.prototyping-is-active"), 0, (CFNotificationSuspensionBehavior)0);
    }
  }
  return v2;
}

+ (void)registerTestRecipe:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (PTInstallIsAppleInternal())
  {
    objc_msgSend(a1, "_sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_registerTestRecipe:", v5);

  }
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PTLogObjectForTopic(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "prototypeSettingsEnabled");
    v4 = "disabled";
    if (v3)
      v4 = "enabled";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1B966F000, v2, OS_LOG_TYPE_DEFAULT, "Prototype settings are now %s: updating server connection status for all domains", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend((id)_sharedInstance___sharedInstancesByClassName, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_updateServerConnectionStatusIfNecessary");
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2_10(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PTLogObjectForTopic(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "activePrototypingEnabled");
    v4 = "disabled";
    if (v3)
      v4 = "enabled";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1B966F000, v2, OS_LOG_TYPE_DEFAULT, "Active prototyping is now %s: updating observation status for all domains", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend((id)_sharedInstance___sharedInstancesByClassName, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_12);
}

void __27__PTDomain__sharedInstance__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "_disableObservationIfNecessary");
  objc_msgSend(v3, "_sendProxyDefinitionIfNecessary");

}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2_14(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PTLogObjectForTopic(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "remotePrototypingEnabled");
    v4 = "disabled";
    if (v3)
      v4 = "enabled";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1B966F000, v2, OS_LOG_TYPE_DEFAULT, "Remote prototyping is now %s: sending proxy definitions as needed", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend((id)_sharedInstance___sharedInstancesByClassName, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_16);
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_sendProxyDefinitionIfNecessary");
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_2_17()
{
  return objc_msgSend((id)_sharedInstance___sharedInstancesByClassName, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_19);
}

uint64_t __27__PTDomain__sharedInstance__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_updateActiveTestRecipe");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.PrototypeTools.prototyping-is-active"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PTDomain;
  -[PTDomain dealloc](&v4, sel_dealloc);
}

- (void)updateSettingsFromArchive:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PTDomain_updateSettingsFromArchive___block_invoke;
  v6[3] = &unk_1E7058150;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __38__PTDomain_updateSettingsFromArchive___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyArchive:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_noteRegistrationCompleted");
}

- (void)restoreDefaultSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PTDomain_restoreDefaultSettings__block_invoke;
  block[3] = &unk_1E7058228;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __34__PTDomain_restoreDefaultSettings__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_restoreDefaultSettings");
  return objc_msgSend(*(id *)(a1 + 32), "_noteRegistrationCompleted");
}

- (void)setArchiveValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PTDomain_setArchiveValue_forKeyPath___block_invoke;
  block[3] = &unk_1E7058290;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __39__PTDomain_setArchiveValue_forKeyPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyArchiveValue:forKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)invokeOutletAtKeyPath:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PTDomain_invokeOutletAtKeyPath___block_invoke;
  v6[3] = &unk_1E7058150;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __34__PTDomain_invokeOutletAtKeyPath___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("putative outlet is not a PTOutlet"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("putative outlet is nil"));
  }
  objc_msgSend(v1, "_invokeActions");

}

- (void)sendActiveTestRecipeEvent:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PTDomain_sendActiveTestRecipeEvent___block_invoke;
  v3[3] = &unk_1E70582B8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __38__PTDomain_sendActiveTestRecipeEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PTPrototypingEventShortName(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v3)
    goto LABEL_9;
  if (!objc_msgSend(v3, "_wantsEvent:", *(_QWORD *)(a1 + 40)))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    {
      PTLogObjectForTopic(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "_domainID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v8;
        v13 = 2112;
        v14 = v2;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "Domain %@ received '%@' but test recipe '%@' doesn't want it", (uint8_t *)&v11, 0x20u);

      }
LABEL_11:

      goto LABEL_12;
    }
LABEL_9:
    PTLogObjectForTopic(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_domainID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v2;
      _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "Domain %@ received '%@' but there is no active test recipe", (uint8_t *)&v11, 0x16u);

    }
    goto LABEL_11;
  }
  PTLogObjectForTopic(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_domainID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = v2;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B966F000, v4, OS_LOG_TYPE_DEFAULT, "Domain %@ delivering '%@' to test recipe '%@'", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "_handleEvent:", *(_QWORD *)(a1 + 40));
LABEL_12:

}

- (id)_domainInfo
{
  PTDomainInfo *domainInfo;
  PTDomainInfo *v4;
  PTDomainInfo *v5;

  domainInfo = self->_domainInfo;
  if (!domainInfo)
  {
    v4 = -[PTDomainInfo initWithDomain:]([PTDomainInfo alloc], "initWithDomain:", self);
    v5 = self->_domainInfo;
    self->_domainInfo = v4;

    domainInfo = self->_domainInfo;
  }
  return domainInfo;
}

- (id)_domainID
{
  NSString *domainID;
  void *v4;
  NSString *v5;
  NSString *v6;

  domainID = self->_domainID;
  if (!domainID)
  {
    -[PTDomain _domainInfo](self, "_domainInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_domainID;
    self->_domainID = v5;

    domainID = self->_domainID;
  }
  return domainID;
}

- (void)_registerTestRecipe:(id)a3
{
  id v4;
  PTTestRecipeInfo *v5;
  void *v6;
  PTTestRecipeInfo *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PTDomain *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PTTestRecipeInfo alloc];
  -[PTDomain _domainInfo](self, "_domainInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PTTestRecipeInfo initWithTestRecipe:domainInfo:](v5, "initWithTestRecipe:domainInfo:", v4, v6);

  objc_msgSend(v4, "setInfo:", v7);
  -[PTTestRecipeInfo uniqueIdentifier](v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_testRecipesByIdentifier, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PTLogObjectForTopic(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PTDomain _domainID](self, "_domainID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1B966F000, v10, OS_LOG_TYPE_DEFAULT, "Domain %@: replacing test recipe with title %@", buf, 0x16u);

    }
    objc_msgSend(v9, "invalidate");
  }
  -[NSMutableDictionary setObject:forKey:](self->_testRecipesByIdentifier, "setObject:forKey:", v4, v8);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __32__PTDomain__registerTestRecipe___block_invoke;
  v21 = &unk_1E7058150;
  v22 = self;
  v13 = v8;
  v23 = v13;
  objc_msgSend(v4, "setInvalidationHandler:", &v18);
  -[PTDomain _updateActiveTestRecipe](self, "_updateActiveTestRecipe", v18, v19, v20, v21, v22);
  if (self->_registrationRequested)
  {
    PTLogObjectForTopic(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PTDomain _domainID](self, "_domainID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1B966F000, v14, OS_LOG_TYPE_DEFAULT, "Domain %@: registering test recipe %@", buf, 0x16u);

    }
    -[NSXPCConnection remoteObjectProxy](self->_serverConnection, "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerTestRecipeWithInfo:", v7);

  }
}

uint64_t __32__PTDomain__registerTestRecipe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_updateActiveTestRecipe
{
  void *v3;
  PTTestRecipe *v4;
  PTTestRecipe *v5;
  PTTestRecipe **p_activeTestRecipe;
  PTTestRecipe *activeTestRecipe;
  id v8;

  +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTestRecipeIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_testRecipesByIdentifier, "objectForKey:");
    v4 = (PTTestRecipe *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  activeTestRecipe = self->_activeTestRecipe;
  p_activeTestRecipe = &self->_activeTestRecipe;
  v5 = activeTestRecipe;
  if (activeTestRecipe != v4)
  {
    if (v5)
      -[PTTestRecipe _deactivate](v5, "_deactivate");
    objc_storeStrong((id *)p_activeTestRecipe, v4);
    if (*p_activeTestRecipe)
      -[PTTestRecipe _activate](*p_activeTestRecipe, "_activate");
  }

}

- (void)_applyArchive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PTLogObjectForTopic(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PTDomain _domainID](self, "_domainID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B966F000, v5, OS_LOG_TYPE_DEFAULT, "Domain %@: applying archive", (uint8_t *)&v7, 0xCu);

  }
  -[PTSettings _setObservationEnabled:](self->_rootSettings, "_setObservationEnabled:", 1);
  -[PTSettings restoreFromArchiveDictionary:](self->_rootSettings, "restoreFromArchiveDictionary:", v4);

  self->_archiveIsApplied = 1;
  -[PTDomain _disableObservationIfNecessary](self, "_disableObservationIfNecessary");
}

- (void)_applyArchiveValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  PTSettings *rootSettings;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  PTLogObjectForTopic(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PTDomain _domainID](self, "_domainID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B966F000, v8, OS_LOG_TYPE_DEFAULT, "Domain %@: applying archive value for keyPath %@", buf, 0x16u);

  }
  -[PTSettings _setObservationEnabled:](self->_rootSettings, "_setObservationEnabled:", 1);
  rootSettings = self->_rootSettings;
  v14 = 0;
  v11 = -[PTSettings _applyArchiveValue:forKeyPath:error:](rootSettings, "_applyArchiveValue:forKeyPath:error:", v7, v6, &v14);

  v12 = v14;
  if (v11)
  {
    self->_archiveIsApplied = 1;
  }
  else
  {
    PTLogObjectForTopic(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1B966F000, v13, OS_LOG_TYPE_DEFAULT, "   ...failed to apply archive value (%@)", buf, 0xCu);
    }

  }
  -[PTDomain _disableObservationIfNecessary](self, "_disableObservationIfNecessary");

}

- (void)_restoreDefaultSettings
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PTLogObjectForTopic(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PTDomain _domainID](self, "_domainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B966F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: restoring default values", (uint8_t *)&v5, 0xCu);

  }
  if (self->_archiveIsApplied)
  {
    -[PTSettings _setObservationEnabled:](self->_rootSettings, "_setObservationEnabled:", 1);
    -[PTSettings restoreDefaultValues](self->_rootSettings, "restoreDefaultValues");
    self->_archiveIsApplied = 0;
  }
  -[PTDomain _disableObservationIfNecessary](self, "_disableObservationIfNecessary");
}

- (void)_disableObservationIfNecessary
{
  void *v3;
  char v4;

  if (!self->_archiveIsApplied
    || (+[PTDefaults sharedInstance](PTDefaults, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "activePrototypingEnabled"),
        v3,
        (v4 & 1) == 0))
  {
    -[PTSettings _setObservationEnabled:](self->_rootSettings, "_setObservationEnabled:", 0);
  }
}

- (void)_updateServerConnectionStatusIfNecessary
{
  void *v3;
  int v4;
  NSXPCConnection *serverConnection;

  +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prototypeSettingsEnabled");

  serverConnection = self->_serverConnection;
  if (v4)
  {
    if (!serverConnection)
    {
      -[PTDomain _createConnection](self, "_createConnection");
      -[PTDomain _registerWithServerIfNecessary](self, "_registerWithServerIfNecessary");
    }
  }
  else if (serverConnection)
  {
    -[PTDomain _tearDownConnection](self, "_tearDownConnection");
    -[PTDomain _restoreDefaultSettings](self, "_restoreDefaultSettings");
  }
}

- (void)_sendProxyDefinitionIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!self->_haveSentProxyDefinition)
  {
    if (self->_serverConnection)
    {
      v3 = objc_msgSend((id)objc_opt_class(), "rootSettingsClass");
      if (v3)
      {
        v4 = v3;
        +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[PTDomain _domainInfo](self, "_domainInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "settingsFrameworkBundlePath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pathExtension");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v9 = objc_msgSend(v8, "compare:options:", CFSTR("framework"), 3) != 0;
        else
          v9 = 1;
        if ((objc_msgSend(v13, "remotePrototypingEnabled") & 1) != 0
          || (objc_msgSend(v13, "activePrototypingEnabled") & v9) == 1)
        {
          +[PTProxySettingsDefinition definitionForSettingsClass:](PTProxySettingsDefinition, "definitionForSettingsClass:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSXPCConnection remoteObjectProxy](self->_serverConnection, "remoteObjectProxy");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTDomain _domainID](self, "_domainID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "registerRootSettingsProxyDefinition:forDomainID:", v10, v12);

          self->_haveSentProxyDefinition = 1;
        }

      }
    }
  }
}

- (void)_createConnection
{
  NSObject *v3;
  void *v4;
  NSXPCConnection *v5;
  NSXPCConnection *serverConnection;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PTLogObjectForTopic(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PTDomain _domainID](self, "_domainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1B966F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: creating server connection", buf, 0xCu);

  }
  v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.PrototypeTools.domainserver"), 4096);
  serverConnection = self->_serverConnection;
  self->_serverConnection = v5;

  v7 = self->_serverConnection;
  PTDomainServerInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

  v9 = self->_serverConnection;
  PTDomainClientInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

  -[NSXPCConnection setExportedObject:](self->_serverConnection, "setExportedObject:", self);
  objc_initWeak((id *)buf, self);
  v11 = self->_serverConnection;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __29__PTDomain__createConnection__block_invoke;
  v19[3] = &unk_1E70582E0;
  objc_copyWeak(&v20, (id *)buf);
  -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v19);
  v13 = self->_serverConnection;
  v14 = v12;
  v15 = 3221225472;
  v16 = __29__PTDomain__createConnection__block_invoke_3;
  v17 = &unk_1E70582E0;
  objc_copyWeak(&v18, (id *)buf);
  -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v14);
  -[NSXPCConnection resume](self->_serverConnection, "resume", v14, v15, v16, v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __29__PTDomain__createConnection__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PTDomain__createConnection__block_invoke_2;
  block[3] = &unk_1E70582E0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __29__PTDomain__createConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");

}

void __29__PTDomain__createConnection__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PTDomain__createConnection__block_invoke_4;
  block[3] = &unk_1E70582E0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __29__PTDomain__createConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInvalidated");

}

- (void)_tearDownConnection
{
  NSObject *v3;
  void *v4;
  NSXPCConnection *serverConnection;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PTLogObjectForTopic(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PTDomain _domainID](self, "_domainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B966F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: tearing down server connection", (uint8_t *)&v6, 0xCu);

  }
  -[NSXPCConnection suspend](self->_serverConnection, "suspend");
  -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;

}

- (void)_handleConnectionInterrupted
{
  _BOOL4 registrationCompleted;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double delayBeforeRegisteringAfterInterruption;
  dispatch_time_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  registrationCompleted = self->_registrationCompleted;
  *(_WORD *)&self->_registrationRequested = 0;
  PTLogObjectForTopic(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (registrationCompleted)
  {
    if (v5)
    {
      -[PTDomain _domainID](self, "_domainID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1B966F000, v4, OS_LOG_TYPE_DEFAULT, "Domain %@: server connection interrupted, no need to reconnect", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      -[PTDomain _domainID](self, "_domainID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      delayBeforeRegisteringAfterInterruption = self->_delayBeforeRegisteringAfterInterruption;
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2048;
      v14 = delayBeforeRegisteringAfterInterruption;
      _os_log_impl(&dword_1B966F000, v4, OS_LOG_TYPE_DEFAULT, "Domain %@: server connection interrupted, will reconnect after %.1gs", buf, 0x16u);

    }
    v9 = dispatch_time(0, (uint64_t)(self->_delayBeforeRegisteringAfterInterruption * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PTDomain__handleConnectionInterrupted__block_invoke;
    block[3] = &unk_1E7058228;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __40__PTDomain__handleConnectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerWithServerIfNecessary");
}

- (void)_handleConnectionInvalidated
{
  NSXPCConnection *serverConnection;

  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;

  *(_WORD *)&self->_registrationRequested = 0;
}

- (void)_registerWithServerIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *testRecipesByIdentifier;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_serverConnection && !self->_registrationRequested)
  {
    PTLogObjectForTopic(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PTDomain _domainID](self, "_domainID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1B966F000, v3, OS_LOG_TYPE_DEFAULT, "Domain %@: registering with server", buf, 0xCu);

    }
    -[NSXPCConnection remoteObjectProxy](self->_serverConnection, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTDomain _domainInfo](self, "_domainInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerDomainWithInfo:", v6);

    testRecipesByIdentifier = self->_testRecipesByIdentifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__PTDomain__registerWithServerIfNecessary__block_invoke;
    v8[3] = &unk_1E7058308;
    v8[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](testRecipesByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
    -[PTDomain _sendProxyDefinitionIfNecessary](self, "_sendProxyDefinitionIfNecessary");
    self->_registrationRequested = 1;
    self->_delayBeforeRegisteringAfterInterruption = self->_delayBeforeRegisteringAfterInterruption + 2.0;
  }
}

void __42__PTDomain__registerWithServerIfNecessary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PTLogObjectForTopic(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1B966F000, v5, OS_LOG_TYPE_DEFAULT, "   ...registering test recipe %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerTestRecipeWithInfo:", v8);

}

- (void)_noteRegistrationCompleted
{
  self->_registrationCompleted = 1;
  self->_delayBeforeRegisteringAfterInterruption = 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTestRecipe, 0);
  objc_storeStrong((id *)&self->_testRecipesByIdentifier, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_domainInfo, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

+ (id)domainGroupName
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

+ (id)domainName
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

+ (Class)rootSettingsClass
{
  Class result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

@end
