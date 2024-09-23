@implementation SXWebContentGenericNavigationHandler

- (SXWebContentGenericNavigationHandler)initWithActionManager:(id)a3 URLActionFactory:(id)a4
{
  id v7;
  id v8;
  SXWebContentGenericNavigationHandler *v9;
  SXWebContentGenericNavigationHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentGenericNavigationHandler;
  v9 = -[SXWebContentGenericNavigationHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionManager, a3);
    objc_storeStrong((id *)&v10->_URLActionFactory, a4);
  }

  return v10;
}

- (unint64_t)handleRequest:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[SXWebContentGenericNavigationHandler actionForRequest:](self, "actionForRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SXWebContentGenericNavigationHandler actionManager](self, "actionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAction:postActionHandlers:", v4, MEMORY[0x24BDBD1A8]);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)previewViewControllerForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SXWebContentGenericNavigationHandler actionForRequest:](self, "actionForRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentGenericNavigationHandler actionManager](self, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewViewControllerForAction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)commitViewController:(id)a3 URLRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SXWebContentGenericNavigationHandler actionManager](self, "actionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitPreviewViewController:", v5);

}

- (id)actionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXWebContentGenericNavigationHandler URLActionFactory](self, "URLActionFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "actionForURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXURLActionFactory)URLActionFactory
{
  return self->_URLActionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLActionFactory, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end
