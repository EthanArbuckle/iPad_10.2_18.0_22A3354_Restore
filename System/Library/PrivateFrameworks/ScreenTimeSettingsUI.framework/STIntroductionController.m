@implementation STIntroductionController

- (STIntroductionController)initWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5 updateExistingSettings:(BOOL)a6 restrictionsDataSource:(id)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  STIntroductionController *v17;
  uint64_t v18;
  STIntroductionViewModel *introductionModel;
  void *v20;
  _BOOL8 v21;
  STRestrictionsToPresetMappingViewModel *v22;
  STRestrictionsToPresetMappingViewModel *settingsPresetViewModel;
  _TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *v24;
  _TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *v25;
  _TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *v26;
  uint64_t v27;
  objc_super v29;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v29.receiver = self;
  v29.super_class = (Class)STIntroductionController;
  v16 = a7;
  v17 = -[STIntroductionController init](&v29, sel_init);
  objc_storeStrong((id *)&v17->_dsid, a3);
  objc_storeStrong((id *)&v17->_childAge, a4);
  objc_storeStrong((id *)&v17->_childName, a5);
  v17->_updateExistingSettings = v8;
  v18 = objc_opt_new();
  introductionModel = v17->_introductionModel;
  v17->_introductionModel = (STIntroductionViewModel *)v18;

  v20 = (void *)objc_opt_new();
  v21 = !v8;
  if (v21)
  {
    v26 = [_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel alloc];
    v27 = -[SettingsPresetViewModel initWithDsid:childAge:isInitialSetup:restrictionsToPresetMappingViewModel:restrictionsDataSource:agePresetsAnalytics:](v26, "initWithDsid:childAge:isInitialSetup:restrictionsToPresetMappingViewModel:restrictionsDataSource:agePresetsAnalytics:", v13, v14, v21, 0, v16, v20, v29.receiver, v29.super_class);

    settingsPresetViewModel = (STRestrictionsToPresetMappingViewModel *)v17->_settingsPresetViewModel;
    v17->_settingsPresetViewModel = (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *)v27;
  }
  else
  {
    v22 = [STRestrictionsToPresetMappingViewModel alloc];
    settingsPresetViewModel = -[STRestrictionsToPresetMappingViewModel initWithRestrictionsDataSource:](v22, "initWithRestrictionsDataSource:", v16, v29.receiver, v29.super_class);
    v24 = -[SettingsPresetViewModel initWithDsid:childAge:isInitialSetup:restrictionsToPresetMappingViewModel:restrictionsDataSource:agePresetsAnalytics:]([_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel alloc], "initWithDsid:childAge:isInitialSetup:restrictionsToPresetMappingViewModel:restrictionsDataSource:agePresetsAnalytics:", v13, v14, v21, settingsPresetViewModel, v16, v20);

    v25 = v17->_settingsPresetViewModel;
    v17->_settingsPresetViewModel = v24;

  }
  -[SettingsPresetViewModel loadWithCompletionHandler:](v17->_settingsPresetViewModel, "loadWithCompletionHandler:", &__block_literal_global_12);

  return v17;
}

- (STIntroductionController)initWithNewUserRootViewModelCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  STIntroductionController *v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[STIntroductionController initWithDSID:childAge:childName:updateExistingSettings:restrictionsDataSource:](self, "initWithDSID:childAge:childName:updateExistingSettings:restrictionsDataSource:", v7, 0, v8, 0, v4);

  v10 = 1;
  v9->_allowParentalControls = 1;
  v9->_forceParentalControls = objc_msgSend(v5, "forceParentalControls");
  v9->_askForRecoveryAppleID = objc_msgSend(v6, "needsRecoveryAppleID");
  if ((objc_msgSend(v6, "isChild") & 1) == 0)
    v10 = objc_msgSend(v6, "type") == 0;
  v9->_childOrNotSignedIntoiCloud = v10;
  if (objc_msgSend(v6, "isRemoteUser"))
    v9->_showCommunicationSafetyPane = 1;

  return v9;
}

- (void)presentOverViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[STIntroductionController setIsModalPresentation:](self, "setIsModalPresentation:", 1);
  -[STIntroductionController _viewControllerFollowingViewController:](self, "_viewControllerFollowingViewController:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E420]), "initWithRootViewController:", v5);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (!v8)
    objc_msgSend(v6, "setSupportedInterfaceOrientations:", 2);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__STIntroductionController_presentOverViewController___block_invoke;
  v10[3] = &unk_24DB86588;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v4, "presentViewController:animated:completion:", v9, 1, v10);

}

uint64_t __54__STIntroductionController_presentOverViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationController:", *(_QWORD *)(a1 + 40));
}

- (UIViewController)initialViewController
{
  return (UIViewController *)-[STIntroductionController _viewControllerFollowingViewController:](self, "_viewControllerFollowingViewController:", 0);
}

- (void)_viewControllerCompleted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a3;
  -[STIntroductionController _viewControllerFollowingViewController:](self, "_viewControllerFollowingViewController:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v10, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  }
  else
  {
    if (-[STIntroductionController isModalPresentation](self, "isModalPresentation"))
    {
      objc_msgSend(v10, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    -[STIntroductionController completionBlock](self, "completionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[STIntroductionController completionBlock](self, "completionBlock");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[STIntroductionController introductionModel](self, "introductionModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, 1, v9);

    }
    -[STIntroductionController setNavigationController:](self, "setNavigationController:", 0);
  }

}

- (void)_endIntroductionFlowWithoutEnablingScreenTime
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  if (-[STIntroductionController isModalPresentation](self, "isModalPresentation"))
  {
    -[STIntroductionController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[STIntroductionController completionBlock](self, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[STIntroductionController completionBlock](self, "completionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, 0);

  }
  -[STIntroductionController setNavigationController:](self, "setNavigationController:", 0);
}

- (void)_endIntroductionFlowWithEnablingScreenTime
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  -[STIntroductionController completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STIntroductionController completionBlock](self, "completionBlock");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[STIntroductionController introductionModel](self, "introductionModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v4)[2](v4, 1, v5);

  }
  -[STIntroductionController setNavigationController:](self, "setNavigationController:", 0);
}

- (id)_viewControllerFollowingViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  STIntroIdentityViewController *v15;
  uint64_t v16;
  void *v17;
  STEyeReliefIntroHowItWorksViewController *v18;
  void *v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  void *v24;
  STIntroAppLimitsViewController *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  id location;
  _QWORD v33[5];
  _QWORD aBlock[6];
  uint64_t v35;
  id *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a3;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3042000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  v40 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__STIntroductionController__viewControllerFollowingViewController___block_invoke;
  aBlock[3] = &unk_24DB87460;
  aBlock[4] = self;
  aBlock[5] = &v35;
  v6 = _Block_copy(aBlock);
  if (!v4)
  {
    if (!-[STIntroductionController updateExistingSettings](self, "updateExistingSettings"))
    {
      v33[0] = v5;
      v33[1] = 3221225472;
      v33[2] = __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_2;
      v33[3] = &unk_24DB86440;
      v33[4] = self;
      v9 = _Block_copy(v33);
      -[STIntroductionController childName](self, "childName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[STIntroductionViewControllersFactory makeIntroductionWelcomeViewControllerWithChildName:forceParentalControls:continueHandler:endHandler:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "makeIntroductionWelcomeViewControllerWithChildName:forceParentalControls:continueHandler:endHandler:", v10, -[STIntroductionController forceParentalControls](self, "forceParentalControls"), v6, v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (+[STIntroductionViewControllersFactory isOfTypeWelcomeViewController:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "isOfTypeWelcomeViewController:", v4))
  {
    if (-[STIntroductionController allowParentalControls](self, "allowParentalControls"))
    {
      if (-[STIntroductionController forceParentalControls](self, "forceParentalControls"))
        goto LABEL_10;
      v15 = [STIntroIdentityViewController alloc];
      -[STIntroductionController introductionModel](self, "introductionModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[STIntroIdentityViewController initWithIntroductionModel:continueHandler:](v15, "initWithIntroductionModel:continueHandler:", v9, v6);
LABEL_18:
      v12 = (id)v16;
      goto LABEL_13;
    }
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (+[STIntroductionViewControllersFactory isOfTypePresetsViewController:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "isOfTypePresetsViewController:", v4))
    {
      if (-[STIntroductionController showCommunicationSafetyPane](self, "showCommunicationSafetyPane"))
      {
        -[STIntroductionController introductionModel](self, "introductionModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[STIntroductionController childName](self, "childName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[STIntroductionViewControllersFactory makeIntroductionCommunicationSafetyViewControllerWithIntroductionModel:childName:continueHandler:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "makeIntroductionCommunicationSafetyViewControllerWithIntroductionModel:childName:continueHandler:", v9, v13, v6);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v12 = (id)v14;
        goto LABEL_32;
      }
      if (-[STIntroductionController updateExistingSettings](self, "updateExistingSettings"))
        goto LABEL_25;
    }
    else
    {
      if (+[STIntroductionViewControllersFactory isOfTypeCommunicationSafetyViewController:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "isOfTypeCommunicationSafetyViewController:", v4))
      {
        objc_initWeak(&location, self);
        v26 = v5;
        v27 = 3221225472;
        v28 = __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_3;
        v29 = &unk_24DB87488;
        objc_copyWeak(&v31, &location);
        v30 = v6;
        v17 = _Block_copy(&v26);
        v18 = [STEyeReliefIntroHowItWorksViewController alloc];
        v12 = -[STEyeReliefIntroHowItWorksViewController initForChecklistFlow:withCompletionHandler:](v18, "initForChecklistFlow:withCompletionHandler:", 1, v17, v26, v27, v28, v29);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (+[STIntroductionViewControllersFactory isOfTypeAppAndWebsiteActivityViewController:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "isOfTypeAppAndWebsiteActivityViewController:", v4))
        {
          -[STIntroductionController introductionModel](self, "introductionModel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appAndWebsiteActivityEnabled");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

          if (v22)
          {
            -[STIntroductionController introductionModel](self, "introductionModel");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            +[STIntroductionViewControllersFactory makeIntroductionDowntimeViewControllerWithIntroductionModel:continueHandler:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "makeIntroductionDowntimeViewControllerWithIntroductionModel:continueHandler:", v9, v6);
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        else if (+[STIntroductionViewControllersFactory isOfTypeDowntimeViewController:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "isOfTypeDowntimeViewController:", v4))
        {
          if (!-[STIntroductionController skipAppLimitsPane](self, "skipAppLimitsPane"))
          {
            v25 = [STIntroAppLimitsViewController alloc];
            -[STIntroductionController introductionModel](self, "introductionModel");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[STIntroAppLimitsViewController initWithIntroductionModel:continueHandler:](v25, "initWithIntroductionModel:continueHandler:", v9, v6);
            goto LABEL_18;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
        }
        -[STIntroductionController introductionModel](self, "introductionModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[STIntroductionController askForRecoveryAppleID](self, "askForRecoveryAppleID");
        -[STIntroductionController altDSID](self, "altDSID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[STIntroductionController userURI](self, "userURI");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[STIntroductionViewControllersFactory makeIntroductionPasscodeViewControllerWithIntroductionModel:askForRecoveryForAppleID:altDSID:userURI:isChildOrNotSignedIntoiCloud:continueHandler:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "makeIntroductionPasscodeViewControllerWithIntroductionModel:askForRecoveryForAppleID:altDSID:userURI:isChildOrNotSignedIntoiCloud:continueHandler:", v9, v23, v13, v24, -[STIntroductionController isChildOrNotSignedIntoiCloud](self, "isChildOrNotSignedIntoiCloud"), v6);
        v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
        goto LABEL_13;
      }
      if (-[STIntroductionController updateExistingSettings](self, "updateExistingSettings"))
        goto LABEL_25;
    }
    -[STIntroductionController introductionModel](self, "introductionModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIntroductionController childName](self, "childName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[STIntroductionViewControllersFactory makeIntroductionAppAndWebsiteActivityViewControllerWithIntroductionModel:childName:continueHandler:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "makeIntroductionAppAndWebsiteActivityViewControllerWithIntroductionModel:childName:continueHandler:", v9, v13, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  -[STIntroductionController introductionModel](self, "introductionModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceForChild");

  if (!v8)
    goto LABEL_25;
LABEL_10:
  -[STIntroductionController introductionModel](self, "introductionModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroductionController settingsPresetViewModel](self, "settingsPresetViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroductionController childName](self, "childName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STIntroductionViewControllersFactory makeIntroPresetsViewControllerWithIntroductionModel:settingsPresetViewModel:name:updateExistingSettings:continueHandler:](_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory, "makeIntroPresetsViewControllerWithIntroductionModel:settingsPresetViewModel:name:updateExistingSettings:continueHandler:", v9, v10, v11, -[STIntroductionController updateExistingSettings](self, "updateExistingSettings"), v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_13:

LABEL_26:
  objc_storeWeak(v36 + 5, v12);

  _Block_object_dispose(&v35, 8);
  objc_destroyWeak(&v40);

  return v12;
}

void __67__STIntroductionController__viewControllerFollowingViewController___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v1, "_viewControllerCompleted:", WeakRetained);

}

uint64_t __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endIntroductionFlowWithoutEnablingScreenTime");
}

uint64_t __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  if (a2)
  {
    v3 = a2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "introductionModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScreenDistanceEnabled:", v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)updateExistingSettings
{
  return self->_updateExistingSettings;
}

- (void)setUpdateExistingSettings:(BOOL)a3
{
  self->_updateExistingSettings = a3;
}

- (BOOL)skipAppLimitsPane
{
  return self->_skipAppLimitsPane;
}

- (void)setSkipAppLimitsPane:(BOOL)a3
{
  self->_skipAppLimitsPane = a3;
}

- (BOOL)showCommunicationSafetyPane
{
  return self->_showCommunicationSafetyPane;
}

- (void)setShowCommunicationSafetyPane:(BOOL)a3
{
  self->_showCommunicationSafetyPane = a3;
}

- (BOOL)allowParentalControls
{
  return self->_allowParentalControls;
}

- (void)setAllowParentalControls:(BOOL)a3
{
  self->_allowParentalControls = a3;
}

- (BOOL)forceParentalControls
{
  return self->_forceParentalControls;
}

- (void)setForceParentalControls:(BOOL)a3
{
  self->_forceParentalControls = a3;
}

- (BOOL)askForRecoveryAppleID
{
  return self->_askForRecoveryAppleID;
}

- (void)setAskForRecoveryAppleID:(BOOL)a3
{
  self->_askForRecoveryAppleID = a3;
}

- (BOOL)isChildOrNotSignedIntoiCloud
{
  return self->_childOrNotSignedIntoiCloud;
}

- (void)setChildOrNotSignedIntoiCloud:(BOOL)a3
{
  self->_childOrNotSignedIntoiCloud = a3;
}

- (NSString)childName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChildName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSURL)userURI
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserURI:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)childAge
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (STIntroductionViewModel)introductionModel
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isModalPresentation
{
  return self->_isModalPresentation;
}

- (void)setIsModalPresentation:(BOOL)a3
{
  self->_isModalPresentation = a3;
}

- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)settingsPresetViewModel
{
  return self->_settingsPresetViewModel;
}

- (void)setSettingsPresetViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_settingsPresetViewModel, a3);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNavigationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_settingsPresetViewModel, 0);
  objc_storeStrong((id *)&self->_introductionModel, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_childAge, 0);
  objc_storeStrong((id *)&self->_userURI, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_childName, 0);
}

@end
