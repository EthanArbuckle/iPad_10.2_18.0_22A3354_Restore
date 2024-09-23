@implementation SWURLInteraction

- (SWURLInteraction)initWithURL:(id)a3 navigationManager:(id)a4
{
  id v6;
  id v7;
  SWURLInteraction *v8;
  uint64_t v9;
  NSURL *URL;
  SWURLInteraction *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SWURLInteraction;
    v8 = -[SWURLInteraction init](&v13, sel_init);
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
  return 2;
}

- (void)perform
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SWURLInteraction navigationManager](self, "navigationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1840];
  -[SWURLInteraction URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionForRequest:", v5);

}

- (BOOL)isEqual:(id)a3
{
  SWURLInteraction *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SWURLInteraction *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[SWURLInteraction type](self, "type"), v5 == -[SWURLInteraction type](v4, "type")))
    {
      -[SWURLInteraction URL](self, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWURLInteraction URL](v4, "URL");
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
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[SWURLInteraction type](self, "type") == 1)
  {
    v3 = CFSTR("interactable");
  }
  else if (-[SWURLInteraction type](self, "type") == 2)
  {
    v3 = CFSTR("selectable");
  }
  else
  {
    v3 = CFSTR("none");
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[SWURLInteraction URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; type: %@; URL: %@>"), v5, self, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
