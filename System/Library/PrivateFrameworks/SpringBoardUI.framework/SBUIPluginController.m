@implementation SBUIPluginController

- (void)setVisible:(BOOL)a3
{
  id v4;

  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBUIPluginVisibilityDidChangeNotification"), self, 0);

  }
}

- (BOOL)supportedAndEnabled
{
  return 1;
}

- (BOOL)wantsActivationEvent:(int)a3 eventSource:(int)a4 interval:(double *)a5
{
  return 0;
}

- (BOOL)handleActivationEvent:(int)a3 eventSource:(int)a4 context:(void *)a5
{
  return 0;
}

- (BOOL)handledPasscodeUnlockWithCompletion:(id)a3
{
  return 0;
}

- (BOOL)handledButtonDownEventFromSource:(int)a3
{
  return 0;
}

- (BOOL)handledButtonUpEventFromSource:(int)a3
{
  return 0;
}

- (BOOL)handledButtonTapFromSource:(int)a3
{
  return 0;
}

- (id)viewControllerForActivationContext:(id)a3
{
  return 0;
}

- (SBUIPluginControllerHost)host
{
  return (SBUIPluginControllerHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
}

@end
