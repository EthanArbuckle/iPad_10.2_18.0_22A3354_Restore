@implementation BFFFinishSetupTouchIDController

+ (id)finishSetupTouchIDController
{
  return objc_alloc_init(BFFFinishSetupTouchIDController);
}

- (BFFFinishSetupTouchIDController)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BE85830];
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDController;
  return -[BFFFinishSetupBiometricAndPasscodeController initWithFlowSkipIdentifier:](&v4, sel_initWithFlowSkipIdentifier_, v2);
}

- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BFFFinishSetupTouchIDViewController *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(BFFFinishSetupTouchIDViewController);
  -[BFFFinishSetupTouchIDViewController setPasscode:](v8, "setPasscode:", v6);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__BFFFinishSetupTouchIDController_createViewControllerWithPasscode_completion___block_invoke;
  v11[3] = &unk_24D234458;
  objc_copyWeak(&v13, &location);
  v9 = v7;
  v12 = v9;
  -[BFFFinishSetupTouchIDViewController setCompletion:](v8, "setCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __79__BFFFinishSetupTouchIDController_createViewControllerWithPasscode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  CFPreferencesSetValue(CFSTR("Mesa2Presented"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BE85848], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "paneFeatureAnalyticsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordActionWithValue:forFeature:", v8, 12);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v10, a3);

}

@end
