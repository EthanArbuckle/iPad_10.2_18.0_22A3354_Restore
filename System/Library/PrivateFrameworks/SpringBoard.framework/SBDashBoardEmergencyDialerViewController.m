@implementation SBDashBoardEmergencyDialerViewController

- (void)dealloc
{
  objc_super v3;

  -[SBDashBoardEmergencyDialerViewController _deactivateEmergencyDialerController](self, "_deactivateEmergencyDialerController");
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  -[SBDashBoardEmergencyDialerViewController _activateEmergencyDialerController](self, "_activateEmergencyDialerController");
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBDashBoardEmergencyDialerViewController _activateEmergencyDialerController](self, "_activateEmergencyDialerController");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SBDashBoardEmergencyDialerViewController _deactivateEmergencyDialerController](self, "_deactivateEmergencyDialerController");
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 != 27)
  {
    if (v5 != 25)
    {
LABEL_7:
      v8 = 0;
LABEL_11:
      v12.receiver = self;
      v12.super_class = (Class)SBDashBoardEmergencyDialerViewController;
      v8 |= -[CSCoverSheetViewControllerBase handleEvent:](&v12, sel_handleEvent_, v4);
      goto LABEL_12;
    }
    if (self->_inEmergencyCallMode)
    {
      SBLogDashBoard();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "type");
        NSStringFromCoverSheetEventType();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring dismiss from event \"%{public}@\" because we are in emergency call mode.", buf, 0xCu);

      }
      goto LABEL_7;
    }
  }
  SBLogDashBoard();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "type");
    NSStringFromCoverSheetEventType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing emergency dialer for event: \"%{public}@\", buf, 0xCu);

  }
  -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
  v8 = 1;
  if ((objc_msgSend(v4, "isConsumable") & 1) == 0)
    goto LABEL_11;
LABEL_12:

  return v8;
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v39, sel_aggregateAppearance_, v4);
  objc_msgSend(MEMORY[0x1E0D1BB88], "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CEADE8]);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStyle:contentColor:", 2, v10);
  objc_msgSend(v4, "setLegibilitySettings:", v11);

  objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "priority:", 70);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hidden:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v14);

  objc_msgSend(MEMORY[0x1E0D1BB88], "backgroundContent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "priority:", 70);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hidden:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v17);

  objc_msgSend(MEMORY[0x1E0D1BB88], "pageContent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "priority:", 70);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hidden:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v20);

  objc_msgSend(MEMORY[0x1E0D1BB88], "whitePoint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "priority:", 70);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hidden:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v23);

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "priority:", 70);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hidden:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "suppressTeachableMomentsAnimation:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v29);

    objc_msgSend(MEMORY[0x1E0D1BB88], "quickActions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "priority:", 70);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hidden:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v32);

    objc_msgSend(MEMORY[0x1E0D1BB88], "controlCenterGrabber");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "priority:", 70);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hidden:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v35);

    objc_msgSend(MEMORY[0x1E0D1BB88], "proudLock");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "priority:", 70);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hidden:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v38);

  }
}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v6, sel_aggregateBehavior_, v4);
  if (self->_inEmergencyCallMode)
    v5 = 14;
  else
    v5 = 10;
  objc_msgSend(v4, "setIdleTimerDuration:", v5, v6.receiver, v6.super_class);
  objc_msgSend(v4, "setIdleTimerMode:", 1);
  objc_msgSend(v4, "addRestrictedCapabilities:", 4250);
  objc_msgSend(v4, "setProximityDetectionMode:", 2 * self->_inEmergencyCall);

}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 700;
}

- (void)emergencyDialer:(id)a3 willDeactivateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogDashBoard();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v11 = 138543362;
      v12 = v5;
      v8 = "Emergency dialer controller requested dismissal due to error: %{public}@";
      v9 = v6;
      v10 = 12;
LABEL_6:
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    LOWORD(v11) = 0;
    v8 = "Emergency dialer controller requested dismissal";
    v9 = v6;
    v10 = 2;
    goto LABEL_6;
  }

  -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (void)_activateEmergencyDialerController
{
  NSObject *v3;
  TUCallCenter *v4;
  TUCallCenter *callCenter;
  void *v6;
  SBLockScreenEmergencyDialerController *v7;
  SBLockScreenEmergencyDialerController *controller;
  SBLockScreenEmergencyDialerController *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  if (!self->_controller)
  {
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Activating emergency dialer controller...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v4 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
    callCenter = self->_callCenter;
    self->_callCenter = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateEmergencyCallMode_, *MEMORY[0x1E0DBD4A0], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateEmergencyCallMode_, *MEMORY[0x1E0DBD4D8], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateEmergencyCallMode_, *MEMORY[0x1E0DBD480], 0);
    v7 = objc_alloc_init(SBLockScreenEmergencyDialerController);
    controller = self->_controller;
    self->_controller = v7;

    -[SBLockScreenEmergencyDialerController setDelegate:](self->_controller, "setDelegate:", self);
    v9 = self->_controller;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke;
    v10[3] = &unk_1E8E9E980;
    v10[4] = self;
    -[SBLockScreenEmergencyDialerController activateWithCompletion:](v9, "activateWithCompletion:", v10);
    -[SBDashBoardEmergencyDialerViewController _updateEmergencyCallMode:](self, "_updateEmergencyCallMode:", 0);

  }
}

void __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Emergency dialer controller activation complete; success = %{public}@.",
      buf,
      0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D016B0];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settingsWithDuration:timingFunction:", v6, 0.4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);
    v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_23;
    v12[3] = &unk_1E8EA3268;
    v13 = v8;
    v14 = v9;
    v15 = v7;
    v10 = v7;
    v11 = v8;
    objc_msgSend(v9, "bs_addChildViewController:animated:transitionBlock:", v4, 1, v12);
    objc_msgSend(*(id *)(a1 + 32), "_updateEmergencyCallMode:", 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_deactivateEmergencyDialerController");
    objc_msgSend(*(id *)(a1 + 32), "dismiss");
  }

}

void __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  v6 = (void *)MEMORY[0x1E0D01908];
  v7 = MEMORY[0x1E0C809B0];
  v8 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_2;
  v12[3] = &unk_1E8E9DED8;
  v13 = *(id *)(a1 + 32);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_3;
  v10[3] = &unk_1E8E9F1C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v6, "animateWithSettings:actions:completion:", v8, v12, v10);

}

uint64_t __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_deactivateEmergencyDialerController
{
  NSObject *v3;
  void *v4;
  SBLockScreenEmergencyDialerController *controller;
  TUCallCenter *callCenter;
  uint8_t v7[16];

  if (self->_controller)
  {
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating emergency dialer controller", v7, 2u);
    }

    -[SBLockScreenEmergencyDialerController deactivate](self->_controller, "deactivate");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD4A0], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD4D8], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD480], 0);
    controller = self->_controller;
    self->_controller = 0;

    callCenter = self->_callCenter;
    self->_callCenter = 0;

    self->_inEmergencyCall = 0;
    self->_inEmergencyCallMode = 0;

  }
}

- (void)_updateEmergencyCallMode:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __69__SBDashBoardEmergencyDialerViewController__updateEmergencyCallMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  char v5;
  uint64_t result;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    SBLogDashBoard();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Updating for notification: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "anyCallPassesTest:", &__block_literal_global_167);
  if ((v4 & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(MEMORY[0x1E0DBD1B8], "isEmergencyCallbackModeEnabled");
  if ((BSEqualBools() & 1) == 0 || (result = BSEqualBools(), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1080) = v4;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1081) = v5;
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Now in emergency call mode: %{public}@; call active: %{public}@",
        (uint8_t *)&v10,
        0x16u);

    }
    return objc_msgSend(*(id *)(a1 + 40), "rebuildBehavior");
  }
  return result;
}

uint64_t __69__SBDashBoardEmergencyDialerViewController__updateEmergencyCallMode___block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEmergency");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end
