@implementation SXEmbedComponentViewFactory

- (SXEmbedComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 reachabilityProvider:(id)a7 embedDataProvider:(id)a8 actionHandler:(id)a9 layoutInvalidator:(id)a10 websiteDataStore:(id)a11 relatedWebViewCache:(id)a12 proxyAuthenticationHandler:(id)a13 sceneStateMonitor:(id)a14 analyticsReportingProvider:(id)a15
{
  id v18;
  id v19;
  id v20;
  SXEmbedComponentViewFactory *v21;
  SXEmbedComponentViewFactory *v22;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a7;
  v32 = a8;
  v31 = a9;
  v30 = a10;
  v29 = a11;
  v28 = a12;
  v18 = a13;
  v19 = a14;
  v20 = a15;
  v34.receiver = self;
  v34.super_class = (Class)SXEmbedComponentViewFactory;
  v21 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v34, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_reachabilityProvider, a7);
    objc_storeStrong((id *)&v22->_embedDataProvider, a8);
    objc_storeStrong((id *)&v22->_actionHandler, a9);
    objc_storeStrong((id *)&v22->_layoutInvalidator, a10);
    objc_storeStrong((id *)&v22->_dataStore, a11);
    objc_storeStrong((id *)&v22->_relatedWebViewCache, a12);
    objc_storeStrong((id *)&v22->_proxyAuthenticationHandler, a13);
    objc_storeStrong((id *)&v22->_sceneStateMonitor, a14);
    objc_storeStrong((id *)&v22->_analyticsReportingProvider, a15);
  }

  return v22;
}

- (id)type
{
  return CFSTR("embed");
}

- (int)role
{
  return 0;
}

- (id)componentViewForComponent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SXLegacyEmbedComponentView *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  SXEmbedComponentView *v39;
  id v40;
  void *v41;
  void *v42;
  SXLegacyEmbedComponentView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_opt_class();
  v42 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v43 = [SXLegacyEmbedComponentView alloc];
    -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentViewFactory viewport](self, "viewport");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "presentationDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
    v37 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory reachabilityProvider](self, "reachabilityProvider");
    v35 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory embedDataProvider](self, "embedDataProvider");
    v34 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory actionHandler](self, "actionHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory layoutInvalidator](self, "layoutInvalidator");
    v7 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory dataStore](self, "dataStore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory relatedWebViewCache](self, "relatedWebViewCache");
    v9 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory proxyAuthenticationHandler](self, "proxyAuthenticationHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory sceneStateMonitor](self, "sceneStateMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "analyticsReporting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)v10;
    v30 = v9;
    v32 = v10;
    v15 = (void *)v9;
    v16 = (void *)v8;
    v29 = v8;
    v45 = (void *)v7;
    v27 = v6;
    v28 = v7;
    v17 = (void *)v6;
    v18 = v43;
    v44 = (void *)v5;
    v19 = v5;
    v20 = (void *)v35;
    v21 = (void *)v37;
    v22 = (void *)v34;
    v23 = -[SXEmbedComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:reachabilityProvider:embedDataProvider:actionHandler:layoutInvalidator:websiteDataStore:relatedWebViewCache:proxyAuthenticationHandler:sceneStateMonitor:analyticsReporting:](v18, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:reachabilityProvider:embedDataProvider:actionHandler:layoutInvalidator:websiteDataStore:relatedWebViewCache:proxyAuthenticationHandler:sceneStateMonitor:analyticsReporting:", v47, v46, v19, v37, v35, v34, v27, v28, v29, v30, v32, v11, v13);
  }
  else
  {
    v39 = [SXEmbedComponentView alloc];
    -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentViewFactory viewport](self, "viewport");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "presentationDelegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory reachabilityProvider](self, "reachabilityProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory embedDataProvider](self, "embedDataProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory actionHandler](self, "actionHandler");
    v38 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory layoutInvalidator](self, "layoutInvalidator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory dataStore](self, "dataStore");
    v36 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory relatedWebViewCache](self, "relatedWebViewCache");
    v24 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory proxyAuthenticationHandler](self, "proxyAuthenticationHandler");
    v25 = objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory sceneStateMonitor](self, "sceneStateMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXEmbedComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "analyticsReporting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)v25;
    v31 = v24;
    v33 = v25;
    v15 = (void *)v24;
    v16 = (void *)v36;
    v17 = (void *)v38;
    v23 = -[SXEmbedComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:reachabilityProvider:embedDataProvider:actionHandler:layoutInvalidator:websiteDataStore:relatedWebViewCache:proxyAuthenticationHandler:sceneStateMonitor:analyticsReporting:](v39, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:reachabilityProvider:embedDataProvider:actionHandler:layoutInvalidator:websiteDataStore:relatedWebViewCache:proxyAuthenticationHandler:sceneStateMonitor:analyticsReporting:", v47, v46, v44, v21, v20, v22, v38, v45, v36, v31, v33, v11, v13);
  }
  v40 = (id)v23;

  return v40;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SXRelatedWebViewCache)relatedWebViewCache
{
  return self->_relatedWebViewCache;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_relatedWebViewCache, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
}

@end
