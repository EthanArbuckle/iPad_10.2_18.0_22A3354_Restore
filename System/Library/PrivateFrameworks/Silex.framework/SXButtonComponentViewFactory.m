@implementation SXButtonComponentViewFactory

- (SXButtonComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 interactionHandlerFactory:(id)a7 interactionHandlerManager:(id)a8
{
  id v15;
  id v16;
  SXButtonComponentViewFactory *v17;
  SXButtonComponentViewFactory *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SXButtonComponentViewFactory;
  v17 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v20, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_interactionHandlerFactory, a7);
    objc_storeStrong((id *)&v18->_interactionHandlerManager, a8);
  }

  return v18;
}

- (id)componentViewForComponent:(id)a3
{
  id v4;
  SXButtonComponentView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SXButtonComponentView *v11;
  SXButtonComponentActionProvider *v12;
  void *v13;
  SXButtonComponentActionProvider *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = [SXButtonComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXButtonComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](v5, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:", v6, v7, v9, v10);

  v12 = [SXButtonComponentActionProvider alloc];
  objc_msgSend(v4, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SXButtonComponentActionProvider initWithAction:](v12, "initWithAction:", v13);
  -[SXButtonComponentViewFactory interactionHandlerFactory](self, "interactionHandlerFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentActionProvider action](v14, "action");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interactionHandlerForAction:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXButtonComponentViewFactory interactionHandlerManager](self, "interactionHandlerManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addInteractionHandler:componentView:types:", v17, v11, 2);

  return v11;
}

- (id)type
{
  return CFSTR("button");
}

- (int)role
{
  return 0;
}

- (SXActionComponentInteractionHandlerFactory)interactionHandlerFactory
{
  return self->_interactionHandlerFactory;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
  objc_storeStrong((id *)&self->_interactionHandlerFactory, 0);
}

@end
