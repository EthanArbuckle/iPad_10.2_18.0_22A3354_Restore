@implementation RMAudioListenerPoseProviderConfiguration

- (RMAudioListenerPoseProviderConfiguration)initWithUniqueIdentifier:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  RMAudioListenerPoseProviderConfiguration *v10;
  RMAudioListenerPoseProviderConfiguration *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RMAudioListenerPoseProviderConfiguration;
  v10 = -[RMAudioListenerPoseProviderConfiguration init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[RMAudioListenerPoseProviderConfiguration setIdentifier:](v10, "setIdentifier:", v8);
    -[RMAudioListenerPoseProviderConfiguration setTempestOptions:](v11, "setTempestOptions:", v9);
    -[RMAudioListenerPoseProviderConfiguration setForceSessionRestart:](v11, "setForceSessionRestart:", v5);
  }

  return v11;
}

- (NSDictionary)tempestOptions
{
  return self->_tempestOptions;
}

- (void)setTempestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_tempestOptions, a3);
}

- (BOOL)forceSessionRestart
{
  return self->_forceSessionRestart;
}

- (void)setForceSessionRestart:(BOOL)a3
{
  self->_forceSessionRestart = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_tempestOptions, 0);
}

@end
