@implementation SXDebugAdvertisementSettingsProvider

- (SXDebugAdvertisementSettingsProvider)initWithDebugSettings:(id)a3
{
  id v5;
  SXDebugAdvertisementSettingsProvider *v6;
  SXDebugAdvertisementSettingsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDebugAdvertisementSettingsProvider;
  v6 = -[SXDebugAdvertisementSettingsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_debugSettings, a3);

  return v7;
}

- (SXAdvertisingSettings)debugSettings
{
  return self->_debugSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSettings, 0);
}

@end
