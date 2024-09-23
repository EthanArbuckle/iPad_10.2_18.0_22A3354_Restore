@implementation PKOrderPhysicalCardController

- (PKOrderPhysicalCardController)initWithAccountService:(id)a3 paymentWebService:(id)a4 paymentPass:(id)a5 account:(id)a6 accountUser:(id)a7 orderReason:(unint64_t)a8 context:(int64_t)a9 currentPhysicalCard:(id)a10
{
  id v16;
  id v17;
  id v18;
  PKOrderPhysicalCardController *v19;
  PKOrderPhysicalCardController *v20;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)PKOrderPhysicalCardController;
  v19 = -[PKOrderPhysicalCardController init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accountService, a3);
    objc_storeStrong((id *)&v20->_paymentWebService, a4);
    objc_storeStrong((id *)&v20->_paymentPass, a5);
    objc_storeStrong((id *)&v20->_account, a6);
    objc_storeStrong((id *)&v20->_accountUser, a7);
    v20->_orderReason = a8;
    v20->_featureIdentifier = -[PKAccount feature](v20->_account, "feature");
    v20->_paymentSetupContext = a9;
    objc_storeStrong((id *)&v20->_physicalCardToReplace, a10);
  }

  return v20;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKSetupFlowControllerProtocol *parentFlowController;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  parentFlowController = self->_parentFlowController;
  if (parentFlowController)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__PKOrderPhysicalCardController_nextViewControllerWithCompletion___block_invoke;
    v7[3] = &unk_1E3E6DB80;
    v7[4] = self;
    v8 = v4;
    -[PKSetupFlowControllerProtocol nextViewControllerWithCompletion:](parentFlowController, "nextViewControllerWithCompletion:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __66__PKOrderPhysicalCardController_nextViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

}

- (void)updateCustomizationOptionsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *paymentWebService;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  PKPaymentWebService *v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  uint8_t *v24;
  _QWORD v25[5];
  NSObject *v26;
  _QWORD *v27;
  uint8_t *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[5];
  NSObject *v32;
  _QWORD *v33;
  uint8_t *v34;
  _QWORD v35[3];
  char v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Updating physical card customization options...", buf, 2u);
  }

  v6 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__27;
  v41 = __Block_byref_object_dispose__27;
  v42 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0D66A00]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountIdentifier:", v8);

  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v9);

  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountUserAltDSID:", v10);

  dispatch_group_enter(v6);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  paymentWebService = self->_paymentWebService;
  v12 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke;
  v31[3] = &unk_1E3E6DBD0;
  v33 = v35;
  v31[4] = self;
  v34 = buf;
  v13 = v6;
  v32 = v13;
  -[PKPaymentWebService customizePhysicalCardWithRequest:completion:](paymentWebService, "customizePhysicalCardWithRequest:completion:", v7, v31);
  v14 = objc_alloc_init(MEMORY[0x1E0D66950]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccountIdentifier:", v15);

  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBaseURL:", v16);

  dispatch_group_enter(v13);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v17 = self->_paymentWebService;
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_15;
  v25[3] = &unk_1E3E6DBF8;
  v25[4] = self;
  v27 = v29;
  v28 = buf;
  v18 = v13;
  v26 = v18;
  -[PKPaymentWebService accountUserInfoWithRequest:completion:](v17, "accountUserInfoWithRequest:completion:", v14, v25);
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_18;
  block[3] = &unk_1E3E6DC20;
  v22 = v35;
  v23 = v29;
  v24 = buf;
  block[4] = self;
  v21 = v4;
  v19 = v4;
  dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(buf, 8);
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6DBA8;
  v13 = v5;
  v14 = v6;
  v7 = *(_QWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v8 = (id)v11;
  v16 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    LOBYTE(v2) = *(_QWORD *)(a1 + 40) == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "priceOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    objc_msgSend(*(id *)(a1 + 32), "nameOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(void **)(v8 + 104);
    *(_QWORD *)(v8 + 104) = v7;

    objc_msgSend(*(id *)(a1 + 32), "artworkOptions");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(v11 + 112);
    *(_QWORD *)(v11 + 112) = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 112), "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(v14 + 120);
    *(_QWORD *)(v14 + 120) = v13;
  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = *(id *)(a1 + 40);
    v15 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
  }

  PKLogFacilityTypeGetObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v20 = *(_QWORD *)(a1 + 40);
    v21 = 138543618;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Updated physical card customization options %{public}@, error: %@", (uint8_t *)&v21, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2_16;
  block[3] = &unk_1E3E6DBA8;
  v13 = v5;
  v14 = v6;
  v7 = *(_QWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v8 = (id)v11;
  v16 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2_16(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    LOBYTE(v2) = *(_QWORD *)(a1 + 40) == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "primaryUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postalAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(v7 + 128);
    *(_QWORD *)(v7 + 128) = v6;

  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(id *)(a1 + 40);
    v3 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Updated physical card customization options %{public}@, error: %@", (uint8_t *)&v14, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_18(_QWORD *a1)
{
  id v2;

  if (a1[5])
  {
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), objc_msgSend(*(id *)(a1[4] + 24), "feature"), 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();

  }
}

- (void)startOrderPhysicalCardWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  PKPaymentWebService *paymentWebService;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Starting physical card order...", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke;
  aBlock[3] = &unk_1E3E6DCE8;
  aBlock[4] = self;
  v7 = v4;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentWebService = self->_paymentWebService;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_5;
    v11[3] = &unk_1E3E6DD10;
    v12 = v8;
    objc_msgSend(v9, "paymentWebService:deviceMetadataWithFields:completion:", paymentWebService, 251, v11);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v8 + 2))(v8, 0);
  }

}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  void *v24;
  _QWORD v25[5];
  void *v26;
  _QWORD aBlock[5];
  id v28;

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E3E6DC48;
  v5 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v28 = v5;
  v6 = a2;
  v7 = _Block_copy(aBlock);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 5);
    objc_msgSend(v8, "setReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v8, "setNameOnCard:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(*(id *)(a1 + 32), "_priceForRequestingPhysicalCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPriceOption:", v9);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    objc_msgSend(*(id *)(v10 + 48), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "accountIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "altDSID");
    v14 = objc_claimAutoreleasedReturnValue();
    v25[0] = v4;
    v25[1] = 3221225472;
    v25[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_22;
    v25[3] = &unk_1E3E6DC98;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = &v26;
    v25[4] = v15;
    v26 = v7;
    v17 = v7;
    objc_msgSend(v11, "beginPhysicalCardAction:onPhysicalCardWithIdentifier:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:", v8, v12, v13, v14, v6, v25);

    v6 = (id)v14;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D674D0]);
    objc_msgSend(v8, "setReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v8, "setNameOnCard:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArtworkIdentifier:", v18);

    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 8);
    objc_msgSend(*(id *)(v19 + 24), "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_3;
    v23[3] = &unk_1E3E6DCC0;
    v21 = *(_QWORD *)(a1 + 32);
    v16 = &v24;
    v23[4] = v21;
    v24 = v7;
    v22 = v7;
    objc_msgSend(v20, "beginPhysicalCardRequestWithOrder:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:", v8, v12, v13, v6, v23);
  }

}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v9)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = CFSTR("YES");
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Received Apple Pay Trust signature request %{public}@, error: %@", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_paymentRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setApplePayTrustSignatureRequest:", v9);
    v15 = *(_QWORD *)(a1 + 40);
    if (!v15)
      goto LABEL_7;
    v16 = *(void (**)(void))(v15 + 16);
LABEL_6:
    v16();
LABEL_7:

    goto LABEL_8;
  }
  if (!v10)
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_8;
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v12, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "feature"), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a4);
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v17 + 16))(v17, 0, v10, 0);
LABEL_8:

}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2_23;
  block[3] = &unk_1E3E6DC70;
  v23 = v11;
  v24 = v15;
  v16 = *(void **)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v12;
  v28 = v14;
  v29 = v16;
  v27 = v13;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v15;
  v21 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2_23(uint64_t a1)
{
  BOOL v2;
  void (*v3)(void);
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 72), *(id *)(a1 + 56));
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
    goto LABEL_18;
  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
    v2 = *(_QWORD *)(a1 + 40) == 0;
  else
    v2 = 0;
  if (!v2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_18:
    v3();
    return;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 64);
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "state", (_QWORD)v9) == 1)
        {
          v5 = v8;
          goto LABEL_20;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_20:

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_4;
  block[3] = &unk_1E3E6DC70;
  v23 = v11;
  v24 = v15;
  v16 = *(void **)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v12;
  v28 = v14;
  v29 = v16;
  v27 = v13;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v15;
  v21 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t (*v6)(void);

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v2)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 64), *(id *)(a1 + 56));
      v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16);
      return v6();
    }
    v3 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 80);
    if (v4)
      v5 = v2 == 0;
    else
      v5 = 0;
    if (v5)
    {
      v6 = *(uint64_t (**)(void))(v3 + 16);
      return v6();
    }
  }
  v6 = *(uint64_t (**)(void))(v3 + 16);
  return v6();
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_5(uint64_t a1, void *a2)
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
  v6[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_6;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)completeOrderPhysicalCardWithApplePayTrustSignature:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  PKAccountWebServiceRequestPhysicalCardRequest *physicalCardRequest;
  PKAccountWebServicePhysicalCardActionRequest *replacePhysicalCardRequest;
  PKAccountService *accountService;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Completing physical card order...", buf, 2u);
  }

  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke;
  aBlock[3] = &unk_1E3E6DD38;
  aBlock[4] = self;
  v10 = v7;
  v19 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  physicalCardRequest = self->_physicalCardRequest;
  if (physicalCardRequest)
  {
    -[PKAccountService completePhysicalCardRequest:withSignature:completion:](self->_accountService, "completePhysicalCardRequest:withSignature:completion:", physicalCardRequest, v6, v11);
  }
  else
  {
    replacePhysicalCardRequest = self->_replacePhysicalCardRequest;
    if (replacePhysicalCardRequest)
    {
      accountService = self->_accountService;
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_31;
      v16[3] = &unk_1E3E6DD60;
      v17 = v11;
      -[PKAccountService completePhysicalCardActionRequest:withSignature:completion:](accountService, "completePhysicalCardActionRequest:withSignature:completion:", replacePhysicalCardRequest, v6, v16);

    }
  }

}

void __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_2;
  block[3] = &unk_1E3E669B8;
  v15 = v7;
  v16 = v9;
  v10 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v19 = v10;
  v11 = v8;
  v12 = v9;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v2)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 24), *(id *)(a1 + 56));
      goto LABEL_6;
    }
  }
  else if (!v2)
  {
    goto LABEL_6;
  }
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v2, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "feature"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    v5 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 32))
      v4 = CFSTR("NO");
    v7 = 138543618;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Completed physical card order %{public}@, error: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), v2);

}

void __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v7;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "state", (_QWORD)v15) == 1)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v11 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_paymentRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDecimalNumber *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D67260]);
  objc_msgSend(v3, "setRequestType:", 4);
  objc_msgSend(v3, "setClientCallbackTimeout:", 65.0);
  objc_msgSend(v3, "setConfirmationStyle:", 1);
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalizedErrorMessage:", v4);

  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalizedAuthorizingTitle:", v5);

  -[PKOrderPhysicalCardController _priceForRequestingPhysicalCard](self, "_priceForRequestingPhysicalCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currencyCode");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v8, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "currency");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrencyCode:", v11);

  objc_msgSend(v7, "amount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D67358];
  PKLocalizedFeatureString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "summaryItemWithLabel:amount:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaymentSummaryItems:", v16);

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v12, "isEqualToNumber:", v17);

  if ((_DWORD)v14)
    objc_msgSend(v3, "setSuppressTotal:", 1);

  return v3;
}

- (id)_priceForRequestingPhysicalCard
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_priceOptions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "reason", (_QWORD)v11) == self->_orderReason)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)paymentSetupContext
{
  return self->_paymentSetupContext;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)artworkOptions
{
  return self->_artworkOptions;
}

- (void)setArtworkOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKPhysicalCardArtworkOption)selectedArtworkOption
{
  return self->_selectedArtworkOption;
}

- (void)setSelectedArtworkOption:(id)a3
{
  objc_storeStrong((id *)&self->_selectedArtworkOption, a3);
}

- (CNPostalAddress)shippingAddress
{
  return self->_shippingAddress;
}

- (void)setShippingAddress:(id)a3
{
  objc_storeStrong((id *)&self->_shippingAddress, a3);
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_parentFlowController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_selectedArtworkOption, 0);
  objc_storeStrong((id *)&self->_artworkOptions, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_replacePhysicalCardRequest, 0);
  objc_storeStrong((id *)&self->_physicalCardRequest, 0);
  objc_storeStrong((id *)&self->_priceOptions, 0);
  objc_storeStrong((id *)&self->_physicalCardToReplace, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
