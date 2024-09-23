@implementation PKProvisioningUtility

- (PKProvisioningUtility)init
{

  return 0;
}

- (PKProvisioningUtility)initWithDestinationWebService:(id)a3 managingWebService:(id)a4
{
  id v7;
  id v8;
  PKProvisioningUtility *v9;
  PKProvisioningUtility *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningUtility;
  v9 = -[PKProvisioningUtility init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationWebService, a3);
    objc_storeStrong((id *)&v10->_managingWebService, a4);
  }

  return v10;
}

- (void)requestRequirements:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v11 = MEMORY[0x1E0C809B0];
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke;
    v17[3] = &unk_1E2AC5078;
    v17[4] = &v18;
    v12 = PKBeginBackgroundTask(CFSTR("com.apple.passbook.cardRequirements"), v17);
    v19[3] = v12;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_2;
    v13[3] = &unk_1E2AD2060;
    v13[4] = self;
    v14 = v8;
    v15 = v10;
    v16 = &v18;
    -[PKProvisioningUtility _updateRequirementsRequestForSuperEasyProvisioning:sid:completion:](self, "_updateRequirementsRequestForSuperEasyProvisioning:sid:completion:", v14, v9, v13);

    _Block_object_dispose(&v18, 8);
  }

}

void __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    PKEndBackgroundTask(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_3;
  v6[3] = &unk_1E2AD2038;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "requirementsForRequest:completion:", v2, v6);

}

void __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = v7;
  if (a2 == 1 && v12)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v9();
    goto LABEL_8;
  }
  if (v7)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 5, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_8:
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v11)
  {
    PKEndBackgroundTask(v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)_updateRequirementsRequestForSuperEasyProvisioning:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "paymentCredential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "couldSupportSuperEasyProvisioning")
    && (objc_msgSend(v10, "state"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "hasNonce"),
        v11,
        (v12 & 1) == 0))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__PKProvisioningUtility__updateRequirementsRequestForSuperEasyProvisioning_sid_completion___block_invoke;
    v13[3] = &unk_1E2ABEBB0;
    v14 = v10;
    v15 = v8;
    v16 = v9;
    -[PKProvisioningUtility nonceWithSID:completion:](self, "nonceWithSID:completion:", v15, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __91__PKProvisioningUtility__updateRequirementsRequestForSuperEasyProvisioning_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNonce:](v7, "setNonce:", v5);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v8;
      v11 = 2080;
      v12 = "-[PKProvisioningUtility _updateRequirementsRequestForSuperEasyProvisioning:sid:completion:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "[%@] %s - Failed to get nonce for serial provisioning. Returning with error %@", (uint8_t *)&v9, 0x20u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)requestEligibility:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD aBlock[5];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke;
    aBlock[3] = &unk_1E2AD20B0;
    aBlock[4] = self;
    v13 = v10;
    v21 = v13;
    v14 = _Block_copy(aBlock);
    objc_msgSend(v8, "nonce");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else if (objc_msgSend(v8, "requiresNonce"))
    {
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_3;
      v16[3] = &unk_1E2AD20D8;
      v17 = v8;
      v18 = v14;
      v19 = v13;
      -[PKProvisioningUtility nonceWithSID:completion:](self, "nonceWithSID:completion:", v9, v16);

LABEL_7:
      goto LABEL_8;
    }
    (*((void (**)(void *, id))v14 + 2))(v14, v8);
    goto LABEL_7;
  }
LABEL_8:

}

void __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_2;
  v5[3] = &unk_1E2AD2088;
  v6 = v3;
  objc_msgSend(v4, "eligibilityForRequest:completion:", a2, v5);

}

void __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = v7;
  if (a2 == 1 && v11)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (!v7)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 5, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_8;
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();
LABEL_8:

}

uint64_t __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setNonce:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 onStartPassDownload:(id)a6 completion:(id)a7
{
  -[PKProvisioningUtility requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:onStartPassDownload:sid:requireZoneCreationSuccess:completion:](self, "requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:onStartPassDownload:sid:requireZoneCreationSuccess:completion:", a3, a4, a5, a6, &stru_1E2ADF4C0, 0, a7);
}

- (void)requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 onStartPassDownload:(id)a6 sid:(id)a7 requireZoneCreationSuccess:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKPaymentCloudStoreZoneCreationManager *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = -[PKPaymentCloudStoreZoneCreationManager initWithWebService:]([PKPaymentCloudStoreZoneCreationManager alloc], "initWithWebService:", self->_destinationWebService);
  objc_initWeak(&location, self);
  objc_msgSend(v15, "eligibilityResponse");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __154__PKProvisioningUtility_requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_onStartPassDownload_sid_requireZoneCreationSuccess_completion___block_invoke;
  v29[3] = &unk_1E2AD2100;
  v37 = a8;
  objc_copyWeak(&v36, &location);
  v23 = v15;
  v30 = v23;
  v24 = v16;
  v31 = v24;
  v25 = v17;
  v32 = v25;
  v26 = v18;
  v34 = v26;
  v27 = v19;
  v33 = v27;
  v28 = v20;
  v35 = v28;
  -[PKPaymentCloudStoreZoneCreationManager triggerCloudStoreZoneCreationIfNeededForEligibilityResponse:completion:](v21, "triggerCloudStoreZoneCreationIfNeededForEligibilityResponse:completion:", v22, v29);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __154__PKProvisioningUtility_requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_onStartPassDownload_sid_requireZoneCreationSuccess_completion___block_invoke(uint64_t a1, int a2)
{
  BOOL v3;
  uint64_t v4;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 88))
    v3 = a2 == 0;
  else
    v3 = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "_requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:downloadPasses:resolveEnableRequirements:onStartPassDownload:sid:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

  }
}

- (void)requestProvisioning:(id)a3 completion:(id)a4
{
  -[PKProvisioningUtility requestProvisioning:sid:completion:](self, "requestProvisioning:sid:completion:", a3, &stru_1E2ADF4C0, a4);
}

- (void)requestProvisioning:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__PKProvisioningUtility_requestProvisioning_sid_completion___block_invoke;
  v10[3] = &unk_1E2AD2128;
  v11 = v8;
  v9 = v8;
  -[PKProvisioningUtility _requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:downloadPasses:resolveEnableRequirements:onStartPassDownload:sid:completion:](self, "_requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:downloadPasses:resolveEnableRequirements:onStartPassDownload:sid:completion:", a3, 0, 0, 0, 0, 0, a4, v10);

}

void __60__PKProvisioningUtility_requestProvisioning_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "provisioningResponse");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)_requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 downloadPasses:(BOOL)a6 resolveEnableRequirements:(BOOL)a7 onStartPassDownload:(id)a8 sid:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKAsyncUnaryOperationComposer *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  BOOL v48;
  _QWORD v49[5];
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  _QWORD *v62;
  id v63;
  BOOL v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  id location[2];

  v15 = a3;
  v16 = a4;
  v36 = a5;
  v35 = a8;
  v17 = a9;
  v18 = a10;
  v19 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_initWeak(location, self);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__40;
  v67[4] = __Block_byref_object_dispose__40;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__40;
  v65[4] = __Block_byref_object_dispose__40;
  v66 = -[PKProvisionedPassBundle _init]([PKProvisionedPassBundle alloc], "_init");
  v20 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke;
  v58[3] = &unk_1E2AD2178;
  v64 = a7;
  objc_copyWeak(&v63, location);
  v21 = v15;
  v59 = v21;
  v22 = v16;
  v60 = v22;
  v23 = v17;
  v61 = v23;
  v62 = v67;
  -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v58);
  v24 = v18;
  v34 = v22;
  v53[0] = v20;
  v53[1] = 3221225472;
  v53[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_66;
  v53[3] = &unk_1E2AD21C8;
  v25 = v21;
  v54 = v25;
  objc_copyWeak(&v57, location);
  v26 = v23;
  v55 = v26;
  v56 = v67;
  -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v53);
  v49[0] = v20;
  v49[1] = 3221225472;
  v49[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_3;
  v49[3] = &unk_1E2AC9D10;
  v49[4] = self;
  v27 = v25;
  v50 = v27;
  v51 = v67;
  v52 = v65;
  -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v49);
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_5;
  v42[3] = &unk_1E2AD2240;
  v48 = a6;
  v28 = v35;
  v45 = v28;
  v46 = v65;
  v42[4] = self;
  v29 = v36;
  v43 = v29;
  v30 = v26;
  v44 = v30;
  v47 = v67;
  -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v42);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v20;
  v38[1] = 3221225472;
  v38[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_7;
  v38[3] = &unk_1E2AC8DF8;
  v32 = v24;
  v39 = v32;
  v40 = v65;
  v41 = v67;
  v33 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v19, "evaluateWithInput:completion:", v31, v38);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&v63);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(v67, 8);
  objc_destroyWeak(location);

}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_BYTE *)(a1 + 72))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2;
    v15[3] = &unk_1E2AD2150;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 56);
    v16 = v13;
    v19 = v14;
    v18 = v8;
    v17 = v6;
    objc_msgSend(WeakRetained, "updateProvisioningRequestForEnableRequirements:externalizedAuth:sid:completion:", v10, v11, v13, v15);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Provisioning controller failed to update provisioning request with error %@", (uint8_t *)&v12, 0x16u);
    }

  }
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[6] + 16))();
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  id WeakRetained;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void (**v16)(id, id, _QWORD);
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "nonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2_67;
    v13[3] = &unk_1E2AD21A0;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 48);
    v14 = v11;
    v17 = v12;
    v16 = v7;
    v15 = v6;
    objc_msgSend(WeakRetained, "nonceWithSID:completion:", v10, v13);

  }
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2 && !v5)
    objc_msgSend(*(id *)(a1 + 32), "setNonce:", a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  v9 = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_4;
  v12[3] = &unk_1E2AD21F0;
  v13 = v6;
  v14 = v7;
  v15 = *(_OWORD *)(a1 + 48);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "provisionPassesWithRequest:completion:", v8, v12);

}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;

  v8 = a4;
  if (a2 == 1)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setProvisioningResponse:", a3);
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  (*(void (**)(void))(a1[5] + 16))();

}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (*(_BYTE *)(a1 + 80))
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "provisioningResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_6;
    v16[3] = &unk_1E2AD2218;
    v19 = *(_OWORD *)(a1 + 64);
    v18 = v10;
    v17 = v8;
    objc_msgSend(v12, "downloadAndIngestPassesForResponse:cloudStoreCoordinatorDelegate:ingestionProperties:sid:completion:", v13, v14, 0, v15, v16);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }

}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BOOL8 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v13 = v5;

  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v12 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) != 0;
  else
    v12 = 1;
  (*(void (**)(_QWORD, _QWORD, _BOOL8))(a1[5] + 16))(a1[5], a1[4], v12);

}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_7(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "provisioningResponse");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  else
    v3 = 0;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

- (void)updateProvisioningRequestForEnableRequirements:(id)a3 externalizedAuth:(id)a4 sid:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  int v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  char v39;
  id v40;
  void *v41;
  int v42;
  PKAsyncUnaryOperationComposer *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  void (**v48)(id, _QWORD, void *);
  __int128 *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  __int128 *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 *v68;
  __int128 *v69;
  char v70;
  char v71;
  _QWORD v72[4];
  id v73;
  id v74;
  __int128 *p_buf;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  __int128 *v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  PKProvisioningUtility *v85;
  id v86;
  __int128 *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  id v92;
  __int128 *v93;
  __int128 buf;
  uint64_t v95;
  char v96;
  __int128 v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (v13)
  {
    objc_msgSend(v10, "eligibilityResponse");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (!v10 || !v14)
    {
      PKLogFacilityTypeGetObject(0x26uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v97) = 138412290;
        *(_QWORD *)((char *)&v97 + 4) = v12;
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request missing request or eligibilityResponse", (uint8_t *)&v97, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v16);
      goto LABEL_31;
    }
    -[PKPaymentWebService targetDevice](self->_destinationWebService, "targetDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    *(_QWORD *)&v97 = 0;
    *((_QWORD *)&v97 + 1) = &v97;
    v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__40;
    v100 = __Block_byref_object_dispose__40;
    v101 = 0;
    if (objc_msgSend(v15, "shouldGenerateAuxiliaryCapabilities")
      && (PKPrioritizeAuxiliaryCapabilityGenerationEnabled() || (objc_msgSend(v15, "hasEnableRequirements") & 1) == 0))
    {
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke;
      v88[3] = &unk_1E2ACF908;
      v89 = v12;
      v90 = v16;
      v91 = v10;
      v92 = v15;
      v93 = &v97;
      -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v88);

      v24 = v89;
    }
    else
    {
      if (!objc_msgSend(v15, "hasEnableRequirements"))
      {
        ((void (**)(id, id, void *))v13)[2](v13, v10, 0);
LABEL_30:
        _Block_object_dispose(&v97, 8);

LABEL_31:
        goto LABEL_32;
      }
      v39 = objc_msgSend(v15, "shouldGenerateFidoKey");
      v42 = objc_msgSend(v15, "shouldSignFidoChallenge");
      -[PKPaymentWebService targetDevice](self->_destinationWebService, "targetDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deviceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Apple Watch"));

      if (v11)
        v20 = 1;
      else
        v20 = v19;
      if ((v20 & 1) == 0 && ((v42 ^ 1) & 1) == 0)
      {
        PKLogFacilityTypeGetObject(0x26uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request missing externalized auth", (uint8_t *)&buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, 0, v22);
        goto LABEL_29;
      }
      v25 = objc_msgSend(v15, "shouldGenerateTransactionKey");
      v26 = MEMORY[0x1E0C809B0];
      if (v25)
      {
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_79;
        v81[3] = &unk_1E2AD22B8;
        v27 = v12;
        v82 = v27;
        v83 = v15;
        v28 = v16;
        v84 = v28;
        v85 = self;
        v29 = v10;
        v86 = v29;
        v87 = &v97;
        -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v81);
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2;
        v76[3] = &unk_1E2AC5900;
        v77 = v27;
        v78 = v28;
        v79 = v29;
        v80 = &v97;
        -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v76);
        v30 = MEMORY[0x1E0C809B0];

        v26 = v30;
      }
      objc_msgSend(v15, "fidoProfile");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v95 = 0x2020000000;
      v96 = 0;
      v72[0] = v26;
      v72[1] = 3221225472;
      v72[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_88;
      v72[3] = &unk_1E2AC71C0;
      v32 = v16;
      v73 = v32;
      v33 = v31;
      v74 = v33;
      p_buf = &buf;
      -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v72);
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_4;
      v61[3] = &unk_1E2AD2358;
      v70 = v39;
      v68 = &buf;
      v34 = v12;
      v62 = v34;
      v40 = v32;
      v63 = v40;
      v24 = v33;
      v64 = v24;
      v35 = v15;
      v65 = v35;
      v66 = v11;
      v36 = v10;
      v71 = v42;
      v67 = v36;
      v69 = &v97;
      -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v61);
      if (objc_msgSend(v35, "shouldGenerateISO18013EncryptionKey"))
      {
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_98;
        v56[3] = &unk_1E2AC5900;
        v57 = v34;
        v58 = v40;
        v59 = v36;
        v60 = &v97;
        -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v56);

      }
      if (objc_msgSend(v35, "shouldGenerateLongTermPrivacyKey", v40))
      {
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_103;
        v50[3] = &unk_1E2ACF908;
        v51 = v34;
        v52 = v41;
        v53 = v35;
        v54 = v36;
        v55 = &v97;
        -[PKAsyncUnaryOperationComposer addOperation:](v43, "addOperation:", v50);

      }
      _Block_object_dispose(&buf, 8);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_107;
    v44[3] = &unk_1E2AD2420;
    v49 = &v97;
    v45 = v12;
    v46 = v10;
    v47 = v16;
    v48 = v13;
    v38 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v43, "evaluateWithInput:completion:", v37, v44);

    v22 = v45;
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:

}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0x26uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v41 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate auxiliary capabilities", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "subCredentialIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v28 = v9;
      v29 = v7;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(*(id *)(a1 + 56), "auxiliaryCapabilitySignatures");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (objc_msgSend(v18, "type") == 9)
            {
              v19 = -[PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata initWithSubcredentialIdentifier:]([PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata alloc], "initWithSubcredentialIdentifier:", v12);
              objc_msgSend(*(id *)(a1 + 48), "identityAccountKeyIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata setExistingAccountKeyIdentifier:](v19, "setExistingAccountKeyIdentifier:", v20);

              objc_msgSend(v18, "setKeyCreationMetadata:", v19);
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v15);
      }

      v7 = v29;
      v9 = v28;
    }
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 56), "auxiliaryCapabilityDecryptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

    objc_msgSend(*(id *)(a1 + 56), "auxiliaryCapabilitySignatures");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v23);

    v24 = *(void **)(a1 + 40);
    v25 = (void *)objc_msgSend(v21, "copy");
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_75;
    v30[3] = &unk_1E2AD2268;
    v26 = *(id *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 64);
    v31 = v26;
    v34 = v27;
    v33 = v9;
    v32 = v8;
    objc_msgSend(v24, "generateAuxiliaryCapabilitiesForRequirements:completion:", v25, v30);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_75(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAuxiliaryCapabilities:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v8 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_79(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, uint64_t);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(id, id, uint64_t);
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0x26uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate transaction key", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "transactionKeyInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request missing transaction key information", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v9[2](v9, v8, 1);
    goto LABEL_10;
  }
  v13 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_82;
  v18[3] = &unk_1E2AD2290;
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 72);
  v19 = v15;
  v22 = v16;
  v21 = v9;
  v20 = v8;
  objc_msgSend(v13, "paymentWebService:generateTransactionKeyWithParameters:withCompletion:", v14, v12, v18);

LABEL_10:
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_82(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v9 = a5;
  v10 = *(void **)(a1 + 32);
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v12, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTransactionKey:", v14);

  objc_msgSend(*(id *)(a1 + 32), "setTransactionKeyCertificateChain:", v12);
  objc_msgSend(*(id *)(a1 + 32), "setSubCredentialIdentifier:", v13);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(v11, "hexEncoding");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "uppercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setApplicationIdentifier:", v17);

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v9;
  v20 = v9;

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v20 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0x26uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate SE encryption key", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "subCredentialIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_86;
    v16[3] = &unk_1E2AD22E0;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v17 = v14;
    v20 = v15;
    v19 = v9;
    v18 = v8;
    objc_msgSend(v12, "generateSEEncryptionCertificateForSubCredentialId:completion:", v13, v16);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_86(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSeBlobDeviceEncryptionCertificate:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v8 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_88(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "relyingPartyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accountHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "keyHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_3;
    v12[3] = &unk_1E2AD0D38;
    v15 = *(_QWORD *)(a1 + 48);
    v14 = v7;
    v13 = v6;
    objc_msgSend(v8, "checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", v9, v10, v11, v12);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

uint64_t __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_3(_QWORD *a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_BYTE *)(a1 + 96))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    PKLogFacilityTypeGetObject(0x26uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v44 = v13;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request skipping fido key generation because key already exists.", buf, 0xCu);
      }

      goto LABEL_11;
    }
    if (v12)
    {
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v44 = v25;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate fido key", buf, 0xCu);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "relyingPartyIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "accountHash");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "fidoChallenge");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_93;
      v38[3] = &unk_1E2AD2308;
      v30 = *(_QWORD *)(a1 + 64);
      v39 = *(id *)(a1 + 72);
      v40 = *(id *)(a1 + 32);
      v42 = v9;
      v41 = v8;
      objc_msgSend(v26, "createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:externalizedAuth:completion:", v27, v28, v29, v30, v38);

      v24 = v39;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (*(_BYTE *)(a1 + 97))
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v44 = v15;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate fido challenge", buf, 0xCu);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v31 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "relyingPartyIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "accountHash");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "keyHash");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "fidoChallenge");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "subCredentialIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_97;
      v32[3] = &unk_1E2AD2330;
      v21 = *(_QWORD *)(a1 + 64);
      v22 = *(id *)(a1 + 72);
      v23 = *(_QWORD *)(a1 + 88);
      v33 = v22;
      v37 = v23;
      v34 = *(id *)(a1 + 32);
      v36 = v9;
      v35 = v8;
      objc_msgSend(v31, "signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:", v16, v17, v18, v19, v20, v21, v32);

      v24 = v33;
LABEL_16:

      goto LABEL_18;
    }
LABEL_17:
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
    goto LABEL_18;
  }
LABEL_11:
  (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
LABEL_18:

}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_93(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *(void **)(a1 + 32);
  v10 = a3;
  objc_msgSend(v9, "setFidoKey:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setFidoAttestation:", v10);

  PKLogFacilityTypeGetObject(0x26uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138412546;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request createFidoKeyForRelyingParty returned error %@", (uint8_t *)&v13, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_97(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setFidoSignedChallenge:", a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  PKLogFacilityTypeGetObject(0x26uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request signWithFidoKeyForRelyingParty returned error %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_98(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0x26uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate ISO18013 encryption key", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "subCredentialIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_101;
    v16[3] = &unk_1E2AD2380;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v17 = v14;
    v20 = v15;
    v19 = v9;
    v18 = v8;
    objc_msgSend(v12, "generateISOEncryptionCertificateForSubCredentialId:completion:", v13, v16);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_101(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "setIsoDeviceEncryptionAttestation:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setIsoDeviceEncryptionAuthorization:", v9);

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v12 = v7;

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v12 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_103(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0x26uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate LTPK", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "credentialAuthorityIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_106;
    v16[3] = &unk_1E2AD22E0;
    v14 = *(id *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 64);
    v17 = v14;
    v20 = v15;
    v19 = v9;
    v18 = v8;
    objc_msgSend(v13, "longTermPrivacyKeyForCredentialGroupIdentifier:reuseExisting:completion:", v12, 1, v16);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_106(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setLongTermPrivacyKey:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v8 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_107(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (objc_msgSend(a4, "isCanceled") & 1) == 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) == 0;
  PKLogFacilityTypeGetObject(0x26uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = CFSTR("N");
    if (v5)
      v9 = CFSTR("Y");
    v13 = 138412803;
    v14 = v7;
    v15 = 2113;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request updated request to %{private}@, success: %@", (uint8_t *)&v13, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "subCredentialIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v5;
  else
    v11 = 1;
  if ((v11 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "deleteKeyMaterialForSubCredentialId:", v10);
  if (v5)
    v12 = *(_QWORD *)(a1 + 40);
  else
    v12 = 0;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (void)downloadAndIngestPassesForResponse:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 ingestionProperties:(id)a5 sid:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "downloadablePasses");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningUtility _downloadAndIngestPassesFoPasses:response:cloudStoreCoordinatorDelegate:ingestionProperties:sid:completion:](self, "_downloadAndIngestPassesFoPasses:response:cloudStoreCoordinatorDelegate:ingestionProperties:sid:completion:", v17, v16, v15, v14, v13, v12);

}

- (void)downloadAndIngestPassForPassURL:(id)a3 deviceCredential:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKPaymentProvisioningPassData *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[PKPaymentProvisioningPassData initWithPassURL:]([PKPaymentProvisioningPassData alloc], "initWithPassURL:", v19);

  -[PKPaymentProvisioningPassData setDeviceCredential:](v20, "setDeviceCredential:", v18);
  -[PKPaymentProvisioningPassData setWillProvisionWithAuthenticationDisabled:](v20, "setWillProvisionWithAuthenticationDisabled:", 1);
  v22[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningUtility _downloadAndIngestPassesFoPasses:response:cloudStoreCoordinatorDelegate:ingestionProperties:sid:completion:](self, "_downloadAndIngestPassesFoPasses:response:cloudStoreCoordinatorDelegate:ingestionProperties:sid:completion:", v21, 0, v17, v16, v15, v14);

}

- (void)_downloadAndIngestPassesFoPasses:(id)a3 response:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8
{
  id v14;
  PKAsyncUnaryOperationComposer *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id obj;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  PKProvisioningUtility *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD *v60;
  _QWORD v61[7];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v40 = a4;
  v38 = a5;
  v37 = a6;
  v36 = a7;
  v32 = a8;
  v15 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v33 = v14;
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "passURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = -[PKProvisionedPassBundle _init]([PKProvisionedPassBundle alloc], "_init");
  objc_msgSend(v39, "setProvisioningResponse:", v40);
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__40;
  v66[4] = __Block_byref_object_dispose__40;
  v67 = 0;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v14, "reverseObjectEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  v21 = MEMORY[0x1E0C809B0];
  if (v20)
  {
    v22 = *(_QWORD *)v63;
    obj = v19;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v63 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v23);
        v61[0] = v21;
        v61[1] = 3221225472;
        v61[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke;
        v61[3] = &unk_1E2AC71C0;
        v61[4] = self;
        v61[5] = v24;
        v61[6] = v66;
        -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v61);
        v49[0] = v21;
        v49[1] = 3221225472;
        v49[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_3;
        v49[3] = &unk_1E2AD23F8;
        v50 = v35;
        v51 = v24;
        v52 = self;
        v53 = v38;
        v54 = v40;
        v55 = v37;
        v56 = v36;
        v57 = v39;
        v58 = v18;
        v59 = v17;
        v60 = v66;
        -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v49);

        ++v23;
      }
      while (v20 != v23);
      v19 = obj;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v20);
  }

  v47[0] = v21;
  v47[1] = 3221225472;
  v47[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_119;
  v47[3] = &unk_1E2ACF778;
  v25 = v40;
  v48 = v25;
  -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v47);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v21;
  v41[1] = 3221225472;
  v41[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2_121;
  v41[3] = &unk_1E2AD2420;
  v27 = v17;
  v42 = v27;
  v28 = v39;
  v43 = v28;
  v29 = v18;
  v44 = v29;
  v30 = v32;
  v45 = v30;
  v46 = v66;
  v31 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v15, "evaluateWithInput:completion:", v26, v41);

  _Block_object_dispose(v66, 8);
}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  int8x16_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "passURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2;
  v13[3] = &unk_1E2AD23A8;
  v14 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v10 = *(_QWORD *)(a1 + 48);
  v16 = v7;
  v17 = v10;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "passAtURL:completion:", v9, v13);

}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSecureElementPass:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "verificationRecordForPass:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeVerificationRequestRecord:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0);
}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  BOOL v32;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "passURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(void **)(a1 + 48);
  if (v8 == v9)
  {
    objc_msgSend(*(id *)(a1 + 64), "moreInfoURLs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_4;
  v23[3] = &unk_1E2AD23D0;
  v32 = v8 == v9;
  v14 = *(id *)(a1 + 88);
  v15 = *(_QWORD *)(a1 + 40);
  v24 = v14;
  v25 = v15;
  v26 = *(id *)(a1 + 96);
  v16 = *(id *)(a1 + 104);
  v17 = *(_QWORD *)(a1 + 112);
  v27 = v16;
  v31 = v17;
  v18 = *(id *)(a1 + 80);
  v29 = v6;
  v30 = v7;
  v28 = v18;
  v19 = v6;
  v20 = v7;
  objc_msgSend(v22, "ingestProvisioningPassData:cloudStoreCoordinatorDelegate:moreInfoURLs:ingestionProperties:sid:completion:", v21, v10, v11, v12, v13, v23);
  if (v8 == v9)

}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a6;
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 32), "setExpressModeSetupOptional:", a3);
    objc_msgSend(*(id *)(a1 + 32), "setExpressEnabled:", a4);
    objc_msgSend(*(id *)(a1 + 32), "setAmpEnrollmentAvailable:", a5);
  }
  objc_msgSend(*(id *)(a1 + 40), "secureElementPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 48), "pk_safelyAddObjectsFromArray:", v11);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a6);
    goto LABEL_7;
  }
  if (v12)
    goto LABEL_6;
  PKLogFacilityTypeGetObject(0x26uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "passURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "[%@] Error: No secure element pass found for %@", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

LABEL_7:
  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) != 0);

}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_119(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "idmsContactInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[PKPaymentOptionsRecents defaultInstance](PKPaymentOptionsRecents, "defaultInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateRecentsAndKeychainWithContactInformation:", v7);

  }
  v6[2](v6, v9, 0);

}

uint64_t __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2_121(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(void **)(a1 + 40);
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v2, "setProvisionedPasses:", v3);

  }
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v4, "setMoreInfoItems:", v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)ingestProvisioningPassData:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 moreInfoURLs:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  PKPaymentWebService *v21;
  void *v22;
  void *v23;
  PKAsyncUnaryOperationComposer *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  PKPaymentWebService *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  PKPaymentWebService *v38;
  id v39;
  id v40;
  PKPaymentWebService *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  PKProvisioningUtility *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _BYTE *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD v69[4];
  id v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  PKPaymentWebService *v83;
  PKProvisioningUtility *v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  PKPaymentWebService *v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD v98[3];
  char v99;
  _QWORD v100[4];
  id v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD v104[4];
  id v105;
  id v106;
  PKPaymentWebService *v107;
  id v108;
  _QWORD *v109;
  _QWORD *v110;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  id v115;
  _BYTE *v116;
  _QWORD v117[4];
  id v118;
  id v119;
  id v120;
  id v121;
  _BYTE *v122;
  _QWORD v123[3];
  char v124;
  _QWORD v125[3];
  char v126;
  _QWORD v127[5];
  id v128;
  _QWORD v129[5];
  id v130;
  _QWORD v131[5];
  id v132;
  _QWORD v133[5];
  id v134;
  _BYTE buf[24];
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v14 = a4;
  v55 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  PKLogFacilityTypeGetObject(0x26uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v57, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "[%@] Adding pass data (%@)...", buf, 0x16u);

  }
  objc_msgSend(v57, "secureElementPass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_destinationWebService;
  -[PKPaymentWebService targetDevice](v21, "targetDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "secureElementIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v53 = self;
  v52 = v17;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v136 = __Block_byref_object_copy__40;
  v137 = __Block_byref_object_dispose__40;
  v138 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x3032000000;
  v133[3] = __Block_byref_object_copy__40;
  v133[4] = __Block_byref_object_dispose__40;
  v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__40;
  v131[4] = __Block_byref_object_dispose__40;
  v132 = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x3032000000;
  v129[3] = __Block_byref_object_copy__40;
  v129[4] = __Block_byref_object_dispose__40;
  v130 = 0;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3032000000;
  v127[3] = __Block_byref_object_copy__40;
  v127[4] = __Block_byref_object_dispose__40;
  v128 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2020000000;
  v126 = 0;
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x2020000000;
  v124 = 0;
  v25 = MEMORY[0x1E0C809B0];
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke;
  v117[3] = &unk_1E2ACF908;
  v49 = v14;
  v118 = v49;
  v26 = v23;
  v119 = v26;
  v27 = v20;
  v120 = v27;
  v28 = v16;
  v121 = v28;
  v122 = buf;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v117);
  v111[0] = v25;
  v111[1] = 3221225472;
  v111[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_124;
  v111[3] = &unk_1E2ACF908;
  v29 = v27;
  v112 = v29;
  v50 = v26;
  v113 = v50;
  v30 = v22;
  v114 = v30;
  v31 = v28;
  v115 = v31;
  v116 = buf;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v111);
  v104[0] = v25;
  v104[1] = 3221225472;
  v104[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_129;
  v104[3] = &unk_1E2AD24E8;
  v109 = v131;
  v51 = v29;
  v105 = v51;
  v32 = v30;
  v106 = v32;
  v33 = v21;
  v107 = v33;
  v54 = v15;
  v108 = v54;
  v110 = v133;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v104);
  v100[0] = v25;
  v100[1] = 3221225472;
  v100[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_6;
  v100[3] = &unk_1E2AD2600;
  v102 = v133;
  v34 = v31;
  v101 = v34;
  v103 = v131;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v100);
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v99 = 0;
  v91[0] = v25;
  v91[1] = 3221225472;
  v91[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_135;
  v91[3] = &unk_1E2AD24E8;
  v96 = v133;
  v97 = v98;
  v35 = v57;
  v92 = v35;
  v36 = v34;
  v93 = v36;
  v37 = v32;
  v94 = v37;
  v38 = v33;
  v95 = v38;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v91);
  v79[0] = v25;
  v79[1] = 3221225472;
  v79[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_139;
  v79[3] = &unk_1E2AD2588;
  v85 = v98;
  v39 = v36;
  v80 = v39;
  v86 = v131;
  v58 = v37;
  v81 = v58;
  v87 = v133;
  v40 = v35;
  v82 = v40;
  v88 = v125;
  v41 = v38;
  v83 = v41;
  v84 = v53;
  v89 = v129;
  v90 = v127;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v79);
  v73[0] = v25;
  v73[1] = 3221225472;
  v73[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_151;
  v73[3] = &unk_1E2AD25B0;
  v77 = v129;
  v78 = v127;
  v76 = v133;
  v73[4] = v53;
  v56 = v55;
  v74 = v56;
  v42 = v39;
  v75 = v42;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v73);
  v69[0] = v25;
  v69[1] = 3221225472;
  v69[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3_160;
  v69[3] = &unk_1E2AD2600;
  v71 = v133;
  v72 = v123;
  v43 = v42;
  v70 = v43;
  -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v69);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v25;
  v59[1] = 3221225472;
  v59[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_164;
  v59[3] = &unk_1E2AD2628;
  v63 = buf;
  v45 = v52;
  v62 = v45;
  v46 = v40;
  v60 = v46;
  v64 = v133;
  v47 = v51;
  v61 = v47;
  v65 = v127;
  v66 = v125;
  v67 = v129;
  v68 = v123;
  v48 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v24, "evaluateWithInput:completion:", v44, v59);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v123, 8);
  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v127, 8);

  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);

  _Block_object_dispose(v133, 8);
  _Block_object_dispose(buf, 8);

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  +[PKDownloadRemoteAssetConfiguration configurationWithCloudStoreDelegate:seids:](PKDownloadRemoteAssetConfiguration, "configurationWithCloudStoreDelegate:seids:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2;
  v14[3] = &unk_1E2AD2448;
  v9 = *(void **)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v17 = v7;
  v18 = v11;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "downloadRemoteAssetsWithConfiguration:completion:", v8, v14);

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2(_QWORD *a1, int a2, void *a3, float a4)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  double v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a2)
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v11 = 138413058;
      v12 = v10;
      v13 = 1024;
      v14 = 1;
      v15 = 2048;
      v16 = a4;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Download of remote assets after /enable called completion handler with finished=%i progress=%f error=%@", (uint8_t *)&v11, 0x26u);
    }

    if (v8)
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_124(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "iso18013BlobsForSecureElementIdentifiers:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to save iso blobs before saving pass", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 48);
    v12 = objc_msgSend(*(id *)(a1 + 32), "cardType");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_127;
    v13[3] = &unk_1E2ABEAE8;
    v16 = *(_QWORD *)(a1 + 64);
    v15 = v7;
    v14 = v6;
    objc_msgSend(v11, "addISO18013Blobs:cardType:completion:", v8, v12, v13);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PKAddSecureElementPassErrorDomain"), 3, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_129(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id *v17;
  char v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_opt_respondsToSelector();
  v12 = *(void **)(a1 + 40);
  if ((v11 & 1) != 0)
  {
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "paymentPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 56);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3;
    v28[3] = &unk_1E2AD2470;
    v30[1] = *(_QWORD *)(a1 + 72);
    v16 = (id *)v30;
    v30[0] = v7;
    v17 = &v29;
    v29 = v6;
    objc_msgSend(v12, "paymentWebService:addSecureElementPass:properties:completion:", v13, v14, v15, v28);
  }
  else
  {
    v18 = objc_opt_respondsToSelector();
    v20 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "paymentPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v18 & 1) != 0)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4;
      v25[3] = &unk_1E2AD2470;
      v27[1] = *(_QWORD *)(a1 + 72);
      v16 = (id *)v27;
      v27[0] = v7;
      v17 = &v26;
      v26 = v6;
      objc_msgSend(v20, "paymentWebService:addPaymentPass:withCompletionHandlerV2:", v19, v14, v25);
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_5;
      v21[3] = &unk_1E2AD2498;
      v24[1] = *(_QWORD *)(a1 + 72);
      v16 = &v22;
      v22 = *(id *)(a1 + 32);
      v17 = (id *)v24;
      v24[0] = v7;
      v23 = v6;
      objc_msgSend(v20, "paymentWebService:addPaymentPass:withCompletionHandler:", v19, v14, v21);

      v14 = v23;
    }
  }

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_6(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "devicePrimaryPaymentApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Warning: Newly added pass with identifier: %@ has no devicePrimaryPaymentApplication. Here be dragons!", (uint8_t *)&v12, 0x16u);
    }

  }
  v7[2](v7, v6, 0);

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_135(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void (**v35)(id, id, _QWORD);
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isCarKeyPass") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v7[2](v7, v6, 0);
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "devicePrimaryPaymentApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subcredentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
    if (v11 != 1)
    {
      v19 = v11;
      PKLogFacilityTypeGetObject(0x26uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v38 = v21;
        v39 = 2048;
        v40 = v19;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "[%@] Skipping device credential merge due to constraint failure (serverCredentials count: %lu)", buf, 0x16u);
      }

      v7[2](v7, v6, 0);
      goto LABEL_27;
    }
    objc_msgSend(v10, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v14;
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      if (!v15 || !v16)
      {

        goto LABEL_20;
      }
      v18 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v18 & 1) == 0)
      {
LABEL_20:
        PKLogFacilityTypeGetObject(0x26uLL);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v8, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v38 = v28;
          v39 = 2112;
          v40 = (uint64_t)v29;
          v41 = 2112;
          v42 = v30;
          _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "[%@] Skipping device credential merge due to constraint failure (device credential identifier %@ does not match with identifier on pass %@)", buf, 0x20u);

LABEL_24:
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      PKAppletSubcredentialMergeDeviceCredential(v12, v8);
      PKLogFacilityTypeGetObject(0x26uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v38 = v23;
        v39 = 2112;
        v40 = (uint64_t)v12;
        v41 = 2112;
        v42 = v8;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Inflated credential %@ from %@", buf, 0x20u);
      }

      v24 = *(_QWORD *)(a1 + 56);
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_138;
      v32[3] = &unk_1E2AD24C0;
      v26 = *(void **)(a1 + 48);
      v33 = *(id *)(a1 + 40);
      v36 = *(_OWORD *)(a1 + 64);
      v35 = v7;
      v34 = v6;
      objc_msgSend(v26, "paymentWebService:updateMetadataOnPass:withCredential:completion:", v24, v25, v12, v32);

      goto LABEL_26;
    }
    PKLogFacilityTypeGetObject(0x26uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "uniqueID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v31;
      v39 = 2112;
      v40 = (uint64_t)v29;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "[%@] Unable to update credential metadata on pass: %@", buf, 0x16u);
      goto LABEL_24;
    }
LABEL_25:

    v7[2](v7, v6, 0);
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  v7[2](v7, v6, 0);
LABEL_29:

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_138(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  PKLogFacilityTypeGetObject(0x26uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = a1[4];
      objc_msgSend(v4, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Updated credential metadata on pass: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
  }
  else
  {
    if (v6)
    {
      v9 = a1[4];
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Failed to update credential metadata on pass: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_139(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint32_t v39;
  id WeakRetained;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void (**v48)(_QWORD);
  _QWORD v49[4];
  id v50;
  id v51;
  void (**v52)(_QWORD);
  id v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if ((PKTargetDeviceSupportsExpress(*(void **)(a1 + 40)) & 1) != 0)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_140;
      aBlock[3] = &unk_1E2AD2538;
      v63 = *(_QWORD *)(a1 + 88);
      v57 = *(id *)(a1 + 40);
      v58 = *(id *)(a1 + 32);
      v10 = *(id *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 96);
      v59 = v10;
      v64 = v11;
      v12 = *(id *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 104);
      v60 = v12;
      v65 = v13;
      v14 = v9;
      v62 = v14;
      v47 = v8;
      v61 = v47;
      v48 = (void (**)(_QWORD))_Block_copy(aBlock);
      v15 = objc_msgSend(*(id *)(a1 + 48), "willProvisionWithAuthenticationDisabled");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "devicePrimaryContactlessPaymentApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "paymentNetworkIdentifier");

      v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "hasAssociatedPeerPaymentAccount");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "devicePaymentApplications");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "pk_hasObjectPassingTest:", &__block_literal_global_129);

      PKLogFacilityTypeGetObject(0x26uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v15 && v20)
      {
        if (v22)
        {
          v23 = *(_QWORD *)(a1 + 32);
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v67 = v23;
          v68 = 2112;
          v69 = v24;
          _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to set pass %@ as express", buf, 0x16u);
        }

        v25 = v48;
        v48[2](v48);
        goto LABEL_29;
      }
      if ((unint64_t)(v17 - 1) > 0x62)
      {
        if (v22)
        {
          v36 = *(_QWORD *)(a1 + 32);
          v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          *(_DWORD *)buf = 138413058;
          v67 = v36;
          v68 = 2112;
          v69 = v37;
          v70 = 2048;
          v71 = v15;
          v72 = 2048;
          v73 = v20;
          v35 = "[%@] Unable to attempt to set pass %@ as express (applet provisioned as express: %ld, pass supports express %ld)";
          v38 = v21;
          v39 = 42;
LABEL_27:
          _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, v35, buf, v39);
        }
      }
      else
      {
        if (v22)
        {
          v32 = *(_QWORD *)(a1 + 32);
          v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v67 = v32;
          v68 = 2112;
          v69 = v33;
          _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Checking if open loop pass %@ is in supported market", buf, 0x16u);
        }

        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v34 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v67 = v34;
            v35 = "[%@] PKPaymentProvisioningController: Peer payment pass does not support automatic express enablement";
LABEL_26:
            v38 = v21;
            v39 = 12;
            goto LABEL_27;
          }
        }
        else
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 64) + 24));

          if (WeakRetained)
          {
            v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 64) + 24));
            v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_149;
            v49[3] = &unk_1E2AD2560;
            v43 = *(id *)(a1 + 32);
            v44 = *(_QWORD *)(a1 + 80);
            v50 = v43;
            v45 = *(_QWORD *)(a1 + 112);
            v54 = v44;
            v55 = v45;
            v25 = v48;
            v52 = v48;
            v53 = v14;
            v51 = v47;
            objc_msgSend(v41, "verifyPassIsSupportedForExpressInLocalMarket:completion:", v42, v49);

LABEL_29:
            goto LABEL_30;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v46 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v67 = v46;
            v35 = "[%@] PKPaymentProvisioningController: nil dataProvider, cannot verify support for automatic express enablement";
            goto LABEL_26;
          }
        }
      }

      (*((void (**)(id, id, _QWORD))v14 + 2))(v14, v47, 0);
      v25 = v48;
      goto LABEL_29;
    }
    PKLogFacilityTypeGetObject(0x26uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v67 = v30;
      v68 = 2112;
      v69 = v31;
      v29 = "[%@] Skipping express ingestion logic. Target device (%@) does not support express";
      goto LABEL_12;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v67 = v27;
      v68 = 2112;
      v69 = v28;
      v29 = "[%@] Unable to attempt to set pass %@ as express (precondition not satisfied)";
LABEL_12:
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    }
  }

  (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
LABEL_30:

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_140(uint64_t a1)
{
  char v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = PKGymKitConflictsWithPass(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(void **)(a1 + 32));
  PKLogFacilityTypeGetObject(0x26uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    *(_DWORD *)buf = 138412802;
    v25 = v4;
    v26 = 2112;
    v27 = v5;
    v28 = 1024;
    v29 = v6;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Pass data:%@ has optional express mode:%d", buf, 0x1Cu);

  }
  v7 = *(void **)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "paymentPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_141;
    v20[3] = &unk_1E2ACF8E0;
    v23 = *(_QWORD *)(a1 + 96);
    v22 = *(id *)(a1 + 72);
    v21 = *(id *)(a1 + 64);
    objc_msgSend(v7, "paymentWebService:handlePotentialExpressPass:withCompletionHandler:", v12, v13, v20);

    v11 = v22;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_145;
    v16[3] = &unk_1E2AD2510;
    v19 = *(_QWORD *)(a1 + 88);
    v18 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v8, "paymentWebService:canHandlePotentialExpressPass:withCompletionHandler:", v9, v10, v16);

    v11 = v18;
LABEL_7:

    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Ignoring express setup - Missing paymentWebService:canHandlePotentialExpressPass:withCompletionHandler: from target device:%@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_141(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_145(_QWORD *a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2 != 0;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], 0);
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsExpress");
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_149(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(0x26uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = a1[4];
      v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to set open loop pass %@ as express", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "safelyAddObject:", v5);
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (v7)
    {
      v10 = a1[4];
      v11 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Open loop pass %@ is not in supported market, skipping attempt to set pass as express", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_151(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  __CFString *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "serialNumber");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1E2ADF4C0;
  v11 = v10;

  if ((*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40)
     || (objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "removeAllObjects"),
         *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40)))
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (__CFString *)v14;
    else
      v16 = &stru_1E2ADF4C0;
    v17 = v16;

    v30[0] = CFSTR("automaticExpressModes");
    v30[1] = CFSTR("passSerialNumber");
    v31[0] = v17;
    v31[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = CFSTR("passSerialNumber");
    v29 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)a1[4];
  v19 = a1[5];
  v20 = a1[6];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_158;
  v24[3] = &unk_1E2AD0088;
  v21 = a1[9];
  v26 = v7;
  v27 = v21;
  v25 = v6;
  v22 = v6;
  v23 = v7;
  objc_msgSend(v18, "downloadMoreInfoItemsFrom:metadata:sid:completion:", v19, v12, v20, v24);

}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_158(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3_160(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;

  v6 = a3;
  v7 = a4;
  +[PKAMPEnrollmentManager sharedManager](PKAMPEnrollmentManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "shouldOfferAMPEnrollmentForPaymentPass:", v9);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4_162;
    v12[3] = &unk_1E2AD25D8;
    v16 = *(_OWORD *)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v15 = v7;
    v14 = v6;
    objc_msgSend(v8, "enrollmentStatusForPaymentPass:completion:progress:", v11, v12, 0);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4_162(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "devicePrimaryBarcodePaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "paymentNetworkIdentifier");
  v10 = a2 == 1 && v7 == 123 && v5 == 0;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v10;
  PKLogFacilityTypeGetObject(0x26uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[4];
    v13 = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
    v14 = 138412802;
    v15 = v12;
    v16 = 1024;
    v17 = v13;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "[%@] AMP offer should be presented:%d (%@)", (uint8_t *)&v14, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_164(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v2 = (void *)a1[4];
    v3 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    if (!v3)
      v3 = a1[5];
    objc_msgSend(v2, "setSecureElementPass:", v3);
    v4 = a1[6];
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "count");
    if (v5)
      v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "copy");
    else
      v6 = 0;
    (*(void (**)(uint64_t, id, _QWORD, BOOL, _QWORD, _QWORD))(v4 + 16))(v4, v6, *(unsigned __int8 *)(*(_QWORD *)(a1[10] + 8) + 24), objc_msgSend(*(id *)(*(_QWORD *)(a1[11] + 8) + 40), "count") != 0, *(unsigned __int8 *)(*(_QWORD *)(a1[12] + 8) + 24), 0);
    if (v5)

  }
}

- (void)downloadMoreInfoItemsFrom:(id)a3 metadata:(id)a4 sid:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  PKPaymentSetupMoreInfoItem *v11;
  void *v12;
  PKPaymentSetupMoreInfoItem *v13;
  PKPaymentSetupMoreInfoItem *v14;
  void *v15;
  PKPaymentSetupMoreInfoItem *v16;
  void *v17;
  void *v18;
  int IsAvailable;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PKPaymentWebService *destinationWebService;
  id v35;
  id v36;
  void *v37;
  id v38;
  NSObject *queue;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  id v48;
  NSObject *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[6];

  v59[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v41 = a5;
  v38 = a6;
  queue = dispatch_queue_create("itemsQueue", 0);
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (PKShowFakeMoreInfo())
  {
    v11 = [PKPaymentSetupMoreInfoItem alloc];
    v58[0] = CFSTR("title");
    v58[1] = CFSTR("body");
    v59[0] = CFSTR("Fake Title 1");
    v59[1] = CFSTR("Fake Body");
    v58[2] = CFSTR("linkURL");
    v58[3] = CFSTR("linkText");
    v59[2] = CFSTR("wallet.apple.com");
    v59[3] = CFSTR("Fake Link 1");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKPaymentSetupMoreInfoItem initWithMoreInfoDictionary:](v11, "initWithMoreInfoDictionary:", v12);

    objc_msgSend(v42, "addObject:", v13);
    v14 = [PKPaymentSetupMoreInfoItem alloc];
    v56[0] = CFSTR("title");
    v56[1] = CFSTR("body");
    v57[0] = CFSTR("Fake Title 2");
    v57[1] = CFSTR("Fake Body");
    v56[2] = CFSTR("linkURL");
    v56[3] = CFSTR("linkText");
    v57[2] = CFSTR("wallet.apple.com");
    v57[3] = CFSTR("Fake Link 2");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKPaymentSetupMoreInfoItem initWithMoreInfoDictionary:](v14, "initWithMoreInfoDictionary:", v15);

    objc_msgSend(v42, "addObject:", v16);
  }
  if (v10)
    v17 = v10;
  else
    v17 = (void *)MEMORY[0x1E0C9AA70];
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  IsAvailable = PKPearlIsAvailable();
  v20 = 2;
  if (IsAvailable)
    v20 = 3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("authType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PKScreenScale());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("screenScale"));

  PKOSVersion();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("osVersion"));

  PKDeviceClass();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("deviceClass"));

  v37 = v18;
  v26 = (void *)objc_msgSend(v18, "copy");

  v27 = dispatch_group_create();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v28 = v9;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v32);
        dispatch_group_enter(v27);
        destinationWebService = self->_destinationWebService;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke;
        v46[3] = &unk_1E2AD2650;
        v47 = queue;
        v48 = v42;
        v49 = v27;
        v50 = v41;
        -[PKPaymentWebService moreInfoItemAtURL:withMetadata:completion:](destinationWebService, "moreInfoItemAtURL:withMetadata:completion:", v33, v26, v46);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v30);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_195;
  block[3] = &unk_1E2ABDA18;
  v44 = v42;
  v45 = v38;
  v35 = v42;
  v36 = v38;
  dispatch_group_notify(v27, queue, block);

}

void __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _BYTE block[24];
  void *v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_2;
    v12[3] = &unk_1E2ABE0F8;
    v8 = *(NSObject **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    v9 = v12;
    *(_QWORD *)block = v7;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __dispatch_async_ar_block_invoke_11;
    v17 = &unk_1E2ABD9A0;
    v18 = v9;
    dispatch_async(v8, block);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)block = 138412546;
      *(_QWORD *)&block[4] = v11;
      *(_WORD *)&block[12] = 2112;
      *(_QWORD *)&block[14] = v6;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Failed to download more info url with error: %@", block, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_195(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)nonceWithSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentWebService *destinationWebService;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    destinationWebService = self->_destinationWebService;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PKProvisioningUtility_nonceWithSID_completion___block_invoke;
    v10[3] = &unk_1E2AD2678;
    v12 = v7;
    v11 = v6;
    -[PKPaymentWebService paymentProvisioningNonceOfType:completion:](destinationWebService, "paymentProvisioningNonceOfType:completion:", 0, v10);

  }
}

void __49__PKProvisioningUtility_nonceWithSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "nonce");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 || !v6)
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "[%@] [PKProvisioningUtility nonceWithCompletion]: failed with error: %@.", (uint8_t *)&v11, 0x16u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

- (PKProvisioningUtilityDataHelper)dataProvider
{
  return (PKProvisioningUtilityDataHelper *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (void)setDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_managingWebService, 0);
  objc_storeStrong((id *)&self->_destinationWebService, 0);
}

@end
