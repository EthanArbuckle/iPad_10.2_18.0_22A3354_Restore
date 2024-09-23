@implementation UISMutableApplicationInitializationContext

- (void)setDefaultSceneToken:(id)a3
{
  FBSSceneIdentityToken *v4;
  FBSSceneIdentityToken *defaultSceneToken;

  v4 = (FBSSceneIdentityToken *)objc_msgSend(a3, "copy");
  defaultSceneToken = self->super._defaultSceneToken;
  self->super._defaultSceneToken = v4;

}

- (void)setMainDisplayContext:(id)a3
{
  UISDisplayContext *v4;
  UISDisplayContext *mainDisplayContext;

  v4 = (UISDisplayContext *)objc_msgSend(a3, "copy");
  mainDisplayContext = self->super._mainDisplayContext;
  self->super._mainDisplayContext = v4;

}

- (void)setLaunchDisplayContext:(id)a3
{
  UISDisplayContext *v4;
  UISDisplayContext *launchDisplayContext;

  v4 = (UISDisplayContext *)objc_msgSend(a3, "copy");
  launchDisplayContext = self->super._launchDisplayContext;
  self->super._launchDisplayContext = v4;

}

- (void)setDeviceContext:(id)a3
{
  UISDeviceContext *v4;
  UISDeviceContext *deviceContext;

  v4 = (UISDeviceContext *)objc_msgSend(a3, "copy");
  deviceContext = self->super._deviceContext;
  self->super._deviceContext = v4;

}

- (void)setCompatibilityContext:(id)a3
{
  UISCompatibilityContext *v4;
  UISCompatibilityContext *compatibilityContext;

  v4 = (UISCompatibilityContext *)objc_msgSend(a3, "copy");
  compatibilityContext = self->super._compatibilityContext;
  self->super._compatibilityContext = v4;

}

- (void)setPersistedSceneIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *persistedSceneIdentifiers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  persistedSceneIdentifiers = self->super._persistedSceneIdentifiers;
  self->super._persistedSceneIdentifiers = v4;

}

- (void)setSupportAppSceneRequests:(BOOL)a3
{
  self->super._supportAppSceneRequests = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UISApplicationInitializationContext initWithUISApplicationInitializationContext:]([UISApplicationInitializationContext alloc], "initWithUISApplicationInitializationContext:", self);
}

@end
