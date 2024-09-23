@implementation SBLoginAppClientSettingObserverContext

- (UIApplicationSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (SBSUILoginUISceneClientSettings)updatedClientSettings
{
  return self->_updatedClientSettings;
}

- (void)setUpdatedClientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_updatedClientSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedClientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
