@implementation QueryController

- (id)createResultObject
{
  return objc_alloc_init(SFSearchResult_Compatibility);
}

- (NSString)applicationNameForUserAgent
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__QueryController_applicationNameForUserAgent__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  if (applicationNameForUserAgent_onceToken != -1)
    dispatch_once(&applicationNameForUserAgent_onceToken, block);
  return (NSString *)(id)applicationNameForUserAgent_applicationNameForUserAgent;
}

void __46__QueryController_applicationNameForUserAgent__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Spotlight/%@"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)applicationNameForUserAgent_applicationNameForUserAgent;
  applicationNameForUserAgent_applicationNameForUserAgent = v2;

}

- (NSArray)excludedDomainIdentifiers
{
  return 0;
}

- (QueryController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QueryController;
  return -[QueryController init](&v3, sel_init);
}

- (id)userId
{
  return 0;
}

- (void)setCepServerValues:(id)a3
{
  objc_storeStrong((id *)&self->_cep_server_values, a3);
}

- (double)sessionStartTime
{
  return self->_gSessionStartTime;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)supportedDomainIdentifiers
{
  return 0;
}

- (void)sessionReceivedBagWithEnabledDomains:(id)a3
{
  void *v4;
  int v5;
  BOOL v6;
  id v7;

  SPSetInternetDomainsAvailable(objc_msgSend(a3, "count") != 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  if (self->_session)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("disableAsTypedSuggestion"));
    v6 = v5 == -[PRSSearchSession disableAsTypedSuggestion](self->_session, "disableAsTypedSuggestion");
    v4 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "setBool:forKey:", -[PRSSearchSession disableAsTypedSuggestion](self->_session, "disableAsTypedSuggestion"), CFSTR("disableAsTypedSuggestion"));
      objc_msgSend(v7, "synchronize");
      v4 = v7;
    }
  }

}

- (void)updateCorrectionDict:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SPCorrectionProxy sharedHandler](SPCorrectionProxy, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithFileHandle:", v3);

}

- (double)gSessionStartTime
{
  return self->_gSessionStartTime;
}

- (void)setGSessionStartTime:(double)a3
{
  self->_gSessionStartTime = a3;
}

- (NSDictionary)cep_server_values
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCep_server_values:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PRSSearchSession)session
{
  return (PRSSearchSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_cep_server_values, 0);
}

@end
