@implementation SBMainDisplayPolicyAggregator

- (BOOL)allowsTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "transientOverlayContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend((id)SBApp, "restartManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPendingExit");

    if ((v7 & 1) != 0)
      goto LABEL_15;
  }
  objc_msgSend((id)SBApp, "userSessionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLoginSession");

  if (v9)
  {
    objc_msgSend(v4, "applicationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activatingEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isApplicationSceneEntity"))
    {
      v12 = objc_msgSend(v10, "isBackground");

      if (!v12)
      {
        v14 = 0;
        if (!v5)
        {
LABEL_11:
          if (objc_msgSend(v14, "isLaunchableDuringSetup"))
            goto LABEL_12;

LABEL_15:
          v15 = 0;
          goto LABEL_16;
        }
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v10, "activatingEntity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "application");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    if (!v5)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:
  v17.receiver = self;
  v17.super_class = (Class)SBMainDisplayPolicyAggregator;
  v15 = -[SBPolicyAggregator allowsTransitionRequest:](&v17, sel_allowsTransitionRequest_, v4);
LABEL_16:

  return v15;
}

- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4
{
  BOOL result;

  switch(a3)
  {
    case 1:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilitySuggestedApplicationWithExplanation:](self, "_allowsCapabilitySuggestedApplicationWithExplanation:", a4);
      break;
    case 2:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenBulletinWithExplanation:](self, "_allowsCapabilityLockScreenBulletinWithExplanation:", a4);
      break;
    case 3:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityUnlockToPluginSpecifiedApplicationWithExplanation:](self, "_allowsCapabilityUnlockToPluginSpecifiedApplicationWithExplanation:", a4);
      break;
    case 4:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityAssistantEnabledWithExplanation:](self, "_allowsCapabilityAssistantEnabledWithExplanation:", a4);
      break;
    case 5:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityAssistantWithExplanation:](self, "_allowsCapabilityAssistantWithExplanation:", a4);
      break;
    case 6:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilitySendMediaCommandWithExplanation:](self, "_allowsCapabilitySendMediaCommandWithExplanation:", a4);
      break;
    case 7:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilitySystemGestureWithExplanation:](self, "_allowsCapabilitySystemGestureWithExplanation:", a4);
      break;
    case 8:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityVoiceControlWithExplanation:](self, "_allowsCapabilityVoiceControlWithExplanation:", a4);
      break;
    case 9:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilitySpotlightWithExplanation:](self, "_allowsCapabilitySpotlightWithExplanation:", a4);
      break;
    case 10:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenCameraSupportedWithExplanation:](self, "_allowsCapabilityLockScreenCameraSupportedWithExplanation:", a4);
      break;
    case 11:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenCameraWithExplanation:](self, "_allowsCapabilityLockScreenCameraWithExplanation:", a4);
      break;
    case 12:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityCoverSheetWithExplanation:](self, "_allowsCapabilityCoverSheetWithExplanation:", a4);
      break;
    case 13:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityDismissCoverSheetWithExplanation:](self, "_allowsCapabilityDismissCoverSheetWithExplanation:", a4);
      break;
    case 14:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityControlCenterWithExplanation:](self, "_allowsCapabilityControlCenterWithExplanation:", a4);
      break;
    case 15:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLogoutWithExplanation:](self, "_allowsCapabilityLogoutWithExplanation:", a4);
      break;
    case 16:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLoginWindowWithExplanation:](self, "_allowsCapabilityLoginWindowWithExplanation:", a4);
      break;
    case 17:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityHomeScreenEditingWithExplanation:](self, "_allowsCapabilityHomeScreenEditingWithExplanation:", a4);
      break;
    case 18:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityScreenshotWithExplanation:](self, "_allowsCapabilityScreenshotWithExplanation:", a4);
      break;
    case 19:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityCommandTabWithExplanation:](self, "_allowsCapabilityCommandTabWithExplanation:", a4);
      break;
    case 20:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenControlCenterWithExplanation:](self, "_allowsCapabilityLockScreenControlCenterWithExplanation:", a4);
      break;
    case 21:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenNotificationCenterWithExplanation:](self, "_allowsCapabilityLockScreenNotificationCenterWithExplanation:", a4);
      break;
    case 22:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenTodayViewWithExplanation:](self, "_allowsCapabilityLockScreenTodayViewWithExplanation:", a4);
      break;
    case 23:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityTodayViewWithExplanation:](self, "_allowsCapabilityTodayViewWithExplanation:", a4);
      break;
    case 24:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityLiftToWakeWithExplanation:](self, "_allowsCapabilityLiftToWakeWithExplanation:", a4);
      break;
    case 25:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityQuickNoteWithExplanation:](self, "_allowsCapabilityQuickNoteWithExplanation:", a4);
      break;
    case 26:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityCoverSheetSpotlightWithExplanation:](self, "_allowsCapabilityCoverSheetSpotlightWithExplanation:", a4);
      break;
    case 27:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityPosterSwitcherWithExplanation:](self, "_allowsCapabilityPosterSwitcherWithExplanation:", a4);
      break;
    case 28:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityHardwareButtonBezelEffectsEdgeLight:](self, "_allowsCapabilityHardwareButtonBezelEffectsEdgeLight:", a4);
      break;
    case 29:
      result = -[SBMainDisplayPolicyAggregator _allowsCapabilityControlCenterEditingWithExplanation:](self, "_allowsCapabilityControlCenterEditingWithExplanation:", a4);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)allowsCapability:(int64_t)a3
{
  return -[SBMainDisplayPolicyAggregator allowsCapability:explanation:](self, "allowsCapability:explanation:", a3, 0);
}

- (BOOL)_allowsCapabilityHomeScreenEditingWithExplanation:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowSceneForDisplayIdentity:", self->_displayIdentity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHomeScreenEditingAllowed");

  if (v10)
  {
    objc_msgSend((id)SBApp, "userSessionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "sessionType");

    if (v12 == 2)
    {
      v13 = CFSTR("Not available to ephemeral user sessions");
    }
    else
    {
      -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "restrictionEnforcedHomeScreenLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v13 = CFSTR("Device has enforced home screen layout");
      }
      else if (objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode")
             && (+[SBDefaults externalDefaults](SBDefaults, "externalDefaults"),
                 v18 = (void *)objc_claimAutoreleasedReturnValue(),
                 objc_msgSend(v18, "demoDefaults"),
                 v19 = (void *)objc_claimAutoreleasedReturnValue(),
                 v20 = objc_msgSend(v19, "shouldLockIconsInStoreDemoMode"),
                 v19,
                 v18,
                 (v20 & 1) != 0))
      {
        v13 = CFSTR("Device is in store demo mode");
      }
      else if (v8 == 3)
      {
        v13 = CFSTR("App is open");
      }
      else if ((objc_msgSend(v7, "isInAnyPeekState") & 1) != 0)
      {
        v13 = CFSTR("Peek is showing");
      }
      else if (v8 == 2)
      {
        v13 = CFSTR("App Switcher is open");
      }
      else
      {
        +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "iconManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isShowingPullDownSearchOrTransitioningToVisible");

        if (!v23)
        {
          v16 = 1;
          goto LABEL_9;
        }
        v13 = CFSTR("Spotlight is visible");
      }
    }
  }
  else
  {
    v13 = CFSTR("ManagedConfiguration policy states: no home screen editing");
  }
  v16 = 0;
  if (a3)
    *a3 = v13;
LABEL_9:

  return v16;
}

- (MCProfileConnection)_profileConnection
{
  MCProfileConnection *override_profileConnection;

  override_profileConnection = self->_override_profileConnection;
  if (override_profileConnection)
    return override_profileConnection;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  return (MCProfileConnection *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBMainDisplayPolicyAggregator)initWithDefaults:(id)a3 displayIdentity:(id)a4
{
  id v7;
  id v8;
  SBMainDisplayPolicyAggregator *v9;
  SBMainDisplayPolicyAggregator *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBMainDisplayPolicyAggregator *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SBMainDisplayPolicyAggregator *v20;
  id v21;
  void *v22;
  void *v23;
  SBMainDisplayPolicyAggregator *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  SBMainDisplayPolicyAggregator *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v35;
  id v36;
  _QWORD v37[4];
  SBMainDisplayPolicyAggregator *v38;
  _QWORD v39[4];
  SBMainDisplayPolicyAggregator *v40;
  _QWORD v41[4];
  SBMainDisplayPolicyAggregator *v42;
  _QWORD v43[4];
  SBMainDisplayPolicyAggregator *v44;
  _QWORD v45[4];
  SBMainDisplayPolicyAggregator *v46;
  id v47;
  objc_super v48;

  v7 = a3;
  v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBMainDisplayPolicyAggregator;
  v9 = -[SBMainDisplayPolicyAggregator init](&v48, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaults, a3);
    objc_storeStrong((id *)&v10->_displayIdentity, a4);
    -[SBLocalDefaults demoDefaults](v10->_defaults, "demoDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_storeDemoAppLockEnabled = objc_msgSend(v11, "isStoreDemoApplicationLockEnabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "storeDemoApplicationLockEnabled");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v13 = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke;
    v45[3] = &unk_1E8E9E820;
    v14 = v10;
    v46 = v14;
    v47 = v11;
    v36 = v11;
    v15 = (void *)MEMORY[0x1E0C80D38];
    v16 = (id)objc_msgSend(v36, "observeDefault:onQueue:withBlock:", v12, MEMORY[0x1E0C80D38], v45);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D46EC8];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v13;
    v43[1] = 3221225472;
    v43[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_2;
    v43[3] = &unk_1E8EA1C98;
    v20 = v14;
    v44 = v20;
    v21 = (id)objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v18, 0, v19, v43);

    +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "notesDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickNotesDisabled");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v13;
    v41[1] = 3221225472;
    v41[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_3;
    v41[3] = &unk_1E8E9DED8;
    v24 = v20;
    v42 = v24;
    v25 = (id)objc_msgSend(v35, "observeDefault:onQueue:withBlock:", v23, v15, v41);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0DAA248];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v13;
    v39[1] = 3221225472;
    v39[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_4;
    v39[3] = &unk_1E8EA1C98;
    v29 = v24;
    v40 = v29;
    v30 = (id)objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", v27, 0, v28, v39);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_5;
    v37[3] = &unk_1E8EA1C98;
    v38 = v29;
    v33 = (id)objc_msgSend(v31, "addObserverForName:object:queue:usingBlock:", CFSTR("SBInstalledApplicationsDidChangeNotification"), 0, v32, v37);

  }
  return v10;
}

uint64_t __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "isStoreDemoApplicationLockEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = result;
  return result;
}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __66__SBMainDisplayPolicyAggregator_initWithDefaults_displayIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", CFSTR("com.apple.mobilenotes")) & 1) != 0
    || objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobilenotes")))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), *(_QWORD *)(a1 + 32));

  }
}

- (void)reloadDemoDefaults
{
  id v3;

  -[SBLocalDefaults demoDefaults](self->_defaults, "demoDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_storeDemoAppLockEnabled = objc_msgSend(v3, "isStoreDemoApplicationLockEnabled");

}

- (SBSetupManager)_setupManager
{
  SBSetupManager *override_setupManager;

  override_setupManager = self->_override_setupManager;
  if (override_setupManager)
    return override_setupManager;
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  return (SBSetupManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBAlertItemsController)_alertItemsController
{
  SBAlertItemsController *override_alertItemsController;

  override_alertItemsController = self->_override_alertItemsController;
  if (override_alertItemsController)
    return override_alertItemsController;
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  return (SBAlertItemsController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBApplicationController)_applicationController
{
  SBApplicationController *override_applicationController;

  override_applicationController = self->_override_applicationController;
  if (override_applicationController)
    return override_applicationController;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  return (SBApplicationController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBAssistantController)_assistantController
{
  SBAssistantController *override_assistantController;

  override_assistantController = self->_override_assistantController;
  if (override_assistantController)
    return override_assistantController;
  +[SBAssistantController sharedInstanceIfExists](SBAssistantController, "sharedInstanceIfExists");
  return (SBAssistantController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBCommandTabController)_commandTabController
{
  SBCommandTabController *override_commandTabController;

  override_commandTabController = self->_override_commandTabController;
  if (override_commandTabController)
    return override_commandTabController;
  +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
  return (SBCommandTabController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBConferenceManager)_conferenceManager
{
  SBConferenceManager *override_conferenceManager;

  override_conferenceManager = self->_override_conferenceManager;
  if (override_conferenceManager)
    return override_conferenceManager;
  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  return (SBConferenceManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBRemoteTransientOverlaySessionManager)_remoteTransientOverlaySessionManager
{
  SBRemoteTransientOverlaySessionManager *override_remoteTransientOverlaySessionManager;

  override_remoteTransientOverlaySessionManager = self->_override_remoteTransientOverlaySessionManager;
  if (override_remoteTransientOverlaySessionManager)
    return override_remoteTransientOverlaySessionManager;
  objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
  return (SBRemoteTransientOverlaySessionManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBLockScreenManager)_lockScreenManager
{
  SBLockScreenManager *override_lockScreenManager;

  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
    return override_lockScreenManager;
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  return (SBLockScreenManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBLockStateAggregator)_lockStateAggregator
{
  SBLockStateAggregator *override_lockStateAggregator;

  override_lockStateAggregator = self->_override_lockStateAggregator;
  if (override_lockStateAggregator)
    return override_lockStateAggregator;
  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  return (SBLockStateAggregator *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBTelephonyManager)_telephonyManager
{
  SBTelephonyManager *override_telephonyManager;

  override_telephonyManager = self->_override_telephonyManager;
  if (override_telephonyManager)
    return override_telephonyManager;
  +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 0);
  return (SBTelephonyManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBMainWorkspace)_mainWorkspace
{
  SBMainWorkspace *override_mainWorkspace;

  override_mainWorkspace = self->_override_mainWorkspace;
  if (override_mainWorkspace)
    return override_mainWorkspace;
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  return (SBMainWorkspace *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBBannerManager)_bannerManager
{
  SBBannerManager *override_bannerManager;

  override_bannerManager = self->_override_bannerManager;
  if (override_bannerManager)
    return override_bannerManager;
  objc_msgSend((id)SBApp, "bannerManager");
  return (SBBannerManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_hasFullySetUpUserWithExplanation:(id *)a3
{
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  int v8;
  BOOL result;

  -[SBMainDisplayPolicyAggregator _setupManager](self, "_setupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInSetupMode");

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("In setup mode");
  }
  else
  {
    objc_msgSend((id)SBApp, "userSessionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLoginSession");

    if (!v8)
      return 1;
    v6 = CFSTR("In login session");
  }
  result = 0;
  if (a3)
    *a3 = v6;
  return result;
}

- (BOOL)_allowsCapabilitySuggestedApplicationWithExplanation:(id *)a3
{
  _BOOL4 v5;
  __CFString *v6;
  void *v7;
  int v8;
  BOOL v9;
  id v11;

  v11 = 0;
  v5 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v11);
  v6 = (__CFString *)v11;
  if (v5)
  {
    -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInLostMode");

    if (!v8)
    {
      v9 = 1;
      goto LABEL_8;
    }

    v6 = CFSTR("Device is in lost mode");
  }
  v9 = 0;
  if (a3 && v6)
  {
    v6 = objc_retainAutorelease(v6);
    v9 = 0;
    *a3 = v6;
  }
LABEL_8:

  return v9;
}

- (BOOL)_allowsCapabilityLockScreenBulletinWithExplanation:(id *)a3
{
  BOOL v4;
  id v5;
  BOOL v6;
  int v7;
  id v9;

  v9 = 0;
  v4 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v9);
  v5 = v9;
  if (v4)
  {
    v6 = 1;
  }
  else
  {
    v7 = SUSUIRequiresAlertPresentationAfterUpdate();
    v6 = v7;
    if (a3 && !v7 && v5)
      *a3 = objc_retainAutorelease(v5);
  }

  return v6;
}

- (BOOL)_allowsCapabilityUnlockToPluginSpecifiedApplicationWithExplanation:(id *)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v8);
  v5 = v8;
  v6 = v5;
  if (a3 && !v4 && v5)
    *a3 = objc_retainAutorelease(v5);

  return v4;
}

- (BOOL)_allowsCapabilityAssistantEnabledWithExplanation:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  __CFString *v8;
  _BOOL4 v9;
  void *v10;
  char v11;
  BOOL v12;
  id v14;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "limitFeaturesForRemoteLock");

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("features limited for remote lock");
  }
  else
  {
    v14 = 0;
    v9 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v14);
    v8 = (__CFString *)v14;
    if (v9)
    {
      -[SBMainDisplayPolicyAggregator _assistantController](self, "_assistantController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEnabled");

      if ((v11 & 1) != 0)
      {
        v12 = 1;
        goto LABEL_10;
      }

      v8 = CFSTR("Assistant not supported or disabled");
    }
  }
  v12 = 0;
  if (a3 && v8)
  {
    v8 = objc_retainAutorelease(v8);
    v12 = 0;
    *a3 = v8;
  }
LABEL_10:

  return v12;
}

- (BOOL)_allowsCapabilityAssistantWithExplanation:(id *)a3
{
  _BOOL4 v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  const __CFString *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v26;

  v26 = 0;
  v5 = -[SBMainDisplayPolicyAggregator _allowsCapabilityAssistantEnabledWithExplanation:](self, "_allowsCapabilityAssistantEnabledWithExplanation:", &v26);
  v6 = (__CFString *)v26;
  -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    v13 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v7, "lockScreenEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isMakingEmergencyCall");

  if ((v11 & 1) != 0)
  {
    v12 = CFSTR("Making an emergency call");
LABEL_16:

    v13 = 0;
    v6 = (__CFString *)v12;
    goto LABEL_17;
  }
  if (+[SBVoiceDisabledBundles voiceControlDisabledByCurrentlyRunningApp](SBVoiceDisabledBundles, "voiceControlDisabledByCurrentlyRunningApp"))
  {
    v12 = CFSTR("Voice control disabled by current application");
    goto LABEL_16;
  }
  -[SBMainDisplayPolicyAggregator _remoteTransientOverlaySessionManager](self, "_remoteTransientOverlaySessionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasSessionWithPendingButtonEvents:options:", 1, 0);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Has a remote transient overlay session handling lock button press."));
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[SBMainDisplayPolicyAggregator _alertItemsController](self, "_alertItemsController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasVisibleSuperModalAlert");

  if ((v17 & 1) != 0)
  {
    v12 = CFSTR("Super modal alert visible");
    goto LABEL_16;
  }
  if (objc_msgSend(v8, "isUILocked"))
  {
    objc_msgSend(v8, "coverSheetViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activeBehavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "areRestrictedCapabilities:", 2);

    if ((v20 & 1) != 0)
    {
      v12 = CFSTR("Lock screen has has disabled assistant");
      goto LABEL_16;
    }
  }
  -[SBMainDisplayPolicyAggregator _mainWorkspace](self, "_mainWorkspace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "transientOverlayPresentationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldDisableSiri");

  if (v23)
  {
    v12 = CFSTR("Transient overlay has disabled assistant");
    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:
  objc_msgSend((id)SBApp, "lockOutController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isThermallyBlocked"))
  {

    v13 = 0;
    v6 = CFSTR("Thermal trap has disabled assistant");
  }
  if (objc_msgSend(v24, "isLiquidDetectionCriticalUIBlocked"))
  {

    v13 = 0;
    v6 = CFSTR("Liquid detection critical ui has disabled assistant");
  }
  if (objc_msgSend(v24, "isProximityReaderBlocked"))
  {

    v13 = 0;
    v6 = CFSTR("Proximity reader has disabled assistant");
  }
  if (a3 && !v13 && v6)
    *a3 = objc_retainAutorelease(v6);

  return v13;
}

- (BOOL)_allowsCapabilitySendMediaCommandWithExplanation:(id *)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v8);
  v5 = v8;
  v6 = v5;
  if (a3 && !v4 && v5)
    *a3 = objc_retainAutorelease(v5);

  return v4;
}

- (BOOL)_allowsCapabilitySystemGestureWithExplanation:(id *)a3
{
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  BOOL v10;
  id v12;

  v12 = 0;
  v5 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v12);
  v6 = (__CFString *)v12;
  v7 = v6;
  if (v5)
  {
    if (!self->_storeDemoAppLockEnabled)
    {
LABEL_6:
      v10 = 1;
      goto LABEL_10;
    }

    v7 = CFSTR("We are in store demo app lock mode");
  }
  objc_msgSend(MEMORY[0x1E0D14578], "standardDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldAlwaysBeEnabled");

  if (v9)
  {

    v7 = 0;
    goto LABEL_6;
  }
  v10 = 0;
  if (a3 && v7)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a3 = v7;
  }
LABEL_10:

  return v10;
}

- (BOOL)_allowsCapabilityVoiceControlWithExplanation:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  id v29;

  -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v6 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v29);
  v7 = (__CFString *)v29;
  if (v6)
  {
    if (MGGetBoolAnswer())
    {
      -[SBMainDisplayPolicyAggregator _assistantController](self, "_assistantController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEnabled");

      if ((v9 & 1) != 0)
      {
        v10 = v7;
        v7 = CFSTR("Siri is supported and enabled");
      }
      else
      {
        -[SBLocalDefaults lockScreenDefaults](self->_defaults, "lockScreenDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "limitFeaturesForRemoteLock");

        if ((v14 & 1) != 0)
        {
          v10 = v7;
          v7 = CFSTR("We are disabled for remote lock");
        }
        else if (+[SBVoiceDisabledBundles voiceControlDisabledByCurrentlyRunningApp](SBVoiceDisabledBundles, "voiceControlDisabledByCurrentlyRunningApp"))
        {
          v10 = v7;
          v7 = CFSTR("Disabled by the currently running app");
        }
        else
        {
          -[SBMainDisplayPolicyAggregator _telephonyManager](self, "_telephonyManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "inCall") & 1) != 0 || objc_msgSend(v10, "incomingCallExists"))
          {
            v15 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v10, "inCall");
            NSStringFromBOOL();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "incomingCallExists");
            NSStringFromBOOL();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("We are inCall: %@ incomingCall: %@"), v16, v17);
            v18 = objc_claimAutoreleasedReturnValue();

            v7 = (__CFString *)v18;
          }
          else
          {

            -[SBMainDisplayPolicyAggregator _conferenceManager](self, "_conferenceManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "inFaceTime");

            if ((v20 & 1) != 0)
            {
              v10 = v7;
              v7 = CFSTR("We are in a FaceTime call");
            }
            else
            {
              -[SBMainDisplayPolicyAggregator _alertItemsController](self, "_alertItemsController");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "hasVisibleSuperModalAlert");

              if ((v22 & 1) != 0)
              {
                v10 = v7;
                v7 = CFSTR("Super modal alert visible");
              }
              else if (objc_msgSend(v5, "isUILocked")
                     && (objc_msgSend(v5, "coverSheetViewController"),
                         v23 = (void *)objc_claimAutoreleasedReturnValue(),
                         objc_msgSend(v23, "activeBehavior"),
                         v24 = (void *)objc_claimAutoreleasedReturnValue(),
                         v25 = objc_msgSend(v24, "areRestrictedCapabilities:", 2),
                         v24,
                         v23,
                         (v25 & 1) != 0))
              {
                v10 = v7;
                v7 = CFSTR("Lock screen has has disabled voice control");
              }
              else
              {
                -[SBMainDisplayPolicyAggregator _mainWorkspace](self, "_mainWorkspace");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "transientOverlayPresentationManager");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "shouldDisableSiri");

                if (!v28)
                {
                  v11 = 1;
                  goto LABEL_10;
                }
                v10 = v7;
                v7 = CFSTR("Transient overlay has disabled voice control");
              }
            }
          }
        }
      }
    }
    else
    {
      v10 = v7;
      v7 = CFSTR("MG says the device doesn't have the VC capability");
    }

  }
  v11 = 0;
  if (a3 && v7)
  {
    v7 = objc_retainAutorelease(v7);
    v11 = 0;
    *a3 = v7;
  }
LABEL_10:

  return v11;
}

- (BOOL)_allowsCapabilitySpotlightWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  _BOOL4 v7;
  __CFString *v8;
  id v10;

  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSpotlightAllowed");

  if (v6)
  {
    v10 = 0;
    v7 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v10);
    v8 = (__CFString *)v10;
    if (!a3)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    v8 = CFSTR("ManagedConfiguration policy states: no spotlight");
    if (!a3)
      goto LABEL_8;
  }
  if (!v7 && v8)
    *a3 = objc_retainAutorelease(v8);
LABEL_8:

  return v7;
}

- (BOOL)_allowsCapabilityLockScreenCameraSupportedWithExplanation:(id *)a3
{
  __CFBoolean *hasCameraCapability;
  __CFBoolean *v6;
  int v7;
  _BOOL4 v8;
  __CFString *v9;
  void *v10;
  void *v11;

  hasCameraCapability = self->_hasCameraCapability;
  if (hasCameraCapability)
  {
    v6 = (__CFBoolean *)*MEMORY[0x1E0C9AE50];
  }
  else
  {
    v7 = MGGetBoolAnswer();
    v6 = (__CFBoolean *)*MEMORY[0x1E0C9AE50];
    hasCameraCapability = (__CFBoolean *)*MEMORY[0x1E0C9AE40];
    if (v7)
      hasCameraCapability = (__CFBoolean *)*MEMORY[0x1E0C9AE50];
    self->_hasCameraCapability = hasCameraCapability;
  }
  if (hasCameraCapability != v6)
  {
    v8 = 0;
    v9 = CFSTR("MG says the device doesn't have the camera capability");
    if (!a3)
      return v8;
    goto LABEL_13;
  }
  -[SBMainDisplayPolicyAggregator _applicationController](self, "_applicationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11 != 0;
  if (v11)
    v9 = 0;
  else
    v9 = CFSTR("The device doesn't have Camera.app.");

  if (a3)
  {
LABEL_13:
    if (v9 && !v8)
      *a3 = v9;
  }
  return v8;
}

- (BOOL)_allowsCapabilityLockScreenCameraWithExplanation:(id *)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  char v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  char v17;
  id v19;
  id v21;

  objc_msgSend((id)SBApp, "lockOutController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v5 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v21);
  v19 = v21;
  objc_msgSend((id)SBApp, "userSessionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sessionType");

  v8 = -[SBMainDisplayPolicyAggregator allowsCapability:](self, "allowsCapability:", 10);
  v9 = objc_msgSend(v4, "isBlocked");
  -[SBMainDisplayPolicyAggregator _applicationController](self, "_applicationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "restrictionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isApplicationIdentifierRestricted:", CFSTR("com.apple.camera"));

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend((id)SBApp, "authenticationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasAuthenticatedAtLeastOnceSinceBoot");

  v16 = v5 & ~(v13 | ~v8 | v9);
  if (v7 == 2)
    v16 = 0;
  v17 = v16 & v15;
  if (a3 && (v16 & v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lockScreenCameraSupported: %d, cameraRestricted: %d, currently blocked: %d (thermal blocked: %d), isUserFullySetUp: %d, userSetUpExplanation: \"%@\", ephemeral multi-user: %d"), -[SBMainDisplayPolicyAggregator allowsCapability:](self, "allowsCapability:", 10), v13, v9, objc_msgSend(v4, "isThermallyBlocked"), v5, v19, v7 == 2);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)_allowsNotificationOrControlCenterWithExplanation:(id *)a3
{
  _BOOL4 v5;
  __CFString *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  BOOL v16;
  id v18;

  v18 = 0;
  v5 = -[SBMainDisplayPolicyAggregator _hasFullySetUpUserWithExplanation:](self, "_hasFullySetUpUserWithExplanation:", &v18);
  v6 = (__CFString *)v18;
  if (v5)
  {
    objc_msgSend((id)SBApp, "lockOutController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isBlocked");

    if ((v8 & 1) != 0)
    {
      v9 = CFSTR("Device is blocked");
    }
    else
    {
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasVisibleModalAlert");

      if ((v11 & 1) != 0)
      {
        v9 = CFSTR("A modal alert item is showing");
      }
      else
      {
        -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isInLostMode");

        if ((v13 & 1) != 0)
        {
          v9 = CFSTR("Device is in lost mode");
        }
        else
        {
          -[SBMainDisplayPolicyAggregator _commandTabController](self, "_commandTabController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isVisible");

          if ((v15 & 1) != 0)
          {
            v9 = CFSTR("Command-Tab is visible");
          }
          else
          {
            if (!-[SBMainDisplayPolicyAggregator _dictationInfoOnScreen](self, "_dictationInfoOnScreen"))
            {
              v16 = 1;
              goto LABEL_16;
            }
            v9 = CFSTR("The dictation presentation window is being displayed above CoverSheet");
          }
        }
      }
    }

    v6 = (__CFString *)v9;
  }
  v16 = 0;
  if (a3 && v6)
  {
    v6 = objc_retainAutorelease(v6);
    v16 = 0;
    *a3 = v6;
  }
LABEL_16:

  return v16;
}

- (BOOL)_allowsCapabilityCoverSheetWithExplanation:(id *)a3
{
  _BOOL4 v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  const __CFString *v11;
  void *v12;
  int v13;
  BOOL v14;
  id v16;

  v16 = 0;
  v5 = -[SBMainDisplayPolicyAggregator _allowsNotificationOrControlCenterWithExplanation:](self, "_allowsNotificationOrControlCenterWithExplanation:", &v16);
  v6 = (__CFString *)v16;
  if (v5)
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "windowSceneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowSceneForDisplayIdentity:", self->_displayIdentity);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isDisplayingBannerInWindowScene:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = CFSTR("The banner manager is presenting a banner on the embedded display.");
    }
    else
    {
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "areAnyIconViewContextMenusShowing");

      if (!v13)
      {
        v14 = 1;
        goto LABEL_11;
      }
      v11 = CFSTR("Icon force touch is peeking or showing.");
    }

    v6 = (__CFString *)v11;
  }
  v14 = 0;
  if (a3 && v6)
  {
    v6 = objc_retainAutorelease(v6);
    v14 = 0;
    *a3 = v6;
  }
LABEL_11:

  return v14;
}

- (BOOL)_allowsCapabilityDismissCoverSheetWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  BOOL result;

  -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked");

  if (!v6)
    return 1;
  -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coverSheetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "areRestrictedCapabilities:", 4096) & 1) != 0)
  {
    v10 = CFSTR("Lock screen prevents cover sheet dismiss");
    goto LABEL_6;
  }
  if ((objc_msgSend(v9, "areRestrictedCapabilities:", 56) & 1) == 0)
  {

    return 1;
  }
  v10 = CFSTR("Lock screen prevents unlock");
LABEL_6:

  result = 0;
  if (a3)
    *a3 = v10;
  return result;
}

- (BOOL)_allowsCapabilityControlCenterWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  _BOOL4 v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  BOOL v14;
  id v16;

  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isControlCenterAllowed");

  if (v6)
  {
    v16 = 0;
    v7 = -[SBMainDisplayPolicyAggregator _allowsNotificationOrControlCenterWithExplanation:](self, "_allowsNotificationOrControlCenterWithExplanation:", &v16);
    v8 = (__CFString *)v16;
    if (v7)
    {
      objc_msgSend((id)SBApp, "notificationDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bannerDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPresentingBannerInLongLook");

      if (!v11)
      {
LABEL_8:
        v14 = 1;
        goto LABEL_12;
      }

      v8 = CFSTR("Banner destination is presenting long look");
    }
  }
  else
  {
    v8 = CFSTR("ManagedConfiguration policy states: no control center");
  }
  objc_msgSend(MEMORY[0x1E0D14578], "standardDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldAlwaysBeEnabled");

  if (v13)
  {

    v8 = 0;
    goto LABEL_8;
  }
  v14 = 0;
  if (a3 && v8)
  {
    v8 = objc_retainAutorelease(v8);
    v14 = 0;
    *a3 = v8;
  }
LABEL_12:

  return v14;
}

- (BOOL)_allowsCapabilityLogoutWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  char v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  BOOL result;

  -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInLostMode");

  objc_msgSend((id)SBApp, "userSessionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLoginSession");

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("In login session");
  }
  else
  {
    objc_msgSend((id)SBApp, "userSessionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isMultiUserSupported");

    if (v11)
    {
      -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isInSingleAppMode");

      if (((v13 ^ 1 | v6) & 1) != 0)
        return 1;
      v9 = CFSTR("Device is in Single App Mode");
    }
    else
    {
      v9 = CFSTR("Device not configured for multiuser");
    }
  }
  result = 0;
  if (a3)
    *a3 = v9;
  return result;
}

- (BOOL)_allowsCapabilityLoginWindowWithExplanation:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  BOOL result;
  __CFString *v9;

  objc_msgSend((id)SBApp, "userSessionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMultiUserSupported");

  if (v5)
  {
    objc_msgSend((id)SBApp, "userSessionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLoginSession");

    if ((v7 & 1) != 0)
      return 1;
    v9 = CFSTR("Current session is not a login session");
  }
  else
  {
    v9 = CFSTR("Device not configured for multiuser");
  }
  result = 0;
  if (a3)
    *a3 = v9;
  return result;
}

- (BOOL)_allowsCapabilityControlCenterEditingWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  BOOL result;
  void *v15;
  void *v16;
  int v17;

  objc_msgSend((id)SBApp, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAuthenticatedAtLeastOnceSinceBoot");

  if (v6)
  {
    -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHomeScreenEditingAllowed");

    if (v8)
    {
      objc_msgSend((id)SBApp, "userSessionController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "sessionType");

      if (v10 == 2)
      {
        v11 = CFSTR("Not available to ephemeral user sessions");
      }
      else
      {
        -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "restrictionEnforcedHomeScreenLayout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v11 = CFSTR("Device has enforced home screen layout");
        }
        else
        {
          if (!objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode"))
            return 1;
          +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "demoDefaults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "shouldLockIconsInStoreDemoMode");

          if (!v17)
            return 1;
          v11 = CFSTR("Device is in store demo mode");
        }
      }
    }
    else
    {
      v11 = CFSTR("ManagedConfiguration policy states: no home screen editing");
    }
  }
  else
  {
    v11 = CFSTR("Haven't unlocked the device yet after a reboot.");
  }
  result = 0;
  if (a3)
    *a3 = v11;
  return result;
}

- (BOOL)_allowsCapabilityScreenshotWithExplanation:(id *)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  BOOL v14;
  _QWORD v16[5];

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__SBMainDisplayPolicyAggregator__allowsCapabilityScreenshotWithExplanation___block_invoke;
  v16[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v16[4] = a3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v16, a2);
  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLRestrictionForFeature:", *MEMORY[0x1E0D47148]);

  if (v6 == 2)
  {
    v7 = CFSTR("ManagedConfiguration policy states: no screen shots allowed");
LABEL_10:
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, v7);
    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend((id)SBApp, "userSessionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isLoginSession") & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldAllowScreenshotsInLoginWindow");

    if (!v11)
    {
      v7 = CFSTR("Snapshotting unavailable at the login window.");
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend((id)SBApp, "authenticationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasAuthenticatedAtLeastOnceSinceBoot");

  if ((v13 & 1) == 0)
  {
    v7 = CFSTR("Haven't unlocked the device yet after a reboot.");
    goto LABEL_10;
  }
  v14 = 1;
LABEL_11:

  return v14;
}

_QWORD **__76__SBMainDisplayPolicyAggregator__allowsCapabilityScreenshotWithExplanation___block_invoke(_QWORD **result, id a2)
{
  _QWORD **v2;

  if (result[4])
  {
    v2 = result;
    result = (_QWORD **)objc_retainAutorelease(a2);
    *v2[4] = result;
  }
  return result;
}

- (BOOL)_allowsCapabilityCommandTabWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  char v8;
  __CFString *v9;
  BOOL result;
  void *v11;
  char v12;
  void *v13;
  int v14;

  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCommandTabAllowed");

  if (v6)
  {
    objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isShowingModalAlert");

    if ((v8 & 1) != 0)
    {
      v9 = CFSTR("Can't use command-tab while a mini alert is visible.");
    }
    else
    {
      -[SBMainDisplayPolicyAggregator _lockStateAggregator](self, "_lockStateAggregator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasAnyLockState");

      if ((v12 & 1) != 0)
      {
        v9 = CFSTR("Can't use command-tab while locked.");
      }
      else
      {
        -[SBMainDisplayPolicyAggregator _setupManager](self, "_setupManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isInSetupMode");

        if (!v14)
          return 1;
        v9 = CFSTR("Can't use command-tab while in buddy mode.");
      }
    }
  }
  else
  {
    v9 = CFSTR("ManagedConfiguration policy states: no command-tab allowed");
  }
  result = 0;
  if (a3)
    *a3 = v9;
  return result;
}

- (BOOL)_allowsCapabilityLockScreenControlCenterWithExplanation:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  BOOL result;
  __CFString *v14;

  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isControlCenterAllowed");

  if (v6)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAuthenticated");

    if ((v8 & 1) != 0
      || (-[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isLockScreenControlCenterAllowed"),
          v9,
          v10))
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasAuthenticatedAtLeastOnceSinceBoot");

      if ((v12 & 1) != 0)
        return 1;
      v14 = CFSTR("Haven't unlocked the device yet after a reboot.");
    }
    else
    {
      v14 = CFSTR("ManagedConfiguration policy states: no control center on the lock screen.");
    }
  }
  else
  {
    v14 = CFSTR("ManagedConfiguration policy states: no control center");
  }
  result = 0;
  if (a3)
    *a3 = v14;
  return result;
}

- (BOOL)_allowsCapabilityLockScreenNotificationCenterWithExplanation:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  char v11;
  BOOL result;

  objc_msgSend((id)SBApp, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAuthenticated");

  if ((v6 & 1) != 0
    || (-[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470A0]),
        v7,
        v8 != 2))
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasAuthenticatedAtLeastOnceSinceBoot");

    if ((v11 & 1) != 0)
      return 1;
    v9 = CFSTR("Haven't unlocked the device yet after a reboot.");
  }
  else
  {
    v9 = CFSTR("ManagedConfiguration policy states: no notifications view on the lock screen.");
  }
  result = 0;
  if (a3)
    *a3 = v9;
  return result;
}

- (BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v5 = -[SBMainDisplayPolicyAggregator _allowsCapabilityTodayViewWithExplanation:](self, "_allowsCapabilityTodayViewWithExplanation:");
  if (v5)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAuthenticated");

    if ((v7 & 1) != 0
      || (-[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470A8]),
          v8,
          v9 != 2))
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasAuthenticatedAtLeastOnceSinceBoot");

      if (v12)
      {
        objc_msgSend((id)SBApp, "userSessionController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "sessionType");

        if (v14 != 2)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        v10 = CFSTR("No today view on shared iPad.");
      }
      else
      {
        v10 = CFSTR("Haven't unlocked the device yet after a reboot.");
      }
    }
    else
    {
      v10 = CFSTR("ManagedConfiguration policy states: no today view on the lock screen.");
    }
    LOBYTE(v5) = 0;
    if (a3)
      *a3 = v10;
  }
  return v5;
}

- (BOOL)_allowsCapabilityTodayViewWithExplanation:(id *)a3
{
  void *v4;
  int v5;

  -[SBMainDisplayPolicyAggregator _profileConnection](self, "_profileConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47180]);

  if (v5 == 2 && a3 != 0)
    *a3 = CFSTR("ManagedConfiguration policy states: no today view.");
  return v5 != 2;
}

- (BOOL)_allowsCapabilityLiftToWakeWithExplanation:(id *)a3
{
  void *v4;
  int v5;

  -[SBMainDisplayPolicyAggregator _lockScreenManager](self, "_lockScreenManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInLostMode");

  if (a3 && v5)
    *a3 = CFSTR("Device is in lost mode");
  return v5 ^ 1;
}

- (BOOL)_allowsCapabilityQuickNoteWithExplanation:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notesDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "quickNotesDisabled");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("Disabled by Notes pref.");
    if (!a3)
      return v7;
    goto LABEL_15;
  }
  if (!MGGetBoolAnswer())
  {
    v7 = 0;
    v8 = CFSTR("Device does not support stylus.");
    if (!a3)
      return v7;
    goto LABEL_15;
  }
  objc_msgSend((id)SBApp, "authenticationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasAuthenticatedAtLeastOnceSinceBoot");

  if (!v10)
  {
    v7 = 0;
    v8 = CFSTR("Haven't unlocked the device yet after a reboot.");
    if (!a3)
      return v7;
    goto LABEL_15;
  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notesApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !objc_msgSend(v12, "isUninstalled"))
  {
    v8 = 0;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v8 = CFSTR("Notes app is uninstalled.");
  }

  if (a3)
  {
LABEL_15:
    if (v8 && !v7)
      *a3 = v8;
  }
  return v7;
}

- (BOOL)_allowsCapabilityCoverSheetSpotlightWithExplanation:(id *)a3
{
  int v5;
  BOOL v6;
  BOOL v7;
  __CFString *v8;

  v5 = _os_feature_enabled_impl();
  v6 = -[SBMainDisplayPolicyAggregator _allowsCapabilitySpotlightWithExplanation:](self, "_allowsCapabilitySpotlightWithExplanation:", a3);
  v7 = -[SBMainDisplayPolicyAggregator _allowsCapabilityLockScreenTodayViewWithExplanation:](self, "_allowsCapabilityLockScreenTodayViewWithExplanation:", a3);
  if (a3 && (v5 & 1) == 0)
  {
    v8 = CFSTR("Feature not enabled.");
    if (v5)
      v8 = 0;
    *a3 = v8;
  }
  return v7 & v5 & v6;
}

- (BOOL)_allowsCapabilityPosterSwitcherWithExplanation:(id *)a3
{
  __CFString *v4;
  BOOL result;

  if (CSAutobahnEnabledForPlatform())
  {
    if (!SBGuidedAccessIsActive())
      return 1;
    v4 = CFSTR("Guided access is active.");
  }
  else
  {
    v4 = CFSTR("Feature not enabled.");
  }
  result = 0;
  if (a3)
    *a3 = v4;
  return result;
}

- (BOOL)_dictationInfoOnScreen
{
  int v2;
  uint64_t state64;

  v2 = _dictationInfoOnScreen_token;
  if (_dictationInfoOnScreen_token == -1)
  {
    notify_register_check((const char *)*MEMORY[0x1E0CEB810], &_dictationInfoOnScreen_token);
    v2 = _dictationInfoOnScreen_token;
  }
  state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

- (void)_setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_override_profileConnection, a3);
}

- (void)_setSetupManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_setupManager, a3);
}

- (void)_setAlertItemsController:(id)a3
{
  objc_storeStrong((id *)&self->_override_alertItemsController, a3);
}

- (void)_setApplicationController:(id)a3
{
  objc_storeStrong((id *)&self->_override_applicationController, a3);
}

- (void)_setAssistantController:(id)a3
{
  objc_storeStrong((id *)&self->_override_assistantController, a3);
}

- (void)_setCommandTabController:(id)a3
{
  objc_storeStrong((id *)&self->_override_commandTabController, a3);
}

- (void)_setConferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_conferenceManager, a3);
}

- (void)_setRemoteTransientOverlaySessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_remoteTransientOverlaySessionManager, a3);
}

- (void)_setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_lockScreenManager, a3);
}

- (void)_setLockStateAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_override_lockStateAggregator, a3);
}

- (void)_setTelephonyManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_telephonyManager, a3);
}

- (void)_setMainWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_override_mainWorkspace, a3);
}

- (void)_setBannerManager:(id)a3
{
  objc_storeStrong((id *)&self->_override_bannerManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_override_bannerManager, 0);
  objc_storeStrong((id *)&self->_override_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_override_telephonyManager, 0);
  objc_storeStrong((id *)&self->_override_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_remoteTransientOverlaySessionManager, 0);
  objc_storeStrong((id *)&self->_override_conferenceManager, 0);
  objc_storeStrong((id *)&self->_override_commandTabController, 0);
  objc_storeStrong((id *)&self->_override_assistantController, 0);
  objc_storeStrong((id *)&self->_override_applicationController, 0);
  objc_storeStrong((id *)&self->_override_alertItemsController, 0);
  objc_storeStrong((id *)&self->_override_setupManager, 0);
  objc_storeStrong((id *)&self->_override_profileConnection, 0);
}

@end
