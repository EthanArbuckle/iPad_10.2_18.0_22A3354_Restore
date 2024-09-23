@implementation HKRPOnboardingPairViewController

- (HKRPOnboardingPairViewController)initWithSettings:(id)a3 onboardingManager:(id)a4
{
  id v7;
  id v8;
  HKRPOnboardingPairViewController *v9;
  HKRPOnboardingPairViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKRPOnboardingPairViewController;
  v9 = -[BPSWelcomeOptinViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeStrong((id *)&v10->_onboardingManager, a4);
    -[BPSWelcomeOptinViewController setStyle:](v10, "setStyle:", 74);
  }

  return v10;
}

- (id)suggestedButtonTitle
{
  return -[HKRPOnboardingPairViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_ENABLE"));
}

- (id)alternateButtonTitle
{
  return -[HKRPOnboardingPairViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_SET_UP_LATER"));
}

- (id)titleString
{
  return -[HKRPOnboardingPairViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_TITLE"));
}

- (id)detailString
{
  void *v2;
  void *v3;

  -[HKRPOnboardingPairViewController settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordingInactiveDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)captionText
{
  return -[HKRPOnboardingPairViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_BUTTON_CAPTION"));
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKRPOnboardingPairViewController;
  -[BPSWelcomeOptinViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKRPOnboardingPairViewController _makeHeroView](self, "_makeHeroView");
}

- (void)_makeHeroView
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_227010000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] illustratedWatchView is nil", (uint8_t *)&v3, 0xCu);

}

- (id)_localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)suggestedButtonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke;
  v3[3] = &unk_24EF4C800;
  v3[4] = self;
  -[HKRPOnboardingPairViewController _onboardWithCompletion:](self, "_onboardWithCompletion:", v3);
}

void __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke_2;
  v2[3] = &unk_24EF4C7D8;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

void __59__HKRPOnboardingPairViewController_suggestedButtonPressed___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "miniFlowDelegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "miniFlowStepComplete:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_onboardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKRPOnboardingPairViewController onboardingManager](self, "onboardingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke;
  v7[3] = &unk_24EF4C878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "onboardWithCompletion:", v7);

}

void __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_2;
    block[3] = &unk_24EF4C850;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_3;
  v3[3] = &unk_24EF4C828;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_presentOnboardingError:completion:", v2, v3);

}

uint64_t __59__HKRPOnboardingPairViewController__onboardWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentOnboardingError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDD2BE8];
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD2BE8]) & 1) == 0)
  {

LABEL_5:
    v17 = v8;
    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", v11) & 1) != 0)
    {
      v19 = objc_msgSend(v17, "code");

      if (v19 == 110)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        v21 = CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_UNAPPROVED_ERROR");
LABEL_10:
        objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    v21 = CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_COMPLETION_UNKNOWN_ERROR");
    goto LABEL_10;
  }
  v12 = objc_msgSend(v8, "code");

  if (v12 != 109)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_TITLE"), &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_BODY"), &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDF67E8];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __alertControllerForOnboardingError_block_invoke;
  v28[3] = &unk_24EF4C8A0;
  v29 = v9;
  v26 = v9;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v23, 0, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v27);

  -[HKRPOnboardingPairViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
}

- (void)alternateButtonPressed:(id)a3
{
  id v4;

  -[HKRPOnboardingPairViewController miniFlowDelegate](self, "miniFlowDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "miniFlowStepComplete:", self);

}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  return (BPSSetupMiniFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->miniFlowDelegate);
}

- (void)setMiniFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->miniFlowDelegate, a3);
}

- (HKRPOxygenSaturationSettings)settings
{
  return self->_settings;
}

- (HKRPOxygenSaturationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
  objc_storeStrong((id *)&self->_heroView, 0);
}

@end
