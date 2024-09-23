@implementation ACMAppleConnectImplComponents

+ (id)components
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ACMAppleConnectImplComponents;
  return objc_msgSendSuper2(&v3, sel_components);
}

- (void)dealloc
{
  objc_super v3;

  -[ACMAppleConnectImplComponents setPreferences:](self, "setPreferences:", 0);
  -[ACMAppleConnectImplComponents setUiController:](self, "setUiController:", 0);
  -[ACMAppleConnectImplComponents setSystemInfo:](self, "setSystemInfo:", 0);
  -[ACFComponents setCryptograph:](self, "setCryptograph:", 0);
  -[ACCComponents setTgtStoragePolicy:](self, "setTgtStoragePolicy:", 0);
  if (self->_twoSVController)
  {
    -[ACC2SVControllerProtocol setDelegate:](-[ACMAppleConnectImplComponents twoSVController](self, "twoSVController"), "setDelegate:", 0);
    -[ACMAppleConnectImplComponents setTwoSVController:](self, "setTwoSVController:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACMAppleConnectImplComponents;
  -[ACCComponents dealloc](&v3, sel_dealloc);
}

- (void)cleanupOnMemoryWarning
{
  objc_sync_enter(self);
  -[ACMAppleConnectPreferences cleanupOnMemoryWarning](self->_preferences, "cleanupOnMemoryWarning");

  self->_preferences = 0;
  self->_systemInfo = 0;
  objc_sync_exit(self);
}

- (ACMAppleConnectPreferences)preferences
{
  ACMAppleConnectPreferences *preferences;

  objc_sync_enter(self);
  preferences = self->_preferences;
  if (!preferences)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMAppleConnectImplComponents preferences]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImplComponents.m", 80, 0, "Creating AppleConnectPreferences instance");
    preferences = +[ACMAppleConnectPreferences preferencesWithStore:](ACMAppleConnectPreferences, "preferencesWithStore:", +[ACMPreferencesCFPreferencesStore preferencesStoreWithCFPreferences](ACMPreferencesCFPreferencesStore, "preferencesStoreWithCFPreferences"));
    self->_preferences = preferences;
  }
  objc_sync_exit(self);
  return preferences;
}

- (ACMSystemInfoProtocol)systemInfo
{
  ACMSystemInfoProtocol *systemInfo;

  objc_sync_enter(self);
  systemInfo = self->_systemInfo;
  if (!systemInfo)
  {
    systemInfo = (ACMSystemInfoProtocol *)objc_opt_new();
    self->_systemInfo = systemInfo;
  }
  objc_sync_exit(self);
  return systemInfo;
}

- (ACMUIControllerProtocol)uiController
{
  return 0;
}

- (ACMUIControllerDelegate)uiControllerDelegate
{
  return self->_uiControllerDelegate;
}

- (void)setUIControllerDelegate:(id)a3
{
  if (self->_uiControllerDelegate != a3)
  {
    self->_uiControllerDelegate = (ACMUIControllerDelegate *)a3;
    -[ACMUIControllerProtocol setDelegate:](self->_uiController, "setDelegate:");
  }
}

- (id)createAuthenticationRequest
{
  return (id)objc_opt_new();
}

- (id)createTicketVerificationRequest
{
  return (id)objc_opt_new();
}

- (id)createHandlerWithClass:(Class)a3 context:(id)a4
{
  return (id)objc_msgSend([a3 alloc], "initWithContext:", a4);
}

- (BOOL)uiControllerLoaded
{
  return 0;
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (ACC2SVControllerProtocol)twoSVController
{
  return self->_twoSVController;
}

- (void)setTwoSVController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setSystemInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setUiController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
