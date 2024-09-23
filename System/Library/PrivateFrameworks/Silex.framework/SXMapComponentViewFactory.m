@implementation SXMapComponentViewFactory

- (SXMapComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 documentTitleProvider:(id)a9
{
  id v16;
  id v17;
  SXMapComponentViewFactory *v18;
  SXMapComponentViewFactory *v19;
  id v21;
  objc_super v22;

  v21 = a7;
  v16 = a8;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SXMapComponentViewFactory;
  v18 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v22, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_documentTitleProvider, a9);
  }

  return v19;
}

- (id)componentViewForComponent:(id)a3
{
  SXMapComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SXMapComponentView *v14;

  v4 = [SXMapComponentView alloc];
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
  -[SXMapComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyticsReporting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentViewFactory appStateMonitor](self, "appStateMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMapComponentViewFactory documentTitleProvider](self, "documentTitleProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SXMapComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:documentTitleProvider:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:documentTitleProvider:", v5, v6, v8, v9, v11, v12, v13);

  return v14;
}

- (id)type
{
  return CFSTR("map");
}

- (int)role
{
  return 0;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXDocumentTitleProviding)documentTitleProvider
{
  return self->_documentTitleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentTitleProvider, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end
