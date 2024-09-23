@implementation SBHomeScreenViewController

- (int64_t)effectiveOrientation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  if ((-[SBHomeScreenViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    -[SBHomeScreenViewController allowedInterfaceOrientations](self, "allowedInterfaceOrientations");
    return 1;
  }
  -[SBHomeScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBHomeScreenViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_windowInterfaceOrientation");

  }
  else
  {
    -[SBHomeScreenViewController _iconContentView](self, "_iconContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "orientation");
  }

  -[SBHomeScreenViewController allowedInterfaceOrientations](self, "allowedInterfaceOrientations");
  if (!v7)
    return 1;
  if (SBFInterfaceOrientationMaskContainsInterfaceOrientation())
    return v7;
  else
    return 1;
}

- (unint64_t)possibleInterfaceOrientations
{
  _BOOL4 v2;
  void *v4;

  if (!objc_msgSend((id)SBApp, "homeScreenRotationStyleWantsUIKitRotation"))
    return 2;
  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  }
  if (v2)
    return 30;
  else
    return 26;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_endAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v17 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SBHomeScreenViewController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        -[SBHomeScreenViewController iconController](self, "iconController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenViewController windowScene](self, "windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "libraryViewControllerForWindowScene:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "homeScreenOverlayController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 != v14 && v9 != v12)
          -[SBHomeScreenViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", v9, v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  -[SBHomeScreenViewController iconManager](self, "iconManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cancelAllFolderScrolling");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  -[SBHomeScreenViewController _updateIconContentViewOrientationAndLayoutIfNeeded](self, "_updateIconContentViewOrientationAndLayoutIfNeeded");
  -[SBHomeScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryViewControllerForWindowScene:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v3)
  {
    v9 = v7;
    objc_msgSend(v3, "bringSubviewToFront:", v9);
    objc_msgSend(v6, "externalBackgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v3)
    {
      v12 = v10;

      objc_msgSend(v3, "insertSubview:belowSubview:", v12, v9);
      v9 = v12;
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "homeScreenOverlayController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == v3)
  {
    if (v9)
      objc_msgSend(v3, "insertSubview:belowSubview:", v15, v9);
    else
      objc_msgSend(v3, "bringSubviewToFront:", v15);
  }
  v17.receiver = self;
  v17.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);

}

- (SBIconController)iconController
{
  return (SBIconController *)objc_loadWeakRetained((id *)&self->_iconController);
}

- (void)_updateIconContentViewOrientationAndLayoutIfNeeded
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (!self->_rotating)
  {
    v3 = -[SBHomeScreenViewController effectiveOrientation](self, "effectiveOrientation");
    -[SBHomeScreenViewController _iconContentView](self, "_iconContentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenViewController iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "orientation");
    objc_msgSend(v4, "rootFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "orientation");

    if (v5 != v3 || v7 != v3 || !self->_performedInitialLayout)
      -[SBHomeScreenViewController _performInitialLayoutWithOrientation:](self, "_performInitialLayoutWithOrientation:", v3);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SBHomeScreenViewController allowedInterfaceOrientations](self, "allowedInterfaceOrientations");
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBHomeScreenViewController iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasAnimatingFolder") & 1) != 0
      || objc_msgSend(v4, "isIconDragging")
      && !-[SBHomeScreenViewController homeScreenAutorotatesEvenWhenIconIsDragging](self, "homeScreenAutorotatesEvenWhenIconIsDragging")|| objc_msgSend(v4, "isTransitioningHomeScreenState"))
    {
      -[SBHomeScreenViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "interfaceOrientation");
      v3 = XBInterfaceOrientationMaskForInterfaceOrientation();

    }
  }
  return v3;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)viewDidLayoutSubviews
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
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[SBHomeScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHomeScreenViewController iconContentView](self, "iconContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);
  UIRectGetCenter();
  objc_msgSend(v12, "setCenter:");
  -[SBHomeScreenViewController homeAffordanceView](self, "homeAffordanceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SBHomeScreenViewController _homeAffordanceFrameForLayout](self, "_homeAffordanceFrameForLayout");
    SBRectWithSize();
    objc_msgSend(v13, "setBounds:");
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    -[SBHomeScreenViewController homeAffordanceInteraction](self, "homeAffordanceInteraction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsUpdate");

  }
}

- (UIView)iconContentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_iconContentView);
}

- (void)setAllowIconRotation:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  NSMutableSet *iconRotationPreventionReasons;
  NSObject *v10;
  const char *v11;
  NSMutableSet *v12;
  NSMutableSet *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BYTE v34[22];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v4 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 703, CFSTR("reason must be valid"));

  }
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) & 1) == 0)
  {
    v8 = -[NSMutableSet count](self->_iconRotationPreventionReasons, "count");
    iconRotationPreventionReasons = self->_iconRotationPreventionReasons;
    if (v4)
    {
      if (!-[NSMutableSet containsObject:](iconRotationPreventionReasons, "containsObject:", v7))
        goto LABEL_15;
      -[NSMutableSet removeObject:](self->_iconRotationPreventionReasons, "removeObject:", v7);
      BKLogOrientationGlobal();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        v14 = -[NSMutableSet count](self->_iconRotationPreventionReasons, "count", *(_OWORD *)v34);
        if (v8)
          v15 = v14 == 0;
        else
          v15 = 0;
        if (v15)
        {
          if (self->_disableAnimationForNextIconRotation)
          {
            v16 = 0;
          }
          else
          {
            +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v17, "isVisible") ^ 1;

          }
          if (SBWorkspaceSpringBoardIsActive())
          {
            -[SBHomeScreenViewController view](self, "view");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "window");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
            v21 = objc_msgSend(v19, "_windowInterfaceOrientation");
            v22 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
            v24 = v20 == v21 && v21 == v22;
            if (!v20 || v24)
            {
              BKLogOrientationGlobal();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v34 = 0;
                _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "Nudging home screen window orientation because icon rotation changed.", v34, 2u);
              }

              objc_msgSend(v19, "sb_updateInterfaceOrientationFromActiveInterfaceOrientation:", v16);
            }
            else
            {
              objc_msgSend(v19, "_windowInterfaceOrientation");
              BSInterfaceOrientationDescription();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              BSInterfaceOrientationDescription();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[SBHomeScreenViewController shouldAutorotate](self, "shouldAutorotate");
              BKLogOrientationGlobal();
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              if (v27)
              {
                if (v29)
                {
                  *(_DWORD *)v34 = 138543618;
                  *(_QWORD *)&v34[4] = v25;
                  *(_WORD *)&v34[12] = 2114;
                  *(_QWORD *)&v34[14] = v26;
                  _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Forcible update for the home screen from %{public}@ to %{public}@.", v34, 0x16u);
                }

                objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", v20, 1, 1, CFSTR("Force-update active interface orientation after unlock"));
              }
              else
              {
                if (v29)
                {
                  -[SBHomeScreenViewController _autorotationPreventionReasons](self, "_autorotationPreventionReasons");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", "));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v34 = 138543874;
                  *(_QWORD *)&v34[4] = v25;
                  *(_WORD *)&v34[12] = 2114;
                  *(_QWORD *)&v34[14] = v26;
                  v35 = 2114;
                  v36 = v32;
                  _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Not doing a forcible update for the home screen from %{public}@ to %{public}@ because %{public}@.", v34, 0x20u);

                }
              }

            }
          }
          self->_disableAnimationForNextIconRotation = 0;
        }
        goto LABEL_45;
      }
      *(_DWORD *)v34 = 138543362;
      *(_QWORD *)&v34[4] = v7;
      v11 = "Enabling home screen icon rotation for reason: %{public}@";
    }
    else
    {
      if (!iconRotationPreventionReasons)
      {
        v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v13 = self->_iconRotationPreventionReasons;
        self->_iconRotationPreventionReasons = v12;

        iconRotationPreventionReasons = self->_iconRotationPreventionReasons;
      }
      if ((-[NSMutableSet containsObject:](iconRotationPreventionReasons, "containsObject:", v7) & 1) != 0)
        goto LABEL_15;
      -[NSMutableSet addObject:](self->_iconRotationPreventionReasons, "addObject:", v7);
      BKLogOrientationGlobal();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)v34 = 138543362;
      *(_QWORD *)&v34[4] = v7;
      v11 = "Disabling home screen icon rotation for reason: %{public}@";
    }
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v11, v34, 0xCu);
    goto LABEL_14;
  }
LABEL_45:

}

- (void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)a3
{
  self->_homeScreenAutorotatesEvenWhenIconIsDragging = a3;
}

- (void)setIconContentHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_iconContentHidden != a3)
  {
    v3 = a3;
    self->_iconContentHidden = a3;
    -[SBHomeScreenViewController _homeScreenView](self, "_homeScreenView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenViewController iconContentView](self, "iconContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDescendantOfView:", v5) & 1) == 0)
      objc_msgSend(v5, "addSubview:", v6);
    v7 = !v3;
    -[SBHomeScreenViewController _beginAppearanceTransitionForChildViewControllersToVisible:animated:](self, "_beginAppearanceTransitionForChildViewControllersToVisible:animated:", v7, 0);
    if (v7)
    {
      objc_msgSend(v5, "statusBarLegibilityView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertSubview:aboveSubview:", v6, v9);

      objc_msgSend(v6, "setHidden:", 0);
      -[SBHomeScreenViewController _updateIconContentViewOrientationAndLayoutIfNeeded](self, "_updateIconContentViewOrientationAndLayoutIfNeeded");
      objc_msgSend(v6, "layoutIfNeeded");
      -[SBHomeScreenViewController _endAppearanceTransitionForChildViewControllersToVisible:](self, "_endAppearanceTransitionForChildViewControllersToVisible:", v7);
      objc_msgSend(v6, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "interfaceOrientation");
      v12 = -[SBHomeScreenViewController interfaceOrientation](self, "interfaceOrientation");
      if (v11)
      {
        v13 = v12;
        if (v12 != v11)
        {
          BKLogOrientationGlobal();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 134218240;
            v16 = v11;
            v17 = 2048;
            v18 = v13;
            _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Home screen orientation did not match between window and view controller (%li vs %li)", (uint8_t *)&v15, 0x16u);
          }

          -[SBHomeScreenViewController setInterfaceOrientation:](self, "setInterfaceOrientation:", v11);
          -[SBHomeScreenViewController _updateIconContentViewOrientationAndLayoutIfNeeded](self, "_updateIconContentViewOrientationAndLayoutIfNeeded");
        }
      }

    }
    else
    {
      objc_msgSend(v6, "setHidden:", 1);
      objc_msgSend(v6, "firstResponder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignFirstResponder");

      -[SBHomeScreenViewController _endAppearanceTransitionForChildViewControllersToVisible:](self, "_endAppearanceTransitionForChildViewControllersToVisible:", v7);
    }
    objc_msgSend(v5, "setNeedsLayout");
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)_beginAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v17;
  _BOOL4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v17 = a3;
  v18 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SBHomeScreenViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        -[SBHomeScreenViewController iconController](self, "iconController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenViewController windowScene](self, "windowScene");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "libraryViewControllerForWindowScene:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "homeScreenOverlayController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "viewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v15 && v10 != v13)
          -[SBHomeScreenViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v10, v17, v18);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (void)zStackParticipantDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "transitionRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = objc_msgSend(v11, "source");
  v13 = -[SBHomeScreenReturnToSpotlightPolicy homeScreenZStackParticipantDidChange:launchingForSpotlight:](self->_returnToSpotlightPolicy, "homeScreenZStackParticipantDidChange:launchingForSpotlight:", v4, v12 == 2);

  if (v13 == 1)
  {
    -[SBHomeScreenReturnToSpotlightPolicy willReactivateSpotlight](self->_returnToSpotlightPolicy, "willReactivateSpotlight");
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneDeactivationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newAssertionWithReason:", 5);

    objc_msgSend(v16, "acquireWithPredicate:transitionContext:", &__block_literal_global_298, 0);
    -[SBHomeScreenViewController iconManager](self, "iconManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rootFolderController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setPresentationSource:", 5);
    v19 = -[SBHomeScreenReturnToSpotlightPolicy shouldAnimateReactivation](self->_returnToSpotlightPolicy, "shouldAnimateReactivation");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__SBHomeScreenViewController_zStackParticipantDidChange___block_invoke_2;
    v21[3] = &unk_1E8E9DED8;
    v22 = v16;
    v20 = v16;
    objc_msgSend(v18, "presentSpotlightAnimated:completionHandler:", v19, v21);
    objc_msgSend(v18, "setPresentationSource:", 0);

  }
  -[SBHomeScreenViewController _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");

}

- (SBHomeScreenViewController)initWithWindowScene:(id)a3 iconController:(id)a4 iconManager:(id)a5 userInterfaceController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBHomeScreenViewController *v15;
  SBHomeScreenViewController *v16;
  SBIconContentView *v17;
  void *v18;
  BOOL v19;
  SBHomeScreenReturnToSpotlightPolicy *v20;
  void *v21;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterfaceController"));

  }
  v24.receiver = self;
  v24.super_class = (Class)SBHomeScreenViewController;
  v15 = -[SBHomeScreenViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_windowScene, v11);
    objc_storeWeak((id *)&v16->_userInterfaceController, v14);
    objc_storeWeak((id *)&v16->_iconController, v12);
    objc_storeWeak((id *)&v16->_iconManager, v13);
    objc_msgSend(v12, "addFloatingDockControllerObserver:", v16);
    v17 = -[SBIconContentView initWithOrientation:]([SBIconContentView alloc], "initWithOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
    -[SBIconContentView setAccessibilityIdentifier:](v17, "setAccessibilityIdentifier:", CFSTR("Home screen icons"));
    -[SBIconContentView _setIgnoreBackdropViewsWhenHiding:](v17, "_setIgnoreBackdropViewsWhenHiding:", 1);
    objc_storeWeak((id *)&v16->_iconContentView, v17);
    -[SBHomeScreenViewController setIconContentHidden:](v16, "setIconContentHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v16, sel__dismissAllIconForceTouchControllersDidFire_, *MEMORY[0x1E0DAA808], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v16, sel__floatingDockFrameDidChange_, CFSTR("SBFloatingDockControllerFrameDidChangeNotification"), 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v16, sel__iconEditingDidChange_, *MEMORY[0x1E0DAA7D8], 0);
    v19 = +[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled](SBHomeScreenReturnToSpotlightPolicy, "areSpotlightBreadcrumbsEnabled");
    if (v19)
      v20 = 0;
    else
      v20 = objc_alloc_init(SBHomeScreenReturnToSpotlightPolicy);
    objc_storeStrong((id *)&v16->_returnToSpotlightPolicy, v20);
    if (!v19)

    objc_msgSend(v11, "assistantController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:", v16);

    v16->_homeAffordanceInteractionAllowed = 1;
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[SBHomeScreenViewController windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[SBHomeScreenViewController iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFloatingDockControllerObserver:", self);
  -[SBHomeScreenViewController homeScreenFloatingDockAssertion](self, "homeScreenFloatingDockAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  -[SBHomeScreenViewController setHomeScreenFloatingDockAssertion:](self, "setHomeScreenFloatingDockAssertion:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController dealloc](&v8, sel_dealloc);
}

- (void)loadView
{
  SBHomeScreenView *v3;
  SBHomeScreenView *v4;

  v3 = [SBHomeScreenView alloc];
  v4 = -[SBHomeScreenView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBHomeScreenViewController setView:](self, "setView:", v4);

}

- (BOOL)shouldAutorotate
{
  int v3;
  void *v4;
  void *v5;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if (objc_msgSend((id)SBApp, "homeScreenRotationStyleWantsUIKitRotation"))
  {
    -[SBHomeScreenViewController iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenViewController userInterfaceController](self, "userInterfaceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isSidebarVisibilityGestureActive") & 1) != 0
      || (objc_msgSend(v4, "hasAnimatingFolder") & 1) != 0
      || objc_msgSend(v4, "isIconDragging")
      && !-[SBHomeScreenViewController homeScreenAutorotatesEvenWhenIconIsDragging](self, "homeScreenAutorotatesEvenWhenIconIsDragging")|| -[NSMutableSet count](self->_iconRotationPreventionReasons, "count")|| (objc_msgSend(v5, "isIconListViewTornDown") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v3 = objc_msgSend(v4, "isTransitioningHomeScreenState") ^ 1;
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appIconForceTouchControllerWillPresentNotification_, *MEMORY[0x1E0DAAA50], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appIconForceTouchControllerDidDismissNotification_, *MEMORY[0x1E0DAAA38], 0);
  -[SBHomeScreenViewController _beginAppearanceTransitionForChildViewControllersToVisible:animated:](self, "_beginAppearanceTransitionForChildViewControllersToVisible:animated:", 1, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[SBHomeScreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary");

  -[SBHomeScreenViewController windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addActiveLayoutLayer:", 0);

  -[SBHomeScreenViewController zStackParticipant](self, "zStackParticipant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v6, "zStackResolver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acquireParticipantWithIdentifier:delegate:", 0, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenViewController setZStackParticipant:](self, "setZStackParticipant:", v9);

  }
  -[SBHomeScreenViewController _updateHomeAffordanceView](self, "_updateHomeAffordanceView");
  -[SBHomeScreenViewController _endAppearanceTransitionForChildViewControllersToVisible:](self, "_endAppearanceTransitionForChildViewControllersToVisible:", 1);
  -[SBHomeScreenViewController becomeFirstResponder](self, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[SBHomeScreenViewController _beginAppearanceTransitionForChildViewControllersToVisible:animated:](self, "_beginAppearanceTransitionForChildViewControllersToVisible:animated:", 0, v3);
  -[SBHomeScreenViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenViewController;
  -[SBHomeScreenViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBHomeScreenViewController _widgetEditViewDidDisappearImplementation](self, "_widgetEditViewDidDisappearImplementation");
  -[SBHomeScreenViewController _endAppearanceTransitionForChildViewControllersToVisible:](self, "_endAppearanceTransitionForChildViewControllersToVisible:", 0);
}

- (_UILegibilitySettings)legibilitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeScreenViewController _homeScreenView](self, "_homeScreenView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarLegibilityView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v4;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBHomeScreenViewController _homeScreenView](self, "_homeScreenView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarLegibilityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLegibilitySettings:", v4);

}

- (void)setNeedsStatusBarAppearanceUpdate
{
  void *v3;
  void *v4;
  void *v5;
  SBWindowSceneStatusBarSettingsAssertion *v6;
  SBWindowSceneStatusBarSettingsAssertion *childOrPresentedStatusBarAssertion;
  SBWindowSceneStatusBarSettingsAssertion *v8;
  void *v9;
  SBWindowSceneStatusBarSettingsAssertion *v10;
  void *v11;
  id v12;

  -[UIViewController sb_childOrPresentedViewControllerStatusBarSettings](self, "sb_childOrPresentedViewControllerStatusBarSettings");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SBHomeScreenViewController windowScene](self, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusBarManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v5, "newSettingsAssertionWithSettings:atLevel:reason:", v12, 0, CFSTR("Homescreen Child/Presented VC"));
    childOrPresentedStatusBarAssertion = self->_childOrPresentedStatusBarAssertion;
    self->_childOrPresentedStatusBarAssertion = v6;

    v8 = self->_childOrPresentedStatusBarAssertion;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](v8, "acquireWithAnimationParameters:", v9);

  }
  else
  {
    v10 = self->_childOrPresentedStatusBarAssertion;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion invalidateWithAnimationParameters:](v10, "invalidateWithAnimationParameters:", v11);

    v5 = self->_childOrPresentedStatusBarAssertion;
    self->_childOrPresentedStatusBarAssertion = 0;
  }

}

- (void)_acquireFloatingDockBehaviorAssertionIfNecessaryForFloatingDockController:(id)a3
{
  void *v4;
  void *v5;
  SBFloatingDockBehaviorAssertion *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBHomeScreenViewController homeScreenFloatingDockAssertion](self, "homeScreenFloatingDockAssertion");
    v6 = (SBFloatingDockBehaviorAssertion *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v7, 1, 0, 0, CFSTR("homescreen"), 0, 1.0);
      -[SBHomeScreenViewController setHomeScreenFloatingDockAssertion:](self, "setHomeScreenFloatingDockAssertion:", v6);
    }

  }
}

- (id)_autorotationPreventionReasons
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v10;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)SBApp, "homeScreenRotationStyleWantsUIKitRotation") & 1) != 0)
    {
      -[SBHomeScreenViewController iconManager](self, "iconManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenViewController userInterfaceController](self, "userInterfaceController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSidebarVisibilityGestureActive"))
        objc_msgSend(v4, "addObject:", CFSTR("iconControllerSidebarVisibilityGestureActive"));
      if (objc_msgSend(v5, "hasAnimatingFolder"))
        objc_msgSend(v4, "addObject:", CFSTR("iconControllerHasAnimatingFolder"));
      if (objc_msgSend(v5, "isIconDragging")
        && !-[SBHomeScreenViewController homeScreenAutorotatesEvenWhenIconIsDragging](self, "homeScreenAutorotatesEvenWhenIconIsDragging"))
      {
        objc_msgSend(v4, "addObject:", CFSTR("iconControllerIconDragging"));
      }
      if (-[NSMutableSet count](self->_iconRotationPreventionReasons, "count"))
      {
        -[NSMutableSet allObjects](self->_iconRotationPreventionReasons, "allObjects");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v7);

      }
      if (objc_msgSend(v6, "isIconListViewTornDown"))
        objc_msgSend(v4, "addObject:", CFSTR("iconListViewTornDown"));
      if (objc_msgSend(v5, "isTransitioningHomeScreenState"))
        objc_msgSend(v4, "addObject:", CFSTR("iconListTransitioningHomeScreenState"));

    }
    else
    {
      objc_msgSend(v4, "addObject:", CFSTR("homeScreenRotationStyle"));
    }
    v8 = objc_msgSend(v4, "count") == 0;
    if (v8 != -[SBHomeScreenViewController shouldAutorotate](self, "shouldAutorotate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 427, CFSTR("_autorotationPreventionReasons out of sync with shouldAutorotate"));

    }
  }
  return v4;
}

- (void)_performInitialLayoutWithOrientation:(int64_t)a3
{
  _BOOL4 performedInitialLayout;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  performedInitialLayout = self->_performedInitialLayout;
  self->_performedInitialLayout = 1;
  SBLogIcon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBHomeScreenViewController _performInitialLayoutWithOrientation:].cold.1(a3, v6);

  -[SBHomeScreenViewController iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[SBHomeScreenViewController _iconContentView](self, "_iconContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOrientation:", a3);
    objc_msgSend(v7, "noteInterfaceOrientationChanged");

  }
  objc_msgSend(v7, "resetRootIconLists");
  if (!performedInitialLayout)
  {
    objc_msgSend(v7, "rootFolderController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentPageIndex:animated:", objc_msgSend(v9, "defaultPageIndex"), 0);

  }
}

- (void)setHomeAffordanceInteractionAllowed:(BOOL)a3
{
  if (self->_homeAffordanceInteractionAllowed != a3)
  {
    self->_homeAffordanceInteractionAllowed = a3;
    -[SBHomeScreenViewController _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
  }
}

- (void)_updateHomeAffordanceInteraction
{
  void *v3;
  _BOOL8 v4;
  id v5;

  if (-[SBHomeScreenViewController isHomeAffordanceInteractionAllowed](self, "isHomeAffordanceInteractionAllowed"))
  {
    -[SBHomeScreenViewController zStackParticipant](self, "zStackParticipant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "activationState") == 0;

  }
  else
  {
    v4 = 0;
  }
  -[SBHomeScreenViewController homeAffordanceInteraction](self, "homeAffordanceInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)_updateHomeAffordanceView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  -[SBHomeScreenViewController windowScene](self, "windowScene");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assistantController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");
  -[SBHomeScreenViewController homeAffordanceView](self, "homeAffordanceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || v6)
  {
    if (v6)
      v12 = v5;
    else
      v12 = 1;
    if ((v12 & 1) == 0)
    {
      -[SBHomeScreenViewController homeAffordanceView](self, "homeAffordanceView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");

      -[SBHomeScreenViewController setHomeAffordanceView:](self, "setHomeAffordanceView:", 0);
      -[SBHomeScreenViewController setHomeAffordanceInteraction:](self, "setHomeAffordanceInteraction:", 0);
    }
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0DA9E20]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "setHintStyle:", 2);
    objc_msgSend(v3, "addSubview:", v8);
    -[SBHomeScreenViewController setHomeAffordanceView:](self, "setHomeAffordanceView:", v8);
    objc_msgSend(v14, "homeAffordanceInteractionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newHomeAffordanceInteraction");
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v3, "addInteraction:", v11);
      -[SBHomeScreenViewController setHomeAffordanceInteraction:](self, "setHomeAffordanceInteraction:", v11);
      -[SBHomeScreenViewController _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");
    }

  }
}

- (CGRect)_homeAffordanceFrameForHomeAffordanceInteraction
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  CGFloat v19;
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
  CGFloat rect;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  -[SBHomeScreenViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0D47488], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect = *MEMORY[0x1E0C9D648];
  v13 = (void *)objc_opt_class();
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  objc_msgSend(v13, "suggestedSizeForContentWidth:withSettings:", v11, CGRectGetWidth(v33));
  v15 = v14;
  v17 = v16;
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  Width = CGRectGetWidth(v34);
  v35.origin.x = rect;
  v35.origin.y = v12;
  v35.size.width = v15;
  v35.size.height = v17;
  v19 = (Width - CGRectGetWidth(v35)) * 0.5;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  CGRectGetHeight(v36);
  v37.origin.x = v19;
  v37.origin.y = v12;
  v37.size.width = v15;
  v37.size.height = v17;
  CGRectGetHeight(v37);
  objc_msgSend(v11, "edgeSpacing");
  SBScreenScale();
  BSRectRoundForScale();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_homeAffordanceFrameForLayout
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
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
  CGFloat rect;
  CGFloat recta;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  -[SBHomeScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  CGRectGetMidX(v44);
  -[SBHomeScreenViewController iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootFolderController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isDockExternal"))
  {
    objc_msgSend(v8, "floatingDockViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fixedCoordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "floatingDockScreenFrame");
    objc_msgSend(v3, "convertRect:fromCoordinateSpace:", v13);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    rect = v20;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    CGRectGetMaxY(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    CGRectGetMaxY(v46);
    v47.origin.x = v15;
    v47.origin.y = v17;
    v47.size.width = v19;
    v47.size.height = rect;
    CGRectGetMaxY(v47);
  }
  else
  {
    objc_msgSend(v9, "folderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dockView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dockListView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v3, "convertRect:fromView:", v21);
    recta = v22;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    CGRectGetMaxY(v48);
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    CGRectGetMaxY(v49);
    v50.origin.x = recta;
    v50.origin.y = v24;
    v50.size.width = v26;
    v50.size.height = v28;
    CGRectGetMaxY(v50);

  }
  -[SBHomeScreenViewController _homeAffordanceFrameForHomeAffordanceInteraction](self, "_homeAffordanceFrameForHomeAffordanceInteraction");
  -[SBHomeScreenViewController traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayScale");
  UIRectCenteredAboutPointScale();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = v31;
  v39 = v33;
  v40 = v35;
  v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)_prepareForTransitionToSize:(CGSize)a3 andInterfaceOrientation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a5, "transitionDuration", a3.width, a3.height);
  v8 = v7;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orientationSource:willRotateToInterfaceOrientation:duration:", 2, a4, v8);

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("MainWindowRotation"));

  -[SBHomeScreenViewController windowScene](self, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = SBWorkspaceLauncherIsActive(v11, 1);

  if ((_DWORD)v10)
    objc_msgSend((id)SBApp, "noteInterfaceOrientationChanged:duration:logMessage:", a4, CFSTR("Home Screen is transitioning"), v8);
}

- (void)_animateTransitionToSize:(CGSize)a3 andInterfaceOrientation:(int64_t)a4 withTransitionContext:(id)a5
{
  double v6;
  double v7;
  id v8;

  objc_msgSend(a5, "transitionDuration", a3.width, a3.height);
  v7 = v6;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orientationSource:willAnimateRotationToInterfaceOrientation:duration:", 2, a4, v7);

}

- (void)_cleanupAfterTransitionToSize:(CGSize)a3 fromInterfaceOrientation:(int64_t)a4 withTransitionContext:(id)a5
{
  void *v6;
  void *v7;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a4, a5, a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orientationSource:didRotateFromInterfaceOrientation:", 2, a4);

  objc_msgSend((id)SBApp, "resetIdleTimerAndUndim");
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("MainWindowRotation"));

  objc_msgSend((id)SBApp, "noteHomeScreenLayoutDidChange");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[8];
  _QWORD v16[8];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  SBFWindowForViewControllerTransition();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_toWindowOrientation");
  v10 = objc_msgSend(v8, "_fromWindowOrientation");
  if ((-[SBHomeScreenViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & (1 << v9)) != 0)
  {
    self->_rotating = 1;
    -[SBHomeScreenViewController iconController](self, "iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissAppIconForceTouchControllers:", 0);
    -[SBHomeScreenViewController iconManager](self, "iconManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconShareSheetManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hideIconShareSheetsIfAnyForRotationAnimation");
    objc_msgSend(v11, "dismissHomeScreenOverlayUsingTransitionCoordinator:", v7);
    objc_msgSend(v12, "dismissModalInteractions");
    -[SBHomeScreenViewController _prepareForTransitionToSize:andInterfaceOrientation:withTransitionCoordinator:](self, "_prepareForTransitionToSize:andInterfaceOrientation:withTransitionCoordinator:", v9, v7, width, height);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v16[3] = &unk_1E8EB8C80;
    v16[4] = self;
    *(double *)&v16[5] = width;
    *(double *)&v16[6] = height;
    v16[7] = v9;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v15[3] = &unk_1E8EB8C80;
    v15[4] = self;
    *(double *)&v15[5] = width;
    *(double *)&v15[6] = height;
    v15[7] = v10;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v16, v15);
    v14.receiver = self;
    v14.super_class = (Class)SBHomeScreenViewController;
    -[SBHomeScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

  }
}

void __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_animateTransitionToSize:andInterfaceOrientation:withTransitionContext:", *(_QWORD *)(a1 + 56), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_iconContentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrientation:", *(_QWORD *)(a1 + 56));

}

uint64_t __81__SBHomeScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cleanupAfterTransitionToSize:fromInterfaceOrientation:withTransitionContext:", *(_QWORD *)(a1 + 56), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1011) = 0;
  return result;
}

- (void)nudgeIconInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  int v8;
  id v9;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) & 1) == 0)
  {
    -[SBHomeScreenViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)SBApp, "homeScreenRotationStyleWantsUIKitRotation"))
    {
      v8 = -[SBHomeScreenViewController isViewLoaded](self, "isViewLoaded");
      if ((unint64_t)(a3 - 1) <= 3)
      {
        if (v8)
        {
          if (objc_msgSend(v9, "_windowInterfaceOrientation") != a3)
            objc_msgSend(v9, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", a3, 1, 0, a4);
        }
      }
    }

  }
}

- (void)disableAnimationForNextIconRotation
{
  self->_disableAnimationForNextIconRotation = 1;
}

- (id)containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SBHomeScreenViewController *v12;
  SBHomeScreenViewController *v13;

  v3 = a3;
  -[SBHomeScreenViewController iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (+[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isVisibleAndNotDisappearing"), v6, v7))
  {
    objc_msgSend(v5, "coverSheetTodayViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "todayViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (objc_msgSend(v8, "_appearState") == 2 || objc_msgSend(v9, "_appearState") == 1)
  {
    objc_msgSend(v9, "containerViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (SBHomeScreenViewController *)v10;
    else
      v12 = self;
    v13 = v12;

  }
  else
  {
    v13 = self;
  }

  return v13;
}

- (id)containerViewForPresentingContextMenuForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBHomeScreenViewController *v10;
  void *v11;
  void *v12;
  SBHomeScreenViewController *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController iconController](self, "iconController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_openFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatingDockViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedFolderController");
  v10 = (SBHomeScreenViewController *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && SBIconLocationGroupContainsLocation())
  {
    objc_msgSend(v6, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = v12;
    objc_msgSend(v12, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v7, "_openFolderController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (SBIconLocationGroupContainsLocation())
    {
      -[SBHomeScreenViewController containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:](self, "containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (SBIconLocationGroupContainsLocation())
    {
      objc_msgSend(v7, "libraryViewControllerForWindowScene:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v13 = self;
  }
  -[SBHomeScreenViewController view](v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v14;
}

- (void)_widgetEditViewWillAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SBFloatingDockBehaviorAssertion *v7;
  void *v8;
  id v9;

  -[SBHomeScreenViewController widgetEditFloatingDockAssertion](self, "widgetEditFloatingDockAssertion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SBHomeScreenViewController windowScene](self, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatingDockController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v6, 1, 0, 4, CFSTR("edit widgets"), 0, 0.0);
    -[SBHomeScreenViewController setWidgetEditFloatingDockAssertion:](self, "setWidgetEditFloatingDockAssertion:", v7);

  }
  -[SBHomeScreenViewController widgetEditViewControllerOrientationUpdateDeferralAssertion](self, "widgetEditViewControllerOrientationUpdateDeferralAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("edit widgets"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenViewController setWidgetEditViewControllerOrientationUpdateDeferralAssertion:](self, "setWidgetEditViewControllerOrientationUpdateDeferralAssertion:", v9);

  }
}

- (void)_widgetEditViewDidDisappearImplementation
{
  void *v3;
  void *v4;

  -[SBHomeScreenViewController widgetEditFloatingDockAssertion](self, "widgetEditFloatingDockAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBHomeScreenViewController setWidgetEditFloatingDockAssertion:](self, "setWidgetEditFloatingDockAssertion:", 0);
  -[SBHomeScreenViewController widgetEditViewControllerOrientationUpdateDeferralAssertion](self, "widgetEditViewControllerOrientationUpdateDeferralAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SBHomeScreenViewController setWidgetEditViewControllerOrientationUpdateDeferralAssertion:](self, "setWidgetEditViewControllerOrientationUpdateDeferralAssertion:", 0);
}

- (void)_appIconForceTouchControllerWillPresentNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController _acquireForceTouchOrientationUpdateDeferralAssertionForIconView:](self, "_acquireForceTouchOrientationUpdateDeferralAssertionForIconView:", v4);
  -[SBHomeScreenViewController _acquireForceTouchWindowLevelAssertionForIconView:](self, "_acquireForceTouchWindowLevelAssertionForIconView:", v4);

}

- (void)_appIconForceTouchControllerDidDismissNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenViewController _relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:](self, "_relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:", v4);
  -[SBHomeScreenViewController _relinquishForceTouchWindowLevelAssertionForIconView:](self, "_relinquishForceTouchWindowLevelAssertionForIconView:", v4);

}

- (void)_acquireForceTouchOrientationUpdateDeferralAssertionForIconView:(id)a3
{
  id v5;
  NSMapTable *appIconForceTouchControllerOrientationUpdateDeferralAssertions;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 852, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iconView"));

    v5 = 0;
  }
  appIconForceTouchControllerOrientationUpdateDeferralAssertions = self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions;
  if (!appIconForceTouchControllerOrientationUpdateDeferralAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions;
    self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions = v7;

    v5 = v13;
    appIconForceTouchControllerOrientationUpdateDeferralAssertions = self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions;
  }
  -[NSMapTable objectForKey:](appIconForceTouchControllerOrientationUpdateDeferralAssertions, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = (void *)SBApp;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppIconForceTouchController is presented context menu for %@"), v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceOrientationUpdateDeferralAssertionWithReason:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable setObject:forKey:](self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, "setObject:forKey:", v9, v13);
  }

}

- (void)_relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 867, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iconView"));

    v5 = 0;
  }
  -[NSMapTable objectForKey:](self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  -[NSMapTable removeObjectForKey:](self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, "removeObjectForKey:", v8);

}

- (void)_acquireForceTouchWindowLevelAssertionForIconView:(id)a3
{
  void *v5;
  void *v6;
  NSMapTable *v7;
  NSMapTable *appIconForceTouchControllerWindowLevelAssertions;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  SBFloatingDockWindowLevelAssertion *v14;
  void *v15;
  SBFloatingDockWindowLevelAssertion *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 876, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iconView"));

  }
  if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    -[NSMapTable objectForKey:](self->_appIconForceTouchControllerWindowLevelAssertions, "objectForKey:", v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v18, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!self->_appIconForceTouchControllerWindowLevelAssertions)
          {
            objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
            v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
            appIconForceTouchControllerWindowLevelAssertions = self->_appIconForceTouchControllerWindowLevelAssertions;
            self->_appIconForceTouchControllerWindowLevelAssertions = v7;

          }
          objc_msgSend(v18, "window");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "windowLevel");
          v11 = v10 + -1.0;

          objc_msgSend(v18, "_sbWindowScene");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "floatingDockController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = [SBFloatingDockWindowLevelAssertion alloc];
          NSStringFromSelector(a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[SBFloatingDockWindowLevelAssertion initWithFloatingDockController:priority:level:reason:](v14, "initWithFloatingDockController:priority:level:reason:", v13, 2, v15, v11);

          -[NSMapTable setObject:forKey:](self->_appIconForceTouchControllerWindowLevelAssertions, "setObject:forKey:", v16, v18);
        }
      }

    }
  }

}

- (void)_relinquishForceTouchWindowLevelAssertionForIconView:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenViewController.m"), 909, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iconView"));

  }
  if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    -[NSMapTable objectForKey:](self->_appIconForceTouchControllerWindowLevelAssertions, "objectForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");
    -[NSMapTable removeObjectForKey:](self->_appIconForceTouchControllerWindowLevelAssertions, "removeObjectForKey:", v7);

  }
}

- (void)_dismissAllIconForceTouchControllersDidFire:(id)a3
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
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMapTable copy](self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, "copy", a3);
  v5 = (void *)-[NSMapTable copy](self->_appIconForceTouchControllerWindowLevelAssertions, "copy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v10);

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v14);

  if (objc_msgSend(v6, "count"))
  {
    SBLogIcon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenViewController _dismissAllIconForceTouchControllersDidFire:].cold.1((uint64_t)v6, v15);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[SBHomeScreenViewController _relinquishForceTouchWindowLevelAssertionForIconView:](self, "_relinquishForceTouchWindowLevelAssertionForIconView:", v21);
          -[SBHomeScreenViewController _relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:](self, "_relinquishForceTouchOrientationUpdateDeferralAssertionForIconView:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

    -[NSMapTable removeAllObjects](self->_appIconForceTouchControllerWindowLevelAssertions, "removeAllObjects");
    -[NSMapTable removeAllObjects](self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, "removeAllObjects");
  }

}

- (void)_floatingDockFrameDidChange:(id)a3
{
  id v3;

  -[SBHomeScreenViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_iconEditingDidChange:(id)a3
{
  id v3;

  -[SBHomeScreenViewController zStackParticipant](self, "zStackParticipant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdatePreferencesWithReason:", CFSTR("Home Screen editing changed"));

}

- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3
{
  id v3;

  -[SBHomeScreenViewController homeAffordanceView](self, "homeAffordanceView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performHintAnimation");

}

uint64_t __57__SBHomeScreenViewController_zStackParticipantDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return v4;
}

uint64_t __57__SBHomeScreenViewController_zStackParticipantDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relinquish");
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHomeScreenViewController iconManager](self, "iconManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressSystemApertureForSystemChromeSuppression:", objc_msgSend(v6, "isEditing"));
  objc_msgSend(v5, "setAllowsDimmingWhenForegroundInactive:", 1);

}

- (BOOL)isIconContentHidden
{
  return self->_iconContentHidden;
}

- (BOOL)homeScreenAutorotatesEvenWhenIconIsDragging
{
  return self->_homeScreenAutorotatesEvenWhenIconIsDragging;
}

- (BOOL)isHomeAffordanceInteractionAllowed
{
  return self->_homeAffordanceInteractionAllowed;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setEffectiveOrientation:(int64_t)a3
{
  self->_effectiveOrientation = a3;
}

- (void)setAllowedInterfaceOrientations:(unint64_t)a3
{
  self->_allowedInterfaceOrientations = a3;
}

- (void)setPossibleInterfaceOrientations:(unint64_t)a3
{
  self->_possibleInterfaceOrientations = a3;
}

- (SBHIconImageStyleConfiguration)currentIconImageStyleConfiguration
{
  return self->_currentIconImageStyleConfiguration;
}

- (SBHIconImageAppearance)currentIconImageAppearance
{
  return self->_currentIconImageAppearance;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (SBUIController)userInterfaceController
{
  return (SBUIController *)objc_loadWeakRetained((id *)&self->_userInterfaceController);
}

- (SBFloatingDockBehaviorAssertion)homeScreenFloatingDockAssertion
{
  return self->_homeScreenFloatingDockAssertion;
}

- (void)setHomeScreenFloatingDockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenFloatingDockAssertion, a3);
}

- (SBFloatingDockBehaviorAssertion)widgetEditFloatingDockAssertion
{
  return self->_widgetEditFloatingDockAssertion;
}

- (void)setWidgetEditFloatingDockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEditFloatingDockAssertion, a3);
}

- (BSInvalidatable)widgetEditViewControllerOrientationUpdateDeferralAssertion
{
  return self->_widgetEditViewControllerOrientationUpdateDeferralAssertion;
}

- (void)setWidgetEditViewControllerOrientationUpdateDeferralAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEditViewControllerOrientationUpdateDeferralAssertion, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_performedInitialLayout;
}

- (void)setPerformedInitialLayout:(BOOL)a3
{
  self->_performedInitialLayout = a3;
}

- (SBHomeScreenReturnToSpotlightPolicy)returnToSpotlightPolicy
{
  return self->_returnToSpotlightPolicy;
}

- (SBFHomeAffordanceInteraction)homeAffordanceInteraction
{
  return self->_homeAffordanceInteraction;
}

- (void)setHomeAffordanceInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, a3);
}

- (SBFHomeAffordanceView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_returnToSpotlightPolicy, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_widgetEditViewControllerOrientationUpdateDeferralAssertion, 0);
  objc_storeStrong((id *)&self->_widgetEditFloatingDockAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenFloatingDockAssertion, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_destroyWeak((id *)&self->_iconController);
  objc_destroyWeak((id *)&self->_userInterfaceController);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_currentIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_currentIconImageStyleConfiguration, 0);
  objc_destroyWeak((id *)&self->_iconContentView);
  objc_storeStrong((id *)&self->_appIconForceTouchControllerWindowLevelAssertions, 0);
  objc_storeStrong((id *)&self->_appIconForceTouchControllerOrientationUpdateDeferralAssertions, 0);
  objc_storeStrong((id *)&self->_childOrPresentedStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_iconRotationPreventionReasons, 0);
}

- (void)_performInitialLayoutWithOrientation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Peforming initial layout with orientation (%lu)", (uint8_t *)&v2, 0xCu);
}

- (void)_dismissAllIconForceTouchControllersDidFire:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Forcefully removing assertions for iconViews: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
