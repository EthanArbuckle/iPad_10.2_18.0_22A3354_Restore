@implementation PUActivityViewController

- (PUActivityViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 525, CFSTR("%s is not available as initializer"), "-[PUActivityViewController init]");

  abort();
}

- (PUActivityViewController)initWithAssetItems:(id)a3 photosApplicationActivities:(id)a4 linkPresentation:(id)a5
{
  return -[PUActivityViewController initWithAssetItems:photosApplicationActivities:linkPresentation:assetIdentifiers:sharingViewModel:](self, "initWithAssetItems:photosApplicationActivities:linkPresentation:assetIdentifiers:sharingViewModel:", a3, a4, a5, 0, 0);
}

- (PUActivityViewController)initWithAssetItems:(id)a3 photosApplicationActivities:(id)a4 linkPresentation:(id)a5 assetIdentifiers:(id)a6 sharingViewModel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PUActivityItemSourceController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  PUActivityViewController *v44;
  PUActivityViewController *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  PXContentPrivacyController *privacyControllerForContainerCollection;
  NSObject *v50;
  uint64_t v51;
  NSArray *photosActivities;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  BOOL v64;
  void *v65;
  int v66;
  int v67;
  char v68;
  NSObject *v69;
  int v70;
  NSObject *v71;
  char v72;
  BOOL *p_sendAsAssetBundles;
  char v74;
  NSObject *v75;
  CGSize v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v85;
  id obj;
  id obja;
  id v88;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  objc_super v95;
  uint8_t v96[128];
  uint8_t buf[4];
  id v98;
  __int16 v99;
  PUActivityViewController *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v88 = a5;
  v14 = a5;
  v90 = a6;
  obj = a7;
  v15 = a7;
  objc_msgSend(v15, "photosDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "reverseSortOrder");

  if (v17)
  {
    PLShareSheetGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v98 = (id)objc_opt_class();
      v99 = 2048;
      v100 = self;
      v19 = v98;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Reversing the order in which we share the actual items (display unaffected), as the initial data source is in reverse chronological order", buf, 0x16u);

    }
    v20 = v13;

    v21 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v12, "reverseObjectEnumerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "orderedSetWithArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v24;
  }
  else
  {
    v20 = v13;
  }
  v25 = objc_alloc_init(PUActivityItemSourceController);
  -[PUActivityItemSourceController setAssetItems:](v25, "setAssetItems:", v12);
  objc_msgSend(v15, "person");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSourceController setPerson:](v25, "setPerson:", v26);

  objc_msgSend(v15, "socialGroup");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSourceController setSocialGroup:](v25, "setSocialGroup:", v27);

  -[PUActivityItemSourceController assets](v25, "assets");
  v28 = v15;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "photoLibrary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v89 = v28;
  if (v31)
  {
    v33 = v31;
  }
  else
  {
    objc_msgSend(v28, "photosDataSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "photoLibrary");
    v35 = objc_claimAutoreleasedReturnValue();

    v33 = (id)v35;
  }

  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 552, CFSTR("PUActivityViewController was initialized with no assets and no sharing model, and was unable to determine a photo library"));

  }
  objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "hasSharedLibraryOrPreview");
  v38 = v20;
  if (!v20)
  {
    objc_msgSend((id)objc_opt_class(), "photosApplicationActivities:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUActivityItemSourceController activityItems](v25, "activityItems");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  if (v14)
    objc_msgSend(v40, "addObject:", v14);
  PLShareSheetGetLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v98 = v42;
    v99 = 2048;
    v100 = self;
    v101 = 2112;
    v102 = v40;
    v103 = 2112;
    v104 = v38;
    v43 = v42;
    _os_log_impl(&dword_1AAB61000, v41, OS_LOG_TYPE_DEFAULT, "<%@:%p>: creating PUActivityViewController with items:%@ applicationActivities:%@", buf, 0x2Au);

  }
  v95.receiver = self;
  v95.super_class = (Class)PUActivityViewController;
  v44 = -[PUActivityViewController initWithActivityItems:applicationActivities:](&v95, sel_initWithActivityItems_applicationActivities_, v40, v38);
  v45 = v44;
  if (v44)
  {
    v82 = v36;
    -[PUActivityViewController _setSelectedAssetIdentifiers:](v44, "_setSelectedAssetIdentifiers:", v90);
    -[PUActivityViewController setExcludedActivityTypes:](v45, "setExcludedActivityTypes:", MEMORY[0x1E0C9AA60]);
    objc_storeStrong((id *)&v45->_photoLibrary, v33);
    objc_storeStrong((id *)&v45->_sharingViewModel, obj);
    -[PUActivitySharingViewModel registerChangeObserver:context:](v45->_sharingViewModel, "registerChangeObserver:context:", v45, PUActivityViewControllerViewModelObserverContext);
    objc_storeStrong((id *)&v45->_linkPresentation, v88);
    v45->_usePhotosStack = _os_feature_enabled_impl();
    -[PUActivitySharingViewModel photosDataSource](v45->_sharingViewModel, "photosDataSource");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "containerAssetCollection");
    v47 = objc_claimAutoreleasedReturnValue();

    v80 = (void *)v47;
    objc_msgSend(MEMORY[0x1E0D7B288], "privacyControllerForCollection:", v47);
    v48 = objc_claimAutoreleasedReturnValue();
    privacyControllerForContainerCollection = v45->_privacyControllerForContainerCollection;
    v45->_privacyControllerForContainerCollection = (PXContentPrivacyController *)v48;

    if (v45->_privacyControllerForContainerCollection)
    {
      PLShareSheetGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v50, OS_LOG_TYPE_DEFAULT, "Found a privacy controller for the container asset collection of share sheet. Observing changes in lock state for dismissal.", buf, 2u);
      }

      -[PXContentPrivacyController registerChangeObserver:context:](v45->_privacyControllerForContainerCollection, "registerChangeObserver:context:", v45, PrivacyControllerObservationContext);
    }
    v81 = v40;
    v83 = v33;
    obja = v14;
    objc_msgSend((id)objc_opt_class(), "defaultActivityTypeOrder");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityViewController setActivityTypeOrder:](v45, "setActivityTypeOrder:");
    -[PUActivityViewController setObjectManipulationDelegate:](v45, "setObjectManipulationDelegate:", v45);
    v85 = v38;
    v51 = objc_msgSend(v38, "copy");
    photosActivities = v45->_photosActivities;
    v45->_photosActivities = (NSArray *)v51;

    objc_storeStrong((id *)&v45->_itemSourceController, v25);
    -[PUActivityItemSourceController setActivityViewController:](v45->_itemSourceController, "setActivityViewController:", v45);
    -[PUActivityItemSourceController setDelegate:](v45->_itemSourceController, "setDelegate:", v45);
    -[PUActivityItemSourceController registerChangeObserver:context:](v45->_itemSourceController, "registerChangeObserver:context:", v45, PUActivityViewControllerSourceControllerObserverContext);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    -[PUActivityViewController photosActivities](v45, "photosActivities");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v92 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v58, "setItemSourceController:", v45->_itemSourceController);
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
      }
      while (v55);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObserver:selector:name:object:", v45, sel__sharingManagerDidBeginPublishing_, CFSTR("PUPhotoSharingManagerDidBeginPublishing"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObserver:selector:name:object:", v45, sel__sharingStyleDidChangeToExpanded_, CFSTR("UIActivityViewControllerSharingExpandedNotification"), v45);

    v45->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet = 0;
    v45->_shareAsCMM = 0;
    objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "irisUIEnabled");

    v64 = -[PUActivityViewController _canShowSendAsAssetBundlesSwitchInObjectManipulationHeader](v45, "_canShowSendAsAssetBundlesSwitchInObjectManipulationHeader");
    if ((v63 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v45->_excludeLiveness = objc_msgSend(v65, "excludeLivenessByDefaultWhenSharing");

    }
    else
    {
      v45->_excludeLiveness = 1;
    }
    v45->_excludeLocation = objc_msgSend(v61, "excludeLocationByDefaultWhenSharing");
    if (PLIsLockdownMode())
    {
      v66 = _os_feature_enabled_impl();
      v67 = v66;
      v68 = v66 ^ 1;
      if (!v45->_excludeLocation && v66)
      {
        PLSharingGetLog();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v69, OS_LOG_TYPE_DEFAULT, "In lockdown mode. Excluding location by default in share sheet, which could require format conversions during export.", buf, 2u);
        }

        v45->_excludeLocation = 1;
      }
      if (v45->_excludeCaption)
        v70 = 0;
      else
        v70 = v67;
      v38 = v85;
      if (v70 == 1)
      {
        PLSharingGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v71, OS_LOG_TYPE_DEFAULT, "In lockdown mode. Excluding caption by default in share sheet, which could require format conversions during export.", buf, 2u);
        }

        v45->_excludeCaption = 1;
      }
    }
    else
    {
      v68 = 1;
      v38 = v85;
    }
    if (v64)
    {
      v72 = objc_msgSend(v61, "sendAsAssetBundlesByDefaultWhenSharing");
      p_sendAsAssetBundles = &v45->_sendAsAssetBundles;
      v45->_sendAsAssetBundles = v72;
      v74 = v72 ^ 1 | v68;
      v33 = v83;
      if ((v74 & 1) != 0)
      {
LABEL_55:
        v45->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet = -[PUActivityViewController _calculateAutomaticCMMSendingBehavior](v45, "_calculateAutomaticCMMSendingBehavior");
        -[PUActivityViewController setCompletionWithItemsHandler:](v45, "setCompletionWithItemsHandler:", 0);
        v76 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
        v45->_lastSelectedActivityFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
        v45->_lastSelectedActivityFrame.size = v76;
        v45->_readyForInteraction = 1;
        -[PUActivityViewController _updateSourceControllerPreferredPreparationBehavior](v45, "_updateSourceControllerPreferredPreparationBehavior");
        -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](v45, "_updateSourceControllerSharingPreferencesInAllItems");
        -[PUActivityViewController _updateSharingHeaderIfNeeded](v45, "_updateSharingHeaderIfNeeded");

        v14 = obja;
        v40 = v81;
        v36 = v82;
        goto LABEL_56;
      }
      PLSharingGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v75, OS_LOG_TYPE_DEFAULT, "In lockdown mode. All Photos Data OFF by default.", buf, 2u);
      }

    }
    else
    {
      p_sendAsAssetBundles = &v45->_sendAsAssetBundles;
      v33 = v83;
    }
    *p_sendAsAssetBundles = 0;
    goto LABEL_55;
  }
LABEL_56:

  return v45;
}

- (void)setExcludedActivityTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *MEMORY[0x1E0D7BE48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  if (v4)
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController setExcludedActivityTypes:](&v8, sel_setExcludedActivityTypes_, v7);

}

- (void)setReadyForInteraction:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  if (self->_readyForInteraction != a3)
  {
    v3 = a3;
    self->_readyForInteraction = a3;
    if (!self->_usePhotosStack)
    {
      -[PUActivityViewController photosCarouselViewController](self, "photosCarouselViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "px_descriptionForAssertionMessage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 682, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.photosCarouselViewController"), v9, v10);

        }
      }
      objc_msgSend(v6, "setReadyForInteraction:", v3);

    }
    -[PUActivityViewController _handleShareSheetReadyToInteractCompletion](self, "_handleShareSheetReadyToInteractCompletion");
  }
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  PUActivityViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLShareSheetGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v4 = v7;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "<%@:%p>: dealloc", buf, 0x16u);

  }
  -[PXContentPrivacyController unregisterChangeObserver:context:](self->_privacyControllerForContainerCollection, "unregisterChangeObserver:context:", self, PrivacyControllerObservationContext);
  if (self->_progressController)
    -[PUActivityViewController removeProgressUIAnimated:withDelay:](self, "removeProgressUIAnimated:withDelay:", 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PUActivityViewController _updateTopBorderView](self, "_updateTopBorderView");
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  if (self->_shouldUpdateVisibleItemsWhenReady)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __42__PUActivityViewController_viewDidAppear___block_invoke;
    v7 = &unk_1E58AB2F8;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E0C80D38], &v4);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  -[PUActivityViewController _handleShareSheetReadyToInteractCompletion](self, "_handleShareSheetReadyToInteractCompletion", v4, v5, v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[PUActivityViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PUActivityViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewControllerWillDisappear:", self);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUActivityViewController;
  v4 = a3;
  -[PUActivityViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUActivityViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
}

- (void)_handleShareSheetReadyToInteractCompletion
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD);
  void (**v6)(void);

  if (-[PUActivityViewController isReadyForInteraction](self, "isReadyForInteraction")
    && -[PUActivityViewController _appearState](self, "_appearState") == 2)
  {
    -[PUActivityViewController readyToInteractHandler](self, "readyToInteractHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void (**)(void))objc_msgSend(v3, "copy");

    if (v6)
    {
      -[PUActivityViewController setReadyToInteractHandler:](self, "setReadyToInteractHandler:", 0);
      v6[2]();
    }
    -[PUActivityViewController ppt_readyToInteractHandler](self, "ppt_readyToInteractHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void (**)(_QWORD))objc_msgSend(v4, "copy");

    if (v5)
    {
      -[PUActivityViewController setPpt_readyToInteractHandler:](self, "setPpt_readyToInteractHandler:", 0);
      v5[2](v5);
    }

  }
}

- (NSOrderedSet)assets
{
  return -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
}

- (void)_updateTopBorderView
{
  void *v3;
  UIView *v4;
  UIView *topBorderView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *v14;
  void *v15;

  if (-[PUActivityViewController allowsEmbedding](self, "allowsEmbedding"))
  {
    -[PUActivityViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v3;
    if (!self->_topBorderView)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      topBorderView = self->_topBorderView;
      self->_topBorderView = v4;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.772549033, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_topBorderView, "setBackgroundColor:", v6);

      -[UIView setAutoresizingMask:](self->_topBorderView, "setAutoresizingMask:", 2);
      objc_msgSend(v15, "addSubview:", self->_topBorderView);
      v3 = v15;
    }
    objc_msgSend(v3, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    -[UIView setFrame:](self->_topBorderView, "setFrame:", v8, v10, v12, 1.0 / *(double *)&PUMainScreenScale_screenScale);
    objc_msgSend(v15, "bringSubviewToFront:", self->_topBorderView);

  }
  else
  {
    v13 = self->_topBorderView;
    if (v13)
    {
      -[UIView removeFromSuperview](v13, "removeFromSuperview");
      v14 = self->_topBorderView;
      self->_topBorderView = 0;

    }
  }
}

- (void)_activity:(id)a3 category:(int64_t)a4 didComplete:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PUActivityItemSourceController *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  v11 = 0x1EEB97000uLL;
  if (v5)
  {
    self->_isDismissed = 1;
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BC88]))
    {
      -[PUActivityViewController activity](self, "activity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "px_descriptionForAssertionMessage");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 804, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.activity"), v23, v24);

          v11 = 0x1EEB97000;
        }
      }
      if (objc_msgSend(v12, "destinationSharedAlbumWasCreated"))
      {
        objc_msgSend(v12, "destinationSharedAlbum");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[PUActivityViewController presentingViewController](self, "presentingViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tabBarController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EED12360))
            objc_msgSend(v15, "navigateToRevealAlbum:initiallyHidden:animated:", v13, 1, 1);

        }
      }

    }
  }
  else
  {
    v16 = self->_itemSourceController;
    -[PUActivityItemSourceController publishedURL](v16, "publishedURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        objc_msgSend(v17, "pl_redactedShareURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "Activity failure will expunge moment share URL: %{public}@", buf, 0xCu);

      }
      v25 = v17;
      PXExpungeMomentShareForURL();
      v18 = v25;
    }
    else if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "No moment share URL to expunge for activity %@.", buf, 0xCu);
    }

    objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D7BC88]);
  }
  -[PUActivityViewController _sendCPAnalyticsShareEventWithActivityType:category:didComplete:](self, "_sendCPAnalyticsShareEventWithActivityType:category:didComplete:", v10, a4, v5);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v11 + 2972)), "cleanUpExportedFiles");
  -[PUActivityViewController _cleanUpActivityState](self, "_cleanUpActivityState");

}

- (id)_generateAnalyticsPayloadForSharingEventsToActivityType:(id)a3
{
  void *v4;
  objc_class *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[8];
  _QWORD v24[10];

  v24[8] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E08];
  v23[0] = *MEMORY[0x1E0D09830];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v23[1] = CFSTR("excludeLiveness");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUActivityViewController excludeLiveness](self, "excludeLiveness"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v19;
  v23[2] = CFSTR("excludeLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUActivityViewController excludeLocation](self, "excludeLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v23[3] = CFSTR("hasPublishedURL");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PUActivityItemSourceController publishedURL](self->_itemSourceController, "publishedURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v9, "length") != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v10;
  v23[4] = CFSTR("sendAsOriginals");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v11;
  v23[5] = CFSTR("shareAsCMM");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUActivityViewController shareAsCMM](self, "shareAsCMM"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  v23[6] = CFSTR("preparedAsCloudLink");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preparedAsCloudLink);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v13;
  v23[7] = CFSTR("shouldAutomaticallyUseCMMInMessagesIfThresholdMet");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUActivityViewController shouldAutomaticallyUseCMMInMessagesIfThresholdMet](self, "shouldAutomaticallyUseCMMInMessagesIfThresholdMet"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D09828]);
  if (objc_msgSend(v22, "length"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("activityType"));

  return v16;
}

- (void)_sendCPAnalyticsShareEventWithActivityType:(id)a3 category:(int64_t)a4 didComplete:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  -[PUActivityViewController _generateAnalyticsPayloadForSharingEventsToActivityType:](self, "_generateAnalyticsPayloadForSharingEventsToActivityType:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = (id)*MEMORY[0x1E0D09730];
  }
  else
  {
    v8 = (id)*MEMORY[0x1E0D09728];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSuccessfullyPrepareAssets);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("didSuccessfullyPrepareAssets"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("activityCategory"));

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v8, v11);
  -[PUActivityViewController _sendCPAnalyticsShareEventForMultipleSelectionShare](self, "_sendCPAnalyticsShareEventForMultipleSelectionShare");

}

- (void)_sendCPAnalyticsShareEventForMultipleSelectionShare
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PUActivityItemSourceController assetItems](self->_itemSourceController, "assetItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 0xA)
  {
    -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = *MEMORY[0x1E0D09828];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x1E0D09910];
          v18 = v9;
          v19 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetSharedStandardSelectionSize"), v13);

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }

  }
}

- (void)_sendCPAnalyticsAssetExportPreparationEventWithActivityType:(id)a3 didComplete:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id *v9;
  id v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  id v14;

  v5 = a4;
  v14 = a5;
  -[PUActivityViewController _generateAnalyticsPayloadForSharingEventsToActivityType:](self, "_generateAnalyticsPayloadForSharingEventsToActivityType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Share Sheet"), CFSTR("assetExportPreparationSource"));
  if (v5)
  {
    v9 = (id *)MEMORY[0x1E0D096D0];
LABEL_7:
    v10 = *v9;
    goto LABEL_10;
  }
  if (!v14)
  {
    v9 = (id *)MEMORY[0x1E0D096C8];
    goto LABEL_7;
  }
  v10 = (id)*MEMORY[0x1E0D096D8];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D09838]);
  v11 = +[PUSharingErrorPresentationController sharingErrorTypeFromError:](PUSharingErrorPresentationController, "sharingErrorTypeFromError:", v14);
  if (v11 > 9)
    v12 = CFSTR("Unknown");
  else
    v12 = off_1E589DAB0[v11];
  v13 = v12;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("assetExportPreparationErrorType"));

LABEL_10:
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v10, v8);

}

- (void)_handleUserCancelWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[PUActivityViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "activityViewControllerShouldCancelAfterPreparationCanceled:", self))
    -[PUActivityViewController _cancel](self, "_cancel");
  if (v6)
    v6[2]();

}

- (void)_showRemakerProgressView:(id)a3 forMail:(BOOL)a4 withCancelationHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUPhotosSharingProgressOverlay *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  id location;

  v9 = a3;
  v10 = a5;
  -[PUActivityViewController _removeRemakerProgressView](self, "_removeRemakerProgressView");
  objc_storeStrong((id *)&self->_remakerProgressView, a3);
  objc_msgSend(v9, "setShowsCancelButton:", 1);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __84__PUActivityViewController__showRemakerProgressView_forMail_withCancelationHandler___block_invoke;
  v16 = &unk_1E589D778;
  v11 = v10;
  v17 = v11;
  v19 = a4;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v9, "setCancelationHandler:", &v13);
  v12 = objc_alloc_init(PUPhotosSharingProgressOverlay);
  -[PUPhotosSharingProgressOverlay addProgressView:](v12, "addProgressView:", v9, v13, v14, v15, v16);
  -[PUPhotosSharingProgressOverlay setShowing:animated:](v12, "setShowing:animated:", 1, 1);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_removeRemakerProgressView
{
  PLProgressView *remakerProgressView;

  -[PLProgressView removeFromSuperview](self->_remakerProgressView, "removeFromSuperview");
  remakerProgressView = self->_remakerProgressView;
  self->_remakerProgressView = 0;

}

- (void)removeProgressUIAnimated:(BOOL)a3 withDelay:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[PUActivityViewController progressController](self, "progressController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hideAnimated:allowDelay:", v5, v4);

  -[PUActivityViewController setProgressController:](self, "setProgressController:", 0);
}

- (void)showProgressUIAnimated:(BOOL)a3 withDelay:(BOOL)a4 cancellationHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[PUActivityViewController removeProgressUIAnimated:withDelay:](self, "removeProgressUIAnimated:withDelay:", 0, 0);
  v9 = objc_alloc_init(MEMORY[0x1E0D7B158]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PUActivityViewController_showProgressUIAnimated_withDelay_cancellationHandler___block_invoke;
  v13[3] = &unk_1E58ABAC8;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "setCancellationHandler:", v13);
  -[PUActivityViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWindow:", v12);
  objc_msgSend(v9, "showAnimated:allowDelay:", v6, v5);
  -[PUActivityViewController setProgressController:](self, "setProgressController:", v9);
  -[PUActivityViewController updateProgressUITitle](self, "updateProgressUITitle");

}

- (void)updateProgressUITitle
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  PULocalizedString(CFSTR("SHARING_PREPARATION_TITLE"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PUActivityItemSourceController state](self->_itemSourceController, "state") == 1)
  {
    PULocalizedString(CFSTR("SHARING_DOWNLOADING_TITLE"));
    v3 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v3;
  }
  -[PUActivityViewController progressController](self, "progressController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  if ((v5 & 1) == 0)
  {
    -[PUActivityViewController progressController](self, "progressController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

  }
}

- (void)_showSharingWasInterruptedForErrors:(id)a3 withIndividualAssets:(id)a4 itemSourcesByAssetUUID:(id)a5 toActivityType:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  PUSharingErrorPresentationController *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  id v34;
  __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v39 = a5;
  v40 = a6;
  v34 = a7;
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v12;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Share Sheet: Will show \"Unable to share\" dialogue. Reported errors: %{public}@", buf, 0xCu);
  }

  v38 = (void *)MEMORY[0x1E0CB3940];
  v37 = objc_msgSend(v13, "count");
  if (self->_shareAsCMM)
    v15 = CFSTR("iCloud Link");
  else
    v15 = CFSTR("Individual Items");
  v36 = v15;
  if (self->_sendAsUnmodifiedOriginals)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v35 = v16;
  v17 = v12;
  if (self->_preparedAsCloudLink)
    v18 = CFSTR("iCloud Link");
  else
    v18 = CFSTR("Individual Items");
  if (self->_excludeLocation)
    v19 = CFSTR("NO");
  else
    v19 = CFSTR("YES");
  v20 = v19;
  if (self->_excludeCaption)
    v21 = CFSTR("NO");
  else
    v21 = CFSTR("YES");
  v22 = v21;
  if (self->_excludeAccessibilityDescription)
    v23 = CFSTR("NO");
  else
    v23 = CFSTR("YES");
  v24 = v23;
  if (self->_sendAsAssetBundles)
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v26 = v25;
  v33 = v18;
  v27 = v17;
  v28 = v13;
  objc_msgSend(v38, "stringWithFormat:", CFSTR("Sharing %ld assets to activity type: %@\nOptions:\nSend As: %@\nExport Unmodified Originals: %@\n(Prepared As: %@)\nInclude Location: %@\nInclude Caption: %@\nInclude Accessibility Description: %@\nAll Photos Data: %@\n\n"), v37, v40, v36, v35, v33, v20, v22, v24, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v30 = -[PUSharingErrorPresentationController initWithErrors:forAssets:fromSource:preparationType:]([PUSharingErrorPresentationController alloc], "initWithErrors:forAssets:fromSource:preparationType:", v27, v13, 0, self->_preparedAsCloudLink);
  -[PUSharingErrorPresentationController setItemSourcesByAssetUUID:](v30, "setItemSourcesByAssetUUID:", v39);
  -[PUErrorPresentationController setRadarDescription:](v30, "setRadarDescription:", v29);
  -[PUErrorPresentationController setRadarComponentID:name:version:](v30, "setRadarComponentID:name:version:", CFSTR("512768"), CFSTR("Photos Backend (New Bugs)"), CFSTR("all"));
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __134__PUActivityViewController__showSharingWasInterruptedForErrors_withIndividualAssets_itemSourcesByAssetUUID_toActivityType_completion___block_invoke;
  v41[3] = &unk_1E58A4AC8;
  objc_copyWeak(&v43, (id *)buf);
  v31 = v34;
  v42 = v31;
  -[PUErrorPresentationController alertControllerWithCompletion:](v30, "alertControllerWithCompletion:", v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v32, 1, 0);

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);

}

- (void)_prepareAssetsForActivity:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  self->_isPreparingAssets = 1;
  self->_didSuccessfullyPrepareAssets = 0;
  if (-[PUActivityViewController shareAsCMM](self, "shareAsCMM") || v4)
  {
    self->_preparedAsCloudLink = 1;
  }
  else
  {
    objc_msgSend(v7, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_preparedAsCloudLink = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D7BCC0]);

  }
  -[PUActivityItemSourceController configureItemSourcesForActivityIfNeeded:forcePreparationAsMomentShareLink:](self->_itemSourceController, "configureItemSourcesForActivityIfNeeded:forcePreparationAsMomentShareLink:", v7, v4);

}

- (void)_presentConfidentialityWarningIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityCheckRequired"))
    goto LABEL_5;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "needsConfidentialityCheckForActivityType:", v9);

  if (!(_DWORD)v8)
    goto LABEL_5;
  v10 = (void *)MEMORY[0x1E0D7B978];
  -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "confidentialWarningRequiredForAssets:", v12);

  if ((_DWORD)v10)
  {
    v13 = (void *)MEMORY[0x1E0D7B978];
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E58AB6C0;
    v22 = v7;
    v16 = v14;
    v17 = 3221225472;
    v18 = __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke_2;
    v19 = &unk_1E58AB6C0;
    v20 = v22;
    objc_msgSend(v13, "confidentialityAlertWithConfirmAction:abortAction:", v21, &v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v15, 1, 0, v16, v17, v18, v19);

  }
  else
  {
LABEL_5:
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

- (void)mailActivity:(id)a3 displayVideoRemakerProgressView:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PUActivityViewController_mailActivity_displayVideoRemakerProgressView___block_invoke;
  v8[3] = &unk_1E58ABD10;
  v9 = v6;
  v7 = v6;
  -[PUActivityViewController _showRemakerProgressView:forMail:withCancelationHandler:](self, "_showRemakerProgressView:forMail:withCancelationHandler:", a4, 1, v8);

}

- (void)_sharingManagerDidBeginPublishing:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  +[PUPhotoSharingManager sharedInstance](PUPhotoSharingManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishingProgressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PUActivityViewController__sharingManagerDidBeginPublishing___block_invoke;
  v7[3] = &unk_1E58ABD10;
  v8 = v4;
  v6 = v4;
  -[PUActivityViewController _showRemakerProgressView:forMail:withCancelationHandler:](self, "_showRemakerProgressView:forMail:withCancelationHandler:", v5, 0, v7);

}

- (void)_cleanUpActivityState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PUActivityViewController photosActivities](self, "photosActivities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "tearDownForCompletion");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)addAssetItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  PUActivityViewController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isPreparingAssets)
  {
    PLShareSheetGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412802;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      v6 = v8;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to add an activity asset item:%@ while we are in the middle of preparing the assets", (uint8_t *)&v7, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v4, "setExcludeLocation:", -[PUActivityViewController excludeLocation](self, "excludeLocation"));
    -[PUActivityItemSourceController addAssetItem:](self->_itemSourceController, "addAssetItem:", v4);
    -[PUActivityViewController updateVisibleShareActionsIfNeeded](self, "updateVisibleShareActionsIfNeeded");
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
  }

}

- (void)removeAssetItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  PUActivityViewController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isPreparingAssets)
  {
    PLShareSheetGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412802;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      v6 = v8;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to remove an activity asset item:%@ while we are in the middle of preparing the assets", (uint8_t *)&v7, 0x20u);

    }
  }
  else
  {
    -[PUActivityItemSourceController removeAssetItem:](self->_itemSourceController, "removeAssetItem:", v4);
    -[PUActivityViewController updateVisibleShareActionsIfNeeded](self, "updateVisibleShareActionsIfNeeded");
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
  }

}

- (void)replaceAssetItem:(id)a3 withAssetItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  PUActivityViewController *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_isPreparingAssets)
  {
    PLShareSheetGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138413058;
      v11 = (id)objc_opt_class();
      v12 = 2048;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v9 = v11;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to replace an activity asset item:%@ with %@ while we are in the middle of preparing the assets", (uint8_t *)&v10, 0x2Au);

    }
  }
  else
  {
    -[PUActivityItemSourceController removeAssetItem:](self->_itemSourceController, "removeAssetItem:", v6);
    -[PUActivityItemSourceController addAssetItem:](self->_itemSourceController, "addAssetItem:", v7);
    -[PUActivityViewController updateVisibleShareActionsIfNeeded](self, "updateVisibleShareActionsIfNeeded");
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
  }

}

- (void)setAssetItems:(id)a3
{
  id v4;
  PUActivityItemSourceController *itemSourceController;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  PUActivityItemSourceController *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  PUActivityViewController *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  itemSourceController = self->_itemSourceController;
  if (self->_isPreparingAssets)
  {
    -[PUActivityItemSourceController assetItems](itemSourceController, "assetItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      PLShareSheetGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_opt_class();
        v10 = self->_itemSourceController;
        v11 = v9;
        -[PUActivityItemSourceController assetItems](v10, "assetItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138413058;
        v14 = v9;
        v15 = 2048;
        v16 = self;
        v17 = 2048;
        v18 = objc_msgSend(v12, "count");
        v19 = 2048;
        v20 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to set different activity asset items: (%ld items to %ld items) while we are in the middle of preparing the assets", (uint8_t *)&v13, 0x2Au);

      }
    }
  }
  else
  {
    -[PUActivityItemSourceController setAssetItems:](itemSourceController, "setAssetItems:", v4);
    -[PUActivityViewController updateVisibleShareActionsIfNeeded](self, "updateVisibleShareActionsIfNeeded");
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
  }

}

- (void)updateVisibleShareActionsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  if (self->_isDismissed || !-[PUActivityViewController isReadyForInteraction](self, "isReadyForInteraction"))
  {
    self->_shouldUpdateVisibleItemsWhenReady = 1;
  }
  else
  {
    -[PUActivityItemSourceController activityItems](self->_itemSourceController, "activityItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (self->_linkPresentation)
    {
      v6 = v3;
      objc_msgSend(v3, "arrayByAddingObject:");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    v7 = v4;
    -[PUActivityViewController _updateActivityItems:](self, "_updateActivityItems:", v4);

  }
}

- (void)_handlePostReadyToInteractUpdatesIfNeeded
{
  if (self->_shouldUpdateVisibleItemsWhenReady
    && -[PUActivityViewController isReadyForInteraction](self, "isReadyForInteraction")
    && -[PUActivityViewController _appearState](self, "_appearState") == 2)
  {
    self->_shouldUpdateVisibleItemsWhenReady = 0;
    -[PUActivityViewController updateVisibleShareActionsIfNeeded](self, "updateVisibleShareActionsIfNeeded");
  }
}

- (void)setPhotosCarouselViewController:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController setPhotosCarouselViewController:](&v10, sel_setPhotosCarouselViewController_, a3);
  if (!self->_usePhotosStack)
  {
    -[PUActivityViewController photosCarouselViewController](self, "photosCarouselViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "px_descriptionForAssertionMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1180, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.photosCarouselViewController"), v8, v9);

      }
    }
    objc_msgSend(v5, "setSendAsAssetBundles:", -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles"));

  }
  -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
}

- (void)_updateSourceControllerPreferredPreparationBehavior
{
  uint64_t shareAsCMM;
  unint64_t v4;
  _BOOL4 v5;

  shareAsCMM = self->_shareAsCMM;
  v4 = -[PUActivityItemSourceController preferredPreparationType](self->_itemSourceController, "preferredPreparationType");
  v5 = -[PUActivityItemSourceController shouldUseMomentShareLinkInMessagesIfThresholdMet](self->_itemSourceController, "shouldUseMomentShareLinkInMessagesIfThresholdMet");
  if (v4 != shareAsCMM || self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet != v5)
  {
    -[PUActivityItemSourceController setPreferredPreparationType:](self->_itemSourceController, "setPreferredPreparationType:", shareAsCMM);
    -[PUActivityItemSourceController setShouldUseMomentShareLinkInMessagesIfThresholdMet:](self->_itemSourceController, "setShouldUseMomentShareLinkInMessagesIfThresholdMet:", self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet);
    -[PUActivityViewController updateVisibleShareActionsIfNeeded](self, "updateVisibleShareActionsIfNeeded");
  }
}

- (void)_updateSourceControllerSharingPreferencesInAllItems
{
  int v3;
  int excludeLiveness;
  _BOOL4 v5;
  int v6;
  int excludeLocation;
  int v8;
  int excludeCaption;
  int v10;
  int excludeAccessibilityDescription;
  int v12;
  int sendAsAssetBundles;
  int v14;
  int sendAsUnmodifiedOriginals;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  PUActivityViewController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[PUActivityItemSourceController shouldExcludeLivenessInAllItemSources](self->_itemSourceController, "shouldExcludeLivenessInAllItemSources");
  excludeLiveness = self->_excludeLiveness;
  v5 = excludeLiveness != v3;
  if (excludeLiveness != v3)
    -[PUActivityItemSourceController setShouldExcludeLivenessInAllItemSources:](self->_itemSourceController, "setShouldExcludeLivenessInAllItemSources:", excludeLiveness != 0);
  v6 = -[PUActivityItemSourceController shouldExcludeLocationInAllItemSources](self->_itemSourceController, "shouldExcludeLocationInAllItemSources");
  excludeLocation = self->_excludeLocation;
  if (excludeLocation != v6)
  {
    -[PUActivityItemSourceController setShouldExcludeLocationInAllItemSources:](self->_itemSourceController, "setShouldExcludeLocationInAllItemSources:", excludeLocation != 0);
    v5 = 1;
  }
  v8 = -[PUActivityItemSourceController shouldExcludeCaptionInAllItemSources](self->_itemSourceController, "shouldExcludeCaptionInAllItemSources");
  excludeCaption = self->_excludeCaption;
  if (excludeCaption != v8)
  {
    -[PUActivityItemSourceController setShouldExcludeCaptionInAllItemSources:](self->_itemSourceController, "setShouldExcludeCaptionInAllItemSources:", excludeCaption != 0);
    v5 = 1;
  }
  v10 = -[PUActivityItemSourceController shouldExcludeAccessibilityDescriptionInAllItemSources](self->_itemSourceController, "shouldExcludeAccessibilityDescriptionInAllItemSources");
  excludeAccessibilityDescription = self->_excludeAccessibilityDescription;
  if (excludeAccessibilityDescription != v10)
  {
    -[PUActivityItemSourceController setShouldExcludeAccessibilityDescriptionInAllItemSources:](self->_itemSourceController, "setShouldExcludeAccessibilityDescriptionInAllItemSources:", excludeAccessibilityDescription != 0);
    v5 = 1;
  }
  v12 = -[PUActivityItemSourceController shouldShareAsAssetBundles](self->_itemSourceController, "shouldShareAsAssetBundles");
  sendAsAssetBundles = self->_sendAsAssetBundles;
  if (sendAsAssetBundles != v12)
  {
    -[PUActivityItemSourceController setShouldShareAsAssetBundles:](self->_itemSourceController, "setShouldShareAsAssetBundles:", sendAsAssetBundles != 0);
    v5 = 1;
  }
  v14 = -[PUActivityItemSourceController shouldShareAsUnmodifiedOriginals](self->_itemSourceController, "shouldShareAsUnmodifiedOriginals");
  sendAsUnmodifiedOriginals = self->_sendAsUnmodifiedOriginals;
  if (sendAsUnmodifiedOriginals != v14)
  {
    -[PUActivityItemSourceController setShouldShareAsUnmodifiedOriginals:](self->_itemSourceController, "setShouldShareAsUnmodifiedOriginals:", sendAsUnmodifiedOriginals != 0);
    v5 = 1;
  }
  if (-[PUActivityItemSourceController preferredExportFormat](self->_itemSourceController, "preferredExportFormat") == self->_preferredExportFormat)
  {
    if (!v5)
      return;
  }
  else
  {
    -[PUActivityItemSourceController setPreferredExportFormat:](self->_itemSourceController, "setPreferredExportFormat:");
  }
  PLShareSheetGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = (id)objc_opt_class();
    v20 = 2048;
    v21 = self;
    v17 = v19;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Reloading asset items, due to a change in share sheet metadata options", (uint8_t *)&v18, 0x16u);

  }
  -[PUActivityViewController _reloadAssetItems](self, "_reloadAssetItems");
}

- (void)_reloadAssetItems
{
  id v3;
  id v4;

  -[PUActivityItemSourceController assetItems](self->_itemSourceController, "assetItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  -[PUActivityViewController setAssetItems:](self, "setAssetItems:", v3);

  -[PUActivityViewController setAssetItems:](self, "setAssetItems:", v4);
}

- (void)setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:(BOOL)a3
{
  if (self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet != a3)
  {
    self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet = a3;
    -[PUActivityViewController _updateSourceControllerPreferredPreparationBehavior](self, "_updateSourceControllerPreferredPreparationBehavior");
  }
}

- (void)setShareAsCMM:(BOOL)a3
{
  if (self->_shareAsCMM != a3)
  {
    self->_shareAsCMM = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    -[PUActivityViewController _updateSourceControllerPreferredPreparationBehavior](self, "_updateSourceControllerPreferredPreparationBehavior");
  }
}

- (void)setPreferredExportFormat:(int64_t)a3
{
  if (self->_preferredExportFormat != a3)
  {
    self->_preferredExportFormat = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (void)setExcludeLiveness:(BOOL)a3
{
  if (self->_excludeLiveness != a3)
  {
    self->_excludeLiveness = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (void)setExcludeLocation:(BOOL)a3
{
  if (self->_excludeLocation != a3)
  {
    self->_excludeLocation = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (void)setExcludeCaption:(BOOL)a3
{
  if (self->_excludeCaption != a3)
  {
    self->_excludeCaption = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (void)setExcludeAccessibilityDescription:(BOOL)a3
{
  if (self->_excludeAccessibilityDescription != a3)
  {
    self->_excludeAccessibilityDescription = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (void)setSendAsAssetBundles:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (self->_sendAsAssetBundles != a3)
  {
    self->_sendAsAssetBundles = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    if (!self->_usePhotosStack)
    {
      -[PUActivityViewController photosCarouselViewController](self, "photosCarouselViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "px_descriptionForAssertionMessage");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1329, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.photosCarouselViewController"), v8, v9);

        }
        objc_msgSend(v5, "setSendAsAssetBundles:", self->_sendAsAssetBundles);
      }

    }
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (void)setSendAsUnmodifiedOriginals:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (self->_sendAsUnmodifiedOriginals != a3)
  {
    self->_sendAsUnmodifiedOriginals = a3;
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    if (!self->_usePhotosStack)
    {
      -[PUActivityViewController photosCarouselViewController](self, "photosCarouselViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "px_descriptionForAssertionMessage");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1346, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.photosCarouselViewController"), v8, v9);

        }
        objc_msgSend(v5, "setSendAsUnmodifiedOriginals:", self->_sendAsUnmodifiedOriginals);
      }

    }
    -[PUActivityViewController _updateSourceControllerSharingPreferencesInAllItems](self, "_updateSourceControllerSharingPreferencesInAllItems");
  }
}

- (BOOL)_canShowSendAsAssetBundlesSwitchInObjectManipulationHeader
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXCMMHasSendAndReceiveCapabilities()
    && objc_msgSend(v3, "showSendAsAssetBundlesForCMM")
    && -[PUActivityViewController shareAsCMM](self, "shareAsCMM"))
  {
    LOBYTE(v5) = 1;
  }
  else if (objc_msgSend(v3, "showSendAsAssetBundlesForIndividualItems"))
  {
    v5 = !-[PUActivityViewController shareAsCMM](self, "shareAsCMM");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateSharingHeaderIfNeeded
{
  PUSharingHeaderController *v4;
  PUSharingHeaderController *sharingHeaderController;
  void *v6;
  void *v7;
  void *v8;

  if ((PLIsMobileSlideShow() & 1) != 0
    || (PLIsCamera() & 1) != 0
    || (PLIsPhotosMessagesApp() & 1) != 0
    || (PLIsSpotlight() & 1) != 0
    || PLIsPreferences())
  {
    if (!self->_sharingHeaderController)
    {
      v4 = -[PUSharingHeaderController initWithDataProvider:]([PUSharingHeaderController alloc], "initWithDataProvider:", self);
      sharingHeaderController = self->_sharingHeaderController;
      self->_sharingHeaderController = v4;

    }
    -[PUActivityViewController photosHeaderMetadata](self, "photosHeaderMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PUSharingHeaderController linkMetadata](self->_sharingHeaderController, "linkMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("linkMetadata"));

      }
      -[PUActivityViewController setPhotosHeaderMetadata:](self, "setPhotosHeaderMetadata:", v7);

    }
    -[PUSharingHeaderController updateIfNeeded](self->_sharingHeaderController, "updateIfNeeded");
  }
}

- (BOOL)isActionSheet
{
  void *v2;
  char v3;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActionSheet");

  return v3;
}

- (PXAssetMediaTypeCount)assetTypeCount
{
  PXAssetMediaTypeCount *result;

  retstr->var8 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = (PXAssetMediaTypeCount *)self->_itemSourceController;
  if (result)
    return (PXAssetMediaTypeCount *)-[PXAssetMediaTypeCount requestAssetsMediaTypeCount](result, "requestAssetsMediaTypeCount");
  return result;
}

- (void)_sharingStyleDidChangeToExpanded:(id)a3
{
  id v3;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_401);

}

- (PXDisplayAsset)keyAsset
{
  void *v2;
  void *v3;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAsset *)v3;
}

- (PHPerson)person
{
  void *v2;
  void *v3;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPerson *)v3;
}

- (NSOrderedSet)orderedSelectedAssets
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActionSheet");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedSelectedAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSOrderedSet *)v5;
}

- (int64_t)sourceOrigin
{
  void *v2;
  int64_t v3;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceOrigin");

  return v3;
}

- (NSString)localizedTitle
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _BOOL4 usePhotosStack;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActionSheet");

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v9, "addObject:", v10);
    usePhotosStack = self->_usePhotosStack;
    -[PUActivityViewController photosCarouselViewController](self, "photosCarouselViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (usePhotosStack)
    {
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "px_descriptionForAssertionMessage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1439, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.photosCarouselViewController"), v21, v22);

        }
      }
      objc_msgSend(v13, "assetFetchResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PXMediaTypeForAssets();
      objc_msgSend(v14, "count");
      PXLocalizedSelectionMessageForAssetsCount();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "px_descriptionForAssertionMessage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1444, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.photosCarouselViewController"), v25, v26);

        }
      }
      objc_msgSend(v13, "localizedSelectionTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (objc_msgSend(v15, "length"))
      objc_msgSend(v9, "addObject:", v15);
    PULocalizedString(CFSTR("SHARING_HEADER_TITLE_SEPARATOR"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v17;
  }

  return (NSString *)v8;
}

- (NSString)localizedSubtitle
{
  void *v2;
  void *v3;

  -[PUActivityViewController sharingViewModel](self, "sharingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_calculateAutomaticCMMSendingBehavior
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  int v9;
  char v10;
  BOOL v11;
  void *v12;
  char v13;

  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cmmShareSheetBehavior");
  v5 = -[PUActivityViewController preferredExportFormat](self, "preferredExportFormat");
  v6 = -[PUActivityViewController excludeCaption](self, "excludeCaption")
    || -[PUActivityViewController excludeAccessibilityDescription](self, "excludeAccessibilityDescription");
  v7 = -[PUActivityViewController sendAsUnmodifiedOriginals](self, "sendAsUnmodifiedOriginals");
  -[PUActivityViewController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PXCMMHasSendAndReceiveCapabilities();

  v10 = 0;
  if (v9)
  {
    v11 = (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL || v5 == 2;
    if (!v11 && !v6 && !v7)
    {
      if (objc_msgSend(v3, "disableShareSheetAutomaticBehaviorIfADPEnabled"))
      {
        -[PUActivityViewController photoLibrary](self, "photoLibrary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isWalrusEnabled");

        v10 = v13 ^ 1;
      }
      else
      {
        v10 = 1;
      }
    }
  }

  return v10;
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;

  -[PUActivityItemSourceController assetItems](self->_itemSourceController, "assetItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = !-[PUActivityViewController isActionSheet](self, "isActionSheet");
  return v5 && v6;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  void *v4;
  void *v5;
  PUActivityItemSourceController *itemSourceController;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  void *v63;
  _BOOL8 v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL8 v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  _BOOL8 v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  _BOOL4 v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  BOOL v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD v121[4];
  id v122;
  id location;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[2];
  _QWORD v134[4];

  v134[1] = *MEMORY[0x1E0C80C00];
  v99 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = 0;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  itemSourceController = self->_itemSourceController;
  if (itemSourceController)
    -[PUActivityItemSourceController requestAssetsMediaTypeCount](itemSourceController, "requestAssetsMediaTypeCount");
  PXMediaTypeForAssets();
  v100 = -[PUActivityViewController _canShowSendAsAssetBundlesSwitchInObjectManipulationHeader](self, "_canShowSendAsAssetBundlesSwitchInObjectManipulationHeader");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *((_QWORD *)&v125 + 1);
  v9 = objc_msgSend(v4, "showGlobalLivenessExclusionSwitch");
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  if (v10 == 1)
  {
    if (v8 == 1)
      v11 = CFSTR("SHARING_OPTIONS_LIVE_PHOTO_TITLE");
    else
      v11 = CFSTR("SHARING_OPTIONS_LIVE_PHOTO_TITLE_MULTIPLE");
    PULocalizedString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D96D60];
    v14 = -[PUActivityViewController excludeLiveness](self, "excludeLiveness");
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke;
    v121[3] = &unk_1E589B7A0;
    objc_copyWeak(&v122, &location);
    objc_msgSend(v13, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v12, CFSTR("SHARING_OPTIONS_LIVE_PHOTO"), 0, !v14, v121);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v15);

    objc_destroyWeak(&v122);
  }
  v16 = *((_QWORD *)&v126 + 1);
  v17 = objc_msgSend(v4, "showGlobalLocationExclusionSwitch");
  if (v16)
    v18 = v17;
  else
    v18 = 0;
  if (v18 == 1)
  {
    v19 = -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles");
    v20 = (void *)MEMORY[0x1E0D96D60];
    PULocalizedString(CFSTR("SHARING_OPTIONS_LOCATION_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v22 = 1;
    else
      v22 = -[PUActivityViewController excludeLocation](self, "excludeLocation") ^ 1;
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_2;
    v119[3] = &unk_1E589B7A0;
    objc_copyWeak(&v120, &location);
    objc_msgSend(v20, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v21, CFSTR("SHARING_OPTIONS_LOCATION_TITLE"), 0, v22, v119);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setEnabled:", !v19);
    if (v19)
      -[PUActivityViewController setExcludeLocation:](self, "setExcludeLocation:", 0);
    objc_msgSend(v7, "addObject:", v23);

    objc_destroyWeak(&v120);
  }
  if (*((_QWORD *)&v127 + 1))
  {
    if (-[PUActivityViewController shareAsCMM](self, "shareAsCMM"))
      v24 = 0;
    else
      v24 = -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles") ^ 1;
    v25 = (void *)MEMORY[0x1E0D96D60];
    PULocalizedString(CFSTR("SHARING_OPTIONS_CAPTION_TITLE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v24)
      v27 = -[PUActivityViewController excludeCaption](self, "excludeCaption") ^ 1;
    else
      v27 = 1;
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_3;
    v117[3] = &unk_1E589B7A0;
    objc_copyWeak(&v118, &location);
    objc_msgSend(v25, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v26, CFSTR("SHARING_OPTIONS_CAPTION_TITLE"), 0, v27, v117);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setEnabled:", v24);
    if ((v24 & 1) == 0)
      -[PUActivityViewController setExcludeCaption:](self, "setExcludeCaption:", 0);
    objc_msgSend(v7, "addObject:", v28);

    objc_destroyWeak(&v118);
  }
  if (v128)
  {
    if (-[PUActivityViewController shareAsCMM](self, "shareAsCMM"))
      v29 = 0;
    else
      v29 = -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles") ^ 1;
    v30 = (void *)MEMORY[0x1E0D96D60];
    PULocalizedString(CFSTR("SHARING_OPTIONS_ACCESSIBILITY_DESCRIPTION_TITLE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v29)
      v32 = -[PUActivityViewController excludeAccessibilityDescription](self, "excludeAccessibilityDescription") ^ 1;
    else
      v32 = 1;
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_4;
    v115[3] = &unk_1E589B7A0;
    objc_copyWeak(&v116, &location);
    objc_msgSend(v30, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v31, CFSTR("SHARING_OPTIONS_ACCESSIBILITY_DESCRIPTION_TITLE"), 0, v32, v115);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "setEnabled:", v29);
    if ((v29 & 1) == 0)
      -[PUActivityViewController setExcludeAccessibilityDescription:](self, "setExcludeAccessibilityDescription:", 0);
    objc_msgSend(v7, "addObject:", v33);

    objc_destroyWeak(&v116);
  }
  if (!-[PUActivityViewController sendAsUnmodifiedOriginals](self, "sendAsUnmodifiedOriginals")
    && objc_msgSend(v7, "count"))
  {
    v34 = objc_alloc(MEMORY[0x1E0D96D68]);
    PULocalizedString(CFSTR("SHARING_OPTIONS_DATA_CUSTOMIZATIONS_GROUP_TITLE"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "_initGroupWithName:identifier:customizations:", v35, CFSTR("SHARING_OPTIONS_DATA_CUSTOMIZATIONS_GROUP"), v7);

    objc_msgSend(v103, "addObject:", v36);
  }
  if (!-[PUActivityViewController sendAsUnmodifiedOriginals](self, "sendAsUnmodifiedOriginals"))
  {
    v37 = -[PUActivityViewController preferredExportFormat](self, "preferredExportFormat");
    if (v37 == 2)
      v38 = 2;
    else
      v38 = v37 == 1;
    v39 = -[PUActivityViewController shareAsCMM](self, "shareAsCMM");
    if (v39)
    {
      PULocalizedString(CFSTR("SHARING_OPTIONS_FORMAT_FOOTER_TEXT_CURRENT_CMM"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 1;
    }
    else
    {
      PXLocalizedString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("SHARING_OPTIONS_FORMAT_AUTOMATIC"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v42);

    PULocalizedString(CFSTR("SHARING_OPTIONS_FORMAT_CURRENT"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v43);

    PULocalizedString(CFSTR("SHARING_OPTIONS_FORMAT_COMPATIBLE"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v44);

    v45 = (void *)MEMORY[0x1E0D96D60];
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_5;
    v113[3] = &unk_1E589B7C8;
    objc_copyWeak(&v114, &location);
    objc_msgSend(v45, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("SHARING_OPTIONS_FORMAT_PICKER"), v41, v38, v40, v113);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setEnabled:", !v39);
    v47 = objc_alloc(MEMORY[0x1E0D96D68]);
    PULocalizedString(CFSTR("SHARING_OPTIONS_FORMAT_GROUP_TITLE"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v47, "_initGroupWithName:identifier:customizations:", v48, CFSTR("SHARING_OPTIONS_FORMAT_GROUP"), v49);

    objc_msgSend(v103, "addObject:", v50);
    objc_destroyWeak(&v114);

  }
  -[PUActivityViewController photoLibrary](self, "photoLibrary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PXCMMHasSendAndReceiveCapabilities() & 1) != 0)
  {
    v52 = -[PUActivityItemSourceController itemSourcesSupportMomentShareLinkCreation](self->_itemSourceController, "itemSourcesSupportMomentShareLinkCreation");

    if (v52)
    {
      v53 = objc_msgSend(v101, "cmmShareSheetBehavior");
      v54 = v53 == 1;
      if (objc_msgSend(v101, "cmmShareSheetBehavior") == 1)
      {
        objc_msgSend(v102, "count");
        PXLocalizationKeyForMediaType();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53 == 1)
        {
          PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_AUTOMATIC"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v56);

        }
        PULocalizedString(v98);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v133[0] = v57;
        PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_CMM"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v133[1] = v58;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObjectsFromArray:", v59);

        if (-[PUActivityViewController shouldAutomaticallyUseCMMInMessagesIfThresholdMet](self, "shouldAutomaticallyUseCMMInMessagesIfThresholdMet"))
        {
          v60 = 0;
        }
        else
        {
          v90 = -[PUActivityViewController shareAsCMM](self, "shareAsCMM");
          if (v53 == 1)
            v60 = v90 + 1;
          else
            v60 = v90;
        }
        PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_GROUP_FOOTER_TEXT"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)MEMORY[0x1E0D96D60];
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_6;
        v110[3] = &unk_1E589B7F0;
        objc_copyWeak(&v111, &location);
        v112 = v54;
        objc_msgSend(v92, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("SHARING_OPTIONS_SEND_AS_PICKER"), v55, v60, v91, v110);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_alloc(MEMORY[0x1E0D96D68]);
        PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_GROUP_TITLE"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = v93;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = (void *)objc_msgSend(v94, "_initGroupWithName:identifier:customizations:", v95, CFSTR("SHARING_OPTIONS_SEND_AS_GROUP"), v96);

        objc_msgSend(v103, "addObject:", v97);
        objc_destroyWeak(&v111);

      }
      else
      {
        v81 = (void *)MEMORY[0x1E0D96D60];
        PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_CMM_SWITCH_TITLE"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_GROUP_CMM_SWITCH_FOOTER_TEXT"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = -[PUActivityViewController shareAsCMM](self, "shareAsCMM");
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_7;
        v108[3] = &unk_1E589B7A0;
        objc_copyWeak(&v109, &location);
        objc_msgSend(v81, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v82, CFSTR("SHARING_OPTIONS_SEND_AS_CMM_SWITCH_TITLE"), v83, v84, v108);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        v86 = objc_alloc(MEMORY[0x1E0D96D68]);
        PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_GROUP_TITLE"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = v85;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = (void *)objc_msgSend(v86, "_initGroupWithName:identifier:customizations:", v87, CFSTR("SHARING_OPTIONS_SEND_AS_GROUP"), v88);

        objc_msgSend(v103, "addObject:", v89);
        objc_destroyWeak(&v109);
      }
    }
  }
  else
  {

  }
  if (objc_msgSend(v4, "showUnmodifiedOriginalsExportSwitch"))
  {
    if (objc_msgSend(v102, "count") == 1)
      v61 = CFSTR("SHARING_OPTIONS_SEND_AS_UNMODIFIED_ORIGINAL");
    else
      v61 = CFSTR("SHARING_OPTIONS_SEND_AS_UNMODIFIED_ORIGINAL_MULTIPLE");
    PULocalizedString(v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("SHARING_OPTIONS_SEND_AS_UNMODIFIED_FOOTER_TEXT"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[PUActivityViewController sendAsUnmodifiedOriginals](self, "sendAsUnmodifiedOriginals");
    v65 = (void *)MEMORY[0x1E0D96D60];
    v106[0] = MEMORY[0x1E0C809B0];
    v106[1] = 3221225472;
    v106[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_8;
    v106[3] = &unk_1E589B7A0;
    objc_copyWeak(&v107, &location);
    objc_msgSend(v65, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v62, CFSTR("SHARING_OPTIONS_SEND_AS_UNMODIFIED_ORIGINAL"), v63, v64, v106);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc(MEMORY[0x1E0D96D68]);
    v130 = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v67, "_initGroupWithName:identifier:customizations:", CFSTR("Internal"), CFSTR("SHARING_OPTIONS_UNMODIFIED_ORIGINALS_GROUP"), v68);

    objc_msgSend(v103, "addObject:", v69);
    objc_destroyWeak(&v107);

  }
  if (v100)
  {
    PULocalizedString(CFSTR("SHARING_OPTIONS_ALL_PHOTOS_DATA_FOOTER"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)MEMORY[0x1E0D96D60];
    PULocalizedString(CFSTR("SHARING_OPTIONS_ALL_PHOTOS_DATA_TITLE"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles");
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_9;
    v104[3] = &unk_1E589B7A0;
    objc_copyWeak(&v105, &location);
    objc_msgSend(v71, "switchCustomizationWithTitle:identifier:footerText:value:valueChangedHandler:", v72, CFSTR("SHARING_OPTIONS_ALL_PHOTOS_DATA"), v70, v73, v104);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = objc_alloc(MEMORY[0x1E0D96D68]);
    PULocalizedString(CFSTR("SHARING_OPTIONS_ALL_PHOTOS_DATA_GROUP_TITLE"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v75, "_initGroupWithName:identifier:customizations:", v76, CFSTR("SHARING_OPTIONS_ALL_PHOTOS_DATA_GROUP"), v77);

    objc_msgSend(v103, "addObject:", v78);
    objc_destroyWeak(&v105);

  }
  v79 = (void *)objc_msgSend(v103, "copy");

  objc_destroyWeak(&location);
  return v79;
}

- (void)activityItemSourceController:(id)a3 willBeginPreparationWithActivityType:(id)a4 preparationType:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  if (a5 != 1)
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke;
    v15[3] = &unk_1E58ABD10;
    v11 = v8;
    v16 = v11;
    -[PUActivityViewController showProgressUIAnimated:withDelay:cancellationHandler:](self, "showProgressUIAnimated:withDelay:cancellationHandler:", 1, 1, v15);
    objc_initWeak(&location, self);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke_2;
    v12[3] = &unk_1E58A4298;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v11, "setProgressHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (void)activityItemSourceController:(id)a3 didFinishPreparationForActivityType:(id)a4 preparationType:(unint64_t)a5 withItems:(id)a6 didCancel:(BOOL)a7 errors:(id)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  PUActivityViewController *v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = a9;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke;
  v21[3] = &unk_1E58A4C40;
  v27 = a7;
  v22 = v15;
  v23 = self;
  v25 = v13;
  v26 = v16;
  v24 = v14;
  v17 = v13;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], v21);

}

- (void)setCompletionWithItemsHandler:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PUActivityViewController_setCompletionWithItemsHandler___block_invoke;
  v7[3] = &unk_1E589B840;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController setCompletionWithItemsHandler:](&v6, sel_setCompletionWithItemsHandler_, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _shouldShowSystemActivityType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_shouldShowSystemActivityType__onceToken, &__block_literal_global_495);
  v5 = objc_msgSend((id)_shouldShowSystemActivityType__excludedActivityTypes, "containsObject:", v4);

  return v5 ^ 1;
}

- (id)_titleForActivity:(id)a3
{
  void *v3;
  objc_super v5;

  if ((id)*MEMORY[0x1E0D96E20] == a3)
  {
    PULocalizedString(CFSTR("SHARING_PHOTOS_ACTION_SHEET"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUActivityViewController;
    -[PUActivityViewController _titleForActivity:](&v5, sel__titleForActivity_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_shouldPresentAirplayAlertForActivity:(id)a3
{
  id v5;
  void *v6;
  int v7;
  id v8;
  int v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v5 = a3;
  objc_msgSend(v5, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D7BC80]);

  if (!v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_6;
  }
  v8 = v5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1904, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activity"), v13);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1904, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activity"), v13, v15);

    goto LABEL_9;
  }
LABEL_4:
  v9 = objc_msgSend(v8, "isRouteAvailable") ^ 1;

LABEL_6:
  return v9;
}

- (void)_performActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PUActivityViewController__performActivity___block_invoke;
  v6[3] = &unk_1E58AAE08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUActivityViewController _presentConfidentialityWarningIfNeededForActivity:withCompletionHandler:](self, "_presentConfidentialityWarningIfNeededForActivity:withCompletionHandler:", v5, v6);

}

- (void)_presentAirPlayAlertIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, uint64_t);

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if (!-[PUActivityViewController _shouldPresentAirplayAlertForActivity:](self, "_shouldPresentAirplayAlertForActivity:", v7))
  {
    v8[2](v8, 1);
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E0DC3450];
  PULocalizedString(CFSTR("SHARING_AIRPLAY_ERROR_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1955, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activity"), v19);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 1955, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activity"), v19, v21);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v11, "localizedRouteUnavailabilityMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("OK"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__PUActivityViewController__presentAirPlayAlertIfNeededForActivity_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E58AB6C0;
  v23 = v8;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16);

  -[PUActivityViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v13, 1, 0);
LABEL_6:

}

- (void)_adjustPreparationOptionsIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, uint64_t, uint64_t);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  if (-[PUActivityViewController _shouldAutomaticallySendAsCMMForActivity:](self, "_shouldAutomaticallySendAsCMMForActivity:", v7))
  {
    v6[2](v6, 1, 1);
  }
  else if (-[PUActivityViewController _shouldSuggestSharingAsCMMForActivity:](self, "_shouldSuggestSharingAsCMMForActivity:", v7))
  {
    -[PUActivityViewController _presentCMMSuggestionAlertForActivity:withCompletionHandler:](self, "_presentCMMSuggestionAlertForActivity:withCompletionHandler:", v7, v6);
  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (void)_updateSyndicatedAssetItemsWithAssets:(id)a3 activityType:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(id, BOOL);
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(id, BOOL))a5;
  v9 = objc_msgSend(v7, "count");
  PLShareSheetGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "[Share Sheet]: Updated new asset items to process", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUActivityAssetItem itemsForAssets:](PUActivityAssetItem, "itemsForAssets:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityViewController setAssetItems:](self, "setAssetItems:", v13);

    -[PUActivityViewController setUsingCustomAssetItems:](self, "setUsingCustomAssetItems:", 1);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "[Share Sheet]: No new asset items to process", v14, 2u);
    }

  }
  v8[2](v8, v9 != 0);

}

- (BOOL)_activityRequiresUserLibraryAssets:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BC60]);

  objc_msgSend(v3, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D7BC78]);

  objc_msgSend(v3, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D7BCC0]);

  objc_msgSend(v3, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NanoTimeKit.CreateWatchFace"));
  return v5 | v7 | v9 | v3;
}

- (void)_presentUnsavedSyndicatedAssetsAlertIfNeededForActivity:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id location;

  v7 = a3;
  v8 = a5;
  if (-[PUActivityViewController _activityRequiresUserLibraryAssets:](self, "_activityRequiresUserLibraryAssets:", v7))
  {
    -[PUActivityViewController assets](self, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v13 = v8;
    objc_copyWeak(&v14, &location);
    v12 = v7;
    PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

- (void)_presentSpatialDataLossAlertIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(a3, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D7BC88]);

  if ((v8 & 1) != 0)
  {
    -[PUActivityViewController assets](self, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    PXSharedAlbumsPresentSpatialMediaDataLossAlertIfNeededForAssets();

  }
  else
  {
    v6[2](v6);
  }

}

- (void)_presentCMMSuggestionAlertForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  PUActivityViewController *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EECAEED8) & 1) != 0)
    v8 = objc_msgSend((id)objc_opt_class(), "canPerformActivityAsIndividualItemsInSourceController:", self->_itemSourceController);
  else
    v8 = 1;
  v30 = self;
  -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PXMediaTypeForAssets();
  objc_msgSend(v10, "count");
  PXLocalizationKeyForMediaType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3450];
  v31 = v11;
  PULocalizedString(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", 0, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("SHARING_CMM_SUGGESTION_ACTION_SEND_AS_CMM"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke;
  v36[3] = &unk_1E58AB6C0;
  v18 = v7;
  v37 = v18;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  if (v8)
  {
    objc_msgSend(v10, "count");
    PXLocalizationKeyForMediaType();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_2;
    v34[3] = &unk_1E58AB6C0;
    v35 = v18;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v23);

  }
  v24 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("CANCEL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_3;
  v32[3] = &unk_1E58AB6C0;
  v33 = v18;
  v26 = v18;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v27);

  if (!CGRectIsNull(v30->_lastSelectedActivityFrame))
  {
    objc_msgSend(v14, "popoverPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSourceRect:", v30->_lastSelectedActivityFrame.origin.x, v30->_lastSelectedActivityFrame.origin.y, v30->_lastSelectedActivityFrame.size.width, v30->_lastSelectedActivityFrame.size.height);
    -[PUActivityViewController view](v30, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSourceView:", v29);

    objc_msgSend(v28, "setPermittedArrowDirections:", 3);
  }
  -[PUActivityViewController px_presentOverTopmostPresentedViewController:animated:completion:](v30, "px_presentOverTopmostPresentedViewController:animated:completion:", v14, 1, 0);

}

- (void)_prepareActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController _prepareActivity:](&v18, sel__prepareActivity_, v4);
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96E00]);

  if (v6)
  {
    objc_msgSend(v4, "printInteractionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXDefaultPrintInfo();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrintInfo:", v8);

  }
  else
  {
    objc_msgSend(v4, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D96DC0]);

    if (!v10)
      goto LABEL_6;
    objc_msgSend(v4, "activityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalPresentationStyle:", 17);
  }

LABEL_6:
  if (MEMORY[0x1AF42B6B0]())
  {
    -[PUActivityItemSourceController assets](self->_itemSourceController, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "valueForKey:", CFSTR("uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v12, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUActivityViewController photoLibrary](self, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "countOfAssetsWithLocationFromUUIDs:photoLibrary:", v14, v15);

      if (v16 >= 1)
      {
        objc_msgSend(v4, "activityType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        plslogGreenTea();

      }
    }

  }
}

- (void)_cancel
{
  objc_super v3;

  -[PUActivityItemSourceController cancel](self->_itemSourceController, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PUActivityViewController;
  -[PUActivityViewController _cancel](&v3, sel__cancel);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUActivityViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  self->_lastSelectedActivityFrame.origin.x = v19;
  self->_lastSelectedActivityFrame.origin.y = v21;
  self->_lastSelectedActivityFrame.size.width = v23;
  self->_lastSelectedActivityFrame.size.height = v25;
  if (objc_msgSend(MEMORY[0x1E0D96D28], "instancesRespondToSelector:", sel_collectionView_didSelectItemAtIndexPath_))
  {
    v26.receiver = self;
    v26.super_class = (Class)PUActivityViewController;
    -[PUActivityViewController collectionView:didSelectItemAtIndexPath:](&v26, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  }

}

- (BOOL)_canCreateCMMWithCurrentItemsForActivity:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  int v8;
  int v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  int v21;
  NSObject *v22;
  BOOL v23;
  __CFString *v25;
  id v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PUActivityItemSourceController itemSourcesSupportMomentShareLinkCreation](self->_itemSourceController, "itemSourcesSupportMomentShareLinkCreation");
  -[PUActivityViewController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PXCMMHasSendAndReceiveCapabilities();

  v8 = PLCPLIsExceedingPrimarySyncQuota();
  if (!v5 || v7 == 0 || v8 != 0)
  {
    v11 = v8;
    PLShareSheetGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v13 = CFSTR("NO");
      else
        v13 = CFSTR("YES");
      v26 = v4;
      v14 = v13;
      if (v7)
        v15 = CFSTR("NO");
      else
        v15 = CFSTR("YES");
      v16 = v15;
      v25 = v14;
      if (v11)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v18 = v17;
      v19 = v16;
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v4 = v26;
      v29 = 2114;
      v30 = v16;
      v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "CMM creation is not possible because of one or more reasons: \nNot Possible With Current Items: %{public}@\nCMM Unavailable: %{public}@\nCPL Quota Exceeded: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v4, "activityType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D96DC0]);

    if ((v5 & v7 & v11 & v21 & -[PUActivityItemSourceController shouldUseMomentShareLinkInMessagesIfThresholdMet](self->_itemSourceController, "shouldUseMomentShareLinkInMessagesIfThresholdMet")) != 1)
    {
      v23 = 0;
      goto LABEL_25;
    }
    PLShareSheetGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "User has exceeded their iCloud quota for CMM, but allowing the CMM creation to continue, to show an actionable error message", buf, 2u);
    }

  }
  v23 = 1;
LABEL_25:

  return v23;
}

- (BOOL)_shouldSuggestSharingAsCMMForActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cmmShareSheetBehavior");

  if (v6 == 3
    && !-[PUActivityViewController shareAsCMM](self, "shareAsCMM")
    && -[PUActivityViewController _canCreateCMMWithCurrentItemsForActivity:](self, "_canCreateCMMWithCurrentItemsForActivity:", v4))
  {
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D96DC0]) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
    {
      -[PUActivityItemSourceController assetItems](self->_itemSourceController, "assetItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend((id)objc_opt_class(), "cmmThresholdIsMetForAssetItems:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldAutomaticallySendAsCMMForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[PUActivityViewController shouldAutomaticallyUseCMMInMessagesIfThresholdMet](self, "shouldAutomaticallyUseCMMInMessagesIfThresholdMet")&& !-[PUActivityViewController shareAsCMM](self, "shareAsCMM")&& -[PUActivityViewController _canCreateCMMWithCurrentItemsForActivity:](self, "_canCreateCMMWithCurrentItemsForActivity:", v4))
  {
    objc_msgSend(v4, "activityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DC0]))
    {
      -[PUActivityItemSourceController assetItems](self->_itemSourceController, "assetItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend((id)objc_opt_class(), "cmmThresholdIsMetForAssetItems:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;

  v6 = a4;
  v9 = a3;
  if ((v6 & 1) != 0 && (void *)PUActivityViewControllerSourceControllerObserverContext == a5)
    goto LABEL_3;
  if ((v6 & 1) != 0 && (void *)PUActivityViewControllerViewModelObserverContext == a5)
  {
    -[PUActivityViewController _updateSharingHeaderIfNeeded](self, "_updateSharingHeaderIfNeeded");
    goto LABEL_9;
  }
  if ((void *)PrivacyControllerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityViewController.m"), 2368, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
LABEL_3:
    px_dispatch_on_main_queue();
LABEL_9:

}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  _BOOL4 v9;

  v3 = a3;
  +[PUPhotoSharingManager sharedInstance](PUPhotoSharingManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prepareForDismissingForced:", v3);

  -[PUActivityViewController activity](self, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 0;
  else
    v8 = v6;
  v9 = v8 | v3;
  if (v9)
    -[PUActivityViewController setCompletionWithItemsHandler:](self, "setCompletionWithItemsHandler:", 0);
  return v9;
}

- (void)ppt_performActivityOfType:(id)a3
{
  id v4;
  NSArray *photosActivities;
  id v6;
  _QWORD v7[4];
  id v8;
  PUActivityViewController *v9;

  v4 = a3;
  photosActivities = self->_photosActivities;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PUActivityViewController_ppt_performActivityOfType___block_invoke;
  v7[3] = &unk_1E589B8E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](photosActivities, "enumerateObjectsUsingBlock:", v7);

}

- (PUActivitySharingViewModel)sharingViewModel
{
  return self->_sharingViewModel;
}

- (NSArray)photosActivities
{
  return self->_photosActivities;
}

- (PUActivityViewControllerDelegate)delegate
{
  return (PUActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isReadyForInteraction
{
  return self->_readyForInteraction;
}

- (__CFString)aggregateKey
{
  return self->_aggregateKey;
}

- (void)setAggregateKey:(__CFString *)a3
{
  self->_aggregateKey = a3;
}

- (id)readyToInteractHandler
{
  return self->_readyToInteractHandler;
}

- (void)setReadyToInteractHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (id)ppt_readyToInteractHandler
{
  return self->_ppt_readyToInteractHandler;
}

- (void)setPpt_readyToInteractHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (BOOL)isUsingCustomItems
{
  return self->_usingCustomAssetItems;
}

- (void)setUsingCustomAssetItems:(BOOL)a3
{
  self->_usingCustomAssetItems = a3;
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)setActivitySharingController:(id)a3
{
  objc_storeStrong((id *)&self->_activitySharingController, a3);
}

- (PXActivityProgressController)progressController
{
  return self->_progressController;
}

- (void)setProgressController:(id)a3
{
  objc_storeStrong((id *)&self->_progressController, a3);
}

- (BOOL)shouldAutomaticallyUseCMMInMessagesIfThresholdMet
{
  return self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet;
}

- (BOOL)shareAsCMM
{
  return self->_shareAsCMM;
}

- (BOOL)excludeLiveness
{
  return self->_excludeLiveness;
}

- (BOOL)excludeLocation
{
  return self->_excludeLocation;
}

- (BOOL)excludeCaption
{
  return self->_excludeCaption;
}

- (BOOL)excludeAccessibilityDescription
{
  return self->_excludeAccessibilityDescription;
}

- (int64_t)preferredExportFormat
{
  return self->_preferredExportFormat;
}

- (BOOL)sendAsUnmodifiedOriginals
{
  return self->_sendAsUnmodifiedOriginals;
}

- (BOOL)sendAsAssetBundles
{
  return self->_sendAsAssetBundles;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXContentPrivacyController)privacyControllerForContainerCollection
{
  return self->_privacyControllerForContainerCollection;
}

- (void)setPrivacyControllerForContainerCollection:(id)a3
{
  objc_storeStrong((id *)&self->_privacyControllerForContainerCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyControllerForContainerCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_storeStrong(&self->_ppt_readyToInteractHandler, 0);
  objc_storeStrong(&self->_readyToInteractHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photosActivities, 0);
  objc_storeStrong((id *)&self->_sharingViewModel, 0);
  objc_storeStrong((id *)&self->_sharingHeaderController, 0);
  objc_storeStrong((id *)&self->_linkPresentation, 0);
  objc_storeStrong((id *)&self->_itemSourceController, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_remakerProgressView, 0);
}

void __54__PUActivityViewController_ppt_performActivityOfType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_performActivity:", v8);
    *a4 = 1;
  }

}

uint64_t __57__PUActivityViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgressUITitle");
}

void __57__PUActivityViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "privacyControllerForContainerCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocked");

  if (v3)
  {
    PLShareSheetGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing share sheet, as the privacy controller associated with share sheet was locked.", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_cancel");
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

uint64_t __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__PUActivityViewController__presentSpatialDataLossAlertIfNeededForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __140__PUActivityViewController__presentUnsavedSyndicatedAssetsAlertIfNeededForActivity_forcePreparationAsMomentShareLink_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    PLShareSheetGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v8)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        v16 = *(_QWORD *)(a1 + 40);
        v25 = 138412802;
        v26 = v15;
        v27 = 2048;
        v28 = v16;
        v29 = 2112;
        v30 = v8;
        v17 = "<%@:%p>: No assets to process: %@";
        v18 = v14;
        v19 = OS_LOG_TYPE_ERROR;
        v20 = 32;
LABEL_10:
        _os_log_impl(&dword_1AAB61000, v18, v19, v17, (uint8_t *)&v25, v20);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      v22 = *(_QWORD *)(a1 + 40);
      v25 = 138412546;
      v26 = v21;
      v27 = 2048;
      v28 = v22;
      v17 = "<%@:%p>: No assets to process";
      v18 = v14;
      v19 = OS_LOG_TYPE_DEFAULT;
      v20 = 22;
      goto LABEL_10;
    }

    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v23, v24);
    goto LABEL_12;
  }
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateSyndicatedAssetItemsWithAssets:activityType:withCompletionHandler:", v7, v12, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 1, v9, v10);
  }
LABEL_12:

}

uint64_t __90__PUActivityViewController__presentAirPlayAlertIfNeededForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__PUActivityViewController__performActivity___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__PUActivityViewController__performActivity___block_invoke_2;
    v4[3] = &unk_1E58AAE08;
    v4[4] = v2;
    v5 = v3;
    objc_msgSend(v2, "_presentAirPlayAlertIfNeededForActivity:withCompletionHandler:", v5, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserCancelWithCompletion:", 0);
  }
}

void __45__PUActivityViewController__performActivity___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__PUActivityViewController__performActivity___block_invoke_3;
    v4[3] = &unk_1E589B888;
    v4[4] = v2;
    v5 = v3;
    objc_msgSend(v2, "_adjustPreparationOptionsIfNeededForActivity:withCompletionHandler:", v5, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserCancelWithCompletion:", 0);
  }
}

void __45__PUActivityViewController__performActivity___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__PUActivityViewController__performActivity___block_invoke_4;
    v6[3] = &unk_1E58A7E20;
    v6[4] = v5;
    v7 = v4;
    v8 = a3;
    objc_msgSend(v5, "_presentUnsavedSyndicatedAssetsAlertIfNeededForActivity:forcePreparationAsMomentShareLink:withCompletionHandler:", v7, a3, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserCancelWithCompletion:", 0);
  }
}

void __45__PUActivityViewController__performActivity___block_invoke_4(uint64_t a1, int a2)
{
  void *v2;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__PUActivityViewController__performActivity___block_invoke_5;
    v5[3] = &unk_1E58AA878;
    v5[4] = v2;
    v6 = v4;
    v7 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v2, "_presentSpatialDataLossAlertIfNeededForActivity:withCompletionHandler:", v6, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserCancelWithCompletion:", 0);
  }
}

__n128 __45__PUActivityViewController__performActivity___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  __n128 result;
  __int128 v5;
  objc_super v6;

  objc_msgSend(*(id *)(a1 + 32), "_prepareAssetsForActivity:forcePreparationAsMomentShareLink:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)PUActivityViewController;
  objc_msgSendSuper2(&v6, sel__performActivity_, v2);
  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1400);
  result = *(__n128 *)MEMORY[0x1E0C9D628];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v3 = *MEMORY[0x1E0C9D628];
  v3[1] = v5;
  return result;
}

void __58__PUActivityViewController__shouldShowSystemActivityType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D96DC0];
  v5[0] = *MEMORY[0x1E0D96DB0];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D96E08];
  v5[2] = *MEMORY[0x1E0D96DA0];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D96D80];
  v5[4] = *MEMORY[0x1E0D96D90];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_shouldShowSystemActivityType__excludedActivityTypes;
  _shouldShowSystemActivityType__excludedActivityTypes = v3;

}

void __58__PUActivityViewController_setCompletionWithItemsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend((id)objc_opt_class(), "activityCategory");
  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "_activity:category:didComplete:", v16, v13, a3);

  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, id, uint64_t, id, id))(v15 + 16))(v15, v16, a3, v9, v10);

}

void __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  if (*(_BYTE *)(a1 + 72))
    v2 = 0;
  else
    v2 = objc_msgSend(*(id *)(a1 + 32), "count") == 0;
  objc_msgSend(*(id *)(a1 + 40), "removeProgressUIAnimated:withDelay:", 1, v2);
  if (*(_BYTE *)(a1 + 72))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1386) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_sendCPAnalyticsAssetExportPreparationEventWithActivityType:didComplete:error:", *(_QWORD *)(a1 + 48), 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "_handleUserCancelWithCompletion:", *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "assetItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_2;
    v17[3] = &unk_1E589B818;
    v18 = v4;
    v19 = *(id *)(a1 + 56);
    v20 = v5;
    v7 = v5;
    v8 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v17);
    v10 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_sendCPAnalyticsAssetExportPreparationEventWithActivityType:didComplete:error:", v9, 0, v11);

    v13 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_3;
    v15[3] = &unk_1E58AB968;
    v15[4] = v12;
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v12, "_showSharingWasInterruptedForErrors:withIndividualAssets:itemSourcesByAssetUUID:toActivityType:completion:", v13, v8, v7, v14, v15);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1386) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1387) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_sendCPAnalyticsAssetExportPreparationEventWithActivityType:didComplete:error:", *(_QWORD *)(a1 + 48), 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "activityItemSourceForAsset:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      objc_msgSend(v7, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

    }
    v3 = v7;
  }

}

uint64_t __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1386) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke_2(uint64_t a1, double a2)
{
  id v3[2];

  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)&a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v3);
}

void __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFractionCompleted:", *(double *)(a1 + 40));

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = objc_msgSend(a2, "value") ^ 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExcludeLiveness:", v3);

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(v3, "value");

  objc_msgSend(WeakRetained, "setExcludeLocation:", v2 ^ 1);
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setExcludeCaption:", objc_msgSend(v3, "value") ^ 1);
  LOBYTE(v2) = objc_msgSend(v3, "value");

  if ((v2 & 1) == 0)
    objc_msgSend(WeakRetained, "setShareAsCMM:", 0);
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setExcludeAccessibilityDescription:", objc_msgSend(v3, "value") ^ 1);
  LOBYTE(v2) = objc_msgSend(v3, "value");

  if ((v2 & 1) == 0)
    objc_msgSend(WeakRetained, "setShareAsCMM:", 0);
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  unint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "selectedOptionIndex");

  if (v4 <= 2)
    objc_msgSend(WeakRetained, "setPreferredExportFormat:", v4);
  objc_msgSend(WeakRetained, "setShareAsCMM:", 0);
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));
  objc_msgSend(WeakRetained, "setSendAsAssetBundles:", 0);

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(v6, "selectedOptionIndex") == 0);
    if (*(_BYTE *)(a1 + 40))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 1;
  }
  objc_msgSend(WeakRetained, "setShareAsCMM:", objc_msgSend(v6, "selectedOptionIndex") == v4);
  if (objc_msgSend(WeakRetained, "shouldAutomaticallyUseCMMInMessagesIfThresholdMet"))
  {
    objc_msgSend(WeakRetained, "setExcludeCaption:", 0);
    objc_msgSend(WeakRetained, "setExcludeAccessibilityDescription:", 0);
  }
  if ((objc_msgSend(WeakRetained, "shouldAutomaticallyUseCMMInMessagesIfThresholdMet") & 1) != 0
    || objc_msgSend(WeakRetained, "shareAsCMM"))
  {
    objc_msgSend(WeakRetained, "setPreferredExportFormat:", 0);
    objc_msgSend(WeakRetained, "setSendAsUnmodifiedOriginals:", 0);
  }
  if (objc_msgSend(WeakRetained, "sendAsAssetBundles"))
    v5 = objc_msgSend(WeakRetained, "_canShowSendAsAssetBundlesSwitchInObjectManipulationHeader");
  else
    v5 = 0;
  objc_msgSend(WeakRetained, "setSendAsAssetBundles:", v5);

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "value");

  objc_msgSend(WeakRetained, "setShareAsCMM:", v4);
  if ((objc_msgSend(WeakRetained, "shareAsCMM") & 1) == 0)
    objc_msgSend(WeakRetained, "setPreferredExportFormat:", 0);
  objc_msgSend(WeakRetained, "setSendAsUnmodifiedOriginals:", 0);

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "value");

  objc_msgSend(WeakRetained, "setSendAsUnmodifiedOriginals:", v4);
  if (objc_msgSend(WeakRetained, "sendAsUnmodifiedOriginals"))
  {
    objc_msgSend(WeakRetained, "setShareAsCMM:", 0);
    objc_msgSend(WeakRetained, "setExcludeLocation:", 0);
    objc_msgSend(WeakRetained, "setExcludeCaption:", 0);
    objc_msgSend(WeakRetained, "setExcludeAccessibilityDescription:", 0);
    objc_msgSend(WeakRetained, "setSendAsAssetBundles:", 0);
    objc_msgSend(WeakRetained, "setPreferredExportFormat:", 0);
  }
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));

}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "value");

  objc_msgSend(WeakRetained, "setSendAsAssetBundles:", v4);
  if (objc_msgSend(WeakRetained, "sendAsAssetBundles")
    && objc_msgSend(WeakRetained, "preferredExportFormat"))
  {
    objc_msgSend(WeakRetained, "setPreferredExportFormat:", 0);
  }
  if (PLIsLockdownMode()
    && _os_feature_enabled_impl()
    && (objc_msgSend(WeakRetained, "sendAsAssetBundles") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "setExcludeLocation:", 1);
    objc_msgSend(WeakRetained, "setExcludeCaption:", 1);
  }

}

uint64_t __61__PUActivityViewController__sharingStyleDidChangeToExpanded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActionSheet:", 0);
}

uint64_t __62__PUActivityViewController__sharingManagerDidBeginPublishing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelPublishing");
}

uint64_t __73__PUActivityViewController_mailActivity_displayVideoRemakerProgressView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRemaking");
}

uint64_t __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __134__PUActivityViewController__showSharingWasInterruptedForErrors_withIndividualAssets_itemSourcesByAssetUUID_toActivityType_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleUserCancelWithCompletion:", *(_QWORD *)(a1 + 32));

}

uint64_t __81__PUActivityViewController_showProgressUIAnimated_withDelay_cancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__PUActivityViewController__showRemakerProgressView_forMail_withCancelationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (!*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_handleUserCancelWithCompletion:", 0);

  }
}

void __59__PUActivityViewController__activity_category_didComplete___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      v9 = "Activity failure did expunge moment share: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    v9 = "Activity failure failed to expunge moment share %{public}@: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __42__PUActivityViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePostReadyToInteractUpdatesIfNeeded");

}

+ (BOOL)isShareActivity:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D7BC80];
  v15 = *MEMORY[0x1E0D96E08];
  v16 = v3;
  v4 = *MEMORY[0x1E0D7BDB8];
  v17 = *MEMORY[0x1E0D7BE38];
  v18 = v4;
  v5 = *MEMORY[0x1E0D7BD48];
  v19 = *MEMORY[0x1E0D96E30];
  v20 = v5;
  v6 = *MEMORY[0x1E0D7BD08];
  v21 = *MEMORY[0x1E0D7BE50];
  v22 = v6;
  v7 = *MEMORY[0x1E0D7BE08];
  v23 = *MEMORY[0x1E0D7BDF0];
  v24 = v7;
  v8 = *MEMORY[0x1E0D7BD58];
  v25 = *MEMORY[0x1E0D7BDB0];
  v26 = v8;
  v9 = *MEMORY[0x1E0D7BC60];
  v27 = *MEMORY[0x1E0D7BD70];
  v28 = v9;
  v10 = *MEMORY[0x1E0D7BD10];
  v29 = *MEMORY[0x1E0D7BC78];
  v30 = v10;
  v31 = *MEMORY[0x1E0D7BD18];
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", &v15, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "containsObject:", v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
                  v31,
                  v32);

  return v11 ^ 1;
}

+ (id)defaultActivityTypeOrder
{
  if (defaultActivityTypeOrder_predicate != -1)
    dispatch_once(&defaultActivityTypeOrder_predicate, &__block_literal_global_4241);
  return (id)defaultActivityTypeOrder_defaultActivityTypeOrder;
}

+ (id)actionSheetPhotosApplicationActivities
{
  void *v2;
  PUMessageActivity *v3;
  PUMailActivity *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PUMessageActivity);
  objc_msgSend(v2, "addObject:", v3);

  v4 = objc_alloc_init(PUMailActivity);
  objc_msgSend(v2, "addObject:", v4);

  return v2;
}

+ (id)photosApplicationActivities:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultActivityTypeOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PUActivityViewController_photosApplicationActivities___block_invoke;
  v9[3] = &unk_1E589B6A0;
  v7 = v5;
  v10 = v7;
  v11 = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

+ (id)excludedPhotosActivityTypesForPresentationSource:(unint64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[16];
  _QWORD v33[10];
  _QWORD v34[11];

  v34[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7B320], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "excludeActionsFromShareSheet");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D7B320], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableActionsMenuOnPad");

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7B320], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "enableActionsMenuOnPhone");

  }
  objc_msgSend(MEMORY[0x1E0D7B320], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "actionsMenuLocation");

  if (v13)
    v14 = v5 & (v8 | v10);
  else
    v14 = 0;
  v15 = *MEMORY[0x1E0D7BD48];
  v34[0] = *MEMORY[0x1E0D7BD08];
  v34[1] = v15;
  v16 = *MEMORY[0x1E0D7BE38];
  v17 = *MEMORY[0x1E0D7BCA8];
  v34[2] = *MEMORY[0x1E0D7BE38];
  v34[3] = v17;
  v18 = *MEMORY[0x1E0D7BD18];
  v34[4] = *MEMORY[0x1E0D7BD10];
  v34[5] = v18;
  v34[6] = *MEMORY[0x1E0D7BE50];
  v34[7] = CFSTR("PUActivityTypeRemoveFromFeaturedPhotos");
  v34[8] = *MEMORY[0x1E0D7BE60];
  v34[9] = CFSTR("PUActivityTypeNotThisPerson");
  v19 = (void *)0x1E0C99000;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D7B968], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "showMoveToLibraryActionsInShareSheet") & 1) == 0)
  {
    objc_msgSend(v21, "addObject:", *MEMORY[0x1E0D7BDA8]);
    objc_msgSend(v21, "addObject:", *MEMORY[0x1E0D7BDA0]);
  }
  switch(a3)
  {
    case 2uLL:
      v32[0] = CFSTR("PUActivityTypeHide");
      v32[1] = CFSTR("PUActivityTypeDuplicate");
      v32[2] = v16;
      v32[3] = CFSTR("PUActivityTypeEditDateTime");
      v32[4] = CFSTR("PUActivityTypeEditLocation");
      v32[5] = CFSTR("PLActivityTypeAlbumStream");
      v32[6] = CFSTR("com.apple.mobileslideshow.StreamShareService");
      v32[7] = CFSTR("PUActivityTypeSetKeyFace");
      v32[8] = CFSTR("PUActivityTypeNotThisPerson");
      v32[9] = CFSTR("PUActivityTypeSuggestLessPerson");
      v32[10] = CFSTR("PUActivityTypeAddToAlbum");
      v32[11] = CFSTR("PUActivityTypeCopyLink");
      v32[12] = CFSTR("PUActivityTypeRemoveFromFeaturedPhotos");
      v32[13] = CFSTR("PUActivityTypeInternalAutoLoopFeedback");
      v25 = *MEMORY[0x1E0D7BD88];
      v32[14] = CFSTR("PUActivityTypeInternalImageQualityFeedback");
      v32[15] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 16);
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v19 = v24;
      break;
    case 1uLL:
      v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v33[0] = CFSTR("PUActivityTypeHide");
      v33[1] = CFSTR("PUActivityTypeDuplicate");
      v33[2] = v16;
      v33[3] = CFSTR("PUActivityTypeEditDateTime");
      v33[4] = CFSTR("PUActivityTypeEditLocation");
      v33[5] = CFSTR("PUActivityTypeInternalImageQualityFeedback");
      v33[6] = *MEMORY[0x1E0D7BD88];
      v33[7] = v17;
      v27 = *MEMORY[0x1E0D7BE08];
      v33[8] = *MEMORY[0x1E0D7BDF0];
      v33[9] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v26, "initWithArray:", v28);

      if (v14)
        objc_msgSend(v29, "addObjectsFromArray:", v21);
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 0uLL:
      v23 = (void *)MEMORY[0x1E0C9AA60];
      if (v14)
        v23 = v21;
      v24 = v23;
      goto LABEL_19;
  }

  return v19;
}

+ (id)externalApplicationExcludedPhotosActivityTypes
{
  uint64_t v2;
  _QWORD v4[17];

  v4[16] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("PLActivityTypeUseAsWallpaper");
  v4[1] = CFSTR("com.apple.mobileslideshow.StreamShareService");
  v4[2] = CFSTR("PUActivityTypeHide");
  v4[3] = CFSTR("PUActivityTypeDuplicate");
  v4[4] = CFSTR("PUActivityTypeSetKeyFace");
  v4[5] = CFSTR("PUActivityTypeNotThisPerson");
  v4[6] = CFSTR("PUActivityTypeInternalAutoLoopFeedback");
  v4[7] = CFSTR("PUActivityTypeInternalImageQualityFeedback");
  v4[8] = CFSTR("PUActivityTypeAddToAlbum");
  v4[9] = CFSTR("PUActivityTypeCopyLink");
  v2 = *MEMORY[0x1E0D7BDA0];
  v4[10] = *MEMORY[0x1E0D7BDA8];
  v4[11] = v2;
  v4[12] = CFSTR("PUActivityTypeRemoveFromFeaturedPhotos");
  v4[13] = CFSTR("PUActivityTypeEditDateTime");
  v4[14] = CFSTR("PUActivityTypeEditLocation");
  v4[15] = CFSTR("PUActivityTypeSuggestLessPerson");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)needsConfidentialityCheckForActivityType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = needsConfidentialityCheckForActivityType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&needsConfidentialityCheckForActivityType__onceToken, &__block_literal_global_163);
  v5 = objc_msgSend((id)needsConfidentialityCheckForActivityType___confidentialityExcludedActivities, "containsObject:", v4);

  return v5 ^ 1;
}

+ (PUActivityViewController)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUActivityViewController.m"), 529, CFSTR("%s is not available as initializer"), "+[PUActivityViewController new]");

  abort();
}

+ (BOOL)cmmThresholdIsMetForAssetItems:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "cmmAssetCountThresholdIsMetForAssetItems:", v3) & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "cmmFileSizeThresholdIsMetForAssetItems:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_class(), "cmmMediaTypeSpecificFileSizeThresholdIsMetForAssetItems:", v3);
  }

  return v4;
}

+ (BOOL)cmmAssetCountThresholdIsMetForAssetItems:(id)a3
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "count");
  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shareSheetLinkAssetCountThreshold");

  if (v3 >= v5)
  {
    PLShareSheetGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = v3;
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Selected asset count (%ld) is over threshold (%ld)", (uint8_t *)&v8, 0x16u);
    }

  }
  return v3 >= v5;
}

+ (BOOL)cmmFileSizeThresholdIsMetForAssetItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  char v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  double v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shareSheetLinkTotalFileSizeThresholdMB");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v3;
  v28 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v28)
  {
    v7 = v5;
    v8 = 0;
    v24 = v7;
    v25 = 0;
    v9 = v7 << 20;
    v26 = v6;
    v27 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "asset", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc_init(MEMORY[0x1E0CD1748]);
        objc_msgSend(v13, "setTreatLivePhotoAsStill:", objc_msgSend(v11, "excludeLiveness"));
        v34 = 0;
        objc_msgSend(MEMORY[0x1E0CD1740], "fetchResourcesToShareForAsset:requestOptions:error:", v12, v13, &v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v34;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v31;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v31 != v18)
                objc_enumerationMutation(v15);
              v8 += objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "fileSize");
              if (v8 > v9)
              {
                v6 = v26;
                v25 = -[NSObject indexOfObject:](v26, "indexOfObject:", v11);
                v20 = 1;
                goto LABEL_17;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
            if (v17)
              continue;
            break;
          }
          v20 = 0;
          v6 = v26;
        }
        else
        {
          v20 = 0;
        }
LABEL_17:

        if ((v20 & 1) != 0)
        {

          PLShareSheetGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            v40 = (double)v8 * 0.000000953674316;
            v41 = 2048;
            v42 = v25 + 1;
            v43 = 2048;
            v44 = v24;
            _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Total selected file size is %.1fMB for the first %lu items, exceeding the threshold (%lluMB)", buf, 0x20u);
          }
          v21 = 1;
          goto LABEL_24;
        }
      }
      v28 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v28)
        continue;
      break;
    }
  }
  v21 = 0;
  v22 = v6;
LABEL_24:

  return v21;
}

+ (BOOL)cmmMediaTypeSpecificFileSizeThresholdIsMetForAssetItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  int v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shareSheetLinkSpatialVideoFileSizeThresholdMB");

  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shareSheetLinkSpatialImageFileSizeThresholdMB");

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v9)
  {
    v10 = v9;
    v29 = v7;
    v30 = v5;
    v36 = v7 << 20;
    v37 = v5 << 20;
    v11 = *(_QWORD *)v44;
    v31 = *(_QWORD *)v44;
    v32 = v8;
LABEL_3:
    v12 = 0;
    v33 = v10;
    while (1)
    {
      if (*(_QWORD *)v44 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
      objc_msgSend(v13, "asset", v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fetchPropertySetsIfNeeded");
      if (objc_msgSend(v14, "isSpatialMedia"))
        break;
LABEL_31:

      if (++v12 == v10)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_33;
      }
    }
    objc_msgSend(v13, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0CD1748]);
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0CD1740], "fetchResourcesToShareForAsset:requestOptions:error:", v15, v16, &v42);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v42;
    v34 = v18;
    v35 = v16;
    if (v17)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v19 = v17;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v20)
      {
        v21 = 0;
        v22 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v19);
            v21 += objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "fileSize");
            v24 = objc_msgSend(v15, "isVideo");
            if (v21 > v37)
              v25 = v24;
            else
              v25 = 0;
            if ((v25 & 1) != 0 || objc_msgSend(v15, "isPhoto") && v21 > v36)
            {
              LOBYTE(v20) = v25 ^ 1;
              goto LABEL_23;
            }
          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v20)
            continue;
          break;
        }
        v25 = 0;
LABEL_23:
        v8 = v32;
        v10 = v33;
        v11 = v31;
        goto LABEL_28;
      }
    }
    else
    {
      v26 = (uint64_t)v18;
      PLShareSheetGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v26;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Auto-CMM: Spatial media resource request error: %@", buf, 0xCu);
      }
      LOBYTE(v20) = 0;
    }
    v25 = 0;
LABEL_28:

    if (!v17)
      goto LABEL_40;
    if (v25)
    {
      PLShareSheetGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v49 = v30;
        _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Selected spatial video exceeds Messages size threshold (%lluMB) for maintaining spatial data", buf, 0xCu);
      }
      goto LABEL_39;
    }
    if ((v20 & 1) != 0)
    {
      PLShareSheetGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v49 = v29;
        _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Selected spatial image exceeds Messages size threshold (%lluMB) for maintaining spatial data", buf, 0xCu);
      }
      LOBYTE(v20) = 1;
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    goto LABEL_31;
  }
LABEL_33:
  LOBYTE(v20) = 0;
  LOBYTE(v25) = 0;
LABEL_41:

  return v25 | v20;
}

void __69__PUActivityViewController_needsConfidentialityCheckForActivityType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[13];

  v8[12] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D7BD08];
  v8[0] = *MEMORY[0x1E0D7BD58];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0D7BE38];
  v8[2] = *MEMORY[0x1E0D7BD48];
  v8[3] = v1;
  v2 = *MEMORY[0x1E0D7BC78];
  v8[4] = *MEMORY[0x1E0D7BC60];
  v8[5] = v2;
  v3 = *MEMORY[0x1E0D7BCA8];
  v8[6] = *MEMORY[0x1E0D7BD98];
  v8[7] = v3;
  v4 = *MEMORY[0x1E0D7BCD8];
  v8[8] = *MEMORY[0x1E0D7BD70];
  v8[9] = v4;
  v5 = *MEMORY[0x1E0D7BDE8];
  v8[10] = *MEMORY[0x1E0D7BE50];
  v8[11] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)needsConfidentialityCheckForActivityType___confidentialityExcludedActivities;
  needsConfidentialityCheckForActivityType___confidentialityExcludedActivities = v6;

}

void __56__PUActivityViewController_photosApplicationActivities___block_invoke(uint64_t a1, void *a2)
{
  PUCompositeVideoActivity *v3;
  PUMessageActivity *v4;
  PUMailActivity *v5;
  PUInternalImageQualityFeedbackActivity *v6;
  PUInternalAutoLoopFeedbackActivity *v7;
  PUInternalGIFExportActivity *v8;
  PUCopyToPasteboardActivity *v9;
  PUCopyLinkActivity *v10;
  PUExportUnmodifiedOriginalsActivity *v11;
  PUContentSyndicationSaveToLibraryActivity *v12;
  PUEditDateTimeActivity *v13;
  PUEditLocationActivity *v14;
  PUSetKeyFaceActivity *v15;
  PUSetSocialGroupKeyPhotoActivity *v16;
  PUNotThisPersonActivity *v17;
  PUSlideShowActivity *v18;
  PUAirPlayActivity *v19;
  PUWallpaperActivity *v20;
  PUHideActivity *v21;
  PUSuggestLessPersonActivity *v22;
  PUSaveToCameraRollActivity *v23;
  PUDuplicateActivity *v24;
  PUAddToAlbumActivity *v25;
  PUAddToLastUsedAlbumActivity *v26;
  PUAlbumStreamActivity *v27;
  PUAssignToContactActivity *v28;
  id v29;
  PUMoveAssetsToSharedLibraryActivity *v30;
  PUMoveAssetsToPersonalLibraryActivity *v31;
  id v32;

  v32 = a2;
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BCA8]))
  {
    v3 = objc_alloc_init(PUCompositeVideoActivity);
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D96DC0]))
  {
    v4 = objc_alloc_init(PUMessageActivity);
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
  {
    v5 = objc_alloc_init(PUMailActivity);
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD70]))
  {
    v6 = objc_alloc_init(PUInternalImageQualityFeedbackActivity);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD58]))
  {
    v7 = objc_alloc_init(PUInternalAutoLoopFeedbackActivity);
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD68]))
  {
    v8 = objc_alloc_init(PUInternalGIFExportActivity);
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D96DA0]))
  {
    v9 = objc_alloc_init(PUCopyToPasteboardActivity);
    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BCC0]))
  {
    v10 = objc_alloc_init(PUCopyLinkActivity);
    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD30]))
  {
    v11 = objc_alloc_init(PUExportUnmodifiedOriginalsActivity);
    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BE60]))
  {
    v12 = objc_alloc_init(PUContentSyndicationSaveToLibraryActivity);
    if (v12)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD10]))
  {
    v13 = objc_alloc_init(PUEditDateTimeActivity);
    if (v13)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD18]))
  {
    v14 = objc_alloc_init(PUEditLocationActivity);
    if (v14)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BDF0]))
  {
    v15 = objc_alloc_init(PUSetKeyFaceActivity);
    if (v15)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BE08]))
  {
    v16 = objc_alloc_init(PUSetSocialGroupKeyPhotoActivity);
    if (v16)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BDB0]))
  {
    v17 = objc_alloc_init(PUNotThisPersonActivity);
    if (v17)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BE38]))
  {
    v18 = objc_alloc_init(PUSlideShowActivity);
    if (v18)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BC80]))
  {
    v19 = objc_alloc_init(PUAirPlayActivity);
    if (v19)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD98]))
  {
    v20 = objc_alloc_init(PUWallpaperActivity);
    if (v20)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD48]))
  {
    v21 = objc_alloc_init(PUHideActivity);
    if (v21)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BE50]))
  {
    v22 = objc_alloc_init(PUSuggestLessPersonActivity);
    if (v22)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D96E08]))
  {
    v23 = objc_alloc_init(PUSaveToCameraRollActivity);
    if (v23)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v23);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD08]))
  {
    v24 = objc_alloc_init(PUDuplicateActivity);
    if (v24)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v24);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BC60]))
  {
    v25 = objc_alloc_init(PUAddToAlbumActivity);
    if (v25)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v25);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BC78]))
  {
    v26 = objc_alloc_init(PUAddToLastUsedAlbumActivity);
    if (v26)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v26);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BC88]))
  {
    v27 = objc_alloc_init(PUAlbumStreamActivity);
    if (v27)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v27);

  }
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D96D90]))
  {
    v28 = objc_alloc_init(PUAssignToContactActivity);
    if (v28)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v28);

  }
  if (MEMORY[0x1AF429AFC]() && objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BD88]))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0D7BA00]);
    if (v29)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v29);

  }
  if (*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BDA8]))
    {
      v30 = objc_alloc_init(PUMoveAssetsToSharedLibraryActivity);
      if (v30)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v30);

    }
    if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D7BDA0]))
    {
      v31 = objc_alloc_init(PUMoveAssetsToPersonalLibraryActivity);
      if (v31)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v31);

    }
  }

}

void __52__PUActivityViewController_defaultActivityTypeOrder__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[73];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0D96DB0];
  v39[0] = *MEMORY[0x1E0D96DC0];
  v39[1] = v1;
  v39[2] = *MEMORY[0x1E0D96E18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v2);

  v3 = *MEMORY[0x1E0D7BDF8];
  v38[0] = *MEMORY[0x1E0D7BDE0];
  v38[1] = v3;
  v4 = *MEMORY[0x1E0D7BE98];
  v38[2] = *MEMORY[0x1E0D7BE00];
  v38[3] = v4;
  v5 = *MEMORY[0x1E0D96E20];
  v38[4] = *MEMORY[0x1E0D7BDD8];
  v38[5] = v5;
  v6 = *MEMORY[0x1E0D7BDA8];
  v38[6] = *MEMORY[0x1E0D7BE30];
  v38[7] = v6;
  v7 = *MEMORY[0x1E0D96E08];
  v38[8] = *MEMORY[0x1E0D7BDA0];
  v38[9] = v7;
  v8 = *MEMORY[0x1E0D7BCE8];
  v38[10] = *MEMORY[0x1E0D7BCE0];
  v38[11] = v8;
  v9 = *MEMORY[0x1E0D7BE08];
  v38[12] = *MEMORY[0x1E0D7BDF0];
  v38[13] = v9;
  v10 = *MEMORY[0x1E0D7BC88];
  v38[14] = *MEMORY[0x1E0D7BDB0];
  v38[15] = v10;
  v11 = *MEMORY[0x1E0D7BC78];
  v38[16] = *MEMORY[0x1E0D7BC60];
  v38[17] = v11;
  v12 = *MEMORY[0x1E0D96DA0];
  v38[18] = *MEMORY[0x1E0D7BE60];
  v38[19] = v12;
  v13 = *MEMORY[0x1E0D7BE10];
  v38[20] = *MEMORY[0x1E0D7BC68];
  v38[21] = v13;
  v14 = *MEMORY[0x1E0D7BEC0];
  v38[22] = *MEMORY[0x1E0D7BEB8];
  v38[23] = v14;
  v15 = *MEMORY[0x1E0D7BCA0];
  v38[24] = *MEMORY[0x1E0D7BE70];
  v38[25] = v15;
  v16 = *MEMORY[0x1E0D7BE40];
  v38[26] = *MEMORY[0x1E0D7BE80];
  v38[27] = v16;
  v17 = *MEMORY[0x1E0D7BEB0];
  v38[28] = *MEMORY[0x1E0D7BE28];
  v38[29] = v17;
  v18 = *MEMORY[0x1E0D7BE78];
  v38[30] = *MEMORY[0x1E0D7BE88];
  v38[31] = v18;
  v19 = *MEMORY[0x1E0D7BEA0];
  v38[32] = *MEMORY[0x1E0D7BE90];
  v38[33] = v19;
  v20 = *MEMORY[0x1E0D7BDC8];
  v38[34] = *MEMORY[0x1E0D7BE20];
  v38[35] = v20;
  v21 = *MEMORY[0x1E0D7BD48];
  v38[36] = *MEMORY[0x1E0D7BD08];
  v38[37] = v21;
  v22 = *MEMORY[0x1E0D7BCC8];
  v38[38] = *MEMORY[0x1E0D7BD38];
  v38[39] = v22;
  v23 = *MEMORY[0x1E0D7BD50];
  v38[40] = *MEMORY[0x1E0D7BCB0];
  v38[41] = v23;
  v24 = *MEMORY[0x1E0D7BE58];
  v38[42] = *MEMORY[0x1E0D7BDB8];
  v38[43] = v24;
  v25 = *MEMORY[0x1E0D7BD00];
  v38[44] = *MEMORY[0x1E0D7BC70];
  v38[45] = v25;
  v26 = *MEMORY[0x1E0D7BCB8];
  v38[46] = *MEMORY[0x1E0D7BC90];
  v38[47] = v26;
  v27 = *MEMORY[0x1E0D7BE38];
  v38[48] = *MEMORY[0x1E0D7BEA8];
  v38[49] = v27;
  v28 = *MEMORY[0x1E0D7BD98];
  v38[50] = *MEMORY[0x1E0D7BC80];
  v38[51] = v28;
  v29 = *MEMORY[0x1E0D7BCD8];
  v38[52] = *MEMORY[0x1E0D7BDE8];
  v38[53] = v29;
  v30 = *MEMORY[0x1E0D7BCC0];
  v38[54] = *MEMORY[0x1E0D7BCA8];
  v38[55] = v30;
  v31 = *MEMORY[0x1E0D7BD10];
  v38[56] = *MEMORY[0x1E0D7BD30];
  v38[57] = v31;
  v32 = *MEMORY[0x1E0D7BE50];
  v38[58] = *MEMORY[0x1E0D7BD18];
  v38[59] = v32;
  v33 = *MEMORY[0x1E0D7BD58];
  v38[60] = *MEMORY[0x1E0D7BD70];
  v38[61] = v33;
  v34 = *MEMORY[0x1E0D7BD88];
  v38[62] = *MEMORY[0x1E0D7BD68];
  v38[63] = v34;
  v38[64] = *MEMORY[0x1E0D7BD78];
  v38[65] = *MEMORY[0x1E0D7BD90];
  v38[66] = *MEMORY[0x1E0D7BD60];
  v38[67] = *MEMORY[0x1E0D7BCD0];
  v38[68] = *MEMORY[0x1E0D7BD20];
  v38[69] = *MEMORY[0x1E0D7BD28];
  v38[70] = *MEMORY[0x1E0D96DB8];
  v38[71] = *MEMORY[0x1E0D96D90];
  v38[72] = *MEMORY[0x1E0D96E00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 73);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v35);

  v36 = objc_msgSend(v0, "copy");
  v37 = (void *)defaultActivityTypeOrder_defaultActivityTypeOrder;
  defaultActivityTypeOrder_defaultActivityTypeOrder = v36;

}

@end
