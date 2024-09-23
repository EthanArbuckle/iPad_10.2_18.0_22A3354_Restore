@implementation SXStripGalleryComponentViewFactory

- (SXStripGalleryComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11
{
  SXStripGalleryComponentViewFactory *v18;
  SXStripGalleryComponentViewFactory *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v21 = a11;
  v26.receiver = self;
  v26.super_class = (Class)SXStripGalleryComponentViewFactory;
  v18 = -[SXComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:](&v26, sel_initWithDOMObjectProvider_viewport_presentationDelegateProvider_componentStyleRendererFactory_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_imageViewFactory, a10);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a9);
    objc_storeStrong((id *)&v19->_canvasControllerFactory, a11);
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
  SXStripGalleryComponentView *v13;
  void *v15;
  SXStripGalleryComponentView *v16;
  void *v17;

  v16 = [SXStripGalleryComponentView alloc];
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
  -[SXStripGalleryComponentViewFactory analyticsReportingProvider](self, "analyticsReportingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analyticsReporting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentViewFactory appStateMonitor](self, "appStateMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentViewFactory mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentViewFactory imageViewFactory](self, "imageViewFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXStripGalleryComponentViewFactory canvasControllerFactory](self, "canvasControllerFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXStripGalleryComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:mediaSharingPolicyProvider:imageViewFactory:canvasControllerFactory:](v16, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:mediaSharingPolicyProvider:imageViewFactory:canvasControllerFactory:", v15, v4, v5, v6, v8, v9, v10, v11, v12);

  return v13;
}

- (id)type
{
  return CFSTR("strip_gallery");
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

- (SXFullscreenCanvasControllerFactory)canvasControllerFactory
{
  return self->_canvasControllerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasControllerFactory, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end
