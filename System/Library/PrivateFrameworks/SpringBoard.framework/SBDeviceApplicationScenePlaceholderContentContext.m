@implementation SBDeviceApplicationScenePlaceholderContentContext

- (SBDeviceApplicationScenePlaceholderContentContext)initWithActivationSettings:(id)a3
{
  id v5;
  SBDeviceApplicationScenePlaceholderContentContext *v6;
  SBDeviceApplicationScenePlaceholderContentContext *v7;
  id *p_settings;
  uint64_t v9;
  NSURL *url;
  uint64_t v11;
  NSString *requestedLaunchIdentifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBDeviceApplicationScenePlaceholderContentContext;
  v6 = -[SBDeviceApplicationScenePlaceholderContentContext init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    p_settings = (id *)&v6->_settings;
    objc_storeStrong((id *)&v6->_settings, a3);
    -[SBActivationSettings objectForActivationSetting:](v7->_settings, "objectForActivationSetting:", 5);
    v9 = objc_claimAutoreleasedReturnValue();
    url = v7->_url;
    v7->_url = (NSURL *)v9;

    -[SBActivationSettings objectForActivationSetting:](v7->_settings, "objectForActivationSetting:", 17);
    v11 = objc_claimAutoreleasedReturnValue();
    requestedLaunchIdentifier = v7->_requestedLaunchIdentifier;
    v7->_requestedLaunchIdentifier = (NSString *)v11;

    if (v7->_requestedLaunchIdentifier
      || (objc_msgSend(*p_settings, "BOOLForActivationSetting:", 40) & 1) != 0
      || objc_msgSend(*p_settings, "BOOLForActivationSetting:", 52))
    {
      v7->_preferredContentType = 2;
    }
    if (objc_msgSend(v5, "BOOLForActivationSetting:", 9))
      v7->_preferredContentType = 1;
  }

  return v7;
}

- (void)setSizingPolicy:(int64_t)a3
{
  self->_sizingPolicy = a3;
}

- (void)setLayoutEnvironment:(int64_t)a3
{
  self->_layoutEnvironment = a3;
}

- (void)setHasOrientationMismatchForClassicApp:(BOOL)a3
{
  self->_hasOrientationMismatchForClassicApp = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (SBActivationSettings)activationSettings
{
  return self->_settings;
}

- (BOOL)prefersLiveXIB
{
  return self->_prefersLiveXIB;
}

- (unint64_t)preferredContentType
{
  return self->_preferredContentType;
}

- (int64_t)layoutEnvironment
{
  return self->_layoutEnvironment;
}

- (BOOL)canShowUserContent
{
  return 1;
}

- (NSString)requestedLaunchIdentifier
{
  return self->_requestedLaunchIdentifier;
}

- (BOOL)hasOrientationMismatchForClassicApp
{
  return self->_hasOrientationMismatchForClassicApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_requestedLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (SBDeviceApplicationScenePlaceholderContentContext)init
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationScenePlaceholderContentContext.m"), 43, CFSTR("Initializer unavailable; please use -[SBDeviceApplicationScenePlaceholderContentContext initWithDeviceApplicationSceneHandle:activationSettings:] instead."));

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationScenePlaceholderContentContext;
  return -[SBDeviceApplicationScenePlaceholderContentContext init](&v6, sel_init);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBMutableDeviceApplicationScenePlaceholderContentContext *v4;
  void *v5;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v6;
  void *v7;
  void *v8;

  v4 = [SBMutableDeviceApplicationScenePlaceholderContentContext alloc];
  -[SBDeviceApplicationScenePlaceholderContentContext activationSettings](self, "activationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:](v4, "initWithActivationSettings:", v5);

  -[SBDeviceApplicationScenePlaceholderContentContext setLayoutEnvironment:](v6, "setLayoutEnvironment:", -[SBDeviceApplicationScenePlaceholderContentContext layoutEnvironment](self, "layoutEnvironment"));
  -[SBDeviceApplicationScenePlaceholderContentContext setPrefersLiveXIB:](v6, "setPrefersLiveXIB:", -[SBDeviceApplicationScenePlaceholderContentContext prefersLiveXIB](self, "prefersLiveXIB"));
  -[SBDeviceApplicationScenePlaceholderContentContext setPreferredContentType:](v6, "setPreferredContentType:", -[SBDeviceApplicationScenePlaceholderContentContext preferredContentType](self, "preferredContentType"));
  -[SBDeviceApplicationScenePlaceholderContentContext url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationScenePlaceholderContentContext setUrl:](v6, "setUrl:", v7);

  -[SBDeviceApplicationScenePlaceholderContentContext requestedLaunchIdentifier](self, "requestedLaunchIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationScenePlaceholderContentContext setRequestedLaunchIdentifier:](v6, "setRequestedLaunchIdentifier:", v8);

  -[SBDeviceApplicationScenePlaceholderContentContext setHasOrientationMismatchForClassicApp:](v6, "setHasOrientationMismatchForClassicApp:", -[SBDeviceApplicationScenePlaceholderContentContext hasOrientationMismatchForClassicApp](self, "hasOrientationMismatchForClassicApp"));
  -[SBDeviceApplicationScenePlaceholderContentContext setSizingPolicy:](v6, "setSizingPolicy:", -[SBDeviceApplicationScenePlaceholderContentContext sizingPolicy](self, "sizingPolicy"));
  return v6;
}

- (void)setActivationSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRequestedLaunchIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPrefersLiveXIB:(BOOL)a3
{
  self->_prefersLiveXIB = a3;
}

- (void)setPreferredContentType:(unint64_t)a3
{
  self->_preferredContentType = a3;
}

- (int64_t)sizingPolicy
{
  return self->_sizingPolicy;
}

@end
