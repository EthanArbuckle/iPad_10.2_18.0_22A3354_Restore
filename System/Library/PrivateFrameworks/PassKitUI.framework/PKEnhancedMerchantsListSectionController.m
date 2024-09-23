@implementation PKEnhancedMerchantsListSectionController

- (PKEnhancedMerchantsListSectionController)initWithSectionIdentifiers:(id)a3 fetcher:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKEnhancedMerchantsListSectionController *v12;
  PKEnhancedMerchantsListSectionController *v13;
  id *p_identifiers;
  uint64_t v15;
  id v16;
  PKAccountEnhancedMerchantsFetcher *fetcher;
  uint64_t v18;
  uint64_t v19;
  NSUUID *merchantsUpdateToken;
  _QWORD v22[4];
  PKEnhancedMerchantsListSectionController *v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKEnhancedMerchantsListSectionController;
  v12 = -[PKEnhancedMerchantsListSectionController init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    p_identifiers = (id *)&v12->_identifiers;
    objc_storeStrong((id *)&v12->_identifiers, a3);
    if (!*p_identifiers || !objc_msgSend(*p_identifiers, "count"))
    {
      v28[0] = CFSTR("PKEnhancedMerchantsListSectionMerchantList");
      v28[1] = CFSTR("PKEnhancedMerchantsListSectionMerchantDisclosures");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *p_identifiers;
      *p_identifiers = (id)v15;

    }
    objc_storeStrong((id *)&v13->_fetcher, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_initWeak(&location, v13);
    fetcher = v13->_fetcher;
    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke;
    v24[3] = &unk_1E3E61310;
    objc_copyWeak(&v25, &location);
    -[PKAccountEnhancedMerchantsFetcher addUpdateHandler:](fetcher, "addUpdateHandler:", v24);
    v19 = objc_claimAutoreleasedReturnValue();
    merchantsUpdateToken = v13->_merchantsUpdateToken;
    v13->_merchantsUpdateToken = (NSUUID *)v19;

    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke_2;
    v22[3] = &unk_1E3E612E8;
    v23 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "reloadDataAnimated:", 1);

    WeakRetained = v3;
  }

}

void __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  PKPassKitCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v4, *(_QWORD *)(a1 + 32), MEMORY[0x1E0C80D38]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDesiredAccuracy:", *MEMORY[0x1E0C9E4B8]);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__applicationDidEnterBackground_, *MEMORY[0x1E0D6BAB8], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_merchantsUpdateToken)
    -[PKAccountEnhancedMerchantsFetcher removeUpdateHandler:](self->_fetcher, "removeUpdateHandler:");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](self->_pendingMerchantLocationSearch, "isInProgress"))
  {
    -[_PKPendingEnhancedMerchantNearbyLocationSearch cancel](self->_pendingMerchantLocationSearch, "cancel");
  }
  -[PKEnhancedMerchantsListSectionController _stopUpdatingLocation](self, "_stopUpdatingLocation");
  v4.receiver = self;
  v4.super_class = (Class)PKEnhancedMerchantsListSectionController;
  -[PKEnhancedMerchantsListSectionController dealloc](&v4, sel_dealloc);
}

- (id)merchantForPrivateIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PKAccountEnhancedMerchantsFetcher enhancedMerchants](self->_fetcher, "enhancedMerchants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__PKEnhancedMerchantsListSectionController_merchantForPrivateIdentifier___block_invoke;
    v8[3] = &unk_1E3E71FC0;
    v9 = v4;
    objc_msgSend(v5, "pk_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __73__PKEnhancedMerchantsListSectionController_merchantForPrivateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (v7 && v8)
      v10 = objc_msgSend(v7, "isEqualToString:", v8);
  }

  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
  -[PKAccountEnhancedMerchantsFetcher reloadDataWithCompletion:](self->_fetcher, "reloadDataWithCompletion:", a3);
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  void *v16;
  NSObject *v17;
  int v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKAccountEnhancedMerchantsFetcher enhancedMerchantsWithOrderingContext:](self->_fetcher, "enhancedMerchantsWithOrderingContext:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PKAccountEnhancedMerchantsFetcher enhancedMerchants](self->_fetcher, "enhancedMerchants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (__CFString *)v5;
  v9 = CFSTR("PKEnhancedMerchantsListSectionMerchantList");
  if (v9 == v8)
  {

    goto LABEL_9;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_11;
  }
  v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", v9);

  if (v11)
  {
LABEL_9:
    objc_msgSend(v6, "appendItems:", v7);
    goto LABEL_22;
  }
LABEL_11:
  v12 = v8;
  v13 = CFSTR("PKEnhancedMerchantsListSectionMerchantDisclosures");
  if (v13 == v12)
  {

    goto LABEL_17;
  }
  v14 = v13;
  if (v8 && v13)
  {
    v15 = -[__CFString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_19;
LABEL_17:
    objc_msgSend(v7, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_154);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:", v16);

    goto LABEL_22;
  }

LABEL_19:
  PKLogFacilityTypeGetObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier for enhanced merchants list section controller: %@", (uint8_t *)&v19, 0xCu);
  }

LABEL_22:
  return v6;
}

PKAccountEnhancedMerchantDisclosurePresentationInfo *__94__PKEnhancedMerchantsListSectionController_snapshotWithPreviousSnapshot_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKAccountEnhancedMerchantDisclosurePresentationInfo *v3;

  v2 = a2;
  v3 = -[PKAccountEnhancedMerchantDisclosurePresentationInfo initWithAccountEnhancedMerchant:]([PKAccountEnhancedMerchantDisclosurePresentationInfo alloc], "initWithAccountEnhancedMerchant:", v2);

  return v3;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKEnhancedMerchantsListSectionController _merchantListCellRegistration](self, "_merchantListCellRegistration");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKEnhancedMerchantsListSectionController _disclosuresCellRegistration](self, "_disclosuresCellRegistration");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Unrecognized class for enhanced merchants list section controller", v9, 2u);
  }

  v6 = 0;
LABEL_9:

  return v6;
}

- (id)_merchantListCellRegistration
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC35C8];
  v3 = objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke;
  v6[3] = &unk_1E3E72050;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v2, "registrationWithCellClass:configurationHandler:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSString *v11;
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
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "setDelegate:", WeakRetained);
  objc_msgSend(v6, "updateWithAccountEnhancedMerchant:", v7);
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDirectionalLayoutMargins:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  v11 = (NSString *)*MEMORY[0x1E0DC4938];
  PKFontForDesign((void *)*MEMORY[0x1E0DC1398], (void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC4938], 2, 0, *MEMORY[0x1E0DC1420]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(v9, "secondaryTextProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setColor:", v17);

  objc_msgSend(v6, "listContentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConfiguration:", v9);

  objc_msgSend(v6, "websiteButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", objc_msgSend(v7, "hasWebsite") ^ 1);

  objc_msgSend(v6, "appStoreButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", objc_msgSend(v7, "hasLinkedApplication") ^ 1);

  objc_msgSend(v6, "mapsButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", objc_msgSend(v7, "hasMapsLocations") ^ 1);

  objc_msgSend(v6, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v23);

  objc_msgSend(v7, "iconImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKScreenScale();
  objc_msgSend(v24, "imageForScaleFactorValue:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_2;
  v31[3] = &unk_1E3E72028;
  v32 = v7;
  v33 = v6;
  v34 = v22;
  v26 = v22;
  v27 = v6;
  v28 = v7;
  objc_msgSend(v25, "fetchImageWithCompletion:", v31);
  objc_msgSend(v27, "detailedDescriptionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "detailedDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v30);

  objc_msgSend(WeakRetained, "_updateCellBasedOnCurrentSearch:", v27);
}

void __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_2(id *a1, void *a2)
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
  v5[2] = __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_3;
  v5[3] = &unk_1E3E62460;
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "privateIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "enhancedMerchant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2;
  v5 = v4;
  if (v12 == v5)
  {

    goto LABEL_10;
  }
  v6 = v5;
  if (v12)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {

LABEL_14:
    return;
  }
  v8 = objc_msgSend(v12, "isEqualToString:", v5);

  if ((v8 & 1) != 0)
  {
LABEL_10:
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v12 = (id)v9;
    objc_msgSend(*(id *)(a1 + 56), "setImage:", v9);
    v10 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    goto LABEL_14;
  }
}

- (id)_disclosuresCellRegistration
{
  return (id)objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_153);
}

void __72__PKEnhancedMerchantsListSectionController__disclosuresCellRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a2;
  objc_msgSend(v5, "cellConfiguration");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)*MEMORY[0x1E0DC4AB8];
  v9 = (NSString *)*MEMORY[0x1E0DC4938];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4938], *MEMORY[0x1E0DC1420]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "pkui_attriutedStringWithString:font:paragraphStyle:", v14, v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(v6, "disclosures");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "pkui_attriutedStringWithString:font:paragraphStyle:", v17, v11, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v19, "appendAttributedString:", v15);
  objc_msgSend(v19, "appendAttributedString:", v18);
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v21, "setLineBreakStrategy:", 1);
  v22 = *MEMORY[0x1E0DC1178];
  v23 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v19, "addAttribute:value:range:", v22, v23, 0, objc_msgSend(v19, "length"));

  objc_msgSend(v26, "setAttributedText:", v19);
  objc_msgSend(v26, "textProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setColor:", v25);

  objc_msgSend(v7, "setContentConfiguration:", v26);
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0DC35A8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithAppearance:", 0);
  objc_msgSend(v8, "setHeaderMode:", 1);
  v9 = (__CFString *)v5;
  v10 = CFSTR("PKEnhancedMerchantsListSectionMerchantList");
  if (v10 == v9)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_9;
  }
  v12 = -[__CFString isEqualToString:](v9, "isEqualToString:", v10);

  if (v12)
  {
LABEL_7:
    objc_msgSend(v8, "setShowsSeparators:", 1);
    objc_msgSend(v8, "separatorConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColor:", v14);

    objc_msgSend(v8, "setSeparatorConfiguration:", v13);
    goto LABEL_20;
  }
LABEL_9:
  v15 = v9;
  v16 = CFSTR("PKEnhancedMerchantsListSectionMerchantDisclosures");
  if (v16 == v15)
  {

    goto LABEL_15;
  }
  v17 = v16;
  if (v9 && v16)
  {
    v18 = -[__CFString isEqualToString:](v15, "isEqualToString:", v16);

    if (!v18)
      goto LABEL_17;
LABEL_15:
    objc_msgSend(v8, "setShowsSeparators:", 0);
    goto LABEL_20;
  }

LABEL_17:
  PKLogFacilityTypeGetObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v15;
    _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier for enhanced merchants list section controller: %@", (uint8_t *)&v23, 0xCu);
  }

LABEL_20:
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "boundarySupplementaryItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", &__block_literal_global_162);

  return v20;
}

uint64_t __90__PKEnhancedMerchantsListSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPinToVisibleBounds:", 0);
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  void *v18;
  __CFString *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)*MEMORY[0x1E0DC48A8];
    v10 = v7;
    v11 = v9;
    if (v11 == v10)
    {

    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
        goto LABEL_25;
      v13 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_26;
    }
    v10 = v31;
    objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (__CFString *)v8;
    v15 = CFSTR("PKEnhancedMerchantsListSectionMerchantList");
    if (v15 == v14)
    {

    }
    else
    {
      v16 = v15;
      if (!v14 || !v15)
      {

LABEL_16:
        v19 = v14;
        v27 = CFSTR("PKEnhancedMerchantsListSectionMerchantDisclosures");
        if (v27 == v19)
        {

        }
        else
        {
          v24 = v27;
          if (!v14 || !v27)
            goto LABEL_23;
          v28 = -[__CFString isEqualToString:](v19, "isEqualToString:", v27);

          if (!v28)
            goto LABEL_24;
        }
        PKLocalizedFeatureString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v29);

        objc_msgSend(v12, "textProperties");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4938]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setFont:](v19, "setFont:", v30);

        objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setColor:](v19, "setColor:", v24);
LABEL_23:

LABEL_24:
        objc_msgSend(v10, "setContentConfiguration:", v12);
LABEL_25:

        goto LABEL_26;
      }
      v17 = -[__CFString isEqualToString:](v14, "isEqualToString:", v15);

      if (!v17)
        goto LABEL_16;
    }
    PKLocalizedFeatureString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v18);

    objc_msgSend(v12, "textProperties");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = (NSString *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC4938], 2, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setFont:](v19, "setFont:", v21);

    -[__CFString setNumberOfLines:](v19, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setColor:](v19, "setColor:", v22);

    PKLocalizedFeatureString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v23);

    objc_msgSend(v12, "secondaryTextProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setColor:", v26);

    objc_msgSend(v24, "setNumberOfLines:", 0);
    objc_msgSend(v12, "setTextToSecondaryTextVerticalPadding:", 15.0);
    objc_msgSend(v12, "setDirectionalLayoutMargins:", 0.0, 0.0, 32.0, 0.0);
    goto LABEL_23;
  }
LABEL_26:

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)performAction:(int64_t)a3 forEnhancedMerchant:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  _QWORD *v13;
  _PKPendingEnhancedMerchantNearbyLocationSearch *v14;
  _PKPendingEnhancedMerchantNearbyLocationSearch *pendingMerchantLocationSearch;
  _PKPendingEnhancedMerchantNearbyLocationSearch *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  switch(a3)
  {
    case 0:
      objc_msgSend(v9, "linkedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = objc_msgSend(v11, "isInstalled");
        v13 = (_QWORD *)MEMORY[0x1E0D68EC8];
        if (!v12)
          v13 = (_QWORD *)MEMORY[0x1E0D68758];
        -[PKEnhancedMerchantsListSectionController _reportEventIfNecessaryForButtonTapWithTag:merchant:](self, "_reportEventIfNecessaryForButtonTapWithTag:merchant:", *v13, v8);
        objc_msgSend(WeakRetained, "openLinkedApplication:", v11);
      }
      goto LABEL_15;
    case 2:
      -[PKEnhancedMerchantsListSectionController _reportEventIfNecessaryForButtonTapWithTag:merchant:](self, "_reportEventIfNecessaryForButtonTapWithTag:merchant:", *MEMORY[0x1E0D68DC0], v8);
      if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](self->_pendingMerchantLocationSearch, "isInProgress"))
      {
        -[_PKPendingEnhancedMerchantNearbyLocationSearch cancel](self->_pendingMerchantLocationSearch, "cancel");
      }
      v14 = -[_PKPendingEnhancedMerchantNearbyLocationSearch initWithMerchant:]([_PKPendingEnhancedMerchantNearbyLocationSearch alloc], "initWithMerchant:", v8);
      pendingMerchantLocationSearch = self->_pendingMerchantLocationSearch;
      self->_pendingMerchantLocationSearch = v14;

      objc_msgSend(v9, "mapsButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pkui_updateConfigurationShowingActivityIndicator:", 1);
      objc_msgSend(v11, "setEnabled:", 0);
      -[_PKPendingEnhancedMerchantNearbyLocationSearch didStart](self->_pendingMerchantLocationSearch, "didStart");
      -[PKEnhancedMerchantsListSectionController _openMapsForMerchantSearch:](self, "_openMapsForMerchantSearch:", self->_pendingMerchantLocationSearch);
      objc_initWeak(&location, self);
      v16 = self->_pendingMerchantLocationSearch;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __85__PKEnhancedMerchantsListSectionController_performAction_forEnhancedMerchant_sender___block_invoke;
      v17[3] = &unk_1E3E65360;
      objc_copyWeak(&v19, &location);
      v18 = v9;
      -[_PKPendingEnhancedMerchantNearbyLocationSearch addCompletionHandler:](v16, "addCompletionHandler:", v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_15;
    case 1:
      objc_msgSend(v8, "website");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKEnhancedMerchantsListSectionController _reportEventIfNecessaryForButtonTapWithTag:merchant:](self, "_reportEventIfNecessaryForButtonTapWithTag:merchant:", *MEMORY[0x1E0D69890], v8);
        objc_msgSend(WeakRetained, "openURL:sensitive:preferInApp:", v11, 0, 0);
      }
LABEL_15:

      break;
  }

}

void __85__PKEnhancedMerchantsListSectionController_performAction_forEnhancedMerchant_sender___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCellBasedOnCurrentSearch:", *(_QWORD *)(a1 + 32));

}

- (void)_reportEventIfNecessaryForButtonTapWithTag:(id)a3 merchant:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D68858];
  v15[0] = *MEMORY[0x1E0D68AA0];
  v15[1] = v6;
  v16[0] = *MEMORY[0x1E0D68B18];
  v16[1] = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v8, "privateIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x1E0D68DF8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(WeakRetained, "reportEventIfNecessary:", v14);

}

- (void)_updateCellBasedOnCurrentSearch:(id)a3
{
  id v4;
  _PKPendingEnhancedMerchantNearbyLocationSearch *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = self->_pendingMerchantLocationSearch;
  objc_msgSend(v4, "mapsButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsActivityIndicator");

  -[_PKPendingEnhancedMerchantNearbyLocationSearch merchant](v5, "merchant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "privateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enhancedMerchant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  v14 = v12;
  if (v13 == v14)
  {

  }
  else
  {
    v15 = v14;
    if (!v13 || !v14)
    {

LABEL_9:
      v17 = 0;
      goto LABEL_10;
    }
    v16 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_9;
  }
  v17 = -[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](v5, "isInProgress");
LABEL_10:
  objc_msgSend(v6, "setEnabled:", v17 ^ 1);
  objc_msgSend(v6, "pkui_updateConfigurationShowingActivityIndicator:", v17);
  if (((v17 ^ 1) & 1) == 0 && v8 != 1)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__PKEnhancedMerchantsListSectionController__updateCellBasedOnCurrentSearch___block_invoke;
    v18[3] = &unk_1E3E65360;
    objc_copyWeak(&v20, &location);
    v19 = v4;
    -[_PKPendingEnhancedMerchantNearbyLocationSearch addCompletionHandler:](v5, "addCompletionHandler:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

void __76__PKEnhancedMerchantsListSectionController__updateCellBasedOnCurrentSearch___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCellBasedOnCurrentSearch:", *(_QWORD *)(a1 + 32));

}

- (void)_requestLocationUpdateIfPossible
{
  int v3;
  CLAuthorizationStatus v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
  v4 = -[CLLocationManager authorizationStatus](self->_locationManager, "authorizationStatus");
  if (v3)
    v5 = (v4 - 3) > 1;
  else
    v5 = 1;
  if (v5)
  {
    if (v4)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Location services unavailable or unauthorized", v14, 2u);
      }

      PKLocalizedFeatureString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0CB2D78];
      v15 = v8;
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v16[1] = *MEMORY[0x1E0D69EF0];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      PKDisplayableErrorCustom();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](self->_pendingMerchantLocationSearch, "isInProgress"))
      {
        -[_PKPendingEnhancedMerchantNearbyLocationSearch didFailWithError:](self->_pendingMerchantLocationSearch, "didFailWithError:", v13);
        -[PKEnhancedMerchantsListSectionController _presentError:](self, "_presentError:", v13);
      }

    }
    else
    {
      -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
      if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](self->_pendingMerchantLocationSearch, "isInProgress"))
      {
        -[_PKPendingEnhancedMerchantNearbyLocationSearch cancel](self->_pendingMerchantLocationSearch, "cancel");
      }
    }
  }
  else
  {
    -[CLLocationManager requestLocation](self->_locationManager, "requestLocation");
  }
}

- (void)_stopUpdatingLocation
{
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
}

- (void)_openMapsForMerchantSearch:(id)a3
{
  CLLocation *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isInProgress"))
  {
    v4 = self->_lastValidLocation;
    if (LocationIsValid(v4))
      -[PKEnhancedMerchantsListSectionController _performNearbyLocationsSearch:deviceLocation:](self, "_performNearbyLocationsSearch:deviceLocation:", v5, v4);
    else
      -[PKEnhancedMerchantsListSectionController _requestLocationUpdateIfPossible](self, "_requestLocationUpdateIfPossible");

  }
}

- (void)_performNearbyLocationsSearch:(id)a3 deviceLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id obj;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id location;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  v30 = v6;
  objc_msgSend(v6, "merchant");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "mapsSearchText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v31 = v7;
  }
  else
  {
    objc_msgSend(v33, "name");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v33, "mapsSearchStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "defaultTraits");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v32);
  objc_msgSend(v35, "setDeviceLocation:");
  objc_msgSend(v33, "brandMUIDs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "excludedMUIDs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v31);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_initWeak(&location, self);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v9;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v15 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    v16 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v45[0] = v15;
        v45[1] = 3221225472;
        v45[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke;
        v45[3] = &unk_1E3E72120;
        v46 = v36;
        v47 = v18;
        v48 = v35;
        v49 = v10;
        v50 = v11;
        objc_msgSend(v13, "addOperation:", v45);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v15;
  v37[1] = 3221225472;
  v37[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_192;
  v37[3] = &unk_1E3E721C0;
  objc_copyWeak(&v44, &location);
  v20 = v11;
  v38 = v20;
  v21 = v29;
  v39 = v21;
  v22 = v28;
  v40 = v22;
  v23 = v31;
  v41 = v23;
  v24 = v32;
  v42 = v24;
  v25 = v30;
  v43 = v25;
  v26 = (id)objc_msgSend(v13, "evaluateWithInput:completion:", v19, v37);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "ticketForSearchQuery:filters:maxResults:traits:", *(_QWORD *)(a1 + 40), 0, 50, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2;
  v12[3] = &unk_1E3E720F8;
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v15 = v6;
  v16 = v7;
  v14 = v9;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "submitWithHandler:timeout:networkActivity:", v12, 10, 0);

}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Encountered error searching for %@: %@", buf, 0x16u);
    }

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "_hasMUID", (_QWORD)v16))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "_muid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v15) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_192(id *a1)
{
  id WeakRetained;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 10);
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2_193;
    block[3] = &unk_1E3E72198;
    v4 = a1[4];
    v5 = a1[5];
    v6 = a1[6];
    v7 = a1[7];
    v8 = WeakRetained;
    v9 = a1[8];
    v10 = a1[9];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2_193(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  CLLocationDegrees v22;
  CLLocationDegrees v23;
  CLLocationCoordinate2D v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id WeakRetained;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[3];
  _QWORD v50[3];
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_3;
  v46[3] = &unk_1E3E72148;
  v3 = *(void **)(a1 + 32);
  v47 = *(id *)(a1 + 40);
  v48 = *(id *)(a1 + 48);
  objc_msgSend(v3, "pk_objectsPassingTest:", v46);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v44[0] = v2;
    v44[1] = 3221225472;
    v44[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_195;
    v44[3] = &unk_1E3E72170;
    v45 = *(id *)(a1 + 72);
    objc_msgSend(v4, "sortedArrayUsingComparator:", v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithCLLocation:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v38, "_displayMapRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 >= 5)
      v9 = 5;
    else
      v9 = v6;
    v39 = v7;
    objc_msgSend(v7, "subarrayWithRange:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "_displayMapRegion");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v8)
          {
            GEOMapRegionUnion();
            v17 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v17;
          }
          else
          {
            v8 = (void *)v15;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v12);
    }
    if (v6 >= 25)
      v18 = 25;
    else
      v18 = v6;
    objc_msgSend(v39, "subarrayWithRange:", 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v8, "centerLat");
    v22 = v21;
    objc_msgSend(v8, "centerLng");
    v24 = CLLocationCoordinate2DMake(v22, v23);
    objc_msgSend(v20, "valueWithMKCoordinate:", v24.latitude, v24.longitude);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v8, "spanLat");
    v28 = v27;
    objc_msgSend(v8, "spanLng");
    objc_msgSend(v26, "valueWithMKCoordinateSpan:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0CC15C0];
    v49[0] = *MEMORY[0x1E0CC15B8];
    v49[1] = v31;
    v50[0] = v25;
    v50[1] = v30;
    v49[2] = *MEMORY[0x1E0CC15D0];
    v50[2] = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC1828], "urlForMapItems:options:", v19, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 64) + 16));
    if (objc_msgSend(*(id *)(a1 + 80), "isInProgress"))
    {
      objc_msgSend(*(id *)(a1 + 80), "didCompleteSuccessfully");
      if (v33)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "openURL:sensitive:preferInApp:", v33, 1, 0);
      }
    }

    v35 = v45;
    goto LABEL_27;
  }
  PKLogFacilityTypeGetObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    v53 = v37;
    _os_log_impl(&dword_19D178000, v36, OS_LOG_TYPE_DEFAULT, "No results found for locations search for %@", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 48), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 64), "_genericDisplayableErrorForError:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 48), "didFailWithError:", v35);
    objc_msgSend(*(id *)(a1 + 64), "_presentError:", v35);
LABEL_27:

  }
}

uint64_t __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "_hasBrandMUID") && objc_msgSend(v3, "_hasMUID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "_brandMUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "_muid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
    v7 = v6 & (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) ^ 1);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "_coordinate");
  v8 = v7;
  objc_msgSend(v6, "_coordinate");
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v12 = v11;
  v13 = objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v15 = MEMORY[0x1A1AE38D0](v13, v8, v10, v12, v14);
  objc_msgSend(v5, "_coordinate");
  v17 = v16;
  objc_msgSend(v5, "_coordinate");
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v21 = v20;
  v22 = objc_msgSend(*(id *)(a1 + 32), "coordinate");
  if (v15 >= MEMORY[0x1A1AE38D0](v22, v17, v19, v21, v23))
    return 1;
  else
    return -1;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  CLAuthorizationStatus v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[CLLocationManager authorizationStatus](self->_locationManager, "authorizationStatus", a3);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Enhanced merchants location manager did change authorization: %ld", (uint8_t *)&v5, 0xCu);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  CLLocation *lastValidLocation;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  lastValidLocation = self->_lastValidLocation;
  self->_lastValidLocation = 0;

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Location manager did fail with error: %@", (uint8_t *)&v10, 0xCu);

  }
  if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](self->_pendingMerchantLocationSearch, "isInProgress"))
  {
    -[PKEnhancedMerchantsListSectionController _genericDisplayableErrorForError:](self, "_genericDisplayableErrorForError:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKPendingEnhancedMerchantNearbyLocationSearch didFailWithError:](self->_pendingMerchantLocationSearch, "didFailWithError:", v9);
    -[PKEnhancedMerchantsListSectionController _presentError:](self, "_presentError:", v9);

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  _PKPendingEnhancedMerchantNearbyLocationSearch *v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a4, "reverseObjectEnumerator", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (LocationIsValid(v9))
        {
          v6 = v9;
          objc_storeStrong((id *)&self->_lastValidLocation, v9);
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v10 = self->_pendingMerchantLocationSearch;
  if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](v10, "isInProgress"))
  {
    if (v6)
    {
      -[PKEnhancedMerchantsListSectionController _performNearbyLocationsSearch:deviceLocation:](self, "_performNearbyLocationsSearch:deviceLocation:", v10, v6);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Unable to determine accurate device location", v13, 2u);
      }

      -[PKEnhancedMerchantsListSectionController _genericDisplayableErrorForError:](self, "_genericDisplayableErrorForError:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PKPendingEnhancedMerchantNearbyLocationSearch didFailWithError:](v10, "didFailWithError:", v12);
      -[PKEnhancedMerchantsListSectionController _presentError:](self, "_presentError:", v12);

    }
  }

}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInProgress](self->_pendingMerchantLocationSearch, "isInProgress", a3))
  {
    -[_PKPendingEnhancedMerchantNearbyLocationSearch cancel](self->_pendingMerchantLocationSearch, "cancel");
  }
  -[PKEnhancedMerchantsListSectionController _stopUpdatingLocation](self, "_stopUpdatingLocation");
}

- (id)_genericDisplayableErrorForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_presentError:(id)a3
{
  PKRewardsHubSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "presentDisplayableError:", v7);

  }
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_pendingMerchantLocationSearch, 0);
  objc_storeStrong((id *)&self->_lastValidLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_merchantsUpdateToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end
