@implementation SCLSettingsSyncStatePendingSend

- (unint64_t)status
{
  return 1;
}

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCLSettingsSyncStatePendingSend;
  -[SCLSettingsSyncState didEnterWithPreviousState:](&v7, sel_didEnterWithPreviousState_, a3);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageIdentifier:", 0);

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleCommitTimerWithInterval:", 30.0);

}

- (void)settingsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCLSettingsSyncStatePendingSend;
  -[SCLSettingsSyncState settingsDidChange](&v4, sel_settingsDidChange);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleCommitTimerWithInterval:", 30.0);

}

- (void)xpcActivityStarted
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCLSettingsSyncStatePendingSend;
  -[SCLSettingsSyncState xpcActivityStarted](&v4, sel_xpcActivityStarted);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSync");

}

- (void)commitSettings
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCLSettingsSyncStatePendingSend;
  -[SCLSettingsSyncState commitSettings](&v4, sel_commitSettings);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSync");

}

- (void)significantUserInteractionOccurred
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCLSettingsSyncStatePendingSend;
  -[SCLSettingsSyncState significantUserInteractionOccurred](&v5, sel_significantUserInteractionOccurred);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelCommitTimer");

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSync");

}

- (void)enqueueFailedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCLSettingsSyncStatePendingSend;
  v4 = a3;
  -[SCLSettingsSyncState enqueueFailedWithError:](&v10, sel_enqueueFailedWithError_, v4);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setError:", v4);

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "failedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionToState:", v9);

}

- (void)didEnqueueMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCLSettingsSyncStatePendingSend;
  v4 = a3;
  -[SCLSettingsSyncState didEnqueueMessage:](&v10, sel_didEnqueueMessage_, v4);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageIdentifier:", v4);

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionToState:", v9);

}

@end
