@implementation SFSSOspreyTTSClientFactory

- (SFSSOspreyTTSClientFactory)init
{
  SFSSOspreyTTSClientFactory *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *ospreyClientFactory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSSOspreyTTSClientFactory;
  v2 = -[SFSSOspreyTTSClientFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    ospreyClientFactory = v2->_ospreyClientFactory;
    v2->_ospreyClientFactory = v3;

  }
  return v2;
}

- (id)getOspreyClientByUrl:(id)a3
{
  -[SFSSOspreyTTSClientFactory getOspreyClientByUrl:useBlazar:enableAuthentication:](self, "getOspreyClientByUrl:useBlazar:enableAuthentication:", a3, 1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getOspreyClientByUrl:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  SFSSOspreyTTSClient *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  int v18;
  id v19;
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[NSMutableDictionary allKeys](self->_ospreyClientFactory, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if (!v10)
  {
    v13 = v8;
    if ((objc_msgSend(v13, "containsString:", CFSTR("c02")) & 1) != 0)
    {
      v14 = CFSTR("-c02");
    }
    else
    {
      v15 = v13;
      if (!objc_msgSend(v13, "containsString:", CFSTR("c03")))
        goto LABEL_10;
      v14 = CFSTR("-c03");
    }
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_24E246F88);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v12 = -[SFSSOspreyTTSClient initWithURL:useBlazar:enableAuthentication:]([SFSSOspreyTTSClient alloc], "initWithURL:useBlazar:enableAuthentication:", v15, v6, v5);
    if ((objc_msgSend(v13, "containsString:", CFSTR("c02")) & 1) != 0)
    {
      v16 = CFSTR("2");
    }
    else
    {
      if (!objc_msgSend(v13, "containsString:", CFSTR("c03")))
      {
LABEL_15:
        -[NSMutableDictionary setValue:forKey:](self->_ospreyClientFactory, "setValue:forKey:", v12, v13);

        goto LABEL_16;
      }
      v16 = CFSTR("3");
    }
    -[SFSSOspreyTTSClient setCarryClusterId:](v12, "setCarryClusterId:", v16);
    goto LABEL_15;
  }
  SFSSGetLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v8;
    _os_log_impl(&dword_21E284000, v11, OS_LOG_TYPE_INFO, "Get TTS Osprey client with URL: %@", (uint8_t *)&v18, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_ospreyClientFactory, "objectForKey:", v8);
  v12 = (SFSSOspreyTTSClient *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v12;
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_ospreyClientFactory, "removeAllObjects");
}

- (NSMutableDictionary)ospreyClientFactory
{
  return self->_ospreyClientFactory;
}

- (void)setOspreyClientFactory:(id)a3
{
  objc_storeStrong((id *)&self->_ospreyClientFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ospreyClientFactory, 0);
}

+ (id)sharedInstance
{
  if (+[SFSSOspreyTTSClientFactory sharedInstance]::onceToken != -1)
    dispatch_once(&+[SFSSOspreyTTSClientFactory sharedInstance]::onceToken, &__block_literal_global_73);
  return (id)+[SFSSOspreyTTSClientFactory sharedInstance]::__sharedInstance;
}

void __44__SFSSOspreyTTSClientFactory_sharedInstance__block_invoke()
{
  SFSSOspreyTTSClientFactory *v0;
  void *v1;

  v0 = objc_alloc_init(SFSSOspreyTTSClientFactory);
  v1 = (void *)+[SFSSOspreyTTSClientFactory sharedInstance]::__sharedInstance;
  +[SFSSOspreyTTSClientFactory sharedInstance]::__sharedInstance = (uint64_t)v0;

}

@end
