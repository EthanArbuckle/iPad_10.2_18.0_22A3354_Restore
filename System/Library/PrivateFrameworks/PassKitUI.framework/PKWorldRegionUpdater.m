@implementation PKWorldRegionUpdater

- (PKWorldRegionUpdater)initWithSearchService:(id)a3
{
  id v5;
  PKWorldRegionUpdater *v6;
  PKWorldRegionUpdater *v7;
  NSMutableArray *v8;
  NSMutableArray *regionsToGeocode;
  NSMutableSet *v10;
  NSMutableSet *regionsFailedToGeocode;
  NSMutableSet *v12;
  NSMutableSet *regionIdentifiersToGeocode;
  uint64_t v14;
  NSHashTable *observers;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v20;
  OS_dispatch_queue *replyQueue;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKWorldRegionUpdater;
  v6 = -[PKWorldRegionUpdater init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchService, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    regionsToGeocode = v7->_regionsToGeocode;
    v7->_regionsToGeocode = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    regionsFailedToGeocode = v7->_regionsFailedToGeocode;
    v7->_regionsFailedToGeocode = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    regionIdentifiersToGeocode = v7->_regionIdentifiersToGeocode;
    v7->_regionIdentifiersToGeocode = v12;

    v7->_lockObservers._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = dispatch_queue_create("com.apple.passkit.worldregionupdater.work", v17);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_create("com.apple.passkit.worldregionupdater.reply", v17);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v20;

  }
  return v7;
}

- (void)updateCoordinatesForWorldRegionIfNeeded:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PKWorldRegionUpdater *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKWorldRegionUpdater_updateCoordinatesForWorldRegionIfNeeded___block_invoke;
  v7[3] = &unk_1E3E61388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __64__PKWorldRegionUpdater_updateCoordinatesForWorldRegionIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  CLLocationCoordinate2D v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "displayRegion");
    if (!CLLocationCoordinate2DIsValid(v6))
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

      if ((v3 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:") & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v5);
        }
        objc_msgSend(*(id *)(a1 + 40), "_beginReverseGeocodingIfPossible");

      }
    }
  }
}

- (void)_beginReverseGeocodingIfPossible
{
  PKWorldRegion **p_currentRegionToGeocode;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PKWorldRegionUpdater *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_currentRegionToGeocode = &self->_currentRegionToGeocode;
  if (!self->_currentRegionToGeocode)
  {
    -[NSMutableArray firstObject](self->_regionsToGeocode, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)p_currentRegionToGeocode, v5);
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Updating region %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v8 = objc_alloc(MEMORY[0x1E0CC1808]);
      objc_msgSend(v5, "searchString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithNaturalLanguageQuery:", v9);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v10);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke;
      v14[3] = &unk_1E3E75D98;
      objc_copyWeak(&v18, (id *)buf);
      v12 = v6;
      v15 = v12;
      v13 = v5;
      v16 = v13;
      v17 = self;
      objc_msgSend(v11, "startWithCompletionHandler:", v14);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);

    }
  }
}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  dispatch_time_t v31;
  uint64_t v32;
  NSObject *v33;
  _QWORD block[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(v5, "mapItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v11 = &unk_19DF14000;
    if (v9)
    {
      objc_msgSend(v5, "boundingRegion");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = (void *)WeakRetained[1];
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "localizedName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v9, "_muid");
      v24 = objc_msgSend(v9, "_resultProviderID");
      v38[0] = v10;
      v38[1] = 3221225472;
      v38[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2;
      v38[3] = &unk_1E3E75D70;
      v38[4] = WeakRetained;
      v25 = v21;
      v11 = (_QWORD *)&unk_19DF14000;
      objc_msgSend(v20, "updateRegionWithIdentifier:localizedName:boundingRegion:mapsIdentifier:providerIdentifier:completion:", v25, v22, v23, v24, v38, v13, v15, v17, v19);
      v26 = 0.1;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v40 = v28;
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "Failed to get response for %@, error: %@", buf, 0x16u);
      }

      v26 = 10.0;
      if (objc_msgSend(v6, "_mapkit_underlyingGEOError") != -3)
      {
        v29 = (void *)WeakRetained[5];
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v30);

        v26 = 0.1;
      }
      v36[0] = v10;
      v36[1] = 3221225472;
      v36[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_23;
      v36[3] = &unk_1E3E75D48;
      v36[4] = WeakRetained;
      v37 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_accessObserversWithHandler:", v36);
      v22 = v37;
    }

    v31 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(NSObject **)(v32 + 72);
    block[0] = v10;
    block[1] = v11[249];
    block[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2_26;
    block[3] = &unk_1E3E61388;
    block[4] = v32;
    v35 = *(id *)(a1 + 32);
    dispatch_after(v31, v33, block);

  }
}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Updated region %@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_18;
  v7[3] = &unk_1E3E75D48;
  v7[4] = v5;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "_accessObserversWithHandler:", v7);

}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "worldRegionUpdated:updatedRegion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "worldRegionUpdated:failedToUpdateRegion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2_26(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_beginReverseGeocodingIfPossible");
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lockObservers;
  id v5;

  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lockObservers;
  id v5;

  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_lockObservers);
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
    v8[2] = __52__PKWorldRegionUpdater__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E3E61850;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __52__PKWorldRegionUpdater__accessObserversWithHandler___block_invoke(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentRegionToGeocode, 0);
  objc_storeStrong((id *)&self->_regionsFailedToGeocode, 0);
  objc_storeStrong((id *)&self->_regionIdentifiersToGeocode, 0);
  objc_storeStrong((id *)&self->_regionsToGeocode, 0);
  objc_storeStrong((id *)&self->_searchService, 0);
}

@end
