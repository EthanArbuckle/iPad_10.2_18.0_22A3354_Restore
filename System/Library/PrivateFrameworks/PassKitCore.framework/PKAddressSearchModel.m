@implementation PKAddressSearchModel

- (PKAddressSearchModel)init
{
  PKAddressSearchModel *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *resultsQueue;
  MKLocalSearchCompleter *v5;
  MKLocalSearchCompleter *completer;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CLLocationManager *locationManager;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKAddressSearchModel;
  v2 = -[PKAddressSearchModel init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passkit.address.search", 0);
    resultsQueue = v2->_resultsQueue;
    v2->_resultsQueue = (OS_dispatch_queue *)v3;

    v5 = (MKLocalSearchCompleter *)objc_alloc_init((Class)getMKLocalSearchCompleterClass[0]());
    completer = v2->_completer;
    v2->_completer = v5;

    -[MKLocalSearchCompleter setDelegate:](v2->_completer, "setDelegate:", v2);
    -[MKLocalSearchCompleter setEntriesType:](v2->_completer, "setEntriesType:", 0);
    v7 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    PKPassKitCoreBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundlePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithEffectiveBundlePath:delegate:onQueue:", v9, v2, MEMORY[0x1E0C80D38]);
    locationManager = v2->_locationManager;
    v2->_locationManager = (CLLocationManager *)v10;

    -[CLLocationManager setDesiredAccuracy:](v2->_locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E4F8]);
    -[CLLocationManager startUpdatingLocation](v2->_locationManager, "startUpdatingLocation");
  }
  return v2;
}

- (void)beginSearch:(id)a3
{
  id v4;
  MKLocalSearchCompleter *completer;
  void *v6;
  CNContactStore *v7;
  CNContactStore *contactStore;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;

  v4 = a3;
  completer = self->_completer;
  objc_msgSend(v4, "fragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLocalSearchCompleter setFragment:](completer, "setFragment:", v6);

  if (!self->_contactStore)
  {
    v7 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = self->_contactStore;
    self->_contactStore = v7;

  }
  v9 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend(v4, "keysToFetch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithKeysToFetch:", v10);

  objc_msgSend(v4, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKAddressSearchModel_beginSearch___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v18 = v11;
  v19 = v4;
  v14 = v4;
  v15 = v11;
  dispatch_async(v13, block);

  objc_msgSend(v14, "fragment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddressSearchModel _updateRecents:](self, "_updateRecents:", v16);

}

void __36__PKAddressSearchModel_beginSearch___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD block[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v5 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __36__PKAddressSearchModel_beginSearch___block_invoke_2;
  v15[3] = &unk_1E2ACEFF0;
  v16 = *(id *)(a1 + 48);
  v6 = v2;
  v17 = v6;
  LODWORD(v4) = objc_msgSend(v4, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v3, &v18, v15);
  v7 = v18;
  if ((_DWORD)v4)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 80);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __36__PKAddressSearchModel_beginSearch___block_invoke_3;
    block[3] = &unk_1E2ABE0D0;
    block[4] = v8;
    v14 = v6;
    dispatch_sync(v9, block);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contactsSearchUpdated:", *(_QWORD *)(a1 + 32));

    }
  }

}

void __36__PKAddressSearchModel_beginSearch___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "contactFilter");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v19))
  {
    objc_msgSend(v5, "matchedProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outputKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "matchedNameProperty") & 1) == 0)
    {
      objc_msgSend(v5, "matchedProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0C967B8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "type");

        if (v13 != 1)
        {
          if (!objc_msgSend(v10, "count"))
            goto LABEL_9;
          v17 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "outputKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "pkDeconstructContactUsingKey:substring:", v15, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObjectsFromArray:", v18);

LABEL_8:
LABEL_9:

          goto LABEL_10;
        }
      }
    }
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "outputKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pkDeconstructContactUsingKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v16);
    goto LABEL_8;
  }
LABEL_10:

}

void __36__PKAddressSearchModel_beginSearch___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (void)selectMapSearchCompletion:(id)a3
{
  id v4;
  MKLocalSearch *localSearch;
  MKLocalSearch *v6;
  void *v7;
  MKLocalSearch *v8;
  MKLocalSearch *v9;
  MKLocalSearch *v10;
  _QWORD v11[5];

  v4 = a3;
  localSearch = self->_localSearch;
  if (localSearch)
  {
    -[MKLocalSearch cancel](localSearch, "cancel");
    v6 = self->_localSearch;
    self->_localSearch = 0;

  }
  v7 = (void *)objc_msgSend(objc_alloc(_MergedGlobals_176()), "initWithCompletion:", v4);
  v8 = (MKLocalSearch *)objc_msgSend(objc_alloc((Class)off_1ECF21B70()), "initWithRequest:", v7);
  v9 = self->_localSearch;
  self->_localSearch = v8;

  v10 = self->_localSearch;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__PKAddressSearchModel_selectMapSearchCompletion___block_invoke;
  v11[3] = &unk_1E2ACF018;
  v11[4] = self;
  -[MKLocalSearch startWithCompletionHandler:](v10, "startWithCompletionHandler:", v11);

}

void __50__PKAddressSearchModel_selectMapSearchCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "mapItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v25 = v6;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "mapItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "_placeCardContact");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v16, "setGivenName:", &stru_1E2ADF4C0);
          objc_msgSend(v16, "setFamilyName:", &stru_1E2ADF4C0);
          v17 = (void *)objc_msgSend(v16, "copy");
          objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "selectedAddress:withError:", v21, 0);

    }
    v6 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectedAddress:withError:", 0, v6);

    }
  }

}

- (void)endSearch
{
  MKLocalSearch *localSearch;

  -[MKLocalSearchCompleter cancel](self->_completer, "cancel");
  -[MKLocalSearch cancel](self->_localSearch, "cancel");
  localSearch = self->_localSearch;
  self->_localSearch = 0;

}

- (NSArray)contactsSearchResults
{
  NSObject *resultsQueue;
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
  v9 = __Block_byref_object_copy__34;
  v10 = __Block_byref_object_dispose__34;
  v11 = 0;
  resultsQueue = self->_resultsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PKAddressSearchModel_contactsSearchResults__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resultsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__PKAddressSearchModel_contactsSearchResults__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSArray)completionSearchResults
{
  NSObject *resultsQueue;
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
  v9 = __Block_byref_object_copy__34;
  v10 = __Block_byref_object_dispose__34;
  v11 = 0;
  resultsQueue = self->_resultsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PKAddressSearchModel_completionSearchResults__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resultsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __47__PKAddressSearchModel_completionSearchResults__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)completerDidUpdateResults:(id)a3
{
  int v4;
  void *v5;
  NSObject *resultsQueue;
  void *v7;
  char v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v10 = a3;
  v4 = objc_msgSend(v10, "resultsAreCurrent");
  v5 = v10;
  if (v4)
  {
    resultsQueue = self->_resultsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PKAddressSearchModel_completerDidUpdateResults___block_invoke;
    block[3] = &unk_1E2ABE0D0;
    block[4] = self;
    v12 = v10;
    dispatch_sync(resultsQueue, block);
    -[PKAddressSearchModel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKAddressSearchModel delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mapSearchUpdated:", self);

    }
    v5 = v10;
  }

}

void __50__PKAddressSearchModel_completerDidUpdateResults___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "results");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_107);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

BOOL __50__PKAddressSearchModel_completerDidUpdateResults___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_type") == 2;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Obtained location for address search model", v11, 2u);
  }

  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLocalSearchCompleter setDeviceLocation:](self->_completer, "setDeviceLocation:", v9);
  objc_msgSend(v9, "horizontalAccuracy");
  if (v10 > *MEMORY[0x1E0C9E4F8])
    objc_msgSend(v6, "stopUpdatingLocation");

}

- (NSArray)recentsSearchResults
{
  return self->_recentsSearchResults;
}

- (PKAddressSearchModelDelegate)delegate
{
  return (PKAddressSearchModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (MKLocalSearchCompleter)completer
{
  return self->_completer;
}

- (void)setCompleter:(id)a3
{
  objc_storeStrong((id *)&self->_completer, a3);
}

- (CLGeocoder)geocoder
{
  return self->_geocoder;
}

- (void)setGeocoder:(id)a3
{
  objc_storeStrong((id *)&self->_geocoder, a3);
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
  objc_storeStrong((id *)&self->_localSearch, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (OS_dispatch_queue)resultsQueue
{
  return self->_resultsQueue;
}

- (void)setResultsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_completer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentsSearchResults, 0);
  objc_storeStrong((id *)&self->_completionSearchResults, 0);
  objc_storeStrong((id *)&self->_contactsSearchResults, 0);
}

@end
