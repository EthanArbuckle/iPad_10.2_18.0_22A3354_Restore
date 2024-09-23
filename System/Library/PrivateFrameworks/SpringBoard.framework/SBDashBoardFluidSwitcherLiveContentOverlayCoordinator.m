@implementation SBDashBoardFluidSwitcherLiveContentOverlayCoordinator

- (SBDashBoardFluidSwitcherLiveContentOverlayCoordinator)initWithWindowScene:(id)a3
{
  id v4;
  SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *v5;
  SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardFluidSwitcherLiveContentOverlayCoordinator;
  v5 = -[SBDashBoardFluidSwitcherLiveContentOverlayCoordinator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sbWindowScene, v4);

  return v6;
}

- (id)appLayoutForKeyboardFocusedScene
{
  return 0;
}

- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  return 0;
}

- (void)appLayoutWillBecomeVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SBSwitcherCaptureExtensionLiveContentOverlay *v7;
  void *v8;
  SBCaptureExtensionWorkspaceEntity *v9;
  void *v10;
  SBCaptureExtensionWorkspaceEntity *v11;
  SBSwitcherCaptureExtensionLiveContentOverlay *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  -[SBDashBoardFluidSwitcherLiveContentOverlayCoordinator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardFluidSwitcherLiveContentOverlayCoordinator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "itemForLayoutRole:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") == 7 || !objc_msgSend(v6, "type"))
  {
    objc_msgSend(v5, "liveContentOverlayCoordinator:hostableEntityForDisplayItem:", self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [SBCaptureExtensionWorkspaceEntity alloc];
    objc_msgSend(v6, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBCaptureExtensionWorkspaceEntity initWithBundleIdentifier:hostableEntity:](v9, "initWithBundleIdentifier:hostableEntity:", v10, v8);

    v12 = [SBSwitcherCaptureExtensionLiveContentOverlay alloc];
    -[SBCaptureExtensionWorkspaceEntity captureExtensionEntity](v11, "captureExtensionEntity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    v7 = -[SBSwitcherCaptureExtensionLiveContentOverlay initWithEntity:windowScene:](v12, "initWithEntity:windowScene:", v13, WeakRetained);

    LOBYTE(v20) = 0;
    -[SBSwitcherCaptureExtensionLiveContentOverlay configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:](v7, "configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:", v11, 1, 1, 1, 1, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0, v20, 2);
    objc_msgSend(v4, "parentViewControllerForContentOverlay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherCaptureExtensionLiveContentOverlay contentViewController](v7, "contentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "view");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = v16;
      objc_msgSend(v5, "liveContentOverlayCoordinator:coverSheetPresenterForDisplayItem:", self, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPresenter:", v19);

    }
    objc_msgSend(v15, "addChildViewController:", v16);
    objc_msgSend(v16, "bs_beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(v16, "didMoveToParentViewController:", v15);
    objc_msgSend(v16, "bs_endAppearanceTransition");

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "addLiveContentOverlay:forAppLayout:animated:", v7, v21, 0);

}

- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3
{
  return 0;
}

- (SBWindowScene)sbWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return self->_liveContentOverlayUpdatesSuspended;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  self->_liveContentOverlayUpdatesSuspended = a3;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setContainerOrientation:(int64_t)a3
{
  self->_containerOrientation = a3;
}

- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBDashBoardFluidSwitcherLiveContentOverlayCoordinatorDataSource)dataSource
{
  return (SBDashBoardFluidSwitcherLiveContentOverlayCoordinatorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

@end
