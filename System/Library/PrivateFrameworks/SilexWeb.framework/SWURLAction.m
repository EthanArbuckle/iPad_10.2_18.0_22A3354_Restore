@implementation SWURLAction

- (SWURLAction)initWithURL:(id)a3 navigationManager:(id)a4
{
  id v6;
  id v7;
  SWURLAction *v8;
  uint64_t v9;
  NSURL *URL;
  SWURLAction *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SWURLAction;
    v8 = -[SWURLAction init](&v13, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      URL = v8->_URL;
      v8->_URL = (NSURL *)v9;

      objc_storeStrong((id *)&v8->_navigationManager, a4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canHandle
{
  return 1;
}

- (void)perform
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SWURLAction navigationManager](self, "navigationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1840];
  -[SWURLAction URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionForRequest:", v5);

}

- (BOOL)isEqual:(id)a3
{
  SWURLAction *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SWURLAction *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[SWURLAction type](self, "type"), v5 == -[SWURLAction type](v4, "type")))
    {
      -[SWURLAction URL](self, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWURLAction URL](v4, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SWURLAction URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type: %@; URL: %@>"), v4, self, CFSTR("URL"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
