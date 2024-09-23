@implementation SCLSettingsSyncState

- (SCLSettingsSyncState)initWithStateMachine:(id)a3
{
  id v4;
  SCLSettingsSyncState *v5;
  SCLSettingsSyncState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCLSettingsSyncState;
  v5 = -[SCLSettingsSyncState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_stateMachine, v4);

  return v6;
}

- (void)settingsDidChange
{
  void *v2;
  id v3;

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecoveryHistory");

}

- (void)significantUserInteractionOccurred
{
  void *v2;
  id v3;

  -[SCLSettingsSyncState stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecoveryHistory");

}

- (unint64_t)status
{
  return self->_status;
}

- (SCLSettingsSyncStateMachine)stateMachine
{
  return (SCLSettingsSyncStateMachine *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateMachine);
}

@end
