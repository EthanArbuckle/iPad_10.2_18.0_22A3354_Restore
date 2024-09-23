@implementation SBBiometricMonitorTestRecipe

- (id)title
{
  return CFSTR("Biometric Monitor UI");
}

- (void)handleVolumeIncrease
{
  SBBiometricMonitorTestRecipeDummyDataSource *v3;
  SBBiometricMonitorTestRecipeDummyDataSource *dataSource;
  SBBiometricMonitorUI *v5;
  SBBiometricMonitorUI *monitorUI;
  SBBiometricMonitorUI *v7;
  void *v8;

  if (self->_monitorUI)
  {
    -[SBBiometricMonitorTestRecipeDummyDataSource cycleState](self->_dataSource, "cycleState");
  }
  else
  {
    v3 = objc_alloc_init(SBBiometricMonitorTestRecipeDummyDataSource);
    dataSource = self->_dataSource;
    self->_dataSource = v3;

    v5 = objc_alloc_init(SBBiometricMonitorUI);
    monitorUI = self->_monitorUI;
    self->_monitorUI = v5;

    v7 = self->_monitorUI;
    -[SBBiometricMonitorTestRecipe windowScene](self, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBiometricMonitorUI setWindowScene:](v7, "setWindowScene:", v8);

    -[SBBiometricMonitorUI setDataSource:](self->_monitorUI, "setDataSource:", self->_dataSource);
    -[SBBiometricMonitorUI enable](self->_monitorUI, "enable");
  }
}

- (void)handleVolumeDecrease
{
  SBBiometricMonitorUI *monitorUI;
  SBBiometricMonitorTestRecipeDummyDataSource *dataSource;

  -[SBBiometricMonitorUI disable](self->_monitorUI, "disable");
  monitorUI = self->_monitorUI;
  self->_monitorUI = 0;

  dataSource = self->_dataSource;
  self->_dataSource = 0;

}

- (void)windowSceneDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBBiometricMonitorTestRecipe windowScene](self, "windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[SBBiometricMonitorTestRecipe setWindowScene:](self, "setWindowScene:", v6);
    v5 = v6;
  }

}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_monitorUI, 0);
}

@end
