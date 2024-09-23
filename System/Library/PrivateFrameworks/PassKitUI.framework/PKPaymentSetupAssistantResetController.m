@implementation PKPaymentSetupAssistantResetController

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

- (void)expressResetCardsWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SEL v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PKPaymentSetupAssistantResetController *v15;
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
  v9[2] = __74__PKPaymentSetupAssistantResetController_expressResetCardsWithCompletion___block_invoke;
  v9[3] = &unk_1E3E71DD8;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  -[PKPaymentSetupAssistantCoreController _expressCardRemovalProvisioningContext:](self, "_expressCardRemovalProvisioningContext:", v9);

}

void __74__PKPaymentSetupAssistantResetController_expressResetCardsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ returning:\n%@", (uint8_t *)&v6, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
