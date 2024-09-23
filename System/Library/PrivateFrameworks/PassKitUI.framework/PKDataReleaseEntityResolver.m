@implementation PKDataReleaseEntityResolver

- (PKDataReleaseEntityResolver)init
{
  PKDataReleaseEntityResolver *v2;
  PKPaymentService *v3;
  PKPaymentService *paymentService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDataReleaseEntityResolver;
  v2 = -[PKDataReleaseEntityResolver init](&v6, sel_init);
  if (v2)
  {
    v3 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;

  }
  return v2;
}

- (void)resolveEntityForRpIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)resolveEntityForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(void *, uint64_t);
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD aBlock[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD v56[5];
  id v57;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(location, self);
  if (v7)
  {
    objc_msgSend(v6, "rpIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "organizationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "industryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && objc_msgSend(v8, "length"))
    {
      v56[0] = 0;
      v56[1] = v56;
      v56[2] = 0x3032000000;
      v56[3] = __Block_byref_object_copy__34;
      v56[4] = __Block_byref_object_dispose__34;
      v57 = 0;
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke;
      aBlock[3] = &unk_1E3E71080;
      v30 = v9;
      v13 = v9;
      v50 = v13;
      v28 = v11;
      v51 = v11;
      v29 = v10;
      v52 = v10;
      v14 = v8;
      v53 = v14;
      v55 = v56;
      v54 = v7;
      v15 = _Block_copy(aBlock);
      v16 = objc_alloc_init(MEMORY[0x1E0D66B90]);
      v46[0] = v12;
      v46[1] = 3221225472;
      v46[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2;
      v46[3] = &unk_1E3E710A8;
      v17 = v13;
      v47 = v17;
      v18 = v15;
      v48 = v18;
      objc_msgSend(v16, "addOperation:", v46);
      v42[0] = v12;
      v42[1] = 3221225472;
      v42[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3;
      v42[3] = &unk_1E3E66740;
      objc_copyWeak(&v45, location);
      v19 = v14;
      v43 = v19;
      v20 = v18;
      v44 = v20;
      objc_msgSend(v16, "addOperation:", v42);
      v37[0] = v12;
      v37[1] = 3221225472;
      v37[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2_91;
      v37[3] = &unk_1E3E71120;
      objc_copyWeak(&v41, location);
      v21 = v19;
      v38 = v21;
      v39 = v17;
      v22 = v20;
      v40 = v22;
      objc_msgSend(v16, "addOperation:", v37);
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_4;
      v31[3] = &unk_1E3E71198;
      v23 = v16;
      v32 = v23;
      objc_copyWeak(&v36, location);
      v33 = v21;
      v35 = v56;
      v24 = v22;
      v34 = v24;
      v25 = (void (**)(void *, uint64_t))_Block_copy(v31);
      v25[2](v25, 1);
      v25[2](v25, 0);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (id)objc_msgSend(v23, "evaluateWithInput:completion:", v26, &__block_literal_global_143);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v41);

      objc_destroyWeak(&v45);
      _Block_object_dispose(v56, 8);

      v10 = v29;
      v9 = v30;
      v11 = v28;
    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  objc_destroyWeak(location);

}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(v6, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      objc_msgSend(v6, "setName:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend(v6, "industryCode"))
      objc_msgSend(v6, "setIndustryCode:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    objc_msgSend(v6, "setFallbackLogoImageURL:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "setMerchantIdentifier:", *(_QWORD *)(a1 + 56));
    if (objc_msgSend(v6, "isValid"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }

}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0D66E58];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setName:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7[2](v7, v8, 0);

}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    v17[0] = *(_QWORD *)(a1 + 32);
    v17[1] = &unk_1E3FAD7B0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:argumentArray:", CFSTR("t == %@ AND transaction_type == %lu AND (maps_merchant_pid != nil OR u != nil)"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)WeakRetained[1];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_89;
    v13[3] = &unk_1E3E710D0;
    v15 = *(id *)(a1 + 40);
    v16 = v7;
    v14 = v6;
    objc_msgSend(v12, "transactionsForPredicate:limit:completion:", v11, 1, v13);

  }
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_89(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchant");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2_91(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3_92;
    v10[3] = &unk_1E3E710F8;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = v7;
    v12 = v6;
    objc_msgSend(WeakRetained, "_merchantFromMapsWithIdentifier:completion:", v9, v10);

  }
}

uint64_t __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3_92(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v3 = a1[4];
    v4 = a2;
    objc_msgSend(v4, "setName:", v3);
    (*(void (**)(void))(a1[6] + 16))();

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_4(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  id v10;
  char v11;

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_5;
  v7[3] = &unk_1E3E71170;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v8 = *(id *)(a1 + 40);
  v11 = a2;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(v4, "addOperation:", v7);

  objc_destroyWeak(&v10);
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = *(unsigned __int8 *)(a1 + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_6;
    v12[3] = &unk_1E3E71148;
    v11 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = v7;
    v13 = v6;
    objc_msgSend(WeakRetained, "_merchantForIdentifier:withCurrentMerchant:fromMobileAssetLocalOnly:completion:", v11, v9, v10, v12);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

uint64_t __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

- (void)_merchantFromMapsWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKDataReleaseEntityLookupSource *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[PKDataReleaseEntityLookupSource initWithEntityIdentifier:]([PKDataReleaseEntityLookupSource alloc], "initWithEntityIdentifier:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66E68]), "initWithSource:", v7);
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Processing identity request for %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PKDataReleaseEntityResolver__merchantFromMapsWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E3E71200;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "startLookupWithCompletion:", v11);

}

void __74__PKDataReleaseEntityResolver__merchantFromMapsWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "result");
    v6 = CFSTR("NO");
    if (v5 == 2)
      v6 = CFSTR("YES");
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Maps identity response success: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v3, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "brand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isValid") & 1) != 0 || objc_msgSend(v7, "isValid"))
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Maps identity response found valid merchant", (uint8_t *)&v10, 2u);
    }

    v9 = objc_alloc_init(MEMORY[0x1E0D66E58]);
    objc_msgSend(v9, "setMapsBrand:", v8);
    objc_msgSend(v9, "setMapsMerchant:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_merchantForIdentifier:(id)a3 withCurrentMerchant:(id)a4 fromMobileAssetLocalOnly:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D66E70], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke;
  v17[3] = &unk_1E3E71250;
  objc_copyWeak(&v21, &location);
  v14 = v12;
  v20 = v14;
  v15 = v10;
  v18 = v15;
  v16 = v11;
  v19 = v16;
  objc_msgSend(v13, "fetchRPIdentifierMappingDiscretionary:localOnly:completionHandler:", 0, v7, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v6)
      goto LABEL_6;
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Error fetching mapping %@", buf, 0xCu);
    }

    if (v5)
    {
LABEL_6:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v5);
      if (v9)
      {
        v42 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v42);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v42;
        if (!v11 && v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            PKLogFacilityTypeGetObject();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v26 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v44 = v26;
              _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Mapping couldn't be parsed for %@", buf, 0xCu);
            }
            goto LABEL_43;
          }
          objc_msgSend(v10, "objectForKey:", *(_QWORD *)(a1 + 32));
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            PKLogFacilityTypeGetObject();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v44 = v28;
              _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "No mapped merchant for %@", buf, 0xCu);
            }

            goto LABEL_43;
          }
          -[NSObject objectForKey:](v12, "objectForKey:", CFSTR("name"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v13 = 0;
          }
          v38 = v13;
          objc_msgSend(*(id *)(a1 + 40), "mapsBrand");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isValid") & 1) != 0)
            goto LABEL_22;
          objc_msgSend(*(id *)(a1 + 40), "mapsMerchant");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isValid");

          if ((v16 & 1) != 0)
            goto LABEL_23;
          -[NSObject objectForKey:](v12, "objectForKey:", CFSTR("category"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || !objc_msgSend(v14, "length")
            || (v17 = PKMerchantCategoryFromString()) == 0)
          {
            if (!objc_msgSend(v38, "length"))
            {
LABEL_22:

LABEL_23:
              -[NSObject objectForKey:](v12, "objectForKey:", CFSTR("identifier"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKey:](v12, "objectForKey:", CFSTR("resultProviderIdentifier"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v21 = objc_msgSend(v19, "unsignedLongLongValue");
                v22 = v20;
                v23 = v21;
                v37 = v22;
                v35 = objc_msgSend(v22, "intValue");
                objc_msgSend(*(id *)(a1 + 40), "mapsBrand");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v23;
                if (objc_msgSend(v24, "identifier") == v23)
                {

                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 40), "mapsMerchant");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v31, "identifier");

                  if (v34 != v36)
                  {
                    v32 = (void *)WeakRetained[1];
                    v39[0] = MEMORY[0x1E0C809B0];
                    v39[1] = 3221225472;
                    v39[2] = __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke_110;
                    v39[3] = &unk_1E3E71228;
                    v40 = v38;
                    v41 = *(id *)(a1 + 48);
                    v33 = v38;
                    objc_msgSend(v32, "mapsMerchantWithIdentifier:resultProviderIdentifier:completion:", v36, v35, v39);

                    goto LABEL_44;
                  }
                }

              }
              else
              {
                PKLogFacilityTypeGetObject();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = *(void **)(a1 + 32);
                  *(_DWORD *)buf = 138412546;
                  v44 = v30;
                  v45 = 2112;
                  v46 = v12;
                  _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "No valid identifier and result provider identifier for %@. %@", buf, 0x16u);
                }

              }
LABEL_43:

              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_44:
              v11 = 0;
LABEL_45:

              goto LABEL_46;
            }
            v17 = 0;
          }
          v18 = objc_alloc_init(MEMORY[0x1E0D66E58]);
          objc_msgSend(v18, "setFallbackcategory:", v17);
          objc_msgSend(v18, "setName:", v38);
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_22;
        }
      }
      else
      {
        v11 = 0;
        v10 = 0;
      }
      PKLogFacilityTypeGetObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v11;
        _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Could not read mapping with error %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_45;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_46:

}

void __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke_110(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  objc_msgSend(v7, "mapsBrand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isValid"))
  {

  }
  else
  {
    objc_msgSend(v7, "mapsMerchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValid");

    if (!v5)
    {
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_6;
    }
  }
  objc_msgSend(v7, "setName:", *(_QWORD *)(a1 + 32));
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
  v6();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
