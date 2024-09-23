@implementation PUPickerCoordinator

- (PUPickerCoordinator)initWithPhotoPicker:(id)a3 mediaTypes:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  PUPickerGeneratedFilter *v16;
  id v17;
  PUPickerCoordinator *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerMessagesLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = objc_alloc_init(MEMORY[0x1E0CD2168]);
  objc_msgSend(v14, "set_onboardingHeaderDismissedBefore:", objc_msgSend(v8, "onboardingHeaderDismissedBefore"));
  objc_msgSend(v14, "set_onboardingOverlayDismissedBefore:", 0);
  objc_msgSend(v14, "set_limitedLibraryHeaderDismissedBefore:", 0);
  if (v13)
    objc_msgSend(v14, "setDisabledCapabilities:", 30);
  objc_msgSend(v14, "_setDisabledPrivateCapabilities:", 4);
  if (objc_msgSend(v8, "allowsMultipleSelection"))
    v15 = objc_msgSend(v8, "multipleSelectionLimit");
  else
    v15 = 1;
  objc_msgSend(v14, "setSelectionLimit:", v15);
  objc_msgSend(v14, "_setAllowsDownscaling:", objc_msgSend(v8, "showsFileSizePicker"));
  v16 = -[PUPickerGeneratedFilter initWithUIImagePickerControllerMediaTypes:]([PUPickerGeneratedFilter alloc], "initWithUIImagePickerControllerMediaTypes:", v10);

  v17 = -[PUPickerConfiguration initForUIImagePickerControllerWithPHPickerConfiguration:connection:overriddenGeneratedFilter:]([PUPickerConfiguration alloc], "initForUIImagePickerControllerWithPHPickerConfiguration:connection:overriddenGeneratedFilter:", v14, v9, v16);
  if (v17)
  {
    v18 = -[PUPickerCoordinator initWithConfiguration:coordinatorActionHandler:loadingStatusManager:](self, "initWithConfiguration:coordinatorActionHandler:loadingStatusManager:", v17, 0, 0);
    +[PUPickerCoordinator _logPhotosPickerPresentedForClientWithConfiguration:usingOptions:](PUPickerCoordinator, "_logPhotosPickerPresentedForClientWithConfiguration:usingOptions:", v17, 0);
    objc_storeWeak((id *)&v18->_photoPicker, v8);
    if (v18->_downloadHelper)
      -[PUPhotosGridDownloadHelper setShouldTreatLivePhotosAsStills:](v18->_downloadHelper, "setShouldTreatLivePhotosAsStills:", +[PUPickerCoordinator pu_legacy_shouldDownloadVideoComplement:configuration:](PUPickerCoordinator, "pu_legacy_shouldDownloadVideoComplement:configuration:", v8, v17));
  }
  else
  {
    PLPickerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "properties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v20;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to create picker with options: %@", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(v8, "cancelPhotoPicker");
    v18 = 0;
  }

  return v18;
}

- (PUPickerCoordinator)initWithPHConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUPickerConfiguration *v12;
  PUPickerCoordinator *v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v12 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:]([PUPickerConfiguration alloc], "initWithPHPickerConfiguration:connection:", v9, 0);
  if (v12)
  {
    v13 = -[PUPickerCoordinator initWithPUConfiguration:coordinatorActionHandler:loadingStatusManager:](self, "initWithPUConfiguration:coordinatorActionHandler:loadingStatusManager:", v12, v10, v11);
  }
  else
  {
    PLPickerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Failed to create picker with configuration: %@", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (PUPickerCoordinator)initWithPUConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUPickerCoordinator *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v12 = -[PUPickerCoordinator initWithConfiguration:coordinatorActionHandler:loadingStatusManager:](self, "initWithConfiguration:coordinatorActionHandler:loadingStatusManager:", v9, v10, v11);
  +[PUPickerCoordinator _logPhotosPickerPresentedForClientWithConfiguration:usingOptions:](PUPickerCoordinator, "_logPhotosPickerPresentedForClientWithConfiguration:usingOptions:", v9, 1);

  return v12;
}

- (PUPickerCoordinator)initWithConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5
{
  id v10;
  id v11;
  PUPickerCoordinator *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PUPickerActivityProgressController *v20;
  void *v21;
  void *v22;
  int v23;
  PUPhotoPickerResizeTaskDescriptorViewModel *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  PUPickerContainerController *v28;
  PUPickerManagedViewController *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *activityIndicatorTrackingIDs;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  PUPhotosGridDownloadHelper *v40;
  PUPickerAdditionalSelectionState *v41;
  id obj;
  void *v43;
  _QWORD v44[4];
  id v45;
  objc_super v46;
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  obj = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v46.receiver = self;
  v46.super_class = (Class)PUPickerCoordinator;
  v12 = -[PUPickerCoordinator init](&v46, sel_init);
  if (v12)
  {
    if (!v11)
      v11 = objc_alloc_init(MEMORY[0x1E0D7CD28]);
    objc_msgSend(v10, "suggestedItemObjectIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v10, "preselectedItemObjectIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count") == 0;

      if (v15)
      {
        objc_msgSend(v10, "suggestedItemObjectIDs");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "preselectedItemObjectIDs");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    if (objc_msgSend(v10, "isSingleSelection") && (unint64_t)objc_msgSend(v43, "count") >= 2)
    {
      v16 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v43, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "orderedSetWithObject:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v43 = (void *)v18;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD80]), "initWithSelectedOIDs:", v43);
    +[PUPickerCoordinator _updateSelectionCoordinatorLimit:configuration:](PUPickerCoordinator, "_updateSelectionCoordinatorLimit:configuration:", v19, v10);
    v41 = -[PUPickerAdditionalSelectionState initWithConfiguration:]([PUPickerAdditionalSelectionState alloc], "initWithConfiguration:", v10);
    if (objc_msgSend(v10, "allowsDownload"))
    {
      v40 = -[PUPhotosGridDownloadHelper initWithUpdateHandler:]([PUPhotosGridDownloadHelper alloc], "initWithUpdateHandler:", v12);
      -[PUPhotosGridDownloadHelper setMode:](v40, "setMode:", objc_msgSend(v10, "isSingleSelection") ^ 1);
      v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v20 = objc_alloc_init(PUPickerActivityProgressController);
      PULocalizedString(CFSTR("PHOTO_PICKER_DOWNLOAD_PROGRESS_ALERT_TITLE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerActivityProgressController setTitle:](v20, "setTitle:", v21);

    }
    else
    {
      v39 = 0;
      v40 = 0;
      v20 = 0;
    }
    if (objc_msgSend(v10, "allowsDownscaling")
      && (-[PUPickerCoordinator configuration](v12, "configuration"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "excludesOptionsMenu"),
          v22,
          v23))
    {
      v24 = objc_alloc_init(PUPhotoPickerResizeTaskDescriptorViewModel);
    }
    else
    {
      v24 = 0;
    }
    PLPickerGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "preselectedItemObjectIDs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 134217984;
      v48 = v27;
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "Initializing root picker view with starting selection of size %ld", buf, 0xCu);

    }
    v28 = -[PUPickerContainerController initWithConfiguration:loadingStatusManager:selectionCoordinator:additionalSelectionState:resizeTaskDescriptorViewModel:actionHandler:]([PUPickerContainerController alloc], "initWithConfiguration:loadingStatusManager:selectionCoordinator:additionalSelectionState:resizeTaskDescriptorViewModel:actionHandler:", v10, v11, v19, v41, v24, v12);
    v29 = -[PUPickerManagedViewController initWithConfiguration:contentViewController:]([PUPickerManagedViewController alloc], "initWithConfiguration:contentViewController:", v10, v28);
    objc_storeStrong((id *)&v12->_resizeTaskDescriptorViewModel, v24);
    objc_storeStrong((id *)&v12->_managedViewController, v29);
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeWeak((id *)&v12->_coordinatorActionHandler, obj);
    objc_storeStrong((id *)&v12->_selectionCoordinator, v19);
    objc_storeStrong((id *)&v12->_additionalSelectionState, v41);
    objc_storeStrong((id *)&v12->_downloadHelper, v40);
    objc_storeStrong((id *)&v12->_downloadProgresses, v39);
    objc_storeStrong((id *)&v12->_progressController, v20);
    objc_storeStrong((id *)&v12->_loadingStatusManager, v11);
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activityIndicatorTrackingIDs = v12->_activityIndicatorTrackingIDs;
    v12->_activityIndicatorTrackingIDs = v30;

    -[PUPickerCoordinator selectionCoordinator](v12, "selectionCoordinator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDelegate:", v12);

    -[PUPickerCoordinator resizeTaskDescriptorViewModel](v12, "resizeTaskDescriptorViewModel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", v12);

    -[PUPickerCoordinator resizeTaskDescriptorViewModel](v12, "resizeTaskDescriptorViewModel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerChangeObserver:context:", v12, PUPickerResizeTaskDescriptorViewModelObservationContext);

    -[PUPickerCoordinator configuration](v12, "configuration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "registerChangeObserver:context:", v12, PUPickerConfigurationObservationContext_39106);

    objc_initWeak((id *)buf, v12);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __91__PUPickerCoordinator_initWithConfiguration_coordinatorActionHandler_loadingStatusManager___block_invoke;
    v44[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v45, (id *)buf);
    -[PUPickerActivityProgressController setCancellationHandler:](v20, "setCancellationHandler:", v44);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v12, sel__serviceContextDidBecomeInsecure, *MEMORY[0x1E0DC5D20], 0);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);

  }
  return v12;
}

- (PUPickerCoordinator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 259, CFSTR("%s is not available as initializer"), "-[PUPickerCoordinator init]");

  abort();
}

- (void)startActivityIndicatorsForAssetsWithFetchResult:(id)a3
{
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 265, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator startActivityIndicatorsForAssetsWithFetchResult:]");

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        -[PUPickerCoordinator loadingStatusManager](self, "loadingStatusManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "willBeginLoadOperationWithItemIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUPickerCoordinator loadingStatusManager](self, "loadingStatusManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "didUpdateLoadOperationWithIndeterminateProgressWithTrackingID:", v14);

        -[PUPickerCoordinator activityIndicatorTrackingIDs](self, "activityIndicatorTrackingIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setReplacesConfirmationButtonWithActivityIndicator:", 1);

}

- (void)stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 277, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator stopActivityIndicatorsForAssetsWithIdentifiers:]");

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

LABEL_3:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        -[PUPickerCoordinator activityIndicatorTrackingIDs](self, "activityIndicatorTrackingIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[PUPickerCoordinator loadingStatusManager](self, "loadingStatusManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "didCompleteLoadOperationWithTrackingID:withSuccess:error:", v13, 1, 0);

        }
        -[PUPickerCoordinator activityIndicatorTrackingIDs](self, "activityIndicatorTrackingIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  -[PUPickerCoordinator activityIndicatorTrackingIDs](self, "activityIndicatorTrackingIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17)
  {
    -[PUPickerCoordinator managedViewController](self, "managedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setReplacesConfirmationButtonWithActivityIndicator:", 0);

  }
}

- (void)updateSelectedAssetsWithIdentifiers:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) != 0)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 294, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator updateSelectedAssetsWithIdentifiers:]");

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

LABEL_3:
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedObjectIDs");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPickerCoordinator configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  objc_msgSend(v23, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToArray:", v17);

  if ((v18 & 1) == 0)
  {
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "modifySelectionWithRemovedOIDs:insertedOIDs:", v23, v20);

  }
}

- (void)deselectAssetsWithIdentifiers:(id)a3
{
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 308, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator deselectAssetsWithIdentifiers:]");

  }
  v5 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[PUPickerCoordinator configuration](self, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "librarySpecificFetchOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v20, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
      {
        -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "modifySelectionWithRemovedOIDs:insertedOIDs:", v16, v17);

      }
    }
  }

}

- (void)moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 322, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator moveAssetWithIdentifier:afterIdentifier:]");

    if (v7)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_17;
LABEL_3:
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedObjectIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[PUPickerCoordinator configuration](self, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CD1390];
      v36[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchAssetsWithLocalIdentifiers:options:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_14:

        goto LABEL_15;
      }
      -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "selectedObjectIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      v23 = objc_msgSend(v22, "indexOfObject:", v19);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = v23;
        if (v8)
        {
          v25 = (void *)MEMORY[0x1E0CD1390];
          v35 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fetchAssetsWithLocalIdentifiers:options:", v34, v14);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
            goto LABEL_13;
          v29 = objc_msgSend(v22, "indexOfObject:", v28);

          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_13;
        }
        else
        {
          v29 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "moveObjectsAtIndexes:toIndex:", v30, v29);

        -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "modifySelectionWithOrder:", v22);

      }
LABEL_13:

      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)searchWithString:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) != 0)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 351, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator searchWithString:]");

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

LABEL_3:
  -[PUPickerCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsSelectionStaging");

  if ((v8 & 1) == 0)
  {
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedObjectIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modifySelectionWithRemovedOIDs:insertedOIDs:", v11, v12);

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchWithString:", v6);

}

- (BOOL)popViewController
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 362, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator popViewController]");

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 2)
  {
    -[PUPickerCoordinator configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowsSelectionStaging");

    if ((v10 & 1) == 0)
    {
      -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedObjectIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "modifySelectionWithRemovedOIDs:insertedOIDs:", v13, v14);

    }
    -[PUPickerCoordinator managedViewController](self, "managedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "popViewControllerAnimated:", 1);

  }
  return v8 > 1;
}

- (void)scrollContentToInitialPosition
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 377, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator scrollContentToInitialPosition]");

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollContentToInitialPosition");

}

- (void)zoomInContent
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 383, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator zoomInContent]");

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomInContent");

}

- (void)zoomOutContent
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 389, CFSTR("%s must be called on the main thread"), "-[PUPickerCoordinator zoomOutContent]");

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomOutContent");

}

- (BOOL)isShowingLiveWallpaperSuggestions
{
  void *v2;
  void *v3;
  char v4;

  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowingLiveWallpaperSuggestions");

  return v4;
}

- (void)emitDidFinishPickingAnalytics
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __CFString *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  -[PUPickerCoordinator configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration"));

  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerClientBundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("Unknown");
  if (v6)
    v8 = (__CFString *)v6;
  v58 = v8;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "count") != 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "edgesWithoutContentMargins"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "preferredAssetRepresentationMode"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "pickerClientHasLibraryAccess"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "isLimitedLibraryPicker"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "isPeoplePicker"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithBool:", objc_msgSend(v25, "isSingleSelection"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "mode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "selectedSuggestionAnalyticsName");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  v32 = CFSTR("Unknown");
  if (v30)
    v32 = (__CFString *)v30;
  v33 = v32;

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v35, "selection"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPickerCoordinator configuration](self, "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "disabledCapabilities"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v54;
  v61 = v47;
  v62 = v49;
  v63 = v36;
  v64 = v39;
  v53 = v39;
  v52 = v36;
  v51 = v33;
  v50 = v49;
  v48 = v47;
  v55 = v54;
  v40 = v56;
  v41 = v19;
  v42 = v57;
  v43 = v14;
  v44 = v59;
  v45 = v58;
  AnalyticsSendEventLazy();

}

- (void)resignSearchBarAsFirstResponder_110426547
{
  void *v2;
  id v3;

  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignSearchBarAsFirstResponder");

}

- (void)containerControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUPickerCoordinator photoPicker](self, "photoPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PUPickerCoordinator pu_legacy_didDisplayPicker](self, "pu_legacy_didDisplayPicker");
    }
    else
    {
      PLPickerGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Both coordinatorActionHandler and photoPicker delegates are not available. Should not reach here unless it's a test code.", v7, 2u);
      }

    }
  }
}

- (void)containerControllerWantsToLearnMoreAboutDataAccess:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentDataAccessEducationViewController:", v4);

}

- (void)containerController:(id)a3 didTapBatchedItems:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator additionalSelectionState](self, "additionalSelectionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinator:didFinishPicking:additionalSelectionState:", self, v5, v6);

}

- (void)containerController:(id)a3 didTapCancelButton:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];

  -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preselectedItemObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator additionalSelectionState](self, "additionalSelectionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinator:didFinishPicking:additionalSelectionState:", self, v7, v8);

  }
  else
  {
    -[PUPickerCoordinator photoPicker](self, "photoPicker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PUPickerCoordinator pu_legacy_cancelPicker](self, "pu_legacy_cancelPicker");
    }
    else
    {
      PLPickerGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Both coordinatorActionHandler and photoPicker delegates are not available. Should not reach here unless it's a test code.", buf, 2u);
      }

    }
  }
}

- (void)containerController:(id)a3 didTapClearButton:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modifySelectionWithRemovedOIDs:insertedOIDs:", v6, v7);

}

- (void)containerController:(id)a3 didTapAddButton:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint8_t v22[8];
  _QWORD v23[4];
  id v24;

  v5 = a4;
  -[PUPickerCoordinator _logPhotosAccessWithNonEmptyUserSelection](self, "_logPhotosAccessWithNonEmptyUserSelection");
  -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUPickerCoordinator managedViewController](self, "managedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "canResignFirstResponder"))
      objc_msgSend(v11, "resignFirstResponder");
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedObjectIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator additionalSelectionState](self, "additionalSelectionState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinator:didFinishPicking:additionalSelectionState:", self, v13, v15);

  }
  else
  {
    -[PUPickerCoordinator photoPicker](self, "photoPicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v5;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;

      objc_msgSend(v18, "setEnabled:", 0);
      v19 = v17;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;

      objc_msgSend(v20, "setEnabled:", 0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __59__PUPickerCoordinator_containerController_didTapAddButton___block_invoke;
      v23[3] = &unk_1E58ABD10;
      v24 = v19;
      -[PUPickerCoordinator pu_legacy_selectMultipleAssets:](self, "pu_legacy_selectMultipleAssets:", v23);

    }
    else
    {
      PLPickerGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "Both coordinatorActionHandler and photoPicker delegates are not available. Should not reach here unless it's a test code.", v22, 2u);
      }

    }
  }

}

- (void)containerController:(id)a3 didTapShowSelectedButton:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.selectionCoordinator.selectedObjectIDs.count > 0"));

  }
  -[PUPickerCoordinator _presentAssetExplorer](self, "_presentAssetExplorer");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  id v21;

  v6 = a4;
  v9 = a3;
  if ((void *)PUPickerResizeTaskDescriptorViewModelObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v21 = v9;
      -[PUPickerCoordinator configuration](self, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "allowsDownscaling");

      if (v13)
      {
        -[PUPickerCoordinator resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resizeTaskDescriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15
          || ((objc_msgSend(v15, "targetSize"), v16 == *MEMORY[0x1E0CD1C28])
            ? (v18 = v17 == *(double *)(MEMORY[0x1E0CD1C28] + 8))
            : (v18 = 0),
              v18
           || (v16 == *MEMORY[0x1E0C9D820] ? (v19 = v17 == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v19 = 0), v19)))
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v16, v17));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v10 = 0;
      }
      -[PUPickerCoordinator additionalSelectionState](self, "additionalSelectionState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDownscalingTargetDimension:", v10);
      goto LABEL_21;
    }
  }
  else
  {
    if ((void *)PUPickerConfigurationObservationContext_39106 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 529, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 2) != 0)
    {
      v21 = v9;
      -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerCoordinator configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUPickerCoordinator _updateSelectionCoordinatorLimit:configuration:](PUPickerCoordinator, "_updateSelectionCoordinatorLimit:configuration:", v10, v11);
LABEL_21:

      v9 = v21;
    }
  }

}

- (void)selectionCoordinator:(id)a3 willUpdateSelectedObjectsForSnapshot:(id)a4 withRemovedIndexes:(id)a5 insertedIndexes:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  PUPickerCoordinator *v23;
  id v24;
  SEL v25;
  _QWORD v26[4];
  id v27;
  PUPickerCoordinator *v28;
  id v29;
  SEL v30;

  v20 = a4;
  v10 = a5;
  v11 = a6;
  -[PUPickerCoordinator configuration](self, "configuration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "allowsDownload"))
  {
LABEL_6:

    goto LABEL_7;
  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSingleSelection");

  if ((v14 & 1) == 0)
  {
    -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 540, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("downloadHelper"), v20);

    }
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke;
    v26[3] = &unk_1E58A07B0;
    v17 = v20;
    v30 = a2;
    v27 = v17;
    v28 = self;
    v18 = v15;
    v29 = v18;
    objc_msgSend(v10, "enumerateItemIndexPathsUsingBlock:", v26);
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke_2;
    v21[3] = &unk_1E58A07B0;
    v22 = v17;
    v23 = self;
    v24 = v18;
    v25 = a2;
    v12 = v18;
    objc_msgSend(v11, "enumerateItemIndexPathsUsingBlock:", v21);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)selectionCoordinator:(id)a3 didUpdateSelectedObjectsWithRemovedOIDs:(id)a4 insertedOIDs:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t v25[16];
  _QWORD block[4];
  id v27;
  id v28;

  v6 = a3;
  objc_msgSend(v6, "selectedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isSingleSelection"))
  {
    v9 = objc_msgSend(v7, "count");

    if (v9 >= 2)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __97__PUPickerCoordinator_selectionCoordinator_didUpdateSelectedObjectsWithRemovedOIDs_insertedOIDs___block_invoke;
      block[3] = &unk_1E58ABCA8;
      v27 = v6;
      v28 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_21;
    }
  }
  else
  {

  }
  -[PUPickerCoordinator setSelectionDidChange:](self, "setSelectionDidChange:", 1);
  -[PUPickerCoordinator selectionDidChangeObserver](self, "selectionDidChangeObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PUPickerCoordinator selectionDidChangeObserver](self, "selectionDidChangeObserver");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateBars");

  -[PUPickerCoordinator resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performChanges:", &__block_literal_global_39094);

  -[PUPickerCoordinator configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "shouldPassthroughSelection") & 1) == 0)
  {
LABEL_20:

    goto LABEL_21;
  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isSingleSelection") & 1) != 0)
  {
    v17 = objc_msgSend(v7, "count");

    if (!v17)
      goto LABEL_21;
  }
  else
  {

  }
  -[PUPickerCoordinator _logPhotosAccessWithNonEmptyUserSelection](self, "_logPhotosAccessWithNonEmptyUserSelection");
  -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PUPickerCoordinator configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "allowsDownscaling") & 1) != 0)
    {
      -[PUPickerCoordinator configuration](self, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isSingleSelection");

      if (v21)
      {
        -[PUPickerCoordinator _presentAssetExplorer](self, "_presentAssetExplorer");
        goto LABEL_21;
      }
    }
    else
    {

    }
    -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator additionalSelectionState](self, "additionalSelectionState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinator:didFinishPicking:additionalSelectionState:", self, v7, v23);

    goto LABEL_20;
  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PUPickerCoordinator pu_legacy_selectSingleAsset](self, "pu_legacy_selectSingleAsset");
  }
  else
  {
    PLPickerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_ERROR, "coordinatorActionHandler delegate is not available. Should not reach here unless it's a test code.", v25, 2u);
    }

  }
LABEL_21:

}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  char v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  LOBYTE(v13) = 1;
  switch(a4)
  {
    case 0uLL:
      -[PUPickerCoordinator configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSingleSelection");
      goto LABEL_6;
    case 2uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      LOBYTE(v13) = 0;
      break;
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
      -[PUPickerCoordinator configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "isSingleSelection") ^ 1;
      goto LABEL_7;
    case 0xBuLL:
      -[PUPickerCoordinator configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "allowsDownscaling");
LABEL_6:
      LOBYTE(v13) = v15;
LABEL_7:

      break;
    default:
      break;
  }

  return v13;
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 632, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionAction == PUReviewCompletionActionDone"));

  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSingleSelection");

  if (v17)
  {
    -[PUPickerCoordinator _logPhotosAccessWithNonEmptyUserSelection](self, "_logPhotosAccessWithNonEmptyUserSelection");
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedObjectIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerCoordinator coordinatorActionHandler](self, "coordinatorActionHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator additionalSelectionState](self, "additionalSelectionState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "coordinator:didFinishPicking:additionalSelectionState:", self, v19, v21);
  }
  else
  {
    objc_msgSend(v33, "initialSelectedAssetUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v19, "minusSet:", v13);
    -[PUPickerCoordinator configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "photoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v19, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchAssetsWithUUIDs:options:", v26, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v21, "fetchedObjectIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "orderedSetWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "modifySelectionWithRemovedOIDs:insertedOIDs:", v30, v31);

  }
  objc_msgSend(v33, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)assetExplorerReviewScreenViewController:(id)a3 fileSizeMenuForSelectedUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC36F8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__PUPickerCoordinator_assetExplorerReviewScreenViewController_fileSizeMenuForSelectedUUIDs___block_invoke;
  v15[3] = &unk_1E58A07F8;
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v16 = v9;
  objc_msgSend(v8, "elementWithProvider:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC39D0];
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuWithChildren:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

- (id)beginShowingProgressForAsset:(id)a3 inCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  -[PUPickerCoordinator configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsDownload");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 671, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 672, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__39083;
  v25 = __Block_byref_object_dispose__39084;
  v26 = 0;
  v20 = v7;
  px_dispatch_on_main_queue_sync();
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (void)updateProgressWithIdentifier:(id)a3 withValue:(double)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  -[PUPickerCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsDownload");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 698, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 699, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 700, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 701, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  v12 = v6;
  px_dispatch_on_main_queue();

}

- (void)endShowingProgressWithIdentifier:(id)a3 succeeded:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a6;
  -[PUPickerCoordinator configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowsDownload");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 718, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 719, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 720, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 721, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  v22 = v9;
  v16 = v10;
  v17 = v9;
  px_dispatch_on_main_queue();

}

- (void)presentAlertController:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  -[PUPickerCoordinator configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsDownload");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 750, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__PUPickerCoordinator_presentAlertController___block_invoke;
  v17[3] = &unk_1E58ABCA8;
  v18 = v12;
  v19 = v5;
  v13 = v5;
  v14 = v12;
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, v17);

}

- (void)_presentViewControllerDismissingPresentedViewControllerIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__PUPickerCoordinator__presentViewControllerDismissingPresentedViewControllerIfNeeded___block_invoke;
    v10[3] = &unk_1E58ABCA8;
    v11 = v8;
    v12 = v4;
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    objc_msgSend(v8, "presentViewController:animated:completion:", v4, 1, 0);
  }

}

- (void)_presentAssetExplorer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUPhotoKitDataSourceManager *v8;
  PUPhotoKitMediaProvider *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PUAssetExplorerReviewScreenViewController *v17;
  void *v18;
  PUAssetExplorerReviewScreenViewController *v19;
  uint64_t v20;
  id v21;

  -[PUPickerCoordinator _createFetchResultUsingSelectedObjectIDs](self, "_createFetchResultUsingSelectedObjectIDs");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithAssetFetchResult:options:", v21, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v6);
  v8 = -[PUPhotoKitDataSourceManager initWithPhotosDataSource:]([PUPhotoKitDataSourceManager alloc], "initWithPhotosDataSource:", v7);
  v9 = objc_alloc_init(PUPhotoKitMediaProvider);
  -[PUPickerCoordinator configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generatedFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "displayAssetMediaType");

  if (v12 == 1)
  {
    v13 = 14;
  }
  else
  {
    -[PUPickerCoordinator configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "generatedFilter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "displayAssetMediaType");

    if (v16 == 2)
      v13 = 22;
    else
      v13 = 6;
  }
  v17 = [PUAssetExplorerReviewScreenViewController alloc];
  -[PUPickerCoordinator resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 1;
  v19 = -[PUAssetExplorerReviewScreenViewController initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:reviewBarsModel:resizeTaskDescriptorViewModel:options:](v17, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:reviewBarsModel:resizeTaskDescriptorViewModel:options:", v8, v9, 0, 0, v5, 0, 0, 0, v20, 0, v18, v13);

  -[PUAssetExplorerReviewScreenViewController setDelegate:](v19, "setDelegate:", self);
  -[PUAssetExplorerReviewScreenViewController setModalInPresentation:](v19, "setModalInPresentation:", 1);
  -[PUPickerCoordinator _presentViewControllerDismissingPresentedViewControllerIfNeeded:](self, "_presentViewControllerDismissingPresentedViewControllerIfNeeded:", v19);

}

- (id)_fileSizeActionsForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id location;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[PUPhotoPickerResizeTaskDescriptor orderedDefaultDescriptors](PUPhotoPickerResizeTaskDescriptor, "orderedDefaultDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "localizedDescriptionForAssets:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0DC3428];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke;
        v15[3] = &unk_1E58A9FA8;
        objc_copyWeak(&v16, &location);
        v15[4] = v10;
        objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        objc_destroyWeak(&v16);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

  objc_destroyWeak(&location);
  return v5;
}

- (id)_createFetchResultUsingSelectedObjectIDs
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CD1620]);
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = MEMORY[0x1E0C9AA60];
  -[PUPickerCoordinator configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v8, v10, *MEMORY[0x1E0CD1B90], 0, 0, 1);

  return v11;
}

- (void)_serviceContextDidBecomeInsecure
{
  +[PUPickerUtilities presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded](PUPickerUtilities, "presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded");
}

- (void)_logPhotosAccessWithNonEmptyUserSelection
{
  void *v2;
  void *v3;
  id v4;

  -[PUPickerCoordinator configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerClientIdentification");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (PLPlatformPhotosAccessLoggingSupported() && v4)
  {
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logPhotosAccessWithPhotoPickerClientIdentification:", v4);

  }
}

- (void)presentProgressControllerFromViewController:(id)a3 progress:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 867, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceViewController"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 868, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[PUPickerCoordinator progressController](self, "progressController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProgress:", v7);

  -[PUPickerCoordinator updateProgressControllerMessage](self, "updateProgressControllerMessage");
  -[PUPickerCoordinator progressController](self, "progressController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showFromSourceViewController:completion:", v12, 0);

}

- (void)cancelProgressController
{
  void *v3;
  id v4;

  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllDownloads");

  -[PUPickerCoordinator progressController](self, "progressController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideWithCompletion:", 0);

}

- (void)updateProgressControllerMessage
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  -[PUPickerCoordinator configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsDownload");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 881, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 882, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 884, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 885, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController.progress"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "totalUnitCount");
  if (v12 < 2)
  {
    -[PUPickerCoordinator progressController](self, "progressController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator progressController](self, "progressController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "progress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMessage:", v29);

  }
  else
  {
    v13 = v12;
    v14 = objc_msgSend(v11, "completedUnitCount");
    if (v14 < v13)
      v15 = v14 + 1;
    else
      v15 = v13;
    -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedObjectIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerCoordinator configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "generatedFilter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerCoordinator configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "displayAssetMediaTypeConsideringAssetObjectIDs:photoLibrary:", v18, v22);

    v24 = CFSTR("PICKER_VIEW_DOWNLOADING_ITEMS_ALERT_BODY");
    if (v23 == 2)
      v24 = CFSTR("PICKER_VIEW_DOWNLOADING_VIDEOS_ALERT_BODY");
    if (v23 == 1)
      v25 = CFSTR("PICKER_VIEW_DOWNLOADING_PHOTOS_ALERT_BODY");
    else
      v25 = (__CFString *)v24;
    PULocalizedString(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v13;
    PUStringWithValidatedFormat();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerCoordinator progressController](self, "progressController", v15, v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMessage:", v27);
  }

}

- (id)assetsForResizing
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[PUPickerCoordinator configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsDownload");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 915, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 916, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 917, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 918, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  -[PUPickerCoordinator _createFetchResultUsingSelectedObjectIDs](self, "_createFetchResultUsingSelectedObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isAnyPickerAssetDownloading:", v10))
      v12 = 0;
    else
      v12 = v10;
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PUPhotoPicker)photoPicker
{
  return (PUPhotoPicker *)objc_loadWeakRetained((id *)&self->_photoPicker);
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (id)selectionDidChangeObserver
{
  return self->_selectionDidChangeObserver;
}

- (void)setSelectionDidChangeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)selectionDidChange
{
  return self->_selectionDidChange;
}

- (void)setSelectionDidChange:(BOOL)a3
{
  self->_selectionDidChange = a3;
}

- (PUPickerManagedViewController)managedViewController
{
  return self->_managedViewController;
}

- (PUPickerCoordinatorActionHandler)coordinatorActionHandler
{
  return (PUPickerCoordinatorActionHandler *)objc_loadWeakRetained((id *)&self->_coordinatorActionHandler);
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (PUPickerAdditionalSelectionState)additionalSelectionState
{
  return self->_additionalSelectionState;
}

- (NSMutableDictionary)activityIndicatorTrackingIDs
{
  return self->_activityIndicatorTrackingIDs;
}

- (PUPhotosGridDownloadHelper)downloadHelper
{
  return self->_downloadHelper;
}

- (NSMutableDictionary)downloadProgresses
{
  return self->_downloadProgresses;
}

- (PUPickerActivityProgressController)progressController
{
  return self->_progressController;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_downloadProgresses, 0);
  objc_storeStrong((id *)&self->_downloadHelper, 0);
  objc_storeStrong((id *)&self->_activityIndicatorTrackingIDs, 0);
  objc_storeStrong((id *)&self->_additionalSelectionState, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_destroyWeak((id *)&self->_coordinatorActionHandler);
  objc_storeStrong((id *)&self->_managedViewController, 0);
  objc_storeStrong(&self->_selectionDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_photoPicker);
}

void __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "resizeTaskDescriptorViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke_2;
  v4[3] = &unk_1E58A08A0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "performChanges:", v4);

}

uint64_t __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setResizeTaskDescriptor:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__PUPickerCoordinator__presentAssetExplorer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __87__PUPickerCoordinator__presentViewControllerDismissingPresentedViewControllerIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __46__PUPickerCoordinator_presentAlertController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __81__PUPickerCoordinator_endShowingProgressWithIdentifier_succeeded_canceled_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "progressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "downloadProgresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
      objc_msgSend(*(id *)(a1 + 32), "updateProgressControllerMessage");
    }
    objc_msgSend(*(id *)(a1 + 32), "downloadProgresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
  v7 = *(unsigned __int8 *)(a1 + 57);
  objc_msgSend(*(id *)(a1 + 32), "loadingStatusManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(v8, "didCancelLoadOperationWithTrackingID:", v10);
  else
    objc_msgSend(v8, "didCompleteLoadOperationWithTrackingID:withSuccess:error:", v10, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "resizeTaskDescriptorViewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performChanges:", &__block_literal_global_245_39081);

}

uint64_t __81__PUPickerCoordinator_endShowingProgressWithIdentifier_succeeded_canceled_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateAssetsForResizing");
}

void __62__PUPickerCoordinator_updateProgressWithIdentifier_withValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "progressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "downloadProgresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(v4, "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 48) * (double)objc_msgSend(v4, "totalUnitCount")));
    objc_msgSend(*(id *)(a1 + 32), "updateProgressControllerMessage");
  }
  objc_msgSend(*(id *)(a1 + 32), "loadingStatusManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

void __65__PUPickerCoordinator_beginShowingProgressForAsset_inCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "loadingStatusManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "progressController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "progress");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "downloadProgresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    objc_msgSend(v11, "addChild:withPendingUnitCount:", v8, 1);
    objc_msgSend(*(id *)(a1 + 32), "updateProgressControllerMessage");

  }
  objc_msgSend(*(id *)(a1 + 32), "resizeTaskDescriptorViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performChanges:", &__block_literal_global_244);

}

uint64_t __65__PUPickerCoordinator_beginShowingProgressForAsset_inCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateAssetsForResizing");
}

void __92__PUPickerCoordinator_assetExplorerReviewScreenViewController_fileSizeMenuForSelectedUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(id, void *);
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithUUIDs:options:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_fileSizeActionsForAssets:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v13);
}

void __97__PUPickerCoordinator_selectionCoordinator_didUpdateSelectedObjectsWithRemovedOIDs_insertedOIDs___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v2, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "modifySelectionWithRemovedOIDs:insertedOIDs:", v2, v4);

}

uint64_t __97__PUPickerCoordinator_selectionCoordinator_didUpdateSelectedObjectsWithRemovedOIDs_insertedOIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateAssetsForResizing");
}

void __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  _OWORD v18[2];

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a2[1];
  v18[0] = *a2;
  v18[1] = v5;
  objc_msgSend(v4, "objectAtIndexPath:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PUPickerCoordinator.m"), 543, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[snapshot.dataSource objectAtIndexPath:indexPath]"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PUPickerCoordinator.m"), 543, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[snapshot.dataSource objectAtIndexPath:indexPath]"), v13, v17);

    goto LABEL_6;
  }
LABEL_3:
  v7 = *(void **)(a1 + 48);
  objc_msgSend(v6, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelDownloadForIdentifier:", v8);

}

void __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  _OWORD v16[2];

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a2[1];
  v16[0] = *a2;
  v16[1] = v5;
  objc_msgSend(v4, "objectAtIndexPath:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PUPickerCoordinator.m"), 547, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[snapshot.dataSource objectAtIndexPath:indexPath]"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("PUPickerCoordinator.m"), 547, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[snapshot.dataSource objectAtIndexPath:indexPath]"), v11, v15);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(*(id *)(a1 + 48), "handleDownloadOfAssetIfNeeded:inCollection:withSuccessHandler:", v6, 0, 0);

}

void __59__PUPickerCoordinator_containerController_didTapAddButton___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = *(id *)(a1 + 32);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  objc_msgSend(v3, "setEnabled:", 1);
  v4 = *(id *)(a1 + 32);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v5, "setEnabled:", 1);
}

id __52__PUPickerCoordinator_emitDidFinishPickingAnalytics__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[12];
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 32);
  v4[0] = CFSTR("callerBundleID");
  v4[1] = CFSTR("didSelectItems");
  v6 = *(_QWORD *)(a1 + 48);
  v4[2] = CFSTR("edgesWithoutContentMargins");
  v4[3] = CFSTR("encodingPolicy");
  v7 = *(_OWORD *)(a1 + 56);
  v4[4] = CFSTR("hasPhotoLibraryAccess");
  v4[5] = CFSTR("isLimitedLibraryPicker");
  v1 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = v1;
  v4[6] = CFSTR("isPeoplePicker");
  v4[7] = CFSTR("isSingleSelection");
  v2 = *(_QWORD *)(a1 + 96);
  v10 = *(_QWORD *)(a1 + 88);
  v11 = v2;
  v4[8] = CFSTR("mode");
  v4[9] = CFSTR("selectedSuggestionName");
  v12 = *(_OWORD *)(a1 + 104);
  v4[10] = CFSTR("selectionBehavior");
  v4[11] = CFSTR("disabledCapabilities");
  v13 = *(_QWORD *)(a1 + 120);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, v4, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __91__PUPickerCoordinator_initWithConfiguration_coordinatorActionHandler_loadingStatusManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancelProgressController");

}

+ (void)_updateSelectionCoordinatorLimit:(id)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "allowsUnlimitedMultipleSelection") & 1) != 0
    || objc_msgSend(v5, "isSingleSelection"))
  {
    objc_msgSend(v7, "setSelectionCountLimit:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "selectionLimit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionCountLimit:", v6);

  }
}

+ (void)_logPhotosPickerPresentedForClientWithConfiguration:(id)a3 usingOptions:(int64_t)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "pickerClientIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "pickerClientIsEntitledForOrHasPrivateLibraryAccess") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v9, "isLimitedLibraryPicker");
  if (PLPlatformPhotosAccessLoggingSupported() && v5 && (v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trustedCallerBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logPhotosPickerPresentedLibraryForClient:usingOptions:", v8, a4);

  }
}

- (id)ppt_scrollTestViewController
{
  void *v2;
  void *v3;

  -[PUPickerCoordinator managedViewController](self, "managedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)pu_legacy_didDisplayPicker
{
  void *v4;
  void *v5;
  id v6;

  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 947, CFSTR("PUPhotoPicker must not be nil."));

  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didDisplayPhotoPickerSourceType:", 0);

}

- (void)pu_legacy_cancelPicker
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 953, CFSTR("PUPhotoPicker must not be nil."));

  }
  PLPickerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Starting legacy picker cancel", v9, 2u);
  }

  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllDownloads");

  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelPhotoPicker");

}

- (void)pu_legacy_selectSingleAsset
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  int v27;
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
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  char v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 963, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.photoPicker"));

  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.photoPicker isKindOfClass:[UIViewController class]]"));

  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsDownload");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 965, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 968, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectedObjectIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.selectionCoordinator.selectedObjectIDs > 0"));

  }
  -[PUPickerCoordinator _createFetchResultUsingSelectedObjectIDs](self, "_createFetchResultUsingSelectedObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PLPickerGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v14;
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Starting legacy single selection for asset %@", buf, 0xCu);
  }

  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator configuration](self, "configuration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[PUPickerCoordinator _editingEnabled:](PUPickerCoordinator, "_editingEnabled:", v16);
  v19 = +[PUPickerCoordinator _viewImageBeforeSelectingEnabled:](PUPickerCoordinator, "_viewImageBeforeSelectingEnabled:", v16);
  v20 = +[PUPickerCoordinator _skipSelectionConfirmation:](PUPickerCoordinator, "_skipSelectionConfirmation:", v16);
  -[PUPickerCoordinator configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "allowsDownscaling");

  v23 = +[PUPickerCoordinator _assetCanPlay:](PUPickerCoordinator, "_assetCanPlay:", v14);
  v24 = +[PUPickerCoordinator _shouldTreatAssetAsLivePhoto:photoPicker:configuration:](PUPickerCoordinator, "_shouldTreatAssetAsLivePhoto:photoPicker:configuration:", v14, v16, v43);
  if (v22 | v20 | v18)
    v25 = v22 | (v22 | v20) ^ 1u;
  else
    v25 = (v19 || v23) | v24;
  objc_msgSend(v17, "cancelAllDownloads");
  v48 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v17, "isAnyPickerAssetDownloading:", v26);

  if (!v27)
  {
    -[PUPickerCoordinator _completeSingleSelection:showConfirmation:](self, "_completeSingleSelection:showConfirmation:", v14, v25);
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 998, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.photoPicker"), v39);
LABEL_28:

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "px_descriptionForAssertionMessage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 998, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.photoPicker"), v39, v41);

    goto LABEL_28;
  }
LABEL_23:
  -[PUPickerCoordinator presentProgressControllerFromViewController:progress:](self, "presentProgressControllerFromViewController:progress:", v29, v28);

  objc_initWeak((id *)buf, self);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke;
  v44[3] = &unk_1E58A08C8;
  objc_copyWeak(&v46, (id *)buf);
  v45 = v14;
  v47 = v25;
  objc_msgSend(v17, "handleDownloadOfAssetIfNeeded:inCollection:withSuccessHandler:", v45, 0, v44);

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);

LABEL_25:
}

- (void)pu_legacy_selectSingleAssetWithFileResizing
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1014, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.photoPicker"));

  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsDownload");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1015, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1016, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1017, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1018, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.selectionCoordinator.selectedObjectIDs > 0"));

  }
  -[PUPickerCoordinator _createFetchResultUsingSelectedObjectIDs](self, "_createFetchResultUsingSelectedObjectIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PLPickerGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Starting legacy single selection with file resizing for asset %@", buf, 0xCu);
  }

  -[PUPickerCoordinator _completeSingleSelection:showConfirmation:](self, "_completeSingleSelection:showConfirmation:", v13, 0);
}

- (void)pu_legacy_selectMultipleAssets:(id)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void (**v50)(void);
  void *v51;
  id obj;
  PUPickerCoordinator *val;
  _QWORD block[4];
  id v55;
  void (**v56)(void);
  __int128 *v57;
  id v58;
  id location;
  _QWORD v60[4];
  NSObject *v61;
  __int128 *p_buf;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  __int128 buf;
  uint64_t v69;
  char v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v50 = (void (**)(void))a3;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1030, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  val = self;
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1031, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.photoPicker"));

  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1032, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.photoPicker isKindOfClass:[UIViewController class]]"));

  }
  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1033, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.selectionCoordinator.selectedObjectIDs > 0"));

  }
  -[PUPickerCoordinator _createFetchResultUsingSelectedObjectIDs](self, "_createFetchResultUsingSelectedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchedObjects");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  PLPickerGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v51, "count");
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "Starting legacy multiple selection for %lu assets", (uint8_t *)&buf, 0xCu);
  }

  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "onlyReturnsIdentifiers");

  if (v13)
  {
    PXMap();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLPickerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Calling back with asset identifiers only for %lu assets", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v49, "didSelectMultipleMediaItemsWithInfoDictionaries:", v14);
    v50[2]();

    goto LABEL_35;
  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "allowsDownload");

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1050, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PUPickerCoordinator.m"), 1051, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](val, "downloadProgresses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PUPickerCoordinator.m"), 1052, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](val, "progressController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PUPickerCoordinator.m"), 1053, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  -[PUPickerCoordinator downloadHelper](val, "downloadHelper");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isAnyPickerAssetDownloading:", v51);

  if (!v26)
  {
    -[PUPickerCoordinator _completeMultipleSelection:](val, "_completeMultipleSelection:", v51);
    v50[2]();
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v51, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator photoPicker](val, "photoPicker");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PUPickerCoordinator.m"), 1058, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.photoPicker"), v45);
LABEL_38:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "px_descriptionForAssertionMessage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PUPickerCoordinator.m"), 1058, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.photoPicker"), v45, v47);

    goto LABEL_38;
  }
LABEL_26:
  -[PUPickerCoordinator presentProgressControllerFromViewController:progress:](val, "presentProgressControllerFromViewController:progress:", v27, v48);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v69 = 0x2020000000;
  v70 = 1;
  v28 = dispatch_group_create();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v51;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  v30 = MEMORY[0x1E0C809B0];
  if (v29)
  {
    v31 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v64 != v31)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        dispatch_group_enter(v28);
        -[PUPickerCoordinator downloadHelper](val, "downloadHelper");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = v30;
        v60[1] = 3221225472;
        v60[2] = __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_494;
        v60[3] = &unk_1E58A0930;
        p_buf = &buf;
        v61 = v28;
        objc_msgSend(v34, "handleDownloadOfAssetIfNeeded:inCollection:withSuccessHandler:", v33, 0, v60);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v29);
  }

  objc_initWeak(&location, val);
  block[0] = v30;
  block[1] = 3221225472;
  block[2] = __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_2;
  block[3] = &unk_1E58A0958;
  v57 = &buf;
  objc_copyWeak(&v58, &location);
  v55 = obj;
  v56 = v50;
  dispatch_group_notify(v28, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
LABEL_35:

}

- (void)_completeSingleSelection:(id)a3 showConfirmation:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL8 v19;
  PUUIImageViewController *v20;
  void *v21;
  void *v22;
  PUUIImageViewController *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
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
  _QWORD block[5];
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.photoPicker"));

  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsDownload");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pl_managedAsset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLPickerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v45 = v7;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Moving to confirmation screen for asset %@.", buf, 0xCu);
    }

    -[PUPickerCoordinator configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[PUPickerCoordinator _shouldTreatAssetAsLivePhoto:photoPicker:configuration:](PUPickerCoordinator, "_shouldTreatAssetAsLivePhoto:photoPicker:configuration:", v7, v14, v18);

    v20 = [PUUIImageViewController alloc];
    objc_msgSend(v7, "pl_managedAsset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PUUIImageViewController initWithPhoto:imagePickerProperties:expectsLivePhoto:](v20, "initWithPhoto:imagePickerProperties:expectsLivePhoto:", v21, v22, v19);

    -[PUUIImageViewController setPhotoPicker:](v23, "setPhotoPicker:", v14);
    -[PUUIImageViewController setCancellationDelegate:](v23, "setCancellationDelegate:", self);
    -[PLUIImageViewController setAllowsEditing:](v23, "setAllowsEditing:", +[PUPickerCoordinator _editingEnabled:](PUPickerCoordinator, "_editingEnabled:", v14));
    -[PUPickerCoordinator configuration](self, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "allowsDownscaling"))
    {
      v25 = objc_msgSend(v7, "mediaType");

      if (v25 == 1)
      {
        -[PUPickerCoordinator resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUUIImageViewController setResizeTaskDescriptorViewModel:](v23, "setResizeTaskDescriptorViewModel:", v26);

        -[PUUIImageViewController setFileResizingDelegate:](v23, "setFileResizingDelegate:", self);
      }
    }
    else
    {

    }
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v23);
    objc_msgSend(v32, "navigationBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "standardAppearance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationBar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setScrollEdgeAppearance:", v34);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PUPickerCoordinator_LegacyAPISupport___completeSingleSelection_showConfirmation___block_invoke;
    block[3] = &unk_1E58ABCA8;
    block[4] = self;
    v43 = v32;
    v28 = v32;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v45 = v7;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Calling back with full dictionary for asset %@.", buf, 0xCu);
    }

    -[PUPickerCoordinator resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resizeTaskDescriptor");
    v23 = (PUUIImageViewController *)objc_claimAutoreleasedReturnValue();

    +[PUPickerCoordinator _extraArgumentsForResizeTaskDescriptor:](PUPickerCoordinator, "_extraArgumentsForResizeTaskDescriptor:", v23);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "properties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoPickerDictionaryFromMedia();
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerCoordinator photoPicker](self, "photoPicker");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "didSelectMediaWithInfoDictionary:allowedHandler:", v30, 0);

  }
}

- (void)_completeMultipleSelection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedAssets"));

  }
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.photoPicker"));

  }
  -[PUPickerCoordinator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsDownload");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.configuration.allowsDownload"));

  }
  -[PUPickerCoordinator downloadHelper](self, "downloadHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadHelper"));

  }
  -[PUPickerCoordinator downloadProgresses](self, "downloadProgresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.downloadProgresses"));

  }
  -[PUPickerCoordinator progressController](self, "progressController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerCoordinator.m"), 1164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.progressController"));

  }
  PLPickerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "Calling back with full dictionary for %lu assets.", buf, 0xCu);
  }

  -[PUPickerCoordinator resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resizeTaskDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPickerCoordinator _extraArgumentsForResizeTaskDescriptor:](PUPickerCoordinator, "_extraArgumentsForResizeTaskDescriptor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoPickerDictionariesFromMultipleMediaItems();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerCoordinator photoPicker](self, "photoPicker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "didSelectMultipleMediaItemsWithInfoDictionaries:", v18);

}

- (void)imageViewControllerDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  PLPickerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing UIImagePickerController review UI.", v10, 2u);
  }

  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerCoordinator selectionCoordinator](self, "selectionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modifySelectionWithRemovedOIDs:insertedOIDs:", v7, v9);

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)imageViewControllerFileSizeMenuActions:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PUPickerCoordinator _createFetchResultUsingSelectedObjectIDs](self, "_createFetchResultUsingSelectedObjectIDs", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLPickerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Providing UIImagePickerController review UI file resizing actions with assets: %@", (uint8_t *)&v9, 0xCu);
  }

  -[PUPickerCoordinator _fileSizeActionsForAssets:](self, "_fileSizeActionsForAssets:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)imageViewControllerDidConfirmSelection:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PLPickerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Confirming UIImagePickerController review UI.", v5, 2u);
  }

  -[PUPickerCoordinator pu_legacy_selectSingleAssetWithFileResizing](self, "pu_legacy_selectSingleAssetWithFileResizing");
}

uint64_t __83__PUPickerCoordinator_LegacyAPISupport___completeSingleSelection_showConfirmation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewControllerDismissingPresentedViewControllerIfNeeded:", *(_QWORD *)(a1 + 40));
}

void __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_494(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "progressController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_3;
    v8[3] = &unk_1E58AB210;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "hideWithCompletion:", v8);

    objc_destroyWeak(&v10);
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4);
}

void __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_completeMultipleSelection:", *(_QWORD *)(a1 + 32));

}

id __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC58F0];
  objc_msgSend(a2, "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "progressController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke_2;
    v8[3] = &unk_1E58A62D0;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    v11 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v7, "hideWithCompletion:", v8);

    objc_destroyWeak(&v10);
  }

}

void __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_completeSingleSelection:showConfirmation:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

+ (BOOL)pu_legacy_shouldDownloadVideoComplement:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1091, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoPicker"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

LABEL_3:
  objc_msgSend(v9, "generatedFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "pu_legacy_mediaTypesIncludesLivePhoto"))
    v11 = objc_msgSend(a1, "_editingEnabled:", v7) ^ 1;
  else
    LOBYTE(v11) = 0;

  objc_msgSend(v7, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5868]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  return v11 | v14;
}

+ (BOOL)_skipSelectionConfirmation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoPicker"));

  }
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerSkipConfirmation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (BOOL)_viewImageBeforeSelectingEnabled:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoPicker"));

  }
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5948]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (BOOL)_editingEnabled:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoPicker"));

  }
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (BOOL)_assetCanPlay:(id)a3
{
  id v5;
  unint64_t v6;
  unsigned int v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v6 = objc_msgSend(v5, "playbackStyle");
  v7 = (v6 < 6) & (0x34u >> v6);

  return v7;
}

+ (BOOL)_shouldTreatAssetAsLivePhoto:(id)a3 photoPicker:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoPicker"));

    if (v11)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerCoordinator.m"), 1219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

LABEL_4:
  objc_msgSend(v11, "generatedFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "pu_legacy_mediaTypesIncludesLivePhoto"))
  {

    goto LABEL_8;
  }
  v13 = objc_msgSend(v9, "playbackStyle");

  if (v13 != 3)
  {
LABEL_8:
    LOBYTE(v14) = 0;
    goto LABEL_9;
  }
  v14 = objc_msgSend(a1, "_editingEnabled:", v10) ^ 1;
LABEL_9:

  return v14;
}

+ (id)_extraArgumentsForResizeTaskDescriptor:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3
    || ((objc_msgSend(v3, "targetSize"), v5 == *MEMORY[0x1E0CD1C28])
      ? (v7 = v6 == *(double *)(MEMORY[0x1E0CD1C28] + 8))
      : (v7 = 0),
        v7))
  {
    v9 = 0;
  }
  else
  {
    v11 = *MEMORY[0x1E0CD22C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v5, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
