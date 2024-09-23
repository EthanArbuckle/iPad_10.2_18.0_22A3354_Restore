@implementation SBWidgetController

- (SBWidgetController)init
{
  SBWidgetController *v2;
  WGWidgetDiscoveryController *v3;
  WGWidgetDiscoveryController *widgetDiscoveryController;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBWidgetController;
  v2 = -[SBWidgetController init](&v8, sel_init);
  if (v2)
  {
    v3 = (WGWidgetDiscoveryController *)objc_alloc_init(MEMORY[0x1E0DD9AD0]);
    widgetDiscoveryController = v2->_widgetDiscoveryController;
    v2->_widgetDiscoveryController = v3;

    -[WGWidgetDiscoveryController setDelegate:](v2->_widgetDiscoveryController, "setDelegate:", v2);
    -[WGWidgetDiscoveryController beginDiscovery](v2->_widgetDiscoveryController, "beginDiscovery");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SBWidgetViewControllerPreferencesChangedHandler, CFSTR("com.apple.springboard.widgetViewControllerPrefsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[SBWidgetController _reloadWidgetPreferences](v2, "_reloadWidgetPreferences");
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerHandler:forExtensionPoint:", v2, CFSTR("com.apple.widget-extension"));

  }
  return v2;
}

- (void)_reloadWidgetPreferences
{
  void *v3;
  id v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCenterDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[WGWidgetDiscoveryController setWidgetLoggingEnabled:](self->_widgetDiscoveryController, "setWidgetLoggingEnabled:", objc_msgSend(v4, "isWidgetLoggingEnabled"));
  -[WGWidgetDiscoveryController setWidgetSnapshotTimestampsEnabled:](self->_widgetDiscoveryController, "setWidgetSnapshotTimestampsEnabled:", objc_msgSend(v4, "showWidgetSnapshotDebugLabels"));

}

- (id)newWidgetGroupViewControllerWithSettings:(WGWidgetListSettings)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AD8]), "initWithWidgetDiscoveryController:listSettings:", self->_widgetDiscoveryController, a3.var0, *(_QWORD *)&a3.var1);
}

- (id)newWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AC8]), "initWithWidgetDiscoveryController:", self->_widgetDiscoveryController);
}

- (id)newAvocadoWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3
{
  uint64_t v3;
  unint64_t var0;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AC8]), "initWithWidgetDiscoveryController:", self->_widgetDiscoveryController);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AC0]), "initWithWidgetDiscoveryController:", self->_widgetDiscoveryController);
  objc_msgSend(v8, "setListSettings:", var0, v3);
  return v8;
}

- (void)setBootstrapFavoriteWidgets:(BOOL)a3
{
  -[WGWidgetDiscoveryController setBootstrapFavoriteWidgets:](self->_widgetDiscoveryController, "setBootstrapFavoriteWidgets:", a3);
}

- (BOOL)bootstrapFavoriteWidgets
{
  return -[WGWidgetDiscoveryController bootstrapFavoriteWidgets](self->_widgetDiscoveryController, "bootstrapFavoriteWidgets");
}

- (id)todayWidgetIdentifiers
{
  return (id)-[WGWidgetDiscoveryController todayWidgetIdentifiers](self->_widgetDiscoveryController, "todayWidgetIdentifiers");
}

- (void)removeWidgetIdentifiersFromToday:(id)a3
{
  -[WGWidgetDiscoveryController removeWidgetIdentifiersFromToday:](self->_widgetDiscoveryController, "removeWidgetIdentifiersFromToday:", a3);
}

- (void)widgetDiscoveryController:(id)a3 widgetWithBundleIdentifier:(id)a4 didEncounterProblematicSnapshotAtURL:(id)a5
{
  id v5;
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
  int v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  if (MEMORY[0x1D17E4968]("-[SBWidgetController widgetDiscoveryController:widgetWithBundleIdentifier:didEncounterProblematicSnapshotAtURL:]"))
  {
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBFCachesPathForSandboxPath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("com.apple.springboard"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("badwidgets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formatDateAsLongYMDHMSNoSpacesWithDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    SBEnsureDirectoryExistsAtPath(v13);
    objc_msgSend(v6, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v18 = objc_msgSend(v16, "moveItemAtPath:toPath:error:", v17, v15, &v23);
    v19 = v23;

    SBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543874;
        v25 = v6;
        v26 = 2114;
        v27 = v15;
        v28 = 2114;
        v29 = v19;
        v22 = "Moved potentially bad item from %{public}@ to %{public}@: %{public}@";
LABEL_7:
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_INFO, v22, buf, 0x20u);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 138543874;
      v25 = v6;
      v26 = 2114;
      v27 = v15;
      v28 = 2114;
      v29 = v19;
      v22 = "Failed to move potentially bad item from %{public}@ to %{public}@: %{public}@";
      goto LABEL_7;
    }

  }
}

- (BOOL)_shouldUsePinnedWidgets
{
  return 0;
}

- (BOOL)areWidgetsPinnedForWidgetDiscoveryController:(id)a3
{
  return 0;
}

- (BOOL)shouldShowWidgetsPinningTeachingViewForWidgetDiscoveryController:(id)a3
{
  return 0;
}

- (void)widgetDiscoveryController:(id)a3 requestUnlockWithCompletion:(id)a4
{
  id v4;
  void *v5;
  SBLockScreenUnlockRequest *v6;

  v4 = a4;
  v6 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v6, "setSource:", 4);
  -[SBLockScreenUnlockRequest setIntent:](v6, "setIntent:", 2);
  -[SBLockScreenUnlockRequest setName:](v6, "setName:", CFSTR("SBWidgetController"));
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v6, "setWantsBiometricPresentation:", 1);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlockWithRequest:completion:", v6, v4);

}

- (id)widgetDiscoveryController:(id)a3 preferredViewControllerForPresentingFromViewController:(id)a4
{
  return a4;
}

- (BOOL)widgetDiscoveryController:(id)a3 shouldPurgeArchivedSnapshotsForWidgetWithBundleIdentifier:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D229A8], "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initializationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lastExitReason");

  return (v6 & 0x14) != 0;
}

- (BOOL)didPurgeNonCAMLSnapshotsForWidgetDiscoveryController:(id)a3
{
  void *v3;
  void *v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCenterDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "didPurgeNonCAMLSnapshots");
  objc_msgSend(v4, "setDidPurgeNonCAMLSnapshots:", 1);

  return (char)v3;
}

- (BOOL)didPurgeNonASTCSnapshotsForWidgetDiscoveryController:(id)a3
{
  void *v3;
  void *v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCenterDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "didPurgeNonASTCSnapshots");
  objc_msgSend(v4, "setDidPurgeNonASTCSnapshots:", 1);

  return (char)v3;
}

- (id)statusBarAssertionForWidgetDiscoveryController:(id)a3 legibilityStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  SBMutableStatusBarSettings *v8;
  void *v9;

  +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isStatusBarEffectivelyHidden") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc_init(SBMutableStatusBarSettings);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", a4);
    -[SBMutableStatusBarSettings setLegibilitySettings:](v8, "setLegibilitySettings:", v9);

    -[SBMutableStatusBarSettings setAlpha:](v8, "setAlpha:", &unk_1E91CF688);
    v7 = (void *)objc_msgSend(v6, "newSettingsAssertionWithSettings:atLevel:reason:", v8, 7, CFSTR("WidgetListEditView"));
    objc_msgSend(v7, "acquire");

  }
  return v7;
}

- (void)widgetDiscoveryController:(id)a3 updateStatusBarAssertion:(id)a4 withLegibilityStyle:(int64_t)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__SBWidgetController_widgetDiscoveryController_updateStatusBarAssertion_withLegibilityStyle___block_invoke;
  v8[3] = &__block_descriptor_40_e36_v16__0__SBMutableStatusBarSettings_8l;
  v8[4] = a5;
  objc_msgSend(v7, "modifySettingsWithBlock:", v8);

}

void __93__SBWidgetController_widgetDiscoveryController_updateStatusBarAssertion_withLegibilityStyle___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CEADE8];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithStyle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setLegibilitySettings:", v5);

}

- (void)widgetDiscoveryController:(id)a3 didEndUsingStatusBarAssertion:(id)a4
{
  BOOL v4;
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0;
  v5 = v6;
  if (v4)
    v5 = 0;
  objc_msgSend(v5, "invalidate");

}

- (void)launchExtensionWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBTodayWidgetXCodeDebuggingUtility *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(SBTodayWidgetXCodeDebuggingUtility);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke;
  v15[3] = &unk_1E8EA9668;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[SBTodayWidgetXCodeDebuggingUtility launchTodayViewFromCurrentContextWithCompletion:](v11, "launchTodayViewFromCurrentContextWithCompletion:", v15);

}

void __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke_2;
    v10[3] = &unk_1E8E9F1C0;
    v8 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v7, "debugWidgetWithBundleID:options:completion:", v6, v8, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

uint64_t __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (WGWidgetDiscoveryController)_widgetDiscoveryController
{
  return self->_widgetDiscoveryController;
}

- (void)setWidgetDiscoveryController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetDiscoveryController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDiscoveryController, 0);
}

@end
