@implementation SBKTransaction

- (SBKTransaction)initWithDomain:(id)a3 requestURL:(id)a4
{
  id v7;
  id v8;
  SBKTransaction *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *userInfo;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBKTransaction;
  v9 = -[SBKTransaction init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    userInfo = v9->_userInfo;
    v9->_userInfo = v10;

    objc_storeStrong((id *)&v9->_requestURL, a4);
    objc_storeStrong((id *)&v9->_domain, a3);
  }

  return v9;
}

- (SBKTransaction)init
{
  return -[SBKTransaction initWithDomain:requestURL:](self, "initWithDomain:requestURL:", 0, 0);
}

- (void)setTransactionContext:(id)a3 forKey:(id)a4
{
  id v6;
  SBKTransaction *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary setValue:forKey:](v7->_userInfo, "setValue:forKey:", v8, v6);
  objc_sync_exit(v7);

}

- (id)transactionContextForKey:(id)a3
{
  id v4;
  SBKTransaction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary valueForKey:](v5->_userInfo, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransaction.m"), 51, CFSTR("Subclass must implement"));

}

- (id)clampsKey
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransaction.m"), 56, CFSTR("Subclass must implement"));

  return 0;
}

- (id)newRequest
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransaction.m"), 62, CFSTR("Subclass must implement"));

  return 0;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_requestURL, a3);
}

- (SBKRequest)activeRequest
{
  return self->_activeRequest;
}

- (void)setActiveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activeRequest, a3);
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
