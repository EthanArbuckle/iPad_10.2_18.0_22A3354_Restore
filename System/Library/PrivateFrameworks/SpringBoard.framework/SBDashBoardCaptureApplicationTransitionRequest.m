@implementation SBDashBoardCaptureApplicationTransitionRequest

- (SBDashBoardCaptureApplicationTransitionRequest)initWithCaptureApplication:(id)a3
{
  id v5;
  SBDashBoardCaptureApplicationTransitionRequest *v6;
  SBDashBoardCaptureApplicationTransitionRequest *v7;
  uint64_t v8;
  SBCaptureApplicationService *captureApplicationService;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardCaptureApplicationTransitionRequest;
  v6 = -[SBDashBoardCaptureApplicationTransitionRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_captureApplication, a3);
    +[SBCaptureApplicationService sharedInstance](SBCaptureApplicationService, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    captureApplicationService = v7->_captureApplicationService;
    v7->_captureApplicationService = (SBCaptureApplicationService *)v8;

  }
  return v7;
}

- (void)dealloc
{
  SBCaptureApplicationService *captureApplicationService;
  BSAbsoluteMachTimer *launchTransitionTimer;
  BSAbsoluteMachTimer *v5;
  objc_super v6;

  captureApplicationService = self->_captureApplicationService;
  self->_captureApplicationService = 0;

  -[SBCaptureApplicationService removeObserver:](self->_captureApplicationService, "removeObserver:", self);
  launchTransitionTimer = self->_launchTransitionTimer;
  if (launchTransitionTimer)
  {
    -[BSAbsoluteMachTimer invalidate](launchTransitionTimer, "invalidate");
    v5 = self->_launchTransitionTimer;
    self->_launchTransitionTimer = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardCaptureApplicationTransitionRequest;
  -[SBDashBoardCaptureApplicationTransitionRequest dealloc](&v6, sel_dealloc);
}

- (void)setWaitForTransitionCompletion:(BOOL)a3
{
  SBCaptureApplicationService *captureApplicationService;

  if (self->_waitForTransitionCompletion != a3)
  {
    self->_waitForTransitionCompletion = a3;
    captureApplicationService = self->_captureApplicationService;
    if (a3)
      -[SBCaptureApplicationService addObserver:](captureApplicationService, "addObserver:", self);
    else
      -[SBCaptureApplicationService removeObserver:](captureApplicationService, "removeObserver:", self);
  }
}

- (void)initiate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBDashBoardCaptureApplicationTransitionRequest captureApplication](self, "captureApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet debugDescription](self->_launchActions, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transition initiated for capture application (%@), launch actions: %@", (uint8_t *)&v8, 0x16u);

  }
  -[SBDashBoardCaptureApplicationTransitionRequest delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "captureApplicationTransitionRequestWillLaunchApplication:", self);

  -[SBDashBoardCaptureApplicationTransitionRequest _unlock](self, "_unlock");
}

- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBCaptureApplicationTransitionErrorDomain, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_startLaunchTransitionTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  BSAbsoluteMachTimer *launchTransitionTimer;
  BSAbsoluteMachTimer *v7;
  id v8;
  void *v9;
  uint64_t v10;
  BSAbsoluteMachTimer **p_launchTransitionTimer;
  BSAbsoluteMachTimer *v12;
  BSAbsoluteMachTimer *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBDashBoardCaptureApplicationTransitionRequest captureApplication](self, "captureApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling a launch transtion timer for capture application (%@)", buf, 0xCu);

  }
  launchTransitionTimer = self->_launchTransitionTimer;
  if (launchTransitionTimer)
  {
    -[BSAbsoluteMachTimer invalidate](launchTransitionTimer, "invalidate");
    v7 = self->_launchTransitionTimer;
    self->_launchTransitionTimer = 0;

  }
  objc_initWeak((id *)buf, self);
  v8 = objc_alloc(MEMORY[0x1E0D01690]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBDashBoardCaptureApplicationTransitionRequest.launchTransitionTimer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "initWithIdentifier:", v9);
  v12 = self->_launchTransitionTimer;
  p_launchTransitionTimer = &self->_launchTransitionTimer;
  *p_launchTransitionTimer = (BSAbsoluteMachTimer *)v10;

  v13 = *p_launchTransitionTimer;
  +[SBCaptureApplicationCenter captureApplicationSettings](SBCaptureApplicationCenter, "captureApplicationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "launchTransitionTimeOutDurationInSeconds");
  v16 = v15;
  v17 = MEMORY[0x1E0C80D38];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__SBDashBoardCaptureApplicationTransitionRequest__startLaunchTransitionTimer__block_invoke;
  v18[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v19, (id *)buf);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v18, v16, 0.05);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __77__SBDashBoardCaptureApplicationTransitionRequest__startLaunchTransitionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "captureApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Launch transtion timer is fired for capture application (%@)", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "_unlock");

}

- (void)_unlock
{
  void *v3;
  SBLockScreenUnlockAndLaunchCaptureApplicationRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  BSDispatchQueueAssertMain();
  -[LCSCaptureApplicationDescribing bundleIdentifier](self->_captureApplication, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBLockScreenUnlockAndLaunchCaptureApplicationRequest);
  -[SBLockScreenUnlockRequest setSource:](v4, "setSource:", 34);
  -[SBLockScreenUnlockRequest setIntent:](v4, "setIntent:", 3);
  -[SBLockScreenUnlockRequest setName:](v4, "setName:", CFSTR("Capture Extension Request"));
  -[SBLockScreenUnlockRequest setProcess:](v4, "setProcess:", 0);
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v4, "setWantsBiometricPresentation:", 0);
  -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v4, "setConfirmedNotInPocket:", 1);
  v5 = (void *)-[NSSet copy](self->_launchActions, "copy");
  -[SBLockScreenUnlockAndLaunchCaptureApplicationRequest setLaunchActions:](v4, "setLaunchActions:", v5);

  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBLockScreenUnlockRequest setDestinationApplication:](v4, "setDestinationApplication:", v7);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke;
  v9[3] = &unk_1E8E9E980;
  v9[4] = self;
  objc_msgSend(v8, "unlockWithRequest:completion:", v4, v9);

}

void __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "extension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Transtioning from capture extension [%{public}@] to application [%{public}@] succeeded.", (uint8_t *)&v15, 0x16u);

    }
    v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke_cold_1(a1, v5);

    FBSOpenApplicationErrorCreate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspendCaptureApplication:", v11);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:underlyingError:", 2, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "captureApplicationTransitionRequest:didCompleteWithError:", *(_QWORD *)(a1 + 32), v12);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v14)
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v9);

}

- (void)captureApplicationServiceApplicationDidCompleteTransition:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __108__SBDashBoardCaptureApplicationTransitionRequest_captureApplicationServiceApplicationDidCompleteTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "captureApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v2;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Capture application (%@) did complete transition, initiating a launch", (uint8_t *)&v10, 0xCu);
    }

    v7 = *(id **)(a1 + 40);
    if (v7[2])
    {
      objc_msgSend(v7[2], "invalidate");
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = 0;

      v7 = *(id **)(a1 + 40);
    }
    objc_msgSend(v7, "_unlock");
  }

}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void)setCaptureApplication:(id)a3
{
  objc_storeStrong((id *)&self->_captureApplication, a3);
}

- (BOOL)waitForTransitionCompletion
{
  return self->_waitForTransitionCompletion;
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
  objc_storeStrong((id *)&self->_launchActions, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SBDashBoardCaptureApplicationTransitionRequestDelegate)delegate
{
  return (SBDashBoardCaptureApplicationTransitionRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_launchTransitionTimer, 0);
  objc_storeStrong((id *)&self->_captureApplicationService, 0);
}

void __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Transtioning from capture extension [%{public}@] to application [%{public}@] failed.", (uint8_t *)&v7, 0x16u);

}

@end
