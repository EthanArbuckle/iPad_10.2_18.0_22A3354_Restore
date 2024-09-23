@implementation SBSwitcherCaptureExtensionLiveContentOverlay

- (SBSwitcherCaptureExtensionLiveContentOverlay)initWithEntity:(id)a3 windowScene:(id)a4
{
  id v7;
  id v8;
  SBSwitcherCaptureExtensionLiveContentOverlay *v9;
  SBSwitcherCaptureExtensionLiveContentOverlay *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  SBSDisplayLayoutElement *displayLayoutElement;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBSwitcherCaptureExtensionLiveContentOverlay;
  v9 = -[SBSwitcherCaptureExtensionLiveContentOverlay init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entity, a3);
    objc_storeWeak((id *)&v10->_sbWindowScene, v8);
    v11 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithIdentifier:", v13);
    displayLayoutElement = v10->_displayLayoutElement;
    v10->_displayLayoutElement = (SBSDisplayLayoutElement *)v14;

  }
  return v10;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void (**v5)(id, SBSDisplayLayoutElement *);
  id WeakRetained;
  objc_class *v7;
  void *v8;
  void *v9;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  void (*v13)(void);
  void *v14;
  void *v15;
  id v16;

  if (self->_displayLayoutElementAssertion)
  {
    v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCaptureExtensionLiveContentOverlay.m"), 54, CFSTR("No window scene to get a publisher: %@"), self);

    }
    objc_msgSend(WeakRetained, "displayLayoutPublisher");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCaptureExtensionLiveContentOverlay.m"), 54, CFSTR("No publisher for window scene: %@; self: %@"),
        WeakRetained,
        self);

    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitionAssertionWithReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    objc_msgSend(v16, "addElement:", self->_displayLayoutElement);
    v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    objc_msgSend(v9, "invalidate");
  }
  else
  {
    v13 = (void (*)(void))*((_QWORD *)a3 + 2);
    v16 = a3;
    v13();
  }

}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutElementAssertion;
  id WeakRetained;
  SBSDisplayLayoutElement *displayLayoutElement;
  void *v8;
  void *v9;
  double v10;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  void *v14;
  void *v15;
  void *v16;

  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (!displayLayoutElementAssertion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
      if (!WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCaptureExtensionLiveContentOverlay.m"), 71, CFSTR("No window scene to get a publisher: %@"), self);

      }
      objc_msgSend(WeakRetained, "displayLayoutPublisher");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCaptureExtensionLiveContentOverlay.m"), 71, CFSTR("No publisher for window scene: %@; self: %@"),
          WeakRetained,
          self);

      }
      displayLayoutElement = self->_displayLayoutElement;
      -[SBSwitcherCaptureExtensionLiveContentOverlay contentOverlayView](self, "contentOverlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "level");
      -[SBSDisplayLayoutElement setLevel:](displayLayoutElement, "setLevel:", (uint64_t)v10);

      objc_msgSend(v16, "addElement:", self->_displayLayoutElement);
      v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v12 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v11;

    }
  }
  else if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    v13 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (UIView)contentOverlayView
{
  void *v2;
  void *v3;

  -[SBSwitcherCaptureExtensionLiveContentOverlay contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[4];
  char v8;

  v4 = a3;
  -[SBSwitcherCaptureExtensionLiveContentOverlay _hostedSceneID](self, "_hostedSceneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__SBSwitcherCaptureExtensionLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke;
  v7[3] = &__block_descriptor_33_e33_v16__0__SBSDisplayLayoutElement_8l;
  v8 = v6;
  -[SBSwitcherCaptureExtensionLiveContentOverlay updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v7);
}

uint64_t __84__SBSwitcherCaptureExtensionLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasKeyboardFocus:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  void (*v9)(id);
  void (**v10)(void);

  v9 = (void (*)(id))*((_QWORD *)a7 + 2);
  v10 = (void (**)(void))a8;
  v9(a7);
  v10[2]();

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
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  int64_t v7;

  -[SBSwitcherCaptureExtensionLiveContentOverlay _sceneHandleIfExists](self, "_sceneHandleIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "currentInterfaceOrientation");
  else
    v7 = 0;

  return v7;
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
  return 0.0;
}

- (id)liveSceneIdentityToken
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSwitcherCaptureExtensionLiveContentOverlay _sceneIfExists](self, "_sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isActive"))
  {
    objc_msgSend(v2, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isForeground"))
    {
      objc_msgSend(v2, "identityToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (int64_t)overlayType
{
  return 5;
}

- (id)contentViewController
{
  return self->_hostableEntityViewController;
}

- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12
{
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CSHostableEntity *hostableEntity;
  id v21;
  CSCoverSheetViewPresenting *hostableEntityViewController;
  id v23;

  objc_msgSend(a3, "captureExtensionEntity", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "captureApplicationForExtensionIdentifier:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "captureApplicationForBundleIdentifier:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v15 | v17)
  {
    objc_msgSend(v23, "hostableEntity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hostingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHostableEntityContentMode:", 2);
    hostableEntity = self->_hostableEntity;
    self->_hostableEntity = (CSHostableEntity *)v18;
    v21 = v18;

    hostableEntityViewController = self->_hostableEntityViewController;
    self->_hostableEntityViewController = (CSCoverSheetViewPresenting *)v19;

  }
}

- (void)invalidate
{
  BSInvalidatable *displayLayoutElementAssertion;
  CSCoverSheetViewPresenting *hostableEntityViewController;
  CSHostableEntity *hostableEntity;

  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  -[CSCoverSheetViewPresenting invalidate](self->_hostableEntityViewController, "invalidate");
  hostableEntityViewController = self->_hostableEntityViewController;
  self->_hostableEntityViewController = 0;

  hostableEntity = self->_hostableEntity;
  self->_hostableEntity = 0;

}

- (id)_hostedSceneID
{
  void *v3;
  void *v4;
  void *v5;

  -[SBSwitcherCaptureExtensionLiveContentOverlay _sceneHandleIfExists](self, "_sceneHandleIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CSCoverSheetViewPresenting sceneForTraitsParticipant](self->_hostableEntityViewController, "sceneForTraitsParticipant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)_sceneIfExists
{
  void *v3;
  void *v4;

  -[SBSwitcherCaptureExtensionLiveContentOverlay _sceneHandleIfExists](self, "_sceneHandleIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CSCoverSheetViewPresenting sceneForTraitsParticipant](self->_hostableEntityViewController, "sceneForTraitsParticipant");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)_sceneHandleIfExists
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting sceneHandleForTraitsParticipant](self->_hostableEntityViewController, "sceneHandleForTraitsParticipant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMaximized
{
  return self->_maximized;
}

- (void)setMaximized:(BOOL)a3
{
  self->_maximized = a3;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->_cornerRadii.topLeft;
  bottomLeft = self->_cornerRadii.bottomLeft;
  bottomRight = self->_cornerRadii.bottomRight;
  topRight = self->_cornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->_asyncRenderingEnabled;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->_wantsEnhancedWindowingEnabled = a3;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->_resizesHostedContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostableEntityViewController, 0);
  objc_storeStrong((id *)&self->_hostableEntity, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
