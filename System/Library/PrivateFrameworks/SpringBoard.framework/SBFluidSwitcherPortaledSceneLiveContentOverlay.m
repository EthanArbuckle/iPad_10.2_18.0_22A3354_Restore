@implementation SBFluidSwitcherPortaledSceneLiveContentOverlay

- (SBFluidSwitcherPortaledSceneLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 livePortalView:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  SBFluidSwitcherPortaledSceneLiveContentOverlay *v16;
  SBFluidSwitcherPortaledSceneLiveContentOverlay *v17;
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
  v24.super_class = (Class)SBFluidSwitcherPortaledSceneLiveContentOverlay;
  v16 = -[SBFluidSwitcherPortaledSceneLiveContentOverlay init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sceneHandle, a3);
    v17->_referenceSize.width = width;
    v17->_referenceSize.height = height;
    v17->_contentOrientation = a5;
    v17->_containerOrientation = a6;
    objc_storeStrong((id *)&v17->_livePortalView, a7);
    v18 = objc_msgSend(v14, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", a5, a6, v17, width, height);
    sceneView = v17->_sceneView;
    v17->_sceneView = (SBDeviceApplicationSceneView *)v18;

    -[SBSceneView setCustomContentView:](v17->_sceneView, "setCustomContentView:", v17->_livePortalView);
    -[SBSceneView setDisplayMode:animationFactory:completion:](v17->_sceneView, "setDisplayMode:animationFactory:completion:", 1, 0, 0);
    v20 = objc_alloc(MEMORY[0x1E0DAC670]);
    SBRectWithSize();
    v21 = objc_msgSend(v20, "initWithFrame:");
    sizeObservingView = v17->_sizeObservingView;
    v17->_sizeObservingView = (SBUISizeObservingView *)v21;

    -[SBUISizeObservingView setDelegate:](v17->_sizeObservingView, "setDelegate:", v17);
    -[SBUISizeObservingView addSubview:](v17->_sizeObservingView, "addSubview:", v17->_sceneView);
    -[SBFluidSwitcherPortaledSceneLiveContentOverlay sizeObservingView:didChangeSize:](v17, "sizeObservingView:didChangeSize:", v17->_sizeObservingView, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }

  return v17;
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return -1;
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_sizeObservingView;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (BOOL)isAsyncRenderingEnabled
{
  return 0;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return 0;
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (int64_t)touchBehavior
{
  return 0;
}

- (int64_t)preferredInterfaceOrientation
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (int64_t)leadingStatusBarStyle
{
  return 0;
}

- (int64_t)trailingStatusBarStyle
{
  return 0;
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (double)currentStatusBarHeight
{
  return *MEMORY[0x1E0CEBBE0];
}

- (id)liveSceneIdentityToken
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (BOOL)isDisplayLayoutElementActive
{
  return 0;
}

- (int64_t)overlayType
{
  return 4;
}

- (id)contentViewController
{
  return 0;
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  SBDeviceApplicationSceneView *sceneView;

  if (objc_msgSend(a3, "isEqual:", self->_sizeObservingView, a4.width, a4.height))
  {
    sceneView = self->_sceneView;
    -[SBUISizeObservingView bounds](self->_sizeObservingView, "bounds");
    -[SBDeviceApplicationSceneView setFrame:](sceneView, "setFrame:");
  }
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)resizesHostedContext
{
  return self->resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->resizesHostedContext = a3;
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

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (UIView)livePortalView
{
  return self->_livePortalView;
}

- (SBUISizeObservingView)sizeObservingView
{
  return self->_sizeObservingView;
}

- (SBDeviceApplicationSceneView)sceneView
{
  return self->_sceneView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_sizeObservingView, 0);
  objc_storeStrong((id *)&self->_livePortalView, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
