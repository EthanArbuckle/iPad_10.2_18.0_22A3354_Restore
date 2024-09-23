@implementation SBIconController

- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4
{
  return -[SBIconController allowsBadgingForIcon:](self, "allowsBadgingForIcon:", a4);
}

- (id)recycledViewsContainerProviderForIconManager:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconController userInterfaceController](self, "userInterfaceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userInterfaceController
{
  SBUIController *override_userInterfaceController;

  override_userInterfaceController = self->_override_userInterfaceController;
  if (override_userInterfaceController)
    return override_userInterfaceController;
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (SBIconController)sharedInstanceIfExists
{
  void *v2;
  void *v3;

  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconController *)v3;
}

+ (SBIconController)sharedInstance
{
  void *v2;
  void *v3;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconController *)v3;
}

- (SBApplicationHosting)leftOfHomeAppViewController
{
  return self->_leftOfHomeAppViewController;
}

- (SBHomeScreenViewController)homeScreenViewController
{
  return self->_homeScreenViewController;
}

- (BOOL)isTodayOverlaySpotlightVisible
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[SBIconController todayViewController](self, "todayViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isSpotlightVisible");
  return (char)v4;
}

- (SBTodayViewController)todayViewController
{
  return self->_todayViewController;
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a4;
  objc_msgSend(v5, "fromLayoutState");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v19, "unlockedEnvironmentMode");
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  v9 = v8;
  if (v6 == 2 || v8 != 2)
  {
    if (v6 != 3 && v8 == 3)
      -[SBIconController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 2, 1);
    if (v6 == 2 && v9 != 2)
    {
      v10 = 8;
      goto LABEL_13;
    }
  }
  else
  {
    -[SBIconController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 8, 1);
  }
  if (v6 == 3 && v9 != 3)
  {
    v10 = 2;
LABEL_13:
    -[SBIconController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", v10, 1);
  }
  -[SBIconController todayViewController](self, "todayViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController keepTodayViewIconImagesStaticAssertion](self, "keepTodayViewIconImagesStaticAssertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9 == 1 || v13)
  {
    if (v9 == 1 && v13)
    {
      objc_msgSend(v13, "invalidate");
      -[SBIconController setKeepTodayViewIconImagesStaticAssertion:](self, "setKeepTodayViewIconImagesStaticAssertion:", 0);
    }
  }
  else if (objc_msgSend(v12, "isPresented"))
  {
    objc_msgSend(v12, "activeSidebarViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v11)
    {
      SBStringForUnlockedEnvironmentMode(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Layout State: "), "stringByAppendingString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "keepIconImageViewControllersStaticForReason:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController setKeepTodayViewIconImagesStaticAssertion:](self, "setKeepTodayViewIconImagesStaticAssertion:", v18);

    }
  }

}

- (BSInvalidatable)keepTodayViewIconImagesStaticAssertion
{
  return self->_keepTodayViewIconImagesStaticAssertion;
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4
{
  void *v4;
  BOOL v5;
  void *v6;

  objc_msgSend(a4, "icon", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    if (__sb__runningInSpringBoard())
    {
      v5 = SBFEffectiveDeviceClass() != 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "userInterfaceIdiom") != 1;

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_libraryViewControllers
{
  id v3;
  void *v4;
  void *v5;
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
  SBLibraryViewController *overlayLibraryViewController;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)SBApp, "windowSceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "connectedWindowScenes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "modalLibraryController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "libraryViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v3, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    if (self->_overlayLibraryViewController)
    {
      overlayLibraryViewController = self->_overlayLibraryViewController;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &overlayLibraryViewController, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = (id)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (BOOL)isModalAppLibrarySupported
{
  _BOOL4 v2;

  v2 = -[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported");
  if (v2)
    LOBYTE(v2) = +[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported");
  return v2;
}

- (BOOL)isAppLibrarySupported
{
  return 1;
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIconLocation:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  v4 = a4;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsBadgesInAppLibrary");

  if ((v7 & 1) != 0 || !SBIconLocationGroupContainsLocation())
    v8 = 1;
  else
    v8 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAA968]);

  return v8;
}

- (BOOL)areAnyIconViewContextMenusShowing
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAnyIconViewContextMenusShowing");

  return v3;
}

- (id)iconManager:(id)a3 fakeStatusBarForFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reusePool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getReusableStatusBarWithReason:", CFSTR("SBFolderController - Blurred Status Bar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)iconManager:(id)a3 folderControllerWillBeginScrolling:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  id v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  char v37;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  CGPoint v47;
  CGRect v48;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPresented");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6
         || self->_tapToEndEditingGestureRecognizer == v6)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 1;
    -[SBIconController iconManager](self, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEditing");
    v13 = objc_msgSend(v11, "isFolderPageManagementUIVisible");
    v14 = objc_msgSend(v11, "isShowingIconContextMenu");
    if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6)
    {
      *((_BYTE *)v44 + 24) = (v12 | v13 | v14) ^ 1;
    }
    else if (self->_tapToEndEditingGestureRecognizer == v6)
    {
      if (((v12 ^ 1 | v13 | v14) & 1) != 0)
      {
        *((_BYTE *)v44 + 24) = 0;
      }
      else
      {
        -[SBIconController iconDragManager](self, "iconDragManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isTrackingUserActiveIconDrags");
        *((_BYTE *)v44 + 24) = v16 ^ 1;

      }
    }
    if (*((_BYTE *)v44 + 24))
    {
      if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer != v6)
        goto LABEL_17;
      v17 = objc_opt_class();
      -[SBIconController _rootFolderController](self, "_rootFolderController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v20, "enterEditingTouchRect");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        objc_msgSend(v7, "locationInView:", v20);
        v47.x = v29;
        v47.y = v30;
        v48.origin.x = v22;
        v48.origin.y = v24;
        v48.size.width = v26;
        v48.size.height = v28;
        *((_BYTE *)v44 + 24) = CGRectContainsPoint(v48, v47);
      }

      if (*((_BYTE *)v44 + 24))
      {
LABEL_17:
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __57__SBIconController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v39[3] = &unk_1E8EA6440;
        v31 = v7;
        v40 = v31;
        v32 = v11;
        v41 = v32;
        v42 = &v43;
        objc_msgSend(v32, "enumerateDisplayedIconViewsUsingBlock:", v39);

        if (*((_BYTE *)v44 + 24) && objc_msgSend(v32, "isOverlayTodayViewVisible"))
        {
          -[SBIconController todayViewController](self, "todayViewController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[SBIconController _shouldTodayViewController:receiveTouch:](self, "_shouldTodayViewController:receiveTouch:", v33, v31);
          *((_BYTE *)v44 + 24) = v34;

        }
      }
    }
    if (*((_BYTE *)v44 + 24) && objc_msgSend(v11, "isMainDisplayLibraryViewVisible"))
    {
      -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController libraryViewControllerForWindowScene:](self, "libraryViewControllerForWindowScene:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v36, "isPresentingSearch");
      *((_BYTE *)v44 + 24) = v37 ^ 1;

    }
    v10 = *((_BYTE *)v44 + 24) != 0;

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)iconManager:(id)a3 folderControllerDidEndScrolling:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a3;
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasOpenFolder");

  if ((v7 & 1) == 0 && (objc_msgSend(v6, "isDockExternal") & 1) == 0)
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pictureInPictureManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dockHeight");
    objc_msgSend(v9, "applyPictureInPictureInsets:forSource:", 1, 0.0, 0.0, v10, 0.0);

  }
  SBLogTelemetrySignposts();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v12, 2u);
  }

  kdebug_trace();
}

- (SBRootFolderController)_rootFolderController
{
  void *v2;
  void *v3;

  -[SBIconController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRootFolderController *)v3;
}

- (double)minimumHomeScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "minimumHomeScreenScale");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (SBWindowScene)mainDisplayWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_mainDisplayWindowScene);
}

- (BOOL)allowsBadgingForIcon:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "overrideBadgeNumberOrString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "applicationBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (objc_msgSend(v4, "isBookmarkIcon"))
      {
        objc_msgSend(v4, "bookmark");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "placeholderBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
    }
    v6 = -[SBIconController _allowsBadgingForApplicationBundleIdentifier:](self, "_allowsBadgingForApplicationBundleIdentifier:", v7);

  }
  return v6;
}

- (BOOL)_allowsBadgingForApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;

  v4 = a3;
  -[SBIconController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeFocusMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsOnlyAllowedApplicationBadges");
  v9 = objc_msgSend(v7, "hidesOnlyDeniedApplicationBadges");
  if (v4)
  {
    v10 = v9;
    v11 = -[NSMutableSet containsObject:](self->_displayIDsWithBadgingEnabled, "containsObject:", v4);
    if (v8)
    {
      objc_msgSend(v7, "allowedApplicationBundleIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 &= objc_msgSend(v12, "containsObject:", v4);
LABEL_7:

      goto LABEL_8;
    }
    if (v10)
    {
      objc_msgSend(v7, "deniedApplicationBundleIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 &= ~objc_msgSend(v12, "containsObject:", v4);
      goto LABEL_7;
    }
  }
  else
  {
    LOBYTE(v11) = v8 ^ 1;
  }
LABEL_8:

  return v11;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBIconModel)model
{
  return self->_iconModel;
}

- (id)iconManager:(id)a3 launchActionsForIconView:(id)a4
{
  return -[SBIconController launchActionsForIconView:](self, "launchActionsForIconView:", a4);
}

- (void)iconManager:(id)a3 didOpenFolder:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("Open Folder"));

  v7 = objc_msgSend(v5, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_DEWEY_POD_OPEN", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_FOLDER_OPEN", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
    }

    kdebug_trace();
    -[SBIconController _setFolderDisplayLayoutElementActive:](self, "_setFolderDisplayLayoutElementActive:", 1);
  }
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v10, "setNeedsFocusUpdate");

}

- (void)_setFolderDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *folderDisplayLayoutAssertion;
  id v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  void *v10;

  folderDisplayLayoutAssertion = self->_folderDisplayLayoutAssertion;
  if (a3)
  {
    if (!folderDisplayLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v10 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0DAB670]);
      objc_msgSend(v10, "setLevel:", 0);
      objc_msgSend(v10, "setFillsDisplayBounds:", 1);
      objc_msgSend(v10, "setLayoutRole:", 6);
      objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addElement:", v10);
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_folderDisplayLayoutAssertion;
      self->_folderDisplayLayoutAssertion = v7;

    }
  }
  else if (folderDisplayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](folderDisplayLayoutAssertion, "invalidate");
    v9 = self->_folderDisplayLayoutAssertion;
    self->_folderDisplayLayoutAssertion = 0;

  }
}

- (id)libraryViewControllerForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (SBLibraryViewController)overlayLibraryViewController
{
  return self->_overlayLibraryViewController;
}

- (BOOL)iconManager:(id)a3 folderController:(id)a4 canChangeCurrentPageIndexToIndex:(int64_t)a5
{
  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken != -1)
    dispatch_once(&iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken, &__block_literal_global_371);
  return iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage == 0;
}

- (id)iconManager:(id)a3 statusBarStyleRequestForFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveStatusBarStyleRequestForLevel:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconManager:(id)a3 wantsToHideStatusBarForFolderController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v7 = a4;
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBFolderController - %p"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 1, v11);
  if (v5)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    objc_msgSend(v12, "acquireWithAnimationParameters:", v13);

  }
  else
  {
    objc_msgSend(v12, "acquire");
  }

  return v12;
}

void __57__SBIconController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  id v9;
  CGPoint v10;
  CGRect v11;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", v9);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v9, "bounds");
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v11, v10) && SBIconViewQueryingDisplayingIconView())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

- (NSSet)visibleIconStateDisplayIdentifiers
{
  return (NSSet *)-[SBIconVisibilityService iconStateDisplayIdentifiers](self->_iconVisibilityService, "iconStateDisplayIdentifiers");
}

- (BOOL)isEditingAllowedForIconManager:(id)a3
{
  void *v3;
  char v4;

  -[SBIconController policyAggregator](self, "policyAggregator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsCapability:", 17);

  return v4;
}

- (id)policyAggregator
{
  SBPolicyAggregatorCapabilityQuerying *override_policyAggregator;
  SBPolicyAggregatorCapabilityQuerying *v3;
  void *v4;
  void *v5;

  override_policyAggregator = self->_override_policyAggregator;
  if (override_policyAggregator)
  {
    v3 = override_policyAggregator;
  }
  else
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policyAggregator");
    v3 = (SBPolicyAggregatorCapabilityQuerying *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void __66__SBIconController__launchFromIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "continuityInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "noteActivatingForAppSuggestion:fromSource:", v2, 2);

  }
}

- (id)launchActionsForIconView:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "continuityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA2C0]);
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithIdentifier:activityTypeIdentifier:appSuggestion:", v6, v7, v3);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isUninstallSupportedForIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if (-[SBIconController isUninstallSupportedForAnyIcon](self, "isUninstallSupportedForAnyIcon")
    && objc_msgSend(v4, "isUninstallSupported"))
  {
    if (objc_msgSend(v4, "isApplicationIcon"))
    {
      objc_msgSend(v4, "application");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSystemApplication")
        && -[SBIconController isUninstallingSystemAppsRestricted](self, "isUninstallingSystemAppsRestricted"))
      {
        v6 = 0;
      }
      else if (v5)
      {
        objc_msgSend(v5, "info");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "uninstallCapability");

        if (v9)
          v6 = -1;
        else
          v6 = 0;
      }
      else
      {
        v6 = 1;
      }

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)isUninstallingSystemAppsRestricted
{
  return self->_uninstallingSystemAppsRestricted;
}

- (BOOL)isUninstallSupportedForAnyIcon
{
  int v2;
  void *v3;
  void *v4;
  char v5;

  v2 = -[SBIconController allowsUninstall](self, "allowsUninstall");
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode"))
    {
      +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "demoDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "shouldLockIconsInStoreDemoMode");

      LOBYTE(v2) = v5 ^ 1;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (BOOL)allowsUninstall
{
  return self->_allowsUninstall;
}

- (void)iconManager:(id)a3 willPrepareIconViewForLaunch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBIconController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBIconController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  objc_msgSend(v5, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconController rootFolder](self, "rootFolder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForIcon:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0DABE08];
  v20[0] = v8;
  v12 = *MEMORY[0x1E0DABE00];
  v19[0] = v11;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isFolderIcon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v19[2] = *MEMORY[0x1E0DABDF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "indexAtPosition:", objc_msgSend(v10, "length") - 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DA9D78];
  v17 = v15;
  objc_msgSend(v16, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "emitEvent:withPayload:", 9, v17);

}

- (SBRootFolder)rootFolder
{
  return -[SBHIconModel rootFolder](self->_iconModel, "rootFolder");
}

- (void)_launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  SBIconLaunchContext *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBIconController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[SBIconController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  -[SBIconController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reasonToDisallowTapOnIconView:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "clearHighlightedIcon");
    SBLogIcon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v8;
      v39 = 2114;
      v40 = v13;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring launch from icon view: %@, reason: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v32 = a5;
    v34 = v9;
    SBLogIcon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Initiating launch from icon view: %@", buf, 0xCu);
    }

    objc_msgSend(v8, "_sbWindowScene");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject switcherController](v14, "switcherController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelEventsWithName:", CFSTR("SBUIApplicationIconLaunchEventLabel"));

    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toggleSwitcherEventName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cancelEventsWithName:", v19);

    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateSwitcherEventName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cancelEventsWithName:", v21);

    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "emitEvent:", 10);

    -[SBIconController launchActivationSettingsForIconView:](self, "launchActivationSettingsForIconView:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v16;
    v24 = objc_msgSend(v16, "windowManagementStyle");
    if ((v32 & 0x20000) != 0 && v24 == 2)
      objc_msgSend(v23, "setFlag:forActivationSetting:", 1, 72);
    objc_msgSend(v8, "location", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(SBIconLaunchContext);
    -[SBIconLaunchContext setActivationSettings:](v26, "setActivationSettings:", v23);
    -[SBIconLaunchContext setActions:](v26, "setActions:", v34);
    -[SBIconLaunchContext setIconView:](v26, "setIconView:", v8);
    if (objc_msgSend(v12, "isWidgetIcon"))
    {
      -[SBIconController _launchWidgetIcon:fromLocation:withContext:](self, "_launchWidgetIcon:fromLocation:withContext:", v12, v25, v26);
    }
    else
    {
      v27 = objc_msgSend(v12, "performLaunchFromLocation:context:", v25, v26);
      SBLogIcon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v27;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Icon handled launch: %{BOOL}u", buf, 8u);
      }

    }
    v29 = (void *)MEMORY[0x1E0D229B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __66__SBIconController__launchFromIconView_withActions_modifierFlags___block_invoke;
    v35[3] = &unk_1E8E9DED8;
    v36 = v8;
    objc_msgSend(v29, "eventWithName:handler:", CFSTR("noteActivatingAppSuggestion"), v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "executeOrAppendEvent:", v30);

    v9 = v34;
  }

}

- (id)launchActivationSettingsForIconView:(id)a3
{
  id v4;
  SBActivationSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_alloc_init(SBActivationSettings);
  -[SBIconController launchURLForIconView:](self, "launchURLForIconView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SBActivationSettings setObject:forActivationSetting:](v5, "setObject:forActivationSetting:", v6, 5);
  objc_msgSend(v4, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && objc_msgSend(v9, "restrictedToTheEmbeddedDisplayInChamois")
    && objc_msgSend(v7, "isExtendedDisplayWindowScene"))
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "embeddedDisplayWindowScene");
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  -[SBActivationSettings setObject:forActivationSetting:](v5, "setObject:forActivationSetting:", v7, 68);

  return v5;
}

- (id)launchURLForIconView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "continuityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "launchURLRequiresInboxCopy");
  objc_msgSend(v3, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentInboxURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "makeInboxCopyOfLaunchURLToInboxURL:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = v9;
    goto LABEL_6;
  }
  v13 = objc_msgSend(v7, "isBookmarkIcon");

  if (v13)
  {
    objc_msgSend(v3, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationToLaunch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v8, "launchURL");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    v5 = (void *)v12;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SBIconController *v24;
  id v25;
  id v26;
  int64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  -[SBIconController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[SBIconController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  objc_msgSend(v9, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isApplicationIcon")
    && (objc_msgSend(v12, "application"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isAnyTerminationAssertionInEffect"),
        v13,
        v14))
  {
    SBLogIcon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "applicationBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Delaying launch of %@ because termination assertion is held", buf, 0xCu);

    }
    v17 = (void *)MEMORY[0x1E0C99E88];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __80__SBIconController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke;
    v23 = &unk_1E8EA6688;
    v24 = self;
    v25 = v9;
    v26 = v10;
    v27 = a6;
    objc_msgSend(v17, "timerWithTimeInterval:repeats:block:", 0, &v20, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v20, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTimer:forMode:", v18, *MEMORY[0x1E0C99860]);

    -[SBIconController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", v18);
  }
  else
  {
    -[SBIconController _launchFromIconView:withActions:modifierFlags:](self, "_launchFromIconView:withActions:modifierFlags:", v9, v10, a6);
  }

}

- (void)setDelayedLaunchRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayedLaunchRequestTimer, a3);
}

- (NSTimer)delayedLaunchRequestTimer
{
  return self->_delayedLaunchRequestTimer;
}

- (void)iconManager:(id)a3 touchesEndedForIconView:(id)a4
{
  kdebug_trace();
}

- (void)iconManager:(id)a3 possibleUserIconTapBeganAfterInformingIcon:(id)a4
{
  kdebug_trace();
}

- (void)iconManager:(id)a3 possibleUserIconTapBegan:(id)a4
{
  kdebug_trace();
}

- (void)iconManager:(id)a3 willOpenFolderController:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "suspendsWallpaperAnimationWhileOpen"))
  {
    objc_msgSend(v10, "extraAssertions");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v10, "setExtraAssertions:", v4);
    }
    objc_msgSend(v4, "valueForKey:", CFSTR("SuspendWallpaperAnimationAssertion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "invalidate");
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SBIconControllerOpenFolderWallpaperAnimationSuspensionReason"), "stringByAppendingFormat:", CFSTR("-%p"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspendWallpaperAnimationForReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("SuspendWallpaperAnimationAssertion"));
  }

}

- (void)addIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;

  v4 = a4;
  v7 = -[SBIconController iconOcclusionReasons](self, "iconOcclusionReasons");
  if ((a3 & ~v7) != 0)
  {
    -[SBIconController setIconOcclusionReasons:](self, "setIconOcclusionReasons:", v7 | a3);
    if (v4)
      -[SBIconController _updateVisibleIconsAfterOcclusionChange](self, "_updateVisibleIconsAfterOcclusionChange");
  }
}

uint64_t __61__SBIconController_publisher_didUpdateLayout_withTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconOcclusionReasons:", objc_msgSend(*(id *)(a1 + 32), "iconOcclusionReasons") & 0xFFFFFFFFFFFFFFCFLL | *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibleIconsAfterOcclusionChange");
}

- (void)setIconOcclusionReasons:(unint64_t)a3
{
  self->_iconOcclusionReasons = a3;
}

- (void)_updateVisibleIconsAfterOcclusionChange
{
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[SBIconController iconOcclusionReasons](self, "iconOcclusionReasons");
  v5 = (v4 & 0x12) != 0;
  if ((v4 & 0x12) != 0)
    v6 = 2;
  else
    v6 = v4 != 0;
  -[SBIconController iconManager](self, "iconManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentVisibility:", v6);
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentVisibility:", v6);
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController setWallpaperAnimationDisabled:forReason:](self, "setWallpaperAnimationDisabled:forReason:", v5, v8);

}

- (SBHomeScreenOverlayController)homeScreenOverlayController
{
  return self->_homeScreenOverlayController;
}

- (unint64_t)iconOcclusionReasons
{
  return self->_iconOcclusionReasons;
}

- (void)setWallpaperAnimationDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[SBIconController suspendWallpaperAnimationForOverlayViewAssertion](self, "suspendWallpaperAnimationForOverlayViewAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  if (v4)
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspendWallpaperAnimationForReason:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController setSuspendWallpaperAnimationForOverlayViewAssertion:](self, "setSuspendWallpaperAnimationForOverlayViewAssertion:", v8);

  }
}

- (BSInvalidatable)suspendWallpaperAnimationForOverlayViewAssertion
{
  return self->_suspendWallpaperAnimationForOverlayViewAssertion;
}

- (void)setSuspendWallpaperAnimationForOverlayViewAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForOverlayViewAssertion, a3);
}

- (SBHIconImageCache)appSwitcherHeaderIconImageCache
{
  SBHIconImageCache *appSwitcherHeaderIconImageCache;
  void *v4;
  SBHIconImageCache *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SBHIconImageCache *v14;
  SBHIconImageCache *v15;

  appSwitcherHeaderIconImageCache = self->_appSwitcherHeaderIconImageCache;
  if (!appSwitcherHeaderIconImageCache)
  {
    +[SBAppSwitcherModel appSwitcherHeaderIconImageDescriptorName](SBAppSwitcherModel, "appSwitcherHeaderIconImageDescriptorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D3A890]))
    {
      -[SBIconController tableUIIconImageCache](self, "tableUIIconImageCache");
      v5 = (SBHIconImageCache *)objc_claimAutoreleasedReturnValue();
      v6 = self->_appSwitcherHeaderIconImageCache;
      self->_appSwitcherHeaderIconImageCache = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v8 = v7;
      v10 = v9;
      objc_msgSend(v6, "scale");
      v12 = v11;
      objc_msgSend(v6, "continuousCornerRadius");
      v14 = (SBHIconImageCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("appSwitcherHeaderIcon"), v8, v10, v12, v13);
      v15 = self->_appSwitcherHeaderIconImageCache;
      self->_appSwitcherHeaderIconImageCache = v14;

    }
    appSwitcherHeaderIconImageCache = self->_appSwitcherHeaderIconImageCache;
  }
  return appSwitcherHeaderIconImageCache;
}

- (id)iconManager:(id)a3 floatingDockViewControllerForView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t result;
  const __CFString *v5;
  int v6;
  id v7;
  const __CFString *v8;
  int v9;
  int v10;
  int v11;
  const __CFString *v12;
  int v13;
  id v14;
  const __CFString *v15;
  int v16;
  int v17;

  objc_msgSend(*(id *)(a1 + 32), "userInterfaceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowIconRotation:forReason:", 1, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_endDisablingAllOrientationChangesForReason:", *(_QWORD *)(a1 + 40));
  v3 = (id *)MEMORY[0x1E0CEB258];
  result = objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest");
  if ((_DWORD)result)
  {
    v5 = CFSTR("AppOpen");
    v6 = objc_msgSend(*v3, "isRunningTest:", CFSTR("AppOpen"));
    v7 = *v3;
    if (v6)
    {
LABEL_3:
      v8 = CFSTR("AppOpenAnimation");
      return objc_msgSend(v7, "finishedSubTest:forTest:", v8, v5);
    }
    v5 = CFSTR("AppClose");
    v9 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppClose"));
    v7 = *v3;
    if (v9)
      goto LABEL_5;
    v5 = CFSTR("AppOpenInFolder");
    v10 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppOpenInFolder"));
    v7 = *v3;
    if (v10)
      goto LABEL_3;
    v5 = CFSTR("AppCloseInFolder");
    v11 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppCloseInFolder"));
    v7 = *v3;
    if (v11)
    {
LABEL_5:
      v8 = CFSTR("AppCloseAnimation");
      return objc_msgSend(v7, "finishedSubTest:forTest:", v8, v5);
    }
    v12 = CFSTR("FolderOpen");
    v13 = objc_msgSend(v7, "isRunningTest:", CFSTR("FolderOpen"));
    v14 = *v3;
    if (v13)
    {
      v15 = CFSTR("FolderOpenAnimation");
LABEL_13:
      objc_msgSend(v14, "finishedSubTest:forTest:", v15, v12);
      return objc_msgSend(*v3, "finishedTest:", v12);
    }
    v12 = CFSTR("FolderClose");
    v16 = objc_msgSend(v14, "isRunningTest:", CFSTR("FolderClose"));
    v14 = *v3;
    if (v16)
    {
      v15 = CFSTR("FolderCloseAnimation");
      goto LABEL_13;
    }
    v5 = CFSTR("AppOpenInScreenTime");
    v17 = objc_msgSend(v14, "isRunningTest:", CFSTR("AppOpenInScreenTime"));
    v7 = *v3;
    if (v17)
      goto LABEL_3;
    v5 = CFSTR("AppCloseInScreenTime");
    result = objc_msgSend(v7, "isRunningTest:", CFSTR("AppCloseInScreenTime"));
    if ((_DWORD)result)
    {
      v7 = *v3;
      goto LABEL_5;
    }
  }
  return result;
}

- (void)_endDisablingAllOrientationChangesForReason:(id)a3
{
  NSMapTable *deviceOrientationUpdateDeferralAssertionsByReason;
  id v5;
  void *v6;
  id v7;

  deviceOrientationUpdateDeferralAssertionsByReason = self->_deviceOrientationUpdateDeferralAssertionsByReason;
  v5 = a3;
  -[NSMapTable objectForKey:](deviceOrientationUpdateDeferralAssertionsByReason, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "removeObjectForKey:", v5);
  objc_msgSend(v7, "invalidate");
  -[NSMapTable objectForKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "removeObjectForKey:", v5);

  objc_msgSend(v6, "invalidate");
}

- (void)iconManager:(id)a3 nestingViewController:(id)a4 willPerformOperation:(int64_t)a5 onViewController:(id)a6 withTransitionCoordinator:(id)a7
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;

  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = a7;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("SBTransitioningToOrFromFolder-<%@ %p>"), objc_opt_class(), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController userInterfaceController](self, "userInterfaceController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowIconRotation:forReason:", 0, v13);

  -[SBIconController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", v13);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10;
  v25[3] = &unk_1E8EA6840;
  v25[4] = self;
  v15 = v13;
  v26 = v15;
  objc_msgSend(v12, "animateAlongsideTransition:completion:", &__block_literal_global_591, v25);

  if (!+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    if (a5 != 1
      && (-[SBIconController _rootFolderController](self, "_rootFolderController"),
          v16 = (id)objc_claimAutoreleasedReturnValue(),
          v16,
          v16 == v10))
    {
      -[SBIconController _rootFolderController](self, "_rootFolderController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dockHeight");
      v19 = v22;

      v20 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
    }
    else
    {
      v18 = *MEMORY[0x1E0CEB4B0];
      v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v20 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    }
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pictureInPictureManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applyPictureInPictureInsets:forSource:", 1, v18, v17, v19, v20);

  }
}

- (void)_beginDisablingAllOrientationChangesForReason:(id)a3
{
  void *v4;
  SBDisableActiveInterfaceOrientationChangeAssertion *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "setObject:forKey:", v4, v6);
  }
  -[NSMapTable objectForKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "objectForKey:", v6);
  v5 = (SBDisableActiveInterfaceOrientationChangeAssertion *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SBDisableActiveInterfaceOrientationChangeAssertion initWithReason:nudgeOrientationOnInvalidate:]([SBDisableActiveInterfaceOrientationChangeAssertion alloc], "initWithReason:nudgeOrientationOnInvalidate:", v6, 0);
    -[NSMapTable setObject:forKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "setObject:forKey:", v5, v6);
  }

}

- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5
{
  id v7;
  void *v8;
  char isKindOfClass;

  v7 = a4;
  LOBYTE(a5) = -[SBIconController shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:](self, "shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:", a5);
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return (a5 ^ isKindOfClass) & 1;
}

- (BOOL)shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:(id)a3
{
  return 1;
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  _QWORD block[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a4, "elements", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x1E0D22C78];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "isSpringBoardElement"))
        {
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v10);

          if (v14)
          {
            v8 |= 0x10uLL;
          }
          else
          {
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.InCallService"));

            if (v16)
              v8 |= 0x20uLL;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SBIconController_publisher_didUpdateLayout_withTransition___block_invoke;
  block[3] = &unk_1E8E9DE88;
  block[4] = self;
  block[5] = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)rootFolderController:(id)a3 transitionWillBegin:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[SBIconController displayLayoutTransition](self, "displayLayoutTransition", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionAssertionWithReason:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[SBIconController setDisplayLayoutTransition:](self, "setDisplayLayoutTransition:", v7);
    v5 = v7;
  }

}

- (void)setDisplayLayoutTransition:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutTransition, a3);
}

- (void)rootFolderController:(id)a3 transitionDidFinish:(id)a4
{
  void *v5;

  -[SBIconController displayLayoutTransition](self, "displayLayoutTransition", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[SBIconController setDisplayLayoutTransition:](self, "setDisplayLayoutTransition:", 0);
}

- (BSInvalidatable)displayLayoutTransition
{
  return self->_displayLayoutTransition;
}

- (UIEdgeInsets)iconManager:(id)a3 statusBarEdgeInsetsForFolderController:(id)a4
{
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarEdgeInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)iconManager:(id)a3 willOpenFolder:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v4 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateReachability");

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("Open Folder"));

  v7 = objc_msgSend(v4, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      v13 = 0;
      v10 = "SB_HOME_DEWEY_POD_OPEN";
      v11 = (uint8_t *)&v13;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
    }
  }
  else if (v9)
  {
    v12 = 0;
    v10 = "SB_HOME_FOLDER_OPEN";
    v11 = (uint8_t *)&v12;
    goto LABEL_6;
  }

  kdebug_trace();
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke()
{
  id *v0;
  uint64_t result;
  int v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;
  id v11;
  int v12;
  int v13;
  int v14;
  id v15;

  v0 = (id *)MEMORY[0x1E0CEB258];
  result = objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest");
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
    v2 = objc_msgSend(*v0, "isRunningTest:", CFSTR("AppOpen"));
    v3 = *v0;
    if (v2)
    {
      objc_msgSend(v3, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpen"));
      v4 = *v0;
      v5 = &__block_literal_global_595;
    }
    else
    {
      v6 = objc_msgSend(v3, "isRunningTest:", CFSTR("AppClose"));
      v7 = *v0;
      if (v6)
      {
        objc_msgSend(v7, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppClose"));
        v4 = *v0;
        v5 = &__block_literal_global_598;
      }
      else
      {
        v8 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppOpenInFolder"));
        v9 = *v0;
        if (v8)
        {
          objc_msgSend(v9, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenInFolder"));
          v4 = *v0;
          v5 = &__block_literal_global_599;
        }
        else
        {
          v10 = objc_msgSend(v9, "isRunningTest:", CFSTR("AppCloseInFolder"));
          v11 = *v0;
          if (v10)
          {
            objc_msgSend(v11, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseInFolder"));
            v4 = *v0;
            v5 = &__block_literal_global_600;
          }
          else
          {
            v12 = objc_msgSend(v11, "isRunningTest:", CFSTR("FolderOpen"));
            v4 = *v0;
            if (v12)
            {
              v5 = &__block_literal_global_601;
            }
            else
            {
              v13 = objc_msgSend(v4, "isRunningTest:", CFSTR("FolderClose"));
              v4 = *v0;
              if (v13)
              {
                v5 = &__block_literal_global_602;
              }
              else
              {
                v14 = objc_msgSend(v4, "isRunningTest:", CFSTR("AppOpenInScreenTime"));
                v15 = *v0;
                if (v14)
                {
                  objc_msgSend(v15, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenInScreenTime"));
                  v4 = *v0;
                  v5 = &__block_literal_global_603;
                }
                else
                {
                  result = objc_msgSend(v15, "isRunningTest:", CFSTR("AppCloseInScreenTime"));
                  if (!(_DWORD)result)
                    return result;
                  objc_msgSend(*v0, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseInScreenTime"));
                  v4 = *v0;
                  v5 = &__block_literal_global_604;
                }
              }
            }
          }
        }
      }
    }
    return objc_msgSend(v4, "installCACommitCompletionBlock:", v5);
  }
  return result;
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconController _updateEnabledBadgesSetWithSections:](self, "_updateEnabledBadgesSetWithSections:", v5);

}

- (void)_updateEnabledBadgesSetWithSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  NSMutableSet *displayIDsWithBadgingEnabled;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSMutableSet *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  const __CFString *v51;
  id v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    v37 = 138412290;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v11, "sectionID", v37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[SBIconController _badgesAreEnabledForSectionInfo:](self, "_badgesAreEnabledForSectionInfo:", v11))
        {
          if (!-[NSMutableSet containsObject:](self->_displayIDsWithBadgingEnabled, "containsObject:", v12))goto LABEL_18;
          -[NSMutableSet removeObject:](self->_displayIDsWithBadgingEnabled, "removeObject:", v12);
          objc_msgSend(v5, "addObject:", v12);
          SBLogIcon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v37;
            v56 = v12;
            v16 = v15;
            v17 = "Removing %@ from list of apps with allowed badges";
LABEL_16:
            _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
          }
LABEL_17:

          goto LABEL_18;
        }
        if (v12
          && (-[NSMutableSet containsObject:](self->_displayIDsWithBadgingEnabled, "containsObject:", v12) & 1) == 0)
        {
          if (!self->_displayIDsWithBadgingEnabled)
          {
            v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
            displayIDsWithBadgingEnabled = self->_displayIDsWithBadgingEnabled;
            self->_displayIDsWithBadgingEnabled = v13;

          }
          objc_msgSend(v5, "addObject:", v12);
          -[NSMutableSet addObject:](self->_displayIDsWithBadgingEnabled, "addObject:", v12);
          SBLogIcon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v37;
            v56 = v12;
            v16 = v15;
            v17 = "Adding %@ to list of apps with allowed badges";
            goto LABEL_16;
          }
          goto LABEL_17;
        }
LABEL_18:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v8);
  }
  v38 = v6;

  if (!-[NSMutableSet count](self->_displayIDsWithBadgingEnabled, "count"))
  {
    v18 = self->_displayIDsWithBadgingEnabled;
    self->_displayIDsWithBadgingEnabled = 0;

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        -[SBHIconModel applicationIconsForBundleIdentifier:](self->_iconModel, "applicationIconsForBundleIdentifier:", v24, v38);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v40;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v40 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "noteBadgeDidChange");
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          }
          while (v27);
        }

        -[SBHIconModel bookmarkIconForWebClipPlaceholderBundleIdentifier:](self->_iconModel, "bookmarkIconForWebClipPlaceholderBundleIdentifier:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "noteBadgeDidChange");

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = SBIconControllerIconBadgeVisibilityDidChangeNotification;
  v51 = CFSTR("SBApplicationBundleIdentifiers");
  v52 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "postNotificationName:object:userInfo:", v32, self, v33);

  if (objc_msgSend(v19, "count"))
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "notificationDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet allObjects](self->_displayIDsWithBadgingEnabled, "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDisplayIDsWithBadgingEnabled:", v36);

  }
}

- (BOOL)_badgesAreEnabledForSectionInfo:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "pushSettings") >> 3) & 1;
}

void __70__SBIconController_iconManager_configurationDataForDataSource_ofIcon___block_invoke()
{
  NSObject *v0;

  SBLogWidgetIntent();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __70__SBIconController_iconManager_configurationDataForDataSource_ofIcon___block_invoke_cold_1();

}

- (id)temporaryIntentDataForIconWithIdentifier:(id)a3 widgetUniqueIdentifier:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR("%@^%@"), v8, v6);

  -[NSMutableDictionary objectForKey:](self->_temporaryWidgetIntents, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "length"))
      v12 = CFSTR("HAS DATA");
    else
      v12 = CFSTR("0 LENGTH INTENT");
  }
  else
  {
    v12 = CFSTR("NIL INTENT");
  }
  SBLogWidgetIntent();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Fetching temporary intent for widget unique identifier '%{public}@' / %@; has data? %{public}@",
      buf,
      0x20u);
  }

  return v11;
}

- (id)proactiveHomeScreenUsageObserver:(id)a3 intentForWidget:(id)a4 ofIcon:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[SBIconController iconManager](self, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intentForWidget:ofIcon:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class();
  SBSafeCast(v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isWidgetIcon"))
    goto LABEL_4;
  if (!v10)
    goto LABEL_4;
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController temporaryIntentDataForIconWithIdentifier:widgetUniqueIdentifier:](self, "temporaryIntentDataForIconWithIdentifier:widgetUniqueIdentifier:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performAfterFirstUnlockSinceBootUsingBlock:", &__block_literal_global_614);
    v24 = 0;
    v25 = 0;
    objc_msgSend((id)objc_opt_class(), "_getApplicationDataStore:configurationKey:forDataSource:", &v25, &v24, v7);
    v15 = v25;
    v16 = v24;
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeObjectForKey:ofType:", v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogWidgetIntent();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      SBHConfigurationIdentifierFromDataSource();
      v23 = v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "state");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v19;
      v28 = 2114;
      v29 = v16;
      v30 = 2114;
      v31 = v20;
      v32 = 2114;
      v33 = v21;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: fetched config data for key: %{public}@, result: %{public}@ bytes with keybag state: %{public}@.", buf, 0x2Au);

      v8 = v23;
    }

  }
  return v13;
}

+ (void)_getApplicationDataStore:(id *)a3 configurationKey:(id *)a4 forDataSource:(id)a5
{
  id v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;

  v7 = a5;
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  if ((v8 & 1) != 0 && (v9 & 1) != 0)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationStorageIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBLogWidgetIntent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SBIconController _getApplicationDataStore:configurationKey:forDataSource:].cold.2();

    }
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("icon-config:%@"), v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBLogWidgetIntent();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[SBIconController _getApplicationDataStore:configurationKey:forDataSource:].cold.1();

    }
  }

}

- (SBIconController)initWithMainDisplayWindowScene:(id)a3
{
  return -[SBIconController initWithMainDisplayWindowScene:alertItemsController:analyticsClient:applicationController:applicationPlaceholderController:assistantController:coverSheetPresentationManager:layoutStateProvider:lockScreenManager:policyAggregator:userInterfaceController:widgetMetricsServer:](self, "initWithMainDisplayWindowScene:alertItemsController:analyticsClient:applicationController:applicationPlaceholderController:assistantController:coverSheetPresentationManager:layoutStateProvider:lockScreenManager:policyAggregator:userInterfaceController:widgetMetricsServer:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (SBIconController)initWithMainDisplayWindowScene:(id)a3 alertItemsController:(id)a4 analyticsClient:(id)a5 applicationController:(id)a6 applicationPlaceholderController:(id)a7 assistantController:(id)a8 coverSheetPresentationManager:(id)a9 layoutStateProvider:(id)a10 lockScreenManager:(id)a11 policyAggregator:(id)a12 userInterfaceController:(id)a13 widgetMetricsServer:(id)a14
{
  id v19;
  SBIconController *v20;
  SBIconController *v21;
  SBPowerLogMetricsAggregator *v22;
  SBPowerLogMetricsAggregator *powerLogAggregator;
  id v24;
  uint64_t v25;
  BSEventQueue *transitionEventQueue;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *accountStoreQueue;
  void *v29;
  void *v30;
  void *suggestedOnboardingStack;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSMutableSet *displayIDsWithBadgingEnabled;
  uint64_t Serial;
  id v46;
  void *v47;
  uint64_t v48;
  BBObserver *bbObserver;
  void *v50;
  SBHIconManager *v51;
  SBHIconManager *iconManager;
  SBWallpaperIconStyleCoordinator *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  SBWallpaperIconStyleCoordinator *iconStyleCoordinator;
  SBHomeScreenViewController *v59;
  SBHIconManager *v60;
  void *v61;
  SBHomeScreenViewController *v62;
  SBHomeScreenViewController *homeScreenViewController;
  SBHomeScreenViewController *v64;
  SBHIconManager *v65;
  void *v66;
  uint64_t v67;
  SBWidgetMetricsServer *widgetMetricsServer;
  SBHIconManager *v69;
  void *v70;
  SBHIconManager *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  SBProactiveHomeScreenUsageObserver *v78;
  SBProactiveHomeScreenUsageObserver *proactiveUsageObserver;
  SBProactiveHomeScreenSuggestionProvider *v80;
  SBProactiveHomeScreenSuggestionProvider *proactiveSuggestionProvider;
  SBTipsHomeScreenUsageObserver *v82;
  SBTipsHomeScreenUsageObserver *tipsUsageObserver;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  PTSingleTestRecipe *relayoutTestRecipe;
  uint64_t v88;
  PTSingleTestRecipe *toggleSearchTestRecipe;
  void *v90;
  uint64_t v91;
  PTSingleTestRecipe *runDownloadingIconTestRecipe;
  void *v93;
  uint64_t v94;
  PTSingleTestRecipe *runRemoveAndRestoreIconTestRecipe;
  void *v96;
  uint64_t v97;
  PTSingleTestRecipe *organizeInFoldersTestRecipe;
  void *v99;
  uint64_t v100;
  PTDoubleTestRecipe *shuffleStackTestRecipe;
  void *v102;
  uint64_t v103;
  PTSingleTestRecipe *runWidgetDiscoverabilityTestRecipe;
  void *v105;
  uint64_t v106;
  SBHRootFolderSettings *rootFolderSettings;
  uint64_t v108;
  NSMapTable *deviceOrientationUpdateDeferralAssertionsByReason;
  uint64_t v110;
  NSMapTable *activeInterfaceOrientationChangeDeferralAssertionsByReason;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  uint64_t v124;
  SBHIconEditingSettings *iconEditingSettings;
  void *v126;
  uint64_t v127;
  SBHWidgetSettings *widgetSettings;
  id v129;
  uint64_t v130;
  BSInvalidatable *stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled;
  uint64_t v132;
  BSInvalidatable *stateCaptureHandleForHomeScreenDefaults;
  uint64_t v134;
  BSInvalidatable *stateCaptureHandleForInterestingAppIconLocations;
  uint64_t v136;
  BSInvalidatable *stateCaptureHandleForRestrictions;
  uint64_t v138;
  DNDStateService *dndStateService;
  uint64_t v140;
  DNDModeConfigurationService *dndModeConfigurationService;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  SBHAnalyticsEventsController *analyticsEventsController;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  void *v165;
  id v166;
  id v167;
  _QWORD v168[4];
  id v169;
  _QWORD v170[4];
  id v171;
  _QWORD v172[4];
  id v173;
  _QWORD v174[4];
  id v175;
  _QWORD v176[4];
  id v177;
  _QWORD v178[4];
  id v179;
  _QWORD v180[4];
  id v181;
  _QWORD v182[4];
  id v183;
  _QWORD v184[4];
  id v185;
  _QWORD v186[4];
  id v187;
  _QWORD v188[4];
  id v189;
  id location;
  objc_super v191;

  v19 = a3;
  v163 = a4;
  v162 = a5;
  v152 = a6;
  v161 = a6;
  v160 = a7;
  v159 = a8;
  v158 = a9;
  v157 = a10;
  v156 = a11;
  v155 = a12;
  v154 = a13;
  v153 = a14;
  v191.receiver = self;
  v191.super_class = (Class)SBIconController;
  v20 = -[SBIconController init](&v191, sel_init);
  v21 = v20;
  if (v20)
  {
    v165 = v19;
    objc_storeWeak((id *)&v20->_mainDisplayWindowScene, v19);
    objc_storeStrong((id *)&v21->_override_alertItemsController, a4);
    objc_storeStrong((id *)&v21->_override_analyticsClient, a5);
    objc_storeStrong((id *)&v21->_override_applicationController, v152);
    objc_storeStrong((id *)&v21->_override_applicationPlaceholderController, a7);
    objc_storeStrong((id *)&v21->_override_assistantController, a8);
    objc_storeStrong((id *)&v21->_override_coverSheetPresentationManager, a9);
    objc_storeStrong((id *)&v21->_override_layoutStateProvider, a10);
    objc_storeStrong((id *)&v21->_override_lockScreenManager, a11);
    objc_storeStrong((id *)&v21->_override_policyAggregator, a12);
    objc_storeStrong((id *)&v21->_override_userInterfaceController, a13);
    objc_storeStrong((id *)&v21->_override_widgetMetricsServer, a14);
    v22 = objc_alloc_init(SBPowerLogMetricsAggregator);
    powerLogAggregator = v21->_powerLogAggregator;
    v21->_powerLogAggregator = v22;

    v24 = objc_alloc(MEMORY[0x1E0D01770]);
    v25 = objc_msgSend(v24, "initWithName:onQueue:", CFSTR("com.apple.SpringBoard.iconController.transitions"), MEMORY[0x1E0C80D38]);
    transitionEventQueue = v21->_transitionEventQueue;
    v21->_transitionEventQueue = (BSEventQueue *)v25;

    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    accountStoreQueue = v21->_accountStoreQueue;
    v21->_accountStoreQueue = (OS_dispatch_queue *)SerialWithQoS;

    objc_msgSend(MEMORY[0x1E0DAA398], "setSignificantTimeChangeNotificationName:", CFSTR("SBSignificantTimeChangedNotification"));
    -[SBIconController applicationController](v21, "applicationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "restrictionController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:", v21);

    -[SBIconController _updateIconModelStore](v21, "_updateIconModelStore");
    if (-[SBIconController isUpgradeRestore](v21, "isUpgradeRestore")
      && !-[SBIconController isEnterpriseMultiUser](v21, "isEnterpriseMultiUser"))
    {
      -[SBIconController proactiveOnboardingDefaultStacks](v21, "proactiveOnboardingDefaultStacks");
      v33 = objc_claimAutoreleasedReturnValue();
      suggestedOnboardingStack = v21->_suggestedOnboardingStack;
      v21->_suggestedOnboardingStack = (NSArray *)v33;
    }
    else
    {
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      suggestedOnboardingStack = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(suggestedOnboardingStack, "homeScreenDefaults");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setShouldAddDefaultWidgetsToHomeScreen:", 0);

    }
    v21->_sendITunesNotification = 1;
    objc_msgSend((id)SBApp, "accountStoreController");
    v34 = objc_claimAutoreleasedReturnValue();
    -[SBIconController coverSheetPresentationManager](v21, "coverSheetPresentationManager");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__installedAppsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__unlockAnimationDidFinish_, CFSTR("SBLockScreenManagerUnlockAnimationDidFinish"), 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__lockScreenUIWillLock_, CFSTR("SBLockScreenUIWillLockNotification"), 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__lockScreenUIWillLock_, CFSTR("SBLockScreenUIRelockedNotification"), 0);
    v151 = (void *)v34;
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__primaryAppleAccountDidChange_, CFSTR("SBAccountStoreManagerPrimaryAppleAccountDidChangeNotification"), v34);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__storeAccountDidChange_, *MEMORY[0x1E0C8F1C0], 0);
    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__backupRestoringDidChange_, CFSTR("SBResetOrRestoreStateDidChangeNotification"), v37);

    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__controlCenterWillPresent_, CFSTR("SBControlCenterControllerWillPresentNotification"), v38);

    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__controlCenterWillDismiss_, CFSTR("SBControlCenterControllerWillDismissNotification"), v39);

    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__coverSheetWillPresent_, CFSTR("SBCoverSheetWillPresentNotification"), v35);
    v150 = (void *)v35;
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__coverSheetDidPresent_, CFSTR("SBCoverSheetDidPresentNotification"), v35);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__forceTouchControllerWillPresent_, *MEMORY[0x1E0DAAA50], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__bookmarkDidUninstall_, *MEMORY[0x1E0DAAAB0], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__mainSwitcherCreated_, CFSTR("SBMainSwitcherSwitcherSharedInstanceCreatedNotification"), 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__reduceMotionStatusDidChange_, *MEMORY[0x1E0CEB090], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__policyAggregatorCapabilitiesDidChange_, CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__styleEditorWillPresent_, *MEMORY[0x1E0DAA7F8], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__styleEditorDidDismiss_, *MEMORY[0x1E0DAA7D0], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__colorDropperWillPresent_, *MEMORY[0x1E0DAA7F0], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v21, sel__colorDropperDismissed_, *MEMORY[0x1E0DAA7C8], 0);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "notificationDefaults");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "displayIDsWithBadgingEnabled");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v42, "count"))
    {
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v42);
      displayIDsWithBadgingEnabled = v21->_displayIDsWithBadgingEnabled;
      v21->_displayIDsWithBadgingEnabled = (NSMutableSet *)v43;

    }
    Serial = BSDispatchQueueCreateSerial();
    v46 = objc_alloc(MEMORY[0x1E0D036B8]);
    v47 = (void *)MEMORY[0x1E0C80D38];
    v149 = (void *)Serial;
    v48 = objc_msgSend(v46, "initWithQueue:calloutQueue:", Serial, MEMORY[0x1E0C80D38]);
    bbObserver = v21->_bbObserver;
    v21->_bbObserver = (BBObserver *)v48;

    -[BBObserver setDelegate:](v21->_bbObserver, "setDelegate:", v21);
    -[BBObserver setObserverFeed:](v21->_bbObserver, "setObserverFeed:", 512);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "registerObserver:", v21);
    v148 = v50;
    -[SBIconController profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:](v21, "profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:", v50, 0);
    -[SBIconController _updateUninstallingSystemAppsRestricted](v21, "_updateUninstallingSystemAppsRestricted");
    v51 = (SBHIconManager *)objc_alloc_init(MEMORY[0x1E0DAA4A8]);
    iconManager = v21->_iconManager;
    v21->_iconManager = v51;

    -[SBHIconManager setDelegate:](v21->_iconManager, "setDelegate:", v21);
    if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
    {
      v53 = [SBWallpaperIconStyleCoordinator alloc];
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "homeScreenDefaults");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[SBWallpaperIconStyleCoordinator initWithWallpaperController:homeScreenDefaults:](v53, "initWithWallpaperController:homeScreenDefaults:", v54, v56);
      iconStyleCoordinator = v21->_iconStyleCoordinator;
      v21->_iconStyleCoordinator = (SBWallpaperIconStyleCoordinator *)v57;

      -[SBWallpaperIconStyleCoordinator addIconStyleObserver:](v21->_iconStyleCoordinator, "addIconStyleObserver:", v21);
      v59 = [SBHomeScreenViewController alloc];
      v60 = v21->_iconManager;
      -[SBIconController userInterfaceController](v21, "userInterfaceController");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[SBHomeScreenViewController initWithWindowScene:iconController:iconManager:userInterfaceController:](v59, "initWithWindowScene:iconController:iconManager:userInterfaceController:", v165, v21, v60, v61);

      homeScreenViewController = v21->_homeScreenViewController;
      v21->_homeScreenViewController = v62;
      v64 = v62;

      v65 = v21->_iconManager;
      -[SBHomeScreenViewController view](v64, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconManager configureFeedbackView:](v65, "configureFeedbackView:", v66);

      -[SBIconController updateHomeScreenTraitOverridesForViewController:](v21, "updateHomeScreenTraitOverridesForViewController:", v21->_homeScreenViewController);
    }
    -[SBIconController widgetMetricsServer](v21, "widgetMetricsServer");
    v67 = objc_claimAutoreleasedReturnValue();
    widgetMetricsServer = v21->_widgetMetricsServer;
    v21->_widgetMetricsServer = (SBWidgetMetricsServer *)v67;

    -[SBHIconManager setListLayoutProviderLayoutOptions:](v21->_iconManager, "setListLayoutProviderLayoutOptions:", -[SBIconController bestListLayoutProviderLayoutOptions](v21, "bestListLayoutProviderLayoutOptions"));
    -[SBHIconManager setIconModel:](v21->_iconManager, "setIconModel:", v21->_iconModel);
    -[SBHIconModel setPostsDidAddIconNotification:](v21->_iconModel, "setPostsDidAddIconNotification:", 1);
    if (!-[SBIconController _isCoplanarHomeScreenEnabled](v21, "_isCoplanarHomeScreenEnabled"))
      -[SBIconController _setupOverlayLibraryViewController](v21, "_setupOverlayLibraryViewController");
    -[SBIconController _makeTodayViewControllers](v21, "_makeTodayViewControllers");
    if (!-[SBIconController _isCoplanarHomeScreenEnabled](v21, "_isCoplanarHomeScreenEnabled"))
    {
      v69 = v21->_iconManager;
      -[SBIconController todayViewController](v21, "todayViewController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconManager setOverlayTodayViewController:](v69, "setOverlayTodayViewController:", v70);

    }
    v71 = v21->_iconManager;
    -[SBIconController coverSheetTodayViewController](v21, "coverSheetTodayViewController");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconManager setOverlayCoverSheetTodayViewController:](v71, "setOverlayCoverSheetTodayViewController:", v72);

    -[SBIconController appSwitcherHeaderIconImageCache](v21, "appSwitcherHeaderIconImageCache");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
      -[SBHIconManager addAdditionalIconImageCacheForPrecaching:](v21->_iconManager, "addAdditionalIconImageCacheForPrecaching:", v73);
    -[SBIconController _registerAnalytics](v21, "_registerAnalytics");
    -[SBIconController alertItemsController](v21, "alertItemsController");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObserver:", v21);

    -[SBIconController assistantController](v21, "assistantController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addObserver:", v21);

    objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObserver:", v21);

    objc_msgSend(v165, "layoutStateTransitionCoordinator");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObserver:", v21);

    v78 = -[SBProactiveHomeScreenUsageObserver initWithIconController:]([SBProactiveHomeScreenUsageObserver alloc], "initWithIconController:", v21);
    proactiveUsageObserver = v21->_proactiveUsageObserver;
    v21->_proactiveUsageObserver = v78;

    -[SBProactiveHomeScreenUsageObserver setDelegate:](v21->_proactiveUsageObserver, "setDelegate:", v21);
    v80 = -[SBProactiveHomeScreenSuggestionProvider initWithIconController:]([SBProactiveHomeScreenSuggestionProvider alloc], "initWithIconController:", v21);
    proactiveSuggestionProvider = v21->_proactiveSuggestionProvider;
    v21->_proactiveSuggestionProvider = v80;

    -[SBProactiveHomeScreenSuggestionProvider addObserver:](v21->_proactiveSuggestionProvider, "addObserver:", v21);
    v82 = -[SBTipsHomeScreenUsageObserver initWithIconManager:]([SBTipsHomeScreenUsageObserver alloc], "initWithIconManager:", v21->_iconManager);
    tipsUsageObserver = v21->_tipsUsageObserver;
    v21->_tipsUsageObserver = v82;

    objc_initWeak(&location, v21);
    v84 = (void *)MEMORY[0x1E0D830E8];
    v85 = MEMORY[0x1E0C809B0];
    v188[0] = MEMORY[0x1E0C809B0];
    v188[1] = 3221225472;
    v188[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke;
    v188[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v189, &location);
    objc_msgSend(v84, "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Relayout Home Screen"), 0, v188, 0);
    v86 = objc_claimAutoreleasedReturnValue();
    relayoutTestRecipe = v21->_relayoutTestRecipe;
    v21->_relayoutTestRecipe = (PTSingleTestRecipe *)v86;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_relayoutTestRecipe);
    objc_msgSend(MEMORY[0x1E0D830E8], "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Toggle Search"), 0, &__block_literal_global_68, 0);
    v88 = objc_claimAutoreleasedReturnValue();
    toggleSearchTestRecipe = v21->_toggleSearchTestRecipe;
    v21->_toggleSearchTestRecipe = (PTSingleTestRecipe *)v88;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_toggleSearchTestRecipe);
    v90 = (void *)MEMORY[0x1E0D830E8];
    v186[0] = v85;
    v186[1] = 3221225472;
    v186[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_3;
    v186[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v187, &location);
    objc_msgSend(v90, "recipeWithTitle:action:", CFSTR("Run Downloading Icon Test"), v186);
    v91 = objc_claimAutoreleasedReturnValue();
    runDownloadingIconTestRecipe = v21->_runDownloadingIconTestRecipe;
    v21->_runDownloadingIconTestRecipe = (PTSingleTestRecipe *)v91;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_runDownloadingIconTestRecipe);
    v93 = (void *)MEMORY[0x1E0D830E8];
    v184[0] = v85;
    v184[1] = 3221225472;
    v184[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_4;
    v184[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v185, &location);
    objc_msgSend(v93, "recipeWithTitle:action:", CFSTR("Run Remove/Restore Icon Test"), v184);
    v94 = objc_claimAutoreleasedReturnValue();
    runRemoveAndRestoreIconTestRecipe = v21->_runRemoveAndRestoreIconTestRecipe;
    v21->_runRemoveAndRestoreIconTestRecipe = (PTSingleTestRecipe *)v94;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_runRemoveAndRestoreIconTestRecipe);
    v96 = (void *)MEMORY[0x1E0D830E8];
    v182[0] = v85;
    v182[1] = 3221225472;
    v182[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_5;
    v182[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v183, &location);
    objc_msgSend(v96, "recipeWithTitle:action:", CFSTR("Organize Icons in Folders"), v182);
    v97 = objc_claimAutoreleasedReturnValue();
    organizeInFoldersTestRecipe = v21->_organizeInFoldersTestRecipe;
    v21->_organizeInFoldersTestRecipe = (PTSingleTestRecipe *)v97;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_organizeInFoldersTestRecipe);
    v99 = (void *)MEMORY[0x1E0D83030];
    v180[0] = v85;
    v180[1] = 3221225472;
    v180[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_6;
    v180[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v181, &location);
    v178[0] = v85;
    v178[1] = 3221225472;
    v178[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_7;
    v178[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v179, &location);
    objc_msgSend(v99, "recipeWithTitle:prepareBlock:increaseAction:decreaseAction:cleanupBlock:", CFSTR("Shuffle Stack / Toggle Suggestion"), 0, v180, v178, 0);
    v100 = objc_claimAutoreleasedReturnValue();
    shuffleStackTestRecipe = v21->_shuffleStackTestRecipe;
    v21->_shuffleStackTestRecipe = (PTDoubleTestRecipe *)v100;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_shuffleStackTestRecipe);
    v102 = (void *)MEMORY[0x1E0D830E8];
    v176[0] = v85;
    v176[1] = 3221225472;
    v176[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_8;
    v176[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v177, &location);
    objc_msgSend(v102, "recipeWithTitle:action:", CFSTR("Run Widget Discoverability Test"), v176);
    v103 = objc_claimAutoreleasedReturnValue();
    runWidgetDiscoverabilityTestRecipe = v21->_runWidgetDiscoverabilityTestRecipe;
    v21->_runWidgetDiscoverabilityTestRecipe = (PTSingleTestRecipe *)v103;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v21->_runWidgetDiscoverabilityTestRecipe);
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "rootFolderSettings");
    v106 = objc_claimAutoreleasedReturnValue();
    rootFolderSettings = v21->_rootFolderSettings;
    v21->_rootFolderSettings = (SBHRootFolderSettings *)v106;

    -[SBHRootFolderSettings addKeyObserver:](v21->_rootFolderSettings, "addKeyObserver:", v21);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v108 = objc_claimAutoreleasedReturnValue();
    deviceOrientationUpdateDeferralAssertionsByReason = v21->_deviceOrientationUpdateDeferralAssertionsByReason;
    v21->_deviceOrientationUpdateDeferralAssertionsByReason = (NSMapTable *)v108;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v110 = objc_claimAutoreleasedReturnValue();
    activeInterfaceOrientationChangeDeferralAssertionsByReason = v21->_activeInterfaceOrientationChangeDeferralAssertionsByReason;
    v21->_activeInterfaceOrientationChangeDeferralAssertionsByReason = (NSMapTable *)v110;

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "homeScreenDefaults");
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "floatingDockDefaults");
    v167 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v166 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldUseLargeDefaultSizedIcons");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v174[0] = v85;
    v174[1] = 3221225472;
    v174[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_9;
    v174[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v175, &location);
    v116 = (id)objc_msgSend(v113, "observeDefault:onQueue:withBlock:", v115, MEMORY[0x1E0C80D38], v174);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "recentsEnabled");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v172[0] = v85;
    v172[1] = 3221225472;
    v172[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_10;
    v172[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v173, &location);
    v118 = (id)objc_msgSend(v167, "observeDefault:onQueue:withBlock:", v117, MEMORY[0x1E0C80D38], v172);

    objc_msgSend(v166, "addKeyObserver:", v21);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showsBadgesInAppLibrary");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v170[0] = v85;
    v170[1] = 3221225472;
    v170[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_11;
    v170[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v171, &location);
    v120 = (id)objc_msgSend(v113, "observeDefault:onQueue:withBlock:", v119, MEMORY[0x1E0C80D38], v170);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showsHomeScreenSearchAffordance");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v168[0] = v85;
    v168[1] = 3221225472;
    v168[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_12;
    v168[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v169, &location);
    v122 = (id)objc_msgSend(v113, "observeDefault:onQueue:withBlock:", v121, MEMORY[0x1E0C80D38], v168);

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "iconEditingSettings");
    v124 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v21->_iconEditingSettings;
    v21->_iconEditingSettings = (SBHIconEditingSettings *)v124;

    -[SBHIconEditingSettings addKeyObserver:](v21->_iconEditingSettings, "addKeyObserver:", v21);
    -[SBIconController _configureEditingGestureRecognizers](v21, "_configureEditingGestureRecognizers");
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "widgetSettings");
    v127 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v21->_widgetSettings;
    v21->_widgetSettings = (SBHWidgetSettings *)v127;

    v129 = +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    -[SBIconController _addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled](v21, "_addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled");
    v130 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled = v21->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled;
    v21->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled = (BSInvalidatable *)v130;

    -[SBIconController _addStateCaptureHandlerForHomeScreenDefaults](v21, "_addStateCaptureHandlerForHomeScreenDefaults");
    v132 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandleForHomeScreenDefaults = v21->_stateCaptureHandleForHomeScreenDefaults;
    v21->_stateCaptureHandleForHomeScreenDefaults = (BSInvalidatable *)v132;

    -[SBIconController _addStateCaptureHandlerForInterestingAppIconLocations](v21, "_addStateCaptureHandlerForInterestingAppIconLocations");
    v134 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandleForInterestingAppIconLocations = v21->_stateCaptureHandleForInterestingAppIconLocations;
    v21->_stateCaptureHandleForInterestingAppIconLocations = (BSInvalidatable *)v134;

    -[SBIconController _addStateCaptureHandlerForRestrictions](v21, "_addStateCaptureHandlerForRestrictions");
    v136 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandleForRestrictions = v21->_stateCaptureHandleForRestrictions;
    v21->_stateCaptureHandleForRestrictions = (BSInvalidatable *)v136;

    objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.SBIconController"));
    v138 = objc_claimAutoreleasedReturnValue();
    dndStateService = v21->_dndStateService;
    v21->_dndStateService = (DNDStateService *)v138;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v21->_dndStateService, "addStateUpdateListener:withCompletionHandler:", v21, 0);
    -[SBIconController updateRootFolderWithCurrentDoNotDisturbState](v21, "updateRootFolderWithCurrentDoNotDisturbState");
    objc_msgSend(MEMORY[0x1E0D1D688], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.SBIconController"));
    v140 = objc_claimAutoreleasedReturnValue();
    dndModeConfigurationService = v21->_dndModeConfigurationService;
    v21->_dndModeConfigurationService = (DNDModeConfigurationService *)v140;

    -[DNDModeConfigurationService addListener:withCompletionHandler:](v21->_dndModeConfigurationService, "addListener:withCompletionHandler:", v21, 0);
    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "addMonitor:subjectMask:subscriptionOptions:", v21, 1, 1);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v21->_appProtectionSubjectMonitorSubscription, v143);

    v144 = objc_alloc(MEMORY[0x1E0DAA3F8]);
    v145 = objc_msgSend(v144, "initWithEventsControllerDomain:", *MEMORY[0x1E0DAA6A8]);
    analyticsEventsController = v21->_analyticsEventsController;
    v21->_analyticsEventsController = (SBHAnalyticsEventsController *)v145;

    -[SBHAnalyticsEventsController addProvider:](v21->_analyticsEventsController, "addProvider:", v21);
    objc_destroyWeak(&v169);
    objc_destroyWeak(&v171);
    objc_destroyWeak(&v173);
    objc_destroyWeak(&v175);

    objc_destroyWeak(&v177);
    objc_destroyWeak(&v179);
    objc_destroyWeak(&v181);
    objc_destroyWeak(&v183);
    objc_destroyWeak(&v185);
    objc_destroyWeak(&v187);
    objc_destroyWeak(&v189);
    objc_destroyWeak(&location);

    v19 = v165;
  }

  return v21;
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "relayout");

}

uint64_t __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_2()
{
  return objc_msgSend((id)SBApp, "toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:", 0, 0, 0, 0);
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "runDownloadingIconTest");

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "runRemoveAndRestoreIconTest");

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "organizeAllIconsIntoFoldersWithPageCount:", 2);

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shuffleWidgetStackForTestRecipe");

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toggleSuggestedWidgetInStackForTestRecipe");

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runWidgetDiscoverabilityTest");

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_9(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:animated:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"), 0);

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_10(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"));

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showsBadgesInAppLibraryDidChange");

}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_12(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tearDownAndResetRootIconLists");

}

- (void)_setupOverlayLibraryViewController
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (!-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = -[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported");
      v3 = 0;
      if (v4)
      {
        -[SBIconController iconManager](self, "iconManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          return;
        -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconController _setUpLibraryViewControllerForWindowScene:](self, "_setUpLibraryViewControllerForWindowScene:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        -[SBIconController setOverlayLibraryViewController:](self, "setOverlayLibraryViewController:", v7);
        if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
          -[SBHIconManager setOverlayLibraryViewController:](self->_iconManager, "setOverlayLibraryViewController:", v7);
        v3 = (void *)v7;
      }
    }

  }
}

- (id)proactiveOnboardingDefaultStacks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8D68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "fetchWidgetDiscoverabilityStacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogWidgetDiscoverability();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Synchronously fetched proactive onboarding stack %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (SBIconDragManager)iconDragManager
{
  void *v2;
  void *v3;

  -[SBIconController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconDragManager *)v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBIconController applicationController](self, "applicationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restrictionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterObserver:", self);

  -[SBHIconEditingSettings removeKeyObserver:](self->_iconEditingSettings, "removeKeyObserver:", self);
  objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[BBObserver invalidate](self->_bbObserver, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureHandleForHomeScreenDefaults, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureHandleForInterestingAppIconLocations, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureHandleForRestrictions, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  -[BSInvalidatable invalidate](self->_duckWallpaperDimmingAssertion, "invalidate");
  -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconStyleCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeIconStyleObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)SBIconController;
  -[SBIconController dealloc](&v11, sel_dealloc);
}

- (id)alertItemsController
{
  SBAlertItemsController *override_alertItemsController;

  override_alertItemsController = self->_override_alertItemsController;
  if (override_alertItemsController)
    return override_alertItemsController;
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)analyticsClient
{
  SBFAnalyticsClient *override_analyticsClient;

  override_analyticsClient = self->_override_analyticsClient;
  if (override_analyticsClient)
    return override_analyticsClient;
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationController
{
  SBApplicationController *override_applicationController;

  override_applicationController = self->_override_applicationController;
  if (override_applicationController)
    return override_applicationController;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationPlaceholderController
{
  SBApplicationPlaceholderController *override_applicationPlaceholderController;

  override_applicationPlaceholderController = self->_override_applicationPlaceholderController;
  if (override_applicationPlaceholderController)
    return override_applicationPlaceholderController;
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)assistantController
{
  SBAssistantController *override_assistantController;

  override_assistantController = self->_override_assistantController;
  if (override_assistantController)
    return override_assistantController;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)coverSheetPresentationManager
{
  SBCoverSheetPresentationManager *override_coverSheetPresentationManager;

  override_coverSheetPresentationManager = self->_override_coverSheetPresentationManager;
  if (override_coverSheetPresentationManager)
    return override_coverSheetPresentationManager;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lockScreenManager
{
  SBLockScreenManager *override_lockScreenManager;

  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
    return override_lockScreenManager;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutStateProvider
{
  SBSceneLayoutStateProvider *override_layoutStateProvider;
  SBSceneLayoutStateProvider *v3;
  void *v4;

  override_layoutStateProvider = self->_override_layoutStateProvider;
  if (override_layoutStateProvider)
  {
    v3 = override_layoutStateProvider;
  }
  else
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutStateProvider");
    v3 = (SBSceneLayoutStateProvider *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (SBWidgetMetricsServer)widgetMetricsServer
{
  SBWidgetMetricsServer *override_widgetMetricsServer;
  SBWidgetMetricsServer *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  override_widgetMetricsServer = self->_override_widgetMetricsServer;
  if (override_widgetMetricsServer || (override_widgetMetricsServer = self->_widgetMetricsServer) != 0)
  {
    v4 = override_widgetMetricsServer;
  }
  else
  {
    -[SBIconController iconManager](self, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetMetricsProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController lockScreenManager](self, "lockScreenManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockScreenEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widgetMetricsProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CF78E8]);
    -[SBIconController setAmbientListLayoutProvider:](self, "setAmbientListLayoutProvider:", v11);
    v12 = objc_alloc_init(MEMORY[0x1E0DAA590]);
    objc_msgSend(v12, "setDelegate:", self);
    -[SBIconController setAmbientWidgetMetricsProvider:](self, "setAmbientWidgetMetricsProvider:", v12);
    v4 = -[SBWidgetMetricsServer initWithSystemMetricsProvider:lockScreenMetricsProvider:ambientMetricsProvider:]([SBWidgetMetricsServer alloc], "initWithSystemMetricsProvider:lockScreenMetricsProvider:ambientMetricsProvider:", v7, v10, v12);

  }
  return v4;
}

- (id)widgetMetricsProvider:(id)a3 listLayoutProviderForScreenType:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF78E8]), "initWithScreenType:", a4);
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMapTable removeObjectForKey:](self->_windowSceneToMedusaDragWindowContext, "removeObjectForKey:", v7);
    -[SBIconController iconDragManager](self, "iconDragManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowSceneDidDisconnect:", v7);

  }
}

- (unint64_t)bestListLayoutProviderLayoutOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "recentsEnabled"))
    v7 = 0;
  else
    v7 = 4;
  if (objc_msgSend(v4, "shouldUseLargeDefaultSizedIcons"))
  {
    if (__sb__runningInSpringBoard())
    {
      v8 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "userInterfaceIdiom") == 1;

    }
    if (v8)
      v7 |= 8uLL;
  }
  if (-[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self->_iconStyleCoordinator, "shouldUseLargeHomeScreenIcons"))
  {
    v10 = v7 | 0x18;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (SBFolderController)_openFolderController
{
  void *v2;
  void *v3;

  -[SBIconController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openedFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFolderController *)v3;
}

- (SBFolderController)_currentFolderController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBIconController _openFolderController](self, "_openFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (SBFolderController *)v6;
}

- (id)folderNameForDisplayID:(id)a3
{
  SBIconModel *iconModel;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  iconModel = self->_iconModel;
  v4 = a3;
  -[SBHIconModel rootFolder](iconModel, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForIconWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "folderContainingIndexPath:relativeIndexPath:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)iconPathForIconWithDisplayID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char isKindOfClass;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHIconModel rootFolder](self->_iconModel, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForIconWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = v5;
    objc_msgSend(v5, "resolvedComponentsForIndexPath:", v6);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_self();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v13, "displayName");
            v16 = objc_claimAutoreleasedReturnValue();
            if (!v16)
              goto LABEL_12;
            v17 = (void *)v16;
            objc_msgSend(v7, "addObject:", v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }
LABEL_12:

    v18 = (void *)objc_msgSend(v7, "copy");
    v5 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_showInfoAlertIfNeeded:(BOOL)a3
{
  void *v5;
  void *v6;
  char v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  SBReorderInfoAlert *v13;
  id v14;

  -[SBIconController alertItemsController](self, "alertItemsController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "didShowIconReorderAlert");

  v8 = objc_msgSend(v14, "hasAlertOfClass:", objc_opt_class());
  if (a3)
  {
    v9 = 1;
    if ((v7 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    -[SBIconController applicationPlaceholderController](self, "applicationPlaceholderController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "hasDownloadedStoreApplication");

    if ((v7 & 1) != 0)
      goto LABEL_7;
  }
  -[SBIconController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEditingAllowed") & ~v8 & v9;

  if (v12 == 1)
  {
    v13 = objc_alloc_init(SBReorderInfoAlert);
    objc_msgSend(v14, "activateAlertItem:", v13);

  }
LABEL_7:

}

- (void)handleHomeButtonTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  -[SBIconController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconController areAnyIconViewContextMenusShowing](self, "areAnyIconViewContextMenusShowing"))
  {
    if (objc_msgSend(v3, "areAnyIconShareSheetsShowing"))
    {
      objc_msgSend(v3, "dismissIconShareSheets");
      goto LABEL_7;
    }
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "hasOpenFolder")
      && (!objc_msgSend(v3, "isEditing") || objc_msgSend(v3, "isIconDragging")))
    {
      objc_msgSend(v3, "popExpandedIconAnimated:completionHandler:", 1, 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isShowingModalInteraction"))
    {
      objc_msgSend(v3, "popModalInteraction");
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isFolderPageManagementUIVisible"))
    {
      objc_msgSend(v3, "dismissFolderPageManagementUI");
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isEditing"))
    {
      objc_msgSend(v3, "setEditing:", 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isShowingPullDownSearchOrTransitioningToVisible"))
    {
      objc_msgSend(v3, "dismissSpotlightAnimated:completionHandler:", 1, 0);
      goto LABEL_7;
    }
    if (-[SBIconController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible"))
    {
      if (!-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
      {
        -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "popPresentationState");
LABEL_35:

        goto LABEL_7;
      }
      -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modalLibraryController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isPresentingLibrary"))
      {
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(v7, "libraryViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "popPresentationState");
    }
    else
    {
      if (-[SBIconController isTodayOverlaySpotlightVisible](self, "isTodayOverlaySpotlightVisible"))
      {
        -[SBIconController dismissTodayOverlaySpotlightAnimated:](self, "dismissTodayOverlaySpotlightAnimated:", 1);
        goto LABEL_7;
      }
      if (-[SBIconController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
      {
        -[SBIconController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
        goto LABEL_7;
      }
      SBLogTelemetrySignposts();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
      }

      kdebug_trace();
      objc_msgSend(v3, "animateToDefaultStateWithCompletionHandler:", &__block_literal_global_199);
      objc_msgSend(v4, "iconContentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_eventRoutingScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_34;
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v7);
    }

    goto LABEL_34;
  }
  -[SBIconController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
LABEL_7:

}

uint64_t __39__SBIconController_handleHomeButtonTap__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  SBLogTelemetrySignposts();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v2, 2u);
  }

  return kdebug_trace();
}

- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4
{
  id v7;
  BSEventQueue *transitionEventQueue;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 1114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionName"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 1115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  transitionEventQueue = self->_transitionEventQueue;
  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", v12, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](transitionEventQueue, "executeOrInsertEvent:atPosition:", v9, 1);

}

- (BOOL)isHideSupportedForIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported")
    && (SBIconLocationGroupContainsLocation() & 1) == 0)
  {
    if ((objc_msgSend(v6, "isApplicationIcon") & 1) != 0 || (objc_msgSend(v6, "isFolderIcon") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[SBIconController iconManager](self, "iconManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "canAddIconToIgnoredList:", v6);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isUninstallOrHideSupportedForIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[SBIconController isHideSupportedForIcon:inLocation:](self, "isHideSupportedForIcon:inLocation:", v6, a4)
    || -[SBIconController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v6);

  return v7;
}

- (BOOL)isOnlyHideSuggestionSupportedForIcon:(id)a3 inLocation:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions"));
}

- (BOOL)isHideSuggestionSupportedForIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldShowHideSuggestionForIconView:proposedValue:", v6, 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateNumberOfRowsWithDuration:(double)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBIconController_updateNumberOfRowsWithDuration___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, a3, 0.0);
  -[SBIconController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIconListsWithAnimationType:forceRelayout:", 0, 0);

}

void __51__SBIconController_updateNumberOfRowsWithDuration___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homeScreenViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconContentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_launchWidgetIcon:(id)a3 fromLocation:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SBActivationSettings *v13;
  SBActivationSettings *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBLockScreenUnlockRequest *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  SBActivationSettings *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "activationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(SBActivationSettings);
  v14 = v13;
  objc_msgSend(v8, "activeWidget");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v25 = v9;
    objc_msgSend(v15, "extensionBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "containerBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController applicationController](self, "applicationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationWithBundleIdentifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogIcon();
    v21 = (SBLockScreenUnlockRequest *)objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(&v21->super, OS_LOG_TYPE_INFO);
    if (v20)
    {
      v24 = v12;
      if (v22)
      {
        *(_DWORD *)buf = 138412802;
        v33 = v18;
        v34 = 2112;
        v35 = v8;
        v36 = 2112;
        v37 = v25;
        _os_log_impl(&dword_1D0540000, &v21->super, OS_LOG_TYPE_INFO, "Launching application %@ from widget icon %@, location: %@", buf, 0x20u);
      }

      -[SBActivationSettings setObject:forActivationSetting:](v14, "setObject:forActivationSetting:", v17, 14);
      v21 = objc_alloc_init(SBLockScreenUnlockRequest);
      -[SBLockScreenUnlockRequest setSource:](v21, "setSource:", 24);
      -[SBLockScreenUnlockRequest setIntent:](v21, "setIntent:", 3);
      -[SBLockScreenUnlockRequest setName:](v21, "setName:", CFSTR("Launch From Widget Icon Unlock"));
      -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v21, "setWantsBiometricPresentation:", 1);
      -[SBIconController lockScreenManager](self, "lockScreenManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__SBIconController__launchWidgetIcon_fromLocation_withContext___block_invoke;
      v26[3] = &unk_1E8EA6288;
      v26[4] = self;
      v27 = v20;
      v28 = v8;
      v29 = v25;
      v30 = v14;
      v31 = v24;
      objc_msgSend(v23, "unlockWithRequest:completion:", v21, v26);

      v12 = v24;
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412802;
      v33 = v18;
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1D0540000, &v21->super, OS_LOG_TYPE_INFO, "Failed to launch application %@ from widget icon %@, location: %@", buf, 0x20u);
    }

    v9 = v25;
  }

}

void __63__SBIconController__launchWidgetIcon_fromLocation_withContext___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInterfaceController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activateApplication:fromIcon:location:activationSettings:actions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
}

- (void)noteTransientOverlayPresented
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  SBLogIconDragging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "transient overlay presented", v6, 2u);
  }

  -[SBIconController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", 0);

  -[SBIconController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllDrags");

}

- (void)noteViewCovered
{
  id v2;

  -[SBIconController iconManager](self, "iconManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllFolderScrolling");

}

- (void)_lockScreenUIWillLock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditing:", 0);
  v6 = objc_opt_class();
  v22 = v4;
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Animated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  -[SBIconController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
  objc_msgSend(v5, "dismissIconShareSheets");
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v10, 0);
  -[SBIconController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", v10);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectedWindowScenes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "modalLibraryController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isPresentingLibraryInForeground"))
          objc_msgSend(v19, "dismissLibraryAnimated:completion:", v10, 0);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  if ((_DWORD)v10)
    objc_msgSend(v5, "dismissModalInteractions");
  else
    objc_msgSend(v5, "dismissModalInteractionsImmediately");
  objc_msgSend(v5, "focusModeManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dismissAllFocusModePopovers");
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurrentPageIndex:animated:", objc_msgSend(v21, "nearestIconPageIndex"), 0);

}

- (void)_updateUninstallingSystemAppsRestricted
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;

  objc_msgSend((id)SBApp, "accountStoreController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "aa_isManagedAppleID");
  -[SBIconController accountStoreQueue](self, "accountStoreQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke;
  v7[3] = &unk_1E8E9F508;
  v8 = v5;
  v7[4] = self;
  dispatch_async(v6, v7);

}

void __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  int v5;
  NSObject *v6;
  char v7;
  _QWORD v8[5];
  char v9;
  char v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "aa_isManagedAppleID");
  v5 = *(unsigned __int8 *)(a1 + 40);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_cold_1((unsigned __int8 *)(a1 + 40), v4, v6);
  if (v5)
    v7 = 1;
  else
    v7 = v4;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_225;
  v8[3] = &unk_1E8EA1E30;
  v9 = v7;
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v11 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_225(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "isUninstallingSystemAppsRestricted");
  if (v2 != (_DWORD)result)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6 = *(unsigned __int8 *)(a1 + 41);
      v7 = *(unsigned __int8 *)(a1 + 42);
      v8[0] = 67109632;
      v8[1] = v5;
      v9 = 1024;
      v10 = v6;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Changing restriction for uninstalling system apps to %i (Apple account restricted: %i, iTunes Store account restricted: %i)", (uint8_t *)v8, 0x14u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setUninstallingSystemAppsRestricted:", *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (unint64_t)_foldersInList:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SBIconController__foldersInList___block_invoke;
  v6[3] = &unk_1E8EA62B0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateFolderIconsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __35__SBIconController__foldersInList___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (SBIconAnimationContaining)currentAnimationContainer
{
  void *v3;
  void *v4;
  SBIconAnimationContaining *v5;

  -[SBIconController _currentFolderController](self, "_currentFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)_mainSwitcherCreated:(id)a3
{
  id v3;

  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumHomeScreenScaleDidChange");

}

- (BOOL)isUpgradeRestore
{
  return -[SBIconController userIconStateFileStatus](self, "userIconStateFileStatus") == 2;
}

- (BOOL)isEnterpriseMultiUser
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "userSessionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUserSupported");

  return v3;
}

- (BOOL)resetHomeScreenLayout
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DAA4D8], "clearCachesForReason:", CFSTR("Reset home screen layout"));
  -[SBIconController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 0);
  -[SBHLibraryCategoryMapProvider resetForbiddenApplicationIdentifiers](self->_categoryMapProvider, "resetForbiddenApplicationIdentifiers");
  -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self->_categoryMapProvider, "overrideCategoryMapForTesting:", 0);
  -[SBIconController setUserIconStateFileStatus:](self, "setUserIconStateFileStatus:", 1);
  -[SBIconController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resetIconLayoutWithOptions:", 1);
  -[SBIconController updateRootFolderWithCurrentDoNotDisturbState](self, "updateRootFolderWithCurrentDoNotDisturbState");
  -[SBIconController rootFolder](self, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController _addSmartStackToTodayList:completionHandler:](self, "_addSmartStackToTodayList:completionHandler:", v6, 0);

  if (-[SBIconController isUpgradeRestore](self, "isUpgradeRestore")
    && !-[SBIconController isEnterpriseMultiUser](self, "isEnterpriseMultiUser"))
  {
    objc_msgSend(v3, "addDefaultWidgetsToHomeScreen");
  }
  objc_msgSend(v3, "removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded:", 1);
  v7 = (id)-[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self->_categoryMapProvider, "requestLibraryCategoryMapRefreshWithOptions:reason:", 7, CFSTR("SBIconController requested reset home screen layout."));

  return v4;
}

- (BOOL)resetCategories
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DAA4D8], "clearCachesForReason:", CFSTR("Reset categories"));
  -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self->_categoryMapProvider, "overrideCategoryMapForTesting:", 0);
  v3 = (id)-[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self->_categoryMapProvider, "requestLibraryCategoryMapRefreshWithOptions:reason:", 7, CFSTR("SBIconController requested reset category."));
  return 1;
}

- (BOOL)forbidApplicationBundleIdentifierFromLibrary:(id)a3
{
  return -[SBHLibraryCategoryMapProvider forbidApplicationIdentifier:](self->_categoryMapProvider, "forbidApplicationIdentifier:", a3);
}

- (BOOL)unforbidApplicationBundleIdentifierFromLibrary:(id)a3
{
  return -[SBHLibraryCategoryMapProvider unforbidApplicationIdentifier:](self->_categoryMapProvider, "unforbidApplicationIdentifier:", a3);
}

- (SBHIconImageCache)tableUIIconImageCache
{
  SBHIconImageCache *tableUIIconImageCache;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBHIconImageCache *v12;
  SBHIconImageCache *v13;

  tableUIIconImageCache = self->_tableUIIconImageCache;
  if (!tableUIIconImageCache)
  {
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "scale");
    v10 = v9;
    objc_msgSend(v4, "continuousCornerRadius");
    v12 = (SBHIconImageCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("tableUIIcon"), v6, v8, v10, v11);
    v13 = self->_tableUIIconImageCache;
    self->_tableUIIconImageCache = v12;

    tableUIIconImageCache = self->_tableUIIconImageCache;
  }
  return tableUIIconImageCache;
}

- (SBHIconImageCache)notificationIconImageCache
{
  SBHIconImageCache *notificationIconImageCache;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBHIconImageCache *v12;
  SBHIconImageCache *v13;

  notificationIconImageCache = self->_notificationIconImageCache;
  if (!notificationIconImageCache)
  {
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A880]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "scale");
    v10 = v9;
    objc_msgSend(v4, "continuousCornerRadius");
    v12 = (SBHIconImageCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("notificationIcon"), v6, v8, v10, v11);
    v13 = self->_notificationIconImageCache;
    self->_notificationIconImageCache = v12;

    notificationIconImageCache = self->_notificationIconImageCache;
  }
  return notificationIconImageCache;
}

- (BOOL)_isCoplanarHomeScreenEnabled
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  }
  return v2;
}

- (BOOL)isShowingHomeScreenOverlay
{
  return -[SBIconController isTodayOverlayPresented](self, "isTodayOverlayPresented")
      || -[SBIconController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible");
}

- (void)dismissHomeScreenOverlays
{
  -[SBIconController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 1);
}

- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3
{
  -[SBIconController dismissHomeScreenOverlaysAnimated:completion:](self, "dismissHomeScreenOverlaysAnimated:completion:", a3, 0);
}

- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = dispatch_group_create();
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 1;
    dispatch_group_enter(v7);
    v8 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke;
    v35[3] = &unk_1E8EA62D8;
    v37 = v38;
    v9 = v7;
    v36 = v9;
    v10 = (void *)MEMORY[0x1D17E5550](v35);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 1;
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2;
    v30[3] = &unk_1E8EA62D8;
    v32 = v33;
    v11 = v9;
    v31 = v11;
    v12 = (void *)MEMORY[0x1D17E5550](v30);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3;
    block[3] = &unk_1E8EA6300;
    v27 = v6;
    v28 = v38;
    v29 = v33;
    dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v38, 8);
    if (!-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
      if (v11)
        dispatch_group_enter(v11);
      goto LABEL_16;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (!-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
LABEL_16:
      -[SBIconController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", v4, v12);
      goto LABEL_17;
    }
  }
  v21 = v10;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectedWindowScenes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v11)
          dispatch_group_enter(v11);
        objc_msgSend(v19, "modalLibraryController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dismissLibraryAnimated:completion:", v4, v12);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
    }
    while (v16);
  }

  v10 = v21;
LABEL_17:
  -[SBIconController dismissTodayOverlayAnimated:completion:](self, "dismissTodayOverlayAnimated:completion:", v4, v10);

}

void __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = a1[4];
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, v3);
}

- (void)dismissTodayOverlay
{
  -[SBIconController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
}

- (void)dismissTodayOverlayAnimated:(BOOL)a3
{
  -[SBIconController dismissTodayOverlayAnimated:completion:](self, "dismissTodayOverlayAnimated:completion:", a3, 0);
}

- (void)dismissTodayOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (-[SBIconController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
  {
    -[SBIconController dismissHomeScreenOverlayControllerAnimated:completion:](self, "dismissHomeScreenOverlayControllerAnimated:completion:", v4, v6);
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }

}

- (void)dismissTodayOverlaySpotlightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = objc_opt_class();
  -[SBIconController todayViewController](self, "todayViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissSpotlightAnimated:", v3);
}

- (void)dismissHomeScreenOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v4 = a3;
  v6 = a4;
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isPresented"))
  {
    -[SBIconController userInterfaceController](self, "userInterfaceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isBackdropVisible"))
      objc_msgSend(v8, "beginRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
    objc_msgSend(v7, "setShouldUseReducedMotionAnimation:", UIAccessibilityIsReduceMotionEnabled());
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__SBIconController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke;
    v10[3] = &unk_1E8EA47F0;
    v11 = v8;
    v12 = v7;
    v13 = v6;
    v9 = v8;
    objc_msgSend(v12, "dismissAnimated:completionHandler:", v4, v10);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __74__SBIconController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "endRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
  objc_msgSend(*(id *)(a1 + 40), "setShouldUseReducedMotionAnimation:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)dismissHomeScreenOverlayUsingTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPresented"))
  {
    -[SBIconController userInterfaceController](self, "userInterfaceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isBackdropVisible");
    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      objc_msgSend(v6, "beginRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke;
      v10[3] = &unk_1E8E9EA28;
      v11 = v6;
      objc_msgSend(v4, "notifyWhenInteractionChangesUsingBlock:", v10);

    }
    objc_msgSend(v5, "dismissUsingViewControllerTransitionCoordinator:", v4);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2;
    v9[3] = &unk_1E8E9EA28;
    v9[4] = self;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v9, 0);

  }
}

uint64_t __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
}

void __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_rootFolderController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSuppressesExtraEditingButtons:", 0);

}

- (void)setTemporaryIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *temporaryWidgetIntents;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && !self->_temporaryWidgetIntents)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    temporaryWidgetIntents = self->_temporaryWidgetIntents;
    self->_temporaryWidgetIntents = v11;

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@^%@"), v9, v10);
  if (v8)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    if (!v14)
    {
      SBLogWidgetIntent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v8, "_indexingHash");
        *(_DWORD *)buf = 138544130;
        v27 = v10;
        v28 = 2048;
        v29 = v24;
        v30 = 2112;
        v31 = v13;
        v32 = 2112;
        v33 = v15;
        _os_log_error_impl(&dword_1D0540000, v17, OS_LOG_TYPE_ERROR, "Error archiving temporary intent widget unique identifier '%{public}@/%lld/%@': %@", buf, 0x2Au);
      }
      goto LABEL_17;
    }
    -[NSMutableDictionary setObject:forKey:](self->_temporaryWidgetIntents, "setObject:forKey:", v14, v13);
    v16 = objc_msgSend(v14, "length");
    SBLogWidgetIntent();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = objc_msgSend(v8, "_indexingHash");
        *(_DWORD *)buf = 138543618;
        v27 = v10;
        v28 = 2048;
        v29 = v19;
        v20 = "Saving temporary intent for widget unique identifier '%{public}@'/%lld";
        v21 = v17;
        v22 = 22;
LABEL_16:
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      v20 = "Saving 0-length temporary intent for widget unique identifier '%{public}@'";
      v21 = v17;
      v22 = 12;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  SBLogWidgetIntent();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    v28 = 2048;
    v29 = objc_msgSend(0, "_indexingHash");
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Removing temporary intent for widget unique identifier '%{public}@'/%lld/%@", buf, 0x20u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_temporaryWidgetIntents, "removeObjectForKey:", v13);
LABEL_18:

}

- (BOOL)allowsHomeScreenOverlay
{
  void *v3;
  BOOL v4;
  void *v5;

  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionType") != 2;

  -[SBIconController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v4 & ~objc_msgSend(v5, "isFolderPageManagementUIVisible");

  return (char)v3;
}

- (void)_bookmarkDidUninstall:(id)a3
{
  id v3;

  objc_msgSend((id)SBApp, "noteInstalledWebClipsDidChange", a3);
  objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyBookmarksDidChange");

}

- (BOOL)shouldAddNewIconsToRootFolder
{
  void *v2;
  void *v3;
  int v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "automaticallyAddsNewApplications");
  if ((objc_msgSend(v3, "automaticallyAddsNewApplicationsExists") & 1) == 0)
    v4 &= ~objc_msgSend(v3, "pagesHaveEverBeenHidden");

  return v4;
}

- (void)prepareForImminentExit
{
  -[SBPowerLogMetricsAggregator flushEventsDueToIminentPowerdown](self->_powerLogAggregator, "flushEventsDueToIminentPowerdown");
}

- (void)runWidgetDiscoverabilityTest
{
  void *v3;
  _QWORD v4[5];

  -[SBIconController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeWidgetIconsFromHomeScreen");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconController_runWidgetDiscoverabilityTest__block_invoke;
  v4[3] = &unk_1E8E9E980;
  v4[4] = self;
  -[SBIconController _obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:](self, "_obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:", v4);

}

uint64_t __48__SBIconController_runWidgetDiscoverabilityTest__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction");
  return result;
}

- (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL8 v19;
  id v20;

  -[SBIconController iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listLayoutProvider");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
  objc_msgSend(MEMORY[0x1E0DAA658], "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forListLayout:withTranslationOffset:inRTL:", a3, a4, v8, v19, v12, v14, v16, v18, 0.0);

}

- (void)enumerateTintableViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  void (**v23)(id, void *);
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__SBIconController_enumerateTintableViewControllersUsingBlock___block_invoke;
  v22[3] = &unk_1E8EA6328;
  v6 = v4;
  v23 = v6;
  -[SBIconController _enumerateTodayViewControllers:](self, "_enumerateTodayViewControllers:", v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectedWindowScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "modalLibraryController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "libraryViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v6[2](v6, v15);
        objc_msgSend(v13, "floatingDockController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "viewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v6[2](v6, v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  if (self->_overlayLibraryViewController)
    ((void (*)(void (**)(id, void *)))v6[2])(v6);

}

uint64_t __63__SBIconController_enumerateTintableViewControllersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateHomeScreenTraitOverridesForViewController:(id)a3
{
  SBHIconManager *iconManager;
  id v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  iconManager = self->_iconManager;
  v5 = a3;
  -[SBIconController iconStylePickerConfigurationForIconManager:](self, "iconStylePickerConfigurationForIconManager:", iconManager);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "styleType");
  v7 = (v6 | 2) != 3;
  if ((v6 | 2) == 3)
    v8 = 2;
  else
    v8 = 0;
  objc_msgSend(v5, "traitOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v9, "setObject:forTrait:", v12, v10);
  else
    objc_msgSend(v9, "removeTrait:", v10);

  if (v7)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeTrait:", v11);

  }
  else
  {
    objc_msgSend(v9, "setUserInterfaceStyle:", v8);
  }

}

- (id)iconStylePickerConfigurationForIconManager:(id)a3
{
  return -[SBWallpaperIconStyleCoordinator currentStyleConfiguration](self->_iconStyleCoordinator, "currentStyleConfiguration", a3);
}

- (void)updateStyleConfiguration:(id)a3 forIconManager:(id)a4
{
  -[SBWallpaperIconStyleCoordinator setCurrentStyleConfiguration:](self->_iconStyleCoordinator, "setCurrentStyleConfiguration:", a3, a4);
}

- (void)iconManagerWantsIconSizeToggled:(id)a3
{
  -[SBWallpaperIconStyleCoordinator setShouldUseLargeHomeScreenIcons:](self->_iconStyleCoordinator, "setShouldUseLargeHomeScreenIcons:", -[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self->_iconStyleCoordinator, "shouldUseLargeHomeScreenIcons", a3) ^ 1);
}

- (BOOL)shouldUseHomeScreenLargeIconSizeForIconManager:(id)a3
{
  return -[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self->_iconStyleCoordinator, "shouldUseLargeHomeScreenIcons", a3);
}

- (void)removeHomeScreenTraitOverridesForViewController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "traitOverrides");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTrait:", v3);

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTrait:", v4);

}

- (SBSHomeScreenIconStyleConfiguration)currentHomeScreenIconStyleConfiguration
{
  void *v2;
  void *v3;

  -[SBIconController currentIconImageStyleConfiguration](self, "currentIconImageStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sb_homeScreenIconStyleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSHomeScreenIconStyleConfiguration *)v3;
}

- (void)setCurrentHomeScreenIconStyleConfiguration:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "sb_iconImageStyleConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWallpaperIconStyleCoordinator setCurrentStyleConfiguration:](self->_iconStyleCoordinator, "setCurrentStyleConfiguration:", v4);
  -[SBIconController iconStyleCoordinatorDidUpdate:](self, "iconStyleCoordinatorDidUpdate:", self->_iconStyleCoordinator);

}

- (SBHIconImageStyleConfiguration)currentIconImageStyleConfiguration
{
  void *v2;
  void *v3;

  -[SBWallpaperIconStyleCoordinator currentStyleConfiguration](self->_iconStyleCoordinator, "currentStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA4A0], "styleConfigurationWithHomeScreenConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconImageStyleConfiguration *)v3;
}

- (SBHIconImageAppearance)currentIconImageAppearance
{
  void *v2;
  void *v3;
  void *v4;

  -[SBIconController rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "sbh_iconImageAppearanceFromTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconImageAppearance *)v4;
}

- (void)deleteAllWebClips
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBIconController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leafIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_267);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v2, "uninstallIcon:animate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 0, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

uint64_t __37__SBIconController_deleteAllWebClips__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBookmarkIcon");
}

- (NSString)description
{
  return (NSString *)-[SBIconController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (void)addIconStyleObserver:(id)a3
{
  id v4;
  NSHashTable *iconStyleObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  iconStyleObservers = self->_iconStyleObservers;
  v8 = v4;
  if (!iconStyleObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_iconStyleObservers;
    self->_iconStyleObservers = v6;

    v4 = v8;
    iconStyleObservers = self->_iconStyleObservers;
  }
  -[NSHashTable addObject:](iconStyleObservers, "addObject:", v4);

}

- (void)removeIconStyleObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_iconStyleObservers, "removeObject:", a3);
}

- (void)informIconStyleObserversOfStyleChange
{
  void *v3;
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

  v14 = *MEMORY[0x1E0C80C00];
  -[SBIconController currentIconStyleConfiguration](self, "currentIconStyleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_iconStyleObservers, "copy", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "iconStyleProvider:didUpdateIconStyleConfiguration:", self, v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_registerAnalytics
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[SBIconController analyticsClient](self, "analyticsClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__SBIconController__registerAnalytics__block_invoke;
  v10[3] = &unk_1E8EA63B8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "registerForQueryName:handler:", 0, v10);

  -[SBIconController analyticsClient](self, "analyticsClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __38__SBIconController__registerAnalytics__block_invoke_2;
  v8[3] = &unk_1E8EA63B8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "registerForQueryName:handler:", 2, v8);

  -[SBIconController analyticsClient](self, "analyticsClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForQueryName:handler:", 3, &__block_literal_global_274);

  -[SBIconController analyticsClient](self, "analyticsClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForQueryName:handler:", 1, &__block_literal_global_275);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __38__SBIconController__registerAnalytics__block_invoke(uint64_t a1)
{
  id v1;
  _QWORD v3[5];
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __38__SBIconController__registerAnalytics__block_invoke_271;
  v3[3] = &unk_1E8EA6390;
  v3[1] = 3221225472;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3[4] = &v5;
  dispatch_sync(MEMORY[0x1E0C80D38], v3);
  v1 = (id)v6[5];
  objc_destroyWeak(&v4);
  _Block_object_dispose(&v5, 8);

  return v1;
}

void __38__SBIconController__registerAnalytics__block_invoke_271(uint64_t a1)
{
  id WeakRetained;
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rootFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "dock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = *MEMORY[0x1E0DABDB8];
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "folderIcons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v16[1] = *MEMORY[0x1E0DABDC8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "listCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v10;
      v16[2] = *MEMORY[0x1E0DABDC0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "numberOfIcons"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v11;
      v16[3] = *MEMORY[0x1E0DABDB0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "_foldersInList:", v6));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[3] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }

}

id __38__SBIconController__registerAnalytics__block_invoke_2(uint64_t a1)
{
  id v1;
  _QWORD v3[5];
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __38__SBIconController__registerAnalytics__block_invoke_3;
  v3[3] = &unk_1E8EA6390;
  v3[1] = 3221225472;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3[4] = &v5;
  dispatch_sync(MEMORY[0x1E0C80D38], v3);
  v1 = (id)v6[5];
  objc_destroyWeak(&v4);
  _Block_object_dispose(&v5, 8);

  return v1;
}

void __38__SBIconController__registerAnalytics__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rootFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "visibleListCount");
      v7 = objc_msgSend(v5, "hiddenListCount");
      v13[0] = *MEMORY[0x1E0DABE20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v13[1] = *MEMORY[0x1E0DABE18];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }

}

id __38__SBIconController__registerAnalytics__block_invoke_4()
{
  id v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__20;
  v7 = __Block_byref_object_dispose__20;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBIconController__registerAnalytics__block_invoke_5;
  block[3] = &unk_1E8E9ED40;
  block[4] = &v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

void __38__SBIconController__registerAnalytics__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "automaticallyAddsNewApplications");
  v7 = (id *)MEMORY[0x1E0DAA950];
  if (v6)
    v7 = (id *)MEMORY[0x1E0DAA9E8];
  v8 = *v7;
  v9 = objc_msgSend(v3, "automaticallyAddsNewApplicationsExists");
  v10 = objc_msgSend(v3, "pagesHaveEverBeenHidden");
  v11 = objc_msgSend(v5, "appLibraryEnabled") ^ 1;
  v20[0] = *MEMORY[0x1E0DABDD0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DABE98];
  v21[0] = v12;
  v21[1] = v8;
  v14 = *MEMORY[0x1E0DABE90];
  v20[1] = v13;
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  v20[3] = *MEMORY[0x1E0DABE28];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

id __38__SBIconController__registerAnalytics__block_invoke_6()
{
  id v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__20;
  v7 = __Block_byref_object_dispose__20;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBIconController__registerAnalytics__block_invoke_7;
  block[3] = &unk_1E8E9ED40;
  block[4] = &v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

void __38__SBIconController__registerAnalytics__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "recentsEnabled");
  v9 = *MEMORY[0x1E0DABD60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)createFloatingDockControllerForWindowScene:(id)a3
{
  id v4;
  SBFloatingDockController *v5;

  v4 = a3;
  if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    v5 = -[SBFloatingDockController initWithWindowScene:homeScreenContextProvider:]([SBFloatingDockController alloc], "initWithWindowScene:homeScreenContextProvider:", v4, self);
    -[SBIconController _configureFloatingDockController:forWindowScene:](self, "_configureFloatingDockController:forWindowScene:", v5, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_configureFloatingDockController:(id)a3 forWindowScene:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "registerForWindowScene:", a4);
  -[SBIconController notifyFloatingDockControllerObserversDidRegister:](self, "notifyFloatingDockControllerObserversDidRegister:", v6);
  objc_msgSend(v6, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBIconController updateHomeScreenTraitOverridesForViewController:](self, "updateHomeScreenTraitOverridesForViewController:", v7);
}

- (void)addFloatingDockControllerObserver:(id)a3
{
  id v5;
  NSHashTable *floatingDockControllerObservers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 2085, CFSTR("cannot be observed by a nil object"));

    v5 = 0;
  }
  if (!-[NSHashTable containsObject:](self->_floatingDockControllerObservers, "containsObject:", v5))
  {
    floatingDockControllerObservers = self->_floatingDockControllerObservers;
    if (!floatingDockControllerObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_floatingDockControllerObservers;
      self->_floatingDockControllerObservers = v7;

      floatingDockControllerObservers = self->_floatingDockControllerObservers;
    }
    -[NSHashTable addObject:](floatingDockControllerObservers, "addObject:", v10);
  }

}

- (void)removeFloatingDockControllerObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 2095, CFSTR("cannot be observed by a nil object"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_floatingDockControllerObservers, "removeObject:", v5);

}

- (void)notifyFloatingDockControllerObserversDidRegister:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_floatingDockControllerObservers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "floatingDockControllerDidRegister:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SBIconController _currentFolderController](self, "_currentFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modalLibraryController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isPresented"))
  {
    objc_msgSend(v4, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = (void **)v14;
LABEL_5:
    objc_msgSend(v8, "arrayWithObjects:count:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isPresentingLibraryInForeground"))
  {
    objc_msgSend(v6, "libraryViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v13;
    goto LABEL_5;
  }
  if (v3)
  {
    v12 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_6:

  return v10;
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  -[SBIconController searchPresentableViewController](self, "searchPresentableViewController", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidateBackgroundView");
  objc_msgSend(v14, "invalidateSearchAffordanceView");
  -[SBIconController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SBIconController searchPresenter](self, "searchPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPresenting");

    if (v7)
    {
      v8 = objc_opt_class();
      -[SBIconController _rootFolderController](self, "_rootFolderController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (UIAccessibilityIsReduceMotionEnabled())
        v12 = 1.0;
      else
        v12 = 0.0;
      objc_msgSend(v11, "scrollAccessoryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", v12);

    }
  }

}

- (void)handleNavigationCommand:(id)a3 withDirection:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  SBLibraryViewController *v12;
  char v13;
  int v14;
  void *v15;
  int v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;

  objc_msgSend((id)SBApp, "windowSceneManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDisplayWindowScene");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v41, "isMainDisplayWindowScene");
  v8 = v41;
  if (!v7)
    goto LABEL_79;
  v9 = -[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported");
  v10 = v9;
  if (a4 == 4)
  {
    if (v9)
    {
      objc_msgSend(v41, "modalLibraryController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "libraryViewController");
      v12 = (SBLibraryViewController *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isPresentingLibrary");

      if ((v13 & 1) != 0)
      {
LABEL_5:
        -[SBHLibraryViewController popPresentationState](v12, "popPresentationState");
        v14 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v12 = self->_overlayLibraryViewController;
      -[SBIconController iconManager](self, "iconManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMainDisplayLibraryViewVisible");

      if (v16)
        goto LABEL_5;
    }
    v14 = 0;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:
  v17 = -[SBIconController areHomeScreenIconsOccluded](self, "areHomeScreenIconsOccluded");
  v8 = v41;
  if (!v17)
  {
    v18 = objc_msgSend(v41, "isMainDisplayWindowScene");
    v8 = v41;
    if (v18)
    {
      -[SBIconController _currentFolderController](self, "_currentFolderController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController _rootFolderController](self, "_rootFolderController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "currentPageIndex");
      v22 = objc_msgSend(v19, "contentVisibility");
      if (v21 == objc_msgSend(v19, "firstIconPageIndex"))
        v23 = v14;
      else
        v23 = 1;
      v24 = v14;
      if ((v23 & 1) == 0)
      {
        v24 = v14;
        if (v19 == v20)
        {
          v25 = -[SBIconController isTodayOverlayPresented](self, "isTodayOverlayPresented");
          if (a4 != 1 || v25 || v22)
          {
            if ((a4 == 4 || a4 == 2) && v25)
            {
              v24 = 1;
              -[SBIconController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            -[SBIconController iconManager](self, "iconManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBIconController presentTodayOverlayForIconManager:](self, "presentTodayOverlayForIconManager:", v26);

            v24 = 1;
          }
        }
      }
      if (v10)
      {
        v27 = objc_msgSend(v20, "trailingCustomViewPageIndex");
        if (v21 == objc_msgSend(v19, "lastIconPageIndex"))
          v28 = v24;
        else
          v28 = 1;
        if ((v28 & 1) == 0 && v19 == v20 && a4 == 2 && !v22)
        {
          v29 = v19;
          v30 = v27;
          goto LABEL_35;
        }
        if (v21 == v27)
          v33 = v24;
        else
          v33 = 1;
        if (a4 == 1 && (v33 & 1) == 0 && v19 == v20)
        {
          objc_msgSend(v41, "modalLibraryController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "dismissLibraryAnimated:completion:", 1, 0);

          goto LABEL_78;
        }
      }
      else
      {
        if (v21 == objc_msgSend(v19, "lastIconPageIndex"))
          v31 = v24;
        else
          v31 = 1;
        if ((v31 & 1) == 0 && v19 == v20)
        {
          if (a4 == 2)
            v32 = v14;
          else
            v32 = 1;
          if ((v32 & 1) == 0 && !v22)
          {
            -[SBIconController presentLibraryFromOverlayControllerAnimated:completion:](self, "presentLibraryFromOverlayControllerAnimated:completion:", 1, 0);
            goto LABEL_78;
          }
          if ((a4 == 4 || a4 == 1) && v14)
          {
            -[SBIconController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", 1, 0);
            goto LABEL_78;
          }
          v24 = 0;
        }
      }
      if ((unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL || (v24 & 1) != 0)
      {
        if (a4 == 4)
          v36 = v24;
        else
          v36 = 1;
        if ((v36 & 1) == 0 && !v22)
        {
          if (objc_msgSend(v19, "isOpen"))
          {
            objc_msgSend(v19, "folder");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isRootFolder");

            if ((v38 & 1) == 0)
              objc_msgSend(v19, "_closeFolder");
          }
        }
        goto LABEL_78;
      }
      if (a4 == 2)
        v35 = v21 + 1;
      else
        v35 = v21 - 1;
      if (v22 || !objc_msgSend(v19, "_isValidPageIndex:", v35))
      {
LABEL_78:

        v8 = v41;
        goto LABEL_79;
      }
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2
          && !objc_msgSend(v19, "doesPageContainIconListView:", v35))
        {
          goto LABEL_78;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "userInterfaceIdiom") == 1)
        {
          v40 = objc_msgSend(v19, "doesPageContainIconListView:", v35);

          if ((v40 & 1) == 0)
            goto LABEL_78;
        }
        else
        {

        }
      }
      v29 = v19;
      v30 = v35;
LABEL_35:
      objc_msgSend(v29, "setCurrentPageIndex:animated:", v30, 1);
      goto LABEL_78;
    }
  }
LABEL_79:

}

- (void)_configureEditingGestureRecognizers
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *longPressToEditGestureRecognizer;
  void *v5;
  void *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapToEndEditingGestureRecognizer;
  void *v9;
  void *v10;
  UILongPressGestureRecognizer *v11;

  if (!self->_longPressToEditGestureRecognizer)
  {
    v3 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleEditingGesture_);
    longPressToEditGestureRecognizer = self->_longPressToEditGestureRecognizer;
    self->_longPressToEditGestureRecognizer = v3;

    -[UILongPressGestureRecognizer setDelegate:](self->_longPressToEditGestureRecognizer, "setDelegate:", self);
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", self->_longPressToEditGestureRecognizer);

  }
  if (!self->_tapToEndEditingGestureRecognizer)
  {
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleEditingGesture_);
    tapToEndEditingGestureRecognizer = self->_tapToEndEditingGestureRecognizer;
    self->_tapToEndEditingGestureRecognizer = v7;

    -[UITapGestureRecognizer setDelegate:](self->_tapToEndEditingGestureRecognizer, "setDelegate:", self);
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", self->_tapToEndEditingGestureRecognizer);

  }
  v11 = self->_longPressToEditGestureRecognizer;
  -[SBHIconEditingSettings longPressToEditDuration](self->_iconEditingSettings, "longPressToEditDuration");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v11, "setMinimumPressDuration:");
}

- (void)_handleEditingGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UITapGestureRecognizer *v8;

  v8 = (UITapGestureRecognizer *)a3;
  -[SBIconController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v8)
  {
    if (-[UITapGestureRecognizer state](v8, "state") == 1)
    {
      objc_msgSend(v4, "iconEditingFeedbackBehavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController homeScreenViewController](self, "homeScreenViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapGestureRecognizer locationInView:](v8, "locationInView:", v7);
      objc_msgSend(v4, "setEditing:withFeedbackBehavior:location:", 1, v5);

      -[UITapGestureRecognizer setEnabled:](v8, "setEnabled:", 0);
      -[UITapGestureRecognizer setEnabled:](v8, "setEnabled:", 1);
    }
  }
  else if (self->_tapToEndEditingGestureRecognizer == v8)
  {
    objc_msgSend(v4, "setEditing:withFeedbackBehavior:location:", 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

- (BOOL)_shouldTodayViewController:(id)a3 receiveTouch:(id)a4
{
  id v4;
  int v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isSpotlightVisible") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char isKindOfClass;

  v6 = a4;
  if (self->_longPressToEditGestureRecognizer == a3
    && (objc_opt_self(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_isKindOfClass(),
        v7,
        (v8 & 1) != 0))
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)areHomeScreenIconsOccluded
{
  return -[SBIconController iconOcclusionReasons](self, "iconOcclusionReasons") != 0;
}

- (void)removeIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;

  v4 = a4;
  v7 = -[SBIconController iconOcclusionReasons](self, "iconOcclusionReasons");
  if ((v7 & a3) != 0)
  {
    -[SBIconController setIconOcclusionReasons:](self, "setIconOcclusionReasons:", v7 & ~a3);
    if (v4)
      -[SBIconController _updateVisibleIconsAfterOcclusionChange](self, "_updateVisibleIconsAfterOcclusionChange");
  }
}

- (id)markIconsOccludedForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *iconsOccludedAssertions;
  SBIconsOccludedAssertion *v7;

  v4 = a3;
  if (!self->_iconsOccludedAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    iconsOccludedAssertions = self->_iconsOccludedAssertions;
    self->_iconsOccludedAssertions = v5;

  }
  v7 = -[SBIconsOccludedAssertion initWithInvalidator:reason:]([SBIconsOccludedAssertion alloc], "initWithInvalidator:reason:", self, v4);
  -[NSHashTable addObject:](self->_iconsOccludedAssertions, "addObject:", v7);
  -[SBIconController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 64, 1);

  return v7;
}

- (void)removeIconsOccludedAssertion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_iconsOccludedAssertions, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_iconsOccludedAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_iconsOccludedAssertions, "count"))
      -[SBIconController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 64, 1);
  }

}

- (void)_coverSheetWillPresent:(id)a3
{
  void *v4;
  id v5;

  -[SBIconController iconManager](self, "iconManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", 0);

  -[SBIconController iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllDrags");

}

- (void)_coverSheetDidPresent:(id)a3
{
  -[SBIconController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 0);
}

- (void)_controlCenterWillPresent:(id)a3
{
  void *v4;
  id v5;

  -[SBIconController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 4, 1);
  -[SBIconController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", 0);

  -[SBIconController iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllDrags");

}

- (void)_controlCenterWillDismiss:(id)a3
{
  -[SBIconController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 4, 1);
}

- (void)_policyAggregatorCapabilitiesDidChange:(id)a3
{
  void *v4;
  id v5;

  -[SBIconController policyAggregator](self, "policyAggregator", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "allowsCapability:", 23) & 1) == 0)
    -[SBIconController dismissTodayOverlay](self, "dismissTodayOverlay");
  if ((objc_msgSend(v5, "allowsCapability:", 17) & 1) == 0)
  {
    -[SBIconController iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditing:", 0);

  }
}

- (void)_installedAppsDidChange:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  SBIconController *v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("SBInstalledApplicationsReplacedBundleIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("SBInstalledApplicationsUpdatedBundleIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v7;
  if (objc_msgSend(v7, "count")
    || objc_msgSend(v9, "count")
    || objc_msgSend(v11, "count")
    || objc_msgSend(v13, "count"))
  {
    v32 = v4;
    v33 = v9;
    v14 = (void *)objc_opt_new();
    v15 = objc_opt_class();
    -[SBIconController rootFolder](self, "rootFolder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addIconsOfClass:toSet:", v15, v14);

    -[SBHIconModel addIconsOfClass:toSet:](self->_iconModel, "addIconsOfClass:toSet:", v15, v14);
    v31 = self;
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatingDockController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "suggestionsIconListView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addIconsOfClass:toSet:", v15, v14);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = v14;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (!v20)
      goto LABEL_23;
    v21 = v20;
    v22 = *(_QWORD *)v36;
    while (1)
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v23);
        if ((objc_msgSend(v24, "hasApplicationPlaceholder") & 1) == 0)
        {
          objc_msgSend(v24, "applicationBundleID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "containsObject:", v25) & 1) != 0
            || (objc_msgSend(v13, "containsObject:", v25) & 1) != 0)
          {
            objc_msgSend(v24, "removeApplicationDataSources");
            goto LABEL_14;
          }
          if ((objc_msgSend(v33, "containsObject:", v25) & 1) != 0)
            objc_msgSend(v24, "removeApplicationDataSources");
          if (objc_msgSend(v34, "containsObject:", v25))
          {
LABEL_14:
            objc_msgSend(v5, "applicationWithBundleIdentifier:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addApplicationDataSource:", v26);

          }
        }
        ++v23;
      }
      while (v21 != v23);
      v27 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v21 = v27;
      if (!v27)
      {
LABEL_23:

        v9 = v33;
        -[SBIconController _mutateIconListsForInstalledAppsDidChangeWithController:added:modified:removed:](v31, "_mutateIconListsForInstalledAppsDidChangeWithController:added:modified:removed:", v5, v34, v11, v33);
        -[SBIconController model](v31, "model");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconController _iconModelInstalledAppsDidChange:](v31, "_iconModelInstalledAppsDidChange:", v28);

        v4 = v32;
        break;
      }
    }
  }

}

- (void)_mutateIconListsForInstalledAppsDidChangeWithController:(id)a3 added:(id)a4 modified:(id)a5 removed:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  id v29;
  char v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  SBIconController *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v55 = self;
  if (-[SBIconController _ignoreMutatingIconListsOnApplicationInstall](self, "_ignoreMutatingIconListsOnApplicationInstall"))
  {
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v11);
  objc_msgSend(v14, "unionSet:", v12);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v53 = v14;
  if (objc_msgSend(v14, "count") || objc_msgSend(v13, "count"))
  {
    v54 = v15;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v10, "applicationWithBundleIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "containsObject:", v21))
          {
            objc_msgSend(v54, "addObject:", v22);
            objc_msgSend(v22, "setRestoringIcon:", 1);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v18);
    }

    -[SBIconController model](v55, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rootFolder");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v49, "hasHiddenLists");
    if (objc_msgSend(v54, "count") == 1)
    {
      objc_msgSend(v54, "anyObject");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v52 = v10;
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "anyObject");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v25)
        v28 = v24;
      else
        v28 = 1;
      if ((v28 & 1) != 0)
      {
        if (!v26)
        {
LABEL_30:
          v50 = v13;
          v51 = v12;
          -[SBIconController _iconModel:wantsToRevealAnyApplicationFromIdentifiers:](v55, "_iconModel:wantsToRevealAnyApplicationFromIdentifiers:", v23, v16, v25);
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v32 = v16;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v61 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
                objc_msgSend(v23, "applicationIconForBundleIdentifier:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v38, "hasApplicationPlaceholder"))
                {
                  -[SBIconController applicationPlaceholderController](v55, "applicationPlaceholderController");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "placeholderForDisplayID:", v37);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v40)
                  {
                    v41 = (void *)MEMORY[0x1E0D4E420];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removing downloading icon because app installed without ever receiving a placeholder."));
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "logStep:byParty:phase:success:forBundleID:description:", 5, 10, 3, 1, v37, v42);

                    objc_msgSend(v38, "removeApplicationPlaceholderDataSources");
                  }
                }

              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
            }
            while (v34);
          }

          v12 = v51;
          v10 = v52;
          v13 = v50;
          v15 = v54;
          goto LABEL_41;
        }
        v29 = (id)objc_msgSend(v23, "removeApplicationWithBundleIdentifier:pruneEmptyIcons:", v26, 1);
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if (v25)
        v30 = v24;
      else
        v30 = 1;
      if ((v30 & 1) != 0)
        goto LABEL_30;
      v27 = 0;
    }
    v31 = (id)objc_msgSend(v23, "addApplication:", v25);
    goto LABEL_29;
  }
LABEL_41:
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v43 = v15;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v57 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "setRestoringIcon:", 0);
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v45);
  }

LABEL_49:
}

- (void)_iconModelInstalledAppsDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconController _libraryViewControllers](self, "_libraryViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "noteInstalledApplicationsDidChange");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  -[SBIconController iconManager](self, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "checkForInvalidCustomElements");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "iconModelInstalledAppsDidChange:", v4);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (void)_iconModel:(id)a3 wantsToRevealAnyApplicationFromIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconController iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v9;
  if (v9)
  {
    objc_msgSend(v6, "applicationIconForBundleIdentifier:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SBIconController layoutStateProvider](self, "layoutStateProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unlockedEnvironmentMode");

  v36 = (void *)v10;
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    if (v10)
    {
      if (v13 == 3)
        v23 = 4;
      else
        v23 = 6;
      objc_msgSend(v8, "addNewIconToDesignatedLocation:options:", v10, v23);
    }
  }
  else if (v13 != 3 && v10)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = v7;
    v33 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v33)
    {
      v15 = *(_QWORD *)v46;
      v32 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v14);
          v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v6, "applicationIconsForBundleIdentifier:", v17, v32);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v42;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v42 != v21)
                  objc_enumerationMutation(v18);
                if (objc_msgSend(v8, "isDisplayingIcon:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j)))
                {

                  SBLogIconController();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v51 = v35;
                    _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Skipping revealing added/modified icon: %@", buf, 0xCu);
                  }

                  goto LABEL_31;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
              if (v20)
                continue;
              break;
            }
          }

          v15 = v32;
          v10 = (uint64_t)v36;
        }
        v33 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v33);
    }

    objc_msgSend(v8, "scrollToIconListContainingIcon:animate:", v10, 1);
  }
LABEL_31:
  v34 = v8;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v31 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v30, "iconModel:wantsToRevealAnyApplicationFromIdentifiers:", v6, v31);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v27);
  }

}

- (void)_backupRestoringDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SBIconController model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRestoring");

  objc_msgSend(v4, "setRestoring:", v6);
  if ((v6 & 1) == 0)
  {
    -[SBIconController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checkForInvalidWidgets");

    -[SBIconController iconManager](self, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "checkForInvalidCustomElements");

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "iconModel:backupRestoringStatusDidChange:", v4, v6);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_updateIconModelStore
{
  void *v3;
  void *v4;
  SBReadOnlyDefaultIconModelStore *v5;
  NSObject *v6;
  NSObject *v7;
  SBIconModel *v8;
  SBReadOnlyDefaultIconModelStore *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  SBReadOnlyDefaultIconModelStore *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restrictionEnforcedHomeScreenLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (v5 = -[SBIconProfileModelMemoryStore initWithITunesRepresentation:]([SBIconProfileModelMemoryStore alloc], "initWithITunesRepresentation:", v4)) == 0)
  {
    if (self->_visibleTags)
      goto LABEL_32;
    SBLogIconController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "No visible tag information available when creating icon model for first time", (uint8_t *)&v19, 2u);
    }

    v5 = (SBReadOnlyDefaultIconModelStore *)objc_alloc_init(MEMORY[0x1E0DAA618]);
    if (!v5)
    {
LABEL_32:
      if (!self->_isAppAllowlistActiveAndTransient)
        goto LABEL_8;
      SBLogIconController();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Using read-only variant of default icon model store because app allowlist is being treated as transient", (uint8_t *)&v19, 2u);
      }

      v5 = objc_alloc_init(SBReadOnlyDefaultIconModelStore);
      if (!v5)
      {
LABEL_8:
        +[SBDefaultIconModelStore sharedInstance](SBDefaultIconModelStore, "sharedInstance");
        v5 = (SBReadOnlyDefaultIconModelStore *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  -[SBIconController model](self, "model");
  v8 = (SBIconModel *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel store](v8, "store");
  v9 = (SBReadOnlyDefaultIconModelStore *)objc_claimAutoreleasedReturnValue();

  SBLogWidgetDiscoverability();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHIconModel store](v8, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "iconModelStore(%@), store(%@)", (uint8_t *)&v19, 0x16u);

  }
  if (v9 != v5)
  {
    -[SBIconController setHasRestrictedEnforcedLayout:](self, "setHasRestrictedEnforcedLayout:", v4 != 0);
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SBReadOnlyDefaultIconModelStore currentIconStateURL](v5, "currentIconStateURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", 0))
        v15 = 2;
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }
    -[SBIconController setUserIconStateFileStatus:](self, "setUserIconStateFileStatus:", v15);
    SBLogWidgetDiscoverability();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[SBIconController userIconStateFileStatus](self, "userIconStateFileStatus");
      v19 = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Icon state = %d", (uint8_t *)&v19, 8u);
    }

    if (v8)
    {
      -[SBHIconModel setStore:](v8, "setStore:", v5);
      if (v4)
      {
LABEL_25:
        +[SBDefaultIconModelStore sharedInstance](SBDefaultIconModelStore, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
        -[SBHIconModel setTodayListsStore:](v8, "setTodayListsStore:", v18);

        goto LABEL_29;
      }
    }
    else
    {
      v8 = -[SBHIconModel initWithStore:applicationDataSource:]([SBIconModel alloc], "initWithStore:applicationDataSource:", v5, self);
      -[SBHIconModel setPostsDidAddIconNotification:](v8, "setPostsDidAddIconNotification:", 0);
      -[SBIconController setModel:](self, "setModel:", v8);
      if (v4)
        goto LABEL_25;
    }
    v18 = 0;
    goto LABEL_28;
  }
LABEL_29:

}

- (void)setModel:(id)a3
{
  SBIconModel *v5;
  SBIconModel **p_iconModel;
  void *v7;
  void *v8;
  uint64_t v9;
  SBHLibraryCategoryMapProvider *categoryMapProvider;
  void *v11;
  NSObject *v12;
  SBIconModel *iconModel;
  void *v14;
  NSMutableSet *v15;
  NSMutableSet *delayedStyleWallpaperEffectViews;
  void *v17;
  SBIconVisibilityService *v18;
  SBIconVisibilityService *iconVisibilityService;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableSet *v24;
  NSMutableSet *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableSet *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (SBIconModel *)a3;
  p_iconModel = &self->_iconModel;
  if (self->_iconModel != v5)
  {
    -[SBIconController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DAAA08];
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0DAAA08], self->_iconModel);
    categoryMapProvider = self->_categoryMapProvider;
    self->_categoryMapProvider = 0;

    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[SBIconController setOverlayLibraryViewController:](self, "setOverlayLibraryViewController:", 0);
    objc_msgSend(v7, "setOverlayLibraryViewController:", 0);
    -[SBIconController setHomeScreenOverlayController:](self, "setHomeScreenOverlayController:", 0);
    SBLogIcon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SBIconController setModel:].cold.1();

    objc_storeStrong((id *)&self->_iconModel, a3);
    iconModel = self->_iconModel;
    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel setRestoring:](iconModel, "setRestoring:", objc_msgSend(v14, "isRestoring"));

    -[SBHIconModel reloadIcons](self->_iconModel, "reloadIcons");
    if (*(_OWORD *)&self->_visibleTags != 0)
      -[SBHIconModel setVisibilityOfIconsWithVisibleTags:hiddenTags:](*p_iconModel, "setVisibilityOfIconsWithVisibleTags:hiddenTags:");
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = v15;

    objc_msgSend(v7, "setIconModel:", v5);
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__iconModelDidLayout_, v9, self->_iconModel);
    -[SBHIconModel rootFolder](self->_iconModel, "rootFolder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[SBIconController _rootFolderDidChange](self, "_rootFolderDidChange");
    v18 = -[SBIconVisibilityService initWithIconModel:]([SBIconVisibilityService alloc], "initWithIconModel:", self->_iconModel);
    iconVisibilityService = self->_iconVisibilityService;
    self->_iconVisibilityService = v18;

    if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
    {
      -[SBIconController iconManager](self, "iconManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        if (!-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
        {
          -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconController _setUpLibraryViewControllerForWindowScene:](self, "_setUpLibraryViewControllerForWindowScene:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconController setOverlayLibraryViewController:](self, "setOverlayLibraryViewController:", v22);
          -[SBIconController iconManager](self, "iconManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setOverlayLibraryViewController:", v22);

        }
      }
    }
    objc_msgSend(v8, "postNotificationName:object:", SBIconControllerIconModelDidChangeNotification, self);
    while (-[NSMutableSet count](self->_delayedStyleWallpaperEffectViews, "count"))
    {
      v24 = self->_delayedStyleWallpaperEffectViews;
      v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v26 = self->_delayedStyleWallpaperEffectViews;
      self->_delayedStyleWallpaperEffectViews = v25;

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v27 = v24;
      v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v40;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v40 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v31++), "setStyle:", 29);
          }
          while (v29 != v31);
          v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v29);
      }

    }
    v32 = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = 0;

    if (-[SBHIconModel hasDesiredIconState](self->_iconModel, "hasDesiredIconState"))
    {
      -[SBHIconModel missingDesiredIconIdentifiers](*p_iconModel, "missingDesiredIconIdentifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *MEMORY[0x1E0DABE10];
      objc_msgSend(v33, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0DA9D78];
      v37 = v35;
      objc_msgSend(v36, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "emitEvent:withPayload:", 35, v37);

    }
  }

}

- (void)_showsBadgesInAppLibraryDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsBadgesInAppLibrary");

  -[SBIconController _libraryViewControllers](self, "_libraryViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAllowsBadging:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_addSmartStackToTodayList:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke;
  v11[3] = &unk_1E8EA64B8;
  v9 = v7;
  v13 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "performAfterFirstUnlockSinceBootUsingBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CF8D68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2;
  v3[3] = &unk_1E8EA6490;
  v5 = a1[5];
  objc_copyWeak(&v6, a1 + 6);
  v4 = a1[4];
  objc_msgSend(v2, "fetchSmartStackOfVariant:completionHandler:", 1, v3);

  objc_destroyWeak(&v6);
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void (**v28)(id, _QWORD);
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v31 = v6;
    v32 = v5;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = (uint64_t)v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Found suggested default widget stack: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = v7;
    objc_msgSend(v7, "mediumDefaultStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v15, "avocadoDescriptor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sanitizedDescriptor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_msgSend(v17, "extensionBundleIdentifier"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v18, "length"),
                  v18,
                  v19))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                || (objc_msgSend(v17, "kind"),
                    v20 = (void *)objc_claimAutoreleasedReturnValue(),
                    v21 = objc_msgSend(v20, "length"),
                    v20,
                    v21))
              {
                objc_msgSend(v9, "addObject:", v17);
                goto LABEL_24;
              }
              SBLogWidgets();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = (uint64_t)v15;
                v23 = v22;
                v24 = "Widget in suggested default widget stack has no kind: %@";
                goto LABEL_22;
              }
            }
            else
            {
              SBLogWidgets();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = (uint64_t)v15;
                v23 = v22;
                v24 = "Widget in suggested default widget stack has no extension bundle identifier: %@";
                goto LABEL_22;
              }
            }
          }
          else
          {
            SBLogWidgets();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (uint64_t)v15;
              v23 = v22;
              v24 = "Widget in suggested default widget stack has no descriptor: %@";
LABEL_22:
              _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
            }
          }

LABEL_24:
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      SBLogWidgets();
      v25 = objc_claimAutoreleasedReturnValue();
      v6 = v31;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 134217984;
        v44 = v26;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "Found %lu medium default widget stack descriptors", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_308;
      block[3] = &unk_1E8EA6468;
      objc_copyWeak(&v37, a1 + 6);
      v34 = v9;
      v35 = a1[4];
      v36 = a1[5];
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v37);
      v5 = v32;
    }
    else
    {
      v6 = v31;
      v5 = v32;
      if (a1[5])
      {
        SBLogWidgets();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_2();

        (*((void (**)(void))a1[5] + 2))();
      }
    }

  }
  else
  {
    SBLogWidgets();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_1(v6, v27);

    v28 = (void (**)(id, _QWORD))a1[5];
    if (v28)
      v28[2](v28, 0);
  }

}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_308(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void (*v7)(void);
  NSObject *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_createWidgetIconWithDescriptors:gridSize:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DAA770]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "iconDataSourceCount"))
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "insertIcon:atIndex:", v3, 0);
    objc_msgSend(WeakRetained, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveIconStateIfNeeded");

    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    SBLogWidgets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_308_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_8;
  }

}

- (void)_obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E8EA02D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAfterFirstUnlockSinceBootUsingBlock:", v7);

}

void __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id obj;
  void *v43;
  id v44;
  uint64_t v45;
  _QWORD block[4];
  id v47;
  _QWORD v48[5];
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "suggestedOnboardingStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "userIconStateFileStatus");
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (!v7)
    {
LABEL_4:
      v5 = (id *)MEMORY[0x1E0DAA7A0];
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = v4 == 1 && (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v5 = (id *)MEMORY[0x1E0DAA768];
  if (!v10)
    v5 = (id *)MEMORY[0x1E0DAA770];
LABEL_11:
  v11 = *v5;
  SBLogWidgetDiscoverability();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v59) = (_DWORD)v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Suggested widgets size class = %d", buf, 8u);
  }

  if (v3 && objc_msgSend(v3, "count"))
  {
    v37 = a1;
    v39 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v38 = v3;
    obj = v3;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v13)
    {
      v14 = v13;
      v45 = *(_QWORD *)v55;
      v15 = (id)*MEMORY[0x1E0DAA7A0];
      v40 = (id)*MEMORY[0x1E0DAA770];
      v43 = (void *)*MEMORY[0x1E0DAA7A0];
      v44 = v11;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v55 != v45)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v17;
          else
            v18 = 0;
          v19 = v18;
          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11 == v15 || objc_msgSend(v11, "isEqualToString:", v15))
            {
              objc_msgSend(v19, "smallDefaultStack");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else if (v11 == v40 || objc_msgSend(v11, "isEqualToString:"))
            {
              objc_msgSend(v19, "mediumDefaultStack");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v19, "largeDefaultStack");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v53 = 0u;
            v51 = 0u;
            v52 = 0u;
            v50 = 0u;
            v22 = v21;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v51;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v51 != v25)
                    objc_enumerationMutation(v22);
                  objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "avocadoDescriptor");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "sanitizedDescriptor");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v20, "addObject:", v28);
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
              }
              while (v24);
            }

            if (objc_msgSend(v20, "count"))
              objc_msgSend(v41, "addObject:", v20);

            v15 = v43;
            v11 = v44;
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v14);
    }

    SBLogWidgetDiscoverability();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v41;
      _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Smart stack %@", buf, 0xCu);
    }

    a1 = v37;
    v30 = *(void **)(v37 + 32);
    v3 = v38;
    v2 = v39;
    if (__sb__runningInSpringBoard())
    {
      objc_msgSend(v30, "_updateDefaultFirstPageWidgetDescriptors:withSizeClass:andGridCellInfoOptions:", v41, v11, 2 * (SBFEffectiveDeviceClass() == 2));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_updateDefaultFirstPageWidgetDescriptors:withSizeClass:andGridCellInfoOptions:", v41, v11, 2 * (objc_msgSend(v31, "userInterfaceIdiom") == 1));

    }
    dispatch_group_leave(v39);

  }
  else
  {
    dispatch_group_leave(v2);
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceIdiom");

  v34 = MEMORY[0x1E0C809B0];
  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    dispatch_group_enter(v2);
    v35 = objc_alloc_init(MEMORY[0x1E0CF8D90]);
    objc_msgSend(*(id *)(a1 + 32), "iconManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setProactiveWidgetSuggesterClient:", v35);

    v48[0] = v34;
    v48[1] = 3221225472;
    v48[2] = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_312;
    v48[3] = &unk_1E8EA64E0;
    v48[4] = *(_QWORD *)(a1 + 32);
    v49 = v2;
    objc_msgSend(v35, "defaultWidgetSuggestionOfType:completionHandler:", 1, v48);

  }
  block[0] = v34;
  block[1] = 3221225472;
  block[2] = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_314;
  block[3] = &unk_1E8E9E8D0;
  v47 = *(id *)(a1 + 40);
  dispatch_group_notify(v2, MEMORY[0x1E0C80D38], block);

}

void __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_312(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  if (a2)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_2;
    v10 = &unk_1E8E9E820;
    v3 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v3;
    BSDispatchMain();

  }
  else
  {
    SBLogWidgetDiscoverability();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "TV widget was determined not to load", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SBWidgetSuggestionDidChange, (CFStringRef)*MEMORY[0x1E0CF8A08], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "obtainProactiveSecondPageWidgetSuggestion");
  SBLogWidgetDiscoverability();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "TV widget was determined to load", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_314(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    SBLogWidgetDiscoverability();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Finish fetching smart stacks", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)_updateDefaultFirstPageWidgetDescriptors:(id)a3 withSizeClass:(id)a4 andGridCellInfoOptions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBIconController iconManager](self, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultFirstPageWidgetDescriptors:", v8);
  objc_msgSend(v10, "setDefaultFirstPageWidgetSizeClass:", v9);
  v17 = v10;
  objc_msgSend(v10, "setGridCellInfoOptionsForInsertingDefaultWidgets:", a5);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "updateDefaultFirstPageWidgetDescriptors:withSizeClass:andGridCellInfoOptions:", v8, v9, a5);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (void)addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  -[SBIconController iconManager](self, "iconManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v8, "deviceTypeSupportModalWidgetIntroduction");
  if (v5)
  {
    -[SBIconController alertItemsController](self, "alertItemsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForceAlertsToPend:forReason:", 1, CFSTR("SBHomeScreenWidgetDiscoverabilityIntroduction"));

  }
  if (objc_msgSend(v8, "addDefaultWidgetsToHomeScreen"))
  {
    objc_msgSend(v8, "scrollToDefaultWidgets");
    objc_msgSend(v4, "setShouldAddDefaultWidgetsToHomeScreen:", 0);
    -[SBIconController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableUserInteractionForWidgetDiscoverability");
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v8, "rootFolderContainsWidgets"))
    objc_msgSend(v4, "setShouldAddDefaultWidgetsToHomeScreen:", 0);
  if (v5)
  {
    -[SBIconController alertItemsController](self, "alertItemsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setForceAlertsToPend:forReason:", 0, CFSTR("SBHomeScreenWidgetDiscoverabilityIntroduction"));
    goto LABEL_9;
  }
LABEL_10:

}

- (void)obtainProactiveSecondPageWidgetSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[SBIconController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetExtensionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA580]), "initWithKind:extensionBundleIdentifier:", CFSTR("com.apple.tv"), CFSTR("com.apple.tv.TVWidgetExtension"));
  v16 = v4;
  objc_msgSend(v4, "sbh_descriptorForWidgetIdentifiable:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v22 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDefaultSecondPageWidgetDescriptors:", v9);

    objc_msgSend(v3, "setDefaultSecondPageWidgetSizeClass:", *MEMORY[0x1E0DAA758]);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "obtainProactiveSecondPageWidgetSuggestion");
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)displayFeatureIntroductionItem:(id)a3 atLocation:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  if (objc_msgSend(v6, "shouldDisplayFeatureIntroductionAtLocations:", a4))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(v6, "featureIntroductionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "shouldDeferAlertsAtLocations:", a4))
    {
      *((_BYTE *)v14 + 24) = 1;
      -[SBIconController alertItemsController](self, "alertItemsController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setForceAlertsToPend:forReason:", 1, v7);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || !objc_msgSend(v6, "shouldPauseUserInteractionAtLocations:", a4))
      {
        goto LABEL_9;
      }
      -[SBIconController iconManager](self, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "disableUserInteractionForWidgetDiscoverability");
    }

LABEL_9:
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__SBIconController_displayFeatureIntroductionItem_atLocation___block_invoke;
    v10[3] = &unk_1E8E9FD30;
    v12 = &v13;
    v10[4] = self;
    v9 = v7;
    v11 = v9;
    objc_msgSend(v6, "displayFeatureIntroductionAtLocations:presentCompletion:dismissCompletion:", a4, 0, v10);

    _Block_object_dispose(&v13, 8);
  }

}

void __62__SBIconController_displayFeatureIntroductionItem_atLocation___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "alertItemsController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setForceAlertsToPend:forReason:", 0, *(_QWORD *)(a1 + 40));

  }
}

- (void)displayFeatureIntroductionsAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBIconController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureIntroductionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureIntroductionItemAtLocation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v7, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBIconController displayFeatureIntroductionItem:atLocation:](self, "displayFeatureIntroductionItem:atLocation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), a3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_unlockAnimationDidFinish:(id)a3
{
  void *v4;
  id v5;

  -[SBIconController iconManager](self, "iconManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFocusModePopoverVisibility");
  -[SBIconController displayFeatureIntroductionsAtLocation:](self, "displayFeatureIntroductionsAtLocation:", 4);

}

- (void)_rootFolderDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;

  -[SBIconController iconManager](self, "iconManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "userSessionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sessionType");

  if (v6 == 2)
    objc_msgSend(v17, "removeWidgetIconsFromHomeScreen");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeScreenDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "shouldUpgradeEnableWidgetSuggestions"))
    v9 = v6 == 2;
  else
    v9 = 1;
  if (!v9
    && -[SBIconController _enableWidgetSuggestionsForIconsInModel:withRootFolder:](self, "_enableWidgetSuggestionsForIconsInModel:withRootFolder:", v3, v4))
  {
    objc_msgSend(v8, "setShouldUpgradeEnableWidgetSuggestions:", 0);
  }
  objc_msgSend(v4, "todayList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController _prepareDefaultTodayLayoutIfNecessary](self, "_prepareDefaultTodayLayoutIfNecessary");
  -[SBIconController _setupWidgetIntroductionIfNecessary](self, "_setupWidgetIntroductionIfNecessary");
  -[SBIconController todayViewController](self, "todayViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRootFolder:", v4);
  }
  else
  {
    if (!v17)
      goto LABEL_15;
    v13 = -[SBIconController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v17, v10, v4, 1);
    -[SBIconController setTodayViewController:](self, "setTodayViewController:", v13);
    if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
      -[SBHIconManager setOverlayTodayViewController:](self->_iconManager, "setOverlayTodayViewController:", v13);
  }

LABEL_15:
  -[SBIconController _setupOverlayLibraryViewController](self, "_setupOverlayLibraryViewController");
  -[SBIconController coverSheetTodayViewController](self, "coverSheetTodayViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    -[SBIconController coverSheetTodayViewController](self, "coverSheetTodayViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRootFolder:", v4);
LABEL_19:

    goto LABEL_20;
  }
  if (v17)
  {
    v16 = -[SBIconController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v17, v10, v4, 2);
    -[SBIconController setCoverSheetTodayViewController:](self, "setCoverSheetTodayViewController:", v16);
    goto LABEL_19;
  }
LABEL_20:
  -[SBIconController updateRootFolderWithCurrentDoNotDisturbState](self, "updateRootFolderWithCurrentDoNotDisturbState");
  objc_msgSend(v4, "addFolderObserver:", self);

}

- (BOOL)_enableWidgetSuggestionsForIconsInModel:(id)a3 withRootFolder:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke;
  v11[3] = &unk_1E8EA6530;
  v11[4] = &v12;
  objc_msgSend(v6, "enumerateListsWithOptions:usingBlock:", 1, v11);
  if (*((_BYTE *)v13 + 24))
  {
    SBLogIconController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Enabled Widget Suggestions for at least one widget icon; saving icon state...",
        buf,
        2u);
    }

    objc_msgSend(v6, "markIconStateDirty");
    v8 = objc_msgSend(v5, "saveIconStateIfNeeded");
    SBLogIconController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v8;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Enabled Widget Suggestions for at least one widget icon; icon state saved: %{BOOL}u",
        buf,
        8u);
    }
  }
  else
  {
    SBLogIconController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Did not enable Widget Suggestions for any widget icons", buf, 2u);
    }
    LOBYTE(v8) = 1;
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke_2;
  v3[3] = &unk_1E8EA6508;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateIconsWithOptions:usingBlock:", 1, v3);
}

void __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isWidgetIcon");
  v4 = v6;
  if (v3)
  {
    v5 = v6;
    if (objc_msgSend(v5, "allowsSuggestions"))
    {
      objc_msgSend(v5, "setAllowsExternalSuggestions:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }

    v4 = v6;
  }

}

- (void)_setupWidgetIntroductionIfNecessary
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionType");

  v5 = -[SBIconController userIconStateFileStatus](self, "userIconStateFileStatus");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController _featureIntroductionItemForWidgetSetupAtLocation:](self, "_featureIntroductionItemForWidgetSetupAtLocation:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeAddObject:", v7);
  if (v5 == 2 && v4 != 2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v13, "featureIntroductionItemForWidgetSetupAtLocation:", 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "bs_safeAddObject:", v14);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v6, "count"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__SBIconController__setupWidgetIntroductionIfNecessary__block_invoke;
      v15[3] = &unk_1E8E9E980;
      v16 = v6;
      -[SBIconController _obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:](self, "_obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:", v15);

    }
  }

}

void __55__SBIconController__setupWidgetIntroductionIfNecessary__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogWidgetDiscoverability();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("unsuccessfully");
    if (a2)
      v5 = CFSTR("successfully");
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Obtained widget discoverability fetching status %@", buf, 0xCu);
  }

  if (a2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setupFeatureIntroductionAtLocations:", 2, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)_featureIntroductionItemForWidgetSetupAtLocation:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBIconController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureIntroductionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureIntroductionItemAtLocation:withIdentifier:", a3, CFSTR("SBFeatureIntroductionLocationNone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldSetupFeatureIntroductionAtLocations:", a3))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)_prepareDefaultTodayLayoutIfNecessary
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (-[SBIconController _tryToPrepareNonDynamicDefaultTodayLayout](self, "_tryToPrepareNonDynamicDefaultTodayLayout"))
  {
    -[SBIconController _tryToPrepareDynamicDefaultTodayLayout](self, "_tryToPrepareDynamicDefaultTodayLayout");
  }
  else
  {
    v3 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SBIconController__prepareDefaultTodayLayoutIfNecessary__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __57__SBIconController__prepareDefaultTodayLayoutIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_tryToPrepareNonDynamicDefaultTodayLayout");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_tryToPrepareDynamicDefaultTodayLayout");
  return result;
}

- (BOOL)_tryToPrepareNonDynamicDefaultTodayLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SBIconController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "shouldPrepareDefaultTodayList"))
  {
    if (!objc_msgSend(v3, "resetTodayLayout") || !objc_msgSend(v4, "saveIconStateIfNeeded"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "setShouldPrepareDefaultTodayList:", 0);
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)_tryToPrepareDynamicDefaultTodayLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  -[SBIconController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "shouldPrepareStackForDefaultTodayList"))
  {
    objc_msgSend(v4, "todayList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke;
    v9[3] = &unk_1E8EA6558;
    v10 = v6;
    objc_copyWeak(&v12, &location);
    v8 = v7;
    v11 = v8;
    -[SBIconController _addSmartStackToTodayList:completionHandler:](self, "_addSmartStackToTodayList:completionHandler:", v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke(id *a1, int a2)
{
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  if (a2)
  {
    objc_msgSend(a1[4], "setShouldPrepareStackForDefaultTodayList:", 0);
  }
  else
  {
    v3 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_2;
    block[3] = &unk_1E8EA5EB0;
    objc_copyWeak(&v7, a1 + 6);
    v5 = a1[5];
    v6 = a1[4];
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
  }
}

void __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_3;
  v4[3] = &unk_1E8E9E980;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "_addSmartStackToTodayList:completionHandler:", v3, v4);

}

uint64_t __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setShouldPrepareStackForDefaultTodayList:", 0);
  return result;
}

- (void)_makeTodayViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
  {
    -[SBIconController iconManager](self, "iconManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "todayList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController todayViewController](self, "todayViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[SBIconController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v3, v6, v5, 1);
      -[SBIconController setTodayViewController:](self, "setTodayViewController:", v8);
      if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
        -[SBHIconManager setOverlayTodayViewController:](self->_iconManager, "setOverlayTodayViewController:", v8);

    }
    -[SBIconController coverSheetTodayViewController](self, "coverSheetTodayViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = -[SBIconController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v3, v6, v5, 2);
      -[SBIconController setCoverSheetTodayViewController:](self, "setCoverSheetTodayViewController:", v10);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__SBIconController__makeTodayViewControllers__block_invoke;
    v11[3] = &unk_1E8EA6580;
    v11[4] = self;
    -[SBIconController _enumerateTodayViewControllers:](self, "_enumerateTodayViewControllers:", v11);

  }
}

uint64_t __45__SBIconController__makeTodayViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHomeScreenTraitOverridesForViewController:", a2);
}

- (void)_rebuildTodayViewControllers
{
  -[SBIconController setTodayViewController:](self, "setTodayViewController:", 0);
  -[SBIconController setCoverSheetTodayViewController:](self, "setCoverSheetTodayViewController:", 0);
  -[SBIconController _makeTodayViewControllers](self, "_makeTodayViewControllers");
}

- (void)_enumerateTodayViewControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[SBIconController todayViewController](self, "todayViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v5 = (void *)objc_opt_new();
      -[SBIconController todayViewController](self, "todayViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_safeAddObject:", v6);

    }
    -[SBIconController coverSheetTodayViewController](self, "coverSheetTodayViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v5)
        v5 = (void *)objc_opt_new();
      -[SBIconController coverSheetTodayViewController](self, "coverSheetTodayViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_safeAddObject:", v8);

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SBIconController__enumerateTodayViewControllers___block_invoke;
    v10[3] = &unk_1E8EA65A8;
    v11 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

    v4 = v9;
  }

}

uint64_t __51__SBIconController__enumerateTodayViewControllers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)importIconState:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_sendITunesNotification = 0;
  v4 = -[SBIconModel importState:](self->_iconModel, "importState:", a3);
  if (v4)
  {
    -[SBIconController iconManager](self, "iconManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relayout");

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_iconModelControllerObservers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "iconModelDidImportIconState:", self->_iconModel);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  self->_sendITunesNotification = 1;
  return v4;
}

- (BOOL)iconsSnapToGrid
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() == 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v2;
}

- (BOOL)isIconVisibleForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationIconForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isIconVisible:", v6);
  return (char)v4;
}

- (BOOL)isAppLibraryAllowed
{
  BOOL v3;
  void *v4;

  if (!-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
    return 0;
  if (objc_msgSend((id)SBApp, "homeScreenRotationStyle") == 1)
    return 1;
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v4, "orientation") - 5) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (id)createModalLibraryControllerForWindowScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SBModalLibraryController *v8;
  SBModalLibraryController *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v5, "floatingDockController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 3363, CFSTR("floating dock controller must exist in order to create a modal library controller"));

    }
    -[SBIconController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SBIconController _setUpLibraryViewControllerForWindowScene:](self, "_setUpLibraryViewControllerForWindowScene:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v9 = [SBModalLibraryController alloc];
      -[SBIconController iconManager](self, "iconManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SBModalLibraryController initWithIconManager:libraryViewController:floatingDockController:windowScene:](v9, "initWithIconManager:libraryViewController:floatingDockController:windowScene:", v10, v7, v6, v5);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_setUpLibraryViewControllerForWindowScene:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SBProactiveLibraryCategoryMapProviderSource *v9;
  SBHLibraryCategoryMapProvider *v10;
  SBHLibraryCategoryMapProvider *categoryMapProvider;
  SBLibraryViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v5 = a3;
  -[SBIconController iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController model](self, "model");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 3383, CFSTR("icon manager must exist in order to create a library view controller"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 3384, CFSTR("icon model must exist in order to create a library view controller"));

LABEL_3:
  if (!self->_categoryMapProvider)
  {
    v9 = objc_alloc_init(SBProactiveLibraryCategoryMapProviderSource);
    v10 = (SBHLibraryCategoryMapProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA4D8]), "initWithSource:", v9);
    categoryMapProvider = self->_categoryMapProvider;
    self->_categoryMapProvider = v10;

  }
  if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScreenDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[SBLibraryViewController initWithCategoryMapProvider:windowScene:]([SBLibraryViewController alloc], "initWithCategoryMapProvider:windowScene:", self->_categoryMapProvider, v5);
    if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
      -[SBHLibraryViewController setIconLocation:](v12, "setIconLocation:", *MEMORY[0x1E0DAA980]);
    -[SBHLibraryViewController setIconModel:](v12, "setIconModel:", v8);
    -[SBHLibraryViewController addObserver:](v12, "addObserver:", self);
    -[SBHLibraryViewController setBehaviorDelegate:](v12, "setBehaviorDelegate:", self);
    -[SBLibraryViewController setEditing:](v12, "setEditing:", objc_msgSend(v6, "isEditing"));
    -[SBHLibraryViewController setAllowsBadging:](v12, "setAllowsBadging:", objc_msgSend(v14, "showsBadgesInAppLibrary"));
    -[SBHLibraryViewController setContentVisibility:](v12, "setContentVisibility:", 2);
    -[SBHLibraryViewController setIconViewProvider:](v12, "setIconViewProvider:", v6);
    -[SBHLibraryViewController setIconViewDelegate:](v12, "setIconViewDelegate:", v6);
    -[SBHLibraryViewController setHomeScreenIconTransitionAnimatorDelegate:](v12, "setHomeScreenIconTransitionAnimatorDelegate:", v6);
    -[SBIconController _appLibraryListLayoutProviderForWindowScene:](self, "_appLibraryListLayoutProviderForWindowScene:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryViewController setListLayoutProvider:](v12, "setListLayoutProvider:", v15);
    objc_msgSend(v6, "iconImageCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryViewController setIconImageCache:](v12, "setIconImageCache:", v16);

    objc_msgSend(v6, "legibilitySettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryViewController setLegibilitySettings:](v12, "setLegibilitySettings:", v17);

    -[SBHLibraryViewController addObserver:](v12, "addObserver:", v6);
  }

  return v12;
}

- (id)_appLibraryListLayoutProviderForWindowScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[9];
  _QWORD v31[11];

  v31[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    SBLogIconController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SBIconController _appLibraryListLayoutProviderForWindowScene:].cold.1();

  }
  -[SBIconController iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isContinuityDisplayWindowScene") & 1) != 0
    || objc_msgSend(v4, "isMainDisplayWindowScene"))
  {
    objc_msgSend(v6, "listLayoutProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "listLayoutProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DAA968];
    objc_msgSend(v8, "layoutForIconLocation:", *MEMORY[0x1E0DAA968]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    objc_msgSend(v14, "layoutConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v12;
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v16, "landscapeLayoutInsets");
    objc_msgSend(v16, "portraitLayoutInsets");
    objc_msgSend(v16, "setPortraitLayoutInsets:");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA5E0]), "initWithLayoutConfiguration:", v16);
    v30[0] = *MEMORY[0x1E0DAA9E8];
    objc_msgSend(v8, "layoutForIconLocation:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v28;
    v30[1] = *MEMORY[0x1E0DAA950];
    objc_msgSend(v8, "layoutForIconLocation:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v27;
    v30[2] = *MEMORY[0x1E0DAA980];
    objc_msgSend(v8, "layoutForIconLocation:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v26;
    v30[3] = *MEMORY[0x1E0DAA958];
    objc_msgSend(v8, "layoutForIconLocation:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v17;
    v30[4] = *MEMORY[0x1E0DAA978];
    objc_msgSend(v8, "layoutForIconLocation:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v18;
    v30[5] = *MEMORY[0x1E0DAA970];
    objc_msgSend(v8, "layoutForIconLocation:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v19;
    v30[6] = *MEMORY[0x1E0DAA960];
    objc_msgSend(v8, "layoutForIconLocation:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = v20;
    v31[7] = v25;
    v21 = *MEMORY[0x1E0DAA988];
    v30[7] = v9;
    v30[8] = v21;
    objc_msgSend(v8, "layoutForIconLocation:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[8] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA430]), "initWithListLayouts:", v23);
  }

  return v7;
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  _QWORD v4[5];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__SBIconController_observer_noteServerConnectionStateChanged___block_invoke;
    v4[3] = &unk_1E8EA3290;
    v4[4] = self;
    objc_msgSend(a3, "getSectionInfoWithCompletion:", v4);
  }
}

uint64_t __62__SBIconController_observer_noteServerConnectionStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEnabledBadgesSetWithSections:", a2);
}

- (id)allApplicationsForIconModel:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconController applicationController](self, "applicationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBIconController applicationController](self, "applicationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconController applicationPlaceholderController](self, "applicationPlaceholderController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholdersByDisplayID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultIconStateForIconManager:(id)a3
{
  void *v3;
  void *v4;

  if (-[SBIconController hasRestrictedEnforcedLayout](self, "hasRestrictedEnforcedLayout", a3))
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultIconState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)iconManager:(id)a3 defaultAutomaticFavoriteIconIdentifiersWithMaximumCount:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[SBIconController model](self, "model", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafIconIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") > a4)
  {
    objc_msgSend(v8, "subarrayWithRange:", 0, a4);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

- (Class)iconManager:(id)a3 iconClassForApplicationWithBundleIdentifier:(id)a4 proposedClass:(Class)a5
{
  void *v7;
  void *v8;
  int v9;
  void *v10;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDisableLiveIcons");

  if (v9)
  {
    -[SBIconController model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = (Class)objc_msgSend((id)objc_opt_class(), "applicationIconClass");

  }
  return a5;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  _BOOL4 allowsUninstall;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_allowsUninstall = objc_msgSend(a3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F10], a4) != 2;
  SBLogIconController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    allowsUninstall = self->_allowsUninstall;
    v7[0] = 67109120;
    v7[1] = allowsUninstall;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Profile connection settings changed; allowsUninstall: %{BOOL}u",
      (uint8_t *)v7,
      8u);
  }

}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__SBIconController_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke;
  v7[3] = &unk_1E8E9DED8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0D229B0], "eventWithName:handler:", CFSTR("SBIconController-ProfileListChanged-IconModelSelection"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeOrAppendEvent:", v6);

}

uint64_t __87__SBIconController_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIconModelStore");
}

- (void)applicationRestrictionControllerWillPostAppVisibilityUpdate:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (objc_msgSend(a3, "isAllowlistActiveAndTransient") && !self->_isAppAllowlistActiveAndTransient)
  {
    SBLogIconController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "App visibility updates will be treated as transient. Updating icon model store.", v5, 2u);
    }

    self->_isAppAllowlistActiveAndTransient = 1;
    -[SBIconController _updateIconModelStore](self, "_updateIconModelStore");
  }
}

- (void)applicationRestrictionController:(id)a3 didUpdateVisibleTags:(id)a4 hiddenTags:(id)a5
{
  id v7;
  NSSet *v8;
  NSSet *visibleTags;
  NSSet *v10;
  NSSet *hiddenTags;
  id v12;

  v7 = a5;
  v8 = (NSSet *)objc_msgSend(a4, "copy");
  visibleTags = self->_visibleTags;
  self->_visibleTags = v8;

  v10 = (NSSet *)objc_msgSend(v7, "copy");
  hiddenTags = self->_hiddenTags;
  self->_hiddenTags = v10;

  -[SBIconController model](self, "model");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVisibilityOfIconsWithVisibleTags:hiddenTags:", self->_visibleTags, self->_hiddenTags);

}

- (void)applicationRestrictionControllerDidPostAppVisibilityUpdate:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if ((objc_msgSend(a3, "isAllowlistActiveAndTransient") & 1) == 0 && self->_isAppAllowlistActiveAndTransient)
  {
    SBLogIconController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "App visibility updates will no longer be treated as transient. Updating icon model store.", v5, 2u);
    }

    self->_isAppAllowlistActiveAndTransient = 0;
    -[SBIconController _updateIconModelStore](self, "_updateIconModelStore");
  }
}

- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;

  objc_msgSend(a3, "iconAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
          objc_msgSend(v8, "folderCloseSettings");
        else
          objc_msgSend(v8, "folderOpenSettings");
LABEL_9:
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!a4)
        {
          objc_msgSend(v8, "crossfadeLaunchSettings");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        objc_msgSend((id)SBApp, "homeHardwareButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "supportsAcceleratedAppDismiss") & 1) != 0)
          objc_msgSend(v8, "crossfadeAcceleratedSuspendSettings");
        else
          objc_msgSend(v8, "crossfadeSuspendSettings");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = 0;
            goto LABEL_5;
          }
          if (a4)
            objc_msgSend(v8, "libraryPodCloseSettings");
          else
            objc_msgSend(v8, "libraryPodOpenSettings");
          goto LABEL_9;
        }
        if (!a4)
        {
          objc_msgSend(v8, "centerLaunchSettings");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        objc_msgSend((id)SBApp, "homeHardwareButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "supportsAcceleratedAppDismiss") & 1) != 0)
          objc_msgSend(v8, "centerAcceleratedSuspendSettings");
        else
          objc_msgSend(v8, "centerSuspendSettings");
      }
      v13 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v13;

      goto LABEL_5;
    }
  }
  objc_msgSend(v8, "reducedMotionSettings");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v10 = (void *)v9;
LABEL_5:

  return v10;
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0DABD88];
  v14[0] = &unk_1E91D0728;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a5;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 31, v10);

  -[SBIconController iconDragManager](self, "iconDragManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performSpringLoadedInteractionForIconDragOnIconView:", v7);

}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
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
  UIEdgeInsets result;

  -[SBIconController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_contentOverlayInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)iconManager:(id)a3 willCloseFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "suspendsWallpaperAnimationWhileOpen"))
  {
    objc_msgSend(v8, "extraAssertions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("SuspendWallpaperAnimationAssertion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "invalidate");
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("SuspendWallpaperAnimationAssertion"));
    }

  }
  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "noteFolderControllerWillClose:", v8);

}

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBIconController iconManager](self, "iconManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatingDockController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLegibilitySettings:", self->_legibilitySettings);
    -[SBIconController spotlightViewController](self, "spotlightViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBIconController searchPresentableViewController](self, "searchPresentableViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchAffordanceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBIconController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLegibilitySettings:", self->_legibilitySettings);

  }
}

- (double)distanceToTopOfSpotlightIconsForIconManager:(id)a3
{
  void *v4;
  char v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "source") == 6)
  {
    v5 = objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow");

    v6 = 0.0;
    if ((v5 & 1) != 0)
      return v6;
  }
  else
  {

  }
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;

  +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "distanceToTopOfIcons");
  v13 = v12;

  v6 = v10 + v13;
  return v6;
}

- (id)iconManager:(id)a3 backgroundViewForDockForRootFolderController:(id)a4
{
  void *v4;

  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      objc_msgSend((id)SBApp, "homeScreenSupportsRotation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "userInterfaceIdiom"))
      objc_msgSend((id)SBApp, "homeScreenSupportsRotation");

  }
  return 0;
}

- (BOOL)iconManagerCanUseSeparateWindowForRotation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;
  char v12;

  -[SBIconController layoutStateProvider](self, "layoutStateProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unlockedEnvironmentMode");

  if (v6 == 3)
    return 0;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transientOverlayPresentationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasActivePresentation");

  if ((v9 & 1) != 0)
    return 0;
  -[SBIconController coverSheetPresentationManager](self, "coverSheetPresentationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isVisible");

  return v12 ^ 1;
}

- (void)iconManager:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  id v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBarManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStatusBarEdgeInsets:forLayoutLayer:", 0, top, left, bottom, right);

}

void __82__SBIconController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "iconDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage = objc_msgSend(v1, "suppressSetCurrentPage");

  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage)
  {
    SBLogIcon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __82__SBIconController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1();

  }
}

- (BOOL)isIconContentPossiblyVisibleOverApplicationForIconManager:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBIconController layoutStateProvider](self, "layoutStateProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode") == 3;

  return v5;
}

- (id)_createHomeScreenOverlayControllerIfNeeded
{
  SBHomeScreenOverlayController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SBLeftOfHomeAppViewController *v15;
  SBApplicationHosting *leftOfHomeAppViewController;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v3 = (SBHomeScreenOverlayController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBIconController iconManager](self, "iconManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "listLayoutProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SBHomeScreenOverlayController initWithListLayoutProvider:]([SBHomeScreenOverlayController alloc], "initWithListLayoutProvider:", v4);
    -[SBHomeScreenOverlayController setDelegate:](v3, "setDelegate:", self);
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v3, "addHomeScreenOverlayObserver:", self);
    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v3, "addHomeScreenOverlayObserver:", v5);

    -[SBIconController todayViewController](self, "todayViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v3, "addHomeScreenOverlayObserver:", v6);

    -[SBHomeScreenOverlayController setContentVisibility:](v3, "setContentVisibility:", 2);
    -[SBHomeScreenOverlayController viewController](v3, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_addChildViewController:withSuperview:", v7, v9);
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (id)SBHPinViewWithinView();
    -[SBHomeScreenOverlayController dismissTapGestureRecognizer](v3, "dismissTapGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requireGestureRecognizerToFail:", self->_longPressToEditGestureRecognizer);

    -[SBHomeScreenOverlayController dismissTapGestureRecognizer](v3, "dismissTapGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requireGestureRecognizerToFail:", self->_tapToEndEditingGestureRecognizer);

    -[SBIconController todayViewController](self, "todayViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SBLeftOfHomeAppViewController isEnabled](SBLeftOfHomeAppViewController, "isEnabled"))
    {
      v15 = objc_alloc_init(SBLeftOfHomeAppViewController);
      -[SBHomeScreenOverlayController setLeadingSidebarViewController:](v3, "setLeadingSidebarViewController:", v15);
      leftOfHomeAppViewController = self->_leftOfHomeAppViewController;
      self->_leftOfHomeAppViewController = (SBApplicationHosting *)v15;

    }
    else
    {
      -[SBHomeScreenOverlayController setLeadingSidebarViewController:](v3, "setLeadingSidebarViewController:", v14);
    }
    -[SBHomeScreenOverlayController viewController](v3, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContainerViewController:", v17);

    objc_msgSend(v14, "setDismissalDelegate:", v3);
    if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported")
      && !-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
      -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenOverlayController setTrailingSidebarViewController:](v3, "setTrailingSidebarViewController:", v18);
      -[SBHomeScreenOverlayController viewController](v3, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPresenter:", v19);

    }
    -[SBIconController setHomeScreenOverlayController:](self, "setHomeScreenOverlayController:", v3);

  }
  return v3;
}

- (id)_homeScreenOverlayControllerIfNeeded
{
  void *v3;

  if (-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
  {
    v3 = 0;
  }
  else
  {
    -[SBIconController _createHomeScreenOverlayControllerIfNeeded](self, "_createHomeScreenOverlayControllerIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnFirstPageByAmount:(double)a5
{
  void *v7;
  char v8;
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  void *v10;
  double v11;
  NSNumber *v12;
  NSNumber *v13;
  SBHomeScreenOverlayController *homeScreenOverlayController;
  double v15;
  NSNumber *v16;
  id v17;

  -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded", a3, a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBIconController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && (-[SBIconController policyAggregator](self, "policyAggregator"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "allowsCapability:", 23),
        v7,
        (v8 & 1) != 0))
  {
    homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    if (!homeScreenOverlayInitialPresentationProgress)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[SBHomeScreenOverlayController layerPresentationProgress](self->_homeScreenOverlayController, "layerPresentationProgress");
      *(float *)&v11 = v11;
      objc_msgSend(v10, "numberWithFloat:", v11);
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v13 = self->_homeScreenOverlayInitialPresentationProgress;
      self->_homeScreenOverlayInitialPresentationProgress = v12;

      homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    }
    homeScreenOverlayController = self->_homeScreenOverlayController;
    -[NSNumber doubleValue](homeScreenOverlayInitialPresentationProgress, "doubleValue");
    -[SBHomeScreenOverlayController presentationProgressForTranslation:initialPresentationProgress:fromLeading:](homeScreenOverlayController, "presentationProgressForTranslation:initialPresentationProgress:fromLeading:", 1, a5, v15);
    objc_msgSend(v17, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 1, 1, 1, 0);
  }
  else
  {
    v16 = self->_homeScreenOverlayInitialPresentationProgress;
    self->_homeScreenOverlayInitialPresentationProgress = 0;

    objc_msgSend(v17, "setPresentationProgress:fromLeading:", 1, 0.0);
  }

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnFirstPageWithVelocity:(double)a5 translation:(double)a6
{
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  void *v10;
  char v11;
  double v12;
  id v13;

  -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if (-[SBIconController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && (-[SBIconController policyAggregator](self, "policyAggregator"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "allowsCapability:", 23),
        v10,
        (v11 & 1) != 0))
  {
    -[NSNumber doubleValue](self->_homeScreenOverlayInitialPresentationProgress, "doubleValue");
    objc_msgSend(v13, "finalPresentationProgressForTranslation:velocity:initialPresentationProgress:fromLeading:", 1, a6, a5, v12);
    objc_msgSend(v13, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
  }
  else
  {
    objc_msgSend(v13, "setPresentationProgress:fromLeading:", 1, 0.0);
  }

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnLastPageByAmount:(double)a5
{
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  void *v8;
  double v9;
  NSNumber *v10;
  NSNumber *v11;
  SBHomeScreenOverlayController *homeScreenOverlayController;
  double v13;
  NSNumber *v14;
  id v15;

  -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded", a3, a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBIconController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && -[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    if (!homeScreenOverlayInitialPresentationProgress)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[SBHomeScreenOverlayController layerPresentationProgress](self->_homeScreenOverlayController, "layerPresentationProgress");
      *(float *)&v9 = v9;
      objc_msgSend(v8, "numberWithFloat:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_homeScreenOverlayInitialPresentationProgress;
      self->_homeScreenOverlayInitialPresentationProgress = v10;

      homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    }
    homeScreenOverlayController = self->_homeScreenOverlayController;
    -[NSNumber doubleValue](homeScreenOverlayInitialPresentationProgress, "doubleValue");
    -[SBHomeScreenOverlayController presentationProgressForTranslation:initialPresentationProgress:fromLeading:](homeScreenOverlayController, "presentationProgressForTranslation:initialPresentationProgress:fromLeading:", 0, a5, v13);
    objc_msgSend(v15, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 0, 1, 1, 0);
  }
  else
  {
    v14 = self->_homeScreenOverlayInitialPresentationProgress;
    self->_homeScreenOverlayInitialPresentationProgress = 0;

    objc_msgSend(v15, "setPresentationProgress:fromLeading:", 0, 0.0);
  }

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnLastPageWithVelocity:(double)a5 translation:(double)a6
{
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  double v10;
  id v11;

  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if (-[SBIconController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && -[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    -[NSNumber doubleValue](self->_homeScreenOverlayInitialPresentationProgress, "doubleValue");
    objc_msgSend(v11, "finalPresentationProgressForTranslation:velocity:initialPresentationProgress:fromLeading:", 0, a6, a5, v10);
    objc_msgSend(v11, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
  }
  else
  {
    objc_msgSend(v11, "setPresentationProgress:fromLeading:", 0, 0.0);
  }

}

- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4
{
  return -[SBIconController isIconVisibleForBundleIdentifier:](self, "isIconVisibleForBundleIdentifier:", a4);
}

- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4
{
  void *v4;
  void *v5;

  SBWorkspaceApplicationForURLWithError(a4, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)iconManager:(id)a3 wantsLaunchForWidgetURL:(id)a4
{
  id v5;
  SBLockScreenUnlockRequest *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v6, "setSource:", 24);
  -[SBLockScreenUnlockRequest setIntent:](v6, "setIntent:", 3);
  -[SBLockScreenUnlockRequest setName:](v6, "setName:", CFSTR("Launch From Widget Icon Unlock"));
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v6, "setWantsBiometricPresentation:", 1);
  -[SBIconController lockScreenManager](self, "lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBIconController_iconManager_wantsLaunchForWidgetURL___block_invoke;
  v9[3] = &unk_1E8E9E980;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "unlockWithRequest:completion:", v6, v9);

}

uint64_t __56__SBIconController_iconManager_wantsLaunchForWidgetURL___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return SBWorkspaceActivateApplicationFromURL(*(void **)(result + 32), 0, &__block_literal_global_375);
  return result;
}

uint64_t __56__SBIconController_iconManager_wantsLaunchForWidgetURL___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSource:", 1);
}

- (id)iconManager:(id)a3 viewControllerForCustomIcon:(id)a4 element:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  char v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  void *v53;
  NSMutableDictionary *v55;
  NSMutableDictionary *filesWidgetExtensionProviders;
  uint64_t v57;
  id v58;
  NSMutableDictionary *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "gridSizeClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = SBHIconGridSizeClassToStackLayoutSize();

    v15 = objc_alloc(MEMORY[0x1E0CF9618]);
    objc_msgSend(v10, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v15, "initWithIdentifier:suggestionsClient:layoutSize:", v16, v17, v14);

    goto LABEL_5;
  }
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v9, "gridSizeClass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = SBHIconGridSizeClassToStackLayoutSize();

    v23 = -[SBIconController canAppPredictionsWidgetAlignWithGrid](self, "canAppPredictionsWidgetAlignWithGrid") ^ 1;
    v24 = objc_alloc(MEMORY[0x1E0CF9610]);
    objc_msgSend(v9, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v24, "initWithIdentifier:layoutSize:mode:", v25, v22, v23);

    objc_msgSend(v18, "setDelegate:", self);
    objc_msgSend(v8, "listLayoutProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "iconImageInfoForGridSizeClass:", *MEMORY[0x1E0DAA768]);
    v28 = v27;
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "iconContentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = (v31 - v28) * 0.5;

    objc_msgSend(v18, "setParentLayoutInsets:", 0.0, v32, 0.0, v32);
LABEL_5:

    if (v18)
      goto LABEL_28;
    goto LABEL_25;
  }
  objc_opt_self();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_isKindOfClass();

  if ((v34 & 1) != 0)
  {
    v35 = v10;
    v36 = objc_alloc_init(MEMORY[0x1E0DDA108]);
    objc_msgSend(v9, "gridSizeClass");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFamily:", CHSWidgetFamilyForSBHIconGridSizeClass());

    -[SBIconController iconManager](self, "iconManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intentForDataSource:ofIcon:", v35, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      WFCreateShortcutsWidgetConfigurationIntent();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v64);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v64;
      if (!v40)
      {
        SBLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v61;
          -[SBIconController iconManager:viewControllerForCustomIcon:element:].cold.2();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        v42 = v61;
        goto LABEL_17;
      }
LABEL_15:
      -[SBIconController iconManager](self, "iconManager", v61);
      v41 = objc_claimAutoreleasedReturnValue();
      -[SBIconController iconManager:dataSource:ofIcon:didUpdateConfigurationData:](self, "iconManager:dataSource:ofIcon:didUpdateConfigurationData:", v41, v35, v9, v40);
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_opt_isKindOfClass();

  if ((v44 & 1) != 0)
  {
    v35 = v10;
    v36 = objc_alloc_init(MEMORY[0x1E0DDA108]);
    objc_msgSend(v9, "gridSizeClass");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFamily:", CHSWidgetFamilyForSBHIconGridSizeClass());

    -[SBIconController iconManager](self, "iconManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intentForDataSource:ofIcon:", v35, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      WFCreateShortcutsSmallWidgetConfigurationIntent();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v63);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v63;
      if (!v40)
      {
        SBLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v61;
          -[SBIconController iconManager:viewControllerForCustomIcon:element:].cold.3();
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_18:
    objc_msgSend(v36, "setIntent:", v39, v61);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DDA110]), "initWithOptions:", v36);
    goto LABEL_19;
  }
  objc_opt_self();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_opt_isKindOfClass();

  if ((v47 & 1) != 0)
  {
    v35 = v10;
    -[SBIconController iconManager](self, "iconManager");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "intentForDataSource:ofIcon:", v35, v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      DOCCreateDefaultHomeScreenWidgetIntent();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v38, 1, &v62);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v62;
      if (v48)
      {
        -[SBIconController iconManager](self, "iconManager");
        v50 = objc_claimAutoreleasedReturnValue();
        -[SBIconController iconManager:dataSource:ofIcon:didUpdateConfigurationData:](self, "iconManager:dataSource:ofIcon:didUpdateConfigurationData:", v50, v35, v9, v48);
      }
      else
      {
        SBLogCommon();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[SBIconController iconManager:viewControllerForCustomIcon:element:].cold.4();
      }

    }
    if (!self->_filesWidgetExtensionProviders)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v55 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
      self->_filesWidgetExtensionProviders = v55;

    }
    objc_msgSend(v35, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_filesWidgetExtensionProviders, "objectForKey:", v39);
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = (id)v57;
      objc_msgSend(MEMORY[0x1E0C99E08], "cancelPreviousPerformRequestsWithTarget:selector:object:", self->_filesWidgetExtensionProviders, sel_removeObjectForKey_, v39);
    }
    else
    {
      v58 = objc_alloc_init(MEMORY[0x1E0DAA450]);
      v59 = self->_filesWidgetExtensionProviders;
      objc_msgSend(v35, "uniqueIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v58, v60);

    }
    objc_msgSend(v58, "filesWidgetViewControllerWithConfiguration:", v38);
    v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
    if (v18)
      goto LABEL_28;
  }
LABEL_25:
  SBLogCommon();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    -[SBIconController iconManager:viewControllerForCustomIcon:element:].cold.1((uint64_t)v10, v51);

  v52 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "cyanColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setBackgroundColor:", v53);

  v18 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  objc_msgSend(v18, "setView:", v52);

LABEL_28:
  return v18;
}

- (BOOL)iconManager:(id)a3 shouldCacheRecentViewController:(id)a4 forIdentifier:(id)a5
{
  NSMutableDictionary *filesWidgetExtensionProviders;
  id v6;
  void *v7;
  char v8;

  filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
  v6 = a5;
  -[NSMutableDictionary allKeys](filesWidgetExtensionProviders, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8 ^ 1;
}

- (void)iconManager:(id)a3 willRemoveViewControllerForIdentifier:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_filesWidgetExtensionProviders, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableDictionary performSelector:withObject:afterDelay:](self->_filesWidgetExtensionProviders, "performSelector:withObject:afterDelay:", sel_removeObjectForKey_, v6, 10.0);

}

- (id)fallbackDefaultFirstPageWidgetsForIconManager:(id)a3
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = (id *)MEMORY[0x1E0DAA770];
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v5 = (id *)MEMORY[0x1E0DAA7A0];
  v6 = *v5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = objc_alloc(MEMORY[0x1E0DAA678]);
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v10 = (void *)objc_msgSend(v9, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CE440, &unk_1E91CE458, &unk_1E91CE440);
    objc_msgSend(v10, "setGridSizeClass:", v6);
    v11 = objc_alloc(MEMORY[0x1E0DAA678]);
    v19[0] = CFSTR("com.apple.weather");
    v19[1] = CFSTR("com.apple.reminders.widget");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CE470, v13, &unk_1E91CE488);

    v15 = v14;
  }
  else
  {
    v10 = (void *)objc_msgSend(v9, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CE4E8, &unk_1E91CE500, &unk_1E91CE518);
    objc_msgSend(v10, "setGridSizeClass:", v6);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CE4A0, &unk_1E91CE4B8, &unk_1E91CE4D0);
    v14 = v15;
  }
  objc_msgSend(v15, "setGridSizeClass:", v6);
  v18[0] = v10;
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)iconManager:(id)a3 willAddDefaultFirstPageWidgetsBasedOnPinnedWidgets:(id)a4 suggestionWidgets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  SBWidgetOnboardingLayoutBuilder *v19;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  int v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWidgetDiscoverability();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic", (uint8_t *)&v24, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v15 = -[SBIconController userIconStateFileStatus](self, "userIconStateFileStatus");
    SBLogWidgetDiscoverability();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 67109120;
      LODWORD(v25) = v15 == 1;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic isDefaultIconState(%d)", (uint8_t *)&v24, 8u);
    }

    if ((unint64_t)objc_msgSend(v10, "count") <= 1)
    {
      -[SBIconController fallbackDefaultFirstPageWidgetsForIconManager:](self, "fallbackDefaultFirstPageWidgetsForIconManager:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v18;
    }
    v19 = -[SBWidgetOnboardingLayoutBuilder initWithPinnedWidgets:suggestionWidgets:]([SBWidgetOnboardingLayoutBuilder alloc], "initWithPinnedWidgets:suggestionWidgets:", v9, v10);
    -[SBWidgetOnboardingLayoutBuilder migratedDefaultWidgets:](v19, "migratedDefaultWidgets:", v15 == 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    SBLogWidgetDiscoverability();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = CFSTR("upgrade");
      v24 = 138412802;
      if (v15 == 1)
        v22 = CFSTR("erase");
      v25 = v22;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Migration pinned widgets with %@ install \n PinnedWidgets = %@ \n SuggestionWidgets = %@", (uint8_t *)&v24, 0x20u);
    }

    v11 = v19;
  }
  else
  {
    v20 = v10;
    v10 = v20;
  }

  return v20;
}

- (BOOL)iconManagerShouldShowWidgetIntroductionPopoverForDefaultWidgets:(id)a3
{
  return (objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode", a3) & 1) == 0
      && -[SBIconController userIconStateFileStatus](self, "userIconStateFileStatus") == 2;
}

- (id)widgetIntroductionPreviewViewForIconManager:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBHomeScreenPreviewView *v11;
  void *v12;
  SBHomeScreenPreviewView *v13;
  void *v14;
  SBViewSnapshotProvider *v15;
  id v16;
  void *v17;
  void *v18;

  v4 = -[SBIconController interfaceOrientationForIconManager:](self, "interfaceOrientationForIconManager:", a3);
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  SBScreenBounds(v4);
  v8 = v7;
  v10 = v9;
  v11 = [SBHomeScreenPreviewView alloc];
  -[SBIconController iconManager](self, "iconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v11, "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v12, 0, 0, 0, 0, v5, v6, v8, v10);

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBViewSnapshotProvider initWithWindowScene:view:orientation:]([SBViewSnapshotProvider alloc], "initWithWindowScene:view:orientation:", v14, v13, v4);
  v16 = objc_alloc(MEMORY[0x1E0DAA630]);
  -[SBViewSnapshotProvider snapshot](v15, "snapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithPreview:withSnapshot:", v13, v17);

  return v18;
}

- (void)iconManagerDidAddOrRemoveWidgetIcon:(id)a3
{
  id v4;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

- (int64_t)iconManagerListsFixedIconLocationBehavior:(id)a3
{
  return 4;
}

- (BOOL)iconManagerAppliesListsFixedIconLocationBehaviorOnlyToNewLists:(id)a3
{
  return 1;
}

- (void)iconManagerPreferredProminentPosterColor:(id)a3 handler:(id)a4
{
  if (a4)
    -[SBWallpaperIconStyleCoordinator fetchWallpaperProminentColor:](self->_iconStyleCoordinator, "fetchWallpaperProminentColor:", a4);
}

- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  __int16 v16;
  __int16 v17;

  v7 = a3;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
  v9 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if ((v9 & 1) == 0)
    -[SBTodayViewController resetForSpotlightDismissalAnimated:](self->_todayViewController, "resetForSpotlightDismissalAnimated:", 1);
  -[SBIconController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 1, 1);
  v10 = objc_msgSend(v7, "pageState");

  if (SBRootFolderPageStateIsSearch())
  {
    -[SBIconController iconManager](self, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isShowingModalInteraction"))
      objc_msgSend(v11, "dismissModalInteractionsImmediately");

  }
  if (v10 == 2)
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayLayoutElementActive:", 1);
    objc_msgSend(v12, "setNeedsFocusUpdate");

  }
  if ((v9 & SBRootFolderPageStateIsOnIconPage()) == 1)
  {
    SBLogTelemetrySignposts();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v17 = 0;
      v14 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      v15 = (uint8_t *)&v17;
LABEL_18:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v14, " enableTelemetry=YES  isAnimation=YES ", v15, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    SBLogTelemetrySignposts();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v16 = 0;
      v14 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      v15 = (uint8_t *)&v16;
      goto LABEL_18;
    }
LABEL_19:

    kdebug_trace();
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5
{
  void *v6;
  id v7;

  if (a4 == 1)
  {
    -[SBIconController searchPresentableViewController](self, "searchPresentableViewController", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRevealProgress:", a5);

    }
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  int64_t v11;
  int IsSearch;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  __int16 v23;
  __int16 v24;

  v6 = a6;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
  if (v6)
    v11 = a5;
  else
    v11 = a4;
  IsSearch = SBRootFolderPageStateIsSearch();
  if (IsSearch)
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deactivateReachability");

  }
  if (a4 == 3 && a5 == 2)
  {
    -[SBTodayViewController transitionContext](self->_todayViewController, "transitionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[SBTodayViewController resetForSpotlightDismissalAnimated:](self->_todayViewController, "resetForSpotlightDismissalAnimated:", 0);
      -[SBTodayViewController setTransitionContext:](self->_todayViewController, "setTransitionContext:", 0);
    }
  }
  if (IsSearch)
  {
    -[SBIconController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 1, 1);
    -[SBIconController suspendWallpaperAnimationForSpotlightAssertion](self, "suspendWallpaperAnimationForSpotlightAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "suspendWallpaperAnimationForReason:", CFSTR("SBIconControllerSuspendingWallpaperForSpotlightReason"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController setSuspendWallpaperAnimationForSpotlightAssertion:](self, "setSuspendWallpaperAnimationForSpotlightAssertion:", v17);

  }
  else
  {
    -[SBIconController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 1, 1);
    if (SBRootFolderPageStateIsSearch())
    {
      -[SBIconController suspendWallpaperAnimationForSpotlightAssertion](self, "suspendWallpaperAnimationForSpotlightAssertion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "invalidate");

      -[SBIconController setSuspendWallpaperAnimationForSpotlightAssertion:](self, "setSuspendWallpaperAnimationForSpotlightAssertion:", 0);
    }
  }
  if (v11 == 2)
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisplayLayoutElementActive:", 1);
    objc_msgSend(v19, "setNeedsFocusUpdate");

  }
  if (SBRootFolderPageStateIsOnIconPage() && SBRootFolderPageStateIsOnLeadingCustomPage())
  {
    SBLogTelemetrySignposts();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      v24 = 0;
      v21 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      v22 = (uint8_t *)&v24;
LABEL_26:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v21, " enableTelemetry=YES  isAnimation=YES ", v22, 2u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    SBLogTelemetrySignposts();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      v23 = 0;
      v21 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      v22 = (uint8_t *)&v23;
      goto LABEL_26;
    }
LABEL_27:

    kdebug_trace();
  }
}

- (id)rootFolderController:(id)a3 transitionContextForTransitioningToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t IsSearch;
  uint64_t v14;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = objc_msgSend(v10, "pageState");
  objc_msgSend(v10, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (a4 == 3 || v11 == 3)
    {
      IsSearch = SBRootFolderPageStateIsSearch();
      goto LABEL_9;
    }
    return 0;
  }
  if ((SBRootFolderPageStateIsSearch() & 1) == 0)
  {
    if (SBRootFolderPageStateIsSearch())
    {
      IsSearch = 0;
      goto LABEL_9;
    }
    return 0;
  }
  IsSearch = 1;
LABEL_9:
  if ((SBRootFolderPageStateIsOnLeadingCustomPage() & 1) != 0)
    v14 = 1;
  else
    v14 = SBRootFolderPageStateIsOnLeadingCustomPage();
  -[SBIconController transitionContextToShowSpotlight:fromTodayView:animated:interactive:](self, "transitionContextToShowSpotlight:fromTodayView:animated:interactive:", IsSearch, v14, v7, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transitionContextToShowSpotlight:(BOOL)a3 fromTodayView:(BOOL)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  SBSpotlightTransitionAnimator *v15;
  _BOOL4 v16;
  SBSpotlightTransitionInteractor *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  SBSpotlightTransitionAnimator *v28;
  _BOOL4 v29;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = (id)*MEMORY[0x1E0CEBDB8];
  v12 = (id)*MEMORY[0x1E0CEBDC0];
  if (!a3)
  {
    v13 = (id)*MEMORY[0x1E0CEBDA8];

    v14 = (id)*MEMORY[0x1E0CEBDB0];
    v12 = v14;
    v11 = v13;
  }
  v29 = v7;
  v27 = v12;
  if (v7)
  {
    v15 = objc_alloc_init(SBSpotlightTransitionAnimator);
    v28 = v15;
    v16 = v8;
    if (v6)
      v17 = -[SBSpotlightTransitionInteractor initWithAnimator:]([SBSpotlightTransitionInteractor alloc], "initWithAnimator:", v15);
    else
      v17 = 0;
  }
  else
  {
    v16 = v8;
    v17 = 0;
    v28 = 0;
  }
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController spotlightViewController](self, "spotlightViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  objc_msgSend(v21, "setFrame:");
  v22 = objc_alloc_init(MEMORY[0x1E0DAA670]);
  objc_msgSend(v18, "searchableLeadingCustomWrapperView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContainerView:", v23);

  if (v16)
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v22, "setViewController:forKey:", v24, CFSTR("SBSpotlightInitiatingViewControllerKey"));
  }
  else
  {
    objc_msgSend(v18, "headerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v22, "setView:forKey:", v24, CFSTR("SBSpotlightSearchHeaderViewKey"));
  }

  objc_msgSend(v22, "setViewController:forKey:", v20, v11);
  objc_msgSend(v22, "setView:forKey:", v21, v27);
  objc_msgSend(v18, "searchBackdropView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setView:forKey:", v25, CFSTR("SBSpotlightSearchBackdropViewKey"));

  objc_msgSend(v22, "setAnimator:", v28);
  objc_msgSend(v22, "setInteractor:", v17);
  objc_msgSend(v22, "setWantsAnimation:", v29);

  return v22;
}

- (void)popToCurrentRootIconListWhenPossible
{
  void *v3;

  -[SBIconController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popToCurrentRootIconListWhenPossible");

  -[SBIconController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 0);
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  id v3;

  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isShowingModalInteraction"))
    objc_msgSend(v3, "dismissModalInteractions");
  objc_msgSend(v3, "dismissIconContextMenu");

}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  _BOOL4 v6;
  double v8;
  double v9;
  int v10;
  SBFloatingDockBehaviorAssertion *homeScreenOverlayFloatingDockBehaviorAssertion;
  void *v12;
  void *v13;
  SBFloatingDockBehaviorAssertion *v14;
  SBFloatingDockBehaviorAssertion *v15;
  uint64_t v16;
  SBFloatingDockBehaviorAssertion *v17;
  _BOOL4 v18;
  void *v19;
  id v20;

  v6 = a6;
  objc_msgSend(a3, "presentationProgress");
  v9 = v8;
  v10 = BSFloatGreaterThanFloat();
  homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
  if (v10)
  {
    if (!homeScreenOverlayFloatingDockBehaviorAssertion)
    {
      -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatingDockController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v13, 1, 1, 4, CFSTR("homeScreenOverlay"), 0, 1.0 - v9);
      v15 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
      self->_homeScreenOverlayFloatingDockBehaviorAssertion = v14;

    }
    if ((BSFloatIsZero() & 1) != 0)
      v16 = 0;
    else
      v16 = BSFloatIsOne() ^ 1;
    -[SBFloatingDockBehaviorAssertion modifyProgress:interactive:completion:](self->_homeScreenOverlayFloatingDockBehaviorAssertion, "modifyProgress:interactive:completion:", v16, 0, 1.0 - v9);
  }
  else
  {
    -[SBFloatingDockBehaviorAssertion invalidate](homeScreenOverlayFloatingDockBehaviorAssertion, "invalidate");
    v17 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;

  }
  v18 = v9 < 1.0 && v9 > 0.0;
  -[SBIconController iconManager](self, "iconManager");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOverlayTodayViewVisible:todayViewTransitioning:", v10 & v6, v18 & v6);
  -[SBHomeScreenOverlayController trailingSidebarViewController](self->_homeScreenOverlayController, "trailingSidebarViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v20, "setMainDisplayLibraryViewVisible:libraryViewTransitioning:", v10 & !v6, v18 && !v6);
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsZero())
    -[SBHomeScreenOverlayController updateExtraButtonVisibilityAnimated:](self->_homeScreenOverlayController, "updateExtraButtonVisibilityAnimated:", 0);

}

- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  SBFloatingDockBehaviorAssertion *homeScreenOverlayFloatingDockBehaviorAssertion;
  void *v8;
  id v9;

  v4 = a4;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController setWallpaperAnimationDisabled:forReason:](self, "setWallpaperAnimationDisabled:forReason:", v4, v6);

  if (!v4)
  {
    -[SBFloatingDockBehaviorAssertion invalidate](self->_homeScreenOverlayFloatingDockBehaviorAssertion, "invalidate");
    homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;

  }
  -[SBHomeScreenOverlayController updateExtraButtonVisibilityAnimated:](self->_homeScreenOverlayController, "updateExtraButtonVisibilityAnimated:", 0);
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuppressesExtraEditingButtons:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

}

- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayController:(id)a3
{
  return 0;
}

- (void)homeScreenOverlayWantsToEndEditing:(id)a3
{
  id v3;

  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

}

- (void)homeScreenOverlayWantsWidgetEditingViewControllerPresented:(id)a3
{
  void *v4;
  id v5;

  -[SBIconController _rootFolderController](self, "_rootFolderController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayController viewController](self->_homeScreenOverlayController, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentWidgetEditingViewControllerFromViewController:", v4);

}

- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "activeSidebarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "activeSidebarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overlayTodayViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6 == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayController:(id)a3
{
  void *v3;
  char v4;

  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsDoneButtonWhileEditing");

  return v4;
}

- (BOOL)isEditingForHomeScreenOverlayController:(id)a3
{
  void *v3;
  char v4;

  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  return v4;
}

- (void)homeScreenOverlayController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[SBIconController todayViewController](self, "todayViewController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuppressesEditingStateForListViews:", v4);
  -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuppressesEditingStateForListViews:", v4);

}

- (id)homeScreenOverlayController:(id)a3 displayLayoutIdentifierForSidebarViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  id v12;

  v6 = a4;
  -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v11 = (id *)MEMORY[0x1E0DAB648];
  }
  else
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6
      || v6
      && (-[SBIconController leftOfHomeAppViewController](self, "leftOfHomeAppViewController"),
          v9 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          v9 == v6))
    {
      v11 = (id *)MEMORY[0x1E0DAB6B0];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 4548, CFSTR("unexpected sidebar view controller: %@"), v6);

      v11 = (id *)MEMORY[0x1E0DAB668];
    }
  }
  v12 = *v11;

  return v12;
}

- (void)handleSpotlightPresentationFromViewController:(id)a3
{
  id v3;

  -[SBIconController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTransitioningPageState") & 1) == 0)
    objc_msgSend(v3, "presentSpotlightAnimated:completionHandler:", 1, 0);

}

- (void)handleSpotlightDismissalFromViewController:(id)a3
{
  id v3;

  -[SBIconController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTransitioningPageState") & 1) == 0)
    objc_msgSend(v3, "dismissSpotlightAnimated:completionHandler:", 1, 0);

}

- (unint64_t)defaultSearchViewPresentationSourceForViewController:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[SBIconController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pageState");
  v5 = objc_msgSend(v3, "destinationPageState");
  if (objc_msgSend(v3, "presentationSource"))
  {
    v6 = objc_msgSend(v3, "presentationSource");
  }
  else if (v5 == 3 || v4 == 3)
  {
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)todayViewWantsToEndEditing:(id)a3
{
  id v3;

  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

}

- (void)todayViewControllerWillPresentSpotlight:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

  -[SBIconController iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissModalInteractionsImmediately");

}

- (void)todayViewDidAppear:(id)a3
{
  id v3;

  -[SBIconController proactiveUsageObserver](self, "proactiveUsageObserver", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logTodayViewDidAppear");

}

- (BOOL)isTodayViewRotating:(id)a3
{
  return self->_rotating;
}

- (void)todayViewControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SBIconController todayViewDisplayLayoutAssertion](self, "todayViewDisplayLayoutAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingSidebarViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v17)
    {
      v4 = 0;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v8 = (void *)objc_msgSend(v7, "initWithIdentifier:", *MEMORY[0x1E0DAB6B0]);
      objc_msgSend(v17, "listView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "level");
      objc_msgSend(v8, "setLevel:", (uint64_t)v11);

      objc_msgSend(v8, "setLayoutRole:", 6);
      objc_msgSend(v17, "listView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v13, "_convertRectToSceneReferenceSpace:");
      objc_msgSend(v8, "setReferenceFrame:");
      objc_msgSend(v17, "_sbWindowScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayLayoutPublisher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addElement:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBIconController setTodayViewDisplayLayoutAssertion:](self, "setTodayViewDisplayLayoutAssertion:", v4);
    }
  }
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHomeAffordanceInteractionAllowed:", 0);

}

- (void)todayViewControllerDidDisappear:(id)a3
{
  void *v4;
  id v5;

  -[SBIconController todayViewDisplayLayoutAssertion](self, "todayViewDisplayLayoutAssertion", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  -[SBIconController setTodayViewDisplayLayoutAssertion:](self, "setTodayViewDisplayLayoutAssertion:", 0);
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeAffordanceInteractionAllowed:", 1);

}

- (void)activateTodayViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minimumPageIndex");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SBIconController_activateTodayViewWithCompletion___block_invoke;
  v8[3] = &unk_1E8EA02D8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "setCurrentPageIndex:animated:completion:", v6, 1, v8);

}

void __52__SBIconController_activateTodayViewWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_homeScreenOverlayControllerIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SBIconController_activateTodayViewWithCompletion___block_invoke_2;
  v3[3] = &unk_1E8E9F1C0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setPresentationProgress:interactive:animated:completionHandler:", 0, 1, v3, 1.0);

}

uint64_t __52__SBIconController_activateTodayViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)searchPresentablesForPresenter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[SBIconController searchPresentableViewController](self, "searchPresentableViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBIconController searchPresentableViewController](self, "searchPresentableViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)displayConfigurationForPresenter:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sbDisplayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)searchTopOffsetForSearchPresenter:(id)a3
{
  double v3;

  objc_msgSend(a3, "interactivePresentationMetrics");
  return -v3;
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  -[SBIconController policyAggregator](self, "policyAggregator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCapability:", 9);

  if (v5)
  {
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if ((objc_msgSend(v6, "canTransitionPageStateToState:", 1) & 1) == 0)
    {
      LOBYTE(v8) = 0;
      goto LABEL_8;
    }
    v8 = objc_msgSend(v6, "isScrolling") ^ 1;
LABEL_8:

    return v8;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SBIconController _rootFolderController](self, "_rootFolderController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollingDisabled:forReason:", 1, CFSTR("SBIconControllerDisableScrollingForSearchPresentationReason"));
  v6 = objc_opt_class();
  objc_msgSend(v5, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      -[SBIconController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "setPageControlAlpha:", 0.0);
    }
    -[SBIconController scrollAccessoryBorrowedForSearchPresentationAssertion](self, "scrollAccessoryBorrowedForSearchPresentationAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "borrowScrollAccessoryForReason:", CFSTR("SearchPresentation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController setScrollAccessoryBorrowedForSearchPresentationAssertion:](self, "setScrollAccessoryBorrowedForSearchPresentationAssertion:", v11);

    }
  }
  -[SBIconController searchPresentableViewController](self, "searchPresentableViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bringSubviewToFront:", v13);

  -[SBIconController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isValid");
  SBLogRootController();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((v16 & 1) != 0)
  {
    if (v18)
    {
      _SBFLoggingMethodProem();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v24, 0xCu);

    }
  }
  else
  {
    if (v18)
    {
      _SBFLoggingMethodProem();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v20;
      v26 = 1026;
      v27 = v15 == 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v24,
        0x12u);

    }
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "beginPageStateTransitionToState:reason:animated:interactive:", 1, CFSTR("SBIconController-SearchPresenter-Present"), 1, 1);
    v22 = objc_claimAutoreleasedReturnValue();

    -[SBIconController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", v22);
    -[SBIconController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", 1);
    v15 = (void *)v22;
  }
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHomeAffordanceInteractionAllowed:", 0);

}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SBIconController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTransitionSuccessfully:", -[SBIconController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 1);
  SBLogRootController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v7, 0xCu);

  }
  -[SBIconController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", 0);
  -[SBIconController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", -1);

}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBIconController _rootFolderController](self, "_rootFolderController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollingDisabled:forReason:", 0, CFSTR("SBIconControllerDisableScrollingForSearchPresentationReason"));
  -[SBIconController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");
  SBLogRootController();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      _SBFLoggingMethodProem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    if (v9)
    {
      _SBFLoggingMethodProem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 1026;
      v18 = v6 == 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v15,
        0x12u);

    }
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginPageStateTransitionToState:reason:animated:interactive:", 0, CFSTR("SBIconController-SearchPresenter-Dismiss"), 1, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    -[SBIconController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", v13);
    -[SBIconController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", 0);
    v6 = (void *)v13;
  }
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHomeAffordanceInteractionAllowed:", 1);

}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBIconController scrollAccessoryBorrowedForSearchPresentationAssertion](self, "scrollAccessoryBorrowedForSearchPresentationAssertion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SBIconController setScrollAccessoryBorrowedForSearchPresentationAssertion:](self, "setScrollAccessoryBorrowedForSearchPresentationAssertion:", 0);
  v5 = objc_opt_class();
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      -[SBIconController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "setPageControlAlpha:", 1.0);
    }
  }
  -[SBIconController searchPresentableViewController](self, "searchPresentableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  -[SBIconController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endTransitionSuccessfully:", -[SBIconController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 0);
  SBLogRootController();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v15, 0xCu);

  }
  -[SBIconController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", 0);
  -[SBIconController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", -1);

}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
  id v3;

  -[SBIconController searchPresenter](self, "searchPresenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissSearchAnimated:", 1);

}

- (id)searchAffordanceViewForSpotlightPresentableViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL IsReduceMotionEnabled;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[SBIconController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (!v5 || !v4)
  {
LABEL_8:

    goto LABEL_9;
  }
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

  if (!IsReduceMotionEnabled)
  {
    objc_msgSend(MEMORY[0x1E0DAA520], "searchPillViewWithSystemDefaultBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legibilitySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", v8);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSearchAffordanceTap);
    objc_msgSend(v6, "addGestureRecognizer:", v5);
    objc_msgSend(v6, "setSearchAffordanceReferenceView:", v4);
    v9 = -[SBIconController _newSearchPillBackgroundView](self, "_newSearchPillBackgroundView");
    objc_msgSend(v6, "setSearchAffordanceReferenceBackgroundView:", v9);

    v10 = objc_opt_class();
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "scalingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSearchAffordanceReferenceContainerView:", v14);

    }
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
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

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA660]), "initWithFrame:style:", 3, v5, v7, v9, v11);
  objc_msgSend(v12, "prepareForTransitionToBlurred:", 1);
  return v12;
}

- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3
{
  return 1;
}

- (void)_handleSearchAffordanceTap
{
  id v2;

  -[SBIconController searchPresenter](self, "searchPresenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "presentationState"))
    objc_msgSend(v2, "presentSearchAnimated:", 1);

}

- (id)_newSearchPillBackgroundView
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", 0);
  objc_msgSend(v2, "setGroupName:", CFSTR("WallpaperCaptureGroup"));
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setGroupNamespace:", *MEMORY[0x1E0CD2958]);
  return v2;
}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  double v6;
  id v8;

  v6 = a3;
  if (-[SBIconController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState", a6, a3, a4, a5) != 1)v6 = 1.0 - v6;
  -[SBIconController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransitionProgress:", v6);

}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  unint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  if (!a4)
    return 0;
  v8 = -[SBIconController searchPresenterOutstandingAnimationCount](self, "searchPresenterOutstandingAnimationCount");
  if (a3 != 1 && !v8)
    *a5 = 1;
  -[SBIconController setSearchPresenterOutstandingAnimationCount:](self, "setSearchPresenterOutstandingAnimationCount:", v8 + 1);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__SBIconController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
  v11[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v12, &location);
  v9 = (void *)MEMORY[0x1D17E5550](v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v9;
}

void __95__SBIconController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSearchPresenterOutstandingAnimationCount:", objc_msgSend(WeakRetained, "searchPresenterOutstandingAnimationCount") - 1);

}

- (id)_identifierForSearchPresenter
{
  return CFSTR("HomeScreen");
}

- (void)dismissSearchView
{
  id v2;

  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isTransitioningPageState") & 1) == 0)
    objc_msgSend(v2, "dismissSpotlightAnimated:completionHandler:", 1, 0);

}

- (void)dismissAppIconForceTouchControllers:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DAA4C8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAppIconForceTouchControllers:", v4);

}

- (BOOL)areAnyIconViewContextMenusAnimating
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAnyIconViewContextMenusAnimating");

  return v3;
}

- (BOOL)isAnySearchVisibleOrTransitioning
{
  void *v2;
  char v3;

  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnySearchVisibleOrTransitioning");

  return v3;
}

- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DAA4C8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAfterContextMenuAnimationsHaveCompleted:", v4);

}

- (void)earlyTerminateAnyContextMenuAnimations
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "earlyTerminateAnyContextMenuAnimations");

}

- (BOOL)_isHostedByCoverSheet
{
  void *v2;
  char v3;

  -[SBIconController coverSheetPresentationManager](self, "coverSheetPresentationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCoverSheetHostingUnlockedEnvironmentWindows");

  return v3;
}

- (BOOL)_shouldHideAppIconForceTouchInfoForApplication:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBlockedForScreenTimeExpiration");

  return v4;
}

- (id)iconManager:(id)a3 applicationShortcutItemsForIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  SBForceTouchAppIconInfoProvider *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  SBForceTouchAppIconInfoProvider *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  char v47;
  char v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  int v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  char v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  BOOL v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  SBIconController *v77;
  _QWORD v78[4];
  SBForceTouchAppIconInfoProvider *v79;
  uint8_t buf[4];
  SBIconController *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEditingAllowedForIconView:", v7);
  if ((_DWORD)v10)
  {
    if (-[SBIconController isOnlyHideSuggestionSupportedForIcon:inLocation:](self, "isOnlyHideSuggestionSupportedForIcon:inLocation:", v8, v9))
    {
      v11 = -[SBIconController isHideSuggestionSupportedForIconView:inLocation:](self, "isHideSuggestionSupportedForIconView:inLocation:", v7, v9);
    }
    else if (-[SBIconController isHideSupportedForIcon:inLocation:](self, "isHideSupportedForIcon:inLocation:", v8, v9))
    {
      v11 = 2;
    }
    else if (-[SBIconController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v8))
    {
      v11 = 3;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  v77 = self;
  if (objc_msgSend(v8, "isApplicationIcon"))
  {
    objc_msgSend(v8, "application");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationPlaceholder");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      v66 = v9;
      v63 = (void *)v13;
      v64 = v11;
      v15 = -[SBIconController _shouldHideAppIconForceTouchInfoForApplication:](self, "_shouldHideAppIconForceTouchInfoForApplication:", v12);
      objc_msgSend(v12, "bundleIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_recentAppLayoutsController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (void *)v16;
      objc_msgSend(v18, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", v16, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v19, "count");

      v60 = objc_msgSend(v6, "isIconIgnored:", v8);
      v20 = (void *)MEMORY[0x1E0CF9688];
      objc_msgSend(v8, "applicationBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "applicationWithBundleIdentifier:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v72 = v15;
      if (!v15)
        v23 = objc_msgSend(v22, "isLocked") ^ 1;
      v59 = (void *)MEMORY[0x1E0DAA478];
      objc_msgSend(v8, "displayName");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v69 = 0;
      }
      else
      {
        objc_msgSend(v12, "info");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "staticApplicationShortcutItems");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67 = v7;
      v68 = v6;
      v65 = v10;
      v71 = v22;
      v61 = v23;
      if (v23)
      {
        objc_msgSend(v12, "dynamicApplicationShortcutItems");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v58 = 0;
      }
      objc_msgSend(v12, "info");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "itemID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "unsignedIntegerValue");
      objc_msgSend(v12, "info");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "supportsMultiwindow");
      v47 = objc_msgSend(v12, "isSystemApplication");
      v48 = objc_msgSend(v12, "isInternalApplication");
      objc_msgSend(v12, "info");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE5(v55) = v65;
      BYTE4(v55) = v60;
      BYTE3(v55) = objc_msgSend(v49, "isBeta");
      BYTE2(v55) = v48;
      BYTE1(v55) = v47;
      LOBYTE(v55) = v46;
      objc_msgSend(v59, "composedShortcutsForApplicationWithBundleIdentifier:iconDisplayName:staticItems:dynamicItems:applicationItemID:numberOfDisplayItemsInSwitcher:supportsMultipleWindows:isSystemApplication:isInternalApplication:isApplicationInBeta:isApplicationHidden:iconManagerAllowsEditing:removeStyle:", v75, v74, v69, v58, v44, v62, v55, v64);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      v7 = v67;
      v6 = v68;
      v9 = v66;
      v14 = v63;
      v41 = v71;
      if (!v72)
      {

      }
    }
    else
    {
      if (!v13)
      {
        v27 = 0;
        goto LABEL_31;
      }
      -[SBIconController applicationPlaceholderController](self, "applicationPlaceholderController");
      v34 = v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "placeholdersByDisplayID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = (unint64_t)objc_msgSend(v36, "count") > 1;

      LOBYTE(v35) = objc_msgSend(v34, "canBeShared");
      v76 = (void *)MEMORY[0x1E0DAA478];
      objc_msgSend(v8, "applicationBundleID");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v70 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "applicationItemID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v74, "unsignedIntegerValue");
      LOBYTE(v56) = (_BYTE)v35;
      v14 = v34;
      LOBYTE(v55) = v10;
      v39 = v76;
      v75 = (void *)v37;
      v40 = v37;
      v41 = (void *)v70;
      objc_msgSend(v39, "composedShortcutsForDownloadingApplicationWithBundleIdentifier:iconDisplayName:applicationItemID:canModifyDownloadState:prioritizationIsAvailable:downloadingInformationAgent:iconManagerAllowsEditing:removeStyle:canShare:", v40, v70, v38, 1, v73, v34, v55, v11, v56);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_31:
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "isBookmarkIcon"))
  {
    v24 = (void *)MEMORY[0x1E0DAA478];
    v25 = v8;
    objc_msgSend(v25, "displayName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "composedShortcutsForBookmarkIcon:withDisplayName:iconManagerAllowsEditing:removeStyle:", v25, v26, v10, v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }
  if (objc_msgSend(v8, "isFolderIcon"))
  {
    v28 = objc_alloc_init(SBForceTouchAppIconInfoProvider);
    v29 = (void *)MEMORY[0x1E0DAA478];
    -[SBIconController iconManager](self, "iconManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "iconImageCache");
    v31 = v11;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __68__SBIconController_iconManager_applicationShortcutItemsForIconView___block_invoke;
    v78[3] = &unk_1E8EA6610;
    v79 = v28;
    v33 = v28;
    objc_msgSend(v29, "composedShortcutsForFolderIcon:iconImageCache:iconManagerAllowsEditing:removeStyle:badgeViewGenerator:", v8, v32, v10, v31, v78);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v8, "isWidgetIcon"))
    {
      v27 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v7, "customIconImageViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_opt_respondsToSelector();

    if ((v51 & 1) != 0)
    {
      objc_msgSend(v7, "customIconImageViewController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "applicationShortcutItems");
      v33 = (SBForceTouchAppIconInfoProvider *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DAA478], "composedShortcutsForWidgetIcon:additionalApplicationShortcutItems:widgetIconSupportsConfiguration:iconManagerAllowsEditing:widgetSettings:", v8, v33, objc_msgSend(v7, "supportsConfigurationCard"), v10, self->_widgetSettings);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_40:
  SBLogIcon();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v81 = v77;
    v82 = 2114;
    v83 = v27;
    _os_log_impl(&dword_1D0540000, v53, OS_LOG_TYPE_DEFAULT, "%p: iconManager:applicationShortcutItemsForIconView: %{public}@", buf, 0x16u);
  }

  return v27;
}

id __68__SBIconController_iconManager_applicationShortcutItemsForIconView___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA5B8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "configureForIcon:infoProvider:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

- (BOOL)iconManager:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5 forIconView:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  id *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  SBIconController *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  id v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB78]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB90]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB70]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB98]) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB80]))
  {
    objc_msgSend(v9, "iconCloseBoxTapped:", v11);
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB18])
    && objc_msgSend(v11, "supportsConfigurationCard"))
  {
    objc_msgSend(v11, "presentConfigurationCard");
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB10])
    && objc_msgSend(v11, "supportsStackConfigurationCard"))
  {
    objc_msgSend(v11, "presentStackConfigurationCard");
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB20]))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("tap-to-radar://new?ComponentID=1083491&ComponentName=Proactive%20Stacks&ComponentVersion=UI&Title=Stack%20rotation%20feedback:&Classification=UI%2FUsability&Description=Give%20details%20here..."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SBWorkspaceActivateApplicationFromURL(v22, 0, 0);
LABEL_25:

    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB38]))
  {
    v23 = objc_opt_class();
    objc_msgSend(v11, "icon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v23, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "hideSuggestedWidgetFromStack:", v25);
LABEL_60:

    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB30]))
  {
    v26 = objc_opt_class();
    objc_msgSend(v11, "icon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v26, v27);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "hideSiriSuggestionOnWidgetFromStack:", v25);
    goto LABEL_60;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAC0]))
  {
    v28 = objc_opt_class();
    objc_msgSend(v11, "icon");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v28, v29);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addSuggestedActiveWidgetToStack:", v25);
    goto LABEL_60;
  }
  if ((objc_msgSend(v12, "isWidgetIcon") & 1) != 0 || objc_msgSend(v12, "isApplicationIcon"))
  {
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB00]))
    {
      v30 = *MEMORY[0x1E0DAAAE8];
LABEL_40:
      if ((objc_msgSend(v13, "isEqualToString:", v30) & 1) != 0)
      {
        v32 = (id *)MEMORY[0x1E0DAA768];
      }
      else if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAE0]) & 1) != 0)
      {
        v32 = (id *)MEMORY[0x1E0DAA758];
      }
      else if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF8]) & 1) != 0)
      {
        v32 = (id *)MEMORY[0x1E0DAA778];
      }
      else
      {
        v39 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF0]);
        v32 = (id *)MEMORY[0x1E0DAA7A0];
        if (v39)
          v32 = (id *)MEMORY[0x1E0DAA770];
      }
      v25 = *v32;
      if (objc_msgSend(v12, "isWidgetIcon"))
        objc_msgSend(v9, "changeSizeOfWidgetIcon:toSizeClass:", v12, v25);
      else
        objc_msgSend(v9, "replaceAppIcon:withWidgetOfSize:", v12, v25);
      goto LABEL_60;
    }
    v31 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF0]);
    v30 = *MEMORY[0x1E0DAAAE8];
    if ((v31 & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAE8]) & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAE0]) & 1) != 0
      || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF8]))
    {
      goto LABEL_40;
    }
  }
  if (objc_msgSend(v12, "isWidgetIcon")
    && (objc_msgSend(v12, "isWidgetStackIcon") & 1) == 0
    && objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB08]))
  {
    objc_msgSend(v9, "replaceWidgetIconWithAppIcon:", v12);
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB88]))
  {
    objc_msgSend(v11, "startForbiddingEditingModeWithReason:", CFSTR("SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"));
    objc_msgSend(v9, "setEditing:fromIconView:", 1, v11);
    objc_initWeak((id *)buf, v11);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke;
    v64[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v65, (id *)buf);
    objc_msgSend(v11, "performAfterContextMenusDismissUsingBlock:", v64);
    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAB8]))
  {
    v33 = (void *)MEMORY[0x1E0CF9688];
    objc_msgSend(v11, "icon");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "applicationBundleID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "applicationWithBundleIdentifier:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v36, "isHidden"))
    {
      -[SBIconController rootViewController](self, "rootViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2;
      v62[3] = &unk_1E8E9E820;
      v62[4] = self;
      v63 = v12;
      _SBUnhideProtectedAppAlertControllerFor(v36, v62);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "presentViewController:animated:completion:", v38, 1, 0);

    }
    else
    {
      -[SBIconController addIconToHomeScreen:](self, "addIconToHomeScreen:", v12);
    }

    goto LABEL_7;
  }
  if (objc_msgSend(v12, "isApplicationIcon"))
  {
    v57 = v12;
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABA0]))
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "activeDisplayWindowScene");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_fbsDisplayConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationMultiwindowService sharedInstance](SBApplicationMultiwindowService, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "applicationBundleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "triggerShowAllWindowsForApplicationBundleIdentifier:displayConfiguration:", v43, v41);

    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB50]))
    {
      objc_msgSend(v57, "prioritizeDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB48]))
    {
      objc_msgSend(v57, "pauseDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB60]))
    {
      objc_msgSend(v57, "resumeDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAD8]))
    {
      objc_msgSend(v57, "cancelDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB68]))
    {
      objc_msgSend(v9, "iconShareSheetManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "presentShareSheetForIconView:", v11);

    }
    else
    {
      v54 = *MEMORY[0x1E0DAAB40];
      if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB40]) & 1) != 0
        || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABB0]))
      {
        objc_msgSend(v57, "changeLockedStatusToLocked:", objc_msgSend(v13, "isEqualToString:", v54));
      }
      else
      {
        v55 = *MEMORY[0x1E0DAAB28];
        if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB28]) & 1) == 0
          && !objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABA8]))
        {
          v14 = 1;
          goto LABEL_98;
        }
        objc_msgSend(v57, "changeHiddenStatusToHidden:", objc_msgSend(v13, "isEqualToString:", v55));
      }
    }
    v14 = 0;
LABEL_98:

    goto LABEL_8;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAC8]))
  {
    objc_msgSend(v10, "userInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0DAAAD0]);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      SBWorkspaceActivateApplicationFromURL(v45, 0, 0);

    }
    goto LABEL_60;
  }
  if (objc_msgSend(v12, "isBookmarkIcon"))
  {
    if (!objc_msgSend(v12, "displaysShareBookmarkShortcutItem")
      || !objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB68]))
    {
      goto LABEL_7;
    }
    objc_msgSend(v9, "iconShareSheetManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentShareSheetForIconView:", v11);
    goto LABEL_25;
  }
  if (objc_msgSend(v12, "isFolderIcon"))
  {
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABB8]))
    {
      -[SBIconController applicationController](self, "applicationController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifierToLaunch");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "applicationWithBundleIdentifier:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      SBWorkspaceActivateApplication(v48);
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB58]))
    {
      objc_msgSend(v11, "location");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3;
      v59[3] = &unk_1E8E9DEB0;
      v60 = v9;
      v61 = v11;
      objc_msgSend(v60, "openFolderIcon:location:animated:withCompletion:", v12, v52, 1, v59);

    }
    goto LABEL_7;
  }
  objc_msgSend(v11, "customIconImageViewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_respondsToSelector();

  if ((v50 & 1) != 0)
  {
    objc_msgSend(v11, "customIconImageViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "didSelectApplicationShortcutItem:", v10);

  }
  v14 = 1;
LABEL_8:
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[SBIconController _aggregateLoggingAppKeyForIcon:](self, "_aggregateLoggingAppKeyForIcon:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.springboard.quickaction.selected.%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isApplicationIcon"))
  {
    objc_msgSend(v12, "application");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isSystemApplication") & 1) == 0)
      objc_msgSend(v18, "isInternalApplication");

  }
  ADClientAddValueForScalarKey();
  SBLogIcon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v20 = CFSTR("NO");
    v67 = self;
    v68 = 2114;
    if (v14)
      v20 = CFSTR("YES");
    v69 = v10;
    v70 = 2048;
    v71 = a5;
    v72 = 2114;
    v73 = v11;
    v74 = 2114;
    v75 = v20;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "%p: iconManager:shouldActivateApplicationShortcutItem:%{public}@ atIndex:%lu forIconView:%{public}@ -- Returning %{public}@", buf, 0x34u);
  }

  return v14;
}

void __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endForbiddingEditingModeWithReason:", CFSTR("SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"));

}

uint64_t __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIconToHomeScreen:", *(_QWORD *)(a1 + 40));
}

void __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setEditing:fromIconView:", 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "openedFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditingTitle");

}

- (unint64_t)iconManager:(id)a3 supportedMultitaskingShortcutActionsForIconView:(id)a4
{
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;
  unint64_t v9;

  objc_msgSend(a4, "icon", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || !objc_msgSend(v5, "isApplicationIcon"))
      goto LABEL_4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
  {
    v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v8 = objc_msgSend(v5, "isApplicationIcon");

  if ((v8 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(v5, "applicationBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBIconController supportedMultitaskingShortcutActionsForBundleIdentifier:](self, "supportedMultitaskingShortcutActionsForBundleIdentifier:", v7);
    v6 = 0;
    switch(v9)
    {
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 8uLL:
        v6 = v9;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_13;
      default:
        if (v9 == 16)
          v6 = 16;
        else
          v6 = 0;
        break;
    }
    goto LABEL_13;
  }
LABEL_4:
  v6 = 0;
LABEL_14:

  return v6;
}

- (unint64_t)supportedMultitaskingShortcutActionsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[SBIconController applicationController](self, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "switcherController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 11, v4);
    if (objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 13, v4))
      v10 |= 6uLL;
    if (objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 3, v4))
      v10 |= 8uLL;
    if (objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 18, v4))
      v10 |= 0x10uLL;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addIconToHomeScreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBIconController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isShowingSpotlightOrLeadingCustomView"))
    objc_msgSend(v4, "dismissSpotlightAnimated:completionHandler:", 1, 0);
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayPresentationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasActivePresentation"))
  {
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers](SBTransientOverlayDismissalRequest, "dismissalRequestForAllViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performDismissalRequest:", v7);

  }
  objc_msgSend(v4, "addNewIconToDesignatedLocation:options:", v11, 91);
  if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modalLibraryController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "forcedSearchTextFieldNoneditable:", 1);
  objc_msgSend(v4, "setDisablesScrollingToLastIconPageForLibraryDismissal:", 1);
  -[SBIconController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 1);
  objc_msgSend(v4, "setDisablesScrollingToLastIconPageForLibraryDismissal:", 0);
  objc_msgSend(v10, "forcedSearchTextFieldNoneditable:", 0);

}

- (void)_forceTouchControllerWillPresent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isFloatingDockPresented"))
    {
      objc_msgSend(v11, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0DAA998]) & 1) == 0)
      {
        objc_msgSend(v11, "location");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "isEqual:", CFSTR("SBIconLocationFloatingDockSuggestions"));

      }
    }

  }
}

- (id)_aggregateLoggingAppKeyForIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  if (objc_msgSend(v3, "isApplicationIcon"))
  {
    objc_msgSend(v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationPlaceholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isSystemApplication") & 1) != 0 || objc_msgSend(v4, "isInternalApplication"))
    {
      objc_msgSend(v4, "bundleIdentifier");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v4)
    {
      v6 = CFSTR("thirdParty");
    }
    else if (v5)
    {
      objc_msgSend(v3, "applicationBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "typeForInstallMachinery");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("User"));

        if ((v12 & 1) != 0)
          v6 = CFSTR("thirdParty");
        else
          v6 = v8;
      }
      else
      {
        v6 = CFSTR("unknown");
      }

    }
    else
    {
      v6 = CFSTR("unknown");
    }

  }
  else if ((objc_msgSend(v3, "isBookmarkIcon") & 1) != 0)
  {
    v6 = CFSTR("bookmark");
  }
  else if (objc_msgSend(v3, "isFolderIcon"))
  {
    v6 = CFSTR("folder");
  }
  else
  {
    v6 = CFSTR("unknown");
  }

  return v6;
}

- (void)_styleEditorWillPresent:(id)a3
{
  void *v4;
  void *v5;
  SBFZStackParticipant *v6;
  SBFZStackParticipant *zStackParticipant;

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zStackResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireParticipantWithIdentifier:delegate:", 6, self);
  v6 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = v6;

  -[SBIconController zStackParticipantDidChange:](self, "zStackParticipantDidChange:", self->_zStackParticipant);
}

- (void)_styleEditorDidDismiss:(id)a3
{
  SBFZStackParticipant *zStackParticipant;

  -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate", a3);
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = 0;

}

- (void)_colorDropperWillPresent:(id)a3
{
  id v5;
  void *v6;
  SBFloatingDockBehaviorAssertion *colorPickerInterfactionFloatingDockBehaviorAssertion;
  SBFloatingDockBehaviorAssertion *v8;
  void *v9;
  SBFloatingDockBehaviorAssertion *v10;
  SBFloatingDockBehaviorAssertion *v11;
  BSInvalidatable *duckWallpaperDimmingAssertion;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *v16;
  id v17;

  v5 = a3;
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatingDockController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  if (colorPickerInterfactionFloatingDockBehaviorAssertion)
    -[SBFloatingDockBehaviorAssertion invalidate](colorPickerInterfactionFloatingDockBehaviorAssertion, "invalidate");
  v8 = [SBFloatingDockBehaviorAssertion alloc];
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v8, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v6, 1, 0, 0, v9, 0, 0.0);
  v11 = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = v10;

  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  if (duckWallpaperDimmingAssertion)
    -[BSInvalidatable invalidate](duckWallpaperDimmingAssertion, "invalidate");
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "acquireDuckHomeScreenWallpaperDimAssertionWithReason:", v14);
  v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  v16 = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = v15;

  -[SBIconController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForStyleColorDropperReason"));
}

- (void)_colorDropperDismissed:(id)a3
{
  SBFloatingDockBehaviorAssertion *colorPickerInterfactionFloatingDockBehaviorAssertion;
  BSInvalidatable *duckWallpaperDimmingAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_colorPickerInterfactionFloatingDockBehaviorAssertion, "invalidate", a3);
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = 0;

  -[BSInvalidatable invalidate](self->_duckWallpaperDimmingAssertion, "invalidate");
  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = 0;

  -[SBIconController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForStyleColorDropperReason"));
}

- (void)_iconForceTouchControllerWillPresent:(id)a3
{
  -[SBIconController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForAppIconForceTouchReason"));
}

- (void)_iconForceTouchControllerDidDismiss:(id)a3
{
  -[SBIconController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForAppIconForceTouchReason"));
}

- (void)_startSpotlightInteractiveGestureTransactionForGesture:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  SBIconController *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow"))
  {
    -[SBIconController policyAggregator](self, "policyAggregator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsCapability:", 9);

    if (v6)
    {
      if (!self->_spotlightInteractiveGestureTransaction)
      {
        v7 = (void *)SBApp;
        v8 = MEMORY[0x1E0C809B0];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke;
        v12[3] = &unk_1E8EA3E78;
        v13 = v4;
        v9[0] = v8;
        v9[1] = 3221225472;
        v9[2] = __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2;
        v9[3] = &unk_1E8EA6660;
        v10 = v13;
        v11 = self;
        objc_msgSend(v7, "beginInteractiveSpotlightTransientOverlayPresentationWithValidator:beginHandler:", v12, v9);

      }
    }
  }

}

uint64_t __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDragging");
}

void __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isDragging"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 352), a2);
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_msgSend(v4, "completionBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3;
    v7[3] = &unk_1E8EA6638;
    v6 = v5;
    v8 = v6;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setCompletionBlock:", v7);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "noteGestureFinishedBeforeTransactionBegan");
  }

}

void __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[44];
    WeakRetained[44] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
  }

}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4)
    -[SBIconController _startSpotlightInteractiveGestureTransactionForGesture:](self, "_startSpotlightInteractiveGestureTransactionForGesture:", a3);
}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  double v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isTracking"))
  {
    if (self->_spotlightInteractiveGestureTransaction
      || (-[SBIconController _startSpotlightInteractiveGestureTransactionForGesture:](self, "_startSpotlightInteractiveGestureTransactionForGesture:", v7), self->_spotlightInteractiveGestureTransaction))
    {
      objc_msgSend((id)objc_opt_class(), "searchHeaderHeight");
      -[SBSpotlightTransientOverlayInteractiveGestureTransaction updatePresentationWithProgress:translation:](self->_spotlightInteractiveGestureTransaction, "updatePresentationWithProgress:translation:", a4, v6 * a4);
    }
  }

}

- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4
{
  SBSpotlightTransientOverlayInteractiveGestureTransaction *spotlightInteractiveGestureTransaction;

  spotlightInteractiveGestureTransaction = self->_spotlightInteractiveGestureTransaction;
  if (spotlightInteractiveGestureTransaction)
    -[SBSpotlightTransientOverlayInteractiveGestureTransaction endPresentation:](spotlightInteractiveGestureTransaction, "endPresentation:", a4);
}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIWindow)animationWindow
{
  void *v2;
  void *v3;

  -[SBIconController userInterfaceController](self, "userInterfaceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v3;
}

- (UIView)fallbackIconContainerView
{
  void *v2;
  void *v3;

  -[SBIconController userInterfaceController](self, "userInterfaceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "alert item will activate", v7, 2u);
  }

  -[SBIconController iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllDrags");

}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (objc_msgSend(a4, "isMainDisplayWindowScene", a3))
  {
    SBLogIconDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "assistant will appear", v8, 2u);
    }

    -[SBIconController iconManager](self, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditing:", 0);

    -[SBIconController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelAllDrags");

  }
}

- (void)iconManager:(id)a3 willDestroyRootFolderController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a4;
  objc_msgSend(v5, "removePageStateObserver:", self);
  objc_msgSend(v5, "setAccessoryViewControllerDelegate:", 0);

  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setContentView:", 0);
  -[SBIconController spotlightViewController](self, "spotlightViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[SBIconController setSpotlightViewController:](self, "setSpotlightViewController:", 0);
}

- (void)iconManager:(id)a3 willDestroyRootViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setContentView:", 0);
  objc_msgSend(v5, "removeFromParentViewController");
  -[SBIconController setRootViewController:](self, "setRootViewController:", v5);

}

- (void)iconManager:(id)a3 willUseRootFolderControllerConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  SBHomeScreenSpotlightViewController *v13;
  SBSpotlightPresentableViewController *v14;
  SBSearchPresenter *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSearchPresenter *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (MEMORY[0x1D17E3C78]())
  {
    if (SBHHomeScreenSearchAffordanceEnabled()
      && (+[SBDefaults localDefaults](SBDefaults, "localDefaults"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "homeScreenDefaults"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "showsHomeScreenSearchAffordance"),
          v8,
          v7,
          v9))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0DAA520]);
      -[SBIconController legibilitySettings](self, "legibilitySettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLegibilitySettings:", v11);

      objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("spotlight-pill"));
      -[SBIconController setScrollAccessoryAuxiliaryView:](self, "setScrollAccessoryAuxiliaryView:", v10);
      objc_msgSend(v6, "setScrollAccessoryAuxiliaryView:", v10);
      v12 = -[SBIconController _newSearchPillBackgroundView](self, "_newSearchPillBackgroundView");
      objc_msgSend(v6, "setScrollAccessoryBackgroundView:", v12);

    }
    else
    {
      -[SBIconController setScrollAccessoryAuxiliaryView:](self, "setScrollAccessoryAuxiliaryView:", 0);
    }
    v13 = -[SBHomeScreenSpotlightViewController initWithDelegate:]([SBHomeScreenSpotlightViewController alloc], "initWithDelegate:", self);
    -[SBIconController setSpotlightViewController:](self, "setSpotlightViewController:", v13);
    v14 = -[SBSpotlightPresentableViewController initWithSpotlightMultiplexingViewController:]([SBSpotlightPresentableViewController alloc], "initWithSpotlightMultiplexingViewController:", v13);
    -[SBSpotlightPresentableViewController setDelegate:](v14, "setDelegate:", self);
    -[SBIconController setSearchPresentableViewController:](self, "setSearchPresentableViewController:", v14);
    v15 = [SBSearchPresenter alloc];
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homeScreenPullToSearchSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconController _identifierForSearchPresenter](self, "_identifierForSearchPresenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBSearchPresenter initWithSettings:identifier:](v15, "initWithSettings:identifier:", v17, v18);

    -[SBSearchPresenter setSearchPresenterDelegate:](v19, "setSearchPresenterDelegate:", self);
    -[SBSearchPresenter setUsesTransitionDistanceAsStartOffset:](v19, "setUsesTransitionDistanceAsStartOffset:", 1);
    -[SBIconController setSearchPresenter:](self, "setSearchPresenter:", v19);
    objc_msgSend(v6, "setSearchPresenter:", v19);
    objc_msgSend(v6, "setSearchPresentableViewController:", v14);

  }
  else
  {
    -[SBIconController setSpotlightViewController:](self, "setSpotlightViewController:", 0);
    -[SBIconController setSearchPresentableViewController:](self, "setSearchPresentableViewController:", 0);
    -[SBIconController setSearchPresenter:](self, "setSearchPresenter:", 0);
    if ((objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow") & 1) != 0)
      goto LABEL_10;
    v13 = -[SBHomeScreenSpotlightViewController initWithDelegate:]([SBHomeScreenSpotlightViewController alloc], "initWithDelegate:", self);
    -[SBSpotlightMultiplexingViewController setSpotlightDelegate:](v13, "setSpotlightDelegate:", self);
    -[SBIconController setSpotlightViewController:](self, "setSpotlightViewController:", v13);
    objc_msgSend(v6, "setPullDownSearchViewController:", v13);
  }

LABEL_10:
  if (-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeadingCustomViewController:", v20);

    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTrailingCustomViewController:", v21);

    -[SBIconController overlayLibraryViewController](self, "overlayLibraryViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPresenter:", v26);

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (-[SBIconController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay"))
      objc_msgSend(v6, "setIgnoresOverscrollOnFirstPageOrientations:", 30);
    objc_msgSend(v6, "setFolderPageManagementAllowedOrientations:", 30);
    objc_msgSend(v6, "setShowsAddWidgetButtonWhileEditingAllowedOrientations:", 30);
    if (-[SBIconController isFocusAllowedForIconManager:](self, "isFocusAllowedForIconManager:", v26))
      objc_msgSend(v6, "setAddsFocusGuidesForWrapping:", 1);
  }
  else
  {
    if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
    {
      objc_msgSend(v6, "setIgnoresOverscrollOnFirstPageOrientations:", 30);
      if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
        objc_msgSend(v6, "setIgnoresOverscrollOnLastPageOrientations:", 6);
    }
    objc_msgSend(v6, "setFolderPageManagementAllowedOrientations:", 6);
    objc_msgSend(v6, "setShowsAddWidgetButtonWhileEditingAllowedOrientations:", 6);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:", SBIconControllerDidReconfigureChildControllersNotification, self);

}

- (id)_newTodayViewControllerWithIconManager:(id)a3 iconListModel:(id)a4 rootFolder:(id)a5 location:(int64_t)a6
{
  id v10;
  id v11;
  SBTodayViewController *v12;
  void *v13;
  SBTodayViewController *v14;
  void *v16;

  v10 = a3;
  v11 = a5;
  v12 = [SBTodayViewController alloc];
  objc_msgSend(v10, "listLayoutProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHTodayViewController initWithListLayoutProvider:iconViewProvider:location:](v12, "initWithListLayoutProvider:iconViewProvider:location:", v13, v10, a6);

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 5518, CFSTR("Today view controller is not initialized."));

  }
  if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
    -[SBHTodayViewController setIconLocation:](v14, "setIconLocation:", *MEMORY[0x1E0DAA9F8]);
  -[SBHTodayViewController setDelegate:](v14, "setDelegate:", self);
  -[SBHTodayViewController addObserver:](v14, "addObserver:", self);
  -[SBHTodayViewController setRootFolder:](v14, "setRootFolder:", v11);

  -[SBHTodayViewController setIconManager:](v14, "setIconManager:", v10);
  -[SBHTodayViewController setEditing:](v14, "setEditing:", objc_msgSend(v10, "isEditing"));

  return v14;
}

- (id)_createWidgetIconWithDataSource:(id)a3 gridSize:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0DAA678];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithUniqueLeafIdentifier");
  objc_msgSend(v8, "addIconDataSource:", v7);

  objc_msgSend(v8, "setGridSizeClass:", v6);
  return v8;
}

- (id)_createWidgetIconWithKind:(id)a3 extensionBundleIdentifier:(id)a4 gridSize:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0DAA580];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithKind:extensionBundleIdentifier:", v10, v9);

  SBLogWidgets();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "extensionBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created from icon controller.", (uint8_t *)&v17, 0x16u);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidget:", v11);
  objc_msgSend(v15, "setGridSizeClass:", v8);

  return v15;
}

- (id)_createWidgetIconWithDescriptors:(id)a3 gridSize:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0DAA678];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCHSWidgetDescriptors:", v7);

  objc_msgSend(v8, "setGridSizeClass:", v6);
  return v8;
}

- (void)iconManager:(id)a3 didCreateRootFolderController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[SBIconController userInterfaceController](self, "userInterfaceController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPageStateObserver:", self);
  objc_msgSend(v5, "setAccessoryViewControllerDelegate:", self);
  v6 = (void *)MEMORY[0x1E0DAA3C8];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeScreenContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextWithScreen:animationWindow:fallbackIconContainer:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationContext:", v10);

  objc_msgSend(v5, "searchGesture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObserver:", self);
}

- (void)iconManager:(id)a3 didCreateRootViewController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  SBIconController *v21;
  id v22;

  v5 = a4;
  -[SBIconController updateHomeScreenTraitOverridesForViewController:](self, "updateHomeScreenTraitOverridesForViewController:", v5);
  v6 = (void *)*MEMORY[0x1E0CEB258];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __60__SBIconController_iconManager_didCreateRootViewController___block_invoke;
  v20 = &unk_1E8E9E820;
  v21 = self;
  v7 = v5;
  v22 = v7;
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", &v17);
  objc_msgSend(v7, "view", v17, v18, v19, v20, v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  objc_msgSend(v9, "addChildViewController:", v7);
  objc_msgSend(v14, "setContentView:", v8);
  objc_msgSend(v7, "didMoveToParentViewController:", v9);
  objc_msgSend(v14, "sendSubviewToBack:", v8);

  -[SBIconController userInterfaceController](self, "userInterfaceController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateStatusBarLegibilityForWindowScene:", 0);
  -[SBIconController setRootViewController:](self, "setRootViewController:", v7);
  -[SBIconController searchPresentableViewController](self, "searchPresentableViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidateSearchAffordanceView");

}

uint64_t __60__SBIconController_iconManager_didCreateRootViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeHomeScreenTraitOverridesForViewController:", *(_QWORD *)(a1 + 40));
}

- (int64_t)interfaceOrientationForIconManager:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBIconController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveOrientation");

  return v4;
}

- (unint64_t)allowedInterfaceOrientationsForIconManager:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBIconController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowedInterfaceOrientations");

  return v4;
}

- (unint64_t)possibleInterfaceOrientationsForIconManager:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBIconController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "possibleInterfaceOrientations");

  return v4;
}

- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBIconController layoutStateProvider](self, "layoutStateProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode") == 1;

  return v5;
}

- (BOOL)iconManager:(id)a3 isPartialEditingAllowedForIconLocation:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (-[SBIconController hasRestrictedEnforcedLayout](self, "hasRestrictedEnforcedLayout"))
    v6 = SBIconLocationGroupContainsLocation();
  else
    v6 = 0;

  return v6;
}

- (void)iconManagerEditingDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  SBFloatingDockBehaviorAssertion *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateExtraButtonVisibilityAnimated:", 1);

  if (objc_msgSend(v4, "isEditing"))
  {
    v23 = v4;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "connectedWindowScenes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v11, "isExternalDisplayWindowScene"))
          {
            objc_msgSend(v11, "floatingDockController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v12, 1, 0, 1, CFSTR("hideFloatingDockOnExternalDisplayForHomeScreenEditMode"), 0, 0.0);
            -[SBIconController floatingDockBehaviorAssertions](self, "floatingDockBehaviorAssertions");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = v14;
              objc_msgSend(v14, "setByAddingObject:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v13, 0);
            }
            -[SBIconController setFloatingDockBehaviorAssertions:](self, "setFloatingDockBehaviorAssertions:", v16);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v8);
    }

    v4 = v23;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SBIconController floatingDockBehaviorAssertions](self, "floatingDockBehaviorAssertions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "invalidate");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    -[SBIconController setFloatingDockBehaviorAssertions:](self, "setFloatingDockBehaviorAssertions:", 0);
  }

}

- (void)iconManager:(id)a3 willUseIconImageCache:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend((id)SBApp, "userSessionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sessionType");

  if (v7 == 2)
    objc_msgSend(v5, "setPoolingBypassCount:", 200);
  -[SBIconController _libraryViewControllers](self, "_libraryViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setIconImageCache:", v5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)iconManagerListLayoutProviderDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBIconController _libraryViewControllers](self, "_libraryViewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "_sbWindowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconController _appLibraryListLayoutProviderForWindowScene:](self, "_appLibraryListLayoutProviderForWindowScene:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setListLayoutProvider:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEAC58], "_localizedFolderNameForName:", a3);
}

- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return -[SBIconController localizedFolderNameForDefaultDisplayName:](self, "localizedFolderNameForDefaultDisplayName:", a4);
}

- (id)localizedDefaultFolderNameForIconManager:(id)a3
{
  return -[SBIconController localizedFolderNameForDefaultDisplayName:](self, "localizedFolderNameForDefaultDisplayName:", CFSTR("Folder"));
}

- (void)iconManagerDidFinishInstallForIcon:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[SBIconController layoutStateProvider](self, "layoutStateProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unlockedEnvironmentMode");

  if (v6 == 1)
    -[SBIconController _showInfoAlertIfNeeded:](self, "_showInfoAlertIfNeeded:", 1);
}

- (void)iconManager:(id)a3 didReceiveTapOnLaunchDisabledIconView:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBIconController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBIconController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  SBLogIcon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Received tap on launch-disabled icon view '%@'", (uint8_t *)&v10, 0xCu);

  }
  kdebug_trace();

}

uint64_t __80__SBIconController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchFromIconView:withActions:modifierFlags:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)iconManager:(id)a3 launchURLForIconView:(id)a4
{
  return -[SBIconController launchURLForIconView:](self, "launchURLForIconView:", a4);
}

- (void)iconManager:(id)a3 launchIcon:(id)a4 location:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _BOOL8);
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  SBActivationSettings *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _BOOL8))a7;
  if (!objc_msgSend(v10, "isApplicationIcon"))
  {
    v17 = 0;
    if (!v12)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(v10, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationBundleID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v13)
  {
    if (v14)
    {
      -[SBIconController applicationController](self, "applicationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applicationWithBundleIdentifier:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
  }
  SBLogIcon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    v27 = 138412802;
    v28 = v10;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v13;
    _os_log_fault_impl(&dword_1D0540000, v18, OS_LOG_TYPE_FAULT, "Fallback launch path: Trying to launch app icon: %@ (%@), found app: %@", (uint8_t *)&v27, 0x20u);
  }

  v17 = v13 != 0;
  if (v13)
  {
    -[SBIconController userInterfaceController](self, "userInterfaceController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(SBActivationSettings);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateApplication:fromIcon:location:activationSettings:actions:", v13, v10, v11, v20, v21);

    if (v15)
    {
      -[SBIconController model](self, "model");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "applicationIconForBundleIdentifier:", v15);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23 && v23 != v10)
      {
        -[SBIconController rootFolder](self, "rootFolder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "indexPathForIcon:", v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v24, "iconAtIndexPath:", v25);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (v26 != v23)
            objc_msgSend(v24, "replaceIcon:withIcon:", v10, v23);
        }

      }
    }
  }

  if (v12)
LABEL_20:
    v12[2](v12, v17);
LABEL_21:

}

- (id)iconManager:(id)a3 containerViewForPresentingContextMenuForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerViewForPresentingContextMenuForIconView:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconManager:(id)a3 containerViewControllerForConfigurationOfIconView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBIconLocationGroupContainsLocation())
  {
    v7 = v6;
  }
  else
  {
    if (!SBIconLocationGroupContainsLocation())
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)iconManager:(id)a3 containerViewForConfigurationOfIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SBIconController iconManager:containerViewControllerForConfigurationOfIconView:](self, "iconManager:containerViewControllerForConfigurationOfIconView:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    objc_msgSend(v5, "iconContentView");
  else
    objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  CGRect result;

  v6 = a4;
  -[SBIconController iconManager:containerViewForConfigurationOfIconView:](self, "iconManager:containerViewForConfigurationOfIconView:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    objc_msgSend(v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (SBIconLocationGroupContainsLocation())
    {
      v11 = v9;
      if (-[SBIconController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
      {
        -[SBIconController todayViewController](self, "todayViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v11, "bounds");
    objc_msgSend(v11, "convertRect:toView:", v9);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)iconManager:(id)a3 homeScreenContentViewForConfigurationOfIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBIconLocationGroupContainsLocation()
    && -[SBIconController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
  {
    -[SBIconController todayViewController](self, "todayViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconManager:(id)a3 containerViewControllerForModalInteractionFromIconView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBIconLocationGroupContainsLocation())
  {
    v7 = v6;
  }
  else
  {
    if (!SBIconLocationGroupContainsLocation())
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)iconManager:(id)a3 containerViewForModalInteractionFromIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SBIconController iconManager:containerViewControllerForModalInteractionFromIconView:](self, "iconManager:containerViewControllerForModalInteractionFromIconView:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    objc_msgSend(v5, "iconContentView");
  else
    objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconManager:(id)a3 homeScreenContentViewForModalInteractionFromIconView:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SBIconLocationGroupContainsLocation())
    goto LABEL_9;
  -[SBIconController coverSheetPresentationManager](self, "coverSheetPresentationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isVisible");

  if (v7)
    -[SBIconController coverSheetTodayViewController](self, "coverSheetTodayViewController");
  else
    -[SBIconController todayViewController](self, "todayViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_appearState") != 2 && objc_msgSend(v8, "_appearState") != 1)
  {

LABEL_9:
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[SBIconController todayViewController](self, "todayViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationWillBeginWithInteraction:(id)a5
{
  void *v6;
  void *v7;
  SBFloatingDockBehaviorAssertion *v8;
  objc_class *v9;
  void *v10;
  SBFloatingDockBehaviorAssertion *v11;
  SBFloatingDockBehaviorAssertion *widgetConfigurationFloatingDockBehaviorAssertion;
  id v13;

  v13 = a5;
  -[SBPowerLogMetricsAggregator emitEventOfType:](self->_powerLogAggregator, "emitEventOfType:", 1);
  if (!self->_widgetConfigurationFloatingDockBehaviorAssertion)
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatingDockController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [SBFloatingDockBehaviorAssertion alloc];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v8, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v7, 1, 1, 3, v10, 0, 0.0);
    widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
    self->_widgetConfigurationFloatingDockBehaviorAssertion = v11;

  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationDidEndWithInteraction:(id)a5
{
  SBFloatingDockBehaviorAssertion *widgetConfigurationFloatingDockBehaviorAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_widgetConfigurationFloatingDockBehaviorAssertion, "invalidate", a3, a4, a5);
  widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
  self->_widgetConfigurationFloatingDockBehaviorAssertion = 0;

}

- (void)iconManager:(id)a3 modalInteractionWillBegin:(id)a4
{
  id v5;
  void *v6;
  SBFloatingDockBehaviorAssertion *v7;
  objc_class *v8;
  void *v9;
  SBFloatingDockBehaviorAssertion *v10;
  SBFloatingDockBehaviorAssertion *modalInteractionFloatingDockBehaviorAssertion;
  id v12;

  if (!self->_modalInteractionFloatingDockBehaviorAssertion)
  {
    v5 = a4;
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatingDockController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SBFloatingDockBehaviorAssertion alloc];
    v8 = (objc_class *)objc_opt_class();

    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v7, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v6, 1, 1, 3, v9, 0, 0.0);
    modalInteractionFloatingDockBehaviorAssertion = self->_modalInteractionFloatingDockBehaviorAssertion;
    self->_modalInteractionFloatingDockBehaviorAssertion = v10;

  }
}

- (void)iconManager:(id)a3 modalInteractionDidEnd:(id)a4
{
  SBFloatingDockBehaviorAssertion *modalInteractionFloatingDockBehaviorAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_modalInteractionFloatingDockBehaviorAssertion, "invalidate", a3, a4);
  modalInteractionFloatingDockBehaviorAssertion = self->_modalInteractionFloatingDockBehaviorAssertion;
  self->_modalInteractionFloatingDockBehaviorAssertion = 0;

}

- (unint64_t)addWidgetSheetStyleForIconManager:(id)a3
{
  _BOOL4 v3;
  void *v4;

  if (__sb__runningInSpringBoard())
  {
    return SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  }
  return v3;
}

- (void)iconManager:(id)a3 iconView:(id)a4 willUseContextMenuStyle:(id)a5
{
  double v6;
  double v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  CGFloat v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a5;
  -[SBIconController minimumHomeScreenScale](self, "minimumHomeScreenScale");
  v7 = v6;
  if (v6 != 1.0)
  {
    objc_msgSend(v16, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    v13 = v7 + -1.0;
    v14 = (v7 + -1.0) * CGRectGetWidth(v17) * 0.5;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v15 = CGRectGetHeight(v18);
    objc_msgSend(v16, "setPreferredBackgroundInsets:", v13 * v15 * 0.5, v14, v13 * v15 * 0.5, v14);

  }
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysCloseBox:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a4;
  objc_msgSend(v5, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported");
  v8 = objc_msgSend(v6, "isApplicationIcon");
  v9 = v8 && v7 || -[SBIconController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v6);
  objc_msgSend(v5, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatingDockController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isPresentingIconLocation:", v10))
  {
    v13 = objc_msgSend(v12, "shouldShowCloseBoxForIconView:proposedValue:", v5, v9);
LABEL_10:
    LOBYTE(v9) = v13;
    goto LABEL_11;
  }
  if (v8 && SBIconLocationGroupContainsLocation())
  {
    v13 = -[SBIconController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v6);
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (void)iconManager:(id)a3 wantsUninstallForIcon:(id)a4 location:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SBRemoveWidgetAlertItem *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  SBRemoveWidgetAlertItem *v17;
  void *v18;
  SBRemoveWidgetAlertItem *v19;
  __objc2_class *v20;
  SBHideAppIconAlertItem *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  SBIconController *v26;

  v7 = a4;
  v8 = a5;
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatingDockController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "handlePromptingUserToUninstallIcon:location:", v7, v8) & 1) == 0)
  {
    if (objc_msgSend(v7, "isApplicationIcon"))
    {
      -[SBIconController applicationController](self, "applicationController");
      v11 = (SBRemoveWidgetAlertItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBIconController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v7);
      if (v12)
      {
        v14 = v13;
        v15 = -[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported");
        if (v14)
        {
          if (v15)
            v16 = SBIconLocationGroupContainsLocation() ^ 1;
          else
            v16 = 0;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke;
          v24[3] = &unk_1E8EA66B0;
          v25 = v7;
          v26 = self;
          -[SBRemoveWidgetAlertItem requestUninstallApplicationWithBundleIdentifier:options:withCompletion:](v11, "requestUninstallApplicationWithBundleIdentifier:options:withCompletion:", v12, v16, v24);

        }
        else if (v15)
        {
          v21 = -[SBHideAppIconAlertItem initWithIcon:location:]([SBHideAppIconAlertItem alloc], "initWithIcon:location:", v7, v8);
          -[SBAlertItem _setPreferredActivationWindowScene:](v21, "_setPreferredActivationWindowScene:", v9);
          -[SBIconController alertItemsController](self, "alertItemsController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "activateAlertItem:", v21);

        }
      }

    }
    else
    {
      if (objc_msgSend(v7, "isWidgetIcon"))
      {
        v17 = [SBRemoveWidgetAlertItem alloc];
        -[SBIconController iconManager](self, "iconManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SBRemoveWidgetAlertItem initWithWidgetIcon:location:iconManager:](v17, "initWithWidgetIcon:location:iconManager:", v7, v8, v18);

        v19 = v11;
      }
      else
      {
        if (objc_msgSend(v7, "isFolderIcon"))
          v20 = SBHideFolderContentsAlertItem;
        else
          v20 = SBDeleteNonAppIconAlertItem;
        v19 = (SBRemoveWidgetAlertItem *)objc_msgSend([v20 alloc], "initWithIcon:location:", v7, v8);
        v11 = v19;
      }
      -[SBAlertItem _setPreferredActivationWindowScene:](v19, "_setPreferredActivationWindowScene:", v9);
      -[SBIconController alertItemsController](self, "alertItemsController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateAlertItem:", v11);

    }
  }

}

void __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isApplicationIcon"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setUninstalledByUser:", 1);
      objc_msgSend(*(id *)(a1 + 32), "cancelDownload");
    }
    objc_msgSend(*(id *)(a1 + 40), "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_2;
    v16[3] = &unk_1E8E9E980;
    v17 = v8;
    objc_msgSend(v9, "uninstallIcon:animate:completion:", v10, 1, v16);

    v11 = v17;
  }
  else
  {
    if (!a3)
    {
      objc_msgSend(v7, "invalidate");
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "iconManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_3;
    v14[3] = &unk_1E8E9E980;
    v15 = v8;
    objc_msgSend(v12, "addIconToIgnoredList:options:completion:", v13, 1, v14);

    v11 = v15;
  }

LABEL_9:
}

uint64_t __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)iconManager:(id)a3 canBeginDragForIconView:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasActivePresentation");

  return v6 ^ 1;
}

- (BOOL)_dragSessionContainsAppClipWebClipIcon:(id)a3
{
  void *v4;
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
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sbh_appDragLocalContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconController model](self, "model");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bookmarkIconForWebClipIdentifier:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "webClip");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isAppClip");

          if ((v15 & 1) != 0)
          {

            v16 = 1;
            goto LABEL_12;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)iconManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return !-[SBIconController _dragSessionContainsAppClipWebClipIcon:](self, "_dragSessionContainsAppClipWebClipIcon:", a4);
}

- (BOOL)iconManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  return !-[SBIconController _dragSessionContainsAppClipWebClipIcon:](self, "_dragSessionContainsAppClipWebClipIcon:", a4);
}

- (double)iconManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4
{
  return 1.1;
}

- (int64_t)iconManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5
{
  void *v6;

  objc_msgSend(a4, "location", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
    a5 = 7;

  return a5;
}

- (void)iconManager:(id)a3 iconDropSessionDidEnter:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v5 = (void *)MEMORY[0x1E0CEA578];
  v6 = a4;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionForDropSession:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "processIdentifier");
  if ((_DWORD)v7 != getpid())
  {
    v14 = 0u;
    v15 = 0u;
    if (v9)
      objc_msgSend(v9, "auditToken");
    v13[0] = v14;
    v13[1] = v15;
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromAuditToken:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.springboard.app-drag")) & 1) == 0)
    {
      -[SBIconController iconManager](self, "iconManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cancelAllDrags");

      goto LABEL_8;
    }

  }
  +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCommandeered:forDraggingSystemSession:forReason:", 1, v8, CFSTR("SBIconController-IconDrag"));

LABEL_8:
}

- (BOOL)shouldCommandeerContentDragsInLocation:(id)a3
{
  return SBIconLocationGroupContainsLocation();
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidEnter:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconController shouldCommandeerContentDragsInLocation:](self, "shouldCommandeerContentDragsInLocation:", v7))
  {
    +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommandeered:forDropSession:forReason:", 1, v9, CFSTR("SBIconController-ContentDrag"));

  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidExit:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconController shouldCommandeerContentDragsInLocation:](self, "shouldCommandeerContentDragsInLocation:", v7))
  {
    +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommandeered:forDropSession:forReason:", 0, v9, CFSTR("SBIconController-ContentDrag"));

  }
}

- (id)iconManager:(id)a3 backgroundViewForComponentsOfIconView:(id)a4
{
  SBWallpaperEffectView *v5;
  NSMutableSet *delayedStyleWallpaperEffectViews;
  uint64_t v7;

  if (-[SBIconController shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:](self, "shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:", a4))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    if (delayedStyleWallpaperEffectViews)
    {
      -[NSMutableSet addObject:](delayedStyleWallpaperEffectViews, "addObject:", v5);
      v7 = 2;
    }
    else
    {
      v7 = 29;
    }
    -[PBUIWallpaperEffectViewBase setStyle:](v5, "setStyle:", v7);
  }
  return v5;
}

- (BOOL)iconManager:(id)a3 supportsParallaxForIconView:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplayWindowScene");

  return v5;
}

- (id)iconManager:(id)a3 screenSnapshotProviderForComponentsOfIconView:(id)a4
{
  id v6;
  id v7;
  SBIconController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIView *screenSnapshotForIconViews;
  SBIconViewSnapshotProvider *v13;
  void *v14;
  SBIconViewSnapshotProvider *v15;
  NSMutableArray *outstandingSnapshotProviders;
  NSMutableArray *v17;
  NSMutableArray *v18;
  _QWORD v20[5];
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_screenSnapshotForIconViews)
    goto LABEL_3;
  objc_msgSend(v7, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  screenSnapshotForIconViews = v8->_screenSnapshotForIconViews;
  v8->_screenSnapshotForIconViews = (UIView *)v11;

  if (v8->_screenSnapshotForIconViews)
  {
LABEL_3:
    objc_initWeak(&location, v8);
    v13 = [SBIconViewSnapshotProvider alloc];
    v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initAsCopyOf:", v8->_screenSnapshotForIconViews);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__SBIconController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke;
    v20[3] = &unk_1E8EA66D8;
    objc_copyWeak(&v21, &location);
    v20[4] = v8;
    v15 = -[SBIconViewSnapshotProvider initWithSnapshotView:invalidation:](v13, "initWithSnapshotView:invalidation:", v14, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    if (v15)
    {
      outstandingSnapshotProviders = v8->_outstandingSnapshotProviders;
      if (!outstandingSnapshotProviders)
      {
        v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v18 = v8->_outstandingSnapshotProviders;
        v8->_outstandingSnapshotProviders = v17;

        outstandingSnapshotProviders = v8->_outstandingSnapshotProviders;
      }
      -[NSMutableArray addObject:](outstandingSnapshotProviders, "addObject:", v15);
    }
  }
  else
  {
    v15 = 0;
  }
  objc_sync_exit(v8);

  return v15;
}

void __78__SBIconController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    v6 = objc_msgSend(v5[48], "indexOfObject:", v10);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5[48], "removeObjectAtIndex:", v6);
    if (!objc_msgSend(v5[48], "count", v6))
    {
      v7 = v5[48];
      v5[48] = 0;

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 376);
      *(_QWORD *)(v8 + 376) = 0;

    }
    objc_sync_exit(v5);

  }
}

- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")) & 1) != 0
    || (objc_msgSend(v8, "isWidgetIcon") & 1) != 0)
  {
    a5 = 1;
  }
  else if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    a5 = SBIconLocationGroupContainsLocation() ^ 1;
  }

  return a5;
}

- (BOOL)isFocusAllowedForIconManager:(id)a3
{
  BOOL v3;
  void *v4;

  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() == 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  return v3;
}

- (unint64_t)iconManager:(id)a3 focusEffectTypeForIconView:(id)a4
{
  return 1;
}

- (id)iconManager:(id)a3 accessibilityTintColorForIconView:(id)a4
{
  void *v4;
  void *v5;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "averageColorForVariant:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)iconManagerCanBeginIconDrags:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSetupMode");

  if (v4)
  {
    SBLogIconDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "disallowing icon drag because we are in setup mode", v7, 2u);
    }

  }
  return v4 ^ 1;
}

- (id)iconManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v4;
  SBAppPlatterDragPreview *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a4;
  v5 = -[SBAppPlatterDragPreview initWithReferenceIconView:sourceView:]([SBAppPlatterDragPreview alloc], "initWithReferenceIconView:sourceView:", v4, 0);
  objc_msgSend(v4, "iconImageCenter");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  -[SBAppPlatterDragPreview setCenter:](v5, "setCenter:", v12, v14);
  -[SBAppPlatterDragPreview setAlpha:](v5, "setAlpha:", 0.0);
  return v5;
}

- (id)windowForIconDragPreviewsForIconManager:(id)a3 forWindowScene:(id)a4
{
  void *v5;
  id v6;
  NSMapTable *v7;
  NSMapTable *windowSceneToMedusaDragWindowContext;
  uint64_t v9;
  void *v10;
  SBMedusaDragWindowContext *v11;
  void *v12;
  void *v13;
  SBIconDragPlatterWindow *v14;
  SBTraitsWindowParticipantDelegate *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIconController windowForIconDragPreviewsForIconManager:forWindowScene:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SBIconController.m"), 6272, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_windowSceneToMedusaDragWindowContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    windowSceneToMedusaDragWindowContext = self->_windowSceneToMedusaDragWindowContext;
    self->_windowSceneToMedusaDragWindowContext = v7;

  }
  v9 = objc_opt_class();
  SBSafeCast(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMapTable objectForKey:](self->_windowSceneToMedusaDragWindowContext, "objectForKey:", v10);
    v11 = (SBMedusaDragWindowContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[SBMedusaDragWindowContext dragWindow](v11, "dragWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && !v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleMedusaDrag")))
    {
      v14 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:]([SBIconDragPlatterWindow alloc], "initWithWindowScene:rootViewController:role:debugName:", v10, v13, CFSTR("SBTraitsParticipantRoleMedusaDrag"), CFSTR("Medusa Portal Source Window"));
    }
    else
    {
      v14 = -[SBMainScreenActiveInterfaceOrientationWindow initWithWindowScene:role:debugName:]([SBOldIconDragPlatterWindow alloc], "initWithWindowScene:role:debugName:", v10, CFSTR("SBTraitsParticipantRoleMedusaDrag"), CFSTR("Medusa Portal Source Window"));
      -[SBIconDragPlatterWindow setContentViewController:](v14, "setContentViewController:", v13);
    }

    v15 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    objc_msgSend(v10, "traitsArbiter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleMedusaDrag"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBTraitsWindowParticipantDelegate setParticipant:ownedByWindow:](v15, "setParticipant:ownedByWindow:", v17, v14);
    -[SBTraitsWindowParticipantDelegate windowDidUpdatePreferredWindowLevel:ownedParticipant:](v15, "windowDidUpdatePreferredWindowLevel:ownedParticipant:", v17, 1.79769313e308);
    -[SBTraitsWindowParticipantDelegate windowDidUpdateSupportedOrientations:ownedParticipant:](v15, "windowDidUpdateSupportedOrientations:ownedParticipant:", 30, v17);
    -[SBTraitsWindowParticipantDelegate windowWillBecomeVisible:ownedParticipant:](v15, "windowWillBecomeVisible:ownedParticipant:", v14, v17);
    objc_msgSend(v17, "setNeedsUpdatePreferencesWithReason:", CFSTR("Setup"));
    -[SBIconDragPlatterWindow setWindowLevel:](v14, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0 + -1.0);
    -[SBWindow setHidden:](v14, "setHidden:", 0);
    -[SBIconDragPlatterWindow setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    v11 = -[SBMedusaDragWindowContext initWithDragWindow:traitsParticipant:traitsParticipantDelegate:]([SBMedusaDragWindowContext alloc], "initWithDragWindow:traitsParticipant:traitsParticipantDelegate:", v14, v17, v15);
    -[NSMapTable setObject:forKey:](self->_windowSceneToMedusaDragWindowContext, "setObject:forKey:", v11, v10);

    v12 = v14;
  }

  return v12;
}

- (void)iconManagerIconDraggingDidChange:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "isIconDragging"))
    -[SBIconController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("SBIconController Dragging"));
  else
    -[SBIconController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("SBIconController Dragging"));
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

- (void)iconManager:(id)a3 willBeginIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSDate *v13;
  NSDate *iconDragSessionBeginDate;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0DABDE8];
  objc_msgSend(a4, "UUIDString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v15[1] = *MEMORY[0x1E0DABDF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DA9D78];
  v11 = v9;
  objc_msgSend(v10, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emitEvent:withPayload:", 28, v11);

  if (!self->_iconDragSessionBeginDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    iconDragSessionBeginDate = self->_iconDragSessionBeginDate;
    self->_iconDragSessionBeginDate = v13;

  }
}

- (void)iconManager:(id)a3 didAddItemsToIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0DABDE8];
  objc_msgSend(a4, "UUIDString", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E0DABDF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 29, v10);

}

- (void)iconManager:(id)a3 didEndIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSDate *iconDragSessionBeginDate;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0DABDE8];
  objc_msgSend(a4, "UUIDString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = *MEMORY[0x1E0DABDF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DA9D78];
  v11 = v9;
  objc_msgSend(v10, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emitEvent:withPayload:", 30, v11);

  if (self->_iconDragSessionBeginDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", self->_iconDragSessionBeginDate);
    v15 = v14;

    iconDragSessionBeginDate = self->_iconDragSessionBeginDate;
    self->_iconDragSessionBeginDate = 0;

    -[SBPowerLogMetricsAggregator emitEventOfType:withDuration:](self->_powerLogAggregator, "emitEventOfType:withDuration:", 2, v15);
  }
}

- (void)iconManager:(id)a3 didSpringLoadIconView:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DABD88];
  v13[0] = &unk_1E91D0728;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DA9D78];
  v9 = v7;
  objc_msgSend(v8, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEvent:withPayload:", 31, v9);

  -[SBIconController iconDragManager](self, "iconDragManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performSpringLoadedInteractionForIconDragOnIconView:", v6);

}

- (void)iconManager:(id)a3 willRemoveFakeStatusBar:(id)a4 forFolderController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reusePool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recycleStatusBar:", v6);

}

- (UIEdgeInsets)iconManager:(id)a3 contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a4
{
  void *v4;
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
  UIEdgeInsets result;

  -[SBIconController homeScreenViewController](self, "homeScreenViewController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_contentOverlayInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_setWidgetEditingDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *widgetEditingLayoutAssertion;
  id v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  void *v10;

  widgetEditingLayoutAssertion = self->_widgetEditingLayoutAssertion;
  if (a3)
  {
    if (!widgetEditingLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v10 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0DAB6B8]);
      objc_msgSend(v10, "setLevel:", 0);
      objc_msgSend(v10, "setFillsDisplayBounds:", 1);
      objc_msgSend(v10, "setLayoutRole:", 6);
      objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addElement:", v10);
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_widgetEditingLayoutAssertion;
      self->_widgetEditingLayoutAssertion = v7;

    }
  }
  else if (widgetEditingLayoutAssertion)
  {
    -[BSInvalidatable invalidate](widgetEditingLayoutAssertion, "invalidate");
    v9 = self->_widgetEditingLayoutAssertion;
    self->_widgetEditingLayoutAssertion = 0;

  }
}

- (void)iconManager:(id)a3 willCloseFolder:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v4 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateReachability");

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("Close Folder"));

  v7 = objc_msgSend(v4, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      v13 = 0;
      v10 = "SB_HOME_DEWEY_POD_CLOSE";
      v11 = (uint8_t *)&v13;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
    }
  }
  else if (v9)
  {
    v12 = 0;
    v10 = "SB_HOME_FOLDER_CLOSE";
    v11 = (uint8_t *)&v12;
    goto LABEL_6;
  }

  kdebug_trace();
}

- (void)iconManager:(id)a3 didCloseFolder:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("Close Folder"));

  v7 = objc_msgSend(v5, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_DEWEY_POD_CLOSE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_FOLDER_CLOSE", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
    }

    kdebug_trace();
    -[SBIconController _setFolderDisplayLayoutElementActive:](self, "_setFolderDisplayLayoutElementActive:", 0);
  }
  -[SBIconController homeScreenViewController](self, "homeScreenViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v10, "setNeedsFocusUpdate");

}

- (void)iconManagerFolderAnimatingDidChange:(id)a3
{
  void *v4;
  _QWORD block[5];

  if ((objc_msgSend(a3, "hasAnimatingFolder") & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SBIconController_iconManagerFolderAnimatingDidChange___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

void __56__SBIconController_iconManagerFolderAnimatingDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userInterfaceController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_updateInterfaceOrientationFromActiveInterfaceOrientation");

}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpen"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppClose"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpenInFolder"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppCloseInFolder"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("FolderOpenAnimation"), CFSTR("FolderOpen"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("FolderCloseAnimation"), CFSTR("FolderClose"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_8()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpenInScreenTime"));
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_9()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppCloseInScreenTime"));
}

- (BOOL)iconManagerCanSaveIconState:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "restoreState");

  if (v4 == 1)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Icon state save prevented due to in progress restore", v7, 2u);
    }

  }
  return v4 != 1;
}

- (void)iconManagerDidSaveIconState:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (self->_sendITunesNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.iconStateChanged"), 0, 0, 1u);
  }
  -[SBProactiveHomeScreenUsageObserver pushCurrentHomeScreenConfiguration](self->_proactiveUsageObserver, "pushCurrentHomeScreenConfiguration", a3);
}

- (id)iconManager:(id)a3 animator:(id)a4 animationSettingsForOperation:(unint64_t)a5 childViewController:(id)a6
{
  return -[SBIconController animator:animationSettingsForOperation:childViewController:](self, "animator:animationSettingsForOperation:childViewController:", a4, a5, a6);
}

- (id)iconManager:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "averageColorInRect:forVariant:", 1, x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isFloatingDockSupportedForIconManager:(id)a3
{
  return +[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported", a3);
}

- (BOOL)isFloatingDockVisibleForIconManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatingDockController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFloatingDockPresented");

  return v5;
}

- (void)presentTodayOverlayForIconManager:(id)a3
{
  id v4;

  if (-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled", a3))
  {
    -[SBIconController iconManager](self, "iconManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentLeadingCustomViewWithCompletion:", 0);
  }
  else
  {
    -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentAnimated:fromLeading:", 1, 1);
  }

}

- (void)presentLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a4;
  v7 = -[SBIconController isAppLibraryAllowed](self, "isAppLibraryAllowed");
  v8 = v14;
  if (v7)
  {
    if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
      v9 = objc_opt_class();
      v10 = v14;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      objc_msgSend(v12, "modalLibraryController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v13, "isPresentingLibraryInForeground") & 1) == 0)
        objc_msgSend(v13, "toggleLibraryPresentedAnimated:completion:", v5, 0);

    }
    else
    {
      -[SBIconController presentLibraryFromOverlayControllerAnimated:completion:](self, "presentLibraryFromOverlayControllerAnimated:completion:", v5, 0);
    }
    v8 = v14;
  }

}

- (void)presentLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v4 = a3;
  v6 = a4;
  if (-[SBIconController isAppLibraryAllowed](self, "isAppLibraryAllowed"))
  {
    -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isPresented")
      || (objc_msgSend(v7, "activeSidebarViewController"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "trailingSidebarViewController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v8 == v9))
    {
      if (!-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
      {
        objc_msgSend(v7, "presentAnimated:fromLeading:completionHandler:", v4, 0, v6);
        goto LABEL_11;
      }
      -[SBIconController iconManager](self, "iconManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2;
      v12[3] = &unk_1E8E9E8D0;
      v13 = v6;
      objc_msgSend(v11, "presentTrailingCustomViewWithCompletion:", v12);

      v10 = v13;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke;
      v14[3] = &unk_1E8EA6868;
      v15 = v7;
      v17 = v4;
      v16 = v6;
      objc_msgSend(v15, "dismissAnimated:completionHandler:", v4, v14);

      v10 = v15;
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_12:

}

uint64_t __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAnimated:fromLeading:completionHandler:", *(unsigned __int8 *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  SBLibraryViewController *v10;
  uint64_t v11;
  id v12;
  SBLibraryViewController *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  SBLibraryViewController *v23;
  id v24;
  BOOL v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = self->_overlayLibraryViewController;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke;
  v21[3] = &unk_1E8EA0DF8;
  v25 = v6;
  v21[4] = self;
  v22 = v8;
  v23 = v10;
  v24 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  v15 = (void *)MEMORY[0x1D17E5550](v21);
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "lastIconPageIndex");
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3;
  v19[3] = &unk_1E8E9E8D0;
  v20 = v15;
  v18 = v15;
  objc_msgSend(v16, "setCurrentPageIndex:animated:completion:", v17, v6, v19);

}

void __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  char v8;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2;
  v4[3] = &unk_1E8EA0470;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "presentLibraryFromOverlayControllerAnimated:completion:", v2, v4);

}

void __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "presentPodWithCategoryIdentifier:animated:completion:", v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (v4)
        (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    }
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      SBHLibraryPresentationErrorForCode();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

    }
  }
}

uint64_t __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  if (-[SBIconController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
  {
    if (-[SBIconController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible"))
    {
      -[SBIconController iconManager](self, "iconManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __54__SBIconController_dismissLibraryAnimated_completion___block_invoke;
      v8[3] = &unk_1E8E9E8D0;
      v9 = v6;
      objc_msgSend(v7, "animateToDefaultStateWithCompletionHandler:", v8);

    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
  else
  {
    -[SBIconController dismissLibraryFromOverlayControllerAnimated:completion:](self, "dismissLibraryFromOverlayControllerAnimated:completion:", v4, v6);
  }

}

uint64_t __54__SBIconController_dismissLibraryAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)dismissLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  SBLibraryViewController *v7;
  SBLibraryViewController *overlayLibraryViewController;
  void (**v9)(id, uint64_t);
  void (**v10)(id, uint64_t);

  v4 = a3;
  v10 = (void (**)(id, uint64_t))a4;
  if (-[SBIconController isAppLibraryAllowed](self, "isAppLibraryAllowed"))
  {
    -[SBIconController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBIconController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible")
      && (objc_msgSend(v6, "activeSidebarViewController"),
          v7 = (SBLibraryViewController *)objc_claimAutoreleasedReturnValue(),
          overlayLibraryViewController = self->_overlayLibraryViewController,
          v7,
          v7 == overlayLibraryViewController))
    {
      -[SBIconController dismissHomeScreenOverlayControllerAnimated:completion:](self, "dismissHomeScreenOverlayControllerAnimated:completion:", v4, v10);
    }
    else if (v10)
    {
      v10[2](v10, 1);
    }

    goto LABEL_10;
  }
  v9 = v10;
  if (v10)
  {
    v10[2](v10, 0);
LABEL_10:
    v9 = v10;
  }

}

- (BOOL)isMainDisplayLibraryViewVisible
{
  void *v2;
  char v3;

  -[SBIconController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainDisplayLibraryViewVisible");

  return v3;
}

- (BOOL)isTodayOverlayPresented
{
  void *v2;
  char v3;

  -[SBIconController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOverlayTodayViewVisible");

  return v3;
}

- (void)dismissTodayOverlayForIconManager:(id)a3
{
  -[SBIconController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
}

- (void)dismissLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    v7 = objc_opt_class();
    v8 = v12;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "modalLibraryController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dismissLibraryAnimated:completion:", v5, 0);
  }
  else
  {
    -[SBIconController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", v5, 0);
  }

}

- (void)dismissOverlaysForIconManager:(id)a3
{
  -[SBIconController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 1);
}

- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxIconListCount");

  if (v5 - 1 >= 0xE)
    return 15;
  else
    return v5;
}

- (BOOL)listsAllowRotatedLayoutForIconManager:(id)a3
{
  return objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3) == 1;
}

- (void)iconManagerDidNoteIconStateChangedExternally:(id)a3
{
  id v4;

  v4 = a3;
  -[SBIconController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
  objc_msgSend(v4, "dismissIconShareSheets");

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 willUseTransitionContext:(id)a5 toTransitionToState:(int64_t)a6
{
  uint64_t v9;
  id v10;

  v10 = a5;
  v9 = objc_msgSend(a4, "pageState");
  if (a6 == 2 && v9 == 3)
    -[SBTodayViewController setTransitionContext:](self->_todayViewController, "setTransitionContext:", v10);

}

- (void)iconManager:(id)a3 dataSource:(id)a4 ofIcon:(id)a5 didUpdateConfigurationData:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  v20 = 0;
  v21 = 0;
  objc_msgSend((id)objc_opt_class(), "_getApplicationDataStore:configurationKey:forDataSource:", &v21, &v20, v8);
  v11 = v21;
  v12 = v20;
  objc_msgSend(v11, "setObject:forKey:", v10, v12);
  v13 = (void *)MEMORY[0x1E0D23068];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__SBIconController_iconManager_dataSource_ofIcon_didUpdateConfigurationData___block_invoke;
  v18[3] = &unk_1E8E9DED8;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v13, "synchronizeWithCompletion:", v18);
  SBLogWidgetIntent();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    SBHConfigurationIdentifierFromDataSource();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v16;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v17;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: updating config data for key: %{public}@, data: %{public}@ bytes", buf, 0x20u);

  }
}

void __77__SBIconController_iconManager_dataSource_ofIcon_didUpdateConfigurationData___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "activeWidget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SBLogWidgetIntent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Writing to disk for icon(%{public}@) config data.", (uint8_t *)&v7, 0xCu);
  }

}

- (void)iconManager:(id)a3 didRemoveConfigurableDataSource:(id)a4 ofIcon:(id)a5
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v10 = 0;
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "_getApplicationDataStore:configurationKey:forDataSource:", &v11, &v10, v5);
  v6 = v11;
  v7 = v10;
  objc_msgSend(v6, "removeObjectForKey:", v7);
  SBLogWidgetIntent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    SBHConfigurationIdentifierFromDataSource();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: removed config data for key: %{public}@", buf, 0x16u);

  }
}

- (void)iconManager:(id)a3 prepareForPageHidingEducationWithCompletionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAnimated:completionHandler:", 1, v5);

}

- (void)iconManager:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  void *v10;
  SBDisableActiveInterfaceOrientationChangeAssertion *v11;
  void *v12;
  void *v13;
  SBFloatingDockBehaviorAssertion *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a6;
  objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBIconControllerDisableRotationForPageHidingReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("SBIconControllerPreventDeviceOrientationChangesForPageHiding"));
  v11 = -[SBDisableActiveInterfaceOrientationChangeAssertion initWithReason:nudgeOrientationOnInvalidate:]([SBDisableActiveInterfaceOrientationChangeAssertion alloc], "initWithReason:nudgeOrientationOnInvalidate:", CFSTR("SBIconControllerDisableRotationForPageHidingReason"), 0);
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"));
  -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingDockController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v13, 1, 0, 1, CFSTR("pageManagement"), 0, 0.0);
  if (v14)
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("SBIconControllerPageHidingFloatingDockBehaviorAssertion"));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__SBIconController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke;
  v18[3] = &unk_1E8E9DED8;
  v19 = v9;
  v15 = v9;
  v16 = MEMORY[0x1D17E5550](v18);
  v17 = (void *)v16;
  if (v8)
    objc_msgSend(v8, "addAnimations:", v16);
  else
    (*(void (**)(uint64_t))(v16 + 16))(v16);

}

void __92__SBIconController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumHomescreenWallpaperScale");
  objc_msgSend(v4, "setHomescreenWallpaperScale:withAnimationFactory:", 0, fmax(v2, 0.8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, CFSTR("SBIconControllerChangeWallpaperScaleForPageHiding"));

}

- (void)iconManager:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a5;
  objc_msgSend(v7, "objectForKey:", CFSTR("SBIconControllerChangeWallpaperScaleForPageHiding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("SBIconControllerChangeWallpaperScaleForPageHiding"));
  objc_msgSend(v7, "objectForKey:", CFSTR("SBIconControllerPageHidingFloatingDockBehaviorAssertion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("SBIconControllerPageHidingFloatingDockBehaviorAssertion"));
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__SBIconController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke;
  v14[3] = &unk_1E8E9DED8;
  v15 = v8;
  v11 = v8;
  v12 = MEMORY[0x1D17E5550](v14);
  v13 = (void *)v12;
  if (v6)
    objc_msgSend(v6, "addAnimations:", v12);
  else
    (*(void (**)(uint64_t))(v12 + 16))(v12);

}

uint64_t __79__SBIconController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)iconManager:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("SBIconControllerPreventDeviceOrientationChangesForPageHiding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SBIconControllerPreventDeviceOrientationChangesForPageHiding"));
  objc_msgSend(v6, "objectForKey:", CFSTR("SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"));

  objc_msgSend(v11, "completionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    SBWorkspaceActivateApplicationFromURL(v9, 0, 0);
    objc_msgSend(v11, "setCompletionURL:", 0);
  }

}

- (void)iconManagerWillPresentWidgetEditing:(id)a3
{
  void *v4;
  void *v5;
  SBFloatingDockBehaviorAssertion *v6;
  SBFloatingDockBehaviorAssertion *addWidgetSheetFloatingDockBehaviorAssertion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BSInvalidatable *v14;
  BSInvalidatable *addWidgetSheetKeyboardFocusAssertion;

  if (!self->_addWidgetSheetFloatingDockBehaviorAssertion)
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatingDockController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v5, 1, 1, 3, CFSTR("addWidgetSheet"), 0, 0.0);
    addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
    self->_addWidgetSheetFloatingDockBehaviorAssertion = v6;

    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_addWidgetSheetKeyboardFocusAssertion)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyboardFocusController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardFocusLockReason addWidgetSheet](SBKeyboardFocusLockReason, "addWidgetSheet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "focusLockSpringBoardWindow:forReason:", v10, v13);
      v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
      self->_addWidgetSheetKeyboardFocusAssertion = v14;

    }
    if ((objc_msgSend(v10, "isKeyWindow") & 1) == 0)
      objc_msgSend(v10, "makeKeyWindow");

  }
  -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](self->_widgetAddSheetAffordanceViewController, "setWantsToBeActiveAffordance:", 1);
  -[SBIconController _setWidgetEditingDisplayLayoutElementActive:](self, "_setWidgetEditingDisplayLayoutElementActive:", 1);
}

- (void)iconManagerDidDismissWidgetEditing:(id)a3
{
  SBFloatingDockBehaviorAssertion *addWidgetSheetFloatingDockBehaviorAssertion;
  BSInvalidatable *addWidgetSheetKeyboardFocusAssertion;
  BSInvalidatable *v6;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_addWidgetSheetFloatingDockBehaviorAssertion, "invalidate", a3);
  addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
  self->_addWidgetSheetFloatingDockBehaviorAssertion = 0;

  -[SBIconController _setWidgetEditingDisplayLayoutElementActive:](self, "_setWidgetEditingDisplayLayoutElementActive:", 0);
  -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](self->_widgetAddSheetAffordanceViewController, "setWantsToBeActiveAffordance:", 0);
  addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
  if (addWidgetSheetKeyboardFocusAssertion)
  {
    -[BSInvalidatable invalidate](addWidgetSheetKeyboardFocusAssertion, "invalidate");
    v6 = self->_addWidgetSheetKeyboardFocusAssertion;
    self->_addWidgetSheetKeyboardFocusAssertion = 0;

  }
}

- (void)iconManagerWillAnimateWidgetInsertion:(id)a3
{
  -[SBPowerLogMetricsAggregator emitEventOfType:](self->_powerLogAggregator, "emitEventOfType:", 0);
}

- (BOOL)iconManager:(id)a3 canAddIconToIgnoredList:(id)a4
{
  return objc_msgSend(a4, "isApplicationIcon", a3);
}

- (BOOL)iconManager:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4
{
  return !-[SBIconController shouldAddNewIconsToRootFolder](self, "shouldAddNewIconsToRootFolder", a3, a4);
}

- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogWidgetDiscoverability();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "containerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] checking widget = %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v5, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconController _isWidgetWithContainerBundleIdentifierValid:](self, "_isWidgetWithContainerBundleIdentifierValid:", v8);

  return v9;
}

- (BOOL)iconManager:(id)a3 isCustomElementValid:(id)a4
{
  void *v5;
  BOOL v6;

  objc_msgSend(a4, "containerBundleIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[SBIconController _isWidgetWithContainerBundleIdentifierValid:](self, "_isWidgetWithContainerBundleIdentifierValid:", v5);
  else
    v6 = 1;

  return v6;
}

- (BOOL)_isWidgetWithContainerBundleIdentifierValid:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWidgetDiscoverability();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] applicationIdentifier = %@", (uint8_t *)&v27, 0xCu);
  }

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRestoring");

  if ((v7 & 1) == 0)
  {
    -[SBIconController applicationPlaceholderController](self, "applicationPlaceholderController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeholderForDisplayID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      SBLogWidgetDiscoverability();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] valid placeholder", (uint8_t *)&v27, 2u);
      }
      v8 = 1;
      goto LABEL_25;
    }
    -[SBIconController applicationController](self, "applicationController");
    v11 = objc_claimAutoreleasedReturnValue();
    SBLogWidgetDiscoverability();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject allBundleIdentifiers](v11, "allBundleIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] all application bundle identifiers = %@", (uint8_t *)&v27, 0xCu);

    }
    -[NSObject applicationWithBundleIdentifier:](v11, "applicationWithBundleIdentifier:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgetDiscoverability();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v14;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] application = %@", (uint8_t *)&v27, 0xCu);
    }

    if (v14)
    {
      if (self->_isAppAllowlistActiveAndTransient)
      {
        SBLogWidgetDiscoverability();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:
          v8 = 1;
LABEL_23:

LABEL_24:
LABEL_25:

          goto LABEL_26;
        }
        LOWORD(v27) = 0;
        v17 = "[ContainerBundleIdentifier debugging] not valid restricted, but current layout is transient. Permitting widget.";
LABEL_17:
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v27, 2u);
        goto LABEL_18;
      }
      -[SBIconController applicationController](self, "applicationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "restrictionController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isApplicationIdentifierRestricted:", v4);

      if (!v22)
      {
        v8 = 1;
        goto LABEL_24;
      }
      v23 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.news"));
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470F8]);

      SBLogWidgetDiscoverability();
      v16 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v23 && v25 == 1)
      {
        if (!v26)
          goto LABEL_18;
        LOWORD(v27) = 0;
        v17 = "[ContainerBundleIdentifier debugging] News app is restricted, but the widget is valid and not restricted";
        goto LABEL_17;
      }
      if (v26)
      {
        LOWORD(v27) = 0;
        v18 = "[ContainerBundleIdentifier debugging] not valid restricted";
        goto LABEL_21;
      }
    }
    else
    {
      SBLogWidgetDiscoverability();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        v18 = "[ContainerBundleIdentifier debugging] not valid application";
LABEL_21:
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v27, 2u);
      }
    }
    v8 = 0;
    goto LABEL_23;
  }
  v8 = 1;
LABEL_26:

  return v8;
}

- (BOOL)canAppPredictionsWidgetAlignWithGrid
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  return !v2;
}

- (BOOL)iconManager:(id)a3 canCustomElementAlignWithGrid:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;

  v5 = a4;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0
      || -[SBIconController canAppPredictionsWidgetAlignWithGrid](self, "canAppPredictionsWidgetAlignWithGrid");
}

- (BOOL)iconManager:(id)a3 canAddIcon:(id)a4 toIconList:(id)a5 inFolder:(id)a6
{
  return 1;
}

- (void)iconManager:(id)a3 prepareAddSheetViewController:(id)a4
{
  id v5;
  SBBarSwipeAffordanceViewController *widgetAddSheetAffordanceViewController;
  void *v7;
  SBBarSwipeAffordanceViewController *v8;
  SBBarSwipeAffordanceViewController *v9;
  SBBarSwipeAffordanceViewController *v10;
  void *v11;
  id v12;

  v5 = a4;
  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  v12 = v5;
  if (!widgetAddSheetAffordanceViewController)
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBBarSwipeAffordanceViewController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceViewController alloc], "initWithZStackParticipantIdentifier:windowScene:", 6, v7);
    v9 = self->_widgetAddSheetAffordanceViewController;
    self->_widgetAddSheetAffordanceViewController = v8;
    v10 = v8;

    -[SBBarSwipeAffordanceViewController view](v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObserver:", self);
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "setHomeAffordanceHidden:", 1);

    v5 = v12;
    widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  }
  objc_msgSend(v5, "setBarSwipeViewController:", widgetAddSheetAffordanceViewController);

}

- (void)iconManager:(id)a3 displayFeatureIntroductionItem:(id)a4 atLocation:(unint64_t)a5
{
  -[SBIconController displayFeatureIntroductionItem:atLocation:](self, "displayFeatureIntroductionItem:atLocation:", a4, a5);
}

- (void)iconManager:(id)a3 displayFeatureIntroductionItemIfUnlocked:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "featureIntroductionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFeatureIntroductionItem:atLocations:", v9, 4);
  -[SBIconController lockScreenManager](self, "lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUILocked");

  if ((v8 & 1) == 0)
    -[SBIconController displayFeatureIntroductionItem:atLocation:](self, "displayFeatureIntroductionItem:atLocation:", v9, 4);

}

- (id)iconManager:(id)a3 floatingDockViewControllerForViewController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)iconManager:(id)a3 isEditingAllowedForIconView:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplayWindowScene");

  return v5;
}

- (id)iconManager:(id)a3 widgetDataSourceForReplacingIconWithWidget:(id)a4 proposedWidgetDataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
  {
    if (objc_msgSend(v8, "isApplicationIcon"))
    {
      objc_msgSend(v8, "applicationBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
      {
        objc_msgSend(v7, "widgetExtensionProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sbh_defaultDescriptorForContainerBundleIdentifier:", CFSTR("com.apple.PeopleViewService"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "sbh_iconDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)iconManager:(id)a3 applicationIconForReplacingIconWithAppIcon:(id)a4 proposedApplicationIcon:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v8)
  {
    if (objc_msgSend(v7, "isWidgetIcon") && (objc_msgSend(v7, "isWidgetStackIcon") & 1) == 0)
    {
      objc_msgSend(v7, "activeWidget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "extensionBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "kind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.PeopleViewService"))
        && objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"))
        && objc_msgSend(v13, "isEqualToString:", CFSTR("SingleContactWidget_iOS")))
      {
        -[SBIconController model](self, "model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "applicationIconForBundleIdentifier:", CFSTR("com.apple.MobileAddressBook"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)iconManager:(id)a3 willChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6
{
  -[SBIconController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("ChangeSizeOfIcon"), a4, a5, a6);
}

- (void)iconManager:(id)a3 didChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6
{
  -[SBIconController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("ChangeSizeOfIcon"), a4, a5, a6);
}

- (void)iconManagerToggleHomeScreenWallpaperDimming:(id)a3
{
  -[SBWallpaperIconStyleCoordinator setWallpaperDimmed:](self->_iconStyleCoordinator, "setWallpaperDimmed:", -[SBWallpaperIconStyleCoordinator isWallpaperDimmed](self->_iconStyleCoordinator, "isWallpaperDimmed", a3) ^ 1);
}

- (BOOL)isHomeScreenWallpaperDimmedForIconManager:(id)a3
{
  return -[SBWallpaperIconStyleCoordinator isWallpaperDimmed](self->_iconStyleCoordinator, "isWallpaperDimmed", a3);
}

- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.Health.Sleep"))
    && objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension")))
  {

    v6 = CFSTR("com.apple.Health");
  }

  return v6;
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  SBBarSwipeAffordanceViewController *widgetAddSheetAffordanceViewController;
  id v6;
  id v7;

  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  v6 = a3;
  -[SBBarSwipeAffordanceViewController barSwipeAffordanceView](widgetAddSheetAffordanceViewController, "barSwipeAffordanceView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && a4 == 1)
    return 58;
  else
    return 0;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  SBBarSwipeAffordanceViewController *widgetAddSheetAffordanceViewController;
  id v5;
  id v6;
  id v7;

  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  v5 = a3;
  -[SBBarSwipeAffordanceViewController barSwipeAffordanceView](widgetAddSheetAffordanceViewController, "barSwipeAffordanceView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)libraryViewControllerRequestsDismissal:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[SBIconController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v6, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dismissLibraryAnimated:completion:", 1, 0);
  }
  else
  {
    -[SBIconController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", 1, 0);
  }

}

- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4
{
  id v4;

  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addReasonToDisableDismissGestureRecognizer:", CFSTR("kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"));

}

- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4
{
  id v4;

  -[SBIconController homeScreenOverlayController](self, "homeScreenOverlayController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeReasonToDisableDismissGestureRecognizer:", CFSTR("kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"));

}

- (void)libraryViewControllerWillPresent:(id)a3
{
  id v3;

  -[SBIconController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissWidgetEditingViewControllerIfPresentedAnimated:", 1);

}

- (void)libraryViewControllerDidDismiss:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogTelemetrySignposts();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
}

- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  NSHashTable *libraryViewControllersActivatingSpotlightAppService;
  NSHashTable *v9;
  NSHashTable *v10;
  uint64_t v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

  libraryViewControllersActivatingSpotlightAppService = self->_libraryViewControllersActivatingSpotlightAppService;
  if (!libraryViewControllersActivatingSpotlightAppService)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_libraryViewControllersActivatingSpotlightAppService;
    self->_libraryViewControllersActivatingSpotlightAppService = v9;

    libraryViewControllersActivatingSpotlightAppService = self->_libraryViewControllersActivatingSpotlightAppService;
  }
  v11 = -[NSHashTable count](libraryViewControllersActivatingSpotlightAppService, "count");
  -[NSHashTable addObject:](self->_libraryViewControllersActivatingSpotlightAppService, "addObject:", v6);

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DA9D08], "sharedAppService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activate");

  }
}

- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4
{
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
  }

  kdebug_trace();
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a3;
  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  kdebug_trace();
  -[NSHashTable removeObject:](self->_libraryViewControllersActivatingSpotlightAppService, "removeObject:", v5);

  if (!-[NSHashTable count](self->_libraryViewControllersActivatingSpotlightAppService, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA9D08], "sharedAppService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivate");

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  SBHIconEditingSettings *v7;
  void *v8;
  SBHIconEditingSettings *v9;

  v9 = (SBHIconEditingSettings *)a3;
  v6 = a4;
  -[SBIconController rootFolderSettings](self, "rootFolderSettings");
  v7 = (SBHIconEditingSettings *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("showsSpotlightOnEveryPage")))
    {
      -[SBIconController iconManager](self, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tearDownAndResetRootIconLists");

    }
  }
  else if (self->_iconEditingSettings == v9)
  {
    -[SBIconController _configureEditingGestureRecognizers](self, "_configureEditingGestureRecognizers");
  }

}

- (void)folderIconStateDidDirty:(id)a3
{
  objc_msgSend((id)SBApp, "noteHomeScreenLayoutDidChange", a3);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", 0);
  objc_msgSend(v4, "setHomeGestureConsumption:", 1);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  SBIconController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBIconController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E8E9E270;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__SBIconController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v1 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "appProtectionSubjectMonitorSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(v1 + 48), "bs_map:", &__block_literal_global_654_0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v25;
      *(_QWORD *)&v5 = 138412290;
      v20 = v5;
      v21 = *(_QWORD *)v25;
      do
      {
        v8 = 0;
        v22 = v6;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
          objc_msgSend(v9, "bundleIdentifier", v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 40), "hiddenAppBundleIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isHidden"))
          {
            objc_msgSend(*(id *)(v1 + 40), "hiddenAppBundleIdentifiers");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (!v12)
              v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v12, "addObject:", v10);
            v13 = v1;
            objc_msgSend(*(id *)(v1 + 40), "iconManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "iconModel");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "applicationIconForBundleIdentifier:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v14, "addIconToIgnoredList:options:completion:", v17, 3, 0);
            }
            else
            {
              SBLogAppProtection();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v9, "bundleIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v20;
                v29 = v19;
                _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Could not add bundle identifier:%@ to ignored list. app icon is nil", buf, 0xCu);

              }
            }
            v7 = v21;

            v1 = v13;
            v6 = v22;
          }
          else if (objc_msgSend(v11, "containsObject:", v10))
          {
            objc_msgSend(v11, "removeObject:", v10);
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v6);
    }

  }
}

id __65__SBIconController_appProtectionSubjectsChanged_forSubscription___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
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

  return v6;
}

- (void)searchBarDidFocus
{
  id v2;

  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isTransitioningPageState") & 1) == 0 && (SBSpotlightIsVisible() & 1) == 0)
    objc_msgSend(v2, "presentSpotlightAnimated:completionHandler:", 1, 0);

}

- (void)proactiveHomeScreenSuggestionProviderDidUpdatePrediction:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "currentPrediction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconController proactiveUsageObserver](self, "proactiveUsageObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentPrediction:", v5);

}

- (void)proactiveHomeScreenSuggestionProvider:(id)a3 willUseTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  SBLogWidgetIntent();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138413058;
    v14 = v9;
    v15 = 2048;
    v16 = objc_msgSend(v9, "_indexingHash");
    v17 = 2112;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Setting temporary intent '%@/%lld' for icons with identifier '%@' / widgetUniqueIdentifier: %{public}@", (uint8_t *)&v13, 0x2Au);
  }

  -[SBIconController setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:](self, "setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:", v9, v10, v11);
}

- (BOOL)appPredictionViewController:(id)a3 launchAppFromIcon:(id)a4
{
  return 0;
}

- (id)appPredictionViewController:(id)a3 badgeValueForApplicationWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (-[NSMutableSet containsObject:](self->_displayIDsWithBadgingEnabled, "containsObject:", v5))
  {
    -[SBIconController applicationController](self, "applicationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "badgeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)appPredictionViewController:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4
{
  return -[SBIconController _allowsBadgingForApplicationBundleIdentifier:](self, "_allowsBadgingForApplicationBundleIdentifier:", a4);
}

- (id)appPredictionViewController:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBIconController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIconForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)additionalIconListLayoutObserversForAppPredictionViewController:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBIconController iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (void)significantTimeChanged
{
  -[SBIconController _analyticsLoggingForOptimizedHomeScreen](self, "_analyticsLoggingForOptimizedHomeScreen");
  -[SBIconController _analyticsLoggingForDisplayZoomMode](self, "_analyticsLoggingForDisplayZoomMode");
}

- (void)_analyticsLoggingForOptimizedHomeScreen
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  _QWORD v10[5];
  _QWORD v11[4];

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automaticallyAddsNewApplications");

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  -[SBIconController rootFolder](self, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SBIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke;
  v10[3] = &unk_1E8EA6508;
  v10[4] = v11;
  objc_msgSend(v5, "enumerateAllIconsUsingBlock:", v10);

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  -[SBIconController rootFolder](self, "rootFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __59__SBIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke_2;
  v8[3] = &unk_1E8EA6508;
  v8[4] = v9;
  objc_msgSend(v7, "enumerateAllIconsWithOptions:usingBlock:", 3, v8);

  AnalyticsSendEventLazy();
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

uint64_t __59__SBIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isApplicationIcon");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __59__SBIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isApplicationIcon");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id __59__SBIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DAA6C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DAA6B8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_analyticsLoggingForDisplayZoomMode
{
  SBHScreenTypeForCurrentDevice();
  if ((SBHScreenTypeIsMoreSpace() & 1) == 0)
  {
    SBHScreenTypeForCurrentDevice();
    SBHScreenTypeIsZoomed();
  }
  AnalyticsSendEventLazy();
}

id __55__SBIconController__analyticsLoggingForDisplayZoomMode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DAA698];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DAA6A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBIconController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBIconController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __67__SBIconController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_updateFocusModeManagerWithDoNotDisturbState:", v2);

}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v16 = 0;
  objc_msgSend(a3, "availableModesReturningError:", &v16, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBIconController modeConfigurationService:didReceiveAvailableModesUpdate:].cold.1();

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke;
  v14[3] = &unk_1E8EA6950;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2;
  v12[3] = &unk_1E8E9E820;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "rootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_3;
  v4[3] = &unk_1E8EA69A0;
  v5 = *(id *)(a1 + 40);
  v6 = v2;
  v3 = v2;
  objc_msgSend(v3, "enumerateListsUsingBlock:", v4);

}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "focusModeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_4;
  v6[3] = &unk_1E8EA6978;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    SBLogFocusModes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Removing a focus mode that no longer exists: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA468]), "initWithIdentifier:folder:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "removeFromList:", *(_QWORD *)(a1 + 48));

  }
}

- (id)createStatusBarVisibiltyAssertionForWindowScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 0, 0, CFSTR("show on homescreen backstop"));

  return v5;
}

- (void)updateRootFolderWithCurrentDoNotDisturbState
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "queryCurrentStateWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2;
  v4[3] = &unk_1E8E9E820;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusModeManagerWithDoNotDisturbState:", *(_QWORD *)(a1 + 40));
}

- (void)_updateFocusModeManagerWithDoNotDisturbState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SBIconController iconManager](self, "iconManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "focusModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController _focusModeFromDoNotDisturbState:](self, "_focusModeFromDoNotDisturbState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setActiveFocusMode:", v6);
  if (objc_msgSend(v6, "customizedHomeScreenPagesEnabled"))
  {
    -[SBIconController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetRecentsAndSuggestions");

  }
}

- (id)_focusModeFromDoNotDisturbState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  SEL v12;
  uint64_t v13;
  NSString *v14;
  SEL v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isActive"))
  {
    objc_msgSend(v4, "activeModeConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();

    -[SBIconController rootFolder](self, "rootFolder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA468]), "initWithIdentifier:folder:", v8, v37);
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v10);

    objc_msgSend(v6, "symbolImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSymbol:", v11);

    if (objc_msgSend(v6, "semanticType") == 1)
      objc_msgSend(v9, "setSleepFocus:", 1);
    objc_msgSend(v6, "tintColorName");
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = NSSelectorFromString(v35);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "performSelector:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1D5F0], "defaultTintColorName");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = NSSelectorFromString(v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "performSelector:", v15);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
    objc_msgSend(v9, "setColor:", v13);
    objc_msgSend(v5, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hideApplicationBadges");
    v40 = v4;
    if (objc_msgSend(v16, "applicationConfigurationType"))
    {
      if (objc_msgSend(v16, "applicationConfigurationType", v13, v35) == 1)
        objc_msgSend(v9, "setHidesOnlyDeniedApplicationBadges:", v17 == 2);
    }
    else
    {
      objc_msgSend(v9, "setShowsOnlyAllowedApplicationBadges:", v17 == 2, v13, v35);
    }
    v39 = v5;
    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v16, "allowedApplicationIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "bundleID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v22);
    }

    objc_msgSend(v9, "setAllowedApplicationBundleIdentifiers:", v18);
    v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v16, "deniedApplicationIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "bundleID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

    objc_msgSend(v9, "setDeniedApplicationBundleIdentifiers:", v26);
    v4 = v40;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)testSetupForIconManagerWidgetScrollPerformanceTest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[10];
  _QWORD v38[10];
  _QWORD v39[7];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DAA770];
  objc_msgSend(MEMORY[0x1E0DAA568], "todayNewsWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA770]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v36;
  v4 = *MEMORY[0x1E0DAA7A0];
  objc_msgSend(MEMORY[0x1E0DAA568], "overviewStocksWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA7A0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v35;
  objc_msgSend(MEMORY[0x1E0DAA568], "calendarWidgetIconDescriptorForSizeClass:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v34;
  objc_msgSend(MEMORY[0x1E0DAA558], "health");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v33;
  objc_msgSend(MEMORY[0x1E0DAA558], "home");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v32;
  objc_msgSend(MEMORY[0x1E0DAA558], "passbook");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v31;
  objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v29;
  objc_msgSend(MEMORY[0x1E0DAA568], "remindersWidgetIconDescriptorForSizeClass:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v28;
  objc_msgSend(MEMORY[0x1E0DAA568], "tvWidgetIconDescriptorForSizeClass:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v27;
  objc_msgSend(MEMORY[0x1E0DAA558], "documents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v26;
  objc_msgSend(MEMORY[0x1E0DAA558], "findMy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v25;
  objc_msgSend(MEMORY[0x1E0DAA558], "shortcuts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v24;
  objc_msgSend(MEMORY[0x1E0DAA558], "iTunesStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v23;
  objc_msgSend(MEMORY[0x1E0DAA558], "tips");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v22;
  objc_msgSend(MEMORY[0x1E0DAA558], "translate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v21;
  objc_msgSend(MEMORY[0x1E0DAA558], "contacts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v20;
  objc_msgSend(MEMORY[0x1E0DAA558], "watch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v18;
  objc_msgSend(MEMORY[0x1E0DAA570], "defaultStackIconDescriptorForSizeClass:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  objc_msgSend(MEMORY[0x1E0DAA568], "recentsWidgetIconDescriptorForSizeClass:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v16;
  objc_msgSend(MEMORY[0x1E0DAA558], "documents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v5;
  objc_msgSend(MEMORY[0x1E0DAA558], "findMy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v6;
  objc_msgSend(MEMORY[0x1E0DAA558], "shortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v7;
  objc_msgSend(MEMORY[0x1E0DAA558], "iTunesStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v8;
  objc_msgSend(MEMORY[0x1E0DAA558], "health");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v9;
  objc_msgSend(MEMORY[0x1E0DAA558], "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v10;
  objc_msgSend(MEMORY[0x1E0DAA558], "passbook");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v11;
  objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)testSetupForIconManagerAddWidgetsToEachPage:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DAA770];
  objc_msgSend(MEMORY[0x1E0DAA568], "gasparWatchDogWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA770]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0DAA568], "relivePhotosWidgetIconDescriptorForSizeClass:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0DAA568], "mobileNotesWidgetIconDescriptorForSizeClass:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0DAA568], "remindersWidgetIconDescriptorForSizeClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)testSetupForIconManagerWidgetScrollTest:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  void *v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[8];
  _QWORD v39[19];

  v39[17] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v34 = (id)objc_opt_new();
  v3 = 0;
  v32 = (void *)*MEMORY[0x1E0DAA770];
  v24 = *MEMORY[0x1E0DAA768];
  v25 = *MEMORY[0x1E0DAA7A0];
  v23 = *MEMORY[0x1E0DAA758];
  do
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v32;
      __asm { BR              X9 }
    }
    if ((v3 & 1 | 2) == 2)
    {
      objc_msgSend(MEMORY[0x1E0DAA568], "dateTimeWidgetIconDescriptorForSizeClass:", v25);
      v35 = objc_claimAutoreleasedReturnValue();
      v39[0] = v35;
      objc_msgSend(MEMORY[0x1E0DAA568], "notesWidgetIconDescriptorForSizeClass:", v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v37;
      objc_msgSend(MEMORY[0x1E0DAA570], "padDefaultLeadingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:", v24);
      v31 = objc_claimAutoreleasedReturnValue();
      v39[2] = v31;
      objc_msgSend(MEMORY[0x1E0DAA568], "calendarWidgetIconDescriptorForSizeClass:", v32);
      v30 = objc_claimAutoreleasedReturnValue();
      v39[3] = v30;
      objc_msgSend(MEMORY[0x1E0DAA570], "padDefaultTrailingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:", v24);
      v7 = objc_claimAutoreleasedReturnValue();
      v39[4] = v7;
      v33 = v4;
      objc_msgSend(MEMORY[0x1E0DAA558], "facetime");
      v8 = objc_claimAutoreleasedReturnValue();
      v39[5] = v8;
      objc_msgSend(MEMORY[0x1E0DAA558], "documents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[6] = v36;
      objc_msgSend(MEMORY[0x1E0DAA558], "reminders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39[7] = v9;
      objc_msgSend(MEMORY[0x1E0DAA558], "maps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39[8] = v10;
      objc_msgSend(MEMORY[0x1E0DAA558], "home");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39[9] = v29;
      objc_msgSend(MEMORY[0x1E0DAA558], "camera");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[10] = v28;
      objc_msgSend(MEMORY[0x1E0DAA558], "appStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[11] = v27;
      objc_msgSend(MEMORY[0x1E0DAA558], "books");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39[12] = v26;
      objc_msgSend(MEMORY[0x1E0DAA558], "podcasts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39[13] = v11;
      objc_msgSend(MEMORY[0x1E0DAA558], "tv");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39[14] = v12;
      objc_msgSend(MEMORY[0x1E0DAA558], "news");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39[15] = v13;
      objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[16] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObjectsFromArray:", v15);

      v16 = (void *)v8;
      v17 = (void *)v7;

      v4 = v33;
      v18 = (void *)v35;
      v19 = (void *)v31;

      v20 = (void *)v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DAA568], "tvWidgetIconDescriptorForSizeClass:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v18;
      objc_msgSend(MEMORY[0x1E0DAA558], "findMy");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v37;
      objc_msgSend(MEMORY[0x1E0DAA558], "shortcuts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v19;
      objc_msgSend(MEMORY[0x1E0DAA558], "iTunesStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v20;
      objc_msgSend(MEMORY[0x1E0DAA558], "health");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v17;
      objc_msgSend(MEMORY[0x1E0DAA558], "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[5] = v16;
      objc_msgSend(MEMORY[0x1E0DAA558], "passbook");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38[6] = v36;
      objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38[7] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v10);
    }

    objc_msgSend(v34, "addObject:", v4);
    ++v3;
  }
  while (v3 != 8);

  return v34;
}

- (id)testSetupHomeScreenForWidgetScrollPerformanceTest:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DAA7A0];
  objc_msgSend(MEMORY[0x1E0DAA568], "calendarWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA7A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0DAA568], "podcastWidgetIconDescriptorForSizeClass:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0DAA568], "relivePhotosWidgetIconDescriptorForSizeClass:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0DAA568], "batteryWidgetIconDescriptorForSizeClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4;
  SBHLibraryCategoryMapProvider *categoryMapProvider;
  id v6;
  id v8;

  v4 = a3;
  if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    categoryMapProvider = self->_categoryMapProvider;
    v8 = 0;
    -[SBHLibraryCategoryMapProvider overrideCategoryMapForTestingAtURL:error:](categoryMapProvider, "overrideCategoryMapForTestingAtURL:error:", v4, &v8);
    v6 = v8;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_configureDeweyOneCategoryWithAllApps
{
  SBIconModel *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    v3 = self->_iconModel;
    -[SBHIconModel leafIcons](v3, "leafIcons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v3, "isIconVisible:", v11, (_QWORD)v18))
          {
            objc_msgSend(v11, "applicationBundleID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(v11, "leafIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v11, v13);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v8);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0DAA4E0]);
    objc_msgSend(MEMORY[0x1E0DAA4D0], "categoryWithLocalizedDisplayName:categoryID:categoryIndex:", CFSTR("Reference & Reading"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCategoryIdentifiers:", v16);

    objc_msgSend(v14, "setLocalizedCategoryName:forCategoryIdentifier:", CFSTR("Reference & Reading"), v15);
    objc_msgSend(v5, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v17, v15);

    -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self->_categoryMapProvider, "overrideCategoryMapForTesting:", v14);
  }
}

- (void)_configureDeweyEachAppHasItsOwnCategory:(unint64_t)a3
{
  SBIconModel *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    v17 = a3;
    v5 = self->_iconModel;
    -[SBHIconModel leafIcons](v5, "leafIcons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v5, "isIconVisible:", v12, v17))
          {
            objc_msgSend(v12, "applicationBundleID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v12, "leafIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v12, v14);

            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    v15 = objc_alloc_init(MEMORY[0x1E0DAA4E0]);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__SBIconController__configureDeweyEachAppHasItsOwnCategory___block_invoke;
    v18[3] = &unk_1E8EA69C8;
    v20 = v22;
    v16 = v15;
    v19 = v16;
    v21 = v17;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v18);
    -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self->_categoryMapProvider, "overrideCategoryMapForTesting:", v16);

    _Block_object_dispose(v22, 8);
  }
}

void __60__SBIconController__configureDeweyEachAppHasItsOwnCategory___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DAA4D0];
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "categoryWithLocalizedDisplayName:categoryID:categoryIndex:", v10, v8, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addCategoryIdentifier:", v11);
  v12 = *(void **)(a1 + 32);
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v13, v11);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v9, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setLocalizedCategoryName:forCategoryIdentifier:", v15, v11);
  v16 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  v17 = *(_QWORD *)(a1 + 48);
  if (v16 > v17 && v17 != 0)
    *a4 = 1;

}

- (void)_configureLibraryWithCategoryLimit:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[SBIconController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    -[SBIconController _libraryViewControllers](self, "_libraryViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "podFolderViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dataSource");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setMaximumNumberOfDisplayedCategories:", a3);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_teardownDeweyTestConfigurations
{
  id v3;

  -[SBHLibraryCategoryMapProvider overrideCategoryMapForTesting:](self->_categoryMapProvider, "overrideCategoryMapForTesting:", 0);
  v3 = (id)-[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self->_categoryMapProvider, "requestLibraryCategoryMapRefreshWithOptions:reason:", 15, CFSTR("Tearing down test config"));
  -[SBIconController _configureLibraryWithCategoryLimit:](self, "_configureLibraryWithCategoryLimit:", -1);
}

- (void)_presentPageManagement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentPageManagement:", v4);

}

- (void)_dismissPageManagementIfPresented:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconController _rootFolderController](self, "_rootFolderController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dismissPageManagementIfPresented:", v4);

}

- (void)iconManager:(id)a3 setTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
  -[SBIconController setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:](self, "setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:", a4, a5, a6);
}

- (void)iconStyleCoordinatorDidUpdate:(id)a3
{
  id v4;
  _QWORD v5[5];

  -[SBIconController iconManager](self, "iconManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setListLayoutProviderLayoutOptions:animated:", -[SBIconController bestListLayoutProviderLayoutOptions](self, "bestListLayoutProviderLayoutOptions"), 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBIconController_iconStyleCoordinatorDidUpdate___block_invoke;
  v5[3] = &unk_1E8EA69F0;
  v5[4] = self;
  -[SBIconController enumerateTintableViewControllersUsingBlock:](self, "enumerateTintableViewControllersUsingBlock:", v5);
  -[SBIconController informIconStyleObserversOfStyleChange](self, "informIconStyleObserversOfStyleChange");

}

uint64_t __50__SBIconController_iconStyleCoordinatorDidUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHomeScreenTraitOverridesForViewController:", a2);
}

- (id)powerLogAggregator
{
  return self->_powerLogAggregator;
}

- (id)libraryCategoryMapProvider
{
  return self->_categoryMapProvider;
}

- (id)displayIDsWithBadgingEnabled
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)-[NSMutableSet copy](self->_displayIDsWithBadgingEnabled, "copy");
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)addIconModelControllerObserver:(id)a3
{
  id v5;
  NSHashTable *iconModelControllerObservers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 7964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  iconModelControllerObservers = self->_iconModelControllerObservers;
  if (!iconModelControllerObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_iconModelControllerObservers;
    self->_iconModelControllerObservers = v7;

    v5 = v10;
    iconModelControllerObservers = self->_iconModelControllerObservers;
  }
  -[NSHashTable addObject:](iconModelControllerObservers, "addObject:", v5);

}

- (void)removeIconModelControllerObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController.m"), 7972, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_iconModelControllerObservers, "removeObject:", v5);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
  {
    -[SBIconController model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("model"));
  }
  else
  {
    -[SBIconController homeScreenViewController](self, "homeScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "orientation") == 1)
    {
      v7 = CFSTR("UIInterfaceOrientationPortrait");
    }
    else if (objc_msgSend(v5, "orientation") == 4)
    {
      v7 = CFSTR("UIInterfaceOrientationLandscapeLeft");
    }
    else if (objc_msgSend(v5, "orientation") == 3)
    {
      v7 = CFSTR("UIInterfaceOrientationLandscapeRight");
    }
    else if (objc_msgSend(v5, "orientation") == 2)
    {
      v7 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
    }
    else
    {
      v7 = 0;
    }
    v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("orientation"));
    -[SBIconController model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("model"));

    -[SBIconController _rootFolderController](self, "_rootFolderController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("rootFolderController"));

  }
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)_addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled
{
  id v2;
  void *v3;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v5, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v3;
}

id __77__SBIconController__addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_addStateCaptureHandlerForInterestingAppIconLocations
{
  id v2;
  void *v3;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v5, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v3;
}

id __73__SBIconController__addStateCaptureHandlerForInterestingAppIconLocations__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(WeakRetained, "rootFolder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathForIconWithIdentifier:", CFSTR("com.apple.AppStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "sb_iconPathDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("rdar://67699908"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("MISSING"), CFSTR("rdar://67699908"));
    }
    objc_msgSend(WeakRetained, "applicationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationWithBundleIdentifier:", CFSTR("com.apple.AppStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "applicationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restrictionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isApplicationIdentifierRestricted:", CFSTR("com.apple.AppStore")));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("rdar://67699908 - restricted"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isRestricted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("rdar://67699908 - info restricted"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "info");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isBlocked"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("rdar://67699908 - info blocked"));

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_addStateCaptureHandlerForRestrictions
{
  id v2;
  void *v3;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v5, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v3;
}

id __58__SBIconController__addStateCaptureHandlerForRestrictions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "policyAggregator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v4 = objc_msgSend(v3, "allowsCapability:explanation:", 17, &v14);
    v5 = (__CFString *)v14;
    v15[0] = CFSTR("hasRestrictedEnforcedLayout");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "hasRestrictedEnforcedLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v15[1] = CFSTR("isUninstallingSystemAppsRestricted");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isUninstallingSystemAppsRestricted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    v15[2] = CFSTR("allowsUninstall");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "allowsUninstall"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v8;
    v15[3] = CFSTR("isEditingAllowed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v15[4] = CFSTR("editingAllowedExplanation");
    v11 = CFSTR("<none>");
    if (v5)
      v11 = v5;
    v16[3] = v9;
    v16[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_addStateCaptureHandlerForHomeScreenDefaults
{
  return (id)BSLogAddStateCaptureBlockWithTitle();
}

id __64__SBIconController__addStateCaptureHandlerForHomeScreenDefaults__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v0 = (void *)objc_opt_new();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homeScreenDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "shouldPrepareDefaultTodayList");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, CFSTR("shouldPrepareDefaultTodayList"));

  v5 = objc_msgSend(v2, "shouldPrepareStackForDefaultTodayList");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, CFSTR("shouldPrepareStackForDefaultTodayList"));

  objc_msgSend(v2, "overriddenScreenType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bs_setSafeObject:forKey:", v7, CFSTR("overriddenScreenType"));
  v8 = objc_msgSend(v2, "automaticallyAddsNewApplications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, CFSTR("automaticallyAddsNewApplications"));

  v10 = objc_msgSend(v2, "automaticallyAddsNewApplicationsExists");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v11, CFSTR("automaticallyAddsNewApplicationsExists"));

  v12 = objc_msgSend(v2, "showsBadgesInAppLibrary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v13, CFSTR("showsBadgesInAppLibrary"));

  v14 = objc_msgSend(v2, "showsHomeScreenSearchAffordance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v15, CFSTR("showsHomeScreenSearchAffordance"));

  v16 = objc_msgSend(v2, "pagesHaveEverBeenHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v17, CFSTR("pagesHaveEverBeenHidden"));

  v18 = objc_msgSend(v2, "shouldShowLibraryEducationView");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v19, CFSTR("shouldShowLibraryEducationView"));

  objc_msgSend(v2, "iconUserInterfaceStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v20, CFSTR("iconUserInterfaceStyle"));

  return v0;
}

- (double)topOffset
{
  return self->topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->maxPresentationOffset = a3;
}

- (SBWallpaperIconStyleCoordinator)iconStyleCoordinator
{
  return self->_iconStyleCoordinator;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setTodayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_todayViewController, a3);
}

- (SBTodayViewController)coverSheetTodayViewController
{
  return self->_coverSheetTodayViewController;
}

- (void)setCoverSheetTodayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetTodayViewController, a3);
}

- (SBHomeScreenSpotlightViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void)setSpotlightViewController:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightViewController, a3);
}

- (void)setSearchPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenter, a3);
}

- (void)setOverlayLibraryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayLibraryViewController, a3);
}

- (SBHIconRootViewProviding)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (BOOL)hasRestrictedEnforcedLayout
{
  return self->_hasRestrictedEnforcedLayout;
}

- (void)setHasRestrictedEnforcedLayout:(BOOL)a3
{
  self->_hasRestrictedEnforcedLayout = a3;
}

- (void)setUninstallingSystemAppsRestricted:(BOOL)a3
{
  self->_uninstallingSystemAppsRestricted = a3;
}

- (NSTimer)popoverDelayTimer
{
  return self->_popoverDelayTimer;
}

- (void)setPopoverDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_popoverDelayTimer, a3);
}

- (SBRootFolderPageTransition)interactivePullToTodaySearchTransition
{
  return self->_interactivePullToTodaySearchTransition;
}

- (void)setInteractivePullToTodaySearchTransition:(id)a3
{
  objc_storeStrong((id *)&self->_interactivePullToTodaySearchTransition, a3);
}

- (PTSingleTestRecipe)relayoutTestRecipe
{
  return self->_relayoutTestRecipe;
}

- (PTSingleTestRecipe)toggleSearchTestRecipe
{
  return self->_toggleSearchTestRecipe;
}

- (PTSingleTestRecipe)runDownloadingIconTestRecipe
{
  return self->_runDownloadingIconTestRecipe;
}

- (PTSingleTestRecipe)runRemoveAndRestoreIconTestRecipe
{
  return self->_runRemoveAndRestoreIconTestRecipe;
}

- (PTSingleTestRecipe)organizeInFoldersTestRecipe
{
  return self->_organizeInFoldersTestRecipe;
}

- (PTDoubleTestRecipe)shuffleStackTestRecipe
{
  return self->_shuffleStackTestRecipe;
}

- (PTSingleTestRecipe)runWidgetDiscoverabilityTestRecipe
{
  return self->_runWidgetDiscoverabilityTestRecipe;
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (void)setKeepTodayViewIconImagesStaticAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keepTodayViewIconImagesStaticAssertion, a3);
}

- (BSInvalidatable)suspendWallpaperAnimationForSpotlightAssertion
{
  return self->_suspendWallpaperAnimationForSpotlightAssertion;
}

- (void)setSuspendWallpaperAnimationForSpotlightAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForSpotlightAssertion, a3);
}

- (SBProactiveHomeScreenUsageObserver)proactiveUsageObserver
{
  return self->_proactiveUsageObserver;
}

- (void)setProactiveUsageObserver:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveUsageObserver, a3);
}

- (SBProactiveHomeScreenSuggestionProvider)proactiveSuggestionProvider
{
  return self->_proactiveSuggestionProvider;
}

- (void)setProactiveSuggestionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveSuggestionProvider, a3);
}

- (SBTipsHomeScreenUsageObserver)tipsUsageObserver
{
  return self->_tipsUsageObserver;
}

- (void)setTipsUsageObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tipsUsageObserver, a3);
}

- (OS_dispatch_queue)accountStoreQueue
{
  return self->_accountStoreQueue;
}

- (SBBarSwipeAffordanceViewController)widgetAddSheetAffordanceViewController
{
  return self->_widgetAddSheetAffordanceViewController;
}

- (void)setWidgetAddSheetAffordanceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetAddSheetAffordanceViewController, a3);
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (DNDModeConfigurationService)dndModeConfigurationService
{
  return self->_dndModeConfigurationService;
}

- (void)setDndModeConfigurationService:(id)a3
{
  objc_storeStrong((id *)&self->_dndModeConfigurationService, a3);
}

- (NSArray)suggestedOnboardingStack
{
  return self->_suggestedOnboardingStack;
}

- (int64_t)userIconStateFileStatus
{
  return self->_userIconStateFileStatus;
}

- (void)setUserIconStateFileStatus:(int64_t)a3
{
  self->_userIconStateFileStatus = a3;
}

- (NSHashTable)floatingDockControllerObservers
{
  return self->_floatingDockControllerObservers;
}

- (void)setFloatingDockControllerObservers:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockControllerObservers, a3);
}

- (NSSet)floatingDockBehaviorAssertions
{
  return self->_floatingDockBehaviorAssertions;
}

- (void)setFloatingDockBehaviorAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertions, a3);
}

- (SBSpotlightPresentableViewController)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (void)setSearchPresentableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresentableViewController, a3);
}

- (SBRootFolderPageTransition)searchPresenterPageStateTransition
{
  return self->_searchPresenterPageStateTransition;
}

- (void)setSearchPresenterPageStateTransition:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenterPageStateTransition, a3);
}

- (int64_t)searchPresenterDestinationPageState
{
  return self->_searchPresenterDestinationPageState;
}

- (void)setSearchPresenterDestinationPageState:(int64_t)a3
{
  self->_searchPresenterDestinationPageState = a3;
}

- (unint64_t)searchPresenterOutstandingAnimationCount
{
  return self->_searchPresenterOutstandingAnimationCount;
}

- (void)setSearchPresenterOutstandingAnimationCount:(unint64_t)a3
{
  self->_searchPresenterOutstandingAnimationCount = a3;
}

- (SBHLegibility)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (void)setScrollAccessoryAuxiliaryView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, a3);
}

- (BSInvalidatable)scrollAccessoryBorrowedForSearchPresentationAssertion
{
  return self->_scrollAccessoryBorrowedForSearchPresentationAssertion;
}

- (void)setScrollAccessoryBorrowedForSearchPresentationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedForSearchPresentationAssertion, a3);
}

- (BSInvalidatable)addWidgetSheetKeyboardFocusAssertion
{
  return self->_addWidgetSheetKeyboardFocusAssertion;
}

- (void)setAddWidgetSheetKeyboardFocusAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_addWidgetSheetKeyboardFocusAssertion, a3);
}

- (SBIconListLayoutProvider)ambientListLayoutProvider
{
  return self->_ambientListLayoutProvider;
}

- (void)setAmbientListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_ambientListLayoutProvider, a3);
}

- (SBHWidgetMetricsProvider)ambientWidgetMetricsProvider
{
  return self->_ambientWidgetMetricsProvider;
}

- (void)setAmbientWidgetMetricsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_ambientWidgetMetricsProvider, a3);
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
}

- (BSInvalidatable)todayViewDisplayLayoutAssertion
{
  return self->_todayViewDisplayLayoutAssertion;
}

- (void)setTodayViewDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_todayViewDisplayLayoutAssertion, a3);
}

- (NSMutableArray)hiddenAppBundleIdentifiers
{
  return self->_hiddenAppBundleIdentifiers;
}

- (void)setHiddenAppBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenAppBundleIdentifiers, a3);
}

- (SBHAnalyticsEventsController)analyticsEventsController
{
  return self->_analyticsEventsController;
}

- (void)setAnalyticsEventsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventsController, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (void)setHomeScreenOverlayController:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenOverlayController, a3);
}

- (BOOL)_ignoreMutatingIconListsOnApplicationInstall
{
  return self->__ignoreMutatingIconListsOnApplicationInstall;
}

- (void)_setIgnoreMutatingIconListsOnApplicationInstall:(BOOL)a3
{
  self->__ignoreMutatingIconListsOnApplicationInstall = a3;
}

- (int64_t)currentIconListIndex
{
  return self->_currentIconListIndex;
}

- (NSSet)appIconForceTouchWindows
{
  return self->_appIconForceTouchWindows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconForceTouchWindows, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayController, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_analyticsEventsController, 0);
  objc_storeStrong((id *)&self->_hiddenAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_todayViewDisplayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_ambientWidgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_ambientListLayoutProvider, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedForSearchPresentationAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_searchPresenterPageStateTransition, 0);
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertions, 0);
  objc_storeStrong((id *)&self->_floatingDockControllerObservers, 0);
  objc_storeStrong((id *)&self->_suggestedOnboardingStack, 0);
  objc_storeStrong((id *)&self->_dndModeConfigurationService, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_accountStoreQueue, 0);
  objc_storeStrong((id *)&self->_tipsUsageObserver, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionProvider, 0);
  objc_storeStrong((id *)&self->_proactiveUsageObserver, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForOverlayViewAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForSpotlightAssertion, 0);
  objc_storeStrong((id *)&self->_keepTodayViewIconImagesStaticAssertion, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_runWidgetDiscoverabilityTestRecipe, 0);
  objc_storeStrong((id *)&self->_shuffleStackTestRecipe, 0);
  objc_storeStrong((id *)&self->_organizeInFoldersTestRecipe, 0);
  objc_storeStrong((id *)&self->_runRemoveAndRestoreIconTestRecipe, 0);
  objc_storeStrong((id *)&self->_runDownloadingIconTestRecipe, 0);
  objc_storeStrong((id *)&self->_toggleSearchTestRecipe, 0);
  objc_storeStrong((id *)&self->_relayoutTestRecipe, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransition, 0);
  objc_storeStrong((id *)&self->_interactivePullToTodaySearchTransition, 0);
  objc_storeStrong((id *)&self->_popoverDelayTimer, 0);
  objc_storeStrong((id *)&self->_delayedLaunchRequestTimer, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_destroyWeak((id *)&self->_mainDisplayWindowScene);
  objc_storeStrong((id *)&self->_overlayLibraryViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetTodayViewController, 0);
  objc_storeStrong((id *)&self->_todayViewController, 0);
  objc_storeStrong((id *)&self->_leftOfHomeAppViewController, 0);
  objc_storeStrong((id *)&self->_homeScreenViewController, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_widgetMetricsServer, 0);
  objc_storeStrong((id *)&self->_iconStyleCoordinator, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandleForRestrictions, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandleForInterestingAppIconLocations, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandleForHomeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled, 0);
  objc_storeStrong((id *)&self->_iconVisibilityService, 0);
  objc_storeStrong((id *)&self->_iconStyleObservers, 0);
  objc_storeStrong((id *)&self->_iconModelControllerObservers, 0);
  objc_storeStrong((id *)&self->_windowSceneToMedusaDragWindowContext, 0);
  objc_storeStrong((id *)&self->_iconsOccludedAssertions, 0);
  objc_storeStrong((id *)&self->_iconDragSessionBeginDate, 0);
  objc_storeStrong((id *)&self->_powerLogAggregator, 0);
  objc_storeStrong((id *)&self->_widgetEditingLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_folderDisplayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_outstandingSnapshotProviders, 0);
  objc_storeStrong((id *)&self->_screenSnapshotForIconViews, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayInitialPresentationProgress, 0);
  objc_storeStrong((id *)&self->_filesWidgetExtensionProviders, 0);
  objc_storeStrong((id *)&self->_spotlightInteractiveGestureTransaction, 0);
  objc_storeStrong((id *)&self->_tapToEndEditingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressToEditGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_libraryViewControllersActivatingSpotlightAppService, 0);
  objc_storeStrong((id *)&self->_categoryMapProvider, 0);
  objc_storeStrong((id *)&self->_temporaryWidgetIntents, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForFolderAssertions, 0);
  objc_storeStrong((id *)&self->_delayedStyleWallpaperEffectViews, 0);
  objc_storeStrong((id *)&self->_notificationIconImageCache, 0);
  objc_storeStrong((id *)&self->_tableUIIconImageCache, 0);
  objc_storeStrong((id *)&self->_appSwitcherHeaderIconImageCache, 0);
  objc_storeStrong((id *)&self->_duckWallpaperDimmingAssertion, 0);
  objc_storeStrong((id *)&self->_colorPickerInterfactionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_modalInteractionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_deviceOrientationUpdateDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_iconTouchesFinishedBlocks, 0);
  objc_storeStrong((id *)&self->_queryableFolderMetric, 0);
  objc_storeStrong((id *)&self->_transitionEventQueue, 0);
  objc_storeStrong((id *)&self->_currentTransitionRequest, 0);
  objc_storeStrong((id *)&self->_indexPathToResetTo, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_override_widgetMetricsServer, 0);
  objc_storeStrong((id *)&self->_override_userInterfaceController, 0);
  objc_storeStrong((id *)&self->_override_policyAggregator, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_layoutStateProvider, 0);
  objc_storeStrong((id *)&self->_override_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_override_assistantController, 0);
  objc_storeStrong((id *)&self->_override_applicationPlaceholderController, 0);
  objc_storeStrong((id *)&self->_override_applicationController, 0);
  objc_storeStrong((id *)&self->_override_analyticsClient, 0);
  objc_storeStrong((id *)&self->_override_alertItemsController, 0);
  objc_storeStrong((id *)&self->_displayIDsWithBadgingEnabled, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_hiddenTags, 0);
  objc_storeStrong((id *)&self->_visibleTags, 0);
}

- (id)_createTestFolder
{
  return -[SBIconController _createTestFolderWithOverrideIconList:](self, "_createTestFolderWithOverrideIconList:", 0);
}

- (id)_createTestFolderWithOverrideIconList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  SBIconController *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconController rootFolder](self, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        if ((!v4 || objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12)))
          && objc_msgSend(v13, "isApplicationIcon"))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    -[SBIconController model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self;
    -[SBIconController rootFolder](self, "rootFolder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v14;
    objc_msgSend(v14, "makeFolderWithDisplayName:", CFSTR("TEST FOLDER"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA3D8]), "initWithFolder:", v16);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v15, "removeIcon:options:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22++), 0);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    v23 = (id)objc_msgSend(v16, "addIcons:", v18);
    v24 = (id)objc_msgSend(v15, "addIcon:", v17);

    self = v28;
  }
  else
  {
    v16 = 0;
  }
  -[SBIconController iconManager](self, "iconManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIconListsWithAnimationType:forceRelayout:", -1, 1);

  return v16;
}

- (BOOL)_ppt_pushHomeScreenStateWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBIconController _ppt_prepareTransientIconModelStoreWithError:](self, "_ppt_prepareTransientIconModelStoreWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)__ppt_homeScreenStateStack;
    if (!__ppt_homeScreenStateStack)
    {
      v6 = objc_opt_new();
      v7 = (void *)__ppt_homeScreenStateStack;
      __ppt_homeScreenStateStack = v6;

      v5 = (void *)__ppt_homeScreenStateStack;
    }
    objc_msgSend(v5, "addObject:", v4);
    -[SBIconController model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStore:", v4);

    -[SBIconController iconManager](self, "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relayout");

  }
  return v4 != 0;
}

- (void)_ppt_popHomeScreenState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (__ppt_homeScreenStateStack)
  {
    -[SBIconController model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "store");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)__ppt_homeScreenStateStack, "removeLastObject");
    objc_msgSend((id)__ppt_homeScreenStateStack, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      +[SBDefaultIconModelStore sharedInstance](SBDefaultIconModelStore, "sharedInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    if (!objc_msgSend((id)__ppt_homeScreenStateStack, "count"))
    {
      v8 = (void *)__ppt_homeScreenStateStack;
      __ppt_homeScreenStateStack = 0;

    }
    -[SBIconController model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStore:", v7);

    -[SBIconController iconManager](self, "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relayout");

    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v17;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      objc_msgSend(v13, "currentIconStateURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItemAtURL:error:", v15, 0);

    }
  }
}

- (id)_ppt_prepareTransientIconModelStoreWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;

  -[SBIconController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveIconStateIfNeeded");
  objc_msgSend(v4, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v5;
    else
      v8 = 0;
    v9 = v8;

    v10 = 0;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_25;
    objc_msgSend(v5, "currentIconStateURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredIconStateURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v14;
    objc_msgSend(v17, "URLByAppendingPathComponent:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v36 = v12;
    objc_msgSend(v12, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", v21);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v41);
    v23 = v41;
    v24 = v23;
    v35 = v9;
    v37 = (void *)v20;
    if (v23)
    {
      if (a3)
      {
        v25 = objc_retainAutorelease(v23);
        v26 = 0;
        v27 = 0;
        v10 = 0;
        *a3 = v25;
      }
      else
      {
        v26 = 0;
        v27 = 0;
        v10 = 0;
      }
      v29 = v36;
      v30 = v11;
      goto LABEL_24;
    }
    v40 = 0;
    objc_msgSend(v22, "copyItemAtURL:toURL:error:", v11, v20, &v40);
    v28 = v40;
    if (v28)
    {
      v26 = v28;
      if (a3)
      {
        v26 = objc_retainAutorelease(v28);
        v27 = 0;
        v10 = 0;
        *a3 = v26;
LABEL_22:
        v29 = v36;
        goto LABEL_23;
      }
      v27 = 0;
    }
    else
    {
      objc_msgSend(v36, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v22, "fileExistsAtPath:", v31);

      if (!v32
        || (v39 = 0, objc_msgSend(v22, "copyItemAtURL:toURL:error:", v36, v38, &v39), (v27 = v39) == 0))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA610]), "initWithIconStateURL:desiredIconStateURL:", v37, v38);
        v26 = 0;
        v27 = 0;
        v29 = v36;
LABEL_23:
        v30 = v11;
LABEL_24:

        v9 = v35;
LABEL_25:

        goto LABEL_26;
      }
      if (a3)
      {
        v27 = objc_retainAutorelease(v27);
        v26 = 0;
        v10 = 0;
        *a3 = v27;
        goto LABEL_22;
      }
      v26 = 0;
    }
    v10 = 0;
    goto LABEL_22;
  }
  v10 = 0;
LABEL_26:

  return v10;
}

- (void)_runTest:(id)a3 afterMovingIconsIntoFolder:(id)a4 withFolderOpen:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SBIconController *v20;
  id v21;
  BOOL v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (-[SBIconController _ppt_pushHomeScreenStateWithError:](self, "_ppt_pushHomeScreenStateWithError:", 0))
  {
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    -[SBIconController _createTestFolderWithOverrideIconList:](self, "_createTestFolderWithOverrideIconList:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "icon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[SBIconController iconManager](self, "iconManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scrollToIconListContainingIcon:animate:", v13, 0);

      }
      v15 = dispatch_time(0, 1000000000);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke;
      v18[3] = &unk_1E8EA04C0;
      v22 = v5;
      v19 = v13;
      v20 = self;
      v21 = v9;
      v16 = v13;
      dispatch_after(v15, MEMORY[0x1E0C80D38], v18);

    }
    else
    {
      -[SBIconController _failCurrentTestWithMessage:](self, "_failCurrentTestWithMessage:", CFSTR("Unable to create test folder"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController-Folders.m"), 204, CFSTR("Unable to swap out icon model store; cannot run test."));

  }
}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  char v6;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "launchFromLocation:context:", *MEMORY[0x1E0DAA9E8], 0);
  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_2;
  block[3] = &unk_1E8EA8380;
  v6 = *(_BYTE *)(a1 + 56);
  v3 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_3;
  v4[3] = &unk_1E8E9F508;
  v5 = *(_BYTE *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v4);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, void (**)(_QWORD)))(v3 + 16))(v3, v2);
  else
    v2[2](v2);

}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[5];
  char v4;

  v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_4;
  v3[3] = &unk_1E8E9F508;
  v4 = *(_BYTE *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_5;
    v5[3] = &unk_1E8E9E980;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "popExpandedIconAnimated:completionHandler:", 1, v5);

  }
  else
  {
    objc_msgSend(v3, "_ppt_popHomeScreenState");
  }
}

uint64_t __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runFolderOpenTest
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SBIconController *v13;

  if (-[SBIconController _ppt_pushHomeScreenStateWithError:](self, "_ppt_pushHomeScreenStateWithError:", 0))
  {
    -[SBIconController _createTestFolder](self, "_createTestFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "icon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController iconManager](self, "iconManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scrollToIconListContainingIcon:animate:", v6, 0);

      v8 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke;
      block[3] = &unk_1E8E9E820;
      v12 = v6;
      v13 = self;
      v9 = v6;
      dispatch_after(v8, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      -[SBIconController _failCurrentTestWithMessage:](self, "_failCurrentTestWithMessage:", CFSTR("Unable to create test folder"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController-Folders.m"), 248, CFSTR("Unable to swap out icon model store; cannot run test."));

  }
}

uint64_t __47__SBIconController_Folders___runFolderOpenTest__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  _QWORD v5[5];

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", CFSTR("FolderOpen"));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("delay"), CFSTR("FolderOpen"));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("openAnimation"), CFSTR("FolderOpen"));
  objc_msgSend(*(id *)(a1 + 32), "launchFromLocation:context:", *MEMORY[0x1E0DAA9E8], 0);
  objc_msgSend(*v2, "finishedSubTest:forTest:", CFSTR("delay"), CFSTR("FolderOpen"));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("commitDelay"), CFSTR("FolderOpen"));
  v3 = *v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke_2;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v3, "_performBlockAfterCATransactionCommits:", v5);
}

void __47__SBIconController_Folders___runFolderOpenTest__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("commitDelay"), CFSTR("FolderOpen"));
  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __47__SBIconController_Folders___runFolderOpenTest__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke_4;
  v3[3] = &unk_1E8E9E980;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "popExpandedIconAnimated:completionHandler:", 1, v3);

}

uint64_t __47__SBIconController_Folders___runFolderOpenTest__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runFolderCloseTest
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];

  if (-[SBIconController _ppt_pushHomeScreenStateWithError:](self, "_ppt_pushHomeScreenStateWithError:", 0))
  {
    -[SBIconController _createTestFolder](self, "_createTestFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "icon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController iconManager](self, "iconManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scrollToIconListContainingIcon:animate:", v6, 0);

      -[SBIconController iconManager](self, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0DAA9E8];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __48__SBIconController_Folders___runFolderCloseTest__block_invoke;
      v11[3] = &unk_1E8E9E980;
      v11[4] = self;
      objc_msgSend(v8, "openFolderIcon:location:animated:withCompletion:", v6, v9, 0, v11);

    }
    else
    {
      -[SBIconController _failCurrentTestWithMessage:](self, "_failCurrentTestWithMessage:", CFSTR("Unable to create test folder"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController-Folders.m"), 284, CFSTR("Unable to swap out icon model store; cannot run test."));

  }
}

void __48__SBIconController_Folders___runFolderCloseTest__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBIconController_Folders___runFolderCloseTest__block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __48__SBIconController_Folders___runFolderCloseTest__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", CFSTR("FolderClose"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  objc_msgSend(*(id *)(a1 + 32), "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__SBIconController_Folders___runFolderCloseTest__block_invoke_3;
  v3[3] = &unk_1E8E9E980;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "popExpandedIconAnimated:completionHandler:", 1, v3);

}

uint64_t __48__SBIconController_Folders___runFolderCloseTest__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runFolderTestWithName:(id)a3 actions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD block[4];
  id v16;
  SBIconController *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (-[SBIconController _ppt_pushHomeScreenStateWithError:](self, "_ppt_pushHomeScreenStateWithError:", 0))
  {
    -[SBIconController _createTestFolder](self, "_createTestFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "icon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController iconManager](self, "iconManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollToIconListContainingIcon:animate:", v11, 0);

      objc_msgSend(v11, "launchFromLocation:context:", *MEMORY[0x1E0DAA9E8], 0);
      v13 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke;
      block[3] = &unk_1E8EA7D10;
      v16 = v7;
      v17 = self;
      v18 = v8;
      dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "failedTest:withFailure:", v7, CFSTR("Unable to create test folder"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController-Folders.m"), 310, CFSTR("Unable to swap out icon model store; cannot run test %@"),
      v7);

  }
}

uint64_t __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", a1[4]);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke_2;
  v7 = &unk_1E8E9DED8;
  v2 = a1[6];
  v8 = a1[5];
  return (*(uint64_t (**)(void))(v2 + 16))();
}

uint64_t __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runScrollFolderTest:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[6];

  if (-[SBIconController _ppt_pushHomeScreenStateWithError:](self, "_ppt_pushHomeScreenStateWithError:", 0))
  {
    -[SBIconController _createTestFolder](self, "_createTestFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "icon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconController iconManager](self, "iconManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollToIconListContainingIcon:animate:", v8, 0);

      objc_msgSend(v8, "launchFromLocation:context:", *MEMORY[0x1E0DAA9E8], 0);
      v10 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__SBIconController_Folders___runScrollFolderTest___block_invoke;
      block[3] = &unk_1E8E9DE88;
      block[4] = self;
      block[5] = a3;
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIconController-Folders.m"), 336, CFSTR("Unable to swap out icon model store; cannot run test."));

  }
}

void __50__SBIconController_Folders___runScrollFolderTest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_openFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIconListsWithAnimationType:forceRelayout:", 0, 1);
  objc_msgSend(v2, "setCurrentPageIndex:animated:", objc_msgSend(v2, "defaultPageIndex"), 0);
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", CFSTR("ScrollFolder"));
  v3 = objc_msgSend(v2, "minimumPageIndex");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40) + v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBIconController_Folders___runScrollFolderTest___block_invoke_2;
  v6[3] = &unk_1E8E9DED8;
  v6[4] = v4;
  objc_msgSend(v2, "setCurrentPageIndex:animated:completion:", v5, 1, v6);

}

void __50__SBIconController_Folders___runScrollFolderTest___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedTest:", CFSTR("ScrollFolder"));
  objc_msgSend(*(id *)(a1 + 32), "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SBIconController_Folders___runScrollFolderTest___block_invoke_3;
  v3[3] = &unk_1E8E9E980;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "popExpandedIconAnimated:completionHandler:", 1, v3);

}

uint64_t __50__SBIconController_Folders___runScrollFolderTest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runAppIconForceTouchTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  dispatch_time_t v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  SBIconController *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("testApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__47;
  v49 = __Block_byref_object_dispose__47;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__47;
  v43 = __Block_byref_object_dispose__47;
  v44 = (id)*MEMORY[0x1E0DAA9E8];
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    -[SBIconController rootFolder](self, "rootFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v9;
    v34[1] = 3221225472;
    v34[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke;
    v34[3] = &unk_1E8EACFC0;
    v37 = &v45;
    v38 = &v39;
    v35 = v8;
    v36 = self;
    objc_msgSend(v10, "enumerateAllIconsUsingBlock:", v34);

  }
  if (!v46[5])
    goto LABEL_7;
  -[SBIconController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconViewForIcon:location:", v46[5], v40[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    || (-[SBIconController iconManager](self, "iconManager"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "iconViewForIcon:location:", v46[5], *MEMORY[0x1E0DAA990]),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12))
  {
    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_2;
    v31[3] = &unk_1E8E9E820;
    v14 = v6;
    v32 = v14;
    v15 = v12;
    v33 = v15;
    v16 = (void *)MEMORY[0x1D17E5550](v31);
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_8;
    v28[3] = &unk_1E8E9E820;
    v17 = v14;
    v29 = v17;
    v18 = v15;
    v30 = v18;
    v19 = (void *)MEMORY[0x1D17E5550](v28);
    -[SBIconController iconManager](self, "iconManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scrollToIconListContainingIcon:animate:", v46[5], 0);

    v21 = dispatch_time(0, 100000000);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_14;
    block[3] = &unk_1E8EA0708;
    v25 = v17;
    v26 = v16;
    v27 = v19;
    v22 = v19;
    v23 = v16;
    dispatch_after(v21, MEMORY[0x1E0C80D38], block);

  }
  else
  {
LABEL_7:
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "failedTest:", v6);
  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id *v13;
  id v14;

  v14 = a2;
  v8 = a3;
  if (objc_msgSend(v14, "isLeafIcon"))
  {
    objc_msgSend(v14, "applicationBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      objc_msgSend(*(id *)(a1 + 40), "rootFolder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isIconAtIndexPathInDock:", v8);
      v13 = (id *)MEMORY[0x1E0DAA990];
      if (!v12)
        v13 = (id *)MEMORY[0x1E0DAA9E8];
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *v13);

      *a4 = 1;
    }
  }

}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("Delay"), *(_QWORD *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v4 = *v2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_3;
  v15[3] = &unk_1E8E9DED8;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "installCACommitCompletionBlock:", v15);
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0D83C40];
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_4;
  v13[3] = &unk_1E8EA0170;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v6, "eventStreamWithEventActions:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83C30];
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_5;
  v10[3] = &unk_1E8E9E820;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v9 = v5;
  objc_msgSend(v8, "playEventStream:options:completion:", v7, v9, v10);

}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("Delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("Animation"), *(_QWORD *)(a1 + 32));
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_4(uint64_t a1, void *a2)
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
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MidX;
  id v24;
  CGRect v25;
  CGRect v26;

  v3 = *(void **)(a1 + 32);
  v24 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fixedCoordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v25.origin.x = v16;
  v25.origin.y = v18;
  v25.size.width = v20;
  v25.size.height = v22;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  objc_msgSend(v24, "touchDown:", MidX, CGRectGetMidY(v26));
  objc_msgSend(v24, "advanceTime:", 3.0);
  objc_msgSend(v24, "liftUpAtAllActivePoints");

}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)*MEMORY[0x1E0CEB258];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_6;
  v7[3] = &unk_1E8E9DED8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v7);
  v4 = dispatch_time(0, 1000000000);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_7;
  v5[3] = &unk_1E8E9DED8;
  v6 = *(id *)(a1 + 40);
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);

}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_6(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("Animation"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D83C30], "playCommandString:options:completion:", CFSTR("b h"), *(_QWORD *)(a1 + 32), 0);
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_8(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("Delay"), *(_QWORD *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v4 = *v2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_9;
  v15[3] = &unk_1E8E9DED8;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "installCACommitCompletionBlock:", v15);
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0D83C40];
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_10;
  v13[3] = &unk_1E8EA0170;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v6, "eventStreamWithEventActions:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83C30];
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_11;
  v10[3] = &unk_1E8E9E820;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v8, "playEventStream:options:completion:", v7, v9, v10);

}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_9(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("Delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("Animation"), *(_QWORD *)(a1 + 32));
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_10(uint64_t a1, void *a2)
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
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MidX;
  id v24;
  CGRect v25;
  CGRect v26;

  v3 = *(void **)(a1 + 32);
  v24 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fixedCoordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v25.origin.x = v16;
  v25.origin.y = v18;
  v25.size.width = v20;
  v25.size.height = v22;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  objc_msgSend(v24, "touchDown:", MidX, CGRectGetMidY(v26));
  objc_msgSend(v24, "advanceTime:", 3.0);
  objc_msgSend(v24, "liftUpAtAllActivePoints");

}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_11(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_12;
  v3[3] = &unk_1E8E9E820;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);

}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_12(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = (void *)MEMORY[0x1E0D83C30];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_13;
  v3[3] = &unk_1E8E9DED8;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v1, "playCommandString:options:completion:", CFSTR("b h"), v2, v3);

}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_13(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("Animation"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
}

_QWORD *__67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_14(uint64_t a1)
{
  _QWORD *result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AppIconForceTouchPresent")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AppIconForceTouchPresentInDock")))
  {
    return (*(_QWORD *(**)(_QWORD *__return_ptr))(*(_QWORD *)(a1 + 40) + 16))((_QWORD *)(a1 + 40));
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AppIconForceTouchDismiss")) & 1) != 0)
    return (*(_QWORD *(**)(_QWORD *__return_ptr))(*(_QWORD *)(a1 + 48) + 16))((_QWORD *)(a1 + 48));
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AppIconForceTouchDismissInDock"));
  if ((_DWORD)result)
    return (*(_QWORD *(**)(_QWORD *__return_ptr))(*(_QWORD *)(a1 + 48) + 16))((_QWORD *)(a1 + 48));
  return result;
}

- (void)_failCurrentTestWithMessage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)*MEMORY[0x1E0CEB258];
  v4 = a3;
  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTestName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "failedTest:withFailure:", v5, v4);

}

void __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_cold_1(unsigned __int8 *a1, char a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Checking restriction for uninstalling system apps. Apple account restricted: %i, iTunes Store account restricted: %i", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_2_0();
}

- (void)setModel:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_4();
  _os_log_debug_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEBUG, "Changing icon model from %@ to %@", v1, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Couldn't fetch default widget stack with error: %@", v5);

  OUTLINED_FUNCTION_2_2();
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "No medium default widget stack found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_308_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "No icon data source for icon %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_appLibraryListLayoutProviderForWindowScene:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1D0540000, v0, OS_LOG_TYPE_FAULT, "attempting to construct a list layout provider with a nil windowScene!", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __82__SBIconController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
}

- (void)iconManager:(uint64_t)a1 viewControllerForCustomIcon:(NSObject *)a2 element:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a2, v6, "Did not make a view controller for custom widget element: %@ (%{public}@", (uint8_t *)&v7);

}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error archiving Shortcuts folder widget intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error archiving Shortcuts single widget intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error archiving Files widget intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_getApplicationDataStore:configurationKey:forDataSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "uniqueIdentifier for dataSource '%@' was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_getApplicationDataStore:configurationKey:forDataSource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "configurationStorageIdentifier for dataSource '%@' was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __70__SBIconController_iconManager_configurationDataForDataSource_ofIcon___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEBUG, "Config data is accessible after first unlock.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)modeConfigurationService:didReceiveAvailableModesUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error fetching available DND modes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
