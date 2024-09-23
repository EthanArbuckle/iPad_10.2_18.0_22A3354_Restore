@implementation SBUserAgent

- (SBUserAgent)init
{
  void *v4;
  void *v5;
  objc_super v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent init]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBUserAgent.m"), 90, CFSTR("this call must be made on the main thread"));

  }
  v6.receiver = self;
  v6.super_class = (Class)SBUserAgent;
  return -[SBUserAgent init](&v6, sel_init);
}

- (void)updateInterfaceOrientationIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent updateInterfaceOrientationIfNecessary]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBUserAgent.m"), 105, CFSTR("this call must be made on the main thread"));

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backlightController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInScreenOffMode");

  if (v5)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lockScreenOrientationManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "updateInterfaceOrientationWithRequestedOrientation:animated:", 0, 0);
  }
  else
  {
    objc_msgSend((id)SBApp, "updateNativeOrientationWithLogMessage:", CFSTR("SBUserAgent thinks the screen is on"));
  }
}

- (int64_t)activeInterfaceOrientation
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent activeInterfaceOrientation]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBUserAgent.m"), 120, CFSTR("this call must be made on the main thread"));

  }
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation");
}

- (id)foregroundApplicationDisplayID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent foregroundApplicationDisplayID]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBUserAgent.m"), 128, CFSTR("this call must be made on the main thread"));

  }
  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStatePrimaryElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspaceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isApplicationForegroundObscured:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent isApplicationForegroundObscured:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SBUserAgent.m"), 133, CFSTR("this call must be made on the main thread"));

  }
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "sceneIfExists");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "settings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isOccluded"))
            goto LABEL_14;
          objc_msgSend(v9, "settings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isForeground") & 1) == 0)
          {

LABEL_14:
            continue;
          }
          objc_msgSend(v7, "application");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v18);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_17;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }
LABEL_17:

  return v4;
}

- (BOOL)applicationInstalledForDisplayID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent applicationInstalledForDisplayID:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBUserAgent.m"), 146, CFSTR("this call must be made on the main thread"));

  }
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)springBoardIsActive
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent springBoardIsActive]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 151, CFSTR("this call must be made on the main thread"));

  }
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpringBoardActive");

  return v3;
}

- (BOOL)deviceIsLocked
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent deviceIsLocked]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 159, CFSTR("this call must be made on the main thread"));

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUILocked");

  return v3;
}

- (BOOL)deviceIsPasscodeLocked
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent deviceIsPasscodeLocked]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 164, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "authenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticatedCached") ^ 1;

  return v3;
}

- (BOOL)deviceIsPasscodeLockedRemotely
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent deviceIsPasscodeLockedRemotely]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBUserAgent.m"), 169, CFSTR("this call must be made on the main thread"));

  }
  v3 = -[SBUserAgent deviceIsPasscodeLocked](self, "deviceIsPasscodeLocked");
  if (v3)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockScreenDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "limitFeaturesForRemoteLock");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)deviceIsBlocked
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent deviceIsBlocked]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 174, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "lockOutController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlocked");

  return v3;
}

- (BOOL)deviceIsTethered
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent deviceIsTethered]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBUserAgent.m"), 179, CFSTR("this call must be made on the main thread"));

  }
  return BKSDisplayServicesDisplayIsTethered();
}

- (BOOL)lockScreenIsShowing
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent lockScreenIsShowing]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBUserAgent.m"), 184, CFSTR("this call must be made on the main thread"));

  }
  return -[SBUserAgent deviceIsLocked](self, "deviceIsLocked");
}

- (BOOL)openURL:(id)a3 allowUnlock:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  BOOL v8;
  void *v10;
  void *v11;

  v5 = a5;
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent openURL:allowUnlock:animated:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBUserAgent.m"), 192, CFSTR("this call must be made on the main thread"));

  }
  v8 = -[SBUserAgent _openApplication:withURL:fromSource:animated:options:](self, "_openApplication:withURL:fromSource:animated:options:", 0, v7, 0, v5, 0);

  return v8;
}

- (id)_safeValue:(id)a3 forKey:(id)a4 ofType:(Class)a5
{
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_cleanupFromBannerLaunch
{
  BSInvalidatable *bannerSuppressionAssertion;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent _cleanupFromBannerLaunch]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBUserAgent.m"), 206, CFSTR("this call must be made on the main thread"));

  }
  -[BSInvalidatable invalidate](self->_bannerSuppressionAssertion, "invalidate");
  bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
  self->_bannerSuppressionAssertion = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBAssistantVisibilityDidChangeNotification"), 0);

}

- (BOOL)_openApplication:(id)a3 withURL:(id)a4 fromSource:(int)a5 animated:(BOOL)a6 options:(id)a7
{
  uint64_t v9;
  uint64_t v12;
  unint64_t v13;
  id v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (**v25)(_QWORD, _QWORD);
  BOOL v26;
  void *v27;
  BSInvalidatable *v28;
  BSInvalidatable *bannerSuppressionAssertion;
  void *v30;
  int v31;
  char v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v38;
  void *v39;
  _QWORD v40[5];
  uint64_t (**v41)(_QWORD, _QWORD);
  BOOL v42;
  _QWORD v43[5];
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  int v48;
  BOOL v49;
  _QWORD block[4];
  NSObject *v51;
  id v52;
  _QWORD v53[4];
  int v54;
  _QWORD v55[4];
  int v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  id v60;
  __int16 v61;
  unint64_t v62;
  uint64_t v63;

  v9 = *(_QWORD *)&a5;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = (uint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a7;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent _openApplication:withURL:fromSource:animated:options:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("SBUserAgent.m"), 217, CFSTR("this call must be made on the main thread"));

  }
  if ((_DWORD)v9 == 6)
  {
    v15 = ++_openApplication_withURL_fromSource_animated_options____carBannerOpenRequestCount;
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "carOpenServiceEndpoint");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0CA5938]);
      -[NSObject setTargetConnectionEndpoint:](v18, "setTargetConnectionEndpoint:", v17);
      if (v13)
      {
        SBLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          v58 = v15;
          v59 = 2112;
          v60 = v17;
          v61 = 2112;
          v62 = v13;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "sending CarBanner open url request (%u) to %@ : url=%@", buf, 0x1Cu);
        }

        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke;
        v55[3] = &__block_descriptor_36_e34_v24__0__NSDictionary_8__NSError_16l;
        v56 = v15;
        objc_msgSend(v20, "openURL:configuration:completionHandler:", v13, v18, v55);
LABEL_28:

        v32 = 1;
LABEL_41:

        goto LABEL_42;
      }
      SBLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v35)
        {
          *(_DWORD *)buf = 67109634;
          v58 = v15;
          v59 = 2112;
          v60 = v17;
          v61 = 2112;
          v62 = v12;
          _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "sending CarBanner open app request (%u) to %@ : app=%@", buf, 0x1Cu);
        }

        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_26;
        v53[3] = &__block_descriptor_36_e20_v20__0B8__NSError_12l;
        v54 = v15;
        objc_msgSend(v20, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v12, v18, v53);
        goto LABEL_28;
      }
      if (v35)
      {
        *(_DWORD *)buf = 67109378;
        v58 = v15;
        v59 = 2112;
        v60 = v17;
        _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "cannot send invalid CarBanner open request (%u) to %@", buf, 0x12u);
      }

    }
    else
    {
      SBLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v58 = v15;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "cannot send CarBanner open request (%u) to a nil endpoint", buf, 8u);
      }
    }
    v32 = 0;
    goto LABEL_41;
  }
  if (v13)
  {
    SBWorkspaceApplicationForURLWithError((void *)v13, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    if (v21)
    {
      objc_msgSend(v21, "bundleIdentifier");
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = v22;
      goto LABEL_16;
    }
LABEL_32:
    dispatch_get_global_queue(0, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_29;
    block[3] = &unk_1E8E9E820;
    v51 = (id)v13;
    v12 = (uint64_t)(id)v12;
    v52 = (id)v12;
    dispatch_async(v36, block);

    v32 = 0;
    v18 = v51;
    goto LABEL_41;
  }
  if (!v12)
  {
    v17 = 0;
    goto LABEL_31;
  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "applicationWithBundleIdentifier:", v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_32;
LABEL_16:
  if (-[SBUserAgent canLaunchFromSource:withURL:bundleID:](self, "canLaunchFromSource:withURL:bundleID:", v9, v13, v12))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2;
    v43[3] = &unk_1E8EAE5C8;
    v43[4] = self;
    v44 = v14;
    v18 = v24;
    v45 = v18;
    v48 = v9;
    v46 = (id)v13;
    v49 = a6;
    v17 = v17;
    v47 = v17;
    v25 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v43);
    if (+[SBAssistantController isVisible](SBAssistantController, "isVisible")
      && -[SBUserAgent deviceIsPasscodeLocked](self, "deviceIsPasscodeLocked"))
    {
      v26 = (_DWORD)v9 == 3;
      if ((_DWORD)v9 == 3)
      {
        objc_msgSend((id)SBApp, "bannerManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "acquireBannerSuppressionAssertionForReason:", CFSTR("BannerOpenAppFromUserAgent"));
        v28 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
        self->_bannerSuppressionAssertion = v28;

        v26 = 1;
      }
      +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_45;
      v40[3] = &unk_1E8EAE5F0;
      v42 = v26;
      v40[4] = self;
      v41 = v25;
      v31 = objc_msgSend(v30, "requestPasscodeUnlockWithCompletion:", v40);
      v32 = v31;
      if ((_DWORD)v9 == 3)
      {
        if (v31)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__cleanupFromBannerLaunch, CFSTR("SBAssistantVisibilityDidChangeNotification"), 0);

        }
        else
        {
          -[SBUserAgent _cleanupFromBannerLaunch](self, "_cleanupFromBannerLaunch");
        }
      }

    }
    else
    {
      v32 = v25[2](v25, 0);
    }

    goto LABEL_41;
  }
LABEL_31:
  if (v13 | v12)
    goto LABEL_32;
  v12 = 0;
  v32 = 0;
LABEL_42:

  return v32;
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_DWORD *)(a1 + 32);
    v9[0] = 67109890;
    v9[1] = v8;
    v10 = 1024;
    v11 = v5 != 0;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "CarBanner open url request (%u) finished: success=%{BOOL}i error=%@ result=%@", (uint8_t *)v9, 0x22u);
  }

}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_26(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(a1 + 32);
    v8[0] = 67109634;
    v8[1] = v7;
    v9 = 1024;
    v10 = a2;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "CarBanner open app request (%u) finished: success=%{BOOL}i error=%@", (uint8_t *)v8, 0x18u);
  }

}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_29(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_LSFailedToOpenURL:withBundle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  SBActivationSettings *v10;
  SBActivationSettings *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBActivationSettings *v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t (**v20)(_QWORD);
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  uint64_t (**v33)(_QWORD);
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[4];
  SBActivationSettings *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  char v50;
  char v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_safeValue:forKey:ofType:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0DAC3C8], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((objc_msgSend(*(id *)(a1 + 48), "isUILocked") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_safeValue:forKey:ofType:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0DAC3D0], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "BOOLValue");

  }
  objc_msgSend(*(id *)(a1 + 32), "_safeValue:forKey:ofType:", *(_QWORD *)(a1 + 40), CFSTR("SBUILaunchOptionKeyActivationSettings"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(SBActivationSettings);
  v11 = v10;

  v12 = *(_DWORD *)(a1 + 72);
  switch(v12)
  {
    case 3:
      v13 = 41;
      v14 = 6;
      break;
    case 7:
      v13 = 46;
      v14 = 2;
      break;
    case 5:
      v13 = 44;
      v14 = 5;
      break;
    default:
      v14 = 0;
      goto LABEL_15;
  }
  -[SBActivationSettings setFlag:forActivationSetting:](v11, "setFlag:forActivationSetting:", 1, v13);
LABEL_15:
  v15 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_3;
  v44[3] = &unk_1E8EAE578;
  v50 = v6;
  v16 = v11;
  v45 = v16;
  v17 = v3;
  v46 = v17;
  v18 = (uint64_t *)(a1 + 56);
  v19 = *(id *)(a1 + 56);
  v51 = *(_BYTE *)(a1 + 76);
  v47 = v19;
  v49 = v14;
  v48 = *(id *)(a1 + 64);
  v20 = (uint64_t (**)(_QWORD))MEMORY[0x1D17E5550](v44);
  objc_msgSend((id)SBApp, "lockOutController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(*(id *)(a1 + 48), "isUILocked"))
  {
    objc_msgSend(*(id *)(a1 + 48), "lockScreenEnvironment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "backlightController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInScreenOffMode:", 0);

    if ((objc_msgSend(v21, "isBlocked") & 1) == 0)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      objc_msgSend(v31, "customActionStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc_init(MEMORY[0x1E0DA9EA0]);
      objc_msgSend(v23, "setIdentifier:", CFSTR("SBUIUserAgent"));
      objc_msgSend(v23, "setRequiresUIUnlock:", 1);
      objc_msgSend(v23, "setCanBypassPinLock:", 0);
      v32[0] = v15;
      v32[1] = 3221225472;
      v32[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_6;
      v32[3] = &unk_1E8EAE5A0;
      v34 = &v40;
      v35 = &v36;
      v33 = v20;
      objc_msgSend(v23, "setAction:", v32);
      objc_msgSend(v30, "setCustomLockScreenActionContext:", v23);
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v24 = objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("SBUIUnlockOptionsBypassPasscodeKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v24, "unlockUIFromSource:withOptions:", 8, v26);

      objc_msgSend(v30, "setCustomLockScreenActionContext:", 0);
      if (*((_BYTE *)v41 + 24))
        LOBYTE(v24) = *((_BYTE *)v37 + 24) != 0;
      v27 = *((_BYTE *)v41 + 24) == 0;

      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
      if (!v27)
      {

        goto LABEL_29;
      }
    }

  }
  if ((objc_msgSend(v21, "isLockedOut") & 1) != 0 || objc_msgSend(*(id *)(a1 + 48), "isUILocked"))
  {
    SBLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2_cold_1(v18, v28);

    LOBYTE(v24) = 0;
  }
  else
  {
    LOBYTE(v24) = v20[2](v20);
  }
LABEL_29:

  return v24 & 1;
}

uint64_t __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", 1, 7);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "applyActivationSettings:");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v3 = (void *)SBApp;
    v4 = *(unsigned __int8 *)(a1 + 73);
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    objc_msgSend(v3, "applicationOpenURL:withApplication:animating:activationSettings:origin:notifyLSOnFailure:withResult:", v2, 0, v4, v5, v6, 1, 0);

  }
  else
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_4;
    v11[3] = &unk_1E8EAE550;
    v9 = *(void **)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    v12 = v9;
    v13 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v8, "requestTransitionWithBuilder:", v11);

  }
  return v7;
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_5;
  v5[3] = &unk_1E8E9ECA8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "modifyApplicationContext:", v5);

}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  -[SBWorkspaceEntity applyActivationSettings:](v4, "applyActivationSettings:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, 1);

}

uint64_t __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_6(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  result = (*(uint64_t (**)(void))(a1[4] + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_45(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    +[SBAssistantController defaultActivationSettings](SBAssistantController, "defaultActivationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_cleanupFromBannerLaunch");
}

- (BOOL)canLaunchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (a4)
    {
LABEL_3:
      v7 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent canLaunchFromSource:withURL:bundleID:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBUserAgent.m"), 410, CFSTR("this call must be made on the main thread"));

    if (a4)
      goto LABEL_3;
  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v10, "applicationWithBundleIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "placeholderForDisplayID:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v13 == 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

LABEL_12:
  return v7;
}

- (BOOL)launchApplicationFromSource:(int)a3 withDisplayID:(id)a4 options:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent launchApplicationFromSource:withDisplayID:options:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBUserAgent.m"), 425, CFSTR("this call must be made on the main thread"));

  }
  v10 = -[SBUserAgent _openApplication:withURL:fromSource:animated:options:](self, "_openApplication:withURL:fromSource:animated:options:", v8, 0, v6, 1, v9);

  return v10;
}

- (BOOL)launchApplicationFromSource:(int)a3 withURL:(id)a4 options:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent launchApplicationFromSource:withURL:options:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBUserAgent.m"), 430, CFSTR("this call must be made on the main thread"));

  }
  v10 = -[SBUserAgent _openApplication:withURL:fromSource:animated:options:](self, "_openApplication:withURL:fromSource:animated:options:", 0, v8, v6, 1, v9);

  return v10;
}

- (BOOL)launchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5 allowUnlock:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  id v11;
  BOOL v12;
  void *v14;
  void *v15;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent launchFromSource:withURL:bundleID:allowUnlock:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBUserAgent.m"), 436, CFSTR("this call must be made on the main thread"));

  }
  v12 = -[SBUserAgent _launchFromSource:withURL:bundleID:allowUnlock:animate:](self, "_launchFromSource:withURL:bundleID:allowUnlock:animate:", v8, v10, v11, v6, 1);

  return v12;
}

- (BOOL)_launchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5 allowUnlock:(BOOL)a6 animate:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;

  v7 = a7;
  v8 = a6;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent _launchFromSource:withURL:bundleID:allowUnlock:animate:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SBUserAgent.m"), 441, CFSTR("this call must be made on the main thread"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x1E0DAC3C8]);

LABEL_6:
  v18 = -[SBUserAgent _openApplication:withURL:fromSource:animated:options:](self, "_openApplication:withURL:fromSource:animated:options:", v13, v12, v10, v7, v14);

  return v18;
}

- (BOOL)isApplicationRestrictedOrHidden:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  if (v3)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "applicationIconForBundleIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isIconVisible:", v6))
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "restrictionController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isApplicationIdentifierRestricted:", v3);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)undimScreen
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent undimScreen]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBUserAgent.m"), 466, CFSTR("this call must be made on the main thread"));

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestUserAttentionScreenWakeFromSource:reason:", 8, CFSTR("SBUserAgent"));

}

- (void)lockAndDimDevice
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent lockAndDimDevice]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBUserAgent.m"), 472, CFSTR("this call must be made on the main thread"));

  }
  -[SBUserAgent lockAndDimDeviceDisconnectingCallIfNecessary:andDimScreen:](self, "lockAndDimDeviceDisconnectingCallIfNecessary:andDimScreen:", 1, 1);
}

- (void)lockAndDimDeviceDisconnectingCallIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent lockAndDimDeviceDisconnectingCallIfNecessary:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 477, CFSTR("this call must be made on the main thread"));

  }
  -[SBUserAgent lockAndDimDeviceDisconnectingCallIfNecessary:andDimScreen:](self, "lockAndDimDeviceDisconnectingCallIfNecessary:andDimScreen:", v3, 1);
}

- (void)lockAndDimDeviceDisconnectingCallIfNecessary:(BOOL)a3 andDimScreen:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) != 0)
  {
    if (v4)
    {
LABEL_3:
      objc_msgSend((id)SBApp, "screenSleepCoordinator");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sleepAndLockUIFromSource:completion:", 8, 0);

      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent lockAndDimDeviceDisconnectingCallIfNecessary:andDimScreen:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 482, CFSTR("this call must be made on the main thread"));

    if (v4)
      goto LABEL_3;
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lockUIFromSource:withOptions:", 8, v9);

}

- (BOOL)isScreenOn
{
  void *v2;
  int v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent isScreenOn]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 497, CFSTR("this call must be made on the main thread"));

  }
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "screenIsOn"))
    v3 = objc_msgSend(v2, "isPendingScreenUnblankAfterCACommit") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  NSMutableDictionary *idleTimerDisableAssertions;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent setIdleTimerDisabled:forReason:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBUserAgent.m"), 506, CFSTR("this call must be made on the main thread"));

  }
  idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  if (v4)
  {
    if (!idleTimerDisableAssertions)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = self->_idleTimerDisableAssertions;
      self->_idleTimerDisableAssertions = v7;

    }
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acquireIdleTimerDisableAssertionForReason:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_idleTimerDisableAssertions, "setObject:forKey:", v10, v15);
  }
  else
  {
    if (!idleTimerDisableAssertions)
      goto LABEL_8;
    -[NSMutableDictionary objectForKey:](idleTimerDisableAssertions, "objectForKey:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11)
    {
      objc_msgSend(v11, "invalidate");
      -[NSMutableDictionary removeObjectForKey:](self->_idleTimerDisableAssertions, "removeObjectForKey:", v15);
      if (!-[NSMutableDictionary count](self->_idleTimerDisableAssertions, "count"))
      {
        v12 = self->_idleTimerDisableAssertions;
        self->_idleTimerDisableAssertions = 0;

      }
    }
  }

LABEL_8:
}

- (BOOL)isIdleTimerDisabledForReason:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  void *v9;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent isIdleTimerDisabledForReason:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBUserAgent.m"), 529, CFSTR("this call must be made on the main thread"));

  }
  -[NSMutableDictionary objectForKey:](self->_idleTimerDisableAssertions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)setBadgeNumberOrString:(id)a3 forApplicationWithID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent setBadgeNumberOrString:forApplicationWithID:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SBUserAgent.m"), 537, CFSTR("this call must be made on the main thread"));

  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWithBundleIdentifier:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setBadgeValue:", v7);
}

- (void)setIdleText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent setIdleText:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBUserAgent.m"), 543, CFSTR("this call must be made on the main thread"));

  }
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleModeText:", v4);

}

- (id)folderNameForDisplayID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderNameForDisplayID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)networkUsageTypeForAppWithDisplayID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent networkUsageTypeForAppWithDisplayID:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBUserAgent.m"), 555, CFSTR("this call must be made on the main thread"));

  }
  SBWorkspaceApplicationForIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dataUsage");

  return v5;
}

- (void)activateModalBulletinAlert:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent activateModalBulletinAlert:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBUserAgent.m"), 564, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v6, "setAllowInCar:", 0);
  objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:", v6);

}

- (void)addActiveInterfaceOrientationObserver:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent addActiveInterfaceOrientationObserver:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBUserAgent.m"), 570, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "addActiveOrientationObserver:", v5);

}

- (void)removeActiveInterfaceOrientationObserver:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent removeActiveInterfaceOrientationObserver:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBUserAgent.m"), 575, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", v5);

}

- (void)setMinimumBacklightLevel:(float)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;

  v4 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent setMinimumBacklightLevel:animated:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 580, CFSTR("this call must be made on the main thread"));

  }
  SBSetMinimumBrightnessLevel(v4);
}

- (void)activateRemoteAlertService:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent activateRemoteAlertService:options:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBUserAgent.m"), 585, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0DAAF78], "definitionWithServiceName:legacyAlertOptions:", v17, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionWithDefinition:options:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DAAF70], "configurationContextWithLegacyAlertOptions:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepareWithConfigurationContext:", v9);
    v10 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    objc_msgSend(v10, "setLegacyAlertOptions:", v5);
    objc_msgSend(v10, "reason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v5, "bs_safeStringForKey:", *MEMORY[0x1E0DAB9F0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setReason:", v12);

    }
    objc_msgSend(v5, "bs_safeNumberForKey:", *MEMORY[0x1E0DAB9D8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v10, "setActivatingForSiri:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v8, "activateWithContext:", v10);

  }
}

- (BOOL)isNamedRemoteAlertServiceActive:(id)a3 controllerClassName:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent isNamedRemoteAlertServiceActive:controllerClassName:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBUserAgent.m"), 608, CFSTR("this call must be made on the main thread"));

  }
  v7 = 0;
  if (v5 && v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", v5, v6);
    objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "existingSessionsWithDefinition:options:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "count") != 0;

  }
  return v7;
}

- (id)localizedDisplayNameForDisplayID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent localizedDisplayNameForDisplayID:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBUserAgent.m"), 617, CFSTR("this call must be made on the main thread"));

  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeholderForDisplayID:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)enableLockScreenBundleNamed:(id)a3 activationContext:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent enableLockScreenBundleNamed:activationContext:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBUserAgent.m"), 629, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInfo:", v6);

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockScreenEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableLockScreenPluginWithContext:", v7);

}

- (void)disableLockScreenBundleNamed:(id)a3 deactivationContext:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent disableLockScreenBundleNamed:deactivationContext:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBUserAgent.m"), 636, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInfo:", v6);

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockScreenEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disableLockScreenPluginWithContext:", v7);

}

- (__CFRunLoop)wifiRunLoopRef
{
  void *v2;
  __CFRunLoop *v3;

  +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFRunLoop *)objc_msgSend(v2, "wifiRunLoopRef");

  return v3;
}

- (BOOL)isInternalInstall
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent isInternalInstall]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBUserAgent.m"), 651, CFSTR("this call must be made on the main thread"));

  }
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  return v3;
}

- (id)topSuspendedEventsOnlyDisplayID
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBUserAgent topSuspendedEventsOnlyDisplayID]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBUserAgent.m"), 660, CFSTR("this call must be made on the main thread"));

  }
  return 0;
}

- (SBIdleTimerPolicyAggregator)_idleTimerPolicyAggregator
{
  return self->_idleTimerPolicyAggregator;
}

- (void)_setIdleTimerPolicyAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerPolicyAggregator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerPolicyAggregator, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, 0);
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "-[SBUserAgent _openApplication:withURL:fromSource:animated:options:]_block_invoke_2";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "%s: Can't open %@ when device is locked, passcode locked or blocked.", (uint8_t *)&v3, 0x16u);
}

@end
