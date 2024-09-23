@implementation SCLSettingsSyncStateSynced

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SCLSettingsSyncState stateMachine](self, "stateMachine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setError:", 0);

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessageIdentifier:", 0);

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearRecoveryHistory");

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelRetryActivity");

}

- (unint64_t)status
{
  return 0;
}

- (void)settingsDidChange
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

@end
