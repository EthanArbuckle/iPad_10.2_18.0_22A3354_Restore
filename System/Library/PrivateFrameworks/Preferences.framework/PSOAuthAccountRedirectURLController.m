@implementation PSOAuthAccountRedirectURLController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PSOAuthAccountRedirectURLController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_oauthRedirectInstanceToken != -1)
    dispatch_once(&sharedInstance_oauthRedirectInstanceToken, block);
  return (id)sharedInstance___instance;
}

void __53__PSOAuthAccountRedirectURLController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;

}

- (PSOAuthAccountRedirectURLController)init
{
  PSOAuthAccountRedirectURLController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSOAuthAccountRedirectURLController;
  v2 = -[PSOAuthAccountRedirectURLController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSOAuthAccountRedirectURLController setRedirectHandlerMap:](v2, "setRedirectHandlerMap:", v3);

  }
  return v2;
}

- (void)registerOAuthClientForRedirectURL:(id)a3 redirectHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PSOAuthAccountRedirectURLController redirectHandlerMap](self, "redirectHandlerMap");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v9, "setObject:forKey:", v8, v7);
}

- (void)unRegisterOAuthClientForRedirectURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSOAuthAccountRedirectURLController redirectHandlerMap](self, "redirectHandlerMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)handleOAuthRedirectURL:(id)a3
{
  id v4;
  void *v5;
  id i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);

  v4 = a3;
  -[PSOAuthAccountRedirectURLController _redirectURLFromURL:](self, "_redirectURLFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i)
  {
    -[PSOAuthAccountRedirectURLController redirectHandlerMap](self, "redirectHandlerMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    i = v9;
    if (!objc_msgSend(i, "caseInsensitiveCompare:", v5))
    {
      -[PSOAuthAccountRedirectURLController redirectHandlerMap](self, "redirectHandlerMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", i);
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        ((void (**)(_QWORD, id))v11)[2](v11, v4);

        break;
      }
    }
  }

  return v9 != 0;
}

- (id)_redirectURLFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E4A69238);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@://%@"), v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMapTable)redirectHandlerMap
{
  return self->_redirectHandlerMap;
}

- (void)setRedirectHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_redirectHandlerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectHandlerMap, 0);
}

@end
