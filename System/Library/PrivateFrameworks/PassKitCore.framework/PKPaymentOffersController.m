@implementation PKPaymentOffersController

- (PKPaymentOffersController)initWithPaymentService:(id)a3 paymentWebService:(id)a4 passLibrary:(id)a5 configuration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PKPaymentOffersController *v16;
  PKPaymentOffersController *v17;
  PKPaymentOffersController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURL *baseURL;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSURL *v30;
  uint64_t v31;
  NSHashTable *observers;
  NSMutableOrderedSet *v33;
  NSMutableOrderedSet *queuedRequests;
  NSMutableDictionary *v35;
  NSMutableDictionary *sessionIdentifierForCriteriaIdentifier;
  NSMutableDictionary *v37;
  NSMutableDictionary *paymentOffersForCriteriaIdentifier;
  NSMutableDictionary *v39;
  NSMutableDictionary *dynamicContentPagesByCriteriaIdentifier;
  NSMutableDictionary *v41;
  NSMutableDictionary *languageDisclosuresSeenForCriteriaIdentifier;
  NSMutableDictionary *v43;
  NSMutableDictionary *preferredLanguageForCriteriaIdentifier;
  NSMutableDictionary *v45;
  NSMutableDictionary *requestLoadingDetails;
  dispatch_queue_t v47;
  OS_dispatch_queue *replyQueue;
  PKPaymentOffersControllerSelectedOfferDetails *v49;
  PKPaymentOffersControllerSelectedOfferDetails *selectedOfferDetails;
  uint64_t v51;
  PKPaymentOfferCatalog *catalog;
  PKPaymentOfferCatalog *v53;
  NSObject *v54;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  uint8_t buf[4];
  PKPaymentOfferCatalog *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  v16 = 0;
  if (v11 && v12 && v13 && v14)
  {
    v62.receiver = self;
    v62.super_class = (Class)PKPaymentOffersController;
    v17 = -[PKPaymentOffersController init](&v62, sel_init);
    v18 = v17;
    if (v17)
    {
      v57 = v15;
      objc_storeStrong((id *)&v17->_paymentService, a3);
      objc_storeStrong((id *)&v18->_paymentWebService, a4);
      objc_msgSend(v12, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "primaryRegion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "paymentOffersServiceURL");
      v21 = objc_claimAutoreleasedReturnValue();
      baseURL = v18->_baseURL;
      v18->_baseURL = (NSURL *)v21;

      if (!v18->_baseURL)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = v19;
        objc_msgSend(v19, "regions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v59;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v59 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "paymentOffersServiceURL");
              v29 = objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = v18->_baseURL;
                v18->_baseURL = (NSURL *)v29;

                goto LABEL_17;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
            if (v26)
              continue;
            break;
          }
        }
LABEL_17:

        v19 = v56;
      }
      objc_storeStrong((id *)&v18->_passLibrary, a5);
      objc_storeStrong((id *)&v18->_configuration, a6);
      v18->_lockObservers._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v31 = objc_claimAutoreleasedReturnValue();
      observers = v18->_observers;
      v18->_observers = (NSHashTable *)v31;

      v33 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      queuedRequests = v18->_queuedRequests;
      v18->_queuedRequests = v33;

      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      sessionIdentifierForCriteriaIdentifier = v18->_sessionIdentifierForCriteriaIdentifier;
      v18->_sessionIdentifierForCriteriaIdentifier = v35;

      v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      paymentOffersForCriteriaIdentifier = v18->_paymentOffersForCriteriaIdentifier;
      v18->_paymentOffersForCriteriaIdentifier = v37;

      v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      dynamicContentPagesByCriteriaIdentifier = v18->_dynamicContentPagesByCriteriaIdentifier;
      v18->_dynamicContentPagesByCriteriaIdentifier = v39;

      v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      languageDisclosuresSeenForCriteriaIdentifier = v18->_languageDisclosuresSeenForCriteriaIdentifier;
      v18->_languageDisclosuresSeenForCriteriaIdentifier = v41;

      v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      preferredLanguageForCriteriaIdentifier = v18->_preferredLanguageForCriteriaIdentifier;
      v18->_preferredLanguageForCriteriaIdentifier = v43;

      v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      requestLoadingDetails = v18->_requestLoadingDetails;
      v18->_requestLoadingDetails = v45;

      v47 = dispatch_queue_create("com.apple.passkit.PKPaymentOffersController.reply", 0);
      replyQueue = v18->_replyQueue;
      v18->_replyQueue = (OS_dispatch_queue *)v47;

      v18->_catalogLoadingState = 1;
      v49 = objc_alloc_init(PKPaymentOffersControllerSelectedOfferDetails);
      selectedOfferDetails = v18->_selectedOfferDetails;
      v18->_selectedOfferDetails = v49;

      if (-[PKPaymentOffersController _eligibleToFetchPaymentOfferCatalog](v18, "_eligibleToFetchPaymentOfferCatalog"))
      {
        -[PKPaymentService paymentOffersCatalog](v18->_paymentService, "paymentOffersCatalog");
        v51 = objc_claimAutoreleasedReturnValue();
        catalog = v18->_catalog;
        v18->_catalog = (PKPaymentOfferCatalog *)v51;

        v53 = v18->_catalog;
        if (v53)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v53;
            _os_log_impl(&dword_18FC92000, v54, OS_LOG_TYPE_DEFAULT, "Using cached payment offers catalog %@", buf, 0xCu);
          }

        }
      }

      v15 = v57;
    }
    self = v18;
    v16 = self;
  }

  return v16;
}

- (void)updateCurrentSelectedPaymentOffer:(id)a3 updateReason:(unint64_t)a4
{
  -[PKPaymentOffersControllerSelectedOfferDetails updateCurrentSelectedPaymentOffer:updateReason:](self->_selectedOfferDetails, "updateCurrentSelectedPaymentOffer:updateReason:", a3, a4);
}

- (void)clearCurrentSelectedPaymentOfferDetails
{
  -[PKPaymentOffersControllerSelectedOfferDetails clearCurrentSelectedPaymentOfferDetails](self->_selectedOfferDetails, "clearCurrentSelectedPaymentOfferDetails");
}

- (BOOL)hasFetchedCatalogFromServer
{
  return self->_hasFetchedCatalogFromServer;
}

- (void)updatePaymentOfferCatalogWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[PKPaymentOffersControllerRequest initPaymentOfferCatalogRequestWithCompletion:]([PKPaymentOffersControllerRequest alloc], "initPaymentOfferCatalogRequestWithCompletion:", v4);

  -[PKPaymentOffersController _addPaymentOffersControllerRequest:](self, "_addPaymentOffersControllerRequest:", v5);
}

- (void)updatePaymentOffersForCriteriaIdentifier:(id)a3 paymentPass:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[PKPaymentOffersControllerRequest initPaymentOfferRequestWithCriteriaIdentifierIdentifier:paymentPass:reason:completion:]([PKPaymentOffersControllerRequest alloc], "initPaymentOfferRequestWithCriteriaIdentifierIdentifier:paymentPass:reason:completion:", v12, v11, a5, v10);

  -[PKPaymentOffersController _addPaymentOffersControllerRequest:](self, "_addPaymentOffersControllerRequest:", v13);
}

- (id)paymentOfferCollectionForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4
{
  void *v5;
  void *v6;

  PKPaymentOffersControllerGenerateCacheKey(a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_paymentOffersForCriteriaIdentifier, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dynamicContentPageForCriteriaIdentifier:(id)a3 pageType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dynamicContentPagesByCriteriaIdentifier, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)updateDynamicContentPageForCriteriaIdentifier:(id)a3 pageTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKPaymentOffersControllerRequest initDynamicContentRequestWithCriteriaIdentifier:pageTypes:completion:]([PKPaymentOffersControllerRequest alloc], "initDynamicContentRequestWithCriteriaIdentifier:pageTypes:completion:", v10, v9, v8);

  -[PKPaymentOffersController _addPaymentOffersControllerRequest:](self, "_addPaymentOffersControllerRequest:", v11);
}

- (void)removeCachedPaymentOffers
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[NSMutableDictionary count](self->_paymentOffersForCriteriaIdentifier, "count"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Removing cached payment offers", v4, 2u);
    }

    -[NSMutableDictionary removeAllObjects](self->_paymentOffersForCriteriaIdentifier, "removeAllObjects");
  }
}

- (unint64_t)loadingStateForCatalog
{
  return self->_catalogLoadingState;
}

- (id)loadingDetailsForPaymentOffersForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  PKPaymentOffersControllerGenerateCacheKey(a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestLoadingDetails, "objectForKeyedSubscript:", &unk_1E2C3EC08);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)resetLoadingDetailsForPaymentOffersForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    PKPaymentOffersControllerGenerateCacheKey(a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Reseting payment offers loading state for %@", (uint8_t *)&v8, 0xCu);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestLoadingDetails, "objectForKeyedSubscript:", &unk_1E2C3EC08);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v5);

  }
}

- (void)_updateCatalogLoadingState:(unint64_t)a3
{
  unint64_t catalogLoadingState;

  catalogLoadingState = self->_catalogLoadingState;
  self->_catalogLoadingState = a3;
  if (catalogLoadingState != a3)
    -[PKPaymentOffersController _informObserversPaymentOfferCatalogChanged](self, "_informObserversPaymentOfferCatalogChanged");
}

- (void)_updateLoadingDetailsState:(id)a3 criteriaIdentifier:(id)a4 passUniqueID:(id)a5 requestType:(unint64_t)a6
{
  id v10;
  void *v11;
  NSMutableDictionary *requestLoadingDetails;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  id v22;

  v10 = a3;
  if (a4)
  {
    v22 = v10;
    PKPaymentOffersControllerGenerateCacheKey(a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    requestLoadingDetails = self->_requestLoadingDetails;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](requestLoadingDetails, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 || !v15 || (objc_msgSend(v22, "isEqual:", v15) & 1) == 0)
    {
      if (!v14)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = self->_requestLoadingDetails;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

      }
      v19 = self->_requestLoadingDetails;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v11);

      -[PKPaymentOffersController _informObserversPaymentOfferCatalogChanged](self, "_informObserversPaymentOfferCatalogChanged");
    }

    v10 = v22;
  }

}

- (id)eligiblePaymentOfferCriteriaForPassUniqueID:(id)a3 type:(unint64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[PKPaymentOffersController _eligiblePaymentOfferCriteriaForPassUniqueID:](self, "_eligiblePaymentOfferCriteriaForPassUniqueID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentOffersController_eligiblePaymentOfferCriteriaForPassUniqueID_type___block_invoke;
  v8[3] = &__block_descriptor_40_e32_B16__0__PKPaymentOfferCriteria_8l;
  v8[4] = a4;
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __78__PKPaymentOffersController_eligiblePaymentOfferCriteriaForPassUniqueID_type___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)eligiblePaymentOfferCriteriaNoAssociatedPassWithType:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[PKPaymentOffersController _eligiblePaymentOfferCriteriaForPassUniqueID:](self, "_eligiblePaymentOfferCriteriaForPassUniqueID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PKPaymentOffersController_eligiblePaymentOfferCriteriaNoAssociatedPassWithType___block_invoke;
  v7[3] = &__block_descriptor_40_e39_B32__0__PKPaymentOfferCriteria_8Q16_B24l;
  v7[4] = a3;
  objc_msgSend(v4, "pk_objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __82__PKPaymentOffersController_eligiblePaymentOfferCriteriaNoAssociatedPassWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)paymentOfferCriteriaForPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PKPaymentOffersController _eligibleCatalogItems](self, "_eligibleCatalogItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PKPaymentOffersController_paymentOfferCriteriaForPassUniqueID___block_invoke;
  v9[3] = &unk_1E2AC34B8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pk_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__PKPaymentOffersController_paymentOfferCriteriaForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "associatedPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)eligiblePaymentOfferInstallmentCriteriaRequiringSetup
{
  void *v2;
  void *v3;

  -[PKPaymentOffersController _eligiblePaymentOfferCriteriaForPassUniqueID:](self, "_eligiblePaymentOfferCriteriaForPassUniqueID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __82__PKPaymentOffersController_eligiblePaymentOfferInstallmentCriteriaRequiringSetup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (id)paymentOfferInstallmentCriteriaRequiringSetup
{
  void *v2;
  void *v3;

  -[PKPaymentOffersController _eligibleCatalogItems](self, "_eligibleCatalogItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_81);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __74__PKPaymentOffersController_paymentOfferInstallmentCriteriaRequiringSetup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "associatedPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "type") == 1;

  return v4;
}

- (id)paymentOfferCriteriaForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PKPaymentOffersController _eligibleCatalogItems](self, "_eligibleCatalogItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentOffersController_paymentOfferCriteriaForIdentifier___block_invoke;
  v9[3] = &unk_1E2AC8CE0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __63__PKPaymentOffersController_paymentOfferCriteriaForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)_eligiblePaymentOfferCriteriaForPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  PKPaymentOffersController *v11;

  v4 = a3;
  -[PKPaymentOffersController _eligibleCatalogItems](self, "_eligibleCatalogItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PKPaymentOffersController__eligiblePaymentOfferCriteriaForPassUniqueID___block_invoke;
  v9[3] = &unk_1E2AC8D08;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "pk_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __74__PKPaymentOffersController__eligiblePaymentOfferCriteriaForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "associatedPassUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    v10 = 0;
    goto LABEL_9;
  }
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v9)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "ineligibleDetailsForCriteria:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEligible");
LABEL_9:

    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)ineligibleDetailsForCriteria:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;

  v4 = a3;
  v28 = 0;
  -[PKPaymentOffersController _criteriaEligibilityConfigurationForCriteria:](self, "_criteriaEligibilityConfigurationForCriteria:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOffersController preferredLocalizationLanguageForCriteriaIdentifier:](self, "preferredLocalizationLanguageForCriteriaIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentOffersControllerConfiguration originURL](self->_configuration, "originURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v4, "eligibleWithConfiguration:ineligibleReason:", v5, &v28) & 1) != 0)
    {
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "associatedPassUniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKPaymentOffersControllerGenerateCacheKey(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](self->_paymentOffersForCriteriaIdentifier, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v4, "type");
      if (v13)
      {
        if (v13 == 1)
        {
          objc_msgSend(v12, "installmentAssessment");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && (objc_msgSend(v14, "isEligible") & 1) == 0)
          {
            v22 = objc_msgSend(v15, "offerEligibility");
            if ((unint64_t)(v22 - 1) >= 0xA)
              v23 = 1;
            else
              v23 = qword_190454CC0[v22 - 1];
            v27 = v23;
            objc_msgSend(v15, "dynamicContent");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "dynamicContentPageForPageType:", 5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "subtitle");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            +[PKPaymentOfferCriteriaIneligibleDetails ineligibleDetailsWithReason:preferredLanguage:overrideDisplayString:criteria:isWebPaymentRequest:](PKPaymentOfferCriteriaIneligibleDetails, "ineligibleDetailsWithReason:preferredLanguage:overrideDisplayString:criteria:isWebPaymentRequest:", v27, v7, v26, v4, v8 != 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_17;
          }

        }
        v16 = v8 != 0;
        v17 = 0;
      }
      else
      {
        v16 = v8 != 0;
        v17 = 1;
      }
      +[PKPaymentOfferCriteriaIneligibleDetails ineligibleDetailsWithReason:preferredLanguage:criteria:isWebPaymentRequest:](PKPaymentOfferCriteriaIneligibleDetails, "ineligibleDetailsWithReason:preferredLanguage:criteria:isWebPaymentRequest:", v17, v7, v4, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    if (v28 > 0x12)
      v19 = 1;
    else
      v19 = qword_190454C28[v28];
    v18 = v8 != 0;
  }
  else
  {
    v18 = v8 != 0;
    v19 = 1;
  }
  +[PKPaymentOfferCriteriaIneligibleDetails ineligibleDetailsWithReason:preferredLanguage:criteria:isWebPaymentRequest:](PKPaymentOfferCriteriaIneligibleDetails, "ineligibleDetailsWithReason:preferredLanguage:criteria:isWebPaymentRequest:", v19, v7, v4, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v20;
}

- (BOOL)hasAnyEligiblePaymentOfferCriteriaOfType:(unint64_t)a3
{
  void *v5;
  _QWORD v7[6];

  -[PKPaymentOffersController _eligibleCatalogItems](self, "_eligibleCatalogItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentOffersController_hasAnyEligiblePaymentOfferCriteriaOfType___block_invoke;
  v7[3] = &unk_1E2AC8D30;
  v7[4] = self;
  v7[5] = a3;
  LOBYTE(a3) = objc_msgSend(v5, "pk_containsObjectPassingTest:", v7);

  return a3;
}

uint64_t __70__PKPaymentOffersController_hasAnyEligiblePaymentOfferCriteriaOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "ineligibleDetailsForCriteria:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEligible");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasSeenLanguageDisclosureForCriteriaForIdentifier:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_languageDisclosuresSeenForCriteriaIdentifier, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)markLanguageDisclosureAsSeenForCriteriaForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Updating language disclosure as seen for criteria identifier: %@", (uint8_t *)&v6, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_languageDisclosuresSeenForCriteriaIdentifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
  }

}

- (id)preferredLocalizationLanguageForCriteriaIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  __CFString *v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  __CFString *v30;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  PKPaymentOffersController *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKPassKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("en");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  -[PKPaymentOffersController paymentOfferCriteriaForIdentifier:](self, "paymentOfferCriteriaForIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_preferredLanguageForCriteriaIdentifier, "objectForKeyedSubscript:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
LABEL_36:
      v15 = v14;
LABEL_37:

      goto LABEL_38;
    }
    if (objc_msgSend(v11, "type") != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v14 = v10;
      goto LABEL_36;
    }
    v41 = self;
    v46 = v4;
    v42 = v11;
    v40 = v11;
    objc_msgSend(v40, "supportedLanguages");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v6;
    v45 = v5;
    v43 = v10;
    if (objc_msgSend(v49, "count"))
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v16 = v6;
      v50 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      if (v50)
      {
        v17 = 0;
        obj = v16;
        v48 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v60 != v48)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v20 = v49;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v56;
              while (2)
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v56 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                  v26 = v19;
                  v27 = v25;
                  if (v26 == v27)
                  {

LABEL_30:
                    v30 = (__CFString *)v26;

                    v17 = v30;
                    goto LABEL_31;
                  }
                  v28 = v27;
                  if (v19 && v27)
                  {
                    v29 = objc_msgSend(v26, "isEqualToString:", v27);

                    if (v29)
                      goto LABEL_30;
                  }
                  else
                  {

                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
                if (v22)
                  continue;
                break;
              }
            }
LABEL_31:

          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        }
        while (v50);

        v6 = v44;
        v5 = v45;
        v10 = v43;
        v15 = v17;
        if (v17)
          goto LABEL_53;
      }
      else
      {

      }
    }
    objc_msgSend(v5, "localizations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v33 = v49;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v52;
LABEL_42:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v37);
        if ((objc_msgSend(v32, "containsObject:", v38) & 1) != 0)
          break;
        PKLogFacilityTypeGetObject(6uLL);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v38;
          v65 = 2112;
          v66 = v46;
          _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Server has a supported language of %@ for criteriaIdentifier %@, but that is not a supported language in the PKPassKitBundle", buf, 0x16u);
        }

        if (v35 == ++v37)
        {
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
          if (v35)
            goto LABEL_42;
          goto LABEL_50;
        }
      }
      v15 = v38;

      v6 = v44;
      v5 = v45;
      v10 = v43;
      if (v15)
        goto LABEL_53;
    }
    else
    {
LABEL_50:

      v6 = v44;
      v5 = v45;
      v10 = v43;
    }
    v15 = v10;
LABEL_53:
    v4 = v46;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41->_preferredLanguageForCriteriaIdentifier, "setObject:forKeyedSubscript:", v15, v46);

    v11 = v42;
    v13 = 0;
    goto LABEL_37;
  }
  v15 = v10;
LABEL_38:

  return v15;
}

- (void)_addPaymentOffersControllerRequest:(id)a3
{
  PKPaymentOffersControllerRequest *v4;
  NSMutableOrderedSet *v5;
  PKPaymentOffersControllerRequest *currentRequest;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PKPaymentOffersControllerRequest *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  PKPaymentOffersControllerRequest *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentOffersControllerRequest *)a3;
  if (v4)
  {
    if (-[PKPaymentOffersControllerRequest coalesceWithRequest:](self->_currentRequest, "coalesceWithRequest:", v4))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEFAULT))
      {
        currentRequest = self->_currentRequest;
        *(_DWORD *)buf = 138412290;
        v20 = currentRequest;
        _os_log_impl(&dword_18FC92000, &v5->super.super, OS_LOG_TYPE_DEFAULT, "Coalescing incoming payment offers controller request onto current request %@", buf, 0xCu);
      }
LABEL_19:

    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = self->_queuedRequests;
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v5);
            v11 = *(PKPaymentOffersControllerRequest **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (-[PKPaymentOffersControllerRequest coalesceWithRequest:](v11, "coalesceWithRequest:", v4, (_QWORD)v14))
            {
              PKLogFacilityTypeGetObject(6uLL);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v20 = v11;
                _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Coalescing incoming payment offers controller request onto queued request %@", buf, 0xCu);
              }

              goto LABEL_19;
            }
          }
          v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }

      -[NSMutableOrderedSet addObject:](self->_queuedRequests, "addObject:", v4);
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Adding incoming payment offers controller request onto queued list %@", buf, 0xCu);
      }

      -[PKPaymentOffersController _executeNextPaymentOffersControllerRequestIfPossible](self, "_executeNextPaymentOffersControllerRequestIfPossible");
    }
  }

}

- (void)_executeNextPaymentOffersControllerRequestIfPossible
{
  PKPaymentOffersControllerRequest *v3;
  PKPaymentOffersControllerRequest *currentRequest;
  PKPaymentOffersControllerRequest *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  _QWORD aBlock[4];
  id v10;
  uint8_t buf[4];
  PKPaymentOffersControllerRequest *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_currentRequest)
  {
    -[NSMutableOrderedSet firstObject](self->_queuedRequests, "firstObject");
    v3 = (PKPaymentOffersControllerRequest *)objc_claimAutoreleasedReturnValue();
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    v5 = self->_currentRequest;
    if (v5)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Starting payment offers controller request %@", buf, 0xCu);
      }

      -[NSMutableOrderedSet removeObjectAtIndex:](self->_queuedRequests, "removeObjectAtIndex:", 0);
      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__PKPaymentOffersController__executeNextPaymentOffersControllerRequestIfPossible__block_invoke;
      aBlock[3] = &unk_1E2AC8D58;
      objc_copyWeak(&v10, (id *)buf);
      v7 = _Block_copy(aBlock);
      v8 = -[PKPaymentOffersControllerRequest type](self->_currentRequest, "type");
      if (v8)
      {
        if (v8 == 1)
        {
          -[PKPaymentOffersController _performPaymentOffersRequest:completion:](self, "_performPaymentOffersRequest:completion:", self->_currentRequest, v7);
        }
        else if (v8 == 2)
        {
          -[PKPaymentOffersController _performDynamicContentRequest:completion:](self, "_performDynamicContentRequest:completion:", self->_currentRequest, v7);
        }
      }
      else
      {
        -[PKPaymentOffersController _performCatalogRequest:completion:](self, "_performCatalogRequest:completion:", self->_currentRequest, v7);
      }

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __81__PKPaymentOffersController__executeNextPaymentOffersControllerRequestIfPossible__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_TITLE"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_MESSAGE"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v7, v8, v4, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v6 + 4);
      *((_QWORD *)v6 + 4) = v9;

    }
    else
    {
      v7 = (void *)WeakRetained[4];
      WeakRetained[4] = 0;
    }

    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *((_QWORD *)v6 + 11);
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Completed payment offers controller request %@", buf, 0xCu);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*((id *)v6 + 11), "completions", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++) + 16))();
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

    v18 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = 0;

    objc_msgSend(v6, "_executeNextPaymentOffersControllerRequestIfPossible");
  }

}

- (BOOL)_eligibleToFetchPaymentOfferCatalog
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;
  uint8_t buf[16];

  if (PKPaymentOffersEligibleToFetchCatalog(self->_paymentWebService))
  {
    if (!self->_baseURL)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Not fetching payment offers since there is no baseURL", buf, 2u);
      }
      goto LABEL_15;
    }
    -[PKPaymentOffersControllerConfiguration currencyCode](self->_configuration, "currencyCode");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_catalogLoadingState)
      {
        v4 = 1;
LABEL_16:

        return v4;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v9 = 0;
      v6 = "Not fetching payment offers because the loading state is not applicable";
      v7 = (uint8_t *)&v9;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        v4 = 0;
        goto LABEL_16;
      }
      v10 = 0;
      v6 = "Not fetching payment offers because there is no currencyCode defined";
      v7 = (uint8_t *)&v10;
    }
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_14;
  }
  return 0;
}

- (id)_eligibleCatalogItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[PKPaymentOfferCatalog catalog](self->_catalog, "catalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PKPaymentOffersController__eligibleCatalogItems__block_invoke;
  v6[3] = &unk_1E2AC34B8;
  v6[4] = self;
  objc_msgSend(v3, "pk_objectsPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__PKPaymentOffersController__eligibleCatalogItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paymentOfferCriteriaToKeep:", a2);
}

- (BOOL)_paymentOfferCriteriaToKeep:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if (!v4)
    goto LABEL_9;
  if (v4 != 2)
  {
    if (v4 != 1)
      goto LABEL_7;
    if (!PKHideCardBenefitPayLater())
    {
      objc_msgSend(v3, "associatedPassUniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 || !PKHidePayLaterOptions())
        goto LABEL_7;
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  if (PKHideCardBenefitRewards())
    goto LABEL_9;
LABEL_7:
  v6 = 1;
LABEL_10:

  return v6;
}

- (void)_performCatalogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKAsyncUnaryOperationComposer *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[7];
  id v17;
  id location;
  _QWORD v19[5];
  id v20;
  _QWORD v21[3];
  char v22;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__20;
    v19[4] = __Block_byref_object_dispose__20;
    v20 = 0;
    v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC8DD0;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    v16[5] = v19;
    v16[6] = v21;
    -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v16);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_97;
    v12[3] = &unk_1E2AC8DF8;
    v13 = v7;
    v14 = v21;
    v15 = v19;
    v11 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v10, v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
  }

}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "_eligibleToFetchPaymentOfferCatalog") & 1) != 0)
    {
      objc_msgSend(v11, "_updateCatalogLoadingState:", 1);
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Fetching Payment Offer Catalog", buf, 2u);
      }

      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_92;
      v16[3] = &unk_1E2AC8DA8;
      objc_copyWeak(&v22, (id *)(a1 + 56));
      v20 = *(_QWORD *)(a1 + 40);
      v19 = v9;
      v14 = v8;
      v15 = *(_QWORD *)(a1 + 32);
      v17 = v14;
      v18 = v15;
      v21 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v13, "updatePaymentOffersCatalogWithCompletion:", v16);

      objc_destroyWeak(&v22);
    }
    else
    {
      objc_msgSend(v11, "_updateCatalogLoadingState:", 0);
      (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
    }
  }

}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2;
  block[3] = &unk_1E2AC8D80;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  v13 = v6;
  v11 = *(_OWORD *)(a1 + 48);
  v7 = (id)v11;
  v17 = v11;
  v14 = *(id *)(a1 + 32);
  v15 = v5;
  v8 = *(_QWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v19);
}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_20;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v10 = WeakRetained[12];
    objc_storeStrong(v3 + 12, *(id *)(a1 + 48));
    *((_BYTE *)v3 + 104) = 1;
    objc_msgSend(v3, "_updateCatalogLoadingState:", 3);
    v11 = *(id *)(a1 + 48);
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 1;
    if (v12)
    {
      if (v10 != v11)
      {
LABEL_16:
        PKLogFacilityTypeGetObject(6uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 48);
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Payment Offer Catalog has changed: %@", (uint8_t *)&v15, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 56), "_printCatalogEligibilityDebugDetails");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
        objc_msgSend(v3, "_informObserversPaymentOfferCatalogChanged");
      }
    }
    else if ((objc_msgSend(v10, "isEqual:") & 1) == 0)
    {
      goto LABEL_16;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    goto LABEL_20;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error getting payment offer catalog: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v3, "_updateCatalogLoadingState:", 2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (!v9)
    v8 = *(void **)(a1 + 32);
  objc_storeStrong(v7, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_20:

}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_97(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2_98;
  block[3] = &unk_1E2AC5748;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2_98(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_performPaymentOffersRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKAsyncUnaryOperationComposer *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  PKPaymentOffersController *v38;
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t *v47;
  _QWORD *v48;
  id v49;
  _QWORD v50[6];
  id v51;
  _QWORD v52[5];
  id v53;
  id location;
  _QWORD v55[5];
  id v56;
  _QWORD v57[3];
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 1)
  {
    -[PKPaymentOffersControllerRequest criteriaIdentifier](self->_currentRequest, "criteriaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersControllerRequest paymentPass](self->_currentRequest, "paymentPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersController paymentOfferCriteriaForIdentifier:](self, "paymentOfferCriteriaForIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    v75[3] = __Block_byref_object_copy__20;
    v75[4] = __Block_byref_object_dispose__20;
    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionIdentifierForCriteriaIdentifier, "objectForKeyedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v76 = v11;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = __Block_byref_object_copy__20;
    v73[4] = __Block_byref_object_dispose__20;
    objc_msgSend(v9, "devicePrimaryPaymentApplication");
    v74 = (id)objc_claimAutoreleasedReturnValue();
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = __Block_byref_object_copy__20;
    v71[4] = __Block_byref_object_dispose__20;
    v72 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__20;
    v69 = __Block_byref_object_dispose__20;
    v70 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__20;
    v63 = __Block_byref_object_dispose__20;
    v64 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy__20;
    v55[4] = __Block_byref_object_dispose__20;
    v56 = 0;
    v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithState:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersController _updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:](self, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v13, v8, v29, 1);

    if (objc_msgSend(v10, "type") == 1 && objc_msgSend(v10, "requiresChallenge"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      v28 = v10;
      v16 = (void *)v60[5];
      v60[5] = v15;

      objc_msgSend((id)v60[5], "dataUsingEncoding:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "SHA256Hash");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hexEncoding");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v66[5];
      v66[5] = v19;

      v10 = v28;
    }
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__20;
    v52[4] = __Block_byref_object_dispose__20;
    v53 = 0;
    v21 = MEMORY[0x1E0C809B0];
    if (!v9)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke;
      v50[3] = &unk_1E2AC8E70;
      objc_copyWeak(&v51, &location);
      v50[4] = self;
      v50[5] = v52;
      -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v50);
      objc_destroyWeak(&v51);
    }
    v34[0] = v21;
    v34[1] = 3221225472;
    v34[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_4;
    v34[3] = &unk_1E2AC8EE8;
    objc_copyWeak(&v49, &location);
    v22 = v10;
    v35 = v22;
    v23 = v8;
    v36 = v23;
    v41 = v55;
    v24 = v29;
    v37 = v24;
    v38 = self;
    v42 = v75;
    v43 = v73;
    v25 = v9;
    v39 = v25;
    v44 = v52;
    v45 = v71;
    v46 = &v65;
    v40 = v6;
    v47 = &v59;
    v48 = v57;
    -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v34);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_113;
    v30[3] = &unk_1E2AC8DF8;
    v31 = v7;
    v32 = v57;
    v33 = v55;
    v27 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v12, "evaluateWithInput:completion:", v26, v30);

    objc_destroyWeak(&v49);
    _Block_object_dispose(v52, 8);

    objc_destroyWeak(&location);
    _Block_object_dispose(v55, 8);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(&v59, 8);

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(v71, 8);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(v75, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  PKODIServiceProviderAssessment *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    if (!v11)
    {
      v12 = [PKODIServiceProviderAssessment alloc];
      v13 = *MEMORY[0x1E0D17780];
      PKPassKitCoreBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKODIServiceProviderAssessment initWithServiceProviderIdentifier:locationBundle:](v12, "initWithServiceProviderIdentifier:locationBundle:", v13, v14);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 160);
      *(_QWORD *)(v16 + 160) = v15;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "startAssessment");
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    }
    objc_msgSend(v11, "computeAssessment");
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2;
    v19[3] = &unk_1E2AC8E48;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    v22 = *(_QWORD *)(a1 + 40);
    v21 = v9;
    v20 = v8;
    objc_msgSend(v18, "waitForAssessmentWithContinueBlock:", v19);

    objc_destroyWeak(&v23);
  }

}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  id v13;
  char v14;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_3;
  block[3] = &unk_1E2AC8E20;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v14 = a3;
  v10 = v5;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v12 = v8;
  v11 = *(id *)(a1 + 32);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(WeakRetained[20], "provideSessionFeedback:", 2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v3;
  }

}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  PKPaymentOfferWebServicePaymentOffers *v27;
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
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v54 = a2;
  v56 = a3;
  v57 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 144));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        PKLogFacilityTypeGetObject(6uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(void **)(a1 + 40);
          v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v73 = v18;
          v74 = 2112;
          v75 = v19;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Creating a new session identifier for criteriaIdentifier %@: %@", buf, 0x16u);
        }

        objc_msgSend(WeakRetained[6], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 40));
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(void **)(a1 + 40);
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v73 = v20;
        v74 = 2112;
        v75 = v21;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Fetching Payment Offers for %@, sessionIdentifier %@", buf, 0x16u);
      }

      v55 = *(id *)(*(_QWORD *)(a1 + 56) + 40);
      objc_msgSend(*(id *)(a1 + 32), "passTypeIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        objc_msgSend(WeakRetained[2], "context");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "regionForIdentifier:", v53);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "paymentOffersServiceURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (!v24)
          v25 = *(void **)(*(_QWORD *)(a1 + 56) + 40);
        v26 = v25;

        v55 = v26;
      }
      v27 = objc_alloc_init(PKPaymentOfferWebServicePaymentOffers);
      -[PKPaymentOfferWebServicePaymentOffers setBaseURL:](v27, "setBaseURL:", v55);
      -[PKPaymentOfferWebServicePaymentOffers setCriteriaIdentifier:](v27, "setCriteriaIdentifier:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "passSerialNumber");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setPassSerialNumber:](v27, "setPassSerialNumber:", v28);

      objc_msgSend(*(id *)(a1 + 32), "passTypeIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setPassTypeIdentifier:](v27, "setPassTypeIdentifier:", v29);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "dpanIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setDpanIdentifier:](v27, "setDpanIdentifier:", v30);

      objc_msgSend(*(id *)(a1 + 64), "primaryAccountIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setFpanIdentifier:](v27, "setFpanIdentifier:", v31);

      objc_msgSend(WeakRetained[21], "transactionAmount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setAmount:](v27, "setAmount:", v32);

      objc_msgSend(WeakRetained[21], "currencyCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setCurrencyCode:](v27, "setCurrencyCode:", v33);

      objc_msgSend(WeakRetained[21], "merchantCountryCode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setCountryCode:](v27, "setCountryCode:", v34);

      objc_msgSend(WeakRetained[21], "supportedNetworks");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setSupportedNetworks:](v27, "setSupportedNetworks:", v35);

      -[PKPaymentOfferWebServicePaymentOffers setPayLaterSuppressionMode:](v27, "setPayLaterSuppressionMode:", objc_msgSend(WeakRetained[21], "payLaterSuppressionMode"));
      -[PKPaymentOfferWebServicePaymentOffers setSessionIdentifier:](v27, "setSessionIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
      objc_msgSend(WeakRetained[21], "merchantIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setMerchantIdentifier:](v27, "setMerchantIdentifier:", v36);

      objc_msgSend(WeakRetained[21], "originURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setOriginURL:](v27, "setOriginURL:", v37);

      objc_msgSend(WeakRetained[21], "webMerchantIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setWebMerchantIdentifier:](v27, "setWebMerchantIdentifier:", v38);

      objc_msgSend(WeakRetained[21], "webMerchantName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setWebMerchantName:](v27, "setWebMerchantName:", v39);

      objc_msgSend(WeakRetained[21], "merchantName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setMerchantName:](v27, "setMerchantName:", v40);

      objc_msgSend(WeakRetained[21], "adamIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServicePaymentOffers setAdamIdentifier:](v27, "setAdamIdentifier:", v41);

      -[PKPaymentOfferWebServicePaymentOffers setFraudAssessment:](v27, "setFraudAssessment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
      -[PKPaymentOfferWebServicePaymentOffers setDeviceMetadata:](v27, "setDeviceMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
      -[PKPaymentOfferWebServicePaymentOffers setChallenge:](v27, "setChallenge:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
      -[PKPaymentOfferWebServicePaymentOffers setHandoff:](v27, "setHandoff:", objc_msgSend(*(id *)(a1 + 72), "updateReason") == 4);
      v42 = WeakRetained[2];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_110;
      v58[3] = &unk_1E2AC8EC0;
      objc_copyWeak(&v71, (id *)(a1 + 144));
      v43 = *(_QWORD *)(a1 + 104);
      v66 = *(_QWORD *)(a1 + 80);
      v67 = v43;
      v59 = *(id *)(a1 + 40);
      v60 = *(id *)(a1 + 48);
      v65 = v57;
      v61 = v56;
      v68 = *(_OWORD *)(a1 + 120);
      v69 = *(_QWORD *)(a1 + 136);
      v44 = *(id *)(a1 + 64);
      v45 = *(_QWORD *)(a1 + 88);
      v62 = v44;
      v70 = v45;
      v46 = *(id *)(a1 + 72);
      v47 = *(_QWORD *)(a1 + 56);
      v63 = v46;
      v64 = v47;
      objc_msgSend(v42, "paymentOffersWithRequest:completion:", v27, v58);

      objc_destroyWeak(&v71);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot fetch payment offers for %@ since there is no criteria for that identifier"), *(_QWORD *)(a1 + 40));
      v55 = (id)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v55;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v11 = *(void **)(v10 + 40);
      if (v11)
      {
        v12 = v11;
        v13 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v12;
      }
      else
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v76 = *MEMORY[0x1E0CB2D50];
        v77[0] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v13);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v51 = *(void **)(v50 + 40);
        *(_QWORD *)(v50 + 40) = v49;

      }
      +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v52, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

      (*((void (**)(id, id, _QWORD))v57 + 2))(v57, v56, 0);
    }

  }
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_111;
  v13[3] = &unk_1E2AC8E98;
  objc_copyWeak(&v27, (id *)(a1 + 136));
  v14 = v6;
  v23 = *(_OWORD *)(a1 + 88);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 80);
  v17 = *(id *)(a1 + 48);
  v18 = v5;
  v24 = *(_OWORD *)(a1 + 104);
  v25 = *(_QWORD *)(a1 + 120);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 128);
  v19 = v7;
  v26 = v8;
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v20 = v9;
  v21 = v10;
  v11 = v5;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v27);
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_111(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 152));
  if (!WeakRetained)
    goto LABEL_42;
  v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 64), "assessmentCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKValidatePaymentOfferCollection(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v11;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error validating the payment offer assessment %@", buf, 0xCu);
      }

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v16 = *(void **)(v13 + 40);
      v14 = (id *)(v13 + 40);
      v15 = v16;
      if (v16)
        v17 = v15;
      else
        v17 = v11;
      objc_storeStrong(v14, v17);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
        objc_msgSend(WeakRetained[20], "provideSessionFeedback:", 1);
      +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v18, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(WeakRetained, "preferredLocalizationLanguageForCriteriaIdentifier:", *(_QWORD *)(a1 + 40));
    v19 = objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v35 = v21;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Setting preferred language for criteriaIdentifier %@ as %@", buf, 0x16u);
    }

    v33 = (void *)v19;
    objc_msgSend(v10, "populatePreferredLanguage:", v19);
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
    if (v22)
    {
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
      if (v23)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v22;
          v36 = 2112;
          v37 = v23;
          _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Setting challenge on actionURL as %@ and challengeVerifier %@", buf, 0x16u);
        }

        objc_msgSend(v10, "populateChallenge:verifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40));
      }
    }
    PKPaymentOffersControllerGenerateCacheKey(*(void **)(a1 + 40), *(void **)(a1 + 48));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[7], "setObject:forKeyedSubscript:", v10, v24);
    +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithState:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v26, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

    if (v10 && v25)
    {
      if ((objc_msgSend(v25, "isEqual:", v10) & 1) != 0)
        goto LABEL_34;
    }
    else if (v25 == v10)
    {
LABEL_34:
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
        objc_msgSend(WeakRetained[20], "provideSessionFeedback:", 0);
      objc_msgSend(WeakRetained[22], "selectedPaymentOffer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "selectedOfferIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "selectedPaymentOfferWithCriteriaIdentifier:paymentPass:sessionIdentifier:previousSelectedOfferIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(WeakRetained[22], "updateCurrentSelectedPaymentOffer:updateReason:", v30, objc_msgSend(*(id *)(a1 + 80), "updateReason")))
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *(void **)(a1 + 40);
          v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 176);
          *(_DWORD *)buf = 138412546;
          v35 = v31;
          v36 = 2112;
          v37 = v32;
          _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Selected Payment Offer Changed for identifier %@: %@", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 1;
        objc_msgSend(WeakRetained, "_informObserversSelectedPaymentOfferChangedForPassUniqueID:", *(_QWORD *)(a1 + 48));
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();

      goto LABEL_41;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v35 = v27;
      v36 = 2112;
      v37 = (uint64_t)v10;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Payment Offers Assessment collection has changed for identifier %@: %@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 1;
    objc_msgSend(WeakRetained, "_informObserversPaymentOffersChangedForPassUniqueID:", *(_QWORD *)(a1 + 48));
    goto LABEL_34;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Error getting payment offers: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  if (!v8)
    v7 = *(void **)(a1 + 32);
  objc_storeStrong(v6, v7);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
    objc_msgSend(WeakRetained[20], "provideSessionFeedback:", 1);
  +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
LABEL_42:

}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_113(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_114;
  block[3] = &unk_1E2AC5748;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_114(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_performDynamicContentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKAsyncUnaryOperationComposer *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  PKPaymentOffersController *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  id location;
  _QWORD v29[5];
  id v30;
  _QWORD v31[3];
  char v32;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 2)
  {
    -[PKPaymentOffersControllerRequest criteriaIdentifier](self->_currentRequest, "criteriaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersControllerRequest dynamicPageTypes](self->_currentRequest, "dynamicPageTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__20;
    v29[4] = __Block_byref_object_dispose__20;
    v30 = 0;
    v10 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithState:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersController _updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:](self, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v11, v8, 0, 2);

    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke;
    v21[3] = &unk_1E2AC8F60;
    objc_copyWeak(&v27, &location);
    v13 = v8;
    v22 = v13;
    v25 = v29;
    v14 = v9;
    v23 = v14;
    v24 = self;
    v26 = v31;
    -[PKAsyncUnaryOperationComposer addOperation:](v10, "addOperation:", v21);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_120;
    v17[3] = &unk_1E2AC8DF8;
    v18 = v7;
    v19 = v31;
    v20 = v29;
    v16 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v10, "evaluateWithInput:completion:", v15, v17);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  PKPaymentOfferWebServiceDynamicContentRequest *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v35 = a3;
  v36 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v46 = v8;
        v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Fetching Payment Offer Dynamic Content for %@, pageTypes %@", buf, 0x16u);
      }

      v11 = *(id *)(*(_QWORD *)(a1 + 48) + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "paymentPass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "passTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(WeakRetained[2], "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "regionForIdentifier:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "paymentOffersServiceURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16)
          v17 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
        v18 = v17;

        v11 = v18;
      }
      v19 = objc_alloc_init(PKPaymentOfferWebServiceDynamicContentRequest);
      -[PKPaymentOfferWebServiceDynamicContentRequest setBaseURL:](v19, "setBaseURL:", v11);
      -[PKPaymentOfferWebServiceDynamicContentRequest setCriteriaIdentifier:](v19, "setCriteriaIdentifier:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferWebServiceDynamicContentRequest setTypes:](v19, "setTypes:", v20);

      v21 = WeakRetained[2];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_118;
      v37[3] = &unk_1E2AC8F38;
      objc_copyWeak(&v44, (id *)(a1 + 72));
      v42 = *(_QWORD *)(a1 + 56);
      v38 = *(id *)(a1 + 32);
      v41 = v36;
      v39 = v35;
      v22 = *(id *)(a1 + 40);
      v23 = *(_QWORD *)(a1 + 64);
      v40 = v22;
      v43 = v23;
      objc_msgSend(v21, "paymentOffersDynamicContentWithRequest:completion:", v19, v37);

      objc_destroyWeak(&v44);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot fetch payment offer dynamic content %@ since there is no criteria for that identifier"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(6uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v11;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v26 = *(void **)(v25 + 40);
      if (v26)
      {
        v27 = v26;
        v28 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v27;
      }
      else
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v49 = *MEMORY[0x1E0CB2D50];
        v50[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v28);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v32 = *(void **)(v31 + 40);
        *(_QWORD *)(v31 + 40) = v30;

      }
      +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v33, *(_QWORD *)(a1 + 32), 0, 2);

      (*((void (**)(id, id, _QWORD))v36 + 2))(v36, v35, 0);
    }

  }
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2;
  block[3] = &unk_1E2AC8F10;
  objc_copyWeak(&v19, (id *)(a1 + 80));
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v17 = v7;
  v12 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v5;
  v18 = *(_QWORD *)(a1 + 72);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v19);
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_37;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error getting payment offer dynamic content: %@", buf, 0xCu);
    }

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v9 = *(void **)(v6 + 40);
    v7 = (id *)(v6 + 40);
    v8 = v9;
    if (!v9)
      v8 = *(void **)(a1 + 32);
    objc_storeStrong(v7, v8);
    +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v10, *(_QWORD *)(a1 + 40), 0, 2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_37;
  }
  objc_msgSend(WeakRetained[16], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3[16], "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 40));
  }
  v29 = v3;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = *(id *)(a1 + 56);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "dynamicContent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dynamicContentPageForPageType:", objc_msgSend(v17, "integerValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          v21 = 1;
        else
          v21 = v18 == 0;
        if (v21)
        {
          if (v18)
            v22 = v20 == 0;
          else
            v22 = 1;
          if (v22)
          {
            if (v18 == v20)
              goto LABEL_27;
LABEL_26:
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
            objc_msgSend(v29[16], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v17);

            goto LABEL_27;
          }
          v24 = objc_msgSend(v18, "isEqual:", v20);
          if ((v24 & 1) == 0)
            goto LABEL_26;
        }
LABEL_27:

        ++v16;
      }
      while (v14 != v16);
      v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v14 = v25;
    }
    while (v25);
  }

  +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:](PKPaymentOffersControllerLoadingDetails, "loadingDetailsWithState:", 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v29;
  objc_msgSend(v29, "_updateLoadingDetailsState:criteriaIdentifier:passUniqueID:requestType:", v26, *(_QWORD *)(a1 + 40), 0, 2);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Payment Offer dynamic content changed for criteriaIdentifier %@", buf, 0xCu);
    }

    objc_msgSend(v29, "_informObserversPaymentOfferDynamicContentChanged");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

LABEL_37:
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_120(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2_121;
  block[3] = &unk_1E2AC5748;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2_121(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_fetchDeviceMetadataFields:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  PKPaymentWebService *paymentWebService;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentWebService = self->_paymentWebService;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke;
    v9[3] = &unk_1E2AC8FB0;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    objc_msgSend(v7, "paymentWebService:deviceMetadataWithFields:completion:", paymentWebService, a3, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

  objc_destroyWeak(&location);
}

void __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke_2;
  block[3] = &unk_1E2AC8F88;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (id)_criteriaEligibilityConfigurationForCriteria:(id)a3
{
  uint64_t v4;
  PKPaymentOfferInstallmentCriteriaEligibilityConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaymentOfferRewardsCriteriaEligibilityConfiguration *v12;
  PKPaymentOfferRewardsCriteriaEligibilityConfiguration *v13;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 2)
  {
    v13 = [PKPaymentOfferRewardsCriteriaEligibilityConfiguration alloc];
    -[PKPaymentOffersControllerConfiguration transactionAmount](self->_configuration, "transactionAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersControllerConfiguration currencyCode](self->_configuration, "currencyCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPaymentOfferRewardsCriteriaEligibilityConfiguration initWithAmount:currencyCode:options:](v13, "initWithAmount:currencyCode:options:", v6, v7, -[PKPaymentOffersControllerConfiguration options](self->_configuration, "options"));
  }
  else
  {
    if (v4 != 1)
    {
      v12 = 0;
      return v12;
    }
    v5 = [PKPaymentOfferInstallmentCriteriaEligibilityConfiguration alloc];
    -[PKPaymentOffersControllerConfiguration transactionAmount](self->_configuration, "transactionAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersControllerConfiguration currencyCode](self->_configuration, "currencyCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersControllerConfiguration merchantCountryCode](self->_configuration, "merchantCountryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOffersControllerConfiguration supportedNetworks](self->_configuration, "supportedNetworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPaymentOfferInstallmentCriteriaEligibilityConfiguration initWithAmount:currencyCode:merchantCountryCode:deviceRegion:supportedNetworks:merchantCapabilities:payLaterSuppressionMode:options:](v5, "initWithAmount:currencyCode:merchantCountryCode:deviceRegion:supportedNetworks:merchantCapabilities:payLaterSuppressionMode:options:", v6, v7, v8, v10, v11, -[PKPaymentOffersControllerConfiguration merchantCapabilities](self->_configuration, "merchantCapabilities"), -[PKPaymentOffersControllerConfiguration payLaterSuppressionMode](self->_configuration, "payLaterSuppressionMode"), -[PKPaymentOffersControllerConfiguration options](self->_configuration, "options"));

  }
  return v12;
}

- (void)_printCatalogEligibilityDebugDetails
{
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  __int128 v20;
  uint64_t v21;
  id obj;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Payment offer catalog eligibility debug details:", buf, 2u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PKPaymentOfferCatalog catalog](self->_catalog, "catalog");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138413314;
    v20 = v5;
    do
    {
      v8 = 0;
      v21 = v6;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        -[PKPaymentOffersController _criteriaEligibilityConfigurationForCriteria:](self, "_criteriaEligibilityConfigurationForCriteria:", v9, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v11 = objc_msgSend(v9, "eligibleWithConfiguration:ineligibleReason:", v10, &v23);
        v12 = -[PKPaymentOffersController _paymentOfferCriteriaToKeep:](self, "_paymentOfferCriteriaToKeep:", v9);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "associatedPassUniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v7;
          if (v11)
            v16 = CFSTR("YES");
          else
            v16 = CFSTR("NO");
          PKPaymentOfferCriteriaIneligibleReasonToString(v23);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          *(_DWORD *)buf = v20;
          v19 = CFSTR("NO");
          if (!v12)
            v19 = CFSTR("YES");
          v29 = v13;
          v30 = 2112;
          v31 = v14;
          v32 = 2112;
          v33 = v16;
          v7 = v15;
          v6 = v21;
          v34 = 2112;
          v35 = v17;
          v36 = 2112;
          v37 = v19;
          _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PaymentOfferID: %@, passUniqueID: %@, eligibility: %@ ineligibleReason: %@, filteredFromUI: %@", buf, 0x34u);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    }
    while (v6);
  }

}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PKPaymentOffersController__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __57__PKPaymentOffersController__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_informObserversPaymentOfferCatalogChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__PKPaymentOffersController__informObserversPaymentOfferCatalogChanged__block_invoke;
  v2[3] = &unk_1E2AC8FD8;
  v2[4] = self;
  -[PKPaymentOffersController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v2);
}

void __71__PKPaymentOffersController__informObserversPaymentOfferCatalogChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentOfferCatalogChanged:", *(_QWORD *)(a1 + 32));

}

- (void)_informObserversPaymentOffersChangedForPassUniqueID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PKPaymentOffersController__informObserversPaymentOffersChangedForPassUniqueID___block_invoke;
  v6[3] = &unk_1E2AC9000;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPaymentOffersController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __81__PKPaymentOffersController__informObserversPaymentOffersChangedForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentOffersChanged:forPassUniqueIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_informObserversSelectedPaymentOfferChangedForPassUniqueID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__PKPaymentOffersController__informObserversSelectedPaymentOfferChangedForPassUniqueID___block_invoke;
  v6[3] = &unk_1E2AC9000;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPaymentOffersController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __88__PKPaymentOffersController__informObserversSelectedPaymentOfferChangedForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "selectedPaymentOfferChanged:forPassUniqueIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_informObserversPaymentOfferDynamicContentChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__PKPaymentOffersController__informObserversPaymentOfferDynamicContentChanged__block_invoke;
  v2[3] = &unk_1E2AC8FD8;
  v2[4] = self;
  -[PKPaymentOffersController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v2);
}

void __78__PKPaymentOffersController__informObserversPaymentOfferDynamicContentChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentOfferDynamicContentChanged:", *(_QWORD *)(a1 + 32));

}

- (void)updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PKPaymentService *paymentService;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Fetching Payment Rewards Balances", buf, 2u);
  }

  paymentService = self->_paymentService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2AC9050;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v11[4] = self;
  v12 = v10;
  -[PKPaymentService updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:](paymentService, "updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:", v6, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
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
  block[2] = __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E2AC9028;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
    {
      v5 = WeakRetained;
      objc_msgSend(*(id *)(a1 + 32), "_redeemablePaymentRewardsBalanceFrom:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(a1 + 48));

      WeakRetained = v5;
    }
  }

}

- (id)paymentRedeemableRewardsBalanceWithPassUniqueIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[PKPaymentService paymentRewardsBalancesWithPassUniqueIdentifier:](self->_paymentService, "paymentRewardsBalancesWithPassUniqueIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOffersController _redeemablePaymentRewardsBalanceFrom:](self, "_redeemablePaymentRewardsBalanceFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_redeemablePaymentRewardsBalanceFrom:(id)a3
{
  return (id)objc_msgSend(a3, "pk_firstObjectPassingTest:", &__block_literal_global_142);
}

BOOL __66__PKPaymentOffersController__redeemablePaymentRewardsBalanceFrom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eligibility") == 1;
}

- (PKPaymentOffersControllerConfiguration)configuration
{
  return self->_configuration;
}

- (PKPaymentOffersControllerSelectedOfferDetails)selectedOfferDetails
{
  return self->_selectedOfferDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOfferDetails, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_paymentOffersODISession, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_dynamicContentPagesByCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_requestLoadingDetails, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_preferredLanguageForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_languageDisclosuresSeenForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentOffersForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifierForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
