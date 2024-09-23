@implementation BFFFinishSetupAppleIDController

+ (id)finishSetupAppleIDController
{
  return objc_alloc_init(BFFFinishSetupAppleIDController);
}

- (id)viewControllerWithCompletion:(id)a3
{
  AAUISignInController *v4;
  AAUISignInController *signInController;
  NSObject *v6;
  AAUISignInController *v7;
  id v8;
  void *v9;
  void *v10;
  int v12;
  AAUISignInController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[BFFFinishSetupAppleIDController setCompletion:](self, "setCompletion:", a3);
  v4 = (AAUISignInController *)objc_alloc_init(MEMORY[0x24BE04D80]);
  signInController = self->_signInController;
  self->_signInController = v4;

  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_signInController;
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "created signInController %@", (uint8_t *)&v12, 0xCu);
  }

  -[AAUISignInController setDelegate:](self->_signInController, "setDelegate:", self);
  objc_storeStrong((id *)&self->_selfReference, self);
  v8 = (id)-[AAUISignInController view](self->_signInController, "view");
  -[AAUISignInController viewControllers](self->_signInController, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  void *v4;
  void *v5;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**completion)(id, _QWORD, void *);
  void *v16;
  id v17;
  BFFFinishSetupAppleIDController *selfReference;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "success");
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214875000, v10, OS_LOG_TYPE_DEFAULT, "Sign-in succeeded!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v19 = _BYIsInternalInstall();
    objc_msgSend(v7, "error");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if ((v19 & 1) != 0)
    {
      v22 = 0;
      v23 = (void *)v20;
    }
    else if (v20)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "error");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v19, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v4, objc_msgSend(v5, "code"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 1;
    }
    else
    {
      v22 = 0;
      v23 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v23;
    _os_log_error_impl(&dword_214875000, v10, OS_LOG_TYPE_ERROR, "Sign-in failed: %{public}@", buf, 0xCu);
    if (v22)
    {

    }
  }

  -[BFFFinishSetupAppleIDController flowSkipController](self, "flowSkipController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE85808];
  objc_msgSend(v11, "didCompleteFlow:", *MEMORY[0x24BE85808]);

  CFPreferencesSetValue(CFSTR("AppleIDPB10Presented"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  -[BFFFinishSetupAppleIDController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "success"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordActionWithValue:forFeature:", v14, 14);

  completion = (void (**)(id, _QWORD, void *))self->_completion;
  if (completion)
  {
    v25 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 0, v16);

    v17 = self->_completion;
    self->_completion = 0;

  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;

}

- (void)signInControllerDidCancel:(id)a3
{
  NSObject *v4;
  AAUISignInController *signInController;
  void *v6;
  uint64_t v7;
  void *v8;
  void (**completion)(id, uint64_t, void *);
  void *v10;
  id v11;
  BFFFinishSetupAppleIDController *selfReference;
  uint64_t v13;
  uint8_t buf[4];
  AAUISignInController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    signInController = self->_signInController;
    *(_DWORD *)buf = 138412290;
    v15 = signInController;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "signInControllerDidCancel: %@", buf, 0xCu);
  }

  -[BFFFinishSetupAppleIDController flowSkipController](self, "flowSkipController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE85808];
  objc_msgSend(v6, "didCompleteFlow:", *MEMORY[0x24BE85808]);

  CFPreferencesSetValue(CFSTR("AppleIDPB10Presented"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  -[BFFFinishSetupAppleIDController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordActionWithValue:forFeature:", MEMORY[0x24BDBD1C0], 14);

  completion = (void (**)(id, uint64_t, void *))self->_completion;
  if (completion)
  {
    v13 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 2, v10);

    v11 = self->_completion;
    self->_completion = 0;

  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end
