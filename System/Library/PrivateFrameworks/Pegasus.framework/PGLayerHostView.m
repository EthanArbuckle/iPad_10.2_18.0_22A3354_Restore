@implementation PGLayerHostView

- (PGLayerHostView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v10.receiver = self;
  v10.super_class = (Class)PGLayerHostView;
  return -[PGLayerHostView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v4.receiver = self;
  v4.super_class = (Class)PGLayerHostView;
  -[PGLayerHostView dealloc](&v4, sel_dealloc);
}

- (PGHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return (PGHostedWindowHostingHandle *)-[_UIRemoteView hostedWindowHostingHandle](self->_remoteView, "hostedWindowHostingHandle");
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  id v4;
  _UIRemoteView *remoteView;
  _UIRemoteView *v6;
  _UIRemoteView *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    remoteView = self->_remoteView;
    v8 = v4;
    if (remoteView)
    {
      -[_UIRemoteView setHostedWindowHostingHandle:](remoteView, "setHostedWindowHostingHandle:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAE80], "viewWithHostedWindowHostingHandle:", v4);
      v6 = (_UIRemoteView *)objc_claimAutoreleasedReturnValue();
      v7 = self->_remoteView;
      self->_remoteView = v6;

      -[PGLayerHostView addSubview:](self, "addSubview:", self->_remoteView);
    }
    -[PGLayerHostView _manageSharingOfTouchesBetweenClientAndHostContext](self, "_manageSharingOfTouchesBetweenClientAndHostContext");
    v4 = v8;
  }

}

- (void)setSceneView:(id)a3
{
  UIView *v5;
  UIView *sceneView;
  UIView *v7;

  v5 = (UIView *)a3;
  sceneView = self->_sceneView;
  if (sceneView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](sceneView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_sceneView, a3);
    v5 = v7;
    if (v7)
    {
      -[PGLayerHostView addSubview:](self, "addSubview:", v7);
      v5 = v7;
    }
  }

}

- (void)layoutSubviews
{
  UIView *sceneView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGLayerHostView;
  -[PGLayerHostView layoutSubviews](&v4, sel_layoutSubviews);
  sceneView = self->_sceneView;
  -[PGLayerHostView bounds](self, "bounds");
  -[UIView setFrame:](sceneView, "setFrame:");
}

- (void)_manageSharingOfTouchesBetweenClientAndHostContext
{
  BKSTouchDeliveryPolicyAssertion **p_touchDeliveryPolicyAssertion;
  BKSTouchDeliveryPolicyAssertion *touchDeliveryPolicyAssertion;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  p_touchDeliveryPolicyAssertion = &self->_touchDeliveryPolicyAssertion;
  touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
  self->_touchDeliveryPolicyAssertion = 0;

  -[PGLayerHostView hostedWindowHostingHandle](self, "hostedWindowHostingHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PGLayerHostView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[_UIRemoteView contextID](self->_remoteView, "contextID");
      -[PGLayerHostView window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_contextId");

      v11 = objc_alloc_init(MEMORY[0x1E0D00E10]);
      objc_msgSend(MEMORY[0x1E0D00E08], "policyRequiringSharingOfTouchesDeliveredToChildContextId:withHostContextId:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAssertionEndpoint:", v13);

      v14 = v12;
      BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_storeStrong((id *)p_touchDeliveryPolicyAssertion, v11);
        objc_msgSend(v15, "ipc_addPolicy:", v14);
      }

    }
  }
}

void __69__PGLayerHostView__manageSharingOfTouchesBetweenClientAndHostContext__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __69__PGLayerHostView__manageSharingOfTouchesBetweenClientAndHostContext__block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (double)cornerRadiusScale
{
  return self->_cornerRadiusScale;
}

- (void)setCornerRadiusScale:(double)a3
{
  self->_cornerRadiusScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertion, 0);
  objc_storeStrong((id *)&self->_remoteView, 0);
}

void __69__PGLayerHostView__manageSharingOfTouchesBetweenClientAndHostContext__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _PGLogMethodProem(*(void **)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_1B0CD6000, a3, OS_LOG_TYPE_DEBUG, "%@ - Sending touch delivery policy %@ failed with error: %@", (uint8_t *)&v8, 0x20u);

}

@end
