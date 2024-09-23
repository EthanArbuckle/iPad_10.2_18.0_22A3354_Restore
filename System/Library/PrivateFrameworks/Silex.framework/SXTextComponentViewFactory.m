@implementation SXTextComponentViewFactory

- (SXTextComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 tangierController:(id)a7
{
  id v12;
  SXTextComponentViewFactory *v13;
  SXTextComponentViewFactory *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)SXTextComponentViewFactory;
  v13 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v16, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v14 = v13;
  if (v13)
    objc_storeWeak((id *)&v13->_tangierController, v12);

  return v14;
}

- (id)componentViewForComponent:(id)a3
{
  SXTextComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SXTextComponentView *v11;

  v4 = [SXTextComponentView alloc];
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
  -[SXTextComponentViewFactory tangierController](self, "tangierController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXTextComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:tangierController:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:tangierController:", v5, v6, v8, v9, v10);

  return v11;
}

- (id)type
{
  return CFSTR("text");
}

- (int)role
{
  return 0;
}

- (SXTangierController)tangierController
{
  return (SXTangierController *)objc_loadWeakRetained((id *)&self->_tangierController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tangierController);
}

@end
