@implementation TCSSuggestions

- (TCSSuggestions)initWithContactStore:(id)a3 contacts:(id)a4
{
  id v7;
  id v8;
  TCSSuggestions *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *generationQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *coreRecentsQueue;
  uint64_t v16;
  NSHashTable *observers;
  uint64_t v18;
  NPSManager *npsManager;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  CNCoalescingTimer *suggestionsSaveTimer;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)TCSSuggestions;
  v9 = -[TCSSuggestions init](&v35, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.tincan.suggestions", v10);
    generationQueue = v9->_generationQueue;
    v9->_generationQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_DEFAULT, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.tincan.suggestions.recents", v13);
    coreRecentsQueue = v9->_coreRecentsQueue;
    v9->_coreRecentsQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v9->_contacts, a4);
    -[TCSContacts addObserver:](v9->_contacts, "addObserver:", v9);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v16;

    v18 = objc_opt_new();
    npsManager = v9->_npsManager;
    v9->_npsManager = (NPSManager *)v18;

    objc_msgSend(MEMORY[0x24BE192D0], "defaultProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v9);
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __48__TCSSuggestions_initWithContactStore_contacts___block_invoke;
    v32 = &unk_24CFC2448;
    objc_copyWeak(&v33, &location);
    v21 = (void *)MEMORY[0x2199B2B54](&v29);
    v22 = objc_alloc(MEMORY[0x24BE19238]);
    objc_msgSend(v20, "mainThreadScheduler", v29, v30, v31, v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithDelay:options:block:schedulerProvider:downstreamScheduler:", 1, v21, v20, v23, 0.3);
    suggestionsSaveTimer = v9->_suggestionsSaveTimer;
    v9->_suggestionsSaveTimer = (CNCoalescingTimer *)v24;

    -[TCSSuggestions setShouldObserveSuggestionsDefaultChanges:](v9, "setShouldObserveSuggestionsDefaultChanges:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v9, sel__deviceDidPair_, *MEMORY[0x24BE6B440], v27);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __48__TCSSuggestions_initWithContactStore_contacts___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_saveSuggestions");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[IDSBatchIDQueryController invalidate](self->_queryController, "invalidate");
  -[TCSContacts removeObserver:](self->_contacts, "removeObserver:", self);
  -[TCSSuggestions setShouldObserveSuggestionsDefaultChanges:](self, "setShouldObserveSuggestionsDefaultChanges:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_firstUnlockToken);
  notify_cancel(self->_npsInitialSyncToken);
  v4.receiver = self;
  v4.super_class = (Class)TCSSuggestions;
  -[TCSSuggestions dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)generateNewSuggestionsIfNecessary
{
  NSObject *generationQueue;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id location[2];

  if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
  {
    if (-[TCSSuggestions _shouldGenerateNewSuggestions](self, "_shouldGenerateNewSuggestions"))
    {
      objc_initWeak(location, self);
      generationQueue = self->_generationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__TCSSuggestions_generateNewSuggestionsIfNecessary__block_invoke;
      block[3] = &unk_24CFC2448;
      objc_copyWeak(&v8, location);
      dispatch_async(generationQueue, block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(location);
    }
  }
  else
  {
    _TCSInitializeLogging();
    v4 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_21342E000, v4, OS_LOG_TYPE_DEFAULT, "TCSSuggestions will wait for first device unlock before it checks if new suggestions should be generated.", (uint8_t *)location, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCSBehavior sharedBehavior](TCSBehavior, "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleDeviceFirstUnlock, CFSTR("TCSFirstUnlockNotification"), v6);

  }
}

void __51__TCSSuggestions_generateNewSuggestionsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_generateNewSuggestions");

}

- (NSUserDefaults)defaults
{
  NSUserDefaults *defaults;
  NSUserDefaults *v4;
  NSUserDefaults *v5;

  defaults = self->_defaults;
  if (!defaults)
  {
    +[TCSTinCanUserDefaults defaults](TCSTinCanUserDefaults, "defaults");
    v4 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaults;
    self->_defaults = v4;

    defaults = self->_defaults;
  }
  return defaults;
}

- (void)setShouldObserveSuggestionsDefaultChanges:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_shouldObserveSuggestionsDefaultChanges != a3)
  {
    v3 = a3;
    self->_shouldObserveSuggestionsDefaultChanges = a3;
    -[TCSSuggestions defaults](self, "defaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("Suggestions"), 1, TCSSuggestionsObservationContext);
    else
      objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("Suggestions"), TCSSuggestionsObservationContext);

  }
}

- (NSMutableDictionary)suggestions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *suggestions;

  if (!self->_suggestions && (objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode") & 1) == 0)
  {
    -[TCSSuggestions defaults](self, "defaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryForKey:", CFSTR("Suggestions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    if (objc_msgSend(v7, "count"))
    {
      -[TCSSuggestions _performHousekeepingOnSuggestions:](self, "_performHousekeepingOnSuggestions:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);
      if ((v9 & 1) == 0)
      {
        v10 = v8;

        v7 = v10;
      }
      v11 = v9 ^ 1;

    }
    else
    {
      v11 = 0;
    }
    v12 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
    suggestions = self->_suggestions;
    self->_suggestions = v12;

    if (v11)
      -[CNCoalescingTimer handleEvent](self->_suggestionsSaveTimer, "handleEvent");

  }
  return self->_suggestions;
}

- (NSArray)suggestedDestinations
{
  NSArray *suggestedDestinations;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  NSUInteger v11;
  NSObject *v12;
  _BOOL4 v13;
  NSArray *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  suggestedDestinations = self->_suggestedDestinations;
  if (!suggestedDestinations)
  {
    -[TCSSuggestions suggestions](self, "suggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[TCSSuggestions suggestions](self, "suggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __39__TCSSuggestions_suggestedDestinations__block_invoke;
    v19[3] = &unk_24CFC2470;
    v8 = v6;
    v20 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_suggestedDestinations;
    self->_suggestedDestinations = v9;

    v11 = -[NSArray count](self->_suggestedDestinations, "count");
    _TCSInitializeLogging();
    v12 = TCSLogDefault;
    v13 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = self->_suggestedDestinations;
        v15 = v12;
        -[NSArray componentsJoinedByString:](v14, "componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        TCSLogSafeDescription(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v17;
        _os_log_impl(&dword_21342E000, v15, OS_LOG_TYPE_DEFAULT, "TCSSuggestions has suggested destinations: %@", buf, 0xCu);

      }
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21342E000, v12, OS_LOG_TYPE_DEFAULT, "TCSSuggestions has no suggested destinations.", buf, 2u);
    }
    -[TCSSuggestions generateNewSuggestionsIfNecessary](self, "generateNewSuggestionsIfNecessary");

    suggestedDestinations = self->_suggestedDestinations;
  }
  return suggestedDestinations;
}

void __39__TCSSuggestions_suggestedDestinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Expired"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);

}

- (void)setGenerationTimerEnabled:(BOOL)a3
{
  if (self->_generationTimerEnabled != a3)
  {
    self->_generationTimerEnabled = a3;
    if (!a3)
      -[TCSSuggestions _stopGenerationTimer](self, "_stopGenerationTimer");
  }
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  uint64_t v43;
  NSMutableDictionary *suggestions;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "count"))
  {
    if ((objc_msgSend(CFSTR("com.apple.private.alloy.tincan.audio"), "isEqualToString:", v10) & 1) != 0)
    {
      if (v11)
      {
        _TCSInitializeLogging();
        v12 = TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
          -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:].cold.2((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
      else
      {
        v50 = v10;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v51 = v9;
        v27 = v9;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v57 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestedDestinationToStatus, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestedDestinationToStatus, "setObject:forKeyedSubscript:", v34, v32);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          }
          while (v29);
        }

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v36 = self->_suggestedDestinationToStatus;
        v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v53 != v39)
                objc_enumerationMutation(v36);
              v41 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestedDestinationToStatus, "objectForKeyedSubscript:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "integerValue");

              if (v43 == 1)
              {
                suggestions = self->_suggestions;
                if (!suggestions)
                {
                  v45 = -[TCSSuggestions suggestions](self, "suggestions");
                  suggestions = self->_suggestions;
                }
                -[NSMutableDictionary objectForKey:](suggestions, "objectForKey:", v41);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v46)
                {
                  _TCSInitializeLogging();
                  v47 = (void *)TCSLogDefault;
                  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
                  {
                    v48 = v47;
                    TCSLogSafeDescription(v41);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v61 = v49;
                    _os_log_impl(&dword_21342E000, v48, OS_LOG_TYPE_DEFAULT, "Adding new suggested and valid destination: %@", buf, 0xCu);

                  }
                  -[TCSSuggestions _addSuggestedDestination:withTimestamp:](self, "_addSuggestedDestination:withTimestamp:", v41, v35);
                }
              }
            }
            v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          }
          while (v38);
        }

        v10 = v50;
        v9 = v51;
        v11 = 0;
      }
    }
    else
    {
      _TCSInitializeLogging();
      v20 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
        -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:].cold.3((uint64_t)v10, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    _TCSInitializeLogging();
    v19 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:].cold.1(v19);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD v7[5];

  if ((void *)TCSSuggestionsObservationContext == a6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__TCSSuggestions_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_24CFC2498;
    v7[4] = self;
    TCSGuaranteeMainThread(v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TCSSuggestions;
    -[TCSSuggestions observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __65__TCSSuggestions_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_deleteSuggestions
{
  void *v3;
  void *v4;
  id v5;

  -[TCSSuggestions defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("Suggestions"));

  -[TCSSuggestions defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SuggestionsFirstGenerated"));

  -[TCSSuggestions defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SuggestionsPreviouslyGenerated"));

}

+ (id)_descriptorForRequiredKeys
{
  if (_descriptorForRequiredKeys_cn_once_token_8 != -1)
    dispatch_once(&_descriptorForRequiredKeys_cn_once_token_8, &__block_literal_global);
  return (id)_descriptorForRequiredKeys_cn_once_object_8;
}

void __44__TCSSuggestions__descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBACA0];
  v1 = *MEMORY[0x24BDBA308];
  v7[0] = *MEMORY[0x24BDBA2E0];
  v7[1] = v1;
  v2 = *MEMORY[0x24BDBA288];
  v7[2] = *MEMORY[0x24BDBA348];
  v7[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TCSSuggestions _descriptorForRequiredKeys]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_descriptorForRequiredKeys_cn_once_object_8;
  _descriptorForRequiredKeys_cn_once_object_8 = v5;

}

- (void)_handleDeviceFirstUnlock
{
  NSObject *v3;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSSuggestions was notified of first device unlock.", v4, 2u);
  }
  -[TCSSuggestions generateNewSuggestionsIfNecessary](self, "generateNewSuggestionsIfNecessary");
}

- (void)_invalidate
{
  NSMutableDictionary *suggestions;
  NSArray *suggestedDestinations;

  suggestions = self->_suggestions;
  self->_suggestions = 0;

  suggestedDestinations = self->_suggestedDestinations;
  self->_suggestedDestinations = 0;

  -[TCSSuggestions _notifyObserversSuggestionsChanged](self, "_notifyObserversSuggestionsChanged");
}

- (BOOL)_shouldGenerateNewSuggestions
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode"))
  {
    _TCSInitializeLogging();
    v3 = TCSLogDefault;
    v4 = 0;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "Suggestions are not generated while running in store demo mode.", buf, 2u);
      return 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCSSuggestions defaults](self, "defaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("SuggestionsFirstGenerated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", v7);
      if (v8 <= 31536000.0)
      {
        -[TCSSuggestions defaults](self, "defaults");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("SuggestionsPreviouslyGenerated"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (objc_msgSend(v5, "timeIntervalSinceDate:", v11), v12 < 86400.0))
        {
          if (!-[NSTimer isValid](self->_suggestionGenerationTimer, "isValid"))
          {
            objc_msgSend(v11, "dateByAddingTimeInterval:", 86400.0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[TCSSuggestions _startGenerationTimerWithFireDate:](self, "_startGenerationTimerWithFireDate:", v13);

          }
          v4 = 0;
        }
        else
        {
          _TCSInitializeLogging();
          v14 = TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_21342E000, v14, OS_LOG_TYPE_DEFAULT, "Suggestions will be generated.", v16, 2u);
          }
          v4 = 1;
        }

      }
      else
      {
        -[TCSSuggestions _stopGenerationTimer](self, "_stopGenerationTimer");
        v4 = 0;
      }
    }
    else
    {
      _TCSInitializeLogging();
      v9 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_21342E000, v9, OS_LOG_TYPE_DEFAULT, "Suggestions will be generated for the first time.", v17, 2u);
      }
      v4 = 1;
    }

  }
  return v4;
}

- (void)_startGenerationTimerWithFireDate:(id)a3
{
  id v4;
  id v5;
  NSTimer *v6;
  NSTimer *suggestionGenerationTimer;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  -[TCSSuggestions _stopGenerationTimer](self, "_stopGenerationTimer");
  if (self->_generationTimerEnabled)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc(MEMORY[0x24BDBCF40]);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __52__TCSSuggestions__startGenerationTimerWithFireDate___block_invoke;
    v12 = &unk_24CFC2500;
    objc_copyWeak(&v13, &location);
    v6 = (NSTimer *)objc_msgSend(v5, "initWithFireDate:interval:repeats:block:", v4, 0, &v9, 0.0);
    suggestionGenerationTimer = self->_suggestionGenerationTimer;
    self->_suggestionGenerationTimer = v6;

    -[NSTimer setTolerance:](self->_suggestionGenerationTimer, "setTolerance:", 300.0, v9, v10, v11, v12);
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTimer:forMode:", self->_suggestionGenerationTimer, *MEMORY[0x24BDBCA90]);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __52__TCSSuggestions__startGenerationTimerWithFireDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "generateNewSuggestionsIfNecessary");

}

- (void)_stopGenerationTimer
{
  NSTimer *suggestionGenerationTimer;
  NSTimer *v4;

  suggestionGenerationTimer = self->_suggestionGenerationTimer;
  if (suggestionGenerationTimer)
  {
    -[NSTimer invalidate](suggestionGenerationTimer, "invalidate");
    v4 = self->_suggestionGenerationTimer;
    self->_suggestionGenerationTimer = 0;

  }
}

- (void)_generateNewSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  TCSSuggestions *val;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCSSuggestions _destinationsFromFavorites](self, "_destinationsFromFavorites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[TCSSuggestions _destinationsFromCallHistory](self, "_destinationsFromCallHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[TCSSuggestions _destinationsFromCoreRecents](self, "_destinationsFromCoreRecents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  -[TCSSuggestions _updateGenerationTimestamps](self, "_updateGenerationTimestamps");
  v7 = objc_msgSend(v3, "count");
  _TCSInitializeLogging();
  v8 = TCSLogDefault;
  v9 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    val = self;
    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = v8;
      objc_msgSend(v10, "numberWithUnsignedInteger:", v7, self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = &stru_24CFC2D40;
      if (v7 > 1)
        v15 = CFSTR("s");
      *(_DWORD *)buf = 138412546;
      v36 = v13;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_21342E000, v11, OS_LOG_TYPE_DEFAULT, "Gathered %@ suggested destination%@ total:", buf, 0x16u);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v3;
    v16 = v3;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          _TCSInitializeLogging();
          v22 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            TCSLogSafeDescription(v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v36 = (uint64_t)v24;
            _os_log_impl(&dword_21342E000, v23, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }

    objc_initWeak((id *)buf, val);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__TCSSuggestions__generateNewSuggestions__block_invoke;
    block[3] = &unk_24CFC2528;
    objc_copyWeak(&v29, (id *)buf);
    v28 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
    v3 = v26;
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21342E000, v8, OS_LOG_TYPE_DEFAULT, "Suggestion generation pass gathered no suggestions.", buf, 2u);
  }

}

void __41__TCSSuggestions__generateNewSuggestions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performIDQueryForSuggestions:", *(_QWORD *)(a1 + 32));

}

- (void)_updateGenerationTimestamps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TCSSuggestions defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SuggestionsFirstGenerated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[TCSSuggestions defaults](self, "defaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("SuggestionsFirstGenerated"));

  }
  -[TCSSuggestions defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("SuggestionsPreviouslyGenerated"));

  objc_msgSend(v8, "dateByAddingTimeInterval:", 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCSSuggestions _startGenerationTimerWithFireDate:](self, "_startGenerationTimerWithFireDate:", v7);

}

- (void)_saveSuggestions
{
  void *v3;
  void *v4;
  NSMutableDictionary *suggestions;
  void *v6;

  -[TCSSuggestions setShouldObserveSuggestionsDefaultChanges:](self, "setShouldObserveSuggestionsDefaultChanges:", 0);
  -[TCSSuggestions defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  suggestions = self->_suggestions;
  if (suggestions)
  {
    objc_msgSend(v3, "setObject:forKey:", suggestions, CFSTR("Suggestions"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Suggestions"));

  }
  -[TCSSuggestions setShouldObserveSuggestionsDefaultChanges:](self, "setShouldObserveSuggestionsDefaultChanges:", 1);
  -[TCSSuggestions _syncSuggestions](self, "_syncSuggestions");
}

- (void)_syncSuggestions
{
  NPSManager *npsManager;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  if (NPSHasCompletedInitialSync())
  {
    npsManager = self->_npsManager;
    v4 = (void *)MEMORY[0x24BDBCF20];
    v12[0] = CFSTR("Suggestions");
    v12[1] = CFSTR("SuggestionsFirstGenerated");
    v12[2] = CFSTR("SuggestionsPreviouslyGenerated");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeUserDefaultsDomain:keys:](npsManager, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.tincan"), v6);

  }
  else
  {
    objc_initWeak(&location, self);
    v7 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6B2D0], "UTF8String");
    v8 = MEMORY[0x24BDAC9B8];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__TCSSuggestions__syncSuggestions__block_invoke;
    v9[3] = &unk_24CFC2550;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch(v7, &self->_npsInitialSyncToken, MEMORY[0x24BDAC9B8], v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __34__TCSSuggestions__syncSuggestions__block_invoke(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  _DWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3] == a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_syncSuggestions");
    notify_cancel(v4[3]);
    WeakRetained = v4;
  }

}

- (void)_addSuggestedDestination:(id)a3 withTimestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *suggestedDestinations;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[TCSSuggestions suggestions](self, "suggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("Added");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

  -[CNCoalescingTimer handleEvent](self->_suggestionsSaveTimer, "handleEvent");
  suggestedDestinations = self->_suggestedDestinations;
  self->_suggestedDestinations = 0;

  -[TCSSuggestions _notifyObserversSuggestionsChanged](self, "_notifyObserversSuggestionsChanged");
}

- (id)_performHousekeepingOnSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  TCSSuggestions *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__TCSSuggestions__performHousekeepingOnSuggestions___block_invoke;
  v12[3] = &unk_24CFC2578;
  v13 = v6;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v15;
  v10 = v7;

  return v10;
}

void __52__TCSSuggestions__performHousekeepingOnSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  __CFString **v11;
  __CFString *v12;
  __CFString *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Added"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v6);
    v8 = v7 >= 7776000.0;
  }
  else
  {
    v8 = 0;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "isDestinationAccepted:", v14) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "isDestinationAnInviter:", v14);
    if ((v8 | v9) != 1)
      goto LABEL_13;
  }
  v10 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("Expired"));
  if ((v8 | v9) == 1)
  {
    v11 = TCSDefaultsSuggestionExpiryReasonAgedOut;
    if (!v8)
      v11 = TCSDefaultsSuggestionExpiryReasonInviter;
    v12 = *v11;
  }
  else
  {
    +[TCSTinCanUserDefaults suggestionExpiryReasonAllowlistedValue](TCSTinCanUserDefaults, "suggestionExpiryReasonAllowlistedValue");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("ExpiryReason"));
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v10, v14);

LABEL_13:
}

- (id)_destinationsFromFavorites
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBAD20]);
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "initWithContactStore:", v4);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "entries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "contactProperty");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v2, "count");
  if (v14)
  {
    v15 = v14;
    v33 = v5;
    _TCSInitializeLogging();
    v16 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      v18 = v16;
      objc_msgSend(v17, "numberWithUnsignedInteger:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = &stru_24CFC2D40;
      if (v15 > 1)
        v22 = CFSTR("s");
      *(_DWORD *)buf = 138412546;
      v44 = v20;
      v45 = 2112;
      v46 = v22;
      _os_log_impl(&dword_21342E000, v18, OS_LOG_TYPE_DEFAULT, "Gathered %@ destination%@ from Favorites:", buf, 0x16u);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v2;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          _TCSInitializeLogging();
          v29 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            TCSLogSafeDescription(v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v44 = (uint64_t)v31;
            _os_log_impl(&dword_21342E000, v30, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v25);
    }

    v5 = v33;
  }

  return v2;
}

- (id)_destinationsFromCallHistory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  const __CFString *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCSSuggestions defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SuggestionsPreviouslyGenerated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v43 = v10;
  v44 = v5;
  objc_msgSend(v5, "laterDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLimitingStartDate:", v11);

  objc_msgSend(v4, "setCoalescingStrategy:", *MEMORY[0x24BE149C0]);
  v45 = v4;
  objc_msgSend(v4, "recentCalls");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v12)
  {
    v13 = v12;
    v47 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v57 != v47)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v15, "remoteParticipantHandles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v53 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
              if (objc_msgSend(v21, "type") == 2 || objc_msgSend(v21, "type") == 3)
              {
                objc_msgSend(v21, "value");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v23);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
          }
          while (v18);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v13);
  }
  v24 = objc_msgSend(v3, "count");
  if (v24)
  {
    v25 = v24;
    _TCSInitializeLogging();
    v26 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)MEMORY[0x24BDD16E0];
      v28 = v26;
      objc_msgSend(v27, "numberWithUnsignedInteger:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = &stru_24CFC2D40;
      if (v25 > 1)
        v32 = CFSTR("s");
      *(_DWORD *)buf = 138412546;
      v62 = v30;
      v63 = 2112;
      v64 = v32;
      _os_log_impl(&dword_21342E000, v28, OS_LOG_TYPE_DEFAULT, "Gathered %@ destination%@ from Call History:", buf, 0x16u);

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v33 = v3;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v49 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
          _TCSInitializeLogging();
          v39 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            TCSLogSafeDescription(v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v62 = (uint64_t)v41;
            _os_log_impl(&dword_21342E000, v40, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v35);
    }

  }
  return v3;
}

- (id)_destinationsFromCoreRecents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  OS_dispatch_queue *coreRecentsQueue;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v48;
  void *v49;
  void *v50;
  id obj;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  NSObject *v63;
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  const __CFString *v68;
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[5];

  v71[2] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE27DF0], "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x24BE27DF8];
  v6 = *MEMORY[0x24BE27DC0];
  v7 = (void *)*MEMORY[0x24BE27D98];
  v8 = (void *)*MEMORY[0x24BE27DA8];
  v71[0] = *MEMORY[0x24BE27D98];
  v71[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForKey:inCollection:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchPredicate:", v10);

  v11 = *MEMORY[0x24BE27DD0];
  v70[0] = *MEMORY[0x24BE27DE0];
  v70[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomains:", v12);

  objc_msgSend(MEMORY[0x24BE27E00], "frecencyComparator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComparator:", v13);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_semaphore_create(0);
  coreRecentsQueue = self->_coreRecentsQueue;
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __46__TCSSuggestions__destinationsFromCoreRecents__block_invoke;
  v61[3] = &unk_24CFC25A0;
  v17 = v14;
  v62 = v17;
  v18 = v15;
  v63 = v18;
  v49 = v4;
  v50 = v3;
  objc_msgSend(v3, "performRecentsSearch:queue:completion:", v4, coreRecentsQueue, v61);
  v48 = v18;
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v17;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v58 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v23, "kind");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", v24))
        {

        }
        else
        {
          objc_msgSend(v23, "kind");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v8, "isEqualToString:", v25);

          if (!v26)
            continue;
        }
        objc_msgSend(v23, "address");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addObject:", v28);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v20);
  }

  v29 = objc_msgSend(v52, "count");
  if (v29)
  {
    v30 = v29;
    _TCSInitializeLogging();
    v31 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)MEMORY[0x24BDD16E0];
      v33 = v31;
      objc_msgSend(v32, "numberWithUnsignedInteger:", v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      TCSLogSafeDescription(v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      v37 = &stru_24CFC2D40;
      if (v30 > 1)
        v37 = CFSTR("s");
      *(_DWORD *)buf = 138412546;
      v66 = v35;
      v67 = 2112;
      v68 = v37;
      _os_log_impl(&dword_21342E000, v33, OS_LOG_TYPE_DEFAULT, "Gathered %@ destination%@ from CoreRecents:", buf, 0x16u);

    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v38 = v52;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v54 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          _TCSInitializeLogging();
          v44 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            v45 = v44;
            TCSLogSafeDescription(v43);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v46;
            _os_log_impl(&dword_21342E000, v45, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v40);
    }

  }
  return v52;
}

void __46__TCSSuggestions__destinationsFromCoreRecents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count", (_QWORD)v9) > 0x1F)
        break;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_performIDQueryForSuggestions:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *suggestedDestinationToStatus;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  IDSBatchIDQueryController *v15;
  IDSBatchIDQueryController *queryController;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IDSBatchIDQueryController invalidate](self->_queryController, "invalidate");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  suggestedDestinationToStatus = self->_suggestedDestinationToStatus;
  self->_suggestedDestinationToStatus = v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12), (_QWORD)v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestedDestinationToStatus, "setObject:forKeyedSubscript:", &unk_24CFC7C48, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v10);
  }

  v14 = objc_alloc(MEMORY[0x24BE4FBF0]);
  v15 = (IDSBatchIDQueryController *)objc_msgSend(v14, "initWithService:delegate:queue:", CFSTR("com.apple.private.alloy.tincan.audio"), self, MEMORY[0x24BDAC9B8]);
  queryController = self->_queryController;
  self->_queryController = v15;

  -[IDSBatchIDQueryController setDestinations:](self->_queryController, "setDestinations:", v7);
  v17 = objc_msgSend(v7, "count");
  _TCSInitializeLogging();
  v18 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    v20 = v18;
    objc_msgSend(v19, "numberWithUnsignedInteger:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    TCSLogSafeDescription(v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = &stru_24CFC2D40;
    if (v17 > 1)
      v24 = CFSTR("s");
    *(_DWORD *)buf = 138412546;
    v30 = v22;
    v31 = 2112;
    v32 = v24;
    _os_log_impl(&dword_21342E000, v20, OS_LOG_TYPE_DEFAULT, "IDS status query initiated for %@ suggested destination%@.", buf, 0x16u);

  }
}

- (void)_notifyObserversSuggestionsChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "suggestionsDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_deviceDidPair:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _TCSInitializeLogging();
  v4 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21342E000, v4, OS_LOG_TYPE_DEFAULT, "Device did pair. Will check to see if we need to generate Walkie-Talkie suggested contacts.", v5, 2u);
  }
  -[TCSSuggestions generateNewSuggestionsIfNecessary](self, "generateNewSuggestionsIfNecessary");
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (TCSContacts)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (void)setSuggestedDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedDestinations, a3);
}

- (BOOL)generationTimerEnabled
{
  return self->_generationTimerEnabled;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (BOOL)shouldObserveSuggestionsDefaultChanges
{
  return self->_shouldObserveSuggestionsDefaultChanges;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_suggestedDestinations, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_suggestedDestinationToStatus, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_suggestionGenerationTimer, 0);
  objc_storeStrong((id *)&self->_suggestionsSaveTimer, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_coreRecentsQueue, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
}

- (void)batchQueryController:(os_log_t)log updatedDestinationsStatus:onService:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21342E000, log, OS_LOG_TYPE_ERROR, "IDS status query returned an empty status update!", v1, 2u);
}

- (void)batchQueryController:(uint64_t)a3 updatedDestinationsStatus:(uint64_t)a4 onService:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21342E000, a2, a3, "IDS status query returned returned an error: %@", a5, a6, a7, a8, 2u);
}

- (void)batchQueryController:(uint64_t)a3 updatedDestinationsStatus:(uint64_t)a4 onService:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21342E000, a2, a3, "IDS status query returned results for service %@ which we do not care about.", a5, a6, a7, a8, 2u);
}

@end
