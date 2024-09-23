@implementation SBPhysicalButtonSceneOverrideManager

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
  -[SBPhysicalButtonSceneOverrideManager _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void)_processZStackParticipantSettings:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "physicalButtonSceneTargets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualArrays();
  if ((v5 & 1) == 0)
    objc_storeStrong((id *)&self->_lastPhysicalButtonSceneTargets, v4);
  objc_msgSend(v7, "captureButtonFullFidelityEventRequestingScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualArrays() & 1) != 0)
  {
    if ((v5 & 1) != 0)
      goto LABEL_8;
  }
  else
  {
    objc_storeStrong((id *)&self->_lastScenesRequestingFullFidelityCaptureButtonEvents, v6);
  }
  -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides]((id *)&self->super.isa);
LABEL_8:

}

- (void)_reevaluateOverrides
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "You must override both volume buttons", buf, 2u);
}

- (BOOL)_canSendVolumeButtonEventsToScene:(id)a3 withConfiguration:(id)a4 activeVolumeCategoryName:(id)a5 isAudioSessionPlaying:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  char v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = 0;
  if (v10 && v11)
  {
    if (!objc_msgSend(v11, "_behavior"))
    {
      v17 = -[SBPhysicalButtonSceneOverrideManager _canSendCameraCaptureFullPressEventsToScene:withConfiguration:](self, "_canSendCameraCaptureFullPressEventsToScene:withConfiguration:", v10, v11);
LABEL_10:
      v13 = v17;
      goto LABEL_11;
    }
    if (objc_msgSend(v11, "_behavior") == 2)
    {
      objc_msgSend(v10, "definition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isLocal");

      if (v16)
        v17 = -[SBVolumeControl canChangeVolumeForActiveCategory:isAudioSessionPlaying:](self->_volumeControl, "canChangeVolumeForActiveCategory:isAudioSessionPlaying:", v12, v6);
      else
        v17 = objc_msgSend(v12, "isEqualToString:", CFSTR("Audio/Video"));
      goto LABEL_10;
    }
    v13 = 1;
  }
LABEL_11:

  return v13;
}

- (id)_sceneForSceneTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (self)
      self = (SBPhysicalButtonSceneOverrideManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
    objc_msgSend(v4, "sceneIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPhysicalButtonSceneOverrideManager allScenes](self, "allScenes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SBPhysicalButtonSceneOverrideManager__sceneForSceneTarget___block_invoke;
    v12[3] = &unk_1E8EB7650;
    v13 = v8;
    v10 = v8;
    objc_msgSend(v9, "bs_firstObjectPassingTest:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_notifyObserversSomethingDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BSCompoundAssertion orderedContext](self->_observers, "orderedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "physicalButtonSceneOverridesDidChange:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)_canSendRingerButtonEventsToScene:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int HasEntitlement;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  LOBYTE(v9) = 0;
  if (v6 && v7)
  {
    objc_msgSend((id)SBApp, "systemActionControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPhysicalButtonSceneOverrideManager _applicationBundleIdentifierForClientBundleIdentifier:](self, "_applicationBundleIdentifierForClientBundleIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[SBSystemActionControl isSelectedActionHostedByApplicationWithBundleIdentifier:]((uint64_t)v10, v13) & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v11, "processHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v14)
    {
      objc_msgSend(v14, "auditToken", 0, 0, 0, 0);
      HasEntitlement = BSAuditTokenTaskHasEntitlement();

      if (HasEntitlement)
      {
LABEL_6:
        if (objc_msgSend(v8, "_behavior"))
          LOBYTE(v9) = 1;
        else
          LOBYTE(v9) = -[SBPhysicalButtonSceneOverrideManager _canSendCameraCaptureFullPressEventsToScene:withConfiguration:](self, "_canSendCameraCaptureFullPressEventsToScene:withConfiguration:", v6, v8);
        goto LABEL_10;
      }
      LOBYTE(v9) = 0;
    }
LABEL_10:

  }
  return (char)v9;
}

- (id)cameraBehaviorScene
{
  SBPhysicalButtonBehaviorRequest **p_volumeUpButtonRequest;
  SBPhysicalButtonBehaviorRequest **p_cameraCaptureButtonRequest;
  SBPhysicalButtonBehaviorRequest *cameraCaptureButtonRequest;
  void *v6;

  p_volumeUpButtonRequest = &self->_volumeUpButtonRequest;
  if (!-[SBPhysicalButtonBehaviorRequest physicalButtonBehavior](self->_volumeUpButtonRequest, "physicalButtonBehavior"))goto LABEL_7;
  p_volumeUpButtonRequest = &self->_volumeDownButtonRequest;
  if (!-[SBPhysicalButtonBehaviorRequest physicalButtonBehavior](self->_volumeDownButtonRequest, "physicalButtonBehavior"))goto LABEL_7;
  p_volumeUpButtonRequest = &self->_ringerButtonRequest;
  if (!-[SBPhysicalButtonBehaviorRequest physicalButtonBehavior](self->_ringerButtonRequest, "physicalButtonBehavior"))
    goto LABEL_7;
  cameraCaptureButtonRequest = self->_cameraCaptureButtonRequest;
  p_cameraCaptureButtonRequest = &self->_cameraCaptureButtonRequest;
  if (!-[SBPhysicalButtonBehaviorRequest physicalButtonBehavior](cameraCaptureButtonRequest, "physicalButtonBehavior"))
  {
    p_volumeUpButtonRequest = p_cameraCaptureButtonRequest;
LABEL_7:
    -[SBPhysicalButtonBehaviorRequest scene](*p_volumeUpButtonRequest, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v6 = 0;
  return v6;
}

- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v4 = a4;
  v8 = *MEMORY[0x1E0C80C00];
  SBLogButtonsInteraction();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Re-evaluating overrides with audioSessionPlaying: %{BOOL}u", (uint8_t *)v7, 8u);
  }

  -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides]((id *)&self->super.isa);
}

- (id)initWithSceneManager:(id *)a1
{
  id v3;
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)SBPhysicalButtonSceneOverrideManager;
    v4 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      objc_msgSend((id)SBApp, "volumeControl");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = a1[4];
      a1[4] = (id)v5;

      +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[5];
      a1[5] = (id)v7;

      objc_msgSend(a1[5], "addObserver:", a1);
      +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[16];
      a1[16] = (id)v9;

      +[SBCameraViewfinderMonitor sharedInstance](SBCameraViewfinderMonitor, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:", a1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[6];
      a1[6] = (id)v12;

      objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", CFSTR("SBPhysicalButtonSceneOverrideManager observers"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[10];
      a1[10] = (id)v14;

      *((_WORD *)a1 + 4) = 257;
    }
  }

  return a1;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "zStackResolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObserver:ofParticipantWithIdentifier:", self, 30);
  v5.receiver = self;
  v5.super_class = (Class)SBPhysicalButtonSceneOverrideManager;
  -[SBPhysicalButtonSceneOverrideManager dealloc](&v5, sel_dealloc);
}

- (id)addObserver:(uint64_t)a3 forReason:
{
  if (a1)
  {
    objc_msgSend(a1[10], "acquireForReason:withContext:", a3, a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)windowSceneDidConnect:(id *)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id obj;

  obj = a2;
  if (!a1)
    goto LABEL_4;
  WeakRetained = objc_loadWeakRetained(a1 + 3);

  if (!WeakRetained)
  {
    objc_storeWeak(a1 + 3, obj);
    objc_msgSend(obj, "zStackResolver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:ofParticipantWithIdentifier:", a1, 30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_processZStackParticipantSettings:", v5);

LABEL_4:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The window scene should only connect once"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBPhysicalButtonSceneOverrideManager windowSceneDidConnect:].cold.1(sel_windowSceneDidConnect_);
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)isTargetingButton:(uint64_t)a3 withConfigurationIdentifier:
{
  void *v4;
  void *v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_activeRequestForButton:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "identifier") == a3;
  else
    v6 = 0;

  return v6;
}

- (char)sendVolumeButtonDownForIncrease:(_BYTE *)a3 shouldAlsoChangeVolume:
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  if (a1)
  {
    if (a2)
      v6 = 1;
    else
      v6 = 2;
    if (!objc_msgSend(a1, "_sendsActionsForButtonType:", v6))
      return (char *)0;
    v7 = 96;
    if (a2)
      v7 = 88;
    v8 = *(id *)&v3[v7];
    objc_msgSend(v8, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a3)
      {
        if (objc_msgSend(v8, "physicalButtonBehavior") == 2)
        {
          objc_msgSend(v9, "definition");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "clientIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *a3 = objc_msgSend(v11, "isLocal") ^ 1;

        }
        else
        {
          *a3 = 0;
        }
      }
      objc_msgSend(v3, "_sendButtonDownForButtonType:request:scene:", v6, v8, v9);
      v3 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)sendRingerButtonDown
{
  id *v1;
  id v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1, "_sendsActionsForButtonType:", 3))
    {
      v2 = v1[14];
      objc_msgSend(v2, "scene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(v1, "_sendButtonDownForButtonType:request:scene:", 3, v2, v3);
        v1 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (id)sendCameraCaptureButtonDown
{
  id *v1;
  id v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v1 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!objc_msgSend(a1, "_sendsActionsForButtonType:", 5))
      return (id *)0;
    v2 = v1[15];
    objc_msgSend(v2, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (objc_msgSend(v1[8], "containsObject:", v3))
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v1 = (id *)-[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:]([SBPhysicalButtonCompletionHandler alloc], v8, 5, &__block_literal_global_266);
        SBLogButtonsInteraction();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          _NSStringFromUIPhysicalButton();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v13 = v10;
          v14 = 2114;
          v15 = v3;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "NOT sending button %{public}@ BSAction to scene %{public}@ since it is already receiving full-fidelity events", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v1, "_sendButtonDownForButtonType:request:scene:", 5, v2, v3);
        v1 = (id *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (id)_sendButtonDownForButtonType:(unint64_t)a3 request:(id)a4 scene:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  SBPhysicalButtonCompletionHandler *v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;

  v8 = a4;
  v9 = a5;
  -[SBPhysicalButtonSceneOverrideManager _sendActionForButtonType:buttonState:request:](self, "_sendActionForButtonType:buttonState:request:", a3, 0, v8);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [SBPhysicalButtonCompletionHandler alloc];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__SBPhysicalButtonSceneOverrideManager__sendButtonDownForButtonType_request_scene___block_invoke;
  v20[3] = &unk_1E8EB7600;
  v20[4] = self;
  v21 = v9;
  v22 = v8;
  v23 = a3;
  v16 = v8;
  v17 = v9;
  v18 = -[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:](v15, v14, a3, v20);
  -[SBCameraHardwareButton setDeferringRuleAssertion:]((uint64_t)v18, v16);
  -[SBPhysicalButtonSceneOverrideManager _addButtonActionCompletionHandler:](self, "_addButtonActionCompletionHandler:", v18);

  return v18;
}

void __83__SBPhysicalButtonSceneOverrideManager__sendButtonDownForButtonType_request_scene___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_removeButtonActionCompletionHandler:", a2);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_sendActionForButtonType:buttonState:request:", *(_QWORD *)(a1 + 56), _UIPhysicalButtonStateFromSBPhysicalButtonResult(a3), *(_QWORD *)(a1 + 48));

}

- (void)cache:(id)a3 didUpdateActiveCategoryName:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogButtonsInteraction();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Re-evaluating overrides with new active volume category: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides]((id *)&self->super.isa);
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
  -[SBPhysicalButtonSceneOverrideManager _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (id)auditTokenForRequestingProcessOfCameraBehaviorScene
{
  void *v3;

  if (-[SBPhysicalButtonBehaviorRequest physicalButtonBehavior](self->_cameraCaptureButtonRequest, "physicalButtonBehavior"))
  {
    v3 = 0;
  }
  else
  {
    -[SBPhysicalButtonBehaviorRequest requestingProcessAuditToken](self->_cameraCaptureButtonRequest, "requestingProcessAuditToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)cameraBehaviorSceneEligibleForSupplementalUI
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[SBPhysicalButtonBehaviorRequest physicalButtonBehavior](self->_cameraCaptureButtonRequest, "physicalButtonBehavior"))
  {
    return 0;
  }
  -[SBPhysicalButtonSceneOverrideManager cameraBehaviorScene](self, "cameraBehaviorScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPhysicalButtonBehaviorRequest scene](self->_cameraCaptureButtonRequest, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    -[SBPhysicalButtonBehaviorRequest requestingProcessAuditToken](self->_cameraCaptureButtonRequest, "requestingProcessAuditToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SBPhysicalButtonSceneOverrideManager _canSendCameraShutterButtonEventsForRequestAuditToken:](self, "_canSendCameraShutterButtonEventsForRequestAuditToken:", v6);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_applicationBundleIdentifierForClientBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[SBFCaptureApplicationProviding captureApplicationForExtensionIdentifier:](self->_captureApplicationProvider, "captureApplicationForExtensionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

uint64_t __60__SBPhysicalButtonSceneOverrideManager__reevaluateOverrides__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

uint64_t __61__SBPhysicalButtonSceneOverrideManager__sceneForSceneTarget___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_canSendCameraCaptureFullPressEventsToScene:(id)a3 withConfiguration:(id)a4
{
  BOOL v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "clientHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_auditToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(self) = -[SBPhysicalButtonSceneOverrideManager _canSendCameraShutterButtonEventsForRequestAuditToken:](self, "_canSendCameraShutterButtonEventsForRequestAuditToken:", v9);
    if ((self & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v8, "processHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v4 = 0;
      if (v10)
      {
        objc_msgSend(v10, "auditToken", 0, 0, 0, 0);
        if ((BSAuditTokenTaskHasEntitlement() & 1) != 0 || BSAuditTokenTaskHasEntitlement())
          v4 = 1;
      }

    }
  }
  return v4;
}

- (BOOL)_canSendCameraShutterButtonEventsForRequestAuditToken:(id)a3
{
  SBCameraViewfinderMonitoring *cameraViewfinderMonitorToken;
  id v4;
  void *v5;
  char v6;

  if (self)
    cameraViewfinderMonitorToken = self->_cameraViewfinderMonitorToken;
  else
    cameraViewfinderMonitorToken = 0;
  v4 = a3;
  -[SBCameraViewfinderMonitoring auditTokenForProcessWithActiveOrImminentViewfinderSession](cameraViewfinderMonitorToken, "auditTokenForProcessWithActiveOrImminentViewfinderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasSameProcessAsAuditToken:", v5);

  return v6;
}

- (id)_activeRequestForButton:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return *(id *)((char *)&self->super.isa + qword_1D0E8AE40[a3 - 1]);
}

- (BOOL)_sendsActionsForButtonType:(unint64_t)a3
{
  BOOL result;

  result = 1;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
      if (!self)
        goto LABEL_4;
      result = self->_sendsPhysicalVolumeButtonActions;
      break;
    case 3uLL:
    case 5uLL:
      return result;
    default:
LABEL_4:
      result = 0;
      break;
  }
  return result;
}

- (void)_addButtonActionCompletionHandler:(id)a3
{
  id v4;
  NSHashTable *buttonActionCompletionHandlers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  buttonActionCompletionHandlers = self->_buttonActionCompletionHandlers;
  v8 = v4;
  if (!buttonActionCompletionHandlers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_buttonActionCompletionHandlers;
    self->_buttonActionCompletionHandlers = v6;

    v4 = v8;
    buttonActionCompletionHandlers = self->_buttonActionCompletionHandlers;
  }
  -[NSHashTable addObject:](buttonActionCompletionHandlers, "addObject:", v4);

}

- (void)_removeButtonActionCompletionHandler:(id)a3
{
  -[NSHashTable removeObject:](self->_buttonActionCompletionHandlers, "removeObject:", a3);
}

- (void)_sendActionForButtonType:(unint64_t)a3 buttonState:(unint64_t)a4 request:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = objc_msgSend(v8, "physicalButtonBehavior");
  objc_msgSend(v8, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
  {
    if ((objc_msgSend(v10, "isValid") & 1) == 0)
    {
      SBLogButtonsInteraction();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        _NSStringFromUIPhysicalButton();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _NSStringFromUIPhysicalButtonState();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        v24 = 2114;
        v25 = v11;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "ignoring send button %{public}@-%{public}@ to invalidated scene %{public}@", (uint8_t *)&v20, 0x20u);

      }
      goto LABEL_9;
    }
  }
  else if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't begin a button-action sequence with a nil scene"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBPhysicalButtonSceneOverrideManager _sendActionForButtonType:buttonState:request:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B3592CLL);
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE48]), "initWithPhysicalButton:behavior:state:generation:completion:", a3, v9, a4, objc_msgSend(v8, "generation"), 0);
  SBLogButtonsInteraction();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringFromUIPhysicalButton();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringFromUIPhysicalButtonState();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "send button %{public}@-%{public}@ to scene %{public}@", (uint8_t *)&v20, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendActions:", v18);

LABEL_9:
}

- (id)setWindowScene:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 3, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureApplicationProvider, 0);
  objc_storeStrong((id *)&self->_cameraCaptureButtonRequest, 0);
  objc_storeStrong((id *)&self->_ringerButtonRequest, 0);
  objc_storeStrong((id *)&self->_lockButtonRequest, 0);
  objc_storeStrong((id *)&self->_volumeDownButtonRequest, 0);
  objc_storeStrong((id *)&self->_volumeUpButtonRequest, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_buttonActionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lastScenesRequestingFullFidelityCaptureButtonEvents, 0);
  objc_storeStrong((id *)&self->_lastPhysicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_cameraViewfinderMonitorToken, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_sceneManager);
}

- (void)windowSceneDidConnect:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_sendActionForButtonType:(const char *)a1 buttonState:request:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
