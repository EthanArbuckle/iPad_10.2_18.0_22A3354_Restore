@implementation iCloudMailUnifiedSettingsProviderObjc

- (iCloudMailUnifiedSettingsProviderObjc)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  iCloudMailUnifiedSettingsProviderObjc *v8;
  iCloudMailUnifiedSettingsProvider *v9;
  iCloudMailUnifiedSettingsProvider *provider;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)iCloudMailUnifiedSettingsProviderObjc;
  v8 = -[iCloudMailUnifiedSettingsProviderObjc init](&v12, sel_init);
  if (v8)
  {
    v9 = -[iCloudMailUnifiedSettingsProvider initWithAccountManager:presenter:]([iCloudMailUnifiedSettingsProvider alloc], "initWithAccountManager:presenter:", v6, v7);
    provider = v8->provider;
    v8->provider = v9;

  }
  return v8;
}

- (void)navigateToiCloudMailSettings
{
  -[iCloudMailUnifiedSettingsProvider navigateToiCloudMailSettingsWith:](self->provider, "navigateToiCloudMailSettingsWith:", 0);
}

- (void)navigateToiCloudMailSettingsWithDeeplink:(id)a3
{
  -[iCloudMailUnifiedSettingsProvider navigateToiCloudMailSettingsWith:](self->provider, "navigateToiCloudMailSettingsWith:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->provider, 0);
}

@end
