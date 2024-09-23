@implementation VGChargingNetworkAvailabilityProvider

- (VGChargingNetworkAvailabilityProvider)initWithDelegate:(id)a3
{
  id v4;
  VGChargingNetworkAvailabilityProvider *v5;
  VGChargingNetworkAvailabilityProvider *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *delegateQueue;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VGChargingNetworkAvailabilityProvider;
  v5 = -[VGChargingNetworkAvailabilityProvider init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("VGChargingNetworkAvailabilityProvider.WorkQueue", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("VGChargingNetworkAvailabilityProvider.DelegateQueue", v10);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__localeChanged_, *MEMORY[0x24BDBCA70], 0);

    objc_msgSend(MEMORY[0x24BE3D020], "modernManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTileGroupObserver:queue:", v6, v6->_workQueue);

    objc_initWeak(&location, v6);
    v15 = v6->_workQueue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __58__VGChargingNetworkAvailabilityProvider_initWithDelegate___block_invoke;
    v17[3] = &unk_24C2FB268;
    objc_copyWeak(&v18, &location);
    dispatch_async(v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __58__VGChargingNetworkAvailabilityProvider_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_reloadNetworks");
  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[VGChargingNetworkAvailabilityProvider initWithDelegate:]_block_invoke";
      v6 = 1024;
      v7 = 55;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE3D020], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VGChargingNetworkAvailabilityProvider;
  -[VGChargingNetworkAvailabilityProvider dealloc](&v4, sel_dealloc);
}

- (NSArray)suggestedNetworks
{
  NSObject *workQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__VGChargingNetworkAvailabilityProvider_suggestedNetworks__block_invoke;
  v5[3] = &unk_24C2FB240;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __58__VGChargingNetworkAvailabilityProvider_suggestedNetworks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)otherNetworks
{
  NSObject *workQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__VGChargingNetworkAvailabilityProvider_otherNetworks__block_invoke;
  v5[3] = &unk_24C2FB240;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __54__VGChargingNetworkAvailabilityProvider_otherNetworks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_reloadNetworks
{
  NSObject *v3;
  NSArray *suggestedNetworks;
  NSArray *otherNetworks;
  NSString *activeCountryCode;
  NSString *activeLanguageCode;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *v27;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  NSObject *delegateQueue;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD block[4];
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  NSObject *v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  VGGetChargingNetworksLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "Started reloading networks", buf, 2u);
  }

  suggestedNetworks = self->_suggestedNetworks;
  self->_suggestedNetworks = 0;

  otherNetworks = self->_otherNetworks;
  self->_otherNetworks = 0;

  activeCountryCode = self->_activeCountryCode;
  self->_activeCountryCode = 0;

  activeLanguageCode = self->_activeLanguageCode;
  self->_activeLanguageCode = 0;

  GEOConfigGetString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3D010], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataForResourceWithName:fallbackBundle:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE3D030]), "initWithData:", v10);
    v12 = v11;
    if (v11)
    {
      -[NSObject chargingNetworkInfo](v11, "chargingNetworkInfo");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v16 = MEMORY[0x24BDAC760];
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke;
        v43[3] = &unk_24C2FB610;
        v36 = v13;
        v44 = v36;
        v17 = v14;
        v45 = v17;
        v18 = v15;
        v46 = v18;
        v19 = MEMORY[0x20BD239CC](v43);
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "countryCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

        if (!-[NSObject count](v17, "count") && !objc_msgSend(v18, "count"))
        {
          VGGetChargingNetworksLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v40, "countryCode");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v48 = (uint64_t)v38;
            _os_log_impl(&dword_20A329000, v21, OS_LOG_TYPE_INFO, "Country code: %@ did not produce any networks, will fallback to using global list.", buf, 0xCu);

          }
          (*(void (**)(uint64_t, const __CFString *))(v19 + 16))(v19, CFSTR("global"));
        }
        v39 = (void *)v19;
        VGGetChargingNetworksLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = -[NSObject count](v17, "count");
          v24 = objc_msgSend(v18, "count");
          -[NSObject brandInfoMappings](v36, "brandInfoMappings");
          v37 = v18;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");
          *(_DWORD *)buf = 134218496;
          v48 = v23;
          v16 = MEMORY[0x24BDAC760];
          v49 = 2048;
          v50 = v24;
          v51 = 2048;
          v52 = v26;
          _os_log_impl(&dword_20A329000, v22, OS_LOG_TYPE_INFO, "Created %lu suggested and %lu other networks out of %lu mappings", buf, 0x20u);

          v18 = v37;
        }

        -[NSObject sortedArrayUsingComparator:](v17, "sortedArrayUsingComparator:", &__block_literal_global_4);
        v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v28 = self->_suggestedNetworks;
        self->_suggestedNetworks = v27;

        objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_17);
        v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v30 = self->_otherNetworks;
        self->_otherNetworks = v29;

        objc_msgSend(v40, "countryCode");
        v31 = (NSString *)objc_claimAutoreleasedReturnValue();
        v32 = self->_activeCountryCode;
        self->_activeCountryCode = v31;

        objc_msgSend(v40, "languageCode");
        v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        v34 = self->_activeLanguageCode;
        self->_activeLanguageCode = v33;

        objc_initWeak((id *)buf, self);
        delegateQueue = self->_delegateQueue;
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_3;
        block[3] = &unk_24C2FB268;
        objc_copyWeak(&v42, (id *)buf);
        dispatch_async(delegateQueue, block);
        objc_destroyWeak(&v42);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        VGGetChargingNetworksLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = (uint64_t)v12;
          _os_log_impl(&dword_20A329000, v17, OS_LOG_TYPE_FAULT, "There was no featuresInfo with charging networks info: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      VGGetChargingNetworksLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_FAULT, "Failed to parse charging networks pb file", buf, 2u);
      }
    }

  }
  else
  {
    VGGetChargingNetworksLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (uint64_t)v8;
      _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_FAULT, "Failed to load charging networks data with filename: %@", buf, 0xCu);
    }
  }

}

void __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  VGChargingNetwork *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = a1;
  objc_msgSend(*(id *)(a1 + 32), "brandInfoMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 138412290;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "isoCountryCodes", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "indexOfObject:", v12);

        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = -[VGChargingNetwork initWithBrandInfoMapping:]([VGChargingNetwork alloc], "initWithBrandInfoMapping:", v10);
          if (v14)
          {
            v15 = objc_msgSend(v10, "isSuggestedsCount");
            if (v15 != objc_msgSend(v10, "isoCountryCodesCount"))
            {
              VGGetChargingNetworksLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v19;
                v26 = v10;
                _os_log_impl(&dword_20A329000, v16, OS_LOG_TYPE_FAULT, "Malformed brandInfoMapping. notify the routing team: %@", buf, 0xCu);
              }

            }
            if (v13 < objc_msgSend(v10, "isSuggestedsCount") && *(_BYTE *)(objc_msgSend(v10, "isSuggesteds") + v13))
              v17 = *(void **)(v20 + 40);
            else
              v17 = *(void **)(v20 + 48);
            objc_msgSend(v17, "addObject:", v14);
          }
          else
          {
            VGGetChargingNetworksLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v10;
              _os_log_impl(&dword_20A329000, v18, OS_LOG_TYPE_ERROR, "Failed to create a network from brandInfoMapping: %{public}@", buf, 0xCu);
            }

          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

}

uint64_t __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

void __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 5);
    -[NSObject availableNetworksDidChangeForProvider:](v3, "availableNetworksDidChangeForProvider:", v2);
  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[VGChargingNetworkAvailabilityProvider _reloadNetworks]_block_invoke_3";
      v6 = 1024;
      v7 = 175;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }
  }

}

- (void)_localeChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__VGChargingNetworkAvailabilityProvider__localeChanged___block_invoke;
  v5[3] = &unk_24C2FB268;
  objc_copyWeak(&v6, &location);
  dispatch_async(workQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__VGChargingNetworkAvailabilityProvider__localeChanged___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)WeakRetained[1];
    -[NSObject countryCode](v2, "countryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    if (v5 | v6
      && (v7 = objc_msgSend((id)v5, "isEqual:", v6), (id)v6, (id)v5, (v7 & 1) == 0))
    {

    }
    else
    {
      v8 = (void *)WeakRetained[2];
      -[NSObject languageCode](v2, "languageCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      if (!(v10 | v11))
      {

LABEL_9:
        VGGetChargingNetworksLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (const char *)WeakRetained[1];
          -[NSObject countryCode](v2, "countryCode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = WeakRetained[2];
          -[NSObject languageCode](v2, "languageCode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138413058;
          v25 = v15;
          v26 = 2112;
          v27 = v16;
          v28 = 2112;
          v29 = v17;
          v30 = 2112;
          v31 = v18;
          _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_INFO, "_localeChanged:, oldCountryCode: %@, newCountryCode: %@, oldLanguageCode: %@, newLanguageCode: %@ -> will not reload networks", (uint8_t *)&v24, 0x2Au);

        }
        goto LABEL_16;
      }
      v12 = (void *)v11;
      v13 = objc_msgSend((id)v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_9;
    }
    VGGetChargingNetworksLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (const char *)WeakRetained[1];
      -[NSObject countryCode](v2, "countryCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = WeakRetained[2];
      -[NSObject languageCode](v2, "languageCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138413058;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_20A329000, v19, OS_LOG_TYPE_INFO, "_localeChanged:, oldCountryCode: %@, newCountryCode: %@, oldLanguageCode: %@, newLanguageCode: %@ -> will reload networks", (uint8_t *)&v24, 0x2Au);

    }
    objc_msgSend(WeakRetained, "_reloadNetworks");
  }
  else
  {
    VGGetVirtualGarageLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v24 = 136315394;
      v25 = "-[VGChargingNetworkAvailabilityProvider _localeChanged:]_block_invoke";
      v26 = 1024;
      LODWORD(v27) = 184;
      _os_log_impl(&dword_20A329000, v2, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v24, 0x12u);
    }
  }
LABEL_16:

}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  VGGetChargingNetworksLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "resourceManifestManagerDidChangeActiveTileGroup:, will reload networks", v5, 2u);
  }

  -[VGChargingNetworkAvailabilityProvider _reloadNetworks](self, "_reloadNetworks");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherNetworks, 0);
  objc_storeStrong((id *)&self->_suggestedNetworks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activeLanguageCode, 0);
  objc_storeStrong((id *)&self->_activeCountryCode, 0);
}

@end
