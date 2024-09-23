@implementation SBInteractiveScreenshotGestureHostRootViewController

- (SBInteractiveScreenshotGestureHostRootViewController)initWithScreen:(id)a3
{
  id v5;
  SBInteractiveScreenshotGestureHostRootViewController *v6;
  SBInteractiveScreenshotGestureHostRootViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureHostRootViewController;
  v6 = -[SBInteractiveScreenshotGestureHostRootViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_screen, a3);

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotGestureHostRootViewController;
  -[SBInteractiveScreenshotGestureHostRootViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SBInteractiveScreenshotGestureHostRootViewController _reloadLayerHostView](self, "_reloadLayerHostView");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  _UILayerHostView *layerHostView;

  -[_UILayerHostView removeFromSuperview](self->_layerHostView, "removeFromSuperview");
  layerHostView = self->_layerHostView;
  self->_layerHostView = 0;

}

- (void)setHostingContextID:(unsigned int)a3 pid:(int)a4
{
  if (self->_hostingContextID != a3 || self->_hostingPid != a4)
  {
    self->_hostingContextID = a3;
    self->_hostingPid = a4;
    if (-[SBInteractiveScreenshotGestureHostRootViewController isViewLoaded](self, "isViewLoaded"))
      -[SBInteractiveScreenshotGestureHostRootViewController _reloadLayerHostView](self, "_reloadLayerHostView");
  }
}

- (void)_reloadLayerHostView
{
  _UILayerHostView *layerHostView;
  _UILayerHostView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  id v26;
  _UILayerHostView *v27;
  _UILayerHostView *v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect v34;

  layerHostView = self->_layerHostView;
  if (layerHostView)
  {
    -[_UILayerHostView removeFromSuperview](layerHostView, "removeFromSuperview");
    v4 = self->_layerHostView;
    self->_layerHostView = 0;

  }
  if (self->_hostingContextID && self->_hostingPid)
  {
    -[SBInteractiveScreenshotGestureHostRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[UIScreen nativeBounds](self->_screen, "nativeBounds");
    v7 = v6;
    v9 = v8;
    -[UIScreen bounds](self->_screen, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIScreen _rotation](self->_screen, "_rotation");
    v19 = v18;
    -[UIScreen scale](self->_screen, "scale");
    v21 = v20;
    v22 = v15 * v20;
    v23 = (v7 >= v9) ^ (v22 < v17 * v21);
    if (v23)
      v24 = v17 * v21;
    else
      v24 = v22;
    if (v23)
      v25 = v22;
    else
      v25 = v17 * v21;
    CGAffineTransformMakeRotation(&v32, -v19);
    UIIntegralTransform();
    v34.origin.x = v11;
    v34.origin.y = v13;
    v34.size.width = v25;
    v34.size.height = v24;
    CGRectApplyAffineTransform(v34, &v33);
    v26 = objc_alloc(MEMORY[0x1E0CEADD8]);
    BSRectWithSize();
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v27 = (_UILayerHostView *)objc_msgSend(v26, "initWithFrame:pid:contextID:", self->_hostingPid, self->_hostingContextID);
    v28 = self->_layerHostView;
    self->_layerHostView = v27;

    memset(&v31, 0, sizeof(v31));
    CGAffineTransformMakeRotation(&v31, v19);
    v29 = v31;
    CGAffineTransformScale(&v30, &v29, 1.0 / v21, 1.0 / v21);
    v31 = v30;
    -[_UILayerHostView setTransform:](self->_layerHostView, "setTransform:", &v30);
    objc_msgSend(v5, "addSubview:", self->_layerHostView);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_layerHostView, 0);
}

@end
