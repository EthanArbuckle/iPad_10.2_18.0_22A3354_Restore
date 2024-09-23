@implementation SXWebsiteDataStoreFactory

- (SXWebsiteDataStoreFactory)initWithProxyConfiguration:(id)a3
{
  id v5;
  SXWebsiteDataStoreFactory *v6;
  SXWebsiteDataStoreFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebsiteDataStoreFactory;
  v6 = -[SXWebsiteDataStoreFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxyConfiguration, a3);

  return v7;
}

- (id)createWebsiteDataStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA9C8]), "initNonPersistentConfiguration");
  -[SXProxyConfiguration proxyAutoConfigScript](self->_proxyConfiguration, "proxyAutoConfigScript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SXProxyConfiguration usePrivateRelay](self->_proxyConfiguration, "usePrivateRelay"))
  {
    objc_msgSend(v3, "setSourceApplicationSecondaryIdentifier:", CFSTR("com.apple.news.embedded-content"));
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BDB76A8]);
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x24BDB76B0], *MEMORY[0x24BDB76B8]);
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF5B78]);
    objc_msgSend(v3, "setProxyConfiguration:", v5);
    objc_msgSend(v3, "setRequiresSecureHTTPSProxyConnection:", 1);
    objc_msgSend(v3, "setPreventsSystemHTTPProxyAuthentication:", 1);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA928]), "_initWithConfiguration:", v3);
  objc_msgSend(v6, "_setResourceLoadStatisticsEnabled:", 1);

  return v6;
}

- (SXProxyConfiguration)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
}

@end
