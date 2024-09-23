@implementation PKApplyController

- (PKApplyController)initWithApplyConfiguration:(id)a3
{
  id v4;
  void *v5;
  PKApplyController *v6;
  uint64_t v7;
  PKFeatureApplication *featureApplication;
  uint64_t v9;
  NSString *referenceIdentifier;
  void *v11;
  uint64_t v12;
  PKPaymentProvisioningController *provisioningController;
  uint64_t v14;
  PKAccount *account;
  uint64_t v16;
  PKAccountPaymentFundingSource *fundingSource;
  uint64_t v18;
  PKPaymentWebService *webService;
  dispatch_queue_t v20;
  OS_dispatch_queue *workQueue;
  NSMutableArray *v22;
  NSMutableArray *viewControllers;
  NSMutableArray *v24;
  NSMutableArray *pagesToSubmit;
  unint64_t v26;
  PKApplyController *v27;
  NSObject *v29;
  objc_super v30;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "featureApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    v30.receiver = self;
    v30.super_class = (Class)PKApplyController;
    v6 = -[PKApplyController init](&v30, sel_init);
    if (v6)
    {
      v6->_featureIdentifier = objc_msgSend(v4, "feature");
      v6->_featureProduct = objc_msgSend(v4, "featureProduct");
      v6->_applicationType = objc_msgSend(v4, "applicationType");
      objc_msgSend(v4, "featureApplication");
      v7 = objc_claimAutoreleasedReturnValue();
      featureApplication = v6->_featureApplication;
      v6->_featureApplication = (PKFeatureApplication *)v7;

      objc_msgSend(v4, "referenceIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      referenceIdentifier = v6->_referenceIdentifier;
      v6->_referenceIdentifier = (NSString *)v9;

      v6->_updateUserInfoSubType = objc_msgSend(v4, "updateUserInfoSubType");
      v6->_verificationType = objc_msgSend(v4, "verificationType");
      v6->_context = objc_msgSend(v4, "context");
      objc_msgSend(v4, "setupDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_setupDelegate, v11);

      objc_msgSend(v4, "provisioningController");
      v12 = objc_claimAutoreleasedReturnValue();
      provisioningController = v6->_provisioningController;
      v6->_provisioningController = (PKPaymentProvisioningController *)v12;

      objc_msgSend(v4, "account");
      v14 = objc_claimAutoreleasedReturnValue();
      account = v6->_account;
      v6->_account = (PKAccount *)v14;

      objc_msgSend(v4, "fundingSource");
      v16 = objc_claimAutoreleasedReturnValue();
      fundingSource = v6->_fundingSource;
      v6->_fundingSource = (PKAccountPaymentFundingSource *)v16;

      -[PKPaymentProvisioningController webService](v6->_provisioningController, "webService");
      v18 = objc_claimAutoreleasedReturnValue();
      webService = v6->_webService;
      v6->_webService = (PKPaymentWebService *)v18;

      v20 = dispatch_queue_create("com.apple.applyManager.queue", 0);
      workQueue = v6->_workQueue;
      v6->_workQueue = (OS_dispatch_queue *)v20;

      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      viewControllers = v6->_viewControllers;
      v6->_viewControllers = v22;

      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      pagesToSubmit = v6->_pagesToSubmit;
      v6->_pagesToSubmit = v24;

      v26 = objc_msgSend(v4, "context");
      if (v26 <= 0xA)
        v6->_channel = qword_19DF167F0[v26];
      -[PKApplyController _prewarmODIAssessmentIfNecessary](v6, "_prewarmODIAssessmentIfNecessary");
    }
    self = v6;
    v27 = self;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "feature"))
    goto LABEL_4;
  PKLogFacilityTypeGetObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "Error: Cannot create controller with unknown feature or nil featureApplication", buf, 2u);
  }

  v27 = 0;
LABEL_9:

  return v27;
}

- (void)dealloc
{
  objc_super v3;

  -[PKApplyController _reset](self, "_reset");
  v3.receiver = self;
  v3.super_class = (Class)PKApplyController;
  -[PKApplyController dealloc](&v3, sel_dealloc);
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  PKSetupFlowControllerProtocol *parentFlowController;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __int16 v11[8];
  _QWORD v12[5];
  void (**v13)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (v4)
  {
    -[PKApplyController _nextQueuedViewController](self, "_nextQueuedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PKApplyController _startPaymentServiceListener](self, "_startPaymentServiceListener");
      v4[2](v4, v5, 0);
    }
    else if (self->_endedApplyFlow)
    {
      -[PKApplyController _stopPaymentServiceListener](self, "_stopPaymentServiceListener");
      parentFlowController = self->_parentFlowController;
      if (parentFlowController)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __54__PKApplyController_nextViewControllerWithCompletion___block_invoke;
        v12[3] = &unk_1E3E61720;
        v12[4] = self;
        v13 = v4;
        -[PKSetupFlowControllerProtocol nextViewControllerWithCompletion:](parentFlowController, "nextViewControllerWithCompletion:", v12);

      }
      else
      {
        -[PKApplyController _reset](self, "_reset");
        v4[2](v4, 0, 0);
      }
    }
    else
    {
      -[PKApplyController _startPaymentServiceListener](self, "_startPaymentServiceListener");
      -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0D66B30]);
        -[PKApplyController _performApplyWithRequest:completion:](self, "_performApplyWithRequest:completion:", v9, v4);

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11[0] = 0;
          _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "No application present - creating one", (uint8_t *)v11, 2u);
        }

        -[PKApplyController _performCreateWithCompletion:](self, "_performCreateWithCompletion:", v4);
      }
    }

  }
}

void __54__PKApplyController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_reset");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 288);
  *(_QWORD *)(v8 + 288) = 0;

}

- (void)submitFieldsPage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PKODIServiceProviderAssessment *submitApplicationODISession;
  void *v20;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
  if ((unint64_t)(v8 - 5) >= 0xB && (unint64_t)(v8 - 2) > 1)
  {
    if (self->_idVerificationSession)
    {
      -[PKApplyController _submitCoreIDVFieldsPage:completion:](self, "_submitCoreIDVFieldsPage:completion:", v6, v7);
      goto LABEL_5;
    }
    -[NSMutableArray addObject:](self->_pagesToSubmit, "addObject:", v6);
    v10 = objc_alloc_init(MEMORY[0x1E0D66B30]);
    objc_msgSend(v6, "fieldModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D69A30];
    objc_msgSend(v11, "submissionValuesForDestination:", *MEMORY[0x1E0D69A30]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverlayParameters:", v13);

    objc_msgSend(v11, "secureSubmissionValuesForDestination:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSecureOverlayParameters:", v14);

    -[PKFeatureApplication applicationTermsIdentifier](self->_featureApplication, "applicationTermsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footerContent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "links");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v18 = objc_msgSend(v15, "length");

      if (!v18)
      {
LABEL_14:
        submitApplicationODISession = self->_submitApplicationODISession;
        objc_msgSend(v11, "odiAttributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKODIServiceProviderAssessment updateAssessment:](submitApplicationODISession, "updateAssessment:", v20);

        -[PKApplyController _performApplyWithRequest:completion:](self, "_performApplyWithRequest:completion:", v10, v7);
        goto LABEL_5;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v15, 0);
      objc_msgSend(v10, "setTermsIdentifiers:", v16);
    }
    else
    {

    }
    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Cannot submit fields from this state - returning next view controller instead", buf, 2u);
  }

  -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v7);
LABEL_5:

}

- (void)_submitAllFieldPages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "fieldModel", (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "paymentSetupFields");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67300]), "initWithPaymentSetupFields:", v8);
  v17 = objc_alloc_init(MEMORY[0x1E0D66B30]);
  v18 = *MEMORY[0x1E0D69A30];
  objc_msgSend(v16, "submissionValuesForDestination:", *MEMORY[0x1E0D69A30]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOverlayParameters:", v19);

  objc_msgSend(v16, "secureSubmissionValuesForDestination:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSecureOverlayParameters:", v20);

  -[PKApplyController _performApplyWithRequest:completion:](self, "_performApplyWithRequest:completion:", v17, v7);
}

- (void)submitDocumentPage:(id)a3 selectedDocument:(id)a4 frontImage:(id)a5 backImage:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *workQueue;
  _QWORD v24[4];
  id v25;
  id v26;
  PKApplyController *v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  PKApplyController *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  PKApplyController *v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
  if ((unint64_t)(v17 - 5) < 0xB || (unint64_t)(v17 - 2) <= 1)
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Cannot submit documents from this state - returning next view controller instead", buf, 2u);
    }

    -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v16);
  }
  else
  {
    switch(self->_documentUploadType)
    {
      case 0uLL:
        PKLogFacilityTypeGetObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Error: Document upload type cannot be none", buf, 2u);
        }

        -[PKApplyController _handleResponseError:completion:](self, "_handleResponseError:completion:", 0, v16);
        break;
      case 1uLL:
        workQueue = self->_workQueue;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke;
        v38[3] = &unk_1E3E69A80;
        v39 = v14;
        v40 = v15;
        v41 = self;
        v42 = v12;
        v43 = v13;
        v44 = v16;
        dispatch_async(workQueue, v38);

        v21 = v39;
        goto LABEL_14;
      case 2uLL:
        v20 = self->_workQueue;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_5;
        v24[3] = &unk_1E3E69A80;
        v25 = v14;
        v26 = v15;
        v27 = self;
        v28 = v12;
        v29 = v13;
        v30 = v16;
        dispatch_async(v20, v24);

        v21 = v25;
        goto LABEL_14;
      case 3uLL:
        v22 = self->_workQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_3;
        block[3] = &unk_1E3E69A80;
        v32 = v14;
        v33 = v15;
        v34 = self;
        v35 = v12;
        v36 = v13;
        v37 = v16;
        dispatch_async(v22, block);

        v21 = v32;
LABEL_14:

        break;
      default:
        break;
    }
  }

}

void __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_2;
  v7[3] = &unk_1E3E69A80;
  v4 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = *(id *)(a1 + 64);
  v10 = v2;
  v11 = v3;
  v12 = *(id *)(a1 + 72);
  v5 = v3;
  v6 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitCoreIDVDocumentsPage:selectedDocument:frontImageData:backImageData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_4;
  v7[3] = &unk_1E3E69A80;
  v4 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = *(id *)(a1 + 64);
  v10 = v2;
  v11 = v3;
  v12 = *(id *)(a1 + 72);
  v5 = v3;
  v6 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitDocumentsPage:selectedDocument:frontImageData:backImageData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_6;
  v7[3] = &unk_1E3E69A80;
  v4 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = *(id *)(a1 + 64);
  v10 = v2;
  v11 = v3;
  v12 = *(id *)(a1 + 72);
  v5 = v3;
  v6 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitDocumentPageWithCoreIDVImageUpload:selectedDocument:frontImageData:backImageData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)submitVerificationPage:(id)a3 verificationInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t *v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  PKApplyController *v24;
  _QWORD *v25;
  uint8_t *v26;
  _QWORD *v27;
  _QWORD v28[6];
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
  if ((unint64_t)(v11 - 5) < 0xB || (unint64_t)(v11 - 2) <= 1)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Cannot submit verification from this state - returning next view controller instead", buf, 2u);
    }

    -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v10);
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__31;
    v37 = __Block_byref_object_dispose__31;
    v38 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__31;
    v31[4] = __Block_byref_object_dispose__31;
    v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__31;
    v29[4] = __Block_byref_object_dispose__31;
    v30 = objc_alloc_init(MEMORY[0x1E0D66B78]);
    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke;
    v28[3] = &unk_1E3E64F70;
    v28[4] = self;
    v28[5] = v29;
    objc_msgSend(v13, "addOperation:", v28);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_3;
    v21[3] = &unk_1E3E6EE08;
    v25 = v29;
    v22 = v9;
    v23 = v8;
    v24 = self;
    v26 = buf;
    v27 = v31;
    objc_msgSend(v13, "addOperation:", v21);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_7;
    v17[3] = &unk_1E3E6EE30;
    v18 = v10;
    v19 = buf;
    v20 = v31;
    v16 = (id)objc_msgSend(v13, "evaluateWithInput:completion:", v15, v17);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

    _Block_object_dispose(buf, 8);
  }

}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 208))
  {
    v10 = *(_QWORD *)(v9 + 176);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_2;
    v11[3] = &unk_1E3E6ED68;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = v7;
    v12 = v6;
    objc_msgSend((id)v9, "_getODIAssessmentForSession:completion:", v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOdiAssessment:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  __int128 v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setVerificationInfo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setVerificationType:", objc_msgSend(*(id *)(a1 + 40), "verificationType"));
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 264), "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setApplicationIdentifier:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFeatureIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 216));
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 264), "applicationBaseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaseURL:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 240));
  ++*(_QWORD *)(*(_QWORD *)(a1 + 48) + 160);
  v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 264), "copy");
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(void **)(v13 + 48);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_4;
  v19[3] = &unk_1E3E6EDE0;
  v19[4] = v13;
  v20 = v12;
  v23 = *(_OWORD *)(a1 + 64);
  v21 = v6;
  v22 = v7;
  v16 = v6;
  v17 = v7;
  v18 = v12;
  objc_msgSend(v14, "submitVerificationRequest:completion:", v15, v19);

}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_5;
  block[3] = &unk_1E3E6EDB8;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v18 = *(_QWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 56);
  v8 = (id)v11;
  v17 = v11;
  v16 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_sendODISessionFeedbackforInflightSessionIfNecessary");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_6;
  v9[3] = &unk_1E3E6ED90;
  v4 = *(_QWORD *)(a1 + 88);
  v9[4] = v2;
  v12 = v4;
  v8 = *(_OWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = (id)v8;
  v11 = v8;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_handleApplyResponse:originalFeatureApplication:error:completion:", v3, v5, v6, v9);

}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  --*(_QWORD *)(a1[4] + 160);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_7(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)resendVerificationForPage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  PKPaymentWebService *webService;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
    if ((unint64_t)(v8 - 5) < 0xB || (unint64_t)(v8 - 2) <= 1)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Cannot resend verification from this state - returning next view controller instead", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0D66B70]);
      objc_msgSend(v10, "setVerificationType:", objc_msgSend(v6, "verificationType"));
      -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setApplicationIdentifier:", v11);

      -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBaseURL:", v12);

      webService = self->_webService;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__PKApplyController_resendVerificationForPage_completion___block_invoke;
      v14[3] = &unk_1E3E6EE58;
      v14[4] = self;
      v15 = v7;
      -[PKPaymentWebService resendVerificationRequest:completion:](webService, "resendVerificationRequest:completion:", v10, v14);

    }
  }

}

void __58__PKApplyController_resendVerificationForPage_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKApplyController_resendVerificationForPage_completion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__PKApplyController_resendVerificationForPage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_displayableErrorForError:showDetailedErrorFlow:", v2, 1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2 == 0);

}

- (void)termsShownWithIdentifier:(id)a3
{
  id v4;
  NSMutableSet *shownTermsIdentifiers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  PKPaymentWebService *webService;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    shownTermsIdentifiers = self->_shownTermsIdentifiers;
    if (!shownTermsIdentifiers)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_shownTermsIdentifiers;
      self->_shownTermsIdentifiers = v6;

      shownTermsIdentifiers = self->_shownTermsIdentifiers;
    }
    if ((-[NSMutableSet containsObject:](shownTermsIdentifiers, "containsObject:", v4) & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        v9 = "Already sent shownTerms for :%@";
        v10 = v8;
        v11 = 12;
LABEL_9:
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      -[NSMutableSet addObject:](self->_shownTermsIdentifiers, "addObject:", v4);
      v8 = objc_alloc_init(MEMORY[0x1E0D66B58]);
      -[PKFeatureApplication applicationOfferDetails](self->_featureApplication, "applicationOfferDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "offerTermsIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {
        v15 = CFSTR("offer");
      }
      else
      {
        -[PKFeatureApplication declineDetails](self->_featureApplication, "declineDetails");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "declinedTermsIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v4, "isEqualToString:", v17);

        if ((v18 & 1) != 0)
        {
          v15 = CFSTR("decline");
        }
        else
        {
          -[PKFeatureApplication applicationTermsIdentifier](self->_featureApplication, "applicationTermsIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "isEqualToString:", v19);

          if (v20)
            v15 = CFSTR("application");
          else
            v15 = 0;
        }
      }
      -[NSObject setTermsType:](v8, "setTermsType:", v15);
      -[NSObject setTermsIdentifier:](v8, "setTermsIdentifier:", v4);
      -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setApplicationIdentifier:](v8, "setApplicationIdentifier:", v21);

      -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBaseURL:](v8, "setBaseURL:", v22);

      -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setReferrerIdentifier:](v8, "setReferrerIdentifier:", v23);

      webService = self->_webService;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __46__PKApplyController_termsShownWithIdentifier___block_invoke;
      v25[3] = &unk_1E3E6EE80;
      v25[4] = self;
      v26 = v4;
      -[PKPaymentWebService shownTermsWithRequest:completion:](webService, "shownTermsWithRequest:completion:", v8, v25);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Error: No terms identifier";
      v10 = v8;
      v11 = 2;
      goto LABEL_9;
    }
  }

}

void __46__PKApplyController_termsShownWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__PKApplyController_termsShownWithIdentifier___block_invoke_2;
    v4[3] = &unk_1E3E61388;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __46__PKApplyController_termsShownWithIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)termsAccepted:(BOOL)a3 termsIdentifier:(id)a4 secondaryIdentifier:(id)a5 actionIdentifier:(id)a6 completion:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  NSObject *v18;
  NSMutableSet *processedTermsIdentifiers;
  NSMutableSet *v20;
  NSMutableSet *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  os_signpost_id_t v25;
  os_signpost_id_t v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _BOOL4 v39;
  int v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  __int128 *v49;
  _QWORD *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  __int128 *p_buf;
  _QWORD *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id location;
  __int128 buf;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v10 = a3;
  v69 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    v16 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
    if (v16 > 0x10 || ((1 << v16) & 0x1FD2C) == 0)
    {
      processedTermsIdentifiers = self->_processedTermsIdentifiers;
      if (!processedTermsIdentifiers)
      {
        v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v21 = self->_processedTermsIdentifiers;
        self->_processedTermsIdentifiers = v20;

        processedTermsIdentifiers = self->_processedTermsIdentifiers;
      }
      if (-[NSMutableSet containsObject:](processedTermsIdentifiers, "containsObject:", v12))
      {
        PKLogFacilityTypeGetObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Terms identifier: %@ has already been handled - querying next steps instead", (uint8_t *)&buf, 0xCu);
        }

        v23 = objc_alloc_init(MEMORY[0x1E0D66B30]);
        -[PKApplyController _performApplyWithRequest:completion:](self, "_performApplyWithRequest:completion:", v23, v15);

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = os_signpost_id_make_with_pointer(v24, self);
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v26 = v25;
          if (os_signpost_enabled(v24))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_19D178000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "request:applyTerms", ", (uint8_t *)&buf, 2u);
          }
        }

        v27 = objc_alloc_init(MEMORY[0x1E0D66B68]);
        objc_msgSend(v27, "setTermsAccepted:", v10);
        if (-[PKFeatureApplication applicationState](self->_featureApplication, "applicationState") == 7)
        {
          objc_msgSend(v27, "setPathTermsIdentifier:", v12);
          if (v13)
            objc_msgSend(v27, "setPathIdentifier:", v13);
        }
        else
        {
          -[PKFeatureApplication applicationOfferDetails](self->_featureApplication, "applicationOfferDetails");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "offerTermsIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v12, "isEqualToString:", v29);

          if (v30)
          {
            objc_msgSend(v27, "setOfferTermsIdentifier:", v12);
          }
          else
          {
            -[PKFeatureApplication applicationTermsIdentifier](self->_featureApplication, "applicationTermsIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v12, "isEqualToString:", v31);

            if (v32)
            {
              objc_msgSend(v27, "setApplicationTermsIdentifier:", v12);
            }
            else
            {
              PKLogFacilityTypeGetObject();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_19D178000, v33, OS_LOG_TYPE_DEFAULT, "Error: unknown terms identifier", (uint8_t *)&buf, 2u);
              }

            }
          }
        }
        objc_msgSend(v27, "setInstallmentConfiguration:", self->_installmentConfiguration);
        -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setApplicationIdentifier:", v34);

        -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setBaseURL:", v35);

        -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setReferrerIdentifier:", v36);

        -[PKApplyController _applyExperimentDetails](self, "_applyExperimentDetails");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setExperimentDetails:", v37);

        v38 = objc_alloc_init(MEMORY[0x1E0D66B90]);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v65 = 0x3032000000;
        v66 = __Block_byref_object_copy__31;
        v67 = __Block_byref_object_dispose__31;
        v68 = 0;
        objc_initWeak(&location, self);
        v61[0] = 0;
        v61[1] = v61;
        v61[2] = 0x3032000000;
        v61[3] = __Block_byref_object_copy__31;
        v61[4] = __Block_byref_object_dispose__31;
        v62 = 0;
        if (v14)
          v39 = -[NSSet containsObject:](self->_actionIdentifiersRequiringAuthentication, "containsObject:", v14);
        else
          v39 = 0;
        v40 = -[PKFeatureApplication supportsAuthentication](self->_featureApplication, "supportsAuthentication");
        v41 = MEMORY[0x1E0C809B0];
        if ((v40 & v39) == 1)
        {
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke;
          v56[3] = &unk_1E3E6EEF8;
          v56[4] = self;
          objc_copyWeak(&v60, &location);
          p_buf = &buf;
          v57 = v27;
          v59 = v61;
          objc_msgSend(v38, "addOperation:", v56);

          objc_destroyWeak(&v60);
        }
        if (v10)
        {
          v54[0] = v41;
          v54[1] = 3221225472;
          v54[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_53;
          v54[3] = &unk_1E3E65A40;
          v54[4] = self;
          v55 = v27;
          objc_msgSend(v38, "addOperation:", v54);

        }
        if (self->_requiresODIAssessment)
        {
          v52[0] = v41;
          v52[1] = 3221225472;
          v52[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_56;
          v52[3] = &unk_1E3E65A40;
          v52[4] = self;
          v53 = v27;
          objc_msgSend(v38, "addOperation:", v52);

        }
        ++self->_runningApplicationUpdates;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v41;
        v45[1] = 3221225472;
        v45[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_58;
        v45[3] = &unk_1E3E6EFE8;
        v45[4] = self;
        v49 = &buf;
        v48 = v15;
        v43 = v27;
        v46 = v43;
        objc_copyWeak(&v51, &location);
        v47 = v12;
        v50 = v61;
        v44 = (id)objc_msgSend(v38, "evaluateWithInput:completion:", v42, v45);

        objc_destroyWeak(&v51);
        _Block_object_dispose(v61, 8);

        objc_destroyWeak(&location);
        _Block_object_dispose(&buf, 8);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Cannot accept terms from this state - returning next view controller instead", (uint8_t *)&buf, 2u);
      }

      -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v15);
    }
  }

}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E3E6EED0;
  objc_copyWeak(&v23, (id *)(a1 + 64));
  v11 = v9;
  v20 = v11;
  v12 = v8;
  v14 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v18 = v12;
  v21 = v13;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 56);
  v19 = v15;
  v22 = v16;
  objc_msgSend(v10, "_performAuthenticationLocationBased:withCompletion:", 1, v17);

  objc_destroyWeak(&v23);
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E3E6EEA8;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  v16 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v17 = *(_QWORD *)(a1 + 56);
  v14 = v5;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v18 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v19);
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_10;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Apply authentication failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D69A20], 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    goto LABEL_6;
  }
  objc_msgSend(WeakRetained[33], "authenticationSignaturePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D66B50]);
    objc_msgSend(v10, "setSignaturePayload:", v9);
    objc_msgSend(*(id *)(a1 + 48), "externalizedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAuthenticationCrediential:", v11);

    objc_msgSend(*(id *)(a1 + 56), "setAuthenticationContext:", v10);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_10:
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_53(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyTerms:getDeviceMetadata", ", buf, 2u);
    }
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_54;
  v14[3] = &unk_1E3E6EF20;
  v11 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v17 = v6;
  v18 = v7;
  v16 = v11;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v15, "_deviceMetadataFields:completion:", 251, v14);

}

uint64_t __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_54(uint64_t a1, void *a2)
{
  NSObject *v4;
  const void *v5;
  id v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint8_t v10[16];

  PKLogFacilityTypeGetObject();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(const void **)(a1 + 32);
  v6 = a2;
  v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyTerms:getDeviceMetadata", ", v10, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setDeviceMetadata:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyTerms:getAssessment", ", buf, 2u);
    }
  }

  v12 = *(_QWORD **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = v12[24];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_57;
  v16[3] = &unk_1E3E6EF48;
  v16[4] = v12;
  v18 = v6;
  v19 = v7;
  v17 = v11;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v12, "_getODIAssessmentForSession:completion:", v13, v16);

}

uint64_t __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_57(uint64_t a1, void *a2)
{
  NSObject *v4;
  const void *v5;
  id v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint8_t v10[16];

  PKLogFacilityTypeGetObject();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(const void **)(a1 + 32);
  v6 = a2;
  v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyTerms:getAssessment", ", v10, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setOdiAssessment:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_58(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  int v8;
  id *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isCanceled");
  v9 = *(id **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "_handleResponseError:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
    PKLogFacilityTypeGetObject();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19D178000, v10, OS_SIGNPOST_INTERVAL_END, v12, "request:applyTerms", ", buf, 2u);
      }
    }

  }
  else
  {
    v13 = (void *)objc_msgSend(v9[33], "copy");
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_59;
    v19[3] = &unk_1E3E6EFC0;
    objc_copyWeak(&v25, (id *)(a1 + 80));
    v23 = *(id *)(a1 + 56);
    v10 = v13;
    v16 = *(_QWORD *)(a1 + 32);
    v20 = v10;
    v21 = v16;
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 72);
    v22 = v17;
    v24 = v18;
    objc_msgSend(v15, "submitTermsRequest:completion:", v14, v19);

    objc_destroyWeak(&v25);
  }

}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2_60;
  v12[3] = &unk_1E3E6EF98;
  objc_copyWeak(&v20, (id *)(a1 + 72));
  v18 = *(id *)(a1 + 56);
  v13 = v5;
  v14 = *(id *)(a1 + 32);
  v15 = v6;
  v7 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 40);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  v17 = v8;
  v19 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v20);
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2_60(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  void *v13;
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sendODISessionFeedbackforInflightSessionIfNecessary");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3_61;
    v11[3] = &unk_1E3E6EF70;
    v10 = *(int8x16_t *)(a1 + 48);
    v6 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    v13 = v3;
    v14 = *(id *)(a1 + 64);
    v15 = *(id *)(a1 + 72);
    objc_msgSend(v3, "_handleApplyResponse:originalFeatureApplication:error:completion:", v4, v5, v6, v11);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v7)
    {
      objc_msgSend(v7, "invalidate");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  if (v5 && !(v6 | *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "addObject:", *(_QWORD *)(a1 + 56));
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v7);
  PKLogFacilityTypeGetObject();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v9, OS_SIGNPOST_INTERVAL_END, v11, "request:applyTerms", ", v12, 2u);
    }
  }

}

- (void)withdrawApplicationWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
  if (v5 - 5 >= 0xC)
  {
    if (v5 <= 4)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__PKApplyController_withdrawApplicationWithCompletion___block_invoke;
      v8[3] = &unk_1E3E64348;
      v8[4] = self;
      v9 = v4;
      -[PKApplyController _performWithdrawWithCompletion:](self, "_performWithdrawWithCompletion:", v8);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error: Cannot withdraw from this state. Already terminal", v7, 2u);
    }

    -[PKApplyController _reset](self, "_reset");
    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __55__PKApplyController_withdrawApplicationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_handleResponseError:completion:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "_reset");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

- (id)applicationUpdatedAlertControllerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedApplyFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedApplyFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedApplyFeatureString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__PKApplyController_applicationUpdatedAlertControllerWithHandler___block_invoke;
  v15[3] = &unk_1E3E61CA8;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  return v9;
}

uint64_t __66__PKApplyController_applicationUpdatedAlertControllerWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)endApplyFlow
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Apply flow ended", v4, 2u);
  }

  self->_endedApplyFlow = 1;
  -[PKApplyController _invalidateAssertion](self, "_invalidateAssertion");
  -[PKApplyController _stopPaymentServiceListener](self, "_stopPaymentServiceListener");
}

- (void)_startPaymentServiceListener
{
  PKPaymentService *v3;
  PKPaymentService *paymentService;

  if (!self->_paymentService)
  {
    v3 = (PKPaymentService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", self);
    paymentService = self->_paymentService;
    self->_paymentService = v3;

  }
}

- (void)_stopPaymentServiceListener
{
  PKPaymentService *paymentService;

  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  paymentService = self->_paymentService;
  self->_paymentService = 0;

}

- (void)_reset
{
  NSObject *v3;
  DIVerificationSession *idVerificationSession;
  NSString *previousContextIdentifier;
  NSSet *actionIdentifiersRequiringAuthentication;
  NSString *coreIDVNextStepToken;
  PKFeatureApplication *featureApplication;
  NSArray *encryptionCertificates;
  PKAccount *account;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  PKODIServiceProviderAssessment *inflightODISession;
  PKODIServiceProviderAssessment *createApplicationODISession;
  PKODIServiceProviderAssessment *submitApplicationODISession;
  PKODIServiceProviderAssessment *applyTermsODISession;
  uint8_t v16[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Reseting apply controller", v16, 2u);
  }

  -[PKApplyController _invalidateIDVSession](self, "_invalidateIDVSession");
  -[PKApplyController _invalidateAssertion](self, "_invalidateAssertion");
  idVerificationSession = self->_idVerificationSession;
  self->_idVerificationSession = 0;

  previousContextIdentifier = self->_previousContextIdentifier;
  self->_previousContextIdentifier = 0;

  actionIdentifiersRequiringAuthentication = self->_actionIdentifiersRequiringAuthentication;
  self->_requiredMetadataFields = 0;
  self->_actionIdentifiersRequiringAuthentication = 0;

  coreIDVNextStepToken = self->_coreIDVNextStepToken;
  self->_coreIDVNextStepToken = 0;

  featureApplication = self->_featureApplication;
  self->_featureApplication = 0;

  encryptionCertificates = self->_encryptionCertificates;
  self->_encryptionCertificates = 0;

  self->_endedApplyFlow = 0;
  account = self->_account;
  self->_account = 0;

  self->_didEncounterError = 0;
  -[NSMutableSet removeAllObjects](self->_processedTermsIdentifiers, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_shownTermsIdentifiers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_viewControllers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pagesToSubmit, "removeAllObjects");
  self->_viewControllerIndex = 0;
  self->_documentUploadType = 0;
  installmentConfiguration = self->_installmentConfiguration;
  self->_installmentConfiguration = 0;

  inflightODISession = self->_inflightODISession;
  self->_inflightODISession = 0;

  createApplicationODISession = self->_createApplicationODISession;
  self->_createApplicationODISession = 0;

  submitApplicationODISession = self->_submitApplicationODISession;
  self->_submitApplicationODISession = 0;

  applyTermsODISession = self->_applyTermsODISession;
  self->_applyTermsODISession = 0;

}

- (void)_performWithdrawWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentService *paymentService;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B28]);
  -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseURL:", v6);

  -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationIdentifier:", v7);

  -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReferrerIdentifier:", v8);

  ++self->_runningApplicationUpdates;
  paymentService = self->_paymentService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PKApplyController__performWithdrawWithCompletion___block_invoke;
  v11[3] = &unk_1E3E64348;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[PKPaymentService submitDeleteRequest:completion:](paymentService, "submitDeleteRequest:completion:", v5, v11);

}

void __52__PKApplyController__performWithdrawWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKApplyController__performWithdrawWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61450;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

_QWORD *__52__PKApplyController__performWithdrawWithCompletion___block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  --*(_QWORD *)(result[4] + 160);
  v1 = result[6];
  if (v1)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(result[6], result[5]);
  return result;
}

- (void)_deviceMetadataFields:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  PKPaymentWebService *webService;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    webService = self->_webService;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PKApplyController__deviceMetadataFields_completion___block_invoke;
    v9[3] = &unk_1E3E6DD10;
    v10 = v6;
    objc_msgSend(v7, "paymentWebService:deviceMetadataWithFields:completion:", webService, a3, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __54__PKApplyController__deviceMetadataFields_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PKApplyController__deviceMetadataFields_completion___block_invoke_2;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __54__PKApplyController__deviceMetadataFields_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_performCreateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  id v8;
  NSURL *applyServiceURL;
  NSURL *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSURL *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSURL *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[8];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "request:applyCreate", ", buf, 2u);
    }
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D66B38]);
  applyServiceURL = self->_applyServiceURL;
  if (applyServiceURL)
  {
    v10 = applyServiceURL;
  }
  else
  {
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryRegion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applyServiceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      PKApplyServiceOverrideURL();
      v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v16;

    if (!v10)
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "No apply URL found in the primary region. Evaluating other regions for a possible apply URL.", buf, 2u);
      }

      -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "regions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v21 = v20;
      v10 = (NSURL *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v10)
      {
        v22 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v10; i = (NSURL *)((char *)i + 1))
          {
            if (*(_QWORD *)v49 != v22)
              objc_enumerationMutation(v21);
            objc_msgSend(v21, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "applyServiceURL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v24, "applyServiceURL");
              v10 = (NSURL *)objc_claimAutoreleasedReturnValue();

              goto LABEL_22;
            }

          }
          v10 = (NSURL *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_22:

    }
  }
  objc_msgSend(v8, "setApplyServiceURL:", v10);
  objc_msgSend(v8, "setFeatureIdentifier:", self->_featureIdentifier);
  -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReferrerIdentifier:", v26);

  -[PKApplyController _applyExperimentDetails](self, "_applyExperimentDetails");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExperimentDetails:", v27);

  objc_msgSend(v8, "setInstallmentConfiguration:", self->_installmentConfiguration);
  objc_msgSend(v8, "setApplicationType:", self->_applicationType);
  objc_msgSend(v8, "setUpdateUserInfoSubType:", self->_updateUserInfoSubType);
  objc_msgSend(v8, "setVerificationType:", self->_verificationType);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountIdentifier:", v28);

  objc_msgSend(v8, "setReferenceIdentifier:", self->_referenceIdentifier);
  objc_msgSend(v8, "setChannel:", self->_channel);
  v29 = objc_alloc(MEMORY[0x1E0D66D90]);
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithAccountUserAltDSID:accessLevel:", v30, self->_accessLevel);

  objc_msgSend(v8, "setInvitationDetails:", v31);
  -[PKAccountPaymentFundingSource identifier](self->_fundingSource, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFundingSourceIdentifier:", v32);

  objc_msgSend(v8, "setPreliminaryAssessmentIdentifier:", self->_preliminaryAssessmentIdentifier);
  objc_msgSend(v8, "setFeatureProduct:", self->_featureProduct);
  objc_msgSend(v8, "setAssociatedIntent:", self->_associatedIntent);
  v33 = (void *)-[PKFeatureApplication copy](self->_featureApplication, "copy");
  ++self->_runningApplicationUpdates;
  v34 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v35 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke;
  v46[3] = &unk_1E3E65A40;
  v46[4] = self;
  v36 = v8;
  v47 = v36;
  objc_msgSend(v34, "addOperation:", v46);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v35;
  v42[1] = 3221225472;
  v42[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_79;
  v42[3] = &unk_1E3E6F038;
  v42[4] = self;
  v43 = v36;
  v44 = v33;
  v45 = v4;
  v38 = v4;
  v39 = v33;
  v40 = v36;
  v41 = (id)objc_msgSend(v34, "evaluateWithInput:completion:", v37, v42);

}

void __50__PKApplyController__performCreateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyCreate:getAssessment", ", buf, 2u);
    }
  }

  v12 = *(_QWORD **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = v12[23];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_78;
  v16[3] = &unk_1E3E6EF48;
  v16[4] = v12;
  v18 = v6;
  v19 = v7;
  v17 = v11;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v12, "_getODIAssessmentForSession:completion:", v13, v16);

}

uint64_t __50__PKApplyController__performCreateWithCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  NSObject *v4;
  const void *v5;
  id v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint8_t v10[16];

  PKLogFacilityTypeGetObject();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(const void **)(a1 + 32);
  v6 = a2;
  v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyCreate:getAssessment", ", v10, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setOdiAssessment:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_79(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_2;
  v5[3] = &unk_1E3E6F010;
  v5[4] = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "createWithRequest:completion:", v3, v5);

}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E669B8;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_sendODISessionFeedbackforInflightSessionIfNecessary");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_4;
  v6[3] = &unk_1E3E61720;
  v6[4] = v2;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_handleApplyResponse:originalFeatureApplication:error:completion:", v3, v4, v5, v6);

}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_END, v10, "request:applyCreate", ", v11, 2u);
    }
  }

}

- (void)_performApplyWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD *v31;
  uint8_t *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t *v40;
  _QWORD *v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id location;
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyRequest", ", buf, 2u);
    }
  }

  objc_msgSend(v6, "setCertificates:", self->_encryptionCertificates);
  -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseURL:", v11);

  objc_msgSend(v6, "setFeatureIdentifier:", self->_featureIdentifier);
  -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationIdentifier:", v12);

  -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferrerIdentifier:", v13);

  -[PKApplyController _applyExperimentDetails](self, "_applyExperimentDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExperimentDetails:", v14);

  objc_msgSend(v6, "setCoreIDVNextStepToken:", self->_coreIDVNextStepToken);
  objc_msgSend(v6, "setPreviousContextIdentifier:", self->_previousContextIdentifier);
  objc_msgSend(v6, "setInstallmentConfiguration:", self->_installmentConfiguration);
  objc_msgSend(v6, "setPreliminaryAssessmentIdentifier:", self->_preliminaryAssessmentIdentifier);
  objc_msgSend(v6, "setApplicationType:", self->_applicationType);
  objc_msgSend(v6, "setUpdateUserInfoSubType:", self->_updateUserInfoSubType);
  objc_msgSend(v6, "setChannel:", self->_channel);
  v15 = objc_alloc(MEMORY[0x1E0D66D90]);
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithAccountUserAltDSID:accessLevel:", v16, self->_accessLevel);

  objc_msgSend(v6, "setInvitationDetails:", v17);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccountIdentifier:", v18);

  objc_msgSend(v6, "setFeatureProduct:", self->_featureProduct);
  v19 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  *(_QWORD *)buf = 0;
  v47 = buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__31;
  v50 = __Block_byref_object_dispose__31;
  v51 = 0;
  objc_initWeak(&location, self);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__31;
  v43[4] = __Block_byref_object_dispose__31;
  v44 = 0;
  objc_msgSend(v6, "actionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = -[NSSet containsObject:](self->_actionIdentifiersRequiringAuthentication, "containsObject:", v20);
  else
    v21 = 0;
  v22 = -[PKFeatureApplication supportsAuthentication](self->_featureApplication, "supportsAuthentication");
  v23 = MEMORY[0x1E0C809B0];
  if ((v22 & v21) == 1)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke;
    v38[3] = &unk_1E3E6EEF8;
    v38[4] = self;
    objc_copyWeak(&v42, &location);
    v40 = buf;
    v39 = v6;
    v41 = v43;
    objc_msgSend(v19, "addOperation:", v38);

    objc_destroyWeak(&v42);
  }
  if (self->_requiredMetadataFields)
  {
    v36[0] = v23;
    v36[1] = 3221225472;
    v36[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_80;
    v36[3] = &unk_1E3E65A40;
    v36[4] = self;
    v37 = v6;
    objc_msgSend(v19, "addOperation:", v36);

  }
  if (self->_requiresODIAssessment)
  {
    v34[0] = v23;
    v34[1] = 3221225472;
    v34[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4;
    v34[3] = &unk_1E3E65A40;
    v34[4] = self;
    v35 = v6;
    objc_msgSend(v19, "addOperation:", v34);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_84;
  v28[3] = &unk_1E3E6F100;
  v28[4] = self;
  v25 = v6;
  v29 = v25;
  objc_copyWeak(&v33, &location);
  v26 = v7;
  v30 = v26;
  v31 = v43;
  v32 = buf;
  v27 = (id)objc_msgSend(v19, "evaluateWithInput:completion:", v24, v28);

  objc_destroyWeak(&v33);
  _Block_object_dispose(v43, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E3E6EED0;
  objc_copyWeak(&v23, (id *)(a1 + 64));
  v11 = v9;
  v20 = v11;
  v12 = v8;
  v14 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v18 = v12;
  v21 = v13;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 56);
  v19 = v15;
  v22 = v16;
  objc_msgSend(v10, "_performAuthenticationLocationBased:withCompletion:", 1, v17);

  objc_destroyWeak(&v23);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3;
  v11[3] = &unk_1E3E6EEA8;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  v16 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v17 = *(_QWORD *)(a1 + 56);
  v14 = v5;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v18 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v19);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_10;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Apply authentication failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D69A20], 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    goto LABEL_6;
  }
  objc_msgSend(WeakRetained[33], "authenticationSignaturePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D66B50]);
    objc_msgSend(v10, "setSignaturePayload:", v9);
    objc_msgSend(*(id *)(a1 + 48), "externalizedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAuthenticationCrediential:", v11);

    objc_msgSend(*(id *)(a1 + 56), "setAuthenticationContext:", v10);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_10:
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_80(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v9 = *(_QWORD **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v10 = v9[16];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_81;
  v13[3] = &unk_1E3E6F060;
  v15 = v6;
  v16 = v7;
  v14 = v8;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "_deviceMetadataFields:completion:", v10, v13);

}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_81(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_82;
  v5[3] = &unk_1E3E65E08;
  v6 = a1[4];
  v7 = v3;
  v9 = a1[6];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_82(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDeviceMetadata:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyRequest:getAssessment", ", buf, 2u);
    }
  }

  v12 = *(_QWORD **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = v12[22];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_83;
  v16[3] = &unk_1E3E6EF48;
  v16[4] = v12;
  v18 = v6;
  v19 = v7;
  v17 = v11;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v12, "_getODIAssessmentForSession:completion:", v13, v16);

}

uint64_t __57__PKApplyController__performApplyWithRequest_completion___block_invoke_83(uint64_t a1, void *a2)
{
  NSObject *v4;
  const void *v5;
  id v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint8_t v10[16];

  PKLogFacilityTypeGetObject();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(const void **)(a1 + 32);
  v6 = a2;
  v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyRequest:getAssessment", ", v10, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setOdiAssessment:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_84(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  char v8;
  id *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t v17[8];
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isCanceled");
  v9 = *(id **)(a1 + 32);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "_handleResponseError:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48));
    PKLogFacilityTypeGetObject();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_19D178000, v10, OS_SIGNPOST_INTERVAL_END, v12, "request:applyRequest", ", v17, 2u);
      }
    }

  }
  else
  {
    v13 = (void *)objc_msgSend(v9[33], "copy");
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_85;
    v18[3] = &unk_1E3E6F0D8;
    objc_copyWeak(&v23, (id *)(a1 + 72));
    v21 = *(id *)(a1 + 48);
    v10 = v13;
    v22 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v19 = v10;
    v20 = v16;
    objc_msgSend(v15, "submitApplyRequest:completion:", v14, v18);

    objc_destroyWeak(&v23);
  }

}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_86;
  block[3] = &unk_1E3E6F0B0;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v16 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v7 = *(id *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_86(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[6];
  id v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    {
      v4 = (void *)*((_QWORD *)WeakRetained + 13);
      *((_QWORD *)WeakRetained + 13) = 0;

    }
    objc_msgSend(v3, "_sendODISessionFeedbackforInflightSessionIfNecessary");
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4_87;
    v10[3] = &unk_1E3E6F088;
    v10[4] = v3;
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    v11 = v8;
    v12 = v9;
    v10[5] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "_handleApplyResponse:originalFeatureApplication:error:completion:", v7, v5, v6, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t v14[16];

  v5 = a2;
  v6 = a3;
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v8)
  {
    objc_msgSend(v8, "invalidate");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  PKLogFacilityTypeGetObject();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 40));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v11, OS_SIGNPOST_INTERVAL_END, v13, "request:applyRequest", ", v14, 2u);
    }
  }

}

- (void)_performAuthenticationLocationBased:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v4 = a3;
  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    if (v4)
      v6 = 1025;
    else
      v6 = 2;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__31;
    v17 = __Block_byref_object_dispose__31;
    v18 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v20[0] = CFSTR("Apply Authentication");
    v19[0] = &unk_1E3FAD600;
    v19[1] = &unk_1E3FAD618;
    PKLocalizedString(CFSTR("WALLET"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = &unk_1E3FAD630;
    v20[1] = v7;
    v20[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PKApplyController__performAuthenticationLocationBased_withCompletion___block_invoke;
    v10[3] = &unk_1E3E69D18;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v9, "evaluatePolicy:options:reply:", v6, v8, v10);

    _Block_object_dispose(&v13, 8);
  }

}

uint64_t __72__PKApplyController__performAuthenticationLocationBased_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (!a2 || a3)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)termsDataForIdentifier:(id)a3 format:(id)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PKPaymentWebService *webService;
  _QWORD v17[5];
  id v18;

  v8 = a5;
  if (v8)
  {
    v9 = (objc_class *)MEMORY[0x1E0D66B60];
    v10 = a4;
    v11 = a3;
    v12 = objc_alloc_init(v9);
    objc_msgSend(v12, "setTermsDataFormat:", v10);

    objc_msgSend(v12, "setTermsIdentifier:", v11);
    -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setApplicationIdentifier:", v13);

    objc_msgSend(v12, "setFeatureIdentifier:", self->_featureIdentifier);
    -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBaseURL:", v14);

    -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReferrerIdentifier:", v15);

    webService = self->_webService;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke;
    v17[3] = &unk_1E3E6F128;
    v17[4] = self;
    v18 = v8;
    -[PKPaymentWebService termsDataWithRequest:completion:](webService, "termsDataWithRequest:completion:", v12, v17);

  }
}

void __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke_2;
  v10[3] = &unk_1E3E65E08;
  v11 = v5;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  BOOL v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(a1 + 40) == 0;
  else
    v3 = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "termsData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "termsDataFileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v4 + 16))(v4, v6, v5, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_displayableErrorForError:showDetailedErrorFlow:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)termsDataForFeatureWithIdentifier:(id)a3 format:(id)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  PKPaymentWebService *webService;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  if (v8)
  {
    v9 = (objc_class *)MEMORY[0x1E0D66B48];
    v10 = a4;
    v11 = a3;
    v12 = objc_alloc_init(v9);
    objc_msgSend(v12, "setTermsDataFormat:", v10);

    objc_msgSend(v12, "setTermsIdentifier:", v11);
    objc_msgSend(v12, "setFeatureIdentifier:", self->_featureIdentifier);
    -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReferrerIdentifier:", v13);

    webService = self->_webService;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke;
    v15[3] = &unk_1E3E6F128;
    v15[4] = self;
    v16 = v8;
    -[PKPaymentWebService featureTermsDataWithRequest:completion:](webService, "featureTermsDataWithRequest:completion:", v12, v15);

  }
}

void __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke_2;
  v10[3] = &unk_1E3E65E08;
  v11 = v5;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  BOOL v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(a1 + 40) == 0;
  else
    v3 = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "termsData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "termsDataFileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v4 + 16))(v4, v6, v5, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_displayableErrorForError:showDetailedErrorFlow:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)submitActionIdentifier:(id)a3 termsIdentifiers:(id)a4 odiAttributesDictionary:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PKFeatureApplication applicationState](self->_featureApplication, "applicationState");
  if (v14 > 0xF || ((1 << v14) & 0xFF6C) == 0)
  {
    if (objc_msgSend(v12, "count"))
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v12;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Adding ODI submit application attributes %@", (uint8_t *)&v20, 0xCu);
      }

      v18 = objc_alloc_init(MEMORY[0x1E0D17578]);
      objc_msgSend(v18, "setAttributes:", v12);
      -[PKODIServiceProviderAssessment updateAssessment:](self->_submitApplicationODISession, "updateAssessment:", v18);

    }
    v19 = objc_alloc_init(MEMORY[0x1E0D66B30]);
    objc_msgSend(v19, "setActionIdentifier:", v10);
    objc_msgSend(v19, "setTermsIdentifiers:", v11);
    -[PKApplyController _performApplyWithRequest:completion:](self, "_performApplyWithRequest:completion:", v19, v13);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Cannot accept terms from this state - returning next view controller instead", (uint8_t *)&v20, 2u);
    }

    -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v13);
  }

}

- (void)_handleResponseError:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD, void *);

  v6 = (void (**)(id, _QWORD, void *))a4;
  if (v6)
  {
    v9 = v6;
    self->_didEncounterError = 1;
    -[PKApplyController _displayableErrorForError:showDetailedErrorFlow:](self, "_displayableErrorForError:showDetailedErrorFlow:", a3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9[2](v9, 0, v7);
    }
    else
    {
      -[PKApplyController _nextQueuedViewController](self, "_nextQueuedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v9)[2](v9, v8, 0);

    }
    v6 = v9;
  }

}

- (void)_handleApplyResponse:(id)a3 originalFeatureApplication:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  PKFeatureApplication *v17;
  PKFeatureApplication *featureApplication;
  NSSet *v19;
  NSSet *actionIdentifiersRequiringAuthentication;
  void *v21;
  PKAccount *v22;
  PKAccount *account;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unint64_t viewControllerIndex;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  const char *v33;
  id v34;
  id WeakRetained;
  void *v36;
  PKFeatureApplication *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  PKPaymentService *paymentService;
  NSObject *v46;
  const char *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  PKFeatureApplication *v52;
  _QWORD v53[4];
  id v54;
  void (**v55)(id, void *, _QWORD);
  _QWORD v56[4];
  id v57;
  void (**v58)(id, void *, _QWORD);
  _QWORD v59[5];
  id v60;
  void (**v61)(id, void *, _QWORD);
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  v14 = objc_msgSend(v11, "applicationState");
  if (-[PKFeatureApplication applicationState](self->_featureApplication, "applicationState") == v14)
  {
    v15 = -[PKFeatureApplication applicationStateReason](self->_featureApplication, "applicationStateReason");
    if (v15 == objc_msgSend(v11, "applicationStateReason"))
    {
      if (v12)
      {
        -[PKApplyController _handleResponseError:completion:](self, "_handleResponseError:completion:", v12, v13);
        goto LABEL_8;
      }
      if (v10)
      {
        self->_didEncounterError = 0;
        objc_msgSend(v10, "featureApplication");
        v17 = (PKFeatureApplication *)objc_claimAutoreleasedReturnValue();
        featureApplication = self->_featureApplication;
        self->_featureApplication = v17;

        self->_requiredMetadataFields = objc_msgSend(v10, "requiredDeviceMetadataFields");
        self->_requiresODIAssessment = objc_msgSend(v10, "requiresODIAssessment");
        objc_msgSend(v10, "actionIdentifiersRequiringAuthentication");
        v19 = (NSSet *)objc_claimAutoreleasedReturnValue();
        actionIdentifiersRequiringAuthentication = self->_actionIdentifiersRequiringAuthentication;
        self->_actionIdentifiersRequiringAuthentication = v19;

        objc_msgSend(v10, "account");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v10, "account");
          v22 = (PKAccount *)objc_claimAutoreleasedReturnValue();
          account = self->_account;
          self->_account = v22;

        }
        objc_msgSend(v10, "nextStepInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          objc_msgSend(v24, "pages");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v27 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "encryptionCertificates");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "count"))
            objc_storeStrong((id *)&self->_encryptionCertificates, v28);

          if (v27)
            goto LABEL_19;
        }
      }
      else
      {
        v25 = 0;
      }
      v27 = objc_alloc_init(MEMORY[0x1E0D66D20]);
LABEL_19:
      if (-[PKFeatureApplication applicationStateReason](self->_featureApplication, "applicationStateReason") == 4)
      {
        -[PKApplyController _queueStateReasonExplanationFlowWithPage:](self, "_queueStateReasonExplanationFlowWithPage:", v27);
LABEL_25:
        -[PKApplyController _nextQueuedViewController](self, "_nextQueuedViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v30, 0);

LABEL_26:
        goto LABEL_8;
      }
      if (-[NSMutableArray count](self->_viewControllers, "count"))
      {
        viewControllerIndex = self->_viewControllerIndex;
        if (viewControllerIndex == -[NSMutableArray count](self->_viewControllers, "count"))
        {
          -[NSMutableArray removeAllObjects](self->_viewControllers, "removeAllObjects");
          self->_viewControllerIndex = 0;
        }
      }
      if (-[NSMutableArray count](self->_viewControllers, "count"))
        goto LABEL_25;
      switch(-[PKFeatureApplication applicationState](self->_featureApplication, "applicationState"))
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 16:
          if (v25)
          {
            switch(objc_msgSend(v25, "contextType"))
            {
              case 0:
                -[PKApplyController _queueFieldsFlowWithNextStepInfo:](self, "_queueFieldsFlowWithNextStepInfo:", v25);
                goto LABEL_25;
              case 1:
                -[PKApplyController _startCoreIDVSessionWithStepInfo:completion:](self, "_startCoreIDVSessionWithStepInfo:completion:", v25, v13);
                goto LABEL_26;
              case 2:
                -[PKApplyController _queueDocumentSubmissionWithNextStepInfo:](self, "_queueDocumentSubmissionWithNextStepInfo:", v25);
                goto LABEL_25;
              case 3:
                -[PKApplyController _queueApplicationTermsFlow](self, "_queueApplicationTermsFlow");
                goto LABEL_25;
              case 4:
                -[PKApplyController _queueActionFlowWithPage:](self, "_queueActionFlowWithPage:", v27);
                goto LABEL_25;
              case 5:
                -[PKApplyController _queueInfoFlowWithNextWithPage:](self, "_queueInfoFlowWithNextWithPage:", v27);
                goto LABEL_25;
              case 6:
                v34 = (id)-[NSMutableArray copy](self->_pagesToSubmit, "copy");
                -[NSMutableArray removeAllObjects](self->_pagesToSubmit, "removeAllObjects");
                PKLogFacilityTypeGetObject();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  v63 = objc_msgSend(v34, "count");
                  _os_log_impl(&dword_19D178000, v43, OS_LOG_TYPE_DEFAULT, "Submitting all %ld combined pages.", buf, 0xCu);
                }

                -[PKApplyController _submitAllFieldPages:completion:](self, "_submitAllFieldPages:completion:", v34, v13);
                goto LABEL_117;
              case 7:
                if (-[PKFeatureApplication applicationType](self->_featureApplication, "applicationType") == 2
                  && (objc_msgSend(v27, "isEmptyPage") & 1) == 0)
                {
                  -[PKApplyController _queueCompleteFlowWithNextPage:](self, "_queueCompleteFlowWithNextPage:", v27);
                  goto LABEL_25;
                }
                PKLogFacilityTypeGetObject();
                v32 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_37;
                *(_WORD *)buf = 0;
                v33 = "Error: Application Open but next step complete/info - invalid state";
                break;
              case 8:
                if (-[PKFeatureApplication applicationType](self->_featureApplication, "applicationType") != 2)
                  goto LABEL_26;
                -[PKApplyController _startPaymentServiceListener](self, "_startPaymentServiceListener");
                -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                paymentService = self->_paymentService;
                v59[0] = MEMORY[0x1E0C809B0];
                v59[1] = 3221225472;
                v59[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke;
                v59[3] = &unk_1E3E6F150;
                v59[4] = self;
                v60 = v44;
                v61 = v13;
                v34 = v44;
                -[PKPaymentService featureApplicationWithReferenceIdentifier:completion:](paymentService, "featureApplicationWithReferenceIdentifier:completion:", v34, v59);
                -[PKApplyController endApplyFlow](self, "endApplyFlow");

                goto LABEL_117;
              case 9:
                -[PKApplyController _queueApplicationVerificationWithNextStepInfo:](self, "_queueApplicationVerificationWithNextStepInfo:", v25);
                goto LABEL_25;
              case 10:
                -[PKApplyController _queueConfirmInfoFlowWithPage:](self, "_queueConfirmInfoFlowWithPage:", v27);
                goto LABEL_25;
              default:
                goto LABEL_26;
            }
          }
          else
          {
            PKLogFacilityTypeGetObject();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              goto LABEL_37;
            *(_WORD *)buf = 0;
            v33 = "Error: Response is missing information to continue for state";
          }
          goto LABEL_36;
        case 5:
          -[PKApplyController _queueStateReasonExplanationFlowWithPage:](self, "_queueStateReasonExplanationFlowWithPage:", v27);
          -[PKApplyController _nextQueuedViewController](self, "_nextQueuedViewController");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
          v36 = WeakRetained;
          if (self->_installmentConfiguration && WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v37 = self->_featureApplication;
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2;
            v56[3] = &unk_1E3E618A0;
            v58 = v13;
            v57 = v34;
            objc_msgSend(v36, "viewController:canProceedWithInstallment:featureApplication:completion:", v57, 0, v37, v56);

          }
          else
          {
            v13[2](v13, v34, 0);
          }
          goto LABEL_116;
        case 6:
          switch(-[PKFeatureApplication feature](self->_featureApplication, "feature"))
          {
            case 0:
            case 4:
            case 5:
              if (objc_msgSend(v25, "contextType") != 7)
                goto LABEL_26;
              if (!objc_msgSend(v27, "isEmptyPage"))
              {
                -[PKApplyController _queueCompleteFlowWithNextPage:](self, "_queueCompleteFlowWithNextPage:", v27);
                goto LABEL_57;
              }
              PKLogFacilityTypeGetObject();
              v38 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                goto LABEL_56;
              *(_WORD *)buf = 0;
              v39 = "Server did not deliver page and it is approved: terminal state reached, not queueing another view controller";
              goto LABEL_55;
            case 1:
              goto LABEL_38;
            case 2:
              -[PKFeatureApplication applicationOfferDetails](self->_featureApplication, "applicationOfferDetails");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
              {
                -[PKApplyController _queueOfferFlowWithPage:](self, "_queueOfferFlowWithPage:", v27);
                goto LABEL_25;
              }
              PKLogFacilityTypeGetObject();
              v32 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                goto LABEL_37;
              *(_WORD *)buf = 0;
              v33 = "Error: No offer object on feature application but application approved. Not able to procced";
              break;
            case 3:
              -[PKApplyController endApplyFlow](self, "endApplyFlow");
              -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v13);
              goto LABEL_26;
            default:
              goto LABEL_26;
          }
          goto LABEL_36;
        case 7:
          v40 = objc_msgSend(v25, "contextType");
          if (objc_msgSend(v27, "isEmptyPage") && v40 == 7)
          {
            PKLogFacilityTypeGetObject();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v39 = "Server did not deliver page in decline follow up flow which means it's terminal, not queueing anothe"
                    "r view controller";
LABEL_55:
              _os_log_impl(&dword_19D178000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
            }
LABEL_56:

LABEL_57:
            -[PKApplyController endApplyFlow](self, "endApplyFlow");
            goto LABEL_25;
          }
          if (-[PKFeatureApplication applicationType](self->_featureApplication, "applicationType") == 2)
            goto LABEL_70;
          -[PKFeatureApplication declineDetails](self->_featureApplication, "declineDetails");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41 || -[PKFeatureApplication feature](self->_featureApplication, "feature") == 3)
          {

          }
          else if (-[PKFeatureApplication feature](self->_featureApplication, "feature") != 5)
          {
            PKLogFacilityTypeGetObject();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              goto LABEL_37;
            *(_WORD *)buf = 0;
            v33 = "Error: No decline object on feature application but application declined. Not able to proceed";
LABEL_36:
            _os_log_impl(&dword_19D178000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
LABEL_37:

LABEL_38:
            -[PKApplyController _queueGenericErrorViewController](self, "_queueGenericErrorViewController");
            goto LABEL_25;
          }
LABEL_70:
          objc_msgSend(v27, "identifier");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "length"))
          {
            if (v40 == 3)
            {
              PKLogFacilityTypeGetObject();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D178000, v49, OS_LOG_TYPE_DEFAULT, "Declined with terms, queue terms consent screen", buf, 2u);
              }

              -[PKApplyController _queueProgramConsentFlowWithPage:](self, "_queueProgramConsentFlowWithPage:", v27);
LABEL_110:
              -[PKApplyController _nextQueuedViewController](self, "_nextQueuedViewController");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_loadWeakRetained((id *)&self->_setupDelegate);
              v51 = v50;
              if (self->_installmentConfiguration && v50 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                v52 = self->_featureApplication;
                v53[0] = MEMORY[0x1E0C809B0];
                v53[1] = 3221225472;
                v53[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_108;
                v53[3] = &unk_1E3E618A0;
                v55 = v13;
                v54 = v36;
                objc_msgSend(v51, "viewController:canProceedWithInstallment:featureApplication:completion:", v54, 0, v52, v53);

              }
              else
              {
                v13[2](v13, v36, 0);
              }

LABEL_116:
LABEL_117:

              goto LABEL_26;
            }
            if (v40 == 4)
            {
              PKLogFacilityTypeGetObject();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Declined with action, queue action screen", buf, 2u);
              }

              -[PKApplyController _queueActionFlowWithPage:](self, "_queueActionFlowWithPage:", v27);
              goto LABEL_110;
            }
            PKLogFacilityTypeGetObject();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v47 = "Declined with context identifier but no qualifying context type, queue regular decline screen";
              goto LABEL_108;
            }
          }
          else
          {
            PKLogFacilityTypeGetObject();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v47 = "No context identifier, queue regular decline screen";
LABEL_108:
              _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 2u);
            }
          }

          -[PKApplyController _queueDeclinedFlowWithPage:](self, "_queueDeclinedFlowWithPage:", v27);
          goto LABEL_110;
        case 8:
          if (-[PKFeatureApplication applicationType](self->_featureApplication, "applicationType") != 2
            || (objc_msgSend(v27, "isEmptyPage") & 1) == 0)
          {
            -[PKApplyController _queueAcceptedFlowWithPage:](self, "_queueAcceptedFlowWithPage:", v27);
          }
          goto LABEL_25;
        case 9:
          if (self->_account)
          {
            -[PKApplyController endApplyFlow](self, "endApplyFlow");
            if (-[PKFeatureApplication feature](self->_featureApplication, "feature") == 5)
              v13[2](v13, 0, 0);
            else
              -[PKApplyController _queuePassActivationFlowWithCompletion:](self, "_queuePassActivationFlowWithCompletion:", v13);
            goto LABEL_26;
          }
          PKLogFacilityTypeGetObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            goto LABEL_37;
          *(_WORD *)buf = 0;
          v33 = "Error: Application state is booked but no account present";
          goto LABEL_36;
        case 10:
        case 11:
          if (v14 > 0x10 || ((1 << v14) & 0x1005E) == 0)
            goto LABEL_33;
          goto LABEL_57;
        case 12:
          -[PKApplyController _queueExpiredFlowWithPage:](self, "_queueExpiredFlowWithPage:", v27);
          goto LABEL_25;
        case 13:
        case 14:
        case 15:
          v31 = -[PKFeatureApplication applicationType](self->_featureApplication, "applicationType");
          if (v31 > 6 || v31 == 2 && (objc_msgSend(v27, "isEmptyPage") & 1) != 0)
            goto LABEL_25;
LABEL_33:
          -[PKApplyController _queueTerminalStateFlowWithPage:](self, "_queueTerminalStateFlowWithPage:", v27);
          goto LABEL_25;
        default:
          goto LABEL_26;
      }
    }
  }
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Feature application updated during last request. Ignoring response and fetching an update", buf, 2u);
  }

  -[PKApplyController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v13);
LABEL_8:

}

void __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  PKApplyControllerConfiguration *v4;
  id WeakRetained;
  PKApplyControllerConfiguration *v6;
  PKApplyControllerConfiguration *v7;
  id v8;
  PKApplyController *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3 && (objc_msgSend(v3, "applicationState"), PKFeatureApplicationStateIsValidToPresent()))
  {
    v4 = [PKApplyControllerConfiguration alloc];
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    v6 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v4, "initWithSetupDelegate:context:provisioningController:", WeakRetained, *(_QWORD *)(a1[4] + 272), *(_QWORD *)(a1[4] + 280));

    -[PKApplyControllerConfiguration setFeatureApplication:](v6, "setFeatureApplication:", v10);
  }
  else
  {
    v7 = [PKApplyControllerConfiguration alloc];
    v8 = objc_loadWeakRetained((id *)(a1[4] + 16));
    v6 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v7, "initWithSetupDelegate:context:provisioningController:", v8, *(_QWORD *)(a1[4] + 272), *(_QWORD *)(a1[4] + 280));

    -[PKApplyControllerConfiguration setApplicationType:](v6, "setApplicationType:", 3);
    -[PKApplyControllerConfiguration setFeature:](v6, "setFeature:", *(_QWORD *)(a1[4] + 216));
    -[PKApplyControllerConfiguration setReferenceIdentifier:](v6, "setReferenceIdentifier:", a1[5]);
  }
  v9 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v6);

  -[PKApplyController setParentFlowController:](v9, "setParentFlowController:", a1[4]);
  -[PKApplyController setAnalyticsExistingAccountType:](v9, "setAnalyticsExistingAccountType:", *(_QWORD *)(a1[4] + 336));
  -[PKApplyController nextViewControllerWithCompletion:](v9, "nextViewControllerWithCompletion:", a1[6]);

}

void __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_3;
  v2[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_108(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2_109;
  v2[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2_109(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)reportAnalyticsDictionaryForPage:(id)a3 pageTag:(id)a4 additionalValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKApplyController _defaultSubject](self, "_defaultSubject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:subject:pageTag:error:additionalValues:](self, "reportAnalyticsDictionaryForPage:subject:pageTag:error:additionalValues:", v10, v11, v9, 0, v8);

}

- (void)reportAnalyticsError:(id)a3 page:(id)a4 pageTag:(id)a5 additionalValues:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PKApplyController _defaultSubject](self, "_defaultSubject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:subject:pageTag:error:additionalValues:](self, "reportAnalyticsDictionaryForPage:subject:pageTag:error:additionalValues:", v12, v14, v11, v13, v10);

}

- (void)reportAnalyticsDictionaryForPage:(id)a3 subject:(id)a4 pageTag:(id)a5 additionalValues:(id)a6
{
  -[PKApplyController reportAnalyticsDictionaryForPage:subject:pageTag:error:additionalValues:](self, "reportAnalyticsDictionaryForPage:subject:pageTag:error:additionalValues:", a3, a4, a5, 0, a6);
}

- (void)reportAnalyticsDictionaryForPage:(id)a3 subject:(id)a4 pageTag:(id)a5 error:(id)a6 additionalValues:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *analyticsExistingAccountType;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    -[PKApplyController _defaultSubject](self, "_defaultSubject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13 && v12)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    PKFeatureIdentifierToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x1E0D68C90]);

    PKFeatureApplicationTypeToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x1E0D68630]);

    objc_msgSend(v16, "setObject:forKey:", v13, *MEMORY[0x1E0D68F50]);
    objc_msgSend(v28, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v28, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v20, *MEMORY[0x1E0D68670]);

    }
    analyticsExistingAccountType = self->_analyticsExistingAccountType;
    if (analyticsExistingAccountType)
      objc_msgSend(v16, "setObject:forKey:", analyticsExistingAccountType, *MEMORY[0x1E0D68AA8]);
    if (objc_msgSend(v15, "count"))
      objc_msgSend(v16, "addEntriesFromDictionary:", v15);
    if (v14)
    {
      objc_msgSend(v14, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), objc_msgSend(v23, "code"));
      objc_msgSend(MEMORY[0x1E0D66A58], "analyticsErrorTextForError:", objc_msgSend(v23, "code"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v24, *MEMORY[0x1E0D68A78]);
      objc_msgSend(v16, "setObject:forKey:", v25, *MEMORY[0x1E0D68A80]);

    }
    v26 = (void *)MEMORY[0x1E0D66A58];
    v27 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v26, "subject:sendEvent:", v12, v27);

  }
}

- (id)_defaultSubject
{
  return (id)objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForFeature:", self->_featureIdentifier);
}

- (void)accountUserInvitationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPaymentService *paymentService;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentService = self->_paymentService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PKApplyController_accountUserInvitationsWithCompletion___block_invoke;
    v7[3] = &unk_1E3E6F178;
    v8 = v4;
    -[PKPaymentService featureApplicationsForAccountUserInvitationWithCompletion:](paymentService, "featureApplicationsForAccountUserInvitationWithCompletion:", v7);

  }
}

uint64_t __58__PKApplyController_accountUserInvitationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)featureApplicationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPaymentService *paymentService;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentService = self->_paymentService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__PKApplyController_featureApplicationsWithCompletion___block_invoke;
    v7[3] = &unk_1E3E6F178;
    v8 = v4;
    -[PKPaymentService featureApplicationsForProvisioningWithCompletion:](paymentService, "featureApplicationsForProvisioningWithCompletion:", v7);

  }
}

uint64_t __55__PKApplyController_featureApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_prewarmODIAssessmentIfNecessary
{
  unint64_t featureIdentifier;
  id v4;
  uint64_t v5;
  void *v6;
  PKODIServiceProviderAssessment *v7;
  PKODIServiceProviderAssessment *applyTermsODISession;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  PKODIServiceProviderAssessment *v23;
  PKODIServiceProviderAssessment *createApplicationODISession;
  id v25;
  id v26;
  PKODIServiceProviderAssessment *v27;
  PKODIServiceProviderAssessment *submitApplicationODISession;
  id v29;

  featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 5)
  {
    if (self->_applyTermsODISession)
      return;
    v4 = objc_alloc(MEMORY[0x1E0D66E98]);
    v5 = *MEMORY[0x1E0D17798];
    PKPassKitCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PKODIServiceProviderAssessment *)objc_msgSend(v4, "initWithServiceProviderIdentifier:locationBundle:", v5, v6);
    applyTermsODISession = self->_applyTermsODISession;
    self->_applyTermsODISession = v7;

    -[PKODIServiceProviderAssessment startAssessment](self->_applyTermsODISession, "startAssessment");
    objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appleAccountInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aaDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryEmailAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = v17;
    if (v13)
      objc_msgSend(v17, "setObject:forKey:", v13, *MEMORY[0x1E0D176A8]);
    if (v14)
      objc_msgSend(v18, "setObject:forKey:", v14, *MEMORY[0x1E0D17690]);
    if (v15)
      objc_msgSend(v18, "setObject:forKey:", v15, *MEMORY[0x1E0D176B0]);
    if (v16)
      objc_msgSend(v18, "setObject:forKey:", v16, *MEMORY[0x1E0D17680]);
    v19 = objc_alloc_init(MEMORY[0x1E0D17578]);
    objc_msgSend(v19, "setAttributes:", v18);
    -[PKODIServiceProviderAssessment updateAssessment:](self->_applyTermsODISession, "updateAssessment:", v19);

    featureIdentifier = self->_featureIdentifier;
  }
  if (featureIdentifier == 3)
  {
    PKPassKitCoreBundle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!self->_createApplicationODISession)
    {
      -[PKAccount payLaterDetails](self->_account, "payLaterDetails");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "odiAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_alloc(MEMORY[0x1E0D66E98]);
      v23 = (PKODIServiceProviderAssessment *)objc_msgSend(v22, "initWithServiceProviderIdentifier:locationBundle:", *MEMORY[0x1E0D176C8], v29);
      createApplicationODISession = self->_createApplicationODISession;
      self->_createApplicationODISession = v23;

      -[PKODIServiceProviderAssessment startAssessment](self->_createApplicationODISession, "startAssessment");
      -[PKODIServiceProviderAssessment updateAssessment:](self->_createApplicationODISession, "updateAssessment:", v21);

    }
    if (!self->_submitApplicationODISession)
    {
      v25 = (id)*MEMORY[0x1E0D176D0];
      if (self->_applicationType == 4)
      {
        v26 = (id)*MEMORY[0x1E0D17770];

        v25 = v26;
      }
      v27 = (PKODIServiceProviderAssessment *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66E98]), "initWithServiceProviderIdentifier:locationBundle:", v25, v29);
      submitApplicationODISession = self->_submitApplicationODISession;
      self->_submitApplicationODISession = v27;

      -[PKODIServiceProviderAssessment startAssessment](self->_submitApplicationODISession, "startAssessment");
    }

  }
}

- (void)_getODIAssessmentForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  _QWORD block[4];
  id v10;
  PKApplyController *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke;
    block[3] = &unk_1E3E61450;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(workQueue, block);

  }
}

void __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke(id *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
  {
    v3 = a1[5];
    v4 = *((_QWORD *)v3 + 25);
    if (v4)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "There is already an ODISession inflight. This is an error %@", buf, 0xCu);
      }

      v2 = a1[4];
      v3 = a1[5];
    }
    objc_storeStrong((id *)v3 + 25, v2);
    objc_initWeak((id *)buf, a1[5]);
    objc_msgSend(a1[4], "computeAssessment");
    v6 = a1[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_118;
    v7[3] = &unk_1E3E6F1C8;
    objc_copyWeak(&v10, (id *)buf);
    v8 = a1[4];
    v9 = a1[6];
    objc_msgSend(v6, "waitForAssessmentWithContinueBlock:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2;
    block[3] = &unk_1E3E61850;
    v12 = 0;
    v13 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "The ODI assessment for %@ is not defined.", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_118(id *a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2_119;
  block[3] = &unk_1E3E6F1A0;
  objc_copyWeak(&v12, a1 + 6);
  v9 = a1[4];
  v6 = a1[5];
  v10 = v5;
  v11 = v6;
  v13 = a3;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2_119(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v4 = 0;
    objc_msgSend(*(id *)(a1 + 32), "provideSessionFeedback:", 1);
    goto LABEL_5;
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = WeakRetained;
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
LABEL_5:
    WeakRetained = v4;
  }

}

- (void)_sendODISessionFeedbackforInflightSessionIfNecessary
{
  PKODIServiceProviderAssessment *inflightODISession;
  uint64_t v4;
  int v5;
  PKODIServiceProviderAssessment *v6;

  inflightODISession = self->_inflightODISession;
  if (inflightODISession)
  {
    if (self->_endedApplyFlow)
    {
      v4 = 1;
    }
    else
    {
      v5 = -[PKODIServiceProviderAssessment currentAssessmentDidTimeout](inflightODISession, "currentAssessmentDidTimeout");
      inflightODISession = self->_inflightODISession;
      if (v5)
        v4 = 2;
      else
        v4 = 0;
    }
    -[PKODIServiceProviderAssessment provideSessionFeedback:](inflightODISession, "provideSessionFeedback:", v4);
    v6 = self->_inflightODISession;
    self->_inflightODISession = 0;

  }
}

- (void)_setActionIdentifiersRequiringAuthentication:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifiersRequiringAuthentication, a3);
}

- (void)_startCoreIDVSessionWithStepInfo:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  DIVerificationSession *v32;
  DIVerificationSession *idVerificationSession;
  DIVerificationSession *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  DIVerificationSession *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_documentUploadType = 1;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v40 = a4;
  v8 = objc_alloc_init(v7);
  -[PKPaymentWebService webServiceSessionMarker](self->_webService, "webServiceSessionMarker");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0D16A50]);
  v42 = (void *)v9;
  -[PKPaymentWebService _appleAccountInformation](self->_webService, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authorizationHeader");
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "setObject:forKey:", v11, *MEMORY[0x1E0D16A58]);
  -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "setObject:forKey:", v12, *MEMORY[0x1E0D6A0A8]);
  objc_msgSend(v6, "conversationIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "setObject:forKey:", v13, *MEMORY[0x1E0D6A0A0]);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v14;
  if (!v14)
    v14 = (void *)MEMORY[0x1E0D67630];
  objc_msgSend(v14, "secureElementIdentifiers");
  v39 = (void *)v12;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v8, "setObject:forKey:", v15, *MEMORY[0x1E0D6A0B0]);
  v35 = (void *)v15;
  v41 = (void *)v11;
  objc_msgSend(v6, "coreIDVServiceProviderName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[PKFeatureApplication coreIDVServiceProviderName](self->_featureApplication, "coreIDVServiceProviderName");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  v38 = (void *)v13;

  v43 = v6;
  objc_msgSend(v6, "coreIDVTier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKCurrentRegion();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLByAppendingPathComponent:", CFSTR("v1"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("applications"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v45 = (DIVerificationSession *)v8;
    v46 = 2112;
    v47 = v27;
    v48 = 2112;
    v49 = v19;
    v50 = 2112;
    v51 = v20;
    v52 = 2112;
    v53 = v21;
    _os_log_impl(&dword_19D178000, v28, OS_LOG_TYPE_DEFAULT, "Creating DIVerificationSession withHeaders:%@ serviceURL:%@ name:%@ tier:%@ region: %@", buf, 0x34u);
  }

  v29 = objc_alloc(MEMORY[0x1E0D16A48]);
  v30 = (void *)objc_msgSend(v8, "copy");
  v31 = (void *)objc_msgSend(v29, "initWithName:tier:serviceUrl:httpHeaders:", v19, v20, v27, v30);

  objc_msgSend(v31, "setRegionCode:", v21);
  v32 = (DIVerificationSession *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16A40]), "initWithContext:", v31);
  idVerificationSession = self->_idVerificationSession;
  self->_idVerificationSession = v32;

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v34 = self->_idVerificationSession;
    *(_DWORD *)buf = 138412290;
    v45 = v34;
    _os_log_impl(&dword_19D178000, v28, OS_LOG_TYPE_DEFAULT, "Created DIVerificationSession: %@", buf, 0xCu);
  }

  -[PKApplyController _performCoreIDVNextStepWithPage:completion:](self, "_performCoreIDVNextStepWithPage:completion:", 0, v40);
}

- (void)_submitCoreIDVFieldsPage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "fieldModel", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentSetupFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "attribute");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D16A30]);
    objc_msgSend(v16, "setPage:", objc_msgSend(v6, "pageNumber"));
    objc_msgSend(v16, "setAttributes:", v8);
  }
  else
  {
    v16 = 0;
  }
  -[PKApplyController _performCoreIDVNextStepWithPage:completion:](self, "_performCoreIDVNextStepWithPage:completion:", v16, v7);

}

- (void)_submitCoreIDVDocumentsPage:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v14)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0D169C0]);
    objc_msgSend(v18, "setCurrentValue:", v14);
    objc_msgSend(v18, "setFormat:", 2);
    objc_msgSend(v17, "addObject:", v18);

  }
  if (v15)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D169C0]);
    objc_msgSend(v19, "setCurrentValue:", v15);
    objc_msgSend(v19, "setFormat:", 2);
    objc_msgSend(v17, "addObject:", v19);

  }
  objc_msgSend(v13, "documentAttribute");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDocType:", 1);
  v21 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v20, "setCurrentValue:", v21);

  if (v20)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0D16A30]);
    objc_msgSend(v22, "setPage:", objc_msgSend(v12, "pageNumber"));
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAttributes:", v23);

  }
  else
  {
    v22 = 0;
  }
  -[PKApplyController _performCoreIDVNextStepWithPage:completion:](self, "_performCoreIDVNextStepWithPage:completion:", v22, v16);

}

- (void)_performCoreIDVNextStepWithPage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  DIVerificationSession *idVerificationSession;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_idVerificationSession)
  {
    v9 = mach_absolute_time();
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Calling performVerificationWithAttributes page: %@", buf, 0xCu);

    }
    idVerificationSession = self->_idVerificationSession;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_132;
    v14[3] = &unk_1E3E6F1F0;
    v16 = v9;
    v14[4] = self;
    v15 = v8;
    -[DIVerificationSession performVerificationWithAttributes:completion:](idVerificationSession, "performVerificationWithAttributes:completion:", v6, v14);
    v13 = v15;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke;
    block[3] = &unk_1E3E61590;
    v18 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v13 = v18;
  }

}

uint64_t __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: No coreIDV session", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_132(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  mach_absolute_time();
  PKSecondsFromMachTimeInterval();
  v10 = v9;
  v11 = *MEMORY[0x1E0D683C0];
  v36 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE3A74](v11, v13);

  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v27 = v10;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v15;
    v32 = 2048;
    v33 = a3;
    v34 = 2048;
    v35 = objc_msgSend(v7, "page");
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Callback from performVerificationWithAttributes timetaken(seconds): %f error: %@ attributes: %@ totalPageCount: %lu page: %lu", buf, 0x34u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_136;
  block[3] = &unk_1E3E69E60;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v21 = v8;
  v22 = v16;
  v23 = v7;
  v24 = v17;
  v25 = a3;
  v18 = v7;
  v19 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_136(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: performVerification failed", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_handleResponseError:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      return objc_msgSend(*(id *)(a1 + 40), "_handleCoreIDVPage:totalPageCount:error:completion:", v4, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56));
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "No attributes performing coreIDV share", v6, 2u);
      }

      return objc_msgSend(*(id *)(a1 + 40), "_performCoreIDVShareWithCompletion:", *(_QWORD *)(a1 + 56));
    }
  }
}

- (void)_handleCoreIDVPage:(id)a3 totalPageCount:(int64_t)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  id v36;
  id v37;
  id v38;
  PKApplyDocumentSubmissionController *v39;
  PKApplyController *v40;
  id WeakRetained;
  PKApplyDocumentSubmissionController *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  PKApplyController *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id obj;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Preparing attributes for display", buf, 2u);
  }

  objc_msgSend(v9, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    v15 = v14;
    v49 = self;
    v50 = v11;
    v51 = v10;
    v52 = v9;
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v48 = v13;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    v55 = v16;
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v68 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D672C8], "paymentSetupFieldWithDIAttribute:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v23 && objc_msgSend(v24, "length"))
            {
              objc_msgSend(v53, "addObject:", v23);
            }
            else
            {
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v74 = v22;
                _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Could not generate field with malformed attribute: %@", buf, 0xCu);
              }

            }
            v16 = v55;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v16, "count"))
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = v16;
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      if (v57)
      {
        v56 = *(_QWORD *)v64;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v64 != v56)
              objc_enumerationMutation(obj);
            v58 = v27;
            v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v27);
            v29 = objc_msgSend(v28, "acceptableDocTypes", v48);
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v28, "acceptableDocs");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v60;
              do
              {
                for (j = 0; j != v32; ++j)
                {
                  if (*(_QWORD *)v60 != v33)
                    objc_enumerationMutation(v30);
                  objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "countryCode");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v29 & 2) != 0)
                  {
                    v36 = objc_alloc_init(MEMORY[0x1E0D66D18]);
                    objc_msgSend(v36, "setCountryCode:", v35);
                    objc_msgSend(v36, "setDocumentType:", 1);
                    objc_msgSend(v36, "setDocumentAttribute:", v28);
                    objc_msgSend(v26, "addObject:", v36);

                  }
                  if ((v29 & 4) != 0)
                  {
                    v37 = objc_alloc_init(MEMORY[0x1E0D66D18]);
                    objc_msgSend(v37, "setCountryCode:", v35);
                    objc_msgSend(v37, "setDocumentType:", 2);
                    objc_msgSend(v37, "setDocumentAttribute:", v28);
                    objc_msgSend(v26, "addObject:", v37);

                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
              }
              while (v32);
            }

            v27 = v58 + 1;
          }
          while (v58 + 1 != v57);
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        }
        while (v57);
      }

      v38 = objc_alloc_init(MEMORY[0x1E0D66AF8]);
      v9 = v52;
      objc_msgSend(v38, "setPageNumber:", objc_msgSend(v52, "page"));
      objc_msgSend(v38, "setAcceptableDocuments:", v26);
      v39 = [PKApplyDocumentSubmissionController alloc];
      v40 = v49;
      WeakRetained = objc_loadWeakRetained((id *)&v49->_setupDelegate);
      v42 = -[PKApplyDocumentSubmissionController initWithController:setupDelegate:documentPage:](v39, "initWithController:setupDelegate:documentPage:", v49, WeakRetained, v38);

      -[PKApplyDocumentSubmissionController nextViewController](v42, "nextViewController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v49->_viewControllers, "addObject:", v43);

      v13 = v48;
      v44 = v53;
      v16 = v55;
    }
    else
    {
      v26 = objc_alloc_init(MEMORY[0x1E0D66B10]);
      v9 = v52;
      objc_msgSend(v26, "setPageNumber:", objc_msgSend(v52, "page"));
      objc_msgSend(v52, "title");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:", v45);

      objc_msgSend(v52, "subTitle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSubtitle:", v46);

      v44 = v53;
      v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D67300]), "initWithPaymentSetupFields:", v53);
      objc_msgSend(v26, "setFieldModel:", v38);
      v40 = v49;
      -[PKApplyController _fieldsViewControllerForPage:](v49, "_fieldsViewControllerForPage:", v26);
      v42 = (PKApplyDocumentSubmissionController *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v49->_viewControllers, "addObject:", v42);
    }

    -[PKApplyController _nextQueuedViewController](v40, "_nextQueuedViewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v50;
    (*((void (**)(id, void *, _QWORD))v50 + 2))(v50, v47, 0);

    v10 = v51;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Error: no attributes to display", buf, 2u);
    }

    -[PKApplyController _handleResponseError:completion:](self, "_handleResponseError:completion:", v10, v11);
  }

}

- (void)_performCoreIDVShareWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  DIVerificationSession *idVerificationSession;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_idVerificationSession)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    PKRequestIDHeaderValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v19 = CFSTR("x-request-id");
      v20[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x1E0D16A60]);

    }
    v9 = mach_absolute_time();
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Calling shareVerificationResultWithOptions withOptions: %@", buf, 0xCu);
    }

    idVerificationSession = self->_idVerificationSession;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_146;
    v12[3] = &unk_1E3E6F218;
    v14 = v9;
    v12[4] = self;
    v13 = v5;
    -[DIVerificationSession shareVerificationResultWithOptions:completion:](idVerificationSession, "shareVerificationResultWithOptions:completion:", v6, v12);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke;
    block[3] = &unk_1E3E61590;
    v16 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v16;
  }

}

uint64_t __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: No coreIDV session", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  mach_absolute_time();
  PKSecondsFromMachTimeInterval();
  v8 = v7;
  v9 = *MEMORY[0x1E0D683B8];
  v27 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE3A74](v9, v11);

  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v22 = v8;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Callback from shareVerificationResultWithOptions timeTaken(seconds): %f withResultingIdentifier: %@ error: %@", buf, 0x20u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_147;
  v16[3] = &unk_1E3E622D8;
  v17 = v5;
  v18 = v6;
  v13 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v13;
  v14 = v6;
  v15 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_147(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") && !*(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Requesting next steps from the server", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "_invalidateIDVSession");
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 104), v2);
    v7 = objc_alloc_init(MEMORY[0x1E0D66B30]);
    objc_msgSend(*(id *)(a1 + 48), "_performApplyWithRequest:completion:", v7, *(_QWORD *)(a1 + 56));

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error: No valid nextStepToken found", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "_handleResponseError:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (void)_submitDocumentsPage:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PKPaymentWebService *webService;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v11 = a7;
  v12 = (objc_class *)MEMORY[0x1E0D66B40];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(v12);
  -[PKFeatureApplication applicationIdentifier](self->_featureApplication, "applicationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setApplicationIdentifier:", v17);

  objc_msgSend(v16, "setFeatureIdentifier:", self->_featureIdentifier);
  -[PKFeatureApplication applicationBaseURL](self->_featureApplication, "applicationBaseURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBaseURL:", v18);

  objc_msgSend(v16, "setFrontImageData:", v14);
  objc_msgSend(v16, "setBackImageData:", v13);

  objc_msgSend(v15, "countryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDocumentCountryCode:", v19);

  v20 = objc_msgSend(v15, "documentType");
  objc_msgSend(v16, "setDocumentType:", v20);
  objc_msgSend(v16, "setCertificates:", self->_encryptionCertificates);
  objc_msgSend(v16, "setChannel:", self->_channel);
  ++self->_runningApplicationUpdates;
  v21 = (void *)-[PKFeatureApplication copy](self->_featureApplication, "copy");
  webService = self->_webService;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke;
  v25[3] = &unk_1E3E6F010;
  v25[4] = self;
  v26 = v21;
  v27 = v11;
  v23 = v11;
  v24 = v21;
  -[PKPaymentWebService submitDocumentsWithRequest:completion:](webService, "submitDocumentsWithRequest:completion:", v16, v25);

}

void __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_2;
  block[3] = &unk_1E3E669B8;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_3;
  v5[3] = &unk_1E3E61720;
  v5[4] = v1;
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v1, "_handleApplyResponse:originalFeatureApplication:error:completion:", v2, v3, v4, v5);

}

uint64_t __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_submitDocumentPageWithCoreIDVImageUpload:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[8];
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[6];
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  PKApplyController *v43;
  id v44;
  uint8_t *v45;
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v26 = a4;
  v13 = a5;
  v14 = a6;
  v28 = a7;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16A38]), "initWithData:assetType:", v13, 0);
  v16 = v14;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16A38]), "initWithData:assetType:", v14, 1);
  v52[0] = v15;
  v52[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageCaptureEncryptionCertificates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageCaptureEncryptionVersion");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v18)
  {
    PKLogFacilityTypeGetObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Error: coreIDV docment CK update requires certifiates.", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v19)
  {
    PKLogFacilityTypeGetObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Error: coreIDV docment CK update requires encryptionVersion.", buf, 2u);
    }
LABEL_9:

    -[PKApplyController _handleResponseError:completion:](self, "_handleResponseError:completion:", 0, v28);
    goto LABEL_10;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  *(_QWORD *)buf = 0;
  v47 = buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__31;
  v50 = __Block_byref_object_dispose__31;
  v51 = objc_alloc_init(MEMORY[0x1E0D66B40]);
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke;
  v39[3] = &unk_1E3E6F290;
  v40 = v18;
  v41 = v20;
  v45 = buf;
  v42 = v27;
  v43 = self;
  v44 = v26;
  objc_msgSend(v21, "addOperation:", v39);
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_156;
  v38[3] = &unk_1E3E64F70;
  v38[4] = self;
  v38[5] = buf;
  objc_msgSend(v21, "addOperation:", v38);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__31;
  v36[4] = __Block_byref_object_dispose__31;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__31;
  v34[4] = __Block_byref_object_dispose__31;
  v35 = 0;
  v33[0] = v22;
  v33[1] = 3221225472;
  v33[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3_158;
  v33[3] = &unk_1E3E636B0;
  v33[4] = self;
  v33[5] = buf;
  v33[6] = v36;
  v33[7] = v34;
  objc_msgSend(v21, "addOperation:", v33);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_7;
  v29[3] = &unk_1E3E6EE30;
  v30 = v28;
  v31 = v36;
  v32 = v34;
  v24 = (id)objc_msgSend(v21, "evaluateWithInput:completion:", v23, v29);

  v16 = v14;
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(buf, 8);

LABEL_10:
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D169F0]), "initWithCertificateChain:recipient:encryptionVersion:", a1[4], CFSTR("ivs"), a1[5]);
  v9 = objc_alloc_init(MEMORY[0x1E0D169E8]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2;
  v15[3] = &unk_1E3E6F268;
  v11 = a1[6];
  v10 = a1[7];
  v12 = (void *)a1[8];
  v19 = a1[9];
  v15[4] = v10;
  v17 = v6;
  v18 = v7;
  v16 = v12;
  v13 = v6;
  v14 = v7;
  objc_msgSend(v9, "uploadDocData:uploadSettings:completion:", v11, v8, v15);

}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3;
  block[3] = &unk_1E3E6F240;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 64);
  v13 = v5;
  v14 = v7;
  block[1] = 3221225472;
  v12 = v6;
  v15 = v8;
  v17 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v2;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error: coreIDV CK document uploaded failed %@", (uint8_t *)&v12, 0xCu);
    }

  }
  if (!*(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Error: coreIDV CK document uploaded has no data", (uint8_t *)&v12, 2u);
    }

  }
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 264), "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationIdentifier:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setFeatureIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 216));
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 264), "applicationBaseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setUploadedDocumentData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setCertificates:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 56), "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDocumentCountryCode:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setDocumentType:", objc_msgSend(*(id *)(a1 + 56), "documentType"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 240));
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32) != 0);
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_156(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 208))
  {
    v10 = *(_QWORD *)(v9 + 176);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2_157;
    v11[3] = &unk_1E3E6ED68;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = v7;
    v12 = v6;
    objc_msgSend((id)v9, "_getODIAssessmentForSession:completion:", v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2_157(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOdiAssessment:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3_158(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  __int128 v19;

  v6 = a3;
  v7 = a4;
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_4;
  v15[3] = &unk_1E3E6EDE0;
  v15[4] = v9;
  v16 = v8;
  v19 = *(_OWORD *)(a1 + 48);
  v17 = v6;
  v18 = v7;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v10, "submitDocumentsWithRequest:completion:", v11, v15);

}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_5;
  block[3] = &unk_1E3E6EDB8;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v18 = *(_QWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 56);
  v8 = (id)v11;
  v17 = v11;
  v16 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_sendODISessionFeedbackforInflightSessionIfNecessary");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_6;
  v9[3] = &unk_1E3E6ED90;
  v4 = *(_QWORD *)(a1 + 88);
  v9[4] = v2;
  v12 = v4;
  v8 = *(_OWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = (id)v8;
  v11 = v8;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_handleApplyResponse:originalFeatureApplication:error:completion:", v3, v5, v6, v9);

}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  --*(_QWORD *)(a1[4] + 160);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_7(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)_queueDocumentSubmissionWithNextStepInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  unint64_t v11;
  PKApplyDocumentSubmissionController *v12;
  id WeakRetained;
  PKApplyDocumentSubmissionController *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Preparing documention submission.", buf, 2u);
  }

  objc_msgSend(v4, "pages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v8 = v7) != 0)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "requiresCoreIDVImageCaptureUpload");
    v11 = 2;
    if (!v10)
      v11 = 3;
    self->_documentUploadType = v11;
    v12 = [PKApplyDocumentSubmissionController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v14 = -[PKApplyDocumentSubmissionController initWithController:setupDelegate:documentPage:](v12, "initWithController:setupDelegate:documentPage:", self, WeakRetained, v9);

    -[PKApplyDocumentSubmissionController nextViewController](v14, "nextViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v15);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Error: No document submission page defined.", v16, 2u);
    }

    -[PKApplyController _queueGenericErrorViewController](self, "_queueGenericErrorViewController");
  }

}

- (void)_invalidateIDVSession
{
  -[DIVerificationSession invalidate](self->_idVerificationSession, "invalidate");
}

- (void)_queueInfoFlowWithNextWithPage:(id)a3
{
  id v4;
  PKApplyExplanationViewController *v5;
  id WeakRetained;
  PKApplyExplanationViewController *v7;

  v4 = a3;
  v5 = [PKApplyExplanationViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v7 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v5, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v4);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v7);
}

- (void)_queueCompleteFlowWithNextPage:(id)a3
{
  id v4;
  PKApplyExplanationViewController *v5;
  id WeakRetained;
  PKApplyExplanationViewController *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  v5 = [PKApplyExplanationViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v7 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v5, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v4);

  -[PKExplanationViewController setShowDoneButton:](v7, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](v7, "setShowCancelButton:", 0);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __52__PKApplyController__queueCompleteFlowWithNextPage___block_invoke;
  v11 = &unk_1E3E63AE8;
  objc_copyWeak(&v12, &location);
  -[PKApplyExplanationViewController setContinueAction:](v7, "setContinueAction:", &v8);
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v7, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

BOOL __52__PKApplyController__queueCompleteFlowWithNextPage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "endApplyFlow");

  return v2 != 0;
}

- (void)_queueFieldsFlowWithNextStepInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "pages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          -[PKApplyController _fieldsViewControllerForPage:](self, "_fieldsViewControllerForPage:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v11);

        }
        else
        {
          PKLogFacilityTypeGetObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v12 = 0;
            _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected type of page found", v12, 2u);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)_fieldsViewControllerForPage:(id)a3
{
  id v4;
  PKApplyAddBeneficiaryViewController *v5;
  id v6;
  PKApplyAddBeneficiaryViewController *v7;
  unint64_t featureIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  PKApplyFieldsCollectionViewController *v23;
  id WeakRetained;
  uint64_t v25;
  PKApplyFieldsViewController *v26;
  PKApplyController *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_applicationType != 4 || self->_updateUserInfoSubType != 4)
  {
    featureIdentifier = self->_featureIdentifier;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "fieldModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paymentSetupFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v28 = self;
      v29 = v4;
      v15 = 0;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v18, "dateFieldObject", v28, v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pickerFieldObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
            v22 = featureIdentifier == 2;
          else
            v22 = 0;
          if (v22)
          {
            objc_msgSend(v19, "setCalendar:", v10);
            objc_msgSend(v19, "setLocale:", v9);
          }
          else if (v20)
          {
            v15 |= objc_msgSend(v20, "pickerType") != 0;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);

      self = v28;
      v4 = v29;
      if ((v15 & 1) != 0)
      {
        v23 = [PKApplyFieldsCollectionViewController alloc];
        WeakRetained = objc_loadWeakRetained((id *)&v28->_setupDelegate);
        v25 = -[PKApplyCollectionViewController initWithController:setupDelegate:context:applyPage:](v23, "initWithController:setupDelegate:context:applyPage:", v28, WeakRetained, v28->_context, v29);
LABEL_22:
        v7 = (PKApplyAddBeneficiaryViewController *)v25;

        goto LABEL_23;
      }
    }
    else
    {

    }
    v26 = [PKApplyFieldsViewController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v25 = -[PKApplyFieldsViewController initWithController:setupDelegate:applyPage:](v26, "initWithController:setupDelegate:applyPage:", self, WeakRetained, v4);
    goto LABEL_22;
  }
  v5 = [PKApplyAddBeneficiaryViewController alloc];
  v6 = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v7 = -[PKApplyAddBeneficiaryViewController initWithController:setupDelegate:pageContent:](v5, "initWithController:setupDelegate:pageContent:", self, v6, v4);

LABEL_23:
  return v7;
}

- (void)_queueOfferFlowWithPage:(id)a3
{
  NSString *v4;
  void *v5;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  NSDecimalNumber *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  PKApplyOfferViewController *v32;
  id WeakRetained;
  PKApplyOfferViewController *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  __CFString *v44;
  void *v45;
  NSString *v46;
  NSDecimalNumber *v47;
  id v48;

  v48 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureApplication applicationOfferDetails](self->_featureApplication, "applicationOfferDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  installmentConfiguration = self->_installmentConfiguration;
  objc_msgSend(v5, "creditLimit");
  v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKFeatureApplication hasSufficientOTBForInstallmentConfiguration:](self->_featureApplication, "hasSufficientOTBForInstallmentConfiguration:", self->_installmentConfiguration);
  objc_msgSend(v5, "detailsInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aprForPurchase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v11, "setNumberStyle:", 3);
    if ((objc_msgSend(v10, "pk_isIntegralNumber") & 1) == 0)
      objc_msgSend(v11, "setMinimumFractionDigits:", 2);
    objc_msgSend(v11, "stringFromNumber:", v10);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_5;
  }
  else
  {
    v12 = CFSTR("-");
    if (v9)
    {
LABEL_5:
      v13 = objc_alloc_init(MEMORY[0x1E0D66D20]);

      objc_msgSend(v9, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v14);

      objc_msgSend(v9, "body");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBody:", v15);

      objc_msgSend(v9, "primaryActionTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPrimaryActionTitle:", v16);

      objc_msgSend(v9, "primaryActionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPrimaryActionIdentifier:", v17);

      objc_msgSend(v9, "secondaryActionTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSecondaryActionTitle:", v18);

      objc_msgSend(v9, "secondaryActionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSecondaryActionIdentifier:", v19);

      objc_msgSend(v13, "setLayout:", 0);
      objc_msgSend(v9, "heroImageURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHeroImageURL:", v20);
      v48 = v13;
LABEL_6:

      goto LABEL_33;
    }
  }
  objc_msgSend(v48, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (installmentConfiguration)
    {
      if (v8)
        v22 = CFSTR("INSTALLMENT_APPLY_OFFER_APPROVED");
      else
        v22 = CFSTR("INSTALLMENT_APPLY_OFFER_APPROVED_INSUFFICIENT_TITLE");
      PKLocalizedBeekmanStringWithLocalization(&v22->isa, v4);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLocalizedApplyFeatureString();
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
    objc_msgSend(v48, "setTitle:", v23);

  }
  objc_msgSend(v48, "subtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    -[PKApplyController context](self, "context");
    if (PKPaymentSetupContextIsMerchantApp())
    {
      if (installmentConfiguration)
        goto LABEL_22;
      PKLocalizedApplyFeatureString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setSubtitle:", v25);
    }
    else
    {
      v25 = 0;
    }
  }

LABEL_22:
  objc_msgSend(v48, "primaryActionTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    PKLocalizedApplyFeatureString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPrimaryActionTitle:", v27);

  }
  objc_msgSend(v48, "secondaryActionTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    if (installmentConfiguration)
      v29 = v8;
    else
      v29 = 1;
    if (v29 == 1)
      PKLocalizedApplyFeatureString();
    else
      PKLocalizedBeekmanStringWithLocalization(CFSTR("INSTALLMENT_APPLY_OFFER_APPROVED_DECLINE_BUTTON"), v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSecondaryActionTitle:", v30);

  }
  objc_msgSend(v48, "body");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    if (installmentConfiguration)
    {
      v47 = v7;
      -[PKPaymentInstallmentConfiguration installmentItems](self->_installmentConfiguration, "installmentItems");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "installmentItemType");

      if ((v8 & 1) != 0)
      {
        -[PKApplyController _formatStringSuffixForItemType:](self, "_formatStringSuffixForItemType:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("INSTALLMENT_APPLY_OFFER_APPROVED_SUBTITLE"), "stringByAppendingString:", v39);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "currencyCode");
        v46 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v47, v46);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "formattedStringValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedBeekmanStringWithLocalization((NSString *)v20, v4, CFSTR("%@%@"), v12, v41);
      }
      else
      {
        v42 = -[PKPaymentInstallmentConfiguration isInStorePurchase](self->_installmentConfiguration, "isInStorePurchase");
        -[PKApplyController _formatStringSuffixForItemType:](self, "_formatStringSuffixForItemType:", v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
          v44 = CFSTR("INSTALLMENT_APPLY_OFFER_APPROVED_INSUFFICIENT_CREDIT_IN_STORE_SUBTITLE");
        else
          v44 = CFSTR("INSTALLMENT_APPLY_OFFER_APPROVED_INSUFFICIENT_CREDIT_SUBTITLE");
        -[__CFString stringByAppendingString:](v44, "stringByAppendingString:", v43);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "currencyCode");
        v46 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v47, v46);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "formattedStringValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedBeekmanStringWithLocalization((NSString *)v20, v4, CFSTR("%@%@"), v41, v12);
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setBody:", v45);

      v7 = v47;
    }
    else
    {
      PKLocalizedApplyFeatureString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setBody:", v20);
    }
    goto LABEL_6;
  }
LABEL_33:
  v32 = [PKApplyOfferViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v34 = -[PKApplyOfferViewController initWithController:setupDelegate:context:applyPage:](v32, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v48);

  -[PKApplyController loadHeroImageFromApplyExperiment](self, "loadHeroImageFromApplyExperiment");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    -[PKApplyOfferViewController setHeroImage:](v34, "setHeroImage:", v35);
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v34);

}

- (id)_formatStringSuffixForItemType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("_GENERIC");
  else
    return off_1E3E6F360[a3];
}

- (void)_queueApplicationVerificationWithNextStepInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PKApplyVerificationSMSOTPViewController *v9;
  id WeakRetained;
  uint64_t v11;
  NSObject *v12;
  PKApplyVerificationTrialDepositViewController *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  objc_msgSend(a3, "pages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "verificationType");
      switch(v8)
      {
        case 0:
          PKLogFacilityTypeGetObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Error: Verification page has unknown verification type.", v16, 2u);
          }

          -[PKApplyController _queueGenericErrorViewController](self, "_queueGenericErrorViewController");
          goto LABEL_17;
        case 2:
          v13 = [PKApplyVerificationTrialDepositViewController alloc];
          WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
          v11 = -[PKApplyVerificationTrialDepositViewController initWithController:setupDelegate:verificationPage:](v13, "initWithController:setupDelegate:verificationPage:", self, WeakRetained, v7);
          break;
        case 1:
          v9 = [PKApplyVerificationSMSOTPViewController alloc];
          WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
          v11 = -[PKApplyVerificationSMSOTPViewController initWithController:setupDelegate:context:verificationPage:](v9, "initWithController:setupDelegate:context:verificationPage:", self, WeakRetained, self->_context, v7);
          break;
        default:
          v14 = 0;
          goto LABEL_16;
      }
      v14 = (void *)v11;

LABEL_16:
      -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v14);

LABEL_17:
      goto LABEL_18;
    }
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Error: No verification page defined.", buf, 2u);
  }

  -[PKApplyController _queueGenericErrorViewController](self, "_queueGenericErrorViewController");
LABEL_18:

}

- (void)_queueApplicationTermsFlow
{
  PKApplyTermsAndConditionsViewController *v3;
  id WeakRetained;
  int64_t context;
  void *v6;
  PKApplyTermsAndConditionsViewController *v7;

  v3 = [PKApplyTermsAndConditionsViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  context = self->_context;
  -[PKFeatureApplication applicationTermsIdentifier](self->_featureApplication, "applicationTermsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKApplyTermsAndConditionsViewController initWithController:setupDelegate:context:termsIdentifier:](v3, "initWithController:setupDelegate:context:termsIdentifier:", self, WeakRetained, context, v6);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v7);
}

- (void)_queueStateReasonExplanationFlowWithPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  PKApplyStateExplanationViewController *v56;
  id WeakRetained;
  PKApplyStateExplanationViewController *v58;
  id v59;

  v59 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[PKFeatureApplication applicationStateReason](self->_featureApplication, "applicationStateReason"))
  {
    case 3:
      objc_msgSend(v59, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        PKLocalizedApplyFeatureString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v6);

      }
      objc_msgSend(v59, "subtitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        PKLocalizedApplyFeatureString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setSubtitle:", v8);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_49;
      goto LABEL_56;
    case 4:
      objc_msgSend(v59, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        PKLocalizedApplyFeatureString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v11);

      }
      objc_msgSend(v59, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        PKLocalizedApplyFeatureString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setSubtitle:", v13);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_20;
      goto LABEL_19;
    case 5:
      objc_msgSend(v59, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        PKLocalizedApplyFeatureString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v16);

      }
      objc_msgSend(v59, "subtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        PKLocalizedApplyFeatureString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setSubtitle:", v18);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_19:
        PKLocalizedApplyFeatureString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setPrimaryActionTitle:", v20);

      }
LABEL_20:
      objc_msgSend(v59, "learnMore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "buttonTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        PKLocalizedApplyFeatureString();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setButtonTitle:", v23);

      }
      objc_msgSend(v21, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        PKLocalizedApplyFeatureString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitle:", v25);

      }
      objc_msgSend(v21, "body");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_37;
      goto LABEL_55;
    case 6:
      objc_msgSend(v59, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        PKLocalizedApplyFeatureString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v28);

      }
      objc_msgSend(v59, "subtitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        PKLocalizedApplyFeatureString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setSubtitle:", v30);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        PKLocalizedApplyFeatureString();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setPrimaryActionTitle:", v32);

      }
      objc_msgSend(v59, "learnMore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "buttonTitle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        PKLocalizedApplyFeatureString();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setButtonTitle:", v34);

      }
      objc_msgSend(v21, "title");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        PKLocalizedApplyFeatureString();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitle:", v36);

      }
      objc_msgSend(v21, "body");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
LABEL_37:
        PKLocalizedApplyFeatureString();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBody:", v38);

      }
      goto LABEL_55;
    case 8:
      objc_msgSend(v59, "title");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
      {
        PKLocalizedApplyFeatureString();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v48);

      }
      objc_msgSend(v59, "subtitle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        PKLocalizedApplyFeatureString();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setSubtitle:", v50);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
        goto LABEL_49;
      goto LABEL_56;
    case 9:
      objc_msgSend(v59, "title");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
      {
        PKLocalizedMadisonString(CFSTR("INVITATION_SENT"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v54);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
        goto LABEL_56;
      PKLocalizedMadisonString(CFSTR("INVITATION_SENT_DONE"));
      v52 = objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    default:
      objc_msgSend(v59, "title");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
        PKLocalizedApplyFeatureString();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTitle:", v40);

      }
      objc_msgSend(v59, "subtitle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "appleAccountInformation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "primaryEmailAddress");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedApplyFeatureString();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setSubtitle:", v45, v44);

      }
      objc_msgSend(v59, "primaryActionTitle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
        goto LABEL_56;
LABEL_49:
      PKLocalizedApplyFeatureString();
      v52 = objc_claimAutoreleasedReturnValue();
LABEL_54:
      v21 = (void *)v52;
      objc_msgSend(v59, "setPrimaryActionTitle:", v52);
LABEL_55:

LABEL_56:
      v56 = [PKApplyStateExplanationViewController alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
      v58 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v56, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v59);

      -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v58);
      return;
  }
}

- (void)_queueProgramConsentFlowWithPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  PKApplyProgramConsentViewController *v14;
  id WeakRetained;
  PKApplyProgramConsentViewController *v16;
  id v17;

  v17 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PKLocalizedApplyFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSubtitle:", v6);

  }
  objc_msgSend(v17, "primaryActionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PKLocalizedApplyFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPrimaryActionTitle:", v8);

  }
  objc_msgSend(v17, "secondaryActionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PKLocalizedApplyFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSecondaryActionTitle:", v10);

  }
  objc_msgSend(v17, "learnMore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D66D28]);
    objc_msgSend(v17, "setLearnMore:", v11);
  }
  objc_msgSend(v11, "buttonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PKLocalizedApplyFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setButtonTitle:", v13);

  }
  v14 = [PKApplyProgramConsentViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v16 = -[PKApplyProgramConsentViewController initWithController:setupDelegate:context:applyPage:](v14, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v17);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v16);
}

- (void)_queueDeclinedFlowWithPage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPayLaterSetupFlowController *payLaterSetupController;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PKApplyDeclinedViewController *v32;
  id WeakRetained;
  PKApplyDeclinedViewController *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  PKApplyController *v41;
  BOOL v42;

  v4 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_installmentConfiguration != 0;
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __48__PKApplyController__queueDeclinedFlowWithPage___block_invoke;
  v38 = &unk_1E3E64E10;
  v7 = v4;
  v39 = v7;
  v42 = v6;
  v8 = v5;
  v40 = v8;
  v41 = self;
  v9 = (void (**)(_QWORD))_Block_copy(&v35);
  v10 = -[PKFeatureApplication applicationStateReason](self->_featureApplication, "applicationStateReason", v35, v36, v37, v38);
  switch(v10)
  {
    case 16:
      v9[2](v9);
      if (-[PKFeatureApplication feature](self->_featureApplication, "feature") == 3)
      {
        payLaterSetupController = self->_payLaterSetupController;
        if (payLaterSetupController)
        {
          if (-[PKPayLaterSetupFlowController controllerContext](payLaterSetupController, "controllerContext") == 2)
          {
            objc_msgSend(v7, "altPrimaryActionTitle");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v7, "altPrimaryActionTitle");
              v26 = objc_claimAutoreleasedReturnValue();
LABEL_27:
              v17 = (void *)v26;
              objc_msgSend(v7, "setPrimaryActionTitle:", v26);
LABEL_28:

            }
          }
        }
      }
      break;
    case 7:
      objc_msgSend(v7, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        PKLocalizedApplyFeatureString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTitle:", v28);

      }
      objc_msgSend(v7, "subtitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        PKLocalizedApplyFeatureString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSubtitle:", v30);

      }
      objc_msgSend(v7, "primaryActionTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        PKLocalizedApplyFeatureString();
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      break;
    case 6:
      objc_msgSend(v7, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        PKLocalizedApplyFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTitle:", v12);

      }
      objc_msgSend(v7, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        PKLocalizedApplyFeatureString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSubtitle:", v14);

      }
      objc_msgSend(v7, "primaryActionTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        PKLocalizedApplyFeatureString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setPrimaryActionTitle:", v16);

      }
      objc_msgSend(v7, "learnMore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "buttonTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        PKLocalizedApplyFeatureString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setButtonTitle:", v19);

      }
      objc_msgSend(v17, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        PKLocalizedApplyFeatureString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTitle:", v21);

      }
      objc_msgSend(v17, "body");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        PKLocalizedApplyFeatureString();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBody:", v23);

      }
      goto LABEL_28;
    default:
      v9[2](v9);
      break;
  }
  v32 = [PKApplyDeclinedViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v34 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v32, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v7);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v34);
}

void __48__PKApplyController__queueDeclinedFlowWithPage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
    {
      PKLocalizedBeekmanStringWithLocalization(CFSTR("INSTALLMENT_APPLY_DECLINED_TITLE"), *(NSString **)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v4);

      v5 = *(void **)(a1 + 32);
      PKLocalizedBeekmanStringWithLocalization(CFSTR("INSTALLMENT_APPLY_DECLINED_FOOTER"), *(NSString **)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisclosureTitle:", v6);
    }
    else
    {
      PKLocalizedApplyFeatureString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v6);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appleAccountInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryEmailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 296), "isInStorePurchase");
      v13 = *(void **)(a1 + 32);
      if (v12)
        v14 = CFSTR("INSTALLMENT_APPLY_DECLINED_MESSAGE_IN_STORE");
      else
        v14 = CFSTR("INSTALLMENT_APPLY_DECLINED_MESSAGE");
      PKLocalizedBeekmanStringWithLocalization(&v14->isa, *(NSString **)(a1 + 40), CFSTR("%@"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
    }
    else
    {
      v19 = v11;
      PKLocalizedApplyFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
    }
    objc_msgSend(v16, "setSubtitle:", v15, v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "primaryActionTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
      PKLocalizedBeekmanStringWithLocalization(CFSTR("INSTALLMENT_APPLY_DECLINED_CONTINUE_TITLE"), *(NSString **)(a1 + 40));
    else
      PKLocalizedApplyFeatureString();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPrimaryActionTitle:", v20);

  }
}

- (void)_queuePassActivationFlowWithCompletion:(id)a3
{
  void *v4;
  PKAccountFlowController *v5;
  PKPaymentProvisioningController *provisioningController;
  id WeakRetained;
  PKAccountFlowController *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, _QWORD);

  v11 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66840]), "initWithAccount:", self->_account);
  v5 = [PKAccountFlowController alloc];
  provisioningController = self->_provisioningController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v8 = -[PKAccountFlowController initWithAccountCredential:provisioningController:setupDelegate:context:operations:](v5, "initWithAccountCredential:provisioningController:setupDelegate:context:operations:", v4, provisioningController, WeakRetained, self->_context, 63);

  -[PKAccountFlowController setParentFlowController:](v8, "setParentFlowController:", self);
  -[PKAccountFlowController firstAccountViewController](v8, "firstAccountViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v9);
  if (v11)
  {
    -[PKApplyController _nextQueuedViewController](self, "_nextQueuedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10, 0);

  }
}

- (void)_queueEmailRequiredErrorViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  PKApplyExplanationViewController *v10;
  id WeakRetained;
  PKApplyExplanationViewController *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D66D20]);
  PKLocalizedApplyFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  PKLocalizedApplyFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v6);

  PKLocalizedApplyFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryActionTitle:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0D66D28]);
  PKLocalizedApplyFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonTitle:", v9);

  objc_msgSend(v4, "setLearnMore:", v8);
  v10 = [PKApplyExplanationViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v12 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v10, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v4);

  -[PKExplanationViewController setShowCancelButton:](v12, "setShowCancelButton:", 1);
  -[PKApplyExplanationViewController setContinueAction:](v12, "setContinueAction:", &__block_literal_global_117);
  -[PKApplyExplanationViewController setLearnMoreAction:](v12, "setLearnMoreAction:", &__block_literal_global_312);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke_3;
  v16 = &unk_1E3E6F318;
  objc_copyWeak(&v17, &location);
  -[PKApplyExplanationViewController setDoneAction:](v12, "setDoneAction:", &v13);
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v12, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

uint64_t __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=APPLE_ACCOUNT_CONTACT"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

  return 0;
}

uint64_t __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://support.apple.com/HT201356"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

  return 0;
}

BOOL __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "endApplyFlow");

  return v2 != 0;
}

- (void)_queueCannotResumeIDVFlow
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKApplyCannotResumeIDVViewController *v8;
  id WeakRetained;
  PKApplyCannotResumeIDVViewController *v10;
  id v11;

  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D66D20]);
  PKLocalizedApplyFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  PKLocalizedApplyFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v5);

  PKLocalizedApplyFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryActionTitle:", v6);

  PKLocalizedApplyFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryActionTitle:", v7);

  v8 = [PKApplyCannotResumeIDVViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v10 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v8, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v3);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v10);
}

- (void)_queueAcceptedFlowWithPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKApplyAcceptedViewController *v9;
  id WeakRetained;
  PKApplyAcceptedViewController *v11;
  id v12;

  v12 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PKLocalizedApplyFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v6);

  }
  objc_msgSend(v12, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PKLocalizedApplyFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubtitle:", v8);

  }
  v9 = [PKApplyAcceptedViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v11 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v9, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v12);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v11);
}

- (void)_queueActionFlowWithPage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PKApplyActionExplanationViewController *v8;
  id WeakRetained;
  PKApplyActionExplanationViewController *v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "primaryActionTitle"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [PKApplyActionExplanationViewController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v10 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v8, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v4);

    -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v10);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Error: Cannot generate action view controller with no title or button", v12, 2u);
    }

    -[PKApplyController _queueGenericErrorViewControllerWithPage:](self, "_queueGenericErrorViewControllerWithPage:", v4);
  }

}

- (void)_queueConfirmInfoFlowWithPage:(id)a3
{
  id v4;
  PKApplyConfirmInfoViewController *v5;
  id WeakRetained;
  PKApplyConfirmInfoViewController *v7;

  v4 = a3;
  v5 = [PKApplyConfirmInfoViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v7 = -[PKApplyConfirmInfoViewController initWithController:setupDelegate:context:applyPage:](v5, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v4);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v7);
}

- (void)_queueExpiredFlowWithPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PKLocalizedApplyFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v6);

  }
  objc_msgSend(v11, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PKLocalizedApplyFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSubtitle:", v8);

  }
  objc_msgSend(v11, "primaryActionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PKLocalizedApplyFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrimaryActionTitle:", v10);

  }
  -[PKApplyController _queueGenericErrorViewControllerWithPage:](self, "_queueGenericErrorViewControllerWithPage:", v11);

}

- (void)_queueTerminalStateFlowWithPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PKLocalizedApplyFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v6);

  }
  objc_msgSend(v11, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PKLocalizedApplyFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSubtitle:", v8);

  }
  objc_msgSend(v11, "primaryActionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PKLocalizedApplyFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrimaryActionTitle:", v10);

  }
  -[PKApplyController _queueGenericErrorViewControllerWithPage:](self, "_queueGenericErrorViewControllerWithPage:", v11);

}

- (void)_queueGenericErrorViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D66D20]);
  PKLocalizedApplyFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  PKLocalizedApplyFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v5);

  PKLocalizedApplyFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryActionTitle:", v6);

  -[PKApplyController _queueGenericErrorViewControllerWithPage:](self, "_queueGenericErrorViewControllerWithPage:", v3);
}

- (void)_queueGenericErrorViewControllerWithPage:(id)a3
{
  id v4;
  PKApplyGenericErrorViewController *v5;
  id WeakRetained;
  PKApplyGenericErrorViewController *v7;

  v4 = a3;
  v5 = [PKApplyGenericErrorViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v7 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](v5, "initWithController:setupDelegate:context:applyPage:", self, WeakRetained, self->_context, v4);

  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v7);
}

- (id)_nextQueuedViewController
{
  unint64_t viewControllerIndex;
  NSMutableArray *viewControllers;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *previousContextIdentifier;

  viewControllerIndex = self->_viewControllerIndex;
  if (viewControllerIndex >= -[NSMutableArray count](self->_viewControllers, "count"))
  {
    v5 = 0;
  }
  else
  {
    viewControllers = self->_viewControllers;
    ++self->_viewControllerIndex;
    -[NSMutableArray objectAtIndex:](viewControllers, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "currentPage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        previousContextIdentifier = self->_previousContextIdentifier;
        self->_previousContextIdentifier = v7;

      }
      else
      {
        v6 = self->_previousContextIdentifier;
        self->_previousContextIdentifier = 0;
      }

    }
  }
  return v5;
}

- (void)_acquireAssertion
{
  NSObject *v2;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  if (self->_notificationSupressionAssertion)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Notification suppression assertion already acquired", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring notification suppression assertion", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v5 = (void *)MEMORY[0x1E0D66B80];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__PKApplyController__acquireAssertion__block_invoke;
    v6[3] = &unk_1E3E6F340;
    objc_copyWeak(&v7, buf);
    objc_msgSend(v5, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("User Application Process"), v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

void __38__PKApplyController__acquireAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  id *WeakRetained;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }

    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Acquired notification suppression assertion", buf, 2u);
      }

      objc_storeStrong(WeakRetained + 19, a2);
      objc_msgSend(WeakRetained[19], "setInvalidateWhenBackgrounded:", 1);
      v12 = WeakRetained[19];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __38__PKApplyController__acquireAssertion__block_invoke_350;
      v13[3] = &unk_1E3E61310;
      objc_copyWeak(&v14, v8);
      objc_msgSend(v12, "setInvalidationHandler:", v13);
      objc_destroyWeak(&v14);
    }
  }

}

void __38__PKApplyController__acquireAssertion__block_invoke_350(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Executing notification suppression assertion invalidation handler", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 19);
    *((_QWORD *)WeakRetained + 19) = 0;

  }
}

- (void)_invalidateAssertion
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_notificationSupressionAssertion)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating notification suppression assertion", v4, 2u);
    }

    -[PKAssertion invalidate](self->_notificationSupressionAssertion, "invalidate");
  }
}

- (id)cancelAlertWithContinueAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (-[PKApplyController featureIdentifier](self, "featureIdentifier") != 5)
  {
    -[PKApplyController preferredLanguage](self, "preferredLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKApplyController applicationType](self, "applicationType");
    if (v7 >= 2)
    {
      if (v7 == 2)
      {
        PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION_FLOW_ALERT_TITLE"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION_FLOW_ALERT_BODY"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION_FLOW_ALERT_BUTTON"));
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v12 = (void *)v11;
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0DC3448];
          PKLocalizedApplyFeatureString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addAction:", v15);
          objc_msgSend(v5, "setPreferredAction:", v15);
          v16 = (void *)MEMORY[0x1E0DC3448];
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __51__PKApplyController_cancelAlertWithContinueAction___block_invoke;
          v19[3] = &unk_1E3E61CA8;
          v20 = v4;
          objc_msgSend(v16, "actionWithTitle:style:handler:", v12, 0, v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addAction:", v17);

LABEL_12:
          goto LABEL_13;
        }
LABEL_11:
        v5 = 0;
        goto LABEL_12;
      }
      if (v7 != 3)
      {
        v12 = 0;
        v10 = 0;
        v8 = 0;
        goto LABEL_11;
      }
    }
    PKLocalizedApplyFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("CANCEL_APPLY_ALERT_MESSAGE"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedApplyFeatureString();
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = 0;
LABEL_13:

  return v5;
}

uint64_t __51__PKApplyController_cancelAlertWithContinueAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_displayableErrorForError:(id)a3 showDetailedErrorFlow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int IsBridge;
  uint64_t v36;

  v4 = a4;
  v6 = a3;
  -[PKApplyController preferredLanguage](self, "preferredLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {

    goto LABEL_7;
  }
  if (objc_msgSend(v6, "code") != -1009)
  {
    v9 = objc_msgSend(v6, "code");

    if (v9 == -1001)
      goto LABEL_6;
LABEL_7:
    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);

    if (v13 && (unint64_t)objc_msgSend(v6, "code") <= 5)
    {
      objc_msgSend(v6, "localizedFailureReason");
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v6, "localizedFailureReason");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedRecoverySuggestion");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v15 = 0;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    v10 = 0;
    goto LABEL_14;
  }

LABEL_6:
  PKLocalizedApplyFeatureString();
  v10 = objc_claimAutoreleasedReturnValue();
  PKLocalizedApplyFeatureString();
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v14 = v11;
  v15 = 1;
LABEL_14:
  objc_msgSend(v6, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D169A8]);

  if ((v15 & 1) == 0 && v17 && objc_msgSend(v6, "code") == 40201 && v4)
  {
    -[PKApplyController _queueCannotResumeIDVFlow](self, "_queueCannotResumeIDVFlow");
LABEL_19:
    v18 = 0;
    goto LABEL_60;
  }
  if ((v15 & 1) == 0)
  {
    if ((v17 & 1) == 0)
    {
      objc_msgSend(v6, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D6B0B8]);

      if (!v21)
        goto LABEL_57;
      objc_msgSend(v6, "localizedFailureReason");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v6, "localizedFailureReason");
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "localizedRecoverySuggestion");
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
    }
    v19 = objc_msgSend(v6, "code");
    if (v19 > 60068)
    {
      switch(v19)
      {
        case 60069:
        case 60070:
        case 60071:
          goto LABEL_54;
        case 60072:
        case 60073:
        case 60074:
          goto LABEL_57;
        case 60075:
          PKLocalizedMadisonString(CFSTR("UNABLE_TO_INVITE_ACCOUNT_USER_ERROR_TITLE"));
          v23 = objc_claimAutoreleasedReturnValue();

          v26 = CFSTR("UNABLE_TO_INVITE_ACCOUNT_USER_ERROR_MESSAGE");
          goto LABEL_48;
        case 60076:
          PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_LIMIT_REACHED_TITLE"));
          v23 = objc_claimAutoreleasedReturnValue();

          -[PKAccount accountUserInvitationAllowedFeatureDescriptor](self->_account, "accountUserInvitationAllowedFeatureDescriptor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "maximumAccountUsers");

          PKLocalizedString(CFSTR("ACCOUNT_USER_LIMIT_REACHED_BODY"), CFSTR("%lu"), v28);
          goto LABEL_46;
        case 60077:
          PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_LIMIT_REACHED_TITLE"));
          v23 = objc_claimAutoreleasedReturnValue();

          -[PKAccount accountUserInvitationAllowedFeatureDescriptor](self->_account, "accountUserInvitationAllowedFeatureDescriptor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "maximumAccountUsers");

          PKLocalizedString(CFSTR("ACCOUNT_INVITATION_LIMIT_REACHED_BODY"), CFSTR("%lu"), v30);
LABEL_46:
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_55;
        case 60078:
          PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_TITLE"));
          v23 = objc_claimAutoreleasedReturnValue();

          v26 = CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_MESSAGE");
LABEL_48:
          PKLocalizedMadisonString(&v26->isa);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_55;
        default:
          if (v19 == 60089)
          {
            PKLocalizedApplyFeatureString();
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_56;
          }
          if (v19 != 60093)
            goto LABEL_57;
          break;
      }
      goto LABEL_54;
    }
    if (v19 > 40455)
    {
      switch(v19)
      {
        case 60001:
        case 60002:
        case 60012:
        case 60013:
        case 60028:
        case 60039:
        case 60040:
        case 60041:
        case 60042:
        case 60043:
        case 60044:
        case 60045:
        case 60046:
        case 60047:
        case 60048:
        case 60049:
        case 60050:
        case 60051:
        case 60052:
        case 60053:
        case 60056:
          goto LABEL_54;
        case 60003:
        case 60004:
        case 60005:
        case 60006:
        case 60007:
        case 60008:
        case 60009:
        case 60010:
        case 60011:
        case 60015:
        case 60016:
        case 60017:
        case 60018:
        case 60019:
        case 60020:
        case 60021:
        case 60022:
        case 60023:
        case 60024:
        case 60025:
        case 60026:
        case 60027:
        case 60029:
        case 60030:
        case 60031:
        case 60032:
        case 60033:
        case 60034:
        case 60035:
        case 60036:
        case 60037:
        case 60038:
        case 60054:
        case 60055:
        case 60058:
        case 60059:
          goto LABEL_57;
        case 60014:
          if (!v4)
            goto LABEL_57;
          v31 = objc_alloc_init(MEMORY[0x1E0D66D20]);
          PKLocalizedApplyFeatureString();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setTitle:", v32);

          PKLocalizedApplyFeatureString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setSubtitle:", v33);

          PKLocalizedPaymentString(CFSTR("CONTINUE"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setPrimaryActionTitle:", v34);

          -[PKApplyController _queueGenericErrorViewControllerWithPage:](self, "_queueGenericErrorViewControllerWithPage:", v31);
          goto LABEL_19;
        case 60057:
          PKLocalizedApplyFeatureString();
          v23 = objc_claimAutoreleasedReturnValue();

          IsBridge = PKPaymentSetupContextIsBridge();
          PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE"), IsBridge);
          v10 = objc_claimAutoreleasedReturnValue();
          PKLocalizedApplyFeatureString();
          v36 = objc_claimAutoreleasedReturnValue();

          v14 = v36;
          goto LABEL_56;
        case 60060:
          if (!v4)
            goto LABEL_57;
          -[PKApplyController _queueGenericErrorViewController](self, "_queueGenericErrorViewController");
          goto LABEL_19;
        default:
          if (v19 == 40456)
          {
            PKLocalizedPaymentString(CFSTR("INVALID_VERIFICATION_CODE_TITLE"));
            v23 = objc_claimAutoreleasedReturnValue();

            v25 = CFSTR("INVALID_VERIFICATION_CODE_MESSAGE");
          }
          else
          {
            if (v19 != 40457)
              goto LABEL_57;
            PKLocalizedPaymentString(CFSTR("EXPIRED_VERIFICATION_CODE_TITLE"));
            v23 = objc_claimAutoreleasedReturnValue();

            v25 = CFSTR("EXPIRED_VERIFICATION_CODE_MESSAGE");
          }
          PKLocalizedPaymentString(&v25->isa);
          v24 = objc_claimAutoreleasedReturnValue();
          break;
      }
LABEL_55:
      v10 = v14;
      v14 = v24;
LABEL_56:

      v10 = v23;
      goto LABEL_57;
    }
    if (v19 == 40319)
    {
      if (v4)
      {
        -[PKApplyController _queueEmailRequiredErrorViewController](self, "_queueEmailRequiredErrorViewController");
        goto LABEL_19;
      }
    }
    else if (v19 == 40423 || v19 == 40454)
    {
LABEL_54:
      PKLocalizedApplyFeatureString();
      v23 = objc_claimAutoreleasedReturnValue();

      PKLocalizedApplyFeatureString();
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
  }
LABEL_57:
  if (!(v10 | v14))
  {
    PKLocalizedApplyFeatureString();
    v10 = objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v14 = objc_claimAutoreleasedReturnValue();
  }
  PKDisplayableErrorCustom();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_60:

  return v18;
}

- (void)featureApplicationChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKApplyController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PKApplyController_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __47__PKApplyController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "feature") != 5)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v3 + 160))
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v3 + 264), "lastUpdated");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160);
        v13 = 138412802;
        v14 = v2;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = v6;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Application: %@ update recivied but ignored with timestamp: %@ because of running updates: %lu", (uint8_t *)&v13, 0x20u);

      }
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(*(id *)(v3 + 264), "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v2))
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "applicationState");
      if (v8 != objc_msgSend(*(id *)(a1 + 32), "applicationState"))
      {

LABEL_13:
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 264), *(id *)(a1 + 32));
        PKLogFacilityTypeGetObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "lastUpdated");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412546;
          v14 = v2;
          v15 = 2112;
          v16 = v12;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Application: %@ updated with timestamp: %@ - sending notification", (uint8_t *)&v13, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v4 = objc_claimAutoreleasedReturnValue();
        -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("PKApplyControllerUpdatedNotification"), 0);
        goto LABEL_16;
      }
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "applicationStateReason");
      v10 = objc_msgSend(*(id *)(a1 + 32), "applicationStateReason");

      if (v9 != v10)
        goto LABEL_13;
    }
    else
    {

    }
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v2;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Application: %@ update received but current application is identical", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_17:

}

+ (id)preferredLanguageForFeatureIdentifier:(unint64_t)a3 account:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  PKPassKitBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredLanguageForFeatureIdentifier:account:mainBundle:", a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)preferredLanguageForFeatureIdentifier:(unint64_t)a3 account:(id)a4 mainBundle:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  if (a3 != 3
    || (objc_msgSend(v7, "payLaterDetails"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "perferredLanguageWithMainBundle:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "applyServicePreferredLanguageForFeatureIdentifier:mainLanguageBundle:", a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)preferredLanguage
{
  return (id)objc_msgSend((id)objc_opt_class(), "preferredLanguageForFeatureIdentifier:account:", self->_featureIdentifier, self->_account);
}

+ (id)localizationBundleForFeatureIdentifier:(unint64_t)a3 account:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  PKPassKitBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizationBundleForFeatureIdentifier:account:mainBundle:", a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizationBundleForFeatureIdentifier:(unint64_t)a3 account:(id)a4 mainBundle:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  if (a3 != 3
    || (objc_msgSend(v7, "payLaterDetails"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "localizationBundleWithMainBundle:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "applyServiceLocalizationBundleForFeatureIdentifier:mainLanguageBundle:", a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)localizationBundle
{
  return (id)objc_msgSend((id)objc_opt_class(), "localizationBundleForFeatureIdentifier:account:", self->_featureIdentifier, self->_account);
}

- (id)_applyExperiment
{
  PKAppleCardApplyExperiment *applyExperiment;
  unint64_t featureIdentifier;
  BOOL v5;
  PKAppleCardApplyExperiment *v6;
  PKAppleCardApplyExperiment *v7;

  applyExperiment = self->_applyExperiment;
  if (!applyExperiment)
  {
    featureIdentifier = self->_featureIdentifier;
    if (!featureIdentifier)
      featureIdentifier = -[PKFeatureApplication feature](self->_featureApplication, "feature");
    if (-[PKApplyController applicationType](self, "applicationType"))
      v5 = -[PKApplyController applicationType](self, "applicationType") != 1;
    else
      v5 = 0;
    if (featureIdentifier == 2 && !v5)
    {
      v6 = (PKAppleCardApplyExperiment *)objc_alloc_init(MEMORY[0x1E0D66A78]);
      v7 = self->_applyExperiment;
      self->_applyExperiment = v6;

    }
    applyExperiment = self->_applyExperiment;
  }
  return applyExperiment;
}

- (id)_applyExperimentDetails
{
  void *v2;
  void *v3;

  -[PKApplyController _applyExperiment](self, "_applyExperiment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "experimentDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)loadHeroImageFromApplyExperiment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKApplyController _applyExperiment](self, "_applyExperiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_installmentConfiguration)
    objc_msgSend(v3, "heroInstallmentImagePath");
  else
    objc_msgSend(v3, "heroImagePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (int64_t)channel
{
  return self->_channel;
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (PKFeatureApplication)featureApplication
{
  return self->_featureApplication;
}

- (int64_t)context
{
  return self->_context;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_parentFlowController, a3);
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
  objc_storeStrong((id *)&self->_applyServiceURL, a3);
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_accessLevel = a3;
}

- (PKAccount)account
{
  return self->_account;
}

- (NSString)analyticsExistingAccountType
{
  return self->_analyticsExistingAccountType;
}

- (void)setAnalyticsExistingAccountType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)preliminaryAssessmentIdentifier
{
  return self->_preliminaryAssessmentIdentifier;
}

- (void)setPreliminaryAssessmentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (PKPayLaterSetupFlowController)payLaterSetupController
{
  return self->_payLaterSetupController;
}

- (void)setPayLaterSetupController:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterSetupController, a3);
}

- (int64_t)associatedIntent
{
  return self->_associatedIntent;
}

- (void)setAssociatedIntent:(int64_t)a3
{
  self->_associatedIntent = a3;
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (BOOL)didEncounterError
{
  return self->_didEncounterError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_payLaterSetupController, 0);
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsExistingAccountType, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_featureApplication, 0);
  objc_storeStrong((id *)&self->_inflightODISession, 0);
  objc_storeStrong((id *)&self->_applyTermsODISession, 0);
  objc_storeStrong((id *)&self->_createApplicationODISession, 0);
  objc_storeStrong((id *)&self->_submitApplicationODISession, 0);
  objc_storeStrong((id *)&self->_applyExperiment, 0);
  objc_storeStrong((id *)&self->_notificationSupressionAssertion, 0);
  objc_storeStrong((id *)&self->_idVerificationSession, 0);
  objc_storeStrong((id *)&self->_actionIdentifiersRequiringAuthentication, 0);
  objc_storeStrong((id *)&self->_previousContextIdentifier, 0);
  objc_storeStrong((id *)&self->_coreIDVNextStepToken, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_processedTermsIdentifiers, 0);
  objc_storeStrong((id *)&self->_shownTermsIdentifiers, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_pagesToSubmit, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end
