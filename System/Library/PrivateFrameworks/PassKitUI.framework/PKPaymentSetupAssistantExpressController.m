@implementation PKPaymentSetupAssistantExpressController

- (id)_provisioningContextWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PKPassSnapshotCoordinator *v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "webService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secureElementIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PKPassSnapshotCoordinator initWithSEIDs:]([PKPassSnapshotCoordinator alloc], "initWithSEIDs:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C010]), "initWithProvisioningController:snapshotCoordinator:setupAssistantCredentials:maximumSelectable:", v8, v12, v7, a5);

  return v13;
}

- (id)_setupAssistantCredentialForPaymentCredential:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D6C008];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPaymentCredential:", v4);

  return v5;
}

- (id)_setupAssistantCredentialForPaymentPass:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D6C008];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPaymentPass:", v4);

  return v5;
}

- (void)expressSetupProvisioningContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PKPaymentSetupAssistantExpressController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ with: %@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PKPaymentSetupAssistantExpressController_expressSetupProvisioningContext___block_invoke;
  v9[3] = &unk_1E3E7A408;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v8 = v5;
  -[PKPaymentSetupAssistantCoreController _expressSetupProvisioningContext:](self, "_expressSetupProvisioningContext:", v9);

}

void __76__PKPaymentSetupAssistantExpressController_expressSetupProvisioningContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ returning:\n%@ with requirements: %lu", (uint8_t *)&v8, 0x20u);

  }
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68488], 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)expressSetupFlowForSetupProvisioningContext:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  PKPaymentSetupAssistantDelegateProxy *v12;
  void *v13;
  void *v14;
  PKPaymentSetupAssistantDelegateProxy *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  PKPaymentSetupAssistantDelegateProxy *v27;
  void (**v28)(id, _QWORD);
  _BYTE *v29;
  _QWORD v30[4];
  void (**v31)(id, _QWORD);
  _BYTE *v32;
  _BYTE buf[24];
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (v8)
  {
    objc_msgSend(v7, "provisioningController");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availablePaymentCredentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v7 || !objc_msgSend(v10, "count"))
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Error: Empty provisioning context %@ supplied to %@", buf, 0x16u);

      }
      v8[2](v8, 0);
      goto LABEL_18;
    }
    v12 = [PKPaymentSetupAssistantDelegateProxy alloc];
    -[PKPaymentSetupAssistantController setupAssistantContext](self, "setupAssistantContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKPaymentSetupAssistantDelegateProxy initWithDelegate:provisioningController:](v12, "initWithDelegate:provisioningController:", v14, v9);

    -[PKPaymentSetupAssistantController setupAssistantContext](self, "setupAssistantContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "setupAssistant");

    if (v17 == 1)
    {
      v18 = 2;
    }
    else
    {
      if (v17 != 2)
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[PKPaymentSetupAssistantController setupAssistantContext](self, "setupAssistantContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = objc_msgSend(v25, "setupAssistant");
          _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Error: expressSetupFlowForSetupProvisioningContext called with unsupported type %lu. File a radar!", buf, 0xCu);

        }
        v8[2](v8, 0);
        goto LABEL_17;
      }
      v18 = 6;
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", v18, v9, 0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v34 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke;
    v30[3] = &unk_1E3E6B6D8;
    v31 = v8;
    v32 = buf;
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke_2;
    v26[3] = &unk_1E3E79C20;
    v29 = buf;
    v27 = v15;
    v28 = v31;
    +[PKProvisioningFlowBridge startSetupAssistantFlowWithContext:credentials:onFirstViewControllerShown:completion:](PKProvisioningFlowBridge, "startSetupAssistantFlowWithContext:credentials:onFirstViewControllerShown:completion:", v22, v11, v30, v26);

    _Block_object_dispose(buf, 8);
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Error: No completion provided to %@", buf, 0xCu);

  }
LABEL_19:

}

uint64_t __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "viewControllerDidTerminateSetupFlow:", 0);
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
