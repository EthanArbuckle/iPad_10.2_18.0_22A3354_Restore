@implementation SXImageComponentViewFactory

- (SXImageComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 mediaSharingPolicyProvider:(id)a10
{
  id v17;
  SXImageComponentViewFactory *v18;
  SXImageComponentViewFactory *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)SXImageComponentViewFactory;
  v18 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v24, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_imageViewFactory, a9);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a10);
  }

  return v19;
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
  SXImageComponentView *v13;
  void *v15;
  SXImageComponentView *v16;

  v16 = [SXImageComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyticsReporting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentViewFactory appStateMonitor](self, "appStateMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentViewFactory imageViewFactory](self, "imageViewFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentViewFactory mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXImageComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:imageViewFactory:mediaSharingPolicyProvider:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:imageViewFactory:mediaSharingPolicyProvider:", v15, v4, v6, v7, v9, v10, v11, v12);

  return v13;
}

- (id)type
{
  return CFSTR("image");
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

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end
