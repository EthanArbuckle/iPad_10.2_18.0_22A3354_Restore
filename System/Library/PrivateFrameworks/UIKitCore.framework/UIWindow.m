@implementation UIWindow

- (BOOL)_canBecomeLayoutEngineDelegate
{
  return 1;
}

+ (BOOL)_transformLayerRotationsAreEnabled
{
  return dyld_program_sdk_at_least();
}

- (BOOL)_cachedTraitCollectionIsValid
{
  return 1;
}

- (UIScreen)screen
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[_UISceneUIWindowHosting _screen](self->_windowHostingScene, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (UIScreen *)v5;
}

- (id)_normalInheritedTintColor
{
  void *v3;
  void *v4;

  -[UIView _interactionTintColor](self, "_interactionTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIView _interactionTintColor](self, "_interactionTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_layoutEngineIfAvailable
{
  if (qword_1ECD790E0 != -1)
    dispatch_once(&qword_1ECD790E0, &__block_literal_global_44_1);
  if (byte_1ECD790B2)
    return -[UIWindow _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
  else
    return -[UIView _layoutEngine](self, "_layoutEngine");
}

- (id)_appearanceContainer
{
  void *v2;
  objc_class *v3;

  -[UIWindow screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_userInterfaceIdiom");
  v3 = (objc_class *)_UIAppearanceContainerForUserInterfaceIdiom();

  return objc_alloc_init(v3);
}

uint64_t __36__UIWindow__subtreeMonitorsForView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_monitorsView:", *(_QWORD *)(a1 + 32));
}

- (CGPoint)_convertPointToSceneReferenceSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[_UISceneUIWindowHosting _coordinateSpace](self->_windowHostingScene, "_coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v6, x, y);
  v8 = v7;
  v10 = v9;

  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  v12 = v11;
  v14 = v13;
  -[_UISceneUIWindowHosting _effectiveSettings](self->_windowHostingScene, "_effectiveSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "interfaceOrientation");
  if (+[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"))
  {
    if (v16 == 2)
    {
      v17 = v12 - v8;
      v8 = v14 - v10;
    }
    else if (v16 == 3)
    {
      v17 = v12 - v10;
    }
    else
    {
      if (v16 == 4)
        v17 = v10;
      else
        v17 = v8;
      if (v16 == 4)
        v8 = v14 - v8;
      else
        v8 = v10;
    }
  }
  else
  {
    v17 = v8;
    v8 = v10;
  }

  v18 = v17;
  v19 = v8;
  result.y = v19;
  result.x = v18;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if ((*((_BYTE *)&self->_windowFlags + 4) & 4) == 0
    && -[UIWindow _updatesSafeAreaInsetsOnRead](self, "_updatesSafeAreaInsetsOnRead"))
  {
    *(_QWORD *)&self->_windowFlags |= 0x400000000uLL;
    -[UIWindow _normalizedSafeAreaInsets](self, "_normalizedSafeAreaInsets");
    -[UIView setSafeAreaInsets:](self, "setSafeAreaInsets:");
    *(_QWORD *)&self->_windowFlags &= ~0x400000000uLL;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIWindow;
  -[UIView safeAreaInsets](&v7, sel_safeAreaInsets);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_updatesSafeAreaInsetsOnRead
{
  return 1;
}

- (UIEdgeInsets)_normalizedSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat Width;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat Height;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat x;
  CGFloat y;
  CGFloat v34;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  UIEdgeInsets result;
  CGRect v62;

  -[UIWindow _sceneSafeAreaInsetsIncludingStatusBar:](self, "_sceneSafeAreaInsetsIncludingStatusBar:", dyld_program_sdk_at_least());
  v6 = v3;
  v48 = v7;
  v49 = v4;
  v8 = v5;
  if (v7 == 0.0 && v3 == 0.0 && v5 == 0.0 && v4 == 0.0)
  {
    -[UIWindow screen](self, "screen", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "overscanCompensationInsets");
    v6 = v10;
    v48 = v11;
    v49 = v12;
    v8 = v13;

  }
  v47 = v8;
  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  Width = v20;
  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if ((unint64_t)(-[UIWindow interfaceOrientation](self, "interfaceOrientation") - 3) <= 1)
  {
    v50.origin.x = v15;
    v50.origin.y = v17;
    v50.size.width = v19;
    v50.size.height = Width;
    v24 = v23;
    v25 = v22;
    Height = CGRectGetHeight(v50);
    v51.origin.x = v15;
    v51.origin.y = v17;
    v51.size.width = v19;
    v51.size.height = Width;
    Width = CGRectGetWidth(v51);
    v19 = Height;
    v22 = v25;
    v23 = v24;
  }
  -[UIView frame](self, "frame");
  v62.origin.x = v27;
  v62.origin.y = v28;
  v62.size.width = v29;
  v62.size.height = v30;
  v52.origin.x = v22;
  v52.origin.y = v23;
  v52.size.width = v19;
  v52.size.height = Width;
  if (CGRectContainsRect(v52, v62))
  {
    -[UIView frame](self, "frame");
    v31 = v22;
    v44 = v53.size.width;
    v45 = v6;
    v43 = v53.size.height;
    x = v53.origin.x;
    y = v53.origin.y;
    v34 = v53.size.width;
    MinY = CGRectGetMinY(v53);
    v54.origin.x = v31;
    v54.origin.y = v23;
    v54.size.width = v19;
    v54.size.height = Width;
    v46 = fmax(v45 - fmax(MinY - CGRectGetMinY(v54), 0.0), 0.0);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = v34;
    v55.size.height = v43;
    MinX = CGRectGetMinX(v55);
    v56.origin.x = v31;
    v56.origin.y = v23;
    v56.size.width = v19;
    v56.size.height = Width;
    v48 = fmax(v48 - fmax(MinX - CGRectGetMinX(v56), 0.0), 0.0);
    v57.origin.x = v31;
    v57.origin.y = v23;
    v57.size.width = v19;
    v57.size.height = Width;
    MaxY = CGRectGetMaxY(v57);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = v44;
    v58.size.height = v43;
    v49 = fmax(v49 - fmax(MaxY - CGRectGetMaxY(v58), 0.0), 0.0);
    v59.origin.x = v31;
    v59.origin.y = v23;
    v59.size.width = v19;
    v59.size.height = Width;
    MaxX = CGRectGetMaxX(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v6 = v46;
    v60.size.width = v44;
    v60.size.height = v43;
    v39 = fmax(v47 - fmax(MaxX - CGRectGetMaxX(v60), 0.0), 0.0);
  }
  else
  {
    v39 = v47;
  }
  v40 = v6;
  v41 = v48;
  v42 = v49;
  result.right = v39;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (int64_t)interfaceOrientation
{
  void *v3;
  int64_t v4;

  if (self->_viewOrientation)
    return self->_viewOrientation;
  -[UIWindow _windowHostingScene](self, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_interfaceOrientation");

  return v4;
}

- (CGRect)_sceneReferenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  if (self->_windowHostingScene)
  {
    -[_UISceneUIWindowHosting _referenceBounds](self->_windowHostingScene, "_referenceBounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
  }
  else
  {
    -[UIWindow screen](self, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_unjailedReferenceBounds");
    v3 = v11;
    v5 = v12;
    v7 = v13;
    v9 = v14;

  }
  v15 = v3;
  v16 = v5;
  v17 = v7;
  v18 = v9;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)__isLandmarkView
{
  return 1;
}

- (BOOL)__isKindOfUIWindow
{
  return 1;
}

- (void)_populateInitialTraitCollection:(id)a3
{
  UITraitCollection *v4;
  int has_internal_diagnostics;
  UITraitCollection *traitCollection;
  UITraitCollection *v7;
  UITraitCollection *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  UIWindow *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (UITraitCollection *)a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  traitCollection = self->_traitCollection;
  if (has_internal_diagnostics)
  {
    if (traitCollection)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Window was already initialized: %@", buf, 0xCu);
      }

    }
  }
  else if (traitCollection)
  {
    v10 = _populateInitialTraitCollection____s_category;
    if (!_populateInitialTraitCollection____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_populateInitialTraitCollection____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Window was already initialized: %@", buf, 0xCu);
    }
  }
  v7 = self->_traitCollection;
  self->_traitCollection = v4;
  v8 = v4;

  v12.receiver = self;
  v12.super_class = (Class)UIWindow;
  -[UIView _populateInitialTraitCollection:](&v12, sel__populateInitialTraitCollection_, v8);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_unregisterSubtreeMonitor:(id)a3
{
  NSMutableSet *subtreeMonitors;

  -[NSMutableSet removeObject:](self->_subtreeMonitors, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_subtreeMonitors, "count"))
  {
    subtreeMonitors = self->_subtreeMonitors;
    self->_subtreeMonitors = 0;

  }
}

- (_UIRootPresentationController)_rootPresentationController
{
  return self->_rootPresentationController;
}

- (BOOL)_isInAWindow
{
  return 1;
}

- (BOOL)_windowOwnsInterfaceOrientationTransform
{
  void *v3;
  uint64_t v4;
  int v5;
  _UISceneUIWindowHosting *windowHostingScene;
  UIWindow *v8;
  UIWindow *v9;
  BOOL v10;

  if (-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation")
    || (-[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "state"),
        v3,
        (unint64_t)(v4 - 1) < 2))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    windowHostingScene = self->_windowHostingScene;
    if (windowHostingScene
      && -[_UISceneUIWindowHosting _canDynamicallySpecifySupportedInterfaceOrientations](windowHostingScene, "_canDynamicallySpecifySupportedInterfaceOrientations"))
    {
      +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", self->_windowHostingScene);
      v8 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        v10 = v8 == self;
      else
        v10 = 1;
      if (v10)
        LOBYTE(v5) = 0;
      else
        v5 = -[UIWindow isEqual:](self, "isEqual:", v8) ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_windowOwnsInterfaceOrientation
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  -[_UISceneUIWindowHosting _FBSScene](self->_windowHostingScene, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "uiCanReceiveDeviceOrientationEvents") & 1) == 0)
  {
    objc_msgSend(v3, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "interfaceOrientationMode") == 100;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (UIEdgeInsets)_sceneSafeAreaInsetsIncludingStatusBar:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  if (!self->_windowHostingScene)
  {
    v13 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
    v7 = 0.0;
    goto LABEL_11;
  }
  v3 = a3;
  v5 = -[UIWindow _interfaceOrientationForSceneSafeAreaInsetsIncludingStatusBar:](self, "_interfaceOrientationForSceneSafeAreaInsetsIncludingStatusBar:");
  -[_UISceneUIWindowHosting _safeAreaInsetsForInterfaceOrientation:](self->_windowHostingScene, "_safeAreaInsetsForInterfaceOrientation:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (!-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
  {
    -[UIWindow traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "userInterfaceIdiom") != 3)
    {
      -[UIWindow windowScene](self, "windowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == objc_msgSend(v15, "interfaceOrientation"))
      {
        v16 = objc_msgSend((id)UIApp, "_isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:", self);

        if (v3 && (v16 & 1) == 0)
        {
          __UIStatusBarManagerForWindow(self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "statusBarHeight");
          v19 = v18;

          v7 = fmax(v7, v19);
        }
        goto LABEL_11;
      }

    }
  }
LABEL_11:
  v20 = v7;
  v21 = v9;
  v22 = v11;
  v23 = v13;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (id)traitCollection
{
  UITraitCollection *v3;
  UITraitCollection *traitCollection;

  if (!self->_traitCollection && (*(_QWORD *)&self->super._viewFlags & 0x1000) == 0)
  {
    if (dyld_program_sdk_at_least())
    {
      +[UITraitCollection _fallbackTraitCollection]();
      v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
      traitCollection = self->_traitCollection;
      self->_traitCollection = v3;

      _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)self->_traitCollection);
    }
    else
    {
      -[UIWindow _updateWindowTraitsAndNotify:](self, "_updateWindowTraitsAndNotify:", 0);
    }
  }
  return self->_traitCollection;
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke(uint64_t a1, void *a2, char a3, char a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  v6 = a2;
  v7 = v6[73];
  v8 = v6[13];
  v9 = 0;
  if (objc_msgSend(v6, "_canAffectStatusBarAppearance"))
  {
    if ((v7 & 0x40000000) != 0)
      v10 = 0;
    else
      v10 = a3;
    if ((v8 & 0x400) != 0)
      v11 = 0;
    else
      v11 = a4;
    if ((v10 & 1) == 0 && (v11 & 1) == 0)
      v9 = objc_msgSend(v6, "_isHostedInAnotherProcess") ^ 1;
  }

  return v9;
}

- (BOOL)_isHostedInAnotherProcess
{
  return !-[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged");
}

- (BOOL)_isWindowServerHostingManaged
{
  return objc_msgSend((id)UIApp, "_isWindowServerHostingManaged");
}

- (BOOL)_canAffectStatusBarAppearance
{
  return !-[UIWindow isInternalWindow](self, "isInternalWindow");
}

- (BOOL)isInternalWindow
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (int64_t)_orientationForViewTransform
{
  return self->_viewOrientation;
}

+ (BOOL)_prefersStatusBarHiddenInWindow:(id)a3 targetOrientation:(int64_t)a4 animationProvider:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v7 = a3;
  v8 = v7;
  if (!a4)
  {
LABEL_6:
    if (!objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance"))
    {
      LOBYTE(v16) = objc_msgSend((id)UIApp, "_isStatusBarHiddenForOrientation:", a4);
      goto LABEL_16;
    }
    objc_msgSend(v8, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_effectiveStatusBarHiddenViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      LOBYTE(v16) = objc_msgSend(v18, "_preferredStatusBarVisibility") == 1;
      if (!a5)
      {
LABEL_15:

        goto LABEL_16;
      }
      v19 = objc_retainAutorelease(v18);
    }
    else
    {
      objc_msgSend(v8, "_rootPresentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_15;
      objc_msgSend(v8, "_rootPresentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v20, "_preferredStatusBarVisibility") == 1;

      if (!a5)
        goto LABEL_15;
      objc_msgSend(v8, "_rootPresentationController");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a5 = v19;
    goto LABEL_15;
  }
  objc_msgSend(v7, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusBarManager");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_6;
  }
  v11 = (void *)v10;
  objc_msgSend(v8, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statusBarManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultStatusBarHeightInOrientation:", a4);
  v15 = v14;

  if (v15 != 0.0)
    goto LABEL_6;
  LOBYTE(v16) = 1;
LABEL_16:

  return (char)v16;
}

- (id)_eventRoutingScene
{
  _UISceneUIWindowHosting *windowHostingScene;

  if (-[_UISceneUIWindowHosting _allowsEventUIWindowRouting](self->_windowHostingScene, "_allowsEventUIWindowRouting"))windowHostingScene = self->_windowHostingScene;
  else
    windowHostingScene = 0;
  return windowHostingScene;
}

- (UIWindowScene)windowScene
{
  if ((*((_BYTE *)&self->_windowFlags + 4) & 8) != 0)
    return (UIWindowScene *)self->_windowHostingScene;
  else
    return (UIWindowScene *)0;
}

- (id)parentFocusEnvironment
{
  void *v2;
  void *v3;
  void *v4;

  -[UIWindow windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusSystemSceneComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_prefersStatusBarHiddenInWindow:(id)a3 animationProvider:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "_prefersStatusBarHiddenInWindow:targetOrientation:animationProvider:", v6, objc_msgSend(v7, "interfaceOrientation"), a4);

  return (char)a4;
}

- (_UIForcedOrientationTransactionToken)_orientationTransactionToken
{
  return (_UIForcedOrientationTransactionToken *)objc_loadWeakRetained((id *)&self->__orientationTransactionToken);
}

- (BOOL)_isRemoteKeyboardWindow
{
  return 0;
}

- (BOOL)_shouldForceTraitPropagationThroughHierarchy
{
  return 0;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

+ (id)allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 forScreen:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __76__UIWindow_allWindowsIncludingInternalWindows_onlyVisibleWindows_forScreen___block_invoke;
  v18 = &unk_1E16DE7D8;
  v19 = v8;
  v10 = v9;
  v20 = v10;
  v11 = v8;
  objc_msgSend(a1, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", v6, v5, 0, &v15);
  objc_msgSend(v10, "sortUsingFunction:context:", _UIWindowCompareWindowsUsingLevel, 0, v15, v16, v17, v18);
  v12 = v20;
  v13 = v10;

  return v13;
}

+ (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 allowMutation:(BOOL)a5 withBlock:(id)a6
{
  +[UIScene _enumerateAllWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:withBlock:](UIWindowScene, "_enumerateAllWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:withBlock:", a3, a4, a5, a6);
}

void __76__UIWindow_allWindowsIncludingInternalWindows_onlyVisibleWindows_forScreen___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;

  if (!*(_QWORD *)(a1 + 32)
    || (objc_msgSend(a2, "screen"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = *(void **)(a1 + 32),
        v4,
        v4 == v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
}

+ (id)allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4
{
  return (id)objc_msgSend(a1, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", a3, a4, 0);
}

- (UIWindowLevel)windowLevel
{
  return self->_windowLevel;
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isTrackingKeyboard
{
  NSMutableArray *currentKeyboardTrackingLayoutGuides;

  if (self->_primaryKeyboardTrackingGuide)
  {
    currentKeyboardTrackingLayoutGuides = self->_currentKeyboardTrackingLayoutGuides;
    if (currentKeyboardTrackingLayoutGuides)
      LOBYTE(currentKeyboardTrackingLayoutGuides) = -[NSMutableArray count](currentKeyboardTrackingLayoutGuides, "count") != 0;
  }
  else
  {
    LOBYTE(currentKeyboardTrackingLayoutGuides) = 0;
  }
  return (char)currentKeyboardTrackingLayoutGuides;
}

BOOL __75__UIWindow__hitTestToPoint_scenePointZ_forEvent_windowServerHitTestWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "_ignoresHitTest") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- ($015CE332057EA49C37F0282AEB389482)_bindingDescription
{
  $015CE332057EA49C37F0282AEB389482 *result;
  id v6;

  -[UIWindow screen](self, "screen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var0 = (id)objc_msgSend(v6, "displayIdentity");
  retstr->var1 = 0;
  retstr->var2 = -[UIWindow _ignoresHitTest](self, "_ignoresHitTest");
  retstr->var3 = -[UIWindow _shouldCreateContextAsSecure](self, "_shouldCreateContextAsSecure");
  retstr->var4 = -[UIWindow _shouldUseRemoteContext](self, "_shouldUseRemoteContext");
  retstr->var5 = -[UIWindow _alwaysGetsContexts](self, "_alwaysGetsContexts");
  retstr->var6 = -[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged");
  retstr->var7 = -[UIWindow keepContextInBackground](self, "keepContextInBackground");
  retstr->var8 = -[UIWindow _isHostingPortalViews](self, "_isHostingPortalViews");
  retstr->var9 = -[UIWindow _allowsOcclusionDetectionOverride](self, "_allowsOcclusionDetectionOverride");

  return result;
}

- (BOOL)_ignoresHitTest
{
  return 0;
}

- (BOOL)keepContextInBackground
{
  return *((_BYTE *)&self->_windowFlags + 3) & 1;
}

- (BOOL)_shouldUseRemoteContext
{
  BOOL result;

  result = UIApp;
  if (UIApp)
    return objc_msgSend((id)objc_opt_class(), "rendersLocally") ^ 1;
  return result;
}

- (BOOL)_shouldCreateContextAsSecure
{
  int v2;

  if ((*((_BYTE *)&self->_windowFlags + 3) & 0x20) != 0 || (objc_msgSend((id)objc_opt_class(), "_isSecure") & 1) != 0)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = objc_msgSend((id)objc_opt_class(), "_isSystemWindow");
    if (v2)
      LOBYTE(v2) = objc_msgSend((id)UIApp, "_areSystemWindowsSecure");
  }
  return v2;
}

- (BOOL)_isHostingPortalViews
{
  return 0;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 0;
}

- (BOOL)_alwaysGetsContexts
{
  return !-[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged");
}

+ (BOOL)_isSecure
{
  return 0;
}

+ (BOOL)_isSystemWindow
{
  return 0;
}

- (id)_hitTestLocation:(CGPoint)a3 sceneLocationZ:(double)a4 inScene:(id)a5 withWindowServerHitTestWindow:(id)a6 event:(id)a7
{
  double y;
  double x;
  id v12;
  id v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v12 = a7;
  v13 = a6;
  -[UIView _hitTest:withEvent:windowServerHitTestWindow:](self, "_hitTest:withEvent:windowServerHitTestWindow:", v12, v13, _UIConvertScenePoint3DToWindow(a5, self, x, y));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_appearsInLoupe
{
  return 1;
}

- (BOOL)_shouldControlAutorotation
{
  _BOOL4 v3;

  v3 = -[UIWindow _canAffectStatusBarAppearance](self, "_canAffectStatusBarAppearance");
  if (v3)
    LOBYTE(v3) = -[UIWindow _appearsInLoupe](self, "_appearsInLoupe");
  return v3;
}

- (void)_tintColorDidChange
{
  objc_super v3;

  if ((*((_BYTE *)&self->_windowFlags + 4) & 0x40) == 0)
    -[UIWindow _updateWindowTraits](self, "_updateWindowTraits");
  v3.receiver = self;
  v3.super_class = (Class)UIWindow;
  -[UIView _tintColorDidChange](&v3, sel__tintColorDidChange);
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)layoutViewsForTrackedGuides
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_currentKeyboardTrackingLayoutGuides;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "owningView", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutIfNeeded");

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)_hasContext
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  v3 = WeakRetained != 0;

  return v3;
}

- (int64_t)_windowInterfaceOrientation
{
  int v3;
  int64_t viewOrientation;

  v3 = objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled");
  if (self->_viewOrientation <= 1uLL)
    viewOrientation = 1;
  else
    viewOrientation = self->_viewOrientation;
  if (v3)
    return self->_viewOrientation;
  else
    return viewOrientation;
}

- (double)level
{
  return self->_windowLevel;
}

- (BOOL)_definesDynamicTintColor
{
  void *v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  -[UIView _interactionTintColor](self, "_interactionTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWindow;
    return -[UIView _definesDynamicTintColor](&v7, sel__definesDynamicTintColor);
  }
  else
  {
    +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", objc_msgSend(-[UIWindow _screen](self, "_screen"), "_userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isDynamic");

    return v6;
  }
}

- (void)_traitOverridesWillChange:(id)a3 withApplicator:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (-[UIWindow _shouldPropagateTraitCollectionChanges](self, "_shouldPropagateTraitCollectionChanges"))
  {
    -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _traitCollectionForSize:parentCollection:traitOverrideApplicator:](self, "_traitCollectionForSize:parentCollection:traitOverrideApplicator:", v5, v7, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWindow _willTransitionToTraitCollection:withTransitionCoordinator:](self, "_willTransitionToTraitCollection:withTransitionCoordinator:", v6, 0);
  }

}

- (void)_createSystemGestureGateGestureRecognizerIfNeeded
{
  _UISystemGestureGateGestureRecognizer *v3;
  _UISystemGestureGateGestureRecognizer *systemGestureGateForGestures;
  _UISystemGestureGateGestureRecognizer *v5;
  _UISystemGestureGateGestureRecognizer *systemGestureGateForTouches;

  if (!self->_systemGestureGateForGestures)
  {
    v3 = -[_UISystemGestureGateGestureRecognizer initWithWindow:type:]([_UISystemGestureGateGestureRecognizer alloc], "initWithWindow:type:", self, 1);
    systemGestureGateForGestures = self->_systemGestureGateForGestures;
    self->_systemGestureGateForGestures = v3;

    v5 = -[_UISystemGestureGateGestureRecognizer initWithWindow:type:]([_UISystemGestureGateGestureRecognizer alloc], "initWithWindow:type:", self, 0);
    systemGestureGateForTouches = self->_systemGestureGateForTouches;
    self->_systemGestureGateForTouches = v5;

    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_systemGestureGateForGestures);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_systemGestureGateForTouches);
  }
}

- (id)_roleHint
{
  return self->_roleHint;
}

- (BOOL)isRotating
{
  return (*((unsigned __int8 *)&self->_windowFlags + 1) >> 2) & 1;
}

+ (uint64_t)_checkPreCommitHandlersAfterCAFlush
{
  uint64_t result;

  objc_opt_self();
  if (!byte_1EDDC858D)
  {
    result = objc_msgSend((id)qword_1EDDC8658, "count");
    if (result)
      goto LABEL_7;
    if (!byte_1EDDC858D)
      return result;
  }
  result = objc_msgSend(MEMORY[0x1E0CD28B0], "currentState");
  if ((result & 3) == 0)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    objc_msgSend((id)qword_1EDDC8658, "count");
    objc_msgSend(MEMORY[0x1E0CD28B0], "currentState");
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_7:
    _os_crash();
    __break(1u);
  }
  return result;
}

- (id)_exclusiveTouchView
{
  return self->_exclusiveTouchView;
}

- (void)_noteOverlayInsetsDidChange
{
  UIWindow *v3;
  UIWindow *v4;
  UIWindow *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[UIWindow allowsWeakReference](self, sel_allowsWeakReference))
    v3 = self;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4 && !v4->_notedOverlayInsetChange)
  {
    v4->_notedOverlayInsetChange = 1;
    objc_initWeak(&location, v4);
    v6 = (void *)UIApp;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__UIWindow__noteOverlayInsetsDidChange__block_invoke;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (id)_boundingPath
{
  _BOOL4 v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _UIRectangularBoundingPath *v9;
  objc_super v11;
  CATransform3D v12;

  -[UIView transform3D](self, "transform3D");
  v3 = CATransform3DIsIdentity(&v12);
  v11.receiver = self;
  v11.super_class = (Class)UIWindow;
  -[UIView _boundingPath](&v11, sel__boundingPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || ((*((_BYTE *)&self->_windowFlags + 4) & 2) == 0 ? (v5 = v3) : (v5 = 0), !v5))
  {
    if (v3)
    {
      -[UIWindow screen](self, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_boundingPathUtilities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "boundingPathForWindow:", self);
      v8 = objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&self->_windowFlags &= ~0x200000000uLL;
      v4 = v6;
    }
    else
    {
      v9 = [_UIRectangularBoundingPath alloc];
      -[UIView bounds](self, "bounds");
      v8 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v9, "initWithCoordinateSpace:boundingRect:", self);
    }

    -[UIView _setBoundingPath:](self, "_setBoundingPath:", v8);
    v4 = (void *)v8;
  }
  return v4;
}

- (id)_subtreeMonitorsForView:(id)a3
{
  id v4;
  NSMutableSet *subtreeMonitors;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  subtreeMonitors = self->_subtreeMonitors;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__UIWindow__subtreeMonitorsForView___block_invoke;
  v9[3] = &unk_1E16DE828;
  v10 = v4;
  v6 = v4;
  -[NSMutableSet objectsPassingTest:](subtreeMonitors, "objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_supportedInterfaceOrientationsForRootViewController
{
  return -[UIWindow _supportedInterfaceOrientationsConsultingApp:](self, "_supportedInterfaceOrientationsConsultingApp:", 0);
}

- (BOOL)_windowCanDynamicallySpecifySupportedInterfaceOrientations
{
  void *v4;
  char v5;

  if (-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
    return 1;
  -[UIWindow windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_canDynamicallySpecifySupportedInterfaceOrientations");

  return v5;
}

uint64_t __57__UIWindow__supportedInterfaceOrientationsConsultingApp___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = objc_msgSend(v3, "__supportedInterfaceOrientations");
  else
    v4 = objc_msgSend(v3, "supportedInterfaceOrientations");
  v5 = v4;
  v6 = _UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_4___s_category;
  if (!_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_4___s_category)
  {
    v6 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_4___s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v8 = *(id *)(v6 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 40);
      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = v9;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = CFSTR("(nil)");
      }
      v15 = v14;
      v16 = *(void **)(a1 + 32);
      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = v16;
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v18);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = CFSTR("(nil)");
      }
      v22 = v21;
      v23 = v21;
      BSInterfaceOrientationMaskDescription();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v27 = v15;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "%@: Rotation view controller (%@) provided supported orientations: %@; consultedApplication=%@",
        buf,
        0x2Au);

    }
  }
  return v5;
}

- (CGRect)_sceneBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  -[UIWindow _windowHostingScene](self, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || self->_viewOrientation && -[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
  {
    -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
    v14 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(self->_viewOrientation, v5, v7, v9, v11, v12, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    objc_msgSend(v3, "_coordinateSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v14 = v22;
    v16 = v23;
    v18 = v24;
    v20 = v25;

  }
  v26 = v14;
  v27 = v16;
  v28 = v18;
  v29 = v20;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)_windowHostingScene
{
  return self->_windowHostingScene;
}

+ (id)_findWindowForControllingOverallAppearanceInWindowScene:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_2;
  v9[3] = &__block_descriptor_40_e18_B16__0__UIWindow_8lu32l8;
  v9[4] = &__block_literal_global_460;
  objc_msgSend(v3, "_topVisibleWindowPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_3;
    v8[3] = &__block_descriptor_40_e18_B16__0__UIWindow_8lu32l8;
    v8[4] = &__block_literal_global_460;
    objc_msgSend(v3, "_topVisibleWindowPassingTest:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_4;
      v7[3] = &__block_descriptor_40_e18_B16__0__UIWindow_8lu32l8;
      v7[4] = &__block_literal_global_460;
      objc_msgSend(v3, "_topVisibleWindowPassingTest:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (void)_updateToInterfaceOrientation:(int64_t)viewOrientation duration:(double)a4 force:(BOOL)a5
{
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  UIViewController *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _BOOL4 v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  UIWindow *v33;
  objc_class *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _QWORD aBlock[4];
  id v58[3];
  BOOL v59;
  _BYTE location[12];
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  if (v10 == 1)
  {
    v11 = _updateToInterfaceOrientation_duration_force____s_category;
    if (!_updateToInterfaceOrientation_duration_force____s_category)
    {
      v11 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_updateToInterfaceOrientation_duration_force____s_category);
    }
    if ((*(_BYTE *)v11 & 1) != 0)
    {
      v31 = *(id *)(v11 + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          v32 = (void *)MEMORY[0x1E0CB3940];
          v33 = self;
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@: %p>"), v35, v33);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v36 = CFSTR("(nil)");
        }
        v37 = v36;
        BSInterfaceOrientationDescription();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        BSInterfaceOrientationDescription();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
        *(_DWORD *)location = 138413058;
        *(_QWORD *)&location[4] = v36;
        v61 = 2112;
        v62 = v38;
        v63 = 2112;
        v64 = v39;
        v65 = 2112;
        v66 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v66;
        _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "%@: _updateToInterfaceOrientation called while a forced orientation transaction is active. Overriding the requested orientation to preserve the forced orientation. requested=%@; forced=%@; token=%@",
          location,
          0x2Au);

      }
    }
    viewOrientation = self->_viewOrientation;
    a5 = 1;
  }
  if ((*((_BYTE *)&self->_windowFlags + 4) & 0x20) != 0)
  {
    -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)self);
    -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowOrientationUpdate synchronizeDrawingWithFencesOnScene:]((uint64_t)v12, v13);

    -[UIWindow _setDeferredOrientationUpdate:](self, "_setDeferredOrientationUpdate:", 0);
  }
  v14 = (void *)self->_viewOrientation;
  v15 = viewOrientation;
  if (self->_rootViewController)
  {
    v15 = viewOrientation;
    if (-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
    {
      -[UIViewController viewControllerForRotation](self->_rootViewController);
      v16 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == self->_rootViewController;

      v15 = viewOrientation;
      if (v17)
        v15 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](self->_rootViewController, "_preferredInterfaceOrientationGivenCurrentOrientation:", viewOrientation);
    }
  }
  objc_initWeak((id *)location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke;
  aBlock[3] = &unk_1E16DE5D8;
  objc_copyWeak(v58, (id *)location);
  v59 = a5;
  v58[1] = *(id *)&a4;
  v58[2] = v14;
  v18 = _Block_copy(aBlock);
  if (!UIApp
    || (objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") & 1) != 0
    || (objc_msgSend((id)UIApp, "_hasNormalRestorationCompleted") & 1) != 0)
  {
    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:", self);

    if (v20)
    {
      -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (v22)
      {
        v23 = -[_UIWindowOrientationUpdate initWithOrientation:transitionAnimationSettings:updateBlock:]([_UIWindowOrientationUpdate alloc], v15, 0, v18);
        -[UIWindow _setDeferredOrientationUpdate:](self, "_setDeferredOrientationUpdate:", v23);
LABEL_32:

      }
    }
    else
    {
      if (objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate")
        && objc_msgSend((id)UIApp, "_hasNormalRestorationCompleted")
        && self->_viewOrientation
        && !-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation")
        && -[UIWindow isRotating](self, "isRotating"))
      {
        +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[_UIWindowOrientationUpdate initWithOrientation:transitionAnimationSettings:updateBlock:]([_UIWindowOrientationUpdate alloc], v15, v24, v18);
        objc_msgSend((id)UIApp, "_systemAnimationFenceCreatingIfNecessary:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          -[_UIWindowOrientationUpdate trackFence:]((uint64_t)v25, v26);
        -[_UIWindowOrientationUpdate trackFence:]((uint64_t)v25, v26);
        -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIWindowOrientationUpdate transferFencesToUpdate:]((uint64_t)v28, v25);

        }
        -[UIWindow _setDeferredOrientationUpdate:](self, "_setDeferredOrientationUpdate:", v25);

      }
      else
      {
        (*((void (**)(void *, int64_t, int64_t))v18 + 2))(v18, v15, viewOrientation);
      }
      v54 = 0u;
      v55 = 0u;
      v53 = 0u;
      v52 = 0u;
      v51 = 0u;
      v50 = 0u;
      v49 = 0u;
      v48 = 0u;
      v47 = 0u;
      v46 = 0u;
      v45 = 0u;
      v44 = 0u;
      v43 = 0u;
      v42 = 0u;
      v41 = 4096;
      v56 = 0;
      *(_QWORD *)&v54 = v14;
      -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v41);
    }
  }
  else
  {
    -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      v23 = -[_UIWindowOrientationUpdate initWithOrientation:transitionAnimationSettings:updateBlock:]([_UIWindowOrientationUpdate alloc], v15, 0, v18);
      -[UIWindow _setDeferredOrientationUpdate:](self, "_setDeferredOrientationUpdate:", v23);
      objc_msgSend((id)UIApp, "_setExpectedViewOrientation:", viewOrientation);
      goto LABEL_32;
    }
  }

  objc_destroyWeak(v58);
  objc_destroyWeak((id *)location);
}

- (void)makeKeyAndVisible
{
  _QWORD block[5];

  if ((dyld_program_sdk_at_least() & 1) != 0 || pthread_main_np() == 1)
  {
    -[UIWindow _mainQueue_makeKeyAndVisible](self, "_mainQueue_makeKeyAndVisible");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__UIWindow_makeKeyAndVisible__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_mainQueue_makeKeyAndVisible
{
  id *v3;
  UIWindow *v4;

  if (-[UIView isHidden](self, "isHidden"))
    -[UIWindow _orderFrontWithoutMakingKey](self, "_orderFrontWithoutMakingKey");
  else
    -[UIWindow _updateLayerOrderingAndSetLayerHidden:](self, "_updateLayerOrderingAndSetLayerHidden:", 0);
  +[_UIKeyWindowEvaluator sharedEvaluator](_UIKeyWindowEvaluator, "sharedEvaluator");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyWindowEvaluator applicationKeyWindow](v3);
  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[UIWindow makeKeyWindow](self, "makeKeyWindow");
}

- (void)_orderFrontWithoutMakingKey
{
  -[UIWindow _setHidden:forced:](self, "_setHidden:forced:", 0, 1);
}

- (id)_fbsScene
{
  if (a1)
  {
    objc_msgSend(a1[101], "_FBSScene");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (CGPoint)_convertPointFromSceneReferenceSpace:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  v7 = v6;
  v9 = v8;
  -[_UISceneUIWindowHosting _effectiveSettings](self->_windowHostingScene, "_effectiveSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "interfaceOrientation");
  v12 = +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled");
  v13 = v7 - x;
  v14 = v9 - y;
  if (v11 == 4)
    v15 = v9 - y;
  else
    v15 = x;
  if (v11 == 4)
    v16 = x;
  else
    v16 = y;
  if (v11 == 3)
  {
    v15 = y;
    v16 = v7 - x;
  }
  if (v11 != 2)
  {
    v13 = v15;
    v14 = v16;
  }
  if (v12)
  {
    x = v13;
    y = v14;
  }

  -[_UISceneUIWindowHosting _coordinateSpace](self->_windowHostingScene, "_coordinateSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v17, x, y);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  UIWindow *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _UISceneUIWindowHosting *windowHostingScene;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 && a4 != self)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a4, "_window");
      v11 = (UIWindow *)objc_claimAutoreleasedReturnValue();

      if (v11 == self)
      {
        v45.receiver = self;
        v45.super_class = (Class)UIWindow;
        -[UIView convertRect:fromCoordinateSpace:](&v45, sel_convertRect_fromCoordinateSpace_, a4, x, y, width, height);
        x = v12;
        y = v13;
        width = v14;
        height = v15;
        goto LABEL_12;
      }
    }
    else
    {

    }
    windowHostingScene = self->_windowHostingScene;
    objc_msgSend((id)-[_UISceneUIWindowHosting _coordinateSpace](windowHostingScene, "_coordinateSpace"), "convertRect:fromCoordinateSpace:", a4, x, y, width, height);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[_UISceneUIWindowHosting _settingsScene](windowHostingScene, "_settingsScene");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_FBSScene");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else
    {
      -[_UISceneUIWindowHosting _FBSScene](windowHostingScene, "_FBSScene");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        goto LABEL_11;
      -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
      v39 = v38;
      v41 = v40;
      -[_UISceneUIWindowHosting _effectiveSettings](windowHostingScene, "_effectiveSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = _UIWindowConvertRectFromOrientationToOrientation(objc_msgSend(v25, "interfaceOrientation"), self->_viewOrientation, v18, v20, v22, v24, v39, v41);
      v20 = v42;
      v22 = v43;
      v24 = v44;
    }

LABEL_11:
    -[UIView layer](self, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _layerForCoordinateSpaceConversion](self, "_layerForCoordinateSpaceConversion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "convertRect:fromLayer:", v29, v18, v20, v22, v24);
    x = v30;
    y = v31;
    width = v32;
    height = v33;

  }
LABEL_12:
  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  UIWindow *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _UISceneUIWindowHosting *windowHostingScene;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int64_t viewOrientation;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 && a4 != self)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a4, "_window");
      v11 = (UIWindow *)objc_claimAutoreleasedReturnValue();

      if (v11 == self)
      {
        v43.receiver = self;
        v43.super_class = (Class)UIWindow;
        -[UIView convertRect:toCoordinateSpace:](&v43, sel_convertRect_toCoordinateSpace_, a4, x, y, width, height);
LABEL_12:
        x = v12;
        y = v13;
        width = v14;
        height = v15;
        goto LABEL_13;
      }
    }
    else
    {

    }
    windowHostingScene = self->_windowHostingScene;
    v17 = (id)-[_UISceneUIWindowHosting _coordinateSpace](windowHostingScene, "_coordinateSpace");
    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _layerForCoordinateSpaceConversion](self, "_layerForCoordinateSpaceConversion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertRect:toLayer:", v19, x, y, width, height);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[_UISceneUIWindowHosting _settingsScene](windowHostingScene, "_settingsScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_FBSScene");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {

    }
    else
    {
      -[_UISceneUIWindowHosting _FBSScene](windowHostingScene, "_FBSScene");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_11;
      -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
      v36 = v35;
      v38 = v37;
      viewOrientation = self->_viewOrientation;
      -[_UISceneUIWindowHosting _effectiveSettings](windowHostingScene, "_effectiveSettings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = _UIWindowConvertRectFromOrientationToOrientation(viewOrientation, objc_msgSend(v28, "interfaceOrientation"), v21, v23, v25, v27, v36, v38);
      v23 = v40;
      v25 = v41;
      v27 = v42;
    }

LABEL_11:
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", a4, v21, v23, v25, v27);
    goto LABEL_12;
  }
LABEL_13:
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)_layerForCoordinateSpaceConversion
{
  return 0;
}

- (CGPoint)_constrainTouchLocationToScene:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow screen](self, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fixedCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
  }
  else
  {
    -[UIWindow screen](self, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
  }
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;

  -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v8, x, y);
  v19 = v18;
  v21 = v20;
  v22 = fmax(v14, fmin(v18, nextafter(v14 + v16, -1.79769313e308)));
  v23 = fmax(v15, fmin(v21, nextafter(v15 + v17, -1.79769313e308)));
  v24 = vabdd_f64(v23, v21);
  if (vabdd_f64(v22, v19) >= 0.00000011920929 || v24 >= 0.00000011920929)
  {
    UIFloorToViewScale(self);
    v22 = v26;
    UIFloorToViewScale(self);
    v23 = v27;
  }
  -[UIView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v8, v22, v23);
  v29 = v28;
  v31 = v30;

  v32 = v29;
  v33 = v31;
  result.y = v33;
  result.x = v32;
  return result;
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  double y;
  double x;
  const __CFArray *Value;
  const __CFArray *v7;
  double v8;
  double v9;
  uint64_t Count;
  CFIndex v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double width;
  double v25;
  double height;
  float v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v35;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGPoint result;
  CGPoint v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  y = a3.y;
  x = a3.x;
  if (!qword_1EDDC85B8)
    goto LABEL_72;
  Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1EDDC85B8, self);
  if (!Value)
    goto LABEL_72;
  v7 = Value;
  if (!CFArrayGetCount(Value))
    goto LABEL_72;
  -[UIWindow _chargeMultiplicationFactor](self, "_chargeMultiplicationFactor");
  v9 = v8;
  Count = CFArrayGetCount(v7);
  if (!Count)
    goto LABEL_72;
  v11 = 0;
  v12 = 0;
  v65 = v9 * 40.0;
  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v60 = -(v9 * 15.0);
  v61 = v9 * 15.0;
  v66 = y;
  v67 = x;
  v62 = v9;
  v63 = v14;
  v64 = *MEMORY[0x1E0C9D820];
  while (1)
  {
    v15 = v12;
    CFArrayGetValueAtIndex(v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "_isChargeEnabled"))
      goto LABEL_70;
    if (!-[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v12))
      goto LABEL_70;
    if ((objc_msgSend(v12, "isHiddenOrHasHiddenAncestor") & 1) != 0)
      goto LABEL_70;
    objc_msgSend(v12, "bounds");
    if (v17 == v13 && v16 == v14)
      goto LABEL_70;
    objc_msgSend(v12, "superview", *(_QWORD *)&v60);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    objc_msgSend(v18, "convertRect:toView:", 0);
    v20 = v19;
    v22 = v21;
    width = v23;
    height = v25;

    objc_msgSend(v12, "charge");
    v28 = v9 * v27;
    if (v28 <= 0.0)
    {
      v31 = 500.0;
    }
    else
    {
      v29 = width <= height ? width : height;
      v30 = v28 * (v29 * 0.5);
      v70.origin.x = v20;
      v70.origin.y = v22;
      v70.size.width = width;
      v70.size.height = height;
      v71 = CGRectInset(v70, v30, v30);
      v20 = v71.origin.x;
      v22 = v71.origin.y;
      width = v71.size.width;
      height = v71.size.height;
      v31 = 350.0;
    }
    v72.origin.x = v20;
    v72.origin.y = v22;
    v72.size.width = width;
    v72.size.height = height;
    v69.x = x;
    v69.y = y;
    if (CGRectContainsPoint(v72, v69))
      break;
    v32 = v28 * v31;
    UIDistanceBetweenPointAndRect(x, y, v20, v22, width, height);
    if (v32 <= 0.0 || v33 <= 2.0)
    {
      v35 = fabs(v33);
      if (v32 < 0.0 && v35 >= 2.22044605e-16 && v33 < v65)
      {
LABEL_32:
        v38 = v33;
        v39 = v32 / v38;
        v40 = fabs(v39);
        v41 = v60;
        if (v39 >= 0.0)
          v41 = v61;
        if (v40 <= v61)
          v42 = v39;
        else
          v42 = v41;
        v43 = height + v22;
        if (y <= height + v22)
        {
          v45 = 0.0;
          v9 = v62;
          if (y <= v22)
          {
            v44 = width + v20;
            if (x <= v20)
            {
              v43 = v22;
              goto LABEL_47;
            }
            v45 = 1.0;
            v43 = v22;
            if (x >= v44)
            {
LABEL_47:
              v46 = y - v43;
              if (x <= v20)
                v44 = v20;
              v47 = v46 / (x - v44);
              v45 = atanf(fabsf(v47)) / 1.57079633;
            }
          }
        }
        else
        {
          v44 = width + v20;
          if (x <= v20)
          {
            v9 = v62;
            goto LABEL_47;
          }
          v45 = 1.0;
          v9 = v62;
          if (x >= v44)
            goto LABEL_47;
        }
        v48 = v42 * (1.0 - v45);
        v49 = v42 * v45;
        v50 = width * 0.5 + v20;
        v51 = height * 0.5 + v22;
        if (v48 >= v50 - v67)
          v52 = v48;
        else
          v52 = v50 - v67;
        v53 = fmin(v52, 0.0);
        v54 = -v48;
        if (v50 - v67 <= v54)
          v54 = v50 - v67;
        if (v54 < 0.0)
          v54 = 0.0;
        if (x >= v50)
          v54 = v53;
        if (v49 >= v51 - v66)
          v55 = v49;
        else
          v55 = v51 - v66;
        v56 = fmin(v55, 0.0);
        v57 = -v49;
        if (v51 - v66 <= v57)
          v57 = v51 - v66;
        if (v57 < 0.0)
          v57 = 0.0;
        if (y >= v51)
          v57 = v56;
        v66 = v66 + v57;
        v67 = v67 + v54;
        goto LABEL_69;
      }
    }
    else if (v33 < v65)
    {
      goto LABEL_32;
    }
    v9 = v62;
LABEL_69:
    v14 = v63;
    v13 = v64;
LABEL_70:
    if (Count == ++v11)
      goto LABEL_71;
  }
  v66 = y;
  v67 = x;
LABEL_71:

  y = v66;
  x = v67;
LABEL_72:
  v58 = x;
  v59 = y;
  result.y = v59;
  result.x = v58;
  return result;
}

- (id)_touchData
{
  id touchData;
  id v4;
  id v5;

  touchData = self->_touchData;
  if (!touchData)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_touchData;
    self->_touchData = v4;

    touchData = self->_touchData;
  }
  return touchData;
}

- (id)_targetWindowForPathIndex:(int64_t)a3 atPoint:(CGPoint)a4 scenePointZ:(double)a5 forEvent:(id)a6 windowServerHitTestWindow:(id)a7
{
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  const __CFDictionary *v16;
  void *v17;
  void *v18;

  y = a4.y;
  x = a4.x;
  v13 = a6;
  v14 = a7;
  if (a3 == -1)
    goto LABEL_3;
  objc_msgSend((id)UIApp, "_mainEventEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (const __CFDictionary *)-[UIEventEnvironment _touchMapForWindow:]((uint64_t)v15, self);
  CFDictionaryGetValue(v16, (const void *)a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_3:
    +[UIWindow _hitTestToPoint:scenePointZ:forEvent:windowServerHitTestWindow:](UIWindow, "_hitTestToPoint:scenePointZ:forEvent:windowServerHitTestWindow:", v13, v14, x, y, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_overrideTargetWindowForPathIndex:(unint64_t)a3 forEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 0;
}

+ (id)_hitTestToPoint:(CGPoint)a3 scenePointZ:(double)a4 forEvent:(id)a5 windowServerHitTestWindow:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id *v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  double v25;

  y = a3.y;
  x = a3.x;
  v10 = a5;
  v11 = (id *)a6;
  -[UIWindow _fbsScene](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_windowHostingScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__UIWindow__hitTestToPoint_scenePointZ_forEvent_windowServerHitTestWindow___block_invoke;
  v19[3] = &unk_1E16DE750;
  v23 = x;
  v24 = y;
  v25 = a4;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v13, "_topVisibleWindowEnumeratingAsCopy:passingTest:", 1, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)_synchronizeDrawingWithPreCommitHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend((id)UIApp, "_cachedSystemAnimationFenceCreatingIfNecessary:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "_synchronizeDrawingWithFence:preCommitHandler:", v4, v6);
  }
  else if (v6)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2778], "newFenceFromDefaultServer");
    objc_msgSend(a1, "_synchronizeDrawingWithCAFence:preCommitHandler:", v5, v6);
    objc_msgSend(v5, "invalidate");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "batch");
  }

}

+ (void)_synchronizeDrawingWithFence:(id)a3 preCommitHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)UIApp;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "_trackSystemAnimationFence:", v8);
  objc_msgSend(v8, "CAFenceHandle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_synchronizeDrawingWithCAFence:preCommitHandler:", v9, v7);
}

+ (void)_synchronizeDrawingWithCAFence:(id)a3 preCommitHandler:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  id WeakRetained;
  int v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  int v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIWindow.m"), 5787, CFSTR("fencing must be performed on the main thread"));

  }
  if (objc_msgSend(v7, "isUsable"))
  {
    if (__caCommitState == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v9 = qword_1EDDC8660;
        if (!qword_1EDDC8660)
        {
          v9 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&qword_1EDDC8660);
        }
        if ((*(_BYTE *)v9 & 1) != 0)
        {
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "if we're snapshotting then just ignore fence requests - we'll synchronize anyway so that'll have to be close enough", buf, 2u);
          }
        }
      }
      goto LABEL_27;
    }
    objc_msgSend((id)UIApp, "_beginFenceTaskIfNecessary");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    __windowsWithContexts();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (!v12)
    {
LABEL_26:

      goto LABEL_27;
    }
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v11);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i) + 472));
        v18 = objc_msgSend(WeakRetained, "addFence:", v7);

        if (v18)
          v14 = 1;
      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v13);

    if ((v14 & 1) != 0)
    {
      if (!v8)
        goto LABEL_32;
      goto LABEL_28;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v19 = qword_1EDDC8668;
      if (!qword_1EDDC8668)
      {
        v19 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1EDDC8668);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)MEMORY[0x1E0CD28B0];
        v11 = v20;
        v22 = objc_msgSend(v21, "currentPhase");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v22;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "failed to register fence : current transaction phase %i", buf, 8u);
        goto LABEL_26;
      }
    }
  }
LABEL_27:
  if (!v8)
    goto LABEL_35;
LABEL_28:
  v23 = (void *)objc_msgSend(v8, "copy");
  if (qword_1EDDC8658)
  {
    objc_msgSend((id)qword_1EDDC8658, "addObject:", v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)qword_1EDDC8658;
    qword_1EDDC8658 = v24;

  }
LABEL_32:
  if (!byte_1EDDC858D)
  {
    byte_1EDDC858D = objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", &__block_literal_global_379_0, 3);
    if ((byte_1EDDC858D & 1) == 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      *(_OWORD *)buf = 0u;
      os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      v27 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
      v32 = 67109120;
      v33 = v27;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  }
LABEL_35:

}

- (void)_didMoveFromScene:(id)a3 toScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UIFocusEventRecognizer *focusEventRecognizer;
  void *v21;
  void *v22;
  _UIPassthroughScrollInteraction *passthroughScrollInteraction;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 == v7)
    goto LABEL_20;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIWindow _updateAutorotationResponse:](self, "_updateAutorotationResponse:", 1);
    v24[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_computeMetricsForWindows:animated:", v10, 0);

    -[UIViewController _updateContentOverlayInsetsForSelfAndChildren](self->_rootViewController, "_updateContentOverlayInsetsForSelfAndChildren");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("_UIWindowDidMoveToSceneNotification"), self, 0);

  if (v6)
  {
    objc_msgSend(v6, "_screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _didMoveFromScreen:toScreen:](self, "_didMoveFromScreen:toScreen:", v12, v13);

  }
  if (!-[UIView isHidden](self, "isHidden"))
    -[UIWindow _updateLayerOrderingAndSetLayerHidden:](self, "_updateLayerOrderingAndSetLayerHidden:", 0);
  objc_msgSend(v6, "_focusSystemSceneComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeSceneObserver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stopMonitoringContextChangesForWindow:", self);

  objc_msgSend(v7, "_focusSystemSceneComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeSceneObserver");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginMonitoringContextChangesForWindow:", self);

  if (self->_focusEventRecognizer)
    goto LABEL_9;
  objc_msgSend(v7, "_focusSystemSceneComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "focusSystem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UIWindow _installFocusEventRecognizer](self, "_installFocusEventRecognizer");
  }
  else if (self->_focusEventRecognizer)
  {
LABEL_9:
    objc_msgSend(v7, "_focusSystemSceneComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "focusSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      focusEventRecognizer = self->_focusEventRecognizer;
      if (focusEventRecognizer)
        -[_UIFocusEventRecognizer reset](focusEventRecognizer, "reset");
    }
    else
    {
      -[UIWindow _removeFocusEventRecognizer](self, "_removeFocusEventRecognizer");
    }
  }
  if (v6 && self->_passthroughScrollInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    passthroughScrollInteraction = self->_passthroughScrollInteraction;
    self->_passthroughScrollInteraction = 0;

  }
  if (v7)
    -[UIWindow _configurePassthroughInteractionIfNeeded]((id *)&self->super.super.super.isa);
LABEL_20:

}

- (void)_configurePassthroughInteractionIfNeeded
{
  void *v2;
  int v3;
  id v4;
  BOOL v5;
  char v6;
  id v7;
  _UIPassthroughScrollInteraction *v8;
  id v9;

  if (!a1)
    return;
  if ((objc_msgSend((id)objc_opt_class(), "_needsPassthroughInteraction") & 1) == 0)
  {
    if (!a1[91])
      return;
LABEL_14:
    objc_msgSend(a1, "removeInteraction:");
    v7 = a1[91];
    a1[91] = 0;

    return;
  }
  objc_msgSend(a1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_supportsPassthroughInteractions");

  v4 = a1[91];
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v8 = objc_alloc_init(_UIPassthroughScrollInteraction);
    v9 = a1[91];
    a1[91] = v8;

    objc_msgSend(a1[91], "setDelegate:", a1);
    objc_msgSend(a1[91], "setConfiguredForInactiveInteractionEventsOnly:", 1);
    objc_msgSend(a1, "addInteraction:", a1[91]);
    return;
  }
  if (v4)
    v6 = v3;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    goto LABEL_14;
}

+ (BOOL)_needsPassthroughInteraction
{
  return 1;
}

- (void)_setHidden:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  $B5B0456088C508EDB812873BE14D7A88 windowFlags;
  _BOOL4 v7;
  int v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  UIWindow *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  windowFlags = self->_windowFlags;
  if ((*(_DWORD *)&windowFlags & 0x2000000) != 0)
  {
    self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&windowFlags & 0xFFFFFFFFFDFFFFFFLL);
    v8 = 1;
    if (a3)
      goto LABEL_5;
LABEL_9:
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __30__UIWindow__setHidden_forced___block_invoke;
    v22[3] = &unk_1E16BACE0;
    v22[4] = self;
    v22[5] = &v23;
    -[UIWindow _updateLayerOrderingAndSetLayerHidden:actionBlock:](self, "_updateLayerOrderingAndSetLayerHidden:actionBlock:", 0, v22);
    if (*((_BYTE *)v24 + 24))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);

      if (WeakRetained)
      {
        -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", self), 1, 0.0);
      }
    }
    if (v8)
    {
      -[UIWindow _updateWindowTraits](self, "_updateWindowTraits");
      _UIViewRecursivelyApplyBlockToSubtreesWithMotionEffects(self, &__block_literal_global_972_1);
      _UIPencilEventRequestBarrelFocusIfAbleForWindow(self, 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("UIWindowDidBecomeVisibleNotification"), self);

    }
    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_eventDeferringManager");
    v13 = (id *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v13, v14);
    v15 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    -[UIWindow screen](self, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_isMainLikeScreen");
    if (v15 == self)
      v18 = v17;
    else
      v18 = 1;

    if ((v18 & 1) != 0)
    {
      if (!-[UIView _shouldInformFocusAboutBecomingVisible](self, "_shouldInformFocusAboutBecomingVisible"))
      {
LABEL_23:

        _Block_object_dispose(&v23, 8);
        return;
      }
      -[UIView _focusSystem](self, "_focusSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_focusEnvironmentDidAppear:", self);
    }
    else
    {
      -[UIView _focusSystem](self, "_focusSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setNeedsFocusUpdate");
    }

    goto LABEL_23;
  }
  v7 = a4;
  v8 = -[UIView isHidden](self, "isHidden") ^ a3;
  *(_QWORD *)&self->_windowFlags &= ~0x2000000uLL;
  if ((v8 & 1) == 0 && !v7)
    return;
  if (!v4)
    goto LABEL_9;
LABEL_5:
  -[UIWindow _updateLayerOrderingAndSetLayerHidden:](self, "_updateLayerOrderingAndSetLayerHidden:", 1);
  if ((UIWindow *)qword_1EDDC85A8 == self)
  {
    qword_1EDDC85A8 = 0;
    if (v8)
    {
LABEL_26:
      _UIViewRecursivelyApplyBlockToSubtreesWithMotionEffects(self, &__block_literal_global_970);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:", CFSTR("UIWindowDidBecomeHiddenNotification"), self);

      -[UIView _focusSystem](self, "_focusSystem");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_focusEnvironmentWillDisappear:", self);

    }
  }
  else if (v8)
  {
    goto LABEL_26;
  }
}

- (void)setHidden:(BOOL)a3
{
  -[UIWindow _setHidden:forced:](self, "_setHidden:forced:", a3, 0);
}

- (void)_updateLayerOrderingAndSetLayerHidden:(BOOL)a3 actionBlock:(id)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden") ^ v4;

  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v4);

  if ((v7 & 1) != 0
    || (-[_UISceneUIWindowHosting _windowIsFront:](self->_windowHostingScene, "_windowIsFront:", self) & 1) == 0)
  {
    -[_UISceneUIWindowHosting _windowUpdatedVisibility:](self->_windowHostingScene, "_windowUpdatedVisibility:", self);
  }
  else
  {
    -[_UISceneUIWindowHosting _windowUpdatedProperties:](self->_windowHostingScene, "_windowUpdatedProperties:", self);
  }
  v9 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    v9 = v14;
  }
  if (v7)
  {
    -[UIWindow windowScene](self, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateStatusBarAppearance");

    -[UIWindow windowScene](self, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_systemAppearanceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateUserInterfaceStyle");

    v9 = v14;
  }

}

+ (int64_t)_preferredStatusBarStyleInWindow:(id)a3 resolvedStyle:(int64_t *)a4 withPartStyles:(id *)a5 animationProvider:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  int64_t v34;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id *v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[3];
  _QWORD v66[4];

  v66[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_effectiveUISettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forcedStatusBarStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "_effectiveUISettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "forcedStatusBarStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    v16 = 2 * (v15 == 3);
    v17 = v15 == 1;
    goto LABEL_18;
  }
  if (objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance"))
  {
    objc_msgSend(v9, "rootViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_effectiveStatusBarStyleViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_rootPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v19)
    {
      if (v20)
      {
        v15 = objc_msgSend(v20, "preferredStatusBarStyle");
        v36 = v21;
        objc_msgSend(v36, "traitCollection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "userInterfaceIdiom");

        if (v38 == 3)
        {
          if (dyld_program_sdk_at_least())
          {
            objc_msgSend(v36, "traitCollection");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "userInterfaceStyle");

            v41 = 3;
            if (v40 == 2)
              v41 = 1;
            if (v40)
              v42 = v15 == 0;
            else
              v42 = 0;
          }
          else
          {
            v42 = v15 == 0;
            v41 = 3;
          }
          if (v42)
            v15 = v41;
        }

        v57 = objc_msgSend(v36, "preferredStatusBarStyle");
        if (v57 == 1)
          v58 = 1;
        else
          v58 = 2 * (v57 == 3);
        v34 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v58, v36);
        if (a6)
        {
          objc_msgSend(v9, "_rootPresentationController");
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v34 = 0;
        v15 = 0;
      }
LABEL_63:

      if (!a4)
        goto LABEL_23;
      goto LABEL_22;
    }
    v22 = objc_msgSend(v19, "preferredStatusBarStyle");
    v23 = v19;
    v64 = v23;
    if (!v22)
    {
      v24 = v23;
      objc_msgSend(v23, "_parentTraitEnvironment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
LABEL_9:

        v23 = v24;
      }
      else
      {
        while (1)
        {
          objc_msgSend(v23, "parentViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
            break;
          objc_msgSend(v23, "parentViewController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "_parentTraitEnvironment");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v24;
          if (v25)
            goto LABEL_9;
        }
      }
    }
    v61 = a6;
    v63 = v19;
    v27 = v23;
    objc_msgSend(v27, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceIdiom");

    v15 = v22;
    if (v29 == 3)
    {
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v27, "traitCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "userInterfaceStyle");

        v32 = 3;
        if (v31 == 2)
          v32 = 1;
        if (v31)
          v33 = v22 == 0;
        else
          v33 = 0;
      }
      else
      {
        v33 = v22 == 0;
        v32 = 3;
      }
      if (v33)
        v15 = v32;
      else
        v15 = v22;
    }
    v62 = v21;

    if (v22 == 1)
      v43 = 1;
    else
      v43 = 2 * (v22 == 3);
    v34 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v43, v27);
    if (!a5)
    {
      v21 = v62;
      v19 = v63;
LABEL_60:
      if (v61)
        *v61 = objc_retainAutorelease(v64);

      goto LABEL_63;
    }
    _viewControllerIfStatusBarPartStyleProviding(v64);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v27;
    v60 = v44;
    if (v44)
    {
      v45 = v44;
      v46 = objc_msgSend(v44, "preferredLeadingStatusBarStyle");
      if (v43 == v46)
        v47 = 4;
      else
        v47 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v46, v45);
      v49 = objc_msgSend(v45, "preferredTrailingStatusBarStyle");
      if (v43 == v49)
        v50 = 4;
      else
        v50 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v49, v45);
      v51 = objc_msgSend(v45, "preferredCenterStatusBarStyle");
      if (v43 == v51)
        v52 = 4;
      else
        v52 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v51, v45);
      v48 = v50;
      if (v47 == 4)
      {
        v53 = v52;
LABEL_59:
        v65[0] = CFSTR("leadingPartIdentifier");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v54;
        v65[1] = CFSTR("trailingPartIdentifier");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v48);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v55;
        v65[2] = CFSTR("centerPartIdentifier");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v66[2] = v56;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v21 = v62;
        v19 = v63;
        v27 = v59;
        goto LABEL_60;
      }
      v53 = v52;
      if (v47 != v48 || v47 != v52)
        goto LABEL_59;
      v15 = _UIStatusBarStyleFromResolvedStyle(v47);
      v48 = 4;
      v34 = v47;
      v47 = 4;
    }
    else
    {
      v47 = 4;
      v48 = 4;
    }
    v53 = 4;
    goto LABEL_59;
  }
  v15 = objc_msgSend((id)UIApp, "statusBarStyle");
  v16 = 2 * (v15 == 3);
  v17 = v15 == 1;
LABEL_18:
  if (v17)
    v34 = 1;
  else
    v34 = v16;
  if (a4)
LABEL_22:
    *a4 = v34;
LABEL_23:

  return v15;
}

uint64_t __30__UIWindow__setHidden_forced___block_invoke(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 448));
  if (WeakRetained)
    v3 = 0;
  else
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "addRootViewControllerViewIfPossible");
}

- (CGPoint)convertPoint:(CGPoint)point toWindow:(UIWindow *)window
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = point.y;
  x = point.x;
  if (window)
  {
    -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", point.x, point.y);
  }
  else
  {
    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toLayer:", self->_transformLayer, x, y);
    v11 = v10;
    v13 = v12;

    v7 = v11;
    v8 = v13;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromWindow:(UIWindow *)window
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = point.y;
  x = point.x;
  if (window)
  {
    -[UIView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", point.x, point.y);
  }
  else
  {
    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromLayer:", self->_transformLayer, x, y);
    v11 = v10;
    v13 = v12;

    v7 = v11;
    v8 = v13;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

+ (id)_applicationKeyWindow
{
  id *v2;
  void *v3;

  +[_UIKeyWindowEvaluator sharedEvaluator](_UIKeyWindowEvaluator, "sharedEvaluator");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyWindowEvaluator applicationKeyWindow](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)firstResponder
{
  char isKindOfClass;
  UIResponder *firstResponder;
  UIResponder *v5;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  firstResponder = self->_firstResponder;
  if ((isKindOfClass & 1) != 0)
  {
    -[UIResponder textField](firstResponder, "textField");
    v5 = (UIResponder *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = firstResponder;
  }
  return v5;
}

void __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  UIStatusBarOrientationAnimationParameters *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  __int128 v12;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504) = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke_2;
  v11[3] = &unk_1E16BC3A0;
  v12 = *(_OWORD *)(a1 + 32);
  v2 = _Block_copy(v11);
  v3 = v2;
  if (*(_BYTE *)(a1 + 64) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872) != *(_QWORD *)(a1 + 48))
  {
    v4 = -[UIStatusBarOrientationAnimationParameters initWithDefaultParameters]([UIStatusBarOrientationAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarOrientationAnimationParameters setOrientationAnimation:](v4, "setOrientationAnimation:", 2);
    -[UIStatusBarAnimationParameters setDuration:](v4, "setDuration:", *(double *)(a1 + 56));
    v5 = (void *)UIApp;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD **)(a1 + 32);
    v8 = v7[109];
    objc_msgSend(v7, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatusBarOrientation:fromOrientation:windowScene:animationParameters:updateBlock:", v6, v8, v9, v4, v3);

  }
  else
  {
    (*((void (**)(void *))v2 + 2))(v2);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(a1 + 65) << 30);
  if (*(_BYTE *)(a1 + 65))
    objc_msgSend(*(id *)(a1 + 32), "_resizeWindowFrameToSceneBoundsIfNecessary");
  if (*(_BYTE *)(a1 + 66))
  {
    objc_msgSend(*(id *)(a1 + 32), "rootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window:setupWithInterfaceOrientation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTransformLayer");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
}

- (void)_sceneBoundsDidChange
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  if (objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled"))
  {
    -[UIWindow _setNeedsBoundingPathUpdate](self, "_setNeedsBoundingPathUpdate");
    -[UIWindow _updateTransformLayer](self, "_updateTransformLayer");
    if (!-[UIWindow _resizeWindowFrameToSceneBoundsIfNecessary](self, "_resizeWindowFrameToSceneBoundsIfNecessary"))
      -[UIWindow _updateIsSceneSizedFlag](self, "_updateIsSceneSizedFlag");
    -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v5 = 0u;
    v6 = 0u;
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = 64;
    v19 = v3;
    v20 = 0;
    -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v4);
    -[UIWindow _cleanupOrientationTransactionIfNecessary](self, "_cleanupOrientationTransactionIfNecessary");
    -[UIWindow _retryHandleStatusBarChangeIfNecessary](self, "_retryHandleStatusBarChangeIfNecessary");

  }
}

- (void)_updateTransformLayer
{
  uint64_t v3;
  CALayer *rootLayer;
  double v5;
  double v6;
  double v7;
  CALayer *v8;
  UIWindowLayer *v9;
  CALayer *v10;
  CALayer *v11;
  CALayer *sceneTransformLayer;
  CALayer *v13;
  CALayer *transformLayer;
  CALayer *v15;
  id WeakRetained;
  CALayer *v17;
  void *v18;
  id v19;

  -[_UISceneUIWindowHosting _screen](self->_windowHostingScene, "_screen");
  v3 = objc_claimAutoreleasedReturnValue();
  rootLayer = self->_rootLayer;
  v19 = (id)v3;
  if (rootLayer)
  {
    if (v3)
    {
      -[CALayer rasterizationScale](rootLayer, "rasterizationScale");
      v6 = v5;
      objc_msgSend(v19, "scale");
      if (v6 != v7)
      {
        v8 = self->_rootLayer;
        objc_msgSend(v19, "scale");
        -[CALayer setRasterizationScale:](v8, "setRasterizationScale:");
      }
    }
  }
  else
  {
    v9 = objc_alloc_init(UIWindowLayer);
    v10 = self->_rootLayer;
    self->_rootLayer = &v9->super;

    +[_UIWindowTransformLayer layer](_UIWindowTransformLayer, "layer");
    v11 = (CALayer *)objc_claimAutoreleasedReturnValue();
    sceneTransformLayer = self->_sceneTransformLayer;
    self->_sceneTransformLayer = v11;

    +[_UIWindowTransformLayer layer](_UIWindowTransformLayer, "layer");
    v13 = (CALayer *)objc_claimAutoreleasedReturnValue();
    transformLayer = self->_transformLayer;
    self->_transformLayer = v13;

    self->_rootLayer[1].super.isa = (Class)self;
    self->_sceneTransformLayer[1].super.isa = (Class)self;
    self->_transformLayer[1].super.isa = (Class)self;
    if (v19)
    {
      v15 = self->_rootLayer;
      objc_msgSend(v19, "scale");
      -[CALayer setRasterizationScale:](v15, "setRasterizationScale:");
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
    objc_msgSend(WeakRetained, "setLayer:", self->_rootLayer);

    -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_sceneTransformLayer);
    -[CALayer addSublayer:](self->_sceneTransformLayer, "addSublayer:", self->_transformLayer);
    v17 = self->_transformLayer;
    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer addSublayer:](v17, "addSublayer:", v18);

  }
  -[UIWindow _configureRootLayer:sceneTransformLayer:transformLayer:](self, "_configureRootLayer:sceneTransformLayer:transformLayer:", self->_rootLayer, self->_sceneTransformLayer, self->_transformLayer);

}

- (void)addRootViewControllerViewIfPossible
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  UIViewControllerBuiltinTransitionViewAnimator *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIWindow *v30;
  UIViewController *rootViewController;
  void *v32;
  unint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  UIViewController *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  _BOOL4 v62;
  NSObject *v63;
  void *v64;
  UIWindow *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  UIViewController *v69;
  void *v70;
  UIViewController *v71;
  objc_class *v72;
  void *v73;
  __CFString *v74;
  __CFString *v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void *v77;
  id v78;
  id v79;
  _QWORD v80[5];
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  __int128 v83;
  uint64_t v84;
  CGRect v85;
  CGRect v86;

  v84 = *MEMORY[0x1E0C80C00];
  -[UIWindow _resizeWindowToFullScreenIfNecessary](self, "_resizeWindowToFullScreenIfNecessary");
  if (!-[UIWindow _shouldInstallRootPresentationController](self, "_shouldInstallRootPresentationController"))
  {
    -[UIViewController view](self->_rootViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13
      || (-[UIViewController view](self->_rootViewController, "view"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "superview"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v13,
          v15))
    {
LABEL_27:
      -[UIViewController view](self->_rootViewController, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "superview");
      v30 = (UIWindow *)objc_claimAutoreleasedReturnValue();

      if (v30 == self
        && -[UIViewController _tryBecomeRootViewControllerInWindow:]((uint64_t)self->_rootViewController, self))
      {
        -[UIViewController setNeedsFocusUpdate](self->_rootViewController, "setNeedsFocusUpdate");
      }
      goto LABEL_30;
    }
    -[_UISceneUIWindowHosting _FBSScene](self->_windowHostingScene, "_FBSScene");
    v78 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
      goto LABEL_18;
    -[UIWindow screen](self, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "_isMainScreen"))
    {
      objc_msgSend((id)UIApp, "_mainScene");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v78 == v17)
      {
        -[UIWindow _sceneBounds](self, "_sceneBounds");
        v51 = v50;
        v53 = v52;
        v55 = v54;
        v57 = v56;
        -[UIView frame](self, "frame");
        v86.origin.x = v58;
        v86.origin.y = v59;
        v86.size.width = v60;
        v86.size.height = v61;
        v85.origin.x = v51;
        v85.origin.y = v53;
        v85.size.width = v55;
        v85.size.height = v57;
        v62 = CGRectEqualToRect(v85, v86);

        if (v62)
        {
          -[UIViewController _defaultInitialViewFrame](self->_rootViewController, "_defaultInitialViewFrame");
LABEL_19:
          v22 = v18;
          v23 = v19;
          v24 = v20;
          v25 = v21;
          -[UIViewController view](self->_rootViewController, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setFrame:", v22, v23, v24, v25);

          if ((-[UIViewController _isPresentingInWindow:](self->_rootViewController, self) & 1) != 0)
          {

            return;
          }
          -[UIViewController view](self->_rootViewController, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView addSubview:](self, "addSubview:", v27);
          if ((objc_msgSend(v27, "translatesAutoresizingMaskIntoConstraints") & 1) != 0)
          {
            if (!+[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"))
            {
LABEL_26:

              goto LABEL_27;
            }
            -[UIViewController view](self->_rootViewController, "view");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setAutoresizingMask:", 18);
          }
          else
          {
            -[UIWindow _rootViewConstraintsUpdateIfNecessaryForView:](self, "_rootViewConstraintsUpdateIfNecessaryForView:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView addConstraints:](self, "addConstraints:", v28);
          }

          goto LABEL_26;
        }
LABEL_18:
        -[UIView bounds](self, "bounds");
        goto LABEL_19;
      }

    }
    goto LABEL_18;
  }
  -[UIWindow _rootPresentationController](self, "_rootPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presented");

  if ((v4 & 1) == 0)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = qword_1EDDC85C8;
      if (!qword_1EDDC85C8)
      {
        v8 = __UILogCategoryGetNode("Window", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&qword_1EDDC85C8);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Manually adding the rootViewController's view to the view hierarchy is no longer supported. Please allow UIWindow to add the rootViewController's view to the view hierarchy itself.", buf, 2u);
      }
    }
    -[UIWindow windowScene](self, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_installLocalSheetPresentationControllerForWindow:", self);

    v11 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", 0);
    -[UIWindow _rootPresentationController](self, "_rootPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_presentWithAnimationController:inWindow:interactionController:animated:handoffData:", v11, self, 0, 0, 0);

    if (-[UIViewController _tryBecomeRootViewControllerInWindow:]((uint64_t)self->_rootViewController, self))-[UIViewController setNeedsFocusUpdate](self->_rootViewController, "setNeedsFocusUpdate");
  }
LABEL_30:
  -[UIWindow _resizeWindowFrameToSceneBoundsIfNecessary](self, "_resizeWindowFrameToSceneBoundsIfNecessary");
  rootViewController = self->_rootViewController;
  if (rootViewController)
    -[UIViewController _invalidatePreferences:excluding:](rootViewController, -1, 128);
  -[UIWindow windowScene](self, "windowScene");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "interfaceOrientation");

  if (v33)
  {
    -[UIWindow windowScene](self, "windowScene");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "_canDynamicallySpecifySupportedInterfaceOrientations") & 1) != 0)
    {
      v35 = self->_rootViewController == 0;

      if (!v35)
      {
        -[UIViewController _viewControllerForSupportedInterfaceOrientations](self->_rootViewController, "_viewControllerForSupportedInterfaceOrientations");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_ignoreAppSupportedOrientations");
        v37 = -[UIWindow _supportedInterfaceOrientationsConsultingApp:](self, "_supportedInterfaceOrientationsConsultingApp:", 1);
        if (v33 > 4 || (v38 = v37, (v37 & qword_1866827A8[v33 - 1]) != 0))
        {
          -[UIWindow _updateOrientationPreferencesAnimated:](self, "_updateOrientationPreferencesAnimated:", 0);
        }
        else
        {
          v39 = qword_1EDDC85D0;
          if (!qword_1EDDC85D0)
          {
            v39 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v39, (unint64_t *)&qword_1EDDC85D0);
          }
          if ((*(_BYTE *)v39 & 1) != 0)
          {
            v63 = *(id *)(v39 + 8);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              v64 = (void *)MEMORY[0x1E0CB3940];
              v65 = self;
              v66 = (objc_class *)objc_opt_class();
              NSStringFromClass(v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "stringWithFormat:", CFSTR("<%@: %p>"), v67, v65);
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              v79 = v68;
              v69 = self->_rootViewController;
              if (v69)
              {
                v70 = (void *)MEMORY[0x1E0CB3940];
                v71 = v69;
                v72 = (objc_class *)objc_opt_class();
                NSStringFromClass(v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "stringWithFormat:", CFSTR("<%@: %p>"), v73, v71);
                v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v74 = CFSTR("(nil)");
              }
              v75 = v74;
              BSInterfaceOrientationDescription();
              v76 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              BSInterfaceOrientationMaskDescription();
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v79;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v74;
              *(_WORD *)&buf[22] = 2112;
              v82 = v76;
              LOWORD(v83) = 2112;
              *(_QWORD *)((char *)&v83 + 2) = v77;
              _os_log_impl(&dword_185066000, v63, OS_LOG_TYPE_ERROR, "%@: Adding root vc %@ that does not support the scene's current orientation (%@). Root vc supported orientations: %@. We will force a transaction", buf, 0x2Au);

            }
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v82 = __Block_byref_object_copy__163;
          *(_QWORD *)&v83 = __Block_byref_object_dispose__163;
          *((_QWORD *)&v83 + 1) = 0;
          v40 = (void *)MEMORY[0x1E0CB3940];
          v41 = self->_rootViewController;
          if (v41)
          {
            v42 = (void *)MEMORY[0x1E0CB3940];
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringWithFormat:", CFSTR("<%@: %p>"), v44, v41);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v45 = CFSTR("(nil)");
          }

          objc_msgSend(v40, "stringWithFormat:", CFSTR("Root View Controller Setup: %@"), v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIWindow _createForcedOrientationTransactionTokenWithSupportedOrientations:preferredOrientation:forImmediateCommit:reason:](self, "_createForcedOrientationTransactionTokenWithSupportedOrientations:preferredOrientation:forImmediateCommit:reason:", v38, 0, 1, v46);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v47;

          v49 = *(void **)(*(_QWORD *)&buf[8] + 40);
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __47__UIWindow_addRootViewControllerViewIfPossible__block_invoke;
          v80[3] = &unk_1E16B14C0;
          v80[4] = buf;
          objc_msgSend(v49, "commitAnimated:completionBlock:", 0, v80);

          _Block_object_dispose(buf, 8);
        }

      }
    }
    else
    {

    }
  }
}

- (BOOL)_resizeWindowFrameToSceneBoundsIfNecessary
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;

  v3 = objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled");
  if (v3)
  {
    v3 = -[UIWindow _shouldResizeWithScene](self, "_shouldResizeWithScene");
    if (v3)
    {
      if ((*((_BYTE *)&self->_windowFlags + 3) & 0x40) == 0)
        goto LABEL_6;
      if (-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
        goto LABEL_6;
      -[UIWindow _sceneBoundsInWindowOrientation](self, "_sceneBoundsInWindowOrientation");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[UIView frame](self, "frame");
      v18.origin.x = v12;
      v18.origin.y = v13;
      v18.size.width = v14;
      v18.size.height = v15;
      v17.origin.x = v5;
      v17.origin.y = v7;
      v17.size.width = v9;
      v17.size.height = v11;
      if (CGRectEqualToRect(v17, v18))
      {
LABEL_6:
        LOBYTE(v3) = 0;
      }
      else
      {
        -[UIWindow _adjustSizeClassesAndResizeWindowToFrame:](self, "_adjustSizeClassesAndResizeWindowToFrame:", v5, v7, v9, v11);
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (void)_updateIsSceneSizedFlag
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v10;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UIWindow _sceneBoundsInWindowOrientation](self, "_sceneBoundsInWindowOrientation");
  v9 = v8 == v6 && v7 == v4;
  v10 = 0x40000000;
  if (!v9)
    v10 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(v10 | *(_QWORD *)&self->_windowFlags & 0xFFFFFFFFBFFFFFFFLL);
}

- (void)_configureRootLayer:(id)a3 sceneTransformLayer:(id)a4 transformLayer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  int64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UISceneUIWindowHosting _FBSScene](self->_windowHostingScene, "_FBSScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "interfaceOrientation");

  v14 = -[UIWindow _orientationForRootTransform](self, "_orientationForRootTransform");
  self->_previousSceneOrientationForCounterRotation = 0;
  if ((unint64_t)(v13 - 1) >= 4)
    v15 = 1;
  else
    v15 = v13;
  self->_sceneOrientation = v15;
  objc_msgSend(v11, "clientSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isUISubclass"))
  {
    -[UIWindow windowScene](self, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_windowsIgnoreSceneClientOrientation");

    if ((v18 & 1) != 0)
    {
      v19 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v11, "uiClientSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "interfaceOrientation");
  }
  else
  {
    v19 = 1;
  }

LABEL_10:
  if ((unint64_t)(v19 - 1) >= 4)
    v20 = 1;
  else
    v20 = v19;
  self->_sceneClientOrientation = v20;
  if (!-[UIWindow _windowOwnsInterfaceOrientationTransform](self, "_windowOwnsInterfaceOrientationTransform")
    || !-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
  {
    -[UIWindow _sceneBounds](self, "_sceneBounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v29 = v35 + v39 * 0.5;
    v30 = v37 + v41 * 0.5;
    v63 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E0C9BAA8];
    v65 = *(_OWORD *)&v70.a;
    *(_OWORD *)&v70.c = v63;
    *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v61 = *(_OWORD *)&v70.tx;
    objc_msgSend(v8, "setAffineTransform:", &v70);
    objc_msgSend(v8, "setBounds:", v36, v38, v40, v42);
    objc_msgSend(v8, "setPosition:", v29, v30);
    *(_OWORD *)&v70.a = v65;
    *(_OWORD *)&v70.c = v63;
    *(_OWORD *)&v70.tx = v61;
    objc_msgSend(v9, "setAffineTransform:", &v70);
    objc_msgSend(v9, "setBounds:", v36, v38, v40, v42);
    objc_msgSend(v9, "setPosition:", v29, v30);
    v43 = -[UIWindow _orientationForRootTransform](self, "_orientationForRootTransform");
    v44 = -[UIWindow _orientationForViewTransform](self, "_orientationForViewTransform");
    if (v44
      && v43
      && (v45 = v44,
          -[UIWindow _windowOwnsInterfaceOrientationTransform](self, "_windowOwnsInterfaceOrientationTransform")))
    {
      self->_previousSceneOrientationForCounterRotation = v14;
      v46 = 0.0;
      v47 = 0.0;
      if (v45 != 1)
      {
        if (v45 == 3)
        {
          v47 = 1.57079633;
        }
        else if (v45 == 4)
        {
          v47 = -1.57079633;
        }
        else
        {
          v47 = 3.14159265;
          if (v45 != 2)
            v47 = 0.0;
        }
      }
      if (v43 != 1)
      {
        if (v43 == 3)
        {
          v46 = 1.57079633;
        }
        else if (v43 == 4)
        {
          v46 = -1.57079633;
        }
        else
        {
          v46 = 3.14159265;
          if (v43 != 2)
            v46 = 0.0;
        }
      }
      CGAffineTransformMakeRotation(&v67, v47 - v46);
      *(float64x2_t *)&v67.a = vrndaq_f64(*(float64x2_t *)&v67.a);
      *(float64x2_t *)&v67.c = vrndaq_f64(*(float64x2_t *)&v67.c);
      *(float64x2_t *)&v67.tx = vrndaq_f64(*(float64x2_t *)&v67.tx);
      v70 = v67;
      objc_msgSend(v10, "setAffineTransform:", &v70);
      v49 = _UIConvertRectFromOrientationToOrientation(v43, v45, v36, v38, v40, v42, v40, v42);
      v48 = v10;
    }
    else
    {
      *(_OWORD *)&v70.a = v65;
      *(_OWORD *)&v70.c = v63;
      *(_OWORD *)&v70.tx = v61;
      objc_msgSend(v10, "setAffineTransform:", &v70);
      v48 = v10;
      v49 = v36;
      v50 = v38;
      v51 = v40;
      v52 = v42;
    }
    objc_msgSend(v48, "setBounds:", v49, v50, v51, v52);
    goto LABEL_59;
  }
  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = v21 + v25 * 0.5;
  v30 = v23 + v27 * 0.5;
  v31 = -[UIWindow _orientationForViewTransform](self, "_orientationForViewTransform");
  v32 = -[UIWindow _orientationForRootTransform](self, "_orientationForRootTransform");
  v33 = -[UIWindow _orientationForSceneTransform](self, "_orientationForSceneTransform");
  switch(v32)
  {
    case 1:
      v34 = 0.0;
      break;
    case 3:
      v34 = 1.57079633;
      break;
    case 4:
      v34 = -1.57079633;
      break;
    default:
      v34 = 3.14159265;
      if (v32 != 2)
        v34 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v71, -v34);
  *(float64x2_t *)&v71.a = vrndaq_f64(*(float64x2_t *)&v71.a);
  *(float64x2_t *)&v71.c = vrndaq_f64(*(float64x2_t *)&v71.c);
  *(float64x2_t *)&v71.tx = vrndaq_f64(*(float64x2_t *)&v71.tx);
  v70 = v71;
  objc_msgSend(v8, "setAffineTransform:", &v70);
  objc_msgSend(v8, "setBounds:", v22, v24, v26, v28);
  v53 = v28 - v30;
  if (v32 == 4)
    v54 = v28 - v30;
  else
    v54 = v29;
  if (v32 == 4)
    v55 = v29;
  else
    v55 = v30;
  if (v32 == 3)
  {
    v54 = v30;
    v55 = v26 - v29;
  }
  if (v32 == 2)
  {
    v54 = v26 - v29;
    v55 = v28 - v30;
  }
  objc_msgSend(v8, "setPosition:", v54, v55);
  if (!objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled"))
  {
    v66 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E0C9BAA8];
    v64 = *(_OWORD *)&v70.a;
    *(_OWORD *)&v70.c = v66;
    *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v62 = *(_OWORD *)&v70.tx;
    objc_msgSend(v9, "setAffineTransform:", &v70);
    objc_msgSend(v9, "setBounds:", v22, v24, v26, v28);
    *(_OWORD *)&v70.a = v64;
    *(_OWORD *)&v70.c = v66;
    *(_OWORD *)&v70.tx = v62;
    objc_msgSend(v10, "setAffineTransform:", &v70);
    objc_msgSend(v10, "setBounds:", v22, v24, v26, v28);
    -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
    -[UIWindow setFrame:](self, "setFrame:");
    objc_msgSend(v9, "setPosition:", v29, v30);
LABEL_59:
    v58 = v10;
    v59 = v29;
    v60 = v30;
    goto LABEL_60;
  }
  memset(&v70, 0, sizeof(v70));
  -[UIWindow _viewTransformForInterfaceOrientation:](self, "_viewTransformForInterfaceOrientation:", v33);
  v69 = v70;
  objc_msgSend(v9, "setAffineTransform:", &v69);
  objc_msgSend(v9, "setBounds:", _UIWindowConvertRectFromOrientationToOrientation(1, v33, v22, v24, v26, v28, v26, v28));
  v56 = 0.0;
  v57 = 0.0;
  if (v31 != 1)
  {
    if (v31 == 3)
    {
      v57 = 1.57079633;
    }
    else if (v31 == 4)
    {
      v57 = -1.57079633;
    }
    else
    {
      v57 = 3.14159265;
      if (v31 != 2)
        v57 = 0.0;
    }
  }
  if (v33 != 1)
  {
    if (v33 == 3)
    {
      v56 = 1.57079633;
    }
    else if (v33 == 4)
    {
      v56 = -1.57079633;
    }
    else
    {
      v56 = 3.14159265;
      if (v33 != 2)
        v56 = 0.0;
    }
  }
  CGAffineTransformMakeRotation(&v68, v57 - v56);
  *(float64x2_t *)&v68.a = vrndaq_f64(*(float64x2_t *)&v68.a);
  *(float64x2_t *)&v68.c = vrndaq_f64(*(float64x2_t *)&v68.c);
  *(float64x2_t *)&v68.tx = vrndaq_f64(*(float64x2_t *)&v68.tx);
  v69 = v68;
  objc_msgSend(v10, "setAffineTransform:", &v69);
  objc_msgSend(v10, "setBounds:", _UIWindowConvertRectFromOrientationToOrientation(1, v31, v22, v24, v26, v28, v26, v28));
  objc_msgSend(v9, "setPosition:", v29, v30);
  if (v33 == 2)
  {
    v53 = v26 - v29;
    v29 = v28 - v30;
  }
  else if (v33 == 3)
  {
    v53 = v30;
    v29 = v26 - v29;
  }
  else if (v33 != 4)
  {
    v53 = v29;
    v29 = v30;
  }
  v58 = v10;
  v59 = v53;
  v60 = v29;
LABEL_60:
  objc_msgSend(v58, "setPosition:", v59, v60);

}

- (CGRect)_sceneBoundsInWindowOrientation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[UIWindow _sceneBounds](self, "_sceneBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIWindow _orientationForRootTransform](self, "_orientationForRootTransform");
  v12 = -[UIWindow _orientationForViewTransform](self, "_orientationForViewTransform");
  if (v11)
  {
    v13 = v12;
    if (v12)
    {
      if (!-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation")
        && -[UIWindow _windowOwnsInterfaceOrientationTransform](self, "_windowOwnsInterfaceOrientationTransform"))
      {
        v4 = _UIConvertRectFromOrientationToOrientation(v11, v13, v4, v6, v8, v10, v8, v10);
        v6 = v14;
        v8 = v15;
        v10 = v16;
      }
    }
  }
  v17 = v4;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)_orientationForRootTransform
{
  return self->_sceneOrientation;
}

- (BOOL)_shouldResizeWithScene
{
  return 1;
}

- (UIViewController)_delegateViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_delegateViewController);
}

- (void)_resizeWindowToFullScreenIfNecessary
{
  $B5B0456088C508EDB812873BE14D7A88 windowFlags;

  if (-[UIWindow resizesToFullScreen](self, "resizesToFullScreen"))
  {
    windowFlags = self->_windowFlags;
    if ((*(_DWORD *)&windowFlags & 0x8000000) == 0)
    {
      self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(unint64_t *)&windowFlags | 0x8000000);
      -[UIWindow _sceneBounds](self, "_sceneBounds");
      -[UIWindow setFrame:](self, "setFrame:");
    }
  }
}

- (BOOL)resizesToFullScreen
{
  return *((unsigned __int8 *)&self->_windowFlags + 2) >> 7;
}

- (BOOL)_shouldInstallRootPresentationController
{
  int v3;

  v3 = dyld_program_sdk_at_least();
  if (v3)
  {
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0
      || -[UIWindow _preventsRootPresentationController](self, "_preventsRootPresentationController"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_InstallsRootPresentation, (uint64_t)CFSTR("InstallsRootPresentation"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      if (byte_1ECD76834)
        LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_cleanupOrientationTransactionIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if ((*((_BYTE *)&self->_windowFlags + 4) & 0x80) != 0)
  {
    -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "state");

    if (v4 == 2)
    {
      *(_QWORD *)&self->_windowFlags &= ~0x8000000000uLL;
      -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didCommitOrientation");

      -[UIWindow _setOrientationTransactionToken:](self, "_setOrientationTransactionToken:", 0);
      *(_QWORD *)&self->_windowFlags |= 0x400000000uLL;
      -[UIWindow windowScene](self, "windowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "statusBarManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateStatusBarAppearance");

      *(_QWORD *)&self->_windowFlags &= ~0x400000000uLL;
      -[UIWindow _notifyRotatableViewOrientation:duration:](self, "_notifyRotatableViewOrientation:duration:", self->_viewOrientation, 0.0);
    }
  }
}

- (void)_retryHandleStatusBarChangeIfNecessary
{
  void *v3;
  double v4;
  double v5;

  __UIStatusBarManagerForWindow(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarHeight");
  v5 = v4;

  if (v5 != self->_lastPropagatedStatusBarHeight)
    -[UIWindow handleStatusBarChangeFromHeight:toHeight:](self, "handleStatusBarChangeFromHeight:toHeight:");
}

- (void)_setDelegateViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  _BOOL8 v7;
  void *v8;
  int v9;
  void *v10;
  UIWindow *v11;
  void *v12;
  void *v13;
  UIWindow *v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegateViewController, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(obj, "isInWillRotateCallback") ^ 1;
    else
      v6 = 1;
    v7 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0 && v6)
    {
      if (dyld_program_sdk_at_least()
        && -[UIView isHidden](self, "isHidden")
        && (-[UIWindow rootViewController](self, "rootViewController"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "isViewLoaded"),
            v8,
            !v9))
      {
        -[UIWindow rootViewController](self, "rootViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_window");
        v11 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(obj, "rotatingContentViewForWindow:", self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "superview");
        v11 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v11 == self;

    }
    -[_UISceneUIWindowHosting _screen](self->_windowHostingScene, "_screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "_userInterfaceIdiom") == 3)
    {
      v14 = self;
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v15 = obj != 0;
      v14 = self;
      v16 = v7;
    }
    -[UIWindow setAutorotates:forceUpdateInterfaceOrientation:](v14, "setAutorotates:forceUpdateInterfaceOrientation:", v15, v16);

    v5 = obj;
  }

}

- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  void *v9;

  if (((((*(_QWORD *)&self->_windowFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    v4 = a4;
    v5 = a3;
    v7 = 256;
    if (!a3)
      v7 = 0;
    self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFFFFFEFFLL | v7);
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
      objc_msgSend(v8, "beginGeneratingDeviceOrientationNotifications");
    else
      objc_msgSend(v8, "endGeneratingDeviceOrientationNotifications");

    -[UIWindow _updateAutorotationResponse:](self, "_updateAutorotationResponse:", v4);
  }
}

- (void)_updateAutorotationResponse:(BOOL)a3
{
  _BOOL4 v3;
  $B5B0456088C508EDB812873BE14D7A88 windowFlags;
  int v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  int64_t viewOrientation;
  char v12;
  id v13;

  v3 = a3;
  windowFlags = self->_windowFlags;
  if ((*(_WORD *)&windowFlags & 0x100) != 0)
  {
    if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[UIWindow windowScene](self, "windowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "_canReceiveDeviceOrientationEvents");

    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&windowFlags & 0x200) != 0 || !v6)
  {
    if ((*(_WORD *)&windowFlags & 0x200) != 0)
      v12 = v6;
    else
      v12 = 1;
    if ((v12 & 1) == 0)
    {
      *(_QWORD *)&self->_windowFlags &= ~0x200uLL;
      objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("UIDeviceOrientationDidChangeNotification"), 0);
      objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), 0);
      if (objc_msgSend((id)UIApp, "_isSpringBoard"))
        objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("_UIAppActiveInterfaceOrientationDidChangeNotification"), 0);
    }
  }
  else
  {
    *(_QWORD *)&self->_windowFlags |= 0x200uLL;
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleDeviceOrientationChange_, CFSTR("UIDeviceOrientationDidChangeNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleStatusBarOrientationChange_, CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), 0);
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleSBActiveInterfaceOrientationChange_, CFSTR("_UIAppActiveInterfaceOrientationDidChangeNotification"), 0);
    if (v3)
    {
      v8 = objc_msgSend((id)UIApp, "_currentExpectedInterfaceOrientation");
      if ((unint64_t)(v8 - 1) >= 4)
        v8 = objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", self);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
      v10 = objc_msgSend(WeakRetained, "_preferredInterfaceOrientationGivenCurrentOrientation:", v8);

      viewOrientation = self->_viewOrientation;
      if (!viewOrientation && v10 != 1)
      {
        -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", v10, 1, 0.0);
LABEL_24:
        -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](self->_rootViewController);
        goto LABEL_25;
      }
      -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", v10, 1, 0.0);
      if (viewOrientation && viewOrientation != v10)
        goto LABEL_24;
    }
  }
LABEL_25:

}

- (void)_updateOrientationPreferencesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v3 = a3;
  -[UIWindow windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_canDynamicallySpecifySupportedInterfaceOrientations");

  if (v6)
  {
    if (-[UIWindow isInterfaceAutorotationDisabled](self, "isInterfaceAutorotationDisabled"))
    {
      *(_QWORD *)&self->_windowFlags |= 0x10000uLL;
    }
    else
    {
      v7 = -[UIWindow _supportedInterfaceOrientationsConsultingApp:](self, "_supportedInterfaceOrientationsConsultingApp:", 1);
      v8 = -[UIWindow _preferredInterfaceOrientationForRootViewController](self, "_preferredInterfaceOrientationForRootViewController");
      if (((1 << v8) & ~v7) != 0)
        v9 = 0;
      else
        v9 = v8;
      if (v8)
        v10 = v9;
      else
        v10 = 0;
      -[UIWindow windowScene](self, "windowScene");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_systemAppearanceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window:didUpdateSupportedOrientations:preferredOrientation:prefersAnimation:", self, v7, v10, v3);

    }
  }
}

- (BOOL)isInterfaceAutorotationDisabled
{
  unsigned __int8 v3;
  uint64_t v4;
  _BOOL4 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v21;
  CGRect v22;

  v3 = -[UIScene _systemShellOwnsInterfaceOrientation](self->_windowHostingScene);
  v4 = *(_QWORD *)&self->_windowFlags & 0xF000;
  if ((v3 & 1) != 0)
  {
    LOBYTE(v5) = v4 != 0;
  }
  else if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[_UISceneUIWindowHosting _referenceBounds](self->_windowHostingScene, "_referenceBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIWindow screen](self, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fixedCoordinateSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v22.origin.x = v16;
    v22.origin.y = v17;
    v22.size.width = v18;
    v22.size.height = v19;
    v21.origin.x = v7;
    v21.origin.y = v9;
    v21.size.width = v11;
    v21.size.height = v13;
    v5 = !CGRectEqualToRect(v21, v22);

  }
  return v5;
}

- (int64_t)_preferredInterfaceOrientationForRootViewController
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_viewControllerForSupportedInterfaceOrientations");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBeingDismissed");

    if (v6)
    {
      objc_msgSend(v4, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "modalPresentationStyle");

      if (v8)
        goto LABEL_11;
    }
    else
    {
      if ((objc_msgSend(v4, "isBeingPresented") & 1) == 0)
      {
        objc_msgSend(v4, "presentingViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {

          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v4, "modalPresentationStyle");

      if (v10)
        goto LABEL_11;
    }
    if (objc_msgSend(v4, "_hasPreferredInterfaceOrientationForPresentation"))
    {
      v9 = (void *)objc_msgSend(v4, "preferredInterfaceOrientationForPresentation");
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return (int64_t)v9;
}

- (unint64_t)_supportedInterfaceOrientationsConsultingApp:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  unint64_t OrientationMask;
  unint64_t v10;
  NSObject *v12;
  void *v13;
  UIWindow *v14;
  objc_class *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  UIWindow *v22;
  BOOL v23;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_3;
  objc_msgSend(WeakRetained, "_viewControllerForSupportedInterfaceOrientations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__UIWindow__supportedInterfaceOrientationsConsultingApp___block_invoke;
  v20[3] = &unk_1E16DE4E8;
  v23 = v3;
  v21 = v7;
  v22 = self;
  v8 = v7;
  OrientationMask = _UISafelyGetOrientationMask(v20);

  if (!OrientationMask)
  {
LABEL_3:
    if (v3)
      OrientationMask = -[UIApplication _defaultSupportedInterfaceOrientations](UIApp);
    else
      OrientationMask = 30;
    v10 = _supportedInterfaceOrientationsConsultingApp____s_category;
    if (!_supportedInterfaceOrientationsConsultingApp____s_category)
    {
      v10 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_supportedInterfaceOrientationsConsultingApp____s_category);
    }
    if ((*(_BYTE *)v10 & 1) != 0)
    {
      v12 = *(id *)(v10 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          v14 = self;
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v14);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("(nil)");
        }
        v18 = v17;
        BSInterfaceOrientationMaskDescription();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v17;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%@: Using default supported orientations: %@", buf, 0x16u);

      }
    }
  }

  return OrientationMask;
}

- (CGAffineTransform)_viewTransformForInterfaceOrientation:(SEL)a3
{
  double v5;
  CGAffineTransform *result;
  float64x2_t v7;
  CGAffineTransform v8;

  switch(a4)
  {
    case 1:
      v5 = 0.0;
      break;
    case 3:
      v5 = 1.57079633;
      break;
    case 4:
      v5 = -1.57079633;
      break;
    default:
      v5 = 3.14159265;
      if (a4 != 2)
        v5 = 0.0;
      break;
  }
  result = CGAffineTransformMakeRotation(&v8, v5);
  v7 = vrndaq_f64(*(float64x2_t *)&v8.c);
  *(float64x2_t *)&v8.a = vrndaq_f64(*(float64x2_t *)&v8.a);
  *(float64x2_t *)&v8.tx = vrndaq_f64(*(float64x2_t *)&v8.tx);
  *(_OWORD *)&retstr->a = *(_OWORD *)&v8.a;
  *(float64x2_t *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v8.tx;
  return result;
}

- (int64_t)_orientationForSceneTransform
{
  return self->_sceneClientOrientation;
}

- (CGRect)_referenceFrameFromSceneUsingScreenBounds:(BOOL)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CGRect result;

  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 7679, CFSTR("Incorrect code path when app does not use UIScene lifecycle API"));

  }
  -[UIWindow windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBoundsForOrientation:", objc_msgSend(v6, "interfaceOrientation"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = 0.0;
  if (!a3)
  {
    __UIStatusBarManagerForWindow(self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultStatusBarHeightInOrientation:", 1);
    v15 = v17;

  }
  -[UIWindow screen](self, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "_userInterfaceIdiom") == 3
    && +[UIScreen _shouldDisableJail](UIScreen, "_shouldDisableJail"))
  {
    +[UIStatusBar_Base heightForStyle:orientation:inWindow:](UIStatusBar, "heightForStyle:orientation:inWindow:", 400, 1, self);
    v14 = v14 - v19;
  }
  else if (v15 > 0.0)
  {
    __UIStatusBarManagerForWindow(self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isStatusBarHidden");

    if ((v21 & 1) == 0)
    {
      -[UIWindow _windowHostingScene](self, "_windowHostingScene");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

      v24 = 0.0;
      if (!v23)
        v24 = v15;
      v14 = v14 - v24;
      v25 = -0.0;
      if (!v23)
        v25 = v15;
      v10 = v10 + v25;
    }
  }
  if (objc_msgSend(v18, "overscanCompensation") == 2 && _UIDeviceNativeUserInterfaceIdiom() != 2)
  {
    objc_msgSend(v18, "overscanCompensationInsets");
    v8 = v8 + v26;
    v10 = v10 + v27;
    v12 = v12 - (v26 + v28);
    v14 = v14 - (v27 + v29);
  }

  v30 = v8;
  v31 = v10;
  v32 = v12;
  v33 = v14;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_registerSubtreeMonitor:(id)a3
{
  id v4;
  NSMutableSet *subtreeMonitors;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  subtreeMonitors = self->_subtreeMonitors;
  v8 = v4;
  if (!subtreeMonitors)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_subtreeMonitors;
    self->_subtreeMonitors = v6;

    v4 = v8;
    subtreeMonitors = self->_subtreeMonitors;
  }
  -[NSMutableSet addObject:](subtreeMonitors, "addObject:", v4);

}

- (BOOL)autorotates
{
  return *((_BYTE *)&self->_windowFlags + 1) & 1;
}

void __77__UIWindow__traitCollectionForSize_parentCollection_traitOverrideApplicator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(void);

  v35 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v35[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "horizontalSizeClass");
    v8 = *(_QWORD *)(a1 + 40);

    if (v7 != v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v5[2](v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHorizontalSizeClass:", v9);

    }
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v35[2]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "verticalSizeClass");
    v13 = *(_QWORD *)(a1 + 48);

    if (v12 != v13)
    {
      v14 = *(_QWORD *)(a1 + 48);
      v5[2](v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVerticalSizeClass:", v14);

    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v35[2]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceStyle");
    v18 = *(_QWORD *)(a1 + 56);

    if (v17 != v18)
    {
      v19 = *(_QWORD *)(a1 + 56);
      v5[2](v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUserInterfaceStyle:", v19);

    }
  }
  if (*(_QWORD *)(a1 + 64) != -1)
  {
    v35[2]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceLevel");
    v23 = *(_QWORD *)(a1 + 64);

    if (v22 != v23)
    {
      v24 = *(_QWORD *)(a1 + 64);
      v5[2](v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUserInterfaceLevel:", v24);

    }
  }
  if (*(_QWORD *)(a1 + 72) != -1)
  {
    v35[2]();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "accessibilityContrast");
    v28 = *(_QWORD *)(a1 + 72);

    if (v27 != v28)
    {
      v29 = *(_QWORD *)(a1 + 72);
      v5[2](v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAccessibilityContrast:", v29);

    }
  }
  if (!*(_BYTE *)(a1 + 80))
  {
    -[UIView __tintColor](*(void **)(a1 + 32));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v35[2]();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_tintColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 != v31)
      {
        v5[2](v5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_setTintColor:", v31);

      }
    }

  }
}

+ (id)_windowWithContextId:(unsigned int)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2720], "contextWithId:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIWindowFromRootLayer((id)objc_msgSend(v3, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setSystemGestureRecognitionIsPossible:(BOOL)a3 andTouchesAreCancelled:(BOOL)a4
{
  char v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = *((_BYTE *)self + 664);
  if (((((v4 & 1) == 0) ^ a3) & 1) == 0)
  {
    v5 = a4;
    *((_BYTE *)self + 664) = v4 & 0xFE | a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("_UIWindowSystemGestureCancellingTouchesUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_UIWindowSystemGestureStateChangedNotification"), self, v9);

  }
}

- (BOOL)_isVisible
{
  return !-[UIView isHidden](self, "isHidden");
}

- (BOOL)_isTextEffectsWindowNotificationOwner
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v3 = -[UIWindow _isTextEffectsWindow](self, "_isTextEffectsWindow");
  if (v3)
  {
    -[UIWindow windowScene](self, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useHostedInstance");

    if ((v6 & 1) == 0)
    {
      if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      if ((-[UIWindow isForViewService](self, "isForViewService") & 1) == 0)
      {
        -[UIWindow windowScene](self, "windowScene");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_isKeyWindowScene");

        LOBYTE(v3) = v8;
        return v3;
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)inhibitTextEffectsRotation
{
  return -[UIWindow inhibitSetupOrientation](self, "inhibitSetupOrientation")
      || -[UIWindow inhibitManualTransform](self, "inhibitManualTransform");
}

- (BOOL)inhibitSetupOrientation
{
  void *v2;
  char v3;

  -[UIWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (void)setupForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  _OWORD v27[3];
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;

  if (!-[UIWindow inhibitSetupOrientation](self, "inhibitSetupOrientation"))
  {
    -[UIWindow screen](self, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      -[UIWindow screen](self, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_referenceBounds");
      v9 = v8;
      v11 = v10;

      v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v30.c = v12;
      *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](self, "setTransform:", &v30);
      if ((unint64_t)(a3 - 1) < 2)
      {
        v13 = v9;
        v14 = v11;
      }
      else
      {
        if ((unint64_t)(a3 - 3) > 1)
          goto LABEL_8;
        v13 = v11;
        v14 = v9;
      }
      -[UIWindow setBounds:](self, "setBounds:", 0.0, 0.0, v13, v14);
LABEL_8:
      -[UIView bounds](self, "bounds");
      v16 = v15 * 0.5;
      -[UIView bounds](self, "bounds");
      -[UIWindow setCenter:](self, "setCenter:", v16, v17 * 0.5);
      if (-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess")
        && !-[UIWindow _isTextEffectsWindowHosting](self, "_isTextEffectsWindowHosting")
        || -[UIWindow inhibitManualTransform](self, "inhibitManualTransform")
        || !-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
      {
        goto LABEL_28;
      }
      -[UIView center](self, "center");
      v19 = -v18;
      -[UIView center](self, "center");
      CGAffineTransformMakeTranslation(&v30, v19, -v20);
      switch(a3)
      {
        case 1:
          v21 = 0.0;
          break;
        case 3:
          v21 = 1.57079633;
          break;
        case 4:
          v21 = -1.57079633;
          break;
        default:
          v21 = 3.14159265;
          if (a3 != 2)
            v21 = 0.0;
          break;
      }
      v28 = v30;
      CGAffineTransformRotate(&v29, &v28, v21);
      v30 = v29;
      -[UIView center](self, "center");
      v23 = v22;
      -[UIView center](self, "center");
      v28 = v30;
      CGAffineTransformTranslate(&v29, &v28, v23, v24);
      v30 = v29;
      switch(a3)
      {
        case 4:
          v25 = -v11;
          v28 = v30;
          v26 = 0.0;
          break;
        case 3:
          v26 = -v9;
          v28 = v30;
          v25 = 0.0;
          break;
        case 2:
          v25 = -v9;
          v26 = -v11;
          v28 = v30;
          break;
        default:
LABEL_27:
          v27[0] = vrndaq_f64(*(float64x2_t *)&v30.a);
          v27[1] = vrndaq_f64(*(float64x2_t *)&v30.c);
          v27[2] = vrndaq_f64(*(float64x2_t *)&v30.tx);
          -[UIView setTransform:](self, "setTransform:", v27);
LABEL_28:
          self->_viewOrientation = a3;
          return;
      }
      CGAffineTransformTranslate(&v29, &v28, v25, v26);
      v30 = v29;
      goto LABEL_27;
    }
  }
}

- (BOOL)_isTextEffectsWindow
{
  return 0;
}

- (int64_t)_sceneOrientation
{
  return self->_sceneOrientation;
}

- (double)_touchSloppinessFactor
{
  void *v2;
  double v3;

  -[UIWindow screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1.0;
  if (objc_msgSend(v2, "_userInterfaceIdiom") == 3)
  {
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_UIExternalTouchSloppinessFactor, (uint64_t)CFSTR("UIExternalTouchSloppinessFactor"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v3 = 2.0;
    else
      v3 = *(double *)&qword_1EDDA8248;
  }

  return v3;
}

- (void)_parentWillTransitionToTraitCollection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UIWindow _shouldPropagateTraitCollectionChanges](self, "_shouldPropagateTraitCollectionChanges"))
  {
    -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _willTransitionToTraitCollection:withTransitionCoordinator:](self, "_willTransitionToTraitCollection:withTransitionCoordinator:", v4, 0);

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double v4;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double width;
  double v30;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  v30 = a3.size.height;
  v4 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromLayer:", v10, x, y, v4, height);
  v12 = v11;
  v14 = v13;

  v15 = -[UIWindow interfaceOrientation](self, "interfaceOrientation");
  -[UIWindow screen](self, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v15, v16, 0, v12, v14);

  -[UIView bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[UIView center](self, "center");
  v26 = v25;
  v28 = v27;
  v31.receiver = self;
  v31.super_class = (Class)UIWindow;
  -[UIView setFrame:](&v31, sel_setFrame_, x, y, width, v30);
  -[UIWindow _updateIsSceneSizedFlag](self, "_updateIsSceneSizedFlag");
  -[UIWindow _autolayout_windowDidChangeBoundsFrom:](self, "_autolayout_windowDidChangeBoundsFrom:", v18, v20, v22, v24);
  -[UIWindow _autolayout_windowDidChangeCenterFrom:](self, "_autolayout_windowDidChangeCenterFrom:", v26, v28);
  -[UIWindow _updateWindowTraitsAndNotify:](self, "_updateWindowTraitsAndNotify:", 1);
}

- (void)_updateWindowTraits
{
  if (-[UIWindow _shouldPropagateTraitCollectionChanges](self, "_shouldPropagateTraitCollectionChanges"))
    -[UIWindow _updateWindowTraitsAndNotify:](self, "_updateWindowTraitsAndNotify:", 1);
}

- (void)_willChangeToSize:(CGSize)a3 orientation:(int64_t)a4 screen:(id)a5 withTransitionCoordinator:(id)a6
{
  double height;
  double width;
  _BOOL4 v10;
  int v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  height = a3.height;
  width = a3.width;
  v15 = a6;
  if (-[UIWindow _shouldPropagateTraitCollectionChanges](self, "_shouldPropagateTraitCollectionChanges")
    && ((*(_BYTE *)&self->_windowFlags & 0x20) != 0 || (dyld_program_sdk_at_least() & 1) == 0))
  {
    v10 = +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled");
    v11 = (unint64_t)(a4 - 1) < 2 || v10;
    if (v11)
      v12 = width;
    else
      v12 = height;
    if (!v11)
      height = width;
    -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v13, v12, height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWindow _willTransitionToTraitCollection:withTransitionCoordinator:](self, "_willTransitionToTraitCollection:withTransitionCoordinator:", v14, v15);
  }
  -[UIWindow _setNeedsBoundingPathUpdate](self, "_setNeedsBoundingPathUpdate");

}

- (BOOL)_shouldPropagateTraitCollectionChanges
{
  return 1;
}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  UITraitCollection *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  UITraitCollection *destinationTraitCollection;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = a3;
  if ((*(_BYTE *)&self->_windowFlags & 0x20) != 0 || (dyld_program_sdk_at_least() & 1) == 0)
  {
    v5 = self->_traitCollection;
    -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v6, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_traitCollection, v7);
    _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)v7);
    if (v3)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      _UICreateTraitCollectionChangeDescription((uint64_t)v5, v7, (uint64_t)&v11);
      if (!BYTE8(v14))
      {
        _UIViewInvalidateTraitCollectionAndSchedulePropagation((uint64_t)self, 0);
        -[UIView _traitCollectionDidChangeInternal:](self, "_traitCollectionDidChangeInternal:", &v11);
        -[UIView _invalidateTraitCollectionAndSchedulePropagationForSubviews](self);
        v8 = objc_msgSend(*((id *)&v11 + 1), "hasDifferentColorAppearanceComparedToTraitCollection:", (_QWORD)v11);
        v9 = 0x4000000000;
        if (!v8)
          v9 = 0;
        self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFBFFFFFFFFFLL | v9);
        -[UIWindow _traitCollectionDidChangeOnSubtreeInternal:](self, "_traitCollectionDidChangeOnSubtreeInternal:", &v11);
        *(_QWORD *)&self->_windowFlags &= ~0x4000000000uLL;
        -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](self->_traitCollectionChangeTransitionCoordinator, "_runAlongsideAnimations");
        -[UIWindow _setTraitCollectionChangeTransitionCoordinator:](self, "_setTraitCollectionChangeTransitionCoordinator:", 0);
        destinationTraitCollection = self->_destinationTraitCollection;
        self->_destinationTraitCollection = 0;

      }
      if ((_QWORD)v12)

    }
  }
}

- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__UIWindow__traitCollectionForSize_parentCollection___block_invoke;
  v5[3] = &unk_1E16DE6A0;
  v5[4] = self;
  -[UIWindow _traitCollectionForSize:parentCollection:traitOverrideApplicator:](self, "_traitCollectionForSize:parentCollection:traitOverrideApplicator:", a4, v5, a3.width, a3.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setNeedsBoundingPathUpdate
{
  if (!-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
    *(_QWORD *)&self->_windowFlags |= 0x200000000uLL;
}

- (id)_windowParentTraitCollection
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 102);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__windowParentTraitCollection, a1, CFSTR("UIWindow.m"), 6341, CFSTR("UIKit internal inconsistency: overrideParentTraitEnvironment returned a nil traitCollection: %@"), v3);

        v4 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "_windowHostingSceneTraitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_windowHostingSceneTraitCollection
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UISceneUIWindowHosting _traitCollection](self->_windowHostingScene, "_traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  _UIViewControllerNullAnimationTransitionCoordinator *v6;
  UITraitCollection *v7;
  void *v8;
  int v9;
  UITraitCollection *destinationTraitCollection;
  _UIViewControllerNullAnimationTransitionCoordinator *v11;
  UITraitCollection *v12;
  UITraitCollection *v13;
  void *v14;
  void *v15;
  UITraitCollection *v16;

  v16 = (UITraitCollection *)a3;
  v6 = (_UIViewControllerNullAnimationTransitionCoordinator *)a4;
  -[UIWindow traitCollection](self, "traitCollection");
  v7 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  if (v7 == v16)
  {
    v9 = 1;
  }
  else
  {
    -[UIWindow traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v16);

  }
  destinationTraitCollection = self->_destinationTraitCollection;
  if (destinationTraitCollection != v16
    && ((v9 | -[UITraitCollection isEqual:](destinationTraitCollection, "isEqual:")) & 1) == 0)
  {
    if (!v6)
    {
      v11 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      -[UIWindow _setTraitCollectionChangeTransitionCoordinator:](self, "_setTraitCollectionChangeTransitionCoordinator:", v11);

      v6 = self->_traitCollectionChangeTransitionCoordinator;
      -[_UIViewControllerNullAnimationTransitionCoordinator setContainerView:](self->_traitCollectionChangeTransitionCoordinator, "setContainerView:", self);
    }
    v12 = (UITraitCollection *)-[UITraitCollection copy](v16, "copy");
    v13 = self->_destinationTraitCollection;
    self->_destinationTraitCollection = v12;

    if (-[UIWindow _shouldInstallRootPresentationController](self, "_shouldInstallRootPresentationController"))
    {
      -[UIWindow _rootPresentationController](self, "_rootPresentationController");
    }
    else
    {
      -[UIWindow rootViewController](self, "rootViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_parent:willTransitionToTraitCollection:withTransitionCoordinator:", self, self->_destinationTraitCollection, v6);

      -[UIWindow rootViewController](self, "rootViewController");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window:willTransitionToTraitCollection:withTransitionCoordinator:", self, self->_destinationTraitCollection, v6);

  }
}

- (void)_autolayout_windowDidChangeCenterFrom:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  if ((*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    y = a3.y;
    x = a3.x;
    -[UIView center](self, "center");
    if (v7 != x || v6 != y)
      -[UIWindow _windowInternalConstraints_centerDidChange](self, "_windowInternalConstraints_centerDidChange");
  }
}

- (void)_autolayout_windowDidChangeBoundsFrom:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;

  if ((*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    height = a3.size.height;
    width = a3.size.width;
    -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y);
    if (v7 != width || v6 != height)
      -[UIWindow _windowInternalConstraints_sizeDidChange](self, "_windowInternalConstraints_sizeDidChange");
  }
}

- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4 traitOverrideApplicator:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  _BYTE *TraitCollectionTSD;
  char v13;
  $1DC6EB69857CC9E7E7608875A7943F0A *p_viewFlags;
  uint64_t v15;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  _BOOL4 v21;
  int v22;
  UITraitCollection *v23;
  UITraitCollection *traitCollection;
  void *v25;
  int64_t horizontalSizeClassStateRestorationOverride;
  int64_t verticalSizeClassStateRestorationOverride;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  UITraitCollection *v55;
  void *v56;
  void *v57;
  char v58;
  void (**v59)(_QWORD, _QWORD);
  _QWORD v60[10];
  char v61;

  height = a3.height;
  width = a3.width;
  v10 = a4;
  v11 = a5;
  TraitCollectionTSD = GetTraitCollectionTSD();
  v13 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  p_viewFlags = &self->super._viewFlags;
  v15 = *(_QWORD *)((char *)&self->super._viewFlags + 20);
  *(_QWORD *)((char *)&self->super._viewFlags + 20) = v15 | 0x80000000;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UIView bounds](self, "bounds");
    height = v17;
    v19 = v18;
    v20 = -[UIWindow interfaceOrientation](self, "interfaceOrientation");
    v21 = +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled");
    v22 = (unint64_t)(v20 - 1) < 2 || v21;
    width = v22 ? height : v19;
    if (v22)
      height = v19;
  }
  if (v10)
  {
    v23 = (UITraitCollection *)v10;
    goto LABEL_22;
  }
  if (dyld_program_sdk_at_least())
  {
    traitCollection = self->_traitCollection;
    if (traitCollection)
    {
      v23 = traitCollection;
      goto LABEL_22;
    }
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 6399, CFSTR("Trait collection is being accessed too early"));

    }
  }
  +[UITraitCollection _emptyTraitCollection]();
  v23 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v55 = v23;
  horizontalSizeClassStateRestorationOverride = self->_horizontalSizeClassStateRestorationOverride;
  if (!horizontalSizeClassStateRestorationOverride)
    horizontalSizeClassStateRestorationOverride = _UIUserInterfaceSizeClassForWidth(width);
  verticalSizeClassStateRestorationOverride = self->_verticalSizeClassStateRestorationOverride;
  if (!verticalSizeClassStateRestorationOverride)
    verticalSizeClassStateRestorationOverride = _UIUserInterfaceSizeClassForHeight(height);
  v59 = (void (**)(_QWORD, _QWORD))v11;
  v58 = v13;
  v57 = v10;
  if (objc_msgSend((id)UIApp, "_effectiveUserInterfaceStyle", v55))
  {
    v28 = 0;
  }
  else
  {
    -[UIWindow windowScene](self, "windowScene");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_effectiveUISettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v30;
    if (v30 || (v33 = v32) != 0)
      v28 = objc_msgSend(v33, "userInterfaceStyle");
    else
      v28 = 0;

  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0
    && dyld_program_sdk_at_least())
  {
    -[UIWindow screen](self, "screen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "coordinateSpace");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UISceneUIWindowHosting _coordinateSpace](self->_windowHostingScene, "_coordinateSpace");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    v40 = -1;
    if (v37 && v38)
    {
      objc_msgSend(v37, "bounds");
      v42 = v41;
      v44 = v43;
      objc_msgSend(v39, "bounds");
      objc_msgSend(v39, "convertRect:toCoordinateSpace:", v37);
      v40 = v46 < v44 || v45 < v42;
    }

  }
  else
  {
    v40 = -1;
  }
  v47 = v57;
  v48 = v15 & 0x80000000;
  if (objc_msgSend(v57, "userInterfaceIdiom") == 3)
  {
    -[UIWindow windowScene](self, "windowScene");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_effectiveUISettings");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
      v51 = objc_msgSend(v50, "accessibilityContrast");
    else
      v51 = -1;

    v47 = v57;
  }
  else
  {
    v51 = -1;
  }
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __77__UIWindow__traitCollectionForSize_parentCollection_traitOverrideApplicator___block_invoke;
  v60[3] = &unk_1E16DE6C8;
  v60[6] = verticalSizeClassStateRestorationOverride;
  v60[7] = v28;
  v60[8] = v40;
  v60[9] = v51;
  v61 = v48 >> 31;
  v60[4] = self;
  v60[5] = horizontalSizeClassStateRestorationOverride;
  -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v56, (uint64_t)v60);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    ((void (**)(_QWORD, void *))v59)[2](v59, v52);
    v53 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v53;
  }
  *(_QWORD *)((char *)p_viewFlags + 20) = *(_QWORD *)((char *)p_viewFlags + 20) & 0xFFFFFFFF7FFFFFFFLL | v48;
  *((_BYTE *)GetTraitCollectionTSD() + 9) = v58;

  return v52;
}

id __53__UIWindow__traitCollectionForSize_parentCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void **v4;
  void **v5;
  id v6;
  void *v7;

  v3 = a2;
  -[UIView _traitOverridesIfExist](*(_DWORD **)(a1 + 32));
  v4 = (void **)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v4, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (void)_setTraitCollectionChangeTransitionCoordinator:(id)a3
{
  _UIViewControllerNullAnimationTransitionCoordinator *v5;
  _UIViewControllerNullAnimationTransitionCoordinator **p_traitCollectionChangeTransitionCoordinator;
  _UIViewControllerNullAnimationTransitionCoordinator *v7;

  v5 = (_UIViewControllerNullAnimationTransitionCoordinator *)a3;
  p_traitCollectionChangeTransitionCoordinator = &self->_traitCollectionChangeTransitionCoordinator;
  if (*p_traitCollectionChangeTransitionCoordinator != v5)
  {
    v7 = v5;
    -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletionsAfterCommit](*p_traitCollectionChangeTransitionCoordinator, "_runAlongsideCompletionsAfterCommit");
    objc_storeStrong((id *)p_traitCollectionChangeTransitionCoordinator, a3);
    v5 = v7;
  }

}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__UIWindow_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_once != -1)
    dispatch_once(&initialize_once, block);
}

- (id)nextResponder
{
  if (self->_windowHostingScene)
    return self->_windowHostingScene;
  else
    return (id)UIApp;
}

- (id)_keyboardSceneSettings
{
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "snapshotting") & 1) != 0)
  {
    -[UIWindow windowScene](self, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_effectiveSettings");
  }
  else
  {
    -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 0;
}

- (void)makeKeyWindow
{
  -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](self, 0, 0);
}

- (void)setRootViewController:(UIViewController *)rootViewController
{
  UIViewController *v5;
  UIViewController **p_rootViewController;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  UIViewController *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _UIRootPresentationController *v15;
  void *v16;
  UIViewController *v17;

  v5 = rootViewController;
  p_rootViewController = &self->_rootViewController;
  if (self->_rootViewController != v5)
  {
    v17 = v5;
    v7 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](v5, "_preferredInterfaceOrientationGivenCurrentOrientation:", -[UIWindow _initialGuessInterfaceOrientation](self, "_initialGuessInterfaceOrientation"));
    -[UIViewController _existingView](v17, "_existingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[UIViewController _lastKnownInterfaceOrientation](v17, "_lastKnownInterfaceOrientation");
    else
      v9 = 0;

    -[UIWindow _removeAllViewControllersFromWindowHierarchyFromDealloc:](self, "_removeAllViewControllersFromWindowHierarchyFromDealloc:", 0);
    v10 = objc_retainAutorelease(*p_rootViewController);
    v11 = (id)objc_opt_self();
    -[UIWindow screen](self, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_userInterfaceIdiom");
    -[UIWindow screen](self, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController __willChangeToIdiom:onScreen:](v17, "__willChangeToIdiom:onScreen:", v13, v14);

    objc_storeStrong((id *)&self->_rootViewController, rootViewController);
    if (-[UIWindow _shouldInstallRootPresentationController](self, "_shouldInstallRootPresentationController"))
    {
      v15 = -[_UIRootPresentationController initWithPresentedViewController:presentingWindow:]([_UIRootPresentationController alloc], "initWithPresentedViewController:presentingWindow:", v17, self);
      -[UIWindow _setRootPresentationController:](self, "_setRootPresentationController:", v15);

      -[UIWindow _didCreateRootPresentationController](self, "_didCreateRootPresentationController");
    }
    if (-[UIView isHidden](self, "isHidden"))
    {
      if (dyld_program_sdk_at_least())
        -[UIViewController _tryBecomeRootViewControllerInWindow:]((uint64_t)*p_rootViewController, self);
    }
    else
    {
      -[UIWindow addRootViewControllerViewIfPossible](self, "addRootViewControllerViewIfPossible");
    }
    if (v7 != v9)
    {
      -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", v7, 1, 0.0);
    }
    -[UIResponder _didChangeDeepestActionResponder](self, "_didChangeDeepestActionResponder");
    v5 = v17;
  }

}

- (int64_t)_initialGuessInterfaceOrientation
{
  if (objc_msgSend((id)UIApp, "_frontMostAppInterfaceOrientationIsSignificant"))
    return objc_msgSend((id)UIApp, "_carefulChoiceOrientationForWindow:", self);
  else
    return -[_UISceneUIWindowHosting _interfaceOrientation](self->_windowHostingScene, "_interfaceOrientation");
}

- (void)_restoreFirstResponder
{
  UIResponder **p_lastFirstResponder;
  id WeakRetained;
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  id lastFirstResponderInteractionState;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lastFirstResponder = &self->_lastFirstResponder;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastFirstResponder);

  if (WeakRetained)
  {
    -[UIWindow firstResponder](self, "firstResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)&self->_lastNextResponder);

    if (v5 == v6)
    {
      v11 = objc_loadWeakRetained((id *)p_lastFirstResponder);
      +[UIResponder _callBecomeFirstResponder:withIntent:](UIResponder, "_callBecomeFirstResponder:withIntent:", v11, 2);

      v12 = objc_loadWeakRetained((id *)p_lastFirstResponder);
      LOBYTE(v11) = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)p_lastFirstResponder);
        objc_msgSend(v13, "setInteractionState:", self->_lastFirstResponderInteractionState);

      }
      v14 = qword_1EDDC8680;
      if (!qword_1EDDC8680)
      {
        v14 = __UILogCategoryGetNode("FirstResponderRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&qword_1EDDC8680);
      }
      if ((*(_BYTE *)v14 & 1) != 0)
      {
        v16 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = v16;
          v18 = objc_loadWeakRetained((id *)p_lastFirstResponder);
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Restoring the previous firstResponder: %@", (uint8_t *)&v19, 0xCu);

        }
      }
    }
    else
    {
      v7 = qword_1EDDC8688;
      if (!qword_1EDDC8688)
      {
        v7 = __UILogCategoryGetNode("FirstResponderRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1EDDC8688);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v19) = 0;
          v9 = "Not restoring the previous firstResponder since the _lastNextResponder and current firstResponder differ";
LABEL_13:
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, 2u);
        }
      }
    }
  }
  else
  {
    v10 = qword_1EDDC8690;
    if (!qword_1EDDC8690)
    {
      v10 = __UILogCategoryGetNode("FirstResponderRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1EDDC8690);
    }
    if ((*(_BYTE *)v10 & 1) != 0)
    {
      v8 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        v9 = "Can't restore firstResponder since _lastFirstResponder is nil";
        goto LABEL_13;
      }
    }
  }
  objc_storeWeak((id *)p_lastFirstResponder, 0);
  lastFirstResponderInteractionState = self->_lastFirstResponderInteractionState;
  self->_lastFirstResponderInteractionState = 0;

  objc_storeWeak((id *)&self->_lastNextResponder, 0);
}

- (BOOL)_needsShakesWhenInactive
{
  return 0;
}

- (UIEdgeInsets)_overlayInsets
{
  UIViewController *rootViewController;
  void *v4;
  UIWindow *v5;
  UIViewController *v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  UIViewController *v13;
  void *v14;
  UIViewController *v15;
  void *v16;
  unint64_t v17;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  void *v23;
  double v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  UIEdgeInsets result;

  rootViewController = self->_rootViewController;
  if (rootViewController)
  {
    -[UIViewController _existingView](rootViewController, "_existingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    v6 = self->_rootViewController;
    v7 = 0uLL;
    if (v5 == self)
    {
      if (v6)
      {
        -[UIViewController _cumulativeOverlayInsetsInView:](v6, "_cumulativeOverlayInsetsInView:", self);
        v10 = 0uLL;
        v11 = 0uLL;
        v7 = 0uLL;
        v12 = 0uLL;
        v6 = self->_rootViewController;
      }
      else
      {
        v12 = 0uLL;
        v10 = 0uLL;
        v11 = 0uLL;
      }
      v26 = v11;
      v27 = v10;
      v28 = v12;
      v29 = v7;
    }
    else
    {
      v28 = 0uLL;
      v29 = 0uLL;
      v26 = 0uLL;
      v27 = 0uLL;
    }
    v13 = v6;
    -[UIViewController presentedViewController](v13, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      do
      {
        v15 = v13;
        -[UIViewController presentedViewController](v13, "presentedViewController", *(_OWORD *)&v26, *(_OWORD *)&v27);
        v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        -[UIViewController _existingPresentationControllerImmediate:effective:](v13, "_existingPresentationControllerImmediate:effective:", 0, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "presentationStyle");
        if (v17 <= 5 && ((1 << v17) & 0x23) != 0)
        {
          v19 = 0uLL;
          if (v13)
          {
            -[UIViewController _cumulativeOverlayInsetsInView:](v13, "_cumulativeOverlayInsetsInView:", self);
            v21 = 0u;
            v20 = 0u;
            v19 = 0u;
            v22 = 0u;
          }
          else
          {
            v22 = 0uLL;
            v21 = 0uLL;
            v20 = 0uLL;
          }
          v26 = vmaxnmq_f64(v26, v20);
          v27 = vmaxnmq_f64(v27, v21);
          v28 = vaddq_f64(v28, v22);
          v29 = vaddq_f64(v29, v19);
        }

        -[UIViewController presentedViewController](v13, "presentedViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v23);
    }

    v9 = vmaxnmq_f64(vaddq_f64(v28, v26), (float64x2_t)0);
    v8 = vmaxnmq_f64(vaddq_f64(v29, v27), (float64x2_t)0);
  }
  else
  {
    v8 = 0uLL;
    v9 = 0uLL;
  }
  v24 = v8.f64[1];
  v25 = v9.f64[1];
  result.bottom = v9.f64[0];
  result.top = v8.f64[0];
  result.right = v25;
  result.left = v24;
  return result;
}

- (unsigned)_contextId
{
  id WeakRetained;
  unsigned int v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  v3 = objc_msgSend(WeakRetained, "contextId");

  return v3;
}

- (BOOL)_isSystemGestureWindow
{
  return 0;
}

- (void)_setExclusiveTouchView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_exclusiveTouchView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_exclusiveTouchView, a3);
    v5 = v6;
  }

}

+ (void)_synchronizeDrawing
{
  objc_msgSend(a1, "_synchronizeDrawingWithPreCommitHandler:", 0);
}

- (int64_t)_interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;

  -[UIWindow _interfaceOrientationMapResolver](self, "_interfaceOrientationMapResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIWindow _interfaceOrientationMapResolver](self, "_interfaceOrientationMapResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "interfaceOrientationForSupportedOrientations:preferredOrientation:", a3, a4);
LABEL_5:
    v11 = v9;

    return v11;
  }
  -[UIWindow windowScene](self, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIWindow windowScene](self, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_interfaceOrientationForSupportedOrientations:preferredOrientation:", a3, a4);
    goto LABEL_5;
  }
  return objc_msgSend((id)UIApp, "_fallbackInterfaceOrientationForSupportedOrientations:preferredOrientation:currentOrientation:", a3, a4, -[UIWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation"));
}

- (id)_interfaceOrientationMapResolver
{
  return self->_interfaceOrientationMapResolver;
}

void __39__UIWindow__noteOverlayInsetsDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)UIApp, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) == 0
      || (objc_msgSend((id)UIApp, "delegate"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "window"),
          v5 = (id)objc_claimAutoreleasedReturnValue(),
          v4,
          !v5))
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v5 == WeakRetained)
    {
      objc_msgSend(WeakRetained, "_windowHostingScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __39__UIWindow__noteOverlayInsetsDidChange__block_invoke_2;
      v7[3] = &unk_1E16B2A58;
      v7[4] = WeakRetained;
      objc_msgSend(v6, "_updateUIClientSettingsWithBlock:", v7);

    }
  }

}

- (BOOL)_systemGestureRecognitionIsPossible
{
  return *((_BYTE *)self + 664) & 1;
}

- (id)_obtainKeyboardLayoutGuideTransitionAssertionForReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[UIWindow isTrackingKeyboard](self, "isTrackingKeyboard"))
  {
    -[UIKeyboardLayoutGuide _obtainTransitionAssertionForReason:](self->_primaryKeyboardTrackingGuide, "_obtainTransitionAssertionForReason:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)beginDisablingInterfaceAutorotation
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  UIWindow *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[UIWindow _windowCanDynamicallySpecifySupportedInterfaceOrientations](self, "_windowCanDynamicallySpecifySupportedInterfaceOrientations"))
  {
    if ((*((_BYTE *)&self->_windowFlags + 1) & 0xF0) == 0)
    {
      -[UIWindow windowScene](self, "windowScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_canDynamicallySpecifySupportedInterfaceOrientations");

      if (v4)
      {
        -[UIWindow windowScene](self, "windowScene");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "interfaceOrientation");

        -[UIWindow windowScene](self, "windowScene");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_systemAppearanceManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v6 > 4)
          v10 = 0;
        else
          v10 = qword_1866827C8[v6];
        objc_msgSend(v8, "window:didUpdateSupportedOrientations:preferredOrientation:prefersAnimation:", self, v10, 0, 0);

      }
    }
    if ((~*(_DWORD *)&self->_windowFlags & 0xF000) != 0)
    {
      self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFFFF0FFFLL | ((((unint64_t)(*(_QWORD *)&self->_windowFlags + 4096) >> 12) & 0xF) << 12));
    }
    else
    {
      v11 = beginDisablingInterfaceAutorotation___s_category;
      if (!beginDisablingInterfaceAutorotation___s_category)
      {
        v11 = __UILogCategoryGetNode("AutoRotation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&beginDisablingInterfaceAutorotation___s_category);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315650;
        v17 = "-[UIWindow beginDisablingInterfaceAutorotation]";
        v18 = 2112;
        v19 = v15;
        v20 = 2048;
        v21 = self;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s overflow on <%@: %p>. Ignoring.", (uint8_t *)&v16, 0x20u);

      }
    }
  }
}

- (void)endDisablingInterfaceAutorotationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  $B5B0456088C508EDB812873BE14D7A88 windowFlags;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  UIWindow *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (-[UIWindow _windowCanDynamicallySpecifySupportedInterfaceOrientations](self, "_windowCanDynamicallySpecifySupportedInterfaceOrientations"))
  {
    windowFlags = self->_windowFlags;
    if ((*(_WORD *)&windowFlags & 0xF000) != 0)
    {
      self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&windowFlags & 0xFFFFFFFFFFFF0FFFLL | ((((unint64_t)(*(_DWORD *)&windowFlags + 61440) >> 12) & 0xF) << 12));
    }
    else
    {
      v6 = endDisablingInterfaceAutorotationAnimated____s_category;
      if (!endDisablingInterfaceAutorotationAnimated____s_category)
      {
        v6 = __UILogCategoryGetNode("AutoRotation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&endDisablingInterfaceAutorotationAnimated____s_category);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v20 = "-[UIWindow endDisablingInterfaceAutorotationAnimated:]";
        v21 = 2112;
        v22 = v10;
        v23 = 2048;
        v24 = self;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s called on <%@: %p> without matching -beginDisablingInterfaceAutorotation. Ignoring.", buf, 0x20u);

      }
    }
    if (!-[UIWindow isInterfaceAutorotationDisabled](self, "isInterfaceAutorotationDisabled"))
    {
      -[UIWindow windowScene](self, "windowScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_canDynamicallySpecifySupportedInterfaceOrientations");

      if (v12)
      {
        -[UIWindow _updateOrientationPreferencesAnimated:](self, "_updateOrientationPreferencesAnimated:", v3);
      }
      else if ((*((_BYTE *)&self->_windowFlags + 2) & 1) != 0)
      {
        v13 = objc_alloc(MEMORY[0x1E0C99D80]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v14, CFSTR("UIDeviceOrientationRotateAnimatedUserInfoKey"), 0);

        v16 = (void *)MEMORY[0x1E0CB37C0];
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "notificationWithName:object:userInfo:", CFSTR("UIDeviceOrientationDidChangeNotification"), v17, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIWindow performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleDeviceOrientationChange_, v18, 0.0);
      }
      *(_QWORD *)&self->_windowFlags &= ~0x10000uLL;
    }
  }
}

- (void)endDisablingInterfaceAutorotation
{
  -[UIWindow endDisablingInterfaceAutorotationAnimated:](self, "endDisablingInterfaceAutorotationAnimated:", 1);
}

- (BOOL)_isTextEffectsWindowHosting
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[UIWindow _isTextEffectsWindow](self, "_isTextEffectsWindow");
  if (v3)
  {
    -[UIWindow windowScene](self, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useHostedInstance");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)_removeWindowLevelChangedObserver:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *windowLevelObservers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_windowLevelObservers, "removeObject:", v4);
    v5 = -[NSHashTable count](self->_windowLevelObservers, "count");
    v4 = v7;
    if (!v5)
    {
      windowLevelObservers = self->_windowLevelObservers;
      self->_windowLevelObservers = 0;

      v4 = v7;
    }
  }

}

- (id)_initWithOrientation:(int64_t)a3
{
  objc_super v4;

  self->_viewOrientation = a3;
  v4.receiver = self;
  v4.super_class = (Class)UIWindow;
  return -[UIView init](&v4, sel_init);
}

- (UIWindow)initWithFrame:(CGRect)a3
{
  return (UIWindow *)-[UIWindow _initWithFrame:attached:](self, "_initWithFrame:attached:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 attached:(BOOL)a5
{
  return -[UIWindow _initWithFrame:debugName:scene:attached:](self, "_initWithFrame:debugName:scene:attached:", a4, 0, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  return -[UIWindow _initWithFrame:debugName:attached:](self, "_initWithFrame:debugName:attached:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setWindowLevel:(UIWindowLevel)windowLevel
{
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  id v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIWindow _adjustedWindowLevelFromLevel:](self, "_adjustedWindowLevelFromLevel:", windowLevel);
  v5 = self->_windowLevel;
  if (v5 != v4)
  {
    v6 = v4;
    self->_windowLevel = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);

    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained((id *)&self->_layerContext);
      *(float *)&v9 = v6;
      objc_msgSend(v8, "setLevel:", v9);

      if (!-[UIView isHidden](self, "isHidden"))
      {
        -[UIWindow _updateLayerOrderingAndSetLayerHidden:](self, "_updateLayerOrderingAndSetLayerHidden:", 0);
        -[UIWindow windowScene](self, "windowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_updateVisibleWindowOrderWithTest:", 0);

      }
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = (void *)-[NSHashTable copy](self->_windowLevelObservers, "copy", 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "window:changedFromLevel:toLevel:", self, v5, self->_windowLevel);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (double)_adjustedWindowLevelFromLevel:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[UIWindow windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a3;
  if (v5)
  {
    objc_msgSend(v5, "_adjustedLevelForWindow:preferredLevel:", self, a3);
    v7 = v8;
  }
  if (dyld_program_sdk_at_least()
    && (_UIApplicationIsSystemApplication() & 1) == 0
    && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0
    && !_AXSProcessDrawsAssistiveUI())
  {
    v7 = fmin(fmax(a3, -10000000.0), 10000000.0);
  }

  return v7;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 scene:(id)a5 attached:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = a4;
  _ensureDebugName(self, v13);
  -[UIWindow _uiWindowSceneFromFBSScene:](self, "_uiWindowSceneFromFBSScene:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", v13, v14, x, y, width, height);
  return v15;
}

- (id)_uiWindowSceneFromFBSScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  SEL v10;
  UIWindow *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  if (v5)
  {
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Attempting to on-demand create a UIScene instance without previously informing UIKit of the backing FBSScene. This is a fatal error outside system apps.");
      v10 = a2;
      v11 = self;
      v12 = 1287;
LABEL_4:
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("UIWindow.m"), v12, v9);
LABEL_26:

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (objc_msgSend((id)UIApp, "isFrontBoard")
    && (objc_msgSend((id)UIApp, "disablesFrontBoardImplicitWindowScenes") & 1) == 0)
  {
    if (-[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged"))
    {
      -[UIWindow screen](self, "screen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)UIApp, "_newSceneForWindow:oldDisplay:newDisplay:", self, v8, v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v20);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v21, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if (!objc_msgSend((id)objc_opt_class(), "_isSystemUIService"))
  {
    if (-[UIWindow _wantsSceneAssociation](self, "_wantsSceneAssociation")
      && -[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged"))
    {
      if (UIApp)
      {
        +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "applicationInitializationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "defaultSceneToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
        {
          if (!v16)
          {
            -[UIWindow screen](self, "screen");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v8);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          objc_msgSend((id)UIApp, "_defaultSceneIfExists");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v17);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          if (v6)
            goto LABEL_27;
          if ((_UIApplicationIsExtension() & 1) == 0)
          {
            -[UIWindow screen](self, "screen");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v8, 1);
            v18 = objc_claimAutoreleasedReturnValue();
LABEL_25:
            v6 = (void *)v18;
            goto LABEL_26;
          }
        }
LABEL_28:
        v6 = 0;
        goto LABEL_27;
      }
      if (!-[UIWindow _alwaysGetsContexts](self, "_alwaysGetsContexts"))
        goto LABEL_28;
    }
LABEL_24:
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v8, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("SystemUIService creating windows without first creating a scene. They should know better. Aborting.");
    v10 = a2;
    v11 = self;
    v12 = 1299;
    goto LABEL_4;
  }
LABEL_27:

  return v6;
}

- (UIWindow)initWithWindowScene:(UIWindowScene *)windowScene
{
  UIWindowScene *v4;
  void *v5;
  UIWindow *v6;

  v4 = windowScene;
  -[UIWindowScene coordinateSpace](v4, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", 0, v4);

  return v6;
}

- (void)_setWindowControlsStatusBarOrientation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)_adjustFramePositionIfNecessary
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  -[UIWindow windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 1401, CFSTR("Expected non-nil windowScene"));

    v4 = 0;
  }
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarHeight");
  v7 = v6;

  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v26, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v19 = v18 - v7;
  if (v9 >= 0.0)
    v20 = v9;
  else
    v20 = 0.0;
  if (v11 >= v7)
    v21 = v11;
  else
    v21 = v7;
  if (v13 + v20 <= v17 + 0.0)
    v22 = v20;
  else
    v22 = v17 + 0.0 - v13;
  v23 = v7 + v19;
  if (v15 + v21 <= v23)
    v24 = v21;
  else
    v24 = v23 - v15;
  -[UIWindow setFrame:](self, "setFrame:", v22, v24, v13, v15);

}

- (void)_registerScrollToTopView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (qword_1EDDC85C0)
  {
    CFDictionaryGetValue((CFDictionaryRef)qword_1EDDC85C0, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_6;
  }
  else
  {
    qword_1EDDC85C0 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1EDDC85C0, self, v4);
LABEL_6:
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v7);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "addPointer:", v7);

}

- (_UIContextBinder)_contextBinder
{
  return (_UIContextBinder *)objc_loadWeakRetained((id *)&self->_contextBinder);
}

- (CAContext)_boundContext
{
  return (CAContext *)objc_loadWeakRetained((id *)&self->_layerContext);
}

- (void)_setBoundContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIWindow _contextId](self, "_contextId");
  objc_storeWeak((id *)&self->_layerContext, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v4)
  {
    objc_msgSend(v6, "postNotificationName:object:", _UIWindowDidAttachContextNotification, self);

  }
  else
  {
    v7 = _UIWindowDidDetachContextNotification;
    v11 = CFSTR("contextId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", v7, self, v9);

  }
}

- (id)_bindingLayer
{
  CALayer *rootLayer;

  rootLayer = self->_rootLayer;
  if (!rootLayer)
  {
    rootLayer = self->_sceneTransformLayer;
    if (!rootLayer)
      rootLayer = self->_transformLayer;
  }
  return rootLayer;
}

- (id)_contextOptionsWithInitialOptions:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[UIWindow _configureContextOptions:](self, "_configureContextOptions:", v4);
  return v4;
}

- (void)_didBecomeApplicationKeyWindowWithOldApplicationKeyWindow:(void *)a1
{
  void *v3;
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  id v25;

  v25 = a2;
  if (a1)
  {
    objc_msgSend(a1, "firstResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(a1, "firstResponder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_windowBecameKey");
    }
    else
    {
      objc_msgSend(a1, "becomeFirstResponder");
      objc_msgSend(a1, "windowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyboardSceneDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(a1, "firstResponder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {

        }
        else
        {
          objc_msgSend(a1, "screen");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "windowScene");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "screen");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 == v9)
            objc_msgSend(v4, "_reloadInputViewsForResponder:", 0);
        }
      }
    }

    objc_msgSend(a1, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_focusSystemSceneComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusSystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsFocusUpdate");

    objc_msgSend(v25, "_windowHostingScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_windowHostingScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v13, "isEqual:", v14);

    if ((_DWORD)v12)
    {
      if ((objc_msgSend(a1, "_windowOwnsInterfaceOrientation") & 1) != 0)
      {
        v15 = objc_msgSend((id)UIApp, "isFrontBoard");
        if (v15)
        {
          v16 = objc_msgSend(v25, "_overriddenInterfaceOrientation");
          v17 = objc_msgSend(a1, "_overriddenInterfaceOrientation");
          v18 = v17;
        }
        else
        {
          v16 = objc_msgSend(v25, "interfaceOrientation");
          v18 = objc_msgSend(a1, "_overriddenInterfaceOrientation");
          v17 = objc_msgSend(a1, "interfaceOrientation");
        }
        if (v16 == v17)
        {
          if (v18)
            v24 = v15;
          else
            v24 = 0;
          if (v24 == 1)
            objc_msgSend(a1, "_notifyRotatableViewOrientation:duration:", v18, 0.0);
          goto LABEL_24;
        }
        objc_msgSend(a1, "rootViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "interfaceOrientation");
      }
      else
      {
        v19 = objc_msgSend(a1, "_windowInterfaceOrientation");
        objc_msgSend(a1, "_windowHostingScene");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "_interfaceOrientation");

        if (v19 == v21)
          goto LABEL_24;
        objc_msgSend(a1, "_windowHostingScene");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "_interfaceOrientation");
      }
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)a1, v23, 1, 1, 0.0);

    }
  }
LABEL_24:

}

- (int64_t)_overriddenInterfaceOrientation
{
  void *v3;
  int64_t v4;

  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_overrideInterfaceOrientationMechanics");

  if (v4)
    return v4;
  else
    return -[UIWindow interfaceOrientation](self, "interfaceOrientation");
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "becomeFirstResponder");

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIWindow;
  return -[UIView becomeFirstResponder](&v6, sel_becomeFirstResponder);
}

- (BOOL)_supportsBecomeFirstResponderWhenPossible
{
  return 0;
}

- (void)_rotateWindowToOrientation:(int64_t)a3 updateStatusBar:(BOOL)a4 duration:(double)a5 skipCallbacks:(BOOL)a6
{
  _BOOL8 v6;
  unint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  char v14;
  int64_t viewOrientation;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double *v66;
  double v67;
  double v68;
  _UIViewControllerOneToOneTransitionContext *v69;
  void *v70;
  void *v71;
  _QWORD v72[8];
  char v73;
  char v74;
  BOOL v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  void *v79;
  __int128 v80;
  __int128 v81;

  v6 = a6;
  v10 = *(_QWORD *)&self->_windowFlags & 0x40000000;
  if (a4)
    v11 = objc_msgSend((id)UIApp, "_statusBarOrientationFollowsWindow:", self);
  else
    v11 = 0;
  v12 = -[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation");
  if (v10)
    v13 = v12;
  else
    v13 = 1;
  v76 = 0;
  v77 = &v76;
  v78 = 0x4010000000;
  v79 = &unk_18685B0AF;
  v80 = 0u;
  v81 = 0u;
  v14 = objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate");
  viewOrientation = self->_viewOrientation;
  if (viewOrientation)
    v16 = 1;
  else
    v16 = v14;
  if ((v16 & 1) == 0)
  {
    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "_interfaceOrientation");

    if (v42 != a3)
      goto LABEL_12;
LABEL_17:
    -[UIView frame](self, "frame");
    v43 = v77;
    v77[4] = v44;
    v43[5] = v45;
    v43[6] = v46;
    v43[7] = v47;
    -[UIView bounds](self, "bounds");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    goto LABEL_20;
  }
  if (!viewOrientation)
    goto LABEL_17;
LABEL_12:
  if (v13)
  {
    if (!self->_viewOrientation)
    {
      -[UIWindow screen](self, "screen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_viewOrientation = objc_msgSend(v17, "_interfaceOrientation");

    }
    -[UIView bounds](self, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[_UISceneUIWindowHosting _coordinateSpace](self->_windowHostingScene, "_coordinateSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v26, v19, v21, v23, v25);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    -[_UISceneUIWindowHosting _referenceBounds](self->_windowHostingScene, "_referenceBounds");
    v37 = _UIWindowConvertRectFromOrientationToOrientation(-[UIWindow _orientationInSceneSpace](self, "_orientationInSceneSpace"), a3, v28, v30, v32, v34, v35, v36);
  }
  else
  {
    -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
    v37 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a3, v57, v59, v61, v63, v64, v65);
  }
  v49 = v37;
  v51 = v38;
  v53 = v39;
  v55 = v40;
  v66 = (double *)v77;
  *((double *)v77 + 4) = v37;
  v66[5] = v38;
  v66[6] = v39;
  v66[7] = v40;
LABEL_20:
  self->_fromWindowOrientation = self->_viewOrientation;
  self->_toWindowOrientation = a3;
  v67 = 0.0;
  if (!v6)
  {
    +[UIView _durationForRotationFromInterfaceOrientation:toInterfaceOrientation:withBaseDuration:](UIView, "_durationForRotationFromInterfaceOrientation:toInterfaceOrientation:withBaseDuration:", self->_fromWindowOrientation, a3, a5);
    v67 = v68;
  }
  v69 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
  +[_UIWindowAnimationController animationControllerWithWindow:](_UIWindowRotationAnimationController, "animationControllerWithWindow:", self);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionContext _setDuration:](v69, "_setDuration:", v67);
  objc_msgSend(v70, "setDuration:", v67);
  objc_msgSend(v70, "setSkipCallbacks:", v6);
  objc_msgSend(v70, "setUpdateStatusBarIfNecessary:", v11);
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke;
  v72[3] = &unk_1E16DE600;
  v72[4] = self;
  v72[5] = &v76;
  v72[6] = a3;
  v73 = v11;
  *(double *)&v72[7] = v67;
  v74 = v10 >> 30;
  v75 = v6;
  objc_msgSend(v70, "setAnimations:", v72);
  -[_UIViewControllerTransitionContext _setIsAnimated:](v69, "_setIsAnimated:", v67 > 0.0);
  -[_UIViewControllerTransitionContext _setRotating:](v69, "_setRotating:", 1);
  -[UIWindow rootViewController](self, "rootViewController");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v69, "_setFromViewController:", v71);

  -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v69, "_setToViewController:", 0);
  -[_UIViewControllerTransitionContext _setContainerView:](v69, "_setContainerView:", self);
  -[UIView frame](self, "frame");
  -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v69, "_setFromStartFrame:");
  -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v69, "_setToEndFrame:", v49, v51, v53, v55);
  -[UIView frame](self, "frame");
  -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v69, "_setToStartFrame:");
  -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v69, "_setFromEndFrame:", v49, v51, v53, v55);
  -[_UIViewControllerTransitionContext _setAnimator:](v69, "_setAnimator:", v70);
  -[UIWindow _rotateToBounds:withAnimator:transitionContext:](self, "_rotateToBounds:withAnimator:transitionContext:", v70, v69, v49, v51, v53, v55);

  _Block_object_dispose(&v76, 8);
}

- (void)_rotateToBounds:(CGRect)a3 withAnimator:(id)a4 transitionContext:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  char v11;
  int64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];
  char v21;
  char v22;
  _QWORD v23[5];
  _QWORD aBlock[5];
  id v25;
  double v26;
  double v27;
  int64_t v28;
  char v29;

  height = a3.size.height;
  width = a3.size.width;
  v9 = a5;
  v10 = a4;
  v11 = objc_msgSend(v10, "skipCallbacks");
  v12 = -[UIWindow _toWindowOrientation](self, "_toWindowOrientation");
  -[UIWindow windowScene](self, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIScene _systemShellOwnsInterfaceOrientation](v13);

  if ((v14 & 1) == 0)
    -[UIWindow beginDisablingInterfaceAutorotation](self, "beginDisablingInterfaceAutorotation");
  kdebug_trace();
  -[UIWindow screen](self, "screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_transitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v12, v15, v16, width, height);

  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke;
  aBlock[3] = &unk_1E16DE558;
  v29 = v11;
  aBlock[4] = self;
  v26 = width;
  v27 = height;
  v18 = v9;
  v25 = v18;
  v28 = v12;
  v19 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[UIWindow _guardSizeTransitionFromAnimations](self, "_guardSizeTransitionFromAnimations"))
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
  else
    v19[2](v19);
  kdebug_trace();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_2;
  v23[3] = &unk_1E16C2C08;
  v23[4] = self;
  objc_msgSend(v18, "_setCompletionHandler:", v23);
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_3;
  v20[3] = &unk_1E16DE580;
  v20[4] = self;
  v21 = v11;
  v22 = v14 ^ 1;
  objc_msgSend(v18, "_setDidCompleteHandler:", v20);
  objc_msgSend(v10, "animateTransition:", v18);

}

- (int64_t)_toWindowOrientation
{
  return self->_toWindowOrientation;
}

- (BOOL)_guardSizeTransitionFromAnimations
{
  void *v2;
  int v3;

  -[_UISceneUIWindowHosting _FBSScene](self->_windowHostingScene, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = 0;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0 && v2)
    v3 = objc_msgSend(v2, "uiCanReceiveDeviceOrientationEvents") ^ 1;

  return v3;
}

- (void)_setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->__animationController, a3);
}

uint64_t __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 584) &= ~0x400uLL;
  return result;
}

void __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke(uint64_t a1)
{
  BOOL v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled");
    v3 = *(_QWORD **)(a1 + 32);
    if (v2)
    {
      v3[73] |= 0x400uLL;
      return;
    }
    objc_msgSend(v3, "rootViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window:setupWithInterfaceOrientation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) |= 0x400uLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("UIWindowNewOrientationUserInfoKey"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillRotateNotification"), v7, v10);

  }
}

- (id)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v4;
  NSUndoManager *v5;

  undoManager = self->_undoManager;
  if (!undoManager)
  {
    v4 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E0CB3A48]);
    v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 0;
}

- (BOOL)_containedInAbsoluteResponderChain
{
  return 1;
}

- (BOOL)_requiresKeyboardPresentationFence
{
  return !-[UIWindow isUsingOnePartRotationAnimation](self, "isUsingOnePartRotationAnimation");
}

- (BOOL)isUsingOnePartRotationAnimation
{
  return (*((unsigned __int8 *)&self->_windowFlags + 1) >> 3) & 1;
}

- (BOOL)_shouldDelayTouchForSystemGestures:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  v8 = (unint64_t)(objc_msgSend(v4, "_edgeType") - 1) <= 3
    && (+[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_isCoordinatingWithSystemGestures"),
        v5,
        (v6 & 1) == 0)
    && (v7 = -[UIWindow _edgesForSystemGesturesTouchDelay](self, "_edgesForSystemGesturesTouchDelay")) != 0
    && (-[UIWindow _edgeForTouch:](self, "_edgeForTouch:", v4) & v7) != 0;

  return v8;
}

- (void)sendEvent:(UIEvent *)event
{
  UIEvent *v4;
  unint64_t v5;
  void *v6;
  UIWindow *v7;
  char v8;
  char v9;
  int v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _UITouchVisualizationView *v42;
  _UITouchVisualizationView *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  _UITouchVisualizationView *v48;
  UIWindow *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  _UITouchVisualizationView *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  objc_class *v85;
  void *v86;
  UIEvent *v87;
  void *v88;
  id obj;
  uint64_t v90;
  UIEvent *v91;
  _QWORD v92[4];
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  CGAffineTransform v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[4];
  _UITouchVisualizationView *v105;
  _QWORD v106[4];
  _UITouchVisualizationView *v107;
  _QWORD v108[4];
  _UITouchVisualizationView *v109;
  CGAffineTransform v110;
  CGAffineTransform v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  CGAffineTransform v116;
  CGAffineTransform v117;
  _BYTE v118[128];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t buf[4];
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  const char *Name;
  __int16 v129;
  UIWindow *v130;
  __int16 v131;
  unsigned int v132;
  uint64_t v133;
  CGRect v134;
  CGRect v135;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = event;
  v5 = qword_1EDDC8628;
  if (!qword_1EDDC8628)
  {
    v5 = __UILogCategoryGetNode("EventDispatch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1EDDC8628);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v81 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = v81;
      v83 = -[UIEvent type](v4, "type");
      v84 = -[UIEvent subtype](v4, "subtype");
      v85 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 134219010;
      v124 = v83;
      v125 = 2048;
      v126 = v84;
      v127 = 2082;
      Name = class_getName(v85);
      v129 = 2048;
      v130 = self;
      v131 = 1026;
      v132 = -[UIWindow _contextId](self, "_contextId");
      _os_log_impl(&dword_185066000, v82, OS_LOG_TYPE_DEFAULT, "Sending UIEvent type: %li; subtype: %li; to window: <%{public}s: %p>; contextId: 0x%{public}X",
        buf,
        0x30u);

    }
  }
  v6 = (void *)_UISetCurrentFallbackEnvironment(self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = v4;
    v7 = self;
    v8 = _UIInternalPreferenceUsesDefault(&_MergedGlobals_161, (uint64_t)CFSTR("ShowTouches"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1ECD7683C)
      v9 = v8;
    else
      v9 = 1;
    v10 = _UIInternalPreferenceUsesDefault(&dword_1ECD76840, (uint64_t)CFSTR("ShowTouchesForAllProcesses"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v11 = byte_1ECD76844 != 0;
    if (qword_1EDDC86B8 != -1)
      dispatch_once(&qword_1EDDC86B8, &__block_literal_global_1369);
    v86 = v6;
    v87 = v4;
    if ((v9 & 1) != 0)
    {
      if (!qword_1EDDC86B0)
      {
LABEL_69:

        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        -[UIEvent _viewsForWindow:](v91, "_viewsForWindow:", v7);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v96;
          v66 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v64; ++i)
            {
              if (*(_QWORD *)v96 != v65)
                objc_enumerationMutation(obj);
              v68 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
              -[UIEvent _touchesForView:withPhase:](v91, "_touchesForView:withPhase:", v68, 0, v86, v87);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "count");

              if (v70)
              {
                -[UIWindow _fadeCalloutBarIfNeededForTouchInView:](v7, "_fadeCalloutBarIfNeededForTouchInView:", v68);
                v71 = objc_retainAutorelease(v68);
                if (v71)
                {
                  v72 = v71;
                  do
                  {
                    objc_msgSend(v72, "layer");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "animationKeys");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    v92[0] = v66;
                    v92[1] = 3221225472;
                    v92[2] = __22__UIWindow_sendEvent___block_invoke;
                    v92[3] = &unk_1E16BD3E8;
                    v93 = v72;
                    v94 = v73;
                    v75 = v73;
                    v76 = v72;
                    objc_msgSend(v74, "enumerateObjectsUsingBlock:", v92);

                    objc_msgSend(v76, "superview");
                    v72 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  while (v72);
                }
              }
            }
            v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
          }
          while (v64);
        }

        objc_msgSend((id)UIApp, "_gestureEnvironment");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v77, v91, (uint64_t)v7);

        -[UIWindow _sendTouchesForEvent:](v7, "_sendTouchesForEvent:", v91);
        -[UIEvent timestamp](v91, "timestamp");
        v7->_lastTouchTimestamp = v78;

        v6 = v86;
        v4 = v87;
        goto LABEL_91;
      }
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v12 = (id)qword_1EDDC86B0;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v119, buf, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v120;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v120 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * j), "removeFromSuperview", v86, v87);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v119, buf, 16);
        }
        while (v14);
      }

      v17 = (void *)qword_1EDDC86A0;
      qword_1EDDC86A0 = 0;

      v18 = (void *)qword_1EDDC86A8;
      qword_1EDDC86A8 = 0;

      v19 = (void *)qword_1EDDC86B0;
      qword_1EDDC86B0 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v21 = v11 & ~v10;
    if (!byte_1EDDC8591)
      v21 = 1;
    if (v21 != 1)
      goto LABEL_69;
    v22 = &byte_1EDDC8000;
    if (!qword_1EDDC86A0)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)qword_1EDDC86A0;
      qword_1EDDC86A0 = v23;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)qword_1EDDC86A8;
      qword_1EDDC86A8 = v25;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)qword_1EDDC86B0;
      qword_1EDDC86B0 = v27;

    }
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[UIEvent allTouches](v91, "allTouches", v86, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v112, buf, 16);
    if (!v29)
      goto LABEL_68;
    v30 = v29;
    v90 = *(_QWORD *)v113;
    v88 = v19;
LABEL_30:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v113 != v90)
        objc_enumerationMutation(v19);
      v32 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v31);
      v33 = objc_msgSend(v32, "phase");
      objc_msgSend(v32, "force");
      v35 = v34;
      v36 = v34 * 0.6 + 0.4;
      if (v35 <= 0.0)
        v37 = 1.0;
      else
        v37 = v36;
      if (objc_msgSend(v32, "type") == 2)
        v37 = v35 * 0.4 / 4.2 + 0.2;
      memset(&v111, 0, sizeof(v111));
      CGAffineTransformMakeScale(&v111, v37, v37);
      objc_msgSend(v32, "locationInView:", v7);
      v39 = v38;
      v41 = v40;
      if (v33)
      {
        objc_msgSend(*((id *)v22 + 212), "objectForKey:", v32);
        v42 = (_UITouchVisualizationView *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v43 = v42;
          if ((unint64_t)(v33 - 3) > 1)
          {
            v99 = v111;
            -[UIView setTransform:](v42, "setTransform:", &v99);
            -[UIView setCenter:](v43, "setCenter:", v39, v41);
            -[UIView superview](v43, "superview");
            v49 = (UIWindow *)objc_claimAutoreleasedReturnValue();

            if (v49 == v7)
              -[UIView bringSubviewToFront:](v7, "bringSubviewToFront:", v43);
            else
              -[UIView addSubview:](v7, "addSubview:", v43);
          }
          else
          {
            v44 = MEMORY[0x1E0C809B0];
            v106[0] = MEMORY[0x1E0C809B0];
            v106[1] = 3221225472;
            v106[2] = ____updateTouchVisualisation_block_invoke_2;
            v106[3] = &unk_1E16B1B28;
            v107 = v42;
            v104[0] = v44;
            v104[1] = 3221225472;
            v104[2] = ____updateTouchVisualisation_block_invoke_3;
            v104[3] = &unk_1E16B3FD8;
            v43 = v107;
            v105 = v43;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v106, v104, 0.12, 0.0);
            objc_msgSend((id)qword_1EDDC86B0, "removeObject:", v43);
            objc_msgSend((id)qword_1EDDC86A0, "removeObjectForKey:", v32);
            objc_msgSend((id)qword_1EDDC86A0, "objectEnumerator");
            v45 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "nextObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {

              goto LABEL_43;
            }
            v50 = objc_msgSend((id)qword_1EDDC86B0, "count");

            if (v50)
            {
              v102 = 0u;
              v103 = 0u;
              v100 = 0u;
              v101 = 0u;
              v45 = (id)qword_1EDDC86B0;
              v51 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v100, &v119, 16);
              if (v51)
              {
                v52 = v51;
                v53 = *(_QWORD *)v101;
                do
                {
                  for (k = 0; k != v52; ++k)
                  {
                    if (*(_QWORD *)v101 != v53)
                      objc_enumerationMutation(v45);
                    v55 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
                    objc_msgSend(v55, "removeFromSuperview");
                    objc_msgSend((id)qword_1EDDC86A8, "addObject:", v55);
                  }
                  v52 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v100, &v119, 16);
                }
                while (v52);
                v22 = &byte_1EDDC8000;
                v19 = v88;
              }
LABEL_43:

            }
          }
LABEL_65:

        }
      }
      else
      {
        NSClassFromString(CFSTR("_UIRootWindow"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend((id)qword_1EDDC86A8, "anyObject");
          v47 = objc_claimAutoreleasedReturnValue();
          if (v47)
          {
            v48 = (_UITouchVisualizationView *)v47;
            objc_msgSend((id)qword_1EDDC86A8, "removeObject:", v47);
          }
          else
          {
            v56 = [_UITouchVisualizationView alloc];
            v134.size.width = 0.0;
            v134.size.height = 0.0;
            v134.origin.x = v39;
            v134.origin.y = v41;
            v135 = CGRectInset(v134, -22.0, -22.0);
            v48 = -[UIView initWithFrame:](v56, "initWithFrame:", v135.origin.x, v135.origin.y, v135.size.width, v135.size.height);
            -[UIView setUserInteractionEnabled:](v48, "setUserInteractionEnabled:", 0);
            -[UIView layer](v48, "layer");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setAllowsHitTesting:", 0);
            objc_msgSend(v57, "setBorderWidth:", 2.0);
            objc_msgSend(v57, "setCornerRadius:", 22.0);

          }
          if (objc_msgSend(v32, "type") == 2)
          {
            +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.95, 0.46, 0.99, 0.4);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setBackgroundColor:](v48, "setBackgroundColor:", v58);

            +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.95, 0.46, 0.5, 0.8);
          }
          else
          {
            +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.6);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setBackgroundColor:](v48, "setBackgroundColor:", v59);

            +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
          }
          v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v61 = objc_msgSend(v60, "CGColor");
          -[UIView layer](v48, "layer");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setBorderColor:", v61);

          CGAffineTransformMakeScale(&v117, 0.001, 0.001);
          v116 = v117;
          -[UIView setTransform:](v48, "setTransform:", &v116);
          -[UIView setAlpha:](v48, "setAlpha:", 0.0);
          -[UIView setCenter:](v48, "setCenter:", v39, v41);
          -[UIView addSubview:](v7, "addSubview:", v48);
          objc_msgSend((id)qword_1EDDC86A0, "setObject:forKey:", v48, v32);
          objc_msgSend((id)qword_1EDDC86B0, "addObject:", v48);
          v108[0] = MEMORY[0x1E0C809B0];
          v108[1] = 3221225472;
          v108[2] = ____updateTouchVisualisation_block_invoke_1380;
          v108[3] = &unk_1E16BF720;
          v109 = v48;
          v110 = v111;
          v43 = v48;
          +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v108, 0.12);

          v19 = v88;
          goto LABEL_65;
        }
      }
      if (++v31 == v30)
      {
        v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v112, buf, 16);
        if (!v30)
          goto LABEL_68;
        goto LABEL_30;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    {
      objc_msgSend((id)UIApp, "_gestureEnvironment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v20, v4, (uint64_t)self);

      -[UIWindow _sendButtonsForEvent:](self, "_sendButtonsForEvent:", v4);
    }
    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIWindow _focusResponder](self, "_focusResponder");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEvent _sendEventToResponder:](v4, "_sendEventToResponder:", v79);
LABEL_90:

    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_89:
    objc_msgSend((id)UIApp, "_gestureEnvironment");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v79, v4, (uint64_t)self);
    goto LABEL_90;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIEvent setNeedsUpdateForWindow:](v4, "setNeedsUpdateForWindow:", self);
    goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_89;
  -[UIWindow firstResponder](self, "firstResponder");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v80)
  {
    -[UIWindow _deepestActionResponder](self, "_deepestActionResponder");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIEvent _sendEventToResponder:](v4, "_sendEventToResponder:", v80);

LABEL_91:
  _UIRestorePreviousFallbackEnvironment(v6);

}

- (void)_sendTouchesForEvent:(id)a3
{
  id v4;
  unint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  id *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  __int16 v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  __int128 v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = qword_1EDDC85D8;
  if (!qword_1EDDC85D8)
  {
    v5 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1EDDC85D8);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v67 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v67, OS_LOG_TYPE_ERROR, "UIWindow sendEvent:", buf, 2u);
    }
  }
  v6 = (id *)&UIApp;
  objc_msgSend((id)UIApp, "_responderBasedEventDeliverer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_respondersForWindow:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = qword_1EDDC85E0;
  if (!qword_1EDDC85E0)
  {
    v9 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1EDDC85E0);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v68 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v83 = v8;
      _os_log_impl(&dword_185066000, v68, OS_LOG_TYPE_ERROR, "\tviews: %@", buf, 0xCu);
    }
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v78;
    *(_QWORD *)&v12 = 134218498;
    v69 = v12;
    v70 = v7;
    v71 = *(_QWORD *)v78;
    do
    {
      v15 = 0;
      v72 = v13;
      do
      {
        if (*(_QWORD *)v78 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v15);
        if (v7)
        {
          objc_msgSend(v7, "deliverTouchesEvent:toResponder:", v4, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v15));
        }
        else
        {
          objc_msgSend(v4, "_touchesForResponder:withPhase:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v15), 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = qword_1EDDC85E8;
          if (!qword_1EDDC85E8)
          {
            v18 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v18, (unint64_t *)&qword_1EDDC85E8);
          }
          if ((*(_BYTE *)v18 & 1) != 0)
          {
            v38 = *(NSObject **)(v18 + 8);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = v38;
              v40 = objc_msgSend(v17, "count");
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v40;
              _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "\t\tBegan touch count: %d", buf, 8u);

            }
          }
          if (objc_msgSend(v17, "count", v69))
          {
            v19 = qword_1EDDC85F0;
            if (!qword_1EDDC85F0)
            {
              v19 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v19, (unint64_t *)&qword_1EDDC85F0);
            }
            if ((*(_BYTE *)v19 & 1) != 0)
            {
              v50 = *(NSObject **)(v19 + 8);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                v51 = v50;
                v52 = (objc_class *)objc_opt_class();
                NSStringFromClass(v52);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v69;
                v83 = v16;
                v84 = 2112;
                v85 = v53;
                v86 = 2112;
                v87 = v17;
                _os_log_impl(&dword_185066000, v51, OS_LOG_TYPE_ERROR, "\t\tCalling touchesBegan:withEvent: on view: %p (%@) with touches: %@", buf, 0x20u);

              }
            }
            objc_msgSend(v16, "touchesBegan:withEvent:", v17, v4);
            objc_msgSend(*v6, "_registerEstimatedTouches:event:forTouchable:", v17, v4, v16);
          }
          objc_msgSend(v4, "_touchesForResponder:withPhase:", v16, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = qword_1EDDC85F8;
          if (!qword_1EDDC85F8)
          {
            v21 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v21, (unint64_t *)&qword_1EDDC85F8);
          }
          if ((*(_BYTE *)v21 & 1) != 0)
          {
            v41 = *(NSObject **)(v21 + 8);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = v41;
              v43 = objc_msgSend(v20, "count");
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v43;
              _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "\t\tMoved touch count: %d", buf, 8u);

            }
          }
          if (objc_msgSend(v20, "count"))
          {
            v22 = qword_1EDDC8600;
            if (!qword_1EDDC8600)
            {
              v22 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v22, (unint64_t *)&qword_1EDDC8600);
            }
            if ((*(_BYTE *)v22 & 1) != 0)
            {
              v54 = *(NSObject **)(v22 + 8);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                v55 = v54;
                v56 = (objc_class *)objc_opt_class();
                NSStringFromClass(v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v69;
                v83 = v16;
                v84 = 2112;
                v85 = v57;
                v86 = 2112;
                v87 = v20;
                _os_log_impl(&dword_185066000, v55, OS_LOG_TYPE_ERROR, "\t\tCalling touchesMoved:withEvent: on view: %p (%@) with touches: %@", buf, 0x20u);

              }
            }
            objc_msgSend(v16, "touchesMoved:withEvent:", v20, v4);
            objc_msgSend(*v6, "_registerEstimatedTouches:event:forTouchable:", v20, v4, v16);
            objc_msgSend(v16, "_completeForwardingTouches:phase:event:", v20, 1, v4);
          }
          objc_msgSend(v4, "_touchesForResponder:withPhase:", v16, 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = qword_1EDDC8608;
          if (!qword_1EDDC8608)
          {
            v24 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v24, (unint64_t *)&qword_1EDDC8608);
          }
          if ((*(_BYTE *)v24 & 1) != 0)
          {
            v44 = *(NSObject **)(v24 + 8);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = v44;
              v46 = objc_msgSend(v23, "count");
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v46;
              _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_ERROR, "\t\tEnded touch count: %d", buf, 8u);

            }
          }
          if (objc_msgSend(v23, "count"))
          {
            v25 = qword_1EDDC8610;
            if (!qword_1EDDC8610)
            {
              v25 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v25, (unint64_t *)&qword_1EDDC8610);
            }
            v26 = v10;
            v27 = v6;
            if ((*(_BYTE *)v25 & 1) != 0)
            {
              v58 = *(NSObject **)(v25 + 8);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v59 = v58;
                v60 = (objc_class *)objc_opt_class();
                NSStringFromClass(v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v69;
                v83 = v16;
                v84 = 2112;
                v85 = v61;
                v86 = 2112;
                v87 = v23;
                _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_ERROR, "\t\tCalling touchesEnded:withEvent: on view: %p (%@) with touches: %@", buf, 0x20u);

              }
            }
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v28 = v23;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v74;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v74 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
                  if (v33)
                  {
                    v34 = *(_WORD *)(v33 + 236);
                    if ((v34 & 8) == 0)
                      *(_WORD *)(v33 + 236) = v34 | 8;
                  }
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
              }
              while (v30);
            }

            objc_msgSend(v16, "touchesEnded:withEvent:", v28, v4);
            v6 = v27;
            objc_msgSend(*v27, "_registerEstimatedTouches:event:forTouchable:", v28, v4, v16);
            objc_msgSend(v16, "_completeForwardingTouches:phase:event:", v28, 3, v4);
            v10 = v26;
            v7 = v70;
          }
          objc_msgSend(v4, "_touchesForResponder:withPhase:", v16, 4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = qword_1EDDC8618;
          if (!qword_1EDDC8618)
          {
            v36 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v36, (unint64_t *)&qword_1EDDC8618);
          }
          if ((*(_BYTE *)v36 & 1) != 0)
          {
            v47 = *(NSObject **)(v36 + 8);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = v47;
              v49 = objc_msgSend(v35, "count");
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v49;
              _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_ERROR, "\t\tCanceled touch count: %d", buf, 8u);

            }
          }
          if (objc_msgSend(v35, "count"))
          {
            v37 = qword_1EDDC8620;
            if (!qword_1EDDC8620)
            {
              v37 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v37, (unint64_t *)&qword_1EDDC8620);
            }
            if ((*(_BYTE *)v37 & 1) != 0)
            {
              v62 = *(NSObject **)(v37 + 8);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                v63 = v62;
                v64 = (objc_class *)objc_opt_class();
                NSStringFromClass(v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v69;
                v83 = v16;
                v84 = 2112;
                v85 = v65;
                v86 = 2112;
                v87 = v35;
                _os_log_impl(&dword_185066000, v63, OS_LOG_TYPE_ERROR, "\t\tCalling touchesCancelled on view: %p (%@) with touches: %@", buf, 0x20u);

              }
            }
            objc_msgSend(v16, "touchesCancelled:withEvent:", v35, v4);
            objc_msgSend(*v6, "_registerEstimatedTouches:event:forTouchable:", v35, v4, v16);
            objc_msgSend(v16, "_completeForwardingTouches:phase:event:", v35, 4, v4);
          }

          v14 = v71;
          v13 = v72;
        }
        ++v15;
      }
      while (v15 != v13);
      v66 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      v13 = v66;
    }
    while (v66);
  }

}

- (void)_fadeCalloutBarIfNeededForTouchInView:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "visible")
    && -[UIWindow _touchesInsideShouldHideCalloutBarForViewHierarchy:](self, "_touchesInsideShouldHideCalloutBarForViewHierarchy:", v9))
  {
    -[UIWindow _firstResponder](self, "_firstResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v5, "textInputView"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      v8 = v9;
      if ((id)v6 == v9)
        goto LABEL_12;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      if (v5 == v9)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "isDescendantOfView:", v5) & 1) == 0)
      objc_msgSend(v4, "fade");
    v8 = v7;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_updateToNotificationProvidedInterfaceOrientation:(int64_t)a3 animated:(BOOL)a4
{
  id WeakRetained;
  double v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int64_t viewOrientation;
  void *v16;
  int v17;
  uint64_t v18;
  CGFloat v19;
  void *v20;
  uint64_t v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  if (self->_viewOrientation == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
    if (WeakRetained)
    {
      if ((objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled") & 1) != 0)
      {
        if ((objc_msgSend(WeakRetained, "_isViewControllerInWindowHierarchy") & 1) == 0)
          -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)WeakRetained, a3);
      }
      else
      {
        v8 = WeakRetained;
        v9 = (uint64_t)v8;
        if (a3 == 2)
          v10 = 3.14159265;
        else
          v10 = 0.0;
        v11 = v8;
        do
        {
          objc_msgSend(v11, "presentedViewController");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
            break;
          v13 = (void *)v12;
          v14 = objc_msgSend(v11, "_lastKnownInterfaceOrientation");
          viewOrientation = self->_viewOrientation;

          if (v14 == viewOrientation)
            break;
          if (objc_msgSend(v11, "modalPresentationStyle") != 16
            && objc_msgSend(v11, "modalPresentationStyle") != 2
            && objc_msgSend(v11, "modalPresentationStyle") != 4
            && objc_msgSend(v11, "_isViewControllerInWindowHierarchy")
            && -[UIViewController __withSupportedInterfaceOrientation:apply:](v11, a3, 0))
          {
            objc_msgSend(v11, "presentedViewController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "_isViewControllerInWindowHierarchy");

            v18 = objc_msgSend(v11, "_lastKnownInterfaceOrientation");
            if (v17)
              objc_msgSend(v11, "window:willRotateToInterfaceOrientation:duration:", self, a3, 0.0);
            memset(&v23, 0, sizeof(v23));
            if (a3 == 1)
            {
              v19 = 0.0;
            }
            else if (a3 == 3)
            {
              v19 = 1.57079633;
            }
            else
            {
              v19 = v10;
              if (a3 == 4)
                v19 = -1.57079633;
            }
            CGAffineTransformMakeRotation(&v23, v19);
            *(float64x2_t *)&v23.a = vrndaq_f64(*(float64x2_t *)&v23.a);
            *(float64x2_t *)&v23.c = vrndaq_f64(*(float64x2_t *)&v23.c);
            *(float64x2_t *)&v23.tx = vrndaq_f64(*(float64x2_t *)&v23.tx);
            objc_msgSend(v11, "rotatingContentViewForWindow:", self);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v23;
            objc_msgSend(v20, "setTransform:", &v22);
            objc_msgSend(v11, "_centerForOrientation:", a3);
            objc_msgSend(v20, "setCenter:");
            objc_msgSend(v11, "_boundsForOrientation:", a3);
            objc_msgSend(v20, "setBounds:");
            if (v17)
            {
              objc_msgSend(v11, "window:willAnimateRotationToInterfaceOrientation:duration:", self, a3, 0.0);
              objc_msgSend(v11, "window:didRotateFromInterfaceOrientation:", self, v18);
            }

          }
          objc_msgSend(v11, "presentedViewController");
          v21 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v21;
        }
        while (v21);
        -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:](v9, a3);

      }
      if (-[UIWindow _windowControlsStatusBarOrientation](self, "_windowControlsStatusBarOrientation"))
        objc_msgSend((id)UIApp, "_setExpectedViewOrientation:", self->_viewOrientation);
    }

  }
  else
  {
    v7 = 0.0;
    if (a4)
      -[UIWindow _rotationDuration](self, "_rotationDuration", 0.0);
    -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", a3, 0, v7);
  }
}

void __39__UIWindow__noteOverlayInsetsDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_overlayInsets");
  objc_msgSend(v4, "setPrimaryWindowOverlayInsets:");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 440) = 0;
}

void __31__UIWindow__setFirstResponder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
    v4 = objc_msgSend(v3, "editingInteractionConfiguration");
  else
    v4 = 1;
  objc_msgSend(v5, "setEditingInteractionConfiguration:", v4);

}

- (id)_firstResponder
{
  return self->_firstResponder;
}

- (void)_setIsSettingFirstResponder:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)_isSettingFirstResponder
{
  return (*((unsigned __int8 *)&self->_windowFlags + 3) >> 2) & 1;
}

- (BOOL)_wantsResponderWithoutKeyboard
{
  return self->_wantsResponderWithoutKeyboard;
}

- (void)_setFirstResponder:(id)a3
{
  UIResponder *v5;
  UIResponder *v6;
  UIResponder *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t j;
  _QWORD v14[4];
  UIResponder *v15;
  _QWORD v16[2];
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (UIResponder *)a3;
  v6 = self->_firstResponder;
  if (v6 != v5)
  {
    +[UIView _setIsResponderAncestorOfFirstResponder:startingAtFirstResponder:]((uint64_t)UIView, 0, v6);
    if (_IsKindOfUIView((uint64_t)v6))
      *(_QWORD *)&v6[4]._responderFlags &= ~0x8000uLL;
    objc_storeStrong((id *)&self->_firstResponder, a3);
    if (_IsKindOfUIView((uint64_t)v5))
      *(_QWORD *)&v5[4]._responderFlags |= 0x8000uLL;
    +[UIView _setIsResponderAncestorOfFirstResponder:startingAtFirstResponder:]((uint64_t)UIView, 1, v5);
    v17 = xmmword_1E16DE6F8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((_DWORD *)&self->_windowFlags + 1) & 1);
    v16[0] = objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v16[1] = v7;
    if (v7)
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v17, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("UIWindowFirstResponderDidChangeNotification"), self, v9);

    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __31__UIWindow__setFirstResponder___block_invoke;
    v14[3] = &unk_1E16B2A58;
    v15 = v7;
    objc_msgSend(v11, "_updateUIClientSettingsWithBlock:", v14);

    for (i = 1; i != -1; --i)
    for (j = 8; j != -8; j -= 8)

  }
}

- (void)orderFront:(id)a3
{
  -[UIWindow setHidden:](self, "setHidden:", 0);
  if ((*(_BYTE *)&self->_windowFlags & 0x40) == 0)
    -[UIWindow makeKeyWindow](self, "makeKeyWindow");
}

- (void)setBecomeKeyOnOrderFront:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)isKeyWindow
{
  id *v3;
  UIWindow *v4;
  BOOL v5;

  if (qword_1EDDC8598 != -1)
    dispatch_once(&qword_1EDDC8598, &__block_literal_global_448);
  if (!_MergedGlobals_162)
    return -[UIWindow _isApplicationKeyWindow](self, "_isApplicationKeyWindow");
  -[UIWindow windowScene](self, "windowScene");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _keyWindow](v3);
  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self;

  return v5;
}

- (id)_rootForKeyResponderCycle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIWindow *v7;

  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_rootForKeyResponderCycle");
    v7 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
  }
  return v7;
}

- (void)_unregisterScrollToTopView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  if (qword_1EDDC85C0)
  {
    v9 = v4;
    CFDictionaryGetValue((CFDictionaryRef)qword_1EDDC85C0, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObject:", v9);

      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v6, "removePointerAtIndex:", v8);
    }

    v4 = v9;
  }

}

- (void)_updateConstraintsIfNeededWithViewForVariableChangeNotifications:(id)a3
{
  objc_super v5;

  if ((~*(_QWORD *)&self->super._viewFlags & 0x300000000000) != 0)
  {
    -[UIWindow _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
    v5.receiver = self;
    v5.super_class = (Class)UIWindow;
    -[UIView _updateConstraintsIfNeededWithViewForVariableChangeNotifications:](&v5, sel__updateConstraintsIfNeededWithViewForVariableChangeNotifications_, a3);
  }
}

- (id)_layoutEngineCreateIfNecessary
{
  id result;

  result = -[UIView _layoutEngine](self, "_layoutEngine");
  if (!result)
  {
    -[UIWindow _initializeLayoutEngine](self, "_initializeLayoutEngine");
    return -[UIView _layoutEngine](self, "_layoutEngine");
  }
  return result;
}

- (void)_initializeLayoutEngine
{
  -[UIWindow _initializeLayoutEngineDiscardingOldIfNeeded:](self, "_initializeLayoutEngineDiscardingOldIfNeeded:", 0);
}

- (void)_initializeLayoutEngineDiscardingOldIfNeeded:(BOOL)a3
{
  id v4;

  if (a3 || !-[UIView _layoutEngine](self, "_layoutEngine"))
  {
    -[UIView setAutoresizingMask:](self, "setAutoresizingMask:", 18);
    v4 = objc_alloc_init(MEMORY[0x1E0D156C8]);
    objc_msgSend(v4, "setEngineScalingCoefficients:", -[UIView _preferredLayoutEngineToUserScalingCoefficients](self));
    if (qword_1ECD790F0 != -1)
      dispatch_once(&qword_1ECD790F0, &__block_literal_global_47_4);
    if (byte_1ECD790B3)
      -[UIDevice _playSystemSound:](+[UIDevice currentDevice](UIDevice, "currentDevice"), "_playSystemSound:", 1150);
    objc_msgSend(v4, "setDelegate:", self);
    -[UIWindow _switchToLayoutEngine:](self, "_switchToLayoutEngine:", v4);

    if ((*(_QWORD *)&self->super._viewFlags & 0x200000000000) == 0)
      -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_switchToLayoutEngine:(id)a3
{
  objc_super v5;

  -[UIWindow _invalidateWindowInternalConstraints](self, "_invalidateWindowInternalConstraints");
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  -[UIView _switchToLayoutEngine:](&v5, sel__switchToLayoutEngine_, a3);
}

- (void)_didCreateRootPresentationController
{
  id v2;

  -[UIWindow _rootPresentationController](self, "_rootPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setWantsFullScreen:", 1);

}

- (void)_executeDeferredOrientationUpdate
{
  _QWORD *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[4];
  _QWORD *v12;

  -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)self);
  -[UIWindow _deferredOrientationUpdate](self, "_deferredOrientationUpdate");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))v3[4];
    if (v5)
    {
      v6 = v3[3];
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0D016B0];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __45__UIWindow__executeDeferredOrientationUpdate__block_invoke;
        v11[3] = &unk_1E16B3FD8;
        v12 = v3;
        objc_msgSend(v7, "tryAnimatingWithSettings:actions:completion:", v6, v11, 0);

      }
      else
      {
        v8 = v3[2];
        v9 = (void *)UIApp;
        v10 = v5;
        v5[2](v10, v8, objc_msgSend(v9, "_expectedViewOrientation"));

      }
      -[UIWindow _setDeferredOrientationUpdate:](self, "_setDeferredOrientationUpdate:", 0);
    }
  }

}

void __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  _QWORD *v23;
  _QWORD v24[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v23 = WeakRetained;
    objc_msgSend(WeakRetained, "_deferredOrientationUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_windowHostingScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowOrientationUpdate synchronizeDrawingWithFencesOnScene:]((uint64_t)v8, v9);

    v10 = (id *)v23;
    if ((v23[63] != a2 || a2 && *(_BYTE *)(a1 + 56))
      && (v11 = objc_msgSend(v23, "_shouldAutorotateToInterfaceOrientation:", a2), v10 = (id *)v23, v11))
    {
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)v23, a2, 1, *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40));
    }
    else
    {
      v12 = objc_loadWeakRetained(v10 + 56);
      v13 = v12;
      if (v12 && (objc_msgSend(v12, "_isViewControllerInWindowHierarchy") & 1) == 0)
        -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)v13, a2);

    }
    v14 = v23;
    if (!v23[63])
    {
      objc_msgSend(v23, "rootViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke_2;
      v24[3] = &unk_1E16B7A60;
      v24[4] = v23;
      v24[5] = a2;
      -[UIViewController __withSupportedInterfaceOrientation:apply:](v15, a2, v24);

      v14 = v23;
    }
    v16 = objc_msgSend(v14, "_windowControlsStatusBarOrientation");
    v7 = v23;
    if (v16)
    {
      v17 = objc_msgSend(v23, "_isStatusBarWindow");
      v7 = v23;
      if ((v17 & 1) == 0)
      {
        objc_msgSend(v23, "_windowHostingScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

        v7 = v23;
        if ((v19 & 1) == 0)
        {
          v20 = *(_QWORD *)(a1 + 48);
          if (v23[63] != v20 || v20 == 0)
            v22 = v23[63];
          else
            v22 = a3;
          objc_msgSend((id)UIApp, "_setExpectedViewOrientation:", v22);
          v7 = v23;
        }
      }
    }
  }

}

- (BOOL)_windowControlsStatusBarOrientation
{
  return (*((unsigned __int8 *)&self->_windowFlags + 3) >> 4) & 1;
}

- (void)_internal_setRotatableViewOrientation:(uint64_t)a3 updateStatusBar:(uint64_t)a4 duration:(double)a5 force:
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 56);
    if (WeakRetained)
    {
      objc_msgSend(a1, "_setRotatableClient:toOrientation:updateStatusBar:duration:force:isRotating:", WeakRetained, a2, a3, a4, 1, a5);
      -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)WeakRetained, a2);
    }
    objc_msgSend(a1, "_notifyRotatableViewOrientation:duration:", a2, a5);

  }
}

- (void)_notifyRotatableViewOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("_UIWindowContentWillRotateOrientationUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("_UIWindowContentWillRotateDurationUserInfoKey");
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_UIWindowContentWillRotateNotification"), self, v10);

}

- (void)_setRotatableClient:(id)a3 toOrientation:(int64_t)a4 updateStatusBar:(BOOL)a5 duration:(double)a6 force:(BOOL)a7 isRotating:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v11;
  id v14;
  id WeakRetained;
  _BOOL4 v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  double v27;
  double v28;
  UIWindow *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  int64_t v36;
  UIClientRotationContext *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  int64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  int v65;
  char v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  int64_t viewOrientation;
  int64_t v71;
  unsigned int v72;
  void *v73;
  void *v74;
  int v75;
  UIWindow *v76;
  _QWORD v77[5];
  id v78;
  BOOL v79;
  char v80;
  _QWORD v81[4];
  id v82;
  id v83;
  UIWindow *v84;
  int64_t v85;
  double v86;
  BOOL v87;
  char v88;
  char v89;
  BOOL v90;
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  UIWindow *v101;
  int64_t v102;
  int64_t v103;
  double v104;
  int v105;
  BOOL v106;
  _QWORD v107[5];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v119 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  v16 = WeakRetained == v14 && v8;

  v76 = self;
  viewOrientation = self->_viewOrientation;
  if (dyld_program_sdk_at_least())
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isViewLoaded") ^ 1;

  }
  else
  {
    v18 = 0;
  }
  if (v9)
    v19 = 1;
  else
    v19 = objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") ^ 1 | v18;
  v72 = v19;
  if (v11)
    v20 = objc_msgSend((id)UIApp, "_statusBarOrientationFollowsWindow:", v76);
  else
    v20 = 0;
  if (!objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled") || !v16)
  {
    if (v16)
    {
      -[UIWindow _clientsForRotation](v76, "_clientsForRotation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow __clientsForRotationCallbacks](v76, "__clientsForRotationCallbacks");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v23;
    }
    v73 = v23;
    if (objc_msgSend(v22, "count") == 1)
    {
      objc_msgSend(v22, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v22, "lastObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        viewOrientation = objc_msgSend(v26, "_lastKnownInterfaceOrientation");

      }
    }
    if (!v16 && (v20 & 1) == 0 && !v9)
      goto LABEL_91;
    if (viewOrientation != a4 || v9)
    {
      v67 = v16;
      v68 = v14;
      v65 = +[UIView _degreesToRotateFromInterfaceOrientation:toInterfaceOrientation:](UIView, "_degreesToRotateFromInterfaceOrientation:toInterfaceOrientation:", viewOrientation, a4);
      v27 = 0.0;
      if ((v72 & 1) == 0)
      {
        +[UIView _durationForRotationFromInterfaceOrientation:toInterfaceOrientation:withBaseDuration:](UIView, "_durationForRotationFromInterfaceOrientation:toInterfaceOrientation:withBaseDuration:", viewOrientation, a4, a6);
        v27 = v28;
      }
      v66 = v20;
      v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
      v29 = v76;
      v75 = (*(_QWORD *)&v76->_windowFlags & 0x20000) == 0;
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v69 = v22;
      v30 = v22;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v113;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v113 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
            v36 = a4;
            v37 = -[UIClientRotationContext initWithClient:toOrientation:duration:andWindow:]([UIClientRotationContext alloc], "initWithClient:toOrientation:duration:andWindow:", v35, a4, v29, v27);
            -[UIClientRotationContext contentView](v37, "contentView");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v29 = v76;
                v75 &= objc_msgSend(v35, "shouldWindowUseOnePartInterfaceRotationAnimation:", v76);
              }
              else
              {
                v75 = 0;
                v29 = v76;
              }
              objc_msgSend(v74, "addObject:", v37);
            }
            else
            {
              v29 = v76;
            }

            a4 = v36;
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
        }
        while (v32);
      }

      if ((v75 & 1) != 0
        || (NSLog(CFSTR("Two-stage rotation animation is deprecated. This application should use the smoother single-stage animation.")),
            v67)
        && (unint64_t)objc_msgSend(v74, "count") < 2)
      {
        if (objc_msgSend(v74, "count"))
        {
          v71 = a4;
          -[UIWindow beginDisablingInterfaceAutorotation](v29, "beginDisablingInterfaceAutorotation");
          if (v67)
          {
            v39 = 2048;
            if ((v75 & 1) == 0)
              v39 = 0;
            v29->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&v29->_windowFlags & 0xFFFFFFFFFFFFF7FFLL | v39);
          }
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          v40 = v74;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v109;
            do
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v109 != v43)
                  objc_enumerationMutation(v40);
                v45 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
                objc_msgSend(v45, "rotatingClient");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v73, "containsObject:", v46);
                v48 = 1;
                if (v47 && (v72 & 1) == 0)
                {
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v46, "window:willRotateToInterfaceOrientation:duration:", v29, v71, v27);
                    v48 = 0;
                  }
                  else
                  {
                    v48 = 1;
                  }
                }
                objc_msgSend(v45, "setSkipClientRotationCallbacks:", v48);

              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
            }
            while (v42);
          }

          v49 = v71;
          if (((!v67 | v72) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)MEMORY[0x1E0C99D80];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v71);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v52, CFSTR("UIWindowNewOrientationUserInfoKey"), 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillRotateNotification"), v76, v53);

            v29 = v76;
          }
          *(_QWORD *)&v29->_windowFlags |= 0x400uLL;
          if ((v75 & 1) != 0)
          {
            if (v27 > 0.0)
            {
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              v54 = v40;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v92, v116, 16);
              if (v55)
              {
                v56 = v55;
                v57 = *(_QWORD *)v93;
                do
                {
                  for (k = 0; k != v56; ++k)
                  {
                    if (*(_QWORD *)v93 != v57)
                      objc_enumerationMutation(v54);
                    v59 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
                    objc_msgSend(v59, "rotatingClient");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    v61 = objc_msgSend(v73, "containsObject:", v60);

                    v29 = v76;
                    if (v61)
                      objc_msgSend(v59, "setupRotationOrderingKeyboardInAfterRotation:", (*(_QWORD *)&v76->_windowFlags >> 18) & 1);
                  }
                  v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v92, v116, 16);
                }
                while (v56);
              }

              v49 = v71;
            }
            v62 = MEMORY[0x1E0C809B0];
            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_4;
            v91[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
            *(double *)&v91[4] = v27;
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_5;
            v81[3] = &unk_1E16DE650;
            v85 = v49;
            v82 = v40;
            v87 = v27 > 0.0;
            v83 = v73;
            v84 = v29;
            v88 = v66;
            v86 = v27;
            v89 = v72;
            v90 = v67;
            v77[0] = v62;
            v77[1] = 3221225472;
            v77[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_7;
            v77[3] = &unk_1E16B70E8;
            v77[4] = v29;
            v78 = v82;
            v79 = v27 > 0.0;
            v80 = v72;
            +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v27 > 0.0, v91, v81, v77);

            v63 = v82;
          }
          else
          {
            objc_msgSend(v40, "lastObject");
            v63 = (id)objc_claimAutoreleasedReturnValue();
            v64 = MEMORY[0x1E0C809B0];
            v107[0] = MEMORY[0x1E0C809B0];
            v107[1] = 3221225472;
            v107[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke;
            v107[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
            *(double *)&v107[4] = v27;
            v98[0] = MEMORY[0x1E0C809B0];
            v98[1] = 3221225472;
            v98[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_2;
            v98[3] = &unk_1E16DE628;
            v106 = v27 > 0.0;
            v99 = v40;
            v102 = viewOrientation;
            v105 = v65;
            v100 = v68;
            v101 = v29;
            v103 = v71;
            v104 = v27;
            v96[0] = v64;
            v96[1] = 3221225472;
            v96[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_3;
            v96[3] = &unk_1E16B2218;
            v96[4] = v29;
            v97 = v99;
            +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v27 > 0.0, v107, v98, v96);

          }
          v14 = v68;
          v22 = v69;
          goto LABEL_91;
        }
      }
      else
      {
        NSLog(&CFSTR("Using two-stage rotation animation is not supported when rotating more than one view controller or view c"
                     "ontrollers not the window delegate").isa);
      }

      v14 = v68;
    }
    else if (objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", v76) != a4)
    {
      v76->_viewOrientation = a4;
      if (objc_msgSend((id)UIApp, "_statusBarOrientationFollowsWindow:"))
        objc_msgSend((id)UIApp, "setStatusBarOrientation:animation:duration:", a4, 2, 0.0);
    }
LABEL_91:

    goto LABEL_92;
  }
  if (viewOrientation == a4 && !v9)
  {
    if (objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", v76) != a4)
    {
      v76->_viewOrientation = a4;
      if (objc_msgSend((id)UIApp, "_statusBarOrientationFollowsWindow:", v76))
        objc_msgSend((id)UIApp, "setStatusBarOrientation:animation:duration:", a4, 2, 0.0);
    }
  }
  else
  {
    -[UIWindow _rotateWindowToOrientation:updateStatusBar:duration:skipCallbacks:](v76, "_rotateWindowToOrientation:updateStatusBar:duration:skipCallbacks:", a4, v20, v72, a6);
  }
LABEL_92:

}

void __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  if (!*(_BYTE *)(a1 + 40))
  {
    v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("UIWindowOldOrientationUserInfoKey"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("UIWindowDidRotateNotification"), v5, v8);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 864);
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(*(id *)(a1 + 32), "endDisablingInterfaceAutorotation");
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    if ((objc_msgSend((id)v9, "_windowOwnsInterfaceOrientation") & 1) != 0)
      goto LABEL_12;
    if ((*(_BYTE *)(v9 + 588) & 0x20) != 0)
      goto LABEL_12;
    objc_msgSend((id)v9, "_deferredOrientationUpdate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_12;
    v11 = (void *)v10;
    objc_msgSend((id)v9, "_deferredOrientationUpdate");
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v13 = v12 ? v12[2] : 0;
    v14 = *(_QWORD *)(v9 + 872);

    if (v13 == v14)
    {
LABEL_12:
      objc_msgSend((id)v9, "_deferredOrientationUpdate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded](v9);
        objc_msgSend((id)v9, "_deferredOrientationUpdate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v9, "_windowHostingScene");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIWindowOrientationUpdate synchronizeDrawingWithFencesOnScene:]((uint64_t)v16, v17);

        objc_msgSend((id)v9, "_setDeferredOrientationUpdate:", 0);
      }
    }
    else
    {
      *(_QWORD *)(v9 + 584) |= 0x2000000000uLL;
      objc_msgSend((id)v9, "performSelector:withObject:afterDelay:", sel__executeDeferredOrientationUpdate, 0, 0.0);
    }
  }

}

- (_UIWindowOrientationUpdate)_deferredOrientationUpdate
{
  return self->_deferredOrientationUpdate;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  UIWindow *v15;
  void *v16;
  void *v17;
  objc_super v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    v14 = (void *)_UISetCurrentFallbackEnvironment(v12);
    v20.receiver = self;
    v20.super_class = (Class)UIWindow;
    v15 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
    _UIRestorePreviousFallbackEnvironment(v14);
    if (!v15)
      goto LABEL_9;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)UIWindow;
    v15 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
    if (!v15)
      goto LABEL_9;
  }
  -[UIView layer](v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  if (v13)
  {
    -[UIWindow _commonInitDebugName:uiScene:](v15, "_commonInitDebugName:uiScene:", v11, v13);
  }
  else
  {
    -[UIWindow _uiWindowSceneFromFBSScene:](v15, "_uiWindowSceneFromFBSScene:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _commonInitDebugName:uiScene:](v15, "_commonInitDebugName:uiScene:", v11, v17);

  }
  -[UIWindow _updateLayerOrderingAndSetLayerHidden:](v15, "_updateLayerOrderingAndSetLayerHidden:", 1);
  *(_QWORD *)&v15->_windowFlags |= 0x20uLL;
LABEL_9:

  return v15;
}

- (void)_updateLayerOrderingAndSetLayerHidden:(BOOL)a3
{
  -[UIWindow _updateLayerOrderingAndSetLayerHidden:actionBlock:](self, "_updateLayerOrderingAndSetLayerHidden:actionBlock:", a3, 0);
}

- (void)_commonInitDebugName:(id)a3 uiScene:(id)a4
{
  int v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  _QWORD *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  uint64_t v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  $B5B0456088C508EDB812873BE14D7A88 windowFlags;
  uint64_t v41;
  int64_t v42;
  void *v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44 = a4;
  _ensureDebugName(self, a3);
  v7 = objc_msgSend((id)objc_opt_class(), "_isSecure");
  v8 = 0x20000000;
  if (!v7)
    v8 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFDFFFFFFFLL | v8);
  if (!self->_traitCollection && dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 1192, CFSTR("UIWindow was improperly initialized without calling into a designated initializer on UIView"));

  }
  objc_msgSend(v44, "_attachWindow:", self);
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIView layer](self, "layer");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11[4] = self;

  }
  if ((*((_BYTE *)&self->_windowFlags + 3) & 0x40) == 0)
  {
    objc_msgSend(v44, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UIView frame](self, "frame");
    v47.origin.x = v21;
    v47.origin.y = v22;
    v47.size.width = v23;
    v47.size.height = v24;
    v45.origin.x = v14;
    v45.origin.y = v16;
    v45.size.width = v18;
    v45.size.height = v20;
    if (CGRectEqualToRect(v45, v47))
      v25 = 0x40000000;
    else
      v25 = 0;
    self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFBFFFFFFFLL | v25);

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[UIView frame](self, "frame");
    v48.origin.x = v35;
    v48.origin.y = v36;
    v48.size.width = v37;
    v48.size.height = v38;
    v46.origin.x = v28;
    v46.origin.y = v30;
    v46.size.width = v32;
    v46.size.height = v34;
    v39 = CGRectEqualToRect(v46, v48);
    windowFlags = self->_windowFlags;
    if (v39 | (*(unint64_t *)&windowFlags >> 30) & 1)
      v41 = 0x40000000;
    else
      v41 = 0;
    self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(v41 | *(_QWORD *)&windowFlags & 0xFFFFFFFFBFFFFFFFLL);

  }
  v42 = objc_msgSend(v44, "interfaceOrientation");
  if (-[UIScene _systemShellOwnsInterfaceOrientation](v44) && v42)
    self->_viewOrientation = v42;
  -[UIWindow _updateTransformLayer](self, "_updateTransformLayer");
  -[UIWindow _sceneBoundsDidChange](self, "_sceneBoundsDidChange");
  -[UIWindow _createSystemGestureGateGestureRecognizerIfNeeded](self, "_createSystemGestureGateGestureRecognizerIfNeeded");
  -[UIWindow _createOtherSystemGateGestureRecognizersIfNeeded](self, "_createOtherSystemGateGestureRecognizersIfNeeded");
  *(_QWORD *)&self->_windowFlags |= 0x10000000uLL;
  *(_QWORD *)((char *)&self->super._viewFlags + 20) &= ~0x2000000000uLL;

}

- (void)_setContextBinder:(id)a3
{
  objc_storeWeak((id *)&self->_contextBinder, a3);
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3 checkForDismissal:(BOOL)a4 isRotationDisabled:(BOOL *)a5
{
  _BOOL8 v6;
  uint64_t v9;
  void *v10;
  uint64_t (**v11)(void);
  int v12;
  BOOL v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD aBlock[5];

  v6 = a4;
  if (a5)
    *a5 = 0;
  if (!-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
    return 1;
  -[UIWindow _shouldPreventRotationHook](self, "_shouldPreventRotationHook");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[UIWindow _shouldPreventRotationHook](self, "_shouldPreventRotationHook"),
        v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        v12 = v11[2](),
        v11,
        v10,
        v12))
  {
    v13 = 0;
    if (a5)
      *a5 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
    objc_msgSend(WeakRetained, "_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[UIWindow rootViewController](self, "rootViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "_viewControllersWhoseOrientationsMustCoincide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__UIWindow__shouldAutorotateToInterfaceOrientation_checkForDismissal_isRotationDisabled___block_invoke;
    aBlock[3] = &__block_descriptor_40_e29_B24__0__UIViewController_8q16l;
    aBlock[4] = a5;
    v17 = _Block_copy(aBlock);
    v18 = v17;
    if (v16)
      v19 = +[UIViewController _allViewControllersInArray:allowAutorotationToInterfaceOrientation:predicate:](UIViewController, "_allViewControllersInArray:allowAutorotationToInterfaceOrientation:predicate:", v16, a3, v17);
    else
      v19 = (*((uint64_t (**)(void *, void *, int64_t))v17 + 2))(v17, v15, a3);
    v13 = v19;

  }
  return v13;
}

- (void)_setDeferredOrientationUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_deferredOrientationUpdate, a3);
}

- (BOOL)_isStatusBarWindow
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return -[UIWindow _shouldAutorotateToInterfaceOrientation:checkForDismissal:isRotationDisabled:](self, "_shouldAutorotateToInterfaceOrientation:checkForDismissal:isRotationDisabled:", a3, +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"), 0);
}

- (void)_invalidateDeferredOrientationUpdate
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "_deferredOrientationUpdate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowOrientationUpdate invalidateFences]((uint64_t)v2);

    -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)v1);
    return (void *)objc_msgSend(v1, "_setDeferredOrientationUpdate:", 0);
  }
  return result;
}

- (uint64_t)_cancelEnqueuedDeferredOrientationUpdateIfNeeded
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 588) & 0x20) != 0)
    {
      result = objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", result, sel__executeDeferredOrientationUpdate, 0);
      *(_QWORD *)(v1 + 584) &= ~0x2000000000uLL;
    }
  }
  return result;
}

- (void)_updateToInterfaceOrientation:(int64_t)a3 animated:(BOOL)a4
{
  double v6;

  v6 = 0.0;
  if (a4)
    -[UIWindow _rotationDuration](self, "_rotationDuration", 0.0);
  -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", a3, 0, v6);
}

- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  -[_UISceneUIWindowHosting _FBSScene](self->_windowHostingScene, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 != v6)
    goto LABEL_3;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_3:
    if (v6)
    {
      v12 = v6;
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    -[UIWindow _sceneBounds](self, "_sceneBounds");
    -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", -[UIWindow interfaceOrientation](self, "interfaceOrientation"), v13, 0, v14, v15);
    -[UIWindow rootViewController](self, "rootViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "__willChangeToIdiom:onScreen:", objc_msgSend(v6, "_userInterfaceIdiom"), v6);

    -[UIView _willChangeToIdiomOnScreen:traverseHierarchy:](self, v6, 1);
    if (-[UIWindow _shouldPrepareScreenForWindow](self, "_shouldPrepareScreenForWindow"))
      objc_msgSend(v13, "_prepareForWindow");
    v17 = -[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess");
    -[_UISceneUIWindowHosting session](self->_windowHostingScene, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "role");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

    if (!v17 && v20)
    {
      objc_msgSend(v13, "bounds");
      -[UIWindow setFrame:](self, "setFrame:");
      *(_QWORD *)&self->_windowFlags |= 0x40000000uLL;
    }
    -[UIWindow _sceneBoundsDidChange](self, "_sceneBoundsDidChange");
    if (!-[UIView isHidden](self, "isHidden") && (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
      -[UIWindow _updateLayerOrderingAndSetLayerHidden:](self, "_updateLayerOrderingAndSetLayerHidden:", 0);
    objc_msgSend(v29, "scale");
    v22 = v21;
    objc_msgSend(v6, "scale");
    if (v22 != v23)
    {
      -[UIView _layoutEngine](self, "_layoutEngine");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        -[UIView _rebuildLayoutFromScratch](self);
    }
    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

    if (v26)
      _UIViewRecursivelyApplyBlockToSubtreesWithMotionEffects(self, &__block_literal_global_970);
    else
      -[UIView _recursivelyConsiderResumingMotionEffects](self);
    -[UIWindow _updateWindowTraitsAndNotify:](self, "_updateWindowTraitsAndNotify:", 1);
    -[UIView _didChangeFromIdiomOnScreen:traverseHierarchy:](self, v29, 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v6, CFSTR("UIWindowNewScreenUserInfoKey"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("UIWindowDidMoveToScreenNotification"), self, v28);

    _UIPencilEventRequestBarrelFocusIfAbleForWindow(self, 1);
    if (objc_msgSend(v6, "_userInterfaceIdiom") == 3)
      -[UIWindow setAutorotates:forceUpdateInterfaceOrientation:](self, "setAutorotates:forceUpdateInterfaceOrientation:", 0, 0);

  }
}

- (id)_rootViewConstraintsUpdateIfNecessaryForView:(id)a3
{
  id v5;
  UIWindow *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 2373, CFSTR("Trying to create rootViewConstraints for a view that isn't a subview of the window"));

  }
  -[UIWindow _rootViewConstraints](self, "_rootViewConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  v8 = v7;
  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v9 = (void *)objc_msgSend((id)objc_msgSend(v9, "firstItem"), "_referenceView");
  v11 = v9;

  if (v11 != v5)
  {
    -[UIWindow _setRootViewConstraints:](self, "_setRootViewConstraints:", 0);

LABEL_8:
    v12 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, self, 3, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 1, 0, self, 1, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, self, 4, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 2, 0, self, 2, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObjects:", v13, v14, v15, v16, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWindow _setRootViewConstraints:](self, "_setRootViewConstraints:", v8);
  }
  -[UIWindow _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight](self, "_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight");

  return v8;
}

- (void)_updateSystemConstraints
{
  objc_super v3;

  -[UIWindow _updateWindowEngineHostConstraintsWithSizing:](self, "_updateWindowEngineHostConstraintsWithSizing:", (*(_QWORD *)&self->super._viewFlags & 0x20000000000000) == 0);
  -[UIWindow _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight](self, "_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight");
  v3.receiver = self;
  v3.super_class = (Class)UIWindow;
  -[UIView _updateSystemConstraints](&v3, sel__updateSystemConstraints);
}

- (void)_setRootViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 784);
}

- (NSArray)_rootViewConstraints
{
  return self->_rootViewConstraints;
}

- (void)_windowInternalConstraints_centerDidChange
{
  NSArray *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v3 = -[UIWindow _windowInternalConstraints](self, "_windowInternalConstraints");
  v4 = -[NSArray count](v3, "count");
  if (v4 == -[UIWindow _expectedWindowInternalConstraintsCount](self, "_expectedWindowInternalConstraintsCount"))
  {
    if ((dyld_program_sdk_at_least() & 1) == 0
      && (!self
       || !-[UIView _forceLayoutEngineSolutionInRationalEdges](self, "_forceLayoutEngineSolutionInRationalEdges")))
    {
      -[UIView center](self, "center");
      v6 = v5;
      objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "setConstant:", v7);
      objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 1), "setConstant:", v6);
    }
  }
  else
  {
    -[UIWindow _invalidateWindowInternalConstraints](self, "_invalidateWindowInternalConstraints");
  }
}

- (unint64_t)_expectedWindowInternalConstraintsCount
{
  if ((*(_QWORD *)&self->super._viewFlags & 0x20000000000000) != 0)
    return 2;
  else
    return 4;
}

- (void)_windowInternalConstraints_sizeDidChange
{
  NSArray *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  if ((*(_QWORD *)&self->super._viewFlags & 0x20000000000000) == 0)
  {
    v3 = -[UIWindow _windowInternalConstraints](self, "_windowInternalConstraints");
    v4 = -[NSArray count](v3, "count");
    if (v4 == -[UIWindow _expectedWindowInternalConstraintsCount](self, "_expectedWindowInternalConstraintsCount"))
    {
      -[UIView bounds](self, "bounds");
      v6 = v5;
      objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 2), "setConstant:", v7);
      objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 3), "setConstant:", v6);
    }
    else
    {
      -[UIWindow _invalidateWindowInternalConstraints](self, "_invalidateWindowInternalConstraints");
    }
  }
}

- (void)_invalidateWindowInternalConstraints
{
  NSArray *v3;

  v3 = -[UIWindow _windowInternalConstraints](self, "_windowInternalConstraints");
  if (v3)
  {
    -[UIView removeConstraints:](self, "removeConstraints:", v3);
    -[UIWindow _setWindowInternalConstraints:](self, "_setWindowInternalConstraints:", 0);
    -[UIView _setNeedsUpdateConstraints](self, "_setNeedsUpdateConstraints");
  }
}

- (void)_updateWindowEngineHostConstraintsWithSizing:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v5;
  void *v6;
  _UIWindowAnchoringConstraint *v7;
  double v8;
  UIWindow *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  double v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  v5 = -[UIWindow _windowInternalConstraints](self, "_windowInternalConstraints");
  if (!v5)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0
      || self && -[UIView _forceLayoutEngineSolutionInRationalEdges](self, "_forceLayoutEngineSolutionInRationalEdges"))
    {
      v6 = (void *)MEMORY[0x1E0C99DE8];
      v7 = +[_UIWindowAnchoringConstraint constraintWithItem:attribute:relatedBy:constant:](_UIWindowAnchoringConstraint, "constraintWithItem:attribute:relatedBy:constant:", self, 32, 0, 0.0);
      v8 = 0.0;
      v9 = self;
      v10 = 33;
    }
    else
    {
      -[UIView center](self, "center");
      v12 = v11;
      v6 = (void *)MEMORY[0x1E0C99DE8];
      v7 = +[_UIWindowAnchoringConstraint constraintWithItem:attribute:relatedBy:constant:](_UIWindowAnchoringConstraint, "constraintWithItem:attribute:relatedBy:constant:", self, 34, 0);
      v9 = self;
      v10 = 35;
      v8 = v12;
    }
    v5 = (NSArray *)objc_msgSend(v6, "arrayWithObjects:", v7, +[_UIWindowAnchoringConstraint constraintWithItem:attribute:relatedBy:constant:](_UIWindowAnchoringConstraint, "constraintWithItem:attribute:relatedBy:constant:", v9, v10, 0, v8), 0);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(v5);
          v17 = *(_QWORD **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (v17)
            v17[10] = self;
          -[UIView _layoutEngine_didAddLayoutConstraint:roundingAdjustment:mutuallyExclusiveConstraints:](self, v17, 0, 0.0);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v14);
    }
    -[UIWindow _setWindowInternalConstraints:](self, "_setWindowInternalConstraints:", v5);
  }
  if (-[NSArray count](v5, "count") == 4 && !v3)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", -[NSArray objectAtIndex:](v5, "objectAtIndex:", 2), -[NSArray objectAtIndex:](v5, "objectAtIndex:", 3), 0);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          -[UIView _layoutEngine_willRemoveLayoutConstraint:](self, *(void **)(*((_QWORD *)&v37 + 1) + 8 * j));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v20);
    }
    v5 = (NSArray *)-[NSArray arrayByExcludingObjectsInArray:](v5, "arrayByExcludingObjectsInArray:", v18);
    -[UIWindow _setWindowInternalConstraints:](self, "_setWindowInternalConstraints:", v5);
  }
  if (-[NSArray count](v5, "count") == 2 && v3)
  {
    -[UIView bounds](self, "bounds");
    v24 = v23;
    v25 = (void *)MEMORY[0x1E0C99D20];
    v27 = objc_msgSend(MEMORY[0x1E0D156B0], "constraintWithItem:attribute:relatedBy:constant:", self, 7, 0, v26);
    v28 = (void *)objc_msgSend(v25, "arrayWithObjects:", v27, objc_msgSend(MEMORY[0x1E0D156B0], "constraintWithItem:attribute:relatedBy:constant:", self, 8, 0, v24), 0);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(v28);
          -[UIView _layoutEngine_didAddLayoutConstraint:roundingAdjustment:mutuallyExclusiveConstraints:](self, *(void **)(*((_QWORD *)&v33 + 1) + 8 * k), 0, 0.0);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v30);
    }
    -[UIWindow _setWindowInternalConstraints:](self, "_setWindowInternalConstraints:", -[NSArray arrayByAddingObjectsFromArray:](v5, "arrayByAddingObjectsFromArray:", v28));
  }
}

- (void)_setWindowInternalConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (NSArray)_windowInternalConstraints
{
  return self->_windowInternalConstraints;
}

- (CGRect)convertRect:(CGRect)rect toWindow:(UIWindow *)window
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  if (window)
  {
    -[UIWindow convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    -[UIView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toLayer:", self->_transformLayer, x, y, width, height);
    v10 = v18;
    v12 = v19;
    v14 = v20;
    v16 = v21;

  }
  v22 = v10;
  v23 = v12;
  v24 = v14;
  v25 = v16;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSArray *rootViewConstraints;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_rootViewConstraints;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "setConstant:", 0.0, (_QWORD)v22);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  v8 = objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", self);
  __UIStatusBarManagerForWindow(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultStatusBarHeightInOrientation:", v8);
  v11 = v10;

  __UIStatusBarManagerForWindow(self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultStatusBarHeightInOrientation:", 1);
  v14 = v13;

  switch(v8)
  {
    case 1:
      rootViewConstraints = self->_rootViewConstraints;
      v16 = 0;
      goto LABEL_14;
    case 2:
      v17 = self->_rootViewConstraints;
      v18 = 2;
      goto LABEL_12;
    case 3:
      v17 = self->_rootViewConstraints;
      v18 = 3;
LABEL_12:
      -[NSArray objectAtIndex:](v17, "objectAtIndex:", v18, (_QWORD)v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = v14 - v11;
      goto LABEL_15;
    case 4:
      rootViewConstraints = self->_rootViewConstraints;
      v16 = 1;
LABEL_14:
      -[NSArray objectAtIndex:](rootViewConstraints, "objectAtIndex:", v16, (_QWORD)v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = v11 - v14;
LABEL_15:
      if (v11 == 0.0)
        v21 = 0.0;
      objc_msgSend(v19, "setConstant:", v21);

      break;
    default:
      return;
  }
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 1;
}

+ (BOOL)shouldRestrictViewsForSplashboard
{
  return _shouldRestrictViewsForSplashboard;
}

- (void)_removeAllViewControllersFromWindowHierarchyFromDealloc:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  UIWindow *v11;
  void *v12;
  UIViewController *WeakRetained;
  UIViewController *rootViewController;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    if (v3)
    {
      -[UIWindow rootViewController](self, "rootViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_prepareForWindowDealloc");

    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke;
      v27[3] = &unk_1E16B1B28;
      v27[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v27);
    }
  }
  -[UIWindow _rootPresentationController](self, "_rootPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIWindow _rootPresentationController](self, "_rootPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "presented");

    if (v8)
    {
      if (v3)
      {
        -[UIWindow _rootPresentationController](self, "_rootPresentationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_prepareForWindowDeallocRecursively:", 0);

      }
      else
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke_2;
        v26[3] = &unk_1E16B1B28;
        v26[4] = self;
        +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v26);
      }
    }
    -[UIWindow _setRootPresentationController:](self, "_setRootPresentationController:", 0);
  }
  else if (-[UIViewController isViewLoaded](self->_rootViewController, "isViewLoaded"))
  {
    -[UIViewController view](self->_rootViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    if (v11 == self)
    {
      -[UIViewController view](self->_rootViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

    }
  }
  WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_delegateViewController);
  rootViewController = self->_rootViewController;

  if (WeakRetained == rootViewController)
    -[UIWindow _setDelegateViewController:](self, "_setDelegateViewController:", 0);
  -[UIView subviews](self, "subviews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {

        }
        else
        {
          NSClassFromString(CFSTR("UIDimmingView"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        objc_msgSend(v20, "removeFromSuperview");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v17);
  }

}

void __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)_setRootPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_rootPresentationController, a3);
}

void __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke_2(uint64_t a1)
{
  void *v2;
  UIViewControllerBuiltinTransitionViewAnimator *v3;

  v3 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_rootPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissWithAnimationController:interactionController:animated:handoffData:", v3, 0, 0, 0);

}

- (void)_makeKeyWindowIgnoringOldKeyWindow:(char)a3 transferringScenes:
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  id *v12;

  if (a1)
  {
    v6 = (void *)a1[101];
    if (v6
      && (objc_msgSend(v6, "session"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "role"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleCarPlay")),
          v8,
          v7,
          v9))
    {
      v10 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow, (uint64_t)CFSTR("AllowCarPlayScenesToCallMakeKeyWindow"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      if (byte_1EDDA7D44)
        v11 = v10;
      else
        v11 = 1;
      if ((a3 & 1) != 0)
        goto LABEL_11;
    }
    else
    {
      v11 = 0;
      if ((a3 & 1) != 0)
      {
LABEL_11:
        if (((objc_msgSend(a1, "canBecomeKeyWindow") ^ 1 | v11) & 1) == 0)
        {
          objc_msgSend(a1, "windowScene");
          v12 = (id *)objc_claimAutoreleasedReturnValue();
          -[UIWindowScene _pushKeyWindow:ignoringOldKeyWindow:](v12, a1, a2);

        }
        return;
      }
    }
    if ((objc_msgSend(a1, "_isApplicationKeyWindow") & 1) != 0)
      return;
    goto LABEL_11;
  }
}

- (BOOL)_isApplicationKeyWindow
{
  id *v3;
  UIWindow *v4;

  +[_UIKeyWindowEvaluator sharedEvaluator](_UIKeyWindowEvaluator, "sharedEvaluator");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyWindowEvaluator applicationKeyWindow](v3);
  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == self;

  return (char)self;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

+ (id)_externalKeyWindow
{
  return (id)qword_1EDDC85A8;
}

- (id)_responderForKeyEvents
{
  void *v3;
  int v4;
  void *v5;
  UIWindow *v6;
  UIWindow *v7;
  void *v8;
  void *v9;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "syncsFocusAndResponder");

  if (v4)
  {
    -[UIView _focusSystem](self, "_focusSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_preferredFirstResponder");
    v6 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    -[UIWindow _responderWindow](v6, "_responderWindow");
    v7 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      if (v6)
        return v6;
    }
    else
    {

    }
  }
  if (!_AXSFullKeyboardAccessEnabled()
    || _AXSFullKeyboardAccessPassthroughModeEnabled()
    || (-[UIWindow _focusResponder](self, "_focusResponder"),
        (v6 = (UIWindow *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIWindow firstResponder](self, "firstResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_responderForEditing");
    v6 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[UIWindow _deepestActionResponder](self, "_deepestActionResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_responderForEditing");
      v6 = (UIWindow *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        v6 = self;
    }
  }
  return v6;
}

- (id)_debugName
{
  return (id)-[NSString copy](self->_debugName, "copy");
}

- (void)_resignApplicationKeyWindowStatus
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissCurrentMenu");

    objc_msgSend(v1, "firstResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_windowResignedKey");

    objc_msgSend(v1, "_focusSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_focusedItemIsContainedInEnvironment:includeSelf:", v1, 1))
    {
      objc_msgSend(v4, "focusedItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_setRememberedFocusedItem:", v5);

    }
    if ((objc_msgSend(v1, "_windowOwnsInterfaceOrientation") & 1) == 0
      && objc_msgSend(v1, "_windowOwnsInterfaceOrientationTransform")
      && (objc_msgSend(v1, "isHidden") & 1) == 0)
    {
      objc_msgSend(v1, "windowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_computeMetricsForWindows:animated:", v7, 0);

    }
  }
}

- (BOOL)_isRemoteInputHostWindow
{
  return 0;
}

- (int64_t)_fromWindowOrientation
{
  return self->_fromWindowOrientation;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIWindow;
  -[UIView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[_UISceneUIWindowHosting _focusSystemSceneComponent](self->_windowHostingScene, "_focusSystemSceneComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIWindow traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");
    v9 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v8 != v9 || !self->_focusEventRecognizer)
    {
      -[UIWindow _removeFocusEventRecognizer](self, "_removeFocusEventRecognizer");
      -[UIWindow _installFocusEventRecognizer](self, "_installFocusEventRecognizer");
    }
  }
  else
  {
    -[UIWindow _removeFocusEventRecognizer](self, "_removeFocusEventRecognizer");
  }
  -[UIWindow _configurePassthroughInteractionIfNeeded]((id *)&self->super.super.super.isa);

}

- (void)_removeFocusEventRecognizer
{
  _UIFocusEventRecognizer *focusEventRecognizer;

  -[_UIFocusEventRecognizer reset](self->_focusEventRecognizer, "reset");
  focusEventRecognizer = self->_focusEventRecognizer;
  self->_focusEventRecognizer = 0;

}

+ (BOOL)_allWindowsKeepContextInBackground
{
  return __allWindowsKeepContextInBackground;
}

- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  UIViewController *WeakRetained;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  CGRect v39;
  CGRect v40;

  -[UIView frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v9 == 0.0 || (dyld_program_sdk_at_least() & 1) != 0)
  {
    -[UIWindow windowScene](self, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "interfaceOrientation")
      || (v16 = objc_msgSend(v15, "interfaceOrientation"),
          v16 == -[UIWindow interfaceOrientation](self, "interfaceOrientation")))
    {
      objc_msgSend(v15, "_coordinateSpace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v40.origin.x = v8;
      v40.origin.y = v10;
      v40.size.width = v12;
      v40.size.height = v14;
      v18 = CGRectEqualToRect(v39, v40);

      if (v18)
      {
        WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_delegateViewController);
        self->_lastPropagatedStatusBarHeight = a4;
        if (WeakRetained)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (WeakRetained == self->_rootViewController)
              -[UIViewController window:statusBarWillChangeFromHeight:toHeight:](WeakRetained, "window:statusBarWillChangeFromHeight:toHeight:", self, a3, a4);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[UIView bounds](self, "bounds");
            v24 = v23;
            v26 = v25 + 0.0;
            v28 = v27 + a3;
            v30 = v29 - (a3 + 0.0);
            -[UIView bounds](self, "bounds");
            -[UIViewController window:willAnimateFromContentFrame:toContentFrame:](WeakRetained, "window:willAnimateFromContentFrame:toContentFrame:", self, v26, v28, v24, v30, v31 + 0.0, v32 + a4, v34, v33 - (a4 + 0.0));
          }
        }

      }
    }

  }
  else
  {
    __UIStatusBarManagerForWindow(self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "statusBarHeight");
    v22 = v21;

    -[UIWindow setFrame:](self, "setFrame:", v8, v10 + v22 - v10, v12, v14 - (v22 - v10));
  }
  if (dyld_program_sdk_at_least())
  {
    if (-[UIViewController isViewLoaded](self->_rootViewController, "isViewLoaded"))
    {
      -[UIViewController view](self->_rootViewController, "view");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = (void *)v35;
        -[UIViewController view](self->_rootViewController, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "translatesAutoresizingMaskIntoConstraints");

        if ((v38 & 1) == 0)
        {
          -[UIView _setNeedsUpdateConstraints](self, "_setNeedsUpdateConstraints");
          -[UIView layoutIfNeeded](self, "layoutIfNeeded");
        }
      }
    }
  }
}

- (id)_rotationViewControllers
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  objc_msgSend(v3, "arrayWithObjects:", WeakRetained, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableArray count](self->_rotationViewControllers, "count"))
  {
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", self->_rotationViewControllers);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (int64_t)_orientationInSceneSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  -[UIWindow windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cachedInterfaceOrientation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "_cachedInterfaceOrientation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    objc_msgSend(v5, "_effectiveSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "interfaceOrientation");
  }
  v9 = v8;

  return v9;
}

- (void)addKeyboardLayoutGuideIfNeeded:(id)a3
{
  id v4;
  NSMutableArray *currentKeyboardTrackingLayoutGuides;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  currentKeyboardTrackingLayoutGuides = self->_currentKeyboardTrackingLayoutGuides;
  v10 = v4;
  if (!currentKeyboardTrackingLayoutGuides)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_currentKeyboardTrackingLayoutGuides;
    self->_currentKeyboardTrackingLayoutGuides = v6;

    v4 = v10;
    currentKeyboardTrackingLayoutGuides = self->_currentKeyboardTrackingLayoutGuides;
  }
  if ((-[NSMutableArray containsObject:](currentKeyboardTrackingLayoutGuides, "containsObject:", v4) & 1) == 0)
  {
    -[UIWindow _primaryKeyboardTrackingGuide](self, "_primaryKeyboardTrackingGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstrainedToWindowGuide:", 1);
    objc_msgSend(v10, "constrainToReference:", v8);
    -[UITrackingLayoutGuide trackConstraintsFromViewBasedGuide:](self->_primaryKeyboardTrackingGuide, "trackConstraintsFromViewBasedGuide:", v10);
    -[UIKeyboardLayoutGuide inheritOptionsFromGuide:](self->_primaryKeyboardTrackingGuide, "inheritOptionsFromGuide:", v10);
    -[NSMutableArray addObject:](self->_currentKeyboardTrackingLayoutGuides, "addObject:", v10);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "refreshKeyboardLayoutGuide");

  }
}

- (UIKeyboardLayoutGuide)_primaryKeyboardTrackingGuide
{
  UIKeyboardLayoutGuide *primaryKeyboardTrackingGuide;
  UIKeyboardLayoutGuide *v4;
  UIKeyboardLayoutGuide *v5;
  void *v6;
  unint64_t v7;
  UIKeyboardLayoutGuide *v8;
  UIWindow *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIKeyboardLayoutGuide *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
  if (!primaryKeyboardTrackingGuide)
  {
    v4 = objc_alloc_init(UIKeyboardLayoutGuide);
    v5 = self->_primaryKeyboardTrackingGuide;
    self->_primaryKeyboardTrackingGuide = v4;

    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_primaryKeyboardTrackingGuide);
    -[UILayoutGuide _setLockedToOwningView:](self->_primaryKeyboardTrackingGuide, "_setLockedToOwningView:", 1);
    -[UILayoutGuide _setAllowsNegativeDimensions:](self->_primaryKeyboardTrackingGuide, "_setAllowsNegativeDimensions:", 1);
    -[UILayoutGuide setIdentifier:](self->_primaryKeyboardTrackingGuide, "setIdentifier:", CFSTR("UIWindow_KeyboardLayoutGuide"));
    -[UIKeyboardLayoutGuide setWindowGuide:](self->_primaryKeyboardTrackingGuide, "setWindowGuide:", 1);
    primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
  }
  -[UILayoutGuide _systemConstraints](primaryKeyboardTrackingGuide, "_systemConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= 3)
  {
    v8 = self->_primaryKeyboardTrackingGuide;
    v9 = self;
    -[UILayoutGuide widthAnchor](v8, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](v9, "bounds");
    objc_msgSend(v10, "constraintEqualToConstant:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIdentifier:", CFSTR("UIKeyboardLayoutGuide-width"));
    -[UILayoutGuide leftAnchor](self->_primaryKeyboardTrackingGuide, "leftAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v9, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIdentifier:", CFSTR("UIKeyboardLayoutGuide-leftOffset"));
    -[UIView bottomAnchor](v9, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_primaryKeyboardTrackingGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setIdentifier:", CFSTR("UIKeyboardLayoutGuide-bottomOffset"));
    -[UILayoutGuide heightAnchor](self->_primaryKeyboardTrackingGuide, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow insetForDismissedKeyboardGuide](v9, "insetForDismissedKeyboardGuide");
    objc_msgSend(v19, "constraintEqualToConstant:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setIdentifier:", CFSTR("UIKeyboardLayoutGuide-height"));
    v21 = self->_primaryKeyboardTrackingGuide;

    v29[0] = v12;
    v29[1] = v15;
    v29[2] = v18;
    v29[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v21, "_setSystemConstraints:", v22);

  }
  -[UILayoutGuide _systemConstraints](self->_primaryKeyboardTrackingGuide, "_systemConstraints");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isActive");

  if ((v25 & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](self->_primaryKeyboardTrackingGuide, "_systemConstraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v27);

  }
  return self->_primaryKeyboardTrackingGuide;
}

- (double)insetForDismissedKeyboardGuide
{
  double v3;
  double v4;

  v3 = 0.0;
  if (-[UIWindow isTrackingKeyboard](self, "isTrackingKeyboard")
    && !-[UIKeyboardLayoutGuide ignoresSafeArea](self->_primaryKeyboardTrackingGuide, "ignoresSafeArea"))
  {
    -[UIWindow safeAreaInsets](self, "safeAreaInsets");
    return v4;
  }
  return v3;
}

- (void)_addWindowLevelChangedObserver:(id)a3
{
  id v4;
  NSHashTable *windowLevelObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    windowLevelObservers = self->_windowLevelObservers;
    v8 = v4;
    if (!windowLevelObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_windowLevelObservers;
      self->_windowLevelObservers = v6;

      windowLevelObservers = self->_windowLevelObservers;
    }
    -[NSHashTable addObject:](windowLevelObservers, "addObject:", v8);
    v4 = v8;
  }

}

- (UIWindow)init
{
  _QWORD *v3;
  UIWindow *v4;
  void *v5;
  UIWindow *v6;
  objc_super v8;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v3 = -[UIWindow _initWithOrientation:](self, "_initWithOrientation:", objc_msgSend((id)UIApp, "_carefulChoiceOrientation"));
    v4 = (UIWindow *)v3;
    if (v3)
    {
      v3[73] &= ~0x20uLL;
      *(_QWORD *)((char *)v3 + 124) &= ~0x2000000000uLL;
      +[UIColor _windowBackgroundColor](UIColor, "_windowBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

      -[UIWindow setResizesToFullScreen:](v4, "setResizesToFullScreen:", 1);
      -[UIWindow _resizeWindowToFullScreenIfNecessary](v4, "_resizeWindowToFullScreenIfNecessary");
      *(_QWORD *)&v4->_windowFlags |= 0x20uLL;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWindow;
    v4 = -[UIView init](&v8, sel_init);
  }
  v6 = v4;

  return v6;
}

- (void)setResizesToFullScreen:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (double)_rotationDuration
{
  int v3;
  _BOOL4 v4;
  double result;

  if (dyld_program_sdk_at_least())
    v3 = objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") ^ 1;
  else
    v3 = 0;
  v4 = ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0
     || objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    && (unint64_t)-[_UISceneUIWindowHosting activationState](self->_windowHostingScene, "activationState") > 1;
  if (((v3 | v4) & 1) != 0)
    return 0.0;
  objc_msgSend((id)UIApp, "windowRotationDuration");
  return result;
}

+ (void)_executeDeferredOrientationUpdates
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_self(), "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v6;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "_executeDeferredOrientationUpdate");
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    }
    while (v2);
  }

}

- (void)_updateInterfaceOrientationFromActiveInterfaceOrientation:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if (-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
  {
    v5 = objc_msgSend((id)UIApp, "activeInterfaceOrientation");
    if (v5)
      -[UIWindow _updateToNotificationProvidedInterfaceOrientation:animated:](self, "_updateToNotificationProvidedInterfaceOrientation:animated:", v5, v3);
  }
}

- (void)_setShouldPreventRotationHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 888);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v6 = a4;
  if (sel_undo_ == a3)
  {
    -[UIWindow firstResponder](self, "firstResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canUndo");
LABEL_6:
    v7 = v10;

    goto LABEL_7;
  }
  if (sel_redo_ == a3)
  {
    -[UIWindow firstResponder](self, "firstResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canRedo");
    goto LABEL_6;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIWindow;
  v7 = -[UIView canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
LABEL_7:

  return v7;
}

- (void)_updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIWindow isInterfaceAutorotationDisabled](self, "isInterfaceAutorotationDisabled"))
    *(_QWORD *)&self->_windowFlags |= 0x10000uLL;
  else
    -[UIWindow _updateInterfaceOrientationFromActiveInterfaceOrientation:](self, "_updateInterfaceOrientationFromActiveInterfaceOrientation:", v3);
}

void __22__UIWindow_initialize__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_adjustForAccessibilityIfNeeded_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_adjustForAccessibilityIfNeeded_, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_adjustForAccessibilityIfNeeded_, CFSTR("UIAccessibilitySingleSystemColorChangedNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_adjustForAccessibilityIfNeeded_, CFSTR("UIAccessibilityInvertColorsChanged"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_adjustFocusForAccessibilityIfNeeded_, CFSTR("UIAccessibilityFullKeyboardAccessStatusDidChangeNotification"), 0);

}

- (BOOL)_isAlwaysKeyboardWindow
{
  return 0;
}

- (void)_handleSBActiveInterfaceOrientationChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("_UIAppActiveInterfaceOrientationRotateAnimatedUserInfoKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }
  -[UIWindow _updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:](self, "_updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:", v6);
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  UIWindow *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIWindow;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v16, sel__traitCollectionDidChangeOnSubtreeInternal_);
  v5 = objc_msgSend(a3->var1, "userInterfaceStyle");
  if (v5 != objc_msgSend(a3->var0, "userInterfaceStyle"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow screen](self, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_userInterfaceIdiom");

    if (v8 == 3)
    {
      -[UIWindow windowScene](self, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyboardSceneDelegate");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    objc_msgSend(v6, "responder");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v6, "responder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_responderWindow");
      v14 = (UIWindow *)objc_claimAutoreleasedReturnValue();

      if (v14 == self)
      {
        -[UIWindow rootViewController](self, "rootViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_updateTraitsIfNecessary");

        objc_msgSend(v6, "traitCollectionDidChange");
      }
    }

  }
}

+ (void)adjustForAccessibilityIfNeeded:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  int v10;
  id v11;
  _QWORD v12[5];

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UIAccessibilityInvertColorsChanged"));

  if (v5)
    v6 = 12;
  else
    v6 = 4;
  v7 = _AXSUseSingleSystemColor() | byte_1EDDC858A;
  v8 = v7 != 0;
  if (v7)
    byte_1EDDC858A = _AXSUseSingleSystemColor() != 0;
  v9 = _AXDarkenSystemColors() != 0;
  if (byte_1EDDC8589 != v9)
  {
    byte_1EDDC8589 = v9;
    v8 = 1;
  }
  v10 = _AXSInvertColorsEnabled() != 0;
  if (byte_1EDDC858B != v10)
  {
    byte_1EDDC858B = v10;
    goto LABEL_12;
  }
  if (v8)
  {
LABEL_12:
    objc_msgSend(a1, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__UIWindow_adjustForAccessibilityIfNeeded___block_invoke;
    v12[3] = &__block_descriptor_40_e25_v32__0__UIWindow_8Q16_B24l;
    v12[4] = v6;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

  }
}

void __22__UIWindow_sendEvent___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 CanBeConsideredFinished;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a2;
  CanBeConsideredFinished = _UIViewLayerAnimationCanBeConsideredFinished(*(void **)(a1 + 32), v9);
  v4 = v9;
  if (CanBeConsideredFinished)
  {
    objc_msgSend(*(id *)(a1 + 40), "animationForKey:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v5, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_acceptEarlyAnimationCutoff:", v5);

    }
    v4 = v9;
  }

}

- (void)updateGuideForKeyboardPlacement:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isVisible"))
  {
    if ((objc_msgSend(v6, "isFloating") & 1) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(v6, "isCompactAssistantView") & 1) != 0)
    {
      v4 = 6;
    }
    else if ((objc_msgSend(v6, "isFloatingAssistantView") & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(v6, "isUndocked") & 1) != 0)
    {
      v4 = 4;
    }
    else if (objc_msgSend(v6, "showsInputOrAssistantViews"))
    {
      v4 = 2;
    }
    else
    {
      v4 = 1;
    }
    -[UIWindow _primaryKeyboardTrackingGuide](self, "_primaryKeyboardTrackingGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurrentKeyboardVisualState:", v4);

  }
}

- (void)_updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIWindow isInterfaceAutorotationDisabled](self, "isInterfaceAutorotationDisabled"))
    *(_QWORD *)&self->_windowFlags |= 0x10000uLL;
  else
    -[UIWindow _updateInterfaceOrientationFromDeviceOrientation:](self, "_updateInterfaceOrientationFromDeviceOrientation:", v3);
}

- (void)_handleDeviceOrientationChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("UIDeviceOrientationRotateAnimatedUserInfoKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }
  -[UIWindow _updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:](self, "_updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:", v6);
}

- (void)setWindowScene:(UIWindowScene *)windowScene
{
  _UISceneUIWindowHosting *windowHostingScene;
  UIWindowScene *v6;
  void *v7;
  UIWindowScene *v8;
  void *v9;

  if (windowScene && (*(_QWORD *)&self->_windowFlags & 0x1000000000) != 0)
  {
    windowHostingScene = self->_windowHostingScene;
    v6 = windowScene;
    v7 = (void *)_UISetCurrentFallbackEnvironment(self);
    -[UIWindow _setWindowHostingScene:](self, "_setWindowHostingScene:", v6);

    _UIRestorePreviousFallbackEnvironment(v7);
    if (windowHostingScene != (_UISceneUIWindowHosting *)windowScene)
    {
      *(_QWORD *)&self->_windowFlags &= ~0x1000000000uLL;
      -[UIWindow _adjustFramePositionIfNecessary](self, "_adjustFramePositionIfNecessary");
    }
  }
  else
  {
    v8 = windowScene;
    v9 = (void *)_UISetCurrentFallbackEnvironment(self);
    -[UIWindow _setWindowHostingScene:](self, "_setWindowHostingScene:", v8);

    _UIRestorePreviousFallbackEnvironment(v9);
  }
}

- (void)_setWindowHostingScene:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5 || !self->_windowHostingScene)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("_UIWindowWillMoveToSceneNotification"), self, 0);

    }
  }
  else
  {
    -[UIWindow _prepareHierarchyForWindowHostingSceneRemoval](self, "_prepareHierarchyForWindowHostingSceneRemoval");
    -[_UISceneUIWindowHosting _detachWindow:](self->_windowHostingScene, "_detachWindow:", self);
  }
  objc_msgSend(v5, "_attachWindow:", self);

}

- (CGRect)convertRect:(CGRect)rect fromWindow:(UIWindow *)window
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  if (window)
  {
    -[UIWindow convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    -[UIView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromLayer:", self->_transformLayer, x, y, width, height);
    v10 = v18;
    v12 = v19;
    v14 = v20;
    v16 = v21;

  }
  v22 = v10;
  v23 = v12;
  v24 = v14;
  v25 = v16;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)setScreen:(UIScreen *)screen
{
  UIScreen *v5;
  UIScreen *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  UIScreen *v13;
  UIScreen *v14;
  UIScreen *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  char v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = screen;
  if (objc_msgSend((id)objc_opt_class(), "_shouldSoftAssertOnSetScreen")
    && objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[UIWindow setScreen:]";
        _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle. Call -[UIWindow setWindowScene:] instead.", buf, 0xCu);
      }

    }
    else
    {
      v24 = setScreen____s_category;
      if (!setScreen____s_category)
      {
        v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&setScreen____s_category);
      }
      v25 = *(NSObject **)(v24 + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[UIWindow setScreen:]";
        _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle. Call -[UIWindow setWindowScene:] instead.", buf, 0xCu);
      }
    }
  }
  -[UIWindow screen](self, "screen");
  v6 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  -[_UISceneUIWindowHosting _FBSScene](self->_windowHostingScene, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != v5)
    goto LABEL_5;
  objc_msgSend(v7, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreen displayIdentity](v5, "displayIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_5:
    if (v5)
    {
      v13 = v5;
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v13 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v15 = v6;
    if (!-[UIWindow _wantsSceneAssociation](self, "_wantsSceneAssociation"))
      goto LABEL_21;
    if (!-[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged"))
    {
LABEL_23:
      -[UIWindow _didMoveFromScreen:toScreen:](self, "_didMoveFromScreen:toScreen:", v15, v5);

      goto LABEL_24;
    }
    if (!objc_msgSend((id)UIApp, "isFrontBoard")
      || (objc_msgSend((id)UIApp, "disablesFrontBoardImplicitWindowScenes") & 1) != 0)
    {
      -[UIScreen displayIdentity](v14, "displayIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 6162, CFSTR("Attempting to attach a window (%@) to a screen with a nil FBSDisplayIdentity"), self);

      }
      if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0
        || !-[UIWindow _isWindowServerHostingManaged](self, "_isWindowServerHostingManaged"))
      {
        v17 = 0;
      }
      else
      {
        __UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle(v16, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UIWindow _setFBSScene:](self, v17);

      goto LABEL_22;
    }
    if (!v8)
      goto LABEL_21;
    objc_msgSend(v8, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScreen displayConfiguration](v14, "displayConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v19, "isEqual:", v20);

    if ((v28 & 1) == 0)
    {
      v21 = (void *)UIApp;
      -[UIScreen displayConfiguration](v15, "displayConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScreen displayConfiguration](v14, "displayConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_newSceneForWindow:oldDisplay:newDisplay:", self, v16, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _setFBSScene:](self, v23);

    }
    else
    {
LABEL_21:
      +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v14, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_attachWindow:", self);
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

}

+ (BOOL)_shouldSoftAssertOnSetScreen
{
  return 1;
}

- (void)_adjustSizeClassesAndResizeWindowToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  _UIViewControllerOneToOneTransitionContext *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  _UIViewControllerOneToOneTransitionContext *v18;
  void (**v19)(_QWORD);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  UIWindow *v25;
  _UIViewControllerOneToOneTransitionContext *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIWindow rootViewController](self, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self, "frame");
  v34.origin.x = v9;
  v34.origin.y = v10;
  v34.size.width = v11;
  v34.size.height = v12;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (!CGRectEqualToRect(v33, v34)
    && -[UIWindow _shouldAdjustSizeClassesAndResizeWindow](self, "_shouldAdjustSizeClassesAndResizeWindow")
    && +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"))
  {
    kdebug_trace();
    v13 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    -[_UIViewControllerTransitionContext _setIsAnimated:](v13, "_setIsAnimated:", 1);
    -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v13, "_setFromViewController:", v8);
    -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v13, "_setToViewController:", v8);
    -[_UIViewControllerTransitionContext _setContainerView:](v13, "_setContainerView:", self);
    -[UIView frame](self, "frame");
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v13, "_setFromStartFrame:");
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v13, "_setToEndFrame:", x, y, width, height);
    -[UIView frame](self, "frame");
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v13, "_setToStartFrame:");
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v13, "_setFromEndFrame:", x, y, width, height);
    -[_UIViewControllerTransitionContext _setCompletionCurve:](v13, "_setCompletionCurve:", 7);
    +[_UIWindowAnimationController animationControllerWithWindow:](_UIWindowAnimationController, "animationControllerWithWindow:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerTransitionContext _setIsAnimated:](v13, "_setIsAnimated:", +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
    -[_UIViewControllerTransitionContext _setAnimator:](v13, "_setAnimator:", v14);
    -[_UIViewControllerTransitionContext _setCompletionCurve:](v13, "_setCompletionCurve:", 5);
    -[UIView frame](self, "frame");
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke;
    v24 = &unk_1E16DE5A8;
    v17 = v16 != height || v15 != width;
    v25 = self;
    v28 = x;
    v29 = y;
    v30 = width;
    v31 = height;
    v18 = v13;
    v26 = v18;
    v32 = v17;
    v27 = v8;
    v19 = (void (**)(_QWORD))_Block_copy(&v21);
    if (-[UIWindow _guardSizeTransitionFromAnimations](self, "_guardSizeTransitionFromAnimations", v21, v22, v23, v24, v25))
    {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
    }
    else
    {
      v19[2](v19);
    }
    -[_UIViewControllerTransitionContext _animator](v18, "_animator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "animateTransition:", v18);

    kdebug_trace();
  }

}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  void *v2;
  char v3;

  -[UIWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isViewLoaded");

  return v3;
}

- (void)_updateInterfaceOrientationFromDeviceOrientation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "orientation");

    if ((unint64_t)(v6 - 1) <= 3)
      -[UIWindow _updateToNotificationProvidedInterfaceOrientation:animated:](self, "_updateToNotificationProvidedInterfaceOrientation:animated:", v6, v3);
  }
  else
  {
    -[UIWindow _updateOrientationPreferencesAnimated:](self, "_updateOrientationPreferencesAnimated:", v3);
  }
}

- (UIWindow)initWithContentRect:(CGRect)a3
{
  UIWindow *v3;
  UIWindow *v4;
  void *v5;

  v3 = -[UIWindow initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIWindow windowScene](v3, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UIWindow _adjustFramePositionIfNecessary](v4, "_adjustFramePositionIfNecessary");
    else
      *(_QWORD *)&v4->_windowFlags |= 0x1000000000uLL;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  _QWORD *v4;
  const char *v5;
  _QWORD *v6;
  void *v7;
  _UISceneUIWindowHosting *windowHostingScene;
  _QWORD *v9;
  NSArray *rootViewConstraints;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  UIWindow *v16;
  id touchData;
  NSUndoManager *undoManager;
  NSMutableArray *rotationViewControllers;
  UIResponder *firstResponder;
  NSMutableSet *subtreeMonitors;
  UIViewController *rootViewController;
  _UISystemGestureGateGestureRecognizer *systemGestureGateForGestures;
  _UISystemGestureGateGestureRecognizer *systemGestureGateForTouches;
  _UIGESGateGestureRecognizer *systemGateForGESTouches;
  UITraitCollection *traitCollection;
  UITraitCollection *destinationTraitCollection;
  NSString *debugName;
  _UIFocusEventRecognizer *focusEventRecognizer;
  void *v30;
  void *v31;
  CALayer *rootLayer;
  CALayer *sceneTransformLayer;
  CALayer *transformLayer;
  objc_super v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  -[UIView layer](self, "layer");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4 && (objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    -[UIView _focusSystem](self, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusEnvironmentWillDisappear:", self);

  }
  windowHostingScene = self->_windowHostingScene;
  if (windowHostingScene
    && (-[_UISceneUIWindowHosting _hasInvalidated](windowHostingScene, "_hasInvalidated") & 1) == 0)
  {
    -[_UISceneUIWindowHosting _eventDeferringManager](self->_windowHostingScene, "_eventDeferringManager");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager removeEventDeferringRulesIfNeededForDeallocatingWindow:](v9, self);

    -[UIWindow _prepareHierarchyForWindowHostingSceneRemoval](self, "_prepareHierarchyForWindowHostingSceneRemoval");
  }
  -[UIView _prepareDescendantsForWindowDealloc](self, v5);
  *(_QWORD *)&self->_windowFlags &= ~0x200000000uLL;
  -[UIView _layoutConstraintCleanup]((id *)&self->super.super.super.isa);
  if (dyld_program_sdk_at_least())
    -[UIWindow _removeAllViewControllersFromWindowHierarchyFromDealloc:](self, "_removeAllViewControllersFromWindowHierarchyFromDealloc:", 1);
  rootViewConstraints = self->_rootViewConstraints;
  self->_rootViewConstraints = 0;

  -[UIWindow _setWindowInternalConstraints:](self, "_setWindowInternalConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = CFSTR("UIDeviceOrientationDidChangeNotification");
  v36[1] = CFSTR("UIApplicationDidChangeStatusBarOrientationNotification");
  v36[2] = CFSTR("_UIAppActiveInterfaceOrientationDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v11, self, v12);

  -[UIWindow _updateLayerOrderingAndSetLayerHidden:](self, "_updateLayerOrderingAndSetLayerHidden:", 1);
  -[UIWindow firstResponder](self, "firstResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resignFirstResponder");

  -[UIWindow _setDelegateViewController:](self, "_setDelegateViewController:", 0);
  +[UIWindowController windowWillBeDeallocated:](UIWindowController, "windowWillBeDeallocated:", self);
  ClearSpecialViews(self, (CFMutableDictionaryRef *)&qword_1EDDC85B8);
  ClearSpecialViews(self, (CFMutableDictionaryRef *)&qword_1EDDC85C0);
  -[UIWindow windowScene](self, "windowScene");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (id *)v14;
  if (v14)
  {
    v16 = (UIWindow *)*(id *)(v14 + 344);

    if (v16 == self)
      -[UIWindowScene _keyWindowWillDeallocate:](v15, self);
  }
  if ((UIWindow *)qword_1EDDC85A8 == self)
    qword_1EDDC85A8 = 0;
  touchData = self->_touchData;
  self->_touchData = 0;

  undoManager = self->_undoManager;
  self->_undoManager = 0;

  rotationViewControllers = self->_rotationViewControllers;
  self->_rotationViewControllers = 0;

  firstResponder = self->_firstResponder;
  self->_firstResponder = 0;

  subtreeMonitors = self->_subtreeMonitors;
  self->_subtreeMonitors = 0;

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  systemGestureGateForGestures = self->_systemGestureGateForGestures;
  self->_systemGestureGateForGestures = 0;

  systemGestureGateForTouches = self->_systemGestureGateForTouches;
  self->_systemGestureGateForTouches = 0;

  systemGateForGESTouches = self->_systemGateForGESTouches;
  self->_systemGateForGESTouches = 0;

  traitCollection = self->_traitCollection;
  self->_traitCollection = 0;

  destinationTraitCollection = self->_destinationTraitCollection;
  self->_destinationTraitCollection = 0;

  -[UIWindow _setTraitCollectionChangeTransitionCoordinator:](self, "_setTraitCollectionChangeTransitionCoordinator:", 0);
  debugName = self->_debugName;
  self->_debugName = 0;

  focusEventRecognizer = self->_focusEventRecognizer;
  self->_focusEventRecognizer = 0;

  objc_msgSend(v15, "_focusSystemSceneComponent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activeSceneObserver");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stopMonitoringContextChangesForWindow:", self);

  -[_UISceneUIWindowHosting _detachWindow:](self->_windowHostingScene, "_detachWindow:", self);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (UIWindow *)v6[4] == self)
      v6[4] = 0;
  }
  rootLayer = self->_rootLayer;
  if (rootLayer && (UIWindow *)rootLayer[1].super.isa == self)
    rootLayer[1].super.isa = 0;
  sceneTransformLayer = self->_sceneTransformLayer;
  if (sceneTransformLayer && (UIWindow *)sceneTransformLayer[1].super.isa == self)
    sceneTransformLayer[1].super.isa = 0;
  transformLayer = self->_transformLayer;
  if (transformLayer && (UIWindow *)transformLayer[1].super.isa == self)
    transformLayer[1].super.isa = 0;

  objc_autoreleasePoolPop(v3);
  v35.receiver = self;
  v35.super_class = (Class)UIWindow;
  -[UIView dealloc](&v35, sel_dealloc);
}

- (void)_constraints_subviewWillChangeSuperview:(id)a3
{
  objc_super v5;

  -[UIWindow _setRootViewConstraints:](self, "_setRootViewConstraints:", 0);
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  -[UIView _constraints_subviewWillChangeSuperview:](&v5, sel__constraints_subviewWillChangeSuperview_, a3);
}

- (void)_removeFocusIfNeededForFocusSystemSceneComponent:(id)a3
{
  void *v4;

  objc_msgSend(a3, "activeSceneObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopMonitoringContextChangesForWindow:", self);

  -[UIWindow _removeFocusEventRecognizer](self, "_removeFocusEventRecognizer");
}

- (void)_registerChargedView:(id)a3
{
  id v4;
  UIWindow *v5;
  void *Mutable;
  id value;
  CFRange v8;

  v4 = a3;
  v5 = self;
  value = v4;
  if (qword_1EDDC85B8)
  {
    Mutable = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1EDDC85B8, v5);
    if (Mutable)
      goto LABEL_6;
  }
  else
  {
    qword_1EDDC85B8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  Mutable = CFArrayCreateMutable(0, 0, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1EDDC85B8, v5, Mutable);
  CFRelease(Mutable);
LABEL_6:
  v8.length = CFArrayGetCount((CFArrayRef)Mutable);
  v8.location = 0;
  if (!CFArrayContainsValue((CFArrayRef)Mutable, v8, value))
    CFArrayAppendValue((CFMutableArrayRef)Mutable, value);

}

- (void)_prepareHierarchyForWindowHostingSceneRemoval
{
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UISceneUIWindowHosting _focusSystemSceneComponent](self->_windowHostingScene, "_focusSystemSceneComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _removeFocusIfNeededForFocusSystemSceneComponent:](self, "_removeFocusIfNeededForFocusSystemSceneComponent:", v3);

  -[UIView _prepareForWindowHostingSceneRemoval](self, "_prepareForWindowHostingSceneRemoval");
  -[UIView _prepareDescendantsForWindowHostingSceneRemoval](self, v4);
  if (UIApp)
  {
    -[UIEventEnvironment _enqueueClearEventsOfWindow:](*(void **)(*(_QWORD *)(UIApp + 160) + 8), self);
    v5 = (void *)UIApp;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend((id)objc_msgSend(v5, "_touchesEventForWindow:", self), "_invalidateGestureRecognizerForWindowCache");
  -[_UIPencilEvent unregisterAllInteractionsForWindow:]((uint64_t)(id)objc_msgSend((id)UIApp, "_pencilEventForWindow:", self), self);
  -[_UISceneUIWindowHosting _existingPhysicalButtonInteractionArbiter](self->_windowHostingScene, "_existingPhysicalButtonInteractionArbiter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPhysicalButtonInteractionArbiter _unregisterAllPhysicalButtonInteractionsForDetachingWindow:]((uint64_t)v8, (uint64_t)self);
  -[_UISceneUIWindowHosting _existingHomeAffordanceSceneNotifier](self->_windowHostingScene, "_existingHomeAffordanceSceneNotifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cleanupForDetachingWindow:", self);
  -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)self);
  -[UIWindow _invalidateDeferredOrientationUpdate](self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_UIWindowWillMoveToNilSceneNotification"), self, 0);

}

- (void)_legacySetRotatableViewOrientation:(int64_t)a3 updateStatusBar:(BOOL)a4 duration:(double)a5 force:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a6;
  v8 = a4;
  if (-[UIWindow _windowOwnsInterfaceOrientation](self, "_windowOwnsInterfaceOrientation"))
  {
    -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)&self->super.super.super.isa, a3, v8, v6, a5);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Cannot set the orientation of a window that does not own its interface orientation.", buf, 2u);
    }

  }
  else
  {
    v11 = _legacySetRotatableViewOrientation_updateStatusBar_duration_force____s_category;
    if (!_legacySetRotatableViewOrientation_updateStatusBar_duration_force____s_category)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_legacySetRotatableViewOrientation_updateStatusBar_duration_force____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Cannot set the orientation of a window that does not own its interface orientation.", v14, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusEventRecognizer, 0);
  objc_storeStrong(&self->__shouldPreventRotationHook, 0);
  objc_storeStrong((id *)&self->__animationController, 0);
  objc_destroyWeak((id *)&self->__orientationTransactionToken);
  objc_destroyWeak((id *)&self->_rememberedFocusedItem);
  objc_destroyWeak((id *)&self->_lastNextResponder);
  objc_storeStrong(&self->_lastFirstResponderInteractionState, 0);
  objc_destroyWeak((id *)&self->_lastFirstResponder);
  objc_destroyWeak((id *)&self->_overrideParentTraitEnvironment);
  objc_storeStrong((id *)&self->_currentKeyboardTrackingLayoutGuides, 0);
  objc_storeStrong((id *)&self->_primaryKeyboardTrackingGuide, 0);
  objc_storeStrong((id *)&self->_rootViewConstraints, 0);
  objc_storeStrong((id *)&self->_windowInternalConstraints, 0);
  objc_storeStrong((id *)&self->_deferredOrientationUpdate, 0);
  objc_storeStrong((id *)&self->_traitCollectionChangeTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_rootPresentationController, 0);
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, 0);
  objc_storeStrong((id *)&self->_lowestLiveResizeSnapshot, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationMapResolver, 0);
  objc_storeStrong((id *)&self->_roleHint, 0);
  objc_storeStrong((id *)&self->_windowLevelObservers, 0);
  objc_storeStrong((id *)&self->_accessibilityHUD, 0);
  objc_storeStrong((id *)&self->_destinationTraitCollection, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_systemGestureGateForHomeAffordance, 0);
  objc_storeStrong((id *)&self->_systemGateForGESTouches, 0);
  objc_storeStrong((id *)&self->_systemGestureGateForTouches, 0);
  objc_storeStrong((id *)&self->_systemGestureGateForGestures, 0);
  objc_storeStrong(&self->_windowController, 0);
  objc_storeStrong((id *)&self->_subtreeMonitors, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_rotationViewControllers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_sceneTransformLayer, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_exclusiveTouchView, 0);
  objc_storeStrong(&self->_touchData, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);
  objc_destroyWeak((id *)&self->_contextBinder);
  objc_destroyWeak((id *)&self->_layerContext);
  objc_destroyWeak((id *)&self->_delegateViewController);
  objc_storeStrong((id *)&self->_debugName, 0);
}

+ (void)_synchronizeDrawingWithFence:(id)a3
{
  objc_msgSend(a1, "_synchronizeDrawingWithFence:preCommitHandler:", a3, 0);
}

- (Class)_intelligenceBaseClass
{
  sub_1855A6B04();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (UIActivityItemsConfigurationReading)_activityItemsConfigurationForScene
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;

  -[UIWindow _focusResponder](self, "_focusResponder");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      objc_msgSend(v3, "nextResponder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v3;
        objc_msgSend(v5, "presentingViewController");
        v6 = objc_claimAutoreleasedReturnValue();
        if (!v6 || (v7 = (void *)v6, v8 = objc_msgSend(v5, "modalPresentationStyle"), v7, v8 == 5) || !v8)
        {
          objc_msgSend(v5, "_effectiveActivityItemsConfiguration");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v12 = (void *)v9;

            return (UIActivityItemsConfigurationReading *)v12;
          }
        }
        v10 = v4;

      }
      else
      {
        v11 = v4;
      }

      v3 = v4;
    }
    while (v4);
  }
  v12 = 0;
  return (UIActivityItemsConfigurationReading *)v12;
}

- (void)removeKeyboardLayoutGuideIfNeeded:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIKeyboardLayoutGuide *primaryKeyboardTrackingGuide;
  id v11;

  v11 = a3;
  if (-[NSMutableArray containsObject:](self->_currentKeyboardTrackingLayoutGuides, "containsObject:"))
  {
    -[UITrackingLayoutGuide removeTrackedConstraintsFromViewBasedGuide:](self->_primaryKeyboardTrackingGuide, "removeTrackedConstraintsFromViewBasedGuide:", v11);
    objc_msgSend(v11, "_systemConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v11, "_systemConstraints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deactivateConstraints:", v7);

    }
    -[NSMutableArray removeObject:](self->_currentKeyboardTrackingLayoutGuides, "removeObject:", v11);
  }
  if (objc_msgSend(v11, "isEqual:", self->_primaryKeyboardTrackingGuide)
    && !-[NSMutableArray count](self->_currentKeyboardTrackingLayoutGuides, "count"))
  {
    -[UITrackingLayoutGuide removeAllTrackedConstraints](self->_primaryKeyboardTrackingGuide, "removeAllTrackedConstraints");
    v8 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](self->_primaryKeyboardTrackingGuide, "_systemConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deactivateConstraints:", v9);

    -[UILayoutGuide _setLockedToOwningView:](self->_primaryKeyboardTrackingGuide, "_setLockedToOwningView:", 0);
    -[UIView removeLayoutGuide:](self, "removeLayoutGuide:", self->_primaryKeyboardTrackingGuide);
    primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
    self->_primaryKeyboardTrackingGuide = 0;

  }
}

- (double)keyboardLayoutGuideScrollViewOffset
{
  double result;

  if (!-[UIWindow isTrackingKeyboard](self, "isTrackingKeyboard"))
    return 0.0;
  -[UIKeyboardLayoutGuide keyboardDismissPadding](self->_primaryKeyboardTrackingGuide, "keyboardDismissPadding");
  return result;
}

- (BOOL)moveKeyboardLayoutGuideOverEdge:(unint64_t)a3 layoutViews:(BOOL)a4
{
  _BOOL4 v4;
  UIKeyboardLayoutGuide *primaryKeyboardTrackingGuide;
  _BOOL4 v8;
  BOOL v9;

  v4 = a4;
  if (-[UIWindow isTrackingKeyboard](self, "isTrackingKeyboard"))
  {
    primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
    if (a3)
    {
      v8 = -[UIKeyboardLayoutGuide moveGuideOffscreenAtEdge:](primaryKeyboardTrackingGuide, "moveGuideOffscreenAtEdge:", a3);
      v9 = v8;
      if (v8 && v4)
        -[UIWindow layoutViewsForTrackedGuides](self, "layoutViewsForTrackedGuides");
      if (v9)
        return 1;
    }
    else
    {
      -[UIKeyboardLayoutGuide resetGuideForCancelledDismissInteraction](primaryKeyboardTrackingGuide, "resetGuideForCancelledDismissInteraction");
    }
  }
  return 0;
}

- (UILayoutGuide)safeAreaAspectFitLayoutGuide
{
  _UIWindowSafeAreaAspectFitLayoutGuide *v3;

  objc_getAssociatedObject(self, &_UIWindowSafeAreaAspectFitLayoutGuideID);
  v3 = (_UIWindowSafeAreaAspectFitLayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(_UIWindowSafeAreaAspectFitLayoutGuide);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v3);
    -[UILayoutGuide _setLockedToOwningView:](v3, "_setLockedToOwningView:", 1);
    -[UILayoutGuide setIdentifier:](v3, "setIdentifier:", CFSTR("UIWindowSafeAreaAspectFitLayoutGuide"));
    objc_setAssociatedObject(self, &_UIWindowSafeAreaAspectFitLayoutGuideID, v3, (void *)1);
  }
  return (UILayoutGuide *)v3;
}

void __43__UIWindow_adjustForAccessibilityIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  -[UIView _dispatchTintColorVisitorWithReasons:](a2, *(_QWORD *)(a1 + 32));
}

+ (void)adjustFocusForAccessibilityIfNeeded:(id)a3
{
  BOOL v3;
  id v4;
  _QWORD v5[4];
  BOOL v6;

  objc_msgSend(a1, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = _AXSFullKeyboardAccessEnabled() != 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__UIWindow_adjustFocusForAccessibilityIfNeeded___block_invoke;
  v5[3] = &__block_descriptor_33_e25_v32__0__UIWindow_8Q16_B24l;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __48__UIWindow_adjustFocusForAccessibilityIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isCarScreen");

  if ((v4 & 1) == 0 && *(_BYTE *)(a1 + 32))
    objc_msgSend(v5, "_installFocusEventRecognizer");

}

- (void)_setScene:(id)a3
{
  -[UIWindow _setFBSScene:](self, a3);
}

- (void)_setFBSScene:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v17 = v3;
    if (!v3)
    {
      objc_msgSend(a1, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v10, 1);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v9, "_attachWindow:", a1);

LABEL_12:
      objc_msgSend(a1, "_updateTransformLayer");
      v4 = v17;
      goto LABEL_13;
    }
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(v17, "uiSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v13, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v5, "_attachWindow:", a1);

    v14 = a1[53];
    objc_msgSend(v17, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "interfaceOrientation");

    v4 = v17;
    if (v14 != v16)
      goto LABEL_12;
  }
LABEL_13:

}

- (FBSSceneLayer)_associatingSceneLayer
{
  return (FBSSceneLayer *)-[_UISceneUIWindowHosting _fbsSceneLayerForWindow:](self->_windowHostingScene, "_fbsSceneLayerForWindow:", self);
}

- (void)_commonInitAttachedWindow:(BOOL)a3 debugName:(id)a4 scene:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[UIWindow _uiWindowSceneFromFBSScene:](self, "_uiWindowSceneFromFBSScene:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWindow _commonInitDebugName:uiScene:](self, "_commonInitDebugName:uiScene:", v7, v8);

}

+ (BOOL)_temporary_shouldSizeWindowsAutomaticallyPlistOverrideSet
{
  if (qword_1EDDC85B0 != -1)
    dispatch_once(&qword_1EDDC85B0, &__block_literal_global_218_2);
  return byte_1EDDC858C;
}

void __69__UIWindow__temporary_shouldSizeWindowsAutomaticallyPlistOverrideSet__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSWindowAutomaticSizing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v4;
  if (v4)
  {
    v3 = objc_msgSend(v4, "BOOLValue");
    v2 = v4;
  }
  else
  {
    v3 = 0;
  }
  byte_1EDDC858C = v3;

}

- (void)_commonInit
{
  id v3;

  -[UIWindow _uiWindowSceneFromFBSScene:](self, "_uiWindowSceneFromFBSScene:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWindow _commonInitDebugName:uiScene:](self, "_commonInitDebugName:uiScene:", 0, v3);

}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4
{
  return -[UIWindow _initWithFrame:debugName:attached:](self, "_initWithFrame:debugName:attached:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 displayConfiguration:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = a4;
  _ensureDebugName(self, v12);
  objc_msgSend((id)UIApp, "_mainSceneForDisplay:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", v12, v14, x, y, width, height);
  return v15;
}

- (UIWindow)initWithCoder:(id)a3
{
  id v4;
  UIWindow *v5;
  UIWindow *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIWindow;
  v5 = -[UIView initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIWindow _commonInit](v5, "_commonInit");
    v7 = -[UIView isHidden](v6, "isHidden");
    v8 = 0x2000000;
    if ((_DWORD)v7)
      v8 = 0;
    v6->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&v6->_windowFlags & 0xFFFFFFFFFDFFFFFFLL | v8);
    -[UIWindow setHidden:](v6, "setHidden:", v7);
    *(_QWORD *)&v6->_windowFlags &= ~0x2000000uLL;
    v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIResizesToFullScreen"));
    v10 = 0x800000;
    if (!v9)
      v10 = 0;
    v6->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&v6->_windowFlags & 0xFFFFFFFFFF7FFFFFLL | v10);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIRootViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[UIWindow setRootViewController:](v6, "setRootViewController:", v11);
    *(_QWORD *)&v6->_windowFlags |= 0x20uLL;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIViewController *rootViewController;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIWindow;
  -[UIView encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if ((*((_BYTE *)&self->_windowFlags + 2) & 0x80) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIResizesToFullScreen"));
  rootViewController = self->_rootViewController;
  if (rootViewController)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", rootViewController, CFSTR("UIRootViewController"));

}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  -[NSObject awakeFromNib](&v5, sel_awakeFromNib);
  if (!self->_viewOrientation)
  {
    v3 = (void *)UIApp;
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_viewOrientation = objc_msgSend(v3, "_safeInterfaceOrientationForWindowIfExists:", v4);

  }
  -[UIWindow _resizeWindowToFullScreenIfNecessary](self, "_resizeWindowToFullScreenIfNecessary");
}

- (void)setContentView:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  -[UIView subviews](self, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v5 != v8)
  {
    objc_msgSend(v5, "removeFromSuperview");
    -[UIView bounds](self, "bounds");
    objc_msgSend(v8, "setSize:", v6, v7);
    -[UIView addSubview:](self, "addSubview:", v8);
    objc_msgSend(v8, "setAutoresizingMask:", 18);
  }

}

- (id)representation
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_setShouldDisableTransformLayerScalingForSnapshotting:(BOOL)a3
{
  if (self->_shouldDisableTransformLayerScalingForSnapshotting != a3)
  {
    self->_shouldDisableTransformLayerScalingForSnapshotting = a3;
    -[UIWindow _updateTransformLayer](self, "_updateTransformLayer");
  }
}

- (void)_transformLayerShouldMaskToBounds:(BOOL)a3
{
  -[CALayer setMasksToBounds:](self->_transformLayer, "setMasksToBounds:", a3);
}

- (BOOL)_isConstrainedByScreenJail
{
  if (_isConstrainedByScreenJail_once != -1)
    dispatch_once(&_isConstrainedByScreenJail_once, &__block_literal_global_245_0);
  return 1;
}

void __38__UIWindow__isConstrainedByScreenJail__block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_FakeMainScreen_block_invoke_3___s_category;
  if (!_UIInternalPreference_FakeMainScreen_block_invoke_3___s_category)
  {
    v0 = __UILogCategoryGetNode("Window", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_FakeMainScreen_block_invoke_3___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "The value returned from this method is no longer trustworthy. Please contact the UIKit team to discuss your needs with this method.", v2, 2u);
  }
}

- (int64_t)_orientationForClassicPresentation
{
  return self->_sceneOrientation;
}

- (BOOL)_transformLayerIncludesScreenRotation
{
  return 0;
}

- (void)__setWindowHostingScene:(uint64_t)a1
{
  id v3;
  BOOL v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (a1 && *(id *)(a1 + 808) != v3)
  {
    *(_QWORD *)(a1 + 808) = v3;
    v6 = v3;
    objc_opt_class();
    v4 = (objc_opt_isKindOfClass() & 1) == 0;
    v3 = v6;
    v5 = 0x800000000;
    if (v4)
      v5 = 0;
    *(_QWORD *)(a1 + 584) = *(_QWORD *)(a1 + 584) & 0xFFFFFFF7FFFFFFFFLL | v5;
  }

}

- (void)_insertLiveResizeSnapshot:(id *)a1
{
  id v4;
  id v5;
  id *v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  id *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = a1[90];
    if (v5)
    {
      objc_msgSend(v5, "superview");
      v6 = (id *)objc_claimAutoreleasedReturnValue();

      if (v6 != a1)
      {
        v7 = _insertLiveResizeSnapshot____s_category;
        if (!_insertLiveResizeSnapshot____s_category)
        {
          v7 = __UILogCategoryGetNode("Window", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&_insertLiveResizeSnapshot____s_category);
        }
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = a1[90];
          v10 = v8;
          objc_msgSend(v9, "superview");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412546;
          v14 = a1;
          v15 = 2112;
          v16 = v11;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "A live resize snapshot was removed from its owning window %@ and is now a subview of %@.", (uint8_t *)&v13, 0x16u);

        }
        v12 = a1[90];
        a1[90] = 0;

      }
    }
    if (a1[90])
      objc_msgSend(a1, "insertSubview:belowSubview:", v4);
    else
      objc_msgSend(a1, "addSubview:", v4);
    objc_storeStrong(a1 + 90, a2);
  }

}

- (void)_removeLiveResizeSnapshot:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    if (*(id *)(a1 + 720) == v3)
    {
      *(_QWORD *)(a1 + 720) = 0;

    }
    objc_msgSend(v4, "removeFromSuperview");
    v3 = v4;
  }

}

+ (void)_setAllWindowsKeepContextInBackground:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  __allWindowsKeepContextInBackground = 1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setKeepContextAssociationInBackground:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __47__UIWindow_addRootViewControllerViewIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)makeKeyAndOrderFront:(id)a3
{
  -[UIWindow setHidden:](self, "setHidden:", 0);
  -[UIWindow makeKeyWindow](self, "makeKeyWindow");
}

- (void)orderOut:(id)a3
{
  -[UIWindow setHidden:](self, "setHidden:", 1);
}

- (CGRect)_usableBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v27;
  CGRect v29;

  -[UIWindow _usableSceneBounds](self, "_usableSceneBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIWindow _sceneSafeAreaInsetsIncludingStatusBar:](self, "_sceneSafeAreaInsetsIncludingStatusBar:", 1);
  -[UIWindow convertRect:fromWindow:](self, "convertRect:fromWindow:", 0, v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIView bounds](self, "bounds");
  v29.origin.x = v23;
  v29.origin.y = v24;
  v29.size.width = v25;
  v29.size.height = v26;
  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v20;
  v27.size.height = v22;
  return CGRectIntersection(v27, v29);
}

- (void)_sceneSettingsSafeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[UIWindow _normalizedSafeAreaInsets](self, "_normalizedSafeAreaInsets");
  -[UIView _setSafeAreaInsets:updateSubviewsDuringNextLayoutPass:]((double *)self, 0, v3, v4, v5, v6);
  -[UIView _recursiveEagerlyUpdateSafeAreaInsetsUntilViewController](self);
  -[UIWindow rootViewController](self, "rootViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sceneSettingsSafeAreaInsetsDidChangeForWindow:", self);

}

- (id)_targetForStolenStatusBarTouchesAtPoint:(CGPoint)a3 withEvent:(id)a4 excludingWindow:(id)a5
{
  double y;
  double x;
  id v9;
  UIWindow *v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = (UIWindow *)a5;
  -[UIWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", 0, x, y);
  -[UIWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", 0, _UIAdjustedLocationForScreenTouchLocation(self, v11));
  v13 = v12;
  v15 = v14;

  if (v10 == self)
  {
    v17 = 0;
  }
  else
  {
    -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", v9, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertPoint:fromView:", self, v13, v15);
    if (objc_msgSend(v16, "_canHandleStatusBarTouchAtLocation:"))
      v17 = v16;
    else
      v17 = 0;

  }
  return v17;
}

- (BOOL)_isScrollingEnabledForView:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "isScrollEnabled");
  }
  else
  {
    NSLog(CFSTR("View %@ registered as scroller, but it isn't."), v3);
    v4 = 0;
  }

  return v4;
}

- (void)_scrollToTopViewsUnderScreenPointIfNecessary:(CGPoint)a3 resultHandler:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void (**v45)(_QWORD, _QWORD);
  id v46;
  void *v47;
  UIWindow *v48;
  _QWORD v49[4];
  id v50;
  UIWindow *v51;
  id v52;
  _QWORD *v53;
  uint64_t *v54;
  double v55;
  double v56;
  uint64_t v57;
  id *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  y = a3.y;
  x = a3.x;
  v76 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (qword_1EDDC85C0)
  {
    v46 = v7;
    v48 = self;
    -[UIWindow _registeredScrollToTopViews](v48, "_registeredScrollToTopViews");
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v9)
    {
      v47 = 0;
      v10 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v71 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "activePresentationController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            while (1)
            {
              objc_msgSend(v13, "activePresentationController");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "_shouldPresentedViewControllerServeAsBaseForScrollToTop");

              if ((v16 & 1) != 0)
                break;
              objc_msgSend(v13, "presentingViewController");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "activePresentationController");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v17;
              if (!v14)
                goto LABEL_12;
            }
          }
          v17 = v13;
LABEL_12:
          objc_msgSend(v12, "_viewControllerForAncestor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            while (v18 != v17)
            {
              objc_msgSend(v18, "parentViewController");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (v19)
              {
                v21 = v19;
              }
              else
              {
                objc_msgSend(v18, "presentingViewController");
                v21 = (id)objc_claimAutoreleasedReturnValue();
              }
              v22 = v21;

              v18 = v22;
              if (!v22)
                goto LABEL_23;
            }
            if (v47)
            {
              objc_msgSend(v47, "addObject:", v12);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v12);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
            }

          }
LABEL_23:

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v9);
    }
    else
    {
      v47 = 0;
    }

    if (objc_msgSend(v47, "count"))
    {
      v23 = v47;

      v8 = v23;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow convertPoint:fromWindow:](v48, "convertPoint:fromWindow:", 0, x, y);
    v26 = v25;
    v28 = v27;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v29 = v8;
    v30 = 0;
    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v67 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          if (-[UIView _isInVisibleHierarchy]((uint64_t)v34))
          {
            if (-[UIWindow _isScrollingEnabledForView:](v48, "_isScrollingEnabledForView:", v34))
            {
              objc_msgSend(v34, "convertPoint:fromView:", 0, v26, v28);
              v36 = v35;
              objc_msgSend(v34, "bounds");
              ++v30;
              if (v37 <= v36)
              {
                objc_msgSend(v34, "bounds");
                if (v38 + v39 >= v36)
                  objc_msgSend(v24, "addObject:", v34);
              }
            }
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v31);
    }

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "userInterfaceIdiom");

    if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v30 == 1 || dyld_program_sdk_at_least())
    {
      v42 = MEMORY[0x1E0C809B0];
      if (v30 >= 2)
      {
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke;
        v65[3] = &unk_1E16DE498;
        v65[4] = v48;
        objc_msgSend(v24, "sortUsingComparator:", v65);
      }
      objc_msgSend(v24, "objectEnumerator");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x3032000000;
      v63[3] = __Block_byref_object_copy__163;
      v63[4] = __Block_byref_object_dispose__163;
      v64 = 0;
      v57 = 0;
      v58 = (id *)&v57;
      v59 = 0x3042000000;
      v60 = __Block_byref_object_copy__281;
      v61 = __Block_byref_object_dispose__282;
      v62 = 0;
      v49[0] = v42;
      v49[1] = 3221225472;
      v49[2] = __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke_283;
      v49[3] = &unk_1E16DE4C0;
      v53 = v63;
      v52 = v46;
      v44 = v43;
      v50 = v44;
      v55 = x;
      v56 = y;
      v51 = v48;
      v54 = &v57;
      v45 = (void (**)(_QWORD, _QWORD))objc_msgSend(v49, "copy");
      objc_storeWeak(v58 + 5, v45);
      v45[2](v45, 0);

      _Block_object_dispose(&v57, 8);
      objc_destroyWeak(&v62);
      _Block_object_dispose(v63, 8);

    }
    v7 = v46;
  }

}

uint64_t __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  uint64_t v44;
  _BOOL4 v45;
  _BOOL4 v46;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "convertRect:toView:", *(_QWORD *)(a1 + 32), v10, v12, v14, v16);
  objc_msgSend(v5, "convertRect:toWindow:", 0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = *(void **)(a1 + 32);
  objc_msgSend(v6, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  objc_msgSend(v26, "convertRect:toView:", *(_QWORD *)(a1 + 32), v28, v30, v32, v34);
  objc_msgSend(v25, "convertRect:toWindow:", 0);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  if (+[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"))
  {
    v43 = v20 < v38;
  }
  else
  {
    v44 = objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", *(_QWORD *)(a1 + 32));
    v43 = v18 < v36;
    v45 = v18 + v22 > v36 + v40;
    v46 = v20 < v38;
    if (v44 == 2)
      v46 = v20 + v24 > v38 + v42;
    if (v44 != 3)
      v45 = v46;
    if (v44 != 4)
      v43 = v45;
  }
  if (v43)
    return -1;
  else
    return 1;
}

void __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke_283(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_fadeCalloutBarIfNeededForTouchInView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v4 = *(_QWORD *)(a1 + 48);
    if (!v4)
      return;
    v5 = *(void (**)(void))(v4 + 16);
LABEL_9:
    v5();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v9)
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (!v13)
      return;
    v5 = *(void (**)(void))(v13 + 16);
    goto LABEL_9;
  }
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);

  if (v10 == v11)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend(v12, "_scrollToTopFromTouchAtScreenLocation:resultHandler:", WeakRetained, *(double *)(a1 + 72), *(double *)(a1 + 80));

  }
}

- (BOOL)_touchesInsideShouldHideCalloutBarForViewHierarchy:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    do
    {
      v5 = objc_msgSend(v4, "_touchesInsideShouldHideCalloutBar");
      if (!v5)
        break;
      objc_msgSend(v4, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_canIgnoreInteractionEvents
{
  return 1;
}

- (void)_sendButtonsForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)UIApp, "_responderBasedEventDeliverer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_respondersForWindow:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v24 = v6;
    v25 = v5;
    v23 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        if (v5)
        {
          objc_msgSend(v5, "deliverPressesEvent:toResponder:", v4, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10));
        }
        else
        {
          +[_UIResponderIntegrityProtection rip](_UIResponderIntegrityProtection, "rip");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_pressesForResponder:withPhase:", v11, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            objc_msgSend(v12, "startDeliveringPresses:inPhase:withEvent:", v13, 0, v4);
            objc_msgSend(v11, "pressesBegan:withEvent:", v13, v4);
            objc_msgSend(v12, "finishedDeliveringPresses");
          }
          objc_msgSend(v4, "_pressesForResponder:withPhase:", v11, 1, v23, v24, v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count"))
          {
            objc_msgSend(v12, "startDeliveringPresses:inPhase:withEvent:", v14, 1, v4);
            objc_msgSend(v11, "pressesChanged:withEvent:", v14, v4);
            objc_msgSend(v12, "finishedDeliveringPresses");
          }
          objc_msgSend(v4, "_pressesForResponder:withPhase:", v11, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "count"))
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v16 = v15;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v28 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                  if ((objc_msgSend(v21, "sentPressesEnded") & 1) == 0)
                    objc_msgSend(v21, "setSentPressesEnded:", 1);
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              }
              while (v18);
            }

            objc_msgSend(v12, "startDeliveringPresses:inPhase:withEvent:", v16, 3, v4);
            objc_msgSend(v11, "pressesEnded:withEvent:", v16, v4);
            objc_msgSend(v11, "_completeForwardingTouches:phase:event:", v16, 3, v4);
            objc_msgSend(v12, "finishedDeliveringPresses");
            v6 = v24;
            v5 = v25;
            v9 = v23;
            v8 = v26;
          }
          objc_msgSend(v4, "_pressesForResponder:withPhase:", v11, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "count"))
          {
            objc_msgSend(v12, "startDeliveringPresses:inPhase:withEvent:", v22, 4, v4);
            objc_msgSend(v11, "pressesCancelled:withEvent:", v22, v4);
            objc_msgSend(v11, "_completeForwardingTouches:phase:event:", v22, 4, v4);
            objc_msgSend(v12, "finishedDeliveringPresses");
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

}

- (CGPoint)_convertOffset:(CGPoint)a3 toWindow:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", v7, x, y);
  v9 = v8;
  v11 = v10;
  -[UIWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v13 = v12;
  v15 = v14;

  v16 = v9 - v13;
  v17 = v11 - v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertOffset:(CGPoint)a3 fromWindow:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", v7, x, y);
  v9 = v8;
  v11 = v10;
  -[UIWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v13 = v12;
  v15 = v14;

  v16 = v9 - v13;
  v17 = v11 - v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertOffsetToSceneReferenceSpace:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[UIWindow _convertPointToSceneReferenceSpace:](self, "_convertPointToSceneReferenceSpace:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[UIWindow _convertPointToSceneReferenceSpace:](self, "_convertPointToSceneReferenceSpace:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v9 = v5 - v8;
  v11 = v7 - v10;
  result.y = v11;
  result.x = v9;
  return result;
}

- (CGPoint)_convertOffsetFromSceneReferenceSpace:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[UIWindow _convertPointFromSceneReferenceSpace:](self, "_convertPointFromSceneReferenceSpace:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[UIWindow _convertPointFromSceneReferenceSpace:](self, "_convertPointFromSceneReferenceSpace:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v9 = v5 - v8;
  v11 = v7 - v10;
  result.y = v11;
  result.x = v9;
  return result;
}

- (CGPoint)convertWindowToDevice:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView frameOrigin](self, "frameOrigin");
  v6 = x + v5;
  v8 = y + v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGPoint)convertDeviceToWindow:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView frameOrigin](self, "frameOrigin");
  v6 = x - v5;
  v8 = y - v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (BOOL)_canPromoteFromKeyWindowStack
{
  return 1;
}

- (void)_slideHeaderView:(id)a3 andFooterView:(id)a4 offScreen:(BOOL)a5 forInterfaceOrientation:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "center");
  v37 = v12;
  v38 = v13;
  objc_msgSend(v11, "center");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v10, "bounds");
  v19 = v18;
  objc_msgSend(v11, "bounds");
  v21 = v20;
  -[UIWindow windowScene](self, "windowScene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "statusBarManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "statusBarFrame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v39, 0, sizeof(v39));
  v40.origin.x = v25;
  v40.origin.y = v27;
  v40.size.width = v29;
  v40.size.height = v31;
  v41 = CGRectApplyAffineTransform(v40, &v39);
  v32 = v19 + v41.size.height;
  v33 = v37;
  switch(a6)
  {
    case 1:
      if (v7)
        v32 = -v32;
      v34 = v38 + v32;
      v35 = -v21;
      if (v7)
        v35 = v21;
      goto LABEL_15;
    case 2:
      if (!v7)
        v32 = -v32;
      v34 = v38 + v32;
      v35 = -v21;
      if (!v7)
        v35 = v21;
LABEL_15:
      v17 = v17 + v35;
      break;
    case 3:
      if (!v7)
        v32 = -v32;
      v33 = v37 + v32;
      v36 = -v21;
      if (!v7)
        v36 = v21;
      goto LABEL_24;
    case 4:
      if (v7)
        v32 = -v32;
      v33 = v37 + v32;
      v36 = -v21;
      if (v7)
        v36 = v21;
LABEL_24:
      v15 = v15 + v36;
      v34 = v38;
      break;
    default:
      v33 = v37;
      v34 = v38;
      break;
  }
  objc_msgSend(v10, "setCenter:", v33, v34);
  objc_msgSend(v11, "setCenter:", v15, v17);

}

- (void)_positionHeaderView:(id)a3 andFooterView:(id)a4 outsideContentViewForInterfaceOrientation:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;

  v36 = a4;
  v7 = a3;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v35 = v15;

  objc_msgSend(v36, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v7, "bounds");
  v26 = v25;
  objc_msgSend(v36, "bounds");
  v27 = v26 * 0.5;
  v29 = v28 * 0.5;
  switch(a5)
  {
    case 1:
      v30 = v10 + v14 * 0.5;
      v31 = v12 - v27;
      v32 = v18 + v22 * 0.5;
      v33 = v20 + v24 + v29;
      break;
    case 2:
      v30 = v10 + v14 * 0.5;
      v31 = v12 + v35 + v27;
      v32 = v18 + v22 * 0.5;
      v33 = v20 - v29;
      break;
    case 3:
      v30 = v10 + v14 + v27;
      v34 = 0.5;
      v31 = v12 + v35 * 0.5;
      v32 = v18 - v29;
      goto LABEL_7;
    case 4:
      v30 = v10 - v27;
      v34 = 0.5;
      v31 = v12 + v35 * 0.5;
      v32 = v18 + v22 + v29;
LABEL_7:
      v33 = v20 + v24 * v34;
      break;
    default:
      v30 = *MEMORY[0x1E0C9D538];
      v31 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v32 = *MEMORY[0x1E0C9D538];
      v33 = v31;
      break;
  }
  objc_msgSend(v7, "setPosition:", v30, v31, *(_QWORD *)&v35);

  objc_msgSend(v36, "setPosition:", v32, v33);
}

- (id)_clientsForRotation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIWindow _rotationViewControllers](self, "_rotationViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v10, "shouldWindowUseOnePartInterfaceRotationAnimation:", self, (_QWORD)v13))
        {
          objc_msgSend(v10, "_viewControllerForRotation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)__clientsForRotationCallbacks
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v19;
  uint64_t v20;
  NSMutableArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = WeakRetained;
    objc_msgSend(WeakRetained, "_viewControllersForRotationCallbacks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = self->_rotationViewControllers;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        v8 = 0;
        v20 = v6;
        do
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
          if ((objc_msgSend(v4, "containsObject:", v9) & 1) == 0)
          {
            objc_msgSend(v9, "_viewControllersForRotationCallbacks");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            v12 = v10;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v13)
            {
              v14 = v13;
              v15 = 0;
              v16 = *(_QWORD *)v23;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v23 != v16)
                    objc_enumerationMutation(v12);
                  if (objc_msgSend(v4, "indexOfObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)) != 0x7FFFFFFFFFFFFFFFLL)
                    objc_msgSend(v11, "addIndex:", v15 + i);
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                v15 += i;
              }
              while (v14);
            }

            if (objc_msgSend(v11, "count"))
              objc_msgSend(v12, "removeObjectsAtIndexes:", v11);
            v6 = v20;
            if (objc_msgSend(v12, "count"))
              objc_msgSend(v4, "addObjectsFromArray:", v12);

          }
          ++v8;
        }
        while (v8 != v6);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v6);
    }

    WeakRetained = v19;
  }
  else
  {
    -[UIWindow _clientsForRotation](self, "_clientsForRotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_addRotationViewController:(id)a3
{
  NSMutableArray *rotationViewControllers;
  NSMutableArray *v4;
  objc_class *v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;

  rotationViewControllers = self->_rotationViewControllers;
  if (rotationViewControllers)
  {
    v9 = (NSMutableArray *)a3;
    -[NSMutableArray addObject:](rotationViewControllers, "addObject:", v9);
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E0C99DE8];
    v7 = a3;
    v8 = (NSMutableArray *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    v4 = self->_rotationViewControllers;
    self->_rotationViewControllers = v8;
  }

}

- (void)_removeRotationViewController:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_rotationViewControllers, "removeObjectIdenticalTo:", a3);
}

- (void)_clearPendingKeyboardChanges
{
  *(_QWORD *)&self->_windowFlags &= ~0x40000uLL;
}

- (id)_adjustWindowOrientationForTransitionWithSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 reason:(id)a5
{
  return -[UIWindow _createForcedOrientationTransactionTokenWithSupportedOrientations:preferredOrientation:forImmediateCommit:reason:](self, "_createForcedOrientationTransactionTokenWithSupportedOrientations:preferredOrientation:forImmediateCommit:reason:", a3, a4, 0, a5);
}

- (id)_createForcedOrientationTransactionTokenWithSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 forImmediateCommit:(BOOL)a5 reason:(id)a6
{
  _BOOL4 v6;
  __CFString *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  UIWindow *v24;
  objc_class *v25;
  __CFString *v26;
  _UIForcedOrientationTransactionToken *v27;
  unint64_t v28;
  NSObject *v30;
  void *v31;
  UIWindow *v32;
  objc_class *v33;
  void *v34;
  __CFString *v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  unint64_t v41;
  NSObject *v42;
  void *v43;
  UIWindow *v44;
  objc_class *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  NSObject *v53;
  void *v54;
  UIWindow *v55;
  objc_class *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  __CFString *v60;
  uint8_t buf[4];
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  __CFString *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v6 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a6;
  -[UIWindow windowScene](self, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_canDynamicallySpecifySupportedInterfaceOrientations");

  if (!v12)
  {
    v27 = 0;
    goto LABEL_25;
  }
  -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = -[__CFString state](v13, "state");
    v16 = -[UIWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
    -[UIWindow windowScene](self, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "interfaceOrientation");

    if (v15 != 1 && v16 == v18)
    {
LABEL_5:
      v19 = qword_1EDDC8640;
      if (!qword_1EDDC8640)
      {
        v19 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1EDDC8640);
      }
      if ((*(_BYTE *)v19 & 1) != 0)
      {
        v42 = *(id *)(v19 + 8);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          if (self)
          {
            v43 = (void *)MEMORY[0x1E0CB3940];
            v44 = self;
            v45 = (objc_class *)objc_opt_class();
            NSStringFromClass(v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p>"), v46, v44);
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v47 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 138412546;
          v62 = v47;
          v63 = 2112;
          v64 = v14;
          _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "%@: Cleaning up previous orientation transaction: %@", buf, 0x16u);

        }
      }
      -[UIWindow _cleanupOrientationTransactionIfNecessary](self, "_cleanupOrientationTransactionIfNecessary");
      goto LABEL_9;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      _UIInterfaceOrientationDebugDescription(v16);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _UIInterfaceOrientationDebugDescription(v18);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v62 = v10;
      v63 = 2112;
      v64 = v39;
      v65 = 2112;
      v66 = v40;
      v67 = 2112;
      v68 = v14;
      _os_log_fault_impl(&dword_185066000, v38, OS_LOG_TYPE_FAULT, "A new orientation transaction token is being requested while a valid one already exists. reason=%@; windowOrient"
        "ation=%@; sceneOrientation=%@; existingTransaction=%@",
        buf,
        0x2Au);
    }
    else
    {
      v36 = qword_1EDDC8630;
      if (!qword_1EDDC8630)
      {
        v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v36, (unint64_t *)&qword_1EDDC8630);
      }
      v37 = *(NSObject **)(v36 + 8);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
LABEL_36:
        if (v15 == 1)
        {
          v41 = qword_1EDDC8638;
          if (!qword_1EDDC8638)
          {
            v41 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v41, (unint64_t *)&qword_1EDDC8638);
          }
          if ((*(_BYTE *)v41 & 1) != 0)
          {
            v53 = *(id *)(v41 + 8);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              if (self)
              {
                v54 = (void *)MEMORY[0x1E0CB3940];
                v55 = self;
                v56 = (objc_class *)objc_opt_class();
                NSStringFromClass(v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "stringWithFormat:", CFSTR("<%@: %p>"), v57, v55);
                v58 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v58 = CFSTR("(nil)");
              }
              *(_DWORD *)buf = 138412546;
              v62 = v58;
              v63 = 2112;
              v64 = v14;
              _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "%@: Cancelling previous orientation transaction because a new one was requested: %@", buf, 0x16u);

            }
          }
          -[__CFString cancel](v14, "cancel");
          goto LABEL_9;
        }
        goto LABEL_5;
      }
      v38 = v37;
      _UIInterfaceOrientationDebugDescription(v16);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _UIInterfaceOrientationDebugDescription(v18);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v62 = v10;
      v63 = 2112;
      v64 = v39;
      v65 = 2112;
      v66 = v40;
      v67 = 2112;
      v68 = v14;
      _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "A new orientation transaction token is being requested while a valid one already exists. reason=%@; windowOrient"
        "ation=%@; sceneOrientation=%@; existingTransaction=%@",
        buf,
        0x2Au);
    }

LABEL_35:
    goto LABEL_36;
  }
LABEL_9:
  v20 = -[UIWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
  if (-[UIWindow isInterfaceAutorotationDisabled](self, "isInterfaceAutorotationDisabled"))
  {
    v21 = qword_1EDDC8648;
    if (!qword_1EDDC8648)
    {
      v21 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&qword_1EDDC8648);
    }
    if ((*(_BYTE *)v21 & 1) != 0)
    {
      v22 = *(id *)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = self;
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v59, v24);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = CFSTR("(nil)");
        }
        v60 = v26;
        _UIInterfaceOrientationDebugDescription(v20);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v26;
        v63 = 2112;
        v64 = v52;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "%@: Window autorotation is already disabled. Will use the current window orientation (%@) as the target orientation.", buf, 0x16u);

      }
    }
  }
  else
  {
    -[UIWindow _executeDeferredOrientationUpdate](self, "_executeDeferredOrientationUpdate");
    v20 = -[UIWindow _interfaceOrientationForSupportedOrientations:preferredOrientation:](self, "_interfaceOrientationForSupportedOrientations:preferredOrientation:", a3, a4);
  }
  v27 = -[_UIForcedOrientationTransactionToken initWithOriginalOrientation:handler:reason:disablingInterfaceAutorotation:]([_UIForcedOrientationTransactionToken alloc], "initWithOriginalOrientation:handler:reason:disablingInterfaceAutorotation:", -[UIWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation"), self, v10, !v6);

  -[UIWindow _setOrientationTransactionToken:](self, "_setOrientationTransactionToken:", v27);
  if (!v6)
    -[UIWindow beginDisablingInterfaceAutorotation](self, "beginDisablingInterfaceAutorotation");
  if (v20 != -[UIWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation"))
    -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)&self->super.super.super.isa, v20, 1, 1, 0.0);
  v28 = qword_1EDDC8650;
  if (!qword_1EDDC8650)
  {
    v28 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v28, (unint64_t *)&qword_1EDDC8650);
  }
  if ((*(_BYTE *)v28 & 1) != 0)
  {
    v30 = *(id *)(v28 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        v32 = self;
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@: %p>"), v34, v32);
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v35 = CFSTR("(nil)");
      }
      v48 = v35;
      _UIInterfaceOrientationDebugDescription(v20);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      _UIInterfaceOrientationDebugDescription(a4);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _UIInterfaceOrientationMaskDebugDescription(a3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v62 = v35;
      v63 = 2112;
      v64 = v10;
      v65 = 2112;
      v66 = v49;
      v67 = 2112;
      v68 = v50;
      v69 = 2112;
      v70 = v51;
      _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "%@: Orientation transaction issued for reason: %@. targetOrientation=%@; preferredOrientation=%@; supportedOrientations=[%@].",
        buf,
        0x34u);

    }
  }
LABEL_25:

  return v27;
}

- (void)commitOrientationTransaction:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  v4 = a4;
  v7 = a3;
  -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 4295, CFSTR("Unexpected orientation transaction token. Expected: %@; Received: %@"),
      v13,
      v7);

  }
  if (objc_msgSend(v7, "disablesInterfaceAutorotation"))
    -[UIWindow endDisablingInterfaceAutorotationAnimated:](self, "endDisablingInterfaceAutorotationAnimated:", v4);
  else
    -[UIWindow _updateOrientationPreferencesAnimated:](self, "_updateOrientationPreferencesAnimated:", v4);
  *(_QWORD *)&self->_windowFlags |= 0x8000000000uLL;
  -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIWindow_commitOrientationTransaction_animated___block_invoke;
  block[3] = &unk_1E16B1500;
  objc_copyWeak(&v16, &location);
  v15 = v9;
  v11 = v9;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __50__UIWindow_commitOrientationTransaction_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_orientationTransactionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    v5 = _UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_5___s_category;
    if (!_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_5___s_category)
    {
      v5 = __UILogCategoryGetNode("OrientationTransaction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_5___s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(id *)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = WeakRetained;
        v14 = v7;
        if (v7)
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = v7;
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = CFSTR("(nil)");
        }

        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%@: Commit of orientation transaction timed-out. Proceeding with cleanup. token=%@", buf, 0x16u);

      }
    }
    objc_msgSend(WeakRetained, "_cleanupOrientationTransactionIfNecessary");
  }

}

- (void)cancelOrientationTransaction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _orientationTransactionToken](self, "_orientationTransactionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 4325, CFSTR("Unexpected orientation transaction token. Expected: %@; Received: %@"),
      v7,
      v8);

  }
  -[UIWindow _setOrientationTransactionToken:](self, "_setOrientationTransactionToken:", 0);
  if (objc_msgSend(v8, "disablesInterfaceAutorotation"))
    -[UIWindow endDisablingInterfaceAutorotationAnimated:](self, "endDisablingInterfaceAutorotationAnimated:", 0);
  else
    -[UIWindow _updateOrientationPreferencesAnimated:](self, "_updateOrientationPreferencesAnimated:", 0);
  -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)&self->super.super.super.isa, objc_msgSend(v8, "originalInterfaceOrientation"), 1, 1, 0.0);

}

- (void)_setInterfaceOrientationMapResolver:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceOrientationMapResolver, a3);
}

- (id)_acquireOrientationLockAssertionWithReason:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _UIDeallocInvalidatable *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE location[12];
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a1;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = _acquireOrientationLockAssertionWithReason____s_category;
    if (!_acquireOrientationLockAssertionWithReason____s_category)
    {
      v9 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_acquireOrientationLockAssertionWithReason____s_category);
    }
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v19 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v8;
        v24 = 2112;
        v25 = v3;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "%@: Issuing orientation lock assertion for reason: %@", location, 0x16u);
      }
    }
    objc_msgSend(v5, "beginDisablingInterfaceAutorotation");
    objc_initWeak((id *)location, v5);
    v10 = [_UIDeallocInvalidatable alloc];
    v11 = v5;
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__UIWindow__acquireOrientationLockAssertionWithReason___block_invoke;
    v20[3] = &unk_1E16DE510;
    v16 = v8;
    v21 = v16;
    objc_copyWeak(&v22, (id *)location);
    v17 = -[_UIDeallocInvalidatable initWithIdentifier:faultForDeallocInvalidation:invalidationBlock:](v10, v15, 0, v20);
    objc_destroyWeak(&v22);

    objc_destroyWeak((id *)location);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __55__UIWindow__acquireOrientationLockAssertionWithReason___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_6___s_category;
  if (!_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_6___s_category)
  {
    v2 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_6___s_category);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v4 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%@: Invalidating orientation lock assertion.", (uint8_t *)&v6, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "endDisablingInterfaceAutorotation");

}

BOOL __89__UIWindow__shouldAutorotateToInterfaceOrientation_checkForDismissal_isRotationDisabled___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  _BYTE *v7;
  _BOOL8 v8;

  v5 = a2;
  v6 = objc_msgSend(v5, "shouldAutorotate");
  v7 = *(_BYTE **)(a1 + 32);
  if (v7 && (v6 & 1) == 0)
    *v7 = 1;
  if (v6)
    v8 = -[UIViewController __withSupportedInterfaceOrientation:apply:](v5, a3, 0);
  else
    v8 = 0;

  return v8;
}

void __45__UIWindow__executeDeferredOrientationUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(void (***)(_QWORD, _QWORD, _QWORD))(v1 + 32);
    v3 = *(_QWORD *)(v1 + 16);
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  v4 = (void *)UIApp;
  v5 = v2;
  ((void (**)(id, uint64_t, uint64_t))v2)[2](v5, v3, objc_msgSend(v4, "_expectedViewOrientation"));

}

uint64_t __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  kdebug_trace();
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "interfaceOrientation");
  objc_msgSend(*(id *)(a1 + 32), "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v3, v4, v5, *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke_2;
  v11[3] = &unk_1E16B2150;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v11, 0);

  if (*(_BYTE *)(a1 + 88))
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v8, v9, *(double *)(a1 + 72), *(double *)(a1 + 80));

  }
  return kdebug_trace();
}

uint64_t __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

uint64_t __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    *(_QWORD *)(*(_QWORD *)(result + 32) + 504) = *(_QWORD *)(result + 40);
    result = objc_msgSend(*(id *)(result + 32), "_isHostedInAnotherProcess");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v2 + 32), "_updateTransformLayer");
  }
  return result;
}

- (void)_updateInterfaceOrientationFromDeviceOrientation
{
  -[UIWindow _updateInterfaceOrientationFromDeviceOrientation:](self, "_updateInterfaceOrientationFromDeviceOrientation:", 1);
}

- (void)setAutorotates:(BOOL)a3
{
  -[UIWindow setAutorotates:forceUpdateInterfaceOrientation:](self, "setAutorotates:forceUpdateInterfaceOrientation:", a3, 1);
}

- (void)_forceTwoPartRotationAnimation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)_setRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5
{
  -[UIWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", a3, 1, a5, a4);
}

- (void)_legacySetRotatableViewOrientation:(int64_t)a3 duration:(double)a4
{
  -[UIWindow _legacySetRotatableViewOrientation:duration:force:](self, "_legacySetRotatableViewOrientation:duration:force:", a3, 0, a4);
}

- (void)_legacySetRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5
{
  -[UIWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", a3, 1, a5, a4);
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, a2, a3, *(double *)(a1 + 32) * 0.5, 0.0);
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  uint64_t result;
  CGAffineTransform v8;

  if (*(_BYTE *)(a1 + 84))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "slideHeaderViewAndFooterViewOffScreen:forInterfaceOrientation:", 1, *(_QWORD *)(a1 + 56));
    v3 = *(_QWORD *)(a1 + 56);
    switch(v3)
    {
      case 1:
        v4 = 0.0;
        break;
      case 3:
        v4 = 90.0;
        break;
      case 4:
        v4 = -90.0;
        break;
      default:
        v4 = 180.0;
        if (v3 != 2)
          v4 = 0.0;
        break;
    }
    v5 = v4 + (double)*(int *)(a1 + 80) * 0.5;
    objc_msgSend(v2, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeRotation(&v8, v5 * 0.0174532925);
    objc_msgSend(v6, "setTransform:", &v8);

  }
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "window:willAnimateFirstHalfOfRotationToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72) * 0.5);
  return result;
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedFirstHalfRotation:context:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, *(double *)(a1 + 32), 0.0);
}

void __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  UIStatusBarOrientationAnimationParameters *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  int v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  CGAffineTransform v53;
  CGAffineTransform v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGAffineTransform v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 1:
      v3 = 0.0;
      break;
    case 3:
      v3 = 1.57079633;
      break;
    case 4:
      v3 = -1.57079633;
      break;
    default:
      v3 = 3.14159265;
      if (v2 != 2)
        v3 = 0.0;
      break;
  }
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeRotation(&v59, v3);
  *(float64x2_t *)&v59.a = vrndaq_f64(*(float64x2_t *)&v59.a);
  *(float64x2_t *)&v59.c = vrndaq_f64(*(float64x2_t *)&v59.c);
  *(float64x2_t *)&v59.tx = vrndaq_f64(*(float64x2_t *)&v59.tx);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v56 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 72)
          && (v10 = *(void **)(a1 + 40),
              objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "rotatingClient"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11),
              v11,
              !(_DWORD)v10))
        {
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_6;
          v52[3] = &unk_1E16BF720;
          v52[4] = v9;
          v53 = v59;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v52);
        }
        else
        {
          v12 = *(void **)(a1 + 48);
          if ((dyld_program_sdk_at_least() & 1) != 0
            || v12 && objc_msgSend(v12, "_forceLayoutEngineSolutionInRationalEdges"))
          {
            v54 = v59;
            if (!CGAffineTransformIsIdentity(&v54))
            {
              objc_msgSend(v9, "contentView");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "_setHostsLayoutEngine:", 1);

            }
          }
          objc_msgSend(v9, "contentView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v59;
          objc_msgSend(v14, "setTransform:", &v54);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v6);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 504) = *(_QWORD *)(a1 + 56);
  v15 = objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", *(_QWORD *)(a1 + 48));
  v16 = v15;
  if (*(_BYTE *)(a1 + 73) && *(_QWORD *)(a1 + 56) != v15)
  {
    v17 = -[UIStatusBarOrientationAnimationParameters initWithDefaultParameters]([UIStatusBarOrientationAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarOrientationAnimationParameters setOrientationAnimation:](v17, "setOrientationAnimation:", 2);
    -[UIStatusBarAnimationParameters setDuration:](v17, "setDuration:", *(double *)(a1 + 64));
    v18 = (void *)UIApp;
    v19 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStatusBarOrientation:fromOrientation:windowScene:animationParameters:updateBlock:", v19, v16, v20, v17, 0);

  }
  v43 = v16;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = *(id *)(a1 + 32);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "rotatingClient");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v26);
        if (*(_BYTE *)(a1 + 74))
          v28 = 1;
        else
          v28 = v27 == 0;
        if (v28 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "window:setupWithInterfaceOrientation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        }
        else
        {
          objc_msgSend(v26, "window:willAnimateRotationToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v23);
  }

  if (*(_BYTE *)(a1 + 75) && !*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 48);
    v31 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", v32, CFSTR("UIWindowNewOrientationUserInfoKey"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillAnimateRotationNotification"), v30, v33);

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v34 = *(id *)(a1 + 32);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
          v40 = *(void **)(a1 + 40);
          objc_msgSend(v39, "rotatingClient");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = objc_msgSend(v40, "containsObject:", v41);

          if ((_DWORD)v40)
            objc_msgSend(v39, "rotateSnapshots");
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      }
      while (v36);
    }

  }
  if (*(_QWORD *)(a1 + 56) != v43)
  {
    objc_msgSend(*(id *)(a1 + 48), "windowScene");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_updateClientSettingsToInterfaceOrientation:withAnimationDuration:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));

  }
}

void __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_6(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v4);

}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v4 = 0;
  else
    v4 = *(unsigned __int8 *)(a1 + 49) != 0;
  return objc_msgSend(v3, "_finishedFullRotation:context:skipNotification:", a2, *(_QWORD *)(a1 + 40), v4);
}

- (void)_finishedFirstHalfRotation:(id)a3 finished:(BOOL)a4 context:(id)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  UIWindow *v22;
  id v23;
  CGAffineTransform v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  CGAffineTransform v28;

  v6 = a5;
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "window:didAnimateFirstHalfOfRotationToInterfaceOrientation:", self, objc_msgSend(v7, "toOrientation"));
  memset(&v28, 0, sizeof(v28));
  v9 = objc_msgSend(v7, "toOrientation");
  v10 = 0.0;
  if (v9 != 1)
  {
    if (objc_msgSend(v7, "toOrientation", 0.0) == 4)
    {
      v10 = -1.57079633;
    }
    else if (objc_msgSend(v7, "toOrientation") == 3)
    {
      v10 = 1.57079633;
    }
    else
    {
      v11 = objc_msgSend(v7, "toOrientation");
      v10 = 3.14159265;
      if (v11 != 2)
        v10 = 0.0;
    }
  }
  CGAffineTransformMakeRotation(&v28, v10);
  *(float64x2_t *)&v28.a = vrndaq_f64(*(float64x2_t *)&v28.a);
  *(float64x2_t *)&v28.c = vrndaq_f64(*(float64x2_t *)&v28.c);
  *(float64x2_t *)&v28.tx = vrndaq_f64(*(float64x2_t *)&v28.tx);
  objc_msgSend(v7, "duration");
  v13 = v12;
  if (v12 > 0.0)
    objc_msgSend(v7, "finishFirstHalfRotation");
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke;
  v26[3] = &unk_1E16C11C0;
  v27 = v7;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_2;
  v20[3] = &unk_1E16DE678;
  v25 = v13 > 0.0;
  v21 = v27;
  v22 = self;
  v23 = WeakRetained;
  v24 = v28;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_3;
  v18[3] = &unk_1E16B2218;
  v18[4] = self;
  v19 = v6;
  v15 = v27;
  v16 = WeakRetained;
  v17 = v6;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v13 > 0.0, v26, v20, v18);

}

void __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v7 = a2;
  objc_msgSend(v4, "duration");
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v7, v5, v6 * 0.5, 0.0);

}

void __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  if (*(_BYTE *)(a1 + 104))
    objc_msgSend(*(id *)(a1 + 32), "slideHeaderViewAndFooterViewOffScreen:forInterfaceOrientation:", 0, objc_msgSend(*(id *)(a1 + 32), "toOrientation"));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 504) = objc_msgSend(*(id *)(a1 + 32), "toOrientation");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = objc_msgSend(*(id *)(a1 + 32), "fromOrientation");
    objc_msgSend(*(id *)(a1 + 32), "duration");
    objc_msgSend(v2, "window:willAnimateSecondHalfOfRotationFromInterfaceOrientation:duration:", v3, v4, v5 * 0.5);
  }
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(a1 + 72);
  v8[0] = *(_OWORD *)(a1 + 56);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(v6, "setTransform:", v8);

}

uint64_t __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedFullRotation:context:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_finishedFullRotation:(BOOL)a3 context:(id)a4 skipNotification:(BOOL)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  id WeakRetained;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v11, "skipClientRotationCallbacks") & 1) == 0)
          objc_msgSend(v11, "finishFullRotateUsingOnePartAnimation:", (*(_QWORD *)&self->_windowFlags >> 11) & 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v8);
  }
  *(_QWORD *)&self->_windowFlags &= 0xFFFFFFFFFFFFF3FFLL;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if ((objc_msgSend(v17, "skipClientRotationCallbacks") & 1) == 0)
        {
          objc_msgSend(v17, "rotatingClient");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_opt_respondsToSelector();

          if ((v19 & 1) != 0)
          {
            objc_msgSend(v17, "rotatingClient");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "window:didRotateFromInterfaceOrientation:", self, objc_msgSend(v17, "fromOrientation"));

          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v14);
  }

  if ((unint64_t)objc_msgSend(v12, "count") > 1
    || (objc_msgSend(v12, "lastObject"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController),
        v23 = v21 == WeakRetained,
        WeakRetained,
        v21,
        !v23))
  {
    if (!a5)
    {
      objc_msgSend(v12, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v24, "fromOrientation"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, CFSTR("UIWindowOldOrientationUserInfoKey"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("UIWindowDidRotateNotification"), self, v28);

    }
  }
  -[UIWindow endDisablingInterfaceAutorotation](self, "endDisablingInterfaceAutorotation");

}

- (void)_finishedFullRotation:(id)a3 finished:(id)a4 context:(id)a5
{
  -[UIWindow _finishedFullRotation:context:skipNotification:](self, "_finishedFullRotation:context:skipNotification:", a4 != 0, a5, 0);
}

- (void)_setWindowInterfaceOrientation:(int64_t)a3
{
  self->_viewOrientation = a3;
}

+ (unsigned)_synchronizeDrawingAcrossProcesses
{
  void *v2;
  void *v3;
  unsigned int v4;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CAFenceHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copyPort");

  if (v4 - 1 <= 0xFFFFFFFD && os_variant_has_internal_diagnostics())
  {
    v6 = _synchronizeDrawingAcrossProcesses___s_category;
    if (!_synchronizeDrawingAcrossProcesses___s_category)
    {
      v6 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_synchronizeDrawingAcrossProcesses___s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)MEMORY[0x1E0CB3978];
        v9 = v7;
        objc_msgSend(v8, "callStackSymbols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = 67109378;
        v11[1] = v4;
        v12 = 2114;
        v13 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "returning a raw fence port (%x) from deprecated UIWindow SPI %{public}@", (uint8_t *)v11, 0x12u);

      }
    }
  }
  objc_msgSend(v2, "invalidate");

  return v4;
}

+ (void)_synchronizeDrawingAcrossProcessesOverPort:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v8 = _synchronizeDrawingAcrossProcessesOverPort____s_category;
    if (!_synchronizeDrawingAcrossProcessesOverPort____s_category)
    {
      v8 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_synchronizeDrawingAcrossProcessesOverPort____s_category);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)MEMORY[0x1E0CB3978];
        v11 = v9;
        objc_msgSend(v10, "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = 67109378;
        v13[1] = a3;
        v14 = 2114;
        v15 = v12;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "fencing on port (%x) using deprecated UIWindow SPI %{public}@", (uint8_t *)v13, 0x12u);

      }
    }
  }
  v5 = (void *)MEMORY[0x1E0CD2778];
  if (BSMachSendRightRetain())
    v6 = a3;
  else
    v6 = 0;
  objc_msgSend(v5, "handleForPort:fenceId:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_synchronizeDrawingWithCAFence:preCommitHandler:", v7, 0);
  objc_msgSend(v7, "invalidate");

}

+ (void)_synchronizeDrawingAcrossProcessesOverPort:(unsigned int)a3 withPreCommitHandler:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CD2778];
  v7 = a4;
  if (BSMachSendRightRetain())
    v8 = a3;
  else
    v8 = 0;
  objc_msgSend(v6, "handleForPort:fenceId:", v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_synchronizeDrawingWithCAFence:preCommitHandler:", v9, v7);

  objc_msgSend(v9, "invalidate");
}

+ (id)_synchronizedDrawingFence
{
  return +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
}

- (void)_createOtherSystemGateGestureRecognizersIfNeeded
{
  _UIHomeAffordanceGateGestureRecognizer *v3;
  _UIHomeAffordanceGateGestureRecognizer *systemGestureGateForHomeAffordance;
  _UIGESGateGestureRecognizer *v5;
  _UIGESGateGestureRecognizer *systemGateForGESTouches;

  if (+[_UIHomeAffordanceGateGestureRecognizer isAvailable]()
    && !self->_systemGestureGateForHomeAffordance
    && !-[UIWindow _isSystemGestureWindow](self, "_isSystemGestureWindow"))
  {
    v3 = (_UIHomeAffordanceGateGestureRecognizer *)objc_opt_new();
    systemGestureGateForHomeAffordance = self->_systemGestureGateForHomeAffordance;
    self->_systemGestureGateForHomeAffordance = v3;

    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_systemGestureGateForHomeAffordance);
  }
  if (_UIApplicationSupportsGlobalEdgeSwipeTouches())
  {
    if (!self->_systemGateForGESTouches)
    {
      v5 = -[_UIGESGateGestureRecognizer initWithTarget:action:]([_UIGESGateGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
      systemGateForGESTouches = self->_systemGateForGESTouches;
      self->_systemGateForGESTouches = v5;

      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_systemGateForGESTouches);
      objc_msgSend((id)UIApp, "_setApplicationWantsGESEvents:", 1);
    }
  }
}

- (BOOL)_hasSystemGestureGate
{
  return self->_systemGestureGateForGestures && self->_systemGestureGateForTouches != 0;
}

- (unint64_t)_edgeForTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", 0);
  objc_msgSend(v5, "convertPoint:toWindow:", 0);
  v7 = v6;
  v9 = v8;

  -[UIWindow screen](self, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v15 = UIRectEdgeRegionForLocation(v11, v12, v13, v14, v7, v9, 30.0);

  if (!+[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled"))
  {
    objc_msgSend(v4, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "interfaceOrientation");
    v19 = 90;
    v20 = -90;
    v21 = 180;
    if (v18 != 2)
      v21 = 0;
    if (v18 != 4)
      v20 = v21;
    if (v18 != 3)
      v19 = v20;
    if (v18 == 1)
      v22 = 0;
    else
      v22 = v19;
    v15 = _rotatedEdgesGivenOrientationInDegrees(v15, v22);

  }
  return v15;
}

- (int)bitsPerComponent
{
  return 8;
}

- (void)setDelegate:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  UIWindow *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = setDelegate____s_category_0;
    if (!setDelegate____s_category_0)
    {
      v5 = __UILogCategoryGetNode("Window", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setDelegate____s_category_0);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "-[UIWindow setDelegate:] no longer supports non-UIViewControllers. The delegate should always be the window's rootViewController. Window: %@, delegate: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    -[UIWindow _setDelegateViewController:](self, "_setDelegateViewController:", v4);
  }

}

- (void)_setOverrideParentTraitEnvironment:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:", self);
    objc_storeWeak((id *)&self->_overrideParentTraitEnvironment, obj);
    if (obj)
      objc_msgSend(obj, "_registerAuxiliaryChildEnvironmentForTraitInvalidations:", self);
    -[UIWindow _invalidateAuxiliaryChildTraits](self, "_invalidateAuxiliaryChildTraits");
  }

}

- (id)_parentTraitEnvironment
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self->_windowHostingScene;
  v5 = WeakRetained;

  return v5;
}

- (id)_traitCollectionWhenRotated
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  _BOOL4 v8;
  int v9;
  double v10;
  void *v11;
  void *v12;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[UIWindow interfaceOrientation](self, "interfaceOrientation");
  v8 = +[UIWindow _transformLayerRotationsAreEnabled](UIWindow, "_transformLayerRotationsAreEnabled");
  v9 = (unint64_t)(v7 - 1) < 2 || v8;
  if (v9)
    v10 = v6;
  else
    v10 = v4;
  if (!v9)
    v4 = v6;
  -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v11, v10, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[UIWindow traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");
  v4 = objc_msgSend(v2, "verticalSizeClass");

  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)_propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _willTransitionToTraitCollection:withTransitionCoordinator:](self, "_willTransitionToTraitCollection:withTransitionCoordinator:", v6, v4);

  -[UIWindow _updateWindowTraitsAndNotify:](self, "_updateWindowTraitsAndNotify:", 1);
}

- (void)_setStateRestorationVerticalSizeClass:(int64_t)a3 horizontalSizeClass:(int64_t)a4
{
  _UIViewControllerNullAnimationTransitionCoordinator *v5;

  self->_verticalSizeClassStateRestorationOverride = a3;
  self->_horizontalSizeClassStateRestorationOverride = a4;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v5 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
    -[_UIViewControllerNullAnimationTransitionCoordinator setContainerView:](v5, "setContainerView:", self);
    -[UIWindow _propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:](self, "_propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:", v5);
    if (v5)
    {
      -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](v5, "_runAlongsideAnimations");
      -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletions](v5, "_runAlongsideCompletions");

    }
  }
  else
  {
    -[UIWindow _propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:](self, "_propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:", 0);
  }
}

- (void)_clearSizeClassesForStateRestoration
{
  self->_verticalSizeClassStateRestorationOverride = 0;
  self->_horizontalSizeClassStateRestorationOverride = 0;
  -[UIWindow _propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:](self, "_propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:", 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIWindow interfaceOrientation](self, "interfaceOrientation");
  -[UIWindow screen](self, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v8, v9, 0, width, height);

  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = self;
  v18.super_class = (Class)UIWindow;
  -[UIView setBounds:](&v18, sel_setBounds_, x, y, width, height);
  -[UIWindow _updateIsSceneSizedFlag](self, "_updateIsSceneSizedFlag");
  -[UIWindow _autolayout_windowDidChangeBoundsFrom:](self, "_autolayout_windowDidChangeBoundsFrom:", v11, v13, v15, v17);
  -[UIWindow _updateWindowTraitsAndNotify:](self, "_updateWindowTraitsAndNotify:", 1);
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  -[UIView center](self, "center");
  v7 = v6;
  v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)UIWindow;
  -[UIView setCenter:](&v10, sel_setCenter_, x, y);
  -[UIWindow _autolayout_windowDidChangeCenterFrom:](self, "_autolayout_windowDidChangeCenterFrom:", v7, v9);
}

- (void)_makeExternalKeyWindow
{
  qword_1EDDC85A8 = (uint64_t)self;
}

uint64_t __29__UIWindow_makeKeyAndVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_makeKeyAndVisible");
}

- (id)contentView
{
  void *v2;
  void *v3;

  -[UIView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_unregisterChargedView:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  UIWindow *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex FirstIndexOfValue;
  id value;
  CFRange v11;

  v4 = a3;
  v5 = (const __CFDictionary *)qword_1EDDC85B8;
  v6 = self;
  value = v4;
  if (v5)
  {
    v7 = (const __CFArray *)CFDictionaryGetValue(v5, v6);
    if (v7)
    {
      v8 = v7;
      v11.length = CFArrayGetCount(v7);
      v11.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v8, v11, value);
      if (FirstIndexOfValue != -1)
        CFArrayRemoveValueAtIndex(v8, FirstIndexOfValue);
    }
  }

}

+ (void)_unregisterChargedView:(id)a3
{
  id v3;
  const __CFDictionary *v4;
  CFIndex Count;
  uint64_t v6;
  const void **v7;
  char v8;
  uint64_t i;
  const __CFArray *v10;
  CFIndex FirstIndexOfValue;
  CFIndex j;
  void *v13;
  id value;
  CFRange v15;
  CFRange v16;

  v3 = a3;
  v4 = (const __CFDictionary *)qword_1EDDC85B8;
  value = v3;
  if (!v4)
    goto LABEL_13;
  Count = CFDictionaryGetCount(v4);
  v6 = Count;
  v7 = (const void **)qword_1EDDC86C8;
  if (Count > qword_1EDDC86C0)
  {
    qword_1EDDC86C0 = Count;
    v7 = (const void **)malloc_type_realloc((void *)qword_1EDDC86C8, 8 * Count, 0xC0040B8AA526DuLL);
    qword_1EDDC86C8 = (uint64_t)v7;
  }
  CFDictionaryGetKeysAndValues(v4, 0, v7);
  if (v6 < 1)
  {
LABEL_13:

    goto LABEL_14;
  }
  v8 = 0;
  for (i = 0; i != v6; ++i)
  {
    v10 = *(const __CFArray **)(qword_1EDDC86C8 + 8 * i);
    v15.length = CFArrayGetCount(v10);
    v15.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v10, v15, value);
    if (FirstIndexOfValue != -1)
    {
      for (j = FirstIndexOfValue; j != -1; j = CFArrayGetFirstIndexOfValue(v10, v16, value))
      {
        CFArrayRemoveValueAtIndex(v10, j);
        v16.length = CFArrayGetCount(v10);
        v16.location = 0;
      }
      v8 = 1;
    }
  }

  v13 = value;
  if ((v8 & 1) != 0)
  {
    NSLog(CFSTR("Charged view %p was still registered to a window when it was deallocated."), value);
LABEL_14:
    v13 = value;
  }

}

- (id)_registeredScrollToTopViews
{
  void *v2;
  void *v3;

  if (qword_1EDDC85C0)
  {
    CFDictionaryGetValue((CFDictionaryRef)qword_1EDDC85C0, self);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "compact");
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setIsResigningFirstResponderFromHost:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)_isResigningFirstResponderFromHost
{
  return *((_BYTE *)&self->_windowFlags + 4) & 1;
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  return 0;
}

- (id)_deepestActionResponder
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_hasDeepestActionResponder") & 1) != 0)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deepestActionResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWindow;
    -[UIResponder _deepestActionResponder](&v7, sel__deepestActionResponder);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_undoManagerForValidatingUndoRedoCommands
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UIWindow firstResponder](self, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIWindow;
    -[UIResponder _undoManagerForValidatingUndoRedoCommands](&v9, sel__undoManagerForValidatingUndoRedoCommands);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)undo:(id)a3
{
  void *v3;
  id v4;

  -[UIWindow firstResponder](self, "firstResponder", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undo");

}

- (void)redo:(id)a3
{
  void *v3;
  id v4;

  -[UIWindow firstResponder](self, "firstResponder", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redo");

}

+ (void)_noteStatusBarHeightChanged:(double)a3 oldHeight:(double)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v11, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if ((objc_msgSend(v17, "_isStatusBarWindow") & 1) == 0)
                objc_msgSend(v17, "handleStatusBarChangeFromHeight:toHeight:", a4, a3);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v14);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

}

+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v12, a3, a4, 0, 0, x, y, width, height);

  return v13;
}

+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5 outTransform:(CGAffineTransform *)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v14;
  void *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v14, a3, a4, 0, a6, x, y, width, height);

  return v15;
}

+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5 usePurpleGfx:(BOOL)a6 outTransform:(CGAffineTransform *)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v15;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen", a3, a4, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v15, a3, a4, 0, a7, x, y, width, height);

  return v16;
}

+ (void)createIOSurfaceOnScreen:(id)a3 withContextIds:(const unsigned int *)a4 count:(unint64_t)a5 frame:(CGRect)a6 usePurpleGfx:(BOOL)a7 outTransform:(CGAffineTransform *)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  CGFloat v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a3;
  objc_msgSend(v16, "scale");
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v17, v17);
  v22 = v23;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v25 = CGRectApplyAffineTransform(v24, &v22);
  if (a8)
  {
    v18 = MEMORY[0x1E0C9BAA8];
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a8->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a8->c = v19;
    *(_OWORD *)&a8->tx = *(_OWORD *)(v18 + 32);
  }
  v22 = v23;
  v20 = (void *)objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:baseTransform:", v16, a4, a5, &v22, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);

  return v20;
}

+ (void)createIOSurfaceOnScreen:(id)a3 withContextIds:(const unsigned int *)a4 count:(unint64_t)a5 frame:(CGRect)a6 baseTransform:(CGAffineTransform *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  __int128 v15;
  __IOSurface *v16;
  __IOSurface *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  float v30;
  void *v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  __IOSurface *v37;
  void *v38;
  CATransform3D v39;
  CGAffineTransform m;
  CATransform3D v41;
  _QWORD v42[6];
  _QWORD v43[6];
  _QWORD v44[2];
  _QWORD v45[4];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v45[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  memset(&v41, 0, sizeof(v41));
  v15 = *(_OWORD *)&a7->c;
  *(_OWORD *)&m.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&m.c = v15;
  *(_OWORD *)&m.tx = *(_OWORD *)&a7->tx;
  CATransform3DMakeAffineTransform(&v41, &m);
  v16 = _UIRenderingBufferCreate(0, width, height);
  v17 = v16;
  if (v16)
  {
    v37 = v16;
    v38 = v14;
    v18 = (void *)objc_opt_new();
    v19 = 0x1E0C99000uLL;
    if (a5)
    {
      v20 = *MEMORY[0x1E0CD3098];
      v21 = *MEMORY[0x1E0CD3140];
      do
      {
        v44[0] = v20;
        v22 = *a4++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22, v37, v38);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v21;
        v45[0] = v23;
        v39 = v41;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v39, "{CATransform3D=dddddddddddddddd}");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v24;
        objc_msgSend(*(id *)(v19 + 3456), "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v25 = v19;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v26);

        v19 = v25;
        --a5;
      }
      while (a5);
    }
    v27 = *MEMORY[0x1E0CD3108];
    v28 = *MEMORY[0x1E0CD30A8];
    v42[0] = *MEMORY[0x1E0CD30F0];
    v42[1] = v28;
    v17 = v37;
    v14 = v38;
    v43[0] = v27;
    v43[1] = v37;
    v42[2] = *MEMORY[0x1E0CD30B0];
    objc_msgSend(v38, "_name", v37, v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v29;
    v42[3] = *MEMORY[0x1E0CD3120];
    v30 = x;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llroundf(v30));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v31;
    v42[4] = *MEMORY[0x1E0CD3128];
    v32 = y;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llroundf(v32));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = *MEMORY[0x1E0CD30A0];
    v43[4] = v33;
    v43[5] = v18;
    objc_msgSend(*(id *)(v19 + 3456), "dictionaryWithObjects:forKeys:count:", v43, v42, 6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v14, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    CARenderServerSnapshot();
  }

  return v17;
}

+ (void)createScreenIOSurface
{
  void *v2;
  void *v3;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UIWindow createIOSurfaceFromScreen:](UIWindow, "createIOSurfaceFromScreen:", v2);

  return v3;
}

+ (void)createIOSurfaceFromDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIScreen *v8;
  UIScreen *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = -[UIScreen initWithDisplayConfiguration:]([UIScreen alloc], "initWithDisplayConfiguration:", v4);
  v9 = v8;

  -[UIScreen _updateDisplayConfiguration:](v9, "_updateDisplayConfiguration:", v4);
  v10 = (void *)objc_msgSend(a1, "createIOSurfaceFromScreen:", v9);

  return v10;
}

+ (void)createIOSurfaceFromScreen:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_scale");
  v8[0] = CFSTR("src-screen");
  v8[1] = CFSTR("dst-scale");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)_UIRenderDisplay(v5, &__block_literal_global_451);
  return v6;
}

__IOSurface *__38__UIWindow_createIOSurfaceFromScreen___block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  return _UIRenderingBufferCreate(a4, a1, a2);
}

- (void)createIOSurfaceWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  int v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  v8 = objc_msgSend(WeakRetained, "contextId");

  v12 = v8;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[UIWindow createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:](UIWindow, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v9, &v12, 1, 0, 0, x, y, width, height);

  return v10;
}

- (void)createIOSurface
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  objc_msgSend(WeakRetained, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "frame");
    v5 = -[UIWindow createIOSurfaceWithFrame:](self, "createIOSurfaceWithFrame:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_sceneClientOrientation
{
  return self->_sceneClientOrientation;
}

- (CGRect)_convertRectFromSceneReferenceSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  v9 = v8;
  v11 = v10;
  -[_UISceneUIWindowHosting _effectiveSettings](self->_windowHostingScene, "_effectiveSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(objc_msgSend(v12, "interfaceOrientation"), x, y, width, height, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[_UISceneUIWindowHosting _coordinateSpace](self->_windowHostingScene, "_coordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v20, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)_convertRectToSceneReferenceSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISceneUIWindowHosting _coordinateSpace](self->_windowHostingScene, "_coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[UIWindow _sceneReferenceBounds](self, "_sceneReferenceBounds");
  v18 = v17;
  v20 = v19;
  -[_UISceneUIWindowHosting _effectiveSettings](self->_windowHostingScene, "_effectiveSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _UIWindowConvertRectFromSceneSpaceToSceneReferenceSpace(objc_msgSend(v21, "interfaceOrientation"), v10, v12, v14, v16, v18, v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (id)_topVisibleWindowPassingTest:(id)a3
{
  unsigned int (**v3)(id, void *);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (unsigned int (**)(id, void *))a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        v11 = v7;
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_topVisibleWindowPassingTest:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          if (!v8 || (objc_msgSend(v7, "windowLevel"), v13 = v12, objc_msgSend(v8, "windowLevel"), v13 > v14))
          {
            if (!v3 || v3[2](v3, v7))
            {
              v15 = v7;

              v8 = v15;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  return v8;
}

+ (id)_globalHitTestForLocation:(CGPoint)a3 sceneLocationZ:(double)a4 inWindowServerHitTestWindow:(id)a5 withEvent:(id)a6
{
  double y;
  double x;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  y = a3.y;
  x = a3.x;
  v11 = (id *)a5;
  v12 = a6;
  -[UIWindow _fbsScene](v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "_usesWindowServerHitTesting")
    || (objc_msgSend(v11, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", v13, v11, v12, x, y, a4), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "_hitTestToPoint:scenePointZ:forEvent:windowServerHitTestWindow:", v12, v11, x, y, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", v13, v11, v12, x, y, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)_automaticContainerBackgroundIsGlass
{
  return 0;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return !-[UIWindow isInternalWindow](self, "isInternalWindow");
}

- (BOOL)_canDisableMirroring
{
  return 1;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return !-[UIWindow isInternalWindow](self, "isInternalWindow");
}

- (void)_willSnapshot
{
  -[UIWindow _setShouldDisableTransformLayerScalingForSnapshotting:](self, "_setShouldDisableTransformLayerScalingForSnapshotting:", 1);
}

- (void)_didSnapshot
{
  -[UIWindow _setShouldDisableTransformLayerScalingForSnapshotting:](self, "_setShouldDisableTransformLayerScalingForSnapshotting:", 0);
}

- (BOOL)_isExternallyPlaced
{
  return 0;
}

+ (id)_findWindowForControllingOverallAppearance
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)UIApp, "_mainScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "_findWindowForControllingOverallAppearanceInWindowScene:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isSceneSized
{
  return (*((unsigned __int8 *)&self->_windowFlags + 3) >> 6) & 1;
}

+ (id)_findWithDisplayPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  double v19;
  uint64_t v20;

  y = a3.y;
  x = a3.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;
  objc_msgSend(v6, "_rotation");
  v10 = v9;
  objc_msgSend(v6, "_unjailedReferenceBoundsInPixels");
  v12 = _UIScreenConvertFromCAScreen(x, y, v8, v10, v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__UIWindow__findWithDisplayPoint___block_invoke;
  v17[3] = &unk_1E16DE800;
  v18 = v6;
  v19 = v12;
  v20 = v13;
  v14 = v6;
  objc_msgSend(a1, "_topVisibleWindowPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __34__UIWindow__findWithDisplayPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = 0;
  if ((objc_msgSend(v3, "_ignoresHitTest") & 1) == 0 && v4 == v5)
  {
    objc_msgSend(v3, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", 0, 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  return v6;
}

- (CGPoint)_transformDisplayToWindowCoordinates:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIWindow screen](self, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;
  objc_msgSend(v6, "_rotation");
  v10 = v9;
  objc_msgSend(v6, "_unjailedReferenceBoundsInPixels");
  v12 = _UIScreenConvertFromCAScreen(x, y, v8, v10, v11);
  v14 = _UIConvertScenePoint3DToWindow(0, self, v12, v13);
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)setKeepContextInBackground:(BOOL)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFFEFFFFFFLL | v3);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);

    if (!WeakRetained)
      +[UIWindowScene _updateVisibleSceneAndWindowOrderWithTest:](UIWindowScene, "_updateVisibleSceneAndWindowOrderWithTest:", 0);
  }
}

- (void)_writeLayerTreeToPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  id v8;
  id v9;

  v4 = a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (_BYTE *)MEMORY[0x1E0CD23A8];
  *MEMORY[0x1E0CD2328] = CFSTR("public.png");
  *v7 = 1;
  *MEMORY[0x1E0CD24D8] = 1;
  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "fileSystemRepresentation");

  CAEncodeLayerTreeToFile();
}

- (void)_moveWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UIView _focusSystem](self, "_focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIWindow _focusEventRecognizer](self, "_focusEventRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_moveWithEvent:", v4);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWindow;
    -[UIResponder _moveWithEvent:](&v7, sel__moveWithEvent_, v4);
  }

}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 1;
}

- (void)_setSecure:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  id WeakRetained;

  v3 = a3;
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(_QWORD *)&self->_windowFlags & 0xFFFFFFFFDFFFFFFFLL | v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  objc_msgSend(WeakRetained, "setSecure:", v3);

}

- (BOOL)_isSecure
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  v3 = objc_msgSend(WeakRetained, "isSecure");

  return v3;
}

- (id)_accessibilityHUDContainerViewForView:(id)a3
{
  UIWindow *v4;
  double v5;
  double v6;
  UIWindow *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIWindow *v14;

  v4 = (UIWindow *)a3;
  -[UIView bounds](self, "bounds");
  v7 = v4;
  if (v4 != self)
  {
    v8 = v5;
    v9 = v6;
    v7 = v4;
    while (1)
    {
      -[UIView bounds](v7, "bounds");
      if (v10 == v8 && v11 == v9)
        break;
      if (v10 == v9 && v11 == v8)
        break;
      -[UIView superview](v7, "superview");
      v14 = (UIWindow *)objc_claimAutoreleasedReturnValue();

      v7 = v14;
      if (v14 == self)
      {
        v7 = self;
        break;
      }
    }
  }

  return v7;
}

- (void)_showAccessibilityHUDItem:(id)a3 forView:(id)a4
{
  UIAccessibilityHUDView *accessibilityHUD;
  id v7;
  UIAccessibilityHUDView *v8;
  UIAccessibilityHUDView *v9;
  UIAccessibilityHUDView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v34 = a4;
  accessibilityHUD = self->_accessibilityHUD;
  v7 = a3;
  if (accessibilityHUD)
  {
    -[UIAccessibilityHUDView setItem:](accessibilityHUD, "setItem:", v7);
  }
  else
  {
    v8 = -[UIAccessibilityHUDView initWithHUDItem:]([UIAccessibilityHUDView alloc], "initWithHUDItem:", v7);

    v9 = self->_accessibilityHUD;
    self->_accessibilityHUD = v8;

    -[UIWindow _accessibilityHUDContainerViewForView:](self, "_accessibilityHUDContainerViewForView:", v34);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v10 = self->_accessibilityHUD;
    objc_msgSend(v7, "bounds");
    -[UIAccessibilityHUDView sizeThatFits:](v10, "sizeThatFits:", v11, v12);
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[UIWindow screen](self, "screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v27 = UIRectCenteredIntegralRectScale(0.0, 0.0, v14, v16, v18, v20, v22, v24, v26);
    v29 = v28;
    v31 = v30;
    v33 = v32;

    -[UIView setFrame:](self->_accessibilityHUD, "setFrame:", v27, v29, v31, v33);
    objc_msgSend(v7, "addSubview:", self->_accessibilityHUD);
    -[UIAccessibilityHUDView showAnimated:completion:](self->_accessibilityHUD, "showAnimated:completion:", 1, 0);
  }

}

- (void)_dismissAccessibilityHUD
{
  UIAccessibilityHUDView *v3;
  UIAccessibilityHUDView *v4;
  UIAccessibilityHUDView *accessibilityHUD;
  _QWORD v6[4];
  UIAccessibilityHUDView *v7;

  v3 = self->_accessibilityHUD;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__UIWindow__dismissAccessibilityHUD__block_invoke;
  v6[3] = &unk_1E16B1B28;
  v7 = v3;
  v4 = v3;
  -[UIAccessibilityHUDView dismissAnimated:completion:](v4, "dismissAnimated:completion:", 1, v6);
  accessibilityHUD = self->_accessibilityHUD;
  self->_accessibilityHUD = 0;

}

uint64_t __36__UIWindow__dismissAccessibilityHUD__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (unint64_t)_systemReferenceAngleMode
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIWindow _windowHostingScene](self, "_windowHostingScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveUISettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hostReferenceAngleMode");

  return v4;
}

- (double)_systemReferenceAngle
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIWindow _windowHostingScene](self, "_windowHostingScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveUISettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "angleFromHostReferenceUprightDirection");
  v5 = v4;

  return v5;
}

- (id)_focusedView
{
  void *v3;
  void *v4;
  UIWindow *v5;
  id v6;

  -[UIView _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "window");
  v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (BOOL)_reversesLinearFocusWrapping
{
  return 0;
}

- (BOOL)_wantsFocusEngine
{
  _BOOL4 v3;

  if (!objc_msgSend((id)objc_opt_class(), "_isSystemWindow")
    || (v3 = -[UIWindow _isTextEffectsWindow](self, "_isTextEffectsWindow")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_installFocusEventRecognizer
{
  _UIFocusEventRecognizer *v3;
  _UIFocusEventRecognizer *focusEventRecognizer;

  if (-[UIWindow _supportsFocus](self, "_supportsFocus") && !self->_focusEventRecognizer)
  {
    if (-[UIWindow allowsWeakReference](self, sel_allowsWeakReference))
    {
      v3 = -[_UIFocusEventRecognizer initWithOwningView:]([_UIFocusEventRecognizer alloc], "initWithOwningView:", self);
      -[_UIFocusEventRecognizer setDelegate:](v3, "setDelegate:", self);
      focusEventRecognizer = self->_focusEventRecognizer;
      self->_focusEventRecognizer = v3;

    }
  }
}

- (void)_resetFocusEventRecognizer
{
  -[_UIFocusEventRecognizer reset](self->_focusEventRecognizer, "reset");
}

- (void)_installFocusIfNeededForFocusSystemSceneComponent:(id)a3
{
  void *v4;
  _UIFocusEventRecognizer *focusEventRecognizer;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "activeSceneObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginMonitoringContextChangesForWindow:", self);

  focusEventRecognizer = self->_focusEventRecognizer;
  if (!focusEventRecognizer)
  {
    objc_msgSend(v7, "focusSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIWindow _installFocusEventRecognizer](self, "_installFocusEventRecognizer");
      goto LABEL_6;
    }
    focusEventRecognizer = self->_focusEventRecognizer;
    if (!focusEventRecognizer)
      goto LABEL_6;
  }
  -[_UIFocusEventRecognizer reset](focusEventRecognizer, "reset");
LABEL_6:

}

- (UIResponder)_focusResponder
{
  void *v3;
  id v4;
  UIWindow *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v24;

  -[UIView _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferredFirstResponder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_responderWindow");
  v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    if (v4)
      goto LABEL_39;
  }
  else
  {

  }
  -[UIWindow firstResponder](self, "firstResponder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "_deepestPreferredFocusEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      _UIFirstResponderCandidateForEnvironment(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 || -[UIResponder _containsResponder:](self, "_containsResponder:", v8))
      {
LABEL_9:
        -[UIWindow _deepestActionResponder](self, "_deepestActionResponder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8)
        {
          if (v9)
          {
            _UIResponderModallyPresentedViewControllerContainingResponder(v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            _UIResponderModallyPresentedViewControllerContainingResponder(v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11 != v12)
            {
              v4 = v10;
LABEL_37:

              goto LABEL_38;
            }
            _UITreeFirstCommonAncestor(v8, v10, sel_nextResponder);
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v14;
            if ((void *)v14 == v8)
            {
              v17 = v10;
            }
            else
            {
              if ((void *)v14 != v10)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v8, "_viewControllerForAncestor");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v16 = 0;
                }
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v10, "_viewControllerForAncestor");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v18 = 0;
                }
                v24 = v18;
                _UITreeFirstCommonAncestor(v16, v18, sel_parentViewController);
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if ((void *)v19 != v16 || v19 == 0)
                  v22 = v8;
                else
                  v22 = v10;
                v4 = v22;

                goto LABEL_36;
              }
              v17 = v8;
            }
            v4 = v17;
LABEL_36:

            goto LABEL_37;
          }
          v13 = v8;
        }
        else
        {
          v13 = v9;
        }
        v4 = v13;
LABEL_38:

        goto LABEL_39;
      }

    }
    v8 = 0;
    goto LABEL_9;
  }
LABEL_39:

  return (UIResponder *)v4;
}

- (BOOL)_shouldRecognizeEventsInFocusEventRecognizer:(id)a3
{
  UIWindow *v3;
  void *v4;
  UIWindow *v5;

  v3 = self;
  -[UIWindow screen](self, "screen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_preferredFocusedWindow");
  v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v5 == v3;

  return (char)v3;
}

- (id)_focusMovementSystemForFocusEventRecognizer:(id)a3
{
  void *v3;
  void *v4;

  -[UIView _focusSystem](self, "_focusSystem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferredFirstResponderFocusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_focusEventRecognizer:(id)a3 didRecognizeFocusMovementRequest:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  objc_msgSend(v4, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_performFocusMovement:", v4);

  return v6;
}

- (void)_forwardFocusMovementAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindow.m"), 8743, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  if (-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "_forwardFocusMovementAction:", v8);
  }
  else
  {
    -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendActions:", v6);

  }
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  -[UIView _willUpdateFocusInContext:](&v5, sel__willUpdateFocusInContext_, a3);
  -[UIWindow _focusEventRecognizer](self, "_focusEventRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_resetMotionEffects");

}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 IsAncestorOfEnvironment;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(self, v5);

  if (IsAncestorOfEnvironment)
    -[UIWindow _setRememberedFocusedItem:](self, "_setRememberedFocusedItem:", 0);
  v7.receiver = self;
  v7.super_class = (Class)UIWindow;
  -[UIView _didUpdateFocusInContext:](&v7, sel__didUpdateFocusInContext_, v4);

}

- (BOOL)_prefersFocusContainment
{
  void *v2;
  char v3;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsMultipleWindows") ^ 1;

  return v3;
}

- (id)preferredFocusedView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  -[UIWindow _rememberedFocusedItem](self, "_rememberedFocusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IsKindOfUIView((uint64_t)v3))
  {
    v4 = v3;
  }
  else
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFocusedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)UIWindow;
      -[UIView preferredFocusedView](&v10, sel_preferredFocusedView);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v8;

  }
  return v4;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v7;

  if (!qword_1EDDC8670)
  {
    qword_1EDDC8670 = +[UIWindow instanceMethodForSelector:](UIWindow, "instanceMethodForSelector:", sel_preferredFocusedView);
    qword_1EDDC8678 = +[UIWindow instanceMethodForSelector:](UIWindow, "instanceMethodForSelector:", sel_preferredFocusEnvironments);
  }
  v3 = -[UIWindow methodForSelector:](self, "methodForSelector:", sel_preferredFocusedView);
  v4 = -[UIWindow methodForSelector:](self, "methodForSelector:", sel_preferredFocusEnvironments);
  if (v3)
    v5 = v3 == qword_1EDDC8670;
  else
    v5 = 1;
  if (v5)
    return 0;
  if (v4)
    v7 = v4 == qword_1EDDC8678;
  else
    v7 = 1;
  if (v7)
    return 1;
  else
    return 2;
}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIWindow rootViewController](self, "rootViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v5, -[UIWindow _subclassPreferredFocusedViewPrioritizationType](self, "_subclassPreferredFocusedViewPrioritizationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_overridingPreferredFocusEnvironment
{
  void *v3;
  void *v4;
  id v5;

  -[UIWindow _rememberedFocusedItem](self, "_rememberedFocusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (dyld_program_sdk_at_least())
      {
        if ((objc_msgSend(v4, "_canRestoreFocusAfterTransitionToItem:", v3) & 1) != 0)
          goto LABEL_11;
      }
      else if ((objc_msgSend(v4, "restoresFocusAfterTransition") & 1) != 0)
      {
LABEL_11:
        v5 = v3;
        goto LABEL_12;
      }
    }
    else if (_UIFocusEnvironmentIsAncestorOfEnvironment(self, v3) && _UIFocusItemIsFocusedOrFocusable(v3))
    {
      goto LABEL_11;
    }
    -[UIWindow _setRememberedFocusedItem:](self, "_setRememberedFocusedItem:", 0);
    v5 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v5 = 0;
LABEL_13:

  return v5;
}

- (BOOL)isTransparentFocusItem
{
  void *v3;
  int v4;
  objc_super v6;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMultipleWindows");

  if (v4)
    return _UIViewIsTransparentFocusItem(self);
  v6.receiver = self;
  v6.super_class = (Class)UIWindow;
  return -[UIView isTransparentFocusItem](&v6, sel_isTransparentFocusItem);
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  return objc_msgSend(a5, "_isInteractionBehaviorInactive", a3, a4.x, a4.y);
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  return 1;
}

- (id)restorationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWindow;
  -[UIResponder restorationIdentifier](&v7, sel_restorationIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((*((_BYTE *)&self->_windowFlags + 3) & 0x80) != 0 || !dyld_program_sdk_at_least())
      return 0;
    -[UIWindow rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restorationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(CFSTR("_UIWindow+"), "stringByAppendingString:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)setRestorationIdentifier:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (dyld_program_sdk_at_least())
    *(_QWORD *)&self->_windowFlags |= 0x80000000uLL;
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  -[UIResponder setRestorationIdentifier:](&v5, sel_setRestorationIdentifier_, v4);

}

- (BOOL)_suppressFirstResponderWhenUserInteractionDisabled
{
  return 0;
}

- (id)_remoteContentParent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v11;
  UIWindow *v12;
  UIWindow *v13;
  UIWindow *v14;

  -[UIWindow _windowHostingScene](self, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_childRemoteContentRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIWindow _windowHostingScene](self, "_windowHostingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_settingsScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_childRemoteContentRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = v7;
      goto LABEL_5;
    }
    -[UIWindow windowScene](self, "windowScene");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _keyWindow](v11);
    v12 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    if (v12 && v12 != self && -[UIWindow _isHostedInAnotherProcess](v12, "_isHostedInAnotherProcess"))
    {
      -[UIWindow _remoteContentParent](v12, "_remoteContentParent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_6;
    }
    if (-[UIWindow _isRemoteKeyboardWindow](self, "_isRemoteKeyboardWindow")
      && +[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow](_UIRemoteKeyboards, "wantsUnassociatedWindowSceneForKeyboardWindow"))
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v13 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      if (v13 != self)
      {
        v14 = v13;
        -[UIWindow _remoteContentParent](v13, "_remoteContentParent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }

    }
    v9 = 0;
    goto LABEL_17;
  }
  v5 = v3;
LABEL_5:
  v7 = v5;
  v9 = v5;
LABEL_6:

  return v9;
}

- (void)_setRoleHint:(id)a3
{
  objc_storeStrong((id *)&self->_roleHint, a3);
}

- (_UIViewControllerNullAnimationTransitionCoordinator)_traitCollectionChangeTransitionCoordinator
{
  return self->_traitCollectionChangeTransitionCoordinator;
}

- (NSMutableArray)_currentKeyboardTrackingLayoutGuides
{
  return self->_currentKeyboardTrackingLayoutGuides;
}

- (void)set_currentKeyboardTrackingLayoutGuides:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeyboardTrackingLayoutGuides, a3);
}

- (BOOL)_shouldDisableTransformLayerScalingForSnapshotting
{
  return self->_shouldDisableTransformLayerScalingForSnapshotting;
}

- (_UITraitEnvironmentInternal)_overrideParentTraitEnvironment
{
  return (_UITraitEnvironmentInternal *)objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
}

- (UIResponder)_lastFirstResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_lastFirstResponder);
}

- (void)_setLastFirstResponder:(id)a3
{
  objc_storeWeak((id *)&self->_lastFirstResponder, a3);
}

- (id)_lastFirstResponderInteractionState
{
  return self->_lastFirstResponderInteractionState;
}

- (void)_setLastFirstResponderInteractionState:(id)a3
{
  objc_storeStrong(&self->_lastFirstResponderInteractionState, a3);
}

- (UIResponder)_lastNextResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_lastNextResponder);
}

- (void)_setLastNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_lastNextResponder, a3);
}

- (void)_setWantsResponderWithoutKeyboard:(BOOL)a3
{
  self->_wantsResponderWithoutKeyboard = a3;
}

- (BOOL)canResizeToFitContent
{
  return self->_canResizeToFitContent;
}

- (void)setCanResizeToFitContent:(BOOL)canResizeToFitContent
{
  self->_canResizeToFitContent = canResizeToFitContent;
}

- (UIFocusItem)_rememberedFocusedItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_rememberedFocusedItem);
}

- (void)_setRememberedFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_rememberedFocusedItem, a3);
}

- (void)_setOrientationTransactionToken:(id)a3
{
  objc_storeWeak((id *)&self->__orientationTransactionToken, a3);
}

- (BOOL)_usesLegacySupportedOrientationChecks
{
  return self->__usesLegacySupportedOrientationChecks;
}

- (void)_setToWindowOrientation:(int64_t)a3
{
  self->_toWindowOrientation = a3;
}

- (void)_setFromWindowOrientation:(int64_t)a3
{
  self->_fromWindowOrientation = a3;
}

- (_UIWindowAnimationController)_animationController
{
  return self->__animationController;
}

- (id)_shouldPreventRotationHook
{
  return self->__shouldPreventRotationHook;
}

- (BOOL)__hostViewUnderlapsStatusBar
{
  return self->___hostViewUnderlapsStatusBar;
}

- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3
{
  self->___hostViewUnderlapsStatusBar = a3;
}

- (_UIFocusEventRecognizer)_focusEventRecognizer
{
  return self->_focusEventRecognizer;
}

- (BOOL)_containedGestureRecognizersShouldRespectGestureServerInstructions
{
  return self->__containedGestureRecognizersShouldRespectGestureServerInstructions;
}

- (void)_setContainedGestureRecognizersShouldRespectGestureServerInstructions:(BOOL)a3
{
  self->__containedGestureRecognizersShouldRespectGestureServerInstructions = a3;
}

- (id)_parentGestureRecognizerContainer
{
  return 0;
}

+ (void)setShouldRestrictViewsForSplashboard:(BOOL)a3
{
  _shouldRestrictViewsForSplashboard = a3;
}

+ (NSArray)restrictedSplashboardClasses
{
  void *v2;

  v2 = (void *)_restrictedSplashboardClasses;
  if (!_restrictedSplashboardClasses)
  {
    _restrictedSplashboardClasses = MEMORY[0x1E0C9AA60];
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

+ (void)setRestrictedSplashboardClasses:(id)a3
{
  objc_storeStrong((id *)&_restrictedSplashboardClasses, a3);
}

- (void)_updateInterfaceOrientationFromActiveInterfaceOrientation
{
  -[UIWindow _updateInterfaceOrientationFromActiveInterfaceOrientation:](self, "_updateInterfaceOrientationFromActiveInterfaceOrientation:", 1);
}

- (void)_performTouchContinuationWithOverrideHitTestedView:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)UIApp;
  v4 = a3;
  objc_msgSend(v3, "_gestureEnvironment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v5, v4);

}

- (BOOL)_constrainsHoverEventHitTesting
{
  return 0;
}

- (unint64_t)_edgesForSystemGesturesTouchDelay
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  -[UIWindow screen](self, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isEmbeddedScreen");

  if (!v4)
    return 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 || !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"))
  {
    v9 = 15;
  }
  else
  {
    -[UIWindow traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "forceTouchCapability");

    if (v8 == 2)
    {
      if (objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"))
        v9 = 13;
      else
        v9 = 7;
    }
    else
    {
      v9 = 5;
    }
  }
  -[UIWindow windowScene](self, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_systemAppearanceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v9 &= ~objc_msgSend(v11, "screenEdgesDeferringSystemGestures");

  return v9;
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  UIWindow *v14;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v7 = (id)objc_msgSend(v6, "ui_appendInterfaceOrientation:withName:", -[UIWindow interfaceOrientation](self, "interfaceOrientation"), CFSTR("orientation"));
  objc_msgSend(v6, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__UIWindow_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E16B1B50;
  v9 = v6;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

void __94__UIWindow_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _OWORD v25[3];
  _OWORD v26[3];

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isHidden"), CFSTR("hidden"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v4 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("frame"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v6 = (id)objc_msgSend(v5, "appendRect:withName:", CFSTR("bounds"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_windowOwnsInterfaceOrientation"), CFSTR("ownsOrientation"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_windowOwnsInterfaceOrientationTransform"), CFSTR("ownsOrientationTransform"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInterfaceAutorotationDisabled"), CFSTR("autorotationDisabled"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_windowInterfaceOrientation"), CFSTR("windowInterfaceOrientation"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_orientationForRootTransform"), CFSTR("rootTransformOrientation"));
  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 552);
  if (v13)
    objc_msgSend(v13, "affineTransform");
  else
    memset(v26, 0, sizeof(v26));
  v14 = (id)objc_msgSend(v12, "ui_appendTransform:withName:skipIfIdentity:", v26, CFSTR("rootTransform"), 1);
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_orientationForViewTransform"), CFSTR("viewTransformOrientation"));
  v16 = *(void **)(a1 + 32);
  v17 = *(void **)(*(_QWORD *)(a1 + 40) + 544);
  if (v17)
    objc_msgSend(v17, "affineTransform");
  else
    memset(v25, 0, sizeof(v25));
  v18 = (id)objc_msgSend(v16, "ui_appendTransform:withName:skipIfIdentity:", v25, CFSTR("viewTransform"), 1);
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInterfaceAutorotationDisabled"), CFSTR("autorotationDisabled"));
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_orientationTransactionToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "appendObject:withName:skipIfNil:", v21, CFSTR("orientationTransaction"), 1);

  objc_msgSend(*(id *)(a1 + 40), "_delegateViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_viewControllerForSupportedInterfaceOrientations");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "ui_appendOrientationDebugDescription:withName:skipIfNil:", v24, CFSTR("orientationVC"), 1);
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIWindow _orientationDebugDescriptionBuilderWithMultilinePrefix:](self, "_orientationDebugDescriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_orientationDebugDescription
{
  return -[UIWindow _orientationDebugDescriptionWithMultilinePrefix:](self, "_orientationDebugDescriptionWithMultilinePrefix:", 0);
}

- (BOOL)inhibitManualTransform
{
  void *v2;
  char v3;

  -[UIWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldAutorotate"))
    v3 = objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled");
  else
    v3 = 0;

  return v3;
}

- (void)keyboardDidHide
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidHideNotification"), 0);

  -[UIWindow _matchDeviceOrientation](self, "_matchDeviceOrientation");
}

- (void)matchDeviceOrientation:(id)a3
{
  void *v4;
  int v5;
  id v6;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldDelayRotationForWindow:", self);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_keyboardDidHide, CFSTR("UIKeyboardDidHideNotification"), 0);

  }
  else
  {
    -[UIWindow _matchDeviceOrientation](self, "_matchDeviceOrientation");
  }
}

- (double)_classicOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unjailedReferenceBounds");
  v5 = v4;
  v7 = v6;

  -[UIWindow screen](self, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  result = 0.0;
  if (v5 / v7 < v10 / v12)
    return (v7 - v12 * (v5 / v10)) * 0.5;
  return result;
}

- (id)_hostingWindow
{
  return 0;
}

- (BOOL)_shouldTextEffectsWindowBeHostedForView:(id)a3
{
  return 0;
}

- (void)_matchDeviceOrientation
{
  -[UIWindow setupForOrientation:](self, "setupForOrientation:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
}

- (id)_hostingHandle
{
  uint64_t v3;
  CALayer *transformLayer;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = -[UIWindow _contextId](self, "_contextId");
  transformLayer = self->_transformLayer;
  if (transformLayer)
  {
    -[CALayer affineTransform](transformLayer, "affineTransform");
    transformLayer = self->_transformLayer;
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  -[CALayer frame](transformLayer, "frame", v6, v7, v8);
  +[_UIHostedWindowHostingHandle hostedWindowHostingHandleWithContextID:rootLayerTransform:rootLayerFrame:](_UIHostedWindowHostingHandle, "hostedWindowHostingHandleWithContextID:rootLayerTransform:rootLayerFrame:", v3, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_allowsLinkPreviewInteractionInViewServices
{
  return 1;
}

- (id)_centerExpressionInContainer:(id)a3 vertical:(BOOL)a4 contentInsetScale:(double)a5 engine:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (-[UIWindow _isLoweringAnchoringConstraints](self, "_isLoweringAnchoringConstraints"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D156D0]), "initWithEngine:", v11);
    -[UIView _addCenterExpressionToExpression:isVertical:](self, "_addCenterExpressionToExpression:isVertical:", v12, v8);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIWindow;
    -[UIView _centerExpressionInContainer:vertical:contentInsetScale:engine:](&v14, sel__centerExpressionInContainer_vertical_contentInsetScale_engine_, v10, v8, v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_setIsLoweringAnchoringConstraints:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &_UIWindowIsLoweringAnchoringConstraints, v4, (void *)1);

  }
  else
  {
    objc_setAssociatedObject(self, &_UIWindowIsLoweringAnchoringConstraints, 0, 0);
  }
}

- (BOOL)_isLoweringAnchoringConstraints
{
  void *v2;
  char v3;

  objc_getAssociatedObject(self, &_UIWindowIsLoweringAnchoringConstraints);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_uiib_candidateRedundantConstraints
{
  return (id)objc_msgSend(-[UIWindow _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary"), "candidateRedundantConstraints");
}

- (id)_redundantConstraints
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[UIWindow _uiib_candidateRedundantConstraints](self, "_uiib_candidateRedundantConstraints", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "_nsib_isRedundant"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)_descendantWithAmbiguousLayout
{
  id v2;
  id result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[UIView _allSubviews](self, "_allSubviews", 0);
  result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v5)
        objc_enumerationMutation(v2);
      result = (id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "_descendantWithAmbiguousLayout");
      if (result)
        break;
      if (v4 == (id)++v6)
      {
        result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (BOOL)hasAmbiguousLayout
{
  _BOOL4 v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[UIWindow _hasAmbiguousLayout](self, "_hasAmbiguousLayout");
  if (v3)
  {
    v4 = -[UIWindow _descendantWithAmbiguousLayout](self, "_descendantWithAmbiguousLayout");
    v5 = hasAmbiguousLayout___s_category;
    if (!hasAmbiguousLayout___s_category)
    {
      v5 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&hasAmbiguousLayout___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = objc_msgSend(v4, "_autolayoutTraceRecursively:", 0);
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Window has a view with an ambiguous layout. See \"Auto Layout Guide: Ambiguous Layouts\" for help debugging. Displaying synopsis from invoking -[UIView _autolayoutTrace] to provide additional detail.\n%@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v3;
}

- (BOOL)_hasAmbiguousLayout
{
  return -[UIWindow _descendantWithAmbiguousLayout](self, "_descendantWithAmbiguousLayout") != 0;
}

- (void)exerciseAmbiguityInLayout
{
  UIWindow *v3;
  objc_super v4;

  v3 = -[UIWindow _descendantWithAmbiguousLayout](self, "_descendantWithAmbiguousLayout");
  if (v3 == self)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIWindow;
    -[UIView exerciseAmbiguityInLayout](&v4, sel_exerciseAmbiguityInLayout);
  }
  else
  {
    -[UIWindow exerciseAmbiguityInLayout](v3, "exerciseAmbiguityInLayout");
  }
}

@end
