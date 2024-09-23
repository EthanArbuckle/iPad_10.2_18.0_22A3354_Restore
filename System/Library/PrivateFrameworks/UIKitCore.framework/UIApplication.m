@implementation UIApplication

- (int64_t)pureUserInterfaceLayoutDirection
{
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  p_applicationFlags = &self->_applicationFlags;
  v3 = *((_QWORD *)&self->_applicationFlags + 1);
  if ((v3 & 0x400000) == 0)
  {
    v4 = objc_msgSend(off_1E1679C48, "defaultWritingDirectionForLanguage:", 0);
    v5 = 0x400000;
    if (v4 == 1)
      v5 = 12582912;
    v3 = v5 | *((_QWORD *)p_applicationFlags + 1) & 0xFFFFFFFFFC3FFFFFLL;
    *((_QWORD *)p_applicationFlags + 1) = v3;
  }
  return (v3 >> 23) & 7;
}

+ (UIApplication)sharedApplication
{
  return (UIApplication *)(id)UIApp;
}

+ (BOOL)_isClassic
{
  return objc_msgSend(a1, "_classicMode") != 0;
}

+ (int64_t)_classicMode
{
  return 0;
}

- (UIUserInterfaceLayoutDirection)userInterfaceLayoutDirection
{
  if (+[UIView _enableLegacyRTL](UIView, "_enableLegacyRTL"))
    return 0;
  else
    return -[UIApplication pureUserInterfaceLayoutDirection](self, "pureUserInterfaceLayoutDirection");
}

- (void)_cancelPressesIfNeededForViewRemovedFromResponderChain:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)objc_msgSend(v4, "window");
  v6 = (id)objc_msgSend((id)UIApp, "_pressesEventForWindow:", v5);
  if (v6)
  {
    v16 = v6;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "allPresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "responder");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          while (v14 != v4)
          {
            objc_msgSend(v14, "nextResponder");
            v15 = objc_claimAutoreleasedReturnValue();

            v14 = (id)v15;
            if (!v15)
              goto LABEL_14;
          }
          if (!v10)
            v10 = (void *)objc_opt_new();
          objc_msgSend(v10, "addObject:", v13);

LABEL_14:
          ;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    -[UIApplication _cancelTouchesOrPresses:withEvent:](self, "_cancelTouchesOrPresses:withEvent:", v10, v16);
  }

}

- (id)_pressesEventForWindow:(id)a3
{
  return -[UIEventEnvironment _pressesEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (UIContentSizeCategory)preferredContentSizeCategory
{
  void *v2;
  void *v3;

  +[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIContentSizeCategory)v3;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_viewControllerBasedStatusBarAppearance
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 12) >> 3) & 1;
}

- (BOOL)_sceneSettingsIncludeSafeAreaInsets
{
  return !-[UIApplication isFrontBoard](self, "isFrontBoard");
}

- (BOOL)_isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[UIApplication _isSpringBoard](self, "_isSpringBoard")
    && (-[UIApplication statusBar](self, "statusBar"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "alpha"),
        v7 = v6,
        v5,
        v7 == 0.0))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = +[UIWindow _prefersStatusBarHiddenInWindow:animationProvider:](UIWindow, "_prefersStatusBarHiddenInWindow:animationProvider:", v4, 0);
    }
    else
    {
      __UIStatusBarManagerForWindow(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isStatusBarHidden");

    }
  }

  return v8;
}

- (BOOL)isFrontBoard
{
  return 0;
}

- (BOOL)_wantsCompactStatusBarHiding
{
  _BOOL4 v3;

  v3 = -[UIApplication _supportsCompactStatusBarHiding](self, "_supportsCompactStatusBarHiding");
  if (v3)
    LOBYTE(v3) = *((_BYTE *)&self->_applicationFlags + 3) & 1;
  return v3;
}

- (BOOL)_supportsCompactStatusBarHiding
{
  return dyld_program_sdk_at_least();
}

+ (BOOL)shouldMakeUIForDefaultPNG
{
  return _MergedGlobals_149;
}

- (id)statusBar
{
  return -[UIApplication statusBarWithWindow:](self, "statusBarWithWindow:", 0);
}

+ (BOOL)rendersLocally
{
  return 0;
}

- (BOOL)_areSystemWindowsSecure
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 12) >> 5) & 1;
}

- (BOOL)_supportsAlwaysOnDisplay
{
  return -[_UIApplicationInfoParser supportsAlwaysOnDisplay](self->_appInfo, "supportsAlwaysOnDisplay");
}

- (BOOL)_supportsBacklightEnvironment
{
  return -[_UIApplicationInfoParser supportsBacklightEnvironment](self->_appInfo, "supportsBacklightEnvironment");
}

- (id)_gestureEnvironment
{
  return self->__gestureEnvironment;
}

uint64_t __60__UIApplication__updateSerializableKeyCommandsForResponder___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) &= ~0x8000000000000uLL;
  return objc_msgSend((id)UIApp, "_immediatelyUpdateSerializableKeyCommandsForResponder:", 0);
}

uint64_t __57__UIApplication__addAfterCACommitBlockForViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeAfterAppearanceBlock");
}

uint64_t __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOrientation:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithName:(NSString *)taskName expirationHandler:(void *)handler
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(handler, taskName);
}

- (BOOL)_didEatCurrentTouchForWindow:(id)a3
{
  _BYTE *v3;
  BOOL v4;

  -[UIEventEnvironment _currentTouchForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[264] != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isHandlingMemoryWarning
{
  return *((unsigned __int8 *)&self->_applicationFlags + 11) >> 7;
}

- (unint64_t)_supportedInterfaceOrientationsForWindow:(id)a3
{
  id v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  id v7;
  unint64_t OrientationMask;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (self->_delegate && (*((_BYTE *)&self->_applicationFlags + 7) & 8) != 0)
  {
    v11 = MEMORY[0x1E0C809B0];
    v5 = __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke;
    v6 = &v11;
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v5 = __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke_2;
    v6 = &v10;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_1E16DD080;
  v6[4] = (uint64_t)self;
  v7 = v4;
  v6[5] = (uint64_t)v7;
  OrientationMask = _UISafelyGetOrientationMask(v6);

  if (!_UIDeviceNativeUserInterfaceIdiom() && !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"))
    OrientationMask &= 0x1Au;

  return OrientationMask;
}

- (uint64_t)_defaultSupportedInterfaceOrientations
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  if (result)
  {
    v1 = result;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if (objc_msgSend(*(id *)(v1 + 232), "supportedInterfaceOrientations"))
    {
      return objc_msgSend(*(id *)(v1 + 232), "supportedInterfaceOrientations");
    }
    else if (v3 == 1)
    {
      return 30;
    }
    else if (v3
           || (+[UIScreen mainScreen](UIScreen, "mainScreen"),
               v4 = (void *)objc_claimAutoreleasedReturnValue(),
               v5 = objc_msgSend(v4, "_wantsWideContentMargins"),
               v4,
               v5))
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_wantsWideContentMargins");

      if (v7)
        return 30;
      else
        return 2;
    }
    else
    {
      return 26;
    }
  }
  return result;
}

uint64_t __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportedInterfaceOrientationsForWindow:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "application:supportedInterfaceOrientationsForWindow:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)_appAdoptsUISceneLifecycle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIApplication__appAdoptsUISceneLifecycle__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1EDDC8090 != -1)
    dispatch_once(&qword_1EDDC8090, block);
  return ((*((_BYTE *)&self->_applicationFlags + 8) & 3) != 0) | byte_1EDDC7FF5 & 1;
}

- (void)_handleUserDefaultsDidChange:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (pthread_main_np())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v5;
    }
    else
    {

      v4 = 0;
    }
    v5 = v4;
    -[UIApplication userDefaultsDidChange:](self, "userDefaultsDidChange:", v4);
  }
  else
  {
    -[UIApplication performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__handleUserDefaultsDidChange_, v5, 0);
  }

}

- (BOOL)_isActivating
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 4) >> 1) & 1;
}

- (BOOL)_isResigningActive
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 13) >> 5) & 1;
}

- (BOOL)_hasApplicationCalledLaunchDelegate
{
  return (*((_BYTE *)&self->_applicationFlags + 2) & 0x18) != 0;
}

- (BOOL)_hasNormalRestorationCompleted
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 11) >> 4) & 1;
}

- (NSArray)windows
{
  return (NSArray *)+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
}

uint64_t __43__UIApplication__beginFenceTaskIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)_systemAnimationFenceCreatingIfNecessary:(BOOL)a3
{
  void *v3;
  void *v4;

  -[UIApplication _cachedSystemAnimationFenceCreatingIfNecessary:](self, "_cachedSystemAnimationFenceCreatingIfNecessary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_cachedSystemAnimationFenceCreatingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  BKSAnimationFenceHandle *cachedSystemAnimationFence;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 2474, CFSTR("Call must be made on main thread"));

  }
  cachedSystemAnimationFence = self->_cachedSystemAnimationFence;
  if (cachedSystemAnimationFence)
    v7 = 1;
  else
    v7 = !v3;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x186DC9484]();
    -[UIApplication _fenceProvider](self, "_fenceProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestSystemAnimationFence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _setCachedSystemAnimationFence:]((uint64_t)self, v10);

    objc_autoreleasePoolPop(v8);
    -[UIApplication _beginFenceTaskIfNecessary](self, "_beginFenceTaskIfNecessary");
    cachedSystemAnimationFence = self->_cachedSystemAnimationFence;
  }
  return cachedSystemAnimationFence;
}

- (void)_trackSystemAnimationFence:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIApplication _fenceProvider](self, "_fenceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trackSystemAnimationFence:", v10);

  v7 = v10;
  if (v6)
  {
    if (pthread_main_np() != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 2465, CFSTR("Call must be made on main thread"));

    }
    v7 = v10;
    if (!self->_cachedSystemAnimationFence)
    {
      v8 = (void *)objc_msgSend(v10, "copy");
      -[UIApplication _setCachedSystemAnimationFence:]((uint64_t)self, v8);

      -[UIApplication _beginFenceTaskIfNecessary](self, "_beginFenceTaskIfNecessary");
      v7 = v10;
    }
  }

}

- (UIFenceProviding)_fenceProvider
{
  return (UIFenceProviding *)+[_UISimpleFenceProvider sharedInstance](_UISimpleFenceProvider, "sharedInstance");
}

- (BOOL)isSuspended
{
  void *v2;
  BOOL v3;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState") == 2;

  return v3;
}

- (UIApplicationState)applicationState
{
  void *v2;
  UIApplicationState v3;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState");

  return v3;
}

- (void)_beginFenceTaskIfNecessary
{
  _UIFenceTask *v4;
  _UIFenceTask *fenceTask;
  _UIFenceTask *v6;
  uint64_t v7;
  void *v8;
  _UIFenceTask *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _UIFenceTask *v14;
  _QWORD v15[6];

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 2411, CFSTR("Call must be made on main thread"));

  }
  if (!self->_fenceTask)
  {
    v4 = (_UIFenceTask *)objc_opt_new();
    fenceTask = self->_fenceTask;
    self->_fenceTask = v4;

    v6 = v4;
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __43__UIApplication__beginFenceTaskIfNecessary__block_invoke;
    v15[3] = &unk_1E16B1888;
    v15[4] = self;
    v15[5] = a2;
    if ((objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v15, 2) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 2419, CFSTR("failed to schedule clearing the fence task"));

    }
    v8 = (void *)MEMORY[0x1E0CD28B0];
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __43__UIApplication__beginFenceTaskIfNecessary__block_invoke_2;
    v13[3] = &unk_1E16B1B28;
    v9 = v6;
    v14 = v9;
    if ((objc_msgSend(v8, "addCommitHandler:forPhase:", v13, 5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 2424, CFSTR("failed to schedule invalidating the fence task"));

    }
  }
}

- (UIStatusBarStyle)statusBarStyle
{
  return self->_statusBarRequestedStyle;
}

- (UIWindow)keyWindow
{
  return (UIWindow *)+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
}

- (double)statusBarHeightForOrientation:(int64_t)a3 ignoreHidden:(BOOL)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  _UIStatusBarManagerForNoWindow();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 || (v8 = 0.0, (objc_msgSend(v6, "isStatusBarHidden") & 1) == 0))
  {
    objc_msgSend(v7, "defaultStatusBarHeightInOrientation:", a3);
    v8 = v9;
  }

  return v8;
}

- (int64_t)_safeInterfaceOrientationForWindowIfExists:(id)a3 expectNonNilWindow:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int64_t v7;

  v4 = a4;
  objc_msgSend(a3, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_7;
  if (!v4
    || (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RaiseWithNilSceneForInterfaceOrientation, (uint64_t)CFSTR("RaiseWithNilSceneForInterfaceOrientation"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EDDA823C)
  {
    -[UIApplication _findUISceneForLegacyInterfaceOrientation](self, "_findUISceneForLegacyInterfaceOrientation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      return 1;
LABEL_7:
    v7 = objc_msgSend(v6, "_interfaceOrientation");

    return v7;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Asking for the interface orientation without a window scene or window."));
  return 1;
}

- (id)_defaultUIWindowHostingUISceneOrMainScreenPlaceholderIfExists
{
  void *v4;
  void *v5;
  id v6;
  void *v8;

  if (-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 10499, CFSTR("Apps which adopt the UIScene based lifecycle cannot safely infer an interface orientation without a visual context!"));

  }
  -[UIApplication _defaultUISceneOrMainScreenPlaceholderIfExists](self, "_defaultUISceneOrMainScreenPlaceholderIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "_hostsWindows"))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)_findUISceneForLegacyInterfaceOrientation
{
  void *v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;

  if (qword_1EDDC8430 != -1)
    dispatch_once(&qword_1EDDC8430, &__block_literal_global_3028);
  if (byte_1EDDC8025)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  -[UIApplication _defaultUISceneOrMainScreenPlaceholderIfExists](self, "_defaultUISceneOrMainScreenPlaceholderIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend((id)objc_opt_class(), "_hostsWindows"))
  {
    v4 = v3;
    v3 = v4;
    goto LABEL_5;
  }
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (qword_1EDDC80D0 != -1)
      dispatch_once(&qword_1EDDC80D0, &__block_literal_global_902);
    if (byte_1EDDC7FFB)
      goto LABEL_17;
    if (qword_1EDDC80E0 != -1)
      dispatch_once(&qword_1EDDC80E0, &__block_literal_global_911);
    if (byte_1EDDC7FFC)
    {
LABEL_17:
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v8, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
LABEL_6:

  return v5;
}

- (id)_defaultUISceneOrMainScreenPlaceholderIfExists
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIApplication _defaultSceneIfExists](self, "_defaultSceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v6, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_defaultSceneIfExists
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__161;
  v15 = __Block_byref_object_dispose__161;
  v16 = 0;
  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationInitializationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSceneToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)qword_1EDDC8098;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__UIApplication__defaultSceneIfExists__block_invoke;
    v8[3] = &unk_1E16DD548;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __38__UIApplication__defaultSceneIfExists__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (double)statusBarHeightForOrientation:(int64_t)a3
{
  double result;

  -[UIApplication statusBarHeightForOrientation:ignoreHidden:](self, "statusBarHeightForOrientation:ignoreHidden:", a3, 0);
  return result;
}

- (BOOL)_supportedOnLockScreen
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 14) >> 1) & 1;
}

- (BOOL)_supportsPrintCommand
{
  int v2;

  v2 = -[_UIApplicationInfoParser supportsPrintCommand](self->_appInfo, "supportsPrintCommand");
  if (v2)
    LOBYTE(v2) = dyld_program_sdk_at_least();
  return v2;
}

- (void)sendEvent:(UIEvent *)event
{
  UIEvent *v4;
  void *v5;
  unint64_t v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = event;
  +[UIEventAttributionView _attemptAuthenticationWithEvent:]((uint64_t)UIEventAttributionView, v4);
  if (-[UIApplication handleEvent:withNewEvent:](self, "handleEvent:withNewEvent:", -[UIEvent _gsEvent](v4, "_gsEvent"), v4))
  {
    _UIAnalyticsGatherMultitouchAnalytics(v4);
    -[UIEvent _dispatchWindows](v4, "_dispatchWindows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sendEvent____s_category;
    if (!sendEvent____s_category)
    {
      v6 = __UILogCategoryGetNode("EventDispatch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&sendEvent____s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v14 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        *(_DWORD *)buf = 134218496;
        v22 = -[UIEvent type](v4, "type");
        v23 = 2048;
        v24 = -[UIEvent subtype](v4, "subtype");
        v25 = 2048;
        v26 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Sending UIEvent type: %li; subtype: %li; to windows: %lu",
          buf,
          0x20u);

      }
    }
    -[UIEvent _isTouchRoutingPolicyBased](v4, "_isTouchRoutingPolicyBased");
    -[UIEvent _isPhysicalKeyEvent](v4, "_isPhysicalKeyEvent");
    objc_msgSend(v5, "count");
    -[UIEvent subtype](v4, "subtype");
    -[UIEvent type](v4, "type");
    -[UIEvent timestamp](v4, "timestamp");
    _UIMachTimeForMediaTime(v7);
    kdebug_trace();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "sendEvent:", v4, (_QWORD)v16);
          -[UIApplication checkForUIEventSessionActionAnalytics:forWindow:](self, "checkForUIEventSessionActionAnalytics:forWindow:", v4, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)systemIsAnimatingApplicationLifecycleEvent
{
  return *((_BYTE *)&self->_applicationFlags + 4) & 1;
}

- (uint64_t)_internalHandleHIDEventBypassingUIEvent:(uint64_t)result
{
  void *v3;
  _QWORD block[5];

  if (result)
  {
    v3 = (void *)result;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__UIApplication__internalHandleHIDEventBypassingUIEvent___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = result;
    if (qword_1EDDC82F8 != -1)
      dispatch_once(&qword_1EDDC82F8, block);
    if (byte_1EDDC8016)
      return objc_msgSend(v3, "_handleHIDEventBypassingUIEvent:", a2);
    else
      return 0;
  }
  return result;
}

- (BOOL)isIgnoringInteractionEvents
{
  return (*((_BYTE *)&self->_applicationFlags + 3) & 0x1E) != 0;
}

- (void)checkForUIEventSessionActionAnalytics:(id)a3 forWindow:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  double *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  double *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  double *v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
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
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[UIApplication isFrontBoard](self, "isFrontBoard"))
  {
    v8 = *((_QWORD *)&self->_applicationFlags + 1);
    if ((v8 & 0x4000000000) == 0 && (v8 & 0x18000000000) != 0x8000000000)
    {
      if (self->_needToFlushUIEventSessionActionAnalytics)
      {
        +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "writeAnalytics");

      }
      self->_needToFlushUIEventSessionActionAnalytics = 0;
      goto LABEL_43;
    }
    self->_needToFlushUIEventSessionActionAnalytics = 1;
  }
  v10 = objc_opt_class();
  if (v10 == objc_opt_class() && _UIEventHIDGetDescendantPointerEvent(objc_msgSend(v6, "_hidEvent")))
  {
    objc_msgSend(v6, "allTouches");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "count");

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v6, "allTouches");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v66 != v15)
            objc_enumerationMutation(v12);
          v17 = *(double **)(*((_QWORD *)&v65 + 1) + 8 * i);
          +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[UITouch _locationInWindow:](v17, v7);
          v21 = v20;
          objc_msgSend(v7, "bounds");
          objc_msgSend(v18, "didPointerHover:withLocationInWindow:withWindowBounds:", v6, v19, v21, v22, v23, v24, v25);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v14);
    }

  }
  v26 = objc_opt_class();
  if (v26 == objc_opt_class())
  {
    if (_UIEventHIDGetDescendantPointerEvent(objc_msgSend(v6, "_hidEvent")))
    {
      objc_msgSend(v6, "allTouches");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "count");

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(v6, "allTouches");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v62;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v62 != v31)
              objc_enumerationMutation(v28);
            v33 = *(double **)(*((_QWORD *)&v61 + 1) + 8 * j);
            if (objc_msgSend(v33, "phase") == 3)
            {
              +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[UITouch _locationInWindow:](v33, v7);
              v37 = v36;
              objc_msgSend(v7, "bounds");
              objc_msgSend(v34, "didPointerClick:withLocationInWindow:withWindowBounds:", v6, v35, v37, v38, v39, v40, v41);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v30);
      }
    }
    else
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(v6, "allTouches", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v58;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v58 != v45)
              objc_enumerationMutation(v28);
            v47 = *(double **)(*((_QWORD *)&v57 + 1) + 8 * k);
            if (!objc_msgSend(v47, "phase")
              || objc_msgSend(v47, "phase") == 1
              || objc_msgSend(v47, "phase") == 3
              || objc_msgSend(v47, "phase") == 4)
            {
              v48 = objc_msgSend(v6, "_trackpadFingerDownCount");
              +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = -[UITouch _locationInWindow:](v47, v7);
              v52 = v51;
              objc_msgSend(v7, "bounds");
              objc_msgSend(v49, "didTouch:withLocationInWindow:withWindowBounds:withTrackpadFingerDownCount:", v47, v48, v50, v52, v53, v54, v55, v56);

            }
          }
          v44 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        }
        while (v44);
      }
    }

  }
LABEL_43:

}

uint64_t __34__UIApplication__firstCommitBlock__block_invoke_2(uint64_t a1)
{
  _UIApplicationDrainManagedAutoreleasePool();
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  return _cleanUpAfterCAFlushAndRunDeferredBlocks(*(void **)(a1 + 32), 1);
}

- (BOOL)_supportsIndirectInputEvents
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIApplication__supportsIndirectInputEvents__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1EDDC82B8 != -1)
    dispatch_once(&qword_1EDDC82B8, block);
  return byte_1EDDC8015;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  _BOOL4 v3;

  if ((objc_msgSend((id)objc_opt_class(), "_isSystemUIService") & 1) != 0)
    LOBYTE(v3) = 0;
  else
    return *((unsigned __int8 *)&self->_applicationFlags + 3) >> 7;
  return v3;
}

- (BOOL)isSuspendedEventsOnly
{
  void *v2;
  char v3;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspendedEventsOnly");

  return v3;
}

- (BOOL)_systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3
{
  if (!+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled", a3)
    || !objc_msgSend((id)UIApp, "isFrontBoard"))
  {
    return 1;
  }
  if (qword_1EDDC8150 != -1)
    dispatch_once(&qword_1EDDC8150, &__block_literal_global_939_0);
  return byte_1EDDC8008 == 0;
}

+ (BOOL)_isSystemUIService
{
  return 0;
}

- (BOOL)_frontMostAppInterfaceOrientationIsSignificant
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 13) >> 4) & 1;
}

- (BOOL)isSuspendedUnderLock
{
  void *v2;
  char v3;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspendedUnderLock");

  return v3;
}

+ (id)stringForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("Interface Unknown");
  else
    return off_1E16DDF58[a3 - 1];
}

- (id)_touchesEventForWindow:(id)a3
{
  return -[UIEventEnvironment _touchesEventForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
}

- (void)_cancelGestureRecognizersForView:(id)a3
{
  UIGestureEnvironment *gestureEnvironment;
  id v4;

  gestureEnvironment = self->__gestureEnvironment;
  objc_msgSend(a3, "gestureRecognizers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)gestureEnvironment, v4);

}

- (int64_t)_pureEffectiveUserInterfaceStyle
{
  int64_t result;
  void *v4;
  int64_t v5;
  void *v6;
  int64_t v7;

  if (qword_1EDDC83D8 != -1)
    dispatch_once(&qword_1EDDC83D8, &__block_literal_global_2952);
  result = qword_1EDDC83D0;
  if (!qword_1EDDC83D0)
  {
    result = +[UIApplication _debugUserInterfaceStyleOverride](UIApplication, "_debugUserInterfaceStyleOverride");
    if (!result)
    {
      -[UIApplication _observeDebugOrTestUserInterfaceStyleChanged](self, "_observeDebugOrTestUserInterfaceStyleChanged");
      if (qword_1EDDC83F0 != -1)
        dispatch_once(&qword_1EDDC83F0, &__block_literal_global_2968);
      if (!byte_1EDDC8023)
        return self->_systemUserInterfaceStyle;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerForKey:", CFSTR("OverrideUserInterfaceStyle"));

      result = v5;
      if (!v5)
      {
        _UIKitUserDefaults();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "integerForKey:", CFSTR("OverrideUserInterfaceStyle"));

        result = v7;
        if (!v7)
          return self->_systemUserInterfaceStyle;
      }
    }
  }
  return result;
}

+ (int64_t)_debugUserInterfaceStyleOverride
{
  return sDebugUserInterfaceStyleOverride;
}

- (void)_observeDebugOrTestUserInterfaceStyleChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__UIApplication__observeDebugOrTestUserInterfaceStyleChanged__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (_observeDebugOrTestUserInterfaceStyleChanged_onceToken != -1)
    dispatch_once(&_observeDebugOrTestUserInterfaceStyleChanged_onceToken, block);
}

- (int)_loadMainInterfaceFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  int v11;
  int v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("NSMainNibFile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIApplication _mainStoryboardName](self, "_mainStoryboardName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  v8 = -[UIApplication _hasStoryboard](self, "_hasStoryboard");
  v9 = v8;
  if (v7)
    v10 = !v8;
  else
    v10 = 1;
  if (!v10)
  {
    NSLog(CFSTR("NSMainNibFile and UIMainStoryboardFile are both set. NSMainNibFile ignored."));
    if (!v9)
      goto LABEL_9;
LABEL_7:
    v11 = -[UIApplication _loadMainStoryboardFileNamed:bundle:](self, "_loadMainStoryboardFileNamed:bundle:", v6, v3);
    goto LABEL_11;
  }
  if (v8)
    goto LABEL_7;
LABEL_9:
  if (!v7)
  {
    v12 = 2;
    goto LABEL_13;
  }
  v11 = -[UIApplication _loadMainNibFileNamed:bundle:](self, "_loadMainNibFileNamed:bundle:", v5, v3);
LABEL_11:
  v12 = v11;
LABEL_13:

  return v12;
}

- (BOOL)_hasStoryboard
{
  void *v2;
  BOOL v3;

  -[UIApplication _mainStoryboardName](self, "_mainStoryboardName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_mainStoryboardName
{
  NSString *mainStoryboardName;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  mainStoryboardName = self->_mainStoryboardName;
  if (!mainStoryboardName)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("UIMainStoryboardFile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSString *)objc_msgSend(v6, "copy");
    v8 = self->_mainStoryboardName;
    self->_mainStoryboardName = v7;

    mainStoryboardName = self->_mainStoryboardName;
  }
  return mainStoryboardName;
}

- (id)nextResponder
{
  UIApplicationDelegate *v2;
  objc_super v4;

  if ((*((_BYTE *)&self->_applicationFlags + 10) & 0x10) != 0)
  {
    v2 = self->_delegate;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIApplication;
    -[UIResponder nextResponder](&v4, sel_nextResponder);
    v2 = (UIApplicationDelegate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)statusBarWithWindow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIStatusBar *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "interfaceOrientation");
  else
    v6 = 0;
  objc_msgSend(v5, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _createStatusBarIfNeededWithOrientation:forWindowScene:](self, "_createStatusBarIfNeededWithOrientation:forWindowScene:", v6, v7);

  v8 = self->_statusBar;
  return v8;
}

- (void)_createStatusBarIfNeededWithOrientation:(int64_t)a3 forWindowScene:(id)a4
{
  id v6;
  _BOOL4 v7;
  id v8;

  v6 = a4;
  if (!self->_statusBar)
  {
    v8 = v6;
    v7 = -[UIApplication _hostsSystemStatusBar](self, "_hostsSystemStatusBar");
    v6 = v8;
    if (v7)
    {
      if (!a3)
        a3 = -[UIApplication _safeInterfaceOrientationForNoWindow](self, "_safeInterfaceOrientationForNoWindow");
      if ((*((_BYTE *)&self->_applicationFlags + 14) & 0x10) != 0)
        -[UIApplication _createStatusBarWithRequestedStyle:orientation:hidden:](self, "_createStatusBarWithRequestedStyle:orientation:hidden:", 0, a3, 0);
      else
        -[UIApplication _createStatusBarWithRequestedStyle:orientation:hidden:forWindowScene:](self, "_createStatusBarWithRequestedStyle:orientation:hidden:forWindowScene:", 0, a3, 0, v8);
      v6 = v8;
    }
  }

}

- (id)_preferredContentSizeCategory:(unint64_t)a3
{
  char v3;
  NSString *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;

  v3 = a3;
  -[UIApplication preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0 && UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v6 = CFSTR("UICTContentSizeCategoryXXXL");

    v5 = v6;
  }
  if ((v3 & 2) != 0)
  {
    if (qword_1EDDC84D0 != -1)
      dispatch_once(&qword_1EDDC84D0, &__block_literal_global_3100);
    if (objc_msgSend((id)qword_1EDDC84D8, "containsObject:", v5))
    {
      objc_msgSend((id)objc_opt_class(), "_defaultContentSizeCategory");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
  }
  return v5;
}

- (void)_updateSerializableKeyCommandsForResponder:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];

  if (-[UIApplication _supportsMenuActions](self, "_supportsMenuActions", a3))
  {
    v4 = *((_QWORD *)&self->_applicationFlags + 1);
    if ((v4 & 0x8000000000000) == 0)
    {
      *(_QWORD *)&self->_applicationFlags = self->_applicationFlags;
      *((_QWORD *)&self->_applicationFlags + 1) = v4 | 0x8000000000000;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __60__UIApplication__updateSerializableKeyCommandsForResponder___block_invoke;
      v5[3] = &unk_1E16B1B28;
      v5[4] = self;
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v5);
    }
  }
}

- (void)_performBlockAfterCATransactionCommits:(id)a3
{
  -[UIApplication _performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:block:](self, "_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:block:", 0, a3);
}

void __45__UIApplication__isSpringBoardShowingAnAlert__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isMainDisplay") & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v12, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isUISubclass") & 1) == 0)
  {

LABEL_6:
    v11 = v12;
    goto LABEL_7;
  }
  objc_msgSend(v12, "uiSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "deactivationReasons");

  v11 = v12;
  if ((v10 & 0x2000) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_7:

}

- (BOOL)_isActivated
{
  return (*(_DWORD *)&self->_applicationFlags & 0x3FFFF) == 0;
}

- (BOOL)_supportsShakesWhenNotActive
{
  return 0;
}

- (BOOL)_needsShakesWhenInactive
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
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
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_needsShakesWhenInactive") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_rotationDisabledDuringTouch
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 5) & 1;
}

- (id)_mainEventEnvironment
{
  UIEventDispatcher *eventDispatcher;

  eventDispatcher = self->_eventDispatcher;
  if (eventDispatcher)
    return eventDispatcher->_mainEnvironment;
  else
    return 0;
}

- (void)_cancelViewProcessingOfTouchesOrPresses:(id)a3 withEvent:(id)a4 sendingCancelToViewsOfTouchesOrPresses:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__UIApplication__cancelViewProcessingOfTouchesOrPresses_withEvent_sendingCancelToViewsOfTouchesOrPresses___block_invoke;
  v12[3] = &unk_1E16DD5B8;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  -[UIApplication _cancelTouchesOrPresses:withEvent:includingGestures:notificationBlock:](self, "_cancelTouchesOrPresses:withEvent:includingGestures:notificationBlock:", a3, v10, 0, v12);

}

- (void)_cancelTouchesOrPresses:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__UIApplication__cancelTouchesOrPresses_withEvent___block_invoke;
  v8[3] = &unk_1E16DD5B8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[UIApplication _cancelTouchesOrPresses:withEvent:includingGestures:notificationBlock:](self, "_cancelTouchesOrPresses:withEvent:includingGestures:notificationBlock:", a3, v7, 1, v8);

}

- (void)_cancelTouchesOrPresses:(id)a3 withEvent:(id)a4 includingGestures:(BOOL)a5 notificationBlock:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void (**v11)(_QWORD, NSMapTable *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void (**v44)(_QWORD, NSMapTable *);
  id v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  id obja;
  NSMapTable *v54;
  __int128 v55;
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
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v7 = a5;
  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD, NSMapTable *))a6;
  if (objc_msgSend(v9, "count"))
  {
    v44 = v11;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v54 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v43 = v9;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v68;
      v48 = v7;
      v46 = *(_QWORD *)v68;
      do
      {
        v15 = 0;
        v50 = v13;
        do
        {
          if (*(_QWORD *)v68 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v15);
          objc_msgSend(v16, "_eventComponentPhaseForValue:", 4, v43);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_setEventComponentPhase:", v17);

          objc_msgSend(v16, "_responder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v16, "_responder");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable objectForKey:](v54, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              v20 = (void *)objc_opt_new();
              objc_msgSend(v16, "_responder");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMapTable setObject:forKey:](v54, "setObject:forKey:", v20, v21);

            }
            objc_msgSend(v20, "addObject:", v16);

          }
          if (v7)
          {
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v16, "gestureRecognizers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v64;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v64 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
                  -[NSMapTable objectForKey:](v54, "objectForKey:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v28)
                  {
                    v28 = (void *)objc_opt_new();
                    -[NSMapTable setObject:forKey:](v54, "setObject:forKey:", v28, v27);
                  }
                  objc_msgSend(v28, "addObject:", v16);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              }
              while (v24);
            }

            v7 = v48;
            v14 = v46;
            v13 = v50;
          }
          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v13);
    }

    v44[2](v44, v54);
    objc_msgSend(obj, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "_eventComponentType");

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    NSAllMapTableKeys(v54);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v49)
    {
      v47 = *(_QWORD *)v60;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v60 != v47)
            objc_enumerationMutation(v45);
          v51 = v31;
          v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v31);
          -[NSMapTable objectForKey:](v54, "objectForKey:", v32, v43);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          obja = v32;
          isKindOfClass = objc_opt_isKindOfClass();
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v35 = v33;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v56 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                if ((isKindOfClass & 1) != 0)
                {
                  if (v30 == 1)
                  {
                    objc_msgSend(obja, "ignorePress:forEvent:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j), v10);
                  }
                  else if (!v30)
                  {
                    objc_msgSend(obja, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j), v10);
                  }
                }
                objc_msgSend(v40, "gestureRecognizers");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "count");

                if (v42)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v10, "_clearViewForTouch:", v40);
                  else
                    objc_msgSend(v40, "_setResponder:", 0);
                }
                else if (v30 == 1)
                {
                  objc_msgSend(v10, "_removePress:", v40);
                }
                else if (!v30)
                {
                  objc_msgSend(v10, "_removeTouch:", v40);
                }
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            }
            while (v37);
          }

          v31 = v51 + 1;
        }
        while (v51 + 1 != v49);
        v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v49);
    }

    v9 = v43;
    v11 = v44;
  }

}

void __106__UIApplication__cancelViewProcessingOfTouchesOrPresses_withEvent_sendingCancelToViewsOfTouchesOrPresses___block_invoke(uint64_t a1, void *a2)
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  NSAllMapTableKeys(v3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v3, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;

        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "intersectSet:", *(_QWORD *)(a1 + 32));
        if (objc_msgSend(v13, "count") && objc_msgSend(v8, "__isKindOfUIResponder"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[_UIResponderIntegrityProtection rip](_UIResponderIntegrityProtection, "rip");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "startDeliveringPresses:inPhase:withEvent:", v12, 4, *(_QWORD *)(a1 + 40));
            objc_msgSend(v8, "pressesCancelled:withEvent:", v12, *(_QWORD *)(a1 + 40));
            objc_msgSend(v14, "finishedDeliveringPresses");

          }
          else
          {
            objc_msgSend(v8, "touchesCancelled:withEvent:", v12, *(_QWORD *)(a1 + 40));
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (NSSet)connectedScenes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)_stopDeactivatingForReason:(int)a3
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t applicationFlags;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void (**v27)(void);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v3 = *(_QWORD *)&a3;
  v49 = *MEMORY[0x1E0C80C00];
  if (a3 <= 12)
  {
    if (a3 == -1)
      return;
    if (a3 == 8)
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSuppressingKeyboard:forScene:", 0, 0);

      v6 = qword_1EDDC8080;
      if (!qword_1EDDC8080)
      {
        v6 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&qword_1EDDC8080);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        _UIApplicationDeactivationReasonLoggableDescription(8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v9;
        v43 = 2114;
        v44 = v10;
        v11 = "Acting on removal of deactivation reason: %{public}@; deactivation reasons: %{public}@";
LABEL_14:
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);

        return;
      }
      return;
    }
    goto LABEL_17;
  }
  if (a3 == 13)
  {
    applicationFlags = (uint64_t)self->_applicationFlags;
    if ((applicationFlags & 0x2000) == 0)
      return;
    v15 = *((_QWORD *)&self->_applicationFlags + 1);
    goto LABEL_18;
  }
  if (a3 != 30)
  {
LABEL_17:
    applicationFlags = (uint64_t)self->_applicationFlags;
    v15 = *((_QWORD *)&self->_applicationFlags + 1);
LABEL_18:
    v16 = applicationFlags & ~(1 << a3);
    if ((v16 & 0x21) != 0)
      v17 = applicationFlags & 0xFFFFFFFFFFFC0000 | v16 & 0x3FFFF;
    else
      v17 = applicationFlags & 0xFFFFFFFEFFFC0000 | v16 & 0x3FFFFLL;
    *(_QWORD *)&self->_applicationFlags = v17;
    *((_QWORD *)&self->_applicationFlags + 1) = v15;
    v18 = qword_1EDDC8088;
    if (!qword_1EDDC8088)
    {
      v18 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&qword_1EDDC8088);
    }
    v19 = applicationFlags & 0x3FFFF;
    v20 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      _UIApplicationDeactivationReasonLoggableDescription(v3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _UIApplicationDeactivationReasonMaskLoggableDescription(applicationFlags & 0x3FFFF);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *((_DWORD *)&self->_applicationFlags + 1) & 1;
      *(_DWORD *)buf = 138544130;
      v42 = v22;
      v43 = 2114;
      v44 = v23;
      v45 = 2114;
      v46 = v24;
      v47 = 1024;
      v48 = v25;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "Deactivation reason removed: %{public}@; deactivation reasons: %{public}@ -> %{public}@; animating application l"
        "ifecycle event: %d",
        buf,
        0x26u);

    }
    if (!-[UIApplication isFrontBoard](self, "isFrontBoard"))
    {
      -[UIApplication __queuedOrientationChange](self, "__queuedOrientationChange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[UIApplication __queuedOrientationChange](self, "__queuedOrientationChange");
        v27 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v27[2]();

        -[UIApplication __setQueuedOrientationChange:](self, "__setQueuedOrientationChange:", 0);
      }
      else if (-[UIApplication _canReceiveDeviceOrientationEvents](self, "_canReceiveDeviceOrientationEvents"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UIApplication isSuspended](self, "isSuspended", CFSTR("UIDeviceOrientationRotateAnimatedUserInfoKey")) ^ 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("UIDeviceOrientationDidChangeNotification"), v29, v31);

      }
    }
    v32 = (uint64_t)self->_applicationFlags;
    if ((*(_DWORD *)&self->_applicationFlags & 0x3FFFF) != v19)
    {
      v33 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dictionaryWithObject:forKey:", v34, CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "postNotificationName:object:userInfo:", CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification"), self, v35);

      v32 = (uint64_t)self->_applicationFlags;
    }
    if (v19)
      v37 = (v32 & 0x3FFFF) == 0;
    else
      v37 = 0;
    if (v37)
    {
      kdebug_trace();
      byte_1EDDC7FF4 = 1;
      -[UIApplication _updateHangTracer](self, "_updateHangTracer");
      entr_act_begin();
      -[UIApplicationDelegate methodForSelector:](self->_delegate, "methodForSelector:", sel_applicationDidBecomeActive_);
      entr_act_modify();
      _UIAnalyticsGatherMultitouchForegroundAnalytics(1);
      if (self->_delegate
        && (*((_BYTE *)&self->_applicationFlags + 6) & 0x10) != 0
        && (objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) == 0
        && (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
      {
        -[UIApplicationDelegate applicationDidBecomeActive:](self->_delegate, "applicationDidBecomeActive:", self);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "postNotificationName:object:userInfo:", CFSTR("UIApplicationDidBecomeActiveNotification"), self, 0);

      *((_QWORD *)&self->_applicationFlags + 1) &= ~0x40000000000uLL;
      kdebug_trace();
      v32 = (uint64_t)self->_applicationFlags;
    }
    if (((v32 ^ applicationFlags) & 0x100000000) != 0 && !-[UIApplication isSuspended](self, "isSuspended"))
      BSSetMainThreadPriorityFixedForUI();
    if ((_DWORD)v3 == 11)
      +[UIView _endSuspendingMotionEffectsForReason:](UIView, "_endSuspendingMotionEffectsForReason:", CFSTR("_UIMotionEffectEngineSuspensionReasonBackgrounded"));
    return;
  }
  v12 = qword_1EDDC8078;
  if (!qword_1EDDC8078)
  {
    v12 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&qword_1EDDC8078);
  }
  v13 = *(NSObject **)(v12 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v13;
    _UIApplicationDeactivationReasonLoggableDescription(30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v9;
    v43 = 2114;
    v44 = v10;
    v11 = "Ignoring removal of deactivation reason: %{public}@; deactivation reasons: %{public}@";
    goto LABEL_14;
  }
}

- (id)__queuedOrientationChange
{
  return self->___queuedOrientationChange;
}

- (BOOL)_canReceiveDeviceOrientationEvents
{
  void *v2;
  void *v3;
  char v4;

  -[UIApplication _mainScene](self, "_mainScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "uiCanReceiveDeviceOrientationEvents");
  else
    v4 = 1;

  return v4;
}

- (id)_mainScene
{
  return _UIApplicationMainSceneForDisplayIdentity(0);
}

- (void)_updateHangTracer
{
  int v2;
  __CFRunLoop *Main;
  const __CFString *v4;
  __CFRunLoop *v5;

  if (__hangTracerIsTaskedOn && byte_1EDDC7FF4 == 1 && (byte_1EDDC8010 & 1) == 0)
    v2 = !-[UIApplication isSuspended](self, "isSuspended");
  else
    v2 = 0;
  if (byte_1EDDC8011 != v2)
  {
    if (v2)
    {
      if (qword_1EDDC81D8)
      {
        HTResumeHangTracing();
      }
      else
      {
        qword_1EDDC81D8 = HTHangEventCreate();
        if (!qword_1EDDC81D8)
          return;
        HTHangEventAddUserActionCaptureCallback();
        qword_1EDDC81E0 = (uint64_t)CFRunLoopObserverCreate(0, 0x20uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)__trackRunLoopTimes, 0);
        Main = CFRunLoopGetMain();
        v4 = (const __CFString *)*MEMORY[0x1E0C9B270];
        CFRunLoopAddObserver(Main, (CFRunLoopObserverRef)qword_1EDDC81E0, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        qword_1EDDC81E8 = (uint64_t)CFRunLoopObserverCreate(0, 0x46uLL, 1u, 0xFFFFFFFF80000000, (CFRunLoopObserverCallBack)__trackRunLoopTimes, 0);
        v5 = CFRunLoopGetMain();
        CFRunLoopAddObserver(v5, (CFRunLoopObserverRef)qword_1EDDC81E8, v4);
      }
    }
    else if (qword_1EDDC81D8)
    {
      HTSuspendHangTracing();
    }
    byte_1EDDC8011 = v2;
  }
}

- (void)_setAmbiguousControlCenterActivationMargin:(double)a3
{
  void *v4;
  _QWORD v5[5];

  -[UIApplication _mainScene](self, "_mainScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__UIApplication__setAmbiguousControlCenterActivationMargin___block_invoke;
  v5[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  *(double *)&v5[4] = a3;
  objc_msgSend(v4, "updateUIClientSettingsWithBlock:", v5);

}

- (void)_setReachabilitySupported:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIApplication _mainScene](self, "_mainScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setReachabilitySupported:forReason:", v3, CFSTR("UIApplication _setReachabilitySupported (deprecated)"));

}

- (void)_windowDidResignApplicationKey:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIApplication _updateSerializableKeyCommandsForResponder:](self, "_updateSerializableKeyCommandsForResponder:", v4);

}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIApplication _updateSerializableKeyCommandsForResponder:](self, "_updateSerializableKeyCommandsForResponder:", v4);

}

- (void)_setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSMutableSet removeObject:](self->_idleTimerDisabledReasons, "removeObject:", v6);
  if (v4)
    -[NSMutableSet addObject:](self->_idleTimerDisabledReasons, "addObject:", v6);
  v7 = -[NSMutableSet count](self->_idleTimerDisabledReasons, "count") != 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15[0] = v12;
        v15[1] = 3221225472;
        v15[2] = __49__UIApplication__setIdleTimerDisabled_forReason___block_invoke;
        v15[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        v16 = v7;
        objc_msgSend(v14, "_updateUIClientSettingsWithBlock:", v15);
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (int64_t)_normativeWhitePointAdaptivityStyleForWindow:(id)a3
{
  return -[_UIApplicationInfoParser whitePointAdaptivityStyle](self->_appInfo, "whitePointAdaptivityStyle", a3);
}

- (id)delegate
{
  return self->_delegate;
}

- (BOOL)_appSupportsMultipleScenes
{
  return *((_BYTE *)&self->_applicationFlags + 14) & 1;
}

- (int64_t)_fallbackInterfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 currentOrientation:(int64_t)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  int64_t v14;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "orientation");

  if ((unint64_t)(v10 - 1) >= 4)
    v11 = 0;
  else
    v11 = v10;
  if (!a5)
    a5 = -[UIApplication _defaultSceneInterfaceOrientationReturningUnknownForNilScene:](self, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0);
  if (_viewServiceFallbackOrientationMapResolver)
    v12 = (id)_viewServiceFallbackOrientationMapResolver;
  else
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01708]), "initWithTargetOrientation:currentOrientation:", v11, a5);
  v13 = v12;
  v14 = objc_msgSend(v12, "interfaceOrientationForSupportedOrientations:preferredOrientation:", a3, a4);

  return v14;
}

- (UIBackgroundRefreshStatus)backgroundRefreshStatus
{
  UIBackgroundRefreshStatus result;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;

  result = _cachedBackgroundRefreshStatus;
  if (_cachedBackgroundRefreshStatus == -1)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAutomaticAppUpdatesAllowed");

    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
      objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.mt"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithSuiteName:", v6);

      objc_msgSend(v7, "synchronize");
      objc_msgSend(v7, "objectForKey:", CFSTR("KeepAppsUpToDateAppList"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _UIMainBundleIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = objc_msgSend(v10, "BOOLValue");
        v12 = 1;
        if (v11)
          v12 = 2;
      }
      else
      {
        v12 = 2;
      }
      _cachedBackgroundRefreshStatus = v12;

      return _cachedBackgroundRefreshStatus;
    }
    else
    {
      result = UIBackgroundRefreshStatusDenied;
      _cachedBackgroundRefreshStatus = 1;
    }
  }
  return result;
}

+ (id)_defaultContentSizeCategory
{
  return CFSTR("UICTContentSizeCategoryL");
}

+ (BOOL)_isCertainCheckpointInAppLaunchReached
{
  return byte_1EDDC7FFA;
}

- (id)_touchesEvent
{
  UIEventEnvironment *mainEnvironment;
  void *v4;
  void *v5;
  unint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v7 = _touchesEvent___s_category;
    if (!_touchesEvent___s_category)
    {
      v7 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_touchesEvent___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[UIApplication _touchesEvent]";
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "%s will no longer work as expected. Please stop using it.", (uint8_t *)&v9, 0xCu);
    }
  }
  mainEnvironment = self->_eventDispatcher->_mainEnvironment;
  -[UIApplication keyWindow](self, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventEnvironment _touchesEventForWindow:]((uint64_t)mainEnvironment, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isClassic
{
  return +[UIApplication _isClassic](UIApplication, "_isClassic");
}

void __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D232A0]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (_UIResponderChainFixerUpper)_responderBasedEventDeliverer
{
  _UIResponderChainFixerUpper *responderBasedEventDeliverer;
  BOOL v4;
  _UIResponderChainFixerUpper *v5;
  _UIResponderChainFixerUpper *v6;

  if (qword_1EDDC8300 != -1)
    dispatch_once(&qword_1EDDC8300, &__block_literal_global_1497_0);
  responderBasedEventDeliverer = self->_responderBasedEventDeliverer;
  if (responderBasedEventDeliverer)
    v4 = 1;
  else
    v4 = byte_1EDDC8017 == 0;
  if (!v4)
  {
    v5 = (_UIResponderChainFixerUpper *)objc_opt_new();
    v6 = self->_responderBasedEventDeliverer;
    self->_responderBasedEventDeliverer = v5;

    responderBasedEventDeliverer = self->_responderBasedEventDeliverer;
  }
  return responderBasedEventDeliverer;
}

- (UIApplication)init
{
  UIApplication *v3;
  UIApplication *v4;
  NSMutableArray *v5;
  NSMutableArray *keyCommandRegistrationAssertions;
  NSMutableDictionary *v7;
  NSMutableDictionary *keyUpKeyCommandMap;
  _UIKeyboardHIDEventOrderedDescriptorSet *v9;
  _UIKeyboardHIDEventOrderedDescriptorSet *physicalKeycodeSet;
  NSMutableArray *v11;
  NSMutableArray *postCommitActions;
  NSMutableSet *v13;
  NSMutableSet *idleTimerDisabledReasons;
  void *v15;
  UIGestureEnvironment *v16;
  UIGestureEnvironment *gestureEnvironment;
  UIGestureDelayedEventComponentDispatcher *v18;
  UIGestureDelayedEventComponentDispatcher *gestureDelayedEventComponentDispatcher;
  UIEventDispatcher *v20;
  UIEventDispatcher *eventDispatcher;
  UIActivityContinuationManager *v22;
  UIActivityContinuationManager *activityContinuationManager;
  uint64_t v24;
  _UIApplicationInfoParser *appInfo;
  void *v26;
  void *v27;
  uint64_t v28;
  BSServiceConnectionEndpointMonitor *endpointMonitor;
  objc_class *v30;
  IMP MethodImplementation;
  objc_class *v32;
  objc_class *v33;
  IMP v34;
  objc_class *v35;
  objc_class *v36;
  IMP v37;
  objc_class *v38;
  uint64_t v39;
  UISApplicationState *appState;
  void *v41;
  void *v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)UIApplication;
  v3 = -[UIApplication init](&v44, sel_init);
  v4 = v3;
  if (v3)
  {
    if ((UIApplication *)UIApp != v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("UIApplication.m"), 1553, CFSTR("There can only be one UIApplication instance."));

    }
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keyCommandRegistrationAssertions = v4->_keyCommandRegistrationAssertions;
    v4->_keyCommandRegistrationAssertions = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyUpKeyCommandMap = v4->_keyUpKeyCommandMap;
    v4->_keyUpKeyCommandMap = v7;

    v9 = objc_alloc_init(_UIKeyboardHIDEventOrderedDescriptorSet);
    physicalKeycodeSet = v4->_physicalKeycodeSet;
    v4->_physicalKeycodeSet = v9;

    *((_QWORD *)&v4->_applicationFlags + 1) = *((_QWORD *)&v4->_applicationFlags + 1) & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(NSVersionOfLinkTimeLibrary("UIKit") == -1) << 16);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    postCommitActions = v4->_postCommitActions;
    v4->_postCommitActions = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    idleTimerDisabledReasons = v4->_idleTimerDisabledReasons;
    v4->_idleTimerDisabledReasons = v13;

    *(_QWORD *)&v4->_applicationFlags |= 0x1000000uLL;
    _UIKitPreferencesOnce();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __jetsamDisabled = objc_msgSend(v15, "_BOOLForKey:", CFSTR("JetsamDisabled"));

    v16 = objc_alloc_init(UIGestureEnvironment);
    gestureEnvironment = v4->__gestureEnvironment;
    v4->__gestureEnvironment = v16;

    v18 = objc_alloc_init(UIGestureDelayedEventComponentDispatcher);
    gestureDelayedEventComponentDispatcher = v4->__gestureDelayedEventComponentDispatcher;
    v4->__gestureDelayedEventComponentDispatcher = v18;

    v20 = -[UIEventDispatcher initWithApplication:]([UIEventDispatcher alloc], "initWithApplication:", v4);
    eventDispatcher = v4->_eventDispatcher;
    v4->_eventDispatcher = v20;

    -[UIApplication setApplicationSupportsShakeToEdit:](v4, "setApplicationSupportsShakeToEdit:", 1);
    v22 = -[UIActivityContinuationManager initWithApplicationContext:]([UIActivityContinuationManager alloc], "initWithApplicationContext:", v4);
    activityContinuationManager = v4->_activityContinuationManager;
    v4->_activityContinuationManager = v22;

    +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
    v24 = objc_claimAutoreleasedReturnValue();
    appInfo = v4->_appInfo;
    v4->_appInfo = (_UIApplicationInfoParser *)v24;

    -[UIApplication _supportsIndirectInputEvents](v4, "_supportsIndirectInputEvents");
    -[UIApplication _deactivateForReason:notify:](v4, "_deactivateForReason:notify:", 10, 0);
    -[UIApplication _fetchInfoPlistFlags](v4, "_fetchInfoPlistFlags");
    -[UIApplication _setIdleModeVisualEffectsEnabled:](v4, "_setIdleModeVisualEffectsEnabled:", (byte_1ECD76804 != 0) & ~_UIInternalPreferenceUsesDefault(&_MergedGlobals_148, (uint64_t)CFSTR("AssumeApplicationSupportsIdleMode"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool));
    v26 = (void *)MEMORY[0x1E0D23028];
    objc_msgSend(MEMORY[0x1E0D23170], "serviceName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "monitorForService:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    endpointMonitor = v4->_endpointMonitor;
    v4->_endpointMonitor = (BSServiceConnectionEndpointMonitor *)v28;

    -[BSServiceConnectionEndpointMonitor activate](v4->_endpointMonitor, "activate");
    v30 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v30, sel_interfaceOrientation);
    v32 = (objc_class *)objc_opt_class();
    *((_QWORD *)&v4->_applicationFlags + 1) = *((_QWORD *)&v4->_applicationFlags + 1) & 0xFFFFF7FFFFFFFFFFLL | ((unint64_t)(MethodImplementation != class_getMethodImplementation(v32, sel_interfaceOrientation)) << 43);
    v33 = (objc_class *)objc_opt_class();
    v34 = class_getMethodImplementation(v33, sel__frontMostAppOrientation);
    v35 = (objc_class *)objc_opt_class();
    *((_QWORD *)&v4->_applicationFlags + 1) = *((_QWORD *)&v4->_applicationFlags + 1) & 0xFFFFEFFFFFFFFFFFLL | ((unint64_t)(v34 != class_getMethodImplementation(v35, sel__frontMostAppOrientation)) << 44);
    v36 = (objc_class *)objc_opt_class();
    v37 = class_getMethodImplementation(v36, sel__createStatusBarWithRequestedStyle_orientation_hidden_);
    v38 = (objc_class *)objc_opt_class();
    *((_QWORD *)&v4->_applicationFlags + 1) = *((_QWORD *)&v4->_applicationFlags + 1) & 0xFFEFFFFFFFFFFFFFLL | ((unint64_t)(v37 != class_getMethodImplementation(v38, sel__createStatusBarWithRequestedStyle_orientation_hidden_)) << 52);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC5B68]), "initForCurrentApplication");
    appState = v4->_appState;
    v4->_appState = (UISApplicationState *)v39;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v4, sel__hardwareKeyboardAvailabilityChanged_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);
    objc_msgSend(v41, "addObserver:selector:name:object:", v4, sel__windowDidBecomeApplicationKey_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
    objc_msgSend(v41, "addObserver:selector:name:object:", v4, sel__windowDidResignApplicationKey_, CFSTR("_UIWindowDidResignApplicationKeyNotification"), 0);
    v4->__shouldAllowContentTextContextExtraction = 1;
    -[UIApplication _registerDefaultApplicationLevelBSActionHandlers](v4, "_registerDefaultApplicationLevelBSActionHandlers");

  }
  _UIUpdateCycleDebugOverlaySetup();
  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault(&dword_1ECD76808, (uint64_t)CFSTR("VisualizeUIViews"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD7680C)
  {
    +[UIView _setupViewVisualization]();
  }
  return v4;
}

- (void)setApplicationSupportsShakeToEdit:(BOOL)applicationSupportsShakeToEdit
{
  uint64_t v3;

  v3 = 2048;
  if (!applicationSupportsShakeToEdit)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)_setOptOutOfRTL:(BOOL)a3
{
  self->optOutOfRTL = a3;
}

- (void)_setIdleModeVisualEffectsEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = 4;
  if (!a3)
    v4 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFFFFBLL | v4;
  -[UIApplication _mainScene](self, "_mainScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIApplication__setIdleModeVisualEffectsEnabled___block_invoke;
  v6[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v7 = a3;
  objc_msgSend(v5, "updateUIClientSettingsWithBlock:", v6);

}

- (void)_fetchInfoPlistFlags
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  _BOOL4 v10;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t applicationFlags;
  void *v18;
  char v19;

  if (qword_1EDDC80E0 != -1)
    dispatch_once(&qword_1EDDC80E0, &__block_literal_global_911);
  if (byte_1EDDC7FFC)
  {
    v3 = (void *)xpc_copy_bootstrap();
    v4 = v3;
    if (v3)
      xpc_dictionary_apply(v3, &__block_literal_global_1318);

  }
  +[UIApplication _isClassic](UIApplication, "_isClassic");
  self->_statusBarRequestedStyle = -[_UIApplicationInfoParser requestedStatusBarStyle](self->_appInfo, "requestedStatusBarStyle");
  v5 = -[_UIApplicationInfoParser statusBarHidden](self->_appInfo, "statusBarHidden");
  p_applicationFlags = &self->_applicationFlags;
  v7 = 0x800000;
  if (!v5)
    v7 = 0;
  *(_QWORD *)p_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFFFFF7FFFFFLL | v7;
  v8 = -[_UIApplicationInfoParser statusBarHiddenWhenVerticallyCompact](self->_appInfo, "statusBarHiddenWhenVerticallyCompact");
  v9 = 0x1000000;
  if (!v8)
    v9 = 0;
  *(_QWORD *)p_applicationFlags = *(_QWORD *)p_applicationFlags & 0xFFFFFFFFFEFFFFFFLL | v9;
  v10 = -[_UIApplicationInfoParser isExitsOnSuspend](self->_appInfo, "isExitsOnSuspend");
  v11 = 0x4000;
  if (!v10)
    v11 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFF3FFFLL | (((v11 >> 14) & 1) << 15) | v11;
  v12 = -[_UIApplicationInfoParser systemWindowsSecure](self->_appInfo, "systemWindowsSecure");
  v13 = 0x2000000000;
  if (!v12)
    v13 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFDFFFFFFFFFLL | v13;
  v14 = -[_UIApplicationInfoParser viewControllerBasedStatusBarAppearance](self->_appInfo, "viewControllerBasedStatusBarAppearance");
  if (v14 == 1)
  {
    applicationFlags = *(_QWORD *)p_applicationFlags;
    v16 = *((_QWORD *)&self->_applicationFlags + 1);
    goto LABEL_22;
  }
  if (!v14 && !-[UIApplication _isSpringBoard](self, "_isSpringBoard"))
  {
    v18 = (void *)objc_opt_class();
    v19 = _UIApplicationWantsExtensionBehavior(v18);
    applicationFlags = (uint64_t)self->_applicationFlags;
    v16 = *((_QWORD *)&self->_applicationFlags + 1);
    if ((v19 & 1) != 0)
    {
      v15 = 0;
      goto LABEL_23;
    }
LABEL_22:
    v15 = 0x800000000;
    goto LABEL_23;
  }
  v15 = 0;
  applicationFlags = (uint64_t)self->_applicationFlags;
  v16 = *((_QWORD *)&self->_applicationFlags + 1);
LABEL_23:
  *(_QWORD *)&self->_applicationFlags = applicationFlags;
  *((_QWORD *)&self->_applicationFlags + 1) = v16 & 0xFFFFFFF7FFFFFFFFLL | v15;
  -[UIApplication _setAlwaysHitTestsForMainScreen:](self, "_setAlwaysHitTestsForMainScreen:", +[UIApplication _isBackgroundStyleTransparent:](UIApplication, "_isBackgroundStyleTransparent:", -[_UIApplicationInfoParser backgroundStyle](self->_appInfo, "backgroundStyle")));
  -[UIApplication _setOptOutOfRTL:](self, "_setOptOutOfRTL:", -[_UIApplicationInfoParser optOutOfRTL](self->_appInfo, "optOutOfRTL"));
}

+ (BOOL)_isBackgroundStyleTransparent:(int64_t)a3
{
  return a3 != 0;
}

- (void)_setAlwaysHitTestsForMainScreen:(BOOL)a3
{
  void *v5;

  if (-[UIApplication _alwaysHitTestsForMainScreen](self, "_alwaysHitTestsForMainScreen") != a3)
  {
    self->_alwaysHitTestsForMainScreen = a3;
    -[UIApplication _mainScene](self, "_mainScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UIApplication _fixupBackgroundHitTestWindow](self, "_fixupBackgroundHitTestWindow");
  }
}

- (void)_fixupBackgroundHitTestWindow
{
  _BOOL4 v3;
  UIWindow *backgroundHitTestWindow;
  _UIBackgroundHitTestWindow *v5;
  void *v6;
  UIWindow *v7;
  UIWindow *v8;
  void *v9;

  v3 = -[UIApplication _alwaysHitTestsForMainScreen](self, "_alwaysHitTestsForMainScreen");
  backgroundHitTestWindow = self->_backgroundHitTestWindow;
  if (v3)
  {
    if (!backgroundHitTestWindow)
    {
      v5 = [_UIBackgroundHitTestWindow alloc];
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_referenceBounds");
      v7 = -[UIWindow initWithFrame:](v5, "initWithFrame:");
      v8 = self->_backgroundHitTestWindow;
      self->_backgroundHitTestWindow = v7;

      -[UIView layer](self->_backgroundHitTestWindow, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHitTestsAsOpaque:", 1);

      -[UIWindow setWindowLevel:](self->_backgroundHitTestWindow, "setWindowLevel:", -1.0);
      -[UIWindow setHidden:](self->_backgroundHitTestWindow, "setHidden:", 0);
    }
  }
  else
  {
    self->_backgroundHitTestWindow = 0;

  }
}

- (BOOL)_alwaysHitTestsForMainScreen
{
  return self->_alwaysHitTestsForMainScreen;
}

- (void)_registerDefaultApplicationLevelBSActionHandlers
{
  _UIOpenURLApplicationBSActionHandler *v3;

  v3 = objc_alloc_init(_UIOpenURLApplicationBSActionHandler);
  -[UIApplication _registerInternalBSActionHandler:](self, "_registerInternalBSActionHandler:", v3);

}

- (void)_registerInternalBSActionHandler:(id)a3
{
  id v4;
  NSMutableArray *internalApplicationBSActionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  internalApplicationBSActionHandlers = self->_internalApplicationBSActionHandlers;
  v8 = v4;
  if (!internalApplicationBSActionHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_internalApplicationBSActionHandlers;
    self->_internalApplicationBSActionHandlers = v6;

    v4 = v8;
    internalApplicationBSActionHandlers = self->_internalApplicationBSActionHandlers;
  }
  -[NSMutableArray addObject:](internalApplicationBSActionHandlers, "addObject:", v4);

}

- (void)_scheduleSceneEventResponseForScene:(id)a3 withResponseBlock:(id)a4
{
  if (a4)
    objc_msgSend((id)qword_1EDDC80B0, "enqueuePostSynchronizeResponse:", a4);
}

- (void)_addAfterCACommitBlockForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)qword_1EDDC80C8;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__UIApplication__addAfterCACommitBlockForViewController___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v7 = v3;
    objc_msgSend(v5, "enqueuePostCommitBlock:", v6);

  }
}

- (void)_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:(BOOL)a3 block:(id)a4
{
  id v7;
  NSMutableArray *postCommitActions;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;

  v7 = a4;
  if (dyld_program_sdk_at_least() && pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 3372, CFSTR("Call must be made on main thread"));

    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    postCommitActions = self->_postCommitActions;
    +[_UIAfterCACommitBlock blockWithBlock:](_UIAfterCACommitBlock, "blockWithBlock:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](postCommitActions, "addObject:", v9);

    goto LABEL_9;
  }
  if (pthread_main_np() == 1)
  {
    objc_msgSend((id)qword_1EDDC80C8, "enqueuePostCommitBlock:", v7);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__UIApplication__performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming_block___block_invoke;
    block[3] = &unk_1E16B1BF8;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_9:

}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  kdebug_trace();
  objc_msgSend((id)qword_1EDDC8098, "addObject:", v9);
  objc_msgSend(v9, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v13, objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene"));
  objc_msgSend(v9, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isUISubclass");

  objc_msgSend(v9, "settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIApplication _connectUISceneFromFBSScene:transitionContext:](self, "_connectUISceneFromFBSScene:transitionContext:", v9, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v10 && (objc_msgSend(v10, "isUISubclass") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 4309, CFSTR("transitionContext is of an unexpected class : %@"), v10);

    }
    objc_msgSend(v9, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke;
    v26[3] = &unk_1E16C8478;
    v21 = &v27;
    v27 = v11;
    objc_msgSend(v20, "scene:didUpdateWithDiff:transitionContext:completion:", v9, 0, v10, v26);

    goto LABEL_10;
  }
  if (objc_msgSend((id)qword_1EDDC8098, "count") == 1)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke_2;
    v24[3] = &unk_1E16B1BF8;
    v21 = &v25;
    v25 = v11;
    -[UIApplication _handleDaemonApplicationActivationWithScene:completion:](self, "_handleDaemonApplicationActivationWithScene:completion:", v9, v24);
LABEL_10:

  }
  kdebug_trace();

}

- (BOOL)_hasCalledRunWithMainScene
{
  return byte_1EDDC7FF9;
}

- (id)_workspace
{
  return (id)qword_1EDDC80A8;
}

+ (BOOL)isRunningInStoreDemoMode
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (void)_startStatusBarServerIfNecessary
{
  if (objc_msgSend(a1, "runStatusBarServer"))
    +[UIStatusBarServer runServer](UIStatusBarServer, "runServer");
}

- (int64_t)_safeInterfaceOrientationForWindowIfExists:(id)a3
{
  return -[UIApplication _safeInterfaceOrientationForWindowIfExists:expectNonNilWindow:](self, "_safeInterfaceOrientationForWindowIfExists:expectNonNilWindow:", a3, 1);
}

- (BOOL)handleTestURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
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
  int64_t v26;
  id v27;
  id v28;
  UIApplication *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _pptLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Received PPT test URL: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("/")))
    {
      objc_msgSend(v7, "substringFromIndex:", 1);
      v8 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (uint64_t)v7;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v8;
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("testName"));
    objc_msgSend(v4, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(";"));
    v9 = objc_claimAutoreleasedReturnValue();

    v12 = -[NSObject count](v9, "count");
    if (v12)
    {
      v30 = self;
      v31 = v7;
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = v14;
        -[NSObject objectAtIndex:](v9, "objectAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("!!!"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count") == 2)
        {
          objc_msgSend(v14, "objectAtIndex:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByRemovingPercentEncoding");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndex:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByRemovingPercentEncoding");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v18, v20);

        }
        ++v13;
      }
      while (v12 != v13);

      v7 = v31;
      self = v30;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("SampleWithCHUD"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD819D2 = objc_msgSend(v21, "isEqualToString:", CFSTR("YES"));

    objc_msgSend(v10, "objectForKey:", CFSTR("CheckForLeaks"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD819D3 = objc_msgSend(v22, "isEqualToString:", CFSTR("YES"));

    objc_msgSend(v10, "objectForKey:", CFSTR("TargetsAuxiliaryDisplay"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD819D1 = objc_msgSend(v23, "isEqualToString:", CFSTR("YES"));

    objc_msgSend(v10, "objectForKey:", CFSTR("aggregate"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)qword_1ECD819F0;
    qword_1ECD819F0 = v24;

    v26 = -[UIApplication _testOrientation:options:](self, "_testOrientation:options:", v32, v10);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __53__UIApplication_UIApplicationTesting__handleTestURL___block_invoke;
    v33[3] = &unk_1E16B2B40;
    v33[4] = self;
    v34 = v32;
    v35 = v10;
    v27 = v10;
    v28 = v32;
    -[UIApplication rotateIfNeeded:completion:](self, "rotateIfNeeded:completion:", v26, v33);

  }
  else
  {
    _pptLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v4;
      _os_log_error_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Malformed test URL (no testName): %@", buf, 0xCu);
    }
  }

  return v7 != 0;
}

- (CGRect)statusBarFrame
{
  void *v2;
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
  CGRect result;

  _UIStatusBarManagerForNoWindow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_registerEstimatedTouches:(id)a3 event:(id)a4 forTouchable:(id)a5
{
  -[UIEventEnvironment _registerEstimatedTouches:event:forTouchable:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3, a4, (uint64_t)a5);
}

- (BOOL)handleEvent:(__GSEvent *)a3 withNewEvent:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t Type;
  uint64_t GSEventRecord;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int SubType;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  _QWORD block[5];

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (self)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__UIApplication__internalHandlePressesEvent___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      if (qword_1EDDC82F0 != -1)
        dispatch_once(&qword_1EDDC82F0, block);
      v8 = -[UIApplication _handlePressesEvent:](self, "_handlePressesEvent:", v7);
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  if (!objc_msgSend(v6, "_gsEvent"))
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  Type = GSEventGetType();
  GSEventRecord = _GSEventGetGSEventRecord();
  if ((*(_QWORD *)&self->_applicationFlags & 0x80000000) == 0 && (_DWORD)Type != 2000)
  {
    NSLog(CFSTR("kGSEventApplicationLaunch not yet received: ignoring event of type: %i"), Type);
    goto LABEL_13;
  }
  if ((int)Type <= 1099)
  {
    if ((int)Type <= 22)
    {
      if ((Type - 10) < 2 || (_DWORD)Type == 12 || (_DWORD)Type == 14)
        -[UIApplication handleKeyEvent:](self, "handleKeyEvent:", a3);
      goto LABEL_9;
    }
    if ((int)Type > 59)
    {
      if ((_DWORD)Type == 60)
      {
        if ((*((_QWORD *)&self->_applicationFlags + 1) & 8) == 0)
        {
          CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "synchronize");

        }
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "_initWithUTF8String:maxLength:", GSEventRecord + 88, *(unsigned int *)(GSEventRecord + 72));
        -[UIApplication _handleUserDefaultsDidChange:](self, "_handleUserDefaultsDidChange:", v34);

      }
      else
      {
        if ((_DWORD)Type != 1014)
          goto LABEL_9;
        objc_msgSend((id)UIApp, "lockDevice:", a3);
      }
    }
    else
    {
      if ((_DWORD)Type == 23)
      {
        GSEventAccelerometerAxisX();
        v23 = v22;
        GSEventAccelerometerAxisY();
        v25 = v24;
        GSEventAccelerometerAxisZ();
        v27 = v26;
        +[UIAccelerometer sharedAccelerometer](UIAccelerometer, "sharedAccelerometer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        GSEventGetTimestamp();
        objc_msgSend(v28, "_acceleratedInX:y:z:timestamp:", v23, v25, v27, v29);

        *(float *)&v30 = v23;
        *(float *)&v31 = v25;
        *(float *)&v32 = v27;
        objc_msgSend((id)UIApp, "acceleratedInX:Y:Z:", v30, v31, v32);
        goto LABEL_9;
      }
      if ((_DWORD)Type != 50)
      {
LABEL_9:
        v8 = 1;
        goto LABEL_14;
      }
      -[UIApplication _handleDeviceOrientationChangedEvent:](self, "_handleDeviceOrientationChangedEvent:", a3);
    }
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  v8 = 0;
  switch((int)Type)
  {
    case 2004:
      BSSetMainThreadPriorityFixedForUI();
      *(_QWORD *)&self->_applicationFlags &= ~0x100000000uLL;
      -[UIApplication applicationDidEndResumeAnimation](self, "applicationDidEndResumeAnimation");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("UIApplicationDidEndResumeAnimationNotification"), self, 0);

      -[UIApplication _updateOrientation](self, "_updateOrientation");
      goto LABEL_13;
    case 2005:
      byte_1EDDC7FF4 = 0;
      -[UIApplication _updateHangTracer](self, "_updateHangTracer");
      BSSetMainThreadPriorityFixedForUI();
      *(_QWORD *)&self->_applicationFlags |= 0x100000000uLL;
      -[UIApplication applicationDidBeginSuspendAnimation](self, "applicationDidBeginSuspendAnimation");
      v14 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", GSEventGetSubType());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dictionaryWithObject:forKey:", v15, CFSTR("Reason"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("UIApplicationWillBeginSuspendAnimationNotification"), self, v16);

      goto LABEL_13;
    case 2006:
    case 2007:
    case 2008:
    case 2009:
    case 2011:
    case 2012:
    case 2013:
      goto LABEL_9;
    case 2010:
      break;
    case 2014:
      SubType = GSEventGetSubType();
      if (SubType >= 4)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Received a resign active event with reason %d, which is not supported"), GSEventGetSubType());
        v19 = 0xFFFFFFFFLL;
      }
      else
      {
        v19 = dword_1866826E0[SubType];
      }
      -[UIApplication _deactivateForReason:](self, "_deactivateForReason:", v19);
      goto LABEL_13;
    case 2015:
      v20 = GSEventGetSubType();
      if (v20 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Received a resume active event with reason %d, which is not supported"), GSEventGetSubType());
        v21 = 0xFFFFFFFFLL;
      }
      else
      {
        v21 = dword_1866826E0[v20];
      }
      -[UIApplication _stopDeactivatingForReason:](self, "_stopDeactivatingForReason:", v21);
      goto LABEL_13;
    default:
      if ((_DWORD)Type == 1100)
      {
        objc_msgSend((id)UIApp, "vibrateForDuration:", MEMORY[0x58]);
      }
      else if ((_DWORD)Type == 1103)
      {
        LODWORD(v11) = MEMORY[0x58];
        objc_msgSend((id)UIApp, "setBacklightLevel:", v11);
      }
      goto LABEL_9;
  }
LABEL_14:

  return v8;
}

- (void)_compellApplicationLaunchToCompleteUnconditionally
{
  id v2;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeApplicationLaunchWithFBSScene:transitionContext:", 0, 0);

}

uint64_t __49__UIApplication__setIdleTimerDisabled_forReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleTimerDisabled:", *(unsigned __int8 *)(a1 + 32));
}

- (double)windowRotationDuration
{
  void *v2;
  uint64_t v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return dbl_1866826D0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
}

uint64_t __60__UIApplication__setAmbiguousControlCenterActivationMargin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setControlCenterAmbiguousActivationMargin:", *(double *)(a1 + 32));
}

- (BOOL)_disableBecomeFirstResponder
{
  return *((unsigned __int8 *)&self->_applicationFlags + 13) >> 7;
}

uint64_t __86__UIApplication_SessionAndConfigurationInternal___openSessionForPersistentIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  *a3 = v6;
  return v6;
}

- (BOOL)launchedToTest
{
  return __IsRunningTests;
}

- (unint64_t)_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(a4, a3);
}

- (void)setIdleTimerDisabled:(BOOL)idleTimerDisabled
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!idleTimerDisabled)
    v3 = 0;
  *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFEFFFFFFFFFLL | v3;
  -[UIApplication _setIdleTimerDisabled:forReason:](self, "_setIdleTimerDisabled:forReason:");
}

- (void)_runWithMainScene:(id)a3 transitionContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  unint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  unint64_t v43;
  NSObject *v44;
  void *v45;
  unint64_t applicationFlags;
  uint64_t v47;
  void *v48;
  int64_t v49;
  dispatch_time_t v50;
  void *v51;
  uint64_t v52;
  int v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD block[5];
  _QWORD v61[4];
  id v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  int out_token;
  uint64_t state64;
  _BYTE v70[128];
  __CFString *v71;
  void *v72;
  uint8_t buf[4];
  const __CFString *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  kdebug_trace();
  objc_msgSend(v7, "uiSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uiClientSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "statusBarHidden");
  v12 = objc_msgSend(v10, "statusBarStyle");
  v13 = objc_msgSend(v10, "interfaceOrientation");
  v52 = objc_msgSend(v9, "deviceOrientation");
  if (v9)
    v53 = objc_msgSend(v9, "isForeground") ^ 1;
  else
    LOBYTE(v53) = 0;
  v54 = v13;
  v55 = v10;
  if (qword_1EDDC80D0 != -1)
    dispatch_once(&qword_1EDDC80D0, &__block_literal_global_902);
  v14 = byte_1EDDC7FFB;
  state64 = 0;
  kdebug_trace();
  -[UIApplication _reloadKeyboardArbiterState](self, "_reloadKeyboardArbiterState");
  kdebug_trace();
  v58 = v9;
  if (!v14)
  {
    if (qword_1EDDC80E0 != -1)
      dispatch_once(&qword_1EDDC80E0, &__block_literal_global_911);
    if (byte_1EDDC7FFC)
    {
      +[_UIViewServiceSessionManager startViewServiceSessionManagerAsPlugin:](_UIViewServiceSessionManager, "startViewServiceSessionManagerAsPlugin:", 0);
      _UIMainBundleIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _UIViewServiceConnectionNotificationName(v15, v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v17, "UTF8String");

      out_token = 0;
      notify_register_check(v18, &out_token);
      notify_get_state(out_token, &state64);
      notify_cancel(out_token);
      v19 = qword_1EDDC81F0;
      if (!qword_1EDDC81F0)
      {
        v19 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1EDDC81F0);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (state64)
          v21 = CFSTR("YES");
        else
          v21 = CFSTR("NO");
        *(_DWORD *)buf = 138543362;
        v74 = v21;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Launching as view service: %{public}@", buf, 0xCu);
      }
      v9 = v58;
    }
  }
  BSSetMainThreadPriorityFixedForUI();
  if (v9)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setUserInterfaceStyleIfNecessary:firstTimeOnly:", objc_msgSend(v9, "userInterfaceStyle"), 1);

  }
  v23 = -[_UIApplicationInfoParser interfaceOrientation](self->_appInfo, "interfaceOrientation");
  if (v7)
  {
    objc_msgSend(v7, "settings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "interfaceOrientation");

  }
  else if (v23 <= 1)
  {
    v25 = 1;
  }
  else
  {
    v25 = v23;
  }
  if ((unint64_t)(v25 - 1) >= 4)
    v26 = 1;
  else
    v26 = v25;
  if (!v9 || (objc_msgSend(v9, "statusBarDisabled") & 1) == 0)
    -[UIApplication _setupStatusBarWithRequestedStyle:orientation:hidden:](self, "_setupStatusBarWithRequestedStyle:orientation:hidden:", v12, v26, v11);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_setInterfaceOrientation:", v26);

  -[UIApplication setReceivesMemoryWarnings:](self, "setReceivesMemoryWarnings:", 1);
  +[UIResponder _startDeferredTrackingObjectsWithIdentifiers](UIResponder, "_startDeferredTrackingObjectsWithIdentifiers");
  if (!-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle"))
    -[UIApplication _loadMainInterfaceFile](self, "_loadMainInterfaceFile");
  if ((_UIIsPrivateMainBundle() & 1) == 0)
    -[UIApplication _checkBackgroundRefreshAPIAdoption](self, "_checkBackgroundRefreshAPIAdoption");
  if (-[UIApplication _isSpringBoardShowingAnAlert](self, "_isSpringBoardShowingAnAlert"))
    -[UIApplication _deactivateForReason:notify:](self, "_deactivateForReason:notify:", 13, 0);
  objc_msgSend(v8, "actions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v7;
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payload");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v8;
  objc_msgSend(v8, "originatingProcess");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:](self, "_callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:", v28, v29, v30, v31);

  +[UIResponder _cleanupAllStateRestorationTables](UIResponder, "_cleanupAllStateRestorationTables");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = CFSTR("_UIWindowContentWillRotateOrientationUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "postNotificationName:object:userInfo:", 0x1E1764C40, v33, v35);

  -[UIApplication _stopDeactivatingForReason:](self, "_stopDeactivatingForReason:", 10);
  if (!-[UIApplication isSuspended](self, "isSuspended"))
  {
    v67 = 0u;
    v65 = 0u;
    v66 = 0u;
    v64 = 0u;
    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v65 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v41, "_delegateViewController");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {

          }
          else if ((objc_msgSend(v41, "_isTextEffectsWindow") & 1) == 0)
          {
            if (!dyld_program_sdk_at_least()
              || -[UIApplication _isSpringBoard](self, "_isSpringBoard")
              || (objc_msgSend((id)objc_opt_class(), "registerAsSystemApp") & 1) != 0)
            {
              v43 = qword_1EDDC81F8;
              if (!qword_1EDDC81F8)
              {
                v43 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v43, (unint64_t *)&qword_1EDDC81F8);
              }
              v44 = *(NSObject **)(v43 + 8);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_ERROR, "Application windows are expected to have a root view controller at the end of application launch", buf, 2u);
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 4893, CFSTR("Application windows are expected to have a root view controller at the end of application launch"));

            }
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v38);
    }

  }
  -[UIApplication _fixupBackgroundHitTestWindow](self, "_fixupBackgroundHitTestWindow");
  applicationFlags = (unint64_t)self->_applicationFlags;
  if (!((applicationFlags >> 19) & 1 | v53 & 1))
  {
    v47 = *((_QWORD *)&self->_applicationFlags + 1);
    *(_QWORD *)&self->_applicationFlags = applicationFlags | 0x80000;
    *((_QWORD *)&self->_applicationFlags + 1) = v47;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v54;
  if (-[UIApplication isFrontBoard](self, "isFrontBoard"))
  {
    objc_msgSend(v48, "setOrientation:animated:", -[UIApplication activeInterfaceOrientation](self, "activeInterfaceOrientation"), 0);
  }
  else
  {
    if ((unint64_t)(v54 - 1) < 4
      || (v49 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:](UIDevice, "currentDeviceOrientationAllowingAmbiguous:", 1), (unint64_t)(v49 - 1) <= 3))
    {
      if ((objc_msgSend(v48, "isGeneratingDeviceOrientationNotifications") & 1) == 0)
        *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFF1FFFFLL | (v49 << 17);
      objc_msgSend(v48, "setOrientation:animated:", v49, 0);
    }
    if (v52 && v52 != v49)
    {
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke;
      v61[3] = &unk_1E16B1888;
      v62 = v48;
      v63 = v52;
      -[UIApplication _performBlockAfterCATransactionCommits:](self, "_performBlockAfterCATransactionCommits:", v61);

    }
  }
  if (_MergedGlobals_149)
  {
    v50 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke_2;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_after(v50, MEMORY[0x1E0C80D38], block);
  }
  if (UIDebuggingOverlayIsEnabled())
    +[UIDebuggingInformationOverlay prepareDebuggingOverlay](UIDebuggingInformationOverlay, "prepareDebuggingOverlay");
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "noteApplicationLaunchCompleted");

  kdebug_trace();
}

- (BOOL)_viewServiceIgnoresSceneForLegacyInterfaceOrientation:(id)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;

  if (qword_1EDDC80E0 != -1)
    dispatch_once(&qword_1EDDC80E0, &__block_literal_global_911);
  v5 = 0;
  if (a3 && byte_1EDDC7FFC)
  {
    -[UIApplication _defaultSceneIfExists](self, "_defaultSceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_hostsWindows"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    if (v9)
      v10 = v9 == a3;
    else
      v10 = 0;
    if (v10)
    {
      if (qword_1EDDC8430 != -1)
      {
        v12 = v9;
        dispatch_once(&qword_1EDDC8430, &__block_literal_global_3028);
        v9 = v12;
      }
      v5 = byte_1EDDC8025 != 0;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)_statusBarOrientationFollowsWindow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  if (objc_msgSend(v3, "_windowControlsStatusBarOrientation"))
  {
    objc_msgSend(v3, "_windowHostingScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && !objc_msgSend(v4, "_affectsScreenOrientation"))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "_screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 == v7;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_fakingRequiresHighResolution
{
  _UIApplicationInfoParser *appInfo;

  appInfo = self->_appInfo;
  return !appInfo || -[_UIApplicationInfoParser fakingRequiresHighResolution](appInfo, "fakingRequiresHighResolution");
}

- (void)_setExpectedViewOrientation:(int64_t)a3
{
  self->__expectedViewOrientation = a3;
}

- (int64_t)_statusBarOrientationForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "windowScene");
  else
    -[UIApplication _findUISceneForLegacyInterfaceOrientation](self, "_findUISceneForLegacyInterfaceOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "_screen"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_isEmbeddedScreen"),
        v8,
        v9))
  {
    v10 = objc_msgSend(v7, "_interfaceOrientation");
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[5];

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIApplication_setReceivesMemoryWarnings___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1EDDC82B0 != -1)
    dispatch_once(&qword_1EDDC82B0, block);
  if (((((*(_QWORD *)&self->_applicationFlags & 0x20000000) == 0) ^ v3) & 1) == 0)
  {
    v5 = *((_QWORD *)&self->_applicationFlags + 1);
    v6 = 0x20000000;
    if (!v3)
      v6 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFFFDFFFFFFFLL | v6;
    *((_QWORD *)&self->_applicationFlags + 1) = v5;
    if (v3)
      dispatch_resume((dispatch_object_t)qword_1EDDC82A8);
    else
      dispatch_suspend((dispatch_object_t)qword_1EDDC82A8);
  }
}

- (void)_setupStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a5;
  v8 = -[UIApplication _isStatusBarHiddenForOrientation:](self, "_isStatusBarHiddenForOrientation:", a4);
  v9 = 0x800000;
  if (!v8 && !v5)
    v9 = 0;
  *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFFFFF7FFFFFLL | v9;
  if (-[UIApplication _shouldCreateStatusBarAtLaunch](self, "_shouldCreateStatusBarAtLaunch"))
    -[UIApplication _createStatusBarIfNeededWithOrientation:forWindowScene:](self, "_createStatusBarIfNeededWithOrientation:forWindowScene:", a4, 0);
}

- (BOOL)_isStatusBarHiddenForOrientation:(int64_t)a3
{
  _BOOL4 v4;

  if (-[UIApplication _isStatusBarForcedHiddenForOrientation:](self, "_isStatusBarForcedHiddenForOrientation:", a3))
    LOBYTE(v4) = 1;
  else
    return *((unsigned __int8 *)&self->_applicationFlags + 2) >> 7;
  return v4;
}

- (BOOL)_isStatusBarForcedHiddenForOrientation:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[UIApplication _wantsCompactStatusBarHiding](self, "_wantsCompactStatusBarHiding");
  if (v5)
    LOBYTE(v5) = -[UIApplication _isOrientationVerticallyCompact:](self, "_isOrientationVerticallyCompact:", a3);
  return v5;
}

- (BOOL)_isOrientationVerticallyCompact:(int64_t)a3
{
  void *v4;
  void *v5;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_defaultTraitCollectionForInterfaceOrientation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "verticalSizeClass") == 1;
  return (char)v4;
}

- (BOOL)_shouldCreateStatusBarAtLaunch
{
  return (dyld_program_sdk_at_least() & 1) == 0 && NSClassFromString(CFSTR("FPRSessionManager")) != 0;
}

- (void)_checkBackgroundRefreshAPIAdoption
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIBackgroundModes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "containsObject:", CFSTR("fetch")) & 1) == 0
    && (objc_msgSend(v3, "containsObject:", CFSTR("opportunistic-fetch")) & 1) == 0)
  {
    NSLog(&CFSTR("You've implemented -[<UIApplicationDelegate> application:performFetchWithCompletionHandler:], but you still n"
                 "eed to add \"fetch\" to the list of your supported UIBackgroundModes in your Info.plist.").isa);
  }
  if (_UIDeviceNativeUserInterfaceIdiom() != 4
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "containsObject:", CFSTR("remote-notification")) & 1) == 0
    && (objc_msgSend(v3, "containsObject:", CFSTR("remote-notification-initiated-fetch")) & 1) == 0)
  {
    NSLog(&CFSTR("You've implemented -[<UIApplicationDelegate> application:didReceiveRemoteNotification:fetchCompletionHandler:"
                 "], but you still need to add \"remote-notification\" to the list of your supported UIBackgroundModes in"
                 " your Info.plist.").isa);
  }

}

- (int64_t)_expectedViewOrientation
{
  return self->__expectedViewOrientation;
}

- (BOOL)_shouldOptOutOfRTL
{
  return self->optOutOfRTL;
}

+ (id)_stringForBackgroundStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_1E16DDF20[a3];
}

void __43__UIApplication__beginFenceTaskIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UIApplication.m"), 2416, CFSTR("Call must be made on main thread"));

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  *(_QWORD *)(v2 + 312) = 0;

}

uint64_t __97__UIApplication_UIApplicationTesting__finishedTest_waitForCommit_extraResults_withTeardownBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:waitForNotification:withTeardownBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

- (void)_initiateLaunchActionsBackgrounded:(BOOL)a3 firstActivation:(BOOL)a4
{
  _BOOL4 v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  unint64_t v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = CFSTR("launch");
    if (a3)
      v6 = CFSTR("launch suspended");
    v7 = v6;
  }
  else
  {
    v7 = CFSTR("resume");
  }
  v8 = (void *)qword_1EDDC8030;
  qword_1EDDC8030 = (uint64_t)v7;

  if (__IsRunningTests)
    objc_msgSend((id)UIApp, "startedTest:", qword_1EDDC8030);
  __wasResumed = !a4;
  if (!a4)
  {
    getpid();
    v9 = memorystatus_control();
    v10 = qword_1EDDC82E8;
    if (!qword_1EDDC82E8)
    {
      v10 = __UILogCategoryGetNode("AppLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1EDDC82E8);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_signpost_enabled(v11))
    {
      v12[0] = 67240448;
      v12[1] = v9;
      v13 = 1026;
      v14 = !v5;
      _os_signpost_emit_with_name_impl(&dword_185066000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppResume", " enableTelemetry=YES WasFrozen=%{signpost.telemetry:number1,public,name=WasFrozen}i IsForeground=%{signpost.telemetry:number2,public,name=IsForeground}i", (uint8_t *)v12, 0xEu);
    }
  }
}

- (void)_reportMainSceneUpdateFinished:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIStatusBar forceUpdateDoubleHeightStatus](self->_statusBar, "forceUpdateDoubleHeightStatus");
  -[UIApplication _reportMainSceneUpdateFinishedPossiblyDeferredPortions](self, "_reportMainSceneUpdateFinishedPossiblyDeferredPortions");
  v4 = v5;
  if (v5)
  {
    objc_msgSend((id)qword_1EDDC80B0, "enqueuePostSynchronizeResponse:", v5);
    v4 = v5;
  }

}

- (void)stopAndReportResultsForTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  __CFString *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  int size_in_use;
  double v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  unsigned int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int32x4_t *v68;
  __int128 v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  int v92;
  int v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  id v100;
  pid_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  FILE *v110;
  size_t v111;
  size_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int size_allocated_high;
  int size_allocated;
  int max_size_in_use_high;
  int max_size_in_use;
  int size_in_use_high;
  int v129;
  int v130;
  _BOOL4 v131;
  signed int v132;
  int v133;
  int v134;
  uint64_t blocks_in_use;
  int v136;
  uint64_t v137;
  int v138;
  __CFString *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void (**v146)(void);
  _QWORD v148[5];
  id v149;
  malloc_statistics_t *p_stats;
  _QWORD v151[4];
  id v152;
  _OWORD v153[5];
  uint64_t v154;
  int v155;
  uint64_t __buf;
  malloc_statistics_t stats;
  _BYTE v158[20];
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167[2];
  char __str[80];
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v144 = a5;
  v146 = (void (**)(void))a6;
  v143 = v10;
  if (v10)
    v11 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;
  objc_msgSend((id)qword_1ECD819D8, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("pptTestTracepointIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongValue");

    if (!v16)
      v16 = objc_msgSend(v9, "hash");
    v17 = -[UIApplication isLaunchTest:](self, "isLaunchTest:", v9);
    objc_msgSend(v9, "rangeOfString:", CFSTR("resume"));
    if (v18)
      v19 = 1;
    else
      v19 = v17;
    v134 = v19;
    objc_msgSend(v9, "rangeOfString:", CFSTR("quit"));
    v137 = v20;
    -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = v17;
    else
      v22 = 0;

    if (objc_msgSend((id)qword_1ECD819E0, "containsObject:", v9))
    {
      -[UIApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:", CFSTR("duration"), v9);
      objc_msgSend((id)qword_1ECD819E0, "removeObject:", v9);
    }
    -[UIApplication emitPPTEndTracePointForTestName:identifier:](self, "emitPPTEndTracePointForTestName:identifier:", v9, v16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v23, CFSTR("pptTestTracepointIdentifier"));

    v24 = CFSTR("endTimeIntervalSinceReferenceDate");
    if (v17)
      v24 = CFSTR("launchTimeIntervalSinceReferenceDate");
    v139 = v24;
    objc_msgSend(v14, "objectForKey:");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("startTimeIntervalSinceReferenceDate"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("extendedLaunchTimeIntervalSinceReferenceDate"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "doubleValue");
    v26 = v25;
    objc_msgSend(v142, "doubleValue");
    if (v27 == 0.0)
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    else
      objc_msgSend(v142, "doubleValue");
    v30 = v28;
    objc_msgSend(v140, "doubleValue");
    v32 = v31;
    objc_msgSend(v14, "objectForKey:", CFSTR("execOrResumeTimeIntervalSinceReferenceDate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v33;
    if (v33)
    {
      objc_msgSend(v33, "doubleValue");
      v35 = v34;
    }
    else
    {
      v35 = 0.0;
    }
    memset(&stats, 0, sizeof(stats));
    malloc_zone_statistics(0, &stats);
    blocks_in_use = (int)stats.blocks_in_use;
    size_in_use = stats.size_in_use;
    if (byte_1ECD819D2)
      -[UIApplication stopCHUDRecording](self, "stopCHUDRecording");
    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("testName"));
    v37 = v30 - v26;
    _pptLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      stats.blocks_in_use = 138413058;
      *(_QWORD *)(&stats.blocks_in_use + 1) = v9;
      WORD2(stats.size_in_use) = 2048;
      *(double *)((char *)&stats.size_in_use + 6) = v26;
      HIWORD(stats.max_size_in_use) = 2048;
      *(double *)&stats.size_allocated = v30;
      *(_WORD *)v158 = 2048;
      *(double *)&v158[2] = v30 - v26;
      _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_DEFAULT, "PPT finishedTest: %@ (start: %f, end: %f, delta: %f)", (uint8_t *)&stats, 0x2Au);
    }

    if (v37 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v39, CFSTR("failed"));

      -[UIApplication _reportResults:](self, "_reportResults:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v40, CFSTR("pid"));

      objc_msgSend(v12, "objectForKey:", CFSTR("time"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 - v26);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v43, CFSTR("time"));

      }
      if (v22)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("extendedLaunchTime"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44 == 0;

        v46 = v32 - v26;
        if (v45)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v47, CFSTR("extendedLaunchTime"));

        }
        -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49 == 0;

        if (v50)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46 - v37);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v51, v52);

        }
      }
      if (v145)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 - v35);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v53, CFSTR("execOrResumeTime"));

      }
      if (qword_1ECD819F0)
      {
        objc_msgSend(v12, "setObject:forKey:", qword_1ECD819F0, CFSTR("aggregate"));
        v54 = (void *)qword_1ECD819F0;
        qword_1ECD819F0 = 0;

      }
      v131 = v137 != 0;
      objc_msgSend(v14, "objectForKey:", CFSTR("heapBytes"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "intValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", size_in_use - v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v57, CFSTR("heapBytesDelta"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("bytes"), CFSTR("heapBytesDeltaUnits"));
      objc_msgSend(v14, "objectForKey:", CFSTR("heapNodes"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "intValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", blocks_in_use - v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v60, CFSTR("heapNodesDelta"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("nodes"), CFSTR("heapNodesDeltaUnits"));
      v61 = CAGetCurrentImageBytes();
      objc_msgSend(v14, "objectForKey:", CFSTR("imageBytes"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "unsignedIntValue");

      v64 = CAGetMaximumImageBytes();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v61 - v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v65, CFSTR("imageBytesDelta"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("bytes"), CFSTR("imageBytesDeltaUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v66, CFSTR("maxImageBytes"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("bytes"), CFSTR("maxImageBytesUnits"));
      v154 = 0;
      memset(v153, 0, sizeof(v153));
      objc_msgSend(v14, "objectForKey:", CFSTR("startStats"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "getBytes:length:", v153, 88);

      if (v17)
        v68 = 0;
      else
        v68 = (int32x4_t *)v153;
      GetProcStatistics((uint64_t)&stats, v68);
      v132 = stats.blocks_in_use;
      v130 = *(&stats.blocks_in_use + 1);
      v129 = stats.size_in_use;
      size_in_use_high = HIDWORD(stats.size_in_use);
      max_size_in_use = stats.max_size_in_use;
      max_size_in_use_high = HIDWORD(stats.max_size_in_use);
      size_allocated = stats.size_allocated;
      size_allocated_high = HIDWORD(stats.size_allocated);
      v69 = *(_OWORD *)&v158[4];
      v70 = v159;
      v71 = v160;
      v72 = v161;
      v138 = v162;
      v73 = v163;
      v74 = v164;
      v133 = v165;
      v136 = v166;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)&v158[4]);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v75, CFSTR("virtualSize"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("bytes"), CFSTR("virtualSizeUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)&v69 + 1));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v76, CFSTR("maximumRSS"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("bytes"), CFSTR("maximumRSSUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v71 / 1000.0 + (double)(1000 * v70));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v77, CFSTR("userCpuSeconds"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("ms"), CFSTR("userCpuSecondsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v74 / 1000.0 + (double)(1000 * v73));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v78, CFSTR("userCpuSecondsMainThread"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("ms"), CFSTR("userCpuSecondsMainThreadUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v138 / 1000.0 + (double)(1000 * v72));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v79, CFSTR("systemCpuSeconds"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("ms"), CFSTR("systemCpuSecondsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v136 / 1000.0 + (double)(1000 * v133));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v80, CFSTR("systemCpuSecondsMainThread"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("ms"), CFSTR("systemCpuSecondsMainThreadUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v132);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v81, CFSTR("pageFaults"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("pages"), CFSTR("pageFaultsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v130);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v82, CFSTR("pageIns"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("pages"), CFSTR("pageInsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v129);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v83, CFSTR("cowFaults"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("pages"), CFSTR("cowFaultsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", size_in_use_high);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v84, CFSTR("machMessagesSent"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("messages"), CFSTR("machMessagesSentUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", max_size_in_use);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v85, CFSTR("machMessagesReceived"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("messages"), CFSTR("machMessagesReceivedUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", max_size_in_use_high);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v86, CFSTR("machSystemCalls"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("syscalls"), CFSTR("machSystemCallsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", size_allocated);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v87, CFSTR("bsdSystemCalls"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("syscalls"), CFSTR("bsdSystemCallsUnits"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", size_allocated_high);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v88, CFSTR("contextSwitches"));

      objc_msgSend(v12, "setObject:forKey:", CFSTR("csw"), CFSTR("contextSwitchesUnits"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("startStats"));
      if (((v134 | v131) & 1) == 0)
      {
        -[UIApplication _currentFrameCountForTestDisplay](self, "_currentFrameCountForTestDisplay");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "intValue");
        objc_msgSend(v14, "objectForKey:", CFSTR("startingFrameCount"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "intValue");

        if (v37 > 0.1)
        {
          v93 = v90 - v92;
          if (v90 - v92 >= 1)
          {
            v94 = (double)v93;
            v95 = (double)v93 / v37;
            *(float *)&v95 = v95;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v96, CFSTR("fps"));

            objc_msgSend(v12, "setObject:forKey:", CFSTR("fps"), CFSTR("fpsUnits"));
            v97 = v37 * 1000.0 / v94;
            *(float *)&v97 = v97;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v98, CFSTR("mspf"));

            objc_msgSend(v12, "setObject:forKey:", CFSTR("mspf"), CFSTR("mspfUnits"));
          }
        }
        objc_msgSend(v14, "objectForKey:", CFSTR("SubTests"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (v99)
        {
          v151[0] = MEMORY[0x1E0C809B0];
          v151[1] = 3221225472;
          v151[2] = __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke;
          v151[3] = &unk_1E16E4638;
          v152 = v12;
          objc_msgSend(v99, "enumerateKeysAndObjectsUsingBlock:", v151);

        }
      }
      if (byte_1ECD819D3)
      {
        v100 = v9;
        __buf = 0;
        v155 = 0;
        pipe(v167);
        v101 = fork();
        if (!v101)
        {
          v108 = getppid();
          close(v167[0]);
          objc_msgSend(MEMORY[0x1E0C99DF0], "data");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          snprintf(__str, 0x50uLL, "leaks %d 2>/dev/null", v108);
          v110 = popen(__str, "r");
          if (!v110)
          {
            write(v167[1], &__buf, 4uLL);
            write(v167[1], (char *)&__buf + 4, 4uLL);
            _exit(1);
          }
          v111 = fread(&stats, 1uLL, 0x200uLL, v110);
          if (v111)
          {
            v112 = v111;
            do
            {
              objc_msgSend(v109, "appendBytes:length:", &stats, v112);
              v112 = fread(&stats, 1uLL, 0x200uLL, v110);
            }
            while (v112);
          }
          pclose(v110);
          v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v109, 1);
          objc_msgSend(v113, "componentsSeparatedByString:", CFSTR("\n"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v114;
          if (v114 && objc_msgSend(v114, "count") && (objc_msgSend(v115, "count") & 0xFFFFFFFELL) != 0)
          {
            objc_msgSend(v115, "objectAtIndex:", 1);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "componentsSeparatedByString:", CFSTR(" "));
            v120 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v120, "objectAtIndex:", 2);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(__buf) = objc_msgSend(v121, "intValue");

            objc_msgSend(v120, "objectAtIndex:", 5);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            HIDWORD(__buf) = objc_msgSend(v122, "intValue");

          }
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "executablePath");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "lastPathComponent");
          v118 = objc_claimAutoreleasedReturnValue();

          if ((_DWORD)__buf)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/%@.%d.%@leaks.txt"), v118, v108, v100);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v113, "writeToFile:atomically:encoding:error:", v123, 1, 4, 0))
              NSLog(CFSTR("Leaks data writen to %@.\n"), v123);
            else
              NSLog(CFSTR("Couldn't write leaks data to %@.\n"), v123);

          }
          else
          {
            NSLog(CFSTR("No leaks found for %@.\n"), v118);
          }
          write(v167[1], &__buf, 4uLL);
          write(v167[1], (char *)&__buf + 4, 4uLL);
          _exit(0);
        }
        close(v167[1]);
        read(v167[0], &__buf, 4uLL);
        read(v167[0], (char *)&__buf + 4, 4uLL);
        close(v167[0]);
        waitpid(v101, &v155, 0);

        v102 = HIDWORD(__buf);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", __buf);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v103, CFSTR("totalLeaks"));

        objc_msgSend(v12, "setObject:forKey:", CFSTR("nodes"), CFSTR("totalLeaksUnits"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v104, CFSTR("totalLeakedBytes"));

        objc_msgSend(v12, "setObject:forKey:", CFSTR("bytes"), CFSTR("totalLeakedBytesUnits"));
      }
      if (v9)
        objc_msgSend((id)qword_1ECD819D8, "removeObjectForKey:", v9);
      if (v146)
        v146[2]();
      if (qword_1ECD819E8 || objc_msgSend(v9, "isEqualToString:", CFSTR("launch suspended")))
      {
        -[UIApplication _reportResults:](self, "_reportResults:", v12);
      }
      else if (v144)
      {
        *(_QWORD *)&stats.blocks_in_use = 0;
        stats.size_in_use = (size_t)&stats;
        stats.max_size_in_use = 0x3032000000;
        stats.size_allocated = (size_t)__Block_byref_object_copy__195;
        *(_QWORD *)v158 = __Block_byref_object_dispose__195;
        *(_QWORD *)&v158[8] = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke_275;
        v148[3] = &unk_1E16E4660;
        v148[4] = self;
        v149 = v12;
        p_stats = &stats;
        objc_msgSend(v105, "addObserverForName:object:queue:usingBlock:", v144, 0, 0, v148);
        v106 = objc_claimAutoreleasedReturnValue();
        v107 = *(void **)(stats.size_in_use + 40);
        *(_QWORD *)(stats.size_in_use + 40) = v106;

        _Block_object_dispose(&stats, 8);
      }
      else
      {
        -[UIApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reportResults_, v12, 0.0);
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v29, CFSTR("failed"));

    -[UIApplication _reportResults:](self, "_reportResults:", v12);
  }

}

- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  double v20;
  unint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  const char *v39;
  double v40;
  unint64_t v41;
  void *v42;
  void *v43;
  unint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[UIApplication isLaunchTest:](self, "isLaunchTest:", v10);
  -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v15)
    {
      __extendedLaunchTestIsMarkedAsFinished = 1;
      if (!__basicLaunchTestIsMarkedAsFinished)
        goto LABEL_33;
    }
  }
  if (__IsRunningTests
    || (*((_BYTE *)&self->_applicationFlags + 4) & 2) == 0
    && (-[UIApplication _extendLaunchTest](self, "_extendLaunchTest"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        !v19))
  {
LABEL_5:
    if ((*((_BYTE *)&self->_applicationFlags + 4) & 2) != 0
      || (-[UIApplication _extendLaunchTest](self, "_extendLaunchTest"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      if (*(double *)&__ExecOrResumeTime == 0.0)
      {
        if (!os_variant_has_internal_content())
          goto LABEL_23;
        v44 = qword_1ECD81A50;
        if (!qword_1ECD81A50)
        {
          v44 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v44, (unint64_t *)&qword_1ECD81A50);
        }
        v38 = *(NSObject **)(v44 + 8);
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v39 = "Unable to track resume time or/and signal end of extended launch as __ExecOrResumeTime is 0";
      }
      else
      {
        if (__wasResumed)
        {
          v17 = qword_1ECD81A40;
          if (!qword_1ECD81A40)
          {
            v17 = __UILogCategoryGetNode("AppLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v17, (unint64_t *)&qword_1ECD81A40);
          }
          v18 = *(NSObject **)(v17 + 8);
          if (os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_185066000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AppResume", " enableTelemetry=YES ", buf, 2u);
          }
          goto LABEL_23;
        }
        if (v10 && -[UIApplication isRunningTest](self, "isRunningTest", *(double *)&__ExecOrResumeTime))
          v30 = objc_msgSend(v10, "isEqualToString:", CFSTR("launch"));
        else
          v30 = 1;
        if (*(double *)&__LaunchTime != 0.0)
        {
          if (v30)
          {
            -[UIApplication _extendLaunchTest](self, "_extendLaunchTest", *(double *)&__LaunchTime);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("extended-launch-responsive"), v10);
              v49 = v10;
              alm_app_extended_launch_end_with_details();

            }
            alm_legacy_app_regular_or_extended_launch_end();
          }
          goto LABEL_23;
        }
        if (!v30 || !os_variant_has_internal_content())
          goto LABEL_23;
        v37 = qword_1ECD81A48;
        if (!qword_1ECD81A48)
        {
          v37 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v37, (unint64_t *)&qword_1ECD81A48);
        }
        v38 = *(NSObject **)(v37 + 8);
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v39 = "Unable to signal end of extended launch as __LaunchTime is 0";
      }
      _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    }
LABEL_23:
    if (v10 && -[UIApplication isRunningTest](self, "isRunningTest"))
    {
      if (v14)
      {
        -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v26 = v25;
          -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:", v27, v10);

          objc_msgSend((id)qword_1ECD819D8, "objectForKey:", v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("extendedLaunchTimeIntervalSinceReferenceDate"));

        }
        v45 = v10;
        v46 = v11;
        v47 = v12;
        v48 = v13;
        alm_execute_when_measurement_complete();

      }
      else
      {
        -[UIApplication stopAndReportResultsForTest:extraResults:waitForNotification:withTeardownBlock:](self, "stopAndReportResultsForTest:extraResults:waitForNotification:withTeardownBlock:", v10, v11, v12, v13);
      }
    }
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (*(double *)&__LaunchTime == 0.0)
  {
    if (os_variant_has_internal_content())
    {
      v21 = qword_1ECD81A30;
      if (!qword_1ECD81A30)
      {
        v21 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD81A30);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v23 = "Unable to track launch/resume time as __LaunchTime is 0";
LABEL_21:
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
        goto LABEL_33;
      }
    }
    goto LABEL_33;
  }
  v31 = v20 - *(double *)&__LaunchTime;
  if (__wasResumed)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("appResumeTime.%@"), v33);
LABEL_36:
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    ADClientPushValueForDistributionKey();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%3.1f"), v34, *(_QWORD *)&v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    ADClientAddValueForScalarKey();
    goto LABEL_5;
  }
  if (!objc_msgSend((id)UIApp, "applicationState"))
  {
    v42 = (void *)MEMORY[0x1E0CB3940];
    +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR("appLaunchTime.%@"), v33);
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (*(double *)&__ExecOrResumeTime != 0.0)
  {
    v31 = v40 - *(double *)&__ExecOrResumeTime;
    v43 = (void *)MEMORY[0x1E0CB3940];
    +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("appLaunchSuspendedTime.%@"), v33);
    goto LABEL_36;
  }
  if (os_variant_has_internal_content())
  {
    v41 = qword_1ECD81A38;
    if (!qword_1ECD81A38)
    {
      v41 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v41, (unint64_t *)&qword_1ECD81A38);
    }
    v22 = *(NSObject **)(v41 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Unable to track suspended time as __ExecOrResumeTime is 0";
      goto LABEL_21;
    }
  }
LABEL_33:

}

- (BOOL)isRunningTest
{
  return objc_msgSend((id)qword_1ECD819D8, "count") != 0;
}

- (id)_extendLaunchTest
{
  return 0;
}

- (void)startedTest:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t blocks_in_use;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  malloc_statistics_t buf;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _pptLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      buf.blocks_in_use = 138412290;
      *(_QWORD *)(&buf.blocks_in_use + 1) = v4;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "PPT startedTest: %@", (uint8_t *)&buf, 0xCu);
    }

    v6 = -[UIApplication isLaunchTest:](self, "isLaunchTest:", v4);
    objc_msgSend(v4, "rangeOfString:", CFSTR("resume"));
    v8 = v7 != 0;
    objc_msgSend(v4, "rangeOfString:", CFSTR("quit"));
    v10 = v9;
    if (!qword_1ECD819D8)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = (void *)qword_1ECD819D8;
      qword_1ECD819D8 = (uint64_t)v11;

    }
    if (byte_1ECD819D2)
      -[UIApplication startCHUDRecording:](self, "startCHUDRecording:", v4);
    objc_msgSend((id)qword_1ECD819D8, "objectForKey:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested to start an already started test: %@"), v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("UIApplicationTestStartIsStrict"));

      if (v16)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v14);
      else
        NSLog(CFSTR("%@"), v14);

    }
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)qword_1ECD819D8, "setObject:forKey:", v17, v4);
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)qword_1ECD819D8, "objectForKey:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("SubTests"));

    if (v6)
    {
      v8 = 1;
    }
    else
    {
      v40 = 0;
      v38 = 0u;
      v39 = 0u;
      v37 = 0u;
      memset(&buf, 0, sizeof(buf));
      GetProcStatistics((uint64_t)&buf, 0);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &buf, 88);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("startStats"));

    }
    memset(&buf, 0, sizeof(buf));
    malloc_zone_statistics(0, &buf);
    blocks_in_use = buf.blocks_in_use;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(buf.size_in_use));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("heapBytes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", blocks_in_use);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("heapNodes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CAGetCurrentImageBytes());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("imageBytes"));

    if (!v8 && !v10)
    {
      -[UIApplication _currentFrameCountForTestDisplay](self, "_currentFrameCountForTestDisplay");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v25, CFSTR("startingFrameCount"));

    }
    v26 = (void *)MEMORY[0x1E0CB37E8];
    if (v8)
      v27 = *(double *)&__LaunchTime;
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v26, "numberWithDouble:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v28, CFSTR("startTimeIntervalSinceReferenceDate"));

    if (v8)
    {
      v29 = __ExecOrResumeTime;
      if (*(double *)&__ExecOrResumeTime == 0.0)
        v29 = __LaunchTime;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v30, CFSTR("execOrResumeTimeIntervalSinceReferenceDate"));

    }
    else
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "objectForKey:", CFSTR("startTimeIntervalSinceReferenceDate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@:%@"), v4, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "hash");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v35, CFSTR("pptTestTracepointIdentifier"));

      -[UIApplication emitPPTStartTracePointForTestName:identifier:](self, "emitPPTStartTracePointForTestName:identifier:", v4, v34);
    }

  }
}

- (BOOL)isLaunchTest:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "rangeOfString:", CFSTR("widget-launch"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "rangeOfString:", CFSTR("launch"));
    v5 = v6 != 0;
  }

  return v5;
}

void __71__UIApplication__reportMainSceneUpdateFinishedPossiblyDeferredPortions__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_launchTestName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("launch-responsive"), v2);

}

- (void)_reportMainSceneUpdateFinishedPossiblyDeferredPortions
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  char *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;

  kdebug_trace();
  objc_msgSend((id)UIApp, "_currentTests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", qword_1EDDC8030);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = __wasResumed == 0;
  else
    v5 = 0;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("launchTimeIntervalSinceReferenceDate"));

  }
  -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = __wasResumed == 0;
  else
    v9 = 0;
  v10 = v9;

  if (!__wasResumed)
  {
    -[UIApplication _launchTestName](self, "_launchTestName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("launch-responsive"), v11);

    alm_app_did_present_with_metrics_payload();
  }
  v12 = getenv("ActivePrewarm");
  if (v12)
    v13 = *v12 == 49;
  else
    v13 = 0;
  getpid();
  memorystatus_control();
  if (v13)
    setenv("ActivePrewarm", "0", 1);
  alm_app_did_activate();
  if (!v10)
    goto LABEL_22;
  -[UIApplication _extendLaunchTest](self, "_extendLaunchTest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _launchTestName](self, "_launchTestName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", v14, v15);

  __basicLaunchTestIsMarkedAsFinished = 1;
  if (__extendedLaunchTestIsMarkedAsFinished)
LABEL_22:
    objc_msgSend((id)UIApp, "finishedTest:extraResults:", qword_1EDDC8030, 0);
  *(_QWORD *)(UIApp + 176) &= ~0x200000000uLL;
  _UIApplicationEndLaunchBackgroundTask();

}

- (id)_launchTestName
{
  if (__IsRunningTests)
    return (id)qword_1EDDC8030;
  else
    return CFSTR("launch");
}

- (void)startedSubTest:(id)a3 forTest:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:", CFSTR("time"), CFSTR("fps"), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", v8, v7, v9);

}

- (void)finishedSubTest:(id)a3 forTest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[UIApplication subTest:ForTest:withMetrics:](self, "subTest:ForTest:withMetrics:", v6, a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIApplication _currentFrameCountForTestDisplay](self, "_currentFrameCountForTestDisplay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopWithFrameCount:", v8);

      v12[0] = CFSTR("pptSubTestTracepointIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getObjectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedLongValue");

      -[UIApplication emitPPTEndTracePointForSubTestName:identifier:](self, "emitPPTEndTracePointForSubTestName:identifier:", v6, v11);
    }

  }
}

- (void)startedSubTest:(id)a3 forTest:(id)a4 withMetrics:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[UIApplication subTest:ForTest:withMetrics:](self, "subTest:ForTest:withMetrics:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[UIApplication _currentFrameCountForTestDisplay](self, "_currentFrameCountForTestDisplay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startWithFrameCount:", v11);

      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "startTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%@:%@"), v9, v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hash");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = CFSTR("pptSubTestTracepointIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v16, v17);

      objc_msgSend((id)qword_1ECD819D8, "objectForKey:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", CFSTR("pptTestTracepointIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedLongValue");

      if (!v20)
        v20 = objc_msgSend(v9, "hash");
      -[UIApplication emitPPTStartTracePointForSubTestName:identifier:testIdentifier:](self, "emitPPTStartTracePointForSubTestName:identifier:testIdentifier:", v8, v15, v20);
    }

  }
}

- (id)subTest:(id)a3 ForTest:(id)a4 withMetrics:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  UISubTest *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (a4)
  {
    objc_msgSend((id)qword_1ECD819D8, "objectForKey:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("SubTests"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (UISubTest *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v11 = -[UISubTest initWithName:metrics:]([UISubTest alloc], "initWithName:metrics:", v7, v8);
        objc_msgSend(v10, "setObject:forKey:", v11, v7);
      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    _pptLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_error_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Cannot get subtest for a nil testName. (subTestName: %@)", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (id)_currentFrameCountForTestDisplay
{
  void *v2;
  unint64_t v3;
  void *v4;
  unsigned int DirtyFrameCountByIndex;

  if (byte_1ECD819D1
    && (+[UIScreen _screens](),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3 >= 2))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    DirtyFrameCountByIndex = CARenderServerGetDirtyFrameCountByIndex();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    DirtyFrameCountByIndex = CARenderServerGetDirtyFrameCount();
  }
  objc_msgSend(v4, "numberWithUnsignedLong:", DirtyFrameCountByIndex);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentTests
{
  return (id)qword_1ECD819D8;
}

- (void)emitPPTEndTracePointForTestName:(id)a3 identifier:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id v9;
  size_t v10;
  char *Buffer;
  uint8_t v12[16];

  v5 = a3;
  _pptLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  _pptLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_END, v8, "MainTest", ", v12, 2u);
  }

  v9 = objc_retainAutorelease(v5);
  v10 = strlen((const char *)objc_msgSend(v9, "UTF8String"));
  Buffer = createBuffer(v9, 12 * ((v10 + 11) / 0xC));
  objc_msgSend(v9, "length");

  kdebug_trace();
  free(Buffer);
}

- (void)emitPPTEndTracePointForSubTestName:(id)a3 identifier:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  _pptLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  _pptLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v5, OS_SIGNPOST_INTERVAL_END, v7, "SubTest", ", v8, 2u);
  }

  kdebug_trace();
}

- (void)emitPPTStartTracePointForSubTestName:(id)a3 identifier:(unint64_t)a4 testIdentifier:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  char *Buffer;
  unint64_t v15;
  unint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _pptLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  _pptLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 138543362;
    v18 = v6;
    _os_signpost_emit_with_name_impl(&dword_185066000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SubTest", "%{public, name=subTestName}@  isAnimation=YES ", (uint8_t *)&v17, 0xCu);
  }

  v10 = objc_retainAutorelease(v6);
  v11 = strlen((const char *)objc_msgSend(v10, "UTF8String"));
  v12 = 3 * ((v11 + 11) / 0xC);
  v13 = 12 * ((v11 + 11) / 0xC);
  Buffer = createBuffer(v10, v13);
  objc_msgSend(v10, "length");
  kdebug_trace();
  if (v13 >= 4)
  {
    v15 = 0;
    v16 = v12 & 0x3FFFFFFFFFFFFFFFLL;
    do
    {
      kdebug_trace();
      v15 += 3;
    }
    while (v15 < v16);
  }
  else if (!Buffer)
  {
    goto LABEL_10;
  }
  free(Buffer);
LABEL_10:

}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  -[UIApplication finishedTest:extraResults:waitForNotification:withTeardownBlock:](self, "finishedTest:extraResults:waitForNotification:withTeardownBlock:", a3, a4, 0, 0);
}

- (NSSet)openSessions
{
  return (NSSet *)-[UIApplication _openSessionsIncludingInternal:](self, "_openSessionsIncludingInternal:", 0);
}

- (int64_t)_sceneInterfaceOrientationFromWindow:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 6812, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

  }
  objc_msgSend(v5, "_windowHostingScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "_interfaceOrientation");
  else
    v8 = -[UIApplication _defaultSceneInterfaceOrientationReturningUnknownForNilScene:](self, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 1);
  v9 = v8;

  return v9;
}

- (void)beginIgnoringInteractionEvents
{
  uint64_t applicationFlags;
  unsigned int v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  applicationFlags = (uint64_t)self->_applicationFlags;
  v3 = (applicationFlags >> 25) & 0xF;
  if (v3 == 15)
  {
    v4 = qword_1EDDC8040;
    if (!qword_1EDDC8040)
    {
      v4 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1EDDC8040);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[UIApplication beginIgnoringInteractionEvents]";
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%s overflow. Ignoring.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v7 = *((_QWORD *)&self->_applicationFlags + 1);
    *(_QWORD *)&self->_applicationFlags = applicationFlags & 0xFFFFFFFFE1FFFFFFLL | ((_DWORD)applicationFlags + 0x2000000) & 0x1E000000;
    *((_QWORD *)&self->_applicationFlags + 1) = v7;
    v8 = qword_1EDDC8038;
    if (!qword_1EDDC8038)
    {
      v8 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1EDDC8038);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_signpost_enabled(v9))
    {
      v12 = 67109120;
      LODWORD(v13) = v3;
      _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v3 + 49354, "IgnoringInteractionEvents", "level=%u", (uint8_t *)&v12, 8u);
    }
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("_UIApplicationDidBeginIgnoringInteractionEventsNotification"), self);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelAllKeyEvents");

    }
  }
}

- (void)setIgnoresInteractionEvents:(BOOL)a3
{
  if (a3)
    -[UIApplication beginIgnoringInteractionEvents](self, "beginIgnoringInteractionEvents");
  else
    -[UIApplication endIgnoringInteractionEvents](self, "endIgnoringInteractionEvents");
}

- (void)endIgnoringInteractionEvents
{
  uint64_t applicationFlags;
  uint64_t v3;
  unsigned int v4;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  applicationFlags = (uint64_t)self->_applicationFlags;
  if ((applicationFlags & 0x1E000000) != 0)
  {
    v3 = *((_QWORD *)&self->_applicationFlags + 1);
    v4 = ((applicationFlags >> 25) - 1) & 0xF;
    *(_QWORD *)&self->_applicationFlags = applicationFlags & 0xFFFFFFFFE1FFFFFFLL | (v4 << 25);
    *((_QWORD *)&self->_applicationFlags + 1) = v3;
    if ((((applicationFlags >> 25) - 1) & 0xF) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("_UIApplicationDidEndIgnoringInteractionEventsNotification"), self);

    }
    v7 = qword_1EDDC8048;
    if (!qword_1EDDC8048)
    {
      v7 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1EDDC8048);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_signpost_enabled(v8))
    {
      v11 = 67109120;
      LODWORD(v12) = v4;
      _os_signpost_emit_with_name_impl(&dword_185066000, v8, OS_SIGNPOST_INTERVAL_END, v4 + 49354, "IgnoringInteractionEvents", "level=%u", (uint8_t *)&v11, 8u);
    }
  }
  else
  {
    v9 = qword_1EDDC8050;
    if (!qword_1EDDC8050)
    {
      v9 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1EDDC8050);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[UIApplication endIgnoringInteractionEvents]";
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%s called without matching -beginIgnoringInteractionEvents. Ignoring.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_deactivateReachability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getSBSUIAppDeactivateReachabilitySymbolLoc_ptr;
  v9 = getSBSUIAppDeactivateReachabilitySymbolLoc_ptr;
  if (!getSBSUIAppDeactivateReachabilitySymbolLoc_ptr)
  {
    v3 = SpringBoardServicesLibrary_1();
    v2 = dlsym(v3, "SBSUIAppDeactivateReachability");
    v7[3] = (uint64_t)v2;
    getSBSUIAppDeactivateReachabilitySymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    ((void (*)(void))v2)();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void softlink_SBSUIAppDeactivateReachability(void)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UIApplication.m"), 486, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (UIInterfaceOrientation)statusBarOrientation
{
  void *v4;
  void *v5;
  void *v6;
  UIInterfaceOrientation v7;

  if (dyld_program_sdk_at_least())
    return -[UIApplication _safeInterfaceOrientationForNoWindow](self, "_safeInterfaceOrientationForNoWindow");
  -[UIApplication _findUISceneForLegacyInterfaceOrientation](self, "_findUISceneForLegacyInterfaceOrientation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "_canDynamicallySpecifySupportedInterfaceOrientations")
      || (objc_msgSend(v5, "_effectiveUIClientSettings"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "interfaceOrientation"),
          v6,
          v7 == UIInterfaceOrientationUnknown))
    {
      v7 = objc_msgSend(v5, "_interfaceOrientation");
    }
  }
  else
  {
    v7 = UIInterfaceOrientationUnknown;
  }
  if ((unint64_t)v7 <= UIInterfaceOrientationPortrait)
    v7 = UIInterfaceOrientationPortrait;

  return v7;
}

void __28__UIApplication_canOpenURL___block_invoke()
{
  void *v0;
  id v1;

  _UIKitPreferencesOnce();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIShouldLogCanOpenURL"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8013 = objc_msgSend(v0, "BOOLValue");

}

- (BOOL)supportsAlternateIcons
{
  void *v2;
  BOOL v3;

  LSApplicationProxyForSettingCurrentApplicationIcon();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canOpenURL:(NSURL *)url
{
  NSURL *v4;
  BOOL v5;

  v4 = url;
  if (qword_1EDDC8288 != -1)
    dispatch_once(&qword_1EDDC8288, &__block_literal_global_1219);
  if (byte_1EDDC8013)
    NSLog(CFSTR("%s called for URL: %@"), "-[UIApplication canOpenURL:]", v4);
  v5 = -[UIApplication _canOpenURL:publicURLsOnly:](self, "_canOpenURL:publicURLsOnly:", v4, 1);

  return v5;
}

- (BOOL)_canOpenURL:(id)a3 publicURLsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  v4 = a4;
  v5 = a3;
  if (!v5)
    return 0;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLOverrideForURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 && (objc_msgSend(v9, "isEqualToString:", CFSTR("app-prefs")) & 1) != 0)
  {
    v11 = 0;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("app-settings")) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v16 = 0;
    v11 = objc_msgSend(v7, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:", v8, !v4, &v16);
    v12 = v16;
    v13 = v12;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v12, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("-canOpenURL: failed for URL: \"%@\" - error: \"%@\"), v8, v14);

    }
  }

  return v11;
}

- (BOOL)_shouldHandleTestURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "compare:options:", CFSTR("test"), 1))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLForKey:", CFSTR("UIHandleTestURLScheme"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)interfaceOrientationForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v3, "compare:options:", CFSTR("UIInterfaceOrientationPortraitUpsideDown"), 1))
    {
      if (objc_msgSend(v3, "compare:options:", CFSTR("UIInterfaceOrientationLandscapeLeft"), 1))
      {
        if (objc_msgSend(v3, "compare:options:", CFSTR("UIInterfaceOrientationLandscapeRight"), 1))
          v4 = 1;
        else
          v4 = 3;
      }
      else
      {
        v4 = 4;
      }
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (int64_t)statusBarStyleForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleGray"), 1)
      && objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleDefault"), 1))
    {
      v4 = 1;
      if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleLightContent"), 1))
      {
        if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleDarkContent"), 1))
        {
          v4 = 1;
          if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleTransparentBlack"), 1))
          {
            v4 = 1;
            if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleBlackTranslucent"), 1))
            {
              if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleOpaqueBlack"), 1)
                && objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleBlackOpaque"), 1))
              {
                if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleBlackOpaqueWithOutCorners"), 1))
                {
                  if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleExternal"), 1))
                  {
                    if (objc_msgSend(v3, "compare:options:", CFSTR("UIStatusBarStyleExternalCompass"), 1))
                      v4 = -1;
                    else
                      v4 = 405;
                  }
                  else
                  {
                    v4 = 400;
                  }
                }
                else
                {
                  v4 = 51;
                }
              }
              else
              {
                v4 = 2;
              }
            }
          }
        }
        else
        {
          v4 = 3;
        }
      }
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (unint64_t)_statusBarStyleOverridesForArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[41];
  _QWORD v21[42];

  v21[41] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20[0] = CFSTR("UIStatusBarStyleOverrideInCall");
  v20[1] = CFSTR("UIStatusBarStyleOverrideInWorkout");
  v21[0] = &unk_1E1A99738;
  v21[1] = &unk_1E1A99750;
  v20[2] = CFSTR("UIStatusBarStyleOverrideRecording");
  v20[3] = CFSTR("UIStatusBarStyleOverrideTethering");
  v21[2] = &unk_1E1A99768;
  v21[3] = &unk_1E1A99780;
  v20[4] = CFSTR("UIStatusBarStyleOverrideInVideoConference");
  v20[5] = CFSTR("UIStatusBarStyleOverrideScreenSharing");
  v21[4] = &unk_1E1A99798;
  v21[5] = &unk_1E1A997B0;
  v20[6] = CFSTR("UIStatusBarStyleOverrideNavigationTeal");
  v20[7] = CFSTR("UIStatusBarStyleOverrideNavigationBlue");
  v21[6] = &unk_1E1A997C8;
  v21[7] = &unk_1E1A997E0;
  v20[8] = CFSTR("UIStatusBarStyleOverrideAssistantEyesFree");
  v20[9] = CFSTR("UIStatusBarStyleOverrideVideoOut");
  v21[8] = &unk_1E1A997F8;
  v21[9] = &unk_1E1A99810;
  v20[10] = CFSTR("UIStatusBarStyleOverrideHearingAidRecording");
  v20[11] = CFSTR("UIStatusBarStyleOverrideBackgroundLocation");
  v21[10] = &unk_1E1A99828;
  v21[11] = &unk_1E1A99840;
  v20[12] = CFSTR("UIStatusBarStyleOverrideNearbyInteractions");
  v20[13] = CFSTR("UIStatusBarStyleOverrideCarPlay");
  v21[12] = &unk_1E1A99858;
  v21[13] = &unk_1E1A99870;
  v20[14] = CFSTR("UIStatusBarStyleOverrideAutoAirPlayReady");
  v20[15] = CFSTR("UIStatusBarStyleOverrideAutoAirPlayPlaying");
  v21[14] = &unk_1E1A99888;
  v21[15] = &unk_1E1A998A0;
  v20[16] = CFSTR("UIStatusBarStyleOverrideSysdiagnose");
  v20[17] = CFSTR("UIStatusBarStyleOverrideScreenSharingServer");
  v21[16] = &unk_1E1A998B8;
  v21[17] = &unk_1E1A998D0;
  v20[18] = CFSTR("UIStatusBarStyleOverrideScreenReplayRecording");
  v20[19] = CFSTR("UIStatusBarStyleOverrideDiagnostics");
  v21[18] = &unk_1E1A998E8;
  v21[19] = &unk_1E1A99900;
  v20[20] = CFSTR("UIStatusBarStyleOverrideLoggingCapture");
  v20[21] = CFSTR("UIStatusBarStyleOverrideSOS");
  v21[20] = &unk_1E1A99918;
  v21[21] = &unk_1E1A99930;
  v20[22] = CFSTR("UIStatusBarStyleOverrideDeveloperTools");
  v20[23] = CFSTR("UIStatusBarStyleOverrideAirPrint");
  v21[22] = &unk_1E1A99948;
  v21[23] = &unk_1E1A99960;
  v20[24] = CFSTR("UIStatusBarStyleOverrideWebRTCCapture");
  v20[25] = CFSTR("UIStatusBarStyleOverrideWebRTCAudioCapture");
  v21[24] = &unk_1E1A99978;
  v21[25] = &unk_1E1A99990;
  v20[26] = CFSTR("UIStatusBarStyleOverrideFullScreenWebRTCCapture");
  v20[27] = CFSTR("UIStatusBarStyleOverrideFullScreenWebRTCAudioCapture");
  v21[26] = &unk_1E1A999A8;
  v21[27] = &unk_1E1A999C0;
  v20[28] = CFSTR("UIStatusBarStyleOverrideCallRinging");
  v20[29] = CFSTR("UIStatusBarStyleOverrideVideoConferenceRinging");
  v21[28] = &unk_1E1A999D8;
  v21[29] = &unk_1E1A999F0;
  v20[30] = CFSTR("UIStatusBarStyleOverrideStewie");
  v20[31] = CFSTR("UIStatusBarStyleOverrideStewieDisconnected");
  v21[30] = &unk_1E1A99A08;
  v21[31] = &unk_1E1A99A20;
  v20[32] = CFSTR("UIStatusBarStyleOverrideSharePlay");
  v20[33] = CFSTR("UIStatusBarStyleOverrideSharePlayScreenSharing");
  v21[32] = &unk_1E1A99A38;
  v21[33] = &unk_1E1A99A50;
  v20[34] = CFSTR("UIStatusBarStyleOverrideSharePlayInactive");
  v20[35] = CFSTR("UIStatusBarStyleOverridePlaygrounds");
  v21[34] = &unk_1E1A99A68;
  v21[35] = &unk_1E1A99A80;
  v20[36] = CFSTR("UIStatusBarStyleOverrideActivePushToTalkCall");
  v20[37] = CFSTR("UIStatusBarStyleOverrideIdlePushToTalkCall");
  v21[36] = &unk_1E1A99A98;
  v21[37] = &unk_1E1A99AB0;
  v20[38] = CFSTR("UIStatusBarStyleOverrideCallHandoff");
  v20[39] = CFSTR("UIStatusBarStyleOverrideVideoConferenceHandoff");
  v21[38] = &unk_1E1A99AC8;
  v21[39] = &unk_1E1A99AE0;
  v20[40] = CFSTR("UIStatusBarStyleOverridesAll");
  v21[40] = &unk_1E1A99AF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 41);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "objectForKey:", v11, (_QWORD)v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = v12;
              v8 |= objc_msgSend(v12, "unsignedIntegerValue");

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int64_t)_backgroundStyleForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = 1;
    if (objc_msgSend(v3, "compare:options:", CFSTR("UIBackgroundStyleTransparent"), 1))
    {
      if (objc_msgSend(v3, "compare:options:", CFSTR("UIBackgroundStyleUltraLightBlur"), 1))
      {
        if (objc_msgSend(v3, "compare:options:", CFSTR("UIBackgroundStyleLightBlur"), 1))
        {
          if (objc_msgSend(v3, "compare:options:", CFSTR("UIBackgroundStyleMediumBlur"), 1))
          {
            if (objc_msgSend(v3, "compare:options:", CFSTR("UIBackgroundStyleDarkBlur"), 1))
            {
              if (objc_msgSend(v3, "compare:options:", CFSTR("UIBackgroundStyleDarkTranslucent"), 1))
                v4 = 0;
              else
                v4 = 5;
            }
            else
            {
              v4 = 4;
            }
          }
          else
          {
            v4 = 6;
          }
        }
        else
        {
          v4 = 3;
        }
      }
      else
      {
        v4 = 2;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  id v5;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIApplication noteActiveInterfaceOrientationWillChangeToOrientation:screen:](self, "noteActiveInterfaceOrientationWillChangeToOrientation:screen:", a3, v5);

}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIApplication noteActiveInterfaceOrientationDidChangeToOrientation:willAnimateWithSettings:fromOrientation:screen:](self, "noteActiveInterfaceOrientationDidChangeToOrientation:willAnimateWithSettings:fromOrientation:screen:", a3, v8, a5, v9);

}

- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event
{
  id v8;

  v8 = target;
  if (!target)
    v8 = -[UIApplication _unswizzledTargetInChainForAction:sender:](self, "_unswizzledTargetInChainForAction:sender:", action, sender);
  if (dyld_program_sdk_at_least())
    objc_msgSend(v8, action, sender, event);
  else
    objc_msgSend(v8, sel_performSelector_withObject_withObject_, action, sender, event);
  return v8 != 0;
}

- (id)_unswizzledTargetInChainForAction:(SEL)a3 sender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "window");
  else
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_15;
  }
  objc_msgSend(v7, "_focusBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "syncsFocusAndResponder");

  if (!v12)
    goto LABEL_10;
  objc_msgSend(v7, "_focusSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_preferredFirstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_responderWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v7)
  {

    goto LABEL_10;
  }
  if (v10)
  {
LABEL_15:
    _UIResponderTargetForAction(v10, a3, v6);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_10:
  if (_AXSFullKeyboardAccessEnabled())
  {
    if (!_AXSFullKeyboardAccessPassthroughModeEnabled())
    {
      objc_msgSend(v7, "_focusResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_15;
    }
  }
  objc_msgSend(v7, "firstResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_responderForEditing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_15;
  v16 = v6;
  v10 = v16;
  if (v16)
    goto LABEL_15;
LABEL_16:
  v17 = v16;

  return v17;
}

- (id)_keyWindowForScreen:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t (**v7)(void *, void *);
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__UIApplication__keyWindowForScreen___block_invoke;
  aBlock[3] = &unk_1E16B8120;
  v6 = v4;
  v20 = v6;
  v7 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __37__UIApplication__keyWindowForScreen___block_invoke_2;
  v17[3] = &unk_1E16B8120;
  v8 = v6;
  v18 = v8;
  v9 = _Block_copy(v17);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __37__UIApplication__keyWindowForScreen___block_invoke_3;
  v15[3] = &unk_1E16B8120;
  v10 = v8;
  v16 = v10;
  v11 = _Block_copy(v15);
  +[UIWindow _externalKeyWindow](UIWindow, "_externalKeyWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7[2](v7, v12) & 1) == 0)
  {
    -[UIApplication keyWindow](self, "keyWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v7[2](v7, v13) & 1) != 0)
    {
      v12 = v13;
    }
    else
    {
      +[UIWindow _topVisibleWindowPassingTest:](UIWindow, "_topVisibleWindowPassingTest:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        +[UIWindow _topVisibleWindowPassingTest:](UIWindow, "_topVisibleWindowPassingTest:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v12;
}

uint64_t __37__UIApplication__keyWindowForScreen___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5)
    v6 = v3 == v5;
  else
    v6 = objc_msgSend(v3, "_isMainScreen");

  return v6;
}

- (BOOL)supportsMultipleScenes
{
  if (qword_1EDDC8350 != -1)
    dispatch_once(&qword_1EDDC8350, &__block_literal_global_1678_0);
  return byte_1EDDC801A && -[_UIApplicationInfoParser supportsMultiwindow](self->_appInfo, "supportsMultiwindow");
}

- (int64_t)_defaultSceneInterfaceOrientationReturningUnknownForNilScene:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;

  v3 = a3;
  if (-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle"))
    return !v3;
  objc_msgSend((id)UIApp, "_defaultUISceneOrMainScreenPlaceholderIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hostsWindows") ? v4 : 0;
  v6 = v5;

  if (!v6)
    return !v3;
  v7 = objc_msgSend(v6, "_interfaceOrientation");

  return v7;
}

- (BOOL)isPPTAvailable
{
  return -[UIApplication _purplePPTServerPort](self, "_purplePPTServerPort") != 0;
}

- (void)_endBackgroundTask:(unint64_t)a3
{
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  uint64_t v5;
  uint64_t v6;

  if ((_UIApplicationEndBackgroundTask((const void *)a3) & 1) == 0)
  {
    p_applicationFlags = &self->_applicationFlags;
    v5 = *((_QWORD *)&self->_applicationFlags + 1);
    if ((v5 & 0x4000000000000) != 0)
    {
      v6 = *(_QWORD *)p_applicationFlags;
      *(_QWORD *)p_applicationFlags = *(_QWORD *)p_applicationFlags;
      *((_QWORD *)&self->_applicationFlags + 1) = v5 & 0xFFFBFFFFFFFFFFFFLL;
      if ((v6 & 0x3FFFF) != 0)
        _logApplicationLifecycleMemoryMetricApplicationWillBeSuspended();
    }
  }
}

- (NSArray)shortcutItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIApplicationShortcutItem *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIApplication shortcutService](self, "shortcutService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init((Class)getSBSApplicationShortcutServiceClass());
    -[UIApplication setShortcutService:](self, "setShortcutService:", v4);

  }
  -[UIApplication shortcutService](self, "shortcutService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationShortcutItemsOfTypes:forBundleIdentifier:", 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "dynamicApplicationShortcutItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = -[UIApplicationShortcutItem initWithSBSApplicationShortcutItem:]([UIApplicationShortcutItem alloc], "initWithSBSApplicationShortcutItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (void)_reportResults:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  char *v8;
  id v9;
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
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[UIApplication _sendDictionaryToPPT:](self, "_sendDictionaryToPPT:", v23);
  objc_msgSend(v23, "objectForKey:", CFSTR("testName"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E16EDF20;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = getenv("PPT_SERIALIZE_RESULTS");
  if (v8 && !strcmp(v8, "1"))
  {
    if (!_reportResults____dateFormatter)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v10 = (void *)_reportResults____dateFormatter;
      _reportResults____dateFormatter = (uint64_t)v9;

      objc_msgSend((id)_reportResults____dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executablePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (void *)_reportResults____dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@-%@.plist"), v13, v7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "writeToFile:atomically:", v20, 1);
    NSLog(CFSTR("Wrote test results to %@"), v20);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, CFSTR("testName"), v23, CFSTR("testResults"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("UIApplicationTestingTestFinishedNotification"), self, v22);

}

- (void)_sendDictionaryToPPT:(id)a3
{
  id v4;
  __CFMessagePort *v5;
  __CFMessagePort *v6;
  const __CFData *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  SInt32 v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  SInt32 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIApplication _purplePPTServerPort](self, "_purplePPTServerPort");
  if (v5)
  {
    v6 = v5;
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v17);
    v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    v9 = v8;
    if (v7)
      goto LABEL_6;
    v10 = CFSTR("UIKit failed to generate the result payload");
    if (v8)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@. Serialization Error=%@"), CFSTR("UIKit failed to generate the result payload"), v12);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("payloadGenerationError"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v13, 200, 0, 0);
    v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_6:
      v14 = CFMessagePortSendRequest(v6, 0, v7, 0.0, 0.0, 0, 0);
      _pptLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v19 = v14;
          _os_log_error_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Error sending test results to PPT. (CFMessagePortSendRequest error: %d)", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Sent test results to PPT.", buf, 2u);
      }

    }
  }

}

- (__CFMessagePort)_purplePPTServerPort
{
  int IsValid;
  __CFMessagePort *result;
  NSObject *v4;
  uint8_t v5[16];

  if (_purplePPTServerPort_purplePPTServerPort)
  {
    IsValid = CFMessagePortIsValid((CFMessagePortRef)_purplePPTServerPort_purplePPTServerPort);
    result = (__CFMessagePort *)_purplePPTServerPort_purplePPTServerPort;
    if (IsValid)
      return result;
    if (_purplePPTServerPort_purplePPTServerPort)
      CFRelease((CFTypeRef)_purplePPTServerPort_purplePPTServerPort);
  }
  result = CFMessagePortCreateRemote((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("PurplePPTServer"));
  _purplePPTServerPort_purplePPTServerPort = (uint64_t)result;
  if (!result)
  {
    _pptLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Error creating the CFMessagePort needed to communicate with PPT.", v5, 2u);
    }

    return (__CFMessagePort *)_purplePPTServerPort_purplePPTServerPort;
  }
  return result;
}

- (void)setShortcutItems:(NSArray *)shortcutItems
{
  NSArray *v4;
  void *v5;
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = shortcutItems;
  -[UIApplication shortcutService](self, "shortcutService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init((Class)getSBSApplicationShortcutServiceClass());
    -[UIApplication setShortcutService:](self, "setShortcutService:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "sbsShortcutItem", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[UIApplication shortcutService](self, "shortcutService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateDynamicApplicationShortcutItems:forBundleIdentifier:", v7, 0);

}

- (SBSApplicationShortcutService)shortcutService
{
  return self->_shortcutService;
}

- (void)setShortcutService:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutService, a3);
}

uint64_t __53__UIApplication_UIApplicationTesting__handleTestURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "runTest:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "failedTest:withFailure:", *(_QWORD *)(a1 + 40), CFSTR("TestNotHandled"));
  }
  return result;
}

- (void)_run
{
  void *v3;
  CFRunLoopRef Current;
  __CFRunLoop *v5;
  const __CFString *v6;
  UIEventDispatcher *eventDispatcher;
  __CFRunLoop *Main;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  CFRunLoopObserverContext context;

  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  kdebug_trace();
  _kUIAccessibilityStartedWithInitialization = 1;
  objc_msgSend((id)UIApp, "_accessibilityInit");
  _kUIAccessibilityStartedWithInitialization = 0;
  kdebug_trace();
  XCTTargetBootstrap();
  -[UIApplication _registerForUserDefaultsChanges](self, "_registerForUserDefaultsChanges");
  -[UIApplication _registerForSignificantTimeChangeNotification](self, "_registerForSignificantTimeChangeNotification");
  -[UIApplication _registerForLanguageChangedNotification](self, "_registerForLanguageChangedNotification");
  -[UIApplication _registerForLocaleWillChangeNotification](self, "_registerForLocaleWillChangeNotification");
  -[UIApplication _registerForLocaleChangedNotification](self, "_registerForLocaleChangedNotification");
  -[UIApplication _registerForAlertItemStateChangeNotification](self, "_registerForAlertItemStateChangeNotification");
  -[UIApplication _registerForKeyBagLockStatusNotification](self, "_registerForKeyBagLockStatusNotification");
  -[UIApplication _registerForNameLayerTreeNotification](self, "_registerForNameLayerTreeNotification");
  -[UIApplication _registerForBackgroundRefreshStatusChangedNotification](self, "_registerForBackgroundRefreshStatusChangedNotification");
  -[UIApplication _registerForHangTracerEnabledStateChangedNotification](self, "_registerForHangTracerEnabledStateChangedNotification");
  -[UIApplication _registerForKeyboardLayoutChangedNotification](self, "_registerForKeyboardLayoutChangedNotification");
  Current = CFRunLoopGetCurrent();
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  if (!qword_1EDDC8408)
  {
    v5 = Current;
    qword_1EDDC8408 = (uint64_t)CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 1999000, (CFRunLoopObserverCallBack)_beforeCACommitHandler, &context);
    v6 = (const __CFString *)*MEMORY[0x1E0C9B270];
    CFRunLoopAddObserver(v5, (CFRunLoopObserverRef)qword_1EDDC8408, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    qword_1EDDC8410 = (uint64_t)CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 2001000, (CFRunLoopObserverCallBack)_afterCACommitHandler, &context);
    CFRunLoopAddObserver(v5, (CFRunLoopObserverRef)qword_1EDDC8410, v6);
  }
  _UIApplicationInstallAutoreleasePoolsIfNecessaryForMode((const __CFString *)*MEMORY[0x1E0C9B280]);
  byte_1EDDC7FFA = 1;
  eventDispatcher = self->_eventDispatcher;
  Main = CFRunLoopGetMain();
  -[UIEventDispatcher _installEventRunLoopSources:]((uint64_t)eventDispatcher, Main);
  v9 = -[_UIApplicationInfoParser supportsMultiwindow](self->_appInfo, "supportsMultiwindow");
  v10 = 0x1000000000000;
  if (!v9)
    v10 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFEFFFFFFFFFFFFLL | v10;
  v11 = -[_UIApplicationInfoParser supportedOnLockScreen](self->_appInfo, "supportedOnLockScreen");
  v12 = 0x2000000000000;
  if (!v11)
    v12 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFDFFFFFFFFFFFFLL | v12;
  if ((objc_msgSend((id)objc_opt_class(), "registerAsSystemApp") & 1) != 0
    || -[UIApplication isFrontBoard](self, "isFrontBoard"))
  {
    self->_eventDispatcher->_mainEnvironment->_isSystemApplication = 1;
    if (!-[UIApplication disablesFrontBoardImplicitWindowScenes](self, "disablesFrontBoardImplicitWindowScenes"))
    {
      byte_1EDDC7FF9 = 1;
      _requestHardwareEventsIfNeeded();
      +[FBSSceneTransitionContext transitionContext](UIApplicationSceneTransitionContext, "transitionContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplication _runWithMainScene:transitionContext:completion:](self, "_runWithMainScene:transitionContext:completion:", 0, v13, 0);

    }
  }
  if ((byte_1EDDC7FF9 & 1) == 0)
  {
    v14 = objc_msgSend((id)objc_opt_class(), "_isSystemUIService");
    v15 = (void *)objc_opt_class();
    if (v14)
    {
      objc_msgSend(v15, "_attemptRequestingSystemUIServiceSceneWithRetry");
    }
    else
    {
      v16 = _UIApplicationWantsExtensionBehavior(v15);
      byte_1EDDC7FF9 = 1;
      if (v16)
      {
        -[UIApplication __completeAndRunAsPlugin](self, "__completeAndRunAsPlugin");
      }
      else
      {
        +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "lifecycleWantsUnnecessaryDelayForSceneDelivery");

        if ((v18 & 1) == 0)
          -[UIApplication _compellApplicationLaunchToCompleteUnconditionally](self, "_compellApplicationLaunchToCompleteUnconditionally");
      }
    }
  }
  objc_autoreleasePoolPop(v3);
  kdebug_trace();
  GSEventRun();
}

- (BOOL)_isSpringBoardShowingAnAlert
{
  BOOL v2;
  uint32_t v3;
  uint64_t state64;
  int check;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__UIApplication__isSpringBoardShowingAnAlert__block_invoke;
  v7[3] = &unk_1E16DCD48;
  v7[4] = &v8;
  objc_msgSend((id)qword_1EDDC8098, "enumerateObjectsUsingBlock:", v7);
  if (*((_BYTE *)v9 + 24))
  {
    v2 = 1;
  }
  else
  {
    if (byte_1EDDC7FF7
      || (v3 = notify_register_check("com.apple.springboard.showingAlertItem", &dword_1EDDC8028),
          byte_1EDDC7FF7 = v3 == 0,
          !v3))
    {
      check = 0;
      notify_check(dword_1EDDC8028, &check);
      if (check)
      {
        state64 = 0;
        notify_get_state(dword_1EDDC8028, &state64);
        byte_1EDDC7FF6 = state64 != 0;
      }
    }
    v2 = byte_1EDDC7FF6 != 0;
    *((_BYTE *)v9 + 24) = byte_1EDDC7FF6 != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v2;
}

- (void)_deactivateForReason:(int)a3 notify:(BOOL)a4
{
  uint64_t v4;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t applicationFlags;
  int v19;
  unint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;
  UISystemNavigationAction *systemNavigationAction;
  int v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  int v44;
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    return;
  v4 = *(_QWORD *)&a3;
  if (a3 == 8)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", *(_QWORD *)&a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scene");
    v8 = objc_claimAutoreleasedReturnValue();

    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSuppressingKeyboard:forScene:", 1, v8);

    v14 = qword_1EDDC8060;
    if (!qword_1EDDC8060)
    {
      v14 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1EDDC8060);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v9 = v15;
    _UIApplicationDeactivationReasonLoggableDescription(8);
    v16 = objc_claimAutoreleasedReturnValue();
    _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v16;
    v47 = 2114;
    v48 = v17;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Acting on addition of deactivation reason: %{public}@; deactivation reasons: %{public}@",
      buf,
      0x16u);

LABEL_18:
LABEL_19:

    return;
  }
  if (a3 == 30)
  {
    v6 = qword_1EDDC8058;
    if (!qword_1EDDC8058)
    {
      v6 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1EDDC8058);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      _UIApplicationDeactivationReasonLoggableDescription(30);
      v9 = objc_claimAutoreleasedReturnValue();
      _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v9;
      v47 = 2114;
      v48 = v10;
      v11 = "Ignoring deactivation reason: %{public}@; deactivation reasons: %{public}@";
LABEL_17:
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);

      goto LABEL_18;
    }
    return;
  }
  applicationFlags = (uint64_t)self->_applicationFlags;
  v19 = 1 << a3;
  if (((1 << a3) & applicationFlags & 0x3FFFF) == 0)
  {
    v22 = a4;
    v23 = 0;
    v24 = *((_QWORD *)&self->_applicationFlags + 1);
    switch(a3)
    {
      case 0:
      case 5:
        *(_QWORD *)&self->_applicationFlags = applicationFlags | 0x100000000;
        *((_QWORD *)&self->_applicationFlags + 1) = v24;
        if (a3 != 4)
          goto LABEL_27;
        goto LABEL_23;
      case 3:
        *(_QWORD *)&self->_applicationFlags = applicationFlags;
        *((_QWORD *)&self->_applicationFlags + 1) = v24 & 0xFFFFFBFFFFFFFFFFLL;
        -[UIApplication _deliverRemainingKeyUpEvents](self, "_deliverRemainingKeyUpEvents");
        goto LABEL_27;
      case 4:
LABEL_23:
        systemNavigationAction = self->_systemNavigationAction;
        if (systemNavigationAction && (-[UISystemNavigationAction isValid](systemNavigationAction, "isValid") & 1) == 0)
          -[UIApplication _setSystemNavigationAction:](self, "_setSystemNavigationAction:", 0);
LABEL_27:
        v23 = 0;
        break;
      case 11:
        -[UIApplication _deliverRemainingKeyUpEvents](self, "_deliverRemainingKeyUpEvents");
        v23 = 1;
        break;
      default:
        break;
    }
    v26 = *(_DWORD *)&self->_applicationFlags & 0x3FFFF;
    v27 = qword_1EDDC8070;
    if (!qword_1EDDC8070)
    {
      v27 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&qword_1EDDC8070);
    }
    v28 = v26 | v19;
    v29 = *(NSObject **)(v27 + 8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      _UIApplicationDeactivationReasonLoggableDescription(v4);
      v31 = objc_claimAutoreleasedReturnValue();
      _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _UIApplicationDeactivationReasonMaskLoggableDescription(v28);
      v44 = v28;
      v33 = v23;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *((_DWORD *)&self->_applicationFlags + 1) & 1;
      *(_DWORD *)buf = 138544130;
      v46 = v31;
      v47 = 2114;
      v48 = v32;
      v49 = 2114;
      v50 = v34;
      v51 = 1024;
      v52 = v35;
      _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_DEFAULT, "Deactivation reason added: %{public}@; deactivation reasons: %{public}@ -> %{public}@; animating application lif"
        "ecycle event: %d",
        buf,
        0x26u);

      v23 = v33;
      LODWORD(v28) = v44;

    }
    v36 = (uint64_t)self->_applicationFlags;
    if ((*(_DWORD *)&self->_applicationFlags & 0x3FFFF) != (_DWORD)v28 && v22)
    {
      v38 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "dictionaryWithObject:forKey:", v39, CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "postNotificationName:object:userInfo:", CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), self, v40);

      v36 = (uint64_t)self->_applicationFlags;
    }
    if ((v36 & 0x3FFFF) != 0 || !v22)
    {
      if ((v36 & 0x100000000) != 0)
        goto LABEL_51;
    }
    else
    {
      kdebug_trace();
      byte_1EDDC7FF4 = 0;
      -[UIApplication _updateHangTracer](self, "_updateHangTracer");
      -[UIApplicationDelegate methodForSelector:](self->_delegate, "methodForSelector:", sel_applicationWillResignActive_);
      entr_act_modify();
      if (self->_delegate
        && (*((_BYTE *)&self->_applicationFlags + 6) & 0x20) != 0
        && (objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) == 0
        && (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
      {
        *((_QWORD *)&self->_applicationFlags + 1) |= 0x200000000000uLL;
        -[UIApplicationDelegate applicationWillResignActive:](self->_delegate, "applicationWillResignActive:", self);
        *((_QWORD *)&self->_applicationFlags + 1) &= ~0x200000000000uLL;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("UIApplicationWillResignActiveNotification"), self, 0);

      -[UIApplication _deliverRemainingKeyUpEvents](self, "_deliverRemainingKeyUpEvents");
      -[UIApplication _cancelAllPressesForTVOnly](self, "_cancelAllPressesForTVOnly");
      entr_act_modify();
      entr_act_end();
      _UIAnalyticsGatherMultitouchForegroundAnalytics(0);
      kdebug_trace();
      if ((*(_QWORD *)&self->_applicationFlags & 0x100000000) != 0)
      {
LABEL_51:
        BSSetMainThreadPriorityFixedForUI();
        if (v23)
        {
LABEL_52:
          if (!+[_UIViewServiceSessionManager hasActiveSessions](_UIViewServiceSessionManager, "hasActiveSessions"))+[UIView _beginSuspendingMotionEffectsForReason:](UIView, "_beginSuspendingMotionEffectsForReason:", CFSTR("_UIMotionEffectEngineSuspensionReasonBackgrounded"));
        }
LABEL_54:
        *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFFFFFFC0000 | v28 & 0x3FFFF;
        return;
      }
    }
    if (v23)
      goto LABEL_52;
    goto LABEL_54;
  }
  v20 = qword_1EDDC8068;
  if (!qword_1EDDC8068)
  {
    v20 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v20, (unint64_t *)&qword_1EDDC8068);
  }
  v21 = *(NSObject **)(v20 + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v21;
    _UIApplicationDeactivationReasonLoggableDescription(v4);
    v9 = objc_claimAutoreleasedReturnValue();
    _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v9;
    v47 = 2114;
    v48 = v10;
    v11 = "Ignoring already applied deactivation reason: %{public}@; deactivation reasons: %{public}@";
    goto LABEL_17;
  }
}

- (void)_deactivateForReason:(int)a3
{
  -[UIApplication _deactivateForReason:notify:](self, "_deactivateForReason:notify:", *(_QWORD *)&a3, 1);
}

- (void)_registerForKeyBagLockStatusNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)UIApp, (CFNotificationCallback)_keybagLockStatusChanged, (CFStringRef)*MEMORY[0x1E0D4E5F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __34__UIApplication__firstCommitBlock__block_invoke(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  _QWORD block[5];

  Current = CFRunLoopGetCurrent();
  v3 = (const void *)*MEMORY[0x1E0C9B270];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__UIApplication__firstCommitBlock__block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  CFRunLoopPerformBlock(Current, v3, block);
}

- (id)_firstCommitBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__UIApplication__firstCommitBlock__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (void)_registerForUserDefaultsChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleUserDefaultsDidChange_, *MEMORY[0x1E0CB3420], 0);

}

+ (BOOL)registerAsSystemApp
{
  return byte_1EDDC7FF2;
}

- (void)setDelegate:(id)delegate
{
  UIApplicationDelegate *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  BOOL v45;
  char v46;
  uint64_t v47;
  char v48;
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  char v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  UIApplicationDelegate *v58;

  v4 = (UIApplicationDelegate *)delegate;
  if (!v4 || self->_delegate != v4)
  {
    v58 = v4;
    objc_setAssociatedObject(self, &unk_1EDDC7FF3, 0, (void *)1);
    self->_delegate = v58;
    v5 = objc_opt_respondsToSelector();
    v6 = 0x10000000000;
    if ((v5 & 1) == 0)
      v6 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFEFFFFFFFFFFLL | v6;
    v7 = objc_opt_respondsToSelector();
    v8 = 0x20000000000;
    if ((v7 & 1) == 0)
      v8 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFDFFFFFFFFFFLL | v8;
    v9 = objc_opt_respondsToSelector();
    v10 = 0x40000000000;
    if ((v9 & 1) == 0)
      v10 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFBFFFFFFFFFFLL | v10;
    v11 = objc_opt_respondsToSelector();
    v12 = 0x80000000000;
    if ((v11 & 1) == 0)
      v12 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFF7FFFFFFFFFFLL | v12;
    v13 = objc_opt_respondsToSelector();
    v14 = 0x100000000000;
    if ((v13 & 1) == 0)
      v14 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFEFFFFFFFFFFFLL | v14;
    v15 = objc_opt_respondsToSelector();
    v16 = 0x200000000000;
    if ((v15 & 1) == 0)
      v16 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFDFFFFFFFFFFFLL | v16;
    v17 = objc_opt_respondsToSelector();
    v18 = 0x400000000000;
    if ((v17 & 1) == 0)
      v18 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFBFFFFFFFFFFFLL | v18;
    v19 = objc_opt_respondsToSelector();
    v20 = 0x800000000000;
    if ((v19 & 1) == 0)
      v20 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFF7FFFFFFFFFFFLL | v20;
    v21 = objc_opt_respondsToSelector();
    v22 = 0x1000000000000;
    if ((v21 & 1) == 0)
      v22 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFEFFFFFFFFFFFFLL | v22;
    v23 = objc_opt_respondsToSelector();
    v24 = 0x2000000000000;
    if ((v23 & 1) == 0)
      v24 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFDFFFFFFFFFFFFLL | v24;
    v25 = objc_opt_respondsToSelector();
    v26 = 0x4000000000000;
    if ((v25 & 1) == 0)
      v26 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFBFFFFFFFFFFFFLL | v26;
    v27 = objc_opt_respondsToSelector();
    v28 = 0x8000000000000;
    if ((v27 & 1) == 0)
      v28 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFF7FFFFFFFFFFFFLL | v28;
    v29 = objc_opt_respondsToSelector();
    v30 = 0x10000000000000;
    if ((v29 & 1) == 0)
      v30 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFEFFFFFFFFFFFFFLL | v30;
    v31 = objc_opt_respondsToSelector();
    v32 = 0x20000000000000;
    if ((v31 & 1) == 0)
      v32 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFDFFFFFFFFFFFFFLL | v32;
    v33 = objc_opt_respondsToSelector();
    v34 = 0x40000000000000;
    if ((v33 & 1) == 0)
      v34 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFBFFFFFFFFFFFFFLL | v34;
    v35 = objc_opt_respondsToSelector();
    v36 = 0x80000000000000;
    if ((v35 & 1) == 0)
      v36 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFF7FFFFFFFFFFFFFLL | v36;
    v37 = objc_opt_respondsToSelector();
    v38 = 0x100000000000000;
    if ((v37 & 1) == 0)
      v38 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFEFFFFFFFFFFFFFFLL | v38;
    v39 = objc_opt_respondsToSelector();
    v40 = 0x200000000000000;
    if ((v39 & 1) == 0)
      v40 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFDFFFFFFFFFFFFFFLL | v40;
    v41 = objc_opt_respondsToSelector();
    v42 = 0x2000000000000000;
    if ((v41 & 1) == 0)
      v42 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xDFFFFFFFFFFFFFFFLL | v42;
    v43 = objc_opt_respondsToSelector();
    v44 = 0x4000000000000000;
    if ((v43 & 1) == 0)
      v44 = 0;
    *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xBFFFFFFFFFFFFFFFLL | v44;
    if (!-[UIApplicationDelegate __isKindOfUIResponder](v58, "__isKindOfUIResponder")
      || (_IsKindOfUIView((uint64_t)v58) & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = 0;
    }
    else
    {
      objc_opt_class();
      v45 = (objc_opt_isKindOfClass() & 1) == 0;
    }
    *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)v45 << 20);
    v46 = objc_opt_respondsToSelector();
    v47 = 0x200000;
    if ((v46 & 1) == 0)
      v47 = 0;
    *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFDFFFFFLL | v47;
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v48 = 1;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v48 = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      v48 = 0;
    }
    p_applicationFlags = &self->_applicationFlags;
    *(_QWORD *)p_applicationFlags = *(_QWORD *)p_applicationFlags & 0xFBFFFFFFFFFFFFFFLL | ((unint64_t)(v48 & 1) << 58);
    v50 = objc_opt_respondsToSelector();
    v51 = 0x800000000000000;
    if ((v50 & 1) == 0)
      v51 = 0;
    *(_QWORD *)p_applicationFlags = *(_QWORD *)p_applicationFlags & 0xF7FFFFFFFFFFFFFFLL | v51;
    v52 = objc_opt_respondsToSelector();
    v53 = 0x1000000000000000;
    if ((v52 & 1) == 0)
      v53 = 0;
    *(_QWORD *)p_applicationFlags = *(_QWORD *)p_applicationFlags & 0xEFFFFFFFFFFFFFFFLL | v53;
    v54 = objc_opt_respondsToSelector();
    v55 = 0x8000000000000000;
    if ((v54 & 1) == 0)
      v55 = 0;
    *(_QWORD *)p_applicationFlags = v55 & 0x8000000000000000 | *(_QWORD *)p_applicationFlags & 0x7FFFFFFFFFFFFFFFLL;
    *((_QWORD *)p_applicationFlags + 1) = *((_QWORD *)p_applicationFlags + 1) & 0xFFFFFFFFFFFFFFFELL | ((objc_opt_respondsToSelector() & 1) != 0);
    v56 = objc_opt_respondsToSelector();
    v57 = 2;
    if ((v56 & 1) == 0)
      v57 = 0;
    *((_QWORD *)p_applicationFlags + 1) = *((_QWORD *)p_applicationFlags + 1) & 0xFFFFFFFFFFFFFFFDLL | v57;
    v4 = v58;
  }

}

- (void)_registerForLocaleWillChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)UIApp, (CFNotificationCallback)_localeWillChange, CFSTR("AppleTimePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForLanguageChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)UIApp, (CFNotificationCallback)_languageChanged, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForKeyboardLayoutChangedNotification
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("UITextInputCurrentKeyboardLayoutDidChangeNotification"), 0, v2, &__block_literal_global_1359);

}

- (void)_registerForBackgroundRefreshStatusChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_backgroundRefreshStatusDidChange, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_registerForAlertItemStateChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)UIApp, (CFNotificationCallback)_alertItemStateChanged, CFSTR("com.apple.springboard.showingAlertItem"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForLocaleChangedNotification
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, (const void *)UIApp, (CFNotificationCallback)_localeChanged, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForSignificantTimeChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)UIApp, (CFNotificationCallback)_significantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForNameLayerTreeNotification
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  _QWORD v6[4];
  id v7;
  _QWORD handler[4];
  id v9;
  int out_token;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NameLayerTree-%i"), getpid());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    out_token = 0;
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    handler[0] = v4;
    handler[1] = 3221225472;
    handler[2] = __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_2;
    handler[3] = &unk_1E16D72F0;
    v9 = &__block_literal_global_1062_0;
    notify_register_dispatch(v5, &out_token, MEMORY[0x1E0C80D38], handler);

  }
  out_token = 0;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_3;
  v6[3] = &unk_1E16D72F0;
  v7 = &__block_literal_global_1062_0;
  notify_register_dispatch("NameLayerTree", &out_token, MEMORY[0x1E0C80D38], v6);

}

- (void)_sendWillEnterForegroundCallbacks
{
  void *v3;

  kdebug_trace();
  -[UIApplicationDelegate methodForSelector:](self->_delegate, "methodForSelector:", sel_applicationWillEnterForeground_);
  entr_act_modify();
  if ((*((_BYTE *)&self->_applicationFlags + 6) & 0x80) != 0
    && (objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) == 0
    && (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
  {
    -[UIApplicationDelegate applicationWillEnterForeground:](self->_delegate, "applicationWillEnterForeground:", self);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("UIApplicationWillEnterForegroundNotification"), self, 0);

  *((_QWORD *)&self->_applicationFlags + 1) &= ~0x4000000000000uLL;
  entr_act_end();
  kdebug_trace();
}

- (void)_synchronizeSystemAnimationFencesWithSpinCleanUpBlock:(id)a3
{
  id v5;
  id v6;
  void (**v7)(void *, _QWORD);
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD aBlock[5];
  id v17;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 3200, CFSTR("Call must be made on main thread"));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__UIApplication__synchronizeSystemAnimationFencesWithSpinCleanUpBlock___block_invoke;
  aBlock[3] = &unk_1E16C5E00;
  v6 = v5;
  aBlock[4] = self;
  v17 = v6;
  v7 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v8 = __caCommitState;
  -[UIApplication _fenceProvider](self, "_fenceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 1)
  {
    v11 = objc_msgSend(v9, "isTrackingAnySystemAnimationFence");

    if (v11 && os_variant_has_internal_diagnostics())
    {
      v13 = _synchronizeSystemAnimationFencesWithSpinCleanUpBlock____s_category;
      if (!_synchronizeSystemAnimationFencesWithSpinCleanUpBlock____s_category)
      {
        v13 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&_synchronizeSystemAnimationFencesWithSpinCleanUpBlock____s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, " *|synchronize-skip|* a fence was started inside of a snapshot block - skipping the workspace synchronize because it may dequeue messages from the fenceExemptQueue and snapshots expect that not to happen", v15, 2u);
      }
    }
    v7[2](v7, 0);
  }
  else
  {
    objc_msgSend(v9, "synchronizeSystemAnimationFencesWithCleanUpBlock:", v7);

  }
}

void __71__UIApplication__synchronizeSystemAnimationFencesWithSpinCleanUpBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 320);
  *(_QWORD *)(v3 + 320) = 0;

}

+ (BOOL)_isUIKitSystemProcess
{
  return 0;
}

- (void)_registerForHangTracerEnabledStateChangedNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D28788];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__UIApplication__registerForHangTracerEnabledStateChangedNotification__block_invoke;
  v7[3] = &unk_1E16DD478;
  v7[4] = self;
  v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v7);

}

uint64_t __103__UIApplication_UIApplicationTesting__finishedTest_extraResults_waitForNotification_withTeardownBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("extended-launch-responsive"), *(_QWORD *)(a1 + 40));
}

- (void)_reloadKeyboardArbiterState
{
  id v2;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkState");

}

- (void)_checkActivityContinuationAndBecomeCurrentIfNeeded
{
  if (-[UIActivityContinuationManager activityContinuationsAreBeingTracked](self->_activityContinuationManager, "activityContinuationsAreBeingTracked"))
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_1017);
  }
}

- (void)_findBestActivityToMakeCurrent:(id)a3
{
  id v4;
  _QWORD block[4];
  id v6;

  v4 = a3;
  if ((*((_BYTE *)&self->_applicationFlags + 2) & 8) != 0
    && -[UIActivityContinuationManager activityContinuationsAreBeingTracked](self->_activityContinuationManager, "activityContinuationsAreBeingTracked"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__UIApplication__findBestActivityToMakeCurrent___block_invoke;
    block[3] = &unk_1E16B1B28;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __76__UIApplication_UIKitApplicationAccessibility___updateLargeTextNotification__block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_preferredFontSizeChange, (CFStringRef)*MEMORY[0x1E0DDE1B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)_systemAnimationFenceExemptQueue
{
  if (qword_1EDDC80B8 != -1)
    dispatch_once(&qword_1EDDC80B8, &__block_literal_global_831);
  return (id)qword_1EDDC80C0;
}

- (id)_systemAnimationFenceExemptQueue
{
  return +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
}

+ (id)stringForStatusBarStyle:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = CFSTR("UIStatusBarStyleDefault");
      break;
    case 1:
      result = CFSTR("UIStatusBarStyleLightContent");
      break;
    case 2:
      result = CFSTR("UIStatusBarStyleOpaqueBlack");
      break;
    case 3:
      result = CFSTR("UIStatusBarStyleDarkContent");
      break;
    default:
      if (a3 == 306)
        result = CFSTR("UIStatusBarStyleNewUILockScreen");
      else
        result = 0;
      break;
  }
  return result;
}

void __49__UIApplication__systemAnimationFenceExemptQueue__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D23258];
  v4[0] = *MEMORY[0x1E0C9B270];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queueWithMainRunLoopModes:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EDDC80C0;
  qword_1EDDC80C0 = v2;

}

- (void)cancelAllLocalNotifications
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllPendingNotificationRequests");

}

- (id)_discardedSceneSessionIdentifiersSinceLastRunWithContext:(id)a3 knownSessions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "persistedSceneIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v6, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "persistedSceneIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(v11, "minusSet:", v13);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v11;
}

- (void)_discardSceneSessionsWithPersistentIdentifiers:(id)a3 skippingPersistenceDeletion:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(v9, "count");
  v7 = v9;
  if (v6)
  {
    objc_msgSend(v9, "bs_map:", &__block_literal_global_2930);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _discardSceneSessions:](self, "_discardSceneSessions:", v8);
    if (!a4)
      +[_UICanvasUserActivityManager _deleteSceneSessionsWithPersistentIdentifiers:](_UICanvasUserActivityManager, "_deleteSceneSessionsWithPersistentIdentifiers:", v9);

    v7 = v9;
  }

}

- (UIUserNotificationSettings)currentUserNotificationSettings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = UIRemoteNotificationTypesFromUNNotificationSettings(v3);
  objc_msgSend(v4, "bs_map:", UNNotificationCategoryToUIUserNotificationCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIUserNotificationSettings settingsForTypes:categories:](UIUserNotificationSettings, "settingsForTypes:categories:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIUserNotificationSettings *)v7;
}

- (NSInteger)applicationIconBadgeNumber
{
  void *v2;
  void *v3;
  NSInteger v4;

  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setApplicationIconBadgeNumber:(NSInteger)applicationIconBadgeNumber
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIApplication currentUserNotificationSettings](self, "currentUserNotificationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "types");

    if ((v6 & 1) == 0)
    {
      +[UIUserNotificationSettings settingsForTypes:categories:](UIUserNotificationSettings, "settingsForTypes:categories:", 7, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplication registerUserNotificationSettings:](self, "registerUserNotificationSettings:", v7);

    }
  }
  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", applicationIconBadgeNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBadgeNumber:withCompletionHandler:", v8, 0);

}

- (void)_discardSceneSessions:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  v4 = objc_msgSend(v8, "count");
  v5 = v8;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__UIApplication_SessionAndConfigurationInternal___discardSceneSessions___block_invoke;
    v9[3] = &unk_1E16DDA90;
    v9[4] = self;
    v7 = v6;
    v10 = v7;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
    if ((*((_BYTE *)&self->_applicationFlags + 8) & 2) != 0 && objc_msgSend(v7, "count"))
      -[UIApplicationDelegate application:didDiscardSceneSessions:](self->_delegate, "application:didDiscardSceneSessions:", self, v7);

    v5 = v8;
  }

}

- (id)_connectUISceneFromFBSScene:(id)a3 transitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UISceneConfiguration *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UISceneConnectionOptions *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  int v38;
  UIApplication *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = a4;
  objc_msgSend(v6, "specification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uiSceneSessionRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleApplication"));
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));
  objc_msgSend(v6, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUIKitManaged");

  objc_msgSend(v6, "specification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isInternal");

  objc_msgSend(v6, "specification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v15, "allowsConfigurationByAppDelegate");

  if (!v12 || !v14 || !(v9 | v10))
    goto LABEL_4;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      goto LABEL_29;
    objc_msgSend(v6, "specification");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v36;
    v43 = 2112;
    v44 = v8;
    _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "Invalid scene specification. Internal scenes must also have a distinct UISceneSessionRole: specification: %@; role: %@",
      buf,
      0x16u);
LABEL_28:

LABEL_29:
    goto LABEL_4;
  }
  v33 = _connectUISceneFromFBSScene_transitionContext____s_category;
  if (!_connectUISceneFromFBSScene_transitionContext____s_category)
  {
    v33 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v33, (unint64_t *)&_connectUISceneFromFBSScene_transitionContext____s_category);
  }
  v34 = *(NSObject **)(v33 + 8);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = v34;
    objc_msgSend(v6, "specification");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v36;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "Invalid scene specification. Internal scenes must also have a distinct UISceneSessionRole: specification: %@; role: %@",
      buf,
      0x16u);
    goto LABEL_28;
  }
LABEL_4:
  +[UIScene _persistenceIdentifierForScene:](UIScene, "_persistenceIdentifierForScene:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _openSessionForPersistentIdentifier:](self, "_openSessionForPersistentIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v38 = v14;
  if (v17)
  {
    if (objc_msgSend(v17, "_configurationNeedsReevalulation"))
    {
      v19 = -[UISceneConfiguration initWithName:sessionRole:]([UISceneConfiguration alloc], "initWithName:sessionRole:", 0, v8);
      objc_msgSend(v18, "_updateConfiguration:", v19);

      v20 = 1;
    }
    else
    {
      v20 = 0;
    }
    v21 = v18;
  }
  else
  {
    v21 = -[UISceneSession _initWithPersistentIdentifier:sessionRole:configurationName:]([UISceneSession alloc], "_initWithPersistentIdentifier:sessionRole:configurationName:", v16, v8, 0);
    v20 = 0;
  }
  v39 = self;
  if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
  {
    objc_msgSend(v6, "specification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "actions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScene _connectionOptionsForScene:withSpecification:transitionContext:actions:sceneSession:](UIScene, "_connectionOptionsForScene:withSpecification:transitionContext:actions:sceneSession:", v6, v22, v40, v23, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "unprocessedActions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActions:", v25);

  }
  else
  {
    v24 = 0;
  }
  v26 = [UISceneConnectionOptions alloc];
  objc_msgSend(v6, "specification");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[UISceneConnectionOptions _initWithConnectionOptionsContext:fbsScene:specification:](v26, "_initWithConnectionOptionsContext:fbsScene:specification:", v24, v6, v27);

  v29 = v20 ^ 1;
  if (!v18)
    v29 = 0;
  if ((v29 & 1) == 0)
  {
    if (((v38 | v37 ^ 1) & 1) == 0 && (*((_BYTE *)&v39->_applicationFlags + 8) & 1) != 0)
    {
      -[UIApplicationDelegate application:configurationForConnectingSceneSession:options:](v39->_delegate, "application:configurationForConnectingSceneSession:options:", v39, v21, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        objc_msgSend(v21, "_updateConfiguration:", v30);

    }
    -[UIApplication _appendSessionToSessionSet:save:](v39, "_appendSessionToSessionSet:save:", v21, objc_msgSend(v6, "isPersistable"));
  }
  +[UIScene _sceneForFBSScene:create:withSession:connectionOptions:](UIScene, "_sceneForFBSScene:create:withSession:connectionOptions:", v6, 1, v21, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_openSessionForPersistentIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  if (qword_1EDDC8508 != -1)
    dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
  v4 = (void *)qword_1EDDC8500;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__UIApplication_SessionAndConfigurationInternal___openSessionForPersistentIdentifier___block_invoke;
  v10[3] = &unk_1E16DD608;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_configureLaunchOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  if (v3)
  {
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("__PPT_ForTesting"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      __IsRunningTests = objc_msgSend(v14, "forTesting");
    objc_msgSend(v5, "objectForKey:", CFSTR("__PPT_SignpostID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      __ActivationSignpostID = objc_msgSend(v14, "signpostID");
    objc_msgSend(v5, "objectForKey:", CFSTR("__PPT_LaunchMetricsPayload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v14, "launchMetricsPayload");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)__ActivationMetricsPayload;
      __ActivationMetricsPayload = v9;

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("__PPT_LaunchTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v14, "userLaunchEventTime");
      __LaunchTime = v12;
      objc_msgSend(v14, "execTime");
      __ExecOrResumeTime = v13;
    }
    byte_1EDDC7FF1 = objc_msgSend(v14, "safeMode");

    v3 = v14;
  }

}

+ (Class)_statusBarManagerClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityLoadSettingsLoaderIfNeeded
{
  if (pthread_main_np() == 1 && (_HasLoadedAccessibilitySettingsLoader & 1) == 0)
    objc_msgSend(a1, "_updateAccessibilitySettingsLoader");
}

+ (void)_updateAccessibilitySettingsLoader
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "_accessibilitySettingsBundle"), "principalClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "performSelector:withObject:", sel_update, 0);
  _HasLoadedAccessibilitySettingsLoader = 1;
}

+ (id)_accessibilitySettingsBundle
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", objc_msgSend((id)AXAccessibilityBundlesDirectory(), "stringByAppendingPathComponent:", CFSTR("AccessibilitySettingsLoader.bundle")));
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isLoaded") & 1) == 0 && (objc_msgSend(v3, "loadAndReturnError:", 0) & 1) == 0)
  {
    v4 = _accessibilitySettingsBundle___s_category;
    if (!_accessibilitySettingsBundle___s_category)
    {
      v4 = __UILogCategoryGetNode("Accessibility", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, &_accessibilitySettingsBundle___s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Could not load AccessibilitySettingsLoader bundle", v7, 2u);
    }
  }
  return v3;
}

- (id)textInputMode
{
  void *v2;
  void *v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPublicInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithExpirationHandler:(void *)handler
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(handler, 0);
}

void __61__UIApplication__observeDebugOrTestUserInterfaceStyleChanged__block_invoke(uint64_t a1)
{
  id v2;

  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__maybeEffectiveUserInterfaceStyleChanged, CFSTR("_UIDebugOrTestUserInterfaceStyleChangedNotification"), 0);

  }
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5
{
  -[UIApplication finishedTest:waitForCommit:extraResults:withTeardownBlock:](self, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", a3, a4, a5, 0);
}

- (void)_saveRestorationUserActivityStateForScene:(id)a3
{
  void *v3;
  char isKindOfClass;
  id v5;

  v5 = a3;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    +[_UICanvasUserActivityManager _saveRestorationStateForScene:](_UICanvasUserActivityManager, "_saveRestorationStateForScene:", v5);

}

- (void)_appendSessionToSessionSet:(id)a3 save:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  if (v4)
    +[_UICanvasUserActivityManager _updatePersistedSceneSession:](_UICanvasUserActivityManager, "_updatePersistedSceneSession:", v5);
  if (qword_1EDDC8508 != -1)
    dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
  objc_msgSend((id)qword_1EDDC8500, "addObject:");

}

- (void)activityContinuationManager:(id)a3 didUpdateUserActivity:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIApplicationDelegate application:didUpdateUserActivity:](self->_delegate, "application:didUpdateUserActivity:", self, v5);

}

- (void)_addResponder:(id)a3 forUserActivity:(id)a4
{
  -[UIActivityContinuationManager addResponder:document:forUserActivity:](self->_activityContinuationManager, "addResponder:document:forUserActivity:", a3, 0, a4);
}

- (id)_getActivityContinuationManager
{
  return self->_activityContinuationManager;
}

- (id)_hoverEventForWindow:(id)a3
{
  return -[UIEventEnvironment _hoverEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (void)setMinimumBackgroundFetchInterval:(NSTimeInterval)minimumBackgroundFetchInterval
{
  -[UISApplicationState _setMinimumBackgroundFetchInterval:](self->_appState, "_setMinimumBackgroundFetchInterval:", minimumBackgroundFetchInterval);
}

void __60__UIApplication_StateRestoration___doRestorationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "statusBarManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStatusBarAppearance");

}

uint64_t __43__UIApplication__appAdoptsUISceneLifecycle__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    byte_1EDDC7FF5 = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_accessibilityInit
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  __CFNotificationCenter *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[29];

  v31[28] = *MEMORY[0x1E0C80C00];
  if (!AXDisallowsUIBasedAccessibilityFeatures())
  {
    -[UIApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__accessibilitySetUpQuickSpeak, 0, 1.5);
    if (_AXSAccessibilityEnabled())
      objc_msgSend((id)objc_opt_class(), "_updateAccessibilitySettingsLoader");
    -[UIApplication _updateApplicationAccessibility](self, "_updateApplicationAccessibility");
    -[UIApplication _updateLargeTextNotification](self, "_updateLargeTextNotification");
    if ((_accessibilityInit_AccessibilityWasInitialized & 1) == 0)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_accessibilityStatusChanged, (CFStringRef)*MEMORY[0x1E0DDDF38], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_axPrefEnabledChange, (CFStringRef)*MEMORY[0x1E0DDE120], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v5 = *MEMORY[0x1E0DDE190];
      v31[0] = *MEMORY[0x1E0DDE308];
      v31[1] = v5;
      v6 = *MEMORY[0x1E0DDE150];
      v31[2] = *MEMORY[0x1E0DDE068];
      v31[3] = v6;
      v7 = *MEMORY[0x1E0DDE0D0];
      v31[4] = *MEMORY[0x1E0DDE0A0];
      v31[5] = v7;
      v8 = *MEMORY[0x1E0DDE210];
      v31[6] = *MEMORY[0x1E0DDE088];
      v31[7] = v8;
      v9 = *MEMORY[0x1E0DDE010];
      v31[8] = *MEMORY[0x1E0DDE078];
      v31[9] = v9;
      v10 = *MEMORY[0x1E0DDE278];
      v31[10] = *MEMORY[0x1E0DDE1D8];
      v31[11] = v10;
      v11 = *MEMORY[0x1E0DDDFF0];
      v31[12] = *MEMORY[0x1E0DDE238];
      v31[13] = v11;
      v12 = *MEMORY[0x1E0DDE208];
      v31[14] = *MEMORY[0x1E0DDE080];
      v31[15] = v12;
      v13 = *MEMORY[0x1E0DDE148];
      v31[16] = *MEMORY[0x1E0DDE220];
      v31[17] = v13;
      v14 = *MEMORY[0x1E0DDE228];
      v31[18] = *MEMORY[0x1E0DDE050];
      v31[19] = v14;
      v15 = *MEMORY[0x1E0DDE2E0];
      v31[20] = *MEMORY[0x1E0DDE2D8];
      v31[21] = v15;
      v16 = *MEMORY[0x1E0DDE0B0];
      v31[22] = *MEMORY[0x1E0DDE0A8];
      v31[23] = v16;
      v17 = *MEMORY[0x1E0DDE0B8];
      v31[24] = *MEMORY[0x1E0DDE128];
      v31[25] = v17;
      v18 = *MEMORY[0x1E0DDE058];
      v31[26] = *MEMORY[0x1E0DDDFE0];
      v31[27] = v18;
      v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 28);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v27;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v27 != v22)
              objc_enumerationMutation(v19);
            v24 = *(const __CFString **)(*((_QWORD *)&v26 + 1) + 8 * v23);
            v25 = CFNotificationCenterGetLocalCenter();
            CFNotificationCenterAddObserver(v25, self, (CFNotificationCallback)_axPrefEnabledChange, v24, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v21);
      }
      if (-[UIApplication _accessibilityApplicationIsSystemWideServer](self, "_accessibilityApplicationIsSystemWideServer"))
      {
        -[UIApplication _updateAccessibilityItunesSettings](self, "_updateAccessibilityItunesSettings");
      }
    }
    _accessibilityInit_AccessibilityWasInitialized = 1;
  }
}

- (void)_updateApplicationAccessibility
{
  int v3;
  int v4;
  objc_class *v5;

  v3 = _kUIAccessibilityEnabled;
  v4 = _AXSApplicationAccessibilityEnabled() != 0;
  _kUIAccessibilityEnabled = v4;
  if (v3 != v4)
  {
    v5 = -[UIApplication _accessibilityBundlePrincipalClass](self, "_accessibilityBundlePrincipalClass");
    if (_kUIAccessibilityEnabled)
    {
      if ((_updateApplicationAccessibility_StartedAccessibilityServer & 1) != 0)
      {
        -[objc_class _accessibilityReenabled](v5, "_accessibilityReenabled");
      }
      else
      {
        -[objc_class _accessibilityStartServer](v5, "_accessibilityStartServer");
        _updateApplicationAccessibility_StartedAccessibilityServer = 1;
      }
    }
    else
    {
      -[objc_class _accessibilityStopServer](v5, "_accessibilityStopServer");
    }
  }
}

- (BOOL)_accessibilityApplicationIsSystemWideServer
{
  return objc_msgSend(_UIMainBundleIdentifier(), "isEqualToString:", CFSTR("com.apple.springboard"));
}

- (void)_updateLargeTextNotification
{
  if (_updateLargeTextNotification_onceToken != -1)
    dispatch_once(&_updateLargeTextNotification_onceToken, &__block_literal_global_0);
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
  -[UIApplication setStatusBarStyle:animationParameters:](self, "setStatusBarStyle:animationParameters:", statusBarStyle, 0);
}

void __43__UIApplication__appAdoptsUISceneLifecycle__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "sceneConfigurations");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_446);

}

- (id)_infoPlistSceneConfigurations
{
  return -[_UIApplicationInfoParser sceneConfigurations](self->_appInfo, "sceneConfigurations");
}

- (id)_infoPlistCanvasDefinitions
{
  return -[_UIApplicationInfoParser canvasDefinitions](self->_appInfo, "canvasDefinitions");
}

- (id)_topMostViewController:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v4, "topViewController"), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v5 = v4;
        goto LABEL_9;
      }
      objc_msgSend(v4, "presentedViewController");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v6;
    -[UIApplication _topMostViewController:](a1, v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v5;
}

void __41__UIApplication__applicationNameForMenus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EDDC82D8;
  v34 = (id)v2;
  if (v2)
    v4 = qword_1EDDC82D8 == 0;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("cn"));

    if (v7)
    {
      objc_msgSend(v34, "objectForInfoDictionaryKey:", CFSTR("CFBundleName#CH"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copyWithZone:", 0);
      v10 = (void *)qword_1EDDC82D8;
      qword_1EDDC82D8 = v9;

      objc_msgSend(*(id *)(a1 + 32), "_sanitizeBundleString:", qword_1EDDC82D8);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)qword_1EDDC82D8;
      qword_1EDDC82D8 = v11;

    }
    v3 = (void *)qword_1EDDC82D8;
    if (!qword_1EDDC82D8)
    {
      objc_msgSend(v34, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copyWithZone:", 0);
      v15 = (void *)qword_1EDDC82D8;
      qword_1EDDC82D8 = v14;

      objc_msgSend(*(id *)(a1 + 32), "_sanitizeBundleString:", qword_1EDDC82D8);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)qword_1EDDC82D8;
      qword_1EDDC82D8 = v16;

      v3 = (void *)qword_1EDDC82D8;
      if (!qword_1EDDC82D8)
      {
        objc_msgSend(v34, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "copyWithZone:", 0);
        v20 = (void *)qword_1EDDC82D8;
        qword_1EDDC82D8 = v19;

        objc_msgSend(*(id *)(a1 + 32), "_sanitizeBundleString:", qword_1EDDC82D8);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)qword_1EDDC82D8;
        qword_1EDDC82D8 = v21;

        v3 = (void *)qword_1EDDC82D8;
        if (!qword_1EDDC82D8)
        {
          objc_msgSend(v34, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE70]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "copyWithZone:", 0);
          v25 = (void *)qword_1EDDC82D8;
          qword_1EDDC82D8 = v24;

          objc_msgSend(*(id *)(a1 + 32), "_sanitizeBundleString:", qword_1EDDC82D8);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)qword_1EDDC82D8;
          qword_1EDDC82D8 = v26;

          v3 = (void *)qword_1EDDC82D8;
          if (!qword_1EDDC82D8)
          {
            objc_msgSend(v34, "objectForInfoDictionaryKey:", CFSTR("NSExecutable"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "copyWithZone:", 0);
            v30 = (void *)qword_1EDDC82D8;
            qword_1EDDC82D8 = v29;

            objc_msgSend(*(id *)(a1 + 32), "_sanitizeBundleString:", qword_1EDDC82D8);
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = (void *)qword_1EDDC82D8;
            qword_1EDDC82D8 = v31;

            v3 = (void *)qword_1EDDC82D8;
          }
        }
      }
    }
  }
  if (!objc_msgSend(v3, "length"))
  {
    v33 = (void *)qword_1EDDC82D8;
    qword_1EDDC82D8 = (uint64_t)CFSTR("<unknown>");

  }
}

+ (id)_sanitizeBundleString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {

LABEL_4:
    v5 = 0;
  }

  return v5;
}

uint64_t __45__UIApplication__supportsIndirectInputEvents__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _UIApplicationSupportsIndirectInputEventsGivenInfo(*(void **)(*(_QWORD *)(a1 + 32) + 232));
  byte_1EDDC8015 = result;
  return result;
}

- (void)_deliverRemainingKeyUpEvents
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (id *)-[_UIKeyboardHIDEventOrderedDescriptorSet copy](self->_physicalKeycodeSet, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UIKeyboardHIDEventOrderedDescriptorSet events](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        CFRetain(v10);
        mach_absolute_time();
        IOHIDEventSetTimeStamp();
        IOHIDEventSetIntegerValue();
        -[UIApplication _handleKeyHIDEvent:usingSyntheticEvent:](self, "_handleKeyHIDEvent:usingSyntheticEvent:", v10, 1);
        CFRelease(v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_UIKeyboardHIDEventOrderedDescriptorSet removeAllEvents](&self->_physicalKeycodeSet->super.isa);
}

- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__UIApplication_UIApplicationTesting__finishedTest_waitForCommit_extraResults_withTeardownBlock___block_invoke;
    v13[3] = &unk_1E16B4420;
    v13[4] = self;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    -[UIApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v13);

  }
  else
  {
    -[UIApplication finishedTest:extraResults:waitForNotification:withTeardownBlock:](self, "finishedTest:extraResults:waitForNotification:withTeardownBlock:", v10, v11, 0, v12);
  }

}

- (void)installCACommitCompletionBlock:(id)a3
{
  CFRunLoopObserverRef v3;
  __CFRunLoopObserver *v4;
  __CFRunLoop *Current;
  void *info;
  CFRunLoopObserverContext context;

  context.version = 0;
  context.info = _Block_copy(a3);
  memset(&context.retain, 0, 24);
  v3 = CFRunLoopObserverCreate(0, 0x20uLL, 0, 2000001, (CFRunLoopObserverCallBack)__UIRunLoopObserverTrampoline, &context);
  if (v3)
  {
    v4 = v3;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    info = v4;
  }
  else
  {
    info = context.info;
  }
  CFRelease(info);
}

void __43__UIApplication_setReceivesMemoryWarnings___block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  void *v3;
  _QWORD handler[5];

  v2 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
  v3 = (void *)qword_1EDDC82A8;
  qword_1EDDC82A8 = (uint64_t)v2;

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__UIApplication_setReceivesMemoryWarnings___block_invoke_2;
  handler[3] = &unk_1E16B1B28;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1EDDC82A8, handler);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 179) & 0x20) != 0)
    dispatch_resume((dispatch_object_t)qword_1EDDC82A8);
}

- (int)_loadMainStoryboardFileNamed:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id storyboardInitialMenu;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  unint64_t v22;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v14 = qword_1EDDC8218;
    if (!qword_1EDDC8218)
    {
      v14 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1EDDC8218);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)v24 = 138412290;
    *(_QWORD *)&v24[4] = v6;
    v16 = "Failed to load UIMainStoryboardFile %@.";
    goto LABEL_18;
  }
  if (!self->_storyboardInitialMenu)
  {
    objc_msgSend(v7, "_instantiateInitialMenu");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    storyboardInitialMenu = self->_storyboardInitialMenu;
    self->_storyboardInitialMenu = v9;

  }
  objc_msgSend(v8, "instantiateInitialViewController");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UIApplicationDelegate window](self->_delegate, "window");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_30;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = -[UIApplication _newDefaultStoryboardWindow](self, "_newDefaultStoryboardWindow");
        -[UIApplicationDelegate setWindow:](self->_delegate, "setWindow:", v13);
LABEL_30:
        objc_msgSend(v13, "setRootViewController:", v12, *(_QWORD *)v24);

        v18 = 1;
        goto LABEL_31;
      }
      v22 = qword_1EDDC8200;
      if (!qword_1EDDC8200)
      {
        v22 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1EDDC8200);
      }
      v20 = *(NSObject **)(v22 + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        v13 = 0;
        goto LABEL_30;
      }
      *(_WORD *)v24 = 0;
      v21 = "The app delegate must implement the window property if it wants to use a main storyboard file.";
    }
    else
    {
      v19 = qword_1EDDC8208;
      if (!qword_1EDDC8208)
      {
        v19 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1EDDC8208);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      *(_WORD *)v24 = 0;
      v21 = "There is no app delegate set. An app delegate class must be specified to use a main storyboard file.";
    }
    _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, v21, v24, 2u);
    goto LABEL_29;
  }
  v17 = qword_1EDDC8210;
  if (!qword_1EDDC8210)
  {
    v17 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v17, (unint64_t *)&qword_1EDDC8210);
  }
  v15 = *(NSObject **)(v17 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v24 = 138412290;
    *(_QWORD *)&v24[4] = v6;
    v16 = "Failed to instantiate the default view controller for UIMainStoryboardFile '%@' - perhaps the designated entry"
          " point is not set?";
LABEL_18:
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, v16, v24, 0xCu);
  }
LABEL_19:
  v18 = 2;
LABEL_31:

  return v18;
}

- (int64_t)_carefulChoiceOrientation
{
  if ((*((_BYTE *)&self->_applicationFlags + 13) & 8) != 0)
    return -[UIApplication _safeInterfaceOrientationForNoWindow](self, "_safeInterfaceOrientationForNoWindow");
  else
    return -[UIApplication _frontMostAppOrientation](self, "_frontMostAppOrientation");
}

- (id)_newDefaultStoryboardWindow
{
  UIWindow *v3;
  id v4;

  if (dyld_program_sdk_at_least())
    return objc_alloc_init(UIWindow);
  v3 = [UIWindow alloc];
  v4 = -[UIWindow _initWithOrientation:](v3, "_initWithOrientation:", objc_msgSend((id)UIApp, "_safeInterfaceOrientationForNoWindow"));
  objc_msgSend(v4, "setResizesToFullScreen:", 1);
  objc_msgSend(v4, "_resizeWindowToFullScreenIfNecessary");
  return v4;
}

- (int64_t)_testOrientation:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Portrait")) & 1) != 0)
    {
LABEL_3:
      v9 = 1;
      goto LABEL_11;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Landscape")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("LandscapeRight")) & 1) != 0)
    {
      goto LABEL_10;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LandscapeLeft")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PortraitUpsideDown")) & 1) != 0)
    {
      v9 = 2;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("current")))
      {
        NSLog(CFSTR("Unsupported value for test option 'orientation': %@"), v8);
        goto LABEL_3;
      }
      v9 = objc_msgSend((id)UIApp, "_safeInterfaceOrientationForNoWindow");
    }
  }
  else
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("Landscape")) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_10:
      v9 = 3;
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("resize")))
      v9 = 3;
    else
      v9 = 1;
  }
LABEL_11:
  if (!-[UIApplication _isSupportedOrientation:](self, "_isSupportedOrientation:", v9))
  {
    do
    {
      if (v9 <= 3)
        ++v9;
      else
        v9 = 1;
    }
    while (!-[UIApplication _isSupportedOrientation:](self, "_isSupportedOrientation:", v9));
  }

  return v9;
}

- (int64_t)_safeInterfaceOrientationForNoWindow
{
  return -[UIApplication _safeInterfaceOrientationForWindowIfExists:expectNonNilWindow:](self, "_safeInterfaceOrientationForWindowIfExists:expectNonNilWindow:", 0, 0);
}

- (BOOL)_isSupportedOrientation:(int64_t)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend((id)UIApp, "supportedInterfaceOrientationsForWindow:", 0);
  switch(a3)
  {
    case 0:
      v5 = v4 & 1;
      v6 = 1;
      break;
    case 1:
      v5 = v4 & 2;
      v6 = 2;
      break;
    case 2:
      v5 = v4 & 4;
      v6 = 4;
      break;
    case 3:
      v5 = v4 & 8;
      v6 = 8;
      break;
    case 4:
      v5 = v4 & 0x10;
      v6 = 16;
      break;
    default:
      v5 = 0;
      v6 = 0;
      break;
  }
  return v5 == v6;
}

- (void)_callInitializationDelegatesWithActions:(id)a3 forCanvas:(id)a4 payload:(id)a5 fromOriginatingProcess:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  NSMutableSet *actionsPendingInitialization;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  UIOpenURLAction *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(void *, void *, const __CFString *);
  void *v39;
  void (**v40)(uint64_t, void *);
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIEventAttribution *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t applicationFlags;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  int v77;
  void *v78;
  void *v79;
  char v80;
  unsigned int v81;
  id v82;
  _BOOL4 v83;
  void *v84;
  id v85;
  int v86;
  id v87;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD aBlock[5];
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _QWORD v118[8];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v85 = a3;
  v82 = a4;
  v9 = a5;
  v87 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v85);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", self->_actionsPendingInitialization);
  actionsPendingInitialization = self->_actionsPendingInitialization;
  self->_actionsPendingInitialization = 0;

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
  if (v14)
  {
    v97 = 0;
    v98 = 0;
    v93 = 0;
    v94 = 0;
    v89 = 0;
    v90 = 0;
    v95 = 0;
    v96 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v91 = 0;
    v15 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v114 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "UIActionType");
        switch(v18)
        {
          case 1:
            if (v91)
              goto LABEL_29;
            v91 = v17;
            continue;
          case 2:
          case 4:
          case 7:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 15:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 24:
          case 25:
            goto LABEL_29;
          case 3:
            if (v95)
              goto LABEL_29;
            v95 = v17;
            break;
          case 5:
            objc_msgSend(v17, "sessionIdentifier");
            v21 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObject:", v17);
            v98 = (void *)v21;
            continue;
          case 6:
            if (v93)
              goto LABEL_29;
            objc_msgSend(v9, "objectForKey:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
            {
              objc_msgSend(v87, "bundleIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:](self->_activityContinuationManager, "activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:", v17, v23, v87);
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            break;
          case 8:
            v20 = v17;

            v101 = v20;
            continue;
          case 14:
            v22 = v17;

            v99 = v22;
            continue;
          case 16:
            v19 = v17;

            v100 = v19;
            continue;
          case 17:
            if (v94)
              goto LABEL_29;
            v94 = v17;
            break;
          case 23:
            if (v96)
              goto LABEL_29;
            objc_msgSend(v17, "shareMetadata");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 26:
            objc_msgSend(v10, "addObject:", v17);
            if (!v97)
            {
              if (objc_msgSend(v17, "isDefaultAction"))
                v97 = v17;
              else
                v97 = 0;
            }
            continue;
          case 27:
            if (v90)
              goto LABEL_29;
            v90 = v17;
            break;
          default:
            if (v18 == 43 && !v89)
              v89 = v17;
            else
LABEL_29:
              objc_msgSend(v10, "addObject:", v17);
            break;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
    }
    while (v14);

    v24 = v91;
    if (v91)
      goto LABEL_48;
  }
  else
  {

    v100 = 0;
    v101 = 0;
    v98 = 0;
    v99 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v89 = 0;
    v90 = 0;
    v93 = 0;
    v94 = 0;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("UIApplicationLaunchOptionsURLKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25
    || (v26 = [UIOpenURLAction alloc],
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v25, 0),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = -[UISOpenURLAction initWithURL:](v26, "initWithURL:", v27),
        v27,
        v25,
        !v28))
  {
    v92 = 0;
    v30 = 1;
    goto LABEL_50;
  }
  v24 = (void *)v28;
LABEL_48:
  v92 = v24;
  objc_msgSend(v24, "url");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _setHandlingURL:url:](self, "_setHandlingURL:url:", objc_msgSend(v29, "isInternalUIKitURL") ^ 1, v29);

  v30 = 0;
LABEL_50:
  v107 = 0;
  v108 = &v107;
  v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__161;
  v111 = __Block_byref_object_dispose__161;
  v112 = 0;
  v80 = v30;
  if ((v30 & 1) == 0 && (*((_BYTE *)&self->_applicationFlags + 4) & 8) == 0)
  {
    v31 = (void *)MEMORY[0x1E0C99E08];
    v32 = v92;
    objc_msgSend(v31, "dictionaryWithDictionary:", v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeObjectForKey:", CFSTR("UIApplicationLaunchOptionsURLKey"));
    objc_msgSend(v32, "url");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "searchResultIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v33, "setValue:forKey:", v35, CFSTR("UIApplicationLaunchOptionsSearchResultIdentifierKey"));
      objc_msgSend(v34, "searchResultDomain");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v33, "setValue:forKey:", v36, CFSTR("UIApplicationLaunchOptionsSearchResultDomainKey"));

    }
    else
    {
      objc_msgSend(v33, "setValue:forKey:", v34, CFSTR("UIApplicationLaunchOptionsURLKey"));
    }

    v37 = (void *)v108[5];
    v108[5] = (uint64_t)v33;

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__UIApplication__callInitializationDelegatesWithActions_forCanvas_payload_fromOriginatingProcess___block_invoke;
  aBlock[3] = &unk_1E16B61C8;
  aBlock[4] = &v107;
  v38 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  if (v97)
  {
    if (objc_msgSend(v97, "isLocal"))
    {
      objc_msgSend(v97, "response");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
      objc_msgSend(v39, "notification");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2]((uint64_t)v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v38[2](v38, v42, CFSTR("UIApplicationLaunchOptionsLocalNotificationKey"));
    }
    else
    {
      if (!objc_msgSend(v97, "isRemote"))
        goto LABEL_64;
      objc_msgSend(v97, "response");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "notification");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "request");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "content");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "userInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v38[2](v38, v42, CFSTR("UIApplicationLaunchOptionsRemoteNotificationKey"));
    }

  }
LABEL_64:
  v38[2](v38, v93, CFSTR("UIApplicationLaunchOptionsUserActivityDictionaryKey"));
  objc_msgSend(v95, "payload");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2](v38, v46, CFSTR("UIApplicationLaunchOptionsRemoteNotificationKey"));

  objc_msgSend(v101, "payload");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2](v38, v47, CFSTR("UIApplicationLaunchOptionsSiriTaskKey"));

  v38[2](v38, v98, CFSTR("UIApplicationLaunchOptionsURLSessionKey"));
  v38[2](v38, v96, CFSTR("UIApplicationLaunchOptionsCloudKitShareMetadataKey"));
  objc_msgSend(v94, "uiShortcutItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2](v38, v48, CFSTR("UIApplicationLaunchOptionsShortcutItemKey"));

  objc_msgSend(v9, "objectForKey:", CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[UIEventAttribution initWithUISClickAttribution:]([UIEventAttribution alloc], "initWithUISClickAttribution:", v84);
  v38[2](v38, v49, CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));

  v118[0] = CFSTR("UIApplicationLaunchOptionsSourceApplicationKey");
  v118[1] = CFSTR("UIApplicationLaunchOptionsNewsstandDownloadsKey");
  v118[2] = CFSTR("UIApplicationLaunchOptionsBluetoothCentralsKey");
  v118[3] = CFSTR("UIApplicationLaunchOptionsBluetoothPeripheralsKey");
  v118[4] = CFSTR("UIApplicationLaunchOptionsDeletedFamilyContentKey");
  v118[5] = CFSTR("UIApplicationLaunchOptionsBrowserReuseTabKey");
  v118[6] = CFSTR("UIApplicationLaunchOptionsAppLinkOpenStrategyChangedKey");
  v118[7] = CFSTR("_UIApplicationLaunchOptionsOpenAsDownload");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 8);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v103 != v52)
          objc_enumerationMutation(v50);
        v54 = *(const __CFString **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKey:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2](v38, v55, v54);

      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
    }
    while (v51);
  }

  objc_msgSend(v9, "objectForKey:", CFSTR("CLLaunchOptionsLocation"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = (void *)v108[5];
    if (v57)
    {
      objc_msgSend(v57, "removeObjectForKey:", CFSTR("CLLaunchOptionsLocation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)v108[5];
      v108[5] = v58;

    }
    v60 = (void *)v108[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setValue:forKey:", v61, CFSTR("UIApplicationLaunchOptionsLocationKey"));

  }
  +[FBSSceneTransitionContext transitionContext](UIApplicationSceneTransitionContext, "transitionContext");
  v62 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v62, "setActions:", v85);
  objc_msgSend((id)v62, "setPayload:", v9);
  objc_msgSend((id)v62, "setOriginatingProcess:", v87);
  -[UIApplication registerPlatformSpecificLaunchOptions:transitionContext:](self, "registerPlatformSpecificLaunchOptions:transitionContext:", v38, v62);
  v79 = (void *)v62;
  applicationFlags = (uint64_t)self->_applicationFlags;
  LODWORD(v62) = objc_msgSend((id)objc_opt_class(), "_isSystemUIService");
  v83 = -[UIApplication isSuspended](self, "isSuspended");
  v81 = v62 ^ 1;
  if ((applicationFlags & 0x180000) != 0)
  {
    v64 = 0;
    v86 = 1;
    if ((applicationFlags & 0x80000) != 0)
      goto LABEL_97;
    goto LABEL_89;
  }
  if (v83)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      kdebug_trace();
      -[UIApplicationDelegate application:didFinishLaunchingSuspendedWithOptions:](self->_delegate, "application:didFinishLaunchingSuspendedWithOptions:", self, v108[5]);
      kdebug_trace();
      v86 = 1;
      v65 = 1310720;
      v64 = 1;
LABEL_84:
      v66 = *((_QWORD *)&self->_applicationFlags + 1);
      *(_QWORD *)&self->_applicationFlags |= v65;
      *((_QWORD *)&self->_applicationFlags + 1) = v66;
      goto LABEL_89;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIApplication performSelector:withObject:](self, "performSelector:withObject:", sel_applicationDidFinishLaunchingSuspended_, self);
      v64 = 0;
      v86 = 1;
      v65 = 1310720;
      goto LABEL_84;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v86 = -[UIApplication _handleDelegateCallbacksWithOptions:isSuspended:restoreState:](self, "_handleDelegateCallbacksWithOptions:isSuspended:restoreState:", v108[5], v83, v81);
    v81 = 0;
    v64 = 1;
    goto LABEL_89;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v86 = -[UIApplication _handleDelegateCallbacksWithOptions:isSuspended:restoreState:](self, "_handleDelegateCallbacksWithOptions:isSuspended:restoreState:", v108[5], v83, v81);
    v81 = 0;
    v64 = 0;
    goto LABEL_89;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!-[UIApplication _hasStoryboard](self, "_hasStoryboard"))
      *((_QWORD *)&self->_applicationFlags + 1) |= 0x10000000uLL;
    v86 = -[UIApplication application:didFinishLaunchingWithOptions:](self, "application:didFinishLaunchingWithOptions:", self, v108[5]);
    if (v83)
      -[UIApplication applicationWillSuspend](self, "applicationWillSuspend");
    v64 = 0;
LABEL_170:
    v65 = 0x80000;
    goto LABEL_84;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!-[UIApplication _hasStoryboard](self, "_hasStoryboard"))
      *((_QWORD *)&self->_applicationFlags + 1) |= 0x10000000uLL;
    -[UIApplication performSelector:withObject:](self, "performSelector:withObject:", sel_applicationDidFinishLaunching_);
    if (v83)
      -[UIApplication applicationWillSuspend](self, "applicationWillSuspend");
    v64 = 0;
    v86 = 1;
    goto LABEL_170;
  }
  v64 = 0;
  v86 = 1;
LABEL_89:
  if (-[UIApplication _hasStoryboard](self, "_hasStoryboard"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIApplicationDelegate window](self->_delegate, "window");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "isHidden");

      if (v68)
      {
        *(_QWORD *)&self->_applicationFlags &= ~0x80000uLL;
        -[UIApplicationDelegate window](self->_delegate, "window");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "makeKeyAndVisible");

        *(_QWORD *)&self->_applicationFlags |= 0x80000uLL;
      }
    }
  }
  if (v81 && -[UIApplication _doRestorationIfNecessary](self, "_doRestorationIfNecessary"))
    _decrementRestorationMarkerCount(self, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "postNotificationName:object:userInfo:", CFSTR("UIApplicationDidFinishLaunchingNotification"), self, v108[5]);

  -[UIEventFetcher setEventFetcherSink:]((uint64_t)self->_eventFetcher, self->_eventDispatcher);
LABEL_97:
  +[UIWindow _executeDeferredOrientationUpdates]();
  if (v83)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "postNotificationName:object:userInfo:", CFSTR("UIApplicationSuspendedNotification"), self, 0);

  }
  if ((v80 & 1) == 0)
  {
    if (v86)
    {
      v72 = v87;
      if (!v72)
      {
        objc_msgSend(v92, "workspaceOriginatingProcess");
        v72 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[UIApplication _applicationOpenURLAction:payload:origin:](self, "_applicationOpenURLAction:payload:origin:", v92, v9, v72);

    }
    -[UIApplication _setHandlingURL:url:](self, "_setHandlingURL:url:", 0, 0);
  }
  if (v101)
  {
    objc_msgSend(v101, "payload");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _applicationHandleSiriTask:](self, "_applicationHandleSiriTask:", v73);

  }
  if (v99)
    -[UIApplication _applicationHandleWatchKitRequest:](self, "_applicationHandleWatchKitRequest:", v99);
  if (v90)
    -[UIApplication _applicationHandleIntentForwardingAction:](self, "_applicationHandleIntentForwardingAction:", v90);
  if (v89)
    -[UIApplication _applicationHandleLinkConnectionAction:](self, "_applicationHandleLinkConnectionAction:", v89);
  if (v100)
    -[UIApplication _setSystemNavigationAction:](self, "_setSystemNavigationAction:", v100);
  if (v93)
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Checking to see if we should ask application delegate to open activity"), "-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:]");
    if (v86)
    {
      -[UIActivityContinuationManager handleActivityContinuation:isSuspended:](self->_activityContinuationManager, "handleActivityContinuation:isSuspended:", v93, v83);
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(CFSTR("%s: Application delegate returned NO from willFinishLaunching or didFinishLaunching, not asking to open activity"), "-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:]");
    }
  }
  if (v97)
  {
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "delegate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (!objc_msgSend(v97, "isLocal"))
      {
        if (!objc_msgSend(v97, "isRemote"))
          goto LABEL_132;
        if (!v64 || (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend(v97, "canSendResponse"))
            objc_msgSend(v97, "sendResponse:", 0);
          goto LABEL_132;
        }
        goto LABEL_126;
      }
      if ((v64 & 1) != 0)
LABEL_126:
        objc_msgSend(v10, "removeObject:", v97);
    }
LABEL_132:

  }
  if (v95)
  {
    if (v64 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      if (objc_msgSend(v95, "canSendResponse"))
      {
        objc_msgSend(MEMORY[0x1E0DC5BC0], "responseWithResult:", 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "sendResponse:", v78);

      }
    }
    else
    {
      objc_msgSend(v10, "addObject:", v95);
    }
  }
  if (v94)
    v76 = v86;
  else
    v76 = 0;
  if (v76 == 1)
    -[UIApplication _handleApplicationShortcutAction:onWindowScene:](self, "_handleApplicationShortcutAction:onWindowScene:", v94, v82);
  if (v96)
    v77 = v86;
  else
    v77 = 0;
  if (v77 == 1)
  {
    NSLog(CFSTR("%s: Handling CloudKit Share Action with metadata: %@"), "-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:]", v96);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIApplicationDelegate application:userDidAcceptCloudKitShareWithMetadata:](self->_delegate, "application:userDidAcceptCloudKitShareWithMetadata:", self, v96);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIApplicationDelegate application:userAcceptedCloudKitShareWithMetadata:](self->_delegate, "application:userAcceptedCloudKitShareWithMetadata:", self, v96);
    }
  }
  -[UIApplication _handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:](self, "_handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:", v10, 0, 0, 0);
  if ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) == 0
    && (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
  {
    -[UIApplication _checkActivityContinuationAndBecomeCurrentIfNeeded](self, "_checkActivityContinuationAndBecomeCurrentIfNeeded");
  }

  _Block_object_dispose(&v107, 8);
}

void __98__UIApplication__callInitializationDelegatesWithActions_forCanvas_payload_fromOriginatingProcess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "setValue:forKey:", v10, v5);
  }

}

- (BOOL)_appAdoptsUICanvasLifecycle
{
  return *((unsigned __int8 *)&self->_applicationFlags + 7) >> 7;
}

- (void)_handleNonLaunchSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  UIApplicationDelegate *delegate;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  UIApplicationDelegate *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIApplicationDelegate *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  void *v81;
  void *v82;
  UIApplicationDelegate *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void (**v88)(uint64_t, void *);
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void (**v98)(uint64_t, void *);
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  UISceneSession *v103;
  void *v104;
  UISceneSession *v105;
  void *v106;
  uint64_t v107;
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  UISceneConnectionOptions *v116;
  void *v117;
  id v118;
  UIApplicationDelegate *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  UIApplicationDelegate *v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void (**v143)(uint64_t, void *);
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  UIApplicationDelegate *v150;
  void *v151;
  uint64_t v152;
  id v153;
  void *v154;
  NSMutableArray *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  int v162;
  unint64_t v163;
  int v164;
  uint64_t v165;
  void *v166;
  id v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  UIApplicationDelegate *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  UIApplicationDelegate *v185;
  void *v186;
  UIApplication *v187;
  id v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _QWORD v200[4];
  id v201;
  _QWORD v202[4];
  id v203;
  _QWORD v204[4];
  id v205;
  _QWORD v206[6];
  id v207;
  _QWORD v208[6];
  id v209;
  _QWORD v210[6];
  id v211;
  _QWORD v212[6];
  id v213;
  _QWORD v214[6];
  id v215;
  _QWORD v216[5];
  _QWORD v217[6];
  id v218;
  id v219;
  _QWORD v220[5];
  id v221;
  id v222;
  _QWORD v223[5];
  id v224;
  id v225;
  _QWORD v226[5];
  id v227;
  id v228;
  _QWORD v229[6];
  id v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  _BYTE v239[128];
  _BYTE v240[128];
  const __CFString *v241;
  uint64_t v242;
  const __CFString *v243;
  uint64_t v244;
  _BYTE v245[128];
  _BYTE v246[128];
  uint64_t v247;

  v247 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v177 = v10;
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originatingProcess");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_internalApplicationBSActionHandlers && objc_msgSend(v9, "count"))
  {
    v238 = 0u;
    v237 = 0u;
    v236 = 0u;
    v235 = 0u;
    v13 = self->_internalApplicationBSActionHandlers;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v235, v246, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v236;
LABEL_5:
      v17 = 0;
      v18 = v9;
      while (1)
      {
        if (*(_QWORD *)v236 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v235 + 1) + 8 * v17), "_respondToApplicationActions:fromTransitionContext:", v18, v11);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v9, "count"))
          break;
        ++v17;
        v18 = v9;
        if (v15 == v17)
        {
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v235, v246, 16);
          if (v15)
            goto LABEL_5;
          break;
        }
      }
    }

  }
  v176 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v231 = 0u;
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v231, v245, 16);
  if (!v20)
    goto LABEL_186;
  v21 = v20;
  v22 = *(_QWORD *)v232;
  v174 = v11;
  v175 = v12;
  v187 = self;
  v179 = v19;
  v191 = *(_QWORD *)v232;
LABEL_14:
  v23 = 0;
  v190 = v21;
  while (2)
  {
    if (*(_QWORD *)v232 != v22)
      objc_enumerationMutation(v19);
    v24 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * v23);
    switch(objc_msgSend(v24, "UIActionType"))
    {
      case 2:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          delegate = self->_delegate;
          v229[0] = MEMORY[0x1E0C809B0];
          v229[1] = 3221225472;
          v229[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke;
          v229[3] = &unk_1E16DD5E0;
          v229[4] = v24;
          v229[5] = self;
          v230 = v12;
          _UIAutologgingBackgroundFetchBlock(CFSTR("Warning: Application delegate received call to -application:performFetchWithCompletionHandler: but the completion handler was never called."), v229);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:performFetchWithCompletionHandler:](delegate, "application:performFetchWithCompletionHandler:", self, v26);

        }
        else if (objc_msgSend(v24, "canSendResponse"))
        {
          objc_msgSend(MEMORY[0x1E0DC5BC0], "responseWithResult:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sendResponse:", v36);
          goto LABEL_77;
        }
        goto LABEL_181;
      case 3:
        v37 = v24;
        if (!self->_applicationPushRegistry)
          -[UIApplication registerForRemoteNotifications](self, "registerForRemoteNotifications");
        objc_msgSend(MEMORY[0x1E0CD22F8], "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "payload");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v226[0] = MEMORY[0x1E0C809B0];
        v226[1] = 3221225472;
        v226[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_4;
        v226[3] = &unk_1E16B47A8;
        v226[4] = self;
        v227 = v37;
        v228 = v12;
        v40 = v37;
        objc_msgSend(v38, "remoteUserNotificationPayloadReceived:completionHandler:", v39, v226);

        goto LABEL_181;
      case 4:
        v41 = v24;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend((id)UIApp, "applicationState");
          -[UIApplicationDelegate methodForSelector:](self->_delegate, "methodForSelector:", sel_application_handleActionWithIdentifier_forRemoteNotification_completionHandler_);
          entr_act_modify();
          v42 = self->_delegate;
          objc_msgSend(v41, "action");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "payload");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "userResponse");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v223[0] = MEMORY[0x1E0C809B0];
          v223[1] = 3221225472;
          v223[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_7;
          v223[3] = &unk_1E16B47A8;
          v223[4] = self;
          v224 = v41;
          v225 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler: but the completion handler was never called."), v223);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:](v42, "application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:", self, v43, v44, v45, v46);

          v19 = v179;
          v21 = v190;

          v22 = v191;
          v47 = v224;
LABEL_86:

          goto LABEL_87;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v83 = self->_delegate;
          objc_msgSend(v41, "action");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "payload");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v220[0] = MEMORY[0x1E0C809B0];
          v220[1] = 3221225472;
          v220[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_8;
          v220[3] = &unk_1E16B47A8;
          v220[4] = self;
          v221 = v41;
          v222 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:completionHandler: but the completion handler was never called."), v220);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:handleActionWithIdentifier:forRemoteNotification:completionHandler:](v83, "application:handleActionWithIdentifier:forRemoteNotification:completionHandler:", self, v84, v85, v86);

          v21 = v190;
          v22 = v191;

          v47 = v221;
          goto LABEL_86;
        }
        if (objc_msgSend(v41, "canSendResponse"))
          objc_msgSend(v41, "sendResponse:", 0);
LABEL_87:

LABEL_181:
        if (++v23 != v21)
          continue;
        v152 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v231, v245, 16);
        v21 = v152;
        if (v152)
          goto LABEL_14;
LABEL_186:

        v153 = v176;
        v154 = v153;
        if (self->_applicationBSActionHandlers)
        {
          v154 = v153;
          if (objc_msgSend(v153, "count"))
          {
            v194 = 0u;
            v195 = 0u;
            v192 = 0u;
            v193 = 0u;
            v155 = self->_applicationBSActionHandlers;
            v156 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v192, v239, 16);
            v154 = v153;
            if (v156)
            {
              v157 = v156;
              v158 = *(_QWORD *)v193;
              v154 = v153;
LABEL_190:
              v159 = 0;
              v160 = v154;
              while (1)
              {
                if (*(_QWORD *)v193 != v158)
                  objc_enumerationMutation(v155);
                objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * v159), "_respondToApplicationActions:fromTransitionContext:", v160, v11);
                v154 = (void *)objc_claimAutoreleasedReturnValue();

                if (!objc_msgSend(v154, "count"))
                  break;
                ++v159;
                v160 = v154;
                if (v157 == v159)
                {
                  v157 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v192, v239, 16);
                  if (v157)
                    goto LABEL_190;
                  break;
                }
              }
            }

          }
        }
        if (objc_msgSend(v154, "count"))
          -[UIApplication _handlePlatformSpecificActions:forScene:withTransitionContext:](self, "_handlePlatformSpecificActions:forScene:withTransitionContext:", v154, v177, v11);
        v161 = *((_QWORD *)&self->_applicationFlags + 1);
        v162 = objc_msgSend(v11, "shouldTakeKeyboardFocus");
        v163 = *((_QWORD *)&self->_applicationFlags + 1);
        v164 = v162 | (v163 >> 42) & 1;
        v165 = 0x40000000000;
        if (!v164)
          v165 = 0;
        *((_QWORD *)&self->_applicationFlags + 1) = v165 | v163 & 0xFFFFFBFFFFFFFFFFLL;
        if ((v161 & 0x40000000000) == 0 && v164)
        {
          +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "restorePreservedInputViewsIfNecessary");

        }
        return;
      case 5:
        objc_msgSend(v24, "sessionIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v49 = self->_delegate;
          v217[0] = MEMORY[0x1E0C809B0];
          v217[1] = 3221225472;
          v217[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_9;
          v217[3] = &unk_1E16B51E8;
          v217[4] = self;
          v217[5] = v24;
          v50 = v48;
          v218 = v50;
          v219 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleEventsForBackgroundURLSession:completionHandler: but the completion handler was never called."), v217);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:handleEventsForBackgroundURLSession:completionHandler:](v49, "application:handleEventsForBackgroundURLSession:completionHandler:", self, v50, v51);

          v22 = v191;
          objc_msgSend(MEMORY[0x1E0C92C98], "_sendPendingCallbacksForSessionIdentifier:", v50);

        }
        else
        {
          if (objc_msgSend(v24, "canSendResponse"))
          {
            objc_msgSend(MEMORY[0x1E0D016A8], "response");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "sendResponse:", v87);

          }
          objc_msgSend(MEMORY[0x1E0C92C98], "_releaseProcessAssertionForSessionIdentifier:", v48);
          objc_msgSend(MEMORY[0x1E0C92C98], "_sendPendingCallbacksForSessionIdentifier:", v48);
        }

        v21 = v190;
        goto LABEL_181;
      case 6:
        objc_msgSend(v11, "payload");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKey:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v53)
        {
          objc_msgSend(v178, "bundleIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:](self->_activityContinuationManager, "activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:", v24, v53, v178);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          -[UIActivityContinuationManager handleActivityContinuation:isSuspended:](self->_activityContinuationManager, "handleActivityContinuation:isSuspended:", v54, -[UIApplication isSuspended](self, "isSuspended"));
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(CFSTR("%s: [action UIActionType] == UIActionTypeActivityContinuation, but couldn't make a dictionary from it. Ignoring action %@"), "-[UIApplication _handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:]", v24);
        }

        v22 = v191;
        goto LABEL_181;
      case 8:
        objc_msgSend(v24, "payload");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        -[UIApplication _applicationHandleSiriTask:](self, "_applicationHandleSiriTask:", v41);
        goto LABEL_87;
      case 11:
        -[UIApplication _applicationDidEnterBackground](self, "_applicationDidEnterBackground");
        goto LABEL_181;
      case 14:
        -[UIApplication _applicationHandleWatchKitRequest:](self, "_applicationHandleWatchKitRequest:", v24);
        goto LABEL_181;
      case 16:
        -[UIApplication _setSystemNavigationAction:](self, "_setSystemNavigationAction:", v24);
        goto LABEL_181;
      case 17:
        -[UIApplication _handleApplicationShortcutAction:onWindowScene:](self, "_handleApplicationShortcutAction:onWindowScene:", v24, v12);
        goto LABEL_181;
      case 18:
        -[UIApplication _handleScreenshot](self, "_handleScreenshot");
        goto LABEL_181;
      case 19:
        -[UIApplication _applicationShouldRequestHealthAuthorization](self, "_applicationShouldRequestHealthAuthorization");
        goto LABEL_181;
      case 23:
        objc_msgSend(v24, "shareMetadata");
        v55 = objc_claimAutoreleasedReturnValue();
        v41 = (id)v55;
        if (v55)
        {
          NSLog(CFSTR("%s: Handling CloudKit Share Action with metadata: %@"), "-[UIApplication _handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:]", v55);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[UIApplicationDelegate application:userDidAcceptCloudKitShareWithMetadata:](self->_delegate, "application:userDidAcceptCloudKitShareWithMetadata:", self, v41);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[UIApplicationDelegate application:userAcceptedCloudKitShareWithMetadata:](self->_delegate, "application:userAcceptedCloudKitShareWithMetadata:", self, v41);
          }
        }
        goto LABEL_87;
      case 25:
        v27 = v24;
        objc_msgSend(v27, "notification");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v216[0] = MEMORY[0x1E0C809B0];
          v216[1] = 3221225472;
          v216[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_12;
          v216[3] = &unk_1E16C3F48;
          v216[4] = v27;
          objc_msgSend(v30, "userNotificationCenter:willPresentNotification:withCompletionHandler:", v29, v28, v216);
          goto LABEL_134;
        }
        if (objc_msgSend(v27, "isLocal")
          && objc_msgSend(v27, "isDeliverable")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          (*((void (**)(uint64_t, void *))UNNotificationToUILocalNotification + 2))((uint64_t)UNNotificationToUILocalNotification, v28);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:didReceiveLocalNotification:](self->_delegate, "application:didReceiveLocalNotification:", self, v81);
          if (objc_msgSend(v27, "canSendResponse"))
          {
            +[UIWillPresentNotificationActionResponse responseWithOptions:](UIWillPresentNotificationActionResponse, "responseWithOptions:", 0);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "sendResponse:", v82);

          }
LABEL_114:
          v19 = v179;
          goto LABEL_134;
        }
        if (objc_msgSend(v27, "isRemote")
          && objc_msgSend(v27, "isDeliverable")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v28, "request");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "content");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "userInfo");
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          self = v187;
          -[UIApplicationDelegate application:didReceiveRemoteNotification:fetchCompletionHandler:](v187->_delegate, "application:didReceiveRemoteNotification:fetchCompletionHandler:", v187, v93, &__block_literal_global_1425);
LABEL_111:
          if (objc_msgSend(v27, "canSendResponse"))
          {
            +[UIWillPresentNotificationActionResponse responseWithOptions:](UIWillPresentNotificationActionResponse, "responseWithOptions:", 0);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "sendResponse:", v97);

          }
          v11 = v174;
          goto LABEL_114;
        }
        if (objc_msgSend(v27, "isRemote")
          && objc_msgSend(v27, "isDeliverable")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v28, "request");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "content");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "userInfo");
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          self = v187;
          -[UIApplicationDelegate application:didReceiveRemoteNotification:](v187->_delegate, "application:didReceiveRemoteNotification:", v187, v93);
          goto LABEL_111;
        }
        self = v187;
        if (objc_msgSend(v27, "canSendResponse"))
        {
          +[UIWillPresentNotificationActionResponse responseWithOptions:](UIWillPresentNotificationActionResponse, "responseWithOptions:", 0);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sendResponse:", v125);

        }
LABEL_134:

        goto LABEL_180;
      case 26:
        v56 = dyld_program_sdk_at_least();
        v57 = (void *)MEMORY[0x1E0C9AA70];
        if (!v56)
          v57 = 0;
        v188 = v57;
        v58 = v24;
        objc_msgSend(v58, "response");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "delegate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v214[0] = MEMORY[0x1E0C809B0];
          v214[1] = 3221225472;
          v214[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_14;
          v214[3] = &unk_1E16B47A8;
          v214[4] = self;
          v214[5] = v58;
          v215 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called."), v214);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", v60, v59, v62);

          v63 = v215;
LABEL_52:

          goto LABEL_179;
        }
        if (objc_msgSend(v58, "isLocal")
          && objc_msgSend(v58, "isDefaultAction")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v88 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
          objc_msgSend(v59, "notification");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v88[2]((uint64_t)v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v179;
          self = v187;
          -[UIApplicationDelegate application:didReceiveLocalNotification:](v187->_delegate, "application:didReceiveLocalNotification:", v187, v90);
LABEL_147:

          goto LABEL_179;
        }
        if (objc_msgSend(v58, "isLocal")
          && (objc_msgSend(v58, "isDefaultAction") & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v59, "userText"), (v94 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v243 = CFSTR("UIUserNotificationActionResponseTypedTextKey");
            v170 = (void *)v94;
            v244 = v94;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v244, &v243, 1);
            v168 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v168 = v188;
            v170 = 0;
          }
          v143 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
          objc_msgSend(v59, "notification");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v143[2]((uint64_t)v143, v144);
          v172 = (void *)objc_claimAutoreleasedReturnValue();

          v185 = v187->_delegate;
          self = v187;
          objc_msgSend(v59, "actionIdentifier");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          v212[0] = MEMORY[0x1E0C809B0];
          v212[1] = 3221225472;
          v212[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_15;
          v212[3] = &unk_1E16B47A8;
          v212[4] = v187;
          v212[5] = v58;
          v213 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler: but the completion handler was never called."), v212);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:](v185, "application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:", v187, v145, v172, v168, v146);

          v19 = v179;
          goto LABEL_178;
        }
        if (objc_msgSend(v58, "isLocal")
          && (objc_msgSend(v58, "isDefaultAction") & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v98 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
          objc_msgSend(v59, "notification");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v98[2]((uint64_t)v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          v181 = v187->_delegate;
          self = v187;
          objc_msgSend(v59, "actionIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v210[0] = MEMORY[0x1E0C809B0];
          v210[1] = 3221225472;
          v210[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_16;
          v210[3] = &unk_1E16B47A8;
          v210[4] = v187;
          v210[5] = v58;
          v211 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleActionWithIdentifier:forLocalNotification:completionHandler: but the completion handler was never called."), v210);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:handleActionWithIdentifier:forLocalNotification:completionHandler:](v181, "application:handleActionWithIdentifier:forLocalNotification:completionHandler:", v187, v101, v100, v102);

          v19 = v179;
LABEL_178:
          v11 = v174;
          goto LABEL_179;
        }
        if (objc_msgSend(v58, "isRemote")
          && objc_msgSend(v58, "isDefaultAction")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v59, "notification");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "request");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "content");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "userInfo");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v174;
          v19 = v179;

          self = v187;
          -[UIApplicationDelegate application:didReceiveRemoteNotification:fetchCompletionHandler:](v187->_delegate, "application:didReceiveRemoteNotification:fetchCompletionHandler:", v187, v90, &__block_literal_global_1439);
          goto LABEL_147;
        }
        if (objc_msgSend(v58, "isRemote")
          && objc_msgSend(v58, "isDefaultAction")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v59, "notification");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "request");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "content");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "userInfo");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v174;
          v19 = v179;

          self = v187;
          -[UIApplicationDelegate application:didReceiveRemoteNotification:](v187->_delegate, "application:didReceiveRemoteNotification:", v187, v90);
          goto LABEL_147;
        }
        if (objc_msgSend(v58, "isRemote")
          && (objc_msgSend(v58, "isDefaultAction") & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v59, "userText"), (v130 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v241 = CFSTR("UIUserNotificationActionResponseTypedTextKey");
            v171 = (void *)v130;
            v242 = v130;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v242, &v241, 1);
            v169 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v169 = v188;
            v171 = 0;
          }
          objc_msgSend(v59, "notification");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "request");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "content");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "userInfo");
          v186 = (void *)objc_claimAutoreleasedReturnValue();

          v150 = v187->_delegate;
          self = v187;
          objc_msgSend(v59, "actionIdentifier");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v208[0] = MEMORY[0x1E0C809B0];
          v208[1] = 3221225472;
          v208[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_18;
          v208[3] = &unk_1E16B47A8;
          v208[4] = v187;
          v208[5] = v58;
          v209 = v12;
          _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler: but the completion handler was never called."), v208);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplicationDelegate application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:](v150, "application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:", v187, v173, v186, v169, v151);

          v11 = v174;
          v19 = v179;
        }
        else
        {
          if (objc_msgSend(v58, "isRemote")
            && (objc_msgSend(v58, "isDefaultAction") & 1) == 0
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v59, "notification");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "request");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "content");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "userInfo");
            v184 = objc_claimAutoreleasedReturnValue();

            v134 = v187->_delegate;
            self = v187;
            objc_msgSend(v59, "actionIdentifier");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v206[0] = MEMORY[0x1E0C809B0];
            v206[1] = 3221225472;
            v206[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_19;
            v206[3] = &unk_1E16B47A8;
            v206[4] = v187;
            v206[5] = v58;
            v207 = v12;
            _UIAutologgingVoidBlock(CFSTR("Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:completionHandler: but the completion handler was never called."), v206);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIApplicationDelegate application:handleActionWithIdentifier:forRemoteNotification:completionHandler:](v134, "application:handleActionWithIdentifier:forRemoteNotification:completionHandler:", v187, v135, v184, v136);

            v11 = v174;
            v19 = v179;

            v63 = (void *)v184;
            goto LABEL_52;
          }
          self = v187;
          if (objc_msgSend(v58, "canSendResponse"))
            objc_msgSend(v58, "sendResponse:", 0);
        }
LABEL_179:

LABEL_180:
        v21 = v190;
        v22 = v191;
        goto LABEL_181;
      case 27:
        -[UIApplication _applicationHandleIntentForwardingAction:](self, "_applicationHandleIntentForwardingAction:", v24);
        goto LABEL_181;
      case 31:
        objc_msgSend(v24, "fulfillRequest");
        goto LABEL_181;
      case 32:
        v64 = v24;
        objc_msgSend(v64, "notification");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "delegate");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_opt_respondsToSelector();

        if ((v68 & 1) != 0)
          objc_msgSend(v67, "userNotificationCenter:openSettingsForNotification:", v66, v65);

        v21 = v190;
        goto LABEL_68;
      case 33:
        v31 = v24;
        objc_msgSend(v12, "_bannerManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bannerContent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bannerWithContent:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "tappable"))
        {
          v204[0] = MEMORY[0x1E0C809B0];
          v204[1] = 3221225472;
          v204[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_20;
          v204[3] = &unk_1E16B1B28;
          v205 = v31;
          objc_msgSend(v34, "addTapHandler:", v204);

        }
        v202[0] = MEMORY[0x1E0C809B0];
        v202[1] = 3221225472;
        v202[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_21;
        v202[3] = &unk_1E16B1B28;
        v203 = v34;
        v35 = v34;
        objc_msgSend(v31, "setInvalidationHandler:", v202);
        objc_setAssociatedObject(v35, "action", v31, (void *)1);
        objc_msgSend(v35, "present");

        goto LABEL_67;
      case 34:
        v69 = v24;
        -[UIApplication _openSessionsIncludingInternal:](self, "_openSessionsIncludingInternal:", 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v200[0] = MEMORY[0x1E0C809B0];
        v200[1] = 3221225472;
        v200[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_23;
        v200[3] = &unk_1E16DD608;
        v71 = v69;
        v201 = v71;
        objc_msgSend(v70, "objectsPassingTest:", v200);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        v180 = v72;
        objc_msgSend(v72, "anyObject");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v73;
        if (v73)
        {
          v75 = v73;
        }
        else
        {
          v103 = [UISceneSession alloc];
          objc_msgSend(v71, "persistentIdentifier");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = -[UISceneSession _initWithPersistentIdentifier:sessionRole:configurationName:](v103, "_initWithPersistentIdentifier:sessionRole:configurationName:", v104, CFSTR("UIWindowSceneSessionRoleApplication"), 0);

        }
        v189 = v71;
        if (objc_msgSend(v75, "_configurationNeedsReevalulation"))
        {
          -[UIApplication _removeSessionFromSessionSet:](self, "_removeSessionFromSessionSet:", v75);
          v105 = [UISceneSession alloc];
          objc_msgSend(v71, "persistentIdentifier");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = -[UISceneSession _initWithPersistentIdentifier:sessionRole:configurationName:](v105, "_initWithPersistentIdentifier:sessionRole:configurationName:", v106, CFSTR("UIWindowSceneSessionRoleApplication"), 0);

          v75 = (id)v107;
        }
        p_applicationFlags = &self->_applicationFlags;
        v109 = *((_QWORD *)&self->_applicationFlags + 1);
        if (!(*(_QWORD *)&self->_applicationFlags & 0x8000000000000000 | v109 & 1))
        {
          v121 = 0;
          v12 = v175;
          v122 = v189;
          goto LABEL_170;
        }
        v110 = (void *)objc_opt_new();
        v111 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v189, "action");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "setWithObject:", v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = -[UISceneSession _init]([UISceneSession alloc], "_init");
        +[UIScene _connectionOptionsForScene:withSpecification:transitionContext:actions:sceneSession:](UIWindowScene, "_connectionOptionsForScene:withSpecification:transitionContext:actions:sceneSession:", 0, v110, 0, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        v116 = [UISceneConnectionOptions alloc];
        v117 = (void *)objc_opt_new();
        v118 = -[UISceneConnectionOptions _initWithConnectionOptionsContext:fbsScene:specification:](v116, "_initWithConnectionOptionsContext:fbsScene:specification:", v115, 0, v117);

        if ((v109 & 1) != 0)
        {
          self = v187;
          if ((*((_QWORD *)p_applicationFlags + 1) & 1) == 0)
          {
LABEL_142:
            v121 = 0;
            v12 = v175;
            v122 = v189;
            goto LABEL_169;
          }
          -[UIApplication _openSessionsIncludingInternal:](v187, "_openSessionsIncludingInternal:", 1);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v137, "containsObject:", 0) & 1) != 0)
          {
            v138 = objc_msgSend(v75, "_configurationNeedsReevalulation");

            v12 = v175;
            v122 = v189;
            if (!v138)
            {
              v121 = 0;
              goto LABEL_169;
            }
          }
          else
          {

            v12 = v175;
            v122 = v189;
          }
          -[UIApplicationDelegate application:configurationForConnectingSceneSession:options:](v187->_delegate, "application:configurationForConnectingSceneSession:options:", v187, v75, v118);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "_updateConfiguration:", v124);
          v121 = 0;
          goto LABEL_168;
        }
        self = v187;
        if ((*(_QWORD *)p_applicationFlags & 0x8000000000000000) == 0)
          goto LABEL_142;
        v119 = v187->_delegate;
        objc_msgSend(v115, "launchOptionsDictionary");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIApplicationDelegate _application:willCreateCanvasWithDefinition:withOptions:](v119, "_application:willCreateCanvasWithDefinition:withOptions:", v187, v75, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v175;
        v122 = v189;
        if (v121)
        {
          objc_msgSend(v121, "persistentIdentifier");
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v123)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "handleFailureInMethod:object:file:lineNumber:description:", a2, v187, CFSTR("UIApplication.m"), 11876, CFSTR("Client must return a canvas definition with the proposed or another, already existing, persistentIdentifier"));
LABEL_168:

          }
        }
LABEL_169:

        v11 = v174;
LABEL_170:
        if (v121)
          v139 = v121;
        else
          v139 = v75;
        v140 = v139;
        -[UIApplication _appendSessionToSessionSet:save:](self, "_appendSessionToSessionSet:save:", v140, objc_msgSend(v177, "isPersistable"));
        if (objc_msgSend(v122, "canSendResponse"))
        {
          objc_msgSend(v140, "persistentIdentifier");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          +[UISceneProposalActionResponse responseWithPersistentIdentifier:](UISceneProposalActionResponse, "responseWithPersistentIdentifier:", v141);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "sendResponse:", v142);

        }
        v19 = v179;
        goto LABEL_180;
      case 35:
        v41 = v24;
        objc_msgSend(v41, "persistedIdentifiers");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
          objc_msgSend((id)UIApp, "_discardSceneSessionsWithPersistentIdentifiers:skippingPersistenceDeletion:", v80, 0);

        goto LABEL_87;
      case 36:
        objc_msgSend(v12, "statusBarManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleTapAction:", v24);
LABEL_77:

        goto LABEL_181;
      case 37:
        -[UIApplication _wakeTimerFired](self, "_wakeTimerFired");
        goto LABEL_181;
      case 39:
        v198 = 0u;
        v199 = 0u;
        v196 = 0u;
        v197 = 0u;
        -[UIApplication windows](self, "windows");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v196, v240, 16);
        if (v76)
        {
          v77 = v76;
          v78 = *(_QWORD *)v197;
          do
          {
            for (i = 0; i != v77; ++i)
            {
              if (*(_QWORD *)v197 != v78)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * i), "_resetFocusEventRecognizer");
            }
            v77 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v196, v240, 16);
          }
          while (v77);
        }
LABEL_67:

LABEL_68:
        v22 = v191;
        goto LABEL_181;
      case 43:
        -[UIApplication _applicationHandleLinkConnectionAction:](self, "_applicationHandleLinkConnectionAction:", v24);
        goto LABEL_181;
      case 46:
        objc_msgSend(v24, "_handleActionForWindowScene:", v12);
        goto LABEL_181;
      default:
        objc_msgSend(v176, "addObject:", v24);
        goto LABEL_181;
    }
  }
}

- (BOOL)_handleDelegateCallbacksWithOptions:(id)a3 isSuspended:(BOOL)a4 restoreState:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  char v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  FBSDisplayLayoutMonitor *v19;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  sem_t *v21;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  +[_UIAppearance _setInvalidatesViewsOnAppearanceChange:](_UIAppearance, "_setInvalidatesViewsOnAppearanceChange:", 1);
  v9 = +[_UISystemReferenceAngleMultiplexer sharedMultiplexer](_UISystemReferenceAngleMultiplexer, "sharedMultiplexer");
  if (!v5)
    *((_QWORD *)&self->_applicationFlags + 1) |= 0x10000000uLL;
  v10 = objc_opt_respondsToSelector();
  if ((v10 & 1) == 0)
  {
    v11 = 1;
    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  kdebug_trace();
  v11 = -[UIApplicationDelegate application:willFinishLaunchingWithOptions:](self->_delegate, "application:willFinishLaunchingWithOptions:", self, v8);
  kdebug_trace();
  if (v5)
LABEL_7:
    v5 = -[UIApplication _doRestorationIfNecessary](self, "_doRestorationIfNecessary");
LABEL_8:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    kdebug_trace();
    v11 &= -[UIApplicationDelegate application:didFinishLaunchingWithOptions:](self->_delegate, "application:didFinishLaunchingWithOptions:", self, v8);
    kdebug_trace();
LABEL_13:
    *(_QWORD *)&self->_applicationFlags |= 0x80000uLL;
    v12 = 1;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    kdebug_trace();
    -[UIApplicationDelegate applicationDidFinishLaunching:](self->_delegate, "applicationDidFinishLaunching:", self);
    kdebug_trace();
    if (v6)
      -[UIApplication applicationWillSuspend](self, "applicationWillSuspend");
    goto LABEL_13;
  }
  v12 = 0;
LABEL_15:
  -[UIApplication _handleLocalizationDelegateCallbacks](self, "_handleLocalizationDelegateCallbacks");
  if ((v10 & 1) != 0)
    *(_QWORD *)&self->_applicationFlags |= 0x80000uLL;
  if (v5)
    _decrementRestorationMarkerCount(self, 0);
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && -[UIApplication isFrontBoard](self, "isFrontBoard"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShouldRunContinuousDiscovery:", 1);

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "currentInputMode");

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(MEMORY[0x1E0D230D0], "sharedMonitorForDisplayType:", 0);
      v19 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
      displayLayoutMonitor = self->_displayLayoutMonitor;
      self->_displayLayoutMonitor = v19;

      -[FBSDisplayLayoutMonitor addObserver:](self->_displayLayoutMonitor, "addObserver:", self);
    }
    v21 = sem_open("keyboard-flush.boot", 0);
    if (v21 != (sem_t *)-1
      || (+[UIKeyboardImpl purgeImageCache](UIKeyboardImpl, "purgeImageCache"),
          v21 = sem_open("keyboard-flush.boot", 512, 256, 0),
          v21 != (sem_t *)-1))
    {
      sem_close(v21);
    }
  }
  -[UIApplication _updateSerializableKeyCommandsForResponder:](self, "_updateSerializableKeyCommandsForResponder:", self);
  +[_UIAppearance _setInvalidatesViewsOnAppearanceChange:](_UIAppearance, "_setInvalidatesViewsOnAppearanceChange:", 0);
  if (v12)
    _UIApplicationWaitForBackgroundAssertionsToFlush();

  return v11;
}

- (BOOL)_doRestorationIfNecessary
{
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  uint64_t RestorationRetryCountAndUpdateIfNecessary;
  int AppBooleanValue;
  BOOL v6;
  UIApplication *v7;
  $A703540AA7C67065EB9094A317CAB0A9 *v8;
  UIApplication *v9;
  void *v10;

  p_applicationFlags = &self->_applicationFlags;
  if ((*((_BYTE *)&self->_applicationFlags + 7) & 4) == 0)
    goto LABEL_5;
  RestorationRetryCountAndUpdateIfNecessary = _getRestorationRetryCountAndUpdateIfNecessary(0);
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UIStateRestorationDeveloperMode"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
  if (RestorationRetryCountAndUpdateIfNecessary <= 0 && !AppBooleanValue)
  {
    _deleteRestorationArchive(0);
LABEL_5:
    v6 = 0;
    goto LABEL_10;
  }
  if (RestorationRetryCountAndUpdateIfNecessary <= 0 && _UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Developer mode default is set. Skipping delete of restoration archive even though app has previously crashed during state restoration"), "-[UIApplication(StateRestoration) _doRestorationIfNecessary]");
  v7 = self;
  objc_sync_enter(v7);
  v8 = &self->_applicationFlags;
  *((_QWORD *)&self->_applicationFlags + 1) |= 0x8000000uLL;
  _incrementRestorationMarkerCount(v7, 0, 1);
  objc_sync_exit(v7);

  -[UIApplication _restoreApplicationPreservationStateWithSessionIdentifier:beginHandler:completionHandler:](v7, "_restoreApplicationPreservationStateWithSessionIdentifier:beginHandler:completionHandler:", 0, 0, 0);
  v9 = v7;
  objc_sync_enter(v9);
  *((_QWORD *)v8 + 1) &= ~0x8000000uLL;
  objc_sync_exit(v9);

  v6 = 1;
LABEL_10:
  *((_QWORD *)p_applicationFlags + 1) |= 0x10000000uLL;
  +[UIWindow _executeDeferredOrientationUpdates]();
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_2804);

  return v6;
}

- (void)_handleLocalizationDelegateCallbacks
{
  char v3;

  v3 = dyld_program_sdk_at_least();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[UIApplicationDelegate applicationShouldAutomaticallyLocalizeKeyCommands:](self->_delegate, "applicationShouldAutomaticallyLocalizeKeyCommands:", self);
  sAllowLocalizationOfApplicationShortcuts = v3;
}

- (void)_restoreApplicationPreservationStateWithSessionIdentifier:(id)a3 beginHandler:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  UIApplicationDelegate *delegate;
  UIApplicationDelegate *v20;
  uint64_t v21;
  char v22;
  const __CFString *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  uint64_t v60;
  __CFString *v61;
  __CFString *v62;
  uint64_t v63;
  __CFString *v64;
  __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  id v78;
  int v79;
  void *v80;
  _BOOL4 v81;
  Class v82;
  int v83;
  uint64_t v84;
  char v85;
  int v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t (**v103)(id, id);
  void *v104;
  UIApplication *v105;
  UIApplicationDelegate *v106;
  id v107;
  void *v108;
  void (**v109)(void);
  id v110;
  char v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  id v122;
  id v123;
  id obj;
  id obja;
  id v126;
  NSString *aClassName;
  NSString *aClassNamea;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  timespec buf;
  void (*v145)(uint64_t);
  void *v146;
  id v147;
  id v148;
  id v149;
  UIApplicationDelegate *v150;
  UIApplication *v151;
  id v152;
  id v153;
  char v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v114 = a3;
  v110 = a4;
  v109 = (void (**)(void))a5;
  if (!-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle"))
  {
    __UIStatusBarManagerForWindow(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStatusBarHidden");

    -[UIApplication setStatusBarHidden:](self, "setStatusBarHidden:", v9);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  _restorationPath(v114);
  v10 = objc_claimAutoreleasedReturnValue();
  v129 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 0, &v129);
  v115 = (id)objc_claimAutoreleasedReturnValue();
  v113 = (id)v10;
  v11 = v129;
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v14)
    {
      if (objc_msgSend(v12, "code") != 260)
      {
        v15 = qword_1EDDC83B0;
        if (!qword_1EDDC83B0)
        {
          v15 = __UILogCategoryGetNode("ApplicationStateRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&qword_1EDDC83B0);
        }
        v16 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.tv_sec) = 138543362;
          *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v12;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Error reading archived restorable state: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      if (objc_msgSend(v12, "code") == 257)
      {
        v17 = qword_1EDDC83B8;
        if (!qword_1EDDC83B8)
        {
          v17 = __UILogCategoryGetNode("ApplicationStateRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&qword_1EDDC83B8);
        }
        v18 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.tv_sec) = 0;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Unable to read state restoration file. Probably the device is locked.", (uint8_t *)&buf, 2u);
        }
        *((_QWORD *)&self->_applicationFlags + 1) |= 0x100000000uLL;
        buf.tv_sec = 0;
        buf.tv_nsec = 0;
        clock_gettime(_CLOCK_MONOTONIC_RAW_APPROX, &buf);
        self->_couldNotRestoreStateWhenLockedTime = buf.tv_sec;
      }
    }
    goto LABEL_183;
  }
  byte_1EDDC801B = 1;
  delegate = self->_delegate;
  v105 = self;
  v115 = v115;
  v20 = delegate;
  v113 = v113;
  v116 = v114;
  v103 = (uint64_t (**)(id, id))v110;
  v106 = v20;
  v111 = objc_opt_respondsToSelector();
  v117 = -[UIStateRestorationKeyedUnarchiver initForReadingWithData:defaultValues:requiresSecureCoding:]([UIStateRestorationKeyedUnarchiver alloc], "initForReadingWithData:defaultValues:requiresSecureCoding:", v115, 0);
  v21 = objc_msgSend(v117, "decodeIntForKey:", CFSTR("kUIStateRestorationArchiveMajorVersionKey"));
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: State restoration archive was saved with major version %d, minor version %d. Current major version %d, current minor version %d."), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v21, objc_msgSend(v117, "decodeIntForKey:", CFSTR("kUIStateRestorationArchiveMinorVersionKey")), 2, 1);
  if ((_DWORD)v21 != 2)
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Major version mismatch on state restoration archive, got %d, current version is %d, clearing previous saved state."), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v21, 2);
    goto LABEL_27;
  }
  if (v116)
  {
    if (!v103)
    {
LABEL_29:
      if (_UIStateRestorationDebugLogEnabled())
      {
        v23 = CFSTR("NO");
        if ((v111 & 1) != 0)
          v23 = CFSTR("YES");
        NSLog(CFSTR("%s: Application supports secure state restoration = %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v23);
      }
      v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      objc_msgSend(v117, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIApplicationStateRestorationUserInterfaceIdiom"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (v102)
      {
        objc_msgSend(v108, "setObject:forKey:", v102, CFSTR("UIApplicationStateRestorationUserInterfaceIdiom"));
        v24 = objc_msgSend(v102, "intValue");
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v24) = objc_msgSend(v25, "userInterfaceIdiom") == v24;

        if ((v24 & 1) == 0)
        {
          LOBYTE(buf.tv_sec) = 0;
          _getRestorationInProgressDictionary(v116, 0, (BOOL *)&buf);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (LOBYTE(buf.tv_sec))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("kRestorationTriesLeft"));

            if ((_updateRestorationInProgressFile(0, v26) & 1) == 0)
              NSLog(CFSTR("Warning: Unable to update the state restoration marker file to indicate we're restoring from a different idiom."));
          }

        }
      }
      objc_msgSend(v117, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIApplicationStateRestorationBundleVersion"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v100)
        objc_msgSend(v108, "setObject:forKey:", v100, CFSTR("UIApplicationStateRestorationBundleVersion"));
      objc_msgSend(v117, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIApplicationStateRestorationTimestamp"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (v99)
        objc_msgSend(v108, "setObject:forKey:", v99, CFSTR("UIApplicationStateRestorationTimestamp"));
      objc_msgSend(v117, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIApplicationStateRestorationSystemVersion"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (v98)
        objc_msgSend(v108, "setObject:forKey:", v98, CFSTR("UIApplicationStateRestorationSystemVersion"));
      +[UIResponder _updateStateRestorationIdentifierMap](UIResponder, "_updateStateRestorationIdentifierMap");
      v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (-[UIApplication _appAdoptsUISceneLifecycle](v105, "_appAdoptsUISceneLifecycle"))
      {
        v118 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v28 = (void *)MEMORY[0x1E0C99E60];
        v29 = objc_opt_class();
        objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "decodeObjectOfClasses:forKey:", v30, CFSTR("kRootRestorationIdentifiersKey"));
        v118 = (id)objc_claimAutoreleasedReturnValue();

      }
      v31 = (void *)MEMORY[0x1E0C99E60];
      v32 = objc_opt_class();
      objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "decodeObjectOfClasses:forKey:", v33, CFSTR("kViewControllerRestorationClassMapKey"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Root restoration identifier paths are %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v118);
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Restoration Class map: %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v104);
      if (-[UIApplication _appAdoptsUISceneLifecycle](v105, "_appAdoptsUISceneLifecycle"))
      {
        v101 = (id)MEMORY[0x1E0C9AA70];
      }
      else
      {
        v34 = (void *)MEMORY[0x1E0C99E60];
        v35 = objc_opt_class();
        objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "decodeObjectOfClasses:forKey:", v36, CFSTR("WindowIdentifierToSizeClassMapKey"));
        v101 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Window size classes saved with restoration archive: %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v101);
      if (v101)
      {
        v126 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v134, v143, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v135;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v135 != v39)
                objc_enumerationMutation(v37);
              v41 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
              objc_msgSend(v41, "restorationIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                objc_msgSend(v41, "restorationIdentifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "setObject:forKey:", v41, v43);

              }
            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v134, v143, 16);
          }
          while (v38);
        }

        if (objc_msgSend(v126, "count"))
        {
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          obj = v101;
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v142, 16);
          if (v44)
          {
            v123 = 0;
            v119 = *(_QWORD *)v131;
            do
            {
              v121 = v44;
              for (j = 0; j != v121; ++j)
              {
                if (*(_QWORD *)v131 != v119)
                  objc_enumerationMutation(obj);
                v46 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * j);
                objc_msgSend(obj, "objectForKey:", v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "objectForKey:", v46);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (v48)
                {
                  objc_msgSend(v47, "objectForKey:", CFSTR("VerticalSizeClassStringKey"));
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKey:", CFSTR("HorizontalSizeClassStringKey"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = v48;
                  v52 = v50;
                  aClassName = v49;
                  objc_msgSend(v51, "traitCollection");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = _sizeClassFromString(aClassName);

                  v55 = _sizeClassFromString(v52);
                  if ((v54 != objc_msgSend(v53, "verticalSizeClass") || v55 != objc_msgSend(v53, "horizontalSizeClass"))
                    && _UIStateRestorationDebugLogEnabled())
                  {
                    NSLog(CFSTR("%s: Trait collection changed during State Restoration for window %@"), "void _updateWindowSizeClassOverrides(UIWindow *__strong, NSString *__strong, NSString *__strong)", v51);
                  }
                  objc_msgSend(v51, "_setStateRestorationVerticalSizeClass:horizontalSizeClass:", v54, v55);
                  objc_msgSend(v51, "traitCollection");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  if (_UIStateRestorationDebugLogEnabled())
                  {
                    v57 = objc_msgSend(v53, "horizontalSizeClass");
                    v58 = CFSTR("UIUserInterfaceSizeClassUnspecified");
                    if (v57 == 2)
                      v58 = CFSTR("UIUserInterfaceSizeClassRegular");
                    if (v57 == 1)
                      v58 = CFSTR("UIUserInterfaceSizeClassCompact");
                    v59 = v58;
                    v60 = objc_msgSend(v53, "verticalSizeClass");
                    v61 = CFSTR("UIUserInterfaceSizeClassUnspecified");
                    if (v60 == 2)
                      v61 = CFSTR("UIUserInterfaceSizeClassRegular");
                    if (v60 == 1)
                      v61 = CFSTR("UIUserInterfaceSizeClassCompact");
                    v62 = v61;
                    v63 = objc_msgSend(v56, "horizontalSizeClass");
                    v64 = CFSTR("UIUserInterfaceSizeClassUnspecified");
                    if (v63 == 2)
                      v64 = CFSTR("UIUserInterfaceSizeClassRegular");
                    if (v63 == 1)
                      v64 = CFSTR("UIUserInterfaceSizeClassCompact");
                    v65 = v64;
                    v66 = objc_msgSend(v56, "verticalSizeClass");
                    v67 = CFSTR("UIUserInterfaceSizeClassUnspecified");
                    if (v66 == 2)
                      v67 = CFSTR("UIUserInterfaceSizeClassRegular");
                    if (v66 == 1)
                      v67 = CFSTR("UIUserInterfaceSizeClassCompact");
                    NSLog(CFSTR("%s: Set window %@ size collection traits from Horizontal %@/Vertical %@ to Horizontal %@/Vertical %@"), "void _updateWindowSizeClassOverrides(UIWindow *__strong, NSString *__strong, NSString *__strong)", v51, v59, v62, v65, v67);

                  }
                  if (!v123)
                    v123 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  if (_UIStateRestorationDebugLogEnabled())
                    NSLog(CFSTR("%s: Adding window to list with overrides to reset after State Restoration %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v51);
                  objc_msgSend(v123, "addObject:", v51);

                }
              }
              v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v142, 16);
            }
            while (v44);
          }
          else
          {
            v123 = 0;
          }

        }
        else
        {
          v123 = 0;
        }

      }
      else
      {
        v123 = 0;
      }
      if (!objc_msgSend(v118, "count"))
      {
LABEL_179:
        +[UIResponder _prepareForSecondPassStateRestoration](UIResponder, "_prepareForSecondPassStateRestoration");
        buf.tv_sec = MEMORY[0x1E0C809B0];
        buf.tv_nsec = 3221225472;
        v145 = ___restoreState_block_invoke_3186;
        v146 = &unk_1E16DDD78;
        v92 = v107;
        v147 = v92;
        v93 = v108;
        v148 = v93;
        v154 = v111 & 1;
        v149 = v116;
        v150 = v106;
        v151 = v105;
        v94 = v117;
        v152 = v94;
        v95 = v123;
        v153 = v95;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &buf);
        +[UIResponder _finishStateRestoration](UIResponder, "_finishStateRestoration");
        objc_msgSend(v94, "finishDecoding");

        goto LABEL_180;
      }
      v68 = 0;
      while (1)
      {
        objc_msgSend(v118, "objectAtIndex:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsSeparatedByString:", CFSTR("/"));
        v70 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v70, "count"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v72 = v70;
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v138, &buf, 16);
        if (v73)
        {
          v74 = *(_QWORD *)v139;
          do
          {
            for (k = 0; k != v73; ++k)
            {
              if (*(_QWORD *)v139 != v74)
                objc_enumerationMutation(v72);
              v76 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * k);
              if ((objc_msgSend(v76, "hasPrefix:", CFSTR(":[")) & 1) == 0)
                objc_msgSend(v71, "addObject:", v76);
            }
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v138, &buf, 16);
          }
          while (v73);
        }

        objc_msgSend(v117, "decodeObjectOfClass:forKey:", objc_opt_class(), v69);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v77)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Warning: No state restoration data for Object with identifier %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v69);
          goto LABEL_175;
        }
        v78 = -[UIStateRestorationKeyedUnarchiver initForReadingWithData:defaultValues:requiresSecureCoding:]([UIStateRestorationKeyedUnarchiver alloc], "initForReadingWithData:defaultValues:requiresSecureCoding:", v77, v108, v111 & 1);
        v79 = objc_msgSend(v78, "decodeBoolForKey:", CFSTR("kObjectIsViewControllerKey"));
        if (v116)
        {
          +[UIResponder objectWithRestorationIdentifierPath:](UIResponder, "objectWithRestorationIdentifierPath:", v69);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (v80)
          {
            v81 = 0;
            goto LABEL_163;
          }
        }
        objc_msgSend(v104, "objectForKey:", v69);
        aClassNamea = (NSString *)objc_claimAutoreleasedReturnValue();
        if (aClassNamea)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Restoration class name for Object %@ is %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v69, aClassNamea);
          v82 = NSClassFromString(aClassNamea);
          v83 = _UIStateRestorationDebugLogEnabled();
          if (v82)
          {
            if (v83)
              NSLog(CFSTR("%s: Found restoration class for Object: %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v82);
            if (!v79)
            {
              if ((-[objc_class conformsToProtocol:](v82, "conformsToProtocol:", &unk_1EE0CECA8) & 1) != 0)
              {
                -[objc_class objectWithRestorationIdentifierPath:coder:](v82, "objectWithRestorationIdentifierPath:coder:", v71, v78);
                v84 = objc_claimAutoreleasedReturnValue();
                goto LABEL_141;
              }
              NSLog(CFSTR("Warning: restoration class for object does not conform to UIObjectRestoration protocol: Class is %@"), v82);
              goto LABEL_150;
            }
            if ((-[objc_class conformsToProtocol:](v82, "conformsToProtocol:", &unk_1EE0CEC48) & 1) != 0)
            {
              -[objc_class viewControllerWithRestorationIdentifierPath:coder:](v82, "viewControllerWithRestorationIdentifierPath:coder:", v71, v78);
              v84 = objc_claimAutoreleasedReturnValue();
LABEL_141:
              v80 = (void *)v84;
LABEL_161:
              v81 = 1;
              goto LABEL_162;
            }
            NSLog(CFSTR("Warning: restoration class for view controller does not conform to UIViewControllerRestoration protocol: Class is %@"), v82);
          }
          else if ((v83 & 1) != 0)
          {
            NSLog(CFSTR("%s: No restoration class for Object, checking Application Delegate and implicitly for Object"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)");
          }
        }
        v85 = v79 ^ 1;
        if (v116)
          v85 = 1;
        if ((v85 & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[UIApplicationDelegate application:viewControllerWithRestorationIdentifierPath:coder:](v106, "application:viewControllerWithRestorationIdentifierPath:coder:", v105, v71, v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v80)
            {

              v81 = 1;
              goto LABEL_163;
            }
          }
          goto LABEL_152;
        }
LABEL_150:
        if (v116)
        {
          v80 = 0;
          goto LABEL_153;
        }
LABEL_152:
        +[UIResponder objectWithRestorationIdentifierPath:](UIResponder, "objectWithRestorationIdentifierPath:", v69);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_153:
        v81 = v80 == 0;
        if (v80)
          v86 = 0;
        else
          v86 = v79;
        if (v86 == 1)
        {
          v122 = v71;
          v87 = v78;
          objc_msgSend(v87, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIStateRestorationViewControllerStoryboard"));
          obja = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIStateRestorationViewControllerStoryboardIdentifier"));
          v88 = objc_claimAutoreleasedReturnValue();
          v89 = (void *)v88;
          v120 = v87;
          v80 = 0;
          if (obja && v88)
          {
            objc_msgSend(obja, "instantiateViewControllerWithIdentifier:", v88);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_161;
        }
LABEL_162:

        if (!v80)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Couldn't get object in root set for index [%d] for identifier path %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v68, v69);
          goto LABEL_174;
        }
LABEL_163:
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Object in root set for index [%d] for identifier path %@: %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v68, v69, v80);
        if (v79)
        {
          v90 = v80;
          objc_msgSend(v78, "decodeBoolForKey:", CFSTR("kViewControllerViewWasLoadedKey"));
          if (objc_msgSend(v90, "_shouldLoadViewDuringRestoration:", v78))
          {
            objc_msgSend(v90, "view");

          }
          else if (_UIStateRestorationDebugLogEnabled())
          {
            NSLog(CFSTR("%s: Special case path: skipping initial load of ViewController's views for %@"), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v69);
          }

        }
        if (v81)
          +[UIResponder _setRestoredIdentifierPathForObject:identifierPath:](UIResponder, "_setRestoredIdentifierPathForObject:identifierPath:", v80, v69);
        +[UIResponder _updateStateRestorationIdentifierMap](UIResponder, "_updateStateRestorationIdentifierMap");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v69, v80, v78, 0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addObject:", v91);

LABEL_174:
LABEL_175:

        if (objc_msgSend(v118, "count") <= (unint64_t)++v68)
          goto LABEL_179;
      }
    }
    v22 = v103[2](v103, v117);
  }
  else
  {
    if ((*((_BYTE *)&v105->_applicationFlags + 7) & 4) == 0)
      goto LABEL_29;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = -[UIApplicationDelegate application:shouldRestoreSecureApplicationState:](v106, "application:shouldRestoreSecureApplicationState:", UIApp, v117);
    }
    else
    {
      if (qword_1EDDC84E8 != -1)
        dispatch_once(&qword_1EDDC84E8, &__block_literal_global_3143);
      v22 = -[UIApplicationDelegate application:shouldRestoreApplicationState:](v106, "application:shouldRestoreApplicationState:", UIApp, v117);
    }
  }
  if ((v22 & 1) != 0)
    goto LABEL_29;
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Application has declined restoration, clearing previous saved state."), "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)");
LABEL_27:
  _deleteRestorationArchive(v116);
  objc_msgSend(v117, "finishDecoding");
LABEL_180:

  byte_1EDDC801B = 0;
  if (v109)
    v109[2]();
  v12 = 0;
LABEL_183:
  if (_UIStateRestorationDebugLogEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "timeIntervalSinceDate:", v112);
    NSLog(CFSTR("Restored restoration state in %f"), v97);

  }
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden
{
  -[UIApplication setStatusBarHidden:withAnimation:](self, "setStatusBarHidden:withAnimation:", statusBarHidden, 0);
}

- (void)_immediatelyUpdateSerializableKeyCommandsForResponder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[UIApplication _shouldUpdateSerializableKeyCommandsForResponder:](self, "_shouldUpdateSerializableKeyCommandsForResponder:", a3))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__UIApplication__immediatelyUpdateSerializableKeyCommandsForResponder___block_invoke;
    v26[3] = &unk_1E16CD320;
    v6 = v4;
    v27 = v6;
    objc_msgSend(v5, "_enumerateKeyCommandsInChainWithOptions:usingBlock:", 36, v26);

    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transactionAssertionWithReason:", CFSTR("Updating UIKeyCommands"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray makeObjectsPerformSelector:](self->_keyCommandRegistrationAssertions, "makeObjectsPerformSelector:", sel_invalidate);
    -[NSMutableArray removeAllObjects](self->_keyCommandRegistrationAssertions, "removeAllObjects");
    v8 = (void *)MEMORY[0x1E0D00CB8];
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tokenForIdentifierOfCAContext:", objc_msgSend(v9, "_contextId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
          v17 = objc_alloc_init(MEMORY[0x1E0D00DA8]);
          objc_msgSend(v17, "setDeferringEnvironment:", v16);
          objc_msgSend(v17, "setDeferringToken:", v10);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setKeyCommands:", v18);

          objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "registerKeyCommands:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](self->_keyCommandRegistrationAssertions, "addObject:", v20);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v13);
    }

    objc_msgSend(v21, "invalidate");
  }
}

- (BOOL)_shouldUpdateSerializableKeyCommandsForResponder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v4 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isHardwareKeyboardAvailable");

  if (v6)
  {
    if (v4)
    {
      -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "_containsResponder:", v7);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  objc_super v12;

  v6 = a4;
  if (sel_orderFrontCharacterPalette_ == a3 || sel__handleLegacyEmojiKeyboardShortcut_ == a3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canPresentOrDismissEmojiPopover");

  }
  else
  {
    if (sel_startDictation_ == a3)
    {
      v10 = +[UIDictationController canPerformDictation](UIDictationController, "canPerformDictation");
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)UIApplication;
      v10 = -[UIResponder canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
    }
    v9 = v10;
  }

  return v9;
}

- (void)finishedTest:(id)a3
{
  -[UIApplication finishedTest:extraResults:waitForNotification:withTeardownBlock:](self, "finishedTest:extraResults:waitForNotification:withTeardownBlock:", a3, 0, 0, 0);
}

- (void)registerForRemoteNotifications
{
  PKPushRegistry *applicationPushRegistry;
  id v4;
  PKPushRegistry *v5;
  PKPushRegistry *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PKPushRegistry *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  applicationPushRegistry = self->_applicationPushRegistry;
  if (!applicationPushRegistry)
  {
    v4 = objc_alloc(MEMORY[0x1E0CD22F0]);
    v5 = (PKPushRegistry *)objc_msgSend(v4, "initWithQueue:", MEMORY[0x1E0C80D38]);
    -[PKPushRegistry setDelegate:](v5, "setDelegate:", self);
    v6 = self->_applicationPushRegistry;
    self->_applicationPushRegistry = v5;

    applicationPushRegistry = self->_applicationPushRegistry;
  }
  v7 = *MEMORY[0x1E0CD2308];
  -[PKPushRegistry pushTokenForType:](applicationPushRegistry, "pushTokenForType:", *MEMORY[0x1E0CD2308]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__UIApplication_registerForRemoteNotifications__block_invoke;
    v12[3] = &unk_1E16B1B50;
    v12[4] = self;
    v13 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    v10 = self->_applicationPushRegistry;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPushRegistry setDesiredPushTypes:](v10, "setDesiredPushTypes:", v11);

  }
}

- (BOOL)isRunningTest:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend((id)qword_1ECD819D8, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_findWindowForControllingOverallAppearanceInWindowScene:(id)a3
{
  return +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", a3);
}

void __63__UIApplication_pushRegistry_didUpdatePushCredentials_forType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v4 = *(void **)(v3 + 24);
    objc_msgSend(v2, "token");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "application:didRegisterForRemoteNotificationsWithDeviceToken:", v3, v5);

  }
}

- (BOOL)_isActivatedIgnoringReasons:(unsigned int)a3
{
  return (*(_DWORD *)&self->_applicationFlags & ~a3 & 0x3FFFF) == 0;
}

- (BOOL)_isActivatedIgnoringReasons:(unsigned int)a3 withNewReason:(int)a4
{
  return ((*(_DWORD *)&self->_applicationFlags & 0x3FFFF | (1 << a4)) & ~a3) == 0;
}

- (BOOL)_isActivatedIgnoringReason:(int)a3
{
  return (*(_DWORD *)&self->_applicationFlags & ~(1 << a3) & 0x3FFFF) == 0;
}

- (BOOL)isStatusBarHidden
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[UIApplication _mainScene](self, "_mainScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStatusBarHidden");

  return v5;
}

void __72__UIApplication_SessionAndConfigurationInternal___discardSceneSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removeSessionFromSessionSet:", v3);
  if (objc_msgSend(v3, "_isInternal"))
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v3);

}

uint64_t __81__UIApplication_SessionAndConfigurationInternal___openSessionsIncludingInternal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isInternal") ^ 1;
}

- (void)_removeSessionFromSessionSet:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if (qword_1EDDC8508 != -1)
      dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
    objc_msgSend((id)qword_1EDDC8500, "removeObject:", v5);
    v4 = v5;
  }

}

- (BOOL)isProtectedDataAvailable
{
  return MKBGetDeviceLockState() != 1;
}

- (id)_openSessionsIncludingInternal:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    if (qword_1EDDC8508 != -1)
      dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
    v3 = (void *)objc_msgSend((id)qword_1EDDC8500, "copy");
  }
  else
  {
    if (qword_1EDDC8508 != -1)
      dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
    objc_msgSend((id)qword_1EDDC8500, "objectsPassingTest:", &__block_literal_global_2928);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  return v3;
}

- (void)pushRegistry:(id)a3 didUpdatePushCredentials:(id)a4 forType:(id)a5
{
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a4;
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CD2308]))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__UIApplication_pushRegistry_didUpdatePushCredentials_forType___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v8[4] = self;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __56__UIApplication__applicationHandleLinkConnectionAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
    objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v3);

}

- (void)_stopHangTracer
{
  byte_1EDDC8010 = 1;
  -[UIApplication _updateHangTracer](self, "_updateHangTracer");
}

- (void)_setShouldFixMainThreadPriority:(BOOL)a3
{
  __shouldFixMainThreadPriority = a3;
  BSSetMainThreadPriorityFixedForUI();
}

- (BOOL)_isNormalRestorationInProgress
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 11) >> 3) & 1;
}

- (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation
{
  _BOOL8 v4;
  UIStatusBarHideAnimationParameters *v7;
  uint64_t v8;
  UIStatusBarHideAnimationParameters *v9;

  v4 = hidden;
  if (animation)
  {
    v7 = -[UIStatusBarHideAnimationParameters initWithDefaultParameters]([UIStatusBarHideAnimationParameters alloc], "initWithDefaultParameters");
    if (animation == UIStatusBarAnimationSlide)
      v8 = 2;
    else
      v8 = 1;
    v9 = v7;
    -[UIStatusBarHideAnimationParameters setHideAnimation:](v7, "setHideAnimation:", v8);
  }
  else
  {
    v9 = 0;
  }
  -[UIApplication setStatusBarHidden:animationParameters:](self, "setStatusBarHidden:animationParameters:", v4, v9);

}

- (void)setStatusBarHidden:(BOOL)a3 animationParameters:(id)a4 changeApplicationFlag:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t applicationFlags;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a5;
  v6 = a3;
  v13 = a4;
  if (!-[UIApplication _viewControllerBasedStatusBarAppearance](self, "_viewControllerBasedStatusBarAppearance"))
  {
    if (v5)
    {
      applicationFlags = (uint64_t)self->_applicationFlags;
      if (((((applicationFlags & 0x800000) == 0) ^ v6) & 1) == 0)
      {
        v9 = *((_QWORD *)&self->_applicationFlags + 1);
        v10 = applicationFlags & 0xFFFFFFFFFE7FFFFFLL;
        v11 = 25165824;
        if (!v6)
          v11 = 0;
        *(_QWORD *)&self->_applicationFlags = v10 | v11;
        *((_QWORD *)&self->_applicationFlags + 1) = v9;
      }
    }
    +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__UIApplication_setStatusBarHidden_animationParameters_changeApplicationFlag___block_invoke;
    v14[3] = &unk_1E16DD058;
    v15 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

  }
}

- (void)setStatusBarHidden:(BOOL)a3 animationParameters:(id)a4
{
  -[UIApplication setStatusBarHidden:animationParameters:changeApplicationFlag:](self, "setStatusBarHidden:animationParameters:changeApplicationFlag:", a3, a4, 1);
}

- (void)_setSaveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication
{
  self->_saveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication = 1;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle animated:(BOOL)animated
{
  UIStatusBarStyleAnimationParameters *v6;
  UIStatusBarStyleAnimationParameters *v7;

  if (animated)
    v6 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
  else
    v6 = 0;
  v7 = v6;
  -[UIApplication setStatusBarStyle:animationParameters:](self, "setStatusBarStyle:animationParameters:", statusBarStyle, v6);

}

- (void)setStatusBarStyle:(int64_t)a3 animationParameters:(id)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a4;
  if (!-[UIApplication _viewControllerBasedStatusBarAppearance](self, "_viewControllerBasedStatusBarAppearance"))
  {
    self->_statusBarRequestedStyle = a3;
    +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__UIApplication_setStatusBarStyle_animationParameters___block_invoke;
    v8[3] = &unk_1E16DD058;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)_setRotationDisabledDuringTouch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

uint64_t __125__UIApplication_SessionAndConfigurationInternal___discardSceneSessionsWithPersistentIdentifiers_skippingPersistenceDeletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isIdleTimerDisabled
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 4) >> 4) & 1;
}

- (void)_setUserDefaultsSyncEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (a3)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

id __125__UIApplication_SessionAndConfigurationInternal___discardSceneSessionsWithPersistentIdentifiers_skippingPersistenceDeletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v2 = a2;
  if (qword_1EDDC8508 != -1)
    dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
  v3 = (void *)qword_1EDDC8500;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __125__UIApplication_SessionAndConfigurationInternal___discardSceneSessionsWithPersistentIdentifiers_skippingPersistenceDeletion___block_invoke_2;
  v10[3] = &unk_1E16DDA68;
  v4 = v2;
  v11 = v4;
  objc_msgSend(v3, "bs_filter:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    +[_UICanvasUserActivityManager _fetchSceneSessionWithPersistentIdentifier:](_UICanvasUserActivityManager, "_fetchSceneSessionWithPersistentIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_applicationNameForMenus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UIApplication__applicationNameForMenus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EDDC82D0 != -1)
    dispatch_once(&qword_1EDDC82D0, block);
  return (id)qword_1EDDC82D8;
}

- (void)_applicationHandleLinkConnectionAction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)qword_1EDDC8478;
  v15 = qword_1EDDC8478;
  v5 = MEMORY[0x1E0C809B0];
  if (!qword_1EDDC8478)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getLNAppConnectionListenerClass_block_invoke;
    v11[3] = &unk_1E16B14C0;
    v11[4] = &v12;
    __getLNAppConnectionListenerClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "sharedListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__UIApplication__applicationHandleLinkConnectionAction___block_invoke;
  v9[3] = &unk_1E16DD268;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "handleAction:completionHandler:", v8, v9);

}

- (id)userCachesDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v3, 0);

  return v3;
}

void __67__UIApplication__checkActivityContinuationAndBecomeCurrentIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reverseObjectEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_msgSend(v7, "windowScene");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "activationState");

        if (!v9 && (!v4 || objc_msgSend(v7, "isKeyWindow")))
        {
          objc_msgSend(v7, "rootViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_activityContinuationSuitableToBecomeCurrent");
          v11 = objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            if (objc_msgSend(v7, "isKeyWindow"))
            {

              v4 = (void *)v11;
              goto LABEL_19;
            }
            v4 = (void *)v11;
          }
          else
          {
            v4 = 0;
          }
        }
        ++v6;
      }
      while (v3 != v6);
      v12 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v3 = v12;
    }
    while (v12);

    if (!v4)
      return;
LABEL_19:
    if (_UIStateRestorationDebugLogEnabled())
    {
      objc_msgSend(v4, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Found activity to become current: %@, title = %@, identifier = %@"), "-[UIApplication _checkActivityContinuationAndBecomeCurrentIfNeeded]_block_invoke", v4, v13, v14);

    }
    objc_msgSend(v4, "becomeCurrent");
  }
  else
  {
    v4 = v1;
  }

}

uint64_t __47__UIApplication_registerForRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "application:didRegisterForRemoteNotificationsWithDeviceToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_accessibilitySetUpQuickSpeak
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;

  if ((_accessibilitySetUpQuickSpeak_QuickSpeakDidRegister & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_accessibilityQuickSpeakStatusChanged, (CFStringRef)*MEMORY[0x1E0DDE1D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _accessibilitySetUpQuickSpeak_QuickSpeakDidRegister = 1;
  }
  if (_AXSQuickSpeakEnabled())
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", objc_msgSend((id)AXAccessibilityBundlesDirectory(), "stringByAppendingPathComponent:", CFSTR("QuickSpeak.bundle")));
    if (v4)
    {
      v5 = v4;
      if ((objc_msgSend(v4, "isLoaded") & 1) == 0)
      {
        objc_msgSend(v5, "load");
        objc_msgSend((id)objc_msgSend(v5, "principalClass"), "initialize");
      }
    }
  }
}

- (id)_pencilEventForWindow:(id)a3
{
  return -[UIEventEnvironment _pencilEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (int64_t)_carefulChoiceOrientationForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  int64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "screen"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_isEmbeddedScreen"),
        v6,
        !v7))
  {
    v8 = -[UIApplication _safeInterfaceOrientationForWindowIfExists:](self, "_safeInterfaceOrientationForWindowIfExists:", v5);
  }
  else
  {
    v8 = -[UIApplication _carefulChoiceOrientation](self, "_carefulChoiceOrientation");
  }
  v9 = v8;

  return v9;
}

- (BOOL)_accessibilityCaptureSimulatorEvent:(__GSEvent *)a3
{
  return 0;
}

- (void)_updateAccessibilityItunesSettings
{
  void *v2;

  if (-[UIApplication _accessibilityApplicationIsSystemWideServer](self, "_accessibilityApplicationIsSystemWideServer"))
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_accessibilitySettingsBundle"), "principalClass");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "performSelector:withObject:", sel_updateITunesSettings, 0);
  }
}

- (Class)_accessibilityBundlePrincipalClass
{
  objc_class *v2;
  objc_class *v3;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  objc_class *v11;
  uint8_t buf[4];
  objc_class *v13;
  __int16 v14;
  objc_class *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", objc_msgSend((id)objc_msgSend((id)AXAccessibilityBundlesDirectory(), "stringByAppendingPathComponent:", CFSTR("UIKit")), "stringByAppendingPathExtension:", CFSTR("axbundle")));
  v11 = 0;
  if (!-[objc_class loadAndReturnError:](v2, "loadAndReturnError:", &v11))
  {
    v8 = qword_1ECD7C870;
    if (!qword_1ECD7C870)
    {
      v8 = __UILogCategoryGetNode("Accessibility", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7C870);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 138412546;
    v13 = v2;
    v14 = 2112;
    v15 = v11;
    v6 = "Could not load accessibility bundle: %@ %@";
    v7 = v9;
    goto LABEL_11;
  }
  v3 = (objc_class *)-[objc_class principalClass](v2, "principalClass");
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v4 = _MergedGlobals_922;
    if (!_MergedGlobals_922)
    {
      v4 = __UILogCategoryGetNode("Accessibility", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_MergedGlobals_922);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v2;
    v6 = "Principal class %@ did not respond to _accessibilityStartServer %@";
    v7 = v5;
LABEL_11:
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, v6, buf, 0x16u);
    return 0;
  }
  return v3;
}

- (BOOL)_canAnimateDragCancelInApp
{
  if (objc_msgSend((id)UIApp, "applicationState"))
    return _UIApplicationIsExtension();
  else
    return 1;
}

- (void)dealloc
{
  NSMutableArray *keyCommandRegistrationAssertions;
  UIRepeatedAction *keyRepeatAction;
  FBSOrientationObserver *orientationObserver;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray makeObjectsPerformSelector:](self->_keyCommandRegistrationAssertions, "makeObjectsPerformSelector:", sel_invalidate);
  keyCommandRegistrationAssertions = self->_keyCommandRegistrationAssertions;
  self->_keyCommandRegistrationAssertions = 0;

  -[UIRepeatedAction invalidate](self->_keyRepeatAction, "invalidate");
  keyRepeatAction = self->_keyRepeatAction;
  self->_keyRepeatAction = 0;

  -[FBSOrientationObserver invalidate](self->_orientationObserver, "invalidate");
  orientationObserver = self->_orientationObserver;
  self->_orientationObserver = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0DDE0A0];
  v11[1] = CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification");
  v11[2] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v11[3] = CFSTR("_UIWindowDidResignApplicationKeyNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v6, self, v7);

  if ((*((_BYTE *)&self->_applicationFlags + 13) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getPGPictureInPictureProxyPictureInPictureActiveChangedNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v9, 0);

  }
  -[SBSApplicationShortcutService invalidate](self->_shortcutService, "invalidate");
  v10.receiver = self;
  v10.super_class = (Class)UIApplication;
  -[UIResponder dealloc](&v10, sel_dealloc);
}

+ (int64_t)runningInStoreDemoModeFProgramNumber
{
  int64_t v2;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0))
  {
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("FProgramNumber"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      return AppIntegerValue;
  }
  return v2;
}

- (BOOL)shouldLaunchSafe
{
  return byte_1EDDC7FF1;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 0;
}

- (void)_forceEndIgnoringInteractionEvents
{
  if (qword_1EDDC80D0 != -1)
    dispatch_once(&qword_1EDDC80D0, &__block_literal_global_902);
  if (byte_1EDDC7FFB)
    goto LABEL_7;
  if (qword_1EDDC80E0 != -1)
    dispatch_once(&qword_1EDDC80E0, &__block_literal_global_911);
  if (byte_1EDDC7FFC)
LABEL_7:
    -[UIApplication __forceEndIgnoringInteractionEvents]((uint64_t)self);
}

- (void)__forceEndIgnoringInteractionEvents
{
  id v2;

  if (a1)
  {
    *(_QWORD *)(a1 + 176) &= 0xFFFFFFFFE1FFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UIApplicationDidEndIgnoringInteractionEventsNotification"), a1);

  }
}

- (id)idleTimerDisabledReasons
{
  return self->_idleTimerDisabledReasons;
}

- (id)_gestureDelayedEventComponentDispatcher
{
  return self->__gestureDelayedEventComponentDispatcher;
}

- (BOOL)_appSupportsSceneItemProviders
{
  return -[_UIApplicationInfoParser supportsSceneItemProviders](self->_appInfo, "supportsSceneItemProviders");
}

- (BOOL)_isRestorationExtended
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 11) >> 3) & 1;
}

- (void)_setRestorationExtended:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

+ (id)_systemUIServiceClientSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D231C8], "settings");
}

+ (id)_systemUIServiceIdentifier
{
  return 0;
}

- (id)_mainSceneForDisplay:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIApplicationMainSceneForDisplayIdentity(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_newSceneForWindow:(id)a3 oldDisplay:(id)a4 newDisplay:(id)a5
{
  return 0;
}

- (void)_setCachedSystemAnimationFence:(uint64_t)a1
{
  id v4;
  _QWORD v5[6];

  v4 = a2;
  if (a1)
  {
    if (!v4 || *(_QWORD *)(a1 + 320))
    {
      objc_msgSend(*(id *)(a1 + 320), "invalidate");
      objc_storeStrong((id *)(a1 + 320), a2);
    }
    else
    {
      objc_storeStrong((id *)(a1 + 320), a2);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __48__UIApplication__setCachedSystemAnimationFence___block_invoke;
      v5[3] = &unk_1E16B1888;
      v5[4] = a1;
      v5[5] = sel__setCachedSystemAnimationFence_;
      objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v5, 2);
    }
  }

}

void __48__UIApplication__setCachedSystemAnimationFence___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UIApplication.m"), 2456, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 320);
  *(_QWORD *)(v2 + 320) = 0;

}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  FBSDisplayLayoutMonitor *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  int v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  UIApplication *v34;
  uint64_t v35;
  uint64_t applicationFlags;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void (**v43)(_QWORD);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  UIApplication *v49;
  unint64_t v50;
  FBSDisplayLayoutMonitor *v51;
  id v52;
  char v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD aBlock[5];
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = (FBSDisplayLayoutMonitor *)a3;
  v52 = a4;
  v9 = a5;
  v51 = v8;
  if (self->_displayLayoutMonitor != v8)
    goto LABEL_48;
  v48 = v9;
  v49 = self;
  v50 = *((_QWORD *)&self->_applicationFlags + 1);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v52, "elements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (!v58)
  {
    v53 = 0;
    v59 = 0;
    goto LABEL_41;
  }
  v59 = 0;
  v53 = 0;
  v10 = (v50 >> 39) & 3;
  v57 = *(_QWORD *)v63;
  v56 = *MEMORY[0x1E0D22C80];
  v55 = *MEMORY[0x1E0D22C70];
  while (2)
  {
    for (i = 0; i != v58; ++i)
    {
      if (*(_QWORD *)v63 != v57)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _UIMainBundleIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "hasPrefix:", v14);

      objc_msgSend(v12, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v67 = &v66;
      v68 = 0x2020000000;
      v17 = (_QWORD *)qword_1EDDC83F8;
      v69 = qword_1EDDC83F8;
      if (!qword_1EDDC83F8)
      {
        v18 = SpringBoardServicesLibrary_1();
        v17 = dlsym(v18, "SBSDisplayLayoutElementAppSwitcherIdentifier");
        v67[3] = (uint64_t)v17;
        qword_1EDDC83F8 = (uint64_t)v17;
      }
      _Block_object_dispose(&v66, 8);
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBSDisplayLayoutElementAppSwitcherIdentifier(void)");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("UIApplication.m"), 495, CFSTR("%s"), dlerror());

        goto LABEL_51;
      }
      v19 = objc_msgSend(v16, "isEqualToString:", *v17);

      objc_msgSend(v12, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v67 = &v66;
      v68 = 0x2020000000;
      v21 = (_QWORD *)qword_1EDDC8400;
      v69 = qword_1EDDC8400;
      if (!qword_1EDDC8400)
      {
        v22 = SpringBoardServicesLibrary_1();
        v21 = dlsym(v22, "SBSDisplayLayoutElementFloatingDockIdentifier");
        v67[3] = (uint64_t)v21;
        qword_1EDDC8400 = (uint64_t)v21;
      }
      _Block_object_dispose(&v66, 8);
      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBSDisplayLayoutElementFloatingDockIdentifier(void)");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("UIApplication.m"), 496, CFSTR("%s"), dlerror());

LABEL_51:
        __break(1u);
      }
      v23 = objc_msgSend(v20, "isEqualToString:", *v21);

      objc_msgSend(v12, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v56);

      objc_msgSend(v12, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", v55);

      objc_msgSend(v12, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("SBSpotlightAlert"));

      switch(v10)
      {
        case 2:
          v30 = v59;
          if (!(v19 | v23))
            v30 = 3;
          goto LABEL_21;
        case 1:
          v31 = 2;
          if (!v23)
            v31 = 0;
          v32 = v59;
          if (!v19)
            v32 = v31;
          v59 = v32;
          break;
        case 0:
          v30 = v59;
          if (v19)
            v30 = 1;
LABEL_21:
          v59 = v30;
          break;
      }
      if (((v23 | v29 ^ 1) & 1) == 0 && objc_msgSend(v12, "conformsToProtocol:", &unk_1EE0CEBE8))
        v53 |= objc_msgSend(v12, "layoutRole") == 3;
      if ((v15 & (v23 ^ 1) | v19 | v25 | v27 | v29) == 1
        && objc_msgSend(v12, "conformsToProtocol:", &unk_1EE0CEBE8))
      {
        v33 = v12;
        if (objc_msgSend(v33, "layoutRole") == 1
          || objc_msgSend(v33, "layoutRole") == 4
          || objc_msgSend(v33, "layoutRole") == 3)
        {

          v34 = v49;
          applicationFlags = (uint64_t)v49->_applicationFlags;
          v35 = *((_QWORD *)&v49->_applicationFlags + 1);
          goto LABEL_42;
        }

      }
    }
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v58)
      continue;
    break;
  }
LABEL_41:

  objc_msgSend(v52, "elements");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "hasPrefix:", v40);

  v34 = v49;
  applicationFlags = (uint64_t)v49->_applicationFlags;
  v35 = *((_QWORD *)&v49->_applicationFlags + 1);
  if (v41)
LABEL_42:
    v42 = 0x4000000000;
  else
    v42 = 0;
  *(_QWORD *)&v34->_applicationFlags = applicationFlags;
  *((_QWORD *)&v34->_applicationFlags + 1) = v35 & 0xFFFFFE3FFFFFFFFFLL | v42 | ((unint64_t)(v59 & 3) << 39);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIApplication_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  aBlock[3] = &unk_1E16B1B78;
  v61 = ((v50 & 0x4000000000 | v59) != 0) | v53 & 1;
  aBlock[4] = v34;
  v43 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
    v43[2](v43);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v43);

  v9 = v48;
LABEL_48:

}

uint64_t __66__UIApplication_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_deliverRemainingKeyUpEvents");
  return result;
}

uint64_t __93__UIApplication__performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming_block___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)qword_1EDDC80C8, "enqueuePostCommitBlock:", *(_QWORD *)(a1 + 32));
}

- (void)_performBlockAfterCATransactionCommitSynchronizes:(id)a3
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v5 = a3;
  if (dyld_program_sdk_at_least() && pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 3398, CFSTR("Call must be made on main thread"));

  }
  if (pthread_main_np() == 1)
  {
    objc_msgSend((id)qword_1EDDC80C8, "enqueuePostSynchronizeBlock:", v5);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__UIApplication__performBlockAfterCATransactionCommitSynchronizes___block_invoke;
    block[3] = &unk_1E16B1BF8;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __67__UIApplication__performBlockAfterCATransactionCommitSynchronizes___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)qword_1EDDC80C8, "enqueuePostSynchronizeBlock:", *(_QWORD *)(a1 + 32));
}

+ (void)_attemptRequestingSystemUIServiceSceneWithRetry
{
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  unint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (byte_1EDDC800F++)
  {
    v4 = qword_1EDDC8190;
    if (!qword_1EDDC8190)
    {
      v4 = __UILogCategoryGetNode("SystemUIService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1EDDC8190);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = byte_1EDDC800F;
      v6 = "Requesting a scene for systemUIService from the default system shell (attempt %u).";
      v7 = v5;
      v8 = 8;
LABEL_10:
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    v9 = qword_1EDDC8188;
    if (!qword_1EDDC8188)
    {
      v9 = __UILogCategoryGetNode("SystemUIService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1EDDC8188);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Requesting a scene for systemUIService from the default system shell.";
      v7 = v10;
      v8 = 2;
      goto LABEL_10;
    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__UIApplication__attemptRequestingSystemUIServiceSceneWithRetry__block_invoke;
  v11[3] = &__block_descriptor_40_e30_v24__0__FBSScene_8__NSError_16l;
  v11[4] = a1;
  objc_msgSend(a1, "_requestSystemUIServiceSceneWithCompletion:", v11);
}

void __64__UIApplication__attemptRequestingSystemUIServiceSceneWithRetry__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  int v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "descriptionWithMultilinePrefix:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("<no error provided>");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    if (objc_msgSend(v8, "isBSServiceConnectionError"))
    {
      v13 = qword_1EDDC81A0;
      if (!qword_1EDDC81A0)
      {
        v13 = __UILogCategoryGetNode("SystemUIService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&qword_1EDDC81A0);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v24 = 138543362;
        v25 = v12;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "request for systemUIService scene failed due to an XPC error (the default shell probably crashed): %{public}@", (uint8_t *)&v24, 0xCu);
      }
      if (byte_1EDDC800F <= 2u)
      {
        objc_msgSend(*(id *)(a1 + 32), "_attemptRequestingSystemUIServiceSceneWithRetry");

        goto LABEL_12;
      }
      v20 = qword_1EDDC81A8;
      if (!qword_1EDDC81A8)
      {
        v20 = __UILogCategoryGetNode("SystemUIService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&qword_1EDDC81A8);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        v17 = "Scene request retry attempts exhausted.";
        v18 = v21;
        v19 = 2;
        goto LABEL_21;
      }
    }
    else
    {
      v15 = qword_1EDDC81B0;
      if (!qword_1EDDC81B0)
      {
        v15 = __UILogCategoryGetNode("SystemUIService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1EDDC81B0);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v24 = 138543362;
        v25 = v12;
        v17 = "request for systemUIService scene from defaultShell failed: %{public}@";
        v18 = v16;
        v19 = 12;
LABEL_21:
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v24, v19);
      }
    }
    v22 = qword_1EDDC81B8;
    if (!qword_1EDDC81B8)
    {
      v22 = __UILogCategoryGetNode("SystemUIService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&qword_1EDDC81B8);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = 138543362;
      v25 = v12;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Calling exit(0) because we cannot continue without a scene: %{public}@", (uint8_t *)&v24, 0xCu);
    }
    exit(0);
  }
  objc_storeStrong((id *)&qword_1EDDC8198, a2);
LABEL_12:

}

+ (void)_requestSystemUIServiceSceneWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isSystemUIService") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIApplication.m"), 3866, CFSTR("SystemUIService scene can not be requested from an app that isn't a SystemUIService"));

  }
  objc_msgSend((id)qword_1EDDC80A8, "defaultService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "_systemUIServiceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v8);

  objc_msgSend((id)objc_opt_class(), "_systemUIServiceClientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInitialClientSettings:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__UIApplication__requestSystemUIServiceSceneWithCompletion___block_invoke;
  v12[3] = &unk_1E16DCFD0;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v6, "requestSceneWithOptions:completion:", v7, v12);

}

uint64_t __60__UIApplication__requestSystemUIServiceSceneWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)__completeAndRunAsPlugin
{
  void *v3;
  const char *v4;
  id v5;
  const char *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int out_token;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFFE7FFFFFFFLL | 0x80000000;
  out_token = 0;
  _UIMainBundleIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIViewServiceConnectionNotificationName(v3, v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  notify_register_check(v6, &out_token);
  notify_set_state(out_token, 1uLL);
  notify_post(v6);
  v7 = qword_1EDDC81C0;
  if (!qword_1EDDC81C0)
  {
    v7 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&qword_1EDDC81C0);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = v6;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}s", buf, 0xCu);
  }
  self->_eventDispatcher->_mainEnvironment->_isSystemApplication = 0;
  byte_1EDDC7FF1 = 0;
  __IsRunningTests = 0;
  __LaunchTime = CACurrentMediaTime();
  __ExecOrResumeTime = CACurrentMediaTime();
  if (__IsRunningTests)
  {
    v9 = (void *)qword_1EDDC8030;
    qword_1EDDC8030 = (uint64_t)CFSTR("launch suspended");

    -[UIApplication startedTest:](self, "startedTest:", qword_1EDDC8030);
  }
  _requestHardwareEventsIfNeeded();
  +[FBSSceneTransitionContext transitionContext](UIApplicationSceneTransitionContext, "transitionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _runWithMainScene:transitionContext:completion:](self, "_runWithMainScene:transitionContext:completion:", 0, v10, 0);

  entr_act_end();
}

- (void)activityContinuationManager:(id)a3 displayProgressUI:(id)a4 dismissalHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a5;
  _UINSLocalizedStringWithDefaultValue(CFSTR("Handoff"), CFSTR("Handoff"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Waiting for Handoff to “%@”."), CFSTR("Waiting for Handoff to “%@”."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _localizedApplicationName](self, "_localizedApplicationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIApplicationModalProgressController sharedInstance](_UIApplicationModalProgressController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIApplication _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI"))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke;
    v18[3] = &unk_1E16B1BA0;
    v13 = &v19;
    v19 = v6;
    v14 = v6;
    objc_msgSend(v12, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v7, v10, 0, v11, v18);
  }
  else
  {
    -[UIApplication _setIsDisplayingActivityContinuationUI:](self, "_setIsDisplayingActivityContinuationUI:", 1);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2;
    v16[3] = &unk_1E16B1BA0;
    v13 = &v17;
    v17 = v6;
    v15 = v6;
    objc_msgSend(v12, "displayWithTitle:message:progress:buttonTitle:sourceViewController:preDisplayTestBlock:dismissalHandler:", v7, v10, 0, v11, 0, 0, v16);
  }

}

uint64_t __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)activityContinuationManager:(id)a3 configureProgressUIWithError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[UIApplication _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI", a3, a4))
  {
    +[_UIApplicationModalProgressController sharedInstance](_UIApplicationModalProgressController, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIApplication _setIsDisplayingActivityContinuationUI:](self, "_setIsDisplayingActivityContinuationUI:", 0);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Handoff"), CFSTR("Handoff"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Handoff Failed"), CFSTR("Handoff Failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("OK"), CFSTR("OK"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v5, v6, 0, v7, 0);

  }
}

- (void)activityContinuationManager:(id)a3 hideProgressUIWithCompletion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v5 = (void (**)(_QWORD))a4;
  if (-[UIApplication _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI"))
  {
    +[_UIApplicationModalProgressController sharedInstance](_UIApplicationModalProgressController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _setIsDisplayingActivityContinuationUI:](self, "_setIsDisplayingActivityContinuationUI:", 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__UIApplication_activityContinuationManager_hideProgressUIWithCompletion___block_invoke;
    v7[3] = &unk_1E16B1BA0;
    v8 = v5;
    objc_msgSend(v6, "hideAfterMinimumUptimeWithDismissalHandler:", v7);

  }
  else if (v5)
  {
    v5[2](v5);
  }

}

uint64_t __74__UIApplication_activityContinuationManager_hideProgressUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)activityContinuationManagerUserCancelledError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB28A8];
  v9 = *MEMORY[0x1E0CB2D50];
  _UINSLocalizedStringWithDefaultValue(CFSTR("User cancelled waiting for the activity"), CFSTR("User cancelled waiting for the activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 3072, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)activityContinuationManagerHandleErrorsByConfiguringProgressUI:(id)a3
{
  char v3;

  if (-[UIApplication _isDisplayingActivityContinuationUI](self, "_isDisplayingActivityContinuationUI", a3))
    v3 = objc_opt_respondsToSelector() ^ 1;
  else
    v3 = 0;
  return v3 & 1;
}

- (BOOL)activityContinuationManager:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  int v6;
  const __CFString *v7;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[UIApplicationDelegate application:willContinueUserActivityWithType:](self->_delegate, "application:willContinueUserActivityWithType:", self, v5);
    if (_UIStateRestorationDebugLogEnabled())
    {
      v7 = CFSTR("No");
      if (v6)
        v7 = CFSTR("Yes");
      NSLog(CFSTR("%s: Delegate returned %@ from willContinueUserActivityWithType:"), "-[UIApplication activityContinuationManager:willContinueUserActivityWithType:]", v7);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)activityContinuationManager:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  UIApplicationDelegate *delegate;
  id v7;
  char v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke;
    v16[3] = &unk_1E16B1548;
    v7 = v5;
    v17 = v7;
    v8 = -[UIApplicationDelegate application:continueUserActivity:restorationHandler:](delegate, "application:continueUserActivity:restorationHandler:", self, v7, v16);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v7, "_hasInteraction")
      && (objc_msgSend(v7, "_accessedInteraction") & 1) == 0)
    {
      v9 = activityContinuationManager_continueUserActivity____s_category;
      if (!activityContinuationManager_continueUserActivity____s_category)
      {
        v9 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&activityContinuationManager_continueUserActivity____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_application_continueUserActivity_restorationHandler_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "-[%@ %@] %@ has an interaction attached but it is not handled", buf, 0x20u);

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke_2;
  v5[3] = &unk_1E16B1B50;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke_2(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Calling restoreUserActivityState: for activity %@ on restorable object %@"), "-[UIApplication activityContinuationManager:continueUserActivity:]_block_invoke_2", *(_QWORD *)(a1 + 40), v7);
          objc_msgSend(v7, "restoreUserActivityState:", *(_QWORD *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)activityContinuationManager:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIApplicationDelegate application:didFailToContinueUserActivityWithType:error:](self->_delegate, "application:didFailToContinueUserActivityWithType:error:", self, v8, v7);

}

+ (id)displayManagerObserver
{
  return +[_UIDisplayObserver sharedObserver](_UIDisplayObserver, "sharedObserver");
}

- (void)workspaceShouldExit:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6 && (objc_msgSend(v6, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 4208, CFSTR("transitionContext is of an unexpected class : %@"), v6);

  }
  v10 = v6;
  kdebug_trace();
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _mainScene](self, "_mainScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceExitWithTransitionContext:scene:", v10, v8);

  kdebug_trace();
}

void __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int applicationFlags;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  kdebug_trace();
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_invalidate");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v10, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v18, "UIActionType") == 35)
        {
          v19 = v18;
          objc_msgSend(v19, "persistedIdentifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend((id)UIApp, "_discardSceneSessionsWithPersistentIdentifiers:skippingPersistenceDeletion:", v20, 0);

          v15 = 1;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  +[UIScene _persistenceIdentifierForScene:](UIScene, "_persistenceIdentifierForScene:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v15 & 1) == 0 && (objc_msgSend(v9, "isPersistable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _discardSceneSessionsWithPersistentIdentifiers:skippingPersistenceDeletion:](self, "_discardSceneSessionsWithPersistentIdentifiers:skippingPersistenceDeletion:", v22, 1);

  }
  if (qword_1EDDC8198 && (id)qword_1EDDC8198 == v9)
  {
    v31 = qword_1EDDC81C8;
    if (!qword_1EDDC81C8)
    {
      v31 = __UILogCategoryGetNode("UILog", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v31, (unint64_t *)&qword_1EDDC81C8);
    }
    v32 = *(NSObject **)(v31 + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "systemUIService scene is going away - exiting", buf, 2u);
    }
    exit(0);
  }
  objc_msgSend(v9, "setDelegate:", 0);
  objc_msgSend((id)qword_1EDDC8098, "removeObject:", v9);
  __cachedMostActiveWindowScene = 0;
  objc_msgSend(v9, "settings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "displayConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:", v25);
  applicationFlags = self->_applicationFlags;
  if (!objc_msgSend((id)qword_1EDDC8098, "count")
    && ((applicationFlags >> 25) & 0xF) != 0
    && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceEndIngnoringInteractionEventsForCarPlayApp, (uint64_t)CFSTR("ForceEndIngnoringInteractionEventsForCarPlayApp"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EDDA8234))
  {
    if (qword_1EDDC8180 != -1)
      dispatch_once(&qword_1EDDC8180, &__block_literal_global_957);
    if (byte_1EDDC800E)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v43 = (applicationFlags >> 25) & 0xF;
          _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "The last scene was removed with %i missing calls to endIgnoringInteractionEvents", buf, 8u);
        }

      }
      else
      {
        v27 = qword_1EDDC81D0;
        if (!qword_1EDDC81D0)
        {
          v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v27, (unint64_t *)&qword_1EDDC81D0);
        }
        v28 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v43 = (applicationFlags >> 25) & 0xF;
          _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "The last scene was removed with %i missing calls to endIgnoringInteractionEvents", buf, 8u);
        }
      }
      -[UIApplication __forceEndIgnoringInteractionEvents]((uint64_t)self);
    }
  }
  if (v11)
  {
    v29 = (void *)UIApp;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __77__UIApplication_workspace_willDestroyScene_withTransitionContext_completion___block_invoke;
    v36[3] = &unk_1E16B1BF8;
    v37 = v11;
    objc_msgSend(v29, "_scheduleSceneEventResponseForScene:withResponseBlock:", v9, v36);

  }
  kdebug_trace();

}

void __77__UIApplication_workspace_willDestroyScene_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D232A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)workspace:(id)a3 didReceiveActions:(id)a4
{
  void *v5;
  NSMutableSet *actionsPendingInitialization;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  kdebug_trace();
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "lifecycleWantsUnnecessaryDelayForSceneDelivery")
    && (objc_msgSend(v5, "activatedOnce") & 1) == 0)
  {
    actionsPendingInitialization = self->_actionsPendingInitialization;
    if (!actionsPendingInitialization)
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = self->_actionsPendingInitialization;
      self->_actionsPendingInitialization = v7;

      actionsPendingInitialization = self->_actionsPendingInitialization;
    }
    -[NSMutableSet unionSet:](actionsPendingInitialization, "unionSet:", v9);
  }
  else
  {
    -[UIApplication _handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:](self, "_handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:", v9, 0, 0, 0);
  }
  kdebug_trace();

}

- (void)_startHangTracer
{
  byte_1EDDC8010 = 0;
  -[UIApplication _updateHangTracer](self, "_updateHangTracer");
}

- (double)_execOrResumeTime
{
  return *(double *)&__ExecOrResumeTime;
}

- (double)_launchTime
{
  return *(double *)&__LaunchTime;
}

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 1;
}

- (void)_runWithDaemonScene:(id)a3 completion:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t applicationFlags;
  uint64_t v27;
  int64_t v28;
  void *v29;
  _QWORD *p_applicationFlags;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  UIApplication *v34;
  id v35;
  void *v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  kdebug_trace();
  v7 = -[_UIApplicationInfoParser interfaceOrientation](self->_appInfo, "interfaceOrientation");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  *((_QWORD *)&self->_applicationFlags + 1) &= ~0x800000000uLL;
  BSSetMainThreadPriorityFixedForUI();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v8;
  objc_msgSend(v9, "_setInterfaceOrientation:", v8);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "_updateTransformLayer");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v13);
  }

  -[UIApplication setReceivesMemoryWarnings:](self, "setReceivesMemoryWarnings:", 1);
  v36 = v6;
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:](self, "_callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:", 0, v16, 0, 0);

  v34 = self;
  -[UIApplication _stopDeactivatingForReason:](self, "_stopDeactivatingForReason:", 10);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v22, "_delegateViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {

        }
        else if ((objc_msgSend(v22, "_isTextEffectsWindow") & 1) == 0)
        {
          v24 = _runWithDaemonScene_completion____s_category;
          if (!_runWithDaemonScene_completion____s_category)
          {
            v24 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v24, (unint64_t *)&_runWithDaemonScene_completion____s_category);
          }
          v25 = *(NSObject **)(v24 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Application windows are expected to have a root view controller at the end of application launch", buf, 2u);
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v19);
  }

  -[UIApplication _fixupBackgroundHitTestWindow](v34, "_fixupBackgroundHitTestWindow");
  applicationFlags = (uint64_t)v34->_applicationFlags;
  if ((applicationFlags & 0x80000) == 0)
  {
    v27 = *((_QWORD *)&v34->_applicationFlags + 1);
    *(_QWORD *)&v34->_applicationFlags = applicationFlags | 0x80000;
    *((_QWORD *)&v34->_applicationFlags + 1) = v27;
  }
  v28 = v33;
  if (v33 >= 5)
    v28 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:](UIDevice, "currentDeviceOrientationAllowingAmbiguous:", 1);
  if ((unint64_t)(v28 - 1) <= 3)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isGeneratingDeviceOrientationNotifications") & 1) == 0)
      *((_QWORD *)&v34->_applicationFlags + 1) = *((_QWORD *)&v34->_applicationFlags + 1) & 0xFFFFFFFFFFF1FFFFLL | (v28 << 17);
    objc_msgSend(v29, "setOrientation:animated:", v28, 0);

  }
  p_applicationFlags = &v34->_applicationFlags;
  v31 = (uint64_t)v34->_applicationFlags;
  if ((v31 & 0x80000) != 0)
  {
    v32 = *((_QWORD *)&v34->_applicationFlags + 1);
    *p_applicationFlags = v31 & 0xFFFFFFFFFFF7FFFFLL;
    *((_QWORD *)&v34->_applicationFlags + 1) = v32;
    -[UIApplication _reportMainSceneUpdateFinished:](v34, "_reportMainSceneUpdateFinished:", v35);
    *p_applicationFlags |= 0x80000uLL;
  }
  else
  {
    -[UIApplication _reportMainSceneUpdateFinished:](v34, "_reportMainSceneUpdateFinished:", v35);
  }
  kdebug_trace();

}

uint64_t __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveSnapshotWithName:", CFSTR("AutomaticDefaultPNG"));
}

- (int64_t)_currentExpectedInterfaceOrientation
{
  $A703540AA7C67065EB9094A317CAB0A9 *p_applicationFlags;
  uint64_t v4;
  int64_t result;

  p_applicationFlags = &self->_applicationFlags;
  v4 = *((_QWORD *)&self->_applicationFlags + 1);
  result = (v4 >> 17) & 7;
  if (!(_DWORD)result)
  {
    result = -[UIApplication _safeInterfaceOrientationForNoWindow](self, "_safeInterfaceOrientationForNoWindow");
    v4 = *((_QWORD *)p_applicationFlags + 1);
  }
  *(_QWORD *)&self->_applicationFlags = *(_QWORD *)p_applicationFlags;
  *((_QWORD *)&self->_applicationFlags + 1) = v4 & 0xFFFFFFFFFFF1FFFFLL;
  return result;
}

- (void)_unregisterForSignificantTimeChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)UIApp, CFSTR("SignificantTimeChangeNotification"), 0);
}

- (void)_unregisterForLanguageChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)UIApp, CFSTR("com.apple.language.changed"), 0);
}

- (void)_unregisterForLocaleChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)UIApp, CFSTR("AppleNumberPreferencesChangedNotification"), 0);
}

- (void)_unregisterForTimeChangedNotification
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, (const void *)UIApp, (CFNotificationName)*MEMORY[0x1E0C9B070], 0);
}

void __54__UIApplication__registerForNameLayerTreeNotification__block_invoke()
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
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "_recursivelyNameLayerTree");
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    }
    while (v2);
  }

  NSLog(CFSTR("named windows"));
}

uint64_t __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_3(uint64_t a1, int token)
{
  uint64_t v3;
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  v3 = state64;
  result = getpid();
  if (v3 == (int)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (int)_loadMainNibFileNamed:(id)a3 bundle:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *topLevelNibObjects;
  int v9;
  unint64_t v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "loadNibNamed:owner:options:", v6, self, 0);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topLevelNibObjects = self->_topLevelNibObjects;
  self->_topLevelNibObjects = v7;

  if (self->_topLevelNibObjects)
  {
    v9 = 0;
  }
  else
  {
    v10 = _loadMainNibFileNamed_bundle____s_category;
    if (!_loadMainNibFileNamed_bundle____s_category)
    {
      v10 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_loadMainNibFileNamed_bundle____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Failed to load NSMainNibFile %@.", (uint8_t *)&v13, 0xCu);
    }
    v9 = 2;
  }

  return v9;
}

- (id)_storyboardInitialMenu
{
  id storyboardInitialMenu;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  storyboardInitialMenu = self->_storyboardInitialMenu;
  if (!storyboardInitialMenu)
  {
    -[UIApplication _mainStoryboardName](self, "_mainStoryboardName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIApplication _hasStoryboard](self, "_hasStoryboard"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "_instantiateInitialMenu");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_storyboardInitialMenu;
      self->_storyboardInitialMenu = v7;

    }
    storyboardInitialMenu = self->_storyboardInitialMenu;
  }
  return storyboardInitialMenu;
}

- (id)userInfoDictionaryForRunLoopMode:(id)a3 requester:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v14[0] = CFSTR("_UIApplicationRunLoopMode");
    v14[1] = CFSTR("_UIApplicationRunLoopModeRequesterUserInfoKey");
    v15[0] = a3;
    v15[1] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a4;
    v7 = a3;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("_UIApplicationRunLoopMode");
    v13 = a3;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = a3;
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }

  return v8;
}

- (void)pushRunLoopMode:(id)a3
{
  -[UIApplication pushRunLoopMode:requester:](self, "pushRunLoopMode:requester:", a3, 0);
}

- (void)pushRunLoopMode:(id)a3 requester:(id)a4
{
  -[UIApplication _pushRunLoopMode:requester:reason:](self, "_pushRunLoopMode:requester:reason:", a3, a4, 0);
}

- (void)_pushRunLoopMode:(id)a3 requester:(id)a4 reason:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    v11 = _pushRunLoopMode_requester_reason____s_category;
    if (!_pushRunLoopMode_requester_reason____s_category)
    {
      v11 = __UILogCategoryGetNode("SpringBoardRunLoopMode", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_pushRunLoopMode_requester_reason____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v8;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v15;
      v24 = 2050;
      v25 = v9;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Push:%{public}@ \"%{public}@\" requester:<%{public}@ %{public}p>", (uint8_t *)&v18, 0x2Au);

    }
  }
  _UIApplicationInstallAutoreleasePoolsIfNecessaryForMode(v8);
  GSEventPushRunLoopMode();
  -[UIApplication userInfoDictionaryForRunLoopMode:requester:](self, "userInfoDictionaryForRunLoopMode:requester:", v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("_UIApplicationRunLoopModePushNotification"), self, v16);

}

- (void)popRunLoopMode:(id)a3
{
  -[UIApplication popRunLoopMode:requester:](self, "popRunLoopMode:requester:", a3, 0);
}

- (void)popRunLoopMode:(id)a3 requester:(id)a4
{
  -[UIApplication _popRunLoopMode:requester:reason:](self, "_popRunLoopMode:requester:reason:", a3, a4, 0);
}

- (void)_popRunLoopMode:(id)a3 requester:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    v11 = _popRunLoopMode_requester_reason____s_category;
    if (!_popRunLoopMode_requester_reason____s_category)
    {
      v11 = __UILogCategoryGetNode("SpringBoardRunLoopMode", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_popRunLoopMode_requester_reason____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v8;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v15;
      v24 = 2050;
      v25 = v9;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Pop:%{public}@ \"%{public}@\" requester:<%{public}@ %{public}p>", (uint8_t *)&v18, 0x2Au);

    }
  }
  GSEventPopRunLoopMode();
  -[UIApplication userInfoDictionaryForRunLoopMode:requester:](self, "userInfoDictionaryForRunLoopMode:requester:", v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("_UIApplicationRunLoopModePopNotification"), self, v16);

}

- (BOOL)isNetworkActivityIndicatorVisible
{
  return 0;
}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  return 0;
}

- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3
{
  return 0;
}

+ (Class)_statusBarClass
{
  return (Class)objc_opt_class();
}

+ (Class)_statusBarWindowClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_hostsSystemStatusBar
{
  return 1;
}

- (void)_createStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5
{
  -[UIApplication _createStatusBarWithRequestedStyle:orientation:hidden:forWindowScene:](self, "_createStatusBarWithRequestedStyle:orientation:hidden:forWindowScene:", a3, a4, a5, 0);
}

- (void)_createStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5 forWindowScene:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  SEL v12;
  UIApplication *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  id v17;
  double v18;
  UIStatusBar *v19;
  UIStatusBar *statusBar;
  void *v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v9 = a6;
  if (!-[UIApplication _isSpringBoard](self, "_isSpringBoard"))
  {
    if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RaiseForStatusBarCreation, (uint64_t)CFSTR("RaiseForStatusBarCreation"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EDDA822C)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = a2;
      v13 = self;
      v14 = 5884;
LABEL_13:
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("UIApplication.m"), v14, CFSTR("App called -statusBar or -statusBarWindow on UIApplication: this code must be changed as there's no longer a status bar or status bar window. Use the statusBarManager object on the window scene instead."));

      goto LABEL_14;
    }
    if (!_UIIsPrivateMainBundle())
    {
      if (!dyld_program_sdk_at_least())
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = a2;
      v13 = self;
      v14 = 5890;
      goto LABEL_13;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "App called -statusBar or -statusBarWindow on UIApplication: this code must be changed as there's no longer a status bar or status bar window. Use the statusBarManager object on the window scene instead.", buf, 2u);
      }

    }
    else
    {
      v15 = _createStatusBarWithRequestedStyle_orientation_hidden_forWindowScene____s_category;
      if (!_createStatusBarWithRequestedStyle_orientation_hidden_forWindowScene____s_category)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&_createStatusBarWithRequestedStyle_orientation_hidden_forWindowScene____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "App called -statusBar or -statusBarWindow on UIApplication: this code must be changed as there's no longer a status bar or status bar window. Use the statusBarManager object on the window scene instead.", v24, 2u);
      }
    }
  }
LABEL_14:
  kdebug_trace();
  v17 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_statusBarClass"));
  +[UIStatusBar_Base _heightForStyle:orientation:forStatusBarFrame:inWindow:](UIStatusBar, "_heightForStyle:orientation:forStatusBarFrame:inWindow:", 0, 1, 1, 0);
  v19 = (UIStatusBar *)objc_msgSend(v17, "initWithFrame:", 0.0, 0.0, 0.0, v18);
  statusBar = self->_statusBar;
  self->_statusBar = v19;

  -[UIStatusBar_Base setStyleDelegate:](self->_statusBar, "setStyleDelegate:", self);
  kdebug_trace();
  kdebug_trace();
  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass")), "_initWithOrientation:", a4);
  kdebug_trace();
  -[UIApplication _setStatusBarWindow:forScene:](self, "_setStatusBarWindow:forScene:", v21, v9);
  objc_msgSend(v9, "statusBarManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    kdebug_trace();
    objc_msgSend(v22, "updateStatusBarAppearance");
    kdebug_trace();
  }
  kdebug_trace();
  objc_msgSend(v21, "setStatusBar:", self->_statusBar);
  objc_msgSend(v21, "setOrientation:animationParameters:", a4, 0);
  objc_msgSend(v21, "setWindowLevel:", 1000.0);
  objc_msgSend(v21, "_orderFrontWithoutMakingKey");
  kdebug_trace();

}

- (id)statusBarWindow
{
  -[UIApplication _createStatusBarIfNeededWithOrientation:forWindowScene:](self, "_createStatusBarIfNeededWithOrientation:forWindowScene:", 0, 0);
  return self->_embeddedScreenStatusBarWindow;
}

- (id)_statusBarWindow
{
  void *v4;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 5986, CFSTR("The status bar window cannot be accessed from within an application."));

  }
  return 0;
}

- (id)_statusBarWindowIfExistsForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  UIStatusBarWindow *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIStatusBarWindow *v13;
  UIStatusBarWindow *embeddedScreenStatusBarWindow;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "_screen"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_isEmbeddedScreen"),
        v6,
        (v7 & 1) == 0))
  {
    objc_getAssociatedObject(self, &_UIApplicationAdditionalStatusBarWindowsKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identityToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v12);
    v13 = (UIStatusBarWindow *)objc_claimAutoreleasedReturnValue();
    embeddedScreenStatusBarWindow = v13;
    if (!v13)
      embeddedScreenStatusBarWindow = self->_embeddedScreenStatusBarWindow;
    v8 = embeddedScreenStatusBarWindow;

  }
  else
  {
    v8 = self->_embeddedScreenStatusBarWindow;
  }

  return v8;
}

- (void)_setStatusBarWindow:(id)a3 forScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  UIStatusBarWindow *v10;
  void *embeddedScreenStatusBarWindow;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "_screen"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_isEmbeddedScreen"),
        v8,
        (v9 & 1) == 0))
  {
    objc_getAssociatedObject(self, &_UIApplicationAdditionalStatusBarWindowsKey);
    embeddedScreenStatusBarWindow = (void *)objc_claimAutoreleasedReturnValue();
    if (!embeddedScreenStatusBarWindow)
    {
      embeddedScreenStatusBarWindow = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 2);
      objc_setAssociatedObject(self, &_UIApplicationAdditionalStatusBarWindowsKey, embeddedScreenStatusBarWindow, (void *)1);
    }
    objc_msgSend(v7, "_FBSScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identityToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(embeddedScreenStatusBarWindow, "setObject:forKey:", v15, v14);

  }
  else
  {
    v10 = (UIStatusBarWindow *)v15;
    embeddedScreenStatusBarWindow = self->_embeddedScreenStatusBarWindow;
    self->_embeddedScreenStatusBarWindow = v10;
  }

}

- (void)_statusBarWindow:(id)a3 didMoveFromScene:(id)a4 toScene:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
    -[UIApplication _setStatusBarWindow:forScene:](self, "_setStatusBarWindow:forScene:", 0, v8);
  if (v9)
    -[UIApplication _setStatusBarWindow:forScene:](self, "_setStatusBarWindow:forScene:", v10, v9);

}

- (id)_findWindowForControllingOverallAppearance
{
  return +[UIWindow _findWindowForControllingOverallAppearance](UIWindow, "_findWindowForControllingOverallAppearance");
}

- (void)_setBackgroundStyle:(int64_t)a3
{
  void *v4;
  id v5;

  -[UIApplication _mainScene](self, "_mainScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setBackgroundStyle:", a3);

}

- (id)_implicitStatusBarAnimationParametersWithClass:(Class)a3
{
  void *v4;
  void *v5;

  +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend([a3 alloc], "initWithDefaultParameters");
    objc_msgSend(v4, "_duration");
    objc_msgSend(v5, "setDuration:");
    objc_msgSend(v4, "_delay");
    objc_msgSend(v5, "setDelay:");
    objc_msgSend(v5, "setCurve:", objc_msgSend(v4, "_curve"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_implicitStatusBarStyleAnimationParametersWithViewController:(id)a3
{
  void *v4;

  objc_msgSend(a3, "_preferredStatusBarStyleAnimationParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UIApplication _implicitStatusBarAnimationParametersWithClass:](self, "_implicitStatusBarAnimationParametersWithClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStyleAnimation:", 1);
  }
  return v4;
}

- (id)_implicitStatusBarHiddenAnimationParametersWithViewController:(id)a3 animation:(int64_t)a4
{
  void *v6;

  objc_msgSend(a3, "_preferredStatusBarHideAnimationParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIApplication _implicitStatusBarAnimationParametersWithClass:](self, "_implicitStatusBarAnimationParametersWithClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHideAnimation:", a4);
  }
  return v6;
}

void __55__UIApplication_setStatusBarStyle_animationParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "statusBarManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStatusBarAppearanceWithAnimationParameters:", *(_QWORD *)(a1 + 32));

}

- (void)setStatusBarStyle:(int64_t)a3 animation:(int)a4 startTime:(double)a5 duration:(double)a6 curve:(int64_t)a7
{
  uint64_t v12;
  UIStatusBarStyleAnimationParameters *v13;

  if (a4)
  {
    v12 = *(_QWORD *)&a4;
    v13 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarStyleAnimationParameters setStyleAnimation:](v13, "setStyleAnimation:", v12);
    -[UIStatusBarAnimationParameters setStartTime:](v13, "setStartTime:", a5);
    -[UIStatusBarAnimationParameters setDuration:](v13, "setDuration:", a6);
    -[UIStatusBarAnimationParameters setCurve:](v13, "setCurve:", a7);
  }
  else
  {
    v13 = 0;
  }
  -[UIApplication setStatusBarStyle:animationParameters:](self, "setStatusBarStyle:animationParameters:", a3, v13);

}

- (void)setStatusBarStyle:(int64_t)a3 animation:(int)a4
{
  uint64_t v6;
  UIStatusBarStyleAnimationParameters *v7;

  if (a4)
  {
    v6 = *(_QWORD *)&a4;
    v7 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarStyleAnimationParameters setStyleAnimation:](v7, "setStyleAnimation:", v6);
  }
  else
  {
    v7 = 0;
  }
  -[UIApplication setStatusBarStyle:animationParameters:](self, "setStatusBarStyle:animationParameters:", a3, v7);

}

- (void)setStatusBarStyle:(int64_t)a3 duration:(double)a4
{
  UIStatusBarStyleAnimationParameters *v7;

  if (a4 <= 0.0)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarAnimationParameters setDuration:](v7, "setDuration:", a4);
  }
  -[UIApplication setStatusBarStyle:animationParameters:](self, "setStatusBarStyle:animationParameters:", a3, v7);

}

void __78__UIApplication_setStatusBarHidden_animationParameters_changeApplicationFlag___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "statusBarManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStatusBarAppearanceWithAnimationParameters:", *(_QWORD *)(a1 + 32));

}

- (void)setStatusBarHidden:(BOOL)a3 duration:(double)a4 changeApplicationFlag:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  UIStatusBarHideAnimationParameters *v9;

  v5 = a5;
  v6 = a3;
  if (a4 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    v9 = -[UIStatusBarHideAnimationParameters initWithDefaultParameters]([UIStatusBarHideAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarAnimationParameters setDuration:](v9, "setDuration:", a4);
  }
  -[UIApplication setStatusBarHidden:animationParameters:changeApplicationFlag:](self, "setStatusBarHidden:animationParameters:changeApplicationFlag:", v6, v9, v5);

}

- (void)setStatusBarHidden:(BOOL)a3 duration:(double)a4
{
  -[UIApplication setStatusBarHidden:duration:changeApplicationFlag:](self, "setStatusBarHidden:duration:changeApplicationFlag:", a3, 1, a4);
}

- (void)setStatusBarHidden:(BOOL)hidden animated:(BOOL)animated
{
  -[UIApplication setStatusBarHidden:withAnimation:](self, "setStatusBarHidden:withAnimation:", hidden, animated);
}

- (void)_notifyWillChangeStatusBarFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((*((_BYTE *)&self->_applicationFlags + 6) & 1) != 0)
  {
    if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:willChangeStatusBarFrame:, is incompatible with UIScene lifecycle", buf, 2u);
        }

      }
      else
      {
        v12 = _notifyWillChangeStatusBarFrame____s_category;
        if (!_notifyWillChangeStatusBarFrame____s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&_notifyWillChangeStatusBarFrame____s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:willChangeStatusBarFrame:, is incompatible with UIScene lifecycle", v15, 2u);
        }
      }
    }
    -[UIApplicationDelegate application:willChangeStatusBarFrame:](self->_delegate, "application:willChangeStatusBarFrame:", self, x, y, width, height);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, CFSTR("UIApplicationStatusBarFrameUserInfoKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UIApplicationWillChangeStatusBarFrameNotification"), self, v11);

}

- (void)_notifyDidChangeStatusBarFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((*((_BYTE *)&self->_applicationFlags + 6) & 2) != 0)
  {
    if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:didChangeStatusBarFrame:, is incompatible with UIScene lifecycle", buf, 2u);
        }

      }
      else
      {
        v12 = _notifyDidChangeStatusBarFrame____s_category;
        if (!_notifyDidChangeStatusBarFrame____s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&_notifyDidChangeStatusBarFrame____s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:didChangeStatusBarFrame:, is incompatible with UIScene lifecycle", v15, 2u);
        }
      }
    }
    -[UIApplicationDelegate application:didChangeStatusBarFrame:](self->_delegate, "application:didChangeStatusBarFrame:", self, x, y, width, height);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, CFSTR("UIApplicationStatusBarFrameUserInfoKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UIApplicationDidChangeStatusBarFrameNotification"), self, v11);

}

- (void)setStatusBarOrientation:(int64_t)a3 fromOrientation:(int64_t)a4 windowScene:(id)a5 animationParameters:(id)a6 updateBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  UIApplicationDelegate *delegate;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v44;
  char v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  unint64_t v75;
  NSObject *v76;
  unint64_t v77;
  NSObject *v78;
  unint64_t v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  uint64_t v84;
  id v85;
  char v86;
  void *v87;
  id v88;
  uint8_t v89[16];
  uint8_t v90[16];
  uint8_t buf[16];
  uint8_t v92[16];
  uint8_t v93[16];
  uint8_t v94[16];

  v12 = a5;
  v13 = a6;
  v88 = a7;
  if (!a4)
    a4 = objc_msgSend(v12, "interfaceOrientation");
  -[UIApplication _defaultSceneIfExists](self, "_defaultSceneIfExists");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  if (v12)
    v16 = v15 == 0;
  else
    v16 = 1;
  v87 = (void *)v15;
  v18 = !v16 && v15 == (_QWORD)v12;
  v86 = v18;
  v19 = v12;
  objc_msgSend(v19, "statusBarManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v21 = v19;
  }
  else if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    -[UIApplication _defaultUIWindowHostingUISceneOrMainScreenPlaceholderIfExists](self, "_defaultUIWindowHostingUISceneOrMainScreenPlaceholderIfExists");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_statusBarManager");
    v84 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
    }
    else
    {
      if (qword_1EDDC80D0 != -1)
        dispatch_once(&qword_1EDDC80D0, &__block_literal_global_902);
      if (!byte_1EDDC7FFB)
      {
        if (qword_1EDDC80E0 != -1)
          dispatch_once(&qword_1EDDC80E0, &__block_literal_global_911);
        if (!byte_1EDDC7FFC)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v94 = 0;
              _os_log_fault_impl(&dword_185066000, v83, OS_LOG_TYPE_FAULT, "Forced fallback to deprecated retrieval of a windowScene with -[UIApplication _findUISceneForLegacyInterfaceOrientation]", v94, 2u);
            }

          }
          else
          {
            v79 = qword_1EDDC8248;
            if (!qword_1EDDC8248)
            {
              v79 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v79, (unint64_t *)&qword_1EDDC8248);
            }
            v80 = *(NSObject **)(v79 + 8);
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v93 = 0;
              _os_log_impl(&dword_185066000, v80, OS_LOG_TYPE_ERROR, "Forced fallback to deprecated retrieval of a windowScene with -[UIApplication _findUISceneForLegacyInterfaceOrientation]", v93, 2u);
            }
          }
        }
      }
      -[UIApplication _findUISceneForLegacyInterfaceOrientation](self, "_findUISceneForLegacyInterfaceOrientation");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v23;

    v20 = (void *)v84;
  }
  v24 = 0.0;
  if ((objc_msgSend(v20, "isStatusBarHidden") & 1) == 0)
  {
    objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", a3);
    v24 = v25;
  }
  if (a4 != a3)
  {
    if ((*((_BYTE *)&self->_applicationFlags + 5) & 0x40) != 0
      && objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_fault_impl(&dword_185066000, v81, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:willChangeStatusBarOrientation:duration:, is incompatible with UIScene lifecycle", v92, 2u);
        }

      }
      else
      {
        v75 = qword_1EDDC8250;
        if (!qword_1EDDC8250)
        {
          v75 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v75, (unint64_t *)&qword_1EDDC8250);
        }
        v76 = *(NSObject **)(v75 + 8);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v76, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:willChangeStatusBarOrientation:duration:, is incompatible with UIScene lifecycle", buf, 2u);
        }
      }
    }
    v85 = v19;
    v26 = v13;
    v27 = v21;
    if ((*((_BYTE *)&self->_applicationFlags + 5) & 0x40) != 0)
    {
      delegate = self->_delegate;
      objc_msgSend(v26, "duration");
      -[UIApplicationDelegate application:willChangeStatusBarOrientation:duration:](delegate, "application:willChangeStatusBarOrientation:duration:", self, a3);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryWithObject:forKey:", v31, CFSTR("UIApplicationStatusBarOrientationUserInfoKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("UIApplicationWillChangeStatusBarOrientationNotification"), self, v32);

    +[UIView _updateOrientationForMotionEngine:](UIView, "_updateOrientationForMotionEngine:", a3);
    if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      objc_msgSend(v20, "statusBarFrameForStatusBarHeight:", v24);
      v21 = v27;
    }
    else
    {
      -[UIApplication statusBarFrameForOrientation:](self, "statusBarFrameForOrientation:", a3);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v21 = v27;
      objc_msgSend(v27, "_referenceBounds");
      v33 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a3, v35, v37, v39, v41, v42, v43);
    }
    -[UIApplication _notifyWillChangeStatusBarFrame:](self, "_notifyWillChangeStatusBarFrame:", v33);
    -[UIApplication _setIdleTimerDisabled:forReason:](self, "_setIdleTimerDisabled:forReason:", 1, CFSTR("UIAppOrientationChange"));
    -[UIApplication _setIdleTimerDisabled:forReason:](self, "_setIdleTimerDisabled:forReason:", 0, CFSTR("UIAppOrientationChange"));
    v13 = v26;
    v19 = v85;
  }
  if (!-[UIApplication _isSpringBoard](self, "_isSpringBoard"))
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v45 = v86;
    else
      v45 = 1;
    if ((v45 & 1) == 0)
    {
      objc_msgSend(v21, "screen");
      v46 = objc_claimAutoreleasedReturnValue();

      v44 = (void *)v46;
    }
    objc_msgSend(v44, "_setInterfaceOrientation:", a3);

  }
  v47 = v88;
  if (v88)
    (*((void (**)(id))v88 + 2))(v88);
  -[UIApplication _statusBarWindowIfExistsForScene:](self, "_statusBarWindowIfExistsForScene:", v19);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setOrientation:animationParameters:", a3, v13);

  objc_msgSend(v13, "duration");
  objc_msgSend(v19, "_updateClientSettingsToInterfaceOrientation:withAnimationDuration:", a3);
  if (a4 != a3)
  {
    v49 = 0.0;
    if ((objc_msgSend(v20, "isStatusBarHidden") & 1) == 0)
    {
      objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", a4);
      v49 = v50;
    }
    if (v24 != v49)
    {
      +[UIWindow _noteStatusBarHeightChanged:oldHeight:](UIWindow, "_noteStatusBarHeightChanged:oldHeight:", v24, v49);
      if (!v13 || (objc_msgSend(v13, "duration"), v51 == 0.0))
      {
        v57 = 0;
      }
      else
      {
        v52 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v53 = v19;
        v54 = v13;
        v55 = v21;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "dictionaryWithObject:forKey:", v56, CFSTR("UIApplicationStatusBarHeightChangedDurationKey"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v55;
        v13 = v54;
        v19 = v53;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "postNotificationName:object:userInfo:", CFSTR("UIApplicationStatusBarHeightChangedNotification"), self, v57);

    }
    v59 = v21;
    if ((*((_BYTE *)&self->_applicationFlags + 5) & 0x80) != 0)
    {
      if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v90 = 0;
            _os_log_fault_impl(&dword_185066000, v82, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:didChangeStatusBarOrientation:, is incompatible with UIScene lifecycle", v90, 2u);
          }

          v47 = v88;
        }
        else
        {
          v77 = qword_1EDDC8258;
          if (!qword_1EDDC8258)
          {
            v77 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v77, (unint64_t *)&qword_1EDDC8258);
          }
          v78 = *(NSObject **)(v77 + 8);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v89 = 0;
            _os_log_impl(&dword_185066000, v78, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:didChangeStatusBarOrientation:, is incompatible with UIScene lifecycle", v89, 2u);
          }
        }
      }
      -[UIApplicationDelegate application:didChangeStatusBarOrientation:](self->_delegate, "application:didChangeStatusBarOrientation:", self, a4);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryWithObject:forKey:", v62, CFSTR("UIApplicationStatusBarOrientationUserInfoKey"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "postNotificationName:object:userInfo:", CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), self, v63);

    if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      objc_msgSend(v20, "statusBarFrameForStatusBarHeight:inOrientation:", a4, v49);
      v21 = v59;
    }
    else
    {
      -[UIApplication statusBarFrameForOrientation:](self, "statusBarFrameForOrientation:", a4);
      v66 = v65;
      v68 = v67;
      v70 = v69;
      v72 = v71;
      v21 = v59;
      objc_msgSend(v59, "_referenceBounds");
      v64 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a4, v66, v68, v70, v72, v73, v74);
    }
    -[UIApplication _notifyDidChangeStatusBarFrame:](self, "_notifyDidChangeStatusBarFrame:", v64);
  }

}

- (void)setStatusBarOrientation:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[UIApplication _defaultSceneIfExists](self, "_defaultSceneIfExists");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplication setStatusBarOrientation:fromOrientation:windowScene:animationParameters:updateBlock:](self, "setStatusBarOrientation:fromOrientation:windowScene:animationParameters:updateBlock:", a3, 0, v7, v6, 0);

}

- (void)setStatusBarOrientation:(int64_t)a3 animation:(int)a4 duration:(double)a5
{
  UIStatusBarOrientationAnimationParameters *v7;
  uint64_t v9;
  UIStatusBarOrientationAnimationParameters *v10;
  UIStatusBarOrientationAnimationParameters *v11;

  v7 = 0;
  if (a4 && a5 > 0.0)
  {
    v9 = *(_QWORD *)&a4;
    v10 = -[UIStatusBarOrientationAnimationParameters initWithDefaultParameters]([UIStatusBarOrientationAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarOrientationAnimationParameters setOrientationAnimation:](v10, "setOrientationAnimation:", v9);
    -[UIStatusBarAnimationParameters setDuration:](v10, "setDuration:", a5);
    v7 = v10;
  }
  v11 = v7;
  -[UIApplication setStatusBarOrientation:animationParameters:](self, "setStatusBarOrientation:animationParameters:", a3, v7, a5);

}

- (void)_setStatusBarOrientation:(int64_t)a3 animated:(BOOL)a4
{
  UIStatusBarOrientationAnimationParameters *v6;
  UIStatusBarOrientationAnimationParameters *v7;

  if (a4)
    v6 = -[UIStatusBarOrientationAnimationParameters initWithDefaultParameters]([UIStatusBarOrientationAnimationParameters alloc], "initWithDefaultParameters");
  else
    v6 = 0;
  v7 = v6;
  -[UIApplication setStatusBarOrientation:animationParameters:](self, "setStatusBarOrientation:animationParameters:", a3, v6);

}

- (void)_setStatusBarOrientation:(int64_t)a3
{
  -[UIApplication setStatusBarOrientation:animationParameters:](self, "setStatusBarOrientation:animationParameters:", a3, 0);
}

- (void)setStatusBarOrientation:(UIInterfaceOrientation)interfaceOrientation animated:(BOOL)animated
{
  _BOOL8 v4;
  unint64_t v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v4 = animated;
  if (dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "-[UIApplication setStatusBarOrientation:] and -[UIApplication setStatusBarOrientation:animated:] API have been deprecated on iOS 8.0 and are no-ops on iOS 13.0", v14, 2u);
      }

    }
    else
    {
      v7 = qword_1EDDC8260;
      if (!qword_1EDDC8260)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1EDDC8260);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-[UIApplication setStatusBarOrientation:] and -[UIApplication setStatusBarOrientation:animated:] API have been deprecated on iOS 8.0 and are no-ops on iOS 13.0", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      v9 = qword_1EDDC8268;
      if (!qword_1EDDC8268)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1EDDC8268);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Dead deprecated API use (-[UIApplication setStatusBarOrientation:]). For apps to fix, not UIKit. Please update as soon as possible. As a stopgap, similar SPI still operates", v12, 2u);
      }
    }
  }
  else
  {
    if (qword_1EDDC8270 != -1)
      dispatch_once(&qword_1EDDC8270, &__block_literal_global_1132_0);
    if ((byte_1EDDC8012 & 1) == 0
      && -[UIApplication _isAutorotationDisabledForAppWindows](self, "_isAutorotationDisabledForAppWindows"))
    {
      -[UIApplication _setStatusBarOrientation:animated:](self, "_setStatusBarOrientation:animated:", interfaceOrientation, v4);
    }
  }
}

void __50__UIApplication_setStatusBarOrientation_animated___block_invoke()
{
  void *v0;
  int v1;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.google.ios.youtube"));

  if (v1)
    byte_1EDDC8012 = 1;
}

- (void)setStatusBarOrientation:(UIInterfaceOrientation)statusBarOrientation
{
  -[UIApplication setStatusBarOrientation:animated:](self, "setStatusBarOrientation:animated:", statusBarOrientation, 0);
}

- (NSTimeInterval)statusBarOrientationAnimationDuration
{
  return 0.3;
}

- (id)_systemNavigationAction
{
  return self->_systemNavigationAction;
}

- (void)_setSystemNavigationAction:(id)a3
{
  UISystemNavigationAction *v5;
  unint64_t v6;
  UISystemNavigationAction **p_systemNavigationAction;
  UISystemNavigationAction *systemNavigationAction;
  UISystemNavigationAction *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  UISystemNavigationAction *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (UISystemNavigationAction *)a3;
  v6 = _setSystemNavigationAction____s_category;
  if (!_setSystemNavigationAction____s_category)
  {
    v6 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_setSystemNavigationAction____s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v11 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      -[UISystemNavigationAction titleForDestination:](v5, "titleForDestination:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemNavigationAction URLForDestination:](v5, "URLForDestination:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Setting system navigation action: %@. Primary title: “%@”, secondary URL: “%@”", (uint8_t *)&v15, 0x20u);

    }
  }
  p_systemNavigationAction = &self->_systemNavigationAction;
  systemNavigationAction = self->_systemNavigationAction;
  if (systemNavigationAction != v5)
  {
    if (systemNavigationAction)
    {
      -[UISystemNavigationAction invalidate](systemNavigationAction, "invalidate");
      v9 = *p_systemNavigationAction;
      *p_systemNavigationAction = 0;

    }
    objc_storeStrong((id *)&self->_systemNavigationAction, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("UIApplicationSystemNavigationActionChangedNotification"), self);

  }
}

- (void)_clearSystemNavigationAction
{
  -[UIApplication _setSystemNavigationAction:](self, "_setSystemNavigationAction:", 0);
}

- (id)statusBarSystemNavigationAction:(id)a3
{
  return self->_systemNavigationAction;
}

- (void)setGlowAnimationEnabled:(BOOL)a3 forStyle:(int64_t)a4
{
  +[UIStatusBarServer postGlowAnimationState:forStyle:](UIStatusBarServer, "postGlowAnimationState:forStyle:", a3, a4);
}

- (void)setDoubleHeightStatusText:(id)a3 forStyle:(int64_t)a4
{
  +[UIStatusBarServer postDoubleHeightStatusString:forStyle:](UIStatusBarServer, "postDoubleHeightStatusString:forStyle:", a3, a4);
}

- (void)setDoubleHeightPrefixText:(id)a3
{
  NSLog(CFSTR("UIApplication's -setDoubleHeightPrefixText: is deprecated and no longer does anything.           Use -setDoubleHeightStatusText:forStyle: to set the prefix and the status text together."), a2, a3);
}

- (void)setDoubleHeightStatusText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  NSLog(&CFSTR("UIApplication's -setDoubleHeightStatusText: is deprecated.           Use -setDoubleHeightStatusText:forStyle: t"
               "o set the prefix and the status text together.").isa);
  _UIMainBundleIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.VoiceMemos")) & 1) != 0)
  {
    v4 = 206;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.nike")))
    {
      NSLog(CFSTR("Bundle ID not recognized. -setDoubleHeightStatusText: will have no effect."));
      goto LABEL_7;
    }
    v4 = 201;
  }
  +[UIStatusBarServer postDoubleHeightStatusString:forStyle:](UIStatusBarServer, "postDoubleHeightStatusString:forStyle:", v5, v4);
LABEL_7:

}

- (id)_defaultTopNavBarTintColor
{
  return 0;
}

- (BOOL)isRunningInTaskSwitcher
{
  void *v2;
  char v3;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runningInTaskSwitcher");

  return v3;
}

- (BOOL)_isLaunchedSuspended
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 2) >> 2) & 1;
}

- (void)suspend
{
  -[UIApplication suspendReturningToLastApp:](self, "suspendReturningToLastApp:", 0);
}

- (void)suspendReturningToLastApp:(BOOL)a3
{
  UIDismissSceneAction *v3;
  void *v4;
  id v5;

  -[UIApplication _mainScene](self, "_mainScene", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = objc_alloc_init(UIDismissSceneAction);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendActions:", v4);

  }
}

- (unsigned)_frontmostApplicationPort
{
  return 0;
}

+ (BOOL)isRunningEventPump
{
  int v2;
  BOOL v3;
  mach_port_t sp;

  v2 = isRunningEventPump__isRunningEventPump;
  if (isRunningEventPump__isRunningEventPump == 255)
  {
    isRunningEventPump__isRunningEventPump = 0;
    sp = 0;
    if (bootstrap_look_up(*MEMORY[0x1E0C81720], "com.apple.eventpump", &sp))
      v3 = 0;
    else
      v3 = sp + 1 >= 2;
    if (v3)
    {
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], sp);
      isRunningEventPump__isRunningEventPump = 1;
    }
    v2 = isRunningEventPump__isRunningEventPump;
  }
  return v2 != 0;
}

- (void)_scrollsToTopInitiatorView:(id)a3 touchesEnded:(id)a4 withEvent:(id)a5
{
  id v8;
  id v9;
  UIStatusBar *v10;

  v10 = (UIStatusBar *)a3;
  v8 = a4;
  v9 = a5;
  if (self->_statusBar == v10 && (*((_BYTE *)&self->_applicationFlags + 10) & 0x20) != 0)
    -[UIApplicationDelegate _application:statusBarTouchesEnded:](self->_delegate, "_application:statusBarTouchesEnded:", self, v9);

}

- (void)setWantsVolumeButtonEvents:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr;
  v11 = getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr;
  if (!getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr)
  {
    v5 = SpringBoardServicesLibrary_1();
    v4 = dlsym(v5, "SBSUIAppSetWantsVolumeButtonEvents");
    v9[3] = (uint64_t)v4;
    getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    ((void (*)(_BOOL8))v4)(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void softlink_SBSUIAppSetWantsVolumeButtonEvents(BOOL)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("UIApplication.m"), 488, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)setWantsLockEvents:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr;
  v11 = getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr;
  if (!getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr)
  {
    v5 = SpringBoardServicesLibrary_1();
    v4 = dlsym(v5, "SBSUIAppSetWantsLockButtonEvents");
    v9[3] = (uint64_t)v4;
    getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    ((void (*)(_BOOL8))v4)(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void softlink_SBSUIAppSetWantsLockButtonEvents(BOOL)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("UIApplication.m"), 487, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)_postSimpleRemoteNotificationForAction:(int64_t)a3 andContext:(int64_t)a4 trackID:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  objc_msgSend(v9, "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v11, CFSTR("UIApplicationSimpleRemoteActionType"), v12, CFSTR("UIApplicationSimpleRemoteActionContext"), v10, CFSTR("UIApplicationSimpleRemoteActionTrackID"), 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("UIApplicationSimpleRemoteActionNotification"), self, v14);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (_UIPressesContainsPressType(v6, 102))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("_UIApplicationVolumeUpButtonDownNotification");
LABEL_7:
    objc_msgSend(v8, "postNotificationName:object:", v10, 0);

    goto LABEL_8;
  }
  if (_UIPressesContainsPressType(v6, 103))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("_UIApplicationVolumeDownButtonDownNotification");
    goto LABEL_7;
  }
  if (_UIPressesContainsPressType(v6, 601))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("_UIApplicationCameraShutterButtonDownNotification");
    goto LABEL_7;
  }
  if ((_UIPressesContainsPressType(v6, 7) & 1) == 0
    && (_UIPressesContainsPressType(v6, 6) & 1) == 0
    && (_UIPressesContainsPressType(v6, 5) & 1) == 0)
  {
    if (_UIPressesContainsDirectionalPress(v6))
    {
      -[UIApplication _sendMoveEventWithPressesEvent:](self, "_sendMoveEventWithPressesEvent:", v7);
    }
    else if (_UIPressesContainsExternalKeyboardSource(v6))
    {
      -[UIApplication _handleKeyboardPressEvent:](self, "_handleKeyboardPressEvent:", v7);
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UIApplication;
      -[UIResponder pressesBegan:withEvent:](&v11, sel_pressesBegan_withEvent_, v6, v7);
    }
  }
LABEL_8:

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __objc2_class *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (_UIPressesContainsPressType(v6, 102))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("_UIApplicationVolumeUpButtonUpNotification");
LABEL_7:
    objc_msgSend(v8, "postNotificationName:object:", v10, 0);
LABEL_8:

    goto LABEL_9;
  }
  if (_UIPressesContainsPressType(v6, 103))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("_UIApplicationVolumeDownButtonUpNotification");
    goto LABEL_7;
  }
  if (_UIPressesContainsPressType(v6, 601))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("_UIApplicationCameraShutterButtonUpNotification");
    goto LABEL_7;
  }
  if (_UIPressesContainsPressType(v6, 7))
  {
    v11 = UIUnhandledBackButtonAction;
LABEL_15:
    v9 = (void *)objc_msgSend([v11 alloc], "initWithInfo:responder:", 0, 0);
    _FBSSceneForPressesEvent(v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendActions:", v13);

    goto LABEL_8;
  }
  if ((_UIPressesContainsPressType(v6, 6) & 1) != 0)
    goto LABEL_9;
  if (_UIPressesContainsPressType(v6, 5))
  {
    *((_QWORD *)&self->_applicationFlags + 1) |= 0x400000000000uLL;
    v11 = UIUnhandledMenuButtonAction;
    goto LABEL_15;
  }
  if (_UIPressesContainsDirectionalPress(v6))
  {
    v14.receiver = self;
    v14.super_class = (Class)UIApplication;
    -[UIResponder pressesEnded:withEvent:](&v14, sel_pressesEnded_withEvent_, v6, v7);
  }
  else if (_UIPressesContainsExternalKeyboardSource(v6))
  {
    -[UIApplication _handleKeyboardPressEvent:](self, "_handleKeyboardPressEvent:", v7);
  }
LABEL_9:

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if ((_UIPressesContainsPressType(v6, 201) & 1) == 0
    && (_UIPressesContainsPressType(v6, 102) & 1) == 0
    && (_UIPressesContainsPressType(v6, 103) & 1) == 0
    && (_UIPressesContainsPressType(v6, 601) & 1) == 0
    && (_UIPressesContainsPressType(v6, 7) & 1) == 0
    && (_UIPressesContainsPressType(v6, 6) & 1) == 0
    && (_UIPressesContainsPressType(v6, 5) & 1) == 0
    && (_UIPressesContainsDirectionalPress(v6) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIApplication;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)_headsetButtonDown:(__IOHIDEvent *)a3
{
  *((_QWORD *)&self->_applicationFlags + 1) |= 0x100uLL;
}

- (void)_headsetButtonUp:(__IOHIDEvent *)a3
{
  uint64_t applicationFlags;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  applicationFlags = (uint64_t)self->_applicationFlags;
  v5 = *((_QWORD *)&self->_applicationFlags + 1);
  *((_QWORD *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFEFFLL;
  if ((v5 & 0x600) == 0)
  {
    v6 = ((v5 >> 4) + 1) & 0xF;
    *(_QWORD *)&self->_applicationFlags = applicationFlags;
    *((_QWORD *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFE0FLL | (16 * v6);
    if ((_DWORD)v6 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleHeadsetButtonClick, 0);
      v7 = sel__handleHeadsetButtonDoubleClick;
    }
    else
    {
      if ((_DWORD)v6 != 1)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleHeadsetButtonClick, 0);
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleHeadsetButtonDoubleClick, 0);
        -[UIApplication _handleHeadsetButtonTripleClick](self, "_handleHeadsetButtonTripleClick");
        return;
      }
      v7 = sel__handleHeadsetButtonClick;
    }
    -[UIApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v7, 0, 0.3);
    return;
  }
  if ((v5 & 0x200) != 0)
  {
    *(_QWORD *)&self->_applicationFlags = applicationFlags;
    *((_QWORD *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFCFFLL;
    v8 = 9;
LABEL_10:
    -[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:](self, "_sendHeadsetOriginatedMediaRemoteCommand:", v8);
    return;
  }
  if ((v5 & 0x400) != 0)
  {
    *(_QWORD *)&self->_applicationFlags = applicationFlags;
    *((_QWORD *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFAFFLL;
    v8 = 11;
    goto LABEL_10;
  }
}

- (void)_handleHeadsetButtonClick
{
  uint64_t v2;

  v2 = *((_QWORD *)&self->_applicationFlags + 1);
  if ((v2 & 0xF0) == 0x10)
  {
    *(_QWORD *)&self->_applicationFlags = self->_applicationFlags;
    *((_QWORD *)&self->_applicationFlags + 1) = v2 & 0xFFFFFFFFFFFFFF0FLL;
    if (!-[UIApplication _shouldIgnoreHeadsetClicks](self, "_shouldIgnoreHeadsetClicks"))
    {
      if ((*((_BYTE *)&self->_applicationFlags + 9) & 1) != 0)
      {
        -[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:](self, "_sendHeadsetOriginatedMediaRemoteCommand:", 8);
        *((_QWORD *)&self->_applicationFlags + 1) |= 0x200uLL;
      }
      else
      {
        -[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:](self, "_sendHeadsetOriginatedMediaRemoteCommand:", 2);
      }
    }
  }
}

- (void)_handleHeadsetButtonDoubleClick
{
  uint64_t v2;
  uint64_t v4;

  v2 = *((_QWORD *)&self->_applicationFlags + 1);
  if ((v2 & 0xF0) == 0x20)
  {
    *(_QWORD *)&self->_applicationFlags = self->_applicationFlags;
    *((_QWORD *)&self->_applicationFlags + 1) = v2 & 0xFFFFFFFFFFFFFF0FLL;
    if (!-[UIApplication _shouldIgnoreHeadsetClicks](self, "_shouldIgnoreHeadsetClicks"))
    {
      v4 = *((_QWORD *)&self->_applicationFlags + 1);
      if ((v4 & 0x100) != 0)
      {
        if ((v4 & 0x400) == 0)
        {
          -[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:](self, "_sendHeadsetOriginatedMediaRemoteCommand:", 10);
          *((_QWORD *)&self->_applicationFlags + 1) |= 0x400uLL;
        }
      }
      else
      {
        -[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:](self, "_sendHeadsetOriginatedMediaRemoteCommand:", 4);
      }
    }
  }
}

- (void)_handleHeadsetButtonTripleClick
{
  uint64_t v2;

  v2 = *((_QWORD *)&self->_applicationFlags + 1);
  if (__CFSUB__(v2 & 0xF0, 32, 0))
  {
    *(_QWORD *)&self->_applicationFlags = self->_applicationFlags;
    *((_QWORD *)&self->_applicationFlags + 1) = v2 & 0xFFFFFFFFFFFFFF0FLL;
    if (!-[UIApplication _shouldIgnoreHeadsetClicks](self, "_shouldIgnoreHeadsetClicks"))
      -[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:](self, "_sendHeadsetOriginatedMediaRemoteCommand:", 5);
  }
}

- (void)_terminateWithStatus:(int)a3
{
  void *v5;
  void *v6;

  _applicationTerminating = 1;
  -[UIApplication reportApplicationSuspended](self, "reportApplicationSuspended");
  kdebug_trace();
  -[UIApplication applicationWillTerminate](self, "applicationWillTerminate");
  objc_msgSend((id)UIApp, "applicationState");
  -[UIApplicationDelegate methodForSelector:](self->_delegate, "methodForSelector:", sel_applicationWillTerminate_);
  entr_act_modify();
  if ((*((_BYTE *)&self->_applicationFlags + 5) & 0x10) != 0)
    -[UIApplicationDelegate applicationWillTerminate:](self->_delegate, "applicationWillTerminate:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("UIApplicationWillTerminateNotification"), self);

  _logApplicationLifecycleMemoryMetricApplicationWillBeSuspended();
  objc_msgSend((id)UIApp, "applicationState");
  entr_act_end();
  kdebug_trace();
  if ((*((_BYTE *)&self->_applicationFlags + 8) & 8) == 0)
  {
    CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronize");

  }
  _exit(a3);
}

- (void)terminateWithSuccess
{
  -[UIApplication _terminateWithStatus:](self, "_terminateWithStatus:", 0);
}

- (void)applicationSuspend
{
  *(_QWORD *)&self->_applicationFlags |= 0x400000000uLL;
}

- (void)_applicationDidEnterBackground
{
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__UIApplication__applicationDidEnterBackground__block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v8);
  -[UIApplication _saveApplicationPreservationStateIfSupported](self, "_saveApplicationPreservationStateIfSupported");
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __47__UIApplication__applicationDidEnterBackground__block_invoke_2;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
  v4 = _UIApplicationWaitForBackgroundAssertionsToFlush();
  _applicationLifecycleMemoryMetricLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = _MXSignpostMetricsSnapshot();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_185066000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ApplicationDidEnterBackground", "\n%{public, signpost:metrics}@", buf, 0xCu);
  }

  if (v4)
    *((_QWORD *)&self->_applicationFlags + 1) |= 0x4000000000000uLL;
  else
    _logApplicationLifecycleMemoryMetricApplicationWillBeSuspended();
}

void __47__UIApplication__applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  id v2;

  entr_act_begin();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "methodForSelector:", sel_applicationDidEnterBackground_);
  entr_act_modify();
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 182) & 0x40) != 0
    && (objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) == 0
    && (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
  {
    kdebug_trace();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "applicationDidEnterBackground:");
    kdebug_trace();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("UIApplicationDidEnterBackgroundNotification"), *(_QWORD *)(a1 + 32), 0);

}

uint64_t __47__UIApplication__applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSystemNavigationAction:", 0);
}

- (void)_updateAppPriorityForSuspendedState
{
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(getPGPictureInPictureProxyClass(), "isPictureInPictureSupported"))
  {
    if (objc_msgSend(getPGPictureInPictureProxyClass(), "isPictureInPictureActive"))
    {
      v3 = *((_QWORD *)&self->_applicationFlags + 1);
      if ((v3 & 0x20000000000) == 0)
      {
        *(_QWORD *)&self->_applicationFlags = self->_applicationFlags;
        *((_QWORD *)&self->_applicationFlags + 1) = v3 | 0x20000000000;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        getPGPictureInPictureProxyPictureInPictureActiveChangedNotification();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__pipStateDidChange, v4, 0);

      }
    }
    else if (!+[_UIViewServiceSessionManager hasActiveSessions](_UIViewServiceSessionManager, "hasActiveSessions"))
    {
      BSSetMainThreadPriorityFixedForUI();
    }
  }
}

- (void)_handleSuspensionActions
{
  if (-[UIApplication isRunningQuitTest](self, "isRunningQuitTest"))
    *((_QWORD *)&self->_applicationFlags + 1) |= 0xC000uLL;
  if (-[UIApplication isRunningSuspendTest](self, "isRunningSuspendTest"))
  {
    *((_QWORD *)&self->_applicationFlags + 1) &= ~0x4000uLL;
    -[UIApplication reportApplicationSuspended](self, "reportApplicationSuspended");
  }
}

- (void)_handleTaskCompletionAndTerminate:(id)a3
{
  _QWORD v4[5];

  if (objc_msgSend(a3, "waitForBackgroundTaskCompletion"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__UIApplication__handleTaskCompletionAndTerminate___block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    _UIApplicationCallWhenBackgroundTaskCountReachesZero(v4);
  }
  else
  {
    -[UIApplication _terminateWithStatus:](self, "_terminateWithStatus:", 0);
  }
}

uint64_t __51__UIApplication__handleTaskCompletionAndTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateWithStatus:", 0);
}

- (void)_pipStateDidChange
{
  if (-[UIApplication isSuspended](self, "isSuspended"))
    -[UIApplication _updateAppPriorityForSuspendedState](self, "_updateAppPriorityForSuspendedState");
}

- (void)_setCompatibilityModeOnSettings:(id)a3
{
  objc_msgSend(a3, "setCompatibilityMode:", 0);
}

- (void)updateSuspendedSettings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  -[UIApplication defaultImageSnapshotExpiration](self, "defaultImageSnapshotExpiration");
  v6 = v5;
  -[UIApplication _mainScene](self, "_mainScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__UIApplication_updateSuspendedSettings___block_invoke;
  v9[3] = &unk_1E16DD108;
  v10 = v4;
  v11 = v6;
  v8 = v4;
  objc_msgSend(v7, "updateUIClientSettingsWithBlock:", v9);

}

void __41__UIApplication_updateSuspendedSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("UISuspendedStatusBarStyleKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "integerValue");
      objc_msgSend(v8, "setStatusBarStyle:", v4);
      objc_msgSend(v8, "setDefaultStatusBarStyle:", v4);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("UISuspendedStatusBarHiddenKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
      objc_msgSend(v8, "setStatusBarHidden:", v6);
      objc_msgSend(v8, "setDefaultStatusBarHidden:", v6);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("UISuspendedDefaultPNGKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultPNGName:", v7);
  objc_msgSend(v8, "setDefaultPNGExpirationTime:", *(double *)(a1 + 40));

}

- (BOOL)_shouldAttemptOpenURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 7795, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLOverrideForURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isFileURL") & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend(v7, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqualToString:", CFSTR("app-prefs")) ^ 1;

  }
  return v8;
}

- (id)_urlWithSettingsPrivateURLSchemeIfNeeded:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("app-settings"));

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    _UIMainBundleIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("app-prefs"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "resourceSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("notifications"));

    if (v10)
    {
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("&target=com.apple.settings.notifications"));
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v12;
  }
  return v3;
}

- (BOOL)_openURL:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_UIIsPrivateMainBundle() & 1) != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v18 = 136315394;
        v19 = "BUG IN CLIENT OF UIKIT";
        v20 = 2080;
        v21 = "The caller of UIApplication.openURL(_:) needs to migrate to the non-deprecated UIApplication.open(_:option"
              "s:completionHandler:)";
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "%s: %s. Next release this will be a no-op. You have been warned.", (uint8_t *)&v18, 0x16u);
      }

    }
    else
    {
      v5 = qword_1EDDC8280;
      if (!qword_1EDDC8280)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1EDDC8280);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v18 = 136315394;
        v19 = "BUG IN CLIENT OF UIKIT";
        v20 = 2080;
        v21 = "The caller of UIApplication.openURL(_:) needs to migrate to the non-deprecated UIApplication.open(_:option"
              "s:completionHandler:)";
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%s: %s. Next release this will be a no-op. You have been warned.", (uint8_t *)&v18, 0x16u);
      }
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    v7 = qword_1EDDC8278;
    if (!qword_1EDDC8278)
    {
      v7 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1EDDC8278);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "BUG IN CLIENT OF UIKIT";
      v20 = 2080;
      v21 = "The caller of UIApplication.openURL(_:) needs to migrate to the non-deprecated UIApplication.open(_:options:"
            "completionHandler:)";
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "%s: %s. Force returning false (NO).", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_18;
  }
  if (!v4 || !-[UIApplication _shouldAttemptOpenURL:](self, "_shouldAttemptOpenURL:", v4))
  {
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  v10 = (void *)objc_opt_new();
  +[UIPasteboard _pasteboardWithName:create:](UIPasteboard, "_pasteboardWithName:create:", CFSTR("com.apple.UIKit.pboard.general"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pasteSharingToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPasteSharingToken:", v12);

  -[UIApplication _urlWithSettingsPrivateURLSchemeIfNeeded:](self, "_urlWithSettingsPrivateURLSchemeIfNeeded:", v4);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openURL:configuration:error:", v13, v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  v4 = (id)v13;
LABEL_19:

  return v16;
}

- (void)_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  -[UIApplication _removePrivateOptionsFromOptions:](self, "_removePrivateOptionsFromOptions:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationInitializationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultSceneToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "stringRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UISVisibilityEnvironmentForSceneIdentityTokenString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIApplication _currentOpenApplicationEndpointForEnvironment:](self, "_currentOpenApplicationEndpointForEnvironment:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  -[UIApplication _openURL:options:openApplicationEndpoint:completionHandler:](self, "_openURL:options:openApplicationEndpoint:completionHandler:", v16, v9, v15, v8);

}

- (id)_removePrivateOptionsFromOptions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v7[0] = CFSTR("UIApplicationOpenURLOptionIgnoreUniversalLinks");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "removeObjectsForKeys:", v4);

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)_openURL:(id)a3 options:(id)a4 openApplicationEndpoint:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD aBlock[4];
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke;
  aBlock[3] = &unk_1E16B1BA0;
  v14 = v13;
  v40 = v14;
  v15 = _Block_copy(aBlock);
  if (v10 && -[UIApplication _shouldAttemptOpenURL:](self, "_shouldAttemptOpenURL:", v10))
  {
    -[UIApplication _urlWithSettingsPrivateURLSchemeIfNeeded:](self, "_urlWithSettingsPrivateURLSchemeIfNeeded:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("UIApplicationOpenURLOptionUniversalLinksOnly"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = objc_msgSend(v17, "BOOLValue");
    else
      v31 = 0;
    objc_msgSend(v11, "valueForKey:", CFSTR("UIApplicationOpenURLOptionIgnoreUniversalLinks"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = (void *)v16;
    v33 = v18;
    v34 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = 0;
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setTargetConnectionEndpoint:", v12);
    +[UIPasteboard _pasteboardWithName:create:](UIPasteboard, "_pasteboardWithName:create:", CFSTR("com.apple.UIKit.pboard.general"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pasteSharingToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPasteSharingToken:", v22);

    objc_msgSend(v11, "valueForKey:", CFSTR("UIApplicationOpenExternalURLOptionsEventAttributionKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_self();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v23, "toUISClickAttribution");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setClickAttribution:", v26);

      }
    }
    if (v19)
      objc_msgSend(v20, "setAllowURLOverrides:", 0);
    if (v31)
    {
      v27 = (void *)MEMORY[0x1E0CA5838];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_3;
      v37[3] = &unk_1E16DD130;
      v28 = &v38;
      v38 = v15;
      v29 = v32;
      objc_msgSend(v27, "openWithURL:configuration:completionHandler:", v32, v20, v37);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_4;
      v35[3] = &unk_1E16DD158;
      v28 = &v36;
      v36 = v15;
      v29 = v32;
      objc_msgSend(v30, "openURL:configuration:completionHandler:", v32, v20, v35);

    }
  }
  else
  {
    (*((void (**)(void *, _QWORD))v15 + 2))(v15, 0);
  }

}

void __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_2;
    v4[3] = &unk_1E16BFB78;
    v5 = v2;
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openURL:(id)a3 withCompletionHandler:(id)a4
{
  -[UIApplication openURL:options:completionHandler:](self, "openURL:options:completionHandler:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (void)_applicationOpenURL:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  UIOpenURLAction *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UISOpenURLAction initWithURL:]([UIOpenURLAction alloc], "initWithURL:", v7);

  -[UIApplication _applicationOpenURLAction:payload:origin:](self, "_applicationOpenURLAction:payload:origin:", v8, v6, 0);
}

- (id)_currentOpenApplicationEndpointForEnvironment:(id)a3
{
  void *v3;
  void *v4;

  -[BSServiceConnectionEndpointMonitor endpointsForEnvironment:](self->_endpointMonitor, "endpointsForEnvironment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_applicationOpenURLAction:(id)a3 payload:(id)a4 origin:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  void (*v31)(id, _QWORD *);
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD aBlock[5];
  id v46;
  id v47;
  id v48;
  SEL v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void *v58;

  v9 = a3;
  v10 = a4;
  v40 = a5;
  objc_msgSend(v9, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && !objc_msgSend(v12, "compare:options:", CFSTR("doubletap"), 1))
  {
    objc_msgSend(v11, "query");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "queryKeysAndValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication applicationOpenToShortCut:](self, "applicationOpenToShortCut:", v35);

    goto LABEL_14;
  }
  v14 = *MEMORY[0x1E0CA57E0];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA57E0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA5818]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke;
  aBlock[3] = &unk_1E16DD1C8;
  aBlock[4] = self;
  v46 = v9;
  v47 = v40;
  v18 = v10;
  v48 = v18;
  v49 = a2;
  v19 = _Block_copy(aBlock);
  v20 = v19;
  if (!v15)
  {
    (*((void (**)(void *, void *))v19 + 2))(v19, v11);
LABEL_12:

LABEL_14:
    return;
  }
  objc_msgSend(v18, "objectForKey:", v14);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (!v17)
  {
    objc_msgSend((id)UIApp, "_defaultSceneIfExists");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_4;
    v41[3] = &unk_1E16DD1F0;
    v41[4] = self;
    v42 = v20;
    _UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString(v22, v33, v41);

    goto LABEL_11;
  }
  v23 = (void *)v21;
  v24 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_2;
  v43[3] = &unk_1E16DD1F0;
  v43[4] = self;
  v44 = v20;
  v38 = v23;
  v25 = v23;
  v26 = v11;
  v27 = v43;
  v50[0] = v24;
  v50[1] = 3221225472;
  v50[2] = ___UIApplicationResolveURLForOpenInPlaceBookmarkableString_block_invoke;
  v50[3] = &unk_1E16DD1A0;
  v28 = v25;
  v51 = v28;
  v39 = v26;
  v52 = v39;
  v29 = v27;
  v53 = v29;
  v30 = v50;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v31 = (void (*)(id, _QWORD *))off_1EDDC8458;
  v58 = off_1EDDC8458;
  if (!off_1EDDC8458)
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke_0;
    v54[3] = &unk_1E16B14C0;
    v54[4] = &v55;
    __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke_0(v54);
    v31 = (void (*)(id, _QWORD *))v56[3];
  }
  _Block_object_dispose(&v55, 8);
  if (v31)
  {
    v31(v28, v30);

    v22 = v38;
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _FPDocumentURLFromBookmarkableString(CFStringRef, void (^__strong)(CFURLRef, CFErrorRef))");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("UIApplication.m"), 7974, CFSTR("%s"), dlerror());

  __break(1u);
}

void __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  UIEventAttribution *v32;
  void *v33;
  UIEventAttribution *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v45 = a2;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 181) & 4) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("LSSupportsOpeningDocumentsInPlace"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(a1 + 64);
      v43 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(sel_application_openURL_options_);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v42, v43, CFSTR("UIApplication.m"), 8136, CFSTR("Application has %@ key, but doesn't implement %@ on delegate %@"), CFSTR("LSSupportsOpeningDocumentsInPlace"), v44, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 176);
    if ((v7 & 0x20000000000) != 0)
    {
      v36 = *(void **)(v6 + 24);
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _annotationValueToReportToDelegateForPayload(*(void **)(a1 + 56));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v36, "application:openURL:sourceApplication:annotation:", v6, v45, v37, v38);

      if ((v39 & 1) == 0)
        goto LABEL_25;
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      v40 = objc_msgSend(*(id *)(v6 + 24), "application:handleOpenURL:", *(_QWORD *)(a1 + 32), v45);

      if (!v40)
        goto LABEL_25;
    }
    else
    {

    }
    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "localOpenURLOptions"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "localOpenURLOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    v11 = v9;
    v12 = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "openInPlace"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("UIApplicationOpenURLOptionsOpenInPlaceKey"));

    objc_msgSend(v11, "annotation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v46 = CFSTR("UIApplicationLaunchOptionsAnnotationKey");
      objc_msgSend(v11, "annotation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _annotationValueToReportToDelegateForPayload(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        objc_msgSend(v13, "setValue:forKey:", v18, CFSTR("UIApplicationOpenURLOptionsAnnotationKey"));

    }
    objc_msgSend(v11, "sourceApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v11, "sourceApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forKey:", v20, CFSTR("UIApplicationOpenURLOptionsSourceApplicationKey"));

    }
    objc_msgSend(v11, "eventAttribution");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v11, "eventAttribution");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forKey:", v22, CFSTR("UIApplicationOpenURLOptionsEventAttributionKey"));

    }
    if (v12)
      objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("_UIApplicationOpenURLOptionsSourceProcessHandleKey"));

  }
  else
  {
    v23 = *(void **)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    v24 = (void *)MEMORY[0x1E0C99E08];
    v25 = v23;
    objc_msgSend(v24, "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CA5818]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v25, "objectForKey:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v29, CFSTR("UIApplicationOpenURLOptionsSourceApplicationKey"));

    _annotationValueToReportToDelegateForPayload(v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v30, CFSTR("UIApplicationOpenURLOptionsAnnotationKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v31, CFSTR("UIApplicationOpenURLOptionsOpenInPlaceKey"));

    v32 = [UIEventAttribution alloc];
    objc_msgSend(v25, "objectForKey:", CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = -[UIEventAttribution initWithUISClickAttribution:](v32, "initWithUISClickAttribution:", v33);
    objc_msgSend(v26, "setValue:forKey:", v34, CFSTR("UIApplicationOpenURLOptionsEventAttributionKey"));

    if (v11)
      objc_msgSend(v26, "setValue:forKey:", v11, CFSTR("_UIApplicationOpenURLOptionsSourceProcessHandleKey"));
    v13 = (void *)objc_msgSend(v26, "copy");

  }
  v35 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "application:openURL:options:", *(_QWORD *)(a1 + 32), v45, v13);

  if ((v35 & 1) != 0)
LABEL_24:
    objc_msgSend(*(id *)(a1 + 32), "applicationOpenURL:", v45);
LABEL_25:

}

void __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_3;
  block[3] = &unk_1E16BAD68;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setHandlingURL:url:", 1, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_setHandlingURL:url:", 0, *(_QWORD *)(a1 + 40));
}

void __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_setHandlingURL:url:", 1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_setHandlingURL:url:", 0, v4);

}

- (void)_applicationHandleSiriTask:(id)a3
{
  if ((*((_BYTE *)&self->_applicationFlags + 7) & 0x20) != 0)
    -[UIApplicationDelegate _application:handleSiriTask:](self->_delegate, "_application:handleSiriTask:", self, a3);
}

- (void)_applicationHandleWatchKitRequest:(id)a3
{
  id v4;
  void *v5;
  UIApplicationDelegate *delegate;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)&self->_applicationFlags + 7) & 0x40) != 0)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    delegate = self->_delegate;
    objc_msgSend(v4, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__UIApplication__applicationHandleWatchKitRequest___block_invoke;
    v8[3] = &unk_1E16DD218;
    v10 = v11;
    v9 = v5;
    -[UIApplicationDelegate application:handleWatchKitExtensionRequest:reply:](delegate, "application:handleWatchKitExtensionRequest:reply:", self, v7, v8);

    _Block_object_dispose(v11, 8);
  }

}

void __51__UIApplication__applicationHandleWatchKitRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIApplication _applicationHandleWatchKitRequest:]_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_application_handleWatchKitExtensionRequest_reply_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("UIApplication.m"), 8198, CFSTR("Reply handler passed to -%@ called more than once for request %@."), v8, v9);

    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v3 + 24) = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v4 = *(void **)(a1 + 32);
    +[UIWatchKitExtensionRequestActionResponse responseWithWatchKitExtensionResult:](UIWatchKitExtensionRequestActionResponse, "responseWithWatchKitExtensionResult:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendResponse:", v5);

  }
}

- (void)_applicationHandleIntentForwardingAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)qword_1EDDC8468;
  v16 = qword_1EDDC8468;
  v6 = MEMORY[0x1E0C809B0];
  if (!qword_1EDDC8468)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getINUIAppIntentForwardingActionExecutorClass_block_invoke;
    v12[3] = &unk_1E16B14C0;
    v12[4] = &v13;
    __getINUIAppIntentForwardingActionExecutorClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithApplication:", self);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__UIApplication__applicationHandleIntentForwardingAction___block_invoke;
  v10[3] = &unk_1E16DD240;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "executeAction:completionHandler:", v9, v10);

}

void __58__UIApplication__applicationHandleIntentForwardingAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
    objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v3);

}

- (BOOL)isHandlingOpenShortCut
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 4) >> 3) & 1;
}

- (void)_setHandlingURL:(BOOL)a3 url:(id)a4
{
  uint64_t v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;

  v6 = 0x200000;
  if (!a3)
    v6 = 0;
  *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFFFFFDFFFFFLL | v6;
  objc_msgSend(a4, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a4 && v7)
  {
    v10 = v7;
    v9 = objc_msgSend(v7, "compare:options:", CFSTR("doubletap"), 1) == 0;
    v7 = v10;
    v8 = v9;
  }
  *(_QWORD *)&self->_applicationFlags = *(_QWORD *)&self->_applicationFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(v8 & 1) << 35);

}

- (BOOL)isHandlingURL
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 2) >> 5) & 1;
}

- (void)showNetworkPromptsIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  softlink_SBSSpringBoardServerPort();
  v5 = v4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr;
  v13 = getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr;
  if (!getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr)
  {
    v7 = SpringBoardServicesLibrary_1();
    v6 = dlsym(v7, "SBShowNetworkPromptsIfNecessary");
    v11[3] = (uint64_t)v6;
    getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (v6)
  {
    ((void (*)(uint64_t, _BOOL8))v6)(v5, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kern_return_t softlink_SBShowNetworkPromptsIfNecessary(mach_port_t, uint8_t)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UIApplication.m"), 503, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)setUsesBackgroundNetwork:(BOOL)a3
{
  -[UISApplicationState _setUsesBackgroundNetwork:](self->_appState, "_setUsesBackgroundNetwork:", a3);
}

- (BOOL)usesBackgroundNetwork
{
  return -[UISApplicationState _usesBackgroundNetwork](self->_appState, "_usesBackgroundNetwork");
}

- (id)userHomeDirectory
{
  void *v2;
  void *v3;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

- (id)userLibraryDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v3, 0);

  return v3;
}

- (id)_localCachesDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 2uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v3, 0);

  return v3;
}

- (void)_performWithUICACommitStateSnapshotting:(id)a3
{
  void (**v5)(void);
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v5 = (void (**)(void))a3;
  if (v5)
  {
    v10 = v5;
    if (pthread_main_np() != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 8301, CFSTR("Call must be made on main thread"));

    }
    v6 = __caCommitState;
    if (__caCommitState >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIApplication _performWithUICACommitStateSnapshotting:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UIApplication.m"), 8305, CFSTR("can't begin snapshotting unless the commit state is idle or snapshotting (actual=%i)"), __caCommitState);

    }
    __caCommitState = 1;
    v10[2]();
    v5 = v10;
    __caCommitState = v6;
  }

}

- (void)_configureSnapshotContext:(id)a3 forScreen:(id)a4 scene:(id)a5
{
  id v7;
  id v8;
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
  void *v19;
  double v20;
  double v21;
  id v22;

  v22 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "_scale");
  v10 = v9;
  objc_msgSend(v7, "_unjailedReferenceBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if ((objc_msgSend(v22, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal") & 1) == 0)
  {
    objc_msgSend(v22, "_effectiveSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v16 = v20;
    v18 = v21;
    v12 = (v20 - v20) * 0.5;
    v14 = (v21 - v21) * 0.5;

  }
  objc_msgSend(v8, "setFrame:", v12, v14, v16, v18);
  objc_msgSend(v8, "setScale:", v10);

}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  return 0;
}

- (BOOL)_updateDefaultImage
{
  void *v3;

  -[UIApplication nameOfDefaultImageToUpdateAtSuspension](self, "nameOfDefaultImageToUpdateAtSuspension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[UIApplication _saveSnapshotWithName:](self, "_saveSnapshotWithName:", v3);

  return v3 != 0;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  if (objc_msgSend(a3, "_isMainLikeScreen"))
    -[UIApplication prepareForDefaultImageSnapshot](self, "prepareForDefaultImageSnapshot");
}

- (BOOL)removeDefaultImage:(id)a3 forScreen:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a3;
  objc_msgSend(a4, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UIApplicationMainSceneForDisplayIdentity(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIApplication _createSnapshotContextForSceneRemoval:withName:](self, "_createSnapshotContextForSceneRemoval:withName:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v8, "invalidateSnapshotWithContext:", v9);
  else
    v10 = 0;
  if (os_variant_has_internal_diagnostics())
  {
    v12 = removeDefaultImage_forScreen____s_category[0];
    if (!removeDefaultImage_forScreen____s_category[0])
    {
      v12 = __UILogCategoryGetNode("UIApplicationSnapshots", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, removeDefaultImage_forScreen____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Warning: The UIApplication method removeDefaultImage:forScreen: is deprecated and likely does not do what you think it does. This is a user privacy issue if used for preventing sensitive content from displaying in system snapshots. Hide content optimistically when your scene enters background and/or call -requestSceneSessionRefresh instead. This will become a hard assert in future releases.", v14, 2u);
    }
  }

  return v10;
}

- (double)defaultImageSnapshotExpiration
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (id)_createSnapshotContextForScene:(id)a3 withName:(id)a4 performLayoutWithSettings:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v8 && v11)
  {
    v14 = objc_alloc(MEMORY[0x1E0D23228]);
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithSceneID:settings:", v15, v10);

    if (!v9)
      v9 = CFSTR("UIApplicationAutomaticSnapshotDefault");
    objc_msgSend(v16, "setName:", v9);
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke;
    v19[3] = &unk_1E16DD290;
    v19[4] = self;
    v20 = v12;
    v13 = v16;
    v21 = v13;
    objc_msgSend(v17, "_applySnapshotSettings:forActions:", v10, v19);

  }
  return v13;
}

void __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v7 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = v7;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_2;
    v8[3] = &unk_1E16B51E8;
    v6 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v8[1] = 3221225472;
    v9 = v6;
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
}

void __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DC9484]();
  v20[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_3;
  v20[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = v3;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v20);

  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "_includeInDefaultImageSnapshot") & 1) == 0)
        {
          objc_msgSend(v11, "_associatingSceneLayer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 56), "setLayersToExclude:", v5);
  v13 = *(void **)(a1 + 32);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_4;
  v15[3] = &unk_1E16B1B28;
  v15[4] = v13;
  objc_msgSend(v13, "_performWithUICACommitStateSnapshotting:", v15);
  objc_msgSend(*(id *)(a1 + 32), "_configureSnapshotContext:forScreen:scene:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v14 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "defaultImageSnapshotExpiration");
  objc_msgSend(v14, "setExpirationInterval:");

}

uint64_t __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareForDefaultImageSnapshotForScreen:", *(_QWORD *)(a1 + 40));
}

uint64_t __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_4(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  if (_runAfterCACommitDeferredBlocks(*(void **)(a1 + 32)))
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
}

- (id)_createSnapshotContextForSceneRemoval:(id)a3 withName:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = (__CFString *)a4;
  +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = 0;
  if (v6 && v8)
  {
    v11 = objc_alloc(MEMORY[0x1E0D23228]);
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithSceneID:settings:", v12, 0);

    if (!v7)
      v7 = CFSTR("UIApplicationAutomaticSnapshotDefault");
    objc_msgSend(v13, "setName:", v7);
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke;
    v16[3] = &unk_1E16DD290;
    v16[4] = self;
    v10 = v13;
    v17 = v10;
    v18 = v9;
    objc_msgSend(v14, "_applySnapshotSettings:forActions:", 0, v16);

  }
  return v10;
}

void __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke_2;
  v6[3] = &unk_1E16B51E8;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[1] = 3221225472;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

}

uint64_t __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_configureSnapshotContext:forScreen:scene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "defaultImageSnapshotExpiration");
  return objc_msgSend(v2, "setExpirationInterval:");
}

- (void)_beginSnapshotSessionForScene:(id)a3 withSnapshotBlock:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  SEL v30;
  void *v31;
  void (**v32)(id, _QWORD *);
  _QWORD v33[4];
  id v34;
  id v35;
  UIApplication *v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[6];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (!v8)
      goto LABEL_24;
  }
  else
  {
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 8507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v8 = v27;
    if (!v27)
      goto LABEL_24;
  }
  v30 = a2;
  v32 = (void (**)(id, _QWORD *))v8;
  if (qword_1EDDC81D8)
    HTSuspendHangTracing();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke;
  v52[3] = &unk_1E16BACE0;
  v52[4] = self;
  v52[5] = &v53;
  v9 = -[UIApplication _beginBackgroundTaskWithName:expirationHandler:](self, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.uikit.applicationSnapshot"), v52);
  v54[3] = v9;
  *((_QWORD *)&self->_applicationFlags + 1) |= 0x200000000uLL;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", 0x1E176EB60, 0);
  +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setPerformingSystemSnapshot:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, v11);
  v31 = v10;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v49 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v17, "_scene");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v18 == v7;

        if (v19)
          objc_msgSend(v12, "addObject:", v17);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v14);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = v12;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "_willSnapshot");
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v21);
  }

  objc_msgSend(v31, "postNotificationName:object:", CFSTR("_UIApplicationWillBeginSnapshotSessionNotification"), self);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke_2;
  v33[3] = &unk_1E16DD2B8;
  v38 = &v40;
  v24 = v20;
  v34 = v24;
  v25 = v11;
  v35 = v25;
  v36 = self;
  v26 = v31;
  v37 = v26;
  v39 = &v53;
  v32[2](v32, v33);
  if (!*((_BYTE *)v41 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v30, self, CFSTR("UIApplication.m"), 8587, CFSTR("snapshot completion was not called"));

  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v53, 8);
  v8 = v32;
LABEL_24:

}

uint64_t __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "_endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "_didSnapshot", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "_setPerformingSystemSnapshot:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184) &= ~0x200000000uLL;
  objc_msgSend(*(id *)(a1 + 56), "postNotificationName:object:", 0x1E176EB60, 0);
  objc_msgSend(*(id *)(a1 + 48), "_performWithUICACommitStateSnapshotting:", &__block_literal_global_1253);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "_endBackgroundTask:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "postNotificationName:object:", CFSTR("_UIApplicationDidEndSnapshotSessionNotification"), *(_QWORD *)(a1 + 48), (_QWORD)v8);
  result = qword_1EDDC81D8;
  if (qword_1EDDC81D8)
    return HTResumeHangTracing();
  return result;
}

uint64_t __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke_3()
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
}

- (void)_performSnapshotsWithAction:(id)a3 forScene:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 8591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 8592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestAction"));

LABEL_3:
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v18, "_isReadyForSuspension");
  _UIApplicationFlushCATransaction(0);
  objc_msgSend(v18, "_setIsRespondingToLifecycleEvent:", 1);
  if (v12)
    objc_msgSend(v18, "_prepareForResume");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke;
  v19[3] = &unk_1E16DD378;
  v19[4] = self;
  v20 = v10;
  v21 = v9;
  v22 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  objc_msgSend(v18, "_performSystemSnapshotWithActions:", v19);
  objc_msgSend(v18, "_setIsRespondingToLifecycleEvent:", 0);
  if (v12)
    objc_msgSend(v18, "_prepareForSuspend");

}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_2;
  v6[3] = &unk_1E16DD350;
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_beginSnapshotSessionForScene:withSnapshotBlock:", v7, v6);

}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v3 = a2;
  +[UIScreen _screenForScene:](UIScreen, "_screenForScene:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_3;
  v14[3] = &unk_1E16DD2E0;
  v6 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_4;
  v9[3] = &unk_1E16DD308;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v12 = v3;
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "executeRequestsWithHandler:completionHandler:expirationHandler:", v14, v9, &__block_literal_global_1259);

}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "nameOfDefaultImageToUpdateAtSuspension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_createSnapshotContextForScene:withName:performLayoutWithSettings:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "extendSnapshotContext:forSnapshotAction:", v7, *(_QWORD *)(a1 + 48));
    objc_msgSend(v8, "performSnapshotWithContext:", v7);
  }

}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_5;
  v8[3] = &unk_1E16B1B50;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v2, v3, v4, v5);
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v2, v3, v4, v5);

}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x186DC9484]();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_6;
  v3[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v3);

  objc_autoreleasePoolPop(v2);
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_hostsWindows"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, *(_QWORD *)(a1 + 40), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "_traitCollectionChangeTransitionCoordinator");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_runAlongsideCompletionsAndClearAlongsideAnimations");

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)_saveSnapshotWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[UIApplication _mainScene](self, "_mainScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__UIApplication__saveSnapshotWithName___block_invoke;
    v11[3] = &unk_1E16DD3A0;
    v11[4] = self;
    v12 = v5;
    v13 = v4;
    v14 = &v15;
    -[UIApplication _beginSnapshotSessionForScene:withSnapshotBlock:](self, "_beginSnapshotSessionForScene:withSnapshotBlock:", v12, v11);
    v7 = *((unsigned __int8 *)v16 + 24);

  }
  else
  {
    v8 = _saveSnapshotWithName____s_category;
    if (!_saveSnapshotWithName____s_category)
    {
      v8 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_saveSnapshotWithName____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[UIApplication _saveSnapshotWithName:]";
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s called for name %@ but main scene is nil, so skipping snapshot", buf, 0x16u);
    }
    v7 = *((unsigned __int8 *)v16 + 24);
  }

  _Block_object_dispose(&v15, 8);
  return v7 != 0;
}

void __39__UIApplication__saveSnapshotWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_createSnapshotContextForScene:withName:performLayoutWithSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "performSnapshotWithContext:", v3);
  if (v4)
    v4[2]();

}

- (void)prepareSnapshotsWithAction:(id)a3 forScene:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (id)_sceneHostingWorkspaceController
{
  _UISceneHostingWorkspaceController *sceneHostingWorkspaceController;
  _UISceneHostingWorkspaceController *v4;
  void *v5;
  _UISceneHostingWorkspaceController *v6;
  _UISceneHostingWorkspaceController *v7;

  sceneHostingWorkspaceController = self->_sceneHostingWorkspaceController;
  if (!sceneHostingWorkspaceController)
  {
    v4 = [_UISceneHostingWorkspaceController alloc];
    _UIMainBundleIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UISceneHostingWorkspaceController initWithIdentifier:](v4, "initWithIdentifier:", v5);
    v7 = self->_sceneHostingWorkspaceController;
    self->_sceneHostingWorkspaceController = v6;

    sceneHostingWorkspaceController = self->_sceneHostingWorkspaceController;
  }
  return sceneHostingWorkspaceController;
}

- (BOOL)_isInteractionEvent:(__GSEvent *)a3
{
  unsigned int Type;
  int IsHardwareKeyboardEvent;
  unsigned int v5;

  Type = GSEventGetType();
  IsHardwareKeyboardEvent = GSEventIsHardwareKeyboardEvent();
  v5 = (0x400C00u >> Type) & 1;
  if (Type > 0x16)
    LOBYTE(v5) = 0;
  if (IsHardwareKeyboardEvent)
    return 0;
  else
    return v5;
}

- (BOOL)launchApplicationWithIdentifier:(id)a3 suspended:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  BOOL v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD v22[2];

  v4 = a4;
  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v6 = dispatch_semaphore_create(0);
  v21 = *MEMORY[0x1E0D22D00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__UIApplication_launchApplicationWithIdentifier_suspended___block_invoke;
  v14[3] = &unk_1E16DD3C8;
  v16 = &v17;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v9, "openApplication:options:withResult:", v5, v8, v14);

  v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v10, v11))
    v12 = 0;
  else
    v12 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

intptr_t __59__UIApplication_launchApplicationWithIdentifier_suspended___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addStatusBarItem:(int)a3 removeOnExit:(BOOL)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a3;
  NSLog(CFSTR("addStatusBarItem:removeOnExit: is deprecated. Call addStatusBarItem: instead. (Ignoring removeOnExit argument.)"), a2, *(_QWORD *)&a3, a4);
  +[UIStatusBarServer addStatusBarItem:](UIStatusBarServer, "addStatusBarItem:", v4);
}

- (void)addStatusBarItem:(int)a3
{
  +[UIStatusBarServer addStatusBarItem:](UIStatusBarServer, "addStatusBarItem:", *(_QWORD *)&a3);
}

- (void)removeStatusBarItem:(int)a3
{
  +[UIStatusBarServer removeStatusBarItem:](UIStatusBarServer, "removeStatusBarItem:", *(_QWORD *)&a3);
}

- (void)setApplicationBadgeString:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CEC7A0];
  v4 = a3;
  objc_msgSend(v3, "currentNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBadgeString:withCompletionHandler:", v4, 0);

}

- (BOOL)applicationSupportsShakeToEdit
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 3) & 1;
}

- (void)_setForcedUserInterfaceLayoutDirection:(int64_t)a3
{
  id v3;

  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFC3FFFFFLL | ((unint64_t)(a3 & 7) << 23) | 0x400000;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIApplicationForcedUserInterfaceLayoutDirectionChangedNotification"), 0);

}

- (void)addWebClipToHomeScreen:(id)a3
{
  const __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  char buffer[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)a3;
  v4 = (__CFString *)v3;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)buffer = 0u;
  v16 = 0u;
  if (v3 && CFStringGetCString(v3, buffer, 1024, 0x8000100u))
  {
    softlink_SBSSpringBoardServerPort();
    v6 = v5;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v7 = getSBAddWebClipToHomeScreenSymbolLoc_ptr;
    v14 = getSBAddWebClipToHomeScreenSymbolLoc_ptr;
    if (!getSBAddWebClipToHomeScreenSymbolLoc_ptr)
    {
      v8 = SpringBoardServicesLibrary_1();
      v7 = dlsym(v8, "SBAddWebClipToHomeScreen");
      v12[3] = (uint64_t)v7;
      getSBAddWebClipToHomeScreenSymbolLoc_ptr = v7;
    }
    _Block_object_dispose(&v11, 8);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kern_return_t softlink_SBAddWebClipToHomeScreen(mach_port_t, char *)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("UIApplication.m"), 502, CFSTR("%s"), dlerror());

      __break(1u);
    }
    ((void (*)(uint64_t, char *))v7)(v6, buffer);
  }

}

+ (id)stringForStatusBarStyleOverrides:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if ((uint64_t)a3 >= 0x20000)
  {
    if ((uint64_t)a3 <= 0x3FFFFFF)
    {
      if ((uint64_t)a3 < 0x200000)
      {
        if ((uint64_t)a3 >= 0x80000)
        {
          if (a3 == 0x80000)
          {
            v3 = CFSTR("developerTools");
            return v3;
          }
          if (a3 == 0x100000)
          {
            v3 = CFSTR("screenReplayRecording");
            return v3;
          }
        }
        else
        {
          if (a3 == 0x20000)
          {
            v3 = CFSTR("webRTCCapture");
            return v3;
          }
          if (a3 == 0x40000)
          {
            v3 = CFSTR("airPrint");
            return v3;
          }
        }
      }
      else if ((uint64_t)a3 < 0x800000)
      {
        if (a3 == 0x200000)
        {
          v3 = CFSTR("loggingCapture");
          return v3;
        }
        if (a3 == 0x400000)
        {
          v3 = CFSTR("autoAirPlayReady");
          return v3;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x800000uLL:
            v3 = CFSTR("autoAirPlayPlaying");
            return v3;
          case 0x1000000uLL:
            v3 = CFSTR("webRTCAudioCapture");
            return v3;
          case 0x2000000uLL:
            v3 = CFSTR("fullScreenWebRTCCapture");
            return v3;
        }
      }
    }
    else if ((uint64_t)a3 > 0xFFFFFFFFFLL)
    {
      if ((uint64_t)a3 <= 0x3FFFFFFFFFLL)
      {
        if (a3 == 0x1000000000)
        {
          v3 = CFSTR("activePushToTalkCall");
          return v3;
        }
        if (a3 == 0x2000000000)
        {
          v3 = CFSTR("idlePushToTalkCall");
          return v3;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x4000000000uLL:
            v3 = CFSTR("callHandoff");
            return v3;
          case 0x8000000000uLL:
            v3 = CFSTR("videoConferenceHandoff");
            return v3;
          case 0x20000000000uLL:
            v3 = CFSTR("nearbyInteractions");
            return v3;
        }
      }
    }
    else if ((uint64_t)a3 <= 0xFFFFFFF)
    {
      if (a3 == 0x4000000)
      {
        v3 = CFSTR("fullScreenWebRTCAudioCapture");
        return v3;
      }
      if (a3 == 0x8000000)
      {
        v3 = CFSTR("callRinging");
        return v3;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x10000000uLL:
          v3 = CFSTR("videoConferenceRinging");
          return v3;
        case 0x20000000uLL:
          v3 = CFSTR("stewie");
          return v3;
        case 0x800000000uLL:
          v3 = CFSTR("stewieDisconnected");
          return v3;
      }
    }
LABEL_85:
    objc_msgSend(a1, "_stringsForStatusBarStyleOverrides:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if ((uint64_t)a3 > 255)
  {
    if ((uint64_t)a3 <= 4095)
    {
      if ((uint64_t)a3 > 1023)
      {
        if (a3 == 1024)
        {
          v3 = CFSTR("hearingAidRecording");
          return v3;
        }
        if (a3 == 2048)
        {
          v3 = CFSTR("backgroundLocation");
          return v3;
        }
      }
      else
      {
        if (a3 == 256)
        {
          v3 = CFSTR("assistantEyesFree");
          return v3;
        }
        if (a3 == 512)
        {
          v3 = CFSTR("videoOut");
          return v3;
        }
      }
    }
    else if ((uint64_t)a3 < 0x4000)
    {
      if (a3 == 4096)
      {
        v3 = CFSTR("carPlay");
        return v3;
      }
      if (a3 == 0x2000)
      {
        v3 = CFSTR("sysdiagnose");
        return v3;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000uLL:
          v3 = CFSTR("screenSharingServer");
          return v3;
        case 0x8000uLL:
          v3 = CFSTR("diagnostics");
          return v3;
        case 0x10000uLL:
          v3 = CFSTR("sos");
          return v3;
      }
    }
    goto LABEL_85;
  }
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64)
      {
        v3 = CFSTR("navigationTeal");
        return v3;
      }
      if (a3 == 128)
      {
        v3 = CFSTR("navigationBlue");
        return v3;
      }
    }
    else
    {
      if (a3 == 16)
      {
        v3 = CFSTR("inVideoConference");
        return v3;
      }
      if (a3 == 32)
      {
        v3 = CFSTR("screenSharing");
        return v3;
      }
    }
    goto LABEL_85;
  }
  v3 = CFSTR("inCall");
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v3 = CFSTR("(all)");
      break;
    case 0uLL:
      v3 = CFSTR("(none)");
      break;
    case 1uLL:
      return v3;
    case 2uLL:
      v3 = CFSTR("inWorkout");
      break;
    case 4uLL:
      v3 = CFSTR("recording");
      break;
    case 8uLL:
      v3 = CFSTR("tethering");
      break;
    default:
      goto LABEL_85;
  }
  return v3;
}

+ (id)_stringsForStatusBarStyleOverrides:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a3 & 1) != 0)
  {
    v6 = CFSTR("inCall");
  }
  else if ((a3 & 2) != 0)
  {
    v6 = CFSTR("inWorkout");
  }
  else if ((a3 & 4) != 0)
  {
    v6 = CFSTR("recording");
  }
  else if ((a3 & 8) != 0)
  {
    v6 = CFSTR("tethering");
  }
  else if ((a3 & 0x10) != 0)
  {
    v6 = CFSTR("inVideoConference");
  }
  else if ((a3 & 0x20) != 0)
  {
    v6 = CFSTR("screenSharing");
  }
  else if ((a3 & 0x40) != 0)
  {
    v6 = CFSTR("navigationTeal");
  }
  else if ((a3 & 0x80) != 0)
  {
    v6 = CFSTR("navigationBlue");
  }
  else if ((a3 & 0x100) != 0)
  {
    v6 = CFSTR("assistantEyesFree");
  }
  else if ((a3 & 0x200) != 0)
  {
    v6 = CFSTR("videoOut");
  }
  else if ((a3 & 0x400) != 0)
  {
    v6 = CFSTR("hearingAidRecording");
  }
  else if ((a3 & 0x800) != 0)
  {
    v6 = CFSTR("backgroundLocation");
  }
  else if ((a3 & 0x20000000000) != 0)
  {
    v6 = CFSTR("nearbyInteractions");
  }
  else if ((a3 & 0x1000) != 0)
  {
    v6 = CFSTR("carPlay");
  }
  else if ((a3 & 0x2000) != 0)
  {
    v6 = CFSTR("sysdiagnose");
  }
  else if ((a3 & 0x4000) != 0)
  {
    v6 = CFSTR("screenSharingServer");
  }
  else if ((a3 & 0x8000) != 0)
  {
    v6 = CFSTR("diagnostics");
  }
  else if ((a3 & 0x10000) != 0)
  {
    v6 = CFSTR("sos");
  }
  else if ((a3 & 0x20000) != 0)
  {
    v6 = CFSTR("webRTCCapture");
  }
  else if ((a3 & 0x1000000) != 0)
  {
    v6 = CFSTR("webRTCAudioCapture");
  }
  else if ((a3 & 0x2000000) != 0)
  {
    v6 = CFSTR("fullScreenWebRTCCapture");
  }
  else if ((a3 & 0x4000000) != 0)
  {
    v6 = CFSTR("fullScreenWebRTCAudioCapture");
  }
  else if ((a3 & 0x40000) != 0)
  {
    v6 = CFSTR("airPrint");
  }
  else if ((a3 & 0x80000) != 0)
  {
    v6 = CFSTR("developerTools");
  }
  else if ((a3 & 0x100000) != 0)
  {
    v6 = CFSTR("screenReplayRecording");
  }
  else if ((a3 & 0x200000) != 0)
  {
    v6 = CFSTR("loggingCapture");
  }
  else if ((a3 & 0x400000) != 0)
  {
    v6 = CFSTR("autoAirPlayReady");
  }
  else if ((a3 & 0x800000) != 0)
  {
    v6 = CFSTR("autoAirPlayPlaying");
  }
  else if ((a3 & 0x8000000) != 0)
  {
    v6 = CFSTR("callRinging");
  }
  else if ((a3 & 0x10000000) != 0)
  {
    v6 = CFSTR("videoConferenceRinging");
  }
  else if ((a3 & 0x20000000) != 0)
  {
    v6 = CFSTR("stewie");
  }
  else if ((a3 & 0x800000000) != 0)
  {
    v6 = CFSTR("stewieDisconnected");
  }
  else if ((a3 & 0x140000000) != 0)
  {
    v6 = CFSTR("sharePlay");
  }
  else if ((a3 & 0x280000000) != 0)
  {
    v6 = CFSTR("sharePlayScreenSharing");
  }
  else if ((a3 & 0x10000000000) != 0)
  {
    v6 = CFSTR("sharePlayInactive");
  }
  else if ((a3 & 0x400000000) != 0)
  {
    v6 = CFSTR("playgrounds");
  }
  else if ((a3 & 0x1000000000) != 0)
  {
    v6 = CFSTR("activePushToTalkCall");
  }
  else if ((a3 & 0x2000000000) != 0)
  {
    v6 = CFSTR("idlePushToTalkCall");
  }
  else if ((a3 & 0x4000000000) != 0)
  {
    v6 = CFSTR("callHandoff");
  }
  else
  {
    if ((a3 & 0x8000000000) == 0)
      return v5;
    v6 = CFSTR("videoConferenceHandoff");
  }
  objc_msgSend(v4, "addObject:", v6);
  return v5;
}

- (BOOL)_shouldForceClassicMode
{
  return 0;
}

- (BOOL)_supportsMenuActions
{
  return 1;
}

+ (BOOL)_shouldBigify
{
  char v2;
  void *v4;
  void *v5;
  void *v6;

  if (!os_variant_has_internal_diagnostics())
    return 0;
  _UIKitUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UIApplicationLayoutUsesFullCanvasSizeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v2 = objc_msgSend(v5, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (int64_t)_classicMode
{
  return objc_msgSend((id)objc_opt_class(), "_classicMode");
}

uint64_t __37__UIApplication__fetchInfoPlistFlags__block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v4;
  const char *string_ptr;

  v4 = a3;
  if (object_getClass(v4) == (Class)MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    setenv(a2, string_ptr, 1);
  }

  return 1;
}

- (BOOL)_disableLayoutAwareShortcuts
{
  return -[_UIApplicationInfoParser disableLayoutAwareShortcuts](self->_appInfo, "disableLayoutAwareShortcuts");
}

- (id)_event
{
  return self->_eventDispatcher->_mainEnvironment->_event;
}

- (double)_initialTouchTimestampForWindow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[UIApplication _touchesEventForWindow:](self, "_touchesEventForWindow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_initialTouchTimestampForWindow:", v4);
  v7 = v6;

  return v7;
}

- (id)_motionEvent
{
  return self->_eventDispatcher->_mainEnvironment->_motionEvent;
}

- (id)_moveEventForWindow:(id)a3
{
  return -[UIEventEnvironment _moveEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_wheelEventForWindow:(id)a3
{
  return -[UIEventEnvironment _wheelEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_gameControllerEventForWindow:(id)a3
{
  return -[UIEventEnvironment _gameControllerEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_physicalKeyboardEventForWindow:(id)a3
{
  return -[UIEventEnvironment _physicalKeyboardEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_dragEvents
{
  return -[UIEventEnvironment _dragEvents]((id *)&self->_eventDispatcher->_mainEnvironment->super.isa);
}

- (id)_scrollEventForWindow:(id)a3
{
  return -[UIEventEnvironment _scrollEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_transformEventForWindow:(id)a3
{
  return -[UIEventEnvironment _transformEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_hoverEventForWindowSpringBoardOnly:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[UIApplication _isSpringBoard](self, "_isSpringBoard"))
  {
    -[UIApplication _hoverEventForWindow:](self, "_hoverEventForWindow:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_remoteControlEvent
{
  return self->_eventDispatcher->_mainEnvironment->_remoteControlEvent;
}

- (id)_dynamicButtonEventForWindow:(id)a3
{
  return -[UIEventEnvironment _dynamicButtonEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (void)_presentEditAlertController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[UIApplication _motionKeyWindow](self, "_motionKeyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIApplication _motionKeyWindow](self, "_motionKeyWindow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rootViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        do
        {
          objc_msgSend(v6, "presentedViewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "presentedViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v8;
        }
        while (v9);
      }
      else
      {
        v8 = v6;
      }
      objc_msgSend(v8, "presentViewController:animated:completion:", v10, 1, 0);

    }
  }

}

- (void)_showEditAlertViewWithUndoManager:(id)a3 window:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];

  v5 = a3;
  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "canUndo");
  v8 = objc_msgSend(v5, "canRedo");
  v9 = v7 & v8;
  if ((v7 & v8 & 1) == 0)
  {
    _UIKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL_TITLE_IN_UNDO_ALERT"), CFSTR("Cancel"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke;
    v31[3] = &unk_1E16B3EC8;
    v31[4] = self;
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v12);

  }
  if ((v7 | v8) != 1)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Nothing to Undo"), CFSTR("Nothing to Undo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v7)
  {
    _UIKitBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UNDO_BUTTON_TITLE_IN_UNDO_ALERT"), CFSTR("Undo"), CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_3;
    v29[3] = &unk_1E16DD450;
    v29[4] = self;
    v15 = v5;
    v30 = v15;
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v16);

    if ((v8 & 1) == 0)
    {
LABEL_11:
      objc_msgSend(v5, "undoMenuItemTitle");
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v15, "redoMenuItemTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v8)
      goto LABEL_12;
    _UIKitBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REDO_BUTTON_TITLE_IN_UNDO_ALERT"), CFSTR("Redo"), CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_5;
  v27[3] = &unk_1E16DD450;
  v27[4] = self;
  v28 = v5;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v20);

  if ((v7 & 1) != 0)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v5, "redoMenuItemTitle");
  v21 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v18 = (void *)v21;
  if (!v21)
  {
    _UIKitBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNDO_TITLE_LABEL_IN_UNDO_ALERT"), CFSTR("Undo"), CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:
  objc_msgSend(v6, "setTitle:", v18);

  if (v9)
  {
    _UIKitBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON_TITLE_IN_UNDO_ALERT"), CFSTR("Cancel"), CFSTR("Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_7;
    v26[3] = &unk_1E16B3EC8;
    v26[4] = self;
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v25);

  }
  objc_storeWeak((id *)&self->_editAlertController, v6);
  -[UIApplication _presentEditAlertController:](self, "_presentEditAlertController:", v6);

}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), 0);
  return +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialIfNeededWithCompletion:", &__block_literal_global_1326);
}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_2()
{
  return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("UndoCancel"), CFSTR("Shake"));
}

void __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), 0);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_4;
  v2[3] = &unk_1E16B1B28;
  v3 = *(id *)(a1 + 40);
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialIfNeededWithCompletion:", v2);

}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canUndo");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "undo");
    return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Undo"), CFSTR("Shake"));
  }
  return result;
}

void __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_5(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), 0);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_6;
  v2[3] = &unk_1E16B1B28;
  v3 = *(id *)(a1 + 40);
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialIfNeededWithCompletion:", v2);

}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canRedo");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "redo");
    return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Redo"), CFSTR("Shake"));
  }
  return result;
}

id __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_7(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), 0);
}

- (BOOL)_shakeToUndoEnabledForWindow:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = +[UIDictationController isRunning](UIDictationController, "isRunning");
  objc_msgSend(v4, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v6, "_isTargetOfKeyboardEventDeferringEnvironment") & 1) != 0
     || objc_msgSend(v4, "_needsShakesWhenInactive"))
    && -[UIApplication applicationSupportsShakeToEdit](self, "applicationSupportsShakeToEdit")
    && !_AXSShakeToUndoDisabled())
  {
    v7 = !+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI") && !v5;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_shouldShowAlertForUndoManager:(id)a3
{
  id v4;
  id WeakRetained;
  BOOL v6;

  v4 = a3;
  if ((objc_msgSend(v4, "canUndo") & 1) != 0 || objc_msgSend(v4, "canRedo"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_editAlertController);
    v6 = WeakRetained == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setupMotionFeedbackGenerator
{
  UINotificationFeedbackGenerator *v3;
  void *v4;
  void *v5;
  UINotificationFeedbackGenerator *v6;
  UINotificationFeedbackGenerator *motionNotificationGenerator;

  if (!self->_motionNotificationGenerator)
  {
    v3 = [UINotificationFeedbackGenerator alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E1A99B10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:](_UINotificationFeedbackGeneratorConfiguration, "privateConfigurationForTypes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIFeedbackGenerator initWithConfiguration:](v3, "initWithConfiguration:", v5);
    motionNotificationGenerator = self->_motionNotificationGenerator;
    self->_motionNotificationGenerator = v6;

    -[UIFeedbackGenerator activateWithCompletionBlock:](self->_motionNotificationGenerator, "activateWithCompletionBlock:", 0);
  }
}

- (void)_teardownMotionEventBehavior
{
  UINotificationFeedbackGenerator *motionNotificationGenerator;

  -[UIFeedbackGenerator deactivate](self->_motionNotificationGenerator, "deactivate");
  motionNotificationGenerator = self->_motionNotificationGenerator;
  self->_motionNotificationGenerator = 0;

}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIApplication _motionKeyWindow](self, "_motionKeyWindow", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIApplication _shakeToUndoEnabledForWindow:](self, "_shakeToUndoEnabledForWindow:", v9);
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "firstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UIApplication _shouldShowAlertForUndoManager:](self, "_shouldShowAlertForUndoManager:", v8))
      -[UIApplication _setupMotionFeedbackGenerator](self, "_setupMotionFeedbackGenerator");

    v6 = v9;
  }

}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  UINotificationFeedbackGenerator *motionNotificationGenerator;
  UINotificationFeedbackGenerator *v9;
  UINotificationFeedbackGenerator *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, int);
  void *v14;
  UIApplication *v15;
  id v16;
  id v17;
  UINotificationFeedbackGenerator *v18;

  -[UIApplication _motionKeyWindow](self, "_motionKeyWindow", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIApplication _shakeToUndoEnabledForWindow:](self, "_shakeToUndoEnabledForWindow:", v5))
  {
    objc_msgSend(v5, "firstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UIApplication _shouldShowAlertForUndoManager:](self, "_shouldShowAlertForUndoManager:", v7))
    {
      -[UIApplication _setupMotionFeedbackGenerator](self, "_setupMotionFeedbackGenerator");
      motionNotificationGenerator = self->_motionNotificationGenerator;
      if (motionNotificationGenerator)
      {
        v9 = motionNotificationGenerator;
        v11 = MEMORY[0x1E0C809B0];
        v12 = 3221225472;
        v13 = __39__UIApplication_motionEnded_withEvent___block_invoke;
        v14 = &unk_1E16B2B68;
        v15 = self;
        v16 = v7;
        v17 = v5;
        v18 = v9;
        v10 = v9;
        -[UIFeedbackGenerator activateWithCompletionBlock:](v10, "activateWithCompletionBlock:", &v11);

      }
      else
      {
        -[UIApplication _showEditAlertViewWithUndoManager:window:](self, "_showEditAlertViewWithUndoManager:window:", v7, v5);
      }
    }

  }
  -[UIApplication _teardownMotionEventBehavior](self, "_teardownMotionEventBehavior", v11, v12, v13, v14, v15);

}

uint64_t __39__UIApplication_motionEnded_withEvent___block_invoke(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_showEditAlertViewWithUndoManager:window:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (a2)
    objc_msgSend(*(id *)(a1 + 56), "_privateNotificationOccurred:", 1006);
  return objc_msgSend(*(id *)(a1 + 56), "deactivate");
}

- (id)_exclusiveTouchWindows
{
  if (_exclusiveTouchWindows_once != -1)
    dispatch_once(&_exclusiveTouchWindows_once, &__block_literal_global_1349);
  return 0;
}

void __39__UIApplication__exclusiveTouchWindows__block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = kUISuspendedReturnToLastAppKey_block_invoke_4___s_category;
  if (!kUISuspendedReturnToLastAppKey_block_invoke_4___s_category)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&kUISuspendedReturnToLastAppKey_block_invoke_4___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    v2 = 136315138;
    v3 = "-[UIApplication _exclusiveTouchWindows]_block_invoke";
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "%s now returns nil and will be removed soon, please stop calling it immediately!", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)_isTrackingAnyTouch
{
  UIEventEnvironment *mainEnvironment;

  mainEnvironment = self->_eventDispatcher->_mainEnvironment;
  return mainEnvironment && -[NSMutableSet count](mainEnvironment->_windowsWithActiveTouchMaps, "count") != 0;
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  return a3;
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;

  v7 = *((_QWORD *)&self->_applicationFlags + 1);
  v8 = -[_UIApplicationInfoParser ignoredOverrides](self->_appInfo, "ignoredOverrides", a3, a4);
  -[UIApplication _mainScene](self, "_mainScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isUISubclass");

    if (v12)
    {
      objc_msgSend(v10, "uiSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 |= objc_msgSend(v13, "statusBarStyleOverridesToSuppress");

    }
  }
  if ((v7 & 0x200000000) != 0)
    v14 = 0;
  else
    v14 = a5;
  v15 = v14 & ~v8;

  return v15;
}

- (void)statusBar:(id)a3 willAnimateFromHeight:(double)a4 toHeight:(double)a5 duration:(double)a6 animation:(int)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[5];

  if (self->_statusBar == a3)
  {
    -[UIApplication statusBarFrame](self, "statusBarFrame");
    -[UIApplication _notifyWillChangeStatusBarFrame:](self, "_notifyWillChangeStatusBarFrame:");
    if (a7 != 3)
    {
      if (a7 == 2)
      {
        +[UIWindow _noteStatusBarHeightChanged:oldHeight:](UIWindow, "_noteStatusBarHeightChanged:oldHeight:", a5, a4);
      }
      else
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke;
        v17[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
        *(double *)&v17[4] = a6;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke_2;
        v16[3] = &__block_descriptor_48_e5_v8__0l;
        *(double *)&v16[4] = a5;
        *(double *)&v16[5] = a4;
        +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", a6 > 0.0, v17, v16, 0);
      }
    }
    v12 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("UIApplicationStatusBarHeightChangedDurationKey"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("UIApplicationStatusBarHeightChangedNotification"), self, v14);

  }
}

uint64_t __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, *(double *)(a1 + 32), 0.0);
}

uint64_t __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke_2(uint64_t a1)
{
  return +[UIWindow _noteStatusBarHeightChanged:oldHeight:](UIWindow, "_noteStatusBarHeightChanged:oldHeight:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)statusBar:(id)a3 didAnimateFromHeight:(double)a4 toHeight:(double)a5 animation:(int)a6
{
  if (a6 == 3)
    +[UIWindow _noteStatusBarHeightChanged:oldHeight:](UIWindow, "_noteStatusBarHeightChanged:oldHeight:", a3, a5, a4);
  -[UIApplication statusBarFrame](self, "statusBarFrame");
  -[UIApplication _notifyDidChangeStatusBarFrame:](self, "_notifyDidChangeStatusBarFrame:");
}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  return a4;
}

- (CGRect)statusBarFrameForOrientation:(int64_t)a3
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
  CGRect result;

  _UIStatusBarManagerForNoWindow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isStatusBarHidden"))
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v4, "defaultStatusBarHeightInOrientation:", a3);
    objc_msgSend(v4, "statusBarFrameForStatusBarHeight:");
    v5 = v9;
    v6 = v10;
    v7 = v11;
    v8 = v12;
  }

  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)statusBarHeight
{
  void *v2;
  double v3;
  double v4;

  _UIStatusBarManagerForNoWindow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarHeight");
  v4 = v3;

  return v4;
}

- (int64_t)activeInterfaceOrientation
{
  FBSOrientationObserver *orientationObserver;
  FBSOrientationObserver *v5;
  FBSOrientationObserver *v6;
  int64_t v7;

  if (-[UIApplication isFrontBoard](self, "isFrontBoard"))
    return 1;
  orientationObserver = self->_orientationObserver;
  if (!orientationObserver)
  {
    v5 = (FBSOrientationObserver *)objc_alloc_init(MEMORY[0x1E0D23188]);
    v6 = self->_orientationObserver;
    self->_orientationObserver = v5;

    orientationObserver = self->_orientationObserver;
  }
  v7 = -[FBSOrientationObserver activeInterfaceOrientation](orientationObserver, "activeInterfaceOrientation");
  if (BSInterfaceOrientationIsValid())
    return v7;
  else
    return 1;
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3 screen:(id)a4
{
  id v6;

  v6 = a4;
  if (-[UIApplication _isSpringBoard](self, "_isSpringBoard"))
    objc_msgSend(v6, "_setInterfaceOrientation:", a3);

}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5 screen:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 0x1E1764C60;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = 0x1E1764C80;
    v16[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "duration");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", 0x1E1764C40, v9, v14);

  }
}

- (BOOL)_usesEmoji
{
  return 0;
}

- (BOOL)ignoresInteractionEvents
{
  return (*((_BYTE *)&self->_applicationFlags + 3) & 0x1E) != 0;
}

- (unint64_t)blockInteractionEventsCount
{
  return (*(_QWORD *)&self->_applicationFlags >> 25) & 0xFLL;
}

- (void)_alertItemStateChanged
{
  if (-[UIApplication _isSpringBoard](self, "_isSpringBoard")
    || !-[UIApplication _isSpringBoardShowingAnAlert](self, "_isSpringBoardShowingAnAlert"))
  {
    -[UIApplication _stopDeactivatingForReason:](self, "_stopDeactivatingForReason:", 13);
  }
  else
  {
    -[UIApplication _deactivateForReason:](self, "_deactivateForReason:", 13);
  }
}

- (void)significantTimeChange
{
  id v3;

  if ((*((_BYTE *)&self->_applicationFlags + 5) & 0x20) != 0)
    -[UIApplicationDelegate applicationSignificantTimeChange:](self->_delegate, "applicationSignificantTimeChange:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UIApplicationSignificantTimeChangeNotification"), self);

}

- (void)_unregisterForUserDefaultsChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3420], 0);

}

uint64_t __70__UIApplication__registerForHangTracerEnabledStateChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D28790]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __hangTracerIsTaskedOn = objc_msgSend(v4, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "_updateHangTracer");
}

void __62__UIApplication__registerForKeyboardLayoutChangedNotification__block_invoke()
{
  objc_msgSend((id)UIApp, "_updateSerializableKeyCommandsForResponder:", 0);
  _UIKeyCommandHardwareKeyboardLayoutChanged();
}

- (void)setBacklightLevel:(float)a3
{
  double v4;
  id v5;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "_setBacklightLevel:", v4);

}

- (BOOL)_isSensitiveUIEnabled
{
  if (qword_1EDDC82A0 != -1)
    dispatch_once(&qword_1EDDC82A0, &__block_literal_global_1360);
  return byte_1EDDC8014;
}

uint64_t __38__UIApplication__isSensitiveUIEnabled__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1EDDC8014 = result;
  return result;
}

- (BOOL)_overridesDynamicCaret
{
  return 1;
}

- (float)backlightLevel
{
  void *v2;
  float v3;
  float v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_backlightLevel");
  v4 = v3;

  return v4;
}

- (void)setProximityEventsEnabled:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[UIApplication _mainScene](self, "_mainScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__UIApplication_setProximityEventsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v6 = a3;
  objc_msgSend(v4, "updateUIClientSettingsWithBlock:", v5);

}

void __43__UIApplication_setProximityEventsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "proximityDetectionModes");
  v5 = *(unsigned __int8 *)(a1 + 32);
  if (((v4 >> 1) & 1) != v5)
  {
    objc_msgSend(v3, "setProximityDetectionModes:", v4 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v5 != 0)));
    if (*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(UIApp + 168);
      *(_QWORD *)(UIApp + 168) = v6;

    }
    else
    {
      objc_msgSend(*(id *)(UIApp + 168), "timeIntervalSinceNow");
      v8 = *(void **)(UIApp + 168);
      *(_QWORD *)(UIApp + 168) = 0;

    }
    AnalyticsSendEventLazy();
  }

}

id __43__UIApplication_setProximityEventsEnabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("bundleId");
  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("enabled");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__UIApplication_setProximityEventsEnabled___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("bundleId");
  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 36));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("enabledTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setProximitySensingEnabled:(BOOL)proximitySensingEnabled
{
  _BOOL8 v3;
  id v4;

  v3 = proximitySensingEnabled;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProximityMonitoringEnabled:", v3);

}

- (BOOL)isProximitySensingEnabled
{
  void *v2;
  char v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProximityMonitoringEnabled");

  return v3;
}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forAudioCategory:(id)a4
{
  __CFString *v6;
  char v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  __CFString *v14;
  char v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (os_variant_has_internal_diagnostics()
    && objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[UIApplication setSystemVolumeHUDEnabled:forAudioCategory:]";
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle as it will return unexpected results.", buf, 0xCu);
      }

    }
    else
    {
      v10 = setSystemVolumeHUDEnabled_forAudioCategory____s_category;
      if (!setSystemVolumeHUDEnabled_forAudioCategory____s_category)
      {
        v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&setSystemVolumeHUDEnabled_forAudioCategory____s_category);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[UIApplication setSystemVolumeHUDEnabled:forAudioCategory:]";
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle as it will return unexpected results.", buf, 0xCu);
      }
    }
  }
  if (v6 && -[__CFString length](v6, "length"))
  {
    v7 = 0;
  }
  else
  {

    v7 = 1;
    v6 = &stru_1E16EDF20;
  }
  -[UIApplication _mainScene](self, "_mainScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__UIApplication_setSystemVolumeHUDEnabled_forAudioCategory___block_invoke;
  v13[3] = &unk_1E16DD500;
  v15 = v7;
  v16 = a3;
  v14 = v6;
  v9 = v6;
  objc_msgSend(v8, "updateUIClientSettingsWithBlock:", v13);

}

void __60__UIApplication_setSystemVolumeHUDEnabled_forAudioCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "audioCategoriesDisablingVolumeHUD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v5);
      v4 = (id)v6;
      if (!*(_BYTE *)(a1 + 41))
      {
        if (v6)
        {
LABEL_14:
          objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
LABEL_15:

          goto LABEL_16;
        }
LABEL_13:
        v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        goto LABEL_14;
      }
    }
    else
    {
      if (!*(_BYTE *)(a1 + 41))
        goto LABEL_13;
      v4 = 0;
    }
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend(v4, "count"))
    {

      v4 = 0;
    }
    goto LABEL_15;
  }
  if (*(_BYTE *)(a1 + 41))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAudioCategoriesDisablingVolumeHUD:", v7);

}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3
{
  -[UIApplication setSystemVolumeHUDEnabled:forAudioCategory:](self, "setSystemVolumeHUDEnabled:forAudioCategory:", a3, 0);
}

- (void)_performMemoryWarning
{
  void *v3;

  kdebug_trace();
  *((_QWORD *)&self->_applicationFlags + 1) |= 0x80000000uLL;
  -[UIApplication didReceiveMemoryWarning](self, "didReceiveMemoryWarning");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), self);

  +[UIViewController _traverseViewControllerHierarchyWithDelayedRelease:](UIViewController, "_traverseViewControllerHierarchyWithDelayedRelease:", &__block_literal_global_1377_0);
  *((_QWORD *)&self->_applicationFlags + 1) &= ~0x80000000uLL;
  kdebug_trace();
}

uint64_t __38__UIApplication__performMemoryWarning__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t result;

  if (a3)
    return objc_msgSend(a2, "didReceiveMemoryWarning");
  return result;
}

- (void)didReceiveMemoryWarning
{
  objc_msgSend((id)UIApp, "applicationState");
  -[UIApplicationDelegate methodForSelector:](self->_delegate, "methodForSelector:", sel_applicationDidReceiveMemoryWarning_);
  entr_act_modify();
  if ((*((_BYTE *)&self->_applicationFlags + 5) & 8) != 0)
    -[UIApplicationDelegate applicationDidReceiveMemoryWarning:](self->_delegate, "applicationDidReceiveMemoryWarning:", self);
}

- (void)_receivedMemoryNotification
{
  uint8_t v3[16];

  if ((*((_BYTE *)&self->_applicationFlags + 3) & 0x20) != 0 && !__jetsamDisabled)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Received memory warning.", v3, 2u);
    }
    -[UIApplication _performMemoryWarning](self, "_performMemoryWarning");
  }
}

uint64_t __43__UIApplication_setReceivesMemoryWarnings___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedMemoryNotification");
}

- (void)_purgeSharedInstances
{
  +[UIKeyboardImpl releaseSharedInstance](UIKeyboardImpl, "releaseSharedInstance");
  +[UIImage _flushSharedImageCache](UIImage, "_flushSharedImageCache");
}

- (id)_forceStageObservable
{
  UIForceStageObservable *forceStageObservable;
  UIForceStageObservable *v4;
  UIForceStageObservable *v5;

  forceStageObservable = self->_forceStageObservable;
  if (!forceStageObservable)
  {
    v4 = (UIForceStageObservable *)objc_opt_new();
    v5 = self->_forceStageObservable;
    self->_forceStageObservable = v4;

    forceStageObservable = self->_forceStageObservable;
  }
  return forceStageObservable;
}

- (void)_eatCurrentTouchForWindow:(id)a3
{
  _BYTE *v3;

  -[UIEventEnvironment _currentTouchForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[264] = 1;

}

- (BOOL)_eatCurrentTouchForWindow:(id)a3 ifPredicate:(id)a4
{
  unsigned int (**v6)(id, uint64_t);
  uint64_t v7;
  _BYTE *v8;
  BOOL v9;

  v6 = (unsigned int (**)(id, uint64_t))a4;
  -[UIEventEnvironment _currentTouchForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_BYTE *)v7;
  if (v7 && !*(_BYTE *)(v7 + 264) && v6[2](v6, v7))
  {
    v9 = 1;
    v8[264] = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_windowForSystemAppButtonEventsForScreen:(id)a3
{
  return 0;
}

BOOL __37__UIApplication__keyWindowForScreen___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    if (!objc_msgSend(v4, "_isMainScreen"))
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v3, "firstResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

    goto LABEL_6;
  }
  if (v4 == v6)
    goto LABEL_5;
LABEL_3:
  v7 = 0;
LABEL_6:

  return v7;
}

uint64_t __37__UIApplication__keyWindowForScreen___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = v4;
    if (v4 == v6)
      goto LABEL_6;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "_isMainScreen"))
    goto LABEL_7;
  v7 = *(void **)(a1 + 32);
LABEL_6:
  v8 = objc_msgSend(v3, "_canActAsKeyWindowForScreen:", v7);
LABEL_8:

  return v8;
}

- (void)_sendButtonEventWithType:(int64_t)a3 phase:(int64_t)a4 timestamp:(double)a5
{
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v12 = _sendButtonEventWithType_phase_timestamp____s_category;
    if (!_sendButtonEventWithType_phase_timestamp____s_category)
    {
      v12 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_sendButtonEventWithType_phase_timestamp____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[UIApplication _sendButtonEventWithType:phase:timestamp:]";
      v16 = 2112;
      v17 = CFSTR("_sendButtonEventWithType:phase:timestamp:contextID:");
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%s: This method is deprecated. In order to look up the appropriate press event, please migrate to %@. The presses event associated with the key window's window scene will be used for now.", (uint8_t *)&v14, 0x16u);
    }
  }
  objc_msgSend((id)UIApp, "keyWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_topVisibleWindowPassingTest:", &__block_literal_global_1385);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIApplication _sendButtonEventWithType:phase:timestamp:contextID:](self, "_sendButtonEventWithType:phase:timestamp:contextID:", a3, a4, objc_msgSend(v9, "_contextId"), a5);

}

uint64_t __58__UIApplication__sendButtonEventWithType_phase_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "canBecomeKeyWindow") && (objc_msgSend(v2, "_isTextEffectsWindow") & 1) == 0)
    v3 = objc_msgSend(v2, "isInternalWindow") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (void)_sendButtonEventWithType:(int64_t)a3 phase:(int64_t)a4 timestamp:(double)a5 contextID:(unsigned int)a6
{
  uint64_t v6;
  double v11;
  UIPressInfo *v12;

  v6 = *(_QWORD *)&a6;
  if ((unint64_t)(a4 - 3) >= 2)
    v11 = 1.0;
  else
    v11 = 0.0;
  v12 = objc_alloc_init(UIPressInfo);
  -[UIPressInfo setType:](v12, "setType:", a3);
  -[UIPressInfo setPhase:](v12, "setPhase:", a4);
  -[UIPressInfo setTimestamp:](v12, "setTimestamp:", a5);
  -[UIPressInfo setForce:](v12, "setForce:", v11);
  -[UIPressInfo setContextID:](v12, "setContextID:", v6);
  -[UIApplication _sendButtonEventWithPressInfo:](self, "_sendButtonEventWithPressInfo:", v12);

}

- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 contextID:(unsigned int)a7
{
  uint64_t v7;
  double v12;
  id v13;
  UIPressInfo *v14;
  BOOL v15;

  v7 = *(_QWORD *)&a7;
  if ((unint64_t)(a5 - 3) >= 2)
    v12 = 1.0;
  else
    v12 = 0.0;
  v13 = a3;
  v14 = objc_alloc_init(UIPressInfo);
  -[UIPressInfo setType:](v14, "setType:", a4);
  -[UIPressInfo setPhase:](v14, "setPhase:", a5);
  -[UIPressInfo setTimestamp:](v14, "setTimestamp:", a6);
  -[UIPressInfo setForce:](v14, "setForce:", v12);
  -[UIPressInfo setContextID:](v14, "setContextID:", v7);
  v15 = -[UIApplication _prepareButtonEvent:withPressInfo:](self, "_prepareButtonEvent:withPressInfo:", v13, v14);

  return v15;
}

- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 force:(double)a7 contextID:(unsigned int)a8
{
  return -[UIApplication _prepareButtonEvent:type:phase:timestamp:force:clickCount:longClick:contextID:](self, "_prepareButtonEvent:type:phase:timestamp:force:clickCount:longClick:contextID:", a3, a4, a5, 1, 0, *(_QWORD *)&a8, a6, a7);
}

- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 force:(double)a7 clickCount:(unint64_t)a8 longClick:(BOOL)a9 contextID:(unsigned int)a10
{
  uint64_t v10;
  _BOOL8 v11;
  id v18;
  UIPressInfo *v19;
  int64_t v20;
  BOOL v21;

  v10 = *(_QWORD *)&a10;
  v11 = a9;
  v18 = a3;
  v19 = objc_alloc_init(UIPressInfo);
  -[UIPressInfo setType:](v19, "setType:", a4);
  if (v11)
    v20 = 1;
  else
    v20 = a5;
  -[UIPressInfo setPhase:](v19, "setPhase:", v20);
  -[UIPressInfo setTimestamp:](v19, "setTimestamp:", a6);
  -[UIPressInfo setForce:](v19, "setForce:", a7);
  -[UIPressInfo setClickCount:](v19, "setClickCount:", a8);
  -[UIPressInfo setLongClick:](v19, "setLongClick:", v11);
  -[UIPressInfo setContextID:](v19, "setContextID:", v10);
  v21 = -[UIApplication _prepareButtonEvent:withPressInfo:](self, "_prepareButtonEvent:withPressInfo:", v18, v19);

  return v21;
}

- (void)_sendButtonEventWithPressInfo:(id)a3
{
  UIEventEnvironment *mainEnvironment;
  id v5;
  void *v6;
  id v7;

  mainEnvironment = self->_eventDispatcher->_mainEnvironment;
  v5 = a3;
  +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", objc_msgSend(v5, "contextID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIEventEnvironment _pressesEventForWindow:](mainEnvironment, v6);

  LODWORD(v6) = objc_msgSend((id)UIApp, "_prepareButtonEvent:withPressInfo:", v7, v5);
  if ((_DWORD)v6)
  {
    -[UIApplication sendEvent:](self, "sendEvent:", v7);
    -[UIApplication _finishButtonEvent:](self, "_finishButtonEvent:", v7);
  }
}

- (BOOL)_prepareButtonEvent:(id)a3 withPressInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  UIPress *v11;
  UIPress *v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "source");
  if (objc_msgSend(v7, "type") != -1)
  {
    if (v8 == 3)
    {
      +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", objc_msgSend(v7, "contextID"));
    }
    else
    {
      objc_msgSend(v6, "_hidEvent");
      _UIEventHIDUIWindowForHIDEvent();
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEventEnvironment _pressForType:window:]((uint64_t)self->_eventDispatcher->_mainEnvironment, objc_msgSend(v7, "type"), v10);
    v11 = (UIPress *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      v13 = -[UIPress phase](v11, "phase");
      if ((v13 == objc_msgSend(v7, "phase") || !objc_msgSend(v7, "phase") && v13 == 2)
        && (objc_msgSend(v7, "isLongClick") & 1) == 0)
      {
        v9 = 0;
        if (objc_msgSend(v7, "phase") != 1 || v13 != 1)
          goto LABEL_31;
        -[UIPress force](v12, "force");
        v17 = v16;
        objc_msgSend(v7, "force");
        if (v17 == v18)
          goto LABEL_30;
      }
      if (objc_msgSend(v7, "phase"))
      {
        -[UIPress _loadStateFromPressInfo:](v12, "_loadStateFromPressInfo:", v7);
        objc_msgSend(v6, "allPresses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v12);

        if (!v15)
          goto LABEL_30;
LABEL_28:
        objc_msgSend(v6, "set_lastPreparedPress:", v12);
        v9 = 1;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      if (objc_msgSend(v7, "phase"))
      {
        objc_msgSend(0, "_loadStateFromPressInfo:", v7);
        v12 = 0;
        goto LABEL_30;
      }
      v12 = objc_alloc_init(UIPress);
      -[UIEventEnvironment _setPress:forType:window:]((uint64_t)self->_eventDispatcher->_mainEnvironment, (uint64_t)v12, objc_msgSend(v7, "type"), v10);
    }
    if (v8 == 3)
    {
      +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", objc_msgSend(v7, "contextID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "screen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "_hidEvent");
      BKSHIDEventGetBaseAttributes();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "environment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00CA8], "systemEnvironment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      objc_msgSend(v6, "_screen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        -[UIApplication _windowForSystemAppButtonEventsForScreen:](self, "_windowForSystemAppButtonEventsForScreen:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          goto LABEL_26;
      }
    }
    -[UIApplication _keyWindowForScreen:](self, "_keyWindowForScreen:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
    -[UIPress setWindow:](v12, "setWindow:", v25);
    objc_msgSend(v25, "_focusResponder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _firstEligibleResponderForPress:](self, "_firstEligibleResponderForPress:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[UIPress setResponder:](v12, "setResponder:", v27);
      -[UIPress _loadStateFromPressInfo:](v12, "_loadStateFromPressInfo:", v7);
      objc_msgSend(v6, "_addPress:forDelayedDelivery:", v12, 0);

      goto LABEL_28;
    }

LABEL_30:
    v9 = 0;
    goto LABEL_31;
  }
  v9 = 0;
LABEL_32:

  return v9;
}

- (id)_firstEligibleResponderForPress:(id)a3
{
  return a3;
}

- (void)_cancelPressesWithType:(int64_t)a3 forPressesEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "allPresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "type", (_QWORD)v15) == a3)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    -[UIApplication _cancelTouchesOrPresses:withEvent:](self, "_cancelTouchesOrPresses:withEvent:", v8, v6);

}

- (void)_finishButtonEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "allPresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "phase"))
        {
          if (objc_msgSend(v9, "phase") == 3)
            objc_msgSend(v3, "_removePress:", v9);
        }
        else
        {
          objc_msgSend(v9, "setPhase:", 2);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_cancelGestureRecognizers:(id)a3
{
  -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)self->__gestureEnvironment, a3);
}

- (void)_cancelTouchesIfNeededForViewRemovedFromResponderChain:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (id)objc_msgSend(v8, "_window");
  v5 = (id)objc_msgSend((id)UIApp, "_touchesEventForWindow:", v4);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "touchesForView:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _cancelTouchesOrPresses:withEvent:](self, "_cancelTouchesOrPresses:withEvent:", v7, v6);

  }
}

void __51__UIApplication__cancelTouchesOrPresses_withEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sendEvent:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(a1 + 40), "type"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allTouches", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "phase") != 2)
          {
            +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "peekApplicationEvent:", *(_QWORD *)(a1 + 40));

            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_cancelAllEventsOfType:(int64_t)a3 onEventRoutingScene:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a4;
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 11253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventRoutingScene"));

    v7 = 0;
  }
  objc_msgSend(v7, "_allWindows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    switch(a3)
    {
      case 0:
        v10 = (id)objc_msgSend((id)UIApp, "_touchesEventForWindow:", v9);
        objc_msgSend(v10, "allTouches");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        v13 = (id)objc_msgSend((id)UIApp, "_pressesEventForWindow:", v9);
        goto LABEL_9;
      case 4:
        v13 = (id)objc_msgSend((id)UIApp, "_physicalKeyboardEventForWindow:", v9);
LABEL_9:
        v10 = v13;
        objc_msgSend(v13, "allPresses");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v14 = (void *)v11;
        if (v10 && v11)
          -[UIApplication _cancelTouchesOrPresses:withEvent:](self, "_cancelTouchesOrPresses:withEvent:", v11, v10);
        break;
      case 8:
        objc_msgSend((id)objc_msgSend((id)UIApp, "_gameControllerEventForWindow:", v9), "_reset");
        goto LABEL_18;
      case 10:
        objc_msgSend((id)objc_msgSend((id)UIApp, "_scrollEventForWindow:", v9), "_removeGestureRecognizersFromWindows");
        goto LABEL_18;
      case 11:
        objc_msgSend((id)objc_msgSend((id)UIApp, "_hoverEventForWindow:", v9), "_cancelAllGestureRecognizersAndRemoveAllHoverTouches");
        goto LABEL_18;
      case 13:
        -[_UIPencilEvent _cancelAndRemoveAllDescriptorsAndInteractions]((uint64_t)(id)objc_msgSend((id)UIApp, "_pencilEventForWindow:", v9));
        goto LABEL_18;
      case 16:
        v15 = (id)objc_msgSend((id)UIApp, "_dynamicButtonEventForWindow:", v9);
        -[UIEvent _allGestureRecognizers](v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_removeGestureRecognizersSendingCancelledEvent:", v16);

        goto LABEL_18;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 11318, CFSTR("Unsupported eventType: %li"), a3);

        goto LABEL_18;
    }
  }
  else
  {
LABEL_18:
    v14 = 0;
  }

}

- (void)_cancelAllTouches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle")
    && os_variant_has_internal_diagnostics())
  {
    v9 = _cancelAllTouches___s_category;
    if (!_cancelAllTouches___s_category)
    {
      v9 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_cancelAllTouches___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[UIApplication _cancelAllTouches]";
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Calling %s as a multi-scene app may lead to unexpected results", buf, 0xCu);
    }
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "_allowsEventUIWindowRouting"))
          -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_cancelAllInputsOnEventRoutingScene:(id)a3
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "_allowsEventUIWindowRouting"))
  {
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v4);
    objc_msgSend(v4, "_allWindows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      -[UIApplication _mainEventEnvironment](self, "_mainEventEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = v6;
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
            -[UIEventEnvironment _resetTouchMapForWindow:]((uint64_t)v7, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 3, v4, (_QWORD)v13);
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 4, v4);
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 8, v4);
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 11, v4);
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 10, v4);
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 16, v4);

  }
}

- (void)_cancelAllInputs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "_allowsEventUIWindowRouting"))
          -[UIApplication _cancelAllInputsOnEventRoutingScene:](self, "_cancelAllInputsOnEventRoutingScene:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_cancelUnfinishedTouchesForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _WORD *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allTouches", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_WORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "phase") <= 3)
        {
          v12 = objc_msgSend(v11, "phase");
          if (v11)
            v13 = v12 == 3;
          else
            v13 = 0;
          if (!v13 || (v11[118] & 8) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[UIApplication _cancelTouchesOrPresses:withEvent:](self, "_cancelTouchesOrPresses:withEvent:", v5, v4);
}

- (void)_cancelUnfinishedPressesForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allPresses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "phase") <= 3
          && (objc_msgSend(v11, "phase") != 3 || (objc_msgSend(v11, "sentPressesEnded") & 1) == 0))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[UIApplication _cancelTouchesOrPresses:withEvent:](self, "_cancelTouchesOrPresses:withEvent:", v5, v4);
  if (objc_msgSend(v4, "_isPhysicalKeyEvent"))
    -[UIRepeatedAction invalidate](self->_keyRepeatAction, "invalidate");

}

- (void)_cancelUnfinishedPhysicalKeyboardPressesForUIWindowEventRoutingScene:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "_windows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[UIApplication _physicalKeyboardEventForWindow:](self, "_physicalKeyboardEventForWindow:", v6);
  if (v5)
    -[UIApplication _cancelUnfinishedPressesForEvent:](self, "_cancelUnfinishedPressesForEvent:", v5);

}

- (void)_cancelUnfinishedPhysicalKeyboardPresses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "_allowsEventUIWindowRouting"))
          -[UIApplication _cancelUnfinishedPhysicalKeyboardPressesForUIWindowEventRoutingScene:](self, "_cancelUnfinishedPhysicalKeyboardPressesForUIWindowEventRoutingScene:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_registerBSActionHandler:(id)a3
{
  id v4;
  NSMutableArray *applicationBSActionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  applicationBSActionHandlers = self->_applicationBSActionHandlers;
  v8 = v4;
  if (!applicationBSActionHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_applicationBSActionHandlers;
    self->_applicationBSActionHandlers = v6;

    v4 = v8;
    applicationBSActionHandlers = self->_applicationBSActionHandlers;
  }
  -[NSMutableArray addObject:](applicationBSActionHandlers, "addObject:", v4);

}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[4];
  __int128 v3;
  id v4;
  uint64_t v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_2;
  v2[3] = &unk_1E16C5CA0;
  v5 = a2;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  result = objc_msgSend(*(id *)(a1 + 32), "canSendResponse");
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_3;
    v6[3] = &unk_1E16B1888;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = v4;
    return objc_msgSend(v5, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", v6, 1, 1, v4 != 10, v3);
  }
  return result;
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC5BC0], "responseWithResult:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendResponse:", v2);

}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend((id)UIApp, "applicationState");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "methodForSelector:", sel_application_didReceiveRemoteNotification_fetchCompletionHandler_);
  entr_act_modify();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_5;
    block[3] = &unk_1E16B47A8;
    v2 = *(id *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 32);
    v7 = v2;
    v8 = v3;
    v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "canSendResponse"))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0DC5BC0], "responseWithResult:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendResponse:", v5);

  }
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_6;
    v3[3] = &unk_1E16B1B28;
    v2 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v2, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", v3, 1, 1, 1, *(_QWORD *)(a1 + 48));

  }
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC5BC0], "responseWithResult:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendResponse:", v2);

}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_9(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  id v4;
  id v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_10;
  v2[3] = &unk_1E16B51E8;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_10(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_11;
  v3[3] = &unk_1E16B1B50;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", v3, 1, 1, 1, *(_QWORD *)(a1 + 56));

}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D016A8], "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendResponse:", v3);

  }
  return objc_msgSend(MEMORY[0x1E0C92C98], "_releaseProcessAssertionForSessionIdentifier:", *(_QWORD *)(a1 + 40));
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v4 = *(void **)(a1 + 32);
    +[UIWillPresentNotificationActionResponse responseWithOptions:](UIWillPresentNotificationActionResponse, "responseWithOptions:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendResponse:", v5);

  }
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bannerTapped");
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_21(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_22;
  block[3] = &unk_1E16B1B28;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_23(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  *a3 = v7;
  return v7;
}

- (void)_updateStateRestorationArchiveForBackgroundEvent:(id)a3 saveState:(BOOL)a4 exitIfCouldNotRestoreState:(BOOL)a5 updateSnapshot:(BOOL)a6 windowScene:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  void (**v12)(_QWORD);
  id v13;
  __darwin_time_t v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  UIApplication *v27;
  void (**v28)(_QWORD);
  BOOL v29;
  BOOL v30;
  _QWORD v31[4];
  dispatch_semaphore_t v32;
  timespec __tp;
  uint8_t buf[4];
  __darwin_time_t v35;
  uint64_t v36;

  v9 = a5;
  v10 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = (void (**)(_QWORD))a3;
  v13 = a7;
  if ((objc_msgSend(v13, "_isActive") & 1) != 0 || -[UIApplication _isActivating](self, "_isActivating"))
  {
    if (v12)
      v12[2](v12);
  }
  else
  {
    if (v10 && v9 && (*((_BYTE *)&self->_applicationFlags + 12) & 1) != 0)
    {
      __tp.tv_sec = 0;
      __tp.tv_nsec = 0;
      clock_gettime(_CLOCK_MONOTONIC_RAW_APPROX, &__tp);
      v14 = __tp.tv_sec - self->_couldNotRestoreStateWhenLockedTime;
      v15 = qword_1EDDC82C0;
      if (!qword_1EDDC82C0)
      {
        v15 = __UILogCategoryGetNode("ApplicationStateRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1EDDC82C0);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v35 = v14;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Application could not restore state when launched in background while locked (%{public}ld seconds ago). Skipping snapshot/state save when asked to update snapshot in background, and terminating app.", buf, 0xCu);
      }
      if (v14 >= 30)
      {
        v17 = qword_1EDDC82C8;
        if (!qword_1EDDC82C8)
        {
          v17 = __UILogCategoryGetNode("ApplicationStateRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&qword_1EDDC82C8);
        }
        v18 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          v35 = v14;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Exiting after being unable to access state restoration files - but it's been %{public}ld seconds since we tried to access them!", buf, 0xCu);
        }
        if (os_variant_has_internal_diagnostics())
        {
          v19 = objc_alloc_init((Class)getSDRDiagnosticReporterClass());
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("UIKit"), CFSTR("Crash"), CFSTR("LongTimeBeforeLockedStateRestorationExit"), v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = dispatch_semaphore_create(0);
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke;
          v31[3] = &unk_1E16B7720;
          v32 = v23;
          v24 = v23;
          objc_msgSend(v19, "snapshotWithSignature:duration:events:payload:actions:reply:", v22, 0, 0, 0, v31, 0.0);
          dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

        }
      }
      -[UIApplication terminateWithSuccess](self, "terminateWithSuccess");
    }
    if ((objc_msgSend(v13, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal") & 1) == 0)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke_2;
      v25[3] = &unk_1E16CB968;
      v26 = v13;
      v27 = self;
      v29 = a6;
      v30 = v10;
      v28 = v12;
      -[UIApplication _performBlockAfterCATransactionCommitSynchronizes:](self, "_performBlockAfterCATransactionCommitSynchronizes:", v25);

    }
  }

}

intptr_t __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke_2(uint64_t a1)
{
  char v2;
  char v3;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "activationState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setIsRespondingToLifecycleEvent:", 1);
    v2 = objc_msgSend(*(id *)(a1 + 32), "_isSuspendedEventsOnly");
    if ((v2 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_prepareForResume");
    +[UIScreen _prepareScreensForAppResume](UIScreen, "_prepareScreensForAppResume");
    v3 = objc_msgSend(*(id *)(a1 + 40), "_updateDefaultImage");
    if (*(_BYTE *)(a1 + 56) && (v3 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_saveSnapshotWithName:", CFSTR("UIApplicationAutomaticSnapshotDefault"));
    if (*(_BYTE *)(a1 + 57))
      objc_msgSend(*(id *)(a1 + 40), "_saveApplicationPreservationStateIfSupported");
    if ((v2 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_prepareForSuspend");
    objc_msgSend(*(id *)(a1 + 32), "_setIsRespondingToLifecycleEvent:", 0);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateSnapshotAndStateRestorationWithAction:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__UIApplication__updateSnapshotAndStateRestorationWithAction_windowScene___block_invoke;
  v8[3] = &unk_1E16B1B28;
  v9 = v6;
  v7 = v6;
  -[UIApplication _updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:](self, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", v8, 1, 1, 1, a4);

}

uint64_t __74__UIApplication__updateSnapshotAndStateRestorationWithAction_windowScene___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSendResponse");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", 0);
  return result;
}

- (void)_updateSnapshotForBackgroundApplication:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  -[UIApplication _mainScene](self, "_mainScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:](self, "_updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:", 0, v3, 0, 1, v6);

  }
  else
  {
    v7 = _updateSnapshotForBackgroundApplication____s_category;
    if (!_updateSnapshotForBackgroundApplication____s_category)
    {
      v7 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_updateSnapshotForBackgroundApplication____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[UIApplication _updateSnapshotForBackgroundApplication:]";
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "%s called but main scene is nil, so skipping snapshot", (uint8_t *)&v9, 0xCu);
    }
  }

}

void __48__UIApplication__findBestActivityToMakeCurrent___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_activityContinuationSuitableToBecomeCurrent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "becomeCurrent");
    v1 = v2;
  }

}

- (void)_removeResponder:(id)a3 forUserActivity:(id)a4
{
  -[UIActivityContinuationManager removeResponder:document:forUserActivity:](self->_activityContinuationManager, "removeResponder:document:forUserActivity:", a3, 0, a4);
}

- (void)_addDocument:(id)a3 forUserActivity:(id)a4
{
  -[UIActivityContinuationManager addResponder:document:forUserActivity:](self->_activityContinuationManager, "addResponder:document:forUserActivity:", 0, a3, a4);
}

- (void)_removeDocument:(id)a3 forUserActivity:(id)a4
{
  -[UIActivityContinuationManager removeResponder:document:forUserActivity:](self->_activityContinuationManager, "removeResponder:document:forUserActivity:", 0, a3, a4);
}

- (id)_localizedApplicationName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5860], "bundleProxyForCurrentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v2, "localizedInfoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C9AAC8];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v2, "infoDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(v2, "localizedInfoDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *MEMORY[0x1E0C9AE88];
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C9AE88]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
          objc_msgSend(v2, "infoDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v9);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }

  return v4;
}

- (void)_applicationShouldRequestHealthAuthorization
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIApplicationDelegate applicationShouldRequestHealthAuthorization:](self->_delegate, "applicationShouldRequestHealthAuthorization:", self);
}

- (void)_handleApplicationShortcutAction:(id)a3 onWindowScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIApplicationDelegate *delegate;
  _QWORD v10[4];
  id v11;
  UIApplication *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uiShortcutItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__UIApplication__handleApplicationShortcutAction_onWindowScene___block_invoke;
    v10[3] = &unk_1E16B2B40;
    v11 = v7;
    v12 = self;
    v13 = v6;
    -[UIApplicationDelegate application:performActionForShortcutItem:completionHandler:](delegate, "application:performActionForShortcutItem:completionHandler:", self, v8, v10);

  }
}

void __64__UIApplication__handleApplicationShortcutAction_onWindowScene___block_invoke(uint64_t a1)
{
  unint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateSnapshotAndStateRestorationWithAction:windowScene:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v1 = __kitLocation_block_invoke_5___s_category;
    if (!__kitLocation_block_invoke_5___s_category)
    {
      v1 = __UILogCategoryGetNode("Application", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v1, (unint64_t *)&__kitLocation_block_invoke_5___s_category);
    }
    v2 = *(NSObject **)(v1 + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136315138;
      v4 = "-[UIApplication _handleApplicationShortcutAction:onWindowScene:]_block_invoke";
      _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_ERROR, "%s called but canvas is nil, so skipping snapshot", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)_handleDaemonApplicationActivationWithScene:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void (**v16)(void);
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activatedOnce");

  *(_QWORD *)&self->_applicationFlags |= 0x200000000uLL;
  __IsRunningTests = 0;
  if ((v9 & 1) != 0)
  {
    v10 = (void *)qword_1EDDC8030;
    qword_1EDDC8030 = (uint64_t)CFSTR("resume");

    __wasResumed = 1;
    getpid();
    v11 = memorystatus_control();
    v12 = qword_1EDDC82E0;
    if (!qword_1EDDC82E0)
    {
      v12 = __UILogCategoryGetNode("AppLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1EDDC82E0);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_signpost_enabled(v13))
    {
      v17[0] = 67240192;
      v17[1] = v11;
      _os_signpost_emit_with_name_impl(&dword_185066000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppResume", " enableTelemetry=YES WasFrozen=%{signpost.telemetry:number1,public,name=WasFrozen}i", (uint8_t *)v17, 8u);
    }
  }
  else
  {
    objc_msgSend(v6, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isForeground"))
      v15 = CFSTR("launch");
    else
      v15 = CFSTR("launch suspended");
    objc_storeStrong((id *)&qword_1EDDC8030, v15);

    __wasResumed = 0;
  }
  _requestHardwareEventsIfNeeded();
  -[UIApplication _firstCommitBlock](self, "_firstCommitBlock");
  v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v16[2]();
  -[UIApplication _runWithDaemonScene:completion:](self, "_runWithDaemonScene:completion:", v6, v7);

  byte_1EDDC7FF9 = 1;
  entr_act_end();

}

- (void)_updateOrientation
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:](UIDevice, "currentDeviceOrientationAllowingAmbiguous:", 1);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "orientation");

  if (v3 != v5)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrientation:animated:", v3, -[UIApplication isSuspended](self, "isSuspended") ^ 1);

  }
}

- (void)_handleScreenshot
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("UIApplicationUserDidTakeScreenshotNotification"), UIApp, 0);

}

- (void)_enqueueHIDEvent:(__IOHIDEvent *)a3
{
  -[UIEventFetcher _receiveHIDEvent:](self->_eventFetcher, "_receiveHIDEvent:", a3);
}

- (void)_resendHoverEventForWindow:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "_contextId");
  if (v4)
    -[UIEventFetcher _resendHoverEventForContextID:]((uint64_t)self->_eventFetcher, v4);
}

- (void)_setHIDGameControllerEventObserver:(id)a3 onQueue:(id)a4
{
  OS_dispatch_queue *v6;
  void *v7;
  id HIDGameControllerEventObserver;
  OS_dispatch_queue *HIDGameControllerEventQueue;
  OS_dispatch_queue *v10;
  id v11;

  v6 = (OS_dispatch_queue *)a4;
  v11 = a3;
  v7 = _Block_copy(v11);
  HIDGameControllerEventObserver = self->_HIDGameControllerEventObserver;
  self->_HIDGameControllerEventObserver = v7;

  HIDGameControllerEventQueue = self->_HIDGameControllerEventQueue;
  self->_HIDGameControllerEventQueue = v6;
  v10 = v6;

  -[UIEventFetcher _setHIDGameControllerEventObserver:onQueue:]((uint64_t)self->_eventFetcher, v11, v10);
}

- (void)_removeHIDGameControllerEventObserver
{
  id HIDGameControllerEventObserver;
  OS_dispatch_queue *HIDGameControllerEventQueue;

  HIDGameControllerEventObserver = self->_HIDGameControllerEventObserver;
  self->_HIDGameControllerEventObserver = 0;

  HIDGameControllerEventQueue = self->_HIDGameControllerEventQueue;
  self->_HIDGameControllerEventQueue = 0;

  -[UIEventFetcher _removeHIDGameControllerEventObserver]((uint64_t)self->_eventFetcher);
}

- (void)_setHIDEventObserver:(id)a3 onQueue:(id)a4
{
  -[UIEventFetcher _setHIDEventObserver:onQueue:]((uint64_t)self->_eventFetcher, a3, a4);
}

- (void)_removeHIDEventObserver
{
  -[UIEventFetcher _removeHIDEventObserver]((uint64_t)self->_eventFetcher);
}

- (__CFRunLoop)_eventFetchRunLoop
{
  UIEventFetcher *eventFetcher;

  eventFetcher = self->_eventFetcher;
  if (eventFetcher)
    return eventFetcher->_cfRunLoop;
  else
    return 0;
}

- (void)_sendEventToGameControllerObserver:(__IOHIDEvent *)a3
{
  NSObject *HIDGameControllerEventQueue;
  _QWORD v6[6];

  if (self->_HIDGameControllerEventObserver)
  {
    if (self->_HIDGameControllerEventQueue)
    {
      CFRetain(a3);
      HIDGameControllerEventQueue = self->_HIDGameControllerEventQueue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __52__UIApplication__sendEventToGameControllerObserver___block_invoke;
      v6[3] = &unk_1E16B1888;
      v6[4] = self;
      v6[5] = a3;
      dispatch_async(HIDGameControllerEventQueue, v6);
    }
  }
}

void __52__UIApplication__sendEventToGameControllerObserver___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  int Type;
  uint64_t v6;
  uint64_t v7;
  uint64_t IntegerValue;
  void *v9;
  __IOHIDEvent *v10;
  id v11;

  Type = IOHIDEventGetType();
  if (Type == 32)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    -[UIApplication _forceStageObservable](self, "_forceStageObservable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (IntegerValue > 9)
      v10 = 0;
    else
      v10 = a3;
    objc_msgSend(v9, "receiveObservedValue:", v10);

  }
  else if (Type == 10 && self && IOHIDEventGetIntegerValue() == 1)
  {
    v6 = IOHIDEventGetIntegerValue();
    if ((unint64_t)(v6 - 101) >= 6)
      v7 = 0;
    else
      v7 = v6 - 100;
    -[UIApplication _deviceOrientationDidChange:](self, v7);
  }
}

- (BOOL)_handlePhysicalButtonEvent:(id)a3
{
  return 1;
}

void __45__UIApplication__internalHandlePressesEvent___block_invoke()
{
  objc_class *v0;
  void (*MethodImplementation)(void);
  objc_class *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v0 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v0, sel__handlePhysicalButtonEvent_);
  v2 = (objc_class *)objc_opt_class();
  if (MethodImplementation != class_getMethodImplementation(v2, sel__handlePhysicalButtonEvent_)
    && (objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Invalid use of FrontBoard specific SPI. Please remove.", buf, 2u);
      }

    }
    else
    {
      v3 = __kitLocation_block_invoke_6___s_category;
      if (!__kitLocation_block_invoke_6___s_category)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&__kitLocation_block_invoke_6___s_category);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Invalid use of FrontBoard specific SPI. Please remove.", v6, 2u);
      }
    }
  }
}

- (BOOL)_handleHIDEventBypassingUIEvent:(const __IOHIDEvent *)a3
{
  return 0;
}

uint64_t __57__UIApplication__internalHandleHIDEventBypassingUIEvent___block_invoke()
{
  objc_class *v0;
  void (*MethodImplementation)(void);
  objc_class *v2;
  uint64_t result;

  v0 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v0, sel__handleHIDEventBypassingUIEvent_);
  v2 = (objc_class *)objc_opt_class();
  if (MethodImplementation == class_getMethodImplementation(v2, sel__handleHIDEventBypassingUIEvent_))
    result = 0;
  else
    result = objc_msgSend((id)UIApp, "isFrontBoard");
  byte_1EDDC8016 = result;
  return result;
}

- (BOOL)handleEvent:(__GSEvent *)a3
{
  return -[UIApplication handleEvent:withNewEvent:](self, "handleEvent:withNewEvent:", a3, 0);
}

- (void)_deviceOrientationDidChange:(_BYTE *)a1
{
  void *v3;
  void *v4;
  _QWORD v5[6];

  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__UIApplication__deviceOrientationDidChange___block_invoke;
    v5[3] = &unk_1E16B1888;
    v5[4] = a1;
    v5[5] = a2;
    v3 = _Block_copy(v5);
    v4 = v3;
    if ((a1[180] & 1) != 0)
      objc_msgSend(a1, "__setQueuedOrientationChange:", v3);
    else
      (*((void (**)(void *))v3 + 2))(v3);

  }
}

void __45__UIApplication__deviceOrientationDidChange___block_invoke(uint64_t a1)
{
  id v2;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOrientation:animated:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isSuspended") ^ 1);

}

- (void)_handleDeviceOrientationChangedEvent:(__GSEvent *)a3
{
  uint64_t v4;

  v4 = GSEventDeviceOrientation();
  -[UIApplication _deviceOrientationDidChange:](self, v4);
}

- (id)_motionKeyWindow
{
  id v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UIApplication keyWindow](self, "keyWindow");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v4)
            objc_enumerationMutation(v3);
          v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v6, "_needsShakesWhenInactive"))
          {
            objc_msgSend(v6, "firstResponder");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            if (v7)
            {
              v2 = v6;
              goto LABEL_13;
            }
          }
        }
        v2 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v2;
}

uint64_t __46__UIApplication__responderBasedEventDeliverer__block_invoke()
{
  uint64_t result;

  result = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ForceResponderChainIntegrity, (uint64_t)CFSTR("ForceResponderChainIntegrity"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  byte_1EDDC8017 = (qword_1ECD767F8 > 0) & ~(_BYTE)result;
  return result;
}

- (void)_handleUnicodeEvent:(__IOHIDEvent *)a3
{
  double v4;
  double v5;
  const __CFArray *Children;
  const __CFArray *v7;
  const void *ValueAtIndex;
  double v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int IntegerValue;
  void *v13;
  void *v14;
  id v15;

  IOHIDEventGetFloatValue();
  v5 = v4;
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children
    && (v7 = Children, CFArrayGetCount(Children) >= 1)
    && (ValueAtIndex = CFArrayGetValueAtIndex(v7, 0), IOHIDEventGetFloatValue(), v9 > v5))
  {
    -[UIApplication _handleUnicodeEvent:](self, "_handleUnicodeEvent:", ValueAtIndex);
  }
  else
  {
    v10 = IOHIDEventGetIntegerValue() - 1;
    if (v10 > 3)
      v11 = 4;
    else
      v11 = qword_186682658[v10];
    IntegerValue = IOHIDEventGetIntegerValue();
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", IOHIDEventGetDataValue(), IntegerValue, v11);
    +[UIPhysicalKeyboardEvent _eventWithInput:inputFlags:](UIPhysicalKeyboardEvent, "_eventWithInput:inputFlags:", v15, 128);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleKeyEvent:", v13);

  }
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 forceRebuild:(BOOL)a4
{
  return -[UIApplication GSKeyboardForHWLayout:forceRebuild:createIfNeeded:](self, "GSKeyboardForHWLayout:forceRebuild:createIfNeeded:", a3, a4, 1);
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 forceRebuild:(BOOL)a4 createIfNeeded:(BOOL)a5
{
  return -[UIApplication GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:](self, "GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:", a3, _lastUsedKeyboardSenderID, a4, a5);
}

- (id)getKeyboardDevicePropertiesForSenderID:(unint64_t)a3 shouldUpdate:(BOOL)a4
{
  return -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:](self, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:", a3, a4, 0);
}

- (id)getKeyboardDevicePropertiesForSenderID:(unint64_t)a3 shouldUpdate:(BOOL)a4 usingSyntheticEvent:(BOOL)a5
{
  _BOOL4 v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  if (!qword_1EDDC8308)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)qword_1EDDC8308;
    qword_1EDDC8308 = v8;

  }
  if (!qword_1EDDC8310)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)qword_1EDDC8310;
    qword_1EDDC8310 = v10;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)qword_1EDDC8310, "containsObject:", v12) & 1) != 0)
    goto LABEL_6;
  if (!v6)
  {
LABEL_10:
    objc_msgSend((id)qword_1EDDC8308, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  BKSHIDKeyboardGetDeviceProperties();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
LABEL_9:
    objc_msgSend((id)qword_1EDDC8308, "setObject:forKeyedSubscript:", v14, v12);

    goto LABEL_10;
  }
  _UIHardwareKeyboardLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v18 = 136315394;
    v19 = "-[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:]";
    v20 = 2048;
    v21 = a3;
    _os_log_error_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "%s, failed to fetch device property for senderID (%llu) use primary keyboard info instead.", (uint8_t *)&v18, 0x16u);
  }

  if (!a5)
  {
    BKSHIDKeyboardGetDeviceProperties();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_9;
    _UIHardwareKeyboardLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315138;
      v19 = "-[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:]";
      _os_log_error_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "%s, failed to fetch primary keyboard info.", (uint8_t *)&v18, 0xCu);
    }

  }
  objc_msgSend((id)qword_1EDDC8310, "addObject:", v12);
LABEL_6:
  v13 = 0;
LABEL_11:

  return v13;
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 senderID:(unint64_t)a4 forceRebuild:(BOOL)a5 createIfNeeded:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __GSKeyboard *v21;
  uint64_t v22;
  void *v23;
  int v24;
  int HWKeyboardType;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
    v12 = 0;
  else
    v12 = !v6;
  if (!v12)
  {
    if (GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
    {
      if (!v10 && a5)
        goto LABEL_8;
    }
    else if (!v10)
    {
LABEL_8:
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hardwareInputMode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "automaticHardwareLayout");
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:](self, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:", a4, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (v11)
      {
        objc_msgSend(v17, "layout");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v11, "isEqualToString:", v19) ^ 1;

      }
      else
      {
        LOBYTE(v20) = 0;
      }
      a5 |= v20;
      v22 = _lastUsedKeyboardSenderID;
      if (!a5 && _lastUsedKeyboardSenderID == a4)
      {
        a5 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      v22 = _lastUsedKeyboardSenderID;
    }
    if (v22 != a4)
      _lastUsedKeyboardSenderID = a4;
    if (v18)
    {
      v23 = v18;
    }
    else
    {
      -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:](self, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:", a4, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
LABEL_32:
        v21 = (__GSKeyboard *)GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard;
        if (!a5 && GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
        {
LABEL_52:

          goto LABEL_53;
        }
        if (!GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
        {
          v24 = -1;
          if (!v11)
            goto LABEL_48;
          goto LABEL_49;
        }
        v23 = v18;
        goto LABEL_36;
      }
    }
    if (!objc_msgSend(v23, "standardType")
      || objc_msgSend(v23, "standardType") == 1
      || objc_msgSend(v23, "standardType") == 2)
    {
      v24 = objc_msgSend(v23, "standardType");
    }
    else
    {
      v24 = 2 * (objc_msgSend(v23, "countryCode") == 15);
    }
    if (!GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
    {
LABEL_47:
      v18 = v23;
      if (!v11)
      {
LABEL_48:
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hardwareInputMode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "automaticHardwareLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_49:
      GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard = GSKeyboardCreate();
      _UIHardwareKeyboardLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136315650;
        v33 = "-[UIApplication GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:]";
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = v24;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "%s, New hardware layout is created with %@ layout and %d standardType.", (uint8_t *)&v32, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("UITextInputCurrentKeyboardLayoutDidChangeNotification"), 0, 0);

      BKSHIDKeyboardSetLayout();
      v30 = -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:](self, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:", a4, 1);
      v21 = (__GSKeyboard *)GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard;
      goto LABEL_52;
    }
    if (v24 != -1)
    {
LABEL_46:
      GSKeyboardRelease();
      goto LABEL_47;
    }
LABEL_36:
    HWKeyboardType = GSKeyboardGetHWKeyboardType();
    switch(HWKeyboardType)
    {
      case 202:
        v24 = 0;
        break;
      case 207:
        v24 = 2;
        break;
      case 203:
        v24 = 1;
        break;
      default:
        v24 = -1;
        break;
    }
    goto LABEL_46;
  }
  v21 = 0;
LABEL_53:

  return v21;
}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  void *v4;
  int v5;

  +[UIDevice currentDevice](UIDevice, "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHardwareKeyboardAvailable");

  if (v5)
    -[UIApplication _updateSerializableKeyCommandsForResponder:](self, "_updateSerializableKeyCommandsForResponder:", 0);
}

- (__GSKeyboard)_hardwareKeyboard
{
  return -[UIApplication _hardwareKeyboard:](self, "_hardwareKeyboard:", 1);
}

- (__GSKeyboard)_hardwareKeyboard:(BOOL)a3
{
  return -[UIApplication GSKeyboardForHWLayout:forceRebuild:createIfNeeded:](self, "GSKeyboardForHWLayout:forceRebuild:createIfNeeded:", 0, 0, a3);
}

- (__GSKeyboard)_hardwareKeyboardForPhysicalKeyboardEvent:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t SenderID;
  __GSKeyboard *v8;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "_hidEvent"))
  {
    objc_msgSend(v6, "_hidEvent");
    SenderID = IOHIDEventGetSenderID();
  }
  else
  {
    SenderID = 0;
  }
  v8 = -[UIApplication GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:](self, "GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:", 0, SenderID, 0, v4);

  return v8;
}

- (void)_resetGSKeyboardModifierStateIfNecessary:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v4;
  int IsGlobeKeyUsagePair;
  BOOL v6;
  int v8;

  if (!IOHIDEventGetIntegerValue())
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v4 = IOHIDEventGetIntegerValue();
    IsGlobeKeyUsagePair = GSKeyboardIsGlobeKeyUsagePair();
    if (IsGlobeKeyUsagePair)
      v6 = 0;
    else
      v6 = IntegerValue == 7;
    v8 = v6 && (v4 & 0xFFFFFFFFFFFFFFF8) == 224;
    if (IsGlobeKeyUsagePair || v8)
    {
      if (objc_msgSend((id)UIApp, "GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:", 0, IOHIDEventGetSenderID(), 0, 0))
      {
        GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
      }
    }
  }
}

- (id)_responderForKeyEvents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_responderForKeyEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  v6 = v4;

  return v6;
}

- (id)_keyDownDictionary
{
  NSMutableDictionary *hardwareKeyDownCodeToEventMap;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  hardwareKeyDownCodeToEventMap = self->_hardwareKeyDownCodeToEventMap;
  if (!hardwareKeyDownCodeToEventMap)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_hardwareKeyDownCodeToEventMap;
    self->_hardwareKeyDownCodeToEventMap = v4;

    hardwareKeyDownCodeToEventMap = self->_hardwareKeyDownCodeToEventMap;
  }
  return hardwareKeyDownCodeToEventMap;
}

- (id)_pressInfoForPhysicalKeyboardEvent:(id)a3
{
  id v4;
  int v5;
  UIPressInfo *v6;
  int v7;
  double v8;
  uint64_t v9;
  void *v10;
  UIKey *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "_isKeyDown");
  v6 = objc_alloc_init(UIPressInfo);
  -[UIPressInfo setType:](v6, "setType:", objc_msgSend(v4, "_keyCode") + 2000);
  v7 = objc_msgSend(v4, "_isKeyDown");
  v8 = 0.0;
  if (v7)
    v8 = 1.0;
  -[UIPressInfo setForce:](v6, "setForce:", v8);
  if (objc_msgSend(v4, "_isKeyDown"))
    v9 = 0;
  else
    v9 = 3;
  -[UIPressInfo setPhase:](v6, "setPhase:", v9);
  objc_msgSend(v4, "timestamp");
  -[UIPressInfo setTimestamp:](v6, "setTimestamp:");
  -[UIPressInfo setSource:](v6, "setSource:", 1);
  objc_msgSend(v4, "_hidEvent");
  BKSHIDEventGetBaseAttributes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPressInfo setContextID:](v6, "setContextID:", objc_msgSend(v10, "contextID"));

  if (v5)
  {
    v11 = -[UIKey initWithKeyboardEvent:]([UIKey alloc], "initWithKeyboardEvent:", v4);
    -[UIApplication _keyDownDictionary](self, "_keyDownDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);
LABEL_10:

    goto LABEL_11;
  }
  -[UIApplication _keyDownDictionary](self, "_keyDownDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v4, "_keyCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v11 = (UIKey *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIApplication _keyDownDictionary](self, "_keyDownDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);
    goto LABEL_10;
  }
LABEL_11:
  -[UIPressInfo setKey:](v6, "setKey:", v11);

  return v6;
}

- (void)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  -[UIApplication _handleKeyHIDEvent:usingSyntheticEvent:](self, "_handleKeyHIDEvent:usingSyntheticEvent:", a3, 0);
}

- (void)_handleKeyHIDEvent:(__IOHIDEvent *)a3 usingSyntheticEvent:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t IntegerValue;
  uint64_t v8;
  int IsGlobeKeyUsagePair;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  id v13;
  uint64_t SenderID;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  _UIKeyboardHIDEventOrderedDescriptorSet *physicalKeycodeSet;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a4;
  CFRetain(a3);
  -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v8 = IOHIDEventGetIntegerValue();
    IsGlobeKeyUsagePair = GSKeyboardIsGlobeKeyUsagePair();
    v10 = !IsGlobeKeyUsagePair && IntegerValue == 7;
    v11 = v10 && (v8 & 0xFFFFFFFFFFFFFFF8) == 224;
    v12 = v11;
    if (IsGlobeKeyUsagePair || v12)
      goto LABEL_23;
  }
  v13 = -[UIEventEnvironment _physicalKeyboardEventForHIDEvent:]((id *)&self->_eventDispatcher->_mainEnvironment->super.isa, (uint64_t)a3);
  SenderID = IOHIDEventGetSenderID();
  if ((IOHIDEventGetEventFlags() & 0x40) != 0)
  {
    -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:](self, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:", SenderID, 1, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      SenderID = _lastUsedKeyboardSenderID;
      IOHIDEventSetSenderID();
    }
  }
  objc_msgSend(v13, "_setHIDEvent:keyboard:", a3, -[UIApplication GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:](self, "GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:", 0, SenderID, 0, 1));
  +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleKeyboardEvent:", v13);

  if (objc_msgSend(v13, "_isKeyDown"))
  {
    v17 = objc_msgSend(v13, "_isDeleteKey");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      v20 = 7;
    else
      v20 = 1;
    objc_msgSend(v18, "updateIdleDetection:", v20);

  }
  if (objc_msgSend(v13, "_isGlobeKey")
    && (+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "handleKeyCommand:repeatOkay:beforePublicKeyCommands:", v13, 0, 1),
        v21,
        v22))
  {
LABEL_23:
    CFRelease(a3);
  }
  else
  {
    v23 = objc_msgSend(v13, "_isKeyDown");
    physicalKeycodeSet = self->_physicalKeycodeSet;
    if (v23)
      -[_UIKeyboardHIDEventOrderedDescriptorSet addEvent:](physicalKeycodeSet, (uint64_t)a3);
    else
      -[_UIKeyboardHIDEventOrderedDescriptorSet removeEvent:](physicalKeycodeSet, (uint64_t)a3);
    CFRelease(a3);
    objc_msgSend(v28, "_keyCommandForEvent:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && objc_msgSend(v25, "_buttonType") != -1)
    {
      -[UIApplication _pressInfoForPhysicalKeyboardEvent:](self, "_pressInfoForPhysicalKeyboardEvent:", v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setType:", objc_msgSend(v26, "_buttonType"));
      objc_msgSend((id)UIApp, "_prepareButtonEvent:withPressInfo:", v13, v27);
      -[UIApplication sendEvent:](self, "sendEvent:", v13);
      -[UIApplication _finishButtonEvent:](self, "_finishButtonEvent:", v13);

    }
    -[UIApplication handleKeyUIEvent:](self, "handleKeyUIEvent:", v13);

  }
}

- (void)_handleKeyUIEvent:(id)a3
{
  int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "_isPhysicalKeyEvent");
  v5 = v8;
  if (v4)
  {
    v6 = v8;
    if (objc_msgSend(v6, "source") == 4)
    {
      -[UIApplication _pressInfoForPhysicalKeyboardEvent:](self, "_pressInfoForPhysicalKeyboardEvent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)UIApp, "_prepareButtonEvent:withPressInfo:", v6, v7);
      -[UIRepeatedAction invalidate](self->_keyRepeatAction, "invalidate");
      -[UIApplication sendEvent:](self, "sendEvent:", v6);
      -[UIApplication _finishButtonEvent:](self, "_finishButtonEvent:", v6);

    }
    else
    {
      -[UIApplication _handleKeyboardPressEvent:](self, "_handleKeyboardPressEvent:", v6);
    }

    v5 = v8;
  }

}

- (void)handleKeyUIEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleKeyUIEvent:", v4);

}

- (id)_keyCommandForKeyboardEvent:(id)a3
{
  void *v3;
  void *v4;

  -[UIApplication _keyCommandInvocationForKeyboardEvent:](self, "_keyCommandInvocationForKeyboardEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_hasKeyCommandForKeyboardEvent:(id)a3
{
  void *v3;
  BOOL v4;

  -[UIApplication _keyCommandForKeyboardEvent:](self, "_keyCommandForKeyboardEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_handleKeyCommandForKeyboardEvent:(id)a3 allowsRepeat:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  BOOL v7;

  v4 = a4;
  -[UIApplication _keyCommandInvocationForKeyboardEvent:](self, "_keyCommandInvocationForKeyboardEvent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[UIApplication _performKeyCommandInvocation:allowsRepeat:](self, "_performKeyCommandInvocation:allowsRepeat:", v6, v4);
  else
    v7 = 0;

  return v7;
}

- (id)_keyCommandInvocationForKeyboardEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _UIKeyCommandInvocation *v8;
  NSMutableDictionary *keyUpKeyCommandMap;
  void *v10;
  id v12;

  v4 = a3;
  if (!objc_msgSend(v4, "_isKeyDown"))
  {
    keyUpKeyCommandMap = self->_keyUpKeyCommandMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](keyUpKeyCommandMap, "objectForKey:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "_keyCommandForEvent:target:", v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (!v6)
    goto LABEL_5;
LABEL_3:
  v8 = -[_UIKeyCommandInvocation initWithKeyCommand:triggeringEvent:target:]([_UIKeyCommandInvocation alloc], "initWithKeyCommand:triggeringEvent:target:", v6, v4, v7);
LABEL_6:

  return v8;
}

- (BOOL)_performKeyCommandInvocation:(id)a3 allowsRepeat:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  NSMutableDictionary *keyUpKeyCommandMap;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  uint64_t SenderID;
  void *v19;
  void *v20;
  void *v22;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 13506, CFSTR("Attempted to perform a key command invocation with a nil invocation"));

  }
  objc_msgSend(v7, "keyCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggeringEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "_hidEvent"))
    goto LABEL_8;
  if (!objc_msgSend(v10, "_isKeyDown"))
  {
    -[UIRepeatedAction invalidate](self->_keyRepeatAction, "invalidate");
    keyUpKeyCommandMap = self->_keyUpKeyCommandMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v10, "_keyCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](keyUpKeyCommandMap, "removeObjectForKey:", v14);

    v12 = -[UIApplication sendAction:toTarget:fromSender:forEvent:](self, "sendAction:toTarget:fromSender:forEvent:", objc_msgSend(v8, "upAction"), v9, v8, v10);
    goto LABEL_18;
  }
  if (v9)
  {
    -[UIApplication setupRepeatActionWithinvocationDelay:reset:andRepeat:](self, "setupRepeatActionWithinvocationDelay:reset:andRepeat:", 0, 0, -1.0);
    if (v4)
      v11 = objc_msgSend(v8, "repeatable") ^ 1;
    else
      v11 = 1;
    -[UIRepeatedAction setDisableRepeat:](self->_keyRepeatAction, "setDisableRepeat:", v11);
    -[UIRepeatedAction scheduleWithTarget:selector:object:](self->_keyRepeatAction, "scheduleWithTarget:selector:object:", v9, objc_msgSend(v8, "action"), v8);
    if (objc_msgSend(v8, "upAction"))
    {
      v15 = self->_keyUpKeyCommandMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v10, "_keyCode"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v8, v16);

    }
    TIStatisticGetKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

    objc_msgSend(v10, "_hidEvent");
    SenderID = IOHIDEventGetSenderID();
    if (SenderID)
    {
      -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:](self, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:", SenderID, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        +[UIKBAnalyticsDispatcher keyboardShortcutInvokedWithKeyCommand:keyEvent:keyboardProperties:](UIKBAnalyticsDispatcher, "keyboardShortcutInvokedWithKeyCommand:keyEvent:keyboardProperties:", v8, v10, v19);
        +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "didKeyCommand:", v8);

      }
    }
    v12 = 1;
  }
  else
  {
LABEL_8:
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (id)repeatedAction:(id)a3 willInvokeWithObject:(id)a4 forPhase:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  if (a5 >= 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v8;
    objc_msgSend(v9, "set_inputFlags:", objc_msgSend(v9, "_inputFlags") | 1);
  }
  else
  {
    v10 = v8;
  }

  return v8;
}

- (BOOL)shouldInvokeRepeatedAction:(id)a3 forPhase:(unint64_t)a4
{
  int v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  if (self->_keyRepeatAction != a3)
    return 1;
  v5 = +[_UIEventDeferringManager isAnySceneBufferingEvents]();
  if (v5)
  {
    v6 = shouldInvokeRepeatedAction_forPhase____s_category;
    if (!shouldInvokeRepeatedAction_forPhase____s_category)
    {
      v6 = __UILogCategoryGetNode("KeyRepeat", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&shouldInvokeRepeatedAction_forPhase____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Allowing repeated key action to fire: NO reason: a scene is buffering events", v8, 2u);
    }
  }
  return v5 ^ 1;
}

- (void)setupRepeatActionWithinvocationDelay:(double)a3 reset:(BOOL)a4 andRepeat:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIRepeatedAction *v14;
  UIRepeatedAction *keyRepeatAction;

  v5 = a5;
  v6 = a4;
  if (self->_keyRepeatAction)
  {
    if (!a4)
      goto LABEL_3;
LABEL_9:
    -[UIRepeatedAction reset](self->_keyRepeatAction, "reset");
    if (!v5)
      return;
    goto LABEL_4;
  }
  v14 = -[UIRepeatedAction initWithInvocation:]([UIRepeatedAction alloc], "initWithInvocation:", 0);
  keyRepeatAction = self->_keyRepeatAction;
  self->_keyRepeatAction = v14;

  -[UIRepeatedAction setDelegate:](self->_keyRepeatAction, "setDelegate:", self);
  if (v6)
    goto LABEL_9;
LABEL_3:
  if (!v5)
    return;
LABEL_4:
  _AXSKeyRepeatDelay();
  v10 = v9;
  _AXSKeyRepeatInterval();
  v12 = v11;
  if (a3 == -1.0)
    v13 = v10;
  else
    v13 = a3;
  -[UIRepeatedAction setInvocationDelay:](self->_keyRepeatAction, "setInvocationDelay:", v13);
  -[UIRepeatedAction setRepeatedDelay:](self->_keyRepeatAction, "setRepeatedDelay:", v12);
}

- (void)_handleKeyboardPressEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  UIRepeatedAction *keyRepeatAction;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  char v48;
  BOOL v49;
  void *v50;
  int64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  BOOL v59;
  void *v60;
  double v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  BOOL v71;
  void *v72;
  char v73;
  void *v74;
  UIRepeatedAction *v75;
  void *v76;
  unsigned int v77;
  int v78;
  void *v79;
  int v80;
  int v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  char v87;

  v4 = a3;
  if (objc_msgSend(v4, "_isPhysicalKeyEvent"))
  {
    -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = objc_msgSend(v6, "_hidEvent");
    v8 = v7;
    if (v6 && v7)
    {
      if (objc_msgSend(v6, "_isEjectKey"))
      {
        if (objc_msgSend(v6, "_isKeyDown"))
        {
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "ejectKeyDown");

        }
        goto LABEL_93;
      }
    }
    else if (!v7)
    {
      v15 = 0;
      v10 = -1.0;
      goto LABEL_17;
    }
    v10 = -1.0;
    if (objc_msgSend(v6, "_isKeyDown")
      && _AXSKeyRepeatEnabled()
      && ((objc_opt_respondsToSelector() & 1) == 0
       || (objc_msgSend(v6, "_modifiedInput"),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = objc_msgSend(v5, "_shouldRepeatInsertText:", v11),
           v11,
           v12)))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "_modifiedInput");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_delayUntilRepeatInsertText:", v13);
        v10 = v14;

      }
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }
LABEL_17:
    -[UIApplication setupRepeatActionWithinvocationDelay:reset:andRepeat:](self, "setupRepeatActionWithinvocationDelay:reset:andRepeat:", 1, v15, v10);
    v87 = 0;
    if (objc_msgSend(v6, "_shouldAttemptSecurePasteAuthentication"))
    {
      objc_msgSend(v6, "_authenticationMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v16);

    }
    if (v8)
    {
      if (objc_msgSend(v6, "_isKeyDown"))
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "handleKeyCommand:repeatOkay:beforePublicKeyCommands:", v6, &v87, 1);

        if (v18)
        {
          if ((v15 & (v87 == 0)) != 0)
            LODWORD(v15) = 0;
          -[UIRepeatedAction setDisableRepeat:](self->_keyRepeatAction, "setDisableRepeat:", (_DWORD)v15 == 0);
          -[UIRepeatedAction setSkipInitialFire:](self->_keyRepeatAction, "setSkipInitialFire:", 1);
          keyRepeatAction = self->_keyRepeatAction;
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIRepeatedAction scheduleWithTarget:selector:object:](keyRepeatAction, "scheduleWithTarget:selector:object:", v20, sel_handleKeyEvent_, v6);

          +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "didKeyCommand:", 0);

        }
        if ((objc_msgSend(v6, "_isModifierKey") & 1) == 0)
        {
          +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "updateEventSource:options:", objc_msgSend(v6, "source"), 15);

        }
        v15 = (_DWORD)v15 != 0;
        if ((v18 & 1) != 0)
          goto LABEL_93;
      }
      else
      {
        -[UIRepeatedAction invalidate](self->_keyRepeatAction, "invalidate");
      }
    }
    if (objc_msgSend(v6, "type") != 4)
    {
      v41 = 0;
      goto LABEL_77;
    }
    objc_msgSend(v6, "_dispatchWindows");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "anyObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = v24;
    objc_msgSend(v24, "windowScene");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_focusSystemSceneComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v26;
    objc_msgSend(v26, "_eventDelivery");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v85, "shouldDeliverFocusKeyboardEvent:toResponder:", v6, v5);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v28, "isCurrentEditResponderInEditingMode");

    -[UIApplication _keyCommandInvocationForKeyboardEvent:](self, "_keyCommandInvocationForKeyboardEvent:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "_isKeyDown"))
    {
LABEL_46:
      if (objc_msgSend(v6, "_isKeyDown"))
      {
        objc_msgSend(v29, "keyCommand");
        v42 = v29;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v43, "repeatable");

        v29 = v42;
        if (v42)
          goto LABEL_48;
      }
      else
      {
        v41 = 0;
        if (v29)
        {
LABEL_48:
          v76 = v5;
          v81 = v41;
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v44, "delegateRequiresKeyEvents") & 1) != 0)
          {
            objc_msgSend(v29, "keyCommand");
            v45 = v27;
            v46 = v29;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "_handleAfterKeyEvent");

            v29 = v46;
            v27 = v45;

            if ((v48 & 1) != 0)
            {
              v49 = 0;
LABEL_55:
              v41 = v81;
              v5 = v76;
              goto LABEL_56;
            }
          }
          else
          {

          }
          v49 = -[UIApplication _performKeyCommandInvocation:allowsRepeat:](self, "_performKeyCommandInvocation:allowsRepeat:", v29, v15);
          goto LABEL_55;
        }
      }
      v49 = 0;
LABEL_56:
      if (!v49 && ((v27 ^ 1) & 1) == 0)
      {
        v50 = v29;
        objc_msgSend(v85, "willDeliverFocusKeyboardEvent:", v6);
        v86 = 0;
        v51 = -[UIApplication _pressTypeForKeyboardEvent:isTextual:](self, "_pressTypeForKeyboardEvent:isTextual:", v6, &v86);
        if (v51 == -1 || (v86 ? (v52 = v78) : (v52 = 0), (v52 & 1) != 0))
        {
          v49 = 0;
        }
        else
        {
          v53 = v51;
          v82 = v41;
          v54 = v78 ^ 1;
          if (v51 != 4)
            v54 = 1;
          if ((v54 & 1) == 0)
          {
            +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v5, "_disableAutomaticKeyboardUI")
              && !objc_msgSend(v5, "_enableAutomaticKeyboardPressDone"))
            {
              v53 = 4;
            }
            else
            {
              objc_msgSend(v55, "_focusSystem");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "_focusedView");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = v55;
              v58 = objc_msgSend(v57, "isDescendantOfView:", v55);

              v59 = v58 == 0;
              v55 = v79;
              if (v59)
                v53 = 4;
              else
                v53 = 202;
            }

          }
          objc_msgSend(v6, "_hidEvent");
          _UIEventHIDUIWindowForHIDEvent();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(-[UIApplication _pressesEventForWindow:](self, "_pressesEventForWindow:", v60), "_setHIDEvent:", objc_msgSend(v6, "_hidEvent"));
          v77 = objc_msgSend(v6, "_isKeyDown");
          objc_msgSend(v6, "timestamp");
          +[UIPressInfo _keyboardPressInfoForType:isKeyDown:timestamp:contextID:modifierFlags:](UIPressInfo, "_keyboardPressInfoForType:isKeyDown:timestamp:contextID:modifierFlags:", v53, v77, objc_msgSend(v60, "_contextId"), objc_msgSend(v6, "_modifierFlags"), v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIApplication _sendButtonEventWithPressInfo:](self, "_sendButtonEventWithPressInfo:", v62);

          v49 = 1;
          v41 = v82;
        }
        v29 = v50;
      }

      if (v49)
        goto LABEL_93;
LABEL_77:
      if (!v8 || !objc_msgSend(v6, "_isKeyDown"))
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "handleKeyEvent:", v6);

        -[UIRepeatedAction invalidate](self->_keyRepeatAction, "invalidate");
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "delegateRequiresKeyEvents");

        if (!v67)
        {
LABEL_93:

          goto LABEL_94;
        }
        -[UIApplication _keyCommandInvocationForKeyboardEvent:](self, "_keyCommandInvocationForKeyboardEvent:", v6);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "keyCommand");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "_handleAfterKeyEvent");

        if (v70)
          -[UIApplication _performKeyCommandInvocation:allowsRepeat:](self, "_performKeyCommandInvocation:allowsRepeat:", v68, 0);
LABEL_92:

        goto LABEL_93;
      }
      v63 = v15 ^ 1;
      if (v87)
        v63 = 1;
      if (((v63 | v41) & 1) == 0)
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v64, "_isKeyCommand:", v6))
        {

LABEL_90:
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = objc_msgSend(v74, "shouldAllowRepeatEvent:", v6);

          goto LABEL_91;
        }
        v71 = -[UIApplication _hasKeyCommandForKeyboardEvent:](self, "_hasKeyCommandForKeyboardEvent:", v6);

        if (v71)
          goto LABEL_90;
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "delegateRequiresKeyEvents");

        if ((v73 & 1) == 0)
          goto LABEL_90;
        LODWORD(v15) = objc_msgSend(v6, "_isModifierKey") ^ 1;
      }
LABEL_91:
      -[UIRepeatedAction setDisableRepeat:](self->_keyRepeatAction, "setDisableRepeat:", v15 ^ 1);
      v75 = self->_keyRepeatAction;
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIRepeatedAction scheduleWithTarget:selector:object:](v75, "scheduleWithTarget:selector:object:", v68, sel_handleKeyEvent_, v6);
      goto LABEL_92;
    }
    if (v27)
    {
      objc_msgSend(v29, "keyCommand");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v85, "shouldSkipKeyCommand:whenDeliveringFocusKeyboardEvent:toResponder:", v30, v6, v5);

      if (v31)
      {

        v29 = 0;
      }
    }
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "delegateAsResponder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "keyCommand");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "wantsPriorityOverSystemBehavior") & 1) == 0 && ((v78 ^ 1) & 1) == 0)
      {
        v80 = v27;
        v35 = v29;
        v36 = objc_msgSend(v33, "conformsToProtocol:", &unk_1EDE22370);

        if (!v36)
          goto LABEL_44;
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "_handlesKeyCommandForEvent:", v6);

        if ((v38 & 1) == 0)
        {
          objc_msgSend(v35, "keyCommand");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "_isLikelyToConflictWithTextInputForResponder:", v33);

          if (!v40)
          {
LABEL_44:
            v29 = v35;
            v27 = v80;
            goto LABEL_45;
          }
        }
        v34 = v35;
        v29 = 0;
        v27 = v80;
      }

    }
LABEL_45:

    goto LABEL_46;
  }
LABEL_94:

}

void __71__UIApplication__immediatelyUpdateSerializableKeyCommandsForResponder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "_layoutAwareKeyCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)MEMORY[0x1E0D00D08];
  if (v5)
  {
    objc_msgSend(v3, "_layoutAwareKeyCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyCommandWithKeyCode:modifierFlags:", objc_msgSend(v7, "firstIndex"), objc_msgSend(v3, "_layoutAwareModifierFlags"));
  }
  else
  {
    objc_msgSend(v3, "_layoutAwareInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyCommandWithInput:modifierFlags:", v7, objc_msgSend(v3, "_layoutAwareModifierFlags"));
  }
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_eventDeferringEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "addObject:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v8);

  }
}

- (id)_keyCommands
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[UIApplication keyCommands](self, "keyCommands");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  +[_UIMainMenuSystem _sharedSystem](_UIMainMenuSystem, "_sharedSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_keyCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }

  return v5;
}

- (id)keyCommands
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__UIApplication_keyCommands__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1EDDC8320 != -1)
    dispatch_once(&qword_1EDDC8320, block);
  return (id)qword_1EDDC8318;
}

void __28__UIApplication_keyCommands__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFrontBoard") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputEscape"), 0, sel__unlockPointerLockState_);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v1, "copy");

    objc_msgSend(v2, "_setEnumerationPriority:", -2);
    objc_msgSend(v2, "setAttributes:", objc_msgSend(v2, "attributes") | 4);
    objc_msgSend(v5, "addObject:", v2);
    v3 = objc_msgSend(v5, "copy");
    v4 = (void *)qword_1EDDC8318;
    qword_1EDDC8318 = v3;

  }
}

- (void)startDictation:(id)a3
{
  void *v3;
  id v4;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReasonType:", 23);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleHardwareKeyboardGesture");

}

- (void)orderFrontCharacterPalette:(id)a3
{
  id v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleEmojiPopoverKeyCommand");

}

- (void)showHelp:(id)a3
{
  id v3;

  +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestHUDPresentationIntoSearchMode");

}

- (BOOL)_areKeyboardHUDsEnabled
{
  _BOOL4 v3;

  if (-[UIApplication isFrontBoard](self, "isFrontBoard"))
    return (*((unsigned __int8 *)&self->_applicationFlags + 12) >> 6) & 1;
  else
    LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_isGlobeKeyShortcutHUDEnabled
{
  BOOL result;

  if (qword_1EDDC8328 != -1)
    dispatch_once(&qword_1EDDC8328, &__block_literal_global_1597);
  result = -[UIApplication isFrontBoard](self, "isFrontBoard");
  if (byte_1EDDC8018)
    return 1;
  return result;
}

void __46__UIApplication__isGlobeKeyShortcutHUDEnabled__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8018 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Spotlight"));

}

- (void)handleKeyEvent:(__GSEvent *)a3
{
  id v4;

  -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleKeyEvent:", a3);

}

- (void)_handleGameControllerEvent:(id)a3
{
  objc_msgSend(a3, "_maybeConvertAndSendAsPressesEvent");
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "subtype") >= 200 && objc_msgSend(v4, "subtype") <= 205)
  {
    if (objc_msgSend(v4, "subtype") == 200)
    {
      v5 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
      v6 = v5 == 0;
      if (v5)
        v7 = 2;
      else
        v7 = 1;
      v8 = 32;
      v9 = 16;
    }
    else
    {
      if (objc_msgSend(v4, "subtype") != 201)
      {
        if (objc_msgSend(v4, "subtype") == 202)
        {
          v7 = 1;
          v11 = 1;
        }
        else if (objc_msgSend(v4, "subtype") == 204)
        {
          v11 = 4;
          v7 = 3;
        }
        else if (objc_msgSend(v4, "subtype") == 203)
        {
          v7 = 2;
          v11 = 2;
        }
        else
        {
          v12 = objc_msgSend(v4, "subtype") == 205;
          v7 = 4 * v12;
          v11 = 8 * v12;
        }
        goto LABEL_17;
      }
      v10 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
      v6 = v10 == 0;
      if (v10)
        v7 = 1;
      else
        v7 = 2;
      v8 = 16;
      v9 = 32;
    }
    if (v6)
      v11 = v9;
    else
      v11 = v8;
LABEL_17:
    -[UIApplication _sendMoveEventWithDirection:heading:fromEvent:](self, "_sendMoveEventWithDirection:heading:fromEvent:", v7, v11, v4);
    goto LABEL_18;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIApplication;
  -[UIResponder _wheelChangedWithEvent:](&v13, sel__wheelChangedWithEvent_, v4);
LABEL_18:

}

- (void)_sendMoveEventWithDirection:(int64_t)a3 heading:(unint64_t)a4 fromEvent:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v8 = a5;
  objc_msgSend(v8, "_hidEvent");
  _UIEventHIDUIWindowForHIDEvent();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIApplication _moveEventForWindow:](self, "_moveEventForWindow:", v9);

  objc_msgSend(v10, "_setHIDEvent:", objc_msgSend(v8, "_hidEvent"));
  v11 = objc_msgSend(v8, "_gsEvent");

  objc_msgSend(v10, "_setGSEvent:", v11);
  objc_msgSend(v10, "_setMoveDirection:", a3);
  objc_msgSend(v10, "_setFocusHeading:", a4);
  -[UIApplication sendEvent:](self, "sendEvent:", v10);
}

- (void)_sendMoveEventWithPressesEvent:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_lastPreparedPress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 <= 3)
    -[UIApplication _sendMoveEventWithDirection:heading:fromEvent:](self, "_sendMoveEventWithDirection:heading:fromEvent:", v5 + 1, qword_186682688[v5], v6);

}

- (int64_t)_pressTypeForKeyboardEvent:(id)a3 isTextual:(BOOL *)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;
  int64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v5 = a3;
  v6 = objc_msgSend(v5, "_keyCode");
  v7 = 0;
  v8 = -1;
  v9 = 1;
  switch(v6)
  {
    case 'O':
      v9 = 0;
      v7 = 0;
      v8 = 3;
      if (a4)
        goto LABEL_19;
      break;
    case 'P':
      v9 = 0;
      v7 = 0;
      v8 = 2;
      if (a4)
        goto LABEL_19;
      break;
    case 'Q':
      v9 = 0;
      v7 = 0;
      v8 = 1;
      goto LABEL_18;
    case 'R':
      v9 = 0;
      v8 = 0;
      v7 = 0;
      if (!a4)
        break;
      goto LABEL_19;
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
LABEL_18:
      if (a4)
        goto LABEL_19;
      break;
    case 'X':
LABEL_9:
      v9 = 0;
      v7 = 0;
      v8 = 4;
      if (!a4)
        break;
LABEL_19:
      *a4 = v7;
      break;
    default:
      switch(v6)
      {
        case '(':
          goto LABEL_9;
        case ')':
          v9 = 0;
          v7 = 0;
          v8 = 5;
          if (a4)
            goto LABEL_19;
          break;
        case '*':
          goto LABEL_18;
        case '+':
          v9 = 0;
          v7 = 0;
          v8 = 203;
          if (a4)
            goto LABEL_19;
          break;
        case ',':
          v9 = 0;
          v7 = 1;
          v8 = 6;
          if (a4)
            goto LABEL_19;
          break;
        default:
          if (v6 == 158)
            goto LABEL_9;
          goto LABEL_18;
      }
      break;
  }
  if (v9)
  {
    if (objc_msgSend(v5, "_isKeyDown"))
      v10 = 0;
    else
      v10 = 3;
    objc_msgSend(v5, "_pressesForPhase:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "characters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UIKeyInputEscape"));

    if (v15)
      v8 = 5;
    else
      v8 = -1;

  }
  return v8;
}

uint64_t __50__UIApplication__setIdleModeVisualEffectsEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleModeVisualEffectsEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)_isIdleModeVisualEffectsEnabled
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 8) >> 2) & 1;
}

- (void)_setSystemUserInterfaceStyle:(int64_t)a3
{
  void *v3;
  _QWORD v4[6];

  if (a3)
  {
    if (self->_systemUserInterfaceStyle != a3)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __46__UIApplication__setSystemUserInterfaceStyle___block_invoke;
      v4[3] = &unk_1E16B1888;
      v4[4] = self;
      v4[5] = a3;
      -[UIApplication _updateEffectiveUserInterfaceStyleAfterChange:](self, "_updateEffectiveUserInterfaceStyleAfterChange:", v4);
      +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_1600_0);

    }
  }
}

uint64_t __46__UIApplication__setSystemUserInterfaceStyle___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 128) = *(_QWORD *)(result + 40);
  return result;
}

void __46__UIApplication__setSystemUserInterfaceStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "_systemAppearanceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUserInterfaceStyle");

}

- (int64_t)_systemUserInterfaceStyle
{
  return self->_systemUserInterfaceStyle;
}

- (void)_updateEffectiveUserInterfaceStyleAfterChange:(id)a3
{
  void (**v4)(id);
  int64_t v5;
  BOOL v6;
  void *v7;
  void (**v8)(id);

  v4 = (void (**)(id))a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[UIApplication _pureEffectiveUserInterfaceStyle](self, "_pureEffectiveUserInterfaceStyle");
    v8[2](v8);
    v6 = v5 == -[UIApplication _effectiveUserInterfaceStyle](self, "_effectiveUserInterfaceStyle");
    v4 = v8;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("_UIApplicationEffectiveUserInterfaceStyleChangedNotification"), self);

      v4 = v8;
    }
  }

}

- (void)_maybeEffectiveUserInterfaceStyleChanged
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_UIApplicationEffectiveUserInterfaceStyleChangedNotification"), UIApp);

}

+ (void)_setDebugUserInterfaceStyleOverride:(int64_t)a3
{
  id v4;
  _QWORD block[4];
  id v6;
  int64_t v7;
  _QWORD aBlock[5];

  if (sDebugUserInterfaceStyleOverride != a3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke_2;
    block[3] = &unk_1E16B2560;
    v6 = _Block_copy(aBlock);
    v7 = a3;
    v4 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke(uint64_t result)
{
  sDebugUserInterfaceStyleOverride = *(_QWORD *)(result + 32);
  return result;
}

uint64_t __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (UIApp)
    return objc_msgSend((id)UIApp, "_updateEffectiveUserInterfaceStyleAfterChange:", v1);
  else
    return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
}

- (id)_idleModeController
{
  _UIIdleModeController *idleModeController;
  _UIIdleModeController *v4;
  void *v5;
  _UIIdleModeController *v6;
  _UIIdleModeController *v7;

  idleModeController = self->_idleModeController;
  if (!idleModeController)
  {
    v4 = [_UIIdleModeController alloc];
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIIdleModeController initWithScreen:](v4, "initWithScreen:", v5);
    v7 = self->_idleModeController;
    self->_idleModeController = v6;

    idleModeController = self->_idleModeController;
  }
  return idleModeController;
}

- (void)_updateIdleModeStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[UIApplication _mainScene](self, "_mainScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v6, "idleModeEnabled");
  -[UIApplication _idleModeController](self, "_idleModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleModeEnabled:", v4);

}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[UIApplication keyWindow](self, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (void)_setDisableBecomeFirstResponder:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (id)_currentHardwareKeyboardLayoutName
{
  void *v4;
  int v5;
  __GSKeyboard *v6;
  void *v8;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 14461, CFSTR("Call must be made on main thread"));

  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHardwareKeyboardAvailable");

  if (v5)
  {
    v6 = -[UIApplication _hardwareKeyboard:](self, "_hardwareKeyboard:", 0);
    if (v6)
      v6 = (__GSKeyboard *)objc_msgSend((id)GSKeyboardGetLayout(), "copy");
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unsigned)_currentHardwareKeyboardType
{
  void *v3;
  int v4;
  unsigned int v5;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isHardwareKeyboardAvailable");

  if (v4
    && -[UIApplication _hardwareKeyboard:](self, "_hardwareKeyboard:", 0)
    && (v5 = GSKeyboardGetHWKeyboardType() - 202, v5 <= 5))
  {
    return dword_1866826A8[v5];
  }
  else
  {
    return -1;
  }
}

- (void)setHardwareKeyboardLayoutName:(id)a3
{
  -[UIApplication setHardwareKeyboardLayoutName:forceRebuild:](self, "setHardwareKeyboardLayoutName:forceRebuild:", a3, 0);
}

- (void)setHardwareKeyboardLayoutName:(id)a3 forceRebuild:(BOOL)a4
{
  unsigned int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[UIApplication GSKeyboardForHWLayout:forceRebuild:](self, "GSKeyboardForHWLayout:forceRebuild:", a3, a4);
  v4 = GSKeyboardGetModifierState() & 0x40000;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCapsLockASCIIToggle");

  BKSHIDServicesSetCapsLockRomanSwitchMode();
  if (!v6)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustCapsLockDelayOverride");

    if (BKSHIDServicesIsCapsLockLightOn() == v4 >> 18)
      return;
    goto LABEL_5;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeCapsLockDelayOverride");

  if (v4)
  {
LABEL_5:
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  }
}

- (void)clearHardwareKeyboardState
{
  -[UIApplication GSKeyboardForHWLayout:forceRebuild:](self, "GSKeyboardForHWLayout:forceRebuild:", 0, 1);
}

- (void)setCapsLockDelayOverride:(double)a3
{
  void *v3;
  int v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInHardwareKeyboardMode");

  if (v4)
    BKSHIDServicesSetCapsLockDelayOverride();
}

- (id)_rootViewControllers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "rootViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "window");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "_isTextEffectsWindow");

          if ((v12 & 1) == 0)
            objc_msgSend(v2, "addObject:", v9);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v2, "count"))
    v13 = v2;
  else
    v13 = 0;

  return v13;
}

- (BOOL)_isAutorotationDisabledForAppWindows
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIApplication _rootViewControllers](self, "_rootViewControllers");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_viewControllerForSupportedInterfaceOrientations", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "shouldAutorotate")
          && (objc_msgSend(v7, "supportedInterfaceOrientations") & 0x1E) != 0)
        {

          v8 = 0;
          goto LABEL_12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

+ (BOOL)_isRunningWithFixedMainThreadPriority
{
  return __shouldFixMainThreadPriority;
}

- (void)setExpectsFaceContact:(BOOL)a3
{
  -[UIApplication setExpectsFaceContact:inLandscape:](self, "setExpectsFaceContact:inLandscape:", a3, 0);
}

- (void)setExpectsFaceContact:(BOOL)a3 inLandscape:(BOOL)a4
{
  void *v6;
  _QWORD v7[4];
  BOOL v8;
  BOOL v9;

  -[UIApplication _mainScene](self, "_mainScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__UIApplication_setExpectsFaceContact_inLandscape___block_invoke;
  v7[3] = &__block_descriptor_34_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "updateUIClientSettingsWithBlock:", v7);

}

void __51__UIApplication_setExpectsFaceContact_inLandscape___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "proximityDetectionModes");
  v4 = 8;
  if (!*(_BYTE *)(a1 + 32))
    v4 = 4;
  v5 = v4 | v3;
  v6 = v3 & ~v4;
  if (*(_BYTE *)(a1 + 33))
    v6 = v5;
  objc_msgSend(v7, "setProximityDetectionModes:", v6 & 0xFFFFFFFFFFFFFFFELL | ((v6 & 0xC) == 0));

}

- (void)_setApplicationIsOpaque:(BOOL)a3
{
  -[UIApplication _setBackgroundStyle:](self, "_setBackgroundStyle:", !a3);
}

- (void)_setApplicationBackdropStyle:(int64_t)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 2010:
      v3 = 2;
      break;
    case 2030:
      v3 = 4;
      break;
    case 2020:
      v3 = 3;
      break;
    default:
      return;
  }
  -[UIApplication _setBackgroundStyle:](self, "_setBackgroundStyle:", v3);
}

- (void)willDisplayMiniAlert
{
  void *v2;
  id v3;

  -[UIApplication _mainScene](self, "_mainScene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateUIClientSettingsWithBlock:", &__block_literal_global_1605_0);

}

void __37__UIApplication_willDisplayMiniAlert__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setVisibleMiniAlertCount:", objc_msgSend(v2, "visibleMiniAlertCount") + 1);

}

- (void)didDismissMiniAlert
{
  void *v2;
  id v3;

  -[UIApplication _mainScene](self, "_mainScene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateUIClientSettingsWithUITransitionBlock:", &__block_literal_global_1607);

}

uint64_t __36__UIApplication_didDismissMiniAlert__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "visibleMiniAlertCount"))
    v3 = objc_msgSend(v2, "visibleMiniAlertCount") - 1;
  else
    v3 = 0;
  objc_msgSend(v2, "setVisibleMiniAlertCount:", v3);

  return 1;
}

- (BOOL)isLocked
{
  return 0;
}

- (BOOL)isPasscodeRequiredToUnlock
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeLockedOrBlocked");

  return v3;
}

- (void)_requestDeviceUnlockWithCompletion:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 14746, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0DC5B78]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke;
  v10[3] = &unk_1E16C5E00;
  v11 = v6;
  v12 = v5;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "requestPasscodeUnlockUIWithCompletion:", v10);

}

void __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke_2;
  v7 = &unk_1E16BFB78;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], &v4);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4, v5, v6, v7);

}

uint64_t __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isTerminating
{
  return _applicationTerminating;
}

- (void)registerUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
  void *v4;
  UIUserNotificationSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  UIApplication *v12;

  v4 = (void *)MEMORY[0x1E0CEC7A0];
  v5 = notificationSettings;
  objc_msgSend(v4, "currentNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationSettings categories](v5, "categories");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "bs_map:", UIUserNotificationCategoryToUNNotificationCategory);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNotificationCategories:", v8);
  LOBYTE(v7) = -[UIUserNotificationSettings types](v5, "types");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke;
  v10[3] = &unk_1E16DD760;
  v11 = v6;
  v12 = self;
  v9 = v6;
  objc_msgSend(v9, "requestAuthorizationWithOptions:completionHandler:", v7 & 7, v10);

}

void __50__UIApplication_registerUserNotificationSettings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke_2;
  v5[3] = &unk_1E16DD738;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v3, "getNotificationSettingsWithCompletionHandler:", v5);

}

uint64_t __50__UIApplication_registerUserNotificationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v3 = UIRemoteNotificationTypesFromUNNotificationSettings(a2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke_3;
  v6[3] = &unk_1E16DD710;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v6[5] = v3;
  return objc_msgSend(v4, "getNotificationCategoriesWithCompletionHandler:", v6);
}

void __50__UIApplication_registerUserNotificationSettings___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a2, "bs_map:", UNNotificationCategoryToUIUserNotificationCategory);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIUserNotificationSettings settingsForTypes:categories:](UIUserNotificationSettings, "settingsForTypes:categories:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke_4;
  v6[3] = &unk_1E16B1B50;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __50__UIApplication_registerUserNotificationSettings___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "application:didRegisterUserNotificationSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)isRegisteredForRemoteNotifications
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CD22F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsRemoteNotifications");

  return v3;
}

- (void)unregisterForRemoteNotifications
{
  PKPushRegistry *applicationPushRegistry;
  void *v4;
  PKPushRegistry *v5;

  applicationPushRegistry = self->_applicationPushRegistry;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPushRegistry setDesiredPushTypes:](applicationPushRegistry, "setDesiredPushTypes:", v4);

  -[PKPushRegistry setDelegate:](self->_applicationPushRegistry, "setDelegate:", 0);
  v5 = self->_applicationPushRegistry;
  self->_applicationPushRegistry = 0;

}

- (UIRemoteNotificationType)enabledRemoteNotificationTypes
{
  void *v3;
  void *v4;
  UIRemoteNotificationType v5;

  if (dyld_program_sdk_at_least())
  {
    NSLog(CFSTR("enabledRemoteNotificationTypes is not supported in iOS 8.0 and later."));
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = UIRemoteNotificationTypesFromUNNotificationSettings(v4);

    return v5;
  }
}

- (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types
{
  if (dyld_program_sdk_at_least())
    NSLog(CFSTR("registerForRemoteNotificationTypes: is not supported in iOS 8.0 and later."));
  else
    -[UIApplication _registerForRemoteNotificationTypes:](self, "_registerForRemoteNotificationTypes:", types);
}

- (void)_registerForRemoteNotificationTypes:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3 & 7;
  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__UIApplication__registerForRemoteNotificationTypes___block_invoke;
  v6[3] = &unk_1E16DD788;
  v6[4] = self;
  objc_msgSend(v5, "requestAuthorizationWithOptions:completionHandler:", v4, v6);

}

void __53__UIApplication__registerForRemoteNotificationTypes___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIApplication__registerForRemoteNotificationTypes___block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__UIApplication__registerForRemoteNotificationTypes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForRemoteNotifications");
}

- (void)pushRegistry:(id)a3 didReceiveIncomingPushWithPayload:(id)a4 forType:(id)a5 withCompletionHandler:(id)a6
{
  id v8;
  void (**v9)(_QWORD);
  char v10;
  UIApplicationDelegate *delegate;
  UIApplicationDelegate *v12;
  void *v13;
  void *v14;
  UIApplicationDelegate *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);

  v8 = a4;
  v9 = (void (**)(_QWORD))a6;
  v10 = objc_opt_respondsToSelector();
  objc_msgSend((id)UIApp, "applicationState");
  delegate = self->_delegate;
  if ((v10 & 1) != 0)
  {
    -[UIApplicationDelegate methodForSelector:](delegate, "methodForSelector:", sel_application_didReceiveRemoteNotification_fetchCompletionHandler_);
    entr_act_modify();
    v12 = self->_delegate;
    objc_msgSend(v8, "dictionaryPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__UIApplication_pushRegistry_didReceiveIncomingPushWithPayload_forType_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E16D7E70;
    v18 = v9;
    _UIAutologgingBackgroundFetchBlock(CFSTR("Warning: Application delegate received call to -application:didReceiveRemoteNotification:fetchCompletionHandler: but the completion handler was never called."), v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationDelegate application:didReceiveRemoteNotification:fetchCompletionHandler:](v12, "application:didReceiveRemoteNotification:fetchCompletionHandler:", self, v13, v14);

  }
  else
  {
    -[UIApplicationDelegate methodForSelector:](delegate, "methodForSelector:", sel_application_didReceiveRemoteNotification_);
    entr_act_modify();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = self->_delegate;
      objc_msgSend(v8, "dictionaryPayload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplicationDelegate application:didReceiveRemoteNotification:](v15, "application:didReceiveRemoteNotification:", self, v16);

    }
    if (v9)
      v9[2](v9);
  }

}

uint64_t __94__UIApplication_pushRegistry_didReceiveIncomingPushWithPayload_forType_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pushRegistry:(id)a3 didInvalidatePushTokenForType:(id)a4 error:(id)a5
{
  id v7;
  PKPushRegistry *applicationPushRegistry;
  void *v9;
  PKPushRegistry *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  UIApplication *v15;
  id v16;

  v7 = a5;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CD2308]))
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__UIApplication_pushRegistry_didInvalidatePushTokenForType_error___block_invoke;
    v14 = &unk_1E16B1B50;
    v15 = self;
    v16 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], &v11);
    applicationPushRegistry = self->_applicationPushRegistry;
    objc_msgSend(MEMORY[0x1E0C99E60], "set", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPushRegistry setDesiredPushTypes:](applicationPushRegistry, "setDesiredPushTypes:", v9);

    -[PKPushRegistry setDelegate:](self->_applicationPushRegistry, "setDelegate:", 0);
    v10 = self->_applicationPushRegistry;
    self->_applicationPushRegistry = 0;

  }
}

uint64_t __66__UIApplication_pushRegistry_didInvalidatePushTokenForType_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "application:didFailToRegisterForRemoteNotificationsWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)presentLocalNotificationNow:(UILocalNotification *)notification
{
  id v4;

  v4 = (id)-[UILocalNotification copy](notification, "copy");
  objc_msgSend(v4, "setFireDate:", 0);
  objc_msgSend(v4, "setTimeZone:", 0);
  objc_msgSend(v4, "setRepeatInterval:", 0);
  -[UIApplication _scheduleLocalNotification:](self, "_scheduleLocalNotification:", v4);

}

- (void)scheduleLocalNotification:(UILocalNotification *)notification
{
  id v4;

  v4 = (id)-[UILocalNotification copy](notification, "copy");
  -[UIApplication _scheduleLocalNotification:](self, "_scheduleLocalNotification:", v4);

}

- (void)_scheduleLocalNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIApplication currentUserNotificationSettings](self, "currentUserNotificationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "types");

    if ((v5 & 4) == 0)
    {
      +[UIUserNotificationSettings settingsForTypes:categories:](UIUserNotificationSettings, "settingsForTypes:categories:", 7, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplication registerUserNotificationSettings:](self, "registerUserNotificationSettings:", v6);

    }
  }
  v7 = v10;
  if (v10)
  {
    (*((void (**)(uint64_t, void *))UILocalNotificationToUNNotificationRequest + 2))((uint64_t)UILocalNotificationToUNNotificationRequest, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addNotificationRequest:withCompletionHandler:", v8, 0);

    v7 = v10;
  }

}

- (void)cancelLocalNotification:(UILocalNotification *)notification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (notification)
  {
    (*((void (**)(uint64_t, void *))UILocalNotificationToUNNotificationRequest + 2))((uint64_t)UILocalNotificationToUNNotificationRequest, notification);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeSimilarNotificationRequests:", v4);

      v3 = v6;
    }

  }
}

- (void)setScheduledLocalNotifications:(NSArray *)scheduledLocalNotifications
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;

  v9 = scheduledLocalNotifications;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIApplication currentUserNotificationSettings](self, "currentUserNotificationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "types");

    if ((v5 & 4) == 0)
    {
      +[UIUserNotificationSettings settingsForTypes:categories:](UIUserNotificationSettings, "settingsForTypes:categories:", 7, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplication registerUserNotificationSettings:](self, "registerUserNotificationSettings:", v6);

    }
  }
  -[NSArray bs_map:](v9, "bs_map:", UILocalNotificationToUNNotificationRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationRequests:", v7);

}

- (NSArray)scheduledLocalNotifications
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingNotificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_map:", UNNotificationRequestToUILocalNotification);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)_requiresHighResolution
{
  _UIApplicationInfoParser *appInfo;

  appInfo = self->_appInfo;
  return !appInfo || -[_UIApplicationInfoParser requiresHighResolution](appInfo, "requiresHighResolution");
}

- (BOOL)_taskSuspendingUnsupported
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 6) & 1;
}

- (void)_openURL:(id)a3 originatingView:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, _QWORD);
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t v28[8];
  _QWORD aBlock[4];
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__UIApplication__openURL_originatingView_options_completionHandler___block_invoke;
  aBlock[3] = &unk_1E16B1BA0;
  v14 = v13;
  v30 = v14;
  v15 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (qword_1EDDC80D0 != -1)
    dispatch_once(&qword_1EDDC80D0, &__block_literal_global_902);
  if (byte_1EDDC7FFB)
  {
    objc_msgSend(v11, "_viewControllerForAncestor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = qword_1EDDC8330;
      if (!qword_1EDDC8330)
      {
        v18 = __UILogCategoryGetNode("Extension", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1EDDC8330);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Cannot open URL because an extension context could not be found.", v28, 2u);
      }
      v15[2](v15, 0);
    }
    objc_msgSend(v17, "openURL:completionHandler:", v10, v15);

  }
  else if (-[UIApplication isFrontBoard](self, "isFrontBoard"))
  {
    ((void (**)(void *, BOOL))v15)[2](v15, -[UIApplication _openURL:](self, "_openURL:", v10));
  }
  else
  {
    objc_msgSend(v11, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_windowHostingScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_currentOpenApplicationEndpoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applicationInitializationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "defaultSceneToken");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v25, "stringRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _UISVisibilityEnvironmentForSceneIdentityTokenString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIApplication _currentOpenApplicationEndpointForEnvironment:](self, "_currentOpenApplicationEndpointForEnvironment:", v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = 0;
      }

    }
    -[UIApplication _openURL:options:openApplicationEndpoint:completionHandler:](self, "_openURL:options:openApplicationEndpoint:completionHandler:", v10, v12, v22, v15);

  }
}

uint64_t __68__UIApplication__openURL_originatingView_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_openURL:(id)a3 originatingView:(id)a4 completionHandler:(id)a5
{
  -[UIApplication _openURL:originatingView:options:completionHandler:](self, "_openURL:originatingView:options:completionHandler:", a3, a4, MEMORY[0x1E0C9AA70], a5);
}

- (void)_hideNetworkActivityIndicator
{
  -[UIApplication setNetworkActivityIndicatorVisible:](self, "setNetworkActivityIndicatorVisible:", 0);
}

- (void)_beginShowingNetworkActivityIndicator
{
  int64_t networkResourcesCurrentlyLoadingCount;
  NSTimer *hideNetworkActivityIndicatorTimer;
  NSTimer *v5;

  networkResourcesCurrentlyLoadingCount = self->_networkResourcesCurrentlyLoadingCount;
  if (!networkResourcesCurrentlyLoadingCount)
  {
    hideNetworkActivityIndicatorTimer = self->_hideNetworkActivityIndicatorTimer;
    if (hideNetworkActivityIndicatorTimer && -[NSTimer isValid](hideNetworkActivityIndicatorTimer, "isValid"))
    {
      -[NSTimer invalidate](self->_hideNetworkActivityIndicatorTimer, "invalidate");
      v5 = self->_hideNetworkActivityIndicatorTimer;
      self->_hideNetworkActivityIndicatorTimer = 0;

    }
    objc_msgSend((id)UIApp, "setNetworkActivityIndicatorVisible:", 1);
    networkResourcesCurrentlyLoadingCount = self->_networkResourcesCurrentlyLoadingCount;
  }
  self->_networkResourcesCurrentlyLoadingCount = networkResourcesCurrentlyLoadingCount + 1;
}

- (void)_endShowingNetworkActivityIndicator
{
  int64_t v2;
  NSTimer *v4;
  NSTimer *hideNetworkActivityIndicatorTimer;

  v2 = self->_networkResourcesCurrentlyLoadingCount - 1;
  self->_networkResourcesCurrentlyLoadingCount = v2;
  if (!v2)
  {
    -[NSTimer invalidate](self->_hideNetworkActivityIndicatorTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__hideNetworkActivityIndicator, 0, 0, 0.1);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    hideNetworkActivityIndicatorTimer = self->_hideNetworkActivityIndicatorTimer;
    self->_hideNetworkActivityIndicatorTimer = v4;

  }
}

- (void)_setIgnoreHeadsetClicks:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)_shouldIgnoreHeadsetClicks
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 4) & 1;
}

- (BOOL)shouldFenceStatusBarRotation
{
  return (*((_BYTE *)&self->_applicationFlags + 10) & 1) == 0;
}

- (BOOL)_executableWasLinkedWithUIKit
{
  return (*((_BYTE *)&self->_applicationFlags + 10) & 1) == 0;
}

- (unint64_t)_beginBackgroundTaskWithExpirationHandler:(id)a3
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(a3, 0);
}

- (id)_backgroundModes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UIBackgroundModes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_wakeTimerFired
{
  if (qword_1EDDC8338)
  {
    (*(void (**)(void))(qword_1EDDC8338 + 16))();
    _setNextWakeDate();
  }
}

- (BOOL)_UIApplicationLegacyVoipAllowed
{
  return UISelfTaskHasEntitlement(CFSTR("com.apple.developer.legacyvoip"));
}

- (BOOL)setKeepAliveTimeout:(NSTimeInterval)timeout handler:(void *)keepAliveHandler
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v6 = keepAliveHandler;
  if (dyld_program_sdk_at_least()
    && !-[UIApplication _UIApplicationLegacyVoipAllowed](self, "_UIApplicationLegacyVoipAllowed"))
  {
    NSLog(CFSTR("The UIApplication method %s is deprecated and no longer supported. Please use PushKit for VoIP applications instead of calling this method"), "-[UIApplication setKeepAliveTimeout:handler:]");
    goto LABEL_14;
  }
  if (timeout < 600.0)
  {
    NSLog(CFSTR("KeepAliveTimeout must be >= %.0f seconds"), 0x4082C00000000000);
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  -[UIApplication _backgroundModes](self, "_backgroundModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", CFSTR("voip")) & 1) != 0)
  {

  }
  else
  {
    v8 = -[UIApplication _UIApplicationLegacyVoipAllowed](self, "_UIApplicationLegacyVoipAllowed");

    if (!v8)
    {
      NSLog(CFSTR("Only VoIP apps can set KeepAliveTimeout"));
      goto LABEL_14;
    }
  }
  qword_1EDDC8340 = *(_QWORD *)&timeout;
  v9 = (void *)qword_1EDDC8338;
  if (qword_1EDDC8338)
  {
    qword_1EDDC8338 = 0;

  }
  if (!v6)
    goto LABEL_14;
  v10 = objc_msgSend(v6, "copy");
  v11 = (void *)qword_1EDDC8338;
  qword_1EDDC8338 = v10;

  _setNextWakeDate();
  v12 = 1;
LABEL_15:

  return v12;
}

- (void)clearKeepAliveTimeout
{
  void *v3;

  if (!dyld_program_sdk_at_least()
    || -[UIApplication _UIApplicationLegacyVoipAllowed](self, "_UIApplicationLegacyVoipAllowed"))
  {
    qword_1EDDC8340 = 0;
    v3 = (void *)qword_1EDDC8338;
    if (qword_1EDDC8338)
    {
      qword_1EDDC8338 = 0;

    }
    _setNextWakeDate();
  }
}

- (void)beginReceivingRemoteControlEvents
{
  int64_t remoteControlEventObservers;
  _QWORD v4[5];

  remoteControlEventObservers = self->_remoteControlEventObservers;
  self->_remoteControlEventObservers = remoteControlEventObservers + 1;
  if (!remoteControlEventObservers)
  {
    __MRMediaRemoteSetCanBeNowPlayingApplication(1);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__UIApplication_beginReceivingRemoteControlEvents__block_invoke;
    v4[3] = &unk_1E16DD7B8;
    v4[4] = self;
    __MRMediaRemoteSetCommandHandlerBlock(v4);
  }
}

void __50__UIApplication_beginReceivingRemoteControlEvents__block_invoke(uint64_t a1, int a2, const __CFDictionary *a3)
{
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *Value;
  id v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id *v22;
  void *v23;
  const void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  if (a3)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v6 = (id *)qword_1EDDC84A0;
    v30 = qword_1EDDC84A0;
    if (!qword_1EDDC84A0)
    {
      v7 = MediaRemoteLibrary();
      v6 = (id *)dlsym(v7, "kMRMediaRemoteOptionIsExternalPlayerCommand");
      v28[3] = (uint64_t)v6;
      qword_1EDDC84A0 = (uint64_t)v6;
    }
    _Block_object_dispose(&v27, 8);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkMRMediaRemoteOptionIsExternalPlayerCommand(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UIApplication.m"), 15387, CFSTR("%s"), dlerror());
      goto LABEL_73;
    }
    v8 = (id)CFDictionaryGetValue(a3, objc_retainAutorelease(*v6));
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
    {
LABEL_66:
      CFRetain(&unk_1E1A94730);

      return;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = 6;
  switch(a2)
  {
    case 0:
      goto LABEL_39;
    case 1:
      v10 = 7;
      goto LABEL_39;
    case 2:
      v10 = 0;
      goto LABEL_39;
    case 3:
      v10 = 5;
      goto LABEL_39;
    case 4:
      v10 = 1;
      goto LABEL_39;
    case 5:
      v10 = 2;
      goto LABEL_39;
    case 6:
      v10 = 12;
      goto LABEL_39;
    case 7:
      v10 = 13;
      goto LABEL_39;
    case 8:
      v10 = 14;
      goto LABEL_39;
    case 9:
      v10 = 16;
      goto LABEL_39;
    case 10:
      v10 = 15;
      goto LABEL_39;
    case 11:
      v10 = 17;
      goto LABEL_39;
    case 12:
      v10 = 23;
      goto LABEL_39;
    case 13:
      v10 = 25;
      goto LABEL_39;
    case 14:
      v10 = 24;
      goto LABEL_39;
    case 15:
      v10 = 26;
      goto LABEL_39;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
      goto LABEL_66;
    case 21:
      v10 = 27;
LABEL_39:
      if (a3)
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v11 = (id *)qword_1EDDC84A8;
        v30 = qword_1EDDC84A8;
        if (!qword_1EDDC84A8)
        {
          v12 = MediaRemoteLibrary();
          v11 = (id *)dlsym(v12, "kMRMediaRemoteOptionMediaType");
          v28[3] = (uint64_t)v11;
          qword_1EDDC84A8 = (uint64_t)v11;
        }
        _Block_object_dispose(&v27, 8);
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkMRMediaRemoteOptionMediaType(void)");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UIApplication.m"), 15377, CFSTR("%s"), dlerror());
          break;
        }
        Value = (void *)CFDictionaryGetValue(a3, objc_retainAutorelease(*v11));
      }
      else
      {
        Value = 0;
      }
      v14 = Value;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v15 = (_QWORD *)qword_1EDDC84B0;
      v30 = qword_1EDDC84B0;
      if (!qword_1EDDC84B0)
      {
        v16 = MediaRemoteLibrary();
        v15 = dlsym(v16, "kMRMediaRemoteMediaTypeAudio");
        v28[3] = (uint64_t)v15;
        qword_1EDDC84B0 = (uint64_t)v15;
      }
      _Block_object_dispose(&v27, 8);
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkMRMediaRemoteMediaTypeAudio(void)");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UIApplication.m"), 15379, CFSTR("%s"), dlerror());
        break;
      }
      if ((objc_msgSend(v14, "isEqualToString:", *v15) & 1) != 0)
      {
        v17 = 3;
      }
      else
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v18 = (_QWORD *)qword_1EDDC84B8;
        v30 = qword_1EDDC84B8;
        if (!qword_1EDDC84B8)
        {
          v19 = MediaRemoteLibrary();
          v18 = dlsym(v19, "kMRMediaRemoteMediaTypeVideo");
          v28[3] = (uint64_t)v18;
          qword_1EDDC84B8 = (uint64_t)v18;
        }
        _Block_object_dispose(&v27, 8);
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkMRMediaRemoteMediaTypeVideo(void)");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UIApplication.m"), 15381, CFSTR("%s"), dlerror());
          break;
        }
        if ((objc_msgSend(v14, "isEqualToString:", *v18) & 1) != 0)
        {
          v17 = 2;
        }
        else
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v20 = (_QWORD *)qword_1EDDC84C0;
          v30 = qword_1EDDC84C0;
          if (!qword_1EDDC84C0)
          {
            v21 = MediaRemoteLibrary();
            v20 = dlsym(v21, "kMRMediaRemoteMediaTypeImage");
            v28[3] = (uint64_t)v20;
            qword_1EDDC84C0 = (uint64_t)v20;
          }
          _Block_object_dispose(&v27, 8);
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkMRMediaRemoteMediaTypeImage(void)");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UIApplication.m"), 15383, CFSTR("%s"), dlerror());
            break;
          }
          v17 = objc_msgSend(v14, "isEqualToString:", *v20);
        }
      }

      if (!a3)
      {
        v24 = 0;
        goto LABEL_65;
      }
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v22 = (id *)qword_1EDDC84C8;
      v30 = qword_1EDDC84C8;
      if (!qword_1EDDC84C8)
      {
        v23 = MediaRemoteLibrary();
        v22 = (id *)dlsym(v23, "kMRMediaRemoteOptionTrackID");
        v28[3] = (uint64_t)v22;
        qword_1EDDC84C8 = (uint64_t)v22;
      }
      _Block_object_dispose(&v27, 8);
      if (v22)
      {
        v24 = CFDictionaryGetValue(a3, objc_retainAutorelease(*v22));
LABEL_65:
        objc_msgSend(*(id *)(a1 + 32), "_postSimpleRemoteNotificationForAction:andContext:trackID:", v10, v17, v24);

        goto LABEL_66;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSNumber *getkMRMediaRemoteOptionTrackID(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UIApplication.m"), 15385, CFSTR("%s"), dlerror());
      break;
    default:
      switch(a2)
      {
        case 'd':
          v10 = 8;
          goto LABEL_39;
        case 'e':
          v10 = 9;
          goto LABEL_39;
        case 'f':
          v10 = 3;
          goto LABEL_39;
        case 'g':
          v10 = 4;
          goto LABEL_39;
        case 'h':
          v10 = 10;
          goto LABEL_39;
        case 'i':
          v10 = 11;
          goto LABEL_39;
        case 'j':
          v10 = 28;
          goto LABEL_39;
        case 'o':
          v10 = 18;
          goto LABEL_39;
        case 'p':
          v10 = 19;
          goto LABEL_39;
        case 'q':
          v10 = 20;
          goto LABEL_39;
        case 'r':
          v10 = 21;
          goto LABEL_39;
        case 's':
          v10 = 22;
          goto LABEL_39;
        default:
          goto LABEL_66;
      }
  }
LABEL_73:

  __break(1u);
}

- (void)endReceivingRemoteControlEvents
{
  int64_t remoteControlEventObservers;
  BOOL v3;
  BOOL v4;
  BOOL v5;
  int64_t v6;

  remoteControlEventObservers = self->_remoteControlEventObservers;
  v5 = __OFSUB__(remoteControlEventObservers, 1);
  v3 = remoteControlEventObservers == 1;
  v4 = remoteControlEventObservers - 1 < 0;
  v6 = remoteControlEventObservers - 1;
  if (v4 == v5)
  {
    self->_remoteControlEventObservers = v6;
    if (v3)
    {
      __MRMediaRemoteSetCanBeNowPlayingApplication(0);
      __MRMediaRemoteSetCommandHandlerBlock(0);
    }
  }
}

- (BOOL)_hasRemoteControlEventObservers
{
  return self->_remoteControlEventObservers > 0;
}

- (void)_sendHeadsetOriginatedMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)&a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getMRMediaRemoteSendCommandSymbolLoc_ptr;
  v11 = getMRMediaRemoteSendCommandSymbolLoc_ptr;
  if (!getMRMediaRemoteSendCommandSymbolLoc_ptr)
  {
    v5 = MediaRemoteLibrary();
    v4 = dlsym(v5, "MRMediaRemoteSendCommand");
    v9[3] = (uint64_t)v4;
    getMRMediaRemoteSendCommandSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    if (!((unsigned int (*)(uint64_t, _QWORD))v4)(v3, 0))
      NSLog(CFSTR("%s Unable to send command %d to now playing app."), "-[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:]", v3, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean __MRMediaRemoteSendCommand(MRMediaRemoteCommand, CFDictionaryRef)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("UIApplication.m"), 15391, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)_setSystemWindowsSecure:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_applicationFlags + 1) = *((_QWORD *)&self->_applicationFlags + 1) & 0xFFFFFFDFFFFFFFFFLL | v3;
  -[UIWindow _setSecure:](self->_backgroundHitTestWindow, "_setSecure:");
}

- (int64_t)_availableTextServices
{
  return +[_UITextServiceSession availableTextServices](_UITextServiceSession, "availableTextServices");
}

- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4
{
  return +[_UITextServiceSession showServiceForType:withContext:](_UITextServiceSession, "showServiceForType:withContext:", a3, a4);
}

- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  return +[_UITextServiceSession showServiceForText:type:fromRect:inView:](_UITextServiceSession, "showServiceForText:type:fromRect:inView:", a3, a4, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  return +[_UITextServiceSession showServiceForText:selectedTextRange:type:fromRect:inView:](_UITextServiceSession, "showServiceForText:selectedTextRange:type:fromRect:inView:", a3, a4.location, a4.length, a5, a7, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (id)_findPrintTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[UIApplication _supportsPrintCommand](self, "_supportsPrintCommand"))
  {
    -[UIApplication _responderForKeyEvents](self, "_responderForKeyEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIResponderTargetForAction(v5, sel_print_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_supportsOpenCommand
{
  if (qword_1EDDC8348 != -1)
    dispatch_once(&qword_1EDDC8348, &__block_literal_global_1666);
  return byte_1EDDC8019;
}

void __37__UIApplication__supportsOpenCommand__block_invoke()
{
  void *v0;
  void *v1;
  BOOL v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AAD0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least())
    v2 = objc_msgSend(v3, "count") != 0;
  else
    v2 = 0;
  byte_1EDDC8019 = v2;

}

- (void)buildMenuWithBuilder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIApplication _storyboardInitialMenu](self, "_storyboardInitialMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 15726, CFSTR("Legacy menu found in storyboard. Please recompile using the latest version of Xcode."));

    }
    objc_msgSend(v7, "_patch:", v5);
  }

}

- (id)_preferredDefaultSceneSessionRole
{
  return -[_UIApplicationInfoParser preferredDefaultSceneSessionRole](self->_appInfo, "preferredDefaultSceneSessionRole");
}

- (void)requestSceneSessionActivation:(UISceneSession *)sceneSession userActivity:(NSUserActivity *)userActivity options:(UISceneActivationRequestOptions *)options errorHandler:(void *)errorHandler
{
  void *v10;
  UISceneActivationRequestOptions *v11;
  NSUserActivity *v12;
  id v13;

  v10 = errorHandler;
  v11 = options;
  v12 = userActivity;
  if (sceneSession)
    +[UISceneSessionActivationRequest requestWithSession:](UISceneSessionActivationRequest, "requestWithSession:", sceneSession);
  else
    +[UISceneSessionActivationRequest request](UISceneSessionActivationRequest, "request");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserActivity:", v12);

  objc_msgSend(v13, "setOptions:", v11);
  -[UIApplication activateSceneSessionForRequest:errorHandler:](self, "activateSceneSessionForRequest:errorHandler:", v13, v10);

}

- (void)activateSceneSessionForRequest:(UISceneSessionActivationRequest *)request errorHandler:(void *)errorHandler
{
  UISceneSessionActivationRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[16];

  v6 = request;
  v7 = errorHandler;
  if (qword_1EDDC8350 != -1)
    dispatch_once(&qword_1EDDC8350, &__block_literal_global_1678_0);
  if (byte_1EDDC801A)
  {
    if (-[_UIApplicationInfoParser supportsMultiwindow](self->_appInfo, "supportsMultiwindow"))
    {
      +[UIWindowScene _keyWindowScene]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_eventDeferringManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager bufferKeyboardFocusEnvironmentEventsWithReason:]((uint64_t)v9, CFSTR("Scene Creation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIWorkspaceSceneRequestOptionsFactory sharedFactory](_UIWorkspaceSceneRequestOptionsFactory, "sharedFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)qword_1EDDC80A8;
      objc_msgSend(v11, "customEndpointForRequest:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v14 = (void *)MEMORY[0x1E0D23018];
        objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endpointForMachName:service:instance:", v15, CFSTR("com.apple.frontboard.workspace-service"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke;
      v23[3] = &unk_1E16DD848;
      v24 = v10;
      v26 = v13;
      v27 = v7;
      v25 = v12;
      v16 = v13;
      v17 = v12;
      v18 = v10;
      objc_msgSend(v11, "buildWorkspaceRequestOptionsForRequest:withContinuation:", v6, v23);

      goto LABEL_19;
    }
    v22 = qword_1EDDC8360;
    if (!qword_1EDDC8360)
    {
      v22 = __UILogCategoryGetNode("Scene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&qword_1EDDC8360);
    }
    v20 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Cannot request scene session activation because the application does not support multiple scenes.";
      goto LABEL_16;
    }
  }
  else
  {
    v19 = qword_1EDDC8358;
    if (!qword_1EDDC8358)
    {
      v19 = __UILogCategoryGetNode("Scene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&qword_1EDDC8358);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Cannot request scene session activation because it is not supported on the current device.";
LABEL_16:
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    }
  }
  if (v7)
  {
    _UISceneErrorWithCode(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);
LABEL_19:

  }
}

void __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke_2;
    v10[3] = &unk_1E16DD820;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v9, "requestSceneFromEndpoint:withOptions:completion:", v8, v5, v10);

  }
}

void __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v4)
  {
    v5 = UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_7___s_category;
    if (!UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_7___s_category)
    {
      v5 = __UILogCategoryGetNode("Scene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_7___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Scene session activation failed with error: %@", (uint8_t *)&v8, 0xCu);
    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);
  }

}

- (void)_requestSceneSessionActivationWithConfiguration:(id)a3 errorHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_msgSend(a3, "copy");
  _UIWindowSceneActivationPrepareConfiguration(v6, 0, 0, 0, 0);
  _UIWindowSceneActivateConfiguration(v6, 0, v5);

}

- (void)requestSceneSessionDestruction:(UISceneSession *)sceneSession options:(UISceneDestructionRequestOptions *)options errorHandler:(void *)errorHandler
{
  UISceneSession *v9;
  UISceneDestructionRequestOptions *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void (**v14)(void *, void *);
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  const char *v22;
  unint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v9 = sceneSession;
  v10 = options;
  v11 = errorHandler;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 15906, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneSession"));

  }
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke;
  aBlock[3] = &unk_1E16CCBA0;
  v13 = v11;
  v34 = v13;
  v14 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (qword_1EDDC8350 != -1)
    dispatch_once(&qword_1EDDC8350, &__block_literal_global_1678_0);
  if (!byte_1EDDC801A)
  {
    v20 = qword_1EDDC8368;
    if (!qword_1EDDC8368)
    {
      v20 = __UILogCategoryGetNode("Scene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1EDDC8368);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v22 = "Invalid attempt to call -[UIApplication requestSceneSessionDestruction:] from an unsupported device.";
    goto LABEL_23;
  }
  if (!-[_UIApplicationInfoParser supportsMultiwindow](self->_appInfo, "supportsMultiwindow"))
  {
    v23 = qword_1EDDC8370;
    if (!qword_1EDDC8370)
    {
      v23 = __UILogCategoryGetNode("Scene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&qword_1EDDC8370);
    }
    v21 = *(NSObject **)(v23 + 8);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v22 = "Calling -[UIApplication requestSceneSessionDestruction:] requires multiwindow adoption.";
LABEL_23:
    _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
LABEL_24:
    _UISceneErrorWithCode(0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v24);
    goto LABEL_27;
  }
  if (v10
    && (objc_opt_self(),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) != 0))
  {
    v17 = -[UISceneDestructionRequestOptions windowDismissalAnimation](v10, "windowDismissalAnimation");
    if (v17 == 3)
      v18 = 3;
    else
      v18 = 1;
    if (v17 == 2)
      v19 = 2;
    else
      v19 = v18;
  }
  else
  {
    v19 = 1;
  }
  -[UISceneSession persistentIdentifier](v9, "persistentIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0DC5B78]);
  v35[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_1690;
  v29[3] = &unk_1E16DD870;
  v30 = v25;
  v31 = v13;
  v27 = v25;
  objc_msgSend(v27, "destroyScenesWithPersistentIdentifiers:animationType:destroySessions:completion:", v26, v19, 1, v29);

LABEL_27:
}

uint64_t __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_1690(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_2;
  v9 = &unk_1E16B1D18;
  v10 = v4;
  v11 = *(id *)(a1 + 40);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], &v6);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v6, v7, v8, v9);

}

uint64_t __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
  {
    result = *(_QWORD *)(result + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestSceneSessionRefresh:(UISceneSession *)sceneSession
{
  UISceneSession *v5;
  uint64_t v6;
  UISceneSession *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  UISceneSession *v23;
  UIApplication *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD aBlock[4];
  UISceneSession *v30;

  v5 = sceneSession;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 15976, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneSession != nil"));

  }
  if (!-[UISceneSession _trackingRefreshRequest](v5, "_trackingRefreshRequest"))
  {
    -[UISceneSession _setTrackingRefreshRequest:](v5, "_setTrackingRefreshRequest:", 1);
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    v7 = v5;
    v30 = v7;
    v8 = _Block_copy(aBlock);
    -[UISceneSession scene](v7, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (void *)UIApp;
      v26[0] = v6;
      v26[1] = 3221225472;
      v26[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke_2;
      v26[3] = &unk_1E16BAD68;
      v26[4] = self;
      v27 = v9;
      v28 = v8;
      v12 = v8;
      objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v26);

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0D23018];
      v14 = (id)qword_1EDDC80A8;
      objc_msgSend(v13, "defaultShellMachName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endpointForMachName:service:instance:", v15, CFSTR("com.apple.frontboard.workspace-service"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_opt_new();
      -[UISceneSession persistentIdentifier](v7, "persistentIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setIdentifier:", v18);

      v19 = objc_alloc_init(MEMORY[0x1E0DC5BF8]);
      objc_msgSend(v17, "setScenePlacementConfiguration:", v19);

      objc_msgSend(v17, "setRequestBackground:", 1);
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke_3;
      v22[3] = &unk_1E16DD898;
      v25 = v8;
      v23 = v7;
      v24 = self;
      v20 = v8;
      objc_msgSend(v14, "requestSceneFromEndpoint:withOptions:completion:", v16, v17, v22);

    }
  }

}

uint64_t __44__UIApplication_requestSceneSessionRefresh___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTrackingRefreshRequest:", 0);
}

uint64_t __44__UIApplication_requestSceneSessionRefresh___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRefreshForUIScene:disposeAfter:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __44__UIApplication_requestSceneSessionRefresh___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v7 = UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_8___s_category;
    if (!UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_8___s_category)
    {
      v7 = __UILogCategoryGetNode("SceneSessionRequests", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_8___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = (void *)a1[4];
      v10 = v8;
      objc_msgSend(v9, "persistentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Could not request UISceneSession with persistent identifier: \"%@\" due to error: %@", buf, 0x16u);

    }
  }
  else
  {
    v12 = (void *)a1[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke_1696;
    v16[3] = &unk_1E16BAD68;
    v13 = v5;
    v14 = a1[5];
    v15 = (void *)a1[6];
    v17 = v13;
    v18 = v14;
    v19 = v15;
    objc_msgSend(v12, "_performBlockAfterCATransactionCommitSynchronizes:", v16);

  }
}

void __44__UIApplication_requestSceneSessionRefresh___block_invoke_1696(uint64_t a1)
{
  id v2;

  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_performRefreshForUIScene:disposeAfter:completion:", v2, 1, *(_QWORD *)(a1 + 48));

}

- (void)_performRefreshForUIScene:(id)a3 disposeAfter:(BOOL)a4 completion:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  int IsSEO;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  BOOL v22;

  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication.m"), 16025, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uiScene != nil"));

  }
  v17 = v9;
  objc_msgSend(v17, "_effectiveUISettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v17, "_hasInvalidated");

  if (v12)
  {

    goto LABEL_7;
  }
  if ((objc_msgSend(v11, "isForeground") & 1) != 0)
  {
    IsSEO = _UISceneLifecycleStateIsSEO(v11);

    if (!IsSEO)
    {
LABEL_7:
      if (v10)
        v10[2](v10);
      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v17, "_setIsRespondingToLifecycleEvent:", 1);
  if (objc_msgSend(v17, "_isReadyForSuspension"))
    objc_msgSend(v17, "_prepareForResume");
  -[UIApplication _saveRestorationUserActivityStateForScene:](self, "_saveRestorationUserActivityStateForScene:", v17);
  objc_msgSend(v17, "_FBSScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke;
  v18[3] = &unk_1E16DD8C0;
  v18[4] = self;
  v19 = v14;
  v20 = v17;
  v21 = v10;
  v22 = a4;
  v15 = v14;
  -[UIApplication _beginSnapshotSessionForScene:withSnapshotBlock:](self, "_beginSnapshotSessionForScene:withSnapshotBlock:", v15, v18);

LABEL_13:
}

void __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_createSnapshotContextForScene:withName:performLayoutWithSettings:", *(_QWORD *)(a1 + 40), CFSTR("UIApplicationAutomaticSnapshotDefault"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "performSnapshotWithContext:", v4);
  if (v3)
    v3[2](v3);
  objc_msgSend(*(id *)(a1 + 48), "_setIsRespondingToLifecycleEvent:", 0);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  v6 = objc_msgSend(*(id *)(a1 + 48), "_isEligibleForSuspension");
  if (*(_BYTE *)(a1 + 64) && v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC5B78]);
    objc_msgSend(*(id *)(a1 + 48), "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_2;
    v12[3] = &unk_1E16DD760;
    v13 = *(id *)(a1 + 48);
    v14 = v7;
    v11 = v7;
    objc_msgSend(v11, "destroyScenesWithPersistentIdentifiers:animationType:destroySessions:completion:", v10, 1, 0, v12);

  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "_prepareForSuspend");
  }

}

void __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_3;
  v9 = &unk_1E16B1B50;
  v10 = v4;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], &v6);
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v6, v7, v8, v9);

}

void __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_9___s_category;
    if (!UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_9___s_category)
    {
      v2 = __UILogCategoryGetNode("SceneSessionRequests", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_9___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "persistentIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Failed to dismiss UIScene with persistent identifier: \"%@\" after refresh due to error: %@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (BOOL)_isDisplayingActivityContinuationUI
{
  return self->_isDisplayingActivityContinuationUI;
}

- (void)_setIsDisplayingActivityContinuationUI:(BOOL)a3
{
  self->_isDisplayingActivityContinuationUI = a3;
}

- (void)__setQueuedOrientationChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)_alternateIconName
{
  return self->__alternateIconName;
}

- (BOOL)_applicationWantsGESEvents
{
  return self->_applicationWantsGESEvents;
}

- (void)_setApplicationWantsGESEvents:(BOOL)a3
{
  self->_applicationWantsGESEvents = a3;
}

- (BOOL)_shouldAllowContentTextContextExtraction
{
  return self->__shouldAllowContentTextContextExtraction;
}

- (void)set_shouldAllowContentTextContextExtraction:(BOOL)a3
{
  self->__shouldAllowContentTextContextExtraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateIconName, 0);
  objc_storeStrong(&self->___queuedOrientationChange, 0);
  objc_storeStrong((id *)&self->_shortcutService, 0);
  objc_storeStrong((id *)&self->_responderBasedEventDeliverer, 0);
  objc_storeStrong((id *)&self->_sceneHostingWorkspaceController, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
  objc_storeStrong((id *)&self->_endpointMonitor, 0);
  objc_storeStrong(&self->_storyboardInitialMenu, 0);
  objc_storeStrong((id *)&self->_applicationPushRegistry, 0);
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_motionNotificationGenerator, 0);
  objc_storeStrong((id *)&self->_HIDGameControllerEventQueue, 0);
  objc_storeStrong(&self->_HIDGameControllerEventObserver, 0);
  objc_storeStrong((id *)&self->_forceStageObservable, 0);
  objc_storeStrong((id *)&self->__gestureDelayedEventComponentDispatcher, 0);
  objc_storeStrong((id *)&self->__gestureEnvironment, 0);
  objc_storeStrong((id *)&self->_activityContinuationManager, 0);
  objc_storeStrong((id *)&self->_systemNavigationAction, 0);
  objc_storeStrong((id *)&self->_cachedSystemAnimationFence, 0);
  objc_storeStrong((id *)&self->_fenceTask, 0);
  objc_storeStrong((id *)&self->_keyUpKeyCommandMap, 0);
  objc_storeStrong((id *)&self->_hardwareKeyDownCodeToEventMap, 0);
  objc_storeStrong((id *)&self->_keyRepeatAction, 0);
  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
  objc_storeStrong((id *)&self->_actionsPendingInitialization, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_backgroundHitTestWindow, 0);
  objc_storeStrong((id *)&self->_physicalKeycodeSet, 0);
  objc_storeStrong((id *)&self->_keyCommandRegistrationAssertions, 0);
  objc_storeStrong((id *)&self->_proximityEventsEnabledStartDate, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_eventFetcher, 0);
  objc_storeStrong((id *)&self->_applicationBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_internalApplicationBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_idleModeController, 0);
  objc_storeStrong((id *)&self->_mainStoryboardName, 0);
  objc_storeStrong((id *)&self->_postCommitActions, 0);
  objc_storeStrong((id *)&self->_embeddedScreenStatusBarWindow, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_destroyWeak((id *)&self->_editAlertController);
  objc_storeStrong((id *)&self->_hideNetworkActivityIndicatorTimer, 0);
  objc_storeStrong((id *)&self->_topLevelNibObjects, 0);
}

- (void)_setAlternateIconName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  NSObject *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  LSApplicationProxyForSettingCurrentApplicationIcon();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((*((_BYTE *)&self->_applicationFlags + 13) & 0x20) == 0
      && -[UIApplication applicationState](self, "applicationState") == UIApplicationStateActive)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_3;
      v12[3] = &unk_1E16DD130;
      v9 = &v13;
      v13 = v7;
      objc_msgSend(v8, "setAlternateIconName:withResult:", v6, v12);
      goto LABEL_7;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_2;
    v14[3] = &unk_1E16B1BF8;
    v9 = &v15;
    v15 = v7;
    v10 = MEMORY[0x1E0C80D38];
    v11 = v14;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke;
    block[3] = &unk_1E16B1BF8;
    v9 = &v17;
    v17 = v7;
    v10 = MEMORY[0x1E0C80D38];
    v11 = block;
  }
  dispatch_async(v10, v11);
LABEL_7:

}

void __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_4;
    block[3] = &unk_1E16B1BF8;
    v7 = &v12;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_5;
    v8[3] = &unk_1E16B2F48;
    v7 = &v10;
    v10 = *(id *)(a1 + 32);
    v6 = v6;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setAlternateIconName:(NSString *)alternateIconName completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = completionHandler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke;
  v8[3] = &unk_1E16CCBA0;
  v9 = v6;
  v7 = v6;
  -[UIApplication _setAlternateIconName:completionHandler:](self, "_setAlternateIconName:completionHandler:", alternateIconName, v8);

}

void __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
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
  void *v19;
  _QWORD aBlock[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    if (!v5)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_2;
      v22[3] = &unk_1E16B79A8;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v7;
      +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:](_UISceneLifecycleMultiplexer, "mostActiveSceneWithTest:", v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:](_UISceneLifecycleMultiplexer, "mostActiveSceneWithTest:", &__block_literal_global_2756);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "_topVisibleWindowPassingTest:", &__block_literal_global_2757);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[UIWindow _topVisibleWindowPassingTest:](UIWindow, "_topVisibleWindowPassingTest:", &__block_literal_global_2757);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LSApplicationProxyForSettingCurrentApplicationIcon();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedNameForContext:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v13 = (void *)MEMORY[0x1E0CB3940];
    _UINSLocalizedStringWithDefaultValue(CFSTR("ALTERNATE_APP_ICONS_CONFIRMATION_MESSAGE"), CFSTR("You have changed the icon for “%@”."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMessageText:", v15);

    +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentViewController:", v12);
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_5;
    aBlock[3] = &unk_1E16D5098;
    v21 = *(id *)(a1 + 32);
    v17 = _Block_copy(aBlock);
    _UINSLocalizedStringWithDefaultValue(CFSTR("ALTERNATE_APP_ICONS_CONFIRMATION_DISMISS_BUTTON"), CFSTR("OK"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v19);

    objc_msgSend(v9, "presentViewController:animated:completion:", v16, 1, 0);
  }

}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t IsForegroundActive;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "_hostsWindows"))
  {
    v4 = v3;
    objc_msgSend(v4, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == *(void **)(a1 + 32))
    {
      objc_msgSend(v4, "_effectiveUISettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v7);

    }
    else
    {
      IsForegroundActive = 0;
    }

  }
  else
  {
    IsForegroundActive = 0;
  }

  return IsForegroundActive;
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "_hostsWindows"))
  {
    objc_msgSend(v2, "_effectiveUISettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isForeground");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "canBecomeKeyWindow") && (objc_msgSend(v2, "_isTextEffectsWindow") & 1) == 0)
    v3 = objc_msgSend(v2, "isInternalWindow") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_saveApplicationPreservationStateIfSupported
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_applicationFlags + 7) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle"))
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "rootViewController");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            v14 = objc_msgSend(v11, "_isTextEffectsWindow");

            if ((v14 & 1) == 0)
              objc_msgSend(v5, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    if (-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle") || objc_msgSend(v5, "count"))
      -[UIApplication _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:](self, "_saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:", v5, 0, 0, 0, 0);
    else
      NSLog(CFSTR("No windows have a root view controller, cannot save application state"));
    if (_UIStateRestorationDebugLogEnabled())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v3);
      NSLog(CFSTR("Saved restoration state in %f"), v16);

    }
  }
}

- (void)saveApplicationPreservationStateWithSessionIdentifier:(id)a3 viewController:(id)a4 beginHandler:(id)a5 completionHandler:(id)a6
{
  -[UIApplication _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:](self, "_saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:", 0, a4, a3, a5, a6);
}

- (void)restoreApplicationPreservationStateWithSessionIdentifier:(id)a3 viewController:(id)a4 beginHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t RestorationRetryCountAndUpdateIfNecessary;
  int AppBooleanValue;
  UIApplication *v15;
  UIApplication *v16;
  UIApplication *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((byte_1EDDC801B & 1) == 0)
  {
    RestorationRetryCountAndUpdateIfNecessary = _getRestorationRetryCountAndUpdateIfNecessary(v18);
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UIStateRestorationDeveloperMode"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
    if (RestorationRetryCountAndUpdateIfNecessary > 0 || AppBooleanValue)
    {
      if (RestorationRetryCountAndUpdateIfNecessary <= 0 && _UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Developer mode default is set. Skipping delete of restoration archive for session %@ even though app has previously crashed during state restoration"), "-[UIApplication(StateRestoration) restoreApplicationPreservationStateWithSessionIdentifier:viewController:beginHandler:completionHandler:]", v18);
      v15 = self;
      objc_sync_enter(v15);
      qword_1EDDC8398 = 0;
      *((_QWORD *)&v15->_applicationFlags + 1) |= 0x8000000uLL;
      _incrementRestorationMarkerCount(v15, v18, 1);
      objc_sync_exit(v15);

      +[UIResponder _startDeferredTrackingObjectsWithIdentifiers](UIResponder, "_startDeferredTrackingObjectsWithIdentifiers");
      objc_msgSend(v10, "_rebuildStateRestorationIdentifierPath");
      -[UIApplication _restoreApplicationPreservationStateWithSessionIdentifier:beginHandler:completionHandler:](v15, "_restoreApplicationPreservationStateWithSessionIdentifier:beginHandler:completionHandler:", v18, v11, v12);
      v16 = v15;
      objc_sync_enter(v16);
      _decrementRestorationMarkerCount(v16, v18);
      objc_sync_exit(v16);

      +[UIResponder _cleanupAllStateRestorationTables](UIResponder, "_cleanupAllStateRestorationTables");
      v17 = v15;
      objc_sync_enter(v17);
      *((_QWORD *)&v15->_applicationFlags + 1) &= ~0x8000000uLL;
      objc_sync_exit(v17);

    }
    else
    {
      NSLog(CFSTR("Too many failed attempts to restore state for session %@, deleting state restoration archive and skipping restoration"), v18);
      _deleteRestorationArchive(v18);
    }
  }

}

- (void)removeApplicationPreservationStateWithSessionIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  _restorationPath(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

- (unint64_t)_restorationArchiveProtectionClass
{
  if (!self->_saveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication)
  {
    if (qword_1EDDC83A0 != -1)
      dispatch_once(&qword_1EDDC83A0, &__block_literal_global_2817);
    if (byte_1EDDC8020 != 1)
      return 805306368;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Saving restoration archive with FileProtectionCompleteUntilFirstUserAuthentication so it can be access while device is locked (after first unlock)"), "-[UIApplication(StateRestoration) _restorationArchiveProtectionClass]");
  return 0x40000000;
}

void __69__UIApplication_StateRestoration___restorationArchiveProtectionClass__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  char HasEntitlement;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("UIStateRestorationFileProtection"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AC0]);

  if (v2)
  {
    HasEntitlement = UISelfTaskHasEntitlement((void *)*MEMORY[0x1E0CB2AB0]);
    v4 = UISelfTaskHasEntitlement((void *)*MEMORY[0x1E0CB2AB8]);
    if ((HasEntitlement & 1) == 0 && (v4 & 1) == 0)
      byte_1EDDC8020 = 1;
  }

}

- (void)_saveApplicationPreservationState:(id)a3 viewController:(id)a4 sessionIdentifier:(id)a5 beginHandler:(id)a6 completionHandler:(id)a7
{
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  int v73;
  const __CFString *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL8 v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  void (**v84)(id, id);
  void (**v85)(id, _BOOL8);
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  UIApplication *v91;
  void *v92;
  unint64_t k;
  void *v94;
  id v95;
  void *v96;
  id v97;
  char v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  id v110;
  id v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _QWORD v114[2];
  _QWORD v115[4];

  v115[2] = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v80 = a4;
  v86 = a5;
  v84 = (void (**)(id, id))a6;
  v85 = (void (**)(id, _BOOL8))a7;
  byte_1EDDC8021 = 0;
  v91 = self;
  v98 = objc_opt_respondsToSelector();
  v97 = -[NSKeyedArchiver initRequiringSecureCoding:]([UIStateRestorationKeyedArchiver alloc], "initRequiringSecureCoding:", v98 & 1);
  +[_UIStateRestorationKeyedArchiverDelegate sharedDelegate](_UIStateRestorationKeyedArchiverDelegate, "sharedDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setDelegate:", v12);

  if (v86)
  {
    if (v84)
      v84[2](v84, v97);
    goto LABEL_4;
  }
  if ((*((_BYTE *)&self->_applicationFlags + 7) & 4) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v40 = -[UIApplicationDelegate application:shouldSaveSecureApplicationState:](self->_delegate, "application:shouldSaveSecureApplicationState:", self, v97);
    }
    else
    {
      if (qword_1EDDC83A8 != -1)
        dispatch_once(&qword_1EDDC83A8, &__block_literal_global_2822);
      v40 = -[UIApplicationDelegate application:shouldSaveApplicationState:](self->_delegate, "application:shouldSaveApplicationState:", self, v97);
    }
    if ((v40 & 1) != 0)
    {
      if (_UIStateRestorationDebugLogEnabled())
      {
        v75 = CFSTR("NO");
        if ((v98 & 1) != 0)
          v75 = CFSTR("YES");
        NSLog(CFSTR("%s: Application supports secure state restoration = %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v75);
      }
LABEL_4:
      v110 = 0;
      v111 = 0;
      v109 = 0;
      _UIInitializeStateRestorationCollections(&v111, &v110, &v109);
      v83 = v111;
      v95 = v110;
      v82 = v109;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "encodeInt:forKey:", 2, CFSTR("kUIStateRestorationArchiveMajorVersionKey"));
      objc_msgSend(v97, "encodeInt:forKey:", 1, CFSTR("kUIStateRestorationArchiveMinorVersionKey"));
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceIdiom");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "encodeObject:forKey:", v15, CFSTR("UIApplicationStateRestorationUserInterfaceIdiom"));

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "encodeObject:forKey:", v16, CFSTR("UIApplicationStateRestorationTimestamp"));

      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "systemVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "encodeObject:forKey:", v18, CFSTR("UIApplicationStateRestorationSystemVersion"));

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        objc_msgSend(v81, "infoDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0C9AE90]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v97, "encodeObject:forKey:", v20, CFSTR("UIApplicationStateRestorationBundleVersion"));

      }
      if (!v86 && (objc_opt_respondsToSelector() & 1) != 0)
        -[UIApplicationDelegate application:willEncodeRestorableStateWithCoder:](self->_delegate, "application:willEncodeRestorableStateWithCoder:", self, v97);
      if (objc_msgSend(v88, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v88, "count"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v88, "count"));
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v21 = v88;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v106;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v106 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
              objc_msgSend(v25, "rootViewController");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (_UIStateRestorationDebugLogEnabled())
              {
                objc_msgSend(v26, "restorationIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("%s: rootViewController with identifier %@ in window %@ is : %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v27, v25, v26);

              }
              objc_msgSend(v26, "restorationIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v94, "addObject:", v26);
                objc_msgSend(v25, "restorationIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                {
                  objc_msgSend(v25, "traitCollection");
                  v30 = (id)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "verticalSizeClass");
                  v32 = CFSTR("UIUserInterfaceSizeClassUnspecified");
                  if (v31 == 2)
                    v32 = CFSTR("UIUserInterfaceSizeClassRegular");
                  if (v31 == 1)
                    v32 = CFSTR("UIUserInterfaceSizeClassCompact");
                  v33 = v32;
                  v34 = objc_msgSend(v30, "horizontalSizeClass");

                  v35 = CFSTR("UIUserInterfaceSizeClassUnspecified");
                  if (v34 == 2)
                    v35 = CFSTR("UIUserInterfaceSizeClassRegular");
                  if (v34 == 1)
                    v35 = CFSTR("UIUserInterfaceSizeClassCompact");
                  v114[0] = CFSTR("VerticalSizeClassStringKey");
                  v114[1] = CFSTR("HorizontalSizeClassStringKey");
                  v115[0] = v33;
                  v115[1] = v35;
                  v36 = (void *)MEMORY[0x1E0C99D80];
                  v37 = v35;
                  objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v25, "restorationIdentifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "setObject:forKey:", v38, v39);

                }
              }
              else
              {
                if (_UIStateRestorationDebugLogEnabled())
                  NSLog(CFSTR("%s: Root view controller for window %@ doesn't have restoration identifier, skipping: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v25, v26);
                if ((objc_msgSend(v25, "isHidden") & 1) == 0)
                  -[UIApplication ignoreSnapshotOnNextApplicationLaunch](v91, "ignoreSnapshotOnNextApplicationLaunch");
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
          }
          while (v22);
        }

        if (objc_msgSend(v92, "count"))
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Saving window to traits map: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v92);
          objc_msgSend(v97, "encodeObject:forKey:", v92, CFSTR("WindowIdentifierToSizeClassMapKey"));
        }

      }
      else
      {
        if (v80)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v94, "count");
LABEL_48:
          if (v41)
          {
            objc_msgSend(MEMORY[0x1E0D96D70], "_activeActivityViewControllers");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "count"))
            {
              v103 = 0u;
              v104 = 0u;
              v101 = 0u;
              v102 = 0u;
              v43 = v42;
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
              if (v44)
              {
                v45 = *(_QWORD *)v102;
                do
                {
                  for (j = 0; j != v44; ++j)
                  {
                    if (*(_QWORD *)v102 != v45)
                      objc_enumerationMutation(v43);
                    v47 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
                    objc_msgSend(v47, "restorationIdentifier");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v48)
                      _UIAddObjectToStateRestorationRoots(v47);
                  }
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
                }
                while (v44);
              }

            }
          }
          for (k = 0; objc_msgSend(v94, "count") > k; ++k)
          {
            objc_msgSend(v94, "objectAtIndex:");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            if (v88)
            {
              objc_msgSend(v88, "objectAtIndex:", k);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v89 = 0;
            }
            _UIAddObjectToStateRestorationRoots(v90);
            while (2)
            {
              if (objc_msgSend(v95, "count"))
              {
                v49 = (void *)objc_msgSend(v95, "copy");
                objc_msgSend(v95, "removeAllObjects");
                if (_UIStateRestorationDebugLogEnabled())
                  NSLog(CFSTR("%s: Processing Objects for State Restoration: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v49);
                v50 = 0;
LABEL_71:
                if (objc_msgSend(v49, "count") <= v50)
                {

                  continue;
                }
                objc_msgSend(v49, "objectAtIndex:", v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                _restorationIdentifierPathStringForObject(v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (_UIStateRestorationDebugLogEnabled())
                  NSLog(CFSTR("%s: Current Object for State Restoration at index [%d] is %@: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v50, v52, v51);
                if (v52)
                {
                  v53 = -[NSKeyedArchiver initRequiringSecureCoding:]([UIStateRestorationKeyedArchiver alloc], "initRequiringSecureCoding:", v98 & 1);
                  +[_UIStateRestorationKeyedArchiverDelegate sharedDelegate](_UIStateRestorationKeyedArchiverDelegate, "sharedDelegate");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "setDelegate:", v54);

                  _encodeStateRestorationClassForObject(v51, v53);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v55 = v51;
                    objc_msgSend(v55, "encodeRestorableStateWithCoder:", v53);
                    objc_msgSend(v53, "encodeBool:forKey:", 1, CFSTR("kObjectIsViewControllerKey"));
                    if (objc_msgSend(v55, "isViewLoaded"))
                    {
                      objc_msgSend(v55, "view");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v56)
                      {
                        v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        _encodeRestorationStateForViewAndSubviews(v56, v55, v57, v98 & 1);
                        objc_msgSend(v53, "encodeObject:forKey:", v57, CFSTR("kViewRestorationDataKey"));
                        objc_msgSend(v53, "encodeBool:forKey:", 1, CFSTR("kViewControllerViewWasLoadedKey"));

                      }
                    }
                    goto LABEL_85;
                  }
                  if (objc_msgSend(v51, "conformsToProtocol:", &unk_1EE0CED08))
                  {
                    v58 = v51;
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      objc_msgSend(v58, "encodeRestorableStateWithCoder:", v53);
LABEL_85:

                  }
                  else if (_UIStateRestorationDebugLogEnabled())
                  {
                    NSLog(CFSTR("%s: Warning: Object in list of root objects to save is not a UIResponder or UIStateRestoring, skipping saving state: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v51);
                  }
                  objc_msgSend(v53, "finishEncoding");
                  objc_msgSend(v53, "encodedData");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "encodeObject:forKey:", v59, v52);

                  objc_msgSend(v96, "addObject:", v52);
                }
                else if (_UIStateRestorationDebugLogEnabled())
                {
                  NSLog(CFSTR("%s: Object in root set doesn't have restoration identifier, skipping: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v51);
                }

                ++v50;
                goto LABEL_71;
              }
              break;
            }
            objc_msgSend(v89, "firstResponder");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "_restorationIdentifierPath");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v61)
              objc_msgSend(v87, "addObject:", v61);

          }
          if (objc_msgSend(v87, "count"))
          {
            if (_UIStateRestorationDebugLogEnabled())
              NSLog(CFSTR("%s: Saving first responders with identifier paths: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v87);
            objc_msgSend(v97, "encodeObject:forKey:", v87, CFSTR("kFirstRespondersKey"));
          }
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Saving root set of view controller identifier paths: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v96);
          objc_msgSend(v97, "encodeObject:forKey:", v96, CFSTR("kRootRestorationIdentifiersKey"));
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Saving root set of object restoration classes: %@"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v82);
          objc_msgSend(v97, "encodeObject:forKey:", v82, CFSTR("kViewControllerRestorationClassMapKey"));
          -[UIResponder firstResponder](v91, "firstResponder");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UIResponder firstResponder](v91, "firstResponder");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "_isDisplayingShortcutViewController");

            if (v64)
            {
              byte_1EDDC8021 = 1;
              goto LABEL_107;
            }
          }
          else
          {

          }
          if (byte_1EDDC8021 != 1)
          {
LABEL_108:
            objc_msgSend(v97, "finishEncoding");
            objc_msgSend(v97, "encodedData");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = -[UIApplication _restorationArchiveProtectionClass](v91, "_restorationArchiveProtectionClass");
            _restorationDirectory(v86);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = 0;
            objc_msgSend(v68, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v67, 1, 0, &v100);
            v69 = v100;

            if (v69)
              NSLog(CFSTR("Error creating state restoration directory: %@"), v69);

            _restorationPath(v86);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            v99 = 0;
            objc_msgSend(v65, "writeToURL:options:error:", v70, v66 | 1, &v99);
            v71 = v99;
            v72 = v71;
            if (v71)
            {
              NSLog(CFSTR("Error writing archived restorable state: %@"), v71);
              v73 = 0;
            }
            else
            {
              if (byte_1EDDC8021 == 1)
              {
                if (_UIStateRestorationDebugLogEnabled())
                  NSLog(CFSTR("%s: Will ignore snapshot on next launch"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]");
                v74 = CFSTR("YES");
              }
              else
              {
                if (_UIStateRestorationDebugLogEnabled())
                  NSLog(CFSTR("%s: Will use snapshot on next launch"), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]");
                v74 = CFSTR("NO");
              }
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v74, CFSTR("kIgnoreSnapshotKey"), 0);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              _restorationDirectory(v86);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "URLByAppendingPathComponent:isDirectory:", CFSTR("restorationInfo.plist"), 0);
              v78 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v76, "writeToURL:atomically:", v78, 1);
              v73 = 1;
            }

            v97 = 0;
            goto LABEL_132;
          }
LABEL_107:
          objc_msgSend(v97, "encodeBool:forKey:", 1, CFSTR("kIgnoreSnapshotKey"));
          goto LABEL_108;
        }
        v94 = 0;
      }
      v41 = objc_msgSend(v94, "count");
      goto LABEL_48;
    }
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Application has declined saving application state or doesn't implement state restoration, clearing previous saved state."), "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]");
  _deleteRestorationArchive(0);
  v73 = 0;
  v82 = 0;
  v83 = 0;
  v95 = 0;
LABEL_132:
  v79 = v73 != 0;
  if (v83)
    _UIReleaseStateRestorationCollections();
  if (v97)
    objc_msgSend(v97, "finishEncoding");
  if (v85)
    v85[2](v85, v79);

}

void __133__UIApplication_StateRestoration___saveApplicationPreservationState_viewController_sessionIdentifier_beginHandler_completionHandler___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = kRestorationTriesLeftKey_block_invoke_10___s_category;
  if (!kRestorationTriesLeftKey_block_invoke_10___s_category)
  {
    v0 = __UILogCategoryGetNode("ApplicationStateRestoration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&kRestorationTriesLeftKey_block_invoke_10___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Warning: The UIApplicationDelegate method application:shouldSaveApplicationState: is deprecated. Please replace the use of application:shouldSaveApplicationState: with application:shouldSaveSecureApplicationState:", v2, 2u);
  }
}

- (void)extendStateRestoration
{
  _incrementRestorationMarkerCount(self, 0, 0);
}

- (void)completeStateRestoration
{
  _decrementRestorationMarkerCount(self, 0);
}

- (void)ignoreSnapshotOnNextApplicationLaunch
{
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Marking ignore snapshot on next launch"), "-[UIApplication(StateRestoration) ignoreSnapshotOnNextApplicationLaunch]");
  byte_1EDDC8021 = 1;
}

+ (BOOL)_wantsApplicationBehaviorAsExtension
{
  return 0;
}

- (NSSet)_canvases
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  +[UIScene _scenesIncludingInternal:](UICanvas, "_scenesIncludingInternal:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)_openRepresentations
{
  if (qword_1EDDC8508 != -1)
    dispatch_once(&qword_1EDDC8508, &__block_literal_global_3248);
  return (NSSet *)(id)objc_msgSend((id)qword_1EDDC8500, "copy");
}

- (void)_openCanvasDefinition:(id)a3 withUserActivity:(id)a4 options:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v16 = (id)objc_opt_new();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_UICanvasRequestOriginKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRequestingScene:", v15);

  -[UIApplication requestSceneSessionActivation:userActivity:options:errorHandler:](self, "requestSceneSessionActivation:userActivity:options:errorHandler:", v13, v12, v16, v10);
}

- (void)_closeCanvasDefinition:(id)a3 withOptions:(id)a4 errorHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("_UICanvasDismissalAnimationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setWindowDismissalAnimation:", objc_msgSend(v9, "integerValue"));
  }
  else
  {
    v10 = 0;
  }
  -[UIApplication requestSceneSessionDestruction:options:errorHandler:](self, "requestSceneSessionDestruction:options:errorHandler:", v11, v10, v8);

}

+ (void)registerObjectForStateRestoration:(id)object restorationIdentifier:(NSString *)restorationIdentifier
{
  if (object && restorationIdentifier && (objc_msgSend(object, "conformsToProtocol:", &unk_1EE0CED08) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Warning: Ignoring UIViewController, UIViewControllers are implicitly registered for state restoration: %@"), "void _UIRegisterObjectForStateRestoration(id<UIStateRestoring>, NSString *)", object);
    }
    else
    {
      objc_setAssociatedObject(object, &_MergedGlobals_1204, restorationIdentifier, (void *)1);
      _trackObjectWithIdentifier((uint64_t)object);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIRestorationObjectRegistrationException"), CFSTR("To register an object for state restoration, must specify a valid non-nil object and a valid non-nil restoration identifier, and the object must implement the UIStateRestoring protocol."));
  }
}

- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__194;
  v25 = __Block_byref_object_dispose__194;
  v26 = 0;
  v11 = v9;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __124__UIApplication_UIApplicationKeyboardTesting__installNotificationObserverForNotificationName_forOneNotification_usingBlock___block_invoke;
  v16[3] = &unk_1E16E44A8;
  v19 = &v21;
  v20 = a4;
  v12 = v11;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v7, 0, v10, v16);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v22[5];
  v22[5] = v14;

  _Block_object_dispose(&v21, 8);
}

void __124__UIApplication_UIApplicationKeyboardTesting__installNotificationObserverForNotificationName_forOneNotification_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = v3;
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = v7;
  }

}

- (void)showKeyboardUsingBlock:(id)a3 withCompletionBlock:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[UIApplication installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("UIKeyboardDidShowNotification"), 1, a4);
  v6[2]();

}

- (void)_runSubTestForKeyboardBringupWithName:(id)a3 withShowKeyboardBlock:(id)a4 withHideKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
  v21[3] = &unk_1E16E44F8;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = (void (**)(_QWORD))a4;
  -[UIApplication installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("UIKeyboardDidShowNotification"), 1, v21);
  -[UIApplication startedTest:](self, "startedTest:", v19);
  -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("ShowKeyboard"), v19);
  v20[2](v20);

}

void __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("ShowKeyboard"), *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2;
  block[3] = &unk_1E16E44D0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runSubTestForKeyboardDismissalWithName:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_runSubTestForKeyboardDismissalWithName:(id)a3 withHideKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  UIApplication *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __148__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardDismissalWithName_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
  v20 = &unk_1E16E4548;
  v21 = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = (void (**)(_QWORD))a4;
  -[UIApplication installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("UIKeyboardDidHideNotification"), 1, &v17);
  -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("HideKeyboard"), v15, v17, v18, v19, v20, v21);
  v16[2](v16);

}

void __148__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardDismissalWithName_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("HideKeyboard"), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:withTeardownBlock:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 56));

}

- (void)_runSubTestForKeyboardSplitWithName:(id)a3 withShowKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
  aBlock[3] = &unk_1E16DD308;
  aBlock[4] = self;
  v15 = v10;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v17 = v13;
  v25 = v17;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (v11)
  {
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4;
    v20[3] = &unk_1E16E4520;
    v21 = v18;
    -[UIApplication showKeyboardUsingBlock:withCompletionBlock:](self, "showKeyboardUsingBlock:withCompletionBlock:", v11, v20);

  }
  else
  {
    NSLog(CFSTR("No block specified to bring up the keyboard - assuming the keyboard has already been shown on screen"));
    dispatch_async(MEMORY[0x1E0C80D38], v19);
  }

}

void __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2;
  v7 = &unk_1E16E4548;
  v2 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v2;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v8, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("UIKeyboardDidChangeFrameNotification"), 1, &v4);
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(_QWORD *)(a1 + 40), v4, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:", CFSTR("SplitKeyboard"), *(_QWORD *)(a1 + 40));
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSplit:", 1);

}

void __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("SplitKeyboard"), *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 2000000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3;
  v4[3] = &unk_1E16DD308;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

uint64_t __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runSubTestForKeyboardMergeWithName:withExtraResultsBlock:withCleanupBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void)_runSubTestForKeyboardMergeWithName:(id)a3 withExtraResultsBlock:(id)a4 withCleanupBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  UIApplication *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __122__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardMergeWithName_withExtraResultsBlock_withCleanupBlock___block_invoke;
  v18 = &unk_1E16E4548;
  v19 = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[UIApplication installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("UIKeyboardDidChangeFrameNotification"), 1, &v15);
  -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("MergeKeyboard"), v13, v15, v16, v17, v18, v19);
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setSplit:", 0);

}

void __122__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardMergeWithName_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("MergeKeyboard"), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:withTeardownBlock:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 56));

}

- (void)runTestForKeyboardBringupAndDismissalWithName:(id)a3 withShowKeyboardBlock:(id)a4 withHideKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7
{
  if (a3 && a4 && a5)
    -[UIApplication _runSubTestForKeyboardBringupWithName:withShowKeyboardBlock:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "_runSubTestForKeyboardBringupWithName:withShowKeyboardBlock:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:");
  else
    NSLog(CFSTR("You must specify a test name and blocks to show and dismiss the keyboard for the keyboard show/hide test"), a2);
}

- (void)runTestForKeyboardRotationWithName:(id)a3 fromOrientation:(int64_t)a4 withShowKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25;
  id v26;
  uint64_t v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    v16 = MEMORY[0x1E0C809B0];
    if ((unint64_t)(a4 - 3) < 2)
      v17 = 1;
    else
      v17 = 4;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
    aBlock[3] = &unk_1E16E4570;
    aBlock[4] = self;
    v25 = v14;
    v24 = v12;
    v26 = v15;
    v27 = v17;
    v18 = _Block_copy(aBlock);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3;
    v20[3] = &unk_1E16E4598;
    v21 = v13;
    v22 = v18;
    v20[4] = self;
    v19 = v18;
    -[UIApplication rotateIfNeeded:completion:](self, "rotateIfNeeded:completion:", a4, v20);

  }
  else
  {
    NSLog(CFSTR("You must specify a test name for the rotation with keyboard test"));
  }

}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2;
  v9 = &unk_1E16E4548;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v12 = v3;
  v10 = v4;
  v11 = v5;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v2, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", CFSTR("UIKeyboardDidShowNotification"), 1, &v6);
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(_QWORD *)(a1 + 40), v6, v7, v8, v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "rotateIfNeeded:", *(_QWORD *)(a1 + 64));

}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:withTeardownBlock:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 56));

}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4;
    v4[3] = &unk_1E16E4520;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v3, "showKeyboardUsingBlock:withCompletionBlock:", v2, v4);

  }
  else
  {
    NSLog(CFSTR("No block specified to bring up the keyboard - assuming the keyboard has already been shown on screen"));
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 48));
  }
}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void)runTestForKeyboardSplitAndMergeWithName:(id)a3 withShowKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6
{
  if (a3)
    -[UIApplication _runSubTestForKeyboardSplitWithName:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "_runSubTestForKeyboardSplitWithName:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:", a3, a4, a5, a6);
  else
    NSLog(CFSTR("You must specify a test name for the keyboard split & merge test"), a2, 0, a4, a5, a6);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "objectForKey:", CFSTR("quit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_4:
    objc_storeStrong((id *)&qword_1ECD819E8, a3);
    -[UIApplication startedTest:](self, "startedTest:", v7);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("PPTFakeSuspendEvent"), CFSTR("PPTMessageType"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplication _sendDictionaryToPPT:](self, "_sendDictionaryToPPT:", v11);

LABEL_5:
    v12 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("suspend"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_4;
  objc_msgSend(v8, "objectForKey:", CFSTR("launch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _pptLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Application received PPT launch test command, but we're already running!", buf, 2u);
    }

    -[UIApplication startedTest:](self, "startedTest:", v7);
    -[UIApplication failedTest:](self, "failedTest:", v7);
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("leak")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("leak"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("yes"));

    if (v17)
      -[UIApplication startLeaking](self, "startLeaking");
    else
      -[UIApplication stopLeaking](self, "stopLeaking");
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("resize")))
  {
    -[UIApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__executeResizeTest, self, 1.0);
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = -[UIApplicationDelegate application:runTest:options:](self->_delegate, "application:runTest:options:", self, v7, v8);
  else
    v12 = 0;
LABEL_6:

  return v12;
}

- (void)_executeNextResizeSubTest
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  void *v29;
  _QWORD v30[4];
  id v31;
  UIApplication *v32;
  id v33;

  objc_msgSend((id)UIApp, "_mainScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v3);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "_referenceBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = 0;
  v12 = 0.0;
  v13 = 320.0;
  do
  {
    if (v13 > v12 && v13 < v4)
      v12 = v13;
    v13 = *(double *)((char *)&_UIWindowWidthsOnIPAD + v11 + 8);
    v11 += 8;
  }
  while (v11 != 32);
  if ((_MergedGlobals_1248 & 1) != 0)
  {
    if (v12 <= 0.0)
      v12 = v4;
    if (v12 == v4)
    {
      v15 = 0;
      v12 = 320.0;
      while (v12 <= v4)
      {
        v12 = *(double *)((char *)&_UIWindowWidthsOnIPAD + v15 + 8);
        v15 += 8;
        if (v15 == 32)
        {
          v12 = v4;
          break;
        }
      }
      v16 = 0;
      _MergedGlobals_1248 = 0;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v17 = 0;
    v12 = 320.0;
    while (v12 <= v4)
    {
      v12 = *(double *)((char *)&_UIWindowWidthsOnIPAD + v17 + 8);
      v17 += 8;
      if (v17 == 32)
      {
        v16 = 0;
        v12 = v4;
        goto LABEL_23;
      }
    }
    v16 = 0;
  }
LABEL_23:
  v18 = qword_1ECD81A28;
  if (v12 == *(double *)&qword_1ECD81A28)
    v16 = 1;
  if (v16)
    *(double *)&v18 = v12;
  if (v4 == v12)
    v19 = *(double *)&v18;
  else
    v19 = v12;
  if (v19 == v4)
  {
    -[UIApplication finishedTest:](self, "finishedTest:", CFSTR("resize"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(v27, "_effectiveSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v26, "setFrame:", *(double *)&qword_1ECD81A10, unk_1ECD81A18, *(double *)&qword_1ECD81A20, *(double *)&qword_1ECD81A28);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_3;
    v28[3] = &unk_1E16E4610;
    v29 = v26;
    v24 = v26;
    objc_msgSend(v27, "_enableOverrideSettingsForActions:", v28);
    v23 = v29;
  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("resize %.0f->%.0f"), *(_QWORD *)&v4, *(_QWORD *)&v19);
    -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", v20, CFSTR("resize"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(v27, "_effectiveSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "setFrame:", v6, v8, v10, v19);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke;
    v30[3] = &unk_1E16DD290;
    v31 = v22;
    v32 = self;
    v33 = v20;
    v23 = v20;
    v24 = v22;
    objc_msgSend(v27, "_enableOverrideSettingsForActions:", v30);
    -[UIApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__executeNextResizeSubTest, self, 1.0);

  }
}

void __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_2;
  v4[3] = &unk_1E16E45E8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "_applyOverrideSettings:forActions:", v3, v4);

}

uint64_t __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", *(_QWORD *)(a1 + 40), CFSTR("resize"));
}

uint64_t __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_applyOverrideSettings:forActions:", *(_QWORD *)(a1 + 32), &__block_literal_global_538);
}

uint64_t __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_4()
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_executeResizeTest
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _MergedGlobals_1248 = 1;
  objc_msgSend((id)UIApp, "_mainScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  qword_1ECD81A10 = v5;
  unk_1ECD81A18 = v6;
  qword_1ECD81A20 = v7;
  qword_1ECD81A28 = v8;

  -[UIApplication startedTest:](self, "startedTest:", CFSTR("resize"));
  -[UIApplication _executeNextResizeSubTest](self, "_executeNextResizeSubTest");
}

- (void)_noteAnimationStarted:(id)a3
{
  void *v4;
  id v5;

  if (qword_1ECD819F8)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", 0x1E16EFE40);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)qword_1ECD81A00, "isEqualToString:", v5))
      -[UIApplication startedTest:](self, "startedTest:", qword_1ECD819F8);

  }
}

- (void)_noteAnimationFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (qword_1ECD819F8)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", 0x1E16EFE40);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)qword_1ECD81A08, "isEqualToString:", v9))
    {
      -[UIApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", qword_1ECD819F8, 0);
      v5 = (void *)qword_1ECD819F8;
      qword_1ECD819F8 = 0;

      v6 = (void *)qword_1ECD81A00;
      qword_1ECD81A00 = 0;

      v7 = (void *)qword_1ECD81A08;
      qword_1ECD81A08 = 0;

      +[NSNotificationCenter uikitInternalCenter]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, 0x1E178A7C0, 0);
      objc_msgSend(v8, "removeObserver:name:object:", self, 0x1E178A7E0, 0);

    }
  }
}

- (void)runTest:(id)a3 forAnimation:(id)a4
{
  -[UIApplication runTest:startingBeforeAnimation:stoppingAfterAnimation:](self, "runTest:startingBeforeAnimation:stoppingAfterAnimation:", a3, a4, a4);
}

- (void)runTest:(id)a3 startingBeforeAnimation:(id)a4 stoppingAfterAnimation:(id)a5
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  if (v16)
  {
    if (v10)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplicationTesting.m"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startAnimationName"));

    if (v11)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplicationTesting.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testName"));

  if (!v10)
    goto LABEL_9;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplicationTesting.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stopAnimationName"));

LABEL_4:
  if (qword_1ECD819F8)
  {
    NSLog(CFSTR("Warning: Tried to call -[UIApplication(UIApplicationTesting) runTest:startingBeforeAnimation:stoppingAfterAnimation:], but ignoringbecause test %@ is already being performed starting before animation named %@ and stopping after animation named %@"), qword_1ECD819F8, qword_1ECD81A00, qword_1ECD81A08);
  }
  else
  {
    +[NSNotificationCenter uikitInternalCenter]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__noteAnimationStarted_, 0x1E178A7C0, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__noteAnimationFinished_, 0x1E178A7E0, 0);
    objc_storeStrong((id *)&qword_1ECD819F8, a3);
    objc_storeStrong((id *)&qword_1ECD81A00, a4);
    objc_storeStrong((id *)&qword_1ECD81A08, a5);

  }
}

- (BOOL)reportApplicationSuspended
{
  BOOL v2;
  UIApplication *v3;
  void *v4;

  if (__IsRunningTests)
    v2 = qword_1ECD819E8 == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  v3 = self;
  -[UIApplication finishedTest:extraResults:](self, "finishedTest:extraResults:");
  LOBYTE(v3) = -[UIApplication isRunningQuitTest](v3, "isRunningQuitTest");
  v4 = (void *)qword_1ECD819E8;
  qword_1ECD819E8 = 0;

  return (char)v3;
}

- (BOOL)isRunningQuitTest
{
  BOOL v2;

  if (__IsRunningTests)
    v2 = qword_1ECD819E8 == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  else
    return objc_msgSend((id)qword_1ECD819E8, "hasPrefix:", CFSTR("quit"));
}

- (BOOL)isRunningSuspendTest
{
  BOOL v2;

  if (__IsRunningTests)
    v2 = qword_1ECD819E8 == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  else
    return objc_msgSend((id)qword_1ECD819E8, "hasPrefix:", CFSTR("suspend"));
}

- (void)startedAnimationTest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  UIApplication *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1ECD819E0;
    if (!qword_1ECD819E0)
    {
      v6 = objc_opt_new();
      v7 = (void *)qword_1ECD819E0;
      qword_1ECD819E0 = v6;

      v5 = (void *)qword_1ECD819E0;
    }
    objc_msgSend(v5, "addObject:", v4);
    -[UIApplication startedTest:](self, "startedTest:", v4);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __60__UIApplication_UIApplicationTesting__startedAnimationTest___block_invoke;
    v12 = &unk_1E16B1B50;
    v13 = self;
    v8 = v4;
    v14 = v8;
    -[UIApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", &v9);
    -[UIApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("setup"), v8, v9, v10, v11, v12, v13);

  }
}

uint64_t __60__UIApplication_UIApplicationTesting__startedAnimationTest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("setup"), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:", CFSTR("duration"), *(_QWORD *)(a1 + 40));
}

- (id)resultsForTest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend((id)qword_1ECD819D8, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("SubTestResults"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("SubTestResults"));
  }
LABEL_8:

  return v7;
}

- (void)finishedSubTest:(id)a3 forTest:(id)a4 waitForCommit:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__UIApplication_UIApplicationTesting__finishedSubTest_forTest_waitForCommit___block_invoke;
    v10[3] = &unk_1E16B47A8;
    v10[4] = self;
    v11 = v8;
    v12 = v9;
    -[UIApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v10);

  }
  else
  {
    -[UIApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:", v8, v9);
  }

}

uint64_t __77__UIApplication_UIApplicationTesting__finishedSubTest_forTest_waitForCommit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)startedIPTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setObject:forKey:", CFSTR("StartedInterProcessTest"), CFSTR("PPTMessageType"));
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("testName"));
    -[UIApplication _currentFrameCountForTestDisplay](self, "_currentFrameCountForTestDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("startingFrameCount"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("startTimeIntervalSinceReferenceDate"));

    if (qword_1ECD819F0)
    {
      objc_msgSend(v5, "setObject:forKey:", qword_1ECD819F0, CFSTR("aggregate"));
      v9 = (void *)qword_1ECD819F0;
      qword_1ECD819F0 = 0;

    }
    -[UIApplication emitPPTStartTracePointForTestName:identifier:](self, "emitPPTStartTracePointForTestName:identifier:", v10, objc_msgSend(v10, "hash"));
    -[UIApplication _sendDictionaryToPPT:](self, "_sendDictionaryToPPT:", v5);

    v4 = v10;
  }

}

- (void)finishedIPTest:(id)a3
{
  -[UIApplication finishedIPTest:extraResults:withTeardownBlock:](self, "finishedIPTest:extraResults:withTeardownBlock:", a3, 0, 0);
}

- (void)finishedIPTest:(id)a3 extraResults:(id)a4
{
  -[UIApplication finishedIPTest:extraResults:withTeardownBlock:](self, "finishedIPTest:extraResults:withTeardownBlock:", a3, a4, 0);
}

- (void)finishedIPTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__UIApplication_UIApplicationTesting__finishedIPTest_waitForCommit_extraResults_withTeardownBlock___block_invoke;
    v13[3] = &unk_1E16B4420;
    v13[4] = self;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    -[UIApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v13);

  }
  else
  {
    -[UIApplication finishedIPTest:extraResults:withTeardownBlock:](self, "finishedIPTest:extraResults:withTeardownBlock:", v10, v11, v12);
  }

}

uint64_t __99__UIApplication_UIApplicationTesting__finishedIPTest_waitForCommit_extraResults_withTeardownBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedIPTest:extraResults:withTeardownBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)finishedIPTest:(id)a3 extraResults:(id)a4 withTeardownBlock:(id)a5
{
  void (**v8)(_QWORD);
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = (void (**)(_QWORD))a5;
  if (a3)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99E08];
    v10 = a3;
    v11 = objc_alloc_init(v9);
    if (v15)
      objc_msgSend(v11, "addEntriesFromDictionary:", v15);
    objc_msgSend(v11, "setObject:forKey:", CFSTR("FinishedInterProcessTest"), CFSTR("PPTMessageType"));
    objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("testName"));
    -[UIApplication _currentFrameCountForTestDisplay](self, "_currentFrameCountForTestDisplay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("endingFrameCount"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("endTimeIntervalSinceReferenceDate"));

    -[UIApplication emitPPTEndTracePointForTestName:identifier:](self, "emitPPTEndTracePointForTestName:identifier:", v10, objc_msgSend(v10, "hash"));
    if (v8)
      v8[2](v8);
    -[UIApplication _sendDictionaryToPPT:](self, "_sendDictionaryToPPT:", v11);

  }
}

uint64_t __103__UIApplication_UIApplicationTesting__finishedTest_extraResults_waitForNotification_withTeardownBlock___block_invoke_253(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAndReportResultsForTest:extraResults:waitForNotification:withTeardownBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "outputData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

}

void __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke_275(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__reportResults_, *(_QWORD *)(a1 + 40), 0.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)finishedTest:(id)a3 extraResults:(id)a4 withTeardownBlock:(id)a5
{
  -[UIApplication finishedTest:extraResults:waitForNotification:withTeardownBlock:](self, "finishedTest:extraResults:waitForNotification:withTeardownBlock:", a3, a4, 0, a5);
}

- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5
{
  -[UIApplication finishedTest:extraResults:waitForNotification:withTeardownBlock:](self, "finishedTest:extraResults:waitForNotification:withTeardownBlock:", a3, a4, a5, 0);
}

- (void)failedTest:(id)a3
{
  -[UIApplication failedTest:withResults:](self, "failedTest:withResults:", a3, 0);
}

- (void)failedTest:(id)a3 withFailure:(id)a4
{
  -[UIApplication failedTest:withFailure:withResults:](self, "failedTest:withFailure:withResults:", a3, a4, 0);
}

- (void)failedTest:(id)a3 withResults:(id)a4
{
  -[UIApplication failedTest:withFailure:withResults:](self, "failedTest:withFailure:withResults:", a3, 0, a4);
}

- (void)failedTest:(id)a3 withFailure:(id)a4 withResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
    v11 = qword_1ECD819E8 == 0;
  else
    v11 = 0;
  v12 = !v11;
  if (byte_1ECD819D2)
    -[UIApplication stopCHUDRecording](self, "stopCHUDRecording");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("failed"));

  if (v9)
    objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("failureType"));
  if (!v8)
    goto LABEL_15;
  objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("testName"));
  _pptLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "PPT failedTest: %@ (removing results)", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend((id)qword_1ECD819D8, "removeObjectForKey:", v8);
  if (!v12)
    -[UIApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reportResults_, v13, 0.0);
  else
LABEL_15:
    -[UIApplication _reportResults:](self, "_reportResults:", v13);

}

- (void)emitPPTStartTracePointForTestName:(id)a3 identifier:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id v9;
  size_t v10;
  unint64_t v11;
  size_t v12;
  char *Buffer;
  unint64_t v14;
  unint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _pptLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  _pptLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v16 = 138543362;
    v17 = v5;
    _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MainTest", "%{public, name=testName}@  isAnimation=YES ", (uint8_t *)&v16, 0xCu);
  }

  v9 = objc_retainAutorelease(v5);
  v10 = strlen((const char *)objc_msgSend(v9, "UTF8String"));
  v11 = 3 * ((v10 + 11) / 0xC);
  v12 = 12 * ((v10 + 11) / 0xC);
  Buffer = createBuffer(v9, v12);
  objc_msgSend(v9, "length");
  kdebug_trace();
  if (v12 >= 4)
  {
    v14 = 0;
    v15 = v11 & 0x3FFFFFFFFFFFFFFFLL;
    do
    {
      kdebug_trace();
      v14 += 3;
    }
    while (v14 < v15);
  }
  free(Buffer);

}

- (void)startCHUDRecording:(id)a3
{
  unsigned int (*CHUDSymbol)(void);
  unsigned int (*v4)(void);
  uint64_t (*v5)(uint64_t);
  uint64_t (*v6)(void);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  CHUDSymbol = (unsigned int (*)(void))_getCHUDSymbol("chudAcquireRemoteAccess");
  v4 = (unsigned int (*)(void))_getCHUDSymbol("chudIsRemoteAccessAcquired");
  v5 = (uint64_t (*)(uint64_t))_getCHUDSymbol("chudStartRemotePerfMonitor");
  v6 = (uint64_t (*)(void))_getCHUDSymbol("chudInitialize");
  v7 = _getCHUDSymbol("chudMarkPID");
  if (!v6 || !v7 || !CHUDSymbol || !v4 || !v5)
  {
    NSLog(CFSTR("Couldn't start shark recording, missing symbols."));
    goto LABEL_19;
  }
  if ((startCHUDRecording__chudInitialized & 1) == 0)
  {
    v8 = v6();
    if ((_DWORD)v8)
    {
      NSLog(CFSTR("chudInitialize failed: %d"), v8);
      goto LABEL_19;
    }
    startCHUDRecording__chudInitialized = 1;
  }
  v9 = 1;
  while (CHUDSymbol() || !v4())
  {
    NSLog(CFSTR("Waiting for shark (%d of %d tries)..."), v9, 5);
    sleep(2u);
    v9 = (v9 + 1);
    if ((_DWORD)v9 == 6)
      goto LABEL_17;
  }
  NSLog(CFSTR("Connected to shark"));
LABEL_17:
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v12, v15);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = v5(objc_msgSend(v13, "UTF8String"));

  if ((_DWORD)v14)
    NSLog(CFSTR("chudStartRemotePerfMonitor failed: %d"), v14);
LABEL_19:

}

- (void)stopCHUDRecording
{
  uint64_t (*CHUDSymbol)(void);
  uint64_t (*v3)(void);
  BOOL v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;

  CHUDSymbol = (uint64_t (*)(void))_getCHUDSymbol("chudStopRemotePerfMonitor");
  v3 = (uint64_t (*)(void))_getCHUDSymbol("chudReleaseRemoteAccess");
  if (CHUDSymbol)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    NSLog(CFSTR("Couldn't stop CHUD recording, missing symbols."));
  }
  else
  {
    v5 = v3;
    v6 = CHUDSymbol();
    if ((_DWORD)v6)
      NSLog(CFSTR("chudStopRemotePerfMonitor failed: %d"), v6);
    v7 = v5();
    if ((_DWORD)v7)
      NSLog(CFSTR("chudReleaseRemoteAccess failed: %d"), v7);
  }
}

- (void)_leak
{
  void *v2;
  uint64_t v3;
  size_t v4;
  _BYTE *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("DebugLeakSize"));

  if (v3)
    v4 = v3;
  else
    v4 = 0x100000;
  v5 = malloc_type_malloc(v4, 0x96CEB44CuLL);
  v6 = 0;
  do
  {
    v5[v6] = 1;
    v6 += 4096;
  }
  while (v4 > v6);
  _leak_totalLeaked += v4;
}

- (void)startLeaking
{
  void *v3;
  float v4;
  float v5;
  float v6;
  uint64_t v7;
  void *v8;

  if (!__LeakTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatForKey:", CFSTR("DebugLeakRate"));
    v5 = v4;

    v6 = 1.0;
    if (v5 != 0.0)
      v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__leak, 0, 1, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__LeakTimer;
    __LeakTimer = v7;

  }
}

- (void)stopLeaking
{
  void *v2;

  if (__LeakTimer)
  {
    objc_msgSend((id)__LeakTimer, "invalidate");
    v2 = (void *)__LeakTimer;
    __LeakTimer = 0;

  }
}

- (BOOL)rotateIfNeeded:(int64_t)a3
{
  int64_t v5;
  unint64_t v6;
  UIPPTRequestAction *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[UIApplication _safeInterfaceOrientationForNoWindow](self, "_safeInterfaceOrientationForNoWindow");
  if ((unint64_t)(v5 - 3) > 1)
    v6 = (v5 - 1) | (a3 - 1);
  else
    v6 = a3 - 3;
  if (v6 < 2)
    return 0;
  if ((unint64_t)(a3 - 1) >= 4)
    a3 = 0;
  v8 = -[UIPPTRequestAction initWithDesiredOrientation:]([UIPPTRequestAction alloc], "initWithDesiredOrientation:", a3);
  -[UIApplication _findUISceneForLegacyInterfaceOrientation](self, "_findUISceneForLegacyInterfaceOrientation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendActions:", v11);

  return 1;
}

- (void)rotateIfNeeded:(int64_t)a3 completion:(id)a4
{
  -[UIApplication rotateIfNeeded:before:after:](self, "rotateIfNeeded:before:after:", a3, &__block_literal_global_354, a4);
}

- (void)rotateIfNeeded:(int64_t)a3 before:(id)a4 after:(id)a5
{
  void (**v8)(id, _QWORD);
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  UIPPTRequestAction *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD);
  uint64_t *v26;
  _QWORD v27[5];
  void (**v28)(id, _QWORD);
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = (void (**)(id, _QWORD))a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[UIApplication _safeInterfaceOrientationForNoWindow](self, "_safeInterfaceOrientationForNoWindow") == a3)
  {
    if (v8)
      v8[2](v8, 0);
    if (v9)
      v9[2](v9, 0);
  }
  else
  {
    if (v8)
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__195;
      v34 = __Block_byref_object_dispose__195;
      v35 = 0;
      -[UIApplication keyWindow](self, "keyWindow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke;
      v27[3] = &unk_1E16E4688;
      v27[4] = self;
      v28 = v8;
      v29 = &v30;
      objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowWillRotateNotification"), v10, v12, v27);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v31[5];
      v31[5] = v13;

      _Block_object_dispose(&v30, 8);
    }
    if (v9)
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__195;
      v34 = __Block_byref_object_dispose__195;
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_4;
      v24[3] = &unk_1E16E46B0;
      v25 = v9;
      v26 = &v30;
      objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowDidRotateNotification"), v16, v17, v24);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v31[5];
      v31[5] = v18;

      _Block_object_dispose(&v30, 8);
    }
    if ((unint64_t)(a3 - 1) >= 4)
      a3 = 0;
    v20 = -[UIPPTRequestAction initWithDesiredOrientation:]([UIPPTRequestAction alloc], "initWithDesiredOrientation:", a3);
    -[UIApplication _findUISceneForLegacyInterfaceOrientation](self, "_findUISceneForLegacyInterfaceOrientation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_FBSScene");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendActions:", v23);

  }
}

void __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_2;
  v6[3] = &unk_1E16B1BF8;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "installCACommitCompletionBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 16666666);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_3;
  block[3] = &unk_1E16B1BF8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)UIApp;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_5;
  v6[3] = &unk_1E16B1BF8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "installCACommitCompletionBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

uint64_t __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _UIWindowSceneActivationAnimator *v14;
  _UIWindowSceneActivationAnimator *v15;
  _QWORD v16[4];
  _UIWindowSceneActivationAnimator *v17;
  id v18;
  id v19;
  UIApplication *v20;
  id v21;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  +[UISceneSessionActivationRequest request](UISceneSessionActivationRequest, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserActivity:", v12);

  objc_msgSend(v9, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", v13);

  if (v7)
  {
    v14 = -[_UIWindowSceneActivationAnimator initWithConfiguration:]([_UIWindowSceneActivationAnimator alloc], "initWithConfiguration:", v9);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __119__UIApplication__UIWindowSceneActivationCommon___requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke;
    v16[3] = &unk_1E16E6D08;
    v17 = v14;
    v18 = v9;
    v19 = v11;
    v20 = self;
    v21 = v10;
    v15 = v14;
    -[_UIWindowSceneActivationAnimator prewarmWithCompletion:](v15, "prewarmWithCompletion:", v16);

  }
  else
  {
    -[UIApplication activateSceneSessionForRequest:errorHandler:](self, "activateSceneSessionForRequest:errorHandler:", v11, v10);
  }

}

uint64_t __119__UIApplication__UIWindowSceneActivationCommon___requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "preview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animateWithSourcePreview:velocity:", v4, 0.0);

    objc_msgSend(*(id *)(a1 + 40), "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setOptions:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }
  return objc_msgSend(*(id *)(a1 + 56), "activateSceneSessionForRequest:errorHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
}

@end
