@implementation PKPeerPaymentDocumentSubmissionController

- (PKPeerPaymentDocumentSubmissionController)initWithPeerPaymentWebService:(id)a3 identityVerificationResponse:(id)a4 setupDelegate:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PKPeerPaymentDocumentSubmissionController *v16;
  void *v17;
  void *v18;
  id v19;
  PKPeerPaymentAccountResolutionController *v20;
  PKPeerPaymentAccountResolutionController *accountResolutionController;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v12, "acceptableDocuments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassKitBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentDocumentSubmissionController;
  v16 = -[PKPaymentDocumentSubmissionController initWithSetupDelegate:context:acceptableDocuments:featureIdentifier:localizationBundle:preferredLanguage:](&v23, sel_initWithSetupDelegate_context_acceptableDocuments_featureIdentifier_localizationBundle_preferredLanguage_, v13, a6, v14, 1, v15, 0);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_webService, a3);
    objc_storeStrong((id *)&v16->_identityVerificationResponse, a4);
    -[PKPeerPaymentWebService peerPaymentService](v16->_webService, "peerPaymentService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    v20 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:]([PKPeerPaymentAccountResolutionController alloc], "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v18, v16->_webService, a6, v16, v19);
    accountResolutionController = v16->_accountResolutionController;
    v16->_accountResolutionController = v20;

  }
  return v16;
}

- (void)uploadID
{
  void *v3;
  uint64_t v4;
  id v5;
  UIImage *v6;
  UIImage *v7;
  void *v8;
  UIImage *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPeerPaymentWebService *webService;
  _QWORD v16[5];

  if (-[PKPaymentDocumentSubmissionController state](self, "state") != 5)
  {
    -[PKPaymentDocumentSubmissionController setState:](self, "setState:", 5);
    if (self->_webService
      && (-[PKPeerPaymentIdentityVerificationResponse encryptionCertificates](self->_identityVerificationResponse, "encryptionCertificates"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "count"), v3, v4))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0D67410]);
      -[PKPaymentDocumentSubmissionController frontID](self, "frontID");
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        UIImageJPEGRepresentation(v6, 0.9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setFrontImageData:", v8);

      }
      -[PKPaymentDocumentSubmissionController backID](self, "backID");
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        UIImageJPEGRepresentation(v9, 0.9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBackImageData:", v11);

      }
      -[PKPeerPaymentIdentityVerificationResponse encryptionCertificates](self->_identityVerificationResponse, "encryptionCertificates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCertificates:", v12);

      -[PKPaymentDocumentSubmissionController selectedDocument](self, "selectedDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDocumentType:", objc_msgSend(v13, "documentType"));
      objc_msgSend(v13, "countryCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDocumentCountryCode:", v14);

      webService = self->_webService;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke;
      v16[3] = &unk_1E3E6A6D8;
      v16[4] = self;
      -[PKPeerPaymentWebService peerPaymentDocumentSubmissionRequest:completion:](webService, "peerPaymentDocumentSubmissionRequest:completion:", v5, v16);

    }
    else
    {
      -[PKPaymentDocumentSubmissionController setState:](self, "setState:", 6);
    }
  }
}

void __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_2;
  block[3] = &unk_1E3E61400;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  _QWORD v8[6];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:", 0);

  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (*(_QWORD *)(a1 + 40))
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68548], 0);
    v4 = *(void **)(a1 + 32);
    v5 = 6;
LABEL_7:
    objc_msgSend(v4, "setState:", v5);
  }
  else
  {
    switch(objc_msgSend(*(id *)(a1 + 48), "status"))
    {
      case 0:
        MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68560], 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "targetDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_3;
        v8[3] = &unk_1E3E6A6B0;
        v8[4] = *(_QWORD *)(a1 + 32);
        v8[5] = v3;
        objc_msgSend(v6, "updateAccountWithCompletion:", v8);

        break;
      case 1:
      case 2:
      case 4:
        v4 = *(void **)(a1 + 32);
        v5 = 8;
        goto LABEL_7;
      case 3:
        MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68548], 0);
        v4 = *(void **)(a1 + 32);
        v5 = 11;
        goto LABEL_7;
      default:
        break;
    }
  }
  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v3 != result)
    return objc_msgSend(*(id *)(a1 + 32), "stateChanged");
  return result;
}

uint64_t __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v3 = objc_msgSend(a2, "state");
  if (v3 == 2)
  {
    v4 = (_QWORD *)MEMORY[0x1E0D68558];
    v5 = 9;
    goto LABEL_5;
  }
  if (v3 == 3)
  {
    v4 = (_QWORD *)MEMORY[0x1E0D68550];
    v5 = 10;
LABEL_5:
    MEMORY[0x1A1AE3A74](*v4, 0);
    goto LABEL_7;
  }
  v5 = 7;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setState:", v5);
  v6 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v6 != result)
    return objc_msgSend(*(id *)(a1 + 32), "stateChanged");
  return result;
}

- (void)contactApplePressed
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", v4, 2u);
  }

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68540], 0);
  -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_accountResolutionController, "presentFlowForAccountResolution:configuration:completion:", 3, 0, &__block_literal_global_75);
}

void __64__PKPeerPaymentDocumentSubmissionController_contactApplePressed__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[PKPaymentDocumentSubmissionController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v4;

  -[PKPaymentDocumentSubmissionController delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (PKPeerPaymentIdentityVerificationResponse)identityVerificationResponse
{
  return self->_identityVerificationResponse;
}

- (void)setIdentityVerificationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_identityVerificationResponse, a3);
}

- (PKPeerPaymentAccountResolutionController)accountResolutionController
{
  return self->_accountResolutionController;
}

- (void)setAccountResolutionController:(id)a3
{
  objc_storeStrong((id *)&self->_accountResolutionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_identityVerificationResponse, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end
