@implementation ISClient

- (ISClient)init
{
  ISClient *v3;
  NSLock *v4;
  NSLock *lock;
  void *v6;
  objc_super v8;

  __ISRecordSPIClassUsage(self);
  v8.receiver = self;
  v8.super_class = (Class)ISClient;
  v3 = -[ISClient init](&v8, sel_init);
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v3->_lock;
    v3->_lock = v4;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__softwareMapInvalidatedNotification_, CFSTR("ISSoftwareMapInvalidatedNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ISSoftwareMapInvalidatedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)ISClient;
  -[ISClient dealloc](&v4, sel_dealloc);
}

+ (id)currentClient
{
  if (currentClient_sOnce != -1)
    dispatch_once(&currentClient_sOnce, &__block_literal_global_8);
  return (id)currentClient_sClient;
}

void __25__ISClient_currentClient__block_invoke()
{
  ISClient *v0;
  void *v1;

  v0 = objc_alloc_init(ISClient);
  v1 = (void *)currentClient_sClient;
  currentClient_sClient = (uint64_t)v0;

}

- (NSString)appleClientApplication
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_appleClientApplication, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)appleClientVersions
{
  NSString *appleClientVersions;
  void *v4;
  NSObject *v6;
  _QWORD block[5];

  -[NSLock lock](self->_lock, "lock");
  appleClientVersions = self->_appleClientVersions;
  if (appleClientVersions)
  {
    v4 = (void *)-[NSString copy](appleClientVersions, "copy");
    -[NSLock unlock](self->_lock, "unlock");
    return (NSString *)v4;
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__ISClient_appleClientVersions__block_invoke;
    block[3] = &unk_24C43C128;
    block[4] = self;
    dispatch_async(v6, block);

    return (NSString *)0;
  }
}

void __31__ISClient_appleClientVersions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_appleClientVersions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lock");
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unlock");
}

- (NSDictionary)clientProvidedHeaders
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[ISClient lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = (void *)-[NSDictionary copy](self->_clientProvidedHeaders, "copy");
  -[ISClient lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSDictionary *)v7;
}

- (NSString)identifier
{
  NSString *identifier;
  void *v4;
  NSString *v5;
  NSString *v6;
  void *v7;

  -[NSLock lock](self->_lock, "lock");
  identifier = self->_identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_identifier;
    self->_identifier = v5;

    identifier = self->_identifier;
  }
  v7 = (void *)-[NSString copy](identifier, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v7;
}

- (NSString)partnerHeader
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_partnerHeader, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setAppleClientApplication:(id)a3
{
  NSString *v4;
  NSString *appleClientApplication;
  NSString *v6;

  v6 = (NSString *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_appleClientApplication != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    appleClientApplication = self->_appleClientApplication;
    self->_appleClientApplication = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setClientProvidedHeaders:(id)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *clientProvidedHeaders;
  void *v7;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  -[ISClient lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  if (self->_clientProvidedHeaders != v8)
  {
    v5 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
    clientProvidedHeaders = self->_clientProvidedHeaders;
    self->_clientProvidedHeaders = v5;

  }
  -[ISClient lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  NSString *v6;

  v6 = (NSString *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_identifier != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    identifier = self->_identifier;
    self->_identifier = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setPartnerHeader:(id)a3
{
  NSString *partnerHeader;
  NSString *v5;
  NSString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;

  v12 = (NSString *)a3;
  -[NSLock lock](self->_lock, "lock");
  partnerHeader = self->_partnerHeader;
  if (partnerHeader == v12 || (-[NSString isEqual:](partnerHeader, "isEqual:", v12) & 1) != 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    v5 = (NSString *)-[NSString copy](v12, "copy");
    v6 = self->_partnerHeader;
    self->_partnerHeader = v5;

    -[NSLock unlock](self->_lock, "unlock");
    v7 = objc_alloc(MEMORY[0x24BDBCE70]);
    v8 = v7;
    if (v12)
    {
      v9 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", CFSTR("ISClientValueParameter"), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v10, CFSTR("ISClientValueParameter"), 0);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("ISClientPartnerHeaderChangedNotification"), self, v9);

  }
}

- (void)setUserAgent:(id)a3
{
  NSString *v4;
  NSString *userAgent;
  NSString *v6;

  v6 = (NSString *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_userAgent != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    userAgent = self->_userAgent;
    self->_userAgent = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (NSString)userAgent
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_userAgent, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (id)localStoreFrontID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeFrontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_softwareMapInvalidatedNotification:(id)a3
{
  NSString *appleClientVersions;

  -[NSLock lock](self->_lock, "lock", a3);
  appleClientVersions = self->_appleClientVersions;
  self->_appleClientVersions = 0;

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_appleClientVersions
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = objc_msgSend(&unk_24C453360, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(&unk_24C453360);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = objc_alloc(MEMORY[0x24BE08328]);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:", v9);

        objc_msgSend(v10, "clientVersion");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString doubleValue](v11, "doubleValue");
        if (v12 == 0.0)
        {

          v11 = CFSTR("??");
        }
        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@/%@"), v14, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v15);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_24C453360, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("; "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientProvidedHeaders, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_partnerHeader, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appleClientApplication, 0);
  objc_storeStrong((id *)&self->_appleClientVersions, 0);
}

@end
