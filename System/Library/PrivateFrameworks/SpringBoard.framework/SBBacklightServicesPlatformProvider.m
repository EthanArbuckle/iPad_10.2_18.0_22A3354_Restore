@implementation SBBacklightServicesPlatformProvider

- (SBBacklightServicesPlatformProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBacklightServicesPlatformProvider.m"), 24, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBBacklightServicesPlatformProvider init]",
    v5);

  return 0;
}

- (SBBacklightServicesPlatformProvider)initWithBacklightEnvironmentSessionProvider:(id)a3
{
  id v4;
  SBBacklightServicesPlatformProvider *v5;
  SBBacklightPlatformProvider *v6;
  SBBacklightPlatformProvider *backlightPlatformProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBacklightServicesPlatformProvider;
  v5 = -[SBBacklightServicesPlatformProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SBBacklightPlatformProvider initWithBacklightEnvironmentSessionProvider:]([SBBacklightPlatformProvider alloc], "initWithBacklightEnvironmentSessionProvider:", v4);
    backlightPlatformProvider = v5->_backlightPlatformProvider;
    v5->_backlightPlatformProvider = v6;

  }
  return v5;
}

- (void)completeInitializationAfterBLSStartup
{
  -[SBBacklightPlatformProvider completeInitializationAfterBLSStartup](self->_backlightPlatformProvider, "completeInitializationAfterBLSStartup");
}

- (UIWindowScene)windowScene
{
  return -[SBBacklightPlatformProvider windowScene](self->_backlightPlatformProvider, "windowScene");
}

- (void)setWindowScene:(id)a3
{
  -[SBBacklightPlatformProvider setWindowScene:](self->_backlightPlatformProvider, "setWindowScene:", a3);
}

- (SBBacklightSignificantUserInteractionMonitor)significantUserInteractionMonitor
{
  return -[SBBacklightPlatformProvider significantUserInteractionMonitor](self->_backlightPlatformProvider, "significantUserInteractionMonitor");
}

- (void)setSignificantUserInteractionMonitor:(id)a3
{
  -[SBBacklightPlatformProvider setSignificantUserInteractionMonitor:](self->_backlightPlatformProvider, "setSignificantUserInteractionMonitor:", a3);
}

- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator
{
  return -[SBBacklightPlatformProvider alwaysOnPolicyCoordinator](self->_backlightPlatformProvider, "alwaysOnPolicyCoordinator");
}

- (BLSHBacklightPlatformProvider)backlightPlatformProvider
{
  return (BLSHBacklightPlatformProvider *)self->_backlightPlatformProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightPlatformProvider, 0);
}

@end
