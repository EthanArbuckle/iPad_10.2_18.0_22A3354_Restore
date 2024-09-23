@implementation SBCameraActivationManager

- (id)initWithWorkspace:(void *)a3 lockScreenManager:
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  void *v11;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!a1)
    goto LABEL_6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("workspace != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBCameraActivationManager initWithWorkspace:lockScreenManager:].cold.1(sel_initWithWorkspace_lockScreenManager_);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D073A388);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("lockScreenManager != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBCameraActivationManager initWithWorkspace:lockScreenManager:].cold.2(sel_initWithWorkspace_lockScreenManager_);
    goto LABEL_12;
  }
  v12.receiver = a1;
  v12.super_class = (Class)SBCameraActivationManager;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  a1 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
  }
LABEL_6:

  return a1;
}

- (uint64_t)activateCameraWithURL:(unint64_t)a3 fromSource:(void *)a4 completion:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  char v21;
  unsigned __int8 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    SBLogCameraActivation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      SBMainWorkspaceTransitionSourceDescription(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = a1;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) activating camera from source: %{public}@", buf, 0x16u);

    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("camera://"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = *(void **)(a1 + 8);
    v12 = *(id *)(a1 + 16);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke;
    v16[3] = &unk_1E8EA3968;
    v20 = a3;
    v21 = (a3 - 32 < 0x27) & (0x4800000001uLL >> (a3 - 32));
    v18 = a1;
    v19 = v8;
    v17 = v12;
    v13 = v12;
    v14 = v11;
    v22 = SBMainWorkspaceActivateApplicationFromURL(v14, v7, 0, v16);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (uint64_t)workspace
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  char v11;

  v3 = a2;
  objc_msgSend(v3, "setEventLabel:", CFSTR("CameraActivation"));
  objc_msgSend(v3, "setSource:", *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_38);
  if (*(_QWORD *)(a1 + 48))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "willAttemptToHandleTransitionRequest:", v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_4;
    v8[3] = &unk_1E8EA3940;
    v11 = v4;
    v6 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 40);
    v10 = v5;
    v9 = v6;
    v7 = (id)objc_msgSend(v3, "addCompletionHandler:", v8);

  }
}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "applicationSceneEntities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_each:", &__block_literal_global_25_0);

}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  int v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFlag:forActivationSetting:", 1, 35);
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
    v2 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  else
    v2 = 0;
  if ((LCSFeatureEnabled() & 1) != 0 || v2)
    objc_msgSend(v3, "setFlag:forActivationSetting:", 1, 36);

}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_4(uint64_t a1, int a2)
{
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
    v4 = CFSTR("Cover Sheet");
  else
    v4 = CFSTR("Unlocked");
  v5 = v4;
  SBLogCameraActivation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    SBMainWorkspaceTransitionSourceDescription(*(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    v13 = 2114;
    v14 = v8;
    v15 = 1024;
    v16 = a2;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) activated %@ camera from source %{public}@ successfully: %{BOOL}u", (uint8_t *)&v9, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (uint64_t)activateCaptureApplicationWithBundleID:(void *)a3 URL:(unint64_t)a4 fromSource:(void *)a5 withPreludeAnimationToken:(void *)a6 completion:
{
  unint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  SBDeviceApplicationSceneEntity *v21;
  void *v22;
  id v23;
  id v24;
  SBDeviceApplicationSceneEntity *v25;
  void *v27;
  id v28;
  _QWORD v29[4];
  SBDeviceApplicationSceneEntity *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  char v37;
  id v38;
  unsigned __int8 v39;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v28 = a5;
  v13 = a6;
  if (a1)
  {
    if (!(v11 | v12))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("camera://"));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    SBLogCameraActivation();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      SBMainWorkspaceTransitionSourceDescription(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v11;
      v42 = 2114;
      v43 = v12;
      v44 = 2114;
      v45 = v15;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "(Activating capture application \"%{public}@\" (with url: %{public}@) from source: %{public}@", buf, 0x20u);

    }
    v16 = *(id *)(a1 + 8);
    v17 = *(id *)(a1 + 16);
    v27 = (void *)v12;
    if (v11)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applicationWithBundleIdentifier:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0;
    }
    else
    {
      v38 = 0;
      SBWorkspaceApplicationForURLWithError((void *)v12, 0, &v38);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v38;
    }
    v21 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v19);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke;
    v29[3] = &unk_1E8EA3990;
    v37 = (a4 - 32 < 0x27) & (0x4800000001uLL >> (a4 - 32));
    v36 = a4;
    v30 = v21;
    v22 = v28;
    v31 = v28;
    v32 = v20;
    v34 = a1;
    v35 = v13;
    v33 = v17;
    v23 = v17;
    v24 = v20;
    v25 = v21;
    v39 = objc_msgSend(v16, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, 0, v29, &__block_literal_global_41_0);

  }
  else
  {
    v27 = (void *)v12;
    v39 = 0;
    v22 = v28;
  }

  return v39;
}

void __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a2;
  objc_msgSend(v3, "setEventLabel:", CFSTR("CameraCaptureActivation"));
  objc_msgSend(v3, "setSource:", *(_QWORD *)(a1 + 80));
  objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginatingProcess:", v4);

  v5 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 88))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_2;
    v16[3] = &unk_1E8E9ECA8;
    v17 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v3, "modifyApplicationContext:", v16);
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forActivationSetting:", v6, 5);
    objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", 1, 35);
    if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
      v7 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
    else
      v7 = 0;
    if ((LCSFeatureEnabled() & 1) != 0 || v7)
      objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", 1, 36);

  }
  if (*(_QWORD *)(a1 + 72))
  {
    v8 = objc_msgSend(*(id *)(a1 + 56), "willAttemptToHandleTransitionRequest:", v3);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_3;
    v12[3] = &unk_1E8EA3940;
    v15 = v8;
    v10 = *(void **)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 80);
    v12[4] = *(_QWORD *)(a1 + 64);
    v14 = v9;
    v13 = v10;
    v11 = (id)objc_msgSend(v3, "addCompletionHandler:", v12);

  }
}

void __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:](SBConsumableTokenWrapper, "consumableTokenWrapperWithToken:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreludeAnimationTokenWrapper:", v3);

  }
}

void __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_3(uint64_t a1, int a2)
{
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
    v4 = CFSTR("Cover Sheet");
  else
    v4 = CFSTR("Unlocked");
  v5 = v4;
  SBLogCameraActivation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    SBMainWorkspaceTransitionSourceDescription(*(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    v13 = 2114;
    v14 = v8;
    v15 = 1024;
    v16 = a2;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) activated %@ camera from source %{public}@ successfully: %{BOOL}u", (uint8_t *)&v9, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_39()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)initWithWorkspace:(const char *)a1 lockScreenManager:.cold.1(const char *a1)
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

- (void)initWithWorkspace:(const char *)a1 lockScreenManager:.cold.2(const char *a1)
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
