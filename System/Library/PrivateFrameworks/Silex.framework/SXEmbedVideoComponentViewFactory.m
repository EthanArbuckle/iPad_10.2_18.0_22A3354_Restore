@implementation SXEmbedVideoComponentViewFactory

- (SXEmbedVideoComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 actionHandler:(id)a10 websiteDataStore:(id)a11 proxyAuthenticationHandler:(id)a12
{
  id v18;
  id v19;
  SXEmbedVideoComponentViewFactory *v20;
  SXEmbedVideoComponentViewFactory *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a7;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v18 = a11;
  v19 = a12;
  v28.receiver = self;
  v28.super_class = (Class)SXEmbedVideoComponentViewFactory;
  v20 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v28, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v21->_appStateMonitor, a8);
    objc_storeStrong((id *)&v21->_sceneStateMonitor, a9);
    objc_storeStrong((id *)&v21->_actionHandler, a10);
    objc_storeStrong((id *)&v21->_dataStore, a11);
    objc_storeStrong((id *)&v21->_proxyAuthenticationHandler, a12);
  }

  return v21;
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
  SXEmbedVideoComponentView *v13;
  void *v15;
  SXEmbedVideoComponentView *v16;
  void *v17;
  void *v18;

  v16 = [SXEmbedVideoComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "analyticsReporting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentViewFactory appStateMonitor](self, "appStateMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentViewFactory sceneStateMonitor](self, "sceneStateMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentViewFactory actionHandler](self, "actionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentViewFactory dataStore](self, "dataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXEmbedVideoComponentViewFactory proxyAuthenticationHandler](self, "proxyAuthenticationHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXEmbedVideoComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:sceneStateMonitor:actionHandler:websiteDataStore:proxyAuthenticationHandler:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:sceneStateMonitor:actionHandler:websiteDataStore:proxyAuthenticationHandler:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (id)type
{
  return CFSTR("embed_video");
}

- (int)role
{
  return 0;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end
