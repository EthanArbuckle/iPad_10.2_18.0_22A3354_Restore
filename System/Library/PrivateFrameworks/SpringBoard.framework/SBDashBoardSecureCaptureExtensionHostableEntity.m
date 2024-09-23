@implementation SBDashBoardSecureCaptureExtensionHostableEntity

- (SBDashBoardSecureCaptureExtensionHostableEntity)initWithCaptureApplication:(id)a3
{
  id v5;
  SBDashBoardSecureCaptureExtensionHostableEntity *v6;
  SBDashBoardSecureCaptureExtensionHostableEntity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardSecureCaptureExtensionHostableEntity;
  v6 = -[SBDashBoardSecureCaptureExtensionHostableEntity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_captureApplication, a3);

  return v7;
}

- (SBDisplayItem)displayItemRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBDashBoardSecureCaptureExtensionHostableEntity captureApplication](self, "captureApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 7, v4, CFSTR("default"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDisplayItem *)v5;
}

- (CSCoverSheetViewPresenting)hostingViewController
{
  CSCameraExtensionViewController *cameraExtensionViewController;
  CSCameraExtensionViewController *v4;
  CSCameraExtensionViewController *v5;
  CSCameraExtensionViewController *v6;

  cameraExtensionViewController = self->_cameraExtensionViewController;
  if (!cameraExtensionViewController)
  {
    v4 = (CSCameraExtensionViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BB78]), "initWithCaptureApplication:", self->_captureApplication);
    v5 = self->_cameraExtensionViewController;
    self->_cameraExtensionViewController = v4;
    v6 = v4;

    -[CSCameraExtensionViewController setDelegate:](self->_cameraExtensionViewController, "setDelegate:", self);
    cameraExtensionViewController = self->_cameraExtensionViewController;
  }
  return cameraExtensionViewController;
}

- (void)cameraExtensionViewController:(id)a3 requestsLaunchWithAction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "captureApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Launch request received for capture application: %@", (uint8_t *)&v16, 0xCu);
  }

  if (self->_transitionToApplicationRequest)
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Already have an ongoing transition request for this capture application: %@, dropping this request", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v13 = objc_opt_new();
    -[NSObject addObject:](v13, "addObject:", v8);
    +[SBCaptureApplicationCenter captureApplicationSettings](SBCaptureApplicationCenter, "captureApplicationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "forceWaitForTransition");

    -[SBDashBoardSecureCaptureExtensionHostableEntity _requestTransitionToCaptureApplication:actions:waitForTransitionCompletion:completion:](self, "_requestTransitionToCaptureApplication:actions:waitForTransitionCompletion:completion:", v10, v13, v15, v9);
  }

}

- (void)cameraExtensionViewController:(id)a3 requestsLaunchAfterTransitionCompletionWithAction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "captureApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "After transition completion request received for capture application: %@", (uint8_t *)&v14, 0xCu);
  }

  if (self->_transitionToApplicationRequest)
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Already have an ongoing transition request for this capture application: %@, dropping this request", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v13 = objc_opt_new();
    -[NSObject addObject:](v13, "addObject:", v8);
    -[SBDashBoardSecureCaptureExtensionHostableEntity _requestTransitionToCaptureApplication:actions:waitForTransitionCompletion:completion:](self, "_requestTransitionToCaptureApplication:actions:waitForTransitionCompletion:completion:", v10, v13, 1, v9);
  }

}

- (void)cameraExtensionViewController:(id)a3 requestsLaunchMonitoringForScene:(id)a4
{
  id v5;
  SBCaptureApplicationLaunchMonitor *v6;
  SBCaptureApplicationLaunchMonitor *launchMonitor;

  if (!self->_launchMonitor)
  {
    v5 = a4;
    v6 = -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:]([SBCaptureApplicationLaunchMonitor alloc], "initWithScene:delegate:", v5, self);

    launchMonitor = self->_launchMonitor;
    self->_launchMonitor = v6;

    -[SBCaptureApplicationLaunchMonitor start](self->_launchMonitor, "start");
  }
}

- (void)cameraExtensionViewController:(id)a3 cancelLaunchMonitoringForScene:(id)a4
{
  SBCaptureApplicationLaunchMonitor *launchMonitor;

  if (!self->_launchMonitor)
  {
    objc_msgSend(0, "invalidate", a3, a4);
    launchMonitor = self->_launchMonitor;
    self->_launchMonitor = 0;

  }
}

- (void)cameraExtensionViewControllerWillPresent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_isCameraPrewarmed)
  {
    v4 = (objc_class *)MEMORY[0x1E0D1BB80];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "captureApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v6, "initWithCameraPrewarmType:applicationBundleIdentifier:", 2, v8);

    -[SBDashBoardSecureCaptureExtensionHostableEntity _cameraPrewarmer](self, "_cameraPrewarmer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prewarmCameraForIdentifier:", v10);

    self->_isCameraPrewarmed = 1;
  }
}

- (void)cameraExtensionViewController:(id)a3 didCreateScene:(id)a4
{
  id v5;
  SBCaptureExtensionIdleTimerManager *v6;
  SBCaptureExtensionIdleTimerManager *idleTimerManager;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "entityPresenterDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hostableEntityPresenter:didBeginHosting:", v5, self);

  if (!self->_idleTimerManager)
  {
    v6 = objc_alloc_init(SBCaptureExtensionIdleTimerManager);
    idleTimerManager = self->_idleTimerManager;
    self->_idleTimerManager = v6;

  }
}

- (void)cameraExtensionViewController:(id)a3 didDestroyScene:(id)a4
{
  id v5;
  SBCaptureExtensionIdleTimerManager *idleTimerManager;
  id v7;

  v5 = a3;
  objc_msgSend(v5, "entityPresenterDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostableEntityPresenter:didEndHosting:", v5, self);

  -[SBCaptureExtensionIdleTimerManager invalidate](self->_idleTimerManager, "invalidate");
  idleTimerManager = self->_idleTimerManager;
  self->_idleTimerManager = 0;

  -[SBDashBoardSecureCaptureExtensionHostableEntity _resetTransitionRequest](self, "_resetTransitionRequest");
}

- (void)captureApplicationMonitor:(id)a3 hasMetLaunchRequirements:(BOOL)a4 unmetReason:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  SBCaptureApplicationLaunchMonitor *launchMonitor;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!a4)
  {
    v9 = a3;
    -[SBDashBoardSecureCaptureExtensionHostableEntity hostingViewController](self, "hostingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismiss");

    objc_msgSend(v9, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "clientHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "processHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x1E0D87E00]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture Application Requirements Unmet: \"%@\"), v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithExplanation:", v16);

        objc_msgSend(v17, "setReportType:", 1);
        objc_msgSend(v17, "setMaximumTerminationResistance:", 40);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v14, v17);
        SBLogCaptureApplication();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "bundle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v21;
          v29 = 2114;
          v30 = v8;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Locked capture launch monitor requesting termination of \"%{public}@\" for reason: \"%{public}@\", buf, 0x16u);

        }
        v26 = 0;
        v22 = objc_msgSend(v18, "execute:", &v26);
        v23 = v26;
        if ((v22 & 1) == 0)
        {
          SBLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v23;
            _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Launch monitor failed to terminate the extension: %@", buf, 0xCu);
          }

        }
      }

    }
  }
  -[SBCaptureApplicationLaunchMonitor invalidate](self->_launchMonitor, "invalidate");
  launchMonitor = self->_launchMonitor;
  self->_launchMonitor = 0;

}

- (id)_cameraPrewarmer
{
  void *v2;
  void *v3;
  void *v4;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraPrewarmer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_requestTransitionToCaptureApplication:(id)a3 actions:(id)a4 waitForTransitionCompletion:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  SBDashBoardCaptureApplicationTransitionRequest *v16;
  void *v17;
  id v18;
  SBDashBoardCaptureApplicationTransitionRequest **p_transitionToApplicationRequest;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v7 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  SBLogDashBoard();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SBDashBoardSecureCaptureExtensionHostableEntity captureApplication](self, "captureApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Requesting a launch for capture application (%@)", buf, 0xCu);

  }
  v16 = -[SBDashBoardCaptureApplicationTransitionRequest initWithCaptureApplication:]([SBDashBoardCaptureApplicationTransitionRequest alloc], "initWithCaptureApplication:", v10);
  -[SBDashBoardCaptureApplicationTransitionRequest setDelegate:](v16, "setDelegate:", self);
  -[SBDashBoardCaptureApplicationTransitionRequest setWaitForTransitionCompletion:](v16, "setWaitForTransitionCompletion:", v7);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardCaptureApplicationTransitionRequest setLaunchActions:](v16, "setLaunchActions:", v17);

  objc_initWeak((id *)buf, self);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __137__SBDashBoardSecureCaptureExtensionHostableEntity__requestTransitionToCaptureApplication_actions_waitForTransitionCompletion_completion___block_invoke;
  v23 = &unk_1E8EA7920;
  objc_copyWeak(&v25, (id *)buf);
  v18 = v12;
  v24 = v18;
  -[SBDashBoardCaptureApplicationTransitionRequest setCompletion:](v16, "setCompletion:", &v20);
  p_transitionToApplicationRequest = &self->_transitionToApplicationRequest;
  objc_storeStrong((id *)p_transitionToApplicationRequest, v16);
  -[SBDashBoardCaptureApplicationTransitionRequest initiate](*p_transitionToApplicationRequest, "initiate", v20, v21, v22, v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

void __137__SBDashBoardSecureCaptureExtensionHostableEntity__requestTransitionToCaptureApplication_actions_waitForTransitionCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  objc_msgSend(WeakRetained, "_resetTransitionRequest");

}

- (void)_resetTransitionRequest
{
  SBDashBoardCaptureApplicationTransitionRequest *transitionToApplicationRequest;

  transitionToApplicationRequest = self->_transitionToApplicationRequest;
  self->_transitionToApplicationRequest = 0;

}

- (void)captureApplicationTransitionRequestWillLaunchApplication:(id)a3
{
  -[CSCameraExtensionViewController prepareForApplicationLaunchTransition](self->_cameraExtensionViewController, "prepareForApplicationLaunchTransition", a3);
}

- (void)captureApplicationTransitionRequest:(id)a3 didCompleteWithError:(id)a4
{
  -[CSCameraExtensionViewController applicationLaunchTransitionDidCompleteWithError:](self->_cameraExtensionViewController, "applicationLaunchTransitionDidCompleteWithError:", a4);
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_transitionToApplicationRequest, 0);
  objc_storeStrong((id *)&self->_idleTimerManager, 0);
  objc_storeStrong((id *)&self->_launchMonitor, 0);
  objc_storeStrong((id *)&self->_cameraExtensionViewController, 0);
}

@end
