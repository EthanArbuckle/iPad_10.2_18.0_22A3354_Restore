@implementation SBShelfLiveContentOverlay

- (SBShelfLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 livePortalView:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  SBShelfLiveContentOverlay *v16;
  SBShelfLiveContentOverlay *v17;
  uint64_t v18;
  SBDeviceApplicationSceneView *sceneView;
  id v20;
  uint64_t v21;
  SBUISizeObservingView *sizeObservingView;
  objc_super v24;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBShelfLiveContentOverlay;
  v16 = -[SBShelfLiveContentOverlay init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sceneHandle, a3);
    v18 = -[SBDeviceApplicationSceneHandle newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:](v17->_sceneHandle, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", a5, a6, v17, width, height);
    sceneView = v17->_sceneView;
    v17->_sceneView = (SBDeviceApplicationSceneView *)v18;

    -[SBSceneView setCustomContentView:](v17->_sceneView, "setCustomContentView:", v15);
    -[SBSceneView setDisplayMode:animationFactory:completion:](v17->_sceneView, "setDisplayMode:animationFactory:completion:", 1, 0, 0);
    v20 = objc_alloc(MEMORY[0x1E0DAC670]);
    v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sizeObservingView = v17->_sizeObservingView;
    v17->_sizeObservingView = (SBUISizeObservingView *)v21;

    -[SBUISizeObservingView setDelegate:](v17->_sizeObservingView, "setDelegate:", v17);
    -[SBUISizeObservingView addSubview:](v17->_sizeObservingView, "addSubview:", v17->_sceneView);
    -[SBShelfLiveContentOverlay _updateSceneViewInSideSizeObservingViewIfNecessary](v17, "_updateSceneViewInSideSizeObservingViewIfNecessary");
  }

  return v17;
}

- (void)setDisplayMode:(unint64_t)a3
{
  SBDeviceApplicationSceneView *v3;
  uint64_t v4;
  SBDeviceApplicationSceneView *v5;
  uint64_t v6;
  SBDeviceApplicationSceneView *sceneView;
  id v8;

  if (a3 == 1)
  {
    sceneView = self->_sceneView;
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.35);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = sceneView;
    v6 = 1;
  }
  else
  {
    if (a3)
      return;
    v3 = self->_sceneView;
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.35);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = 2;
  }
  v8 = (id)v4;
  -[SBSceneView setDisplayMode:animationFactory:completion:](v5, "setDisplayMode:animationFactory:completion:", v6);

}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  if (self->_sizeObservingView == a3)
    -[SBShelfLiveContentOverlay _updateSceneViewInSideSizeObservingViewIfNecessary](self, "_updateSceneViewInSideSizeObservingViewIfNecessary", a4.width, a4.height);
}

- (void)_updateSceneViewInSideSizeObservingViewIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  SBDeviceApplicationSceneView *sceneView;
  double v14;
  SBDeviceApplicationSceneView *v15;
  CGFloat v16;
  SBDeviceApplicationSceneView *v17;
  __int128 v18;
  _OWORD v19[3];
  CGAffineTransform v20;

  -[SBUISizeObservingView bounds](self->_sizeObservingView, "bounds");
  v4 = v3;
  v6 = v5;
  -[SBSceneView referenceSize](self->_sceneView, "referenceSize");
  v8 = v7;
  v10 = v9;
  v11 = -[SBSceneView orientation](self->_sceneView, "orientation") - 3;
  if (v11 >= 2)
    v12 = v8;
  else
    v12 = v10;
  sceneView = self->_sceneView;
  if (v12 >= v4)
  {
    SBRectWithSize();
    -[SBDeviceApplicationSceneView setBounds:](sceneView, "setBounds:");
    -[SBDeviceApplicationSceneView setCenter:](self->_sceneView, "setCenter:", v4 * 0.5, v6 * 0.5);
    v17 = self->_sceneView;
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v19[0] = *MEMORY[0x1E0C9BAA8];
    v19[1] = v18;
    v19[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[SBDeviceApplicationSceneView setTransform:](v17, "setTransform:", v19);
  }
  else
  {
    if (v11 >= 2)
      v14 = v10;
    else
      v14 = v8;
    SBRectWithSize();
    -[SBDeviceApplicationSceneView setBounds:](sceneView, "setBounds:");
    v15 = self->_sceneView;
    v16 = v4 / v12;
    CGAffineTransformMakeScale(&v20, v16, v16);
    -[SBDeviceApplicationSceneView setTransform:](v15, "setTransform:", &v20);
    -[SBDeviceApplicationSceneView setCenter:](self->_sceneView, "setCenter:", v12 * v16 * 0.5, v14 * v16 * 0.5);
  }
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_sizeObservingView;
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (int64_t)leadingStatusBarStyle
{
  return 0;
}

- (double)currentStatusBarHeight
{
  return *MEMORY[0x1E0CEBBE0];
}

- (int64_t)preferredInterfaceOrientation
{
  return 1;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (int64_t)trailingStatusBarStyle
{
  return 0;
}

- (int64_t)touchBehavior
{
  return 1;
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (id)liveSceneIdentityToken
{
  return 0;
}

- (BOOL)isDisplayLayoutElementActive
{
  return 0;
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return CFSTR("Shelf");
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return -1;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->asyncRenderingEnabled;
}

- (BOOL)resizesHostedContext
{
  return self->resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->resizesHostedContext = a3;
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->wantsEnhancedWindowingEnabled;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->wantsEnhancedWindowingEnabled = a3;
}

- (BOOL)isMaximized
{
  return self->maximized;
}

- (void)setMaximized:(BOOL)a3
{
  self->maximized = a3;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->cornerRadii.topLeft;
  bottomLeft = self->cornerRadii.bottomLeft;
  bottomRight = self->cornerRadii.bottomRight;
  topRight = self->cornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  self->cornerRadii = a3;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (BOOL)isPendingSwitcherSnapshotCacheUpdate
{
  return self->_pendingSwitcherSnapshotCacheUpdate;
}

- (void)setPendingSwitcherSnapshotCacheUpdate:(BOOL)a3
{
  self->_pendingSwitcherSnapshotCacheUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->contentOverlayView, 0);
  objc_storeStrong((id *)&self->_sizeObservingView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end
