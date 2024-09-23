@implementation PKAMSTopUpController

- (id)_bag
{
  return (id)objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("Wallet"), CFSTR("1"));
}

- (void)_executeAMSURLRequestForBagKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  v7 = a3;
  -[PKAMSTopUpController _bag](self, "_bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC80]), "initWithBag:", v8);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_activeiTunesAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccount:", v12);
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLogUUID:", v13);

  objc_msgSend(v10, "requestWithMethod:bagURL:parameters:", 2, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__PKAMSTopUpController__executeAMSURLRequestForBagKey_completion___block_invoke;
  v17[3] = &unk_1E2ACF668;
  v17[4] = self;
  v18 = v6;
  v15 = v6;
  v16 = (id)objc_msgSend(v14, "thenWithBlock:", v17);

}

id __66__PKAMSTopUpController__executeAMSURLRequestForBagKey_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0CFDCA0];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithConfiguration:", v6);

  objc_msgSend(*(id *)(a1 + 32), "taskDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v8);

  objc_msgSend(v7, "dataTaskPromiseWithRequest:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PKAMSTopUpController__executeAMSURLRequestForBagKey_completion___block_invoke_2;
  v11[3] = &unk_1E2ACF640;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v9, "addFinishBlock:", v11);

  return v9;
}

void __66__PKAMSTopUpController__executeAMSURLRequestForBagKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(a2, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestDTUConfigurationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PKAMSTopUpController_requestDTUConfigurationWithCompletion___block_invoke;
  v6[3] = &unk_1E2ABE9A8;
  v7 = v4;
  v5 = v4;
  -[PKAMSTopUpController _executeAMSURLRequestForBagKey:completion:](self, "_executeAMSURLRequestForBagKey:completion:", CFSTR("addFundsInfoSrv"), v6);

}

void __62__PKAMSTopUpController_requestDTUConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKAppleBalancePromotionConfiguration *v6;
  PKAppleBalanceDirectTopUpConfiguration *v7;
  void *v8;
  PKAppleBalancePromotionConfiguration *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = 0;
  v11 = v5;
  v7 = 0;
  if (a2 && !v5)
  {
    objc_msgSend(a2, "valueForKeyPath:", CFSTR("data.attributes.info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKAppleBalanceDirectTopUpConfiguration initWithAMSResponseDictionary:]([PKAppleBalanceDirectTopUpConfiguration alloc], "initWithAMSResponseDictionary:", v8);
    v9 = [PKAppleBalancePromotionConfiguration alloc];
    objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("offer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKAppleBalancePromotionConfiguration initWithAMSOfferDictionary:](v9, "initWithAMSOfferDictionary:", v10);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestPurchaseWithAmount:(id)a3 promotionConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;

  v8 = a3;
  v9 = a4;
  v29 = a5;
  -[PKAMSTopUpController _bag](self, "_bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithInt:", 1000);
  v28 = v8;
  objc_msgSend(v8, "decimalNumberByMultiplyingBy:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CFDA08]);
  objc_msgSend(v14, "setParameter:forKey:", v13, CFSTR("price"));
  objc_msgSend(v14, "setParameter:forKey:", v13, CFSTR("amount"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setParameter:forKey:", v15, CFSTR("addFunds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setParameter:forKey:", v16, *MEMORY[0x1E0CFD7E0]);

  if (v9)
  {
    objc_msgSend(v9, "programIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setParameter:forKey:", v17, CFSTR("programId"));

    objc_msgSend(v9, "versionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setParameter:forKey:", v18, CFSTR("versionId"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "stamp"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setParameter:forKey:", v19, CFSTR("stamp"));

  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ams_activeiTunesAccount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDBE0]), "initWithPurchaseType:buyParams:", 0, v14);
  objc_msgSend(v22, "setAccount:", v21);
  AMSLogKey();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLogUUID:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC00]), "initWithPurchase:bag:", v22, v10);
  -[PKAMSTopUpController taskDelegate](self, "taskDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", v25);

  objc_msgSend(v24, "performPurchase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke;
  v30[3] = &unk_1E2ACF690;
  objc_copyWeak(&v32, &location);
  v27 = v29;
  v31 = v27;
  objc_msgSend(v26, "addFinishBlock:", v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v7 + 16))(v7, 0, 0, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke_2;
    v9[3] = &unk_1E2ABE9A8;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_executeAMSURLRequestForBagKey:completion:", CFSTR("addFundsSuccessSrv"), v9);

  }
}

uint64_t __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 == 0, a2);
  return result;
}

- (AMSURLProtocolDelegate)taskDelegate
{
  return (AMSURLProtocolDelegate *)objc_loadWeakRetained((id *)&self->_taskDelegate);
}

- (void)setTaskDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_taskDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_taskDelegate);
}

@end
