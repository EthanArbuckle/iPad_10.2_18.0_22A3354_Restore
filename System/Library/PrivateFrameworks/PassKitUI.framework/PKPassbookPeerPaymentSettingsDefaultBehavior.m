@implementation PKPassbookPeerPaymentSettingsDefaultBehavior

- (PKPassbookPeerPaymentSettingsDefaultBehavior)init
{
  PKPassbookPeerPaymentSettingsDefaultBehavior *v2;
  uint64_t v3;
  PKPaymentWebService *paymentWebService;
  uint64_t v5;
  PKPeerPaymentWebService *peerPaymentWebService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassbookPeerPaymentSettingsDefaultBehavior;
  v2 = -[PKPassbookPeerPaymentSettingsDefaultBehavior init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v3 = objc_claimAutoreleasedReturnValue();
    paymentWebService = v2->_paymentWebService;
    v2->_paymentWebService = (PKPaymentWebService *)v3;

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v5 = objc_claimAutoreleasedReturnValue();
    peerPaymentWebService = v2->_peerPaymentWebService;
    v2->_peerPaymentWebService = (PKPeerPaymentWebService *)v5;

  }
  return v2;
}

- (id)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)peerPaymentRegistrationStatusHasChanged:(BOOL)a3 completion:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = *MEMORY[0x1E0D68600];
    v6 = a4;
    MEMORY[0x1A1AE3A74](v5, 0);
    -[PKPassbookPeerPaymentSettingsDefaultBehavior _registerForPeerPaymentWithCompletion:](self, "_registerForPeerPaymentWithCompletion:", v6);
  }
  else
  {
    v7 = *MEMORY[0x1E0D685F0];
    v8 = a4;
    MEMORY[0x1A1AE3A74](v7, 0);
    -[PKPassbookPeerPaymentSettingsDefaultBehavior _unregisterForPeerPaymentWithCompletion:](self, "_unregisterForPeerPaymentWithCompletion:", v8);
  }

}

- (void)_registerForPeerPaymentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPassbookPeerPaymentSettingsDefaultBehavior *v9;
  id v10;

  v4 = a3;
  if (-[PKPaymentWebService needsRegistration](self->_paymentWebService, "needsRegistration"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", self->_paymentWebService);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__PKPassbookPeerPaymentSettingsDefaultBehavior__registerForPeerPaymentWithCompletion___block_invoke;
    v7[3] = &unk_1E3E69B48;
    v8 = v5;
    v9 = self;
    v10 = v4;
    v6 = v5;
    objc_msgSend(v6, "validatePreconditionsAndRegister:", v7);

  }
  else
  {
    -[PKPeerPaymentWebService peerPaymentService](self->_peerPaymentWebService, "peerPaymentService");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerDeviceWithCompletion:", v4);
  }

}

void __86__PKPassbookPeerPaymentSettingsDefaultBehavior__registerForPeerPaymentWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if (!v5 && a2)
  {
    v8 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "peerPaymentService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerDeviceWithCompletion:", *(_QWORD *)(a1 + 48));

LABEL_6:
    v5 = v8;
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v8 = v5;
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_unregisterForPeerPaymentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PKPeerPaymentWebService peerPaymentService](self->_peerPaymentWebService, "peerPaymentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__PKPassbookPeerPaymentSettingsDefaultBehavior__unregisterForPeerPaymentWithCompletion___block_invoke;
  v7[3] = &unk_1E3E653D8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "unregisterDeviceWithCompletion:", v7);

}

uint64_t __88__PKPassbookPeerPaymentSettingsDefaultBehavior__unregisterForPeerPaymentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
}

@end
