@implementation BFFFinishSetupFaceIDController

+ (id)finishSetupFaceIDController
{
  return objc_alloc_init(BFFFinishSetupFaceIDController);
}

- (BFFFinishSetupFaceIDController)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BE85818];
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupFaceIDController;
  return -[BFFFinishSetupBiometricAndPasscodeController initWithFlowSkipIdentifier:](&v4, sel_initWithFlowSkipIdentifier_, v2);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4;
  BFFFinishSetupFaceIDViewController *v5;
  BFFFinishSetupFaceIDViewController *viewController;
  BFFFinishSetupFaceIDViewController *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(BFFFinishSetupFaceIDViewController);
  viewController = self->_viewController;
  self->_viewController = v5;

  v7 = self->_viewController;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__BFFFinishSetupFaceIDController_performExtendedInitializationWithCompletion___block_invoke;
  v9[3] = &unk_24D234788;
  v10 = v4;
  v8 = v4;
  -[BFFFaceIDViewController performExtendedInitializationWithCompletion:](v7, "performExtendedInitializationWithCompletion:", v9);

}

void __78__BFFFinishSetupFaceIDController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    v4[0] = *MEMORY[0x24BE85818];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
}

- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  BFFFinishSetupFaceIDViewController *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[BFFFinishSetupFaceIDViewController setPasscode:](self->_viewController, "setPasscode:", v6);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__BFFFinishSetupFaceIDController_createViewControllerWithPasscode_completion___block_invoke;
  v11[3] = &unk_24D234458;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v12 = v8;
  -[BFFFinishSetupFaceIDViewController setCompletion:](self->_viewController, "setCompletion:", v11);
  v9 = self->_viewController;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __78__BFFFinishSetupFaceIDController_createViewControllerWithPasscode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      v7 = &unk_24D23E168;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained[7], "enrollmentConfiguration") + 1000);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "paneFeatureAnalyticsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordActionWithValue:forFeature:", v7, 13);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v10, a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
