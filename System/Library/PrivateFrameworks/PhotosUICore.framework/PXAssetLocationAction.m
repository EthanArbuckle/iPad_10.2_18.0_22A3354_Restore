@implementation PXAssetLocationAction

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "canPerformEditOperation:", 3, a4);
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetLocationAction.m"), 42, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetLocationAction locationForAsset:shifted:]", v9);

  abort();
}

- (void)_loadOriginalLocationsIfNeeded
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  PXPlaceAnnotation *v11;
  void *v12;
  void *v13;
  PXPlaceAnnotation *v14;
  PXAnnotatedLocation *v15;
  void *v16;
  PXAnnotatedLocation *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *originalLocations;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_originalLocations)
  {
    -[PXAssetsAction assets](self, "assets");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "location");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v9, "fetchPropertySetsIfNeeded");
            v11 = [PXPlaceAnnotation alloc];
            objc_msgSend(v9, "photosInfoPanelLocationProperties");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "placeAnnotationData");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[PXPlaceAnnotation initWithData:](v11, "initWithData:", v13);

            v15 = [PXAnnotatedLocation alloc];
            objc_msgSend(v9, "location");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[PXAnnotatedLocation initWithLocation:placeAnnotation:](v15, "initWithLocation:placeAnnotation:", v16, v14);

            objc_msgSend(v9, "localIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v17, v18);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    v19 = (NSDictionary *)objc_msgSend(v3, "copy");
    originalLocations = self->_originalLocations;
    self->_originalLocations = v19;

  }
}

- (id)_undoLocationForAsset:(id)a3
{
  NSDictionary *originalLocations;
  void *v4;
  void *v5;
  void *v6;

  originalLocations = self->_originalLocations;
  objc_msgSend(a3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](originalLocations, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_requestRevGeocoding
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsAction assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_requestRevGeocoding_onceToken != -1)
    dispatch_once(&_requestRevGeocoding_onceToken, &__block_literal_global_18634);
  v5 = _requestRevGeocoding_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PXAssetLocationAction__requestRevGeocoding__block_invoke_2;
  v8[3] = &unk_1E5148D08;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  dispatch_async(v5, v8);

}

- (void)_sendAnalyticsEvent
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[PXAssetLocationAction analyticsActionString](self, "analyticsActionString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1E5149688;
  v6 = v5;

  -[PXAssetsAction assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = CFSTR("n");
  if (v8 == 1)
    v9 = CFSTR("1");
  v10 = v9;

  -[PXAssetLocationAction analyticsPlaceLevelString](self, "analyticsPlaceLevelString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E5149688;
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0D09910];
  v17[0] = CFSTR("action");
  v17[1] = CFSTR("count");
  v18[0] = v6;
  v18[1] = v10;
  v17[2] = CFSTR("placeLevel");
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.places.locationAction"), v16);

}

- (void)_performChangesWithLocationProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PXAssetLocationAction onUnitChange](self, "onUnitChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke;
  v14[3] = &unk_1E513DE18;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5148348;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v14, v12);

}

- (void)performAction:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[PXAssetLocationAction _loadOriginalLocationsIfNeeded](self, "_loadOriginalLocationsIfNeeded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PXAssetLocationAction_performAction___block_invoke;
  v5[3] = &unk_1E5119258;
  v5[4] = self;
  -[PXAssetLocationAction _performChangesWithLocationProvider:completionHandler:](self, "_performChangesWithLocationProvider:completionHandler:", v5, v4);

}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PXAssetLocationAction_performUndo___block_invoke;
  v3[3] = &unk_1E5119258;
  v3[4] = self;
  -[PXAssetLocationAction _performChangesWithLocationProvider:completionHandler:](self, "_performChangesWithLocationProvider:completionHandler:", v3, a3);
}

- (id)onUnitChange
{
  return self->_onUnitChange;
}

- (void)setOnUnitChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)analyticsActionString
{
  return self->_analyticsActionString;
}

- (NSString)analyticsPlaceLevelString
{
  return self->_analyticsPlaceLevelString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPlaceLevelString, 0);
  objc_storeStrong((id *)&self->_analyticsActionString, 0);
  objc_storeStrong(&self->_onUnitChange, 0);
  objc_storeStrong((id *)&self->_originalLocations, 0);
}

uint64_t __37__PXAssetLocationAction_performUndo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_undoLocationForAsset:", a2);
}

uint64_t __39__PXAssetLocationAction_performAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "locationForAsset:shifted:", a2, a3);
}

void __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocation:", v8);
        v10 = *(_QWORD *)(a1 + 48);
        if (v10)
          (*(void (**)(void))(v10 + 16))();

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_requestRevGeocoding");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __45__PXAssetLocationAction__requestRevGeocoding__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PXMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v3, "requestAssetRevGeocodingForAssetLocalIdentifiers:withError:", v2, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v9 = v2;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Cannot request new revgeo data for assets %@: %@", buf, 0x16u);
    }

  }
}

uint64_t __45__PXAssetLocationAction__requestRevGeocoding__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __45__PXAssetLocationAction__requestRevGeocoding__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.IPXAssetLocationAction.revGeoQueue", v2);
  v1 = (void *)_requestRevGeocoding_queue;
  _requestRevGeocoding_queue = (uint64_t)v0;

}

@end
