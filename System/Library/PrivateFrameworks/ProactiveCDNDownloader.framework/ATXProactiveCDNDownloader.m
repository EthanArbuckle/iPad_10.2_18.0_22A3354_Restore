@implementation ATXProactiveCDNDownloader

- (ATXProactiveCDNDownloader)init
{
  void *v3;
  void *v4;
  ATXProactiveCDNDownloader *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXProactiveCDNDownloader initWithTileLoader:tileDataReader:](self, "initWithTileLoader:tileDataReader:", v3, v4);

  return v5;
}

- (ATXProactiveCDNDownloader)initWithTileLoader:(id)a3 tileDataReader:(id)a4
{
  id v7;
  id v8;
  ATXProactiveCDNDownloader *v9;
  objc_class *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *clQueue;
  NSObject *v19;
  _QWORD block[4];
  ATXProactiveCDNDownloader *v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ATXProactiveCDNDownloader;
  v9 = -[ATXProactiveCDNDownloader init](&v23, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_tileLoader, a3);
    objc_storeStrong((id *)&v9->_tileDataReader, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("_clCallbackQueue", v16);
    clQueue = v9->_clQueue;
    v9->_clQueue = (OS_dispatch_queue *)v17;

    v19 = v9->_clQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__ATXProactiveCDNDownloader_initWithTileLoader_tileDataReader___block_invoke;
    block[3] = &unk_24D223B40;
    v22 = v9;
    dispatch_sync(v19, block);

  }
  return v9;
}

void __63__ATXProactiveCDNDownloader_initWithTileLoader_tileDataReader___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA88]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/PrivateFrameworks/CoreParsec.framework"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (void)heroDatasForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ATXProactiveCDNDownloader queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ATXProactiveCDNDownloader_heroDatasForLocation_completion___block_invoke;
  block[3] = &unk_24D223B68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __61__ATXProactiveCDNDownloader_heroDatasForLocation_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_heroDatasForLocation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)highConfidenceHeroDatasForCurrentLocationWithCompletion:(id)a3
{
  id v4;
  NSObject *clQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke;
  v7[3] = &unk_24D223C70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clQueue, v7);

}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2;
  v5[3] = &unk_24D223C48;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "_fetchPlaceInferencesWithFidelityPolicy:handler:", 0, v5);

}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (*v26)(void);
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      __atxlog_handle_hero();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2147E2000, v27, OS_LOG_TYPE_DEFAULT, "No place inference while getting high quality app clip predictions: No inference returned from CLLocationManager", buf, 2u);
      }

      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_5;
    }
    objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_hero();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        objc_msgSend(v16, "preferredName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "confidence");
        *(_DWORD *)buf = 138412546;
        v37 = v19;
        v38 = 2048;
        v39 = v20;
        _os_log_impl(&dword_2147E2000, v17, OS_LOG_TYPE_DEFAULT, "Best place Point of Interest name: %@. Confidence score: %f", buf, 0x16u);

      }
      objc_msgSend(v16, "confidence");
      if (v21 >= 0.5)
      {
        objc_msgSend(v16, "placemark");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copy");

        objc_msgSend(v23, "_geoMapItemHandle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) || !objc_msgSend(v24, "isEqualToData:"))
          {
            v28 = (void *)objc_opt_new();
            v33[0] = MEMORY[0x24BDAC760];
            v33[1] = 3221225472;
            v33[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_22;
            v33[3] = &unk_24D223C20;
            v29 = *(id *)(a1 + 40);
            v30 = *(_QWORD *)(a1 + 32);
            v35 = v29;
            v33[4] = v30;
            v34 = v25;
            objc_msgSend(v28, "resolveMapItemFromHandle:completionHandler:", v34, v33);

LABEL_27:
            goto LABEL_28;
          }
          v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        }
        else
        {
          __atxlog_handle_hero();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "preferredName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v37 = v32;
            _os_log_impl(&dword_2147E2000, v31, OS_LOG_TYPE_DEFAULT, "No place inference while getting high quality app clip predictions: No GEOMapItem data available for best place point of interest with name: %@", buf, 0xCu);

          }
          v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        }
        v26();
        goto LABEL_27;
      }
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2147E2000, v17, OS_LOG_TYPE_DEFAULT, "No best place inference while getting high quality app clip predictions: No point of interest identified in place inference", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_28:

    goto LABEL_29;
  }
  __atxlog_handle_hero();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_5:
  v14();
LABEL_29:

}

BOOL __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "placeType") == 1;
}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_hero();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v5, "_quickLinks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v5, "_quickLinks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v22, "type") == 2)
            {
              objc_msgSend(v22, "URLString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v19);
      }

    }
    if (objc_msgSend(v5, "_hasMUID"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "_muid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v25 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_25;
    v40[3] = &unk_24D223BD0;
    v40[4] = *(_QWORD *)(a1 + 32);
    v26 = v24;
    v41 = v26;
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_poiCategory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = objc_alloc(MEMORY[0x24BE4CC50]);
      v30 = (void *)objc_msgSend(v29, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:", *MEMORY[0x24BE4CC88], *MEMORY[0x24BE4CC90], *MEMORY[0x24BE4CC70], *MEMORY[0x24BE4CC78], *MEMORY[0x24BE4CC60], 0, *MEMORY[0x24BE4CC68], *MEMORY[0x24BE4CC68], (double)(unint64_t)*MEMORY[0x24BE4CC80], 0, v28, 0);
      objc_msgSend(v27, "arrayByAddingObject:", v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v31;
    }
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(a1 + 40);
    v34 = *(NSObject **)(v32 + 16);
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_28;
    block[3] = &unk_24D223BF8;
    block[4] = v32;
    v37 = v33;
    v38 = v27;
    v39 = *(id *)(a1 + 48);
    v35 = v27;
    dispatch_async(v34, block);

  }
}

id __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x24BE4CC50];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *MEMORY[0x24BE4CC88];
  v7 = *MEMORY[0x24BE4CC90];
  v8 = *MEMORY[0x24BE4CC68];
  v9 = *MEMORY[0x24BE4CC70];
  v10 = *MEMORY[0x24BE4CC78];
  v11 = *MEMORY[0x24BE4CC60];
  v12 = (double)(unint64_t)*MEMORY[0x24BE4CC80];
  objc_msgSend(*(id *)(a1 + 32), "sha256HashForText:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v5, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:", v6, v7, v9, v10, v11, v13, v8, v8, v12, 0, 0, *(_QWORD *)(a1 + 40));
  return v14;
}

uint64_t __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_28(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_heroDatasForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  -[ATXProactiveCDNDownloader queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc(MEMORY[0x24BE7A610]);
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(v9, "initWithGuardedData:", v10);

  objc_initWeak(&location, self);
  -[ATXProactiveCDNDownloader tileLoader](self, "tileLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke;
  v20[3] = &unk_24D223CE8;
  v14 = v7;
  v23 = v14;
  objc_copyWeak(&v24, &location);
  v15 = v6;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  objc_msgSend(v12, "requestGEOTileDataForLocation:tileDataHandler:", v15, v20);

  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_4;
  v18[3] = &unk_24D223D10;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v16, "runWithLockAcquired:", v18);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "tileDataReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appAndClipEntryForTileData:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_2;
    v15[3] = &unk_24D223C98;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_3;
    v13[3] = &unk_24D223CC0;
    v14 = v9;
    v11 = v9;
    objc_msgSend(v10, "runWithLockAcquired:", v13);

  }
}

uint64_t __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "heroDataForLocation:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

void __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_hero();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ATXProactiveCDNDownloader _heroDatasForLocation:completion:]_block_invoke_4";
    v9 = 2048;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2147E2000, v4, OS_LOG_TYPE_DEFAULT, "%s Sending %lu predictions back from GEOTileLoader for location", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

- (id)sha256HashForText:(id)a3
{
  const char *v3;
  CC_LONG v4;
  void *v5;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);
  return v5;
}

- (ATXGEOTileLoaderProtocol)tileLoader
{
  return self->_tileLoader;
}

- (ATXGEOTileDataReaderProtocol)tileDataReader
{
  return self->_tileDataReader;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tileDataReader, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_previousPreciseHeroDatas, 0);
  objc_storeStrong((id *)&self->_previousItemHandle, 0);
  objc_storeStrong((id *)&self->_clQueue, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2147E2000, a2, a3, "Error while pulling high quality predictions from GeoMapService: %@", a5, a6, a7, a8, 2u);
}

@end
