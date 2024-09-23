@implementation SBAppIntentsCoordinator

- (id)initWithClientCoordinator:(void *)a3 cameraActivationManager:(void *)a4 flashlightActivityManager:(void *)a5 focusActivityManager:(void *)a6 ringerControl:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v29 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (a1)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clientCoordinator != ((void *)0)"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.1();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AB0B54);
    }
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("cameraActivationManager != ((void *)0)"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.2();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AB0BBCLL);
    }
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("flashlightActivityManager != ((void *)0)"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.3();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AB0C24);
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("focusActivityManager != ((void *)0)"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.4();
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AB0C8CLL);
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("ringerControl != ((void *)0)"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBAppIntentsCoordinator initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:].cold.5();
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AB0CF4);
    }
    v30.receiver = a1;
    v30.super_class = (Class)SBAppIntentsCoordinator;
    v17 = (id *)objc_msgSendSuper2(&v30, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 2, a2);
      objc_msgSend(v12, "setDelegate:", a1);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      objc_storeStrong(a1 + 5, a5);
      objc_storeStrong(a1 + 6, a6);
      objc_msgSend(CFSTR("com.apple.springboard"), "stringByAppendingFormat:", CFSTR(".%@"), *MEMORY[0x1E0DAACC8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      objc_msgSend(CFSTR("com.apple.springboard"), "stringByAppendingFormat:", CFSTR(".%@"), *MEMORY[0x1E0DAACB8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0DC82A8];
      v31[1] = v19;
      v31[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = a1[1];
      a1[1] = (id)v21;

    }
  }

  return a1;
}

- (BOOL)providesPreviewForActionWithIdentifier:(id)a3
{
  return -[NSArray containsObject:](self->_allPreviewingActionIdentifiers, "containsObject:", a3);
}

- (id)showPreviewForAction:(id)a3 withContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  SBFlashlightActivityManager *flashlightActivityManager;
  uint64_t v9;
  void *v10;
  SBFocusActivityManager *focusActivityManager;
  SBFocusActivityManager *v12;
  void *v13;
  void *v14;
  SBRingerControl *ringerControl;

  objc_msgSend(a3, "configuredAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppIntentsCoordinator _previewReasonForActionIdentifier:](self, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasSuffix:", *MEMORY[0x1E0DAACC8]))
  {
    if (self)
      flashlightActivityManager = self->_flashlightActivityManager;
    else
      flashlightActivityManager = 0;
    -[SBFlashlightActivityManager previewFlashlightActivityForReason:]((uint64_t)flashlightActivityManager, v7);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_15;
  }
  if (!objc_msgSend(v6, "hasSuffix:", *MEMORY[0x1E0DAACB8]))
  {
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC82A8]))
    {
      v10 = 0;
      goto LABEL_15;
    }
    if (self)
      ringerControl = self->_ringerControl;
    else
      ringerControl = 0;
    -[SBRingerControl previewRingerStateForReason:](ringerControl, "previewRingerStateForReason:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (self)
    focusActivityManager = self->_focusActivityManager;
  else
    focusActivityManager = 0;
  v12 = focusActivityManager;
  objc_msgSend(v5, "sb_configuredIntentAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFocusActivityManager previewFocusWithModeIdentifier:withReason:]((uint64_t)v12, v14, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v10;
}

- (id)_previewReasonForActionIdentifier:(void *)a1
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Action Preview"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)soundForPerformingActionWithIdentifier:(id)a3
{
  SBRingerControl *ringerControl;
  SBRingerControl *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0DC82A8]))
  {
    if (self)
      ringerControl = self->_ringerControl;
    else
      ringerControl = 0;
    v5 = ringerControl;
    -[SBRingerControl soundForRingerMuted:](v5, "soundForRingerMuted:", -[SBRingerControl isRingerMuted]((uint64_t)v5) ^ 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)systemActionDataSource:(id)a3 overrideActionForAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  SBRingerControl *v18;
  SBRingerControl *ringerControl;
  _QWORD v20[4];
  SBRingerControl *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26[3];
  void *v27;
  void *v28;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "configuredAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Camera")))
  {
    v27 = 0;
    v28 = 0;
    objc_msgSend(v8, "sb_configuredIntentAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredStaccatoIntentAction sb_getCameraCaptureMode:andCaptureDevice:](v11, (uint64_t *)&v28, &v27);

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke;
    v25[3] = &unk_1E8EB5428;
    v26[1] = v27;
    v26[2] = v28;
    v12 = v26;
    objc_copyWeak(v26, &location);
    +[SBBlockSystemAction localActionWithConfiguredAction:instanceIdentity:actionBlock:]((uint64_t)SBBlockSystemAction, v8, v10, v25);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    objc_destroyWeak(v12);
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Flashlight")))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_2;
    v23[3] = &unk_1E8EB5450;
    v12 = &v24;
    objc_copyWeak(&v24, &location);
    +[SBBlockSystemAction localActionWithConfiguredAction:instanceIdentity:actionBlock:]((uint64_t)SBBlockSystemAction, v8, v10, v23);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Focus")))
  {
    objc_msgSend(v8, "sb_configuredIntentAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_3;
    v20[3] = &unk_1E8EB5478;
    v18 = v17;
    v21 = v18;
    objc_copyWeak(&v22, &location);
    +[SBBlockSystemAction localActionWithConfiguredAction:instanceIdentity:actionBlock:]((uint64_t)SBBlockSystemAction, v8, v10, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v22);

  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("SilentMode")))
    {
      v14 = 0;
      goto LABEL_6;
    }
    if (self)
      ringerControl = self->_ringerControl;
    else
      ringerControl = 0;
    v18 = ringerControl;
    +[SBBlockSystemAction toggleSilentModeActionWithRingerControl:instanceIdentity:name:]((uint64_t)SBBlockSystemAction, v18, v10, CFSTR("Local"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  objc_destroyWeak(&location);

  return v14;
}

void __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0DAACB0];
  v6 = a3;
  v7 = a2;
  v9 = (id)objc_msgSend([v5 alloc], "initWithCaptureDevice:captureMode:systemContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAppIntentsCoordinator _performAppIntent:locallyWithCompletion:]((uint64_t)WeakRetained, v9, v6);

}

- (void)_performAppIntent:(void *)a3 locallyWithCompletion:
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SBAppIntentsCoordinator__performAppIntent_locallyWithCompletion___block_invoke;
    v7[3] = &unk_1E8E9F1C0;
    v8 = v5;
    -[SBAppIntentsCoordinator _performAppIntent:withCompletion:](a1, a2, v7);

  }
}

void __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0DAAC90];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  v10 = (id)objc_msgSend(v8, "initWithIdentifier:systemContext:", *MEMORY[0x1E0DAACC8], v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAppIntentsCoordinator _performAppIntent:locallyWithCompletion:]((uint64_t)WeakRetained, v10, v6);

}

void __74__SBAppIntentsCoordinator_systemActionDataSource_overrideActionForAction___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0DAACA8];
  v6 = a3;
  v7 = a2;
  v9 = (id)objc_msgSend([v5 alloc], "initWithModeIdentifier:systemContext:", *(_QWORD *)(a1 + 32), v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBAppIntentsCoordinator _performAppIntent:locallyWithCompletion:]((uint64_t)WeakRetained, v9, v6);

}

- (void)appIntentsCoordinator:(id)a3 performAppIntent:(id)a4 withCompletion:(id)a5
{
  -[SBAppIntentsCoordinator _performAppIntent:withCompletion:]((uint64_t)self, a4, a5);
}

- (void)_performAppIntent:(void *)a3 withCompletion:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(v9, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAACC0]))
    {
      -[SBAppIntentsCoordinator _performOpenCameraAppIntent:withCompletion:](a1, v9, v5);
LABEL_10:

      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAACC8]))
    {
      v7 = -[SBAppIntentsCoordinator _performToggleFlashlightAppIntent:](a1, v9);
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAACB8]))
      {
        v8 = 0;
        if (!v5)
          goto LABEL_10;
        goto LABEL_9;
      }
      v7 = -[SBAppIntentsCoordinator _performFocusAppIntent:](a1, v9);
    }
    v8 = v7;
    if (!v5)
      goto LABEL_10;
LABEL_9:
    (*((void (**)(id, uint64_t))v5 + 2))(v5, v8);
    goto LABEL_10;
  }
LABEL_11:

}

void __67__SBAppIntentsCoordinator__performAppIntent_locallyWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    SBSystemActionExecutionErrorCreate(0, CFSTR("Local action failed"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (uint64_t)_performOpenCameraAppIntent:(void *)a3 withCompletion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    objc_msgSend(v6, "captureDevice");
    NSStringFromSBINCameraCaptureDevice();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captureMode");
    NSStringFromSBINCameraCaptureMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSURLForCameraActivationWithCaptureConfiguration(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(id *)(a1 + 24);
    v12 = objc_msgSend(v10, "actionSource");
    v13 = 67;
    if (v12 != 1)
      v13 = 0;
    if (v12 == 2)
      v14 = 13;
    else
      v14 = v13;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__SBAppIntentsCoordinator__performOpenCameraAppIntent_withCompletion___block_invoke;
    v16[3] = &unk_1E8EA4988;
    v17 = v5;
    a1 = -[SBCameraActivationManager activateCaptureApplicationWithBundleID:URL:fromSource:withPreludeAnimationToken:completion:]((uint64_t)v11, 0, v9, v14, 0, v16);

  }
  return a1;
}

- (uint64_t)_performToggleFlashlightAppIntent:(uint64_t)result
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 32);
    -[SBAppIntentsCoordinator _actionReasonForAppIntent:](v3, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBFlashlightActivityManager toggleFlashlightForReason:]((uint64_t)v4, v5);

    return v6;
  }
  return result;
}

- (uint64_t)_performFocusAppIntent:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v3, "modeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAACD0]))
    {
      a1 = -[SBFocusActivityManager toggleActivityPickerPresentation]((uint64_t)v4);
    }
    else
    {
      -[SBAppIntentsCoordinator _actionReasonForAppIntent:](a1, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = -[SBFocusActivityManager toggleFocusWithModeIdentifier:withReason:]((uint64_t)v4, v5, v6);

    }
  }

  return a1;
}

uint64_t __70__SBAppIntentsCoordinator__performOpenCameraAppIntent_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)_actionReasonForAppIntent:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ App Intent"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_focusActivityManager, 0);
  objc_storeStrong((id *)&self->_flashlightActivityManager, 0);
  objc_storeStrong((id *)&self->_cameraActivationManager, 0);
  objc_storeStrong((id *)&self->_clientCoordinator, 0);
  objc_storeStrong((id *)&self->_allPreviewingActionIdentifiers, 0);
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithClientCoordinator:cameraActivationManager:flashlightActivityManager:focusActivityManager:ringerControl:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
