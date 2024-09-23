@implementation WBSCreditCardDataController

- (WBSCreditCardDataController)init
{
  WBSCreditCardDataController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  uint64_t v6;
  NSMapTable *creditCardDataKeychainReferences;
  void *v8;
  objc_class *v9;
  PKVirtualCardManager *v10;
  PKVirtualCardManager *virtualCardManager;
  void *v12;
  objc_class *v13;
  PKSafariCardNotificationManager *v14;
  PKSafariCardNotificationManager *virtualCardNotificationManager;
  uint64_t v16;
  NSMutableArray *queueOfVirtualCardsToFetchDetailsFor;
  NSCache *v18;
  NSCache *artworkCache;
  WBSCreditCardDataController *v20;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v22.receiver = self;
  v22.super_class = (Class)WBSCreditCardDataController;
  v2 = -[WBSCreditCardDataController init](&v22, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SafariShared.WBSCreditCardDataController", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    creditCardDataKeychainReferences = v2->_creditCardDataKeychainReferences;
    v2->_creditCardDataKeychainReferences = (NSMapTable *)v6;

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v8 = (void *)getPKVirtualCardManagerClass(void)::softClass;
    v31 = getPKVirtualCardManagerClass(void)::softClass;
    if (!getPKVirtualCardManagerClass(void)::softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = ___ZL28getPKVirtualCardManagerClassv_block_invoke;
      v26 = &unk_1E4B38280;
      v27 = &v28;
      ___ZL28getPKVirtualCardManagerClassv_block_invoke((uint64_t)&v23);
      v8 = (void *)v29[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v28, 8);
    v10 = (PKVirtualCardManager *)objc_alloc_init(v9);
    virtualCardManager = v2->_virtualCardManager;
    v2->_virtualCardManager = v10;

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v12 = (void *)getPKSafariCardNotificationManagerClass(void)::softClass;
    v31 = getPKSafariCardNotificationManagerClass(void)::softClass;
    if (!getPKSafariCardNotificationManagerClass(void)::softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = ___ZL39getPKSafariCardNotificationManagerClassv_block_invoke;
      v26 = &unk_1E4B38280;
      v27 = &v28;
      ___ZL39getPKSafariCardNotificationManagerClassv_block_invoke((uint64_t)&v23);
      v12 = (void *)v29[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v28, 8);
    v14 = (PKSafariCardNotificationManager *)objc_alloc_init(v13);
    virtualCardNotificationManager = v2->_virtualCardNotificationManager;
    v2->_virtualCardNotificationManager = v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    queueOfVirtualCardsToFetchDetailsFor = v2->_queueOfVirtualCardsToFetchDetailsFor;
    v2->_queueOfVirtualCardsToFetchDetailsFor = (NSMutableArray *)v16;

    v18 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    artworkCache = v2->_artworkCache;
    v2->_artworkCache = v18;

    v20 = v2;
  }

  return v2;
}

+ (BOOL)hasCreditCardData
{
  void *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  OSStatus v8;
  NSObject *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSDebugIgnoreCardsFromKeychain")) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = *MEMORY[0x1E0CD6B80];
    v11[0] = *MEMORY[0x1E0CD6898];
    v11[1] = v4;
    v12[0] = CFSTR("com.apple.safari.credit-cards");
    v12[1] = MEMORY[0x1E0C9AAB0];
    v5 = *MEMORY[0x1E0CD6CA8];
    v6 = *MEMORY[0x1E0CD6B58];
    v11[2] = *MEMORY[0x1E0CD6C98];
    v11[3] = v6;
    v12[2] = v5;
    v12[3] = CFSTR("SafariCreditCardEntries");
    v11[4] = *MEMORY[0x1E0CD6F30];
    v12[4] = *MEMORY[0x1E0CD6F40];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = SecItemCopyMatching(v7, 0);
    v3 = v8 == 0;
    if (v8 != -25300)
    {
      if (v8)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[WBSCreditCardDataController hasCreditCardData].cold.1();
      }
    }

  }
  return v3;
}

- (id)_creditCardData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  OSStatus v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  WBSCreditCardData *v18;
  NSObject *v19;
  const __CFDictionary *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CFTypeRef result;
  _BYTE v30[128];
  _QWORD v31[7];
  _QWORD v32[9];

  v32[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "BOOLForKey:", CFSTR("WBSDebugIgnoreCardsFromKeychain")) & 1) == 0)
  {
    v2 = *MEMORY[0x1E0CD6B80];
    v31[0] = *MEMORY[0x1E0CD6898];
    v31[1] = v2;
    v32[0] = CFSTR("com.apple.safari.credit-cards");
    v32[1] = MEMORY[0x1E0C9AAB0];
    v3 = *MEMORY[0x1E0CD6CA8];
    v4 = *MEMORY[0x1E0CD6B58];
    v31[2] = *MEMORY[0x1E0CD6C98];
    v31[3] = v4;
    v32[2] = v3;
    v32[3] = CFSTR("SafariCreditCardEntries");
    v5 = *MEMORY[0x1E0CD6F38];
    v6 = *MEMORY[0x1E0CD7020];
    v31[4] = *MEMORY[0x1E0CD6F30];
    v31[5] = v6;
    v32[4] = v5;
    v32[5] = MEMORY[0x1E0C9AAB0];
    v31[6] = *MEMORY[0x1E0CD7018];
    v32[6] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);
    result = 0;
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = SecItemCopyMatching(v21, &result);
    if (v7 != -25300)
    {
      if (!v7)
      {
        v8 = (void *)result;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v26;
          v12 = *MEMORY[0x1E0CD70E0];
          v13 = *MEMORY[0x1E0CD70D8];
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v9);
              v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v15, "objectForKeyedSubscript:", v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v18 = -[WBSCreditCardData initWithKeychainRepresentation:]([WBSCreditCardData alloc], "initWithKeychainRepresentation:", v17);
                if (v18)
                {
                  -[NSMapTable setObject:forKey:](self->_creditCardDataKeychainReferences, "setObject:forKey:", v16, v18);
                  objc_msgSend(v24, "addObject:", v18);
                }

              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v10);
        }

        -[WBSCreditCardDataController _sortCreditCardDataArray:](self, "_sortCreditCardDataArray:", v24);
        goto LABEL_20;
      }
      v19 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[WBSCreditCardDataController hasCreditCardData].cold.1();
    }
    v24 = (id)MEMORY[0x1E0C9AA60];
LABEL_20:

    goto LABEL_21;
  }
  v24 = (id)MEMORY[0x1E0C9AA60];
LABEL_21:

  return v24;
}

+ (id)creditCardComparatorForSortingInSettings
{
  return &__block_literal_global_32;
}

uint64_t __71__WBSCreditCardDataController_creditCardComparatorForSortingInSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "cardName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "caseInsensitiveCompare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "cardholderName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardholderName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "caseInsensitiveCompare:", v10);

    if (!v8)
    {
      objc_msgSend(v4, "cardNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WBSCreditCardTypeFromNumber();
      WBSCreditCardTypeLocalizedName();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "cardNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WBSCreditCardTypeFromNumber();
      WBSCreditCardTypeLocalizedName();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v12, "compare:", v14);
      if (!v8)
      {
        objc_msgSend(v4, "cardNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cardNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v15, "compare:", v16);

      }
    }
  }

  return v8;
}

- (void)_sortCreditCardDataArray:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_22_0);
}

uint64_t __56__WBSCreditCardDataController__sortCreditCardDataArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isCardBalanceZeroOrNegative");
  if (v6 == objc_msgSend(v5, "isCardBalanceZeroOrNegative"))
  {
    objc_msgSend(v4, "lastUsedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    objc_msgSend(v5, "lastUsedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v7 = objc_msgSend(v15, "compare:", v11);
  }
  else if (v6)
  {
    v7 = 1;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)_deduplicatedVirtualCardDataArray:(id)a3 andCreditCardDataArray:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  char v15;
  void *v16;
  id v18;
  id v19;
  id obj;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = a4;
  v22 = v5;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v18, "count"))
    {
      v19 = (id)objc_msgSend(v5, "mutableCopy");
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      obj = v18;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v6)
      {
        v21 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v8, "cardNumber");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            v10 = v22;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v24;
              while (2)
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v24 != v12)
                    objc_enumerationMutation(v10);
                  objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "virtualCard");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v14, "isEqualToSafariEntryWithPrimaryAccountNumber:expirationDate:", v9, 0);

                  if ((v15 & 1) != 0)
                  {

                    goto LABEL_18;
                  }
                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                if (v11)
                  continue;
                break;
              }
            }

            objc_msgSend(v19, "addObject:", v8);
LABEL_18:

          }
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v6);
      }

    }
    else
    {
      v19 = v5;
    }
    v16 = v18;
  }
  else
  {
    v16 = v18;
    v19 = v18;
  }

  return v19;
}

- (NSArray)creditCardData
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__WBSCreditCardDataController_creditCardData__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__WBSCreditCardDataController_creditCardData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_creditCardData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)authenticationRequiredForVirtualCard:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "requiresAuthentication");
  else
    v4 = 1;

  return v4;
}

- (id)urlToListOfCardsInWallet
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKVirtualCardManager urlToListOfCards](self->_virtualCardManager, "urlToListOfCards");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)virtualCardFieldsToRequest
{
  return 0;
}

- (BOOL)_shouldOfferVirtualCards
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSDebugIgnoreCardsFromWallet")) ^ 1;

  return v3;
}

- (id)_virtualCardDataFromPKVirtualCards:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[WBSCreditCardDataController _sortCreditCardDataArray:](self, "_sortCreditCardDataArray:", v5);
  return v5;
}

WBSCreditCardData *__66__WBSCreditCardDataController__virtualCardDataFromPKVirtualCards___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSCreditCardData *v3;

  v2 = a2;
  v3 = -[WBSCreditCardData initWithVirtualCard:]([WBSCreditCardData alloc], "initWithVirtualCard:", v2);

  return v3;
}

- (void)getCreditCardDataWithCompletionHandler:(id)a3
{
  id v4;
  qos_class_t v5;
  PKVirtualCardManager *virtualCardManager;
  unint64_t v7;
  NSObject *internalQueue;
  dispatch_block_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  qos_class_t v15;
  id location;

  v4 = a3;
  if (-[WBSCreditCardDataController _shouldOfferVirtualCards](self, "_shouldOfferVirtualCards"))
  {
    objc_initWeak(&location, self);
    v5 = qos_class_self();
    virtualCardManager = self->_virtualCardManager;
    v7 = -[WBSCreditCardDataController virtualCardFieldsToRequest](self, "virtualCardFieldsToRequest");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E4B38370;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    v15 = v5;
    -[PKVirtualCardManager activeVirtualCardsWithOptions:completion:](virtualCardManager, "activeVirtualCardsWithOptions:completion:", v7, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E4B29E18;
    v10[4] = self;
    v11 = v4;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v10);
    dispatch_async(internalQueue, v9);

  }
}

void __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  dispatch_qos_class_t v7;
  dispatch_block_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Number of active virtual cards is %lu", buf, 0xCu);
    }

    v6 = WeakRetained[2];
    v7 = *(_DWORD *)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_31;
    block[3] = &unk_1E4B2B178;
    block[4] = WeakRetained;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v7, 0, block);
    dispatch_async(v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_virtualCardDataFromPKVirtualCards:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "_creditCardData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deduplicatedVirtualCardDataArray:andCreditCardDataArray:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "hasUsedNonVirtualCard"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "_sortCreditCardDataArray:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __70__WBSCreditCardDataController_getCreditCardDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_creditCardData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)getVirtualCardsWithCompletionHandler:(id)a3
{
  id v4;
  PKVirtualCardManager *virtualCardManager;
  unint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location[2];

  v4 = a3;
  if (-[WBSCreditCardDataController _shouldOfferVirtualCards](self, "_shouldOfferVirtualCards"))
  {
    objc_initWeak(location, self);
    virtualCardManager = self->_virtualCardManager;
    v6 = -[WBSCreditCardDataController virtualCardFieldsToRequest](self, "virtualCardFieldsToRequest");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__WBSCreditCardDataController_getVirtualCardsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E4B38398;
    objc_copyWeak(&v10, location);
    v9 = v4;
    -[PKVirtualCardManager activeVirtualCardsWithOptions:completion:](virtualCardManager, "activeVirtualCardsWithOptions:completion:", v6, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Should not offer virtual cards", (uint8_t *)location, 2u);
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __68__WBSCreditCardDataController_getVirtualCardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Number of active virtual cards is %lu", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_virtualCardDataFromPKVirtualCards:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:(id)a3 blockToUpdateCardDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKVirtualCardManager *virtualCardManager;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  WBSCreditCardDataController *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[NSMutableArray firstObject](self->_queueOfVirtualCardsToFetchDetailsFor, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_queueOfVirtualCardsToFetchDetailsFor, "removeObjectAtIndex:", 0);
  virtualCardManager = self->_virtualCardManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke;
  v13[3] = &unk_1E4B383E8;
  v10 = v7;
  v17 = v10;
  v11 = v8;
  v14 = v11;
  v15 = self;
  v12 = v6;
  v16 = v12;
  -[PKVirtualCardManager credentialsForVirtualCard:authorization:options:merchantHost:completion:](virtualCardManager, "credentialsForVirtualCard:authorization:options:merchantHost:completion:", v11, v12, 3, 0, v13);

}

void __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  char v13;
  dispatch_time_t v14;
  _QWORD block[4];
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_2;
  v19[3] = &unk_1E4B383E8;
  v23 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v19);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("WBSDebugSimulateSlowFetchOfWalletCardDetails"));

  if ((v13 & 1) != 0)
  {
    v14 = dispatch_time(0, 1250000000);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_34;
    block[3] = &unk_1E4B2AFC0;
    v18 = v11;
    v16 = v5;
    v17 = v6;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    ((void (**)(_QWORD, id, id))v11)[2](v11, v5, v6);
  }

}

void __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3;
  v12[3] = &unk_1E4B383C0;
  v13 = v6;
  v14 = v5;
  v18 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

_BYTE *__123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  WBSCreditCardData *v3;
  uint64_t v4;
  _BYTE *result;

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    v2 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v3 = -[WBSCreditCardData initWithVirtualCardCredentials:virtualCard:]([WBSCreditCardData alloc], "initWithVirtualCardCredentials:virtualCard:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "count");
  result = *(_BYTE **)(a1 + 56);
  if (v4)
    return (_BYTE *)objc_msgSend(result, "processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:blockToUpdateCardDetails:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  result[48] = 0;
  return result;
}

uint64_t __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_34(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getVirtualCardCredentialsWithExternalizedContext:(id)a3 shouldIncludeVPANCards:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  PKVirtualCardManager *virtualCardManager;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v7 = a5;
  if (-[WBSCreditCardDataController _shouldOfferVirtualCards](self, "_shouldOfferVirtualCards"))
  {
    objc_initWeak(&location, self);
    virtualCardManager = self->_virtualCardManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __121__WBSCreditCardDataController_getVirtualCardCredentialsWithExternalizedContext_shouldIncludeVPANCards_completionHandler___block_invoke;
    v9[3] = &unk_1E4B38450;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    v12 = a4;
    -[PKVirtualCardManager activeVirtualCardsWithOptions:completion:](virtualCardManager, "activeVirtualCardsWithOptions:completion:", 1, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __121__WBSCreditCardDataController_getVirtualCardCredentialsWithExternalizedContext_shouldIncludeVPANCards_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  WBSCreditCardData *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[16];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = v3;
  if (WeakRetained)
  {
    objc_msgSend(v3, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 48))
    {
      v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Filtering out VPAN enabled cards from Safari UI because Touch ID is not available", buf, 2u);
      }
      objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_37_0);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v9);
            v13 = -[WBSCreditCardData initWithVirtualCard:]([WBSCreditCardData alloc], "initWithVirtualCard:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
            objc_msgSend(v8, "addObject:", v13);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v10);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

BOOL __121__WBSCreditCardDataController_getVirtualCardCredentialsWithExternalizedContext_shouldIncludeVPANCards_completionHandler___block_invoke_35(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 2;
}

- (void)getCardDetailsForVirtualCards:(id)a3 externalizedContext:(id)a4 blockToUpdateCardDetails:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableArray addObjectsFromArray:](self->_queueOfVirtualCardsToFetchDetailsFor, "addObjectsFromArray:", v10);
  if (!self->_isQueueOfVirtualCardsToFetchDetailsForBeingProcessed)
  {
    self->_isQueueOfVirtualCardsToFetchDetailsForBeingProcessed = 1;
    -[WBSCreditCardDataController processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:blockToUpdateCardDetails:](self, "processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext:blockToUpdateCardDetails:", v8, v9);
  }

}

- (void)getCreditCardDataToFill:(id)a3 host:(id)a4 externalizedContext:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];
  _QWORD v19[4];
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "virtualCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke;
    v19[3] = &unk_1E4B38478;
    v21 = v13;
    v15 = v14;
    v20 = v15;
    v16 = (void *)MEMORY[0x1A8599ED0](v19);
    v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1A3D90000, v17, OS_LOG_TYPE_INFO, "Fetching credentials for virtual card", v18, 2u);
    }
    -[PKVirtualCardManager credentialsForVirtualCard:authorization:options:merchantHost:completion:](self->_virtualCardManager, "credentialsForVirtualCard:authorization:options:merchantHost:completion:", v15, v12, -[WBSCreditCardDataController virtualCardFieldsToRequest](self, "virtualCardFieldsToRequest"), v11, v16);

  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v10);
  }

}

void __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  char v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_2;
  v16[3] = &unk_1E4B38478;
  v18 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 32);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v16);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("WBSDebugSimulateSlowFetchOfWalletCardDetails"));

  if ((v10 & 1) != 0)
  {
    v11 = dispatch_time(0, 1250000000);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_38;
    block[3] = &unk_1E4B2AFC0;
    v15 = v8;
    v13 = v5;
    v14 = v6;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    ((void (**)(_QWORD, id, id))v8)[2](v8, v5, v6);
  }

}

void __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  WBSCreditCardData *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = -[WBSCreditCardData initWithVirtualCardCredentials:virtualCard:]([WBSCreditCardData alloc], "initWithVirtualCardCredentials:virtualCard:", v5, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __98__WBSCreditCardDataController_getCreditCardDataToFill_host_externalizedContext_completionHandler___block_invoke_38(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)titleForUnavailableVirtualCardAlert
{
  return (NSString *)_WBSLocalizedString();
}

- (NSString)messageForUnavailableVirtualCardAlert
{
  return (NSString *)_WBSLocalizedString();
}

- (BOOL)shouldNeverSaveCardWithNumber:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 4)
  {
    -[WBSCreditCardDataController _neverSavedCreditCardSuffixFromCardNumber:](self, "_neverSavedCreditCardSuffixFromCardNumber:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = WBSKeychainItemExists();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)existingCardWithNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WBSCreditCardDataController creditCardData](self, "creditCardData", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "cardNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)shouldAddCardWithNumber:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[WBSCreditCardDataController shouldNeverSaveCardWithNumber:](self, "shouldNeverSaveCardWithNumber:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[WBSCreditCardDataController existingCardWithNumber:](self, "existingCardWithNumber:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  return v5;
}

- (id)_uniqueCardNameForCardName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[WBSCreditCardDataController creditCardData](self, "creditCardData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WBSCreditCardDataController creditCardData](self, "creditCardData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "cardName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "containsObject:", v4))
  {
    for (i = 2; ; i = (i + 1))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v15, v4, i);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "containsObject:", v16) & 1) == 0)
        break;

    }
  }
  else
  {
    v16 = v4;
  }

  return v16;
}

- (id)defaultNameForCardOfType:(unint64_t)a3 cardholderName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WBSCreditCardTypeLocalizedNameForGeneratingCardNames();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WBSCreditCardTypeLocalizedNameForGeneratingCardNames();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WBSCreditCardDataController _uniqueCardNameForCardName:](self, "_uniqueCardNameForCardName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)savableCreditCardDataInForm:(id)a3
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  char v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  WBSCreditCardData *v37;
  void *v38;
  id v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(v40, "controls");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v48, "count");
  if (!v3)
  {
    v49 = 0;
    v43 = 0;
    v5 = 0;
    goto LABEL_62;
  }
  v46 = v3;
  v4 = 0;
  v5 = 0;
  v49 = 0;
  v43 = 0;
  v6 = 0;
  v7 = 0;
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  v45 = 0x7FFFFFFFFFFFFFFFLL;
  v42 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    objc_msgSend(v48, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v9, "length"))
    {
      if (v5 || !objc_msgSend(v8, "looksLikeCreditCardCardholderField"))
      {
        if (v4 || !objc_msgSend(v8, "looksLikeCreditCardNumberField"))
        {
          if (v45 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v8, "looksLikeDayField"))
          {
            v45 = -[__CFString integerValue](v9, "integerValue");
          }
          else if (v44 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v8, "looksLikeMonthField"))
          {
            v44 = -[__CFString integerValue](v9, "integerValue");
          }
          else if (v42 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v8, "looksLikeYearField"))
          {
            v42 = -[__CFString integerValue](v9, "integerValue");
          }
          else if (v49 || !objc_msgSend(v8, "looksLikeCreditCardCompositeExpirationDateField"))
          {
            if (!v43)
            {
              if (objc_msgSend(v8, "looksLikeCreditCardSecurityCodeField"))
              {
                v9 = v9;
                v43 = v9;
              }
              else
              {
                v43 = 0;
              }
            }
          }
          else
          {
            v9 = v9;
            v49 = v9;
          }
        }
        else
        {
          +[WBSFormDataController continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:](WBSFormDataController, "continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:", v48, v7, 1, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v41, "count") >= 2)
          {
            objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 16);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v11 = v41;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v55;
              while (2)
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v55 != v13)
                    objc_enumerationMutation(v11);
                  objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "value");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v15, "length"))
                  {

                    goto LABEL_35;
                  }
                  objc_msgSend(v10, "appendString:", v15);

                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
                if (v12)
                  continue;
                break;
              }
            }
LABEL_35:

            v16 = v10;
            v17 = objc_msgSend(v11, "count");

            v7 = v7 + v17 - 1;
            v9 = v16;
          }
          v6 = WBSCreditCardTypeFromNumber();
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("DebugSkipCreditCardValidation"));

          if (v6)
            v20 = 1;
          else
            v20 = v19;
          if ((v20 & 1) != 0)
            v4 = v9;
          else
            v4 = 0;

        }
      }
      else
      {
        v9 = v9;
        v5 = v9;
      }
    }

    ++v7;
  }
  while (v7 < v46);
  if (!v4)
  {
LABEL_62:
    v30 = 0;
    goto LABEL_66;
  }
  if (v5)
    goto LABEL_65;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v21 = v48;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (!v22)
  {
LABEL_60:

    goto LABEL_64;
  }
  v23 = *(_QWORD *)v51;
  v47 = *MEMORY[0x1E0D89D80];
LABEL_49:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v51 != v23)
      objc_enumerationMutation(v21);
    v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v24);
    if ((objc_msgSend(v25, "isTextField") & 1) == 0)
      goto LABEL_58;
    +[WBSFormDataController specifierForControl:](WBSFormDataController, "specifierForControl:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "property");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", v47);

      if ((v29 & 1) != 0)
        break;
    }
LABEL_57:

LABEL_58:
    if (v22 == ++v24)
    {
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v22)
        goto LABEL_49;
      goto LABEL_60;
    }
  }
  objc_msgSend(v25, "value");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v5, "length"))
  {

    goto LABEL_57;
  }

  if (v5)
    goto LABEL_65;
LABEL_64:
  v5 = &stru_1E4B40D18;
LABEL_65:
  WBSNormalizedCreditCardNumber();
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WBSCreditCardDataController shouldNeverSaveCardWithNumber:](self, "shouldNeverSaveCardWithNumber:", v30))
  {
LABEL_66:
    v31 = 0;
  }
  else
  {
    -[WBSCreditCardDataController defaultNameForCardOfType:cardholderName:](self, "defaultNameForCardOfType:cardholderName:", v6, v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    WBSExpirationDateWithDayMonthYear();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34 && v49)
    {
      v35 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v35, "setDateFormat:", CFSTR("MM/yy"));
      WBSLocaleForCreditCardExpirationDate();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setLocale:", v36);

      objc_msgSend(v35, "dateFromString:", v49);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v37 = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:]([WBSCreditCardData alloc], "initWithCardName:number:cardholderName:expirationDate:securityCode:", v33, v30, v5, v34, v43);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCreditCardData creditCardDataByUpdatingLastUsedDate:](v37, "creditCardDataByUpdatingLastUsedDate:", v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v31;
}

- (void)removeCreditCardData:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSCreditCardDataController_removeCreditCardData___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __52__WBSCreditCardDataController_removeCreditCardData___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFDictionary *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CD70E0];
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemDelete(v3))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__WBSCreditCardDataController_removeCreditCardData___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_creditCardDataDidChange");

}

- (void)replaceCreditCardData:(id)a3 withCard:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFDictionary *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "keychainRepresentationByMigratingExistingKeychainData:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CD70E0];
    v9[0] = v2;
    v4 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = *MEMORY[0x1E0CD70D8];
    v7 = v3;
    if (SecItemUpdate(v4, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)))
    {
      v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke_cold_1();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v2, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_creditCardDataDidChange");

  }
}

- (void)markCreditCardDataAsMostRecentlyUsed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "virtualCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setLastAutoFilledBySafariWithCompletion:", &__block_literal_global_57_0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creditCardDataByUpdatingLastUsedDate:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSCreditCardDataController replaceCreditCardData:withCard:](self, "replaceCreditCardData:withCard:", v7, v5);
    -[WBSCreditCardDataController setHasUsedNonVirtualCard](self, "setHasUsedNonVirtualCard");
  }

}

void __68__WBSCreditCardDataController_markCreditCardDataAsMostRecentlyUsed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __68__WBSCreditCardDataController_markCreditCardDataAsMostRecentlyUsed___block_invoke_cold_1();
    }

  }
}

- (void)saveCreditCardData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSCreditCardDataController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSCreditCardDataController_saveCreditCardData_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __68__WBSCreditCardDataController_saveCreditCardData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "keychainRepresentationForNewCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WBSSetKeychainPassword();
  v10 = 0;
  if (v10)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v10, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_removeNeverSaveCreditCardData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_creditCardDataDidChange");
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

- (void)saveCreditCardDataIfAllowed:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "cardNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSCreditCardDataController shouldAddCardWithNumber:](self, "shouldAddCardWithNumber:", v5);

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__WBSCreditCardDataController_saveCreditCardDataIfAllowed___block_invoke;
    v7[3] = &unk_1E4B2B448;
    v7[4] = self;
    v8 = v4;
    -[WBSCreditCardDataController saveCreditCardData:completionHandler:](self, "saveCreditCardData:completionHandler:", v8, v7);

  }
}

uint64_t __59__WBSCreditCardDataController_saveCreditCardDataIfAllowed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tellWalletThatNewCardWasSaved:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isCreditCardDataSaved:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSCreditCardDataController_isCreditCardDataSaved___block_invoke;
  block[3] = &unk_1E4B384C0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __53__WBSCreditCardDataController_isCreditCardDataSaved___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

}

- (id)_neverSavedCreditCardSuffixFromCard:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "cardNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCreditCardDataController _neverSavedCreditCardSuffixFromCardNumber:](self, "_neverSavedCreditCardSuffixFromCardNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_neverSavedCreditCardSuffixFromCardNumber:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_removeNeverSaveCreditCardData:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "cardNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 >= 4)
  {
    -[WBSCreditCardDataController _neverSavedCreditCardSuffixFromCard:](self, "_neverSavedCreditCardSuffixFromCard:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WBSRemoveKeychainPasswordIfExists();

  }
}

- (void)neverSaveCreditCardData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WBSCreditCardDataController _neverSavedCreditCardSuffixFromCard:](self, "_neverSavedCreditCardSuffixFromCard:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WBSSetKeychainPassword();

}

- (void)_creditCardDataDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.SafariShared.CreditCardAutoFillDataChangedNotification"), 0);

}

- (void)clearCreditCardData
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSCreditCardDataController_clearCreditCardData__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __50__WBSCreditCardDataController_clearCreditCardData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFDictionary *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD6B80];
  v7[0] = *MEMORY[0x1E0CD6898];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0C9AE50];
  v8[0] = CFSTR("com.apple.safari.credit-cards");
  v8[1] = v3;
  v4 = *MEMORY[0x1E0CD6B58];
  v7[2] = *MEMORY[0x1E0CD6C98];
  v7[3] = v4;
  v8[2] = *MEMORY[0x1E0CD6CA8];
  v8[3] = CFSTR("SafariCreditCardEntries");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemDelete(v5))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__WBSCreditCardDataController_removeCreditCardData___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "_creditCardDataDidChange");

}

- (void)savePendingChangesBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, &__block_literal_global_69);
}

- (BOOL)hasUsedNonVirtualCard
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UserHasUsedNonVirtualCardPreference"));

  return v3;
}

- (void)setHasUsedNonVirtualCard
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("UserHasUsedNonVirtualCardPreference"));

}

- (void)isVirtualCard:(id)a3 previouslyFilledVirtualCardNumbers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8);
  _BOOL8 v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PKVirtualCardManager *virtualCardManager;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, _BOOL8);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8))a5;
  v11 = -[WBSCreditCardDataController _shouldOfferVirtualCards](self, "_shouldOfferVirtualCards");
  if (!v11)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_INFO, "isVirtualCard: not offering virtual cards", buf, 2u);
    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "virtualCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_14:
    v10[2](v10, v11);
    goto LABEL_15;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
        objc_msgSend(v8, "cardNumber");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v18, "isEqual:", v17);

        if ((_DWORD)v17)
        {
          v10[2](v10, 1);
          goto LABEL_17;
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
        continue;
      break;
    }
  }

  virtualCardManager = self->_virtualCardManager;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__WBSCreditCardDataController_isVirtualCard_previouslyFilledVirtualCardNumbers_completion___block_invoke;
  v21[3] = &unk_1E4B38508;
  v22 = v8;
  v23 = v10;
  -[PKVirtualCardManager activeVirtualCardsWithOptions:completion:](virtualCardManager, "activeVirtualCardsWithOptions:completion:", 1, v21);

  v13 = v22;
LABEL_17:

LABEL_15:
}

void __91__WBSCreditCardDataController_isVirtualCard_previouslyFilledVirtualCardNumbers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "isEqualToSafariEntryWithPrimaryAccountNumber:expirationDate:", v4, 0, (_QWORD)v13))
        {
          v11 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = objc_msgSend(v5, "count");
            *(_DWORD *)buf = 134217984;
            v18 = v12;
            _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "isVirtualCard: compared card against %zu virtual cards and found a match.", buf, 0xCu);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_15;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v18 = v10;
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "isVirtualCard: compared card against %zu virtual cards but found no match.", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:

}

- (void)sendCardholderNameEnteredInFormToWalletIfNecessary:(id)a3 lastFilledVirtualCardData:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  objc_msgSend(a4, "virtualCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "type") == 2)
  {
    objc_msgSend(v6, "billingAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C97218];
      objc_msgSend(v6, "billingAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromContact:style:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    objc_msgSend(v14, "cardholderName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v14, "cardholderName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v10);

      if ((v13 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v14, "cardholderName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContactNameEnteredInSafari:completion:", v11, &__block_literal_global_71);
    }

    goto LABEL_10;
  }
LABEL_11:

}

void __108__WBSCreditCardDataController_sendCardholderNameEnteredInFormToWalletIfNecessary_lastFilledVirtualCardData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __108__WBSCreditCardDataController_sendCardholderNameEnteredInFormToWalletIfNecessary_lastFilledVirtualCardData___block_invoke_cold_1();
    }

  }
}

- (void)tellWalletThatExistingCardWasFilledInForm:(id)a3 previouslyFilledVirtualCardNumbers:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__WBSCreditCardDataController_tellWalletThatExistingCardWasFilledInForm_previouslyFilledVirtualCardNumbers___block_invoke;
  v8[3] = &unk_1E4B38550;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WBSCreditCardDataController isVirtualCard:previouslyFilledVirtualCardNumbers:completion:](self, "isVirtualCard:previouslyFilledVirtualCardNumbers:completion:", v7, a4, v8);

}

void __108__WBSCreditCardDataController_tellWalletThatExistingCardWasFilledInForm_previouslyFilledVirtualCardNumbers___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "userDidPerformAction:withCard:", 1);

  }
}

- (void)tellWalletThatNewCardWasSaved:(id)a3
{
  PKSafariCardNotificationManager *virtualCardNotificationManager;
  id v4;

  virtualCardNotificationManager = self->_virtualCardNotificationManager;
  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSafariCardNotificationManager userDidPerformAction:withCard:](virtualCardNotificationManager, "userDidPerformAction:withCard:", 0);

}

- (id)fieldsToObscureWhenFillingCreditCard:(id)a3 formMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isVirtualCard") & 1) != 0)
  {
    objc_msgSend(v6, "controls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_74);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __81__WBSCreditCardDataController_fieldsToObscureWhenFillingCreditCard_formMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "looksLikeCreditCardNumberField") & 1) != 0
    || objc_msgSend(v2, "looksLikeCreditCardSecurityCodeField"))
  {
    objc_msgSend(v2, "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)fieldsToObscureWhenFillingSingleCreditCardData:(id)a3 formFieldValues:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isVirtualCard") & 1) != 0 && (!objc_msgSend(v5, "type") || objc_msgSend(v5, "type") == 1))
  {
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_queueOfVirtualCardsToFetchDetailsFor, 0);
  objc_storeStrong((id *)&self->_virtualCardNotificationManager, 0);
  objc_storeStrong((id *)&self->_virtualCardManager, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_creditCardDataKeychainReferences, 0);
}

+ (void)hasCreditCardData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, v0, v1, "SecItemCopyMatching failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __123__WBSCreditCardDataController_processQueueOfVirtualCardsToFetchDetailsForWithExternalizedContext_blockToUpdateCardDetails___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to retrieve credentials for a virtual card with error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __52__WBSCreditCardDataController_removeCreditCardData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, v0, v1, "SecItemDelete failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __62__WBSCreditCardDataController_replaceCreditCardData_withCard___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, v0, v1, "SecItemUpdate failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__WBSCreditCardDataController_markCreditCardDataAsMostRecentlyUsed___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update last used date on virtual card %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __108__WBSCreditCardDataController_sendCardholderNameEnteredInFormToWalletIfNecessary_lastFilledVirtualCardData___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Wallet failed to save the cardholder name for a card: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
