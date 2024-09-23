@implementation BFFFinishSetupAssistantOptInController

+ (id)finishSetupAssistantOptInController
{
  return objc_alloc_init(BFFFinishSetupAssistantOptInController);
}

- (BFFFinishSetupAssistantOptInController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BFFFinishSetupAssistantOptInController;
  return -[BFFFinishSetupAssistantOptInController init](&v3, sel_init);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__BFFFinishSetupAssistantOptInController_performExtendedInitializationWithCompletion___block_invoke;
  v7[3] = &unk_24D234370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __86__BFFFinishSetupAssistantOptInController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = BYAssistantScreenShouldRunForPHSUpgrade();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (id)viewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  VTUIEnrollTrainingViewController *v7;
  VTUIEnrollTrainingViewController *enrollmentController;
  VTUIEnrollTrainingViewController *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[BFFFinishSetupAssistantOptInController setCompletion:](self, "setCompletion:", v4);
  if (!self->_enrollmentController)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getVTUIEnrollTrainingViewControllerClass_softClass;
    v15 = getVTUIEnrollTrainingViewControllerClass_softClass;
    if (!getVTUIEnrollTrainingViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getVTUIEnrollTrainingViewControllerClass_block_invoke;
      v11[3] = &unk_24D234208;
      v11[4] = &v12;
      __getVTUIEnrollTrainingViewControllerClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = (VTUIEnrollTrainingViewController *)objc_msgSend([v6 alloc], "init:", 1);
    enrollmentController = self->_enrollmentController;
    self->_enrollmentController = v7;

    -[VTUIEnrollTrainingViewController setDelegate:](self->_enrollmentController, "setDelegate:", self);
  }
  objc_storeStrong((id *)&self->_selfReference, self);
  v9 = self->_enrollmentController;

  return v9;
}

- (void)continueSetup
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void (**completion)(id, _QWORD, void *);
  void *v12;
  id v13;
  BFFFinishSetupAssistantOptInController *selfReference;
  uint8_t v15[16];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_214875000, v3, OS_LOG_TYPE_DEFAULT, "Siri setup success", v15, 2u);
  }

  -[BFFFinishSetupAssistantOptInController flowSkipController](self, "flowSkipController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE85828];
  objc_msgSend(v4, "didCompleteFlow:", *MEMORY[0x24BE85828]);

  v6 = (const void *)*MEMORY[0x24BDBD270];
  v7 = (const __CFString *)*MEMORY[0x24BE85848];
  v8 = (const __CFString *)*MEMORY[0x24BDBD590];
  v9 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSetValue((CFStringRef)*MEMORY[0x24BE85800], (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (self->_willOfferVoiceTrigger)
    CFPreferencesSetValue((CFStringRef)*MEMORY[0x24BE857F8], v6, v7, v8, v9);
  -[BFFFinishSetupAssistantOptInController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordActionWithValue:forFeature:", MEMORY[0x24BDBD1C8], 7);

  completion = (void (**)(id, _QWORD, void *))self->_completion;
  if (completion)
  {
    v16[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 0, v12);

    v13 = self->_completion;
    self->_completion = 0;

  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;

}

- (void)skipSetup
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void (**completion)(id, uint64_t, void *);
  void *v12;
  id v13;
  BFFFinishSetupAssistantOptInController *selfReference;
  void *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_214875000, v3, OS_LOG_TYPE_DEFAULT, "User chose to skip Siri setup", v17, 2u);
  }

  -[BFFFinishSetupAssistantOptInController flowSkipController](self, "flowSkipController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE85828];
  objc_msgSend(v4, "didCompleteFlow:", *MEMORY[0x24BE85828]);

  v6 = (const void *)*MEMORY[0x24BDBD270];
  v7 = (const __CFString *)*MEMORY[0x24BE85848];
  v8 = (const __CFString *)*MEMORY[0x24BDBD590];
  v9 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSetValue((CFStringRef)*MEMORY[0x24BE85800], (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  CFPreferencesSetValue((CFStringRef)*MEMORY[0x24BE857F8], v6, v7, v8, v9);
  -[BFFFinishSetupAssistantOptInController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordActionWithValue:forFeature:", MEMORY[0x24BDBD1C0], 7);

  completion = (void (**)(id, uint64_t, void *))self->_completion;
  if (completion)
  {
    v18[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 1, v12);

    v13 = self->_completion;
    self->_completion = 0;

  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDictationIsEnabled:", 0);

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "synchronize");

}

- (void)showLearnMore
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getOBPrivacyPresenterClass_softClass;
  v10 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getOBPrivacyPresenterClass_block_invoke;
    v6[3] = &unk_24D234208;
    v6[4] = &v7;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v4, "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x24BE85840]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", self->_enrollmentController);
  objc_msgSend(v5, "present");

}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end
