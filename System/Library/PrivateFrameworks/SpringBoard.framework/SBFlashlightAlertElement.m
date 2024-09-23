@implementation SBFlashlightAlertElement

+ (id)flashlightUnavailableAlert
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:state:", 1, 2);
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (SAAlertHosting)alertHost
{
  return (SAAlertHosting *)objc_loadWeakRetained((id *)&self->_alertHost);
}

- (void)setAlertHost:(id)a3
{
  objc_storeWeak((id *)&self->_alertHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertHost);
}

@end
