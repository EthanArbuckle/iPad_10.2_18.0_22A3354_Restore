@implementation SXAudioComponentViewFactory

- (SXAudioComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 resourceDataSourceProvider:(id)a9 host:(id)a10
{
  id v17;
  SXAudioComponentViewFactory *v18;
  SXAudioComponentViewFactory *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)SXAudioComponentViewFactory;
  v18 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v24, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_resourceDataSourceProvider, a9);
    objc_storeStrong((id *)&v19->_host, a10);
  }

  return v19;
}

- (id)type
{
  return CFSTR("audio");
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
  SXAudioComponentView *v13;
  void *v15;
  SXAudioComponentView *v16;
  void *v17;

  v16 = [SXAudioComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analyticsReporting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentViewFactory appStateMonitor](self, "appStateMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentViewFactory resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentViewFactory host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXAudioComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:resourceDataSource:host:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:resourceDataSource:host:", v15, v4, v5, v6, v8, v9, v11, v12);

  return v13;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SXHost)host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end
