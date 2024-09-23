@implementation SXArticleLinkComponentView

- (SXArticleLinkComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 mediaSharingPolicyProvider:(id)a7 interactionHandlerManager:(id)a8 interactionHandlerFactory:(id)a9 URLActionFactory:(id)a10 articleURLFactory:(id)a11
{
  SXArticleLinkComponentView *v18;
  SXArticleLinkComponentView *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a8;
  v23 = a9;
  v22 = a10;
  v21 = a11;
  v25.receiver = self;
  v25.super_class = (Class)SXArticleLinkComponentView;
  v18 = -[SXContainerComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:mediaSharingPolicyProvider:](&v25, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_mediaSharingPolicyProvider_, a3, a4, a5, a6, a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_interactionHandlerManager, a8);
    objc_storeStrong((id *)&v19->_interactionHandlerFactory, a9);
    objc_storeStrong((id *)&v19->_URLActionFactory, a10);
    objc_storeStrong((id *)&v19->_articleURLFactory, a11);
  }

  return v19;
}

- (void)loadComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SXArticleLinkComponentView;
  v4 = a3;
  -[SXComponentView loadComponent:](&v15, sel_loadComponent_, v4);
  -[SXArticleLinkComponentView interactionHandlerManager](self, "interactionHandlerManager", v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXArticleLinkComponentView interactionHandler](self, "interactionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInteractionHandler:componentView:", v6, self);

  -[SXArticleLinkComponentView articleURLFactory](self, "articleURLFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "createArticleURLWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXArticleLinkComponentView URLActionFactory](self, "URLActionFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionForURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXArticleLinkComponentView interactionHandlerFactory](self, "interactionHandlerFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "interactionHandlerForAction:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXArticleLinkComponentView interactionHandlerManager](self, "interactionHandlerManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addInteractionHandler:componentView:types:", v13, self, 2);

  -[SXArticleLinkComponentView setInteractionHandler:](self, "setInteractionHandler:", v13);
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (SXActionComponentInteractionHandlerFactory)interactionHandlerFactory
{
  return self->_interactionHandlerFactory;
}

- (SXURLActionFactory)URLActionFactory
{
  return self->_URLActionFactory;
}

- (SXArticleURLFactory)articleURLFactory
{
  return self->_articleURLFactory;
}

- (SXComponentInteractionHandler)interactionHandler
{
  return (SXComponentInteractionHandler *)objc_loadWeakRetained((id *)&self->_interactionHandler);
}

- (void)setInteractionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_interactionHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionHandler);
  objc_storeStrong((id *)&self->_articleURLFactory, 0);
  objc_storeStrong((id *)&self->_URLActionFactory, 0);
  objc_storeStrong((id *)&self->_interactionHandlerFactory, 0);
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
}

@end
