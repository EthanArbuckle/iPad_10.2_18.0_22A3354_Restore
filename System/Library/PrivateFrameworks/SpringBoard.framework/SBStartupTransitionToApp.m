@implementation SBStartupTransitionToApp

- (void)performTransitionWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToApp.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[SBBaseStartupTransition context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationLaunchURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToApp.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationLaunchURL"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke;
  v12[3] = &unk_1E8EA0C58;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  SBWorkspaceActivateApplicationFromURL(v7, 0, v12);

}

void __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 31);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E8E9EE50;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v8);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_9;
  v5[3] = &unk_1E8EB0C08;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setTransactionConfigurator:", v5);

}

void __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SBDeviceApplicationSceneEntity *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  SBDeviceApplicationSceneEntity *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "activatingEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceApplicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "sceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activationInterfaceOrientationForOrientation:", 0);

    objc_msgSend(v3, "setInterfaceOrientation:", v7);
  }
  objc_msgSend(v3, "applicationSceneEntityForLayoutRole:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v9);
  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "interfaceOrientation");
    -[SBApplicationSceneEntity sceneHandle](v10, "sceneHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "activationInterfaceOrientationForOrientation:", v13);

    if (v13)
    {
      if (v15 == v13 && v13 == objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation"))
      {
        objc_msgSend(v3, "setInterfaceOrientation:", v13);
        SBLogWorkspace();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17[0] = 67109378;
          v17[1] = v13;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Setting interface orientation for app at launch to %d for %@", (uint8_t *)v17, 0x12u);
        }

      }
    }
  }
  -[SBWorkspaceEntity setFlag:forActivationSetting:](v10, "setFlag:forActivationSetting:", 1, 7);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v10, 1);

}

void __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SBUIStartupFromOverlayAnimationController *v6;
  void *v7;
  void *v8;
  SBUIStartupFromOverlayAnimationController *v9;
  SBUIStartupFromBlackAnimationController *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [SBUIStartupFromOverlayAnimationController alloc];
    objc_msgSend(v3, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBUIStartupFromOverlayAnimationController initWithTransitionContextProvider:overlay:](v6, "initWithTransitionContextProvider:overlay:", v7, v8);

  }
  else
  {
    v10 = [SBUIStartupFromBlackAnimationController alloc];
    objc_msgSend(v3, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBUIStartupFromBlackAnimationController initWithTransitionContextProvider:](v10, "initWithTransitionContextProvider:", v7);
  }

  -[SBUIStartupFromOverlayAnimationController setWaitsForAppActivation:](v9, "setWaitsForAppActivation:", 1);
  -[SBUIStartupFromOverlayAnimationController setAnimationSettings:](v9, "setAnimationSettings:", v4);
  objc_msgSend(v3, "setSuggestedAnimationController:", v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2_13;
  v11[3] = &unk_1E8E9F1C0;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setCompletionBlock:", v11);

}

uint64_t __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
