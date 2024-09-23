@implementation PKMobileAssetManager

+ (PKMobileAssetManager)sharedInstance
{
  if (_MergedGlobals_290 != -1)
    dispatch_once(&_MergedGlobals_290, &__block_literal_global_225);
  return (PKMobileAssetManager *)(id)qword_1ECF22CC0;
}

void __38__PKMobileAssetManager_sharedInstance__block_invoke()
{
  PKMobileAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKMobileAssetManager);
  v1 = (void *)qword_1ECF22CC0;
  qword_1ECF22CC0 = (uint64_t)v0;

}

- (PKMobileAssetManager)init
{
  PKMobileAssetManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *cachedStringsBundles;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKMobileAssetManager;
  v2 = -[PKMobileAssetManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.passkitcore.mobileasset.fetch", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
    v6 = objc_opt_new();
    cachedStringsBundles = v2->_cachedStringsBundles;
    v2->_cachedStringsBundles = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (void)fetchMarketNotificationAssetsForIdentifier:(id)a3 isDiscretionary:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  if (v5)
    v9 = 120;
  else
    v9 = 30;
  -[PKMobileAssetManager _queryForMarketNotificationIdentifier:](self, "_queryForMarketNotificationIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager sortDescriptorsForMarkets](self, "sortDescriptorsForMarkets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PKMobileAssetManager_fetchMarketNotificationAssetsForIdentifier_isDiscretionary_completionHandler___block_invoke;
  v13[3] = &unk_1E2AC9CC0;
  v14 = v8;
  v12 = v8;
  -[PKMobileAssetManager _retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:](self, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v10, 2, v5, v11, v9, 7, v13);

}

void __101__PKMobileAssetManager_fetchMarketNotificationAssetsForIdentifier_isDiscretionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (!v8 || v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      objc_msgSend(v8, "bundleURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

    }
  }

}

- (void)fetchCityStationProviderAssetForBaseProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[PKMobileAssetManager _queryForCityCodeStationProvider:](self, "_queryForCityCodeStationProvider:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager sortDescriptorsForLatestContentVersion](self, "sortDescriptorsForLatestContentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PKMobileAssetManager_fetchCityStationProviderAssetForBaseProvider_completionHandler___block_invoke;
  v10[3] = &unk_1E2AC9CC0;
  v11 = v6;
  v9 = v6;
  -[PKMobileAssetManager _retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:](self, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v7, 2, 0, v8, 120, 1, v10);

}

void __87__PKMobileAssetManager_fetchCityStationProviderAssetForBaseProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (!v8 || v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("BaseProvider"), CFSTR("plist"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (void)stationCodeDataForStationCodeProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[PKMobileAssetManager _queryForStationCodeData:](self, "_queryForStationCodeData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager sortDescriptorsForLatestContentVersion](self, "sortDescriptorsForLatestContentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKMobileAssetManager_stationCodeDataForStationCodeProvider_completionHandler___block_invoke;
  v10[3] = &unk_1E2AC9CC0;
  v11 = v6;
  v9 = v6;
  -[PKMobileAssetManager _retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:](self, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v7, 1, 0, v8, 120, 7, v10);

}

void __80__PKMobileAssetManager_stationCodeDataForStationCodeProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (!v8 || v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      objc_msgSend(v8, "bundleURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (void)fetchRPIdentifierMappingDiscretionary:(BOOL)a3 localOnly:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, void *, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(void *, void *, _QWORD);
  _QWORD aBlock[4];
  id v19;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke;
  aBlock[3] = &unk_1E2AC9CC0;
  v10 = v8;
  v19 = v10;
  v11 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  -[PKMobileAssetManager _compatibleVersionsWithMinimumVersion:maximumVersion:](self, "_compatibleVersionsWithMinimumVersion:maximumVersion:", 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v13, "returnTypes:", 2);
  objc_msgSend(v13, "addKeyValuePair:with:", CFSTR("Feature"), CFSTR("RPIdentifierMapping"));
  objc_msgSend(v13, "addKeyValueArray:with:", *MEMORY[0x1E0D4DEE0], v12);
  if (v5)
  {
    -[PKMobileAssetManager _cachedAssetWithQuery:](self, "_cachedAssetWithQuery:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14, 0);
  }
  else
  {
    -[PKMobileAssetManager sortDescriptorsForLatestContentVersion](self, "sortDescriptorsForLatestContentVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke_2;
    v16[3] = &unk_1E2AC9CC0;
    v17 = v11;
    -[PKMobileAssetManager _retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:](self, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v13, 1, v6, v15, 120, 7, v16);

    v14 = v17;
  }

}

void __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("RPIdentifierMapping"), CFSTR("json"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

  }
}

uint64_t __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sortDescriptorsForMarkets
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("attributes"), 1, &__block_literal_global_240_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __49__PKMobileAssetManager_sortDescriptorsForMarkets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = *MEMORY[0x1E0D4DEE8];
  v5 = a3;
  objc_msgSend(a2, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  if (v7 > v9)
    return -1;
  else
    return v7 < v9;
}

- (id)cachedDynamicAssetWithIdentifier:(id)a3 parameters:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithDictionary:", v7);

  -[PKMobileAssetManager cachedDynamicAssetsIndex](self, "cachedDynamicAssetsIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mappedAssetIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forKey:", v11, CFSTR("Identifier"));
  -[PKMobileAssetManager _queryForDynamicAssetsWithParameters:](self, "_queryForDynamicAssetsWithParameters:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager _cachedAssetWithQuery:](self, "_cachedAssetWithQuery:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)dynamicAssetWithIdentifier:(id)a3 parameters:(id)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  -[PKMobileAssetManager dynamicAssetWithIdentifier:mappedIdentifierPrefix:parameters:timeout:completion:](self, "dynamicAssetWithIdentifier:mappedIdentifierPrefix:parameters:timeout:completion:", a3, 0, a4, a5, a6);
}

- (void)dynamicAssetWithIdentifier:(id)a3 mappedIdentifierPrefix:(id)a4 parameters:(id)a5 timeout:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  PKMobileAssetManager *v30;
  id v31;
  uint64_t *v32;
  unint64_t v33;
  _QWORD handler[4];
  id v35;
  id v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  dispatch_source_t v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__84;
  v43 = __Block_byref_object_dispose__84;
  v44 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v16 = v40[5];
  v17 = dispatch_time(0, 1000000000 * a6);
  dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  v18 = MEMORY[0x1E0C809B0];
  v19 = v40[5];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke;
  handler[3] = &unk_1E2ADD318;
  v37 = &v39;
  v20 = v15;
  v36 = v20;
  v21 = v12;
  v35 = v21;
  v38 = a6;
  dispatch_source_set_event_handler(v19, handler);
  dispatch_resume((dispatch_object_t)v40[5]);
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_243;
  v26[3] = &unk_1E2ADD390;
  v32 = &v39;
  v22 = v14;
  v27 = v22;
  v23 = v21;
  v28 = v23;
  v24 = v13;
  v29 = v24;
  v30 = self;
  v33 = a6;
  v25 = v20;
  v31 = v25;
  -[PKMobileAssetManager dynamicAssetsIndex:](self, "dynamicAssetsIndex:", v26);

  _Block_object_dispose(&v39, 8);
}

void __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 4, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  PKLogFacilityTypeGetObject(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[7];
    v8 = 138412546;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error: fetching dynamic asset with identifier %@ timed out after %lu seconds", (uint8_t *)&v8, 0x16u);
  }

}

void __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  _QWORD v19[5];
  __int128 v20;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "mappedAssetIdentifier:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v9 = *(void **)(a1 + 40);
    v10 = v9;

    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      objc_msgSend(v11, "stringByAppendingString:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v12;
    }
    -[NSObject setValue:forKey:](v7, "setValue:forKey:", v10, CFSTR("Identifier"));
    objc_msgSend(*(id *)(a1 + 56), "_queryForDynamicAssetsWithParameters:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 56);
    objc_msgSend(v14, "sortDescriptorsForLatestContentVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 80);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_244;
    v19[3] = &unk_1E2ADD368;
    v19[4] = *(_QWORD *)(a1 + 56);
    v18 = *(_OWORD *)(a1 + 64);
    v17 = (id)v18;
    v20 = v18;
    objc_msgSend(v14, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v13, 1, 0, v15, v16, 7, v19);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Skipping asset query because asset index timed out", buf, 2u);
    }
  }

}

void __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_244(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_2;
  block[3] = &unk_1E2ADD340;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (result)
  {
    dispatch_source_cancel((dispatch_source_t)result);
    result = a1[6];
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)cachedDynamicAssetsIndex
{
  os_unfair_lock_s *p_lock;
  PKDynamicAssetIndex *v4;
  PKDynamicAssetIndex *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_dynamicAssetsIndex;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v11 = CFSTR("Type");
    v12[0] = CFSTR("Index");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMobileAssetManager _queryForDynamicAssetsWithParameters:](self, "_queryForDynamicAssetsWithParameters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKMobileAssetManager _cachedAssetWithQuery:](self, "_cachedAssetWithQuery:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("Index"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKDynamicAssetIndex initWithContentsOfURL:]([PKDynamicAssetIndex alloc], "initWithContentsOfURL:", v9);

  }
  return v5;
}

- (void)dynamicAssetsIndex:(id)a3
{
  void (**v4)(id, PKDynamicAssetIndex *, _QWORD);
  void *v5;
  void *v6;
  PKDynamicAssetIndex *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, PKDynamicAssetIndex *, _QWORD);
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, PKDynamicAssetIndex *, _QWORD))a3;
  v11 = CFSTR("Type");
  v12[0] = CFSTR("Index");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager _queryForDynamicAssetsWithParameters:](self, "_queryForDynamicAssetsWithParameters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  v7 = self->_dynamicAssetsIndex;
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    if (v4)
      v4[2](v4, v7, 0);
  }
  else
  {
    -[PKMobileAssetManager sortDescriptorsForLatestContentVersion](self, "sortDescriptorsForLatestContentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__PKMobileAssetManager_dynamicAssetsIndex___block_invoke;
    v9[3] = &unk_1E2AC16F8;
    v9[4] = self;
    v10 = v4;
    -[PKMobileAssetManager _retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:](self, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v6, 1, 0, v8, 30, 7, v9);

  }
}

void __43__PKMobileAssetManager_dynamicAssetsIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  PKDynamicAssetIndex *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10 || v5)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }
  else
  {
    objc_msgSend(v10, "URLForResource:withExtension:", CFSTR("Index"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKDynamicAssetIndex initWithContentsOfURL:]([PKDynamicAssetIndex alloc], "initWithContentsOfURL:", v6);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, PKDynamicAssetIndex *, _QWORD))(v8 + 16))(v8, v7, 0);

  }
}

- (id)cachedStringsBundleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedStringsBundles, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    -[PKMobileAssetManager _queryForStringsBundleWithIdentifier:](self, "_queryForStringsBundleWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMobileAssetManager _cachedAssetWithQuery:](self, "_cachedAssetWithQuery:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedStringsBundles, "setObject:forKeyedSubscript:", v5, v4);
    os_unfair_lock_unlock(&self->_lock);

  }
  return v5;
}

- (void)stringsBundleWithIdentifier:(id)a3 timeout:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  -[PKMobileAssetManager _queryForStringsBundleWithIdentifier:](self, "_queryForStringsBundleWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager sortDescriptorsForLatestContentVersion](self, "sortDescriptorsForLatestContentVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__PKMobileAssetManager_stringsBundleWithIdentifier_timeout_completion___block_invoke;
  v14[3] = &unk_1E2ADD3B8;
  v15 = v8;
  v16 = v9;
  v14[4] = self;
  v12 = v8;
  v13 = v9;
  -[PKMobileAssetManager _retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:](self, "_retrieveAssetWithQuery:maxCompatibleVersion:isDiscretionary:sortDescriptors:timeout:catalogExpirationDays:completion:", v10, 1, 0, v11, a4, 7, v14);

}

void __71__PKMobileAssetManager_stringsBundleWithIdentifier_timeout_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = a1[6];
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
    objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", v9, a1[5]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
    v8 = a1[6];
    if (v8)
    {
      v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_6;
    }
  }

}

- (void)_downloadAllPrefetchableAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke;
  v6[3] = &unk_1E2ABDCE8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKMobileAssetManager _downloadAssetCatalogIfExpired:completion:](self, "_downloadAssetCatalogIfExpired:completion:", 0, v6);

}

void __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint8_t buf[16];

  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Continuing prefetch with expired catalog", buf, 2u);
    }

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v4, "returnTypes:", 2);
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("Prefetch"), CFSTR("YES"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_250;
  v8[3] = &unk_1E2ABE8F0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v7 = v4;
  objc_msgSend(v7, "queryMetaData:", v8);

}

void __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_250(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v5;
  NSObject *v6;
  PKAsyncUnaryOperationComposer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = a2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Failed to query prefetch assets result %lu", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Found %lu prefetchable assets in Mobile Assets", buf, 0xCu);
    }

    v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v3);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v18[0] = v9;
          v18[1] = 3221225472;
          v18[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_252;
          v18[3] = &unk_1E2AC8040;
          v18[4] = *(_QWORD *)(a1 + 40);
          v18[5] = v13;
          -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v18);
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_256;
    v16[3] = &unk_1E2AC9F08;
    v17 = *(id *)(a1 + 48);
    v15 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v7, "evaluateWithInput:completion:", v14, v16);

  }
}

void __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_252(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_2;
  v12[3] = &unk_1E2ADD3E0;
  v13 = v6;
  v14 = v7;
  v12[4] = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "_downloadAsset:isDiscretionary:timeout:completion:", v8, 1, 120, v12);

}

uint64_t __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_2(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2 > 0x1D || ((1 << a2) & 0x2000C001) == 0)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2048;
      v10 = a2;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Unable to prefetch asset %@: %lu", (uint8_t *)&v7, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)schedulePrefetchDynamicAssetsWithInterval:(double)a3 queue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PDScheduledActivityGetCriteria(CFSTR("PKMobileAssetManager"), CFSTR("PrefetchDynamicAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "repeatInterval");
    v10 = v9;
    PKLogFacilityTypeGetObject(0xAuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 == a3)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v22 = a3;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Skipping scheduling prefetch. Activity already exists with interval %f.", buf, 0xCu);
      }
      goto LABEL_15;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      v22 = a3;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Removing prefetch activity with interval %f.", buf, 0xCu);
    }

    PDScheduledActivityRemove(CFSTR("PKMobileAssetManager"), CFSTR("PrefetchDynamicAssets"));
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
  v11 = objc_claimAutoreleasedReturnValue();
  +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:](PDScheduledActivityCriteria, "priorityActivityCriteriaWithStartDate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRequireNetworkConnectivity:", 1);
  objc_msgSend(v13, "setRequireScreenSleep:", 1);
  objc_msgSend(v13, "setRequireMainsPower:", 1);
  objc_msgSend(v13, "setRepeating:", 1);
  v14 = 86400.0;
  if (a3 > 0.0)
    v14 = a3;
  objc_msgSend(v13, "setRepeatInterval:", v14);
  objc_msgSend(v13, "setReason:", CFSTR("Prefetch provisioning assets"));
  PKLogFacilityTypeGetObject(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = *(double *)&v16;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Scheduling prefetch mobile assets: %@", buf, 0xCu);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PKMobileAssetManager_schedulePrefetchDynamicAssetsWithInterval_queue___block_invoke;
  v19[3] = &unk_1E2ABE0D0;
  v19[4] = self;
  v17 = v6;
  v20 = v17;
  if (schedulePrefetchDynamicAssetsWithInterval_queue__onceToken == -1)
  {
    v18 = v17;
  }
  else
  {
    dispatch_once(&schedulePrefetchDynamicAssetsWithInterval_queue__onceToken, v19);
    v18 = v20;
  }
  _PDScheduledActivityRegister(CFSTR("PKMobileAssetManager"), CFSTR("PrefetchDynamicAssets"), v13, 0);

LABEL_15:
}

void __72__PKMobileAssetManager_schedulePrefetchDynamicAssetsWithInterval_queue___block_invoke(uint64_t a1)
{
  PDScheduledActivityClientRegister(CFSTR("PKMobileAssetManager"), *(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == CFSTR("PrefetchDynamicAssets")
    || v8
    && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("PrefetchDynamicAssets")),
        v9,
        v10))
  {
    -[PKMobileAssetManager prefetchDynamicAssets:](self, "prefetchDynamicAssets:", &__block_literal_global_263);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Unknown scheduled activity: %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

void __80__PKMobileAssetManager_performScheduledActivityWithIdentifier_activityCriteria___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject(0xAuLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FC92000, v0, OS_LOG_TYPE_DEFAULT, "Finished prefetch", v1, 2u);
  }

}

- (id)_queryForMarketNotificationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKMobileAssetManager _compatibleVersionsWithMinimumVersion:maximumVersion:](self, "_compatibleVersionsWithMinimumVersion:maximumVersion:", 2, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v6, "returnTypes:", 2);
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Market"), v4);

  objc_msgSend(v6, "addKeyValueArray:with:", *MEMORY[0x1E0D4DEE0], v5);
  return v6;
}

- (id)_queryForCityCodeStationProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKMobileAssetManager _compatibleVersionsWithMinimumVersion:maximumVersion:](self, "_compatibleVersionsWithMinimumVersion:maximumVersion:", 2, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v6, "returnTypes:", 2);
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("CityStationProvider"), v4);

  objc_msgSend(v6, "addKeyValueArray:with:", *MEMORY[0x1E0D4DEE0], v5);
  return v6;
}

- (id)_queryForStationCodeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKMobileAssetManager _compatibleVersionsWithMinimumVersion:maximumVersion:](self, "_compatibleVersionsWithMinimumVersion:maximumVersion:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v6, "returnTypes:", 2);
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("StationCodeDataKey"), v4);

  objc_msgSend(v6, "addKeyValueArray:with:", *MEMORY[0x1E0D4DEE0], v5);
  return v6;
}

- (id)_queryForDynamicAssetsWithParameters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v4, "returnTypes:", 2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addKeyValuePair:with:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("Feature"), CFSTR("DynamicAssets"));
  return v4;
}

- (id)_queryForStringsBundleWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D4E050];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  objc_msgSend(v5, "returnTypes:", 2);
  objc_msgSend(v5, "addKeyValuePair:with:", CFSTR("Identifier"), v4);

  objc_msgSend(v5, "addKeyValuePair:with:", CFSTR("Feature"), CFSTR("Strings"));
  return v5;
}

- (id)sortDescriptorsForLatestContentVersion
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("attributes"), 1, &__block_literal_global_264);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__PKMobileAssetManager_sortDescriptorsForLatestContentVersion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = *MEMORY[0x1E0D4DEE8];
  v5 = a3;
  objc_msgSend(a2, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  if (v7 > v9)
    return -1;
  else
    return v7 < v9;
}

- (id)_compatibleVersionsWithMinimumVersion:(unint64_t)a3 maximumVersion:(unint64_t)a4
{
  id i;
  void *v7;

  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); a3 <= a4; ++a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v7);

  }
  return i;
}

- (id)_cachedAssetWithQuery:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "queryMetaDataSync");
  if (v5)
  {
    v6 = v5;
    PKLogFacilityTypeGetObject(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Query failed with result %lu", (uint8_t *)&v16, 0xCu);
    }

  }
  -[PKMobileAssetManager sortDescriptorsForLatestContentVersion](self, "sortDescriptorsForLatestContentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "getLocalFileUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "pk_arrayByRemovingObject:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMobileAssetManager _purgeAssets:](self, "_purgeAssets:", v13);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_retrieveAssetWithQuery:(id)a3 maxCompatibleVersion:(unint64_t)a4 isDiscretionary:(BOOL)a5 sortDescriptors:(id)a6 timeout:(unint64_t)a7 catalogExpirationDays:(unint64_t)a8 completion:(id)a9
{
  id v13;
  PKAsyncUnaryOperationComposer *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD handler[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  dispatch_source_t v43;
  _QWORD v44[8];
  BOOL v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[7];
  _QWORD v49[4];
  id v50;
  PKMobileAssetManager *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[6];
  _QWORD v60[5];
  id v61;

  v13 = a3;
  v26 = a6;
  v28 = a9;
  v14 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__84;
  v60[4] = __Block_byref_object_dispose__84;
  v61 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke;
  v59[3] = &unk_1E2ADD448;
  v59[4] = self;
  v59[5] = a8;
  -[PKAsyncUnaryOperationComposer addOperation:](v14, "addOperation:", v59);
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__84;
  v57[4] = __Block_byref_object_dispose__84;
  v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__84;
  v55[4] = __Block_byref_object_dispose__84;
  v56 = 0;
  v49[0] = v15;
  v49[1] = 3221225472;
  v49[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_270;
  v49[3] = &unk_1E2ADD498;
  v16 = v13;
  v50 = v16;
  v51 = self;
  v52 = v60;
  v53 = v57;
  v54 = v55;
  -[PKAsyncUnaryOperationComposer addOperation:](v14, "addOperation:", v49);
  v48[0] = v15;
  v48[1] = 3221225472;
  v48[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_272;
  v48[3] = &unk_1E2ABEAC0;
  v48[4] = self;
  v48[5] = v57;
  v48[6] = v55;
  -[PKAsyncUnaryOperationComposer addOperation:](v14, "addOperation:", v48);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__84;
  v46[4] = __Block_byref_object_dispose__84;
  v47 = 0;
  v44[0] = v15;
  v44[1] = 3221225472;
  v44[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_273;
  v44[3] = &unk_1E2ADD4E8;
  v44[4] = self;
  v44[5] = v55;
  v45 = a5;
  v44[6] = v60;
  v44[7] = v46;
  -[PKAsyncUnaryOperationComposer addOperation:](v14, "addOperation:", v44);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAsyncUnaryOperationComposer evaluatorWithInput:](v14, "evaluatorWithInput:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__84;
  v42 = __Block_byref_object_dispose__84;
  v43 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v19 = v39[5];
  v20 = dispatch_time(0, 1000000000 * a7);
  dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  v21 = v39[5];
  handler[0] = v15;
  handler[1] = 3221225472;
  handler[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_274;
  handler[3] = &unk_1E2ADD510;
  v37 = &v38;
  v22 = v18;
  v35 = v22;
  v23 = v28;
  v36 = v23;
  dispatch_source_set_event_handler(v21, handler);
  dispatch_resume((dispatch_object_t)v39[5]);
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_275;
  v29[3] = &unk_1E2ADD538;
  v31 = &v38;
  v24 = v23;
  v30 = v24;
  v32 = v46;
  v33 = v60;
  v25 = (id)objc_msgSend(v22, "evaluateWithCompletion:", v29);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(v60, 8);
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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

  v6 = a3;
  v7 = a4;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2;
  v12[3] = &unk_1E2ABDDB0;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "_downloadAssetCatalogIfExpired:completion:", v8, v12);

}

uint64_t __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Continuing with expired catalog", v5, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_270(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  __int128 v20;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_271;
  v14[3] = &unk_1E2ADD470;
  v9 = *(_QWORD *)(a1 + 48);
  v18 = v7;
  v19 = v9;
  v15 = v6;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 40);
  v16 = v10;
  v17 = v11;
  v20 = *(_OWORD *)(a1 + 56);
  v12 = v6;
  v13 = v7;
  objc_msgSend(v10, "queryMetaData:", v14);

}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_271(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a2;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Query failed with result %lu", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "queryParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v18;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Asset not present in catalog: %@", buf, 0xCu);

    }
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 48), "sortDescriptorsForLatestContentVersion");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v19);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "firstObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_272(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, id, _QWORD);
  void *v9;
  id v10;

  v5 = (void *)a1[4];
  v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v8 = a4;
  v10 = a3;
  objc_msgSend(v6, "pk_arrayByRemovingObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_purgeAssets:", v9);

  v8[2](v8, v10, 0);
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_273(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int8x16_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int8x16_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(unsigned __int8 *)(a1 + 64);
  v14[0] = MEMORY[0x1E0C809B0];
  v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v14[1] = 3221225472;
  v14[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_3;
  v14[3] = &unk_1E2ADD4C0;
  v15 = v6;
  v16 = v7;
  v17 = v10;
  v18 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "_downloadAsset:isDiscretionary:timeout:completion:", v11, v9, 30, v14);

}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_3(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 <= 0x1D && ((1 << a2) & 0x2000C001) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "getLocalFileUrl");
    v4 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1[8] + 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1[6] + 8);
    }
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a2;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Unable to download asset: %lu", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_274(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 4, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  PKLogFacilityTypeGetObject(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Failed to download mobile asset", v6, 2u);
  }

}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_275(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = *(NSObject **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = a1[4];
    if (v8)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  }

}

- (void)_purgeAssets:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "state");
        if (v10 <= 6 && ((1 << v10) & 0x4C) != 0)
        {
          v12[0] = v7;
          v12[1] = 3221225472;
          v12[2] = __37__PKMobileAssetManager__purgeAssets___block_invoke;
          v12[3] = &unk_1E2AC88D0;
          v12[4] = v9;
          objc_msgSend(v9, "purge:", v12);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

void __37__PKMobileAssetManager__purgeAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2048;
    v9 = a2;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Purged asset (%@) with result: %lu", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_downloadAssetCatalogIfExpired:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"));
  if (objc_msgSend(v7, "isCatalogFetchedWithinThePastFewDays:", a3)
    && !PKMobileAssetEagerCatalogFetching())
  {
    if (v6)
      v6[2](v6, 1);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D4E038];
    -[PKMobileAssetManager _downloadOptionsWithTimeout:isDiscretionary:](self, "_downloadOptionsWithTimeout:isDiscretionary:", 20, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PKMobileAssetManager__downloadAssetCatalogIfExpired_completion___block_invoke;
    v10[3] = &unk_1E2ADD560;
    v11 = v6;
    objc_msgSend(v8, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.WalletMobileAssets"), v9, v10);

  }
}

uint64_t __66__PKMobileAssetManager__downloadAssetCatalogIfExpired_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t result;
  uint64_t (*v7)(void);
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v8 = 134217984;
      v9 = a2;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch asset catalog: %li", (uint8_t *)&v8, 0xCu);
    }

    result = *(_QWORD *)(a1 + 32);
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Fetched asset catalog successfully", (uint8_t *)&v8, 2u);
    }

    result = *(_QWORD *)(a1 + 32);
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (void)_downloadAsset:(id)a3 isDiscretionary:(BOOL)a4 timeout:(int64_t)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  NSObject *v20;
  void (**v21)(id, uint64_t);
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(id, uint64_t);
  __int128 *v27;
  _QWORD handler[4];
  void (**v29)(id, uint64_t);
  __int128 *p_buf;
  uint8_t v31[4];
  const __CFString *v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  dispatch_source_t v37;
  uint64_t v38;

  v8 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, uint64_t))a6;
  v12 = objc_msgSend(v10, "state");
  if (objc_msgSend(v10, "wasLocal"))
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Asset is already on device with an asset state (%ld)", (uint8_t *)&buf, 0xCu);
    }

    if (v11)
    {
      v14 = 14;
      if (v12 == 6)
        v14 = 29;
      if (v12 == 5)
        v15 = 15;
      else
        v15 = v14;
      v11[2](v11, v15);
    }
  }
  else
  {
    if (v12 == 4)
    {
      PKLogFacilityTypeGetObject(0xAuLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Asset is already downloading", (uint8_t *)&buf, 2u);
      }

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__84;
    v36 = __Block_byref_object_dispose__84;
    v37 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v17 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
    v18 = dispatch_time(0, 1000000000 * a5);
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v19 = MEMORY[0x1E0C809B0];
    v20 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke;
    handler[3] = &unk_1E2AC1AF0;
    p_buf = &buf;
    v21 = v11;
    v29 = v21;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(*(dispatch_object_t *)(*((_QWORD *)&buf + 1) + 40));
    PKLogFacilityTypeGetObject(0xAuLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("NO");
      if (v8)
        v23 = CFSTR("YES");
      *(_DWORD *)v31 = 138412290;
      v32 = v23;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Beginning download of asset, isDiscretionary: %@", v31, 0xCu);
    }

    -[PKMobileAssetManager _downloadOptionsWithTimeout:isDiscretionary:](self, "_downloadOptionsWithTimeout:isDiscretionary:", a5, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_280;
    v25[3] = &unk_1E2ADD5B0;
    v25[4] = self;
    v27 = &buf;
    v26 = v21;
    objc_msgSend(v10, "startDownload:then:", v24, v25);

    _Block_object_dispose(&buf, 8);
  }

}

void __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  PKLogFacilityTypeGetObject(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to download mobile asset", v5, 2u);
  }

}

void __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_280(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_2;
  block[3] = &unk_1E2ADD588;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v8 = a2;
  dispatch_async(v3, block);

}

NSObject *__74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_2(uint64_t a1)
{
  NSObject *result;

  result = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (id)_downloadOptionsWithTimeout:(int64_t)a3 isDiscretionary:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  objc_msgSend(v6, "setAllowsCellularAccess:", 1);
  objc_msgSend(v6, "setDiscretionary:", v4);
  objc_msgSend(v6, "setCanUseLocalCacheServer:", 1);
  if (a3 >= 1)
    objc_msgSend(v6, "setTimeoutIntervalForResource:", a3);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringsBundles, 0);
  objc_storeStrong((id *)&self->_dynamicAssetsIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
