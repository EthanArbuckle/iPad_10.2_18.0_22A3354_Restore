@implementation SBSUIInCallWindowScene

- (SBSUIInCallWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  SBSUIInCallWindowScene *v4;
  SBSUIInCallWindowScene *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBSUIInCallWindowScene;
  v4 = -[SBSUIInCallWindowScene initWithSession:connectionOptions:](&v13, sel_initWithSession_connectionOptions_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SBSUIInCallWindowScene _FBSScene](v4, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_presentationMode = objc_msgSend(v7, "inCallPresentationMode");
    v5->_deviceAttachedToWindowedAccessory = objc_msgSend(v7, "isAttachedToWindowedAccessory");
    objc_msgSend(v7, "windowedAccessoryCutoutFrameInScreen");
    v5->_windowedAccessoryCutoutFrameInScreen.origin.x = v8;
    v5->_windowedAccessoryCutoutFrameInScreen.origin.y = v9;
    v5->_windowedAccessoryCutoutFrameInScreen.size.width = v10;
    v5->_windowedAccessoryCutoutFrameInScreen.size.height = v11;
    -[SBSUIInCallWindowScene _updateValidationStateIfNeededForPresentationMode:](v5, "_updateValidationStateIfNeededForPresentationMode:", v5->_presentationMode);
    if (!-[SBSUIInCallWindowScene isScreenSharingPresentation](v5, "isScreenSharingPresentation"))
      -[SBSUIInCallWindowScene _startObservingSystemApertureSourceConnectNotifications](v5, "_startObservingSystemApertureSourceConnectNotifications");

  }
  return v5;
}

- (void)_invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBSUIInCallWindowScene;
  -[SBSUIInCallWindowScene _invalidate](&v2, sel__invalidate);
  BSDispatchMain();
}

uint64_t __37__SBSUIInCallWindowScene__invalidate__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 488))
    return objc_msgSend(MEMORY[0x1E0DAAEC8], "notePresentationEndForRequestWithIdentifier:");
  return result;
}

- (void)setPreferredHardwareButtonEventTypes:(unint64_t)a3
{
  _QWORD v3[5];

  if (self->_preferredHardwareButtonEventTypes != a3)
  {
    self->_preferredHardwareButtonEventTypes = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__SBSUIInCallWindowScene_setPreferredHardwareButtonEventTypes___block_invoke;
    v3[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v3[4] = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __63__SBSUIInCallWindowScene_setPreferredHardwareButtonEventTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredHardwareButtonEventTypes:", *(_QWORD *)(a1 + 32));
}

- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;
  NSSet *preferredBackgroundActivitiesToSuppress;
  _QWORD v8[4];
  NSSet *v9;

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_preferredBackgroundActivitiesToSuppress != v4)
  {
    v6 = (NSSet *)-[NSSet copy](v4, "copy");
    preferredBackgroundActivitiesToSuppress = self->_preferredBackgroundActivitiesToSuppress;
    self->_preferredBackgroundActivitiesToSuppress = v6;

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__SBSUIInCallWindowScene_setPreferredBackgroundActivitiesToSuppress___block_invoke;
    v8[3] = &unk_1E4C3F058;
    v9 = v5;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v8);

  }
}

uint64_t __69__SBSUIInCallWindowScene_setPreferredBackgroundActivitiesToSuppress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredBackgroundActivitiesToSuppress:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)preferredStatusBarStyleOverridesToSuppress
{
  void *v2;
  unint64_t v3;

  -[SBSUIInCallWindowScene preferredBackgroundActivitiesToSuppress](self, "preferredBackgroundActivitiesToSuppress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)v2);

  return v3;
}

- (void)setPreferredStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  id v4;

  soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUIInCallWindowScene setPreferredBackgroundActivitiesToSuppress:](self, "setPreferredBackgroundActivitiesToSuppress:", v4);

}

- (void)setShouldBecomeVisibleWhenWakingDisplay:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_shouldBecomeVisibleWhenWakingDisplay != a3)
  {
    self->_shouldBecomeVisibleWhenWakingDisplay = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __66__SBSUIInCallWindowScene_setShouldBecomeVisibleWhenWakingDisplay___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v4 = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __66__SBSUIInCallWindowScene_setShouldBecomeVisibleWhenWakingDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldBecomeVisibleWhenWakingDisplay:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setSupportsDeviceLockEvents:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_supportsDeviceLockEvents != a3)
  {
    self->_supportsDeviceLockEvents = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__SBSUIInCallWindowScene_setSupportsDeviceLockEvents___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v4 = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __54__SBSUIInCallWindowScene_setSupportsDeviceLockEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportsDeviceLockActions:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  BOOL v11;

  if (self->_idleTimerDisabled != a3)
  {
    v3 = a3;
    self->_idleTimerDisabled = a3;
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[SBSUIInCallWindowScene session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("SBSUIInCallWindowSceneIdleTimerDisabledReason %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setIdleTimerDisabled:forReason:", v3, v8);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__SBSUIInCallWindowScene_setIdleTimerDisabled___block_invoke;
    v10[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v11 = v3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v10);

  }
}

uint64_t __47__SBSUIInCallWindowScene_setIdleTimerDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleTimerDisabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setPrefersLockedIdleDurationOnCoversheet:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_prefersLockedIdleDurationOnCoversheet != a3)
  {
    self->_prefersLockedIdleDurationOnCoversheet = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67__SBSUIInCallWindowScene_setPrefersLockedIdleDurationOnCoversheet___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v4 = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __67__SBSUIInCallWindowScene_setPrefersLockedIdleDurationOnCoversheet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrefersLockedIdleDurationOnCoversheet:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setCallConnected:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_callConnected != a3)
  {
    self->_callConnected = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43__SBSUIInCallWindowScene_setCallConnected___block_invoke;
    v3[3] = &unk_1E4C3F058;
    v3[4] = self;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __43__SBSUIInCallWindowScene_setCallConnected___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCallConnected:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 509));
}

- (void)setExpanseHUDDodgingInsets:(UIEdgeInsets)a3
{
  _QWORD v6[4];
  UIEdgeInsets v7;

  if (self->_expanseHUDDodgingInsets.left != a3.left
    || self->_expanseHUDDodgingInsets.top != a3.top
    || self->_expanseHUDDodgingInsets.right != a3.right
    || self->_expanseHUDDodgingInsets.bottom != a3.bottom)
  {
    self->_expanseHUDDodgingInsets = a3;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__SBSUIInCallWindowScene_setExpanseHUDDodgingInsets___block_invoke;
    v6[3] = &__block_descriptor_64_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v7 = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v6);
  }
}

uint64_t __53__SBSUIInCallWindowScene_setExpanseHUDDodgingInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setExpanseHUDDodgingInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setPrefersHiddenWhenDismissed:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_prefersHiddenWhenDismissed != a3)
  {
    self->_prefersHiddenWhenDismissed = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__SBSUIInCallWindowScene_setPrefersHiddenWhenDismissed___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v4 = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __56__SBSUIInCallWindowScene_setPrefersHiddenWhenDismissed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrefersHiddenWhenDismissed:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setShouldNeverBeShownWhenLaunchingFaceTime:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_shouldNeverBeShownWhenLaunchingFaceTime != a3)
  {
    self->_shouldNeverBeShownWhenLaunchingFaceTime = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __69__SBSUIInCallWindowScene_setShouldNeverBeShownWhenLaunchingFaceTime___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v4 = a3;
    -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
  }
}

uint64_t __69__SBSUIInCallWindowScene_setShouldNeverBeShownWhenLaunchingFaceTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldNeverBeShownWhenLaunchingFaceTime:", *(unsigned __int8 *)(a1 + 32));
}

- (void)requestTransitionToPresentationMode:(int64_t)a3
{
  -[SBSUIInCallWindowScene requestTransitionToPresentationMode:isUserInitiated:](self, "requestTransitionToPresentationMode:isUserInitiated:", a3, 0);
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4
{
  -[SBSUIInCallWindowScene requestTransitionToPresentationMode:isUserInitiated:analyticsSource:](self, "requestTransitionToPresentationMode:isUserInitiated:analyticsSource:", a3, a4, 0);
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  SBSUIInCallRequestPresentationModeAction *v11;

  v5 = a4;
  v8 = a5;
  v11 = -[SBSUIInCallRequestPresentationModeAction initWithRequestedPresentationMode:isUserInitiated:analyticsSource:responseHandler:]([SBSUIInCallRequestPresentationModeAction alloc], "initWithRequestedPresentationMode:isUserInitiated:analyticsSource:responseHandler:", a3, v5, v8, &__block_literal_global_10);

  -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendActions:", v10);

}

- (void)setPrefersBannersHiddenFromClonedDisplay:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  self->_prefersBannersHiddenFromClonedDisplay = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__SBSUIInCallWindowScene_setPrefersBannersHiddenFromClonedDisplay___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v4 = a3;
  -[SBSUIInCallWindowScene _updateUIClientSettingsWithBlock:](self, "_updateUIClientSettingsWithBlock:", v3);
}

uint64_t __67__SBSUIInCallWindowScene_setPrefersBannersHiddenFromClonedDisplay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrefersBannersHiddenFromClonedDisplay:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)systemControlsShouldPresentAsEmbedded
{
  void *v2;
  void *v3;
  char v4;

  -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "systemControlsShouldPresentAsEmbedded");

  return v4;
}

- (BOOL)isBeingShownAboveCoverSheet
{
  void *v2;
  void *v3;
  char v4;

  -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBeingShownAboveCoverSheet");

  return v4;
}

- (NSUUID)requestedPresentationConfigurationIdentifier
{
  NSUUID **p_requestedPresentationConfigurationIdentifier;
  NSUUID *requestedPresentationConfigurationIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  p_requestedPresentationConfigurationIdentifier = &self->_requestedPresentationConfigurationIdentifier;
  requestedPresentationConfigurationIdentifier = self->_requestedPresentationConfigurationIdentifier;
  if (!requestedPresentationConfigurationIdentifier)
  {
    -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestedPresentationConfigurationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DAAEC8], "identifiersForRequestedPresentations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v6);

      if (v8)
        objc_storeStrong((id *)p_requestedPresentationConfigurationIdentifier, v6);
    }

    requestedPresentationConfigurationIdentifier = *p_requestedPresentationConfigurationIdentifier;
  }
  return requestedPresentationConfigurationIdentifier;
}

- (BOOL)isScreenSharingPresentation
{
  void *v2;
  void *v3;
  char v4;

  -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScreenSharingPresentation");

  return v4;
}

- (BOOL)isAmbientPresented
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getAMUIAmbientPresentationSettingsExtensionClass_softClass;
  v12 = getAMUIAmbientPresentationSettingsExtensionClass_softClass;
  if (!getAMUIAmbientPresentationSettingsExtensionClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke;
    v8[3] = &unk_1E4C3E458;
    v8[4] = &v9;
    __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  if (objc_msgSend(v3, "conformsToExtension:", objc_opt_class())
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v3, "isAmbientPresented");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBUISystemApertureElement)associatedSystemApertureElement
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);
  objc_msgSend(WeakRetained, "systemApertureElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureElement *)v3;
}

- (void)_startObservingSystemApertureSourceConnectNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleSourceDidConnect_, CFSTR("SBUISystemApertureElementSourceDidConnectNotification"), 0);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[SBUISystemApertureElementSource openSources](SBUISystemApertureElementSource, "openSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      -[SBSUIInCallWindowScene _associateWithSourceIfNeeded:](self, "_associateWithSourceIfNeeded:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
      WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);

      if (WeakRetained)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_handleSourceDidConnect:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[SBSUIInCallWindowScene _associateWithSourceIfNeeded:](self, "_associateWithSourceIfNeeded:", v8);
}

- (void)_associateWithSourceIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id obj;

  obj = a3;
  -[SBSUIInCallWindowScene session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    objc_msgSend(obj, "systemApertureElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(obj, "associatedScenePersistenceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);

      if (!WeakRetained)
      {
        objc_storeWeak((id *)&self->_associatedSource, obj);
        -[SBSUIInCallWindowScene delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "inCallWindowSceneSystemApertureElementProvider:", self);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(obj, "setSystemApertureElementViewControllerProvider:", v11);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBUISystemApertureElementSourceDidConnectNotification"), 0);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (id)systemApertureElementViewControllerProvider
{
  void *v3;
  void *v4;

  -[SBSUIInCallWindowScene delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inCallWindowSceneSystemApertureElementProvider:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_handleDeviceLockAction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  SBSUIInCallWindowSceneDeviceLockEvent *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBSUIInCallWindowScene delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    SBLogInCallPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSUIInCallWindowScene session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Handling handleDeviceLockAction for session %{public}@", buf, 0xCu);

    }
    v9 = -[SBSUIInCallWindowSceneDeviceLockEvent initWithSourceType:]([SBSUIInCallWindowSceneDeviceLockEvent alloc], "initWithSourceType:", objc_msgSend(v4, "sourceType"));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__SBSUIInCallWindowScene__handleDeviceLockAction___block_invoke;
    v13[3] = &unk_1E4C3F0C0;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v5, "inCallWindowScene:didReceiveDeviceLockEvent:withResultHandler:", self, v9, v13);

  }
  else
  {
    v9 = -[SBSUIHandleDeviceLockSceneActionResponse initWithDeviceLockHandlingResult:error:]([SBSUIHandleDeviceLockSceneActionResponse alloc], "initWithDeviceLockHandlingResult:error:", 0, 0);
    objc_msgSend(v4, "sendResponse:", v9);
    SBLogInCallPresentation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSUIInCallWindowScene session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "persistentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_DEFAULT, "Declined handleDeviceLockAction because didReceiveDeviceLockEvent is not implemented %{public}@", buf, 0xCu);

    }
  }

}

void __50__SBSUIInCallWindowScene__handleDeviceLockAction___block_invoke(uint64_t a1, unsigned int a2)
{
  SBSUIHandleDeviceLockSceneActionResponse *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = -[SBSUIHandleDeviceLockSceneActionResponse initWithDeviceLockHandlingResult:error:]([SBSUIHandleDeviceLockSceneActionResponse alloc], "initWithDeviceLockHandlingResult:error:", a2, 0);
  SBLogInCallPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2114;
    v10 = v7;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Send deviceLockAction response (didConsume: %{BOOL}u) for session %{public}@", (uint8_t *)v8, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 40), "sendResponse:", v4);

}

- (void)_handleHardwareButtonEventSceneActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  SBSUIInCallWindowSceneHardwareButtonEvent *v12;
  SBSUIHardwareButtonEventSceneActionResponse *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
          v12 = -[SBSUIInCallWindowSceneHardwareButtonEvent initWithButtonEventType:]([SBSUIInCallWindowSceneHardwareButtonEvent alloc], "initWithButtonEventType:", objc_msgSend(v11, "buttonEventType"));
          objc_msgSend(v5, "addObject:", v12);
          v13 = -[SBSUIHardwareButtonEventSceneActionResponse initWithButtonEventHandlingResult:error:]([SBSUIHardwareButtonEventSceneActionResponse alloc], "initWithButtonEventHandlingResult:error:", 0, 0);
          objc_msgSend(v11, "sendResponse:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    -[SBSUIInCallWindowScene delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "inCallWindowScene:didReceiveHardwareButtonEvents:", self, v5);

    v4 = v15;
  }

}

- (void)_updatePresentationMode:(int64_t)a3 analyticsSource:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[SBSUIInCallWindowScene _updateValidationStateIfNeededForPresentationMode:](self, "_updateValidationStateIfNeededForPresentationMode:", a3);
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    if (self->_validationState == 1)
    {
      -[SBSUIInCallWindowScene delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "inCallWindowSceneDidChangePresentationMode:", self);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "inCallWindowScene:didChangePresentationModeWithAnalyticsSource:", self, v7);

    }
  }

}

- (void)_handleFrameChanged
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
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[SBSUIInCallWindowScene _allWindows](self, "_allWindows", 0);
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
          objc_msgSend(v8, "setNeedsLayout");
          objc_msgSend(v8, "layoutIfNeeded");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)_setAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)v13 = x;
    *(double *)&v13[1] = y;
    *(double *)&v13[2] = width;
    *(double *)&v13[3] = height;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v13, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v15 = v8;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_DEFAULT, "Updating scene settings to attachedToWindowedAccessory: %{BOOL}u windowedAccessoryCutoutFrameInScreen: %{public}@", buf, 0x12u);

  }
  if (self->_deviceAttachedToWindowedAccessory != v8
    || (v19.origin.x = x,
        v19.origin.y = y,
        v19.size.width = width,
        v19.size.height = height,
        !CGRectEqualToRect(self->_windowedAccessoryCutoutFrameInScreen, v19)))
  {
    self->_deviceAttachedToWindowedAccessory = v8;
    self->_windowedAccessoryCutoutFrameInScreen.origin.x = x;
    self->_windowedAccessoryCutoutFrameInScreen.origin.y = y;
    self->_windowedAccessoryCutoutFrameInScreen.size.width = width;
    self->_windowedAccessoryCutoutFrameInScreen.size.height = height;
    -[SBSUIInCallWindowScene delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "inCallWindowScene:didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", self, v8, x, y, width, height);

  }
}

- (void)_updateValidationStateIfNeededForPresentationMode:(int64_t)a3
{
  int64_t validationState;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  SBSUIInCallWindowScene *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  validationState = self->_validationState;
  if (!validationState)
  {
    v6 = -[SBSUIInCallWindowScene activationState](self, "activationState");
    if (a3 || v6 != -1)
    {
      -[SBSUIInCallWindowScene _FBSScene](self, "_FBSScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestedPresentationConfigurationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DAAEC8], "identifiersForRequestedPresentations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v9);

      if (v11)
      {
        objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, v9);
        self->_validationState = 1;
        SBLogInCallPresentation();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138543362;
          v17 = self;
          _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_DEFAULT, "Validated scene %{public}@", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        self->_validationState = 2;
        SBLogInCallPresentation();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SBSUIInCallWindowScene _updateValidationStateIfNeededForPresentationMode:].cold.1((uint64_t)self, v8, v12);
      }

    }
    validationState = self->_validationState;
  }
  if (validationState == 2 && !self->_hasRequestedDestructionForInvalidState)
  {
    self->_hasRequestedDestructionForInvalidState = 1;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogInCallPresentation();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = self;
      _os_log_impl(&dword_1A471F000, v14, OS_LOG_TYPE_DEFAULT, "Requesting invalid scene destruction for %{public}@", (uint8_t *)&v16, 0xCu);
    }

    -[SBSUIInCallWindowScene session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "SBSUI_requestInCallSceneSessionDestruction:withReason:analyticsSource:completion:", v15, 3, CFSTR("SBSUIInCallTransitionAnalyticsSourceSceneValidation"), &__block_literal_global_41);

  }
}

- (unint64_t)preferredHardwareButtonEventTypes
{
  return self->_preferredHardwareButtonEventTypes;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return self->_preferredBackgroundActivitiesToSuppress;
}

- (BOOL)supportsDeviceLockEvents
{
  return self->_supportsDeviceLockEvents;
}

- (BOOL)isIdleTimerDisabled
{
  return self->_idleTimerDisabled;
}

- (BOOL)prefersLockedIdleDurationOnCoversheet
{
  return self->_prefersLockedIdleDurationOnCoversheet;
}

- (BOOL)shouldBecomeVisibleWhenWakingDisplay
{
  return self->_shouldBecomeVisibleWhenWakingDisplay;
}

- (BOOL)isCallConnected
{
  return self->_callConnected;
}

- (UIEdgeInsets)expanseHUDDodgingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expanseHUDDodgingInsets.top;
  left = self->_expanseHUDDodgingInsets.left;
  bottom = self->_expanseHUDDodgingInsets.bottom;
  right = self->_expanseHUDDodgingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)prefersHiddenWhenDismissed
{
  return self->_prefersHiddenWhenDismissed;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)isDeviceAttachedToWindowedAccessory
{
  return self->_deviceAttachedToWindowedAccessory;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_windowedAccessoryCutoutFrameInScreen.origin.x;
  y = self->_windowedAccessoryCutoutFrameInScreen.origin.y;
  width = self->_windowedAccessoryCutoutFrameInScreen.size.width;
  height = self->_windowedAccessoryCutoutFrameInScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)prefersBannersHiddenFromClonedDisplay
{
  return self->_prefersBannersHiddenFromClonedDisplay;
}

- (BOOL)shouldNeverBeShownWhenLaunchingFaceTime
{
  return self->_shouldNeverBeShownWhenLaunchingFaceTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBackgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, 0);
  objc_destroyWeak((id *)&self->_associatedSource);
}

- (void)_updateValidationStateIfNeededForPresentationMode:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "requestedPresentationConfigurationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1A471F000, a3, OS_LOG_TYPE_ERROR, "[ICSZombie] Scene %{public}@ is an ICSZombie and should be ignored. requestedPresentationConfigurationIdentifier: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
