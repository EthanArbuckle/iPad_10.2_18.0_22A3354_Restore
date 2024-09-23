@implementation SCLSettingsSyncStateSending

- (unint64_t)status
{
  return 2;
}

- (void)settingsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLSettingsSyncStateSending;
  -[SCLSettingsSyncState settingsDidChange](&v6, sel_settingsDidChange);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingSendState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToState:", v5);

}

- (void)message:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SCLSettingsSyncStateSending;
  v7 = a3;
  -[SCLSettingsSyncState message:failedWithError:](&v17, sel_message_failedWithError_, v7, v6);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine", v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    -[SCLSettingsSyncState stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setError:", v6);

    -[SCLSettingsSyncState stateMachine](self, "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSettingsSyncState stateMachine](self, "stateMachine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "failedState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionToState:", v16);

  }
}

- (void)messageDidSend:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCLSettingsSyncStateSending;
  v4 = a3;
  -[SCLSettingsSyncState messageDidSend:](&v12, sel_messageDidSend_, v4);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    -[SCLSettingsSyncState stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSettingsSyncState stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionToState:", v11);

  }
}

@end
