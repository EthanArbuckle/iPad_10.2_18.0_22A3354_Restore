@implementation SXQuickLookComponentViewFactory

- (SXQuickLookComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 fileProvider:(id)a7 quickLookModule:(id)a8
{
  id v15;
  id v16;
  SXQuickLookComponentViewFactory *v17;
  SXQuickLookComponentViewFactory *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SXQuickLookComponentViewFactory;
  v17 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v20, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_quickLookModule, a8);
    objc_storeStrong((id *)&v18->_fileProvider, a7);
  }

  return v18;
}

- (id)componentViewForComponent:(id)a3
{
  SXQuickLookComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXQuickLookComponentView *v12;

  v4 = [SXQuickLookComponentView alloc];
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
  -[SXQuickLookComponentViewFactory fileProvider](self, "fileProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentViewFactory quickLookModule](self, "quickLookModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SXQuickLookComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:fileProvider:quickLookModule:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:fileProvider:quickLookModule:", v5, v6, v8, v9, v10, v11);

  return v12;
}

- (id)type
{
  return CFSTR("quicklook");
}

- (int)role
{
  return 0;
}

- (SXQuickLookModule)quickLookModule
{
  return self->_quickLookModule;
}

- (SXQuickLookComponentFileProvider)fileProvider
{
  return self->_fileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProvider, 0);
  objc_storeStrong((id *)&self->_quickLookModule, 0);
}

@end
