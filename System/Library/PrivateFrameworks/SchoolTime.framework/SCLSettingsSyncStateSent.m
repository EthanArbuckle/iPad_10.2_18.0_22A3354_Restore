@implementation SCLSettingsSyncStateSent

- (unint64_t)status
{
  return 3;
}

- (void)didEnterWithPreviousState:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCLSettingsSyncStateSent;
  -[SCLSettingsSyncState didEnterWithPreviousState:](&v3, sel_didEnterWithPreviousState_, a3);
}

- (void)messageWasDelivered:(id)a3
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
  v12.super_class = (Class)SCLSettingsSyncStateSent;
  v4 = a3;
  -[SCLSettingsSyncState messageWasDelivered:](&v12, sel_messageWasDelivered_, v4);
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
    objc_msgSend(v10, "syncedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionToState:", v11);

  }
}

- (void)message:(id)a3 didFailToAcknowledgeWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCLSettingsSyncStateSent;
  v6 = a4;
  -[SCLSettingsSyncState message:didFailToAcknowledgeWithError:](&v12, sel_message_didFailToAcknowledgeWithError_, a3, v6);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setError:", v6);

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "failedState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionToState:", v11);

}

- (void)xpcActivityStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCLSettingsSyncStateSent;
  -[SCLSettingsSyncState xpcActivityStarted](&v7, sel_xpcActivityStarted);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), 5, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncStateSent message:didFailToAcknowledgeWithError:](self, "message:didFailToAcknowledgeWithError:", v6, v3);

}

- (void)settingsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLSettingsSyncStateSent;
  -[SCLSettingsSyncState settingsDidChange](&v6, sel_settingsDidChange);
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingSendState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToState:", v5);

}

@end
