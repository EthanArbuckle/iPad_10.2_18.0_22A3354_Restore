@implementation SXArticleLinkComponentViewFactory

- (SXArticleLinkComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 mediaSharingPolicyProvider:(id)a7 interactionHandlerManager:(id)a8 interactionHandlerFactory:(id)a9 URLActionFactory:(id)a10 articleURLFactory:(id)a11
{
  SXArticleLinkComponentViewFactory *v18;
  SXArticleLinkComponentViewFactory *v19;
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
  v25.super_class = (Class)SXArticleLinkComponentViewFactory;
  v18 = -[SXContainerComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:mediaSharingPolicyProvider:](&v25, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_mediaSharingPolicyProvider_, a3, a4, a5, a6, a7);
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

- (id)type
{
  return CFSTR("article_link");
}

- (int)role
{
  return 0;
}

- (id)componentViewForComponent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SXArticleLinkComponentView *v13;
  void *v15;
  SXArticleLinkComponentView *v16;

  v16 = [SXArticleLinkComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXContainerComponentViewFactory mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXArticleLinkComponentViewFactory interactionHandlerManager](self, "interactionHandlerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXArticleLinkComponentViewFactory interactionHandlerFactory](self, "interactionHandlerFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXArticleLinkComponentViewFactory URLActionFactory](self, "URLActionFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXArticleLinkComponentViewFactory articleURLFactory](self, "articleURLFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXArticleLinkComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:mediaSharingPolicyProvider:interactionHandlerManager:interactionHandlerFactory:URLActionFactory:articleURLFactory:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:mediaSharingPolicyProvider:interactionHandlerManager:interactionHandlerFactory:URLActionFactory:articleURLFactory:", v15, v4, v6, v7, v8, v9, v10, v11, v12);

  return v13;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleURLFactory, 0);
  objc_storeStrong((id *)&self->_URLActionFactory, 0);
  objc_storeStrong((id *)&self->_interactionHandlerFactory, 0);
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
}

@end
