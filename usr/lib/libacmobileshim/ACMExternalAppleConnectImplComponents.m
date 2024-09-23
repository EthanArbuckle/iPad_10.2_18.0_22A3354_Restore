@implementation ACMExternalAppleConnectImplComponents

+ (id)components
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ACMExternalAppleConnectImplComponents;
  return objc_msgSendSuper2(&v3, sel_components);
}

- (id)twoSVController
{
  ACC2SVControllerProtocol *twoSVController;

  objc_sync_enter(self);
  twoSVController = self->super._twoSVController;
  if (!twoSVController)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImplComponents twoSVController]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImplComponents.m", 41, 0, "Creating 2SV Controller instance");
    twoSVController = (ACC2SVControllerProtocol *)objc_opt_new();
    self->super._twoSVController = twoSVController;
  }
  objc_sync_exit(self);
  return twoSVController;
}

- (id)preferences
{
  ACMExternalAppleConnectPreferences *preferences;

  objc_sync_enter(self);
  preferences = (ACMExternalAppleConnectPreferences *)self->super._preferences;
  if (!preferences)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImplComponents preferences]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImplComponents.m", 54, 0, "Creating External AppleConnect Preferences instance");
    preferences = +[ACMAppleConnectPreferences preferencesWithStore:](ACMExternalAppleConnectPreferences, "preferencesWithStore:", +[ACMPreferencesCFPreferencesStore preferencesStoreWithCFPreferences](ACMPreferencesCFPreferencesStore, "preferencesStoreWithCFPreferences"));
    self->super._preferences = &preferences->super;
  }
  objc_sync_exit(self);
  return preferences;
}

- (id)uiController
{
  ACMUIControllerProtocol *uiController;

  objc_sync_enter(self);
  uiController = self->super._uiController;
  if (!uiController)
  {
    -[ACMSystemInfoProtocol isRunningOnModernMobileSystem](-[ACMAppleConnectImplComponents systemInfo](self, "systemInfo"), "isRunningOnModernMobileSystem");
    objc_opt_class();
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImplComponents uiController]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImplComponents.m", 78, 0, "Creating External UI Controller");
    self->super._uiController = (ACMUIControllerProtocol *)objc_opt_new();
    -[ACMUIControllerProtocol setDelegate:](self->super._uiController, "setDelegate:", -[ACMAppleConnectImplComponents uiControllerDelegate](self, "uiControllerDelegate"));
    uiController = self->super._uiController;
  }
  objc_sync_exit(self);
  return uiController;
}

- (id)createAuthenticationRequest
{
  return (id)objc_opt_new();
}

- (id)createAppleConnectImpl
{
  return -[ACMExternalAppleConnectImpl initWithMasterObject:]([ACMExternalAppleConnectImpl alloc], "initWithMasterObject:", 0);
}

- (id)createAppleConnectImplWithMasterObject:(id)a3
{
  return -[ACMExternalAppleConnectImpl initWithMasterObject:]([ACMExternalAppleConnectImpl alloc], "initWithMasterObject:", a3);
}

- (id)createHandlerWithClass:(Class)a3 context:(id)a4
{
  objc_super v8;

  if ((Class)objc_opt_class() == a3)
    return +[ACCHTTPHandler handlerWithContext:](ACMHTTPExternalAuthenticationHandler, "handlerWithContext:", a4);
  v8.receiver = self;
  v8.super_class = (Class)ACMExternalAppleConnectImplComponents;
  return -[ACMAppleConnectImplComponents createHandlerWithClass:context:](&v8, sel_createHandlerWithClass_context_, a3, a4);
}

- (BOOL)uiControllerLoaded
{
  BOOL v3;

  objc_sync_enter(self);
  v3 = self->super._uiController != 0;
  objc_sync_exit(self);
  return v3;
}

- (void)unloadUIController
{
  objc_sync_enter(self);
  -[ACMUIControllerProtocol setDelegate:](self->super._uiController, "setDelegate:", 0);

  self->super._uiController = 0;
  objc_sync_exit(self);
}

@end
