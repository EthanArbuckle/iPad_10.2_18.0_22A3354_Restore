@implementation SBLaunchImageOverridesContext

- (SBLaunchImageOverridesContext)initWithSceneID:(id)a3 activationSettings:(id)a4
{
  id v7;
  id v8;
  SBLaunchImageOverridesContext *v9;
  SBLaunchImageOverridesContext *v10;
  BOOL v11;
  uint64_t v12;
  NSString *launchImageName;
  uint64_t v14;
  NSURL *url;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBLaunchImageOverridesContext;
  v9 = -[SBLaunchImageOverridesContext init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneID, a3);
    objc_storeStrong((id *)&v10->_settings, a4);
    v11 = -[SBActivationSettings BOOLForActivationSetting:](v10->_settings, "BOOLForActivationSetting:", 40);
    v10->_ignoreSnapshots = v11 | -[SBActivationSettings BOOLForActivationSetting:](v10->_settings, "BOOLForActivationSetting:", 52);
    -[SBActivationSettings objectForActivationSetting:](v10->_settings, "objectForActivationSetting:", 17);
    v12 = objc_claimAutoreleasedReturnValue();
    launchImageName = v10->_launchImageName;
    v10->_launchImageName = (NSString *)v12;

    -[SBActivationSettings objectForActivationSetting:](v10->_settings, "objectForActivationSetting:", 5);
    v14 = objc_claimAutoreleasedReturnValue();
    url = v10->_url;
    v10->_url = (NSURL *)v14;

  }
  return v10;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (SBActivationSettings)activationSettings
{
  return self->_settings;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)ignoreSnapshots
{
  return self->_ignoreSnapshots;
}

- (NSString)launchImageName
{
  return self->_launchImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_launchImageName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

@end
