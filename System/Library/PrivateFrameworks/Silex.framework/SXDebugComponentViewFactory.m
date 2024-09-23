@implementation SXDebugComponentViewFactory

- (SXDebugComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 invalidator:(id)a7
{
  id v13;
  SXDebugComponentViewFactory *v14;
  SXDebugComponentViewFactory *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXDebugComponentViewFactory;
  v14 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v17, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_invalidator, a7);

  return v15;
}

- (id)componentViewForComponent:(id)a3
{
  SXDebugComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SXDebugComponentView *v11;

  v4 = [SXDebugComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDebugComponentViewFactory invalidator](self, "invalidator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXDebugComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:invalidator:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:invalidator:", v5, v6, v8, v9, v10);

  return v11;
}

- (id)type
{
  return CFSTR("anf-internal-debug");
}

- (int)role
{
  return 0;
}

- (SXLayoutInvalidator)invalidator
{
  return self->_invalidator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidator, 0);
}

@end
