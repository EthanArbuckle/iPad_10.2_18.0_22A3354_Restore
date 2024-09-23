@implementation SXLinkActionFactory

- (SXLinkActionFactory)initWithURLActionFactory:(id)a3
{
  id v5;
  SXLinkActionFactory *v6;
  SXLinkActionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLinkActionFactory;
  v6 = -[SXLinkActionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_URLActionFactory, a3);

  return v7;
}

- (id)actionForAddition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[SXLinkActionFactory URLActionFactory](self, "URLActionFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "analytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionForURL:analytics:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)actionForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "queryValueForName:", CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SXLinkActionFactory URLActionFactory](self, "URLActionFactory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionForURL:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (SXURLActionFactory)URLActionFactory
{
  return self->_URLActionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLActionFactory, 0);
}

@end
