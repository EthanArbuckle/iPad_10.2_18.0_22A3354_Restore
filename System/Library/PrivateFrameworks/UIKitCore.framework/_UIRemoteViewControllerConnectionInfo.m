@implementation _UIRemoteViewControllerConnectionInfo

- (_UIViewServiceInterface)interface
{
  return (_UIViewServiceInterface *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)viewControllerOperatorProxy
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setViewControllerOperatorProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)serviceViewControllerProxy
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceViewControllerProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)serviceViewControllerControlMessageProxy
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceViewControllerControlMessageProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)textEffectsOperatorProxy
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setTextEffectsOperatorProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)serviceViewControllerSupportedInterfaceOrientations
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServiceViewControllerSupportedInterfaceOrientations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BSMachPortSendRight)serviceAccessibilityServerPortWrapper
{
  return (BSMachPortSendRight *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServiceAccessibilityServerPortWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (void)setPreferredStatusBarStyle:(int64_t)a3
{
  self->_preferredStatusBarStyle = a3;
}

- (int)preferredStatusBarVisibility
{
  return self->_preferredStatusBarVisibility;
}

- (void)setPreferredStatusBarVisibility:(int)a3
{
  self->_preferredStatusBarVisibility = a3;
}

- (_UIHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (_UIHostedWindowHostingHandle)textEffectsWindowHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTextEffectsWindowHostingHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (_UIHostedWindowHostingHandle)textEffectsWindowAboveStatusBarHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTextEffectsWindowAboveStatusBarHostingHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (_UIHostedWindowHostingHandle)remoteKeyboardsWindowHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRemoteKeyboardsWindowHostingHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteKeyboardsWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_textEffectsWindowAboveStatusBarHostingHandle, 0);
  objc_storeStrong((id *)&self->_textEffectsWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_hostedWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_serviceAccessibilityServerPortWrapper, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerSupportedInterfaceOrientations, 0);
  objc_storeStrong(&self->_textEffectsOperatorProxy, 0);
  objc_storeStrong(&self->_serviceViewControllerControlMessageProxy, 0);
  objc_storeStrong(&self->_serviceViewControllerProxy, 0);
  objc_storeStrong(&self->_viewControllerOperatorProxy, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
