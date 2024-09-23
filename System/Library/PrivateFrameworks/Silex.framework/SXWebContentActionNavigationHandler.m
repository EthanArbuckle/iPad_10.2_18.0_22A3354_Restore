@implementation SXWebContentActionNavigationHandler

- (SXWebContentActionNavigationHandler)initWithActionProvider:(id)a3 actionManager:(id)a4
{
  id v7;
  id v8;
  SXWebContentActionNavigationHandler *v9;
  SXWebContentActionNavigationHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentActionNavigationHandler;
  v9 = -[SXWebContentActionNavigationHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionProvider, a3);
    objc_storeStrong((id *)&v10->_actionManager, a4);
  }

  return v10;
}

- (unint64_t)handleRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[SXWebContentActionNavigationHandler actionProvider](self, "actionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "actionForURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SXWebContentActionNavigationHandler actionManager](self, "actionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performAction:postActionHandlers:", v7, MEMORY[0x24BDBD1A8]);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SXActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
}

@end
