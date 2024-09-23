@implementation PKMerchantLookupRequest

- (PKMerchantLookupRequest)initWithSource:(id)a3
{
  id v5;
  PKMerchantLookupRequest *v6;
  PKMerchantLookupRequest *v7;
  MKMapService *v8;
  MKMapService *service;
  dispatch_queue_t v10;
  OS_dispatch_queue *internalQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKMerchantLookupRequest;
  v6 = -[PKMerchantLookupRequest init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = (MKMapService *)objc_alloc_init((Class)getMKMapServiceClass[0]());
    service = v7->_service;
    v7->_service = v8;

    v10 = dispatch_queue_create("com.apple.passd.PKMerchantLookupRequest", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)startLookupWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  OS_dispatch_queue *internalQueue;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[4];
  id v21;

  v4 = a3;
  if (v4)
  {
    -[PKMerchantLookupRequestSource mapsMerchantLookupRequest](self->_source, "mapsMerchantLookupRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchantLookupRequestSource mapsURL](self->_source, "mapsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke;
    aBlock[3] = &unk_1E2AD1E40;
    v21 = v4;
    v8 = _Block_copy(aBlock);
    if (v5)
    {
      objc_msgSend(v5, "traits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        -[MKMapService defaultTraits](self->_service, "defaultTraits");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      objc_msgSend(v12, "setWantsBrandIcon:", 1);
      objc_msgSend(v12, "setSupportsBrandFallback:", 1);
      objc_msgSend(v12, "setIsSettlement:", -[PKMerchantLookupRequestSource isSettlement](self->_source, "isSettlement"));
      objc_msgSend(v12, "setIsSettlement:", -[PKMerchantLookupRequestSource isRefund](self->_source, "isRefund"));
      objc_msgSend(v12, "setContainsSensitiveData:", -[PKMerchantLookupRequestSource containsSensitiveData](self->_source, "containsSensitiveData"));
      -[MKMapService ticketForWalletMerchantLookupRequest:traits:](self->_service, "ticketForWalletMerchantLookupRequest:traits:", v5, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      internalQueue = self->_internalQueue;
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_2;
      v18[3] = &unk_1E2AD1E68;
      v18[4] = self;
      v14 = &v19;
      v19 = v8;
      objc_msgSend(v13, "submitWithCompletionQueue:handler:", internalQueue, v18);
    }
    else
    {
      if (!v6 || -[PKMerchantLookupRequestSource type](self->_source, "type") != 3)
        goto LABEL_13;
      v12 = (void *)objc_msgSend(objc_alloc(_MergedGlobals_179()), "initWithMapsURL:", v6);
      if (!v12)
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v13 = (void *)objc_msgSend(objc_alloc(off_1ECF21BB0()), "initWithRequest:", v12);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_22;
      v16[3] = &unk_1E2AD1E90;
      v16[4] = self;
      v14 = &v17;
      v17 = v8;
      objc_msgSend(v13, "startWithCompletionHandler:", v16);
    }

    goto LABEL_12;
  }
LABEL_14:

}

void __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    v8 = CFSTR("code");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  PKMerchantLookupResponse *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    v10 = objc_msgSend(v6, "code");
  else
    v10 = 0;
  if (v5)
    v11 = v10 == 0;
  else
    v11 = 0;
  v12 = v11;
  PKLogFacilityTypeGetObject(0x17uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "type");
    if (v15 > 3)
      v16 = CFSTR("unknown");
    else
      v16 = off_1E2AD1F00[v15];
    v17 = CFSTR("NO");
    v19 = 138413058;
    v20 = v14;
    if (v12)
      v17 = CFSTR("YES");
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Maps merchant lookup for identifier %@, type %@: Success: %@, Error: %@", (uint8_t *)&v19, 0x2Au);

  }
  if ((v12 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_mapsDataWithResponse:searchMapItem:completion:", v5, 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v18 = objc_alloc_init(PKMerchantLookupResponse);
    -[PKMerchantLookupResponse setResult:](v18, "setResult:", v10 == -3);
    (*(void (**)(_QWORD, PKMerchantLookupResponse *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v18);

  }
}

void __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "mapItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_mapsDataWithResponse:searchMapItem:completion:", 0, v6, *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_mapsDataWithResponse:(id)a3 searchMapItem:(id)a4 completion:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
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
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v47;
  _QWORD aBlock[4];
  id v49;
  uint64_t v50;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  if (v10 && v8 | v9)
  {
    objc_msgSend((id)v9, "_geoMapItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)v8, "mapsCategoryIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "walletCategoryIdentifier");
    }
    else
    {
      objc_msgSend(v38, "_mapsCategoryId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_walletCategoryIdentifier");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = PKMerchantCategoryFromString(v12);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke;
    aBlock[3] = &unk_1E2AD1EB8;
    v50 = v13;
    v49 = v10;
    v14 = _Block_copy(aBlock);
    if (v8)
    {
      objc_msgSend((id)v8, "mapItem");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "bestHeroImageForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "heroImageProviderName");
    }
    else
    {
      v15 = (id)v9;
      objc_msgSend(v15, "_bestWalletHeroImageForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_walletHeroImageProviderName");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0, 0, 0);
      goto LABEL_27;
    }
    v37 = v16;
    v36 = v11;
    if (objc_msgSend(v15, "_isMapItemTypeBrand"))
    {
      -[PKMerchantLookupRequest _brandFromMapItem:](self, "_brandFromMapItem:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCategory:", v13);
      objc_msgSend(v18, "setDetailedCategory:", v11);
      if (v8)
      {
        objc_msgSend((id)v8, "placeStyling");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
LABEL_14:
          objc_msgSend(v18, "setHeroImageURL:", v37);
          objc_msgSend(v18, "setHeroImageAttributionName:", v17);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setLastProcessedDate:", v21);

          (*((void (**)(void *, uint64_t, _QWORD, _QWORD, void *, _QWORD))v14 + 2))(v14, 1, 0, 0, v18, 0);
          v16 = v37;
          v11 = v36;
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
        v29 = objc_alloc((Class)getMKWalletMerchantStylingInfoClass_0[0]());
        objc_msgSend(v38, "_walletPlaceStyling");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v29, "initWithStyleAttributes:", v30);

        if (!v19)
          goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setStylingInfoData:", v20);

      goto LABEL_14;
    }
    v35 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14;
    objc_msgSend(v15, "placemark");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchantLookupRequest _merchantFromMapItem:](self, "_merchantFromMapItem:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCategory:", v13);
    objc_msgSend(v22, "setDetailedCategory:", v11);
    if (v8)
    {
      objc_msgSend((id)v8, "placeStyling");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
LABEL_19:
        objc_msgSend(v22, "setHeroImageURL:", v37);
        objc_msgSend(v22, "setHeroImageAttributionName:", v17);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setLastProcessedDate:", v25);

        v26 = objc_msgSend(v15, "_brandMUID");
        if (v26)
        {
          v27 = v26;
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke_2;
          v39[3] = &unk_1E2AD1EE0;
          v39[4] = self;
          v47 = v13;
          v40 = v36;
          v41 = (id)v8;
          v42 = v38;
          v43 = v15;
          v46 = v35;
          v28 = v34;
          v44 = v34;
          v45 = v22;
          -[PKMerchantLookupRequest _mapItemBrandWithMUID:completion:](self, "_mapItemBrandWithMUID:completion:", v27, v39);

        }
        else
        {
          v28 = v34;
          ((void (**)(_QWORD, uint64_t, void *, void *, _QWORD, _QWORD))v35)[2](v35, 1, v34, v22, 0, 0);
        }

        v11 = v36;
        v16 = v37;
        v14 = v35;
        goto LABEL_27;
      }
    }
    else
    {
      v31 = objc_alloc((Class)getMKWalletMerchantStylingInfoClass_0[0]());
      objc_msgSend(v38, "_walletPlaceStyling");
      v33 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v31, "initWithStyleAttributes:", v32);

      v17 = v33;
      if (!v23)
        goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStylingInfoData:", v24);

    goto LABEL_19;
  }
LABEL_28:

}

void __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKMerchantLookupResponse *v15;
  uint64_t v16;
  PKMerchantLookupResponse *v17;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(PKMerchantLookupResponse);
  v17 = v15;
  if (a2)
    v16 = 2;
  else
    v16 = 0;
  -[PKMerchantLookupResponse setResult:](v15, "setResult:", v16);
  -[PKMerchantLookupResponse setBrand:](v17, "setBrand:", v12);

  -[PKMerchantLookupResponse setMerchant:](v17, "setMerchant:", v13);
  -[PKMerchantLookupResponse setPlacemark:](v17, "setPlacemark:", v14);

  -[PKMerchantLookupResponse setFallbackCategory:](v17, "setFallbackCategory:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v4 = 0;
  if (!a3 || !a2)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 32), "_brandFromMapItem:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCategory:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v13, "setDetailedCategory:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 48);
  if (!v5)
  {
    v11 = objc_alloc((Class)getMKWalletMerchantStylingInfoClass_0[0]());
    objc_msgSend(*(id *)(a1 + 56), "_walletPlaceStyling");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v11, "initWithStyleAttributes:", v12);

    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v5, "placeStyling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStylingInfoData:", v7);

  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLastProcessedDate:", v8);

  objc_msgSend(v13, "logoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 64), "_bestBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLogoURL:", v10);

  }
  v4 = v13;
LABEL_9:
  v14 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

- (void)_mapItemBrandWithMUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(_MergedGlobals_179());
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setMuids:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(off_1ECF21BB0()), "initWithRequest:", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke;
    v11[3] = &unk_1E2AD1E90;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v10, "startWithCompletionHandler:", v11);

  }
}

void __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke_2;
  v12[3] = &unk_1E2AC4A20;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = objc_msgSend(v2, "_mapkit_underlyingGEOError") != -8;
  else
    v3 = 0;
  PKLogFacilityTypeGetObject(0x17uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "type");
    if (v6 > 3)
      v7 = CFSTR("unknown");
    else
      v7 = off_1E2AD1F00[v6];
    v8 = CFSTR("YES");
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 138413058;
    if (v3)
      v8 = CFSTR("NO");
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Maps brand lookup for for identifier %@, type %@: Success: %@, Error: %@", (uint8_t *)&v13, 0x2Au);

  }
  if (v3)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "mapItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "No brand item from brand search.", (uint8_t *)&v13, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (id)_merchantFromMapItem:(id)a3
{
  id v3;
  PKMapsMerchant *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(PKMapsMerchant);
  -[PKMapsMerchant setIdentifier:](v4, "setIdentifier:", objc_msgSend(v3, "_muid"));
  -[PKMapsMerchant setResultProviderIdentifier:](v4, "setResultProviderIdentifier:", objc_msgSend(v3, "_resultProviderID"));
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsMerchant setName:](v4, "setName:", v5);

  objc_msgSend(v3, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsMerchant setPhoneNumber:](v4, "setPhoneNumber:", v6);

  objc_msgSend(v3, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsMerchant setURL:](v4, "setURL:", v7);

  objc_msgSend(v3, "placemark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsMerchant setLocation:](v4, "setLocation:", v9);

  objc_msgSend(v8, "postalAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsMerchant setPostalAddress:](v4, "setPostalAddress:", v10);

  return v4;
}

- (id)_brandFromMapItem:(id)a3
{
  id v3;
  PKMapsBrand *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(PKMapsBrand);
  -[PKMapsBrand setIdentifier:](v4, "setIdentifier:", objc_msgSend(v3, "_muid"));
  -[PKMapsBrand setResultProviderIdentifier:](v4, "setResultProviderIdentifier:", objc_msgSend(v3, "_resultProviderID"));
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsBrand setName:](v4, "setName:", v5);

  objc_msgSend(v3, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsBrand setPhoneNumber:](v4, "setPhoneNumber:", v6);

  objc_msgSend(v3, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsBrand setURL:](v4, "setURL:", v7);

  objc_msgSend(v3, "_bestBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKMapsBrand setLogoURL:](v4, "setLogoURL:", v8);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
