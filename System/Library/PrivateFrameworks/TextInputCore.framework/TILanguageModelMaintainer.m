@implementation TILanguageModelMaintainer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeActivityObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TILanguageModelMaintainer;
  -[TILanguageModelMaintainer dealloc](&v4, sel_dealloc);
}

- (TILanguageModelMaintainer)init
{
  TILanguageModelMaintainer *v2;
  NSDate *v3;
  NSDate *nextEligibleMaintenanceDate;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TILanguageModelMaintainer;
  v2 = -[TILanguageModelMaintainer init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    nextEligibleMaintenanceDate = v2->_nextEligibleMaintenanceDate;
    v2->_nextEligibleMaintenanceDate = v3;

    +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addActivityObserver:", v2);

  }
  return v2;
}

- (void)keyboardActivityDidTransition:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "toState");
  switch(v4)
  {
    case 3:
      -[TILanguageModelMaintainer performMaintenanceIfNecessary](self, "performMaintenanceIfNecessary");
      break;
    case 2:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[TILanguageModelMaintainer keyboardActivityDidTransition:]";
        _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Setting dynamic learning cache timer", (uint8_t *)&v6, 0xCu);
      }
      -[TILanguageModelMaintainer touchDynamicLearningCacheTimer](self, "touchDynamicLearningCacheTimer");
      break;
    case 1:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[TILanguageModelMaintainer keyboardActivityDidTransition:]";
        _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Invalidating dynamic learning cache timer", (uint8_t *)&v6, 0xCu);
      }
      -[TILanguageModelMaintainer dynamicLearningCacheTimer](self, "dynamicLearningCacheTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      break;
  }
}

- (void)touchDynamicLearningCacheTimer
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[TILanguageModelMaintainer dynamicLearningCacheTimer](self, "dynamicLearningCacheTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    -[TILanguageModelMaintainer dynamicLearningCacheTimer](self, "dynamicLearningCacheTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 900.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFireDate:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_dynamicLearningCacheTimerFired_, 0, 0, 900.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TILanguageModelMaintainer setDynamicLearningCacheTimer:](self, "setDynamicLearningCacheTimer:");
  }

}

- (BOOL)isMaintenanceDue
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[TILanguageModelMaintainer nextEligibleMaintenanceDate](self, "nextEligibleMaintenanceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TILanguageModelMaintainer nextEligibleMaintenanceDate](self, "nextEligibleMaintenanceDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5) == -1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)performMaintenanceIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[TILanguageModelMaintainer isMaintenanceDue](self, "isMaintenanceDue"))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Perform language model maintenance"), "-[TILanguageModelMaintainer performMaintenanceIfNecessary]");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v10;
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageModelMaintainer setNextEligibleMaintenanceDate:](self, "setNextEligibleMaintenanceDate:", v4);

    +[TILanguageModelLoaderManager performMaintenance](TILanguageModelLoaderManager, "performMaintenance");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TILanguageModelMaintainer performMaintenanceIfNecessary]";
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Performing vulgar word usage database maintenance (forgetting old vulgar words)", buf, 0xCu);
    }
    +[TIKeyboardInputManager performVulgarWordUsageDatabaseMaintenance](TIKeyboardInputManager, "performVulgarWordUsageDatabaseMaintenance");
    if (_os_feature_enabled_impl())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[TILanguageModelMaintainer performMaintenanceIfNecessary]";
        _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Performing transient lexicon maintenance (reloading named entities)", buf, 0xCu);
      }
      +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performMaintenance");

      +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "releaseAllLanguageModelBuffers");

      +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "releaseAllInputManagers");

    }
    objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flushDynamicData");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("TILanguageModelPerformBackgroundMaintenanceNotification"), 0);

  }
}

- (void)dynamicLearningCacheTimerFired:(id)a3
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[TILanguageModelMaintainer dynamicLearningCacheTimerFired:]";
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Clearing dynamic learning caches", (uint8_t *)&v3, 0xCu);
  }
  +[TILanguageModelLoaderManager clearDynamicLearningCaches](TILanguageModelLoaderManager, "clearDynamicLearningCaches");
}

- (NSDate)nextEligibleMaintenanceDate
{
  return self->_nextEligibleMaintenanceDate;
}

- (void)setNextEligibleMaintenanceDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextEligibleMaintenanceDate, a3);
}

- (NSTimer)dynamicLearningCacheTimer
{
  return self->_dynamicLearningCacheTimer;
}

- (void)setDynamicLearningCacheTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicLearningCacheTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicLearningCacheTimer, 0);
  objc_storeStrong((id *)&self->_nextEligibleMaintenanceDate, 0);
}

+ (id)sharedLanguageModelMaintainer
{
  if (sharedLanguageModelMaintainer_onceToken != -1)
    dispatch_once(&sharedLanguageModelMaintainer_onceToken, &__block_literal_global_17101);
  return (id)sharedLanguageModelMaintainer___sharedInstance;
}

void __58__TILanguageModelMaintainer_sharedLanguageModelMaintainer__block_invoke()
{
  TILanguageModelMaintainer *v0;
  void *v1;

  v0 = objc_alloc_init(TILanguageModelMaintainer);
  v1 = (void *)sharedLanguageModelMaintainer___sharedInstance;
  sharedLanguageModelMaintainer___sharedInstance = (uint64_t)v0;

}

@end
