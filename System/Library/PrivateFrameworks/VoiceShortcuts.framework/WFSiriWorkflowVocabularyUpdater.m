@implementation WFSiriWorkflowVocabularyUpdater

- (WFSiriWorkflowVocabularyUpdater)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFSiriWorkflowVocabularyUpdater *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  WFDebouncer *debouncer;
  uint64_t v18;
  NSOrderedSet *speakableStrings;
  NSObject *v20;
  WFSiriWorkflowVocabularyUpdater *v21;
  WFSiriWorkflowVocabularyUpdater *v22;
  void *v24;
  void *v25;
  _QWORD block[4];
  WFSiriWorkflowVocabularyUpdater *v27;
  id v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSiriWorkflowVocabularyUpdater.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSiriWorkflowVocabularyUpdater.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventHandler"));

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)WFSiriWorkflowVocabularyUpdater;
  v11 = -[WFSiriWorkflowVocabularyUpdater init](&v29, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = dispatch_queue_create("com.apple.shortcuts.WFSiriWorkflowVocabularyUpdater", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9D10]), "initWithDelay:maximumDelay:queue:", v11->_queue, 0.5, 15.0);
    debouncer = v11->_debouncer;
    v11->_debouncer = (WFDebouncer *)v16;

    objc_storeStrong((id *)&v11->_databaseProvider, a3);
    v18 = objc_opt_new();
    speakableStrings = v11->_speakableStrings;
    v11->_speakableStrings = (NSOrderedSet *)v18;

    -[WFDebouncer addTarget:action:](v11->_debouncer, "addTarget:action:", v11, sel_queue_debouncerDidFire);
    -[WFSiriWorkflowVocabularyUpdater queue](v11, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__WFSiriWorkflowVocabularyUpdater_initWithDatabaseProvider_eventHandler___block_invoke;
    block[3] = &unk_1E7AA8138;
    v21 = v11;
    v27 = v21;
    v28 = v10;
    dispatch_sync(v20, block);

    v22 = v21;
  }

  return v11;
}

- (void)assistantPreferencesDidChange
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)os_transaction_create();
  getWFSiriVocabLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFSiriWorkflowVocabularyUpdater assistantPreferencesDidChange]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Assistant preferences changed, requesting a vocabulary sync", (uint8_t *)&v5, 0xCu);
  }

  -[WFSiriWorkflowVocabularyUpdater updateIfPossibleWithTransaction:](self, "updateIfPossibleWithTransaction:", v3);
}

- (void)applicationWasRegistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = objc_msgSend(v9, "BOOLValue");
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    v15 = objc_msgSend(v14, "containsObject:", *MEMORY[0x1E0DC7FD8]);
    if (v15)
    {
      getWFSiriVocabLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[WFSiriWorkflowVocabularyUpdater applicationWasRegistered:]";
        _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app installed, starting observation and requesting a vocabulary sync", (uint8_t *)&v17, 0xCu);
      }

      -[WFSiriWorkflowVocabularyUpdater startIfPossible](self, "startIfPossible");
      -[WFSiriWorkflowVocabularyUpdater updateIfPossibleWithTransaction:](self, "updateIfPossibleWithTransaction:", v5);
    }
  }

}

- (void)startIfPossible
{
  NSObject *v3;
  _QWORD block[5];

  -[WFSiriWorkflowVocabularyUpdater queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WFSiriWorkflowVocabularyUpdater_startIfPossible__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateIfPossibleWithTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFSiriWorkflowVocabularyUpdater queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__WFSiriWorkflowVocabularyUpdater_updateIfPossibleWithTransaction___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)queue_startIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFSiriWorkflowVocabularyUpdater queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFSiriWorkflowVocabularyUpdater databaseProvider](self, "databaseProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "databaseWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (v5)
  {
    objc_msgSend(v5, "addObjectObserver:", self);
    getWFSiriVocabLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFSiriWorkflowVocabularyUpdater queue_startIfPossible]";
      v8 = "%s Started observing the database for vocabulary changes";
      v9 = v7;
      v10 = OS_LOG_TYPE_INFO;
      v11 = 12;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v9, v10, v8, buf, v11);
    }
  }
  else
  {
    getWFSiriVocabLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFSiriWorkflowVocabularyUpdater queue_startIfPossible]";
      v15 = 2114;
      v16 = v6;
      v8 = "%s Failed to load database, not starting observation, %{public}@";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 22;
      goto LABEL_6;
    }
  }

}

- (void)queue_debouncerDidFire
{
  id v3;

  v3 = (id)os_transaction_create();
  -[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:](self, "queue_updateIfNeededWithTransaction:", v3);

}

- (void)queue_updateIfNeededWithTransaction:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSiriWorkflowVocabularyUpdater.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

  }
  -[WFSiriWorkflowVocabularyUpdater queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[WFSiriWorkflowVocabularyUpdater databaseProvider](self, "databaseProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v7, "databaseWithError:", &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;

  if (v8)
  {
    v10 = (void *)MEMORY[0x1C3BAFA00]();
    objc_msgSend(v8, "sortedVisibleWorkflowsByLastRunOrModificationDateWithLimit:", 1000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0C99E40]);
    objc_msgSend(v12, "if_map:", &__block_literal_global_142);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

    -[WFSiriWorkflowVocabularyUpdater speakableStrings](self, "speakableStrings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToOrderedSet:", v15);

    if (v17)
    {
      getWFSiriVocabLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
        _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_INFO, "%s Not syncing vocabulary to server, the shortcut names have not changed", buf, 0xCu);
      }

    }
    else
    {
      if ((unint64_t)objc_msgSend(v15, "count") >= 0x3E9)
      {
        getWFSiriVocabLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
          _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_INFO, "%s Shortcut count >1000, some may be dropped", buf, 0xCu);
        }

      }
      getWFSiriVocabLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
        _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_DEFAULT, "%s Syncing vocabulary to server", buf, 0xCu);
      }

      -[WFSiriWorkflowVocabularyUpdater setSpeakableStrings:](self, "setSpeakableStrings:", v15);
      objc_msgSend(MEMORY[0x1E0CBDD48], "sharedVocabulary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setVocabulary:ofType:", v15, 50000);

      notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0DC8028], "UTF8String"));
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    getWFSiriVocabLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s Failed to load database, not updating vocabulary, %{public}@", buf, 0x16u);
    }

  }
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD aBlock[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)os_transaction_create();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__WFSiriWorkflowVocabularyUpdater_databaseDidChange_modified_inserted_removed___block_invoke;
  aBlock[3] = &unk_1E7AA8300;
  v15 = v14;
  v25 = v15;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((WFDatabaseChangesContainObjectType(0, v11, v17, v18, v19, v20, v21, v22, (uint64_t)v12) & 1) != 0)
  {
    -[WFSiriWorkflowVocabularyUpdater debouncer](self, "debouncer");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject poke](v23, "poke");
  }
  else
  {
    getWFSiriVocabLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFSiriWorkflowVocabularyUpdater databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_INFO, "%s Not syncing vocabulary to server, the database change contained no shortcut modifications", buf, 0xCu);
    }
  }

  v16[2](v16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (NSOrderedSet)speakableStrings
{
  return self->_speakableStrings;
}

- (void)setSpeakableStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableStrings, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

id __71__WFSiriWorkflowVocabularyUpdater_queue_updateIfNeededWithTransaction___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CBDC00];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v5, v6, 0);
  return v7;
}

uint64_t __67__WFSiriWorkflowVocabularyUpdater_updateIfPossibleWithTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateIfNeededWithTransaction:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__WFSiriWorkflowVocabularyUpdater_startIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
}

uint64_t __73__WFSiriWorkflowVocabularyUpdater_initWithDatabaseProvider_eventHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
  objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:", *(_QWORD *)(a1 + 32), sel_startIfPossible, CFSTR("com.apple.mobile.keybagd.first_unlock"));
  objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:", *(_QWORD *)(a1 + 32), sel_assistantPreferencesDidChange, CFSTR("kAFPreferencesDidChangeDarwinNotification"));
  return objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:", *(_QWORD *)(a1 + 32), sel_applicationWasRegistered_, CFSTR("ApplicationRegistered"));
}

@end
