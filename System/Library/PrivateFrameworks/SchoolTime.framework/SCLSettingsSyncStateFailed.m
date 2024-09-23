@implementation SCLSettingsSyncStateFailed

- (unint64_t)status
{
  return 4;
}

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SCLSettingsSyncStateFailed;
  -[SCLSettingsSyncState didEnterWithPreviousState:](&v18, sel_didEnterWithPreviousState_, a3);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoveryHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "behaviorForError:history:", v9, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addRecoveryHistory:", objc_msgSend(v12, "recoveryType"));

  v15 = objc_msgSend(v12, "recoveryType");
  if (v15 == 1)
  {
    -[SCLSettingsSyncState stateMachine](self, "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSettingsSyncStateFailed retryCriteriaWithInterval:](self, "retryCriteriaWithInterval:", objc_msgSend(v12, "retryInterval"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scheduleRetryWithActivityCriteria:", v17);

  }
  else if (!v15)
  {
    -[SCLSettingsSyncStateFailed transitionToPendingState](self, "transitionToPendingState");
  }

}

- (void)settingsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLSettingsSyncStateFailed;
  -[SCLSettingsSyncState settingsDidChange](&v6, sel_settingsDidChange);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingSendState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToState:", v5);

}

- (void)significantUserInteractionOccurred
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLSettingsSyncStateFailed;
  -[SCLSettingsSyncState significantUserInteractionOccurred](&v6, sel_significantUserInteractionOccurred);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingSendState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToState:", v5);

}

- (void)xpcActivityStarted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCLSettingsSyncStateFailed;
  -[SCLSettingsSyncState xpcActivityStarted](&v3, sel_xpcActivityStarted);
  -[SCLSettingsSyncStateFailed transitionToPendingState](self, "transitionToPendingState");
}

- (void)transitionToPendingState
{
  void *v3;
  void *v4;
  id v5;

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pendingSendState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToState:", v4);

}

- (id)retryCriteriaWithInterval:(int64_t)a3
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6B8], 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5B8], a3);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6E0], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6D0], 1);
  return v4;
}

@end
