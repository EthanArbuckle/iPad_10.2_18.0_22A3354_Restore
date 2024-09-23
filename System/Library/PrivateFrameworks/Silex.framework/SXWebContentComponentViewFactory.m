@implementation SXWebContentComponentViewFactory

- (SXWebContentComponentViewFactory)initWithResolver:(id)a3 DOMObjectProvider:(id)a4 viewport:(id)a5 presentationDelegateProvider:(id)a6 componentStyleRendererFactory:(id)a7 containerViewController:(id)a8 configurationProvider:(id)a9 navigationManager:(id)a10 analyticsReportingProvider:(id)a11 componentExposureMonitor:(id)a12 interactionManagerFactory:(id)a13 reachabilityProvider:(id)a14 resourceDataSourceProvider:(id)a15 loadingPolicyProvider:(id)a16 dataSourceProvider:(id)a17 layoutInvalidator:(id)a18 contentRuleProvider:(id)a19 developerSettingsProvider:(id)a20
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SXWebContentComponentViewFactory *v26;
  SXWebContentComponentViewFactory *v27;
  id v30;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v30 = a8;
  v43 = a8;
  v42 = a9;
  v41 = a10;
  v40 = a11;
  v39 = a12;
  v38 = a13;
  v37 = a14;
  v36 = a15;
  v21 = a16;
  v22 = a17;
  v23 = a18;
  v24 = a19;
  v25 = a20;
  v45.receiver = self;
  v45.super_class = (Class)SXWebContentComponentViewFactory;
  v26 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v45, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a4, a5, a6, a7);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_resolver, a3);
    objc_storeStrong((id *)&v27->_containerViewController, v30);
    objc_storeStrong((id *)&v27->_configurationProvider, a9);
    objc_storeStrong((id *)&v27->_componentExposureMonitor, a12);
    objc_storeStrong((id *)&v27->_navigationManager, a10);
    objc_storeStrong((id *)&v27->_analyticsReportingProvider, a11);
    objc_storeStrong((id *)&v27->_interactionManagerFactory, a13);
    objc_storeStrong((id *)&v27->_reachabilityProvider, a14);
    objc_storeStrong((id *)&v27->_resourceDataSourceProvider, a15);
    objc_storeStrong((id *)&v27->_loadingPolicyProvider, a16);
    objc_storeStrong((id *)&v27->_dataSourceProvider, a17);
    objc_storeStrong((id *)&v27->_layoutInvalidator, a18);
    objc_storeStrong((id *)&v27->_contentRuleProvider, a19);
    objc_storeStrong((id *)&v27->_developerSettingsProvider, a20);
  }

  return v27;
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
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SXWebContentComponentView *v23;
  SXWebContentComponentView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  -[SXWebContentComponentViewFactory contentRuleProvider](self, "contentRuleProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentRules");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXWebContentComponentViewFactory resolver](self, "resolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addContentRuleList:identifier:", v27, CFSTR("com.apple.news.webcontent"));
  -[SXWebContentComponentViewFactory developerSettingsProvider](self, "developerSettingsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "developerSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeveloperSettings:", v8);

  objc_msgSend(v6, "setFocusShouldStartInputSession:", 1);
  v23 = [SXWebContentComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentationDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory configurationProvider](self, "configurationProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory navigationManager](self, "navigationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "analyticsReporting");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory componentExposureMonitor](self, "componentExposureMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory interactionManagerFactory](self, "interactionManagerFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory reachabilityProvider](self, "reachabilityProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory loadingPolicyProvider](self, "loadingPolicyProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory dataSourceProvider](self, "dataSourceProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentViewFactory layoutInvalidator](self, "layoutInvalidator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SXWebContentComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:containerViewController:configurationProvider:navigationManager:analyticsReporting:componentExposureMonitor:interactionManagerFactory:reachabilityProvider:resourceDataSource:loadingPolicyProvider:dataSourceProvider:layoutInvalidator:](v23, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:containerViewController:configurationProvider:navigationManager:analyticsReporting:componentExposureMonitor:interactionManagerFactory:reachabilityProvider:resourceDataSource:loadingPolicyProvider:dataSourceProvider:layoutInvalidator:", v29, v28, v22, v21, v6, v20, v19, v18, v17, v9, v10, v12, v13, v14, v15);

  return v24;
}

- (id)type
{
  return CFSTR("webcontent");
}

- (int)role
{
  return 0;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SWContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (SXWebContentConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (SXWebContentComponentInteractionManagerFactory)interactionManagerFactory
{
  return self->_interactionManagerFactory;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (SXWebContentDataSourceProviding)dataSourceProvider
{
  return self->_dataSourceProvider;
}

- (SXComponentExposureMonitor)componentExposureMonitor
{
  return self->_componentExposureMonitor;
}

- (SXWebContentComponentContentRuleProvider)contentRuleProvider
{
  return self->_contentRuleProvider;
}

- (SXWebContentComponentDeveloperSettingsProvider)developerSettingsProvider
{
  return self->_developerSettingsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSettingsProvider, 0);
  objc_storeStrong((id *)&self->_contentRuleProvider, 0);
  objc_storeStrong((id *)&self->_componentExposureMonitor, 0);
  objc_storeStrong((id *)&self->_dataSourceProvider, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_loadingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_interactionManagerFactory, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
