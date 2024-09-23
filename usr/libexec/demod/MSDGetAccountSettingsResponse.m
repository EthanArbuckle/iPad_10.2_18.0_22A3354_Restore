@implementation MSDGetAccountSettingsResponse

- (NSDictionary)accountSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSettings, 0);
}

@end
