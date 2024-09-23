@implementation PKPassUpgradeController

- (PKPassUpgradeController)initWithWebService:(id)a3
{
  id v4;
  id v5;
  PKPassUpgradeController *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  PKPassUpgradeController *v11;
  id v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__PKPassUpgradeController_initWithWebService___block_invoke;
  v10[3] = &unk_1E2ADB7D0;
  v11 = self;
  v5 = v4;
  v12 = v5;
  v9.receiver = v11;
  v9.super_class = (Class)PKPassUpgradeController;
  v6 = -[PKPassUpgradeControllerBase initWithWebService:addPaymentPassToLibrary:](&v9, sel_initWithWebService_addPaymentPassToLibrary_, v5, v10);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__handleScriptsExecutedNotification_, CFSTR("com.apple.stockholm.tsm.script.executed"), 0);

  }
  return v6;
}

void __46__PKPassUpgradeController_initWithWebService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "paymentWebService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__PKPassUpgradeController_initWithWebService___block_invoke_2;
  v12[3] = &unk_1E2ABE170;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v9, "paymentWebService:addPaymentPass:withCompletionHandlerV2:", v10, v7, v12);

}

void __46__PKPassUpgradeController_initWithWebService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    }
    v3 = v6;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPassUpgradeController;
  -[PKPassUpgradeController dealloc](&v4, sel_dealloc);
}

@end
