@implementation SBContinuitySessionServiceClient

void __86___SBContinuitySessionServiceClient__connectionQueue_handleLaunchEventOfType_payload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received launch event of type: %{public}@ but we are already invalidated so ignoring!", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received launch event of type: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject continuitySessionServiceClient:handleLaunchEventOfType:payload:](v4, "continuitySessionServiceClient:handleLaunchEventOfType:payload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __82___SBContinuitySessionServiceClient__connectionQueue_handleContinuityButtonEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBUIContinuityButtonEventType();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent button event: %{public}@ but we are already invalidated so ignoring!", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBUIContinuityButtonEventType();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent button event: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject continuitySessionServiceClient:handleContinuityButtonEvent:](v4, "continuitySessionServiceClient:handleContinuityButtonEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __84___SBContinuitySessionServiceClient__connectionQueue_setHostedInterfaceOrientation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] set hosted interface orientation: %{public}@ but we are already invalidated so ignoring", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] set hosted interface orientation: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject continuitySessionServiceClient:setHostedInterfaceOrientation:](v4, "continuitySessionServiceClient:setHostedInterfaceOrientation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __69___SBContinuitySessionServiceClient__connectionQueue_handleActivated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 13))
  {
    SBLogContinuitySessionService();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_SESSION_ACTIVATED", (const char *)&unk_1D0E9B6CB, (uint8_t *)&v11, 2u);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 13) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  SBLogContinuitySessionService();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent activation message but we are already invalidated so ignoring!", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] handling activation message", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "continuitySessionServiceClientDidUpdateExternallyBlockedReasons:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "continuitySessionDidUpdateState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  }
}

void __92___SBContinuitySessionServiceClient__connectionQueue_handleUpdatedExternallyBlockedReasons___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "bs_array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent externally blocked reasons %{public}@ but we are already invalidated so ignoring!", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "bs_array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent externally blocked reasons %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject continuitySessionServiceClientDidUpdateExternallyBlockedReasons:](v4, "continuitySessionServiceClientDidUpdateExternallyBlockedReasons:", *(_QWORD *)(a1 + 32));
  }

}

void __81___SBContinuitySessionServiceClient__connectionQueue_handleHIDServicesConfigured__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished configuring HID services but we are already invalidated so ignoring!", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished configuring HID services", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject continuitySessionServiceClientDidConfigureHIDServices:](v4, "continuitySessionServiceClientDidConfigureHIDServices:", *(_QWORD *)(a1 + 32));
  }

}

void __109___SBContinuitySessionServiceClient__connectionQueue_updatedAppearanceSettings_transitionContext_completion___block_invoke(_QWORD *a1)
{
  id *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v3 = *((unsigned __int8 *)*v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 2);
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      objc_msgSend(*v2, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] updated appearance settings", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*v2, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v10)
    {
      objc_msgSend(v10, "continuitySessionServiceClient:updatedAppearanceSettings:transitionContext:completion:", a1[4], a1[5], a1[6], a1[7]);
    }
    else
    {
      SBLogContinuitySessionService();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __109___SBContinuitySessionServiceClient__connectionQueue_updatedAppearanceSettings_transitionContext_completion___block_invoke_cold_1((uint64_t)v2);

      v12 = a1[7];
      if (v12)
      {
        SBUIContinuitySessionErrorCreate();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      }
    }
    goto LABEL_14;
  }
  if (v5)
  {
    objc_msgSend(*v2, "succinctDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] updated appearance settings but we are already invalidated so ignoring!", (uint8_t *)&v14, 0xCu);

  }
  v7 = a1[7];
  if (v7)
  {
    SBUIContinuitySessionErrorCreate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
LABEL_14:

  }
}

void __74___SBContinuitySessionServiceClient__connectionQueue_didCaptureScreenshot__block_invoke(uint64_t a1)
{
  id *v1;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  SBLogContinuitySessionService();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did capture screenshot but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did capture screenshot", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*v1, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v7)
    {
      -[NSObject continuitySessionServiceClientDidCaptureScreenshot:](v7, "continuitySessionServiceClientDidCaptureScreenshot:", *v1);
    }
    else
    {
      SBLogContinuitySessionService();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __74___SBContinuitySessionServiceClient__connectionQueue_didCaptureScreenshot__block_invoke_cold_1((uint64_t)v1);

    }
  }

}

void __77___SBContinuitySessionServiceClient__connectionQueue_didStartScreenRecording__block_invoke(uint64_t a1)
{
  id *v1;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  SBLogContinuitySessionService();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did start screen recording but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did start screen recording", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*v1, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v7)
    {
      -[NSObject continuitySessionServiceClientDidStartScreenRecording:](v7, "continuitySessionServiceClientDidStartScreenRecording:", *v1);
    }
    else
    {
      SBLogContinuitySessionService();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __77___SBContinuitySessionServiceClient__connectionQueue_didStartScreenRecording__block_invoke_cold_1((uint64_t)v1);

    }
  }

}

void __96___SBContinuitySessionServiceClient__connectionQueue_clientHasAdoptedScreenCaptureNotifications__block_invoke(uint64_t a1)
{
  id *v1;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  SBLogContinuitySessionService();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] client has adopted screen capture notifications but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] client has adopted screen capture notifications", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*v1, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v7)
    {
      -[NSObject continuitySessionServiceClientHasAdoptedScreenCaptureNotifications:](v7, "continuitySessionServiceClientHasAdoptedScreenCaptureNotifications:", *v1);
    }
    else
    {
      SBLogContinuitySessionService();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __96___SBContinuitySessionServiceClient__connectionQueue_clientHasAdoptedScreenCaptureNotifications__block_invoke_cold_1((uint64_t)v1);

    }
  }

}

void __76___SBContinuitySessionServiceClient__connectionQueue_didStopScreenRecording__block_invoke(uint64_t a1)
{
  id *v1;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *((unsigned __int8 *)*v1 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)*v1 + 2);
  SBLogContinuitySessionService();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did stop screen recording but we are already invalidated so ignoring!", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*v1, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did stop screen recording", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*v1, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v7)
    {
      -[NSObject continuitySessionServiceClientDidStopScreenRecording:](v7, "continuitySessionServiceClientDidStopScreenRecording:", *v1);
    }
    else
    {
      SBLogContinuitySessionService();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __76___SBContinuitySessionServiceClient__connectionQueue_didStopScreenRecording__block_invoke_cold_1((uint64_t)v1);

    }
  }

}

uint64_t __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t result;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt:withName:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 20), CFSTR("pid"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 12), CFSTR("INVALIDATED"), 1);
  result = objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle");
  if ((result & 1) == 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 14), CFSTR("suppressingClientCallouts"));
    return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 15), CFSTR("sentDisplayUUID"));
  }
  return result;
}

void __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "externallyBlockedReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("externallyBlockedReasons"));

  v5 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_3;
  v17 = &unk_1E8E9E820;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  v18 = v6;
  v19 = v7;
  objc_msgSend(v6, "appendBodySectionWithName:block:", CFSTR("internalState"), &v14);
  v8 = *(void **)(a1 + 32);
  BSInterfaceOrientationDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("currentInterfaceOrientation"), v14, v15, v16, v17);

  v11 = *(void **)(a1 + 32);
  BSInterfaceOrientationMaskDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, CFSTR("supportedInterfaceOrientations"));

}

void __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  NSStringFromSBContinuitySessionState(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("state"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "bs_array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("stateReasons"));

}

void __109___SBContinuitySessionServiceClient__connectionQueue_updatedAppearanceSettings_transitionContext_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_11(a1), "succinctDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "[%{public}@] updated appearance settings - no delegate", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

void __74___SBContinuitySessionServiceClient__connectionQueue_didCaptureScreenshot__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_11(a1), "succinctDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "[%{public}@] did capture screenshot - no delegate", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

void __77___SBContinuitySessionServiceClient__connectionQueue_didStartScreenRecording__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_11(a1), "succinctDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "[%{public}@] did start screen recording - no delegate", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

void __96___SBContinuitySessionServiceClient__connectionQueue_clientHasAdoptedScreenCaptureNotifications__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_11(a1), "succinctDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "[%{public}@] client has adopted screen capture notifications - no delegate", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

void __76___SBContinuitySessionServiceClient__connectionQueue_didStopScreenRecording__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_11(a1), "succinctDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "[%{public}@] did stop screen recording - no delegate", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

@end
