@implementation SXContainerComponentViewFactory

- (SXContainerComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 mediaSharingPolicyProvider:(id)a7
{
  id v13;
  SXContainerComponentViewFactory *v14;
  SXContainerComponentViewFactory *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXContainerComponentViewFactory;
  v14 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v17, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_mediaSharingPolicyProvider, a7);

  return v15;
}

- (id)type
{
  return CFSTR("container");
}

- (int)role
{
  return 0;
}

- (id)componentViewForComponent:(id)a3
{
  SXContainerComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SXContainerComponentView *v11;

  v4 = [SXContainerComponentView alloc];
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
  -[SXContainerComponentViewFactory mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXContainerComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:mediaSharingPolicyProvider:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:mediaSharingPolicyProvider:", v5, v6, v8, v9, v10);

  return v11;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
}

@end
