@implementation BYPowerLogAnalyticsManager

- (BYPowerLogAnalyticsManager)initWithPreferences:(id)a3
{
  id v5;
  BYPowerLogAnalyticsManager *v6;
  NSMutableArray *v7;
  NSMutableArray *events;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYPowerLogAnalyticsManager;
  v6 = -[BYPowerLogAnalyticsManager init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = v6->_events;
    v6->_events = v7;

    objc_storeStrong((id *)&v6->_preferencesController, a3);
  }

  return v6;
}

- (void)addEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_events, "addObject:", a3);
}

- (void)commit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  while (-[NSMutableArray count](self->_events, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_events, "removeObjectAtIndex:", 0);
    if (v3)
    {
      if (-[BYPowerLogAnalyticsManager _shouldCommitEvent:](self, "_shouldCommitEvent:", objc_msgSend(v3, "type")))
      {
        objc_msgSend((id)objc_opt_class(), "nameForPowerLogEventType:", objc_msgSend(v3, "type"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "payload");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v4);

        -[BYPowerLogAnalyticsManager _persistIfApplicable:](self, "_persistIfApplicable:", objc_msgSend(v3, "type"));
      }
    }

  }
  if (objc_msgSend(v6, "count"))
    -[BYPowerLogAnalyticsManager _submitPayload:](self, "_submitPayload:", v6);

}

- (void)_submitPayload:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Submit power log events.", v5, 2u);
  }

  if (_submitPayload__onceToken != -1)
    dispatch_once(&_submitPayload__onceToken, &__block_literal_global_10);
  PPSSendTelemetry();

}

uint64_t __45__BYPowerLogAnalyticsManager__submitPayload___block_invoke()
{
  uint64_t result;

  result = PPSCreateTelemetryIdentifier();
  _submitPayload__buddyPowerLogStream = result;
  return result;
}

- (BOOL)_shouldCommitEvent:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v10;

  if (!self->_preferencesController)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Preferences controller is missing"), 0, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  objc_msgSend((id)objc_opt_class(), "persistenceKeyForPowerLogEventType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[BYPreferencesController objectForKey:](self->_preferencesController, "objectForKey:", CFSTR("PowerLogSubmittedEvents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_persistIfApplicable:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  BYPreferencesController *preferencesController;
  void *v8;
  id v9;
  id v10;

  if (!self->_preferencesController)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Preferences controller is missing"), 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  objc_msgSend((id)objc_opt_class(), "persistenceKeyForPowerLogEventType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    -[BYPreferencesController objectForKey:](self->_preferencesController, "objectForKey:", CFSTR("PowerLogSubmittedEvents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v10);
    preferencesController = self->_preferencesController;
    v8 = (void *)objc_msgSend(v6, "copy");
    -[BYPreferencesController setObject:forKey:persistImmediately:](preferencesController, "setObject:forKey:persistImmediately:", v8, CFSTR("PowerLogSubmittedEvents"), 1);

    v4 = v10;
  }

}

+ (id)nameForPowerLogEventType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = &stru_1E4E29440;
  if (a3 == 1)
    v3 = CFSTR("TransferMethod");
  if (a3)
    return (id)v3;
  else
    return CFSTR("SetupDate");
}

+ (id)persistenceKeyForPowerLogEventType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("TransferMethod");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("SetupDate");
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (BYPreferencesController)preferencesController
{
  return self->_preferencesController;
}

- (void)setPreferencesController:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesController, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
