@implementation SBAudioRecordingManager

- (void)setNowRecordingAppForActiveAudioRecordingAttributions:(id)a3 callDescriptors:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  SBApplication *nowRecordingApplication;
  void *v19;
  id obj;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applicationWithBundleIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[SBAudioRecordingManager _callProviderAttributionExistsForAttribution:callDescriptors:](self, "_callProviderAttributionExistsForAttribution:callDescriptors:", v11, v7))
        {

        }
        else if (v14)
        {
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }
  v14 = 0;
LABEL_12:

  v15 = BSEqualObjects();
  if (v14)
  {
    objc_storeStrong((id *)&self->_nowRecordingApplication, v14);
    objc_msgSend(v14, "setNowRecordingApplication:", 1);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__SBAudioRecordingManager_setNowRecordingAppForActiveAudioRecordingAttributions_callDescriptors___block_invoke;
    v21[3] = &unk_1E8EBE5D0;
    v17 = v14;
    v22 = v17;
    v23 = &v24;
    objc_msgSend(v16, "enumerateSceneManagersWithBlock:", v21);

    if (*((_BYTE *)v25 + 24))
      -[SBAudioRecordingManager _verifyBackgroundAudioActivityForApplication:withDelay:](self, "_verifyBackgroundAudioActivityForApplication:withDelay:", v17, 1);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    -[SBApplication setNowRecordingApplication:](self->_nowRecordingApplication, "setNowRecordingApplication:", 0);
    nowRecordingApplication = self->_nowRecordingApplication;
    self->_nowRecordingApplication = 0;

    -[SBAudioRecordingManager _removeBackgroundActivityAssertion](self, "_removeBackgroundActivityAssertion");
  }
  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("SBNowRecordingAppDidChangeNotification"), self);

  }
}

- (void)_removeBackgroundActivityAssertion
{
  SBSBackgroundActivityAssertion *backgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v4;

  backgroundActivityAssertion = self->_backgroundActivityAssertion;
  if (backgroundActivityAssertion)
  {
    -[SBSBackgroundActivityAssertion invalidate](backgroundActivityAssertion, "invalidate");
    v4 = self->_backgroundActivityAssertion;
    self->_backgroundActivityAssertion = 0;

  }
}

- (BOOL)_callProviderAttributionExistsForAttribution:(id)a3 callDescriptors:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  SBActivityAttribution *v13;
  void *v14;
  SBActivityAttribution *v15;
  int v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = [SBActivityAttribution alloc];
        objc_msgSend(v12, "callProviderAttribution", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[SBActivityAttribution initWithSTActivityAttribution:](v13, "initWithSTActivityAttribution:", v14);

        if (v15)
        {
          v16 = -[SBAudioRecordingManager _pidForAttribution:](self, "_pidForAttribution:", v6);
          if (v16 == -[SBAudioRecordingManager _pidForAttribution:](self, "_pidForAttribution:", v15))
          {

            v17 = 1;
            goto LABEL_12;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

void __97__SBAudioRecordingManager_setNowRecordingAppForActiveAudioRecordingAttributions_callDescriptors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a2, "externalForegroundApplicationSceneHandles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "application");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

        if (v9)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (SBApplication)nowRecordingApplication
{
  return self->_nowRecordingApplication;
}

- (SBAudioRecordingManager)init
{
  SBAudioRecordingManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAudioRecordingManager;
  v2 = -[SBAudioRecordingManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__coverSheetDidPresent_, CFSTR("SBCoverSheetDidPresentNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBAudioRecordingManager;
  -[SBAudioRecordingManager dealloc](&v4, sel_dealloc);
}

- (void)verifyBackgroundAudioActivityForApplication:(id)a3
{
  -[SBAudioRecordingManager _verifyBackgroundAudioActivityForApplication:withDelay:](self, "_verifyBackgroundAudioActivityForApplication:withDelay:", a3, 1);
}

- (void)_verifyBackgroundAudioActivityForApplication:(id)a3 withDelay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  dispatch_time_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  SBAudioRecordingManager *v17;

  v4 = a4;
  v6 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke;
  v15 = &unk_1E8E9E820;
  v7 = v6;
  v16 = v7;
  v17 = self;
  v8 = MEMORY[0x1D17E5550](&v12);
  v9 = (void *)v8;
  if (v4)
  {
    -[SBAudioRecordingManager _verificationDelayForApplication:](self, "_verificationDelayForApplication:", v7, v12, v13, v14, v15);
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    dispatch_after(v11, MEMORY[0x1E0C80D38], v9);
  }
  else
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }

}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("com.apple.camera");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", v2))
  {
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v2;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Skipping verification of background audio activity for %{public}@ because this app is exempt", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "info");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject hasHiddenTag](v4, "hasHiddenTag");
    v6 = objc_msgSend(*(id *)(a1 + 32), "isSystemApplication");
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "isNowRecordingApplication");
      SBLogStatusBarish();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 1026;
        v20 = v8;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Verify background audio activity for %{public}@, Recording: %{public}d", buf, 0x12u);

      }
      objc_msgSend(*(id *)(a1 + 40), "backgroundActivityAssertion");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        v11 = 0;
      else
        v11 = v8;
      if (v11 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "processState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "pid");

        objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0BA0], v13, 1, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_12;
        v16[3] = &unk_1E8E9DED8;
        v16[4] = *(_QWORD *)(a1 + 40);
        -[NSObject acquireWithHandler:invalidationHandler:](v14, "acquireWithHandler:invalidationHandler:", &__block_literal_global_407, v16);
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v14);
      }
    }
    else
    {
      SBLogStatusBarish();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v2;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Skipping verification of background audio activity for %{public}@ because this app is a hidden system app", buf, 0xCu);
      }
    }

  }
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_10(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    SBLogStatusBarish();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_10_cold_1(v2);

  }
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_12(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeBackgroundActivityAssertion");
}

- (double)_verificationDelayForApplication:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "isFaceTime");
  result = 1.5;
  if (v3)
    return 2.0;
  return result;
}

- (int)_pidForAttribution:(id)a3
{
  if (a3)
    objc_msgSend(a3, "auditToken", (unsigned __int128)0, (unsigned __int128)0);
  return BSPIDForAuditToken();
}

- (void)_coverSheetDidPresent:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "application", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (SBWorkspaceUnlockedEnvironmentLayoutStateHasMatchingApplication(v9))
          -[SBAudioRecordingManager _verifyBackgroundAudioActivityForApplication:withDelay:](self, "_verifyBackgroundAudioActivityForApplication:withDelay:", v9, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (SBSBackgroundActivityAssertion)backgroundActivityAssertion
{
  return self->_backgroundActivityAssertion;
}

- (void)setBackgroundActivityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivityAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_nowRecordingApplication, 0);
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_10_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to acquire background audio status bar style override", v1, 2u);
}

@end
