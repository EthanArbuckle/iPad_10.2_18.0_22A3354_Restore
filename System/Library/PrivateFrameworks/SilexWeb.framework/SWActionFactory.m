@implementation SWActionFactory

- (SWActionFactory)initWithNavigationManager:(id)a3
{
  id v5;
  SWActionFactory *v6;
  SWActionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWActionFactory;
  v6 = -[SWActionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_navigationManager, a3);

  return v7;
}

- (id)actionForDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SWURLAction *v13;
  void *v14;
  SWEmbedAction *v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("url"));
  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("share")) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("close")))
  {
    v7 = 3;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      v13 = [SWURLAction alloc];
      -[SWActionFactory navigationManager](self, "navigationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SWURLAction initWithURL:navigationManager:](v13, "initWithURL:navigationManager:", v12, v14);

    }
    else
    {
      v15 = -[SWEmbedAction initWithType:info:]([SWEmbedAction alloc], "initWithType:info:", 0, v9);
    }

  }
  else
  {
    v15 = -[SWEmbedAction initWithType:info:]([SWEmbedAction alloc], "initWithType:info:", v7, v8);
  }

  return v15;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationManager, 0);
}

@end
