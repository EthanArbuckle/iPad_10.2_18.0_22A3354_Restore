@implementation PXImportManager

- (PXImportManager)init
{
  PXImportManager *v2;
  uint64_t v3;
  NSMapTable *progressToProvidersMapping;
  uint64_t v5;
  NSMapTable *progressToCompletionHandlerMapping;
  uint64_t v7;
  NSMapTable *progressToSharedSourcesCompletionHandlerMapping;
  uint64_t v9;
  NSMapTable *progressToErrorsMapping;
  uint64_t v11;
  NSMapTable *providersToImportedResultObjectMapping;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXImportManager;
  v2 = -[PXImportManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    progressToProvidersMapping = v2->_progressToProvidersMapping;
    v2->_progressToProvidersMapping = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    progressToCompletionHandlerMapping = v2->_progressToCompletionHandlerMapping;
    v2->_progressToCompletionHandlerMapping = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    progressToSharedSourcesCompletionHandlerMapping = v2->_progressToSharedSourcesCompletionHandlerMapping;
    v2->_progressToSharedSourcesCompletionHandlerMapping = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    progressToErrorsMapping = v2->_progressToErrorsMapping;
    v2->_progressToErrorsMapping = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    providersToImportedResultObjectMapping = v2->_providersToImportedResultObjectMapping;
    v2->_providersToImportedResultObjectMapping = (NSMapTable *)v11;

  }
  return v2;
}

- (id)importItemProviders:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  PXImportManager *val;
  id v21;
  id obj;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  val = self;
  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCancellable:", 1);
  objc_msgSend(v7, "setPausable:", 0);
  +[PXImportManager supportedTypeIdentifiers](PXImportManager, "supportedTypeIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v12 = v25;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v30 != v14)
                objc_enumerationMutation(v12);
              if (objc_msgSend(v11, "hasRepresentationConformingToTypeIdentifier:fileOptions:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), 0, val))
              {
                objc_msgSend(v24, "addObject:", v11);
                v26[0] = MEMORY[0x1E0C809B0];
                v26[1] = 3221225472;
                v26[2] = __57__PXImportManager_importItemProviders_completionHandler___block_invoke;
                v26[3] = &unk_1E51168F0;
                objc_copyWeak(&v28, &location);
                v26[4] = v11;
                v27 = v7;
                objc_msgSend(v11, "px_createAssetWithImportSessionID:completionBlock:", v23, v26);

                objc_destroyWeak(&v28);
                goto LABEL_18;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
            if (v13)
              continue;
            break;
          }
        }

        PLDragAndDropGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "No supported representation found for itemProvider: %@", buf, 0xCu);
        }

        objc_msgSend(v7, "setTotalUnitCount:", objc_msgSend(v7, "totalUnitCount") - 1);
LABEL_18:
        ;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v7, "totalUnitCount") < 1)
  {
    PLDragAndDropGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = obj;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "No supported representations found for itemProviders: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No supported representation."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v21 + 2))(v21, 0, v18, 0);

  }
  else
  {
    -[PXImportManager _addProgress:forItemProviders:assetCreationCompletionHandler:](val, "_addProgress:forItemProviders:assetCreationCompletionHandler:", v7, v24, v21);
  }
  objc_destroyWeak(&location);

  return v7;
}

- (void)_handleCompletionOfImportForItemProvider:(id)a3 resultObject:(id)a4 progress:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSMapTable *progressToErrorsMapping;
  id v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    PLDragAndDropGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 138413058;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Error importing item provider: %@ resultObject: %@ progress: %@ error: %@", (uint8_t *)&v18, 0x2Au);
    }

    progressToErrorsMapping = self->_progressToErrorsMapping;
    v16 = v13;
    v17 = v12;
  }
  else
  {
    progressToErrorsMapping = self->_providersToImportedResultObjectMapping;
    v16 = v11;
    v17 = v10;
  }
  -[NSMapTable setObject:forKey:](progressToErrorsMapping, "setObject:forKey:", v16, v17);
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);

}

- (void)_addProgress:(id)a3 forItemProviders:(id)a4 sharedSourceCompletionHandler:(id)a5
{
  NSMapTable *progressToSharedSourcesCompletionHandlerMapping;
  id v9;
  void *v10;
  id v11;

  progressToSharedSourcesCompletionHandlerMapping = self->_progressToSharedSourcesCompletionHandlerMapping;
  v9 = a4;
  v11 = a3;
  v10 = _Block_copy(a5);
  -[NSMapTable setObject:forKey:](progressToSharedSourcesCompletionHandlerMapping, "setObject:forKey:", v10, v11);

  -[PXImportManager _addProgress:forItemProviders:](self, "_addProgress:forItemProviders:", v11, v9);
}

- (void)_addProgress:(id)a3 forItemProviders:(id)a4 assetCreationCompletionHandler:(id)a5
{
  NSMapTable *progressToCompletionHandlerMapping;
  id v9;
  void *v10;
  id v11;

  progressToCompletionHandlerMapping = self->_progressToCompletionHandlerMapping;
  v9 = a4;
  v11 = a3;
  v10 = _Block_copy(a5);
  -[NSMapTable setObject:forKey:](progressToCompletionHandlerMapping, "setObject:forKey:", v10, v11);

  -[PXImportManager _addProgress:forItemProviders:](self, "_addProgress:forItemProviders:", v11, v9);
}

- (void)_addProgress:(id)a3 forItemProviders:(id)a4
{
  NSMapTable *progressToProvidersMapping;
  id v7;
  void *v8;
  void *v9;
  id v10;

  progressToProvidersMapping = self->_progressToProvidersMapping;
  v7 = a3;
  -[NSMapTable setObject:forKey:](progressToProvidersMapping, "setObject:forKey:", a4, v7);
  NSStringFromSelector(sel_completedUnitCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, v8, 4, PXProgressObserverContext);

  NSStringFromSelector(sel_isCancelled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, v9, 4, PXProgressObserverContext);

  -[PXImportManager progress](self, "progress");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v7, objc_msgSend(v7, "totalUnitCount"));

}

- (void)_removeObserverFromProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  NSStringFromSelector(sel_completedUnitCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v5, PXProgressObserverContext);

  NSStringFromSelector(sel_isCancelled);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v6, PXProgressObserverContext);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id location;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)PXProgressObserverContext == a6)
  {
    v13 = v11;
    v14 = objc_msgSend(v13, "completedUnitCount");
    if (v14 >= objc_msgSend(v13, "totalUnitCount") || objc_msgSend(v13, "isCancelled"))
    {
      -[NSMapTable objectForKey:](self->_progressToErrorsMapping, "objectForKey:", v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](self->_progressToProvidersMapping, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](self->_progressToCompletionHandlerMapping, "objectForKey:", v13);
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PXImportManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        aBlock[3] = &unk_1E5116918;
        objc_copyWeak(&v35, &location);
        v34 = v15;
        v16 = _Block_copy(aBlock);
        if (v27)
          v17 = 0;
        else
          v17 = objc_msgSend(v13, "isCancelled") ^ 1;
        (*(void (**)(uint64_t, uint64_t, void *, void *))(v25 + 16))(v25, v17, v27, v16);
        -[NSMapTable removeObjectForKey:](self->_progressToCompletionHandlerMapping, "removeObjectForKey:", v13);

        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
      }
      -[NSMapTable objectForKey:](self->_progressToSharedSourcesCompletionHandlerMapping, "objectForKey:", v13, v25);
      v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[PXImportManager _sourcesForItemProviders:](self, "_sourcesForItemProviders:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          v20 = 0;
        else
          v20 = objc_msgSend(v13, "isCancelled") ^ 1;
        ((void (**)(_QWORD, uint64_t, void *, void *))v18)[2](v18, v20, v27, v19);
        -[NSMapTable removeObjectForKey:](self->_progressToSharedSourcesCompletionHandlerMapping, "removeObjectForKey:", v13);

      }
      -[PXImportManager _removeObserverFromProgress:](self, "_removeObserverFromProgress:", v13);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = v15;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v30;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v30 != v23)
              objc_enumerationMutation(v21);
            -[NSMapTable removeObjectForKey:](self->_providersToImportedResultObjectMapping, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v22);
      }

      -[NSMapTable removeObjectForKey:](self->_progressToProvidersMapping, "removeObjectForKey:", v13);
      -[NSMapTable removeObjectForKey:](self->_progressToErrorsMapping, "removeObjectForKey:", v13);

    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)PXImportManager;
    -[PXImportManager observeValueForKeyPath:ofObject:change:context:](&v28, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)_assetsForImportedItemProviders:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        -[NSMapTable objectForKey:](self->_providersToImportedResultObjectMapping, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10), (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addObject:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalSortDescriptors:", v16);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v5, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_sourcesForItemProviders:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMapTable objectForKey:](self->_providersToImportedResultObjectMapping, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addObject:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_providersToImportedResultObjectMapping, 0);
  objc_storeStrong((id *)&self->_progressToErrorsMapping, 0);
  objc_storeStrong((id *)&self->_progressToSharedSourcesCompletionHandlerMapping, 0);
  objc_storeStrong((id *)&self->_progressToCompletionHandlerMapping, 0);
  objc_storeStrong((id *)&self->_progressToProvidersMapping, 0);
}

id __66__PXImportManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_assetsForImportedItemProviders:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __57__PXImportManager_importItemProviders_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v7 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __57__PXImportManager_importItemProviders_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleCompletionOfImportForItemProvider:resultObject:progress:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

+ (PXImportManager)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXImportManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, block);
  return (PXImportManager *)(id)defaultManager_defaultManager;
}

+ (NSArray)supportedTypes
{
  if (supportedTypes_onceToken != -1)
    dispatch_once(&supportedTypes_onceToken, &__block_literal_global_3722);
  return (NSArray *)(id)supportedTypes_supportedTypes;
}

+ (NSArray)supportedTypeIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "supportedTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __43__PXImportManager_supportedTypeIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __33__PXImportManager_supportedTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CFArrayRef v10;

  v10 = CGImageSourceCopyTypeIdentifiers();
  PXMap();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8AFC0], "exportSessionWithAsset:presetName:", v1, *MEMORY[0x1E0C89E98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedFileTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DE8];
  PFAllPlatformsLivePhotoBundleTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v4);
  objc_msgSend(v7, "addObjectsFromArray:", v0);
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)supportedTypes_supportedTypes;
  supportedTypes_supportedTypes = v8;

}

id __33__PXImportManager_supportedTypes__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC568]))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __33__PXImportManager_supportedTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
}

void __33__PXImportManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v1;

}

- (id)importDragItems:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportManager importItemProviders:completionHandler:](self, "importItemProviders:completionHandler:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)importSharedSourcesForDragItems:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSObject *v16;
  id v17;
  id v19;
  id obj;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = a4;
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v6);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCancellable:", 1);
  objc_msgSend(v24, "setPausable:", 0);
  +[PXImportManager supportedTypeIdentifiers](PXImportManager, "supportedTypeIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "itemProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = v23;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v30 != v14)
                objc_enumerationMutation(v12);
              if (objc_msgSend(v11, "hasRepresentationConformingToTypeIdentifier:fileOptions:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), 0))
              {
                objc_msgSend(v22, "addObject:", v11);
                v25[0] = MEMORY[0x1E0C809B0];
                v25[1] = 3221225472;
                v25[2] = __74__PXImportManager_iOS__importSharedSourcesForDragItems_completionHandler___block_invoke;
                v25[3] = &unk_1E5116980;
                objc_copyWeak(&v28, &location);
                v17 = v11;
                v26 = v17;
                v27 = v24;
                objc_msgSend(v17, "px_createStreamShareSourceWithCompletionBlock:", v25);

                objc_destroyWeak(&v28);
                goto LABEL_18;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
            if (v13)
              continue;
            break;
          }
        }

        PLDragAndDropGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v10;
          v40 = 2112;
          v41 = v11;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "No supported representation found for dragItem: %@ dragItem.itemProvider: %@", buf, 0x16u);
        }

        objc_msgSend(v24, "setTotalUnitCount:", objc_msgSend(v24, "totalUnitCount") - 1);
LABEL_18:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v7);
  }

  -[PXImportManager _addProgress:forItemProviders:sharedSourceCompletionHandler:](self, "_addProgress:forItemProviders:sharedSourceCompletionHandler:", v24, v22, v19);
  objc_destroyWeak(&location);

  return v24;
}

- (void)fetchAssetsFromDrop:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v43;
  void (**v44)(_QWORD, _QWORD);
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  void (**v50)(_QWORD, _QWORD);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLDragAndDropGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = _Block_copy(v8);
    *(_DWORD *)buf = 138412802;
    v57 = (uint64_t)v7;
    v58 = 2112;
    v59 = (uint64_t)v10;
    v60 = 2112;
    v61 = v11;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "_fetchAssetsFromDrop: %@ importIfNeeded: %@ completion: %@", buf, 0x20u);

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportManager.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dropSession"));

  }
  v43 = v6;
  v44 = (void (**)(_QWORD, _QWORD))v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportManager.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = v7;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v7, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  v47 = v12;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v18, "localObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_22;
        objc_msgSend(v19, "assetReference");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "asset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportManager.m"), 318, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("pxLocalObject.assetReference.asset"), v25);

LABEL_22:
          v21 = 0;
          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "px_descriptionForAssertionMessage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportManager.m"), 318, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("pxLocalObject.assetReference.asset"), v27, v28);

          v12 = v47;
        }
        if (objc_msgSend(v21, "sourceType") != 2)
        {
          objc_msgSend(v21, "objectID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v22);

          v12 = v47;
          goto LABEL_24;
        }
LABEL_23:
        objc_msgSend(v12, "addObject:", v18);
LABEL_24:

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v15);
  }

  PLDragAndDropGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = objc_msgSend(v46, "count");
    v31 = objc_msgSend(v47, "count");
    *(_DWORD *)buf = 134218240;
    v57 = v30;
    v12 = v47;
    v58 = 2048;
    v59 = v31;
    _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEBUG, "Found %ld local drag assets and %ld drag items needing import", buf, 0x16u);
  }

  if (v43 && objc_msgSend(v12, "count"))
  {
    +[PXImportManager defaultManager](PXImportManager, "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __70__PXImportManager_iOS__fetchAssetsFromDrop_importIfNeeded_completion___block_invoke;
    v48[3] = &unk_1E51169A8;
    v49 = v46;
    v50 = v44;
    v33 = (id)objc_msgSend(v32, "importDragItems:completionHandler:", v47, v48);

    v12 = v47;
  }
  else if (objc_msgSend(v46, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v46, v34, v36, 0, 0, 0);

    ((void (**)(_QWORD, void *))v44)[2](v44, v37);
    v12 = v47;
  }
  else
  {
    v44[2](v44, 0);
  }

}

void __70__PXImportManager_iOS__fetchAssetsFromDrop_importIfNeeded_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  __CFString *v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLDragAndDropGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("NO");
    if (a2)
      v10 = CFSTR("YES");
    v22 = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "Import completed: success %@ error %@", (uint8_t *)&v22, 0x16u);
  }

  if (!v8)
  {
    PLDragAndDropGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v7;
      v19 = "importDragItems failed to return importedAssets with error: %@";
      v20 = v13;
      v21 = 12;
LABEL_12:
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v22, v21);
    }
LABEL_13:
    v12 = 0;
    v18 = 0;
    goto LABEL_14;
  }
  v8[2](v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    PLDragAndDropGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      v19 = "importedAssets returned a nil result";
      v20 = v13;
      v21 = 2;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v12 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchedObjectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject addObjectsFromArray:](v13, "addObjectsFromArray:", v14);

  -[NSObject addObjectsFromArray:](v13, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v15 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v12, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v13, v16, v17, 0, 0, 0);

LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__PXImportManager_iOS__importSharedSourcesForDragItems_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleCompletionOfImportForItemProvider:resultObject:progress:error:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40), v6);

}

uint64_t __58__PXImportManager_iOS__importDragItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemProvider");
}

@end
