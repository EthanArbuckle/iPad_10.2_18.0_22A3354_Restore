@implementation TISKMetricCollector

void __45__TISKMetricCollector_sessionDidEnd_aligned___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    IXADefaultLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] dequeue session"), "-[TISKMetricCollector sessionDidEnd:aligned:]_block_invoke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v6 = v4;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "handleTypingSession:", *(_QWORD *)(a1 + 32));
  }

}

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  IXADefaultLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] enqueue session"), "-[TISKMetricCollector sessionDidEnd:aligned:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v9;
    _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);

  }
  v7 = v5;
  objc_initWeak(location, self);
  objc_copyWeak(&v11, location);
  v10 = v7;
  v8 = v7;
  TIDispatchAsync();

  objc_destroyWeak(&v11);
  objc_destroyWeak(location);

}

- (void)handleTypingSession:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *savedSessionStatsArray;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSMutableArray *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_isTCCAuthorized)
  {
    IXADefaultLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] failed TCC authorization - dropping session"), "-[TISKMetricCollector handleTypingSession:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      goto LABEL_20;
    }
LABEL_17:

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    savedSessionStatsArray = self->_savedSessionStatsArray;
    self->_savedSessionStatsArray = v18;
    goto LABEL_18;
  }
  -[TISKMetricCollector dataWriter](self, "dataWriter");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[TISKMetricCollector dataWriter](self, "dataWriter"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isReady"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    IXADefaultLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] writer is not ready - dropping session"), "-[TISKMetricCollector handleTypingSession:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
LABEL_20:
      _os_log_debug_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "userActionHistory");
  savedSessionStatsArray = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(savedSessionStatsArray, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(savedSessionStatsArray);
      objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "occurenceTime");
      if (v14 < 0.0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(savedSessionStatsArray, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    v15 = +[TISKMetricDefinition metricDefinitions](TISKMetricDefinition, "metricDefinitions");
    -[TISKMetricCollector _loadStatsFromDataStore](self, "_loadStatsFromDataStore");
    -[TISKMetricCollector consumeTypingSession:](self, "consumeTypingSession:", v4);
    savedSessionStatsArray = (void *)objc_claimAutoreleasedReturnValue();
    if (savedSessionStatsArray)
    {
      -[TISKMetricCollector removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:](self, "removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:", self->_savedSessionStatsArray, v4);
      -[TISKMetricCollector processNewSessionStatsArray:](self, "processNewSessionStatsArray:", savedSessionStatsArray);
      -[TISKMetricCollector _persistSavedSessionStatsArray](self, "_persistSavedSessionStatsArray");
      -[TISKMetricCollector _clear](self, "_clear");
    }
  }
LABEL_18:

}

- (id)init:(id)a3
{
  return -[TISKMetricCollector init:wordsThreshold:accentedLanguage:](self, "init:wordsThreshold:accentedLanguage:", a3, 20, 0);
}

- (id)init:(id)a3 wordsThreshold:(unint64_t)a4
{
  return -[TISKMetricCollector init:wordsThreshold:accentedLanguage:skipTCCAuthorization:](self, "init:wordsThreshold:accentedLanguage:skipTCCAuthorization:", a3, a4, 0, 0);
}

- (id)init:(id)a3 wordsThreshold:(unint64_t)a4 accentedLanguage:(BOOL)a5
{
  return -[TISKMetricCollector init:wordsThreshold:accentedLanguage:skipTCCAuthorization:](self, "init:wordsThreshold:accentedLanguage:skipTCCAuthorization:", a3, a4, a5, 0);
}

- (id)init:(id)a3 wordsThreshold:(unint64_t)a4 accentedLanguage:(BOOL)a5 skipTCCAuthorization:(BOOL)a6
{
  id v11;
  TISKMetricCollector *v12;
  TISKMetricCollector *v13;
  NSMutableArray *currentSessionStatsArray;
  TISensorWriterWrapper *dataWriter;
  uint64_t v16;
  NSMutableArray *savedSessionStatsArray;
  uint64_t v18;
  TIUserModelDataStore *userModelDataStore;
  NSMutableArray *accentedLayoutsMap;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  NSString *identifier;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *workQueue;
  id v32;
  void *v33;
  uint64_t v34;
  NLTagger *tagger;
  NSString *previousWord;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TISKMetricCollector;
  v12 = -[TISKMetricCollector init](&v39, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_inputMode, a3);
    currentSessionStatsArray = v13->_currentSessionStatsArray;
    v13->_currentSessionStatsArray = 0;

    v13->_wordPosition = -1;
    dataWriter = v13->_dataWriter;
    v13->_dataWriter = 0;

    v13->_wordAccumulationThreshold = 8;
    if (os_variant_has_internal_ui())
      v13->_wordAccumulationThreshold = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    savedSessionStatsArray = v13->_savedSessionStatsArray;
    v13->_savedSessionStatsArray = (NSMutableArray *)v16;

    v13->_isLoaded = 0;
    objc_msgSend(MEMORY[0x1E0DBDDC0], "sharedUserModelDataStore");
    v18 = objc_claimAutoreleasedReturnValue();
    userModelDataStore = v13->_userModelDataStore;
    v13->_userModelDataStore = (TIUserModelDataStore *)v18;

    v13->_accentedLanguage = a5;
    accentedLayoutsMap = v13->_accentedLayoutsMap;
    v13->_accentedLayoutsMap = 0;

    +[TICryptographer sharedCryptographer](TICryptographer, "sharedCryptographer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputMode normalizedIdentifier](v13->_inputMode, "normalizedIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (const __CFString *)v22;
    else
      v24 = CFSTR("KEYBOARD");
    objc_msgSend(v21, "stringDigestForName:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v25;

    if (!v13->_identifier)
    {
      v13->_identifier = (NSString *)CFSTR("KEYBOARD-digest");
      IXADefaultLogFacility();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] _identifier is nil"), "-[TISKMetricCollector init:wordsThreshold:accentedLanguage:skipTCCAuthorization:]");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v38;
        _os_log_error_impl(&dword_1DA6F2000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = dispatch_queue_create("com.apple.textInput.TCCNotification", v29);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v30;

    v13->_tccNotifyToken = -1;
    v13->_isTCCAuthorized = 0;
    v13->_skipTCCAuthorization = a6;
    v32 = objc_alloc(MEMORY[0x1E0CCE168]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CCE0B8], 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithTagSchemes:", v33);
    tagger = v13->_tagger;
    v13->_tagger = (NLTagger *)v34;

    previousWord = v13->_previousWord;
    v13->_previousWord = 0;

  }
  -[TISKMetricCollector _setupTCCAuthNotification](v13, "_setupTCCAuthNotification");

  return v13;
}

- (id)loadDataWithFilename:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  int tccNotifyToken;
  objc_super v4;

  tccNotifyToken = self->_tccNotifyToken;
  if (tccNotifyToken != -1)
    notify_cancel(tccNotifyToken);
  v4.receiver = self;
  v4.super_class = (Class)TISKMetricCollector;
  -[TISKMetricCollector dealloc](&v4, sel_dealloc);
}

- (void)testTCCAuthorization
{
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  SRSensorWriterWrapper *v8;
  NSObject *dataWriter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v4 = v3;
  if (!self->_skipTCCAuthorization && !objc_msgSend(v3, "count"))
  {
    IXADefaultLogFacility();
    dataWriter = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(dataWriter, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%s [SensorKit] TCC is not authorized for input mode %@"), "-[TISKMetricCollector testTCCAuthorization]", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, dataWriter, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v6 = 0;
    goto LABEL_11;
  }
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%s [SensorKit] Got TCC authorization for input mode %@"), "-[TISKMetricCollector testTCCAuthorization]", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  if (!self->_dataWriter)
  {
    v7 = +[SRSensorWriterWrapper writerInstance](SRSensorWriterWrapper, "writerInstance");
    v8 = objc_alloc_init(SRSensorWriterWrapper);
    dataWriter = self->_dataWriter;
    self->_dataWriter = (TISensorWriterWrapper *)v8;
    v6 = 1;
LABEL_11:

    goto LABEL_12;
  }
  v6 = 1;
LABEL_12:
  self->_isTCCAuthorized = v6;

}

- (void)_setupTCCAuthNotification
{
  int *p_tccNotifyToken;
  NSObject *workQueue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t handler;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  p_tccNotifyToken = &self->_tccNotifyToken;
  workQueue = self->_workQueue;
  handler = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__TISKMetricCollector__setupTCCAuthNotification__block_invoke;
  v12 = &unk_1EA0F9D80;
  objc_copyWeak(&v13, &location);
  if (notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccNotifyToken, workQueue, &handler))
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%s [SensorKit] failed to setup notification with TCC for input mode %@"), "-[TISKMetricCollector _setupTCCAuthNotification]", v7, handler, v10, v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_error_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    *p_tccNotifyToken = -1;
  }
  else
  {
    -[TISKMetricCollector testTCCAuthorization](self, "testTCCAuthorization");
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_resetConsumeState
{
  NSMutableArray *v3;
  NSMutableArray *currentSessionStatsArray;
  NSMutableArray *v5;
  NSMutableArray *events;
  NSMutableArray *v7;
  NSMutableArray *touches;
  NSMutableArray *v9;
  NSMutableArray *layoutIDs;
  NSMutableDictionary *v11;
  NSMutableDictionary *touchToEventMap;
  NSArray *sortedEvents;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  currentSessionStatsArray = self->_currentSessionStatsArray;
  self->_currentSessionStatsArray = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  events = self->_events;
  self->_events = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  touches = self->_touches;
  self->_touches = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  layoutIDs = self->_layoutIDs;
  self->_layoutIDs = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  touchToEventMap = self->_touchToEventMap;
  self->_touchToEventMap = v11;

  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = 0;

  self->_eventOrder = 100;
}

- (void)_clear
{
  NSMutableArray *events;
  NSMutableArray *touches;
  NSMutableArray *layoutIDs;
  NSMutableDictionary *touchToEventMap;
  NSArray *sortedEvents;
  NSMutableArray *currentSessionStatsArray;
  NSMutableArray *accentedLayoutsMap;

  events = self->_events;
  self->_events = 0;

  touches = self->_touches;
  self->_touches = 0;

  layoutIDs = self->_layoutIDs;
  self->_layoutIDs = 0;

  touchToEventMap = self->_touchToEventMap;
  self->_touchToEventMap = 0;

  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = 0;

  currentSessionStatsArray = self->_currentSessionStatsArray;
  self->_currentSessionStatsArray = 0;

  accentedLayoutsMap = self->_accentedLayoutsMap;
  self->_accentedLayoutsMap = 0;

}

- (int64_t)findIndexSessionStatsFromArray:(id)a3 thatHasLayout:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  CGRect v24;
  CGRect v25;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v6, "frame");
      v25.origin.x = v18;
      v25.origin.y = v19;
      v25.size.width = v20;
      v25.size.height = v21;
      v24.origin.x = v11;
      v24.origin.y = v13;
      v24.size.width = v15;
      v24.size.height = v17;
      v22 = CGRectEqualToRect(v24, v25);

      if (v22)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = -1;
  }

  return v7;
}

- (void)setupSessionStatsForLayouts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *accentedLayoutsMap;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  NSString *identifier;
  TISKSessionStats *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[TITypingSession layouts](self->_typingSession, "layouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v29 = *(_QWORD *)v35;
    do
    {
      v6 = 0;
      v30 = v4;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v6);
        if (-[TISKMetricCollector findIndexSessionStatsFromArray:thatHasLayout:](self, "findIndexSessionStatsFromArray:thatHasLayout:", self->_currentSessionStatsArray, v7) == -1)
        {
          v33 = [TISKSessionStats alloc];
          -[TITypingSession startTime](self->_typingSession, "startTime");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[TITypingSession endTime](self->_typingSession, "endTime");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          identifier = self->_identifier;
          -[TITypingSession locale](self->_typingSession, "locale");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localeIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0C99DE8];
          -[TITypingSession sessionId](self->_typingSession, "sessionId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "arrayWithObject:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[TISKSessionStats init:endDate:identifier:version:inputMode:sessionIds:layout:](v33, "init:endDate:identifier:version:inputMode:sessionIds:layout:", v8, v9, identifier, CFSTR("v.1.0"), v11, v15, v7);

          v5 = v29;
          v4 = v30;

          -[NSMutableArray addObject:](self->_currentSessionStatsArray, "addObject:", v16);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v4);
  }

  if (self->_accentedLanguage)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    accentedLayoutsMap = self->_accentedLayoutsMap;
    self->_accentedLayoutsMap = v18;

    -[TITypingSession layouts](self->_typingSession, "layouts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v22 = 0;
      do
      {
        -[TITypingSession layouts](self->_typingSession, "layouts");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(v24, "firstKeyString"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v25);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(v17, "setObject:forKey:", v24, v25);
          v26 = v24;
        }
        -[NSMutableArray setObject:atIndexedSubscript:](self->_accentedLayoutsMap, "setObject:atIndexedSubscript:", v26, v22);

        ++v22;
        -[TITypingSession layouts](self->_typingSession, "layouts");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

      }
      while (v22 < v28);
    }

  }
}

- (id)_consumeTypingSession:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  char isKindOfClass;
  NSMutableArray *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TISKMetricCollector _resetConsumeState](self, "_resetConsumeState");
  objc_storeStrong((id *)&self->_typingSession, a3);
  -[TISKMetricCollector setupSessionStatsForLayouts](self, "setupSessionStatsForLayouts");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v5;
  objc_msgSend(v5, "userActionHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "keyboardState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "textInputTraits");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "autocorrectionType") == 1)
        {
          objc_msgSend(v11, "keyboardState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "emojiSearchMode");

          if (!v15)
            continue;
        }
        else
        {

        }
        v16 = objc_msgSend(v11, "actionType");
        if (v16 == 1)
        {
          -[TISKMetricCollector _consumeDeleteWordEvent:](self, "_consumeDeleteWordEvent:", v11);
        }
        else if (v16)
        {
          -[TISKMetricCollector _consumeUserAction:](self, "_consumeUserAction:", v11);
        }
        else
        {
          -[TISKMetricCollector _consumeWordEntry:](self, "_consumeWordEntry:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  while (1)
  {
    -[NSMutableArray lastObject](self->_events, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      break;
    -[NSMutableArray removeLastObject](self->_events, "removeLastObject");
  }
  if (-[NSMutableArray count](self->_touches, "count"))
  {
    -[TISKMetricCollector _coalesceTaps](self, "_coalesceTaps");
    -[TISKMetricCollector _mapTapsToEvents](self, "_mapTapsToEvents");
    -[TISKMetricCollector _processEvents](self, "_processEvents");
    v19 = self->_currentSessionStatsArray;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_consumeUserAction:(id)a3
{
  NSMutableArray *events;
  TISKCursorMoveEvent *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "actionType") == 2 && -[NSMutableArray count](self->_events, "count"))
  {
    events = self->_events;
    v5 = [TISKCursorMoveEvent alloc];
    objc_msgSend(v10, "occurenceTime");
    v7 = v6;
    objc_msgSend(v10, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TISKCursorMoveEvent init:emojiSearchMode:order:](v5, "init:emojiSearchMode:order:", objc_msgSend(v8, "emojiSearchMode"), self->_eventOrder, v7);
    -[NSMutableArray addObject:](events, "addObject:", v9);

    self->_eventOrder += 100;
  }

}

- (void)_consumeWordEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *touches;
  void *v9;
  NSMutableArray *layoutIDs;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "emojiSearchMode");

  objc_msgSend(v4, "allKeyboardInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "occurenceTime");
  -[TISKMetricCollector _consumeInputsAndTouches:occurenceTime:emojiSearchMode:](self, "_consumeInputsAndTouches:occurenceTime:emojiSearchMode:", v7, v6);

  -[TISKMetricCollector _consumePathsAndPredictions:emojiSearchMode:](self, "_consumePathsAndPredictions:emojiSearchMode:", v4, v6);
  touches = self->_touches;
  objc_msgSend(v4, "allTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](touches, "addObjectsFromArray:", v9);

  layoutIDs = self->_layoutIDs;
  objc_msgSend(v4, "touchLayoutsM");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObjectsFromArray:](layoutIDs, "addObjectsFromArray:", v11);
}

- (void)_consumeDeleteWordEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *touches;
  void *v9;
  NSMutableArray *layoutIDs;
  void *v11;
  NSMutableArray *events;
  TISKWordDeleteEvent *v13;

  v4 = a3;
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "emojiSearchMode");

  objc_msgSend(v4, "allKeyboardInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "occurenceTime");
  -[TISKMetricCollector _consumeInputsAndTouches:occurenceTime:emojiSearchMode:](self, "_consumeInputsAndTouches:occurenceTime:emojiSearchMode:", v7, v6);

  touches = self->_touches;
  objc_msgSend(v4, "allTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](touches, "addObjectsFromArray:", v9);

  layoutIDs = self->_layoutIDs;
  objc_msgSend(v4, "touchLayoutsM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObjectsFromArray:](layoutIDs, "addObjectsFromArray:", v11);
  events = self->_events;
  v13 = -[TISKWordDeleteEvent initWithEmojiSearchMode:order:]([TISKWordDeleteEvent alloc], "initWithEmojiSearchMode:order:", v6, self->_eventOrder);
  -[NSMutableArray addObject:](events, "addObject:", v13);

}

- (void)_consumeInputsAndTouches:(id)a3 occurenceTime:(double)a4 emojiSearchMode:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int64_t eventOrder;
  void *v14;
  void *v15;
  id v16;
  NSMutableDictionary *touchToEventMap;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  TISKEmojiInputEvent *v27;
  int64_t v28;
  NSDictionary *emojiBuckets;
  uint64_t v30;
  id obj;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v32 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = a3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        objc_msgSend(v11, "touchEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          eventOrder = self->_eventOrder;
          -[TITypingSession sessionParams](self->_typingSession, "sessionParams");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "wordSeparator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[TISKInputEvent makeInputEvent:emojiSearchMode:order:wordSeparator:accentedLanguage:](TISKInputEvent, "makeInputEvent:emojiSearchMode:order:wordSeparator:accentedLanguage:", v11, v32, eventOrder, v15, self->_accentedLanguage);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          touchToEventMap = self->_touchToEventMap;
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "touchEvent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithLong:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](touchToEventMap, "setObject:forKey:", v16, v20);
          goto LABEL_8;
        }
        objc_msgSend(v11, "string");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "length"))
          goto LABEL_10;
        objc_msgSend(v11, "string");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypingSession sessionParams](self->_typingSession, "sessionParams");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "wordSeparator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "isEqualToString:", v23);

        if ((v24 & 1) == 0)
        {
          objc_msgSend(v11, "string");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "_containsEmoji");

          if (v26)
          {
            -[TISKMetricCollector loadEmojiBucketDictionaryIfNecessary](self, "loadEmojiBucketDictionaryIfNecessary");
            v27 = [TISKEmojiInputEvent alloc];
            v28 = self->_eventOrder;
            emojiBuckets = self->_emojiBuckets;
            objc_msgSend(v11, "string");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKey:](emojiBuckets, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[TISKEmojiInputEvent init:emojiSearchMode:order:emojiBucketCategory:](v27, "init:emojiSearchMode:order:emojiBucketCategory:", v32, v28, v20, a4);
LABEL_8:

          }
          else
          {
            v16 = -[TISKTouchlessInputEvent init:order:]([TISKTouchlessInputEvent alloc], "init:order:", v32, self->_eventOrder);
          }
          self->_eventOrder += 100;
          -[NSMutableArray addObject:](self->_events, "addObject:", v16);
LABEL_10:

        }
        ++v10;
      }
      while (v8 != v10);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v8 = v30;
    }
    while (v30);
  }

}

- (void)_consumePathsAndPredictions:(id)a3 emojiSearchMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  TISKPathEvent *v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableDictionary *touchToEventMap;
  void *v21;
  void *v22;
  int64_t eventOrder;
  int64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDictionary *emojiBuckets;
  void *v29;
  void *v30;
  TISKPredictionBarEvent *v31;
  id v32;
  uint64_t v33;
  NSMutableArray *events;
  TISKCandidateAcceptEvent *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;

  v4 = a4;
  v41 = a3;
  objc_msgSend(v41, "acceptedCandidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v41;
  if (v6)
  {
    objc_msgSend(v41, "acceptedString");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {

LABEL_20:
      v7 = v41;
      goto LABEL_21;
    }
    v9 = (void *)v8;
    objc_msgSend(v41, "acceptedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    v7 = v41;
    if (v11)
    {
      objc_msgSend(v41, "acceptedCandidate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isContinuousPathConversion");

      if (v13)
      {
        objc_msgSend(v41, "allTouchesM");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = [TISKPathEvent alloc];
          objc_msgSend(v41, "acceptedCandidate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "allTouchesM");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[TISKPathEvent init:candidate:allTouches:emojiSearchMode:order:](v16, "init:candidate:allTouches:emojiSearchMode:order:", v15, v17, v18, v4, self->_eventOrder);

          touchToEventMap = self->_touchToEventMap;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](touchToEventMap, "setObject:forKey:", v19, v21);

        }
        else
        {
          v19 = -[TISKTouchlessInputEvent init:order:]([TISKTouchlessInputEvent alloc], "init:order:", v4, self->_eventOrder);
        }
        -[NSMutableArray addObject:](self->_events, "addObject:", v19);
        self->_eventOrder += 100;

        goto LABEL_20;
      }
      v7 = v41;
      if (!v4)
      {
        if (-[NSMutableArray count](self->_events, "count"))
        {
          -[NSMutableArray lastObject](self->_events, "lastObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          eventOrder = objc_msgSend(v22, "order");

        }
        else
        {
          eventOrder = self->_eventOrder;
        }
        v24 = eventOrder + 1;
        if ((objc_msgSend(v41, "wordEntryType") & 4) != 0)
        {
          objc_msgSend(v41, "acceptedCandidate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "candidate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "_containsEmoji");

          if ((_DWORD)v27)
          {
            -[TISKMetricCollector loadEmojiBucketDictionaryIfNecessary](self, "loadEmojiBucketDictionaryIfNecessary");
            emojiBuckets = self->_emojiBuckets;
            objc_msgSend(v41, "acceptedString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKey:](emojiBuckets, "objectForKey:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v30 = 0;
          }
          v31 = [TISKPredictionBarEvent alloc];
          objc_msgSend(v41, "occurenceTime");
          v32 = -[TISKPredictionBarEvent init:emojiPrediction:emojiSearchMode:order:emojiBucketCategory:](v31, "init:emojiPrediction:emojiSearchMode:order:emojiBucketCategory:", v27, 0, eventOrder + 1, v30);
          -[NSMutableArray addObject:](self->_events, "addObject:", v32);
          v24 = eventOrder + 2;

        }
        v33 = objc_msgSend(v41, "wordEntryType") & 1;
        events = self->_events;
        v35 = [TISKCandidateAcceptEvent alloc];
        objc_msgSend(v41, "acceptedCandidate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "acceptedCandidate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "candidate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[TISKMetricCollector getWordBucketCategoryForWord:](self, "getWordBucketCategoryForWord:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[TISKCandidateAcceptEvent init:emojiSearchMode:order:wordBucketCategory:isAutocorrection:](v35, "init:emojiSearchMode:order:wordBucketCategory:isAutocorrection:", v36, 0, v24, v39, v33);
        -[NSMutableArray addObject:](events, "addObject:", v40);

        self->_eventOrder += 100;
        goto LABEL_20;
      }
    }
  }
LABEL_21:

}

- (void)_processEvents
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *sortedEvents;
  void (**v11)(_QWORD);
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD aBlock[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_events, "count"))
  {
    if (-[NSMutableArray count](self->_events, "count"))
    {
      v3 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_events, "objectAtIndexedSubscript:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isMissingATouch"))
        {
          v5 = -[TISKTouchlessInputEvent init:order:]([TISKTouchlessInputEvent alloc], "init:order:", objc_msgSend(v4, "emojiSearchMode"), objc_msgSend(v4, "order"));
          -[NSMutableArray setObject:atIndexedSubscript:](self->_events, "setObject:atIndexedSubscript:", v5, v3);

        }
        ++v3;
      }
      while (v3 < -[NSMutableArray count](self->_events, "count"));
    }
    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[NSMutableArray sortedArrayUsingComparator:](self->_events, "sortedArrayUsingComparator:", &__block_literal_global_176);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TISKMetricCollector _insertEmojiSwitchEvents:](self, "_insertEmojiSwitchEvents:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedEvents = self->_sortedEvents;
    self->_sortedEvents = v9;

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__TISKMetricCollector__processEvents__block_invoke_177;
    aBlock[3] = &unk_1EA107058;
    aBlock[4] = &v30;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (-[NSArray count](self->_sortedEvents, "count"))
    {
      v12 = 0;
      v13 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "type") == 3)
          break;
        if (objc_msgSend(v14, "type") != 11)
        {
          v11[2](v11);
          if (!objc_msgSend(v14, "type"))
          {
            objc_msgSend(v14, "setWordPosition:", v12);
            if (v12 == 4)
            {
              for (i = 0; i != -5; --i)
              {
                -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v13 + i);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setIsShortWord:", 0);

              }
            }
            else if (v12 >= 5)
            {
              objc_msgSend(v14, "setIsShortWord:", 0);
            }
            ++v12;
            goto LABEL_14;
          }
          goto LABEL_13;
        }
LABEL_14:

        if (++v13 >= -[NSArray count](self->_sortedEvents, "count"))
          goto LABEL_23;
      }
      objc_msgSend((id)v31[5], "addObject:", v14);
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
LABEL_23:
    v11[2](v11);
    -[TISKMetricCollector _metricWalk](self, "_metricWalk");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = self->_currentSessionStatsArray;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v22, "startTime", (_QWORD)v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[TISKMetricCollector totalTimeSpan](self, "totalTimeSpan");
          objc_msgSend(v23, "dateByAddingTimeInterval:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setEndTime:", v24);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      }
      while (v19);
    }

    _Block_object_dispose(&v30, 8);
  }
}

- (void)_haltSessionTypingTimer:(id)a3 event:(id)a4
{
  if (a4)
    objc_msgSend(a3, "haltTypingTimerWithEvent:", a4);
  else
    objc_msgSend(a3, "haltTypingTimer");
}

- (void)loadWordBucketDictionaryIfNecessary
{
  NSDictionary *v3;
  NSDictionary *wordBucketDictionary;

  if (!self->_wordBucketDictionary)
  {
    -[TISKMetricCollector loadDataWithFilename:](self, "loadDataWithFilename:", CFSTR("wordBuckets"));
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    wordBucketDictionary = self->_wordBucketDictionary;
    self->_wordBucketDictionary = v3;

  }
}

- (void)loadEmojiBucketDictionaryIfNecessary
{
  NSDictionary *v3;
  NSDictionary *emojiBuckets;

  if (!self->_emojiBuckets)
  {
    -[TISKMetricCollector loadDataWithFilename:](self, "loadDataWithFilename:", CFSTR("emojiBuckets"));
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    emojiBuckets = self->_emojiBuckets;
    self->_emojiBuckets = v3;

  }
}

- (id)lemmatizeWord:(id)a3
{
  -[NLTagger setString:](self->_tagger, "setString:", a3);
  return -[NLTagger tagAtIndex:unit:scheme:tokenRange:](self->_tagger, "tagAtIndex:unit:scheme:tokenRange:", 0, 0, *MEMORY[0x1E0CCE0B8], 0);
}

- (id)getWordBucketCategoryForWord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *previousWord;

  v4 = a3;
  -[TISKMetricCollector loadWordBucketDictionaryIfNecessary](self, "loadWordBucketDictionaryIfNecessary");
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB38], "createStringByReplacingStylizedQuotesToStraightQuotes:", v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](self->_wordBucketDictionary, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[TISKMetricCollector lemmatizeWord:](self, "lemmatizeWord:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_wordBucketDictionary, "objectForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (self->_previousWord)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), self->_previousWord, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_wordBucketDictionary, "objectForKey:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
    }
  }
  previousWord = self->_previousWord;
  self->_previousWord = v8;

  return v9;
}

- (void)_metricWalk
{
  NSMutableArray *currentSessionStatsArray;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  currentSessionStatsArray = self->_currentSessionStatsArray;
  -[TITypingSession layouts](self->_typingSession, "layouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TISKMetricCollector findIndexSessionStatsFromArray:thatHasLayout:](self, "findIndexSessionStatsFromArray:thatHasLayout:", currentSessionStatsArray, v5);

  -[NSMutableArray objectAtIndex:](self->_currentSessionStatsArray, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray count](self->_sortedEvents, "count"))
    goto LABEL_23;
  v8 = 0;
  v13 = 0;
  do
  {
    if (!v8)
      objc_msgSend(v7, "addSample:forKey:", &unk_1EA140228, kTISKEpisodeCount);
    -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v9, "type"))
    {
      case 7u:
      case 0xBu:
        objc_msgSend(v9, "reportToSession:", v7);
        break;
      case 0xAu:
        objc_msgSend(v9, "reportToSession:", v7);
        if (!v13)
          goto LABEL_7;
        if (objc_msgSend(v13, "type") == 5 || objc_msgSend(v13, "type") == 2)
        {
          objc_msgSend(v13, "tap");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTap:", v10);

          goto LABEL_16;
        }
        break;
      case 0xDu:
      case 0xFu:
      case 0x10u:
        -[TISKMetricCollector _haltSessionTypingTimer:event:](self, "_haltSessionTypingTimer:event:", v7, v13);

LABEL_7:
        v13 = 0;
        break;
      case 0xEu:
        -[TISKMetricCollector _haltSessionTypingTimer:event:](self, "_haltSessionTypingTimer:event:", v7, v13);

        objc_msgSend(v9, "reportToSession:", v7);
        objc_msgSend(v9, "sessionStats");
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = 0;
        v7 = (void *)v12;
        break;
      default:
        if (!v13)
          objc_msgSend(v7, "startTypingTimerWithEvent:", v9);
        objc_msgSend(v9, "reportToSession:", v7);
        objc_msgSend(v9, "reportInterKeyTiming:previousEvent:", v7, v13);
LABEL_16:
        if (objc_msgSend(v9, "hasTimestamp"))
        {
          v11 = v9;

          v13 = v11;
        }
        break;
    }

    ++v8;
  }
  while (-[NSArray count](self->_sortedEvents, "count") > v8);
  if (!v13)
  {
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v13, "type") == 14)
  {
LABEL_24:
    objc_msgSend(v7, "haltTypingTimer");
    goto LABEL_25;
  }
  objc_msgSend(v7, "haltTypingTimerWithEvent:", v13);
LABEL_25:

}

- (void)_mapTapsToEvents
{
  TISKMetricCollector *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  TISKLayoutSwitchEvent *v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  NSMutableArray *currentSessionStatsArray;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  TISKMetricCollector *v38;
  NSMutableDictionary *touchToEventMap;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  char v46;
  __objc2_class **v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableArray *obj;
  unsigned int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v2 = self;
  v59 = *MEMORY[0x1E0C80C00];
  -[TITypingSession layouts](self->_typingSession, "layouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v2->_taps;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_30;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v55;
  v50 = *(_QWORD *)v55;
  do
  {
    v9 = 0;
    v51 = v6;
    do
    {
      if (*(_QWORD *)v55 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v9);
      if (objc_msgSend(v10, "isDownUpTap", v50))
      {
        if (v7)
        {
          v11 = objc_msgSend(v7, "emojiSearchMode");
          v12 = objc_msgSend(v7, "order") + 10;
        }
        else
        {
          v11 = 0;
          v12 = 0;
        }
        objc_msgSend(v10, "layout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = v11;
        if (v7 && v4 != v13)
        {
          objc_msgSend(v4, "frame");
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          objc_msgSend(v10, "layout");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "frame");
          v61.origin.x = v23;
          v61.origin.y = v24;
          v61.size.width = v25;
          v61.size.height = v26;
          v60.origin.x = v15;
          v60.origin.y = v17;
          v60.size.width = v19;
          v60.size.height = v21;
          v27 = CGRectEqualToRect(v60, v61);

          if (v27)
          {
            v28 = [TISKLayoutSwitchEvent alloc];
            objc_msgSend(v7, "touchUpTimestamp");
            v30 = v29;
            objc_msgSend(v10, "layout");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[TISKLayoutSwitchEvent init:layout:emojiSearchMode:order:](v28, "init:layout:emojiSearchMode:order:", v31, v11, v12, v30);
          }
          else
          {
            currentSessionStatsArray = v2->_currentSessionStatsArray;
            objc_msgSend(v10, "layout");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[TISKMetricCollector findIndexSessionStatsFromArray:thatHasLayout:](v2, "findIndexSessionStatsFromArray:thatHasLayout:", currentSessionStatsArray, v34);

            -[NSMutableArray objectAtIndex:](v2->_currentSessionStatsArray, "objectAtIndex:", v35);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[TISKBucketSwitchEvent init:emojiSearchMode:order:]([TISKBucketSwitchEvent alloc], "init:emojiSearchMode:order:", v31, v11, v12);
          }
          v36 = v32;

          ++v12;
          -[NSMutableArray addObject:](v2->_events, "addObject:", v36);
          objc_msgSend(v10, "layout");
          v37 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v37;
        }
        v38 = v2;
        touchToEventMap = v2->_touchToEventMap;
        v40 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "lastTouch");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithLong:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](touchToEventMap, "objectForKey:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v43, "setTap:", v10);
          v2 = v38;
          goto LABEL_22;
        }
        objc_msgSend(v10, "stringForIntendedKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
        {
          v46 = objc_msgSend(v44, "isEqualToString:", CFSTR("shift"));
          v47 = off_1EA0F7D08;
          v2 = v38;
          if ((v46 & 1) != 0 || (v48 = objc_msgSend(v45, "isEqualToString:", CFSTR("more")), v47 = off_1EA0F7C68, v48))
          {
            v43 = (void *)objc_msgSend(objc_alloc(*v47), "init:emojiSearchMode:order:", v10, v53, v12);
            -[NSMutableArray addObject:](v38->_events, "addObject:", v43);

LABEL_22:
            v45 = v43;

            v7 = v45;
          }
        }
        else
        {
          v2 = v38;
        }
        v8 = v50;
        v6 = v51;

      }
      ++v9;
    }
    while (v6 != v9);
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    v6 = v49;
  }
  while (v49);
LABEL_30:

}

- (id)_insertEmojiSwitchEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  TISKEmojiSwitchEvent *v18;
  double v19;
  id v20;
  void *v21;
  TISKEmojiSearchEvent *v22;
  double v23;
  id v24;
  TISKEmojiSearchEvent *v25;
  double v26;
  id v27;
  TISKEmojiSwitchEvent *v28;
  double v29;
  TISKEmojiSwitchEvent *v30;
  double v31;
  uint64_t v32;
  TISKEmojiSearchEvent *v33;
  double v34;
  id v35;
  TISKEmojiSearchEvent *v36;
  double v37;
  id v38;
  TISKEmojiSwitchEvent *v39;
  double v40;
  id v41;
  id v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  BOOL v51;
  int v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  unint64_t v60;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v42 = v3;
    goto LABEL_55;
  }
  v4 = (void *)objc_opt_new();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v62 = v3;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  v65 = v5;
  v66 = v4;
  if (!v6)
  {
    v11 = 0;
    v10 = 0;
    v41 = v5;
    goto LABEL_37;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v68;
  do
  {
    v13 = 0;
    v14 = v10;
    do
    {
      if (*(_QWORD *)v68 != v12)
        objc_enumerationMutation(v5);
      v15 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v13);
      v16 = objc_msgSend(v15, "type");
      if (v16 <= 0x11)
      {
        if (((1 << v16) & 0x1ABFD) != 0)
        {
          v17 = objc_msgSend(v15, "emojiSearchMode");
          if ((v8 & 1) != 0)
          {
            if ((v17 & 1) != 0)
              goto LABEL_11;
            if ((v9 & 1) != 0)
            {
              v25 = [TISKEmojiSearchEvent alloc];
              objc_msgSend(v11, "touchUpTimestamp");
              v27 = -[TISKEmojiSearchEvent init:engaged:order:](v25, "init:engaged:order:", 0, objc_msgSend(v14, "order") + 1, v26);
              objc_msgSend(v66, "addObject:", v27);

            }
            v28 = [TISKEmojiSwitchEvent alloc];
            objc_msgSend(v11, "touchUpTimestamp");
            v24 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v28, "init:emojiSearchMode:order:", 0, objc_msgSend(v14, "order") + 2, v29);
            v8 = 0;
            v9 = 0;
            goto LABEL_25;
          }
          if (!v17)
          {
            v8 = 0;
            goto LABEL_27;
          }
          v18 = [TISKEmojiSwitchEvent alloc];
          objc_msgSend(v15, "touchDownTimestamp");
          v8 = 1;
          v20 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v18, "init:emojiSearchMode:order:", 1, objc_msgSend(v15, "order") - 2, v19);
          v21 = v66;
          objc_msgSend(v66, "addObject:", v20);

          v22 = [TISKEmojiSearchEvent alloc];
          objc_msgSend(v15, "touchDownTimestamp");
          v24 = -[TISKEmojiSearchEvent init:engaged:order:](v22, "init:engaged:order:", 1, objc_msgSend(v15, "order") - 1, v23);
          v9 = 1;
        }
        else
        {
          if (v16 == 12)
          {
            if (v9 & 1 | ((v8 & 1) == 0))
              goto LABEL_27;
            v33 = [TISKEmojiSearchEvent alloc];
            objc_msgSend(v15, "touchDownTimestamp");
            v9 = 1;
            v32 = -[TISKEmojiSearchEvent init:engaged:order:](v33, "init:engaged:order:", 1, objc_msgSend(v15, "order") - 1, v34);
          }
          else
          {
            if (v16 != 17)
              goto LABEL_27;
            if ((v8 & 1) != 0)
            {
LABEL_11:
              v8 = 1;
              goto LABEL_27;
            }
            v30 = [TISKEmojiSwitchEvent alloc];
            objc_msgSend(v15, "touchDownTimestamp");
            v8 = 1;
            v32 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v30, "init:emojiSearchMode:order:", 1, objc_msgSend(v15, "order") - 1, v31);
          }
          v24 = (id)v32;
LABEL_25:
          v21 = v66;
        }
        objc_msgSend(v21, "addObject:", v24);

        v5 = v65;
      }
LABEL_27:
      v10 = v15;

      if (objc_msgSend(v10, "hasTimestamp"))
      {
        v35 = v10;

        v11 = v35;
      }
      ++v13;
      v14 = v10;
    }
    while (v7 != v13);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  }
  while (v7);

  if ((v8 & 1) != 0)
  {
    v4 = v66;
    if ((v9 & 1) != 0)
    {
      v36 = [TISKEmojiSearchEvent alloc];
      objc_msgSend(v11, "touchUpTimestamp");
      v38 = -[TISKEmojiSearchEvent init:engaged:order:](v36, "init:engaged:order:", 0, objc_msgSend(v10, "order") + 1, v37);
      objc_msgSend(v66, "addObject:", v38);

    }
    v39 = [TISKEmojiSwitchEvent alloc];
    objc_msgSend(v11, "touchUpTimestamp");
    v41 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v39, "init:emojiSearchMode:order:", 0, objc_msgSend(v10, "order") + 2, v40);
    objc_msgSend(v66, "addObject:", v41);
LABEL_37:

  }
  else
  {
    v4 = v66;
  }
  v42 = (id)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v63 = v42;
    do
    {
      if (objc_msgSend(v4, "count") <= (unint64_t)v44)
        break;
      v46 = v44;
      objc_msgSend(v65, "objectAtIndexedSubscript:", v43);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v64, "order");
      objc_msgSend(v4, "objectAtIndexedSubscript:", v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47 >= objc_msgSend(v48, "order"))
      {
        ++v44;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v45;
      }
      else
      {
        v49 = (v45 + 1);
        objc_msgSend(v65, "objectAtIndexedSubscript:", v43);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v42 = v63;
      objc_msgSend(v63, "addObject:", v50);

      v43 = (int)v49;
      v45 = v49;
      v51 = objc_msgSend(v65, "count") > (unint64_t)(int)v49;
      v4 = v66;
    }
    while (v51);
  }
  else
  {
    LODWORD(v45) = 0;
    v44 = 0;
  }
  v52 = v44;
  if (objc_msgSend(v65, "count") > (unint64_t)(int)v45)
  {
    v53 = (int)v45;
    do
    {
      v54 = v53 + 1;
      objc_msgSend(v65, "objectAtIndexedSubscript:");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v55);

      v56 = objc_msgSend(v65, "count");
      v53 = v54;
    }
    while (v56 > v54);
  }
  if (objc_msgSend(v4, "count") > (unint64_t)v52)
  {
    v57 = v52;
    do
    {
      v58 = v57 + 1;
      objc_msgSend(v4, "objectAtIndexedSubscript:");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v59);

      v60 = objc_msgSend(v4, "count");
      v57 = v58;
    }
    while (v60 > v58);
  }

  v3 = v62;
LABEL_55:

  return v42;
}

- (id)_mapIDToLayout:(unint64_t)a3
{
  NSMutableArray *accentedLayoutsMap;
  void *v6;
  void *v7;

  accentedLayoutsMap = self->_accentedLayoutsMap;
  if (accentedLayoutsMap)
  {
    -[NSMutableArray objectAtIndexedSubscript:](accentedLayoutsMap, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TITypingSession layouts](self->_typingSession, "layouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_coalesceTaps
{
  NSMutableArray *v3;
  NSMutableArray *taps;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  TISKTap *v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  taps = self->_taps;
  self->_taps = v3;

  if (!-[NSMutableArray count](self->_touches, "count"))
  {
    v7 = 0;
    goto LABEL_70;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = v7;
    -[NSMutableArray objectAtIndex:](self->_touches, "objectAtIndex:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_touches, "removeObjectAtIndex:", 0);
    -[NSMutableArray objectAtIndex:](self->_layoutIDs, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    -[NSMutableArray removeObjectAtIndex:](self->_layoutIDs, "removeObjectAtIndex:", 0);
    v11 = objc_msgSend(v36, "pathIndex");
    v12 = [TISKTap alloc];
    -[TISKMetricCollector _mapIDToLayout:](self, "_mapIDToLayout:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TISKTap init:layout:](v12, "init:layout:", v36, v13);

    objc_msgSend(v14, "setPathIndex:", v11);
    if (!-[NSMutableArray count](self->_touches, "count"))
    {
      v22 = v5;
      goto LABEL_63;
    }
    v15 = 0;
    v16 = v5;
    while (1)
    {
      v17 = v36;
      -[NSMutableArray objectAtIndex:](self->_touches, "objectAtIndex:", v15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v36, "pathIndex") == v11)
        break;
LABEL_22:
      v22 = v16;
LABEL_42:
      ++v15;
      v16 = v22;
      if (-[NSMutableArray count](self->_touches, "count") <= v15)
        goto LABEL_63;
    }
    if (objc_msgSend(v36, "stage") == 1)
    {
      objc_msgSend(v14, "addDragTouch:", v36);
      if ((unint64_t)v16 >= v6)
      {
        v18 = v16 - v5;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          goto LABEL_71;
        if ((uint64_t)(v6 - (_QWORD)v5) >> 2 > v19)
          v19 = (uint64_t)(v6 - (_QWORD)v5) >> 2;
        if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8)
          v20 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        if (v20)
          v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v20);
        else
          v21 = 0;
        v25 = (unint64_t *)(v20 + 8 * v18);
        *v25 = v15;
        v22 = v25 + 1;
        while (v16 != v5)
        {
          v26 = *--v16;
          *--v25 = v26;
        }
LABEL_39:
        v6 = v20 + 8 * v21;
        if (v5)
          operator delete(v5);
        v5 = v25;
        goto LABEL_42;
      }
LABEL_21:
      *v16++ = v15;
      goto LABEL_22;
    }
    if (objc_msgSend(v36, "stage") != 2
      && objc_msgSend(v36, "stage") != 3
      && objc_msgSend(v36, "stage") != 5)
    {
      if (!objc_msgSend(v36, "stage"))
        goto LABEL_47;
      if ((unint64_t)v16 >= v6)
      {
        v23 = v16 - v5;
        v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61)
          goto LABEL_71;
        if ((uint64_t)(v6 - (_QWORD)v5) >> 2 > v24)
          v24 = (uint64_t)(v6 - (_QWORD)v5) >> 2;
        if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8)
          v20 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v20 = v24;
        if (v20)
          v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v20);
        else
          v21 = 0;
        v25 = (unint64_t *)(v20 + 8 * v23);
        *v25 = v15;
        v22 = v25 + 1;
        while (v16 != v5)
        {
          v27 = *--v16;
          *--v25 = v27;
        }
        goto LABEL_39;
      }
      goto LABEL_21;
    }
    objc_msgSend(v14, "setLastTouch:", v36);
    if ((unint64_t)v16 >= v6)
    {
      v28 = v16 - v5;
      v29 = v28 + 1;
      if ((unint64_t)(v28 + 1) >> 61)
LABEL_71:
        abort();
      if ((uint64_t)(v6 - (_QWORD)v5) >> 2 > v29)
        v29 = (uint64_t)(v6 - (_QWORD)v5) >> 2;
      if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8)
        v30 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v30 = v29;
      if (v30)
        v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v30);
      else
        v31 = 0;
      v32 = (unint64_t *)(v30 + 8 * v28);
      *v32 = v15;
      v22 = v32 + 1;
      while (v16 != v5)
      {
        v33 = *--v16;
        *--v32 = v33;
      }
      v6 = v30 + 8 * v31;
      if (v5)
        operator delete(v5);
      v5 = v32;
    }
    else
    {
      *v16++ = v15;
LABEL_47:
      v22 = v16;
    }
LABEL_63:
    -[NSMutableArray addObject:](self->_taps, "addObject:", v14);
    if ((int)(((unint64_t)((char *)v22 - (char *)v5) >> 3) - 1) >= 0)
    {
      v34 = ((unint64_t)((char *)v22 - (char *)v5) >> 3) - 1;
      do
      {
        -[NSMutableArray removeObjectAtIndex:](self->_touches, "removeObjectAtIndex:", v5[v34]);
        -[NSMutableArray removeObjectAtIndex:](self->_layoutIDs, "removeObjectAtIndex:", v5[v34--]);
      }
      while (v34 != -1);
    }

    v35 = -[NSMutableArray count](self->_touches, "count");
    v7 = v36;
  }
  while (v35);
  if (v5)
  {
    operator delete(v5);
    v7 = v36;
  }
LABEL_70:

}

- (id)eventsDescription
{
  return -[TISKMetricCollector eventsDescription:](self, "eventsDescription:", 0);
}

- (id)eventsDescription:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_sortedEvents;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        if (v3
          && objc_msgSend(v11, "type") != 13
          && objc_msgSend(v11, "type") != 14
          && objc_msgSend(v11, "type") != 7
          && objc_msgSend(v11, "type") != 11)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "touchDownTimestamp");
          v15 = v14;
          objc_msgSend(v11, "touchUpTimestamp");
          objc_msgSend(v13, "stringWithFormat:", CFSTR(":%lf->%lf"), v15, v16, (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v17);

        }
        objc_msgSend(v5, "appendString:", CFSTR("|"));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)privateEventsDescription
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_sortedEvents;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "privateDescription", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR("|"));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (double)totalTimeSpan
{
  double v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSUInteger v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;

  v3 = 0.0;
  if (!-[NSArray count](self->_sortedEvents, "count"))
  {
LABEL_5:
    v7 = 0;
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v4 = 0;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasTimestamp");

    if ((v6 & 1) != 0)
      break;
    if (++v4 >= -[NSArray count](self->_sortedEvents, "count"))
      goto LABEL_5;
  }
  -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  v10 = -[NSArray count](self->_sortedEvents, "count");
  while ((--v10 & 0x8000000000000000) == 0)
  {
    -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasTimestamp");

    if (v12)
    {
      -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  v8 = 0;
LABEL_14:
  if (v7 == v8)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v8, "touchUpTimestamp");
    v14 = v13;
    objc_msgSend(v7, "touchDownTimestamp");
    v3 = v14 - v15;
  }
LABEL_7:

  return v3;
}

- (double)totalTimeSpanFromLastTap
{
  NSUInteger v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  v3 = -[NSArray count](self->_sortedEvents, "count");
  v4 = 0.0;
  if ((uint64_t)(v3 - 1) >= 0)
  {
    v5 = v3;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", --v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tap");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastTouch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "tap");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "lastTouch");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timestamp");
          v16 = v15;
          -[NSArray objectAtIndexedSubscript:](self->_sortedEvents, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "touchDownTimestamp");
          v4 = v16 - v18;

          return v4;
        }
      }
      else
      {

      }
    }
    while (v5 > 0);
  }
  return v4;
}

- (void)processNewSessionStatsArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *savedSessionStatsArray;
  void *v11;
  int64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEmpty") & 1) == 0
          && !-[TISKMetricCollector publishIfSessionStatsHasWordCountMoreThanThreshold:withSessionStartTime:](self, "publishIfSessionStatsHasWordCountMoreThanThreshold:withSessionStartTime:", v9, 1))
        {
          savedSessionStatsArray = self->_savedSessionStatsArray;
          objc_msgSend(v9, "layout");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[TISKMetricCollector findIndexSessionStatsFromArray:thatHasLayout:](self, "findIndexSessionStatsFromArray:thatHasLayout:", savedSessionStatsArray, v11);

          if (v12 == -1)
          {
            IXADefaultLogFacility();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] savedSessionStats is nil"), "-[TISKMetricCollector processNewSessionStatsArray:]");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v24 = v18;
              _os_log_debug_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
            -[NSMutableArray addObject:](self->_savedSessionStatsArray, "addObject:", v9);
          }
          else
          {
            -[NSMutableArray objectAtIndex:](self->_savedSessionStatsArray, "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            IXADefaultLogFacility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] savedSessionStats not nil, savedSessionStats class %@"), "-[TISKMetricCollector processNewSessionStatsArray:]", objc_opt_class());
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v24 = v17;
              _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
            objc_msgSend(v13, "sessionIds");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v13, "merge:", v9);
              if (-[TISKMetricCollector publishIfSessionStatsHasWordCountMoreThanThreshold:withSessionStartTime:](self, "publishIfSessionStatsHasWordCountMoreThanThreshold:withSessionStartTime:", v13, 0))
              {
                -[NSMutableArray removeObjectAtIndex:](self->_savedSessionStatsArray, "removeObjectAtIndex:", v12);
              }
            }
            else
            {
              -[NSMutableArray removeObjectAtIndex:](self->_savedSessionStatsArray, "removeObjectAtIndex:", v12);
              -[NSMutableArray addObject:](self->_savedSessionStatsArray, "addObject:", v9);
            }

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

}

- (BOOL)publishIfSessionStatsHasWordCountMoreThanThreshold:(id)a3 withSessionStartTime:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "counter:", kTISKNumberOfWordsCounter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = -[TISKMetricCollector wordAccumulationThreshold](self, "wordAccumulationThreshold");
  if (v8 >= v9)
  {
    -[TISKMetricCollector dataWriter](self, "dataWriter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publishSessionStats:withSessionStartTime:", v6, v4);

  }
  return v8 >= v9;
}

- (void)_loadStatsFromDataStore
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *savedSessionStatsArray;
  void *v6;

  if (!self->_isLoaded)
  {
    self->_isLoaded = 1;
    -[TISKMetricCollector _retrieveSavedSessionSampleArray](self, "_retrieveSavedSessionSampleArray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
      v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      savedSessionStatsArray = self->_savedSessionStatsArray;
      self->_savedSessionStatsArray = v4;

      -[TISKMetricCollector removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:](self, "removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:", self->_savedSessionStatsArray, 0);
      v3 = v6;
    }

  }
}

- (id)_retrieveSavedSessionSampleArray
{
  TIUserModelDataStore *userModelDataStore;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  userModelDataStore = self->_userModelDataStore;
  -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelDataStore getAllValuesForKey:forInputMode:sinceDate:](userModelDataStore, "getAllValuesForKey:forInputMode:sinceDate:", CFSTR("SensorKitDataKey"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v11, v12, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    if (v14)
    {
      IXADefaultLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%s [SensorKit] failed to unarchive stats for input mode %@"), "-[TISKMetricCollector _retrieveSavedSessionSampleArray]", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v26;
        _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "startTime");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceNow");
        v21 = fabs(v20);

        if (v21 > 86400.0)
          objc_msgSend(v16, "addIndex:", v17);
        ++v17;
      }
      while (v17 < objc_msgSend(v13, "count"));
    }
    objc_msgSend(v13, "removeObjectsAtIndexes:", v16);

  }
  else
  {
    v13 = 0;
  }
  v22 = (void *)objc_msgSend(v13, "copy");

  return v22;
}

- (void)_persistSavedSessionStatsArray
{
  void *v3;
  TIUserModelDataStore *userModelDataStore;
  void *v5;
  NSMutableArray *savedSessionStatsArray;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  TIUserModelDataStore *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  userModelDataStore = self->_userModelDataStore;
  -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelDataStore purgeDataForKey:forInputMode:beforeDate:](userModelDataStore, "purgeDataForKey:forInputMode:beforeDate:", CFSTR("SensorKitDataKey"), v5, v3);

  if (-[NSMutableArray count](self->_savedSessionStatsArray, "count"))
  {
    savedSessionStatsArray = self->_savedSessionStatsArray;
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", savedSessionStatsArray, 1, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v8)
    {
      IXADefaultLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%s [SensorKit] failed to archive stats for input mode %@"), "-[TISKMetricCollector _persistSavedSessionStatsArray]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    else
    {
      v13 = self->_userModelDataStore;
      -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      -[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:](v13, "addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:", &unk_1EA140240, &unk_1EA140240, &unk_1EA140240, v7, CFSTR("SensorKitDataKey"), v9, v3);
    }

  }
}

- (void)removeSessionStatsWithNegativeDurationFromArray:(id)a3 ForTypingSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  TISKMetricCollector *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__TISKMetricCollector_removeSessionStatsWithNegativeDurationFromArray_ForTypingSession___block_invoke;
  v11[3] = &unk_1EA0F9DC8;
  v12 = v6;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(v7, "removeObjectsAtIndexes:", v9);

}

- (unint64_t)wordAccumulationThreshold
{
  return self->_wordAccumulationThreshold;
}

- (void)setWordAccumulationThreshold:(unint64_t)a3
{
  self->_wordAccumulationThreshold = a3;
}

- (TISensorWriterWrapper)dataWriter
{
  return self->_dataWriter;
}

- (void)setDataWriter:(id)a3
{
  objc_storeStrong((id *)&self->_dataWriter, a3);
}

- (NSMutableArray)savedSessionStatsArray
{
  return self->_savedSessionStatsArray;
}

- (void)setSavedSessionStatsArray:(id)a3
{
  objc_storeStrong((id *)&self->_savedSessionStatsArray, a3);
}

- (NSMutableArray)currentSessionStatsArray
{
  return self->_currentSessionStatsArray;
}

- (void)setCurrentSessionStatsArray:(id)a3
{
  objc_storeStrong((id *)&self->_currentSessionStatsArray, a3);
}

- (TITypingSession)typingSession
{
  return self->_typingSession;
}

- (void)setTypingSession:(id)a3
{
  objc_storeStrong((id *)&self->_typingSession, a3);
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingSession, 0);
  objc_storeStrong((id *)&self->_savedSessionStatsArray, 0);
  objc_storeStrong((id *)&self->_dataWriter, 0);
  objc_storeStrong((id *)&self->_previousWord, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_emojiBuckets, 0);
  objc_storeStrong((id *)&self->_wordBucketDictionary, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accentedLayoutsMap, 0);
  objc_storeStrong((id *)&self->_userModelDataStore, 0);
  objc_storeStrong((id *)&self->_currentSessionStatsArray, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_taps, 0);
  objc_storeStrong((id *)&self->_layoutIDs, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_sortedEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_touchToEventMap, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

void __88__TISKMetricCollector_removeSessionStatsWithNegativeDurationFromArray_ForTypingSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  os_log_t log;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "keyedMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kTISKTotalSessionTypingDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    if (v8 < 0.0)
    {
      v9 = v8;
      if (*(_QWORD *)(a1 + 32))
      {
        v37 = a3;
        v38 = v5;
        v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(a1 + 32), "userActionHistory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        log = (os_log_t)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v36 = a1;
        objc_msgSend(*(id *)(a1 + 32), "userActionHistory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v41 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              v18 = objc_msgSend(v17, "actionType");
              v19 = CFSTR("ot");
              if (v18 <= 5)
                v19 = off_1EA0F9E00[v18];
              v20 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v17, "startTime");
              v22 = v21;
              objc_msgSend(v17, "endTime");
              objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:%f:%f"), v19, v22, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](log, "addObject:", v24);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          }
          while (v14);
        }

        -[NSObject componentsJoinedByString:](log, "componentsJoinedByString:", CFSTR("|"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        IXADefaultLogFacility();
        v26 = objc_claimAutoreleasedReturnValue();
        v5 = v38;
        a1 = v36;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v38, "startTime");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "endTime");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v36 + 40), "privateEventsDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%s [SK TypingTimer][SK Duration] Removing negative duration sessionStats found while reporting: %f %@ %@\n%@\n%@"), "-[TISKMetricCollector removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:]_block_invoke", *(_QWORD *)&v9, v28, v29, v25, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v31;
          _os_log_error_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        a3 = v37;
      }
      else
      {
        IXADefaultLogFacility();
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "startTime");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endTime");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%s [SK TypingTimer][SK Duration] Removing negative duration sessionStats found while loading: %f %@ %@"), "-[TISKMetricCollector removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:]_block_invoke", *(_QWORD *)&v9, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v35;
          _os_log_error_impl(&dword_1DA6F2000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }

      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
    }
  }

}

uint64_t __37__TISKMetricCollector__processEvents__block_invoke_177(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") >= 2)
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") - 1;
    if (v2 >= 0)
    {
      v3 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDeletePostion:", v3);

        --v2;
        ++v3;
      }
      while (v2 != -1);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeAllObjects");
}

uint64_t __37__TISKMetricCollector__processEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "order");
  v6 = objc_msgSend(v4, "order");

  if (v5 > v6)
    return 1;
  else
    return -1;
}

void __48__TISKMetricCollector__setupTCCAuthNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "testTCCAuthorization");

}

+ (id)makeMetricCollector:(id)a3 wordsThreshold:(unint64_t)a4 isTesting:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (+[TISKMetricCollector isSensorKitSupported:](TISKMetricCollector, "isSensorKitSupported:", v7))
  {
    objc_msgSend(v7, "normalizedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(&unk_1EA13FEB0, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(&unk_1EA13FEB0);
          if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13)) & 1) != 0)
          {
            v14 = 1;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(&unk_1EA13FEB0, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_13:
    v15 = -[TISKMetricCollector init:wordsThreshold:accentedLanguage:skipTCCAuthorization:]([TISKMetricCollector alloc], "init:wordsThreshold:accentedLanguage:skipTCCAuthorization:", v7, a4, v14, v5);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)isSensorKitSupported:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(&unk_1EA13FE98, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(&unk_1EA13FE98);
        if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(&unk_1EA13FE98, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)placeTaskOnWorkQueue:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

uint64_t __66__TISKMetricCollector_TISKSessionStatsTest__placeTaskOnWorkQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  IXADefaultLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] dequeue session"), "-[TISKMetricCollector(TISKSessionStatsTest) placeTaskOnWorkQueue:]_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
