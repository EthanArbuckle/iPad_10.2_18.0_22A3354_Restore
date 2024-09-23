@implementation MSDEnrollResponse

- (NSString)credential
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)settingsDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSettingsDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)hubProtocolVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubProtocolVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hubProtocolVersion, 0);
  objc_storeStrong((id *)&self->_settingsDict, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
