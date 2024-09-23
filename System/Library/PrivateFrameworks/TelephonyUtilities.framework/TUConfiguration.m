@implementation TUConfiguration

- (TUConfiguration)initWithDataSource:(id)a3
{
  id v5;
  TUConfiguration *v6;
  TUConfiguration *v7;
  TUDelegateController *v8;
  TUDelegateController *delegateController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUConfiguration;
  v6 = -[TUConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(TUDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = v8;

  }
  return v7;
}

- (unint64_t)announceCalls
{
  void *v2;
  unint64_t v3;

  -[TUConfiguration numberForKey:](self, "numberForKey:", CFSTR("announceCalls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setAnnounceCalls:(unint64_t)a3
{
  void *v4;
  id v5;

  -[TUConfiguration dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("announceCalls"));

}

- (NSString)conversationLinkBaseURLString
{
  void *v2;
  void *v3;

  -[TUConfiguration dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("conversationLinkBaseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)conversationLinkBaseURL
{
  void *v2;
  void *v3;

  -[TUConfiguration conversationLinkBaseURLString](self, "conversationLinkBaseURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v2);
  else
    v3 = 0;

  return (NSURL *)v3;
}

- (void)setConversationLinkBaseURLString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConfiguration dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("conversationLinkBaseURL"));

}

- (void)setConversationLinkBaseURL:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TUConfiguration dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("conversationLinkBaseURL"));
}

- (BOOL)simulateFatalPersistentStoreError
{
  int v3;
  void *v4;
  char v5;

  v3 = _TUIsInternalInstall();
  if (v3)
  {
    -[TUConfiguration numberForKey:](self, "numberForKey:", CFSTR("simulateFatalPersistentStoreError"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setSimulateFatalPersistentStoreError:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (_TUIsInternalInstall())
  {
    -[TUConfiguration dataSource](self, "dataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("simulateFatalPersistentStoreError"));

  }
}

- (BOOL)simulateInternationalCall
{
  int v3;
  void *v4;
  char v5;

  v3 = _TUIsInternalInstall();
  if (v3)
  {
    -[TUConfiguration numberForKey:](self, "numberForKey:", CFSTR("simulateInternationalCall"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setSimulateInternationalCall:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (_TUIsInternalInstall())
  {
    -[TUConfiguration dataSource](self, "dataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("simulateInternationalCall"));

  }
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[TUConfiguration dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConfiguration delegateController](self, "delegateController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:queue:", v7, v6);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConfiguration delegateController](self, "delegateController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", v4);

}

- (TUKeyValueDataSource)dataSource
{
  return self->_dataSource;
}

- (TUDelegateController)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
