@implementation _SBSUIRemoteAlertServiceObserverHandle

- (void)remoteAlertHandleDidActivate:(id)a3
{
  BSDispatchMain();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  BSDispatchMain();
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  BSDispatchMain();
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)deactivationHandler
{
  return self->_deactivationHandler;
}

- (void)setDeactivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);
}

@end
