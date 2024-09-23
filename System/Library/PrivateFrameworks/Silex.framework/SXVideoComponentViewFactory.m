@implementation SXVideoComponentViewFactory

- (SXVideoComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 resourceDataSourceProvider:(id)a10 reachabilityProvider:(id)a11 scrollObserverManager:(id)a12 videoPlayerViewControllerManager:(id)a13 bookmarkManager:(id)a14 prerollAdFactory:(id)a15
{
  id v18;
  id v19;
  id v20;
  SXVideoComponentViewFactory *v21;
  SXVideoComponentViewFactory *v22;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a7;
  obj = a8;
  v33 = a8;
  v32 = a9;
  v31 = a10;
  v30 = a11;
  v29 = a12;
  v18 = a13;
  v19 = a14;
  v20 = a15;
  v35.receiver = self;
  v35.super_class = (Class)SXVideoComponentViewFactory;
  v21 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v35, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v22->_resourceDataSourceProvider, a10);
    objc_storeStrong((id *)&v22->_reachabilityProvider, a11);
    objc_storeStrong((id *)&v22->_appStateMonitor, obj);
    objc_storeStrong((id *)&v22->_sceneStateMonitor, a9);
    objc_storeStrong((id *)&v22->_scrollObserverManager, a12);
    objc_storeStrong((id *)&v22->_videoPlayerViewControllerManager, a13);
    objc_storeStrong((id *)&v22->_bookmarkManager, a14);
    objc_storeStrong((id *)&v22->_prerollAdFactory, a15);
  }

  return v22;
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
  void *v13;
  void *v14;
  void *v15;
  SXVideoComponentView *v16;
  SXVideoComponentView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v16 = [SXVideoComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "analyticsReporting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory appStateMonitor](self, "appStateMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory sceneStateMonitor](self, "sceneStateMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resourceDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory reachabilityProvider](self, "reachabilityProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory scrollObserverManager](self, "scrollObserverManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory videoPlayerViewControllerManager](self, "videoPlayerViewControllerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory bookmarkManager](self, "bookmarkManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoComponentViewFactory prerollAdFactory](self, "prerollAdFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXVideoComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:sceneStateMonitor:resourceDataSource:reachabilityProvider:scrollObserverManager:videoPlayerViewControllerManager:bookmarkManager:prerollAdFactory:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:sceneStateMonitor:resourceDataSource:reachabilityProvider:scrollObserverManager:videoPlayerViewControllerManager:bookmarkManager:prerollAdFactory:", v22, v21, v4, v5, v15, v14, v13, v6, v7, v8, v9, v10, v11);

  return v17;
}

- (id)type
{
  return CFSTR("video");
}

- (int)role
{
  return 0;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (SXScrollObserverManager)scrollObserverManager
{
  return self->_scrollObserverManager;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (SXBookmarkManager)bookmarkManager
{
  return self->_bookmarkManager;
}

- (SXVideoAdProviderFactory)prerollAdFactory
{
  return self->_prerollAdFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerollAdFactory, 0);
  objc_storeStrong((id *)&self->_bookmarkManager, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_scrollObserverManager, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end
