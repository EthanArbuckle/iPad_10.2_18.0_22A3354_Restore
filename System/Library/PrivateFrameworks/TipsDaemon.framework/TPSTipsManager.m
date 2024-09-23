@implementation TPSTipsManager

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  TPSDeliveryPrecondition *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  TPSDeliveryPrecondition *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  int v43;
  NSObject *v44;
  TPSDeliveryPrecondition *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  _QWORD block[4];
  _QWORD v55[2];
  _QWORD v56[4];
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  char v63;
  _QWORD aBlock[5];
  id v65;
  uint64_t v66;
  char v67;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0DBF408], "deliveryInfoIdForDictionary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "TPSSafeDictionaryForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v7, "TPSSafeArrayForKey:", CFSTR("displayBundleIds"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[TPSTipsManager miniTipsAllowedBundles](TPSTipsManager, "miniTipsAllowedBundles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v10);

    if (!v12)
      goto LABEL_29;
  }
  v13 = objc_msgSend(v7, "TPSSafeBoolForKey:", CFSTR("overrideHoldout"));
  objc_msgSend(WeakRetained, "tipStatusController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateOverrideHoldoutForIdentifier:value:", v5, v13);

  v15 = objc_msgSend(v7, "TPSSafeBoolForKey:", CFSTR("overrideFrequencyControl"));
  objc_msgSend(WeakRetained, "tipStatusController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateOverrideFrequencyControlForIdentifier:value:", v5, v15);

  objc_msgSend(v7, "TPSSafeObjectForKey:", CFSTR("triggers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v5;
  if (v17)
  {

  }
  else
  {
    objc_msgSend(v7, "TPSSafeObjectForKey:", CFSTR("desiredOutcome"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v50 = 0;
      v20 = 1;
      goto LABEL_10;
    }
  }
  objc_msgSend(WeakRetained, "tipStatusController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isContentNeverVisibleForIdentifier:", v5) & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3F8], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "isSavedWithTipIdentifier:", v5) ^ 1;

  }
  v50 = 1;
LABEL_10:
  objc_msgSend(v7, "TPSSafeDictionaryForKey:", CFSTR("preconditions"));
  v22 = objc_claimAutoreleasedReturnValue();
  v47 = v10;
  v48 = v6;
  v46 = (void *)v22;
  if (v20)
    v23 = -[TPSDeliveryPrecondition initWithDictionary:]([TPSDeliveryPrecondition alloc], "initWithDictionary:", v22);
  else
    v23 = 0;
  v24 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1EA1DFEC8;
  v67 = v13;
  v25 = *(_QWORD *)(a1 + 56);
  aBlock[4] = WeakRetained;
  v66 = v25;
  v26 = v49;
  v65 = v26;
  v27 = _Block_copy(aBlock);
  -[TPSDeliveryPrecondition conditions](v23, "conditions");
  v28 = v23;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  v45 = v28;
  if (v30)
  {
    v31 = objc_alloc(MEMORY[0x1E0DBF318]);
    v56[0] = v24;
    v56[1] = 3221225472;
    v56[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_196;
    v56[3] = &unk_1EA1DFF40;
    v32 = &v57;
    v33 = v26;
    v57 = v33;
    v58 = v28;
    v59 = *(id *)(a1 + 40);
    v60 = WeakRetained;
    v63 = v50;
    v34 = v27;
    v35 = *(_QWORD *)(a1 + 64);
    v61 = v34;
    v62 = v35;
    v36 = (void *)objc_msgSend(v31, "initWithAsyncBlock:", v56);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("precondition-%@"), v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setName:", v37);

    objc_msgSend(*(id *)(a1 + 48), "addOperation:", v36);
    v38 = v58;
    v39 = v46;
  }
  else
  {
    v39 = v46;
    v40 = v24;
    if ((v50 ^ 1 | v20) == 1)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_cold_1();

      objc_msgSend(WeakRetained, "tipStatusController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "updatePreconditionMatchedForIdentifier:value:", v26, 1);

    }
    if (v46)
      v43 = 0;
    else
      v43 = v50;
    if (v43 == 1 && !(*((unsigned int (**)(void *, id))v27 + 2))(v27, v26))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "syncQueue");
    v38 = objc_claimAutoreleasedReturnValue();
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_206;
    block[3] = &unk_1EA1DFEF0;
    v55[1] = *(_QWORD *)(a1 + 64);
    v32 = (id *)v55;
    v55[0] = v26;
    dispatch_async(v38, block);
  }

  v40 = MEMORY[0x1E0C809B0];
LABEL_26:
  if (v50)
  {
    objc_msgSend(WeakRetained, "syncQueue");
    v44 = objc_claimAutoreleasedReturnValue();
    v51[0] = v40;
    v51[1] = 3221225472;
    v51[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_207;
    v51[3] = &unk_1EA1DFEF0;
    v53 = *(_QWORD *)(a1 + 72);
    v52 = v26;
    dispatch_async(v44, v51);

  }
  v10 = v47;
  v6 = v48;
  v5 = v49;
LABEL_29:

}

- (void)updateSupplementalIdentifiersForIdentifier:(id)a3 fromDictionary:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = *MEMORY[0x1E0DBF4B0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "TPSSafeStringForKey:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSTipsManager tipStatusController](self, "tipStatusController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateVariantIdentifierForIdentifier:value:", v8, v15);

  objc_msgSend(v7, "TPSSafeDictionaryForKey:", *MEMORY[0x1E0DBF4A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "TPSSafeStringForKey:", *MEMORY[0x1E0DBF490]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTipsManager tipStatusController](self, "tipStatusController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateCorrelationIdentifierForIdentifier:value:", v8, v11);

  objc_msgSend(v10, "TPSSafeStringForKey:", *MEMORY[0x1E0DBF488]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTipsManager tipStatusController](self, "tipStatusController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateClonedFromIdentifierForIdentifier:value:", v8, v13);

}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

+ (id)miniTipsAllowedBundles
{
  if (miniTipsAllowedBundles_predicate != -1)
    dispatch_once(&miniTipsAllowedBundles_predicate, &__block_literal_global_75);
  return (id)miniTipsAllowedBundles_miniTipsAllowedBundles;
}

void __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "updateSupplementalIdentifiersForIdentifier:fromDictionary:", v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDisplayTypeForIdentifier:value:", v6, 2);

  objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateLastUsedVersionForIdentifier:value:", v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "TPSSafeDictionaryForKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3B0], "deliveryInfoIdForDictionary:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v9, v6);

}

void __106__TPSTipsManager_updateDocumentContent_withClientConditions_checklistCompletedConditions_usingDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3B0], "contentDictionaryForDictionary:fromMatchingClientConditions:", v4, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5
    || (objc_msgSend(MEMORY[0x1E0DBF3B0], "contentDictionaryForDictionary:fromMatchingClientConditions:", v4, *(_QWORD *)(a1 + 48)), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DBF470]);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DBF468]);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v7, v3);

  }
  objc_msgSend(v6, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DBF3B0], "fileIdMapForDictionary:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateWithContentDictionary:metadata:clientConditionIdentifier:fileIdMap:clientConditions:", v12, v14, v11, v13, *(_QWORD *)(a1 + 48));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v15, "setContentStatus:", v5 != 0);

}

void __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "TPSSafeDictionaryForKey:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3B0], "deliveryInfoIdForDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v14);
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v14) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v14))
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "TPSSafeObjectForKey:", CFSTR("triggers"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSiriSuggestion:", v10 != 0);

      }
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 80), "updateSupplementalIdentifiersForIdentifier:fromDictionary:", v14, v5);
    objc_msgSend(*(id *)(a1 + 80), "tipStatusController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateDisplayTypeForIdentifier:value:", v14, v11);

    objc_msgSend(*(id *)(a1 + 80), "tipStatusController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateLastUsedVersionForIdentifier:value:", v14, *(_QWORD *)(a1 + 88));

  }
}

void __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0DBF408], "tipIdFromDictionary:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0DBF408], "contentTypeForDictionary:", v8);
  if ((v4 & 2) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v3);
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF408], "correlationIdForDictionary:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSTipsManager miniTipsAllowedIdentifiers](TPSTipsManager, "miniTipsAllowedIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v3);

  }
}

void __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  if (!v22)
    goto LABEL_8;
  if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v22))
    goto LABEL_8;
  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v22))
    goto LABEL_8;
  v3 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v22);
  v4 = v22;
  if (!v3
    || (objc_msgSend(*(id *)(a1 + 56), "tipStatusController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "hintEligibleDateForIdentifier:", v22),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v4 = v22,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "addCollectionIdentifier:", *(_QWORD *)(a1 + 80));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0DBF408]);
      objc_msgSend(*(id *)(a1 + 56), "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v10, "initWithDictionary:metadata:", v9, v11);

      objc_msgSend(v8, "addCollectionIdentifier:", *(_QWORD *)(a1 + 80));
      if (objc_msgSend(v8, "hasWidgetContent"))
      {
        v12 = *(void **)(a1 + 96);
        objc_msgSend(v8, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "TPSSafeDictionaryForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DBF3B0], "deliveryInfoIdForDictionary:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 104), "TPSSafeDictionaryForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("notification"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isWelcome") & 1) != 0)
        {
          v18 = 4;
        }
        else if ((objc_msgSend(v17, "TPSSafeBoolForKey:", CFSTR("overrideOptOut")) & 1) != 0)
        {
          v18 = 3;
        }
        else
        {
          objc_msgSend(v16, "TPSSafeObjectForKey:", CFSTR("triggers"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            v18 = 2;
          else
            v18 = v17 != 0;
        }
        objc_msgSend(v8, "widgetContent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPriority:", v18);

      }
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v8, v22);

    }
    if (objc_msgSend(v8, "isIntro"))
      v21 = *(_QWORD *)(a1 + 112);
    else
      v21 = *(_QWORD *)(a1 + 120);
    *(_BYTE *)(*(_QWORD *)(v21 + 8) + 24) = 1;
    if (objc_msgSend(v8, "isOutro"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 1;

  }
  else
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v22);
  }

}

- (TPSMetadata)metadata
{
  return self->_metadata;
}

+ (id)miniTipsAllowedIdentifiers
{
  if (miniTipsAllowedIdentifiers_predicate != -1)
    dispatch_once(&miniTipsAllowedIdentifiers_predicate, &__block_literal_global_0);
  return (id)miniTipsAllowedIdentifiers_gMiniTipsAllowedIdentifiers;
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3_cold_1(a1, v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "conditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "joinType");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(WeakRetained, "syncQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_209;
  v13[3] = &unk_1EA1E0008;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 72);
  v19 = v3;
  v12 = v3;
  +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v7, v8, v9, v10, v11, v13);

}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v14;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreTargetingValidator") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTipAppDisplayEligibleForIdentifier:", v3);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_2(a1, v11, v12);
    goto LABEL_9;
  }
  if (!*(_BYTE *)(a1 + 56) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v7 = (uint64_t *)(a1 + 40);
    v9 = objc_msgSend(v6, "isContentViewedForIdentifier:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_1(v7, v11, v14);
LABEL_9:

      v10 = 0;
      goto LABEL_10;
    }
  }
LABEL_6:
  v10 = 1;
LABEL_10:

  return v10;
}

- (id)collectionSectionsWithEligibleCollectionSections:(id)a3 collectionSectionMap:(id)a4 featuredCollection:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    v15 = (void *)objc_msgSend(v8, "copy");
  else
    v15 = 0;

  return v15;
}

- (id)collectionSectionMapWithCollections:(id)a3 availableCollectionSections:(id)a4 collectionIdToCollectionLabelMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v30, "TPSSafeArrayForKey:", CFSTR("collectionIds"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", v18);
                v19 = objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  v20 = (void *)v19;
                  objc_msgSend(v12, "addObject:", v19);

                }
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v15);
        }

        if (objc_msgSend(v12, "count"))
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF340]), "initWithDictionary:collections:", v30, v12);
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, v23);

          }
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v29);
  }

  if (objc_msgSend(v26, "count"))
    v24 = (void *)objc_msgSend(v26, "copy");
  else
    v24 = 0;

  return v24;
}

void __62__TPSTipsManager_collectionSectionsFromCollectionMap_exclude___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v9, "TPSSafeDictionaryForKey:", CFSTR("collection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "TPSSafeStringForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("collection-order")))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

    v6 = v9;
  }

}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TPSDeliveryPrecondition *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  TPSDeliveryPrecondition *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = -[TPSDeliveryPrecondition initWithDictionary:]([TPSDeliveryPrecondition alloc], "initWithDictionary:", v6);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DBF318]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3;
    v10[3] = &unk_1EA1E0030;
    v11 = v5;
    objc_copyWeak(&v17, a1 + 9);
    v12 = v7;
    v13 = a1[4];
    v14 = a1[5];
    v15 = a1[6];
    v16 = a1[7];
    v9 = (void *)objc_msgSend(v8, "initWithAsyncBlock:", v10);
    objc_msgSend(a1[8], "addOperation:", v9);

    objc_destroyWeak(&v17);
  }

}

- (void)processClientConditions:(id)a3 targetingCache:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void (**v32)(id, void *, void *);
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id location;
  _QWORD v41[4];
  id v42;
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[TPSTipsManager processClientConditions:targetingCache:completionHandler:].cold.1(v8, v11);

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF3A0], "matchedClientConditions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intersectSet:", v17);

      v18 = (id)objc_msgSend(v12, "setByAddingObjectsFromSet:", v14);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke;
      v41[3] = &unk_1EA1DFFE0;
      v42 = v8;
      v19 = v12;
      v43 = v19;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v41);
      v20 = (void *)objc_msgSend(v14, "copy");
      v21 = (void *)objc_msgSend(v19, "copy");
      v10[2](v10, v20, v21);

      v22 = v42;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF3A0], "matchedClientConditionTargeting");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_2;
      v33[3] = &unk_1EA1E0058;
      objc_copyWeak(&v39, &location);
      v34 = v9;
      v14 = v23;
      v35 = v14;
      v26 = v24;
      v36 = v26;
      v27 = v12;
      v37 = v27;
      v28 = v25;
      v38 = v28;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_210;
      v29[3] = &unk_1EA1DFE50;
      v32 = v10;
      v22 = v26;
      v30 = v22;
      v31 = v27;
      objc_msgSend(v28, "addBarrierBlock:", v29);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v10[2](v10, 0, 0);
  }

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "TPSSafeDictionaryForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("collection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5;
    v14[3] = &unk_1EA1DFAC0;
    v16 = *(_OWORD *)(a1 + 56);
    v17 = *(_OWORD *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 88);
    v15 = v3;
    objc_msgSend(v6, "processCollection:collectionsMap:ignoreSection:completionHandler:", v5, v7, 0, v14);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      v19[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "collectionSectionsFromCollectionMap:exclude:", *(_QWORD *)(a1 + 40), v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DAC2F000, v9, OS_LOG_TYPE_INFO, "Root collection ID is missing in payload", v13, 2u);
    }

    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

- (id)collectionSectionsFromCollectionMap:(id)a3 exclude:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __62__TPSTipsManager_collectionSectionsFromCollectionMap_exclude___block_invoke;
  v16 = &unk_1EA1DFEA0;
  v17 = v5;
  v9 = v8;
  v18 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v13);

  if (objc_msgSend(v9, "count", v13, v14, v15, v16))
    v11 = (void *)objc_msgSend(v9, "copy");
  else
    v11 = 0;

  return v11;
}

- (void)finalEligibleContentWithCollections:(id)a3 collectionsMap:(id)a4 collectionDeliveryInfoMap:(id)a5 eligibleTipIdentifiers:(id)a6 eligibleContextualTipIdentifiers:(id)a7 allFullTipsMap:(id)a8 allMiniTipsMap:(id)a9 tipDeliveryInfoMap:(id)a10 deliveryInfoMap:(id)a11 completionHandler:(id)a12
{
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void (**v61)(id, void *, void *, void *, void *, void *, void *);
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  int v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v85;
  id v86;
  uint64_t v87;
  id v88;
  _QWORD v89[5];
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  TPSTipsManager *v100;
  id v101;
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  TPSTipsManager *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v58 = a4;
  v65 = a5;
  v74 = a6;
  v63 = a7;
  v83 = a8;
  v18 = a9;
  v77 = a10;
  v79 = a11;
  v61 = (void (**)(id, void *, void *, void *, void *, void *, void *))a12;
  v70 = objc_msgSend(MEMORY[0x1E0DBF3A0], "showAllCollections");
  v60 = v17;
  v19 = objc_msgSend(v17, "count");
  v68 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v75 = (void *)objc_opt_new();
  v59 = (void *)objc_opt_new();
  v81 = (void *)objc_opt_new();
  v20 = (void *)MEMORY[0x1E0C99E60];
  v64 = v18;
  objc_msgSend(v18, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v63);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "minusSet:", v62);
  if (v19 || objc_msgSend(v83, "count", v58, v59))
  {
    v22 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v83, "allKeys", v58);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v18, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    obj = v17;
    v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
    if (v87)
    {
      v85 = *(_QWORD *)v129;
      do
      {
        for (i = 0; i != v87; ++i)
        {
          if (*(_QWORD *)v129 != v85)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i);
          v124 = 0;
          v125 = &v124;
          v126 = 0x2020000000;
          v127 = 0;
          v120 = 0;
          v121 = &v120;
          v122 = 0x2020000000;
          v123 = 0;
          v116 = 0;
          v117 = &v116;
          v118 = 0x2020000000;
          v119 = 0;
          objc_msgSend(MEMORY[0x1E0DBF338], "collectionLabelForDictionary:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(MEMORY[0x1E0DBF338], "tipIdentifiersForDictionary:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v102[0] = MEMORY[0x1E0C809B0];
            v102[1] = 3221225472;
            v102[2] = __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke;
            v102[3] = &unk_1EA1E0080;
            v103 = v74;
            v104 = v72;
            v105 = v71;
            v106 = self;
            v32 = v31;
            v107 = v32;
            v108 = v75;
            v109 = v28;
            v110 = v83;
            v111 = v77;
            v112 = v79;
            v113 = &v120;
            v114 = &v124;
            v115 = &v116;
            objc_msgSend(v30, "enumerateObjectsUsingBlock:", v102);
            v33 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v30, "array");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setWithArray:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v82);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "intersectSet:", v35);
            if (*((_BYTE *)v125 + 24))
            {
              objc_msgSend(v30, "minusSet:", v32);
            }
            else
            {
              objc_msgSend(v30, "removeAllObjects");
              *((_BYTE *)v121 + 24) = 0;
              *((_BYTE *)v117 + 24) = 0;
            }
            if (objc_msgSend(v30, "count"))
              v37 = 1;
            else
              v37 = v70;
            if (v37 == 1)
            {
              v38 = objc_alloc(MEMORY[0x1E0DBF338]);
              -[TPSTipsManager metadata](self, "metadata");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (void *)objc_msgSend(v38, "initWithDictionary:metadata:", v27, v39);

              objc_msgSend(v30, "array");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setTipIdentifiers:", v41);

              objc_msgSend(v40, "setContainsIntroTip:", *((unsigned __int8 *)v121 + 24));
              objc_msgSend(v40, "setContainsOutroTip:", *((unsigned __int8 *)v117 + 24));
              if (v40)
              {
                objc_msgSend(v40, "identifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "addObject:", v42);
                objc_msgSend(v67, "setObject:forKeyedSubscript:", v40, v42);
                objc_msgSend(v65, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "setObject:forKeyedSubscript:", v43, v42);

              }
            }
            objc_msgSend(v81, "unionSet:", v36);

          }
          _Block_object_dispose(&v116, 8);
          _Block_object_dispose(&v120, 8);
          _Block_object_dispose(&v124, 8);
        }
        v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
      }
      while (v87);
    }

  }
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "majorVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_2;
  v93[3] = &unk_1EA1E00A8;
  v46 = v77;
  v94 = v46;
  v47 = v59;
  v95 = v47;
  v96 = v62;
  v97 = v63;
  v98 = v75;
  v99 = v79;
  v100 = self;
  v48 = v45;
  v101 = v48;
  v73 = v79;
  v86 = v75;
  v76 = v63;
  v88 = v62;
  objc_msgSend(v83, "enumerateKeysAndObjectsUsingBlock:", v93);
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_3;
  v89[3] = &unk_1EA1E00D0;
  v89[4] = self;
  v90 = v48;
  v91 = v46;
  v92 = v47;
  v49 = v47;
  v80 = v46;
  v78 = v48;
  objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v89);
  -[TPSTipsManager tipStatusController](self, "tipStatusController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "updateCacheData");

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v88);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "unionSet:", v81);
  v52 = (void *)objc_msgSend(v68, "copy");
  v53 = (void *)objc_msgSend(v67, "copy");
  v54 = (void *)objc_msgSend(v66, "copy");
  v55 = (void *)objc_msgSend(v86, "copy");
  v56 = (void *)objc_msgSend(v49, "copy");
  v57 = (void *)objc_msgSend(v51, "copy");
  v61[2](v61, v52, v53, v54, v55, v56, v57);

}

- (void)processCollection:(id)a3 collectionsMap:(id)a4 ignoreSection:(BOOL)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, void *, void *, void *, void *, void *);
  void *v29;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  _QWORD v38[4];
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28 = (void (**)(id, void *, void *, void *, void *, void *))a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v8;
  objc_msgSend(v8, "TPSSafeArrayForKey:", CFSTR("collectionIds"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v9, "TPSSafeDictionaryForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "TPSSafeDictionaryForKey:", CFSTR("collection"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "TPSSafeStringForKey:", CFSTR("type"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("collection-order")))
        {
          objc_msgSend(MEMORY[0x1E0DBF338], "collectionOrderIdentifierForDictionary:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_12;
          v19 = (void *)v18;
          if (a5)
            goto LABEL_16;
          objc_msgSend(v31, "addObject:", v18);
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __83__TPSTipsManager_processCollection_collectionsMap_ignoreSection_completionHandler___block_invoke;
          v38[3] = &unk_1EA1DFE78;
          v39 = v36;
          v40 = v31;
          v41 = v35;
          v42 = v34;
          v43 = v33;
          -[TPSTipsManager processCollection:collectionsMap:ignoreSection:completionHandler:](self, "processCollection:collectionsMap:ignoreSection:completionHandler:", v16, v9, 1, v38);

          v20 = v39;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DBF338], "collectionLabelForDictionary:", v16);
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
LABEL_12:
            objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v49 = v14;
              v50 = 2112;
              v51 = v16;
              _os_log_debug_impl(&dword_1DAC2F000, v20, OS_LOG_TYPE_DEBUG, "Collection unique id: %@ is missing collectionLabel in the payload %@", buf, 0x16u);
            }
            v19 = 0;
            goto LABEL_15;
          }
          v19 = (void *)v21;
          objc_msgSend(v36, "addObject:", v16);
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v16, v19);
          objc_msgSend(MEMORY[0x1E0DBF3B0], "deliveryInfoIdForDictionary:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v22, v19);

          objc_msgSend(MEMORY[0x1E0DBF338], "collectionOrderIdentifierForDictionary:", v16);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v19, v20);
        }
LABEL_15:

LABEL_16:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v11);
  }
  v23 = (void *)objc_msgSend(v36, "copy");
  v24 = (void *)objc_msgSend(v31, "copy");
  v25 = (void *)objc_msgSend(v35, "copy");
  v26 = (void *)objc_msgSend(v34, "copy");
  v27 = (void *)objc_msgSend(v33, "copy");
  v28[2](v28, v23, v24, v25, v26, v27);

}

void __83__TPSTipsManager_processCollection_collectionsMap_ignoreSection_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v15, "count"))
    objc_msgSend(a1[4], "addObjectsFromArray:", v15);
  if (objc_msgSend(v11, "count"))
    objc_msgSend(a1[5], "addObjectsFromArray:", v11);
  if (objc_msgSend(v12, "count"))
    objc_msgSend(a1[6], "addEntriesFromDictionary:", v12);
  if (objc_msgSend(v13, "count"))
    objc_msgSend(a1[7], "addEntriesFromDictionary:", v13);
  if (objc_msgSend(v14, "count"))
    objc_msgSend(a1[8], "addEntriesFromDictionary:", v14);

}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setByAddingObjectsFromSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncWithIdentifiers:", v3);

  objc_msgSend(*(id *)(a1 + 32), "tipStatusController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCacheData");

  objc_msgSend(*(id *)(a1 + 40), "endTransaction");
  v5 = *(_QWORD *)(a1 + 48);
  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "copy");
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(_QWORD *)(a1[5] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v11;
  v30 = v11;

  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v12;
  v20 = v12;

  v21 = *(_QWORD *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v13;
  v23 = v13;

  v24 = *(_QWORD *)(a1[8] + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v14;
  v26 = v14;

  v27 = *(_QWORD *)(a1[9] + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v15;
  v29 = v15;

  (*(void (**)(void))(a1[4] + 16))();
}

- (TPSTipsManagerDelegate)delegate
{
  return (TPSTipsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __64__TPSTipsManager_checklistCollectionHasMinSuggestedTips_tipMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9 = v6;
    v8 = objc_msgSend(v6, "isCompleted");
    v7 = v9;
    if ((v8 & 1) == 0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 2;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

- (BOOL)hasWidgetDocument
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TPSTipsManager widgetController](self, "widgetController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (TPSWidgetController)widgetController
{
  return self->_widgetController;
}

- (NSMutableArray)sessionItems
{
  return self->_sessionItems;
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMetadata:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePauseStatus:", objc_msgSend(*(id *)(a1 + 32), "contextualTipsInactive"));
  objc_msgSend(*(id *)(a1 + 32), "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF308], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanguageCode:", v2);

}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)_updatePauseStatus:(BOOL)a3
{
  id v4;

  if (self->_contextualTipsInactive != a3)
  {
    self->_contextualTipsInactive = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_contextualTipsInactive)
      objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("contextualTipsInactive"));
    else
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("contextualTipsInactive"));
    objc_msgSend(v4, "synchronize");

  }
}

- (void)processTipsDeliveryInfo:(id)a3 deliveryInfoMap:(id)a4 targetingCache:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  TPSTargetingCache *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  TPSTargetingCache *v34;
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t *v38;
  id v39;
  id location;
  _QWORD v41[3];
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v10 = a3;
  v11 = a4;
  v12 = (TPSTargetingCache *)a5;
  v13 = a6;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__1;
  v53 = __Block_byref_object_dispose__1;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  v48 = 0;
  v14 = objc_msgSend(v10, "count");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v50[5];
    v50[5] = v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v44[5];
    v44[5] = v17;

    v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v19, "setMaxConcurrentOperationCount:", 1);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v42 = 0;
    -[TPSTipsManager experiment](self, "experiment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "camp");

    v42 = v21;
    objc_initWeak(&location, self);
    if (!v12)
      v12 = objc_alloc_init(TPSTargetingCache);
    objc_msgSend(MEMORY[0x1E0DBF3F0], "transactionWithName:", CFSTR("com.apple.TipsDaemon.precondition-check"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke;
    v32[3] = &unk_1EA1DFF68;
    v33 = v11;
    objc_copyWeak(&v39, &location);
    v36 = v41;
    v12 = v12;
    v34 = v12;
    v37 = &v49;
    v24 = v19;
    v35 = v24;
    v38 = &v43;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v32);
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_3;
    v26[3] = &unk_1EA1DFFB8;
    objc_copyWeak(&v31, &location);
    v29 = &v49;
    v30 = &v43;
    v25 = v22;
    v27 = v25;
    v28 = v13;
    objc_msgSend(v24, "addOperationWithBlock:", v26);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v39);

    objc_destroyWeak(&location);
    _Block_object_dispose(v41, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
}

- (void)contentFromOrigin:(BOOL)a3 processTipKitContent:(BOOL)a4 contextualEligibility:(BOOL)a5 widgetEligibility:(BOOL)a6 notificationEligibility:(BOOL)a7 preferredNotificationIdentifiers:(id)a8 shouldDeferBlock:(id)a9 completionHandler:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  BOOL v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint8_t *v41;
  _QWORD *v42;
  _QWORD *v43;
  id v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  _QWORD v49[9];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  uint8_t *v55;
  id v56;
  _QWORD v57[5];
  __CFString *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  id location;
  uint8_t buf[8];
  uint8_t *v65;
  _BYTE v66[24];
  id v67;
  uint64_t v68;

  v10 = a7;
  v35 = a5;
  v36 = a6;
  v12 = a3;
  v68 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a9;
  v16 = a10;
  if (v14)
    v17 = 1;
  else
    v17 = +[TPSNotificationController isValidNotificationInterval](TPSNotificationController, "isValidNotificationInterval");
  v34 = a4;
  v33 = v16;
  if (!+[TPSNotificationController supportsNotification](TPSNotificationController, "supportsNotification")|| !v17)
  {

    v14 = 0;
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v12;
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = v35;
    HIWORD(v65) = 1024;
    *(_DWORD *)v66 = v36;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = v10;
    *(_WORD *)&v66[10] = 2112;
    *(_QWORD *)&v66[12] = v14;
    _os_log_impl(&dword_1DAC2F000, v18, OS_LOG_TYPE_DEFAULT, "update content from origin: %d contextualEligibility:%d widgetEligibility:%d notificationEligibility: %d preferredNotificationIdentifiers: %@", buf, 0x24u);
  }

  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  v65 = buf;
  *(_QWORD *)v66 = 0x3032000000;
  *(_QWORD *)&v66[8] = __Block_byref_object_copy__1;
  *(_QWORD *)&v66[16] = __Block_byref_object_dispose__1;
  v67 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__1;
  v61[4] = __Block_byref_object_dispose__1;
  v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__1;
  v59[4] = __Block_byref_object_dispose__1;
  v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v19 = CFSTR("com.apple.tipsd");
  if (!v12)
    v19 = 0;
  v57[3] = __Block_byref_object_copy__1;
  v57[4] = __Block_byref_object_dispose__1;
  v58 = v19;
  objc_msgSend(MEMORY[0x1E0DBF3F0], "transactionWithName:", CFSTR("com.apple.TipsDaemon.updateContent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v21, "setMaxConcurrentOperationCount:", 1);
  v22 = objc_alloc(MEMORY[0x1E0DBF318]);
  v23 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke;
  v51[3] = &unk_1EA1DF958;
  v53 = v59;
  objc_copyWeak(&v56, &location);
  v32 = v15;
  v52 = v32;
  v54 = v57;
  v55 = buf;
  v24 = (void *)objc_msgSend(v22, "initWithAsyncBlock:", v51);
  objc_msgSend(v21, "addOperation:", v24);
  v25 = objc_alloc(MEMORY[0x1E0DBF318]);
  v49[0] = v23;
  v49[1] = 3221225472;
  v49[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3;
  v49[3] = &unk_1EA1DF9D0;
  v49[5] = buf;
  v49[6] = v59;
  v49[7] = v57;
  objc_copyWeak(&v50, &location);
  v49[8] = v61;
  v49[4] = self;
  v26 = (void *)objc_msgSend(v25, "initWithAsyncBlock:", v49);
  objc_msgSend(v26, "addDependency:", v24);
  objc_msgSend(v21, "addOperation:", v26);
  v27 = objc_alloc(MEMORY[0x1E0DBF318]);
  v37[0] = v23;
  v37[1] = 3221225472;
  v37[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3_121;
  v37[3] = &unk_1EA1DFA20;
  objc_copyWeak(&v44, &location);
  v41 = buf;
  v42 = v61;
  v43 = v59;
  v45 = v34;
  v46 = v35;
  v47 = v36;
  v48 = v10;
  v28 = v14;
  v38 = v28;
  v29 = v33;
  v40 = v29;
  v30 = v20;
  v39 = v30;
  v31 = (void *)objc_msgSend(v27, "initWithAsyncBlock:", v37);
  objc_msgSend(v31, "addDependency:", v26);
  objc_msgSend(v21, "addOperation:", v31);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v50);

  objc_destroyWeak(&v56);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

}

- (void)contentWithMetaDictionary:(id)a3 documents:(id)a4 isRemote:(BOOL)a5 processTipKitContent:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9 preferredNotificationIdentifiers:(id)a10 completionHandler:(id)a11
{
  _BOOL4 v11;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _BOOL4 v70;
  _BOOL4 v71;
  void *v72;
  id v73;
  TPSTargetingCache *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  id v93;
  _QWORD v94[5];
  _QWORD v95[4];
  id v96;
  id v97;
  uint8_t *v98;
  _QWORD v99[5];
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  __int128 *v104;
  _QWORD *v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  id v111;
  _QWORD v112[5];
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD *v116;
  _QWORD *v117;
  id v118;
  _QWORD v119[5];
  id v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD *v123;
  _QWORD *v124;
  id v125;
  _QWORD v126[4];
  id v127;
  TPSTargetingCache *v128;
  uint8_t *v129;
  _QWORD *v130;
  _QWORD *v131;
  __int128 *v132;
  _QWORD *v133;
  id v134;
  uint8_t v135[8];
  uint8_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  _QWORD v141[4];
  id v142;
  _QWORD *v143;
  _QWORD *v144;
  id v145;
  BOOL v146;
  _QWORD v147[5];
  id v148;
  id v149;
  _QWORD *v150;
  _QWORD *v151;
  _QWORD *v152;
  _QWORD *v153;
  _QWORD *v154;
  __int128 *v155;
  _QWORD *v156;
  _QWORD *v157;
  _QWORD *v158;
  _QWORD *v159;
  _QWORD *v160;
  _QWORD *v161;
  _QWORD *v162;
  id v163;
  _QWORD v164[5];
  id v165;
  _QWORD v166[5];
  id v167;
  _QWORD v168[5];
  id v169;
  _QWORD v170[5];
  id v171;
  _QWORD v172[5];
  id v173;
  _QWORD v174[5];
  id v175;
  _QWORD v176[5];
  id v177;
  _QWORD v178[4];
  id v179;
  id v180;
  TPSTargetingCache *v181;
  _QWORD *v182;
  _QWORD *v183;
  id v184;
  _QWORD v185[5];
  id v186;
  _QWORD v187[5];
  id v188;
  _QWORD v189[4];
  id v190;
  id v191;
  TPSTipsManager *v192;
  _QWORD *v193;
  _QWORD *v194;
  _QWORD *v195;
  _QWORD *v196;
  _QWORD *v197;
  _QWORD *v198;
  _QWORD v199[5];
  id v200;
  _QWORD v201[5];
  id v202;
  _QWORD v203[5];
  id v204;
  _QWORD v205[5];
  id v206;
  _QWORD v207[5];
  id v208;
  _QWORD v209[5];
  id v210;
  _QWORD v211[5];
  id v212;
  __int128 *p_buf;
  _QWORD *v214;
  _QWORD v215[5];
  id v216;
  _QWORD block[4];
  id v218;
  id v219;
  id location;
  __int128 buf;
  uint64_t v222;
  uint64_t (*v223)(uint64_t, uint64_t);
  void (*v224)(uint64_t);
  id v225;
  uint64_t v226;

  v70 = a6;
  v71 = a8;
  v11 = a7;
  v226 = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v80 = a4;
  v75 = a10;
  v79 = a11;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DBF3D8], "metadataFromDictionary:", v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF3D8]), "initWithDictionary:", v82);
  if (v14)
  {
    v74 = objc_alloc_init(TPSTargetingCache);
    objc_msgSend(v82, "TPSSafeStringForKey:", CFSTR("rulesHash"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSTipsManager rulesVersion](self, "rulesVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v78);

    if ((v16 & 1) == 0)
    {
      -[TPSTipsManager setRulesVersion:](self, "setRulesVersion:", v78);
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v78, CFSTR("DeliveryInfoVersion"));
      objc_msgSend(v17, "synchronize");

    }
    objc_msgSend(v82, "TPSSafeDictionaryForKey:", CFSTR("experiment"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSTipsManager experiment](self, "experiment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "camp");

    -[TPSTipsManager experiment](self, "experiment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "updateWithExperimentDictionary:", v72);

    if (v21)
    {
      -[TPSTipsManager _updateExperimentCache](self, "_updateExperimentCache");
      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[TPSTipsManager experiment](self, "experiment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "debugDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_DEFAULT, "Experiment changed %@", (uint8_t *)&buf, 0xCu);

      }
      -[TPSTipsManager experiment](self, "experiment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "camp");

      v28 = v19 == 2 && v26 == 1;
    }
    else
    {
      v28 = 0;
    }
    -[TPSTipsManager syncQueue](self, "syncQueue");
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_1EA1DFA48;
    objc_copyWeak(&v219, &location);
    v66 = v14;
    v218 = v66;
    dispatch_async(v29, block);

    v30 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v30, "setMaxConcurrentOperationCount:", 4);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v222 = 0x3032000000;
    v223 = __Block_byref_object_copy__1;
    v224 = __Block_byref_object_dispose__1;
    v225 = 0;
    v215[0] = 0;
    v215[1] = v215;
    v215[2] = 0x3032000000;
    v215[3] = __Block_byref_object_copy__1;
    v215[4] = __Block_byref_object_dispose__1;
    v216 = 0;
    v31 = objc_alloc(MEMORY[0x1E0DBF318]);
    v211[0] = MEMORY[0x1E0C809B0];
    v211[1] = 3221225472;
    v211[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2;
    v211[3] = &unk_1EA1DFA98;
    v211[4] = self;
    v32 = v80;
    v212 = v32;
    p_buf = &buf;
    v214 = v215;
    v33 = (void *)objc_msgSend(v31, "initWithAsyncBlock:", v211);
    objc_msgSend(v33, "setName:", CFSTR("content-fetch"));
    v76 = v33;
    v209[0] = 0;
    v209[1] = v209;
    v209[2] = 0x3032000000;
    v209[3] = __Block_byref_object_copy__1;
    v209[4] = __Block_byref_object_dispose__1;
    v210 = 0;
    v207[0] = 0;
    v207[1] = v207;
    v207[2] = 0x3032000000;
    v207[3] = __Block_byref_object_copy__1;
    v207[4] = __Block_byref_object_dispose__1;
    v208 = 0;
    v205[0] = 0;
    v205[1] = v205;
    v205[2] = 0x3032000000;
    v205[3] = __Block_byref_object_copy__1;
    v205[4] = __Block_byref_object_dispose__1;
    v206 = 0;
    v203[0] = 0;
    v203[1] = v203;
    v203[2] = 0x3032000000;
    v203[3] = __Block_byref_object_copy__1;
    v203[4] = __Block_byref_object_dispose__1;
    v204 = 0;
    v201[0] = 0;
    v201[1] = v201;
    v201[2] = 0x3032000000;
    v201[3] = __Block_byref_object_copy__1;
    v201[4] = __Block_byref_object_dispose__1;
    v202 = 0;
    v199[0] = 0;
    v199[1] = v199;
    v199[2] = 0x3032000000;
    v199[3] = __Block_byref_object_copy__1;
    v199[4] = __Block_byref_object_dispose__1;
    v200 = 0;
    objc_msgSend(v83, "TPSSafeStringForKey:", CFSTR("rootCollectionId"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "TPSSafeDictionaryForKey:", CFSTR("collectionsMap"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v32;
    objc_msgSend(MEMORY[0x1E0DBF3B0], "deliveryInfoForDictionary:", v83);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc(MEMORY[0x1E0DBF318]);
    v189[0] = MEMORY[0x1E0C809B0];
    v189[1] = 3221225472;
    v189[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4;
    v189[3] = &unk_1EA1DFAE8;
    v68 = v34;
    v190 = v68;
    v69 = v35;
    v191 = v69;
    v192 = self;
    v193 = v209;
    v194 = v207;
    v195 = v203;
    v196 = v201;
    v197 = v199;
    v198 = v205;
    v38 = (void *)objc_msgSend(v37, "initWithAsyncBlock:", v189);
    objc_msgSend(v38, "setName:", CFSTR("process-collection"));
    v77 = v38;
    v187[0] = 0;
    v187[1] = v187;
    v187[2] = 0x3032000000;
    v187[3] = __Block_byref_object_copy__1;
    v187[4] = __Block_byref_object_dispose__1;
    v188 = 0;
    v185[0] = 0;
    v185[1] = v185;
    v185[2] = 0x3032000000;
    v185[3] = __Block_byref_object_copy__1;
    v185[4] = __Block_byref_object_dispose__1;
    v186 = 0;
    objc_msgSend(v83, "TPSSafeDictionaryForKey:", CFSTR("documentsMap"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "count"))
    {
      v40 = objc_alloc(MEMORY[0x1E0DBF318]);
      v178[0] = MEMORY[0x1E0C809B0];
      v178[1] = 3221225472;
      v178[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_133;
      v178[3] = &unk_1EA1DFB38;
      objc_copyWeak(&v184, &location);
      v179 = v39;
      v180 = v36;
      v181 = v74;
      v182 = v187;
      v183 = v185;
      v81 = (void *)objc_msgSend(v40, "initWithAsyncBlock:", v178);
      objc_msgSend(v81, "setName:", CFSTR("process-tips"));

      objc_destroyWeak(&v184);
    }
    else
    {
      v81 = 0;
    }
    v176[0] = 0;
    v176[1] = v176;
    v176[2] = 0x3032000000;
    v176[3] = __Block_byref_object_copy__1;
    v176[4] = __Block_byref_object_dispose__1;
    v177 = 0;
    v174[0] = 0;
    v174[1] = v174;
    v174[2] = 0x3032000000;
    v174[3] = __Block_byref_object_copy__1;
    v174[4] = __Block_byref_object_dispose__1;
    v175 = 0;
    v172[0] = 0;
    v172[1] = v172;
    v172[2] = 0x3032000000;
    v172[3] = __Block_byref_object_copy__1;
    v172[4] = __Block_byref_object_dispose__1;
    v173 = 0;
    v170[0] = 0;
    v170[1] = v170;
    v170[2] = 0x3032000000;
    v170[3] = __Block_byref_object_copy__1;
    v170[4] = __Block_byref_object_dispose__1;
    v171 = 0;
    v168[0] = 0;
    v168[1] = v168;
    v168[2] = 0x3032000000;
    v168[3] = __Block_byref_object_copy__1;
    v168[4] = __Block_byref_object_dispose__1;
    v169 = 0;
    v166[0] = 0;
    v166[1] = v166;
    v166[2] = 0x3032000000;
    v166[3] = __Block_byref_object_copy__1;
    v166[4] = __Block_byref_object_dispose__1;
    v167 = 0;
    v164[0] = 0;
    v164[1] = v164;
    v164[2] = 0x3032000000;
    v164[3] = __Block_byref_object_copy__1;
    v164[4] = __Block_byref_object_dispose__1;
    v165 = 0;
    v41 = objc_alloc(MEMORY[0x1E0DBF318]);
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_138;
    v147[3] = &unk_1EA1DFB88;
    v147[4] = self;
    v150 = v209;
    v151 = v203;
    v152 = v201;
    v153 = v187;
    v154 = v185;
    v155 = &buf;
    v156 = v215;
    v67 = v39;
    v148 = v67;
    v73 = v36;
    v149 = v73;
    objc_copyWeak(&v163, &location);
    v157 = v176;
    v158 = v174;
    v159 = v172;
    v160 = v170;
    v161 = v168;
    v162 = v166;
    v42 = (void *)objc_msgSend(v41, "initWithAsyncBlock:", v147);
    objc_msgSend(v30, "addOperation:", v76);
    objc_msgSend(v30, "addOperation:", v77);
    objc_msgSend(v42, "setName:", CFSTR("process-eligibility"));
    objc_msgSend(v42, "addDependency:", v76);
    objc_msgSend(v42, "addDependency:", v77);
    if (v81)
    {
      objc_msgSend(v30, "addOperation:", v81);
      objc_msgSend(v42, "addDependency:", v81);
    }
    objc_msgSend(v30, "addOperation:", v42);
    if (v11)
    {
      if (-[TPSTipsManager contextualTipsInactive](self, "contextualTipsInactive"))
      {
        objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v135 = 0;
          _os_log_impl(&dword_1DAC2F000, v43, OS_LOG_TYPE_DEFAULT, "Contextual tips content inactive, skipping.", v135, 2u);
        }

      }
      else
      {
        v44 = objc_alloc(MEMORY[0x1E0DBF318]);
        v141[0] = MEMORY[0x1E0C809B0];
        v141[1] = 3221225472;
        v141[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_144;
        v141[3] = &unk_1EA1DFBB0;
        objc_copyWeak(&v145, &location);
        v143 = v166;
        v144 = v168;
        v142 = v73;
        v146 = v28;
        v45 = (void *)objc_msgSend(v44, "initWithAsyncBlock:", v141);
        objc_msgSend(v45, "setName:", CFSTR("contextual-eligibility"));
        objc_msgSend(v45, "addDependency:", v42);
        objc_msgSend(v30, "addOperation:", v45);

        objc_destroyWeak(&v145);
      }
    }
    v46 = v42;
    *(_QWORD *)v135 = 0;
    v136 = v135;
    v137 = 0x3032000000;
    v138 = __Block_byref_object_copy__1;
    v139 = __Block_byref_object_dispose__1;
    v140 = 0;
    objc_msgSend(v83, "TPSSafeDictionaryForKey:", CFSTR("globalConditions"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "TPSSafeDictionaryForKey:", CFSTR("clientConditions"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v46;
    if (objc_msgSend(v48, "count"))
    {
      v50 = objc_alloc(MEMORY[0x1E0DBF318]);
      v126[0] = MEMORY[0x1E0C809B0];
      v126[1] = 3221225472;
      v126[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_147;
      v126[3] = &unk_1EA1DFC00;
      objc_copyWeak(&v134, &location);
      v127 = v48;
      v128 = v74;
      v129 = v135;
      v130 = v203;
      v131 = v174;
      v132 = &buf;
      v133 = v170;
      v49 = (void *)objc_msgSend(v50, "initWithAsyncBlock:", v126);
      objc_msgSend(v49, "setName:", CFSTR("process-client-conditions"));
      objc_msgSend(v49, "addDependency:", v46);
      objc_msgSend(v30, "addOperation:", v49);

      objc_destroyWeak(&v134);
    }
    if (v71)
    {
      v51 = objc_alloc(MEMORY[0x1E0DBF318]);
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_151;
      v119[3] = &unk_1EA1DFC50;
      objc_copyWeak(&v125, &location);
      v119[4] = self;
      v121 = v174;
      v122 = v170;
      v123 = v172;
      v124 = v168;
      v120 = v73;
      v52 = (void *)objc_msgSend(v51, "initWithAsyncBlock:", v119);
      objc_msgSend(v52, "setName:", CFSTR("widget-eligibility"));
      objc_msgSend(v52, "addDependency:", v49);
      objc_msgSend(v30, "addOperation:", v52);

      objc_destroyWeak(&v125);
    }
    if (a9)
    {
      v53 = (void *)objc_opt_class();
      objc_msgSend(v66, "language");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53) = objc_msgSend(v53, "deviceLocalesContainLanguage:", v54);

      if ((_DWORD)v53)
      {
        if (v75)
        {
          v55 = 0;
        }
        else
        {
          v56 = objc_alloc(MEMORY[0x1E0DBF318]);
          v114[0] = MEMORY[0x1E0C809B0];
          v114[1] = 3221225472;
          v114[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_158;
          v114[3] = &unk_1EA1DFCA0;
          objc_copyWeak(&v118, &location);
          v116 = v172;
          v117 = v168;
          v115 = v73;
          v55 = (void *)objc_msgSend(v56, "initWithAsyncBlock:", v114);
          objc_msgSend(v55, "setName:", CFSTR("immediate-notification-eligibility"));
          objc_msgSend(v55, "addDependency:", v49);
          objc_msgSend(v30, "addOperation:", v55);

          objc_destroyWeak(&v118);
        }
        v112[0] = 0;
        v112[1] = v112;
        v112[2] = 0x3032000000;
        v112[3] = __Block_byref_object_copy__1;
        v112[4] = __Block_byref_object_dispose__1;
        v113 = 0;
        v57 = objc_alloc(MEMORY[0x1E0DBF318]);
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_163;
        v100[3] = &unk_1EA1DFCF0;
        objc_copyWeak(&v111, &location);
        v104 = &buf;
        v101 = v75;
        v105 = v176;
        v106 = v174;
        v107 = v172;
        v108 = v170;
        v109 = v168;
        v102 = v73;
        v103 = v82;
        v110 = v112;
        v58 = (void *)objc_msgSend(v57, "initWithAsyncBlock:", v100);
        objc_msgSend(v58, "setName:", CFSTR("notification-eligibility"));
        objc_msgSend(v58, "addDependency:", v49);
        if (v55)
          objc_msgSend(v58, "addDependency:", v55);
        objc_msgSend(v30, "addOperation:", v58);

        objc_destroyWeak(&v111);
        _Block_object_dispose(v112, 8);

      }
    }
    if (v70
      && +[TPSTipsManager setTipKitContentProcessFlagIfNeeded](TPSTipsManager, "setTipKitContentProcessFlagIfNeeded"))
    {
      v59 = objc_alloc(MEMORY[0x1E0DBF318]);
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5_168;
      v99[3] = &unk_1EA1DFD40;
      v99[4] = self;
      v60 = (void *)objc_msgSend(v59, "initWithAsyncBlock:", v99);
      objc_msgSend(v60, "setName:", CFSTR("update-tipkit-device-profile"));
      objc_msgSend(v60, "addDependency:", v49);
      objc_msgSend(v30, "addOperation:", v60);
      v61 = objc_alloc(MEMORY[0x1E0DBF318]);
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_173;
      v95[3] = &unk_1EA1DFD68;
      v96 = v83;
      v97 = v65;
      v98 = v135;
      v62 = (void *)objc_msgSend(v61, "initWithAsyncBlock:", v95);
      objc_msgSend(v62, "setName:", CFSTR("process-TipKit-tips"));
      objc_msgSend(v62, "addDependency:", v60);
      objc_msgSend(v30, "addOperation:", v62);
      objc_msgSend(v30, "addBarrierBlock:", &__block_literal_global_179);

    }
    v63 = objc_alloc(MEMORY[0x1E0DBF318]);
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_180;
    v94[3] = &unk_1EA1DFDB0;
    v94[4] = v164;
    v64 = (void *)objc_msgSend(v63, "initWithAsyncBlock:", v94);
    objc_msgSend(v64, "setName:", CFSTR("user-guides"));
    objc_msgSend(v30, "addOperation:", v64);
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_184;
    v84[3] = &unk_1EA1DFDD8;
    objc_copyWeak(&v93, &location);
    v86 = v176;
    v87 = v174;
    v88 = v170;
    v89 = v164;
    v90 = v205;
    v91 = v199;
    v92 = v207;
    v85 = v79;
    objc_msgSend(v30, "addBarrierBlock:", v84);

    objc_destroyWeak(&v93);
    _Block_object_dispose(v135, 8);

    objc_destroyWeak(&v163);
    _Block_object_dispose(v164, 8);

    _Block_object_dispose(v166, 8);
    _Block_object_dispose(v168, 8);

    _Block_object_dispose(v170, 8);
    _Block_object_dispose(v172, 8);

    _Block_object_dispose(v174, 8);
    _Block_object_dispose(v176, 8);

    _Block_object_dispose(v185, 8);
    _Block_object_dispose(v187, 8);

    _Block_object_dispose(v199, 8);
    _Block_object_dispose(v201, 8);

    _Block_object_dispose(v203, 8);
    _Block_object_dispose(v205, 8);

    _Block_object_dispose(v207, 8);
    _Block_object_dispose(v209, 8);

    _Block_object_dispose(v215, 8);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&v219);
  }

  objc_destroyWeak(&location);
}

- (TPSExperiment)experiment
{
  return self->_experiment;
}

- (NSString)rulesVersion
{
  return self->_rulesVersion;
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id *v14;
  id v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) == 0;
  else
    v5 = 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D8], "metadataFromDictionary:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "TPSSafeStringForKey:", CFSTR("contentMapHash"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF368], "contentRequestURLWithContentMapHash:");
    v6 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v6;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v6, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCachePolicy:", 5);
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0DBF3C8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DBF478];
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v12 = *MEMORY[0x1E0DBF450];
    v13 = *MEMORY[0x1E0CB3338];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4;
    v26[3] = &unk_1EA1DF980;
    v14 = (id *)(a1 + 72);
    objc_copyWeak(&v32, (id *)(a1 + 72));
    v29 = *(_QWORD *)(a1 + 48);
    v15 = v8;
    v16 = *(_QWORD *)(a1 + 64);
    v27 = v15;
    v30 = v16;
    v31 = &v33;
    v28 = v4;
    LODWORD(v17) = v13;
    objc_msgSend(v9, "formattedDataForRequest:identifier:attributionIdentifier:requestType:priority:completionHandler:", v15, v10, v11, v12, v26, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v34[5];
    v34[5] = v18;

    if (v34[5])
    {
      objc_msgSend(*(id *)(a1 + 32), "syncQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_120;
      block[3] = &unk_1EA1DF9A8;
      objc_copyWeak(&v25, v14);
      block[4] = &v33;
      dispatch_async(v20, block);

      objc_destroyWeak(&v25);
    }
    _Block_object_dispose(&v33, 8);

    objc_destroyWeak(&v32);
  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  void (**v32)(id, _QWORD);
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DBF368], "metaRequestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCachePolicy:", 5);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v7 = *(_QWORD *)(a1 + 32);
    if (v7 && (*(unsigned int (**)(void))(v7 + 16))())
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSTipsManager"), 4, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v3[2](v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    else
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__1;
      v40 = __Block_byref_object_dispose__1;
      v41 = 0;
      objc_msgSend(MEMORY[0x1E0DBF3C8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0DBF480];
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v14 = *MEMORY[0x1E0DBF438];
      v15 = *MEMORY[0x1E0CB3338];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2;
      v28[3] = &unk_1EA1DF930;
      v16 = *(id *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v31 = v16;
      v33 = v17;
      v18 = v5;
      v19 = *(_QWORD *)(a1 + 56);
      v29 = v18;
      v30 = WeakRetained;
      v34 = v19;
      v35 = &v36;
      v32 = v3;
      LODWORD(v20) = v15;
      objc_msgSend(v11, "formattedDataForRequest:identifier:attributionIdentifier:requestType:priority:completionHandler:", v18, v12, v13, v14, v28, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v37[5];
      v37[5] = v21;

      if (v37[5])
      {
        objc_msgSend(WeakRetained, "syncQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_117;
        v27[3] = &unk_1EA1DF8B8;
        v27[4] = WeakRetained;
        v27[5] = &v36;
        dispatch_async(v23, v27);

      }
      _Block_object_dispose(&v36, 8);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.TipsDaemon.ContentFetchError"), 1, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    v3[2](v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

- (id)featureCollectionFromCollectionMap:(id)a3 collectionOrder:(id)a4 tipMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  id v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  NSObject *v53;
  NSObject *v54;
  id v55;
  id v56;
  char v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  TPSTipsManager *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v64 = self;
  if (!objc_msgSend((id)objc_opt_class(), "supportsFeaturedCollection"))
  {
    v33 = 0;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3A0], "featuredCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  v58 = v11;
  v59 = v12;
  if (!v14)
  {

    v65 = 0;
    v60 = 0;
    v34 = 0;
    v25 = 0;
    v26 = 1;
    goto LABEL_38;
  }
  v15 = v14;
  v55 = v9;
  v56 = v10;
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v65 = 0;
  v16 = *(_QWORD *)v71;
  v57 = 1;
  while (2)
  {
    v17 = 0;
    v61 = v15;
    do
    {
      if (*(_QWORD *)v71 != v16)
        objc_enumerationMutation(v13);
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v17));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "priority") == 1)
      {
        objc_msgSend(v11, "addObject:", v18);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v12);

        if ((v20 & 1) != 0)
        {
          objc_msgSend(v18, "setTopFeatured:", 1);
          v33 = v18;

          v9 = v55;
          v10 = v56;
          v34 = v62;
          v25 = v63;
          goto LABEL_53;
        }
        -[TPSTipsManager collectionStatusForCollection:](v64, "collectionStatusForCollection:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "featuredDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          if (!v63 || objc_msgSend(v63, "compare:", v22) == -1)
          {
            v23 = v18;

            v24 = v22;
            v62 = v23;
            v63 = v24;
            v11 = v58;
            v12 = v59;
          }
          v15 = v61;
        }
        else
        {
          if (!v60)
          {
            if (objc_msgSend(v18, "isChecklist")
              && !-[TPSTipsManager checklistCollectionHasMinSuggestedTips:tipMap:](v64, "checklistCollectionHasMinSuggestedTips:tipMap:", v18, v56))
            {
              v60 = 0;
            }
            else
            {
              v60 = v18;
            }
          }
          v57 = 0;
        }
        if (!v65)
          v65 = v18;

      }
      ++v17;
    }
    while (v15 != v17);
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v15)
      continue;
    break;
  }

  v25 = v63;
  v26 = v62 == 0;
  v10 = v56;
  if (v62)
  {
    objc_msgSend(v63, "timeIntervalSinceNow");
    if (v27 >= 0.0)
    {
      if ((v57 & 1) != 0)
      {
LABEL_76:
        v37 = v62;
        objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.3(v37, v54);

        v34 = v37;
        v9 = v55;
        v12 = v59;
LABEL_50:
        if ((objc_msgSend(v37, "isEqual:", v34) & 1) == 0)
        {
          -[TPSTipsManager collectionStatusForCollection:](v64, "collectionStatusForCollection:", v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setFeaturedDate:", v41);

          objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "syncCollectionStatusMap");

          v11 = v58;
        }
        goto LABEL_52;
      }
    }
    else
    {
      v28 = v27;
      objc_msgSend(MEMORY[0x1E0DBF3A0], "discoverabilitySuppressionInterval");
      if (v29 <= 0.0)
        v30 = 604800.0;
      else
        v30 = v29;
      v31 = fabs(v28);
      objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.5(v62);

      if ((v30 <= v31) | v57 & 1)
      {
        if (v30 > v31)
          goto LABEL_76;
        goto LABEL_74;
      }
    }
    if (objc_msgSend(v62, "isChecklist"))
    {
      v44 = !-[TPSTipsManager checklistCollectionHasMinSuggestedTips:tipMap:](v64, "checklistCollectionHasMinSuggestedTips:tipMap:", v62, v56);
    }
    else
    {
      objc_msgSend(v62, "tipIdentifiers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "tipStatusController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v48 = v45;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v67;
        while (2)
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v67 != v51)
              objc_enumerationMutation(v48);
            if (!objc_msgSend(v47, "isContentViewedForIdentifier:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i)))
            {
              v44 = 0;
              goto LABEL_68;
            }
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
          if (v50)
            continue;
          break;
        }
        v44 = 1;
LABEL_68:
        v25 = v63;
      }
      else
      {
        v44 = 1;
      }

      v11 = v58;
    }
    objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.4(v62);

    if (!v44)
      goto LABEL_76;
  }
LABEL_74:
  v9 = v55;
  v34 = v62;
  if ((v57 & 1) == 0)
  {
LABEL_44:
    v38 = v60;
    if (v38)
    {
      v60 = v38;
      v37 = v38;
    }
    else
    {
      v37 = v65;
      v60 = 0;
      v65 = v37;
    }
    goto LABEL_47;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.2(v35);

  if (!v26)
    objc_msgSend(v11, "removeObject:", v34);
  v36 = objc_msgSend(v11, "count");
  if (v36 < 1)
    goto LABEL_44;
  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)arc4random_uniform(v36));
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (!v37)
    goto LABEL_44;
LABEL_47:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.1(v37, v39);

  v12 = v59;
  if (v37)
    goto LABEL_50;
LABEL_52:
  objc_msgSend(v37, "setTopFeatured:", 1);
  v33 = v37;
LABEL_53:

LABEL_54:
  return v33;
}

- (id)collectionStatusForCollection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DBF348];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "collectionStatusForCollectionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)checklistCollectionHasMinSuggestedTips:(id)a3 tipMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  objc_msgSend(v5, "tipIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__TPSTipsManager_checklistCollectionHasMinSuggestedTips_tipMap___block_invoke;
  v10[3] = &unk_1EA1E00F8;
  v8 = v6;
  v11 = v8;
  v12 = v14;
  v13 = &v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  LOBYTE(v7) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return (char)v7;
}

+ (BOOL)supportsFeaturedCollection
{
  return 1;
}

- (id)updateDocumentContent:(id)a3 withClientConditions:(id)a4 checklistCompletedConditions:(id)a5 usingDictionary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  TPSTipsManager *v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __106__TPSTipsManager_updateDocumentContent_withClientConditions_checklistCompletedConditions_usingDictionary___block_invoke;
    v18[3] = &unk_1EA1DFE00;
    v19 = v13;
    v20 = v12;
    v21 = v11;
    v22 = v14;
    v23 = self;
    v15 = v14;
    v16 = v13;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);
    v13 = (id)objc_msgSend(v15, "copy");

  }
  return v13;
}

void __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
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
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3;
  v7[3] = &unk_1EA1DFA70;
  v9 = *(_OWORD *)(a1 + 48);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "processTipDocumentsDictionary:completionHandler:", v5, v7);

}

- (void)processTipDocumentsDictionary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF338], "documentsForDictionary:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke;
  v23[3] = &unk_1EA1DFE28;
  v13 = v9;
  v24 = v13;
  v14 = v10;
  v25 = v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);
  -[TPSTipsManager syncQueue](self, "syncQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke_2;
  block[3] = &unk_1EA1DFE50;
  v21 = v14;
  v22 = v6;
  v20 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v6;
  dispatch_async(v15, block);

}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;
  __int128 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_4;
  block[3] = &unk_1EA1DFF90;
  block[4] = WeakRetained;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v3, block);

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9;
  id v10;
  id WeakRetained;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v28[6];
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a7);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (v9)
    {
      if ((isKindOfClass & 1) != 0)
        goto LABEL_7;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB32F0];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
      v17 = 5;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB32F0];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v18;
      v17 = 6;
    }
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSTipsManager"), v17, v15);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v30 = v23;
      _os_log_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_DEFAULT, "Documents call error: %@", buf, 0xCu);
    }
  }
  else
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = v9;
    v22 = *(NSObject **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v25;
  }

  objc_msgSend(WeakRetained, "syncQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_119;
  v28[3] = &unk_1EA1DF8B8;
  v27 = *(_QWORD *)(a1 + 64);
  v28[4] = WeakRetained;
  v28[5] = v27;
  dispatch_async(v26, v28);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  _QWORD v36[6];
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = *(_QWORD *)(a1 + 48);
  if (v17 && (*(unsigned int (**)(void))(v17 + 16))())
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSTipsManager"), 4, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a7);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_10;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB32F0];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v25 = 5;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB32F0];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      v25 = 6;
    }
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSTipsManager"), v25, v23);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

  }
LABEL_10:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      _os_log_impl(&dword_1DAC2F000, v30, OS_LOG_TYPE_DEFAULT, "Meta call error: %@", buf, 0xCu);
    }
  }
  else
  {
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v33 = v13;
    v30 = *(NSObject **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v33;
  }

  objc_msgSend(*(id *)(a1 + 40), "syncQueue");
  v34 = objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_116;
  v36[3] = &unk_1EA1DF8B8;
  v35 = *(_QWORD *)(a1 + 80);
  v36[4] = *(_QWORD *)(a1 + 40);
  v36[5] = v35;
  dispatch_async(v34, v36);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (BOOL)needImmediateNotificationForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend((id)objc_opt_class(), "immediateNotificationIdentifierForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionStatusForCollectionIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "canNotify"))
  {
    objc_msgSend(v5, "firstViewedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)deviceLocalesContainLanguage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0DBF368];
  v4 = a3;
  objc_msgSend(v3, "preferredLocalizationsWithCount:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)immediateNotificationIdentifierForType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return *(&off_1EA1E01E0 + a3);
}

+ (void)removeExperimentCache
{
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("Experiment"));
}

+ (void)removeWelcomeDocumentCache
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0DBF3D0], "welcome");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DAC2F000, v2, OS_LOG_TYPE_DEFAULT, "Remove welcome document cache", v3, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("TPSWelcomeDocumentCache"));
}

+ (void)removeWidgetUpdateDate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSWidgetUpdateDate"));

}

+ (id)rulesVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DeliveryInfoVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)experiment
{
  return (id)objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClass:forKey:", objc_opt_class(), CFSTR("Experiment"));
}

void __44__TPSTipsManager_miniTipsAllowedIdentifiers__block_invoke()
{
  void *v0;

  v0 = (void *)miniTipsAllowedIdentifiers_gMiniTipsAllowedIdentifiers;
  miniTipsAllowedIdentifiers_gMiniTipsAllowedIdentifiers = (uint64_t)&unk_1EA1F0A58;

}

void __40__TPSTipsManager_miniTipsAllowedBundles__block_invoke()
{
  void *v0;

  v0 = (void *)miniTipsAllowedBundles_miniTipsAllowedBundles;
  miniTipsAllowedBundles_miniTipsAllowedBundles = (uint64_t)&unk_1EA1F0A70;

}

+ (BOOL)setTipKitContentProcessFlagIfNeeded
{
  int v2;
  unsigned int v3;
  BOOL v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = setTipKitContentProcessFlagIfNeeded_expectedValue;
  while (1)
  {
    v3 = __ldaxr(tipKitContentProcessingInProgress);
    if (v3 != v2)
      break;
    v4 = 1;
    if (!__stlxr(1u, tipKitContentProcessingInProgress))
      return v4;
  }
  v4 = 0;
  __clrex();
  setTipKitContentProcessFlagIfNeeded_expectedValue = v3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DAC2F000, v5, OS_LOG_TYPE_DEFAULT, "TipKit Content Processing is already in progress", v7, 2u);
  }

  return v4;
}

+ (void)resetTipKitContentProcessingFlag
{
  do
    __ldxr(tipKitContentProcessingInProgress);
  while (__stxr(0, tipKitContentProcessingInProgress));
}

- (TPSTipsManager)initWithTipStatusController:(id)a3
{
  id v5;
  TPSTipsManager *v6;
  void *v7;
  uint64_t v8;
  NSString *rulesVersion;
  uint64_t v10;
  TPSExperiment *experiment;
  TPSExperiment *v12;
  TPSExperiment *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *sessionItems;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *syncQueue;
  TPSWidgetController *v21;
  TPSWidgetController *widgetController;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSTipsManager;
  v6 = -[TPSTipsManager init](&v24, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_contextualTipsInactive = objc_msgSend(v7, "BOOLForKey:", CFSTR("contextualTipsInactive"));
    +[TPSTipsManager rulesVersion](TPSTipsManager, "rulesVersion");
    v8 = objc_claimAutoreleasedReturnValue();
    rulesVersion = v6->_rulesVersion;
    v6->_rulesVersion = (NSString *)v8;

    objc_storeStrong((id *)&v6->_tipStatusController, a3);
    +[TPSTipsManager experiment](TPSTipsManager, "experiment");
    v10 = objc_claimAutoreleasedReturnValue();
    experiment = v6->_experiment;
    v6->_experiment = (TPSExperiment *)v10;

    if (!v6->_experiment)
    {
      v12 = (TPSExperiment *)objc_alloc_init(MEMORY[0x1E0DBF3C0]);
      v13 = v6->_experiment;
      v6->_experiment = v12;

    }
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[TPSExperiment debugDescription](v6->_experiment, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1DAC2F000, v14, OS_LOG_TYPE_DEFAULT, "Current experiment %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    sessionItems = v6->_sessionItems;
    v6->_sessionItems = (NSMutableArray *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.tipsManager.syncQueue", v18);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v19;

    v21 = (TPSWidgetController *)objc_alloc_init(MEMORY[0x1E0DBF420]);
    widgetController = v6->_widgetController;
    v6->_widgetController = v21;

    -[TPSWidgetController setDelegate:](v6->_widgetController, "setDelegate:", v6);
  }

  return v6;
}

- (BOOL)isContentIdentifierHoldoutCamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[TPSTipsManager experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "camp") == 2)
  {
    -[TPSTipsManager tipStatusController](self, "tipStatusController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isOverrideHoldoutForIdentifier:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_updateExperimentCache
{
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", self->_experiment, CFSTR("Experiment"));
}

- (void)updateContentIfOverrideImmediately:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD aBlock[5];
  id v23;
  char v24;
  id location;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3A0], "requestInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
    if (v7 > 0.0 || (v7 == 0.0 ? (v9 = TPSNumberOfOverrideFetch == 0) : (v9 = 0), v9))
    {
      objc_initWeak(&location, self);
      -[TPSTipsManager notificationController](self, "notificationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isNotificationSettingValid");

      if ((v11 & 1) != 0)
      {
        -[TPSTipsManager delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "canCheckForNewTipNotification:", self);
      }
      else
      {
        -[TPSTipsManager notificationController](self, "notificationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clearNotificationCache");
        v13 = 0;
      }

      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke;
      aBlock[3] = &unk_1EA1DF868;
      objc_copyWeak(&v23, &location);
      v24 = v13;
      aBlock[4] = self;
      v15 = (void (**)(_QWORD))_Block_copy(aBlock);
      v16 = v15;
      ++TPSNumberOfOverrideFetch;
      if (v3)
      {
        v15[2](v15);
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0C99E88];
        v20[0] = v14;
        v20[1] = 3221225472;
        v20[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2_90;
        v20[3] = &unk_1EA1DF890;
        v21 = v15;
        objc_msgSend(v17, "timerWithTimeInterval:repeats:block:", 0, v20, v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTimer:forMode:", v18, *MEMORY[0x1E0C99748]);

      }
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }

}

void __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2;
  v5[3] = &unk_1EA1DF840;
  objc_copyWeak(&v6, v2);
  v7 = *(_BYTE *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 1, 1, 1, 1, v4, 0, 0, v5);

  objc_destroyWeak(&v6);
}

void __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tipsManagerContentUpdateOverrideCompleted:contentPackage:shouldUpdateNotification:error:", WeakRetained, v7, *(unsigned __int8 *)(a1 + 48), v6);

  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAC2F000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling for next update content override...", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_87;
  block[3] = &unk_1EA1DF818;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_87(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContentIfOverrideImmediately:", 0);
}

uint64_t __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isPreconditionValidForIdentifier:(id)a3 preconditionDictionary:(id)a4
{
  id v5;
  id v6;
  TPSDeliveryPrecondition *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  if (a4)
  {
    v6 = a4;
    v7 = -[TPSDeliveryPrecondition initWithDictionary:]([TPSDeliveryPrecondition alloc], "initWithDictionary:", v6);

    if (v7)
    {
      -[TPSDeliveryPrecondition conditions](v7, "conditions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:error:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:error:", v8, -[TPSDeliveryPrecondition joinType](v7, "joinType"), v5, 0, 0, 0);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)contentForVariantIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") >= 4)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 2);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF368], "contentRequestURLWithContentMapHash:variantIdentifiers:useLanguageDefault:", 0, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCachePolicy:", 5);
  objc_initWeak(&location, self);
  -[TPSTipsManager syncQueue](self, "syncQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke;
  v17[3] = &unk_1EA1DF908;
  objc_copyWeak(&v22, &location);
  v18 = v11;
  v19 = v9;
  v20 = v6;
  v21 = v7;
  v13 = v7;
  v14 = v6;
  v15 = v9;
  v16 = v11;
  dispatch_async(v12, v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0DBF3C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0DBF448];
  v7 = *MEMORY[0x1E0CB3338];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_105;
  v16 = &unk_1EA1DF8E0;
  v17 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v18 = WeakRetained;
  v19 = v8;
  v20 = &v21;
  LODWORD(v9) = v7;
  objc_msgSend(v3, "formattedDataForRequest:identifier:attributionIdentifier:requestType:priority:completionHandler:", v4, v5, CFSTR("com.apple.tipsd"), v6, &v13, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v22[5];
  v22[5] = v10;

  if (v22[5])
  {
    objc_msgSend(WeakRetained, "sessionItems", v13, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v22[5]);

  }
  _Block_object_dispose(&v21, 8);

}

void __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_105(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9;
  id v10;
  char isKindOfClass;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id obj;
  void *v28;
  void *v29;
  _QWORD block[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v29 = 0;
  if (!v10 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D8], "metadataFromDictionary:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF3D8]), "initWithDictionary:", v25);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    objc_msgSend(MEMORY[0x1E0DBF3B0], "documentsForDictionary:", v9);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      v15 = *MEMORY[0x1E0DBF4A0];
      v16 = *MEMORY[0x1E0DBF498];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v18, "TPSSafeDictionaryForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "TPSSafeDictionaryForKey:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF3A8]), "initWithDictionary:metadata:", v19, v28);
          objc_msgSend(v20, "TPSSafeDictionaryForKey:", CFSTR("preconditions"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setPreconditions:", v22);

          objc_msgSend(v29, "addObject:", v21);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    v10 = 0;
    v9 = v26;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "syncQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_1EA1DF8B8;
  v24 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 40);
  block[5] = v24;
  dispatch_async(v23, block);

}

void __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_116(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_117(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_119(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_120(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sessionItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3_121(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v5
    && (v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)) != 0
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v7 = *(unsigned __int8 *)(a1 + 88);
    v8 = *(unsigned __int8 *)(a1 + 89);
    v9 = *(unsigned __int8 *)(a1 + 90);
    v10 = *(_BYTE *)(a1 + 91);
    v11 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4_122;
    v13[3] = &unk_1EA1DF9F8;
    v15 = *(id *)(a1 + 48);
    v16 = v3;
    v14 = *(id *)(a1 + 40);
    LOBYTE(v12) = v10;
    objc_msgSend(WeakRetained, "contentWithMetaDictionary:documents:isRemote:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:completionHandler:", v5, v6, 1, v7, v8, v9, v12, v11, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    objc_msgSend(*(id *)(a1 + 40), "endTransaction");
  }

}

uint64_t __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4_122(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "endTransaction");
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_134;
  v9[3] = &unk_1EA1DFB10;
  v11 = *(_OWORD *)(a1 + 56);
  v10 = v3;
  v8 = v3;
  objc_msgSend(WeakRetained, "processTipsDeliveryInfo:deliveryInfoMap:targetingCache:completionHandler:", v5, v6, v7, v9);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_134(_QWORD *a1, void *a2, void *a3)
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
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_138(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22[2];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_139;
  v16[3] = &unk_1EA1DFB60;
  v16[1] = 3221225472;
  objc_copyWeak(v22, (id *)(a1 + 160));
  v10 = *(_OWORD *)(a1 + 128);
  v19 = *(_OWORD *)(a1 + 112);
  v20 = v10;
  v21 = *(_OWORD *)(a1 + 144);
  v17 = *(id *)(a1 + 48);
  v11 = v3;
  v18 = v11;
  objc_msgSend(v9, "finalEligibleContentWithCollections:collectionsMap:collectionDeliveryInfoMap:eligibleTipIdentifiers:eligibleContextualTipIdentifiers:allFullTipsMap:allMiniTipsMap:tipDeliveryInfoMap:deliveryInfoMap:completionHandler:", v15, v14, v13, v12, v5, v6, v7, v8, v4, v16);

  objc_destroyWeak(v22);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_139(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id WeakRetained;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v13;
  v21 = v13;

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v14;
  v24 = v14;

  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v15;
  v27 = v15;

  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v16;
  v30 = v16;

  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v17;
  v33 = v17;

  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v35 = *(void **)(v34 + 40);
  *(_QWORD *)(v34 + 40) = v18;
  v36 = v18;

  objc_msgSend(WeakRetained, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allKeys");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithArray:", v39);
  objc_msgSend(v37, "tipsManager:eligibilityCompletedWithTipIdentifiers:contextualTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:", WeakRetained, v40, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_144(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tipsManager:contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:", WeakRetained, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));

  v4[2](v4, 0);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_147(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  id v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_148;
  v9[3] = &unk_1EA1DFBD8;
  v7 = *(_OWORD *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 48);
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 80);
  v9[4] = WeakRetained;
  v10 = v3;
  v8 = v3;
  objc_msgSend(WeakRetained, "processClientConditions:targetingCache:completionHandler:", v5, v6, v9);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_148(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v20 = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1DAC2F000, v8, OS_LOG_TYPE_DEFAULT, "Matched client conditions: %@", (uint8_t *)&v20, 0xCu);
  }

  v10 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateDocumentContent:withClientConditions:checklistCompletedConditions:usingDictionary:", v11, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[10] + 8) + 40), "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateDocumentContent:withClientConditions:checklistCompletedConditions:usingDictionary:", v16, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v7, *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40));
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(a1[9] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  (*(void (**)(void))(a1[5] + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_151(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = objc_msgSend(*(id *)(a1 + 32), "isHardwareWelcome");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(WeakRetained, "widgetController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = (void *)objc_msgSend(v7, "copy");
  v11 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_153;
  v13[3] = &unk_1EA1DFC28;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v8, "updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:", v9, v10, v11, v5, v13);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_153(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "widget");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1DAC2F000, v10, OS_LOG_TYPE_DEFAULT, "Widget found: %@ with light assets %@, dark assets %@", (uint8_t *)&v13, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("TPSWidgetUpdateDate"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "notificationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_159;
  v10[3] = &unk_1EA1DFC78;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v5, "updateNotificationRegistrationEventsWithCollectionDeliveryIdentifierMap:tipsDeliveryIdentifierMap:deliveryInfoMap:completionHandler:", v7, v8, v6, v10);

}

uint64_t __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_159(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_163(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id WeakRetained;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(WeakRetained, "notificationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v9 = *(_QWORD *)(a1 + 104);
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_164;
  v17[3] = &unk_1EA1DFCC8;
  v18 = v3;
  v19 = v9;
  v14 = v3;
  objc_msgSend(v5, "updateDocumentToNotifyWithPreferredIdentifiers:collectionOrder:collectionMap:collectionDeliveryIdentifierMap:tipMap:tipsDeliveryIdentifierMap:deliveryInfoMap:documentDictionaryMap:metadataDictionary:completionHandler:", v11, v15, v6, v7, v8, v10, v12, v4, v13, v17);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_164(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5_168(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6;
  v6[3] = &unk_1EA1DFD18;
  v7 = v3;
  v5 = v3;
  +[TPSDeviceProfileExporter updateDeviceProfileWithDataSource:completionHandler:](TPSDeviceProfileExporter, "updateDeviceProfileWithDataSource:completionHandler:", v4, v6);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DAC2F000, v6, OS_LOG_TYPE_INFO, "Device profile updated successfully.", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_173(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_175;
  v8[3] = &unk_1EA1DFD18;
  v9 = v3;
  v7 = v3;
  +[TPSTipKitContentManager updateContentWithMeta:documents:clientConditions:completionHandler:](TPSTipKitContentManager, "updateContentWithMeta:documents:clientConditions:completionHandler:", v4, v5, v6, v8);

}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_175(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "default");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_175_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DAC2F000, v6, OS_LOG_TYPE_INFO, "TipKit content ingested successfully.", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_178()
{
  return +[TPSTipsManager resetTipKitContentProcessingFlag](TPSTipsManager, "resetTipKitContentProcessingFlag");
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_180(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = a2;
  +[TPSUserGuideManager userGuides](TPSUserGuideManager, "userGuides");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6[2](v6, 0);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_184(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v2 = objc_alloc_init(MEMORY[0x1E0DBF358]);
  objc_msgSend(WeakRetained, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLanguage:", v4);

  objc_msgSend(WeakRetained, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssetSizes:", v6);

  objc_msgSend(v2, "setOrderedCollectionIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v2, "setCollectionMap:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(v2, "setTipMap:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(WeakRetained, "featureCollectionFromCollectionMap:collectionOrder:tipMap:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFeaturedCollection:", v7);

  objc_msgSend(v2, "setUserGuides:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(WeakRetained, "collectionSectionMapWithCollections:availableCollectionSections:collectionIdToCollectionLabelMap:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCollectionSectionMap:", v8);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  objc_msgSend(v2, "featuredCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "collectionSectionsWithEligibleCollectionSections:collectionSectionMap:featuredCollection:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCollectionSections:", v11);

  objc_msgSend(v2, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLastFetchedLanguage:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_196_cold_1(a1, v4);

  objc_msgSend(*(id *)(a1 + 40), "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 40), "joinType");
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_197;
  v15[3] = &unk_1EA1DFF18;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(a1 + 64);
  v16 = v9;
  v17 = v10;
  v21 = *(_BYTE *)(a1 + 80);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 72);
  v19 = v3;
  v20 = v13;
  v18 = v12;
  v14 = v3;
  +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v5, v6, v9, v8, 0, v15);

}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_197(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_197_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "tipStatusController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePreconditionMatchedForIdentifier:value:", *(_QWORD *)(a1 + 32), a2);

  if (*(_BYTE *)(a1 + 72) && (_DWORD)a2)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((_DWORD)a2)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "syncQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_202;
    v11[3] = &unk_1EA1DFEF0;
    v13 = *(_QWORD *)(a1 + 64);
    v12 = *(id *)(a1 + 32);
    dispatch_async(v10, v11);

  }
LABEL_9:
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v5, v8, v9);

}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_202(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_206(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_207(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  TPSDeliveryPrecondition *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TPSDeliveryPrecondition initWithDictionary:]([TPSDeliveryPrecondition alloc], "initWithDictionary:", v3);
  if (-[TPSDeliveryPrecondition statusType](v4, "statusType") != 1)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);

}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_209(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_209_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0 || a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 56), "statusType") == 1)
      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_210(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__1;
  v28[4] = __Block_byref_object_dispose__1;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__1;
  v26[4] = __Block_byref_object_dispose__1;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__1;
  v24[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0DBF3F0], "transactionWithName:", CFSTR("com.apple.TipsDaemon.reindexAllSearchableItems"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DBF318]);
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke;
  v22[3] = &unk_1EA1E0148;
  objc_copyWeak(&v23, &location);
  v22[4] = v28;
  v22[5] = v26;
  v7 = (void *)objc_msgSend(v5, "initWithAsyncBlock:", v22);
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_216;
  v21[3] = &unk_1EA1E0198;
  v21[4] = v26;
  v21[5] = v28;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF318]), "initWithAsyncBlock:", v21);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_220;
  v20[3] = &unk_1EA1E0198;
  v20[4] = v26;
  v20[5] = v28;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF318]), "initWithAsyncBlock:", v20);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v10, "setName:", CFSTR("com.apple.TipsDaemon.reindexAllSearchableItems"));
  objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v10, "setSuspended:", 1);
  objc_msgSend(v10, "addOperation:", v7);
  objc_msgSend(v8, "setName:", CFSTR("reindexTipsOperation"));
  objc_msgSend(v10, "addOperation:", v8);
  objc_msgSend(v9, "setName:", CFSTR("reindexUserGuideOperation"));
  objc_msgSend(v10, "addOperation:", v9);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_226;
  v14[3] = &unk_1EA1E01C0;
  v11 = v4;
  v17 = v11;
  v18 = v26;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  v19 = v24;
  objc_msgSend(v10, "addBarrierBlock:", v14);
  objc_msgSend(v10, "setSuspended:", 0);

  objc_destroyWeak(&v23);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  objc_destroyWeak(&location);
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1EA1E0120;
  v8 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(WeakRetained, "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 0, 0, 1, 0, 0, 0, 0, v6);

}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "indexing");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;
  v13 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_216(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
  else
  {
    +[TPSSearchItemIndexer default](TPSSearchItemIndexer, "default");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "tipMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_218;
    v8[3] = &unk_1EA1E0170;
    v9 = v4;
    objc_msgSend(v5, "reindexTips:qualityOfService:completionHandler:", v7, 9, v8);

  }
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_218(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "indexing");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_218_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DAC2F000, v5, OS_LOG_TYPE_INFO, "Tips re-indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
  else
  {
    +[TPSSearchItemIndexer default](TPSSearchItemIndexer, "default");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "userGuides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_221;
    v7[3] = &unk_1EA1E0170;
    v8 = v4;
    objc_msgSend(v5, "reindexUserGuides:qualityOfService:completionHandler:", v6, 9, v7);

  }
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_221(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "indexing");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_221_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DAC2F000, v5, OS_LOG_TYPE_INFO, "User Guide re-indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_226(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v2)
    {
      v3 = v2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        objc_msgSend(*(id *)(a1 + 40), "error");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v16 = 0;
LABEL_9:
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_10;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);

    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if ((_DWORD)v7)
    {
      objc_msgSend(v3, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0CB3300];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3300]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Failed to re-index all searchable items."), v6);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v3, "code"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSTipsManager"), 8, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
LABEL_10:
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = a4;
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSTipsManager"), 7, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[TPSSearchItemIndexer default](TPSSearchItemIndexer, "default");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__TPSTipsManager_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1EA1E0170;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteAllItemsWithQualityOfService:completionHandler:", 9, v6);

}

uint64_t __64__TPSTipsManager_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isHardwareWelcome
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userType") == 0;

  return v3;
}

- (id)welcomeCollectionFromContentPackage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionIdentifierForCurrentUserType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "collectionMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v3, "collectionMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DBF348], "softwareWelcomeCollectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)welcomeDocumentFromContentPackage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  TPSWelcomeDocument *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[5];
  _QWORD block[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  -[TPSTipsManager syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke;
  block[3] = &unk_1EA1DF510;
  block[4] = &v26;
  dispatch_sync(v5, block);

  if (v4 || (v7 = (void *)v27[5]) == 0)
  {
    -[TPSTipsManager welcomeCollectionFromContentPackage:](self, "welcomeCollectionFromContentPackage:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "notification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(MEMORY[0x1E0DBF3E8]);
      objc_msgSend(v13, "setTitle:", v23);
      objc_msgSend(v13, "setText:", v12);
      v14 = objc_alloc_init(TPSWelcomeDocument);
      v15 = (void *)v27[5];
      v27[5] = (uint64_t)v14;

      objc_msgSend(v10, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v27[5], "setIdentifier:", v16);

      objc_msgSend((id)v27[5], "setNotification:", v13);
      -[TPSTipsManager metadata](self, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "language");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v27[5], "setLanguage:", v18);

      objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "majorVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v27[5], "setMajorVersion:", v20);

      -[TPSTipsManager syncQueue](self, "syncQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      v24[0] = v6;
      v24[1] = 3221225472;
      v24[2] = __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke_2;
      v24[3] = &unk_1EA1DF510;
      v24[4] = &v26;
      dispatch_async(v21, v24);

      v8 = (id)v27[5];
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = v7;
  }
  _Block_object_dispose(&v26, 8);

  return v8;
}

void __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClass:forKey:", objc_opt_class(), CFSTR("TPSWelcomeDocumentCache"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("TPSWelcomeDocumentCache"));
}

- (BOOL)shouldPerformWidgetUpdate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  char v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TPSWidgetUpdateDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DBF3A0], "requestInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "doubleValue");
      v7 = v6;
    }
    else
    {
      v7 = 86400.0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isTimeToDate:withinTimeInterval:", v3, v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)widgetController:(id)a3 validForDocument:(id)a4 documentDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSTipsManager tipStatusController](self, "tipStatusController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isTipAppDisplayEligibleForIdentifier:", v12);

    if ((v14 & 1) != 0)
    {
      LOBYTE(v15) = 1;
    }
    else
    {
      -[TPSTipsManager notificationController](self, "notificationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "preconditionValidForIdentifier:documentDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:ignoreSuppressContent:", v12, v10, v11, 0, 1);

      -[TPSTipsManager notificationController](self, "notificationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "canUpdateHintEligibilityForIdentifier:", v12);

      if (v18)
      {
        v19 = v9;
        -[TPSTipsManager notificationController](self, "notificationController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateHintEligibleForTip:isValid:", v19, v15);

      }
    }

  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (NSString)lastFetchedLanguage
{
  NSString *v3;

  os_unfair_lock_lock(&_sharedLock);
  v3 = self->_lastFetchedLanguage;
  os_unfair_lock_unlock(&_sharedLock);
  return v3;
}

- (void)setLastFetchedLanguage:(id)a3
{
  NSString *v4;
  NSString *lastFetchedLanguage;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&_sharedLock);
  lastFetchedLanguage = self->_lastFetchedLanguage;
  self->_lastFetchedLanguage = v4;

  os_unfair_lock_unlock(&_sharedLock);
}

- (NSDictionary)cachedUserGuideMap
{
  NSDictionary *v3;

  os_unfair_lock_lock(&_sharedLock);
  v3 = self->_cachedUserGuideMap;
  os_unfair_lock_unlock(&_sharedLock);
  return v3;
}

- (void)setCachedUserGuideMap:(id)a3
{
  NSDictionary *v4;
  NSDictionary *cachedUserGuideMap;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&_sharedLock);
  cachedUserGuideMap = self->_cachedUserGuideMap;
  self->_cachedUserGuideMap = v4;

  os_unfair_lock_unlock(&_sharedLock);
}

- (void)clearCachedUserGuides
{
  -[TPSTipsManager setCachedUserGuideMap:](self, "setCachedUserGuideMap:", 0);
}

- (id)processUserGuidesFromContentPackage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v3, "userGuides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v7);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = v3;
    objc_msgSend(v3, "tipMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "linkedDocument");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "product");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length"))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              v21 = objc_alloc(MEMORY[0x1E0DBF418]);
              objc_msgSend(v18, "productVersion");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "platform");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)objc_msgSend(v21, "initWithIdentifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:", v19, v22, 0, &stru_1EA1E3770, v23, 0, MEMORY[0x1E0C9AA60]);

              objc_msgSend(v24, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v25);

            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v4, "count"))
      v26 = (void *)objc_msgSend(v4, "copy");
    else
      v26 = 0;
    v3 = v28;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)contextualTipsInactive
{
  return self->_contextualTipsInactive;
}

- (void)setContextualTipsInactive:(BOOL)a3
{
  self->_contextualTipsInactive = a3;
}

- (void)setExperiment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRulesVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
  objc_storeStrong((id *)&self->_notificationController, a3);
}

- (void)setTipStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_tipStatusController, a3);
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void)setSessionItems:(id)a3
{
  objc_storeStrong((id *)&self->_sessionItems, a3);
}

- (NSArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

- (NSArray)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
  objc_storeStrong((id *)&self->_tips, a3);
}

- (NSDictionary)collectionsMap
{
  return self->_collectionsMap;
}

- (void)setCollectionsMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsMap, a3);
}

- (NSDictionary)tipsMap
{
  return self->_tipsMap;
}

- (void)setTipsMap:(id)a3
{
  objc_storeStrong((id *)&self->_tipsMap, a3);
}

- (void)setWidgetController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetController, 0);
  objc_storeStrong((id *)&self->_tipsMap, 0);
  objc_storeStrong((id *)&self->_collectionsMap, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sessionItems, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_rulesVersion, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastFetchedLanguage, 0);
  objc_storeStrong((id *)&self->_cachedUserGuideMap, 0);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, v0, v1, "Failed to update device profile with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_175_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, v0, v1, "Failed to ingest TipKit content with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, v0, v1, "Preconditions matched for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, a3, "tip %@ is marked as invalid due to holdout camp", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, a3, "Preconditions for contextual tip %@ is not ready for display, pending eligibility check", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_196_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Evaluating preconditions for %@: %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_4();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_197_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DAC2F000, v0, v1, "Tip (%@) is %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)processClientConditions:(void *)a1 targetingCache:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, v3, "Client Conditions Count: %ld", v4);
  OUTLINED_FUNCTION_8();
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, a3, "Evaluating client condition: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_209_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DAC2F000, v0, v1, "Client condition (%@) is %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:(NSObject *)a2 tipMap:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, v4, "Update featured collection to %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)featureCollectionFromCollectionMap:(os_log_t)log collectionOrder:tipMap:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DAC2F000, log, OS_LOG_TYPE_DEBUG, "All collections has been featured, randomly select a featured collection.", v1, 2u);
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:(NSObject *)a2 tipMap:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, v4, "Keeping previous featured collection %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:tipMap:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_1DAC2F000, v2, v3, "Current featured collection %@ has been fully read: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:tipMap:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_1DAC2F000, v2, v3, "Current featured collection %@ has been displayed for more than 7 days: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, v0, v1, "Content fetch completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_218_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, v0, v1, "Tips re-indexing completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_221_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, v0, v1, "User Guide re-indexing completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
