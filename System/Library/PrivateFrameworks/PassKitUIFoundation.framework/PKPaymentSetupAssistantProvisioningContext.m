@implementation PKPaymentSetupAssistantProvisioningContext

- (PKPaymentSetupAssistantProvisioningContext)initWithProvisioningController:(id)a3 snapshotCoordinator:(id)a4 setupAssistantCredentials:(id)a5 maximumSelectable:(unint64_t)a6
{
  id v11;
  PKPaymentSetupAssistantProvisioningContext *v12;
  PKPaymentSetupAssistantProvisioningContext *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupAssistantProvisioningContext;
  v12 = -[PKPaymentSetupAssistantCoreProvisioningContext initWithProvisioningController:setupAssistantCredentials:maximumSelectable:](&v15, sel_initWithProvisioningController_setupAssistantCredentials_maximumSelectable_, a3, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_snapshotCoordinator, a4);

  return v13;
}

- (id)passSnapshotForCredential:(id)a3
{
  id v4;
  PKPaymentSetupAssistantProvisioningContextDelegate *delegate;
  PKPassSnapshotCoordinatorProtocol *snapshotCoordinator;
  void *v7;
  NSObject *v8;
  const char *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[PKPaymentSetupAssistantProvisioningContext passSnapshotForCredential:]";
      v9 = "%s - called without a credential, returning nil.";
LABEL_8:
      _os_log_impl(&dword_213A36000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
LABEL_9:

    v7 = 0;
    goto LABEL_10;
  }
  delegate = self->_delegate;
  if (!delegate)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[PKPaymentSetupAssistantProvisioningContext passSnapshotForCredential:]";
      v9 = "%s - called without a delegate set, returning nil as no snapshot size can be determined.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[PKPaymentSetupAssistantProvisioningContextDelegate setupAssistantCredentialCardArtSize](delegate, "setupAssistantCredentialCardArtSize");
  snapshotCoordinator = self->_snapshotCoordinator;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__PKPaymentSetupAssistantProvisioningContext_passSnapshotForCredential___block_invoke;
  v11[3] = &unk_24D0A0CB8;
  v11[4] = self;
  -[PKPassSnapshotCoordinatorProtocol cardSnapshotForSource:withSize:completion:](snapshotCoordinator, "cardSnapshotForSource:withSize:completion:", v4, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

uint64_t __72__PKPaymentSetupAssistantProvisioningContext_passSnapshotForCredential___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setupAssistantCredentialUpdatedCardArt:");
}

- (void)paymentPassUpdatedOnCredential:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_delegate)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __77__PKPaymentSetupAssistantProvisioningContext_paymentPassUpdatedOnCredential___block_invoke;
    v7[3] = &unk_24D0A0B08;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PKPaymentSetupAssistantProvisioningContext paymentPassUpdatedOnCredential:]";
      _os_log_impl(&dword_213A36000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring %s as no delegate has been set.", buf, 0xCu);
    }

  }
}

void __77__PKPaymentSetupAssistantProvisioningContext_paymentPassUpdatedOnCredential___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setupAssistantCredentialForPaymentCredential:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "passSnapshotForCredential:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setupAssistantCredentialUpdatedCardArt:", v3);

}

- (id)_setupAssistantCredentialForPaymentCredential:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PKPaymentSetupAssistantProvisioningContext setupAssistantCredentials](self, "setupAssistantCredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __92__PKPaymentSetupAssistantProvisioningContext__setupAssistantCredentialForPaymentCredential___block_invoke;
  v9[3] = &unk_24D0A0CE0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __92__PKPaymentSetupAssistantProvisioningContext__setupAssistantCredentialForPaymentCredential___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (PKPaymentSetupAssistantProvisioningContextDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (PKPassSnapshotCoordinatorProtocol)snapshotCoordinator
{
  return self->_snapshotCoordinator;
}

- (void)setSnapshotCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCoordinator, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
