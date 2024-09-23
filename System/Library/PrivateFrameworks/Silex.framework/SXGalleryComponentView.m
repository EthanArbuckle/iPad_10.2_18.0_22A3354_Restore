@implementation SXGalleryComponentView

- (SXGalleryComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9
{
  id v16;
  SXGalleryComponentView *v17;
  SXDragManager *v18;
  SXDragManager *dragManager;
  objc_super v21;

  v16 = a9;
  v21.receiver = self;
  v21.super_class = (Class)SXGalleryComponentView;
  v17 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v21, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, a3, a4, a5, a6, a7, a8);
  if (v17)
  {
    v18 = -[SXDragManager initWithSharingPolicy:dataSource:]([SXDragManager alloc], "initWithSharingPolicy:dataSource:", objc_msgSend(v16, "mediaSharingPolicy"), v17);
    dragManager = v17->_dragManager;
    v17->_dragManager = v18;

  }
  return v17;
}

- (id)imageViewForLocation:(CGPoint)a3
{
  return 0;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
}

@end
