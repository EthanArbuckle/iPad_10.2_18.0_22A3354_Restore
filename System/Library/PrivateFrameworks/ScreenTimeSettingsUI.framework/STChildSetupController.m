@implementation STChildSetupController

- (STChildSetupController)initWithDSID:(id)a3
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, 0, 0, 0, 0);
}

- (STChildSetupController)initWithDSID:(id)a3 updateExistingSettings:(BOOL)a4
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, 0, 0, 0, a4);
}

- (STChildSetupController)initWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, 0, a5, a6, a4);
}

- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, a4, 0, 0, 0);
}

- (id)initOnChildDeviceWithDSID:(id)a3 childAge:(id)a4
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, 1, a4, 0, 0);
}

- (id)initOnChildDeviceWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, 1, a4, a5, 0);
}

- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4 updateExistingSettings:(BOOL)a5
{
  return -[STChildSetupController initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:](self, "initWithDSID:isChildDevice:childAge:childName:updateExistingSettings:", a3, a4, 0, 0, a5);
}

- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4 childAge:(id)a5 childName:(id)a6 updateExistingSettings:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  STChildSetupController *v14;
  NSObject *v15;
  STRootViewModelCoordinator *v16;
  id v17;
  void *v18;
  void *v19;
  STIntroductionController *v20;
  void *v21;
  uint64_t v22;
  STIntroductionController *introductionController;
  uint64_t v24;
  void *v25;
  STChildSetupController *v26;
  STRootViewModelCoordinator *v27;
  uint64_t v28;
  UIViewController *initialViewController;
  _BOOL4 v31;
  _QWORD v32[4];
  STRootViewModelCoordinator *v33;
  _BYTE *v34;
  BOOL v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  _BYTE *v39;
  objc_super v40;
  _BYTE buf[40];
  STChildSetupController *v42;
  uint64_t v43;

  v7 = a7;
  v31 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)STChildSetupController;
  v14 = -[STChildSetupController init](&v40, sel_init);
  if (v14)
  {
    +[STUILog childSetup](STUILog, "childSetup");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v31;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v12;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v13;
      *(_WORD *)&buf[38] = 1026;
      LODWORD(v42) = v7;
      _os_log_impl(&dword_219AB4000, v15, OS_LOG_TYPE_DEFAULT, "Initializing STChildSetupController with dsid:%@ isChildDevice:%{public}d childAge:%@ childName:%@ updateExistingSettings:%{public}d", buf, 0x2Cu);
    }

    v16 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v11, 0, 0, 0);
    objc_storeStrong((id *)&v14->_coordinator, v16);
    if (v13)
    {
      v17 = v13;
    }
    else
    {
      -[STRootViewModelCoordinator viewModel](v16, "viewModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "me");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "givenName");
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = [STIntroductionController alloc];
    -[STChildSetupController coordinator](v14, "coordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[STIntroductionController initWithDSID:childAge:childName:updateExistingSettings:restrictionsDataSource:](v20, "initWithDSID:childAge:childName:updateExistingSettings:restrictionsDataSource:", v11, v12, v17, v7, v21);
    introductionController = v14->_introductionController;
    v14->_introductionController = (STIntroductionController *)v22;

    -[STIntroductionController setAllowParentalControls:](v14->_introductionController, "setAllowParentalControls:", 1);
    -[STIntroductionController setForceParentalControls:](v14->_introductionController, "setForceParentalControls:", 1);
    -[STIntroductionController setSkipAppLimitsPane:](v14->_introductionController, "setSkipAppLimitsPane:", 1);
    v24 = MEMORY[0x24BDAC760];
    if (v7)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      buf[24] = 1;
      objc_msgSend(MEMORY[0x24BE84498], "sharedController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v24;
      v37[1] = 3221225472;
      v37[2] = __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke;
      v37[3] = &unk_24DB86AE0;
      v38 = v11;
      v39 = buf;
      objc_msgSend(v25, "performBackgroundTaskAndWait:", v37);
      -[STIntroductionController setShowCommunicationSafetyPane:](v14->_introductionController, "setShowCommunicationSafetyPane:", *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      -[STIntroductionController setShowCommunicationSafetyPane:](v14->_introductionController, "setShowCommunicationSafetyPane:", 1);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
    v26 = v14;
    v42 = v26;
    v32[0] = v24;
    v32[1] = 3221225472;
    v32[2] = __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_17;
    v32[3] = &unk_24DB86B30;
    v35 = v31;
    v34 = buf;
    v36 = v7;
    v27 = v16;
    v33 = v27;
    -[STIntroductionController setCompletionBlock:](v14->_introductionController, "setCompletionBlock:", v32);
    -[STIntroductionController initialViewController](v14->_introductionController, "initialViewController");
    v28 = objc_claimAutoreleasedReturnValue();
    initialViewController = v26->_initialViewController;
    v26->_initialViewController = (UIViewController *)v28;

    _Block_object_dispose(buf, 8);
  }

  return v14;
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  objc_msgSend(MEMORY[0x24BE84570], "fetchUserWithDSID:inContext:error:", v3, a2, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[STChildSetupController isCommunicationSafetyAlreadyEnabledForUser:](STChildSetupController, "isCommunicationSafetyAlreadyEnabledForUser:", v4);
  }
  else
  {
    +[STUILog childSetup](STUILog, "childSetup");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_cold_1((uint64_t)v5, v6);

  }
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_17(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v10, "completionHandlerWithIntroductionModel");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[STUILog childSetup](STUILog, "childSetup");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219AB4000, v11, OS_LOG_TYPE_DEFAULT, "Calling STChildSetupController completion handler with introduction model. Screen Time was not enabled on child's device.", buf, 2u);
        }

        v8[2](v8, 0, 0);
      }
    }
    else
    {
      objc_msgSend(v10, "completionHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[STUILog childSetup](STUILog, "childSetup");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219AB4000, v23, OS_LOG_TYPE_DEFAULT, "Calling STChildSetupController completion handler. Screen Time was not enabled for remote child from parent's device.", buf, 2u);
        }

        ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), _QWORD))v8[2])(v8, 0);
      }
    }
    goto LABEL_21;
  }
  if (*(_BYTE *)(a1 + 49))
  {
    +[STUILog childSetup](STUILog, "childSetup");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_DEFAULT, "Updating existing settings for remote child from parent's device.", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "coordinator");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applyIntroductionViewModel:withCompletionHandler:", v6, v9);

LABEL_21:
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void (***)(_QWORD, _QWORD, _QWORD))(v24 + 40);
    *(_QWORD *)(v24 + 40) = 0;
    goto LABEL_22;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completionHandlerWithIntroductionModel");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v30 = objc_alloc(MEMORY[0x24BE845C0]);
      objc_msgSend(v6, "appAndWebsiteActivityEnabled");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bedtime");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "simpleSchedule");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "startTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bedtime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "simpleSchedule");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "restrictions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentalControlsPasscode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "communicationSafetyEnabled");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screenDistanceEnabled");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "initWithAppAndWebsiteActivityEnabled:downtimeStartTime:downtimeEndTime:restrictions:passcode:communicationSafetyEnabled:eyeReliefEnabled:", v13, v14, v15, v16, v17, v18, v19);

      +[STUILog childSetup](STUILog, "childSetup");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219AB4000, v20, OS_LOG_TYPE_DEFAULT, "Calling STChildSetupController completion handler with introduction model. Screen Time will be enabled on child's device.", buf, 2u);
      }

      ((void (**)(_QWORD, uint64_t, void *))v12)[2](v12, 1, v31);
    }
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;

  }
  else
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v5, "parentalControlsPasscode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_18;
    v33[3] = &unk_24DB86B08;
    v35 = *(_QWORD *)(a1 + 40);
    v34 = v6;
    objc_msgSend(v25, "enableManagementWithPIN:recoveryAltDSID:completionHandler:", v26, 0, v33);

    v12 = (void (**)(_QWORD, _QWORD, _QWORD))v34;
  }
LABEL_22:

}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completionHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  +[STUILog childSetup](STUILog, "childSetup");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_18_cold_1((uint64_t)v3, v6);

    if (v4)
      ((void (**)(_QWORD, id))v4)[2](v4, v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219AB4000, v6, OS_LOG_TYPE_DEFAULT, "Screen Time was successfully enabled for remote child from parent's device. Will save values for model.", v10, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyIntroductionViewModel:withCompletionHandler:", *(_QWORD *)(a1 + 32), v4);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

+ (BOOL)isCommunicationSafetyAlreadyEnabledForUser:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isCommunicationSafetyReceivingRestricted") & 1) != 0
    || (objc_msgSend(v3, "isCommunicationSafetySendingRestricted") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isCommunicationSafetyNotificationEnabled");
  }

  return v4;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)completionHandlerWithIntroductionModel
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandlerWithIntroductionModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (STIntroductionController)introductionController
{
  return self->_introductionController;
}

- (void)setIntroductionController:(id)a3
{
  objc_storeStrong((id *)&self->_introductionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introductionController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong(&self->_completionHandlerWithIntroductionModel, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "Failed to fetch user to determine whether to show Communication Safety pane: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_219AB4000, a2, OS_LOG_TYPE_ERROR, "Failed to enable management for remote child from parent's device: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
