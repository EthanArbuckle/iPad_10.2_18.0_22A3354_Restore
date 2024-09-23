@implementation VSIdentityProviderChannelAppsResponse

- (VSIdentityProviderChannelAppsResponse)init
{
  VSIdentityProviderChannelAppsResponse *v2;
  VSIdentityProviderChannelAppsResponse *v3;
  NSArray *allApps;
  NSDictionary *appsByChannelID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSIdentityProviderChannelAppsResponse;
  v2 = -[VSIdentityProviderChannelAppsResponse init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    allApps = v2->_allApps;
    v2->_allApps = (NSArray *)MEMORY[0x24BDBD1A8];

    appsByChannelID = v3->_appsByChannelID;
    v3->_appsByChannelID = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v3;
}

- (NSArray)allApps
{
  return self->_allApps;
}

- (void)setAllApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)appsByChannelID
{
  return self->_appsByChannelID;
}

- (void)setAppsByChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsByChannelID, 0);
  objc_storeStrong((id *)&self->_allApps, 0);
}

@end
