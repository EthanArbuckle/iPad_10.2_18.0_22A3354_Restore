@implementation PXForYouGadgetViewController

- (PXForYouGadgetViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 badgeManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXGadgetCollectionViewLayout *v12;
  void *v13;
  PXForYouGadgetDataSourceManager *v14;
  PXForYouGadgetViewController *v15;
  PXForYouGadgetViewController *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(PXGadgetCollectionViewLayout);
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXForYouGadgetDataSourceManager initWithSharedLibraryStatusProvider:libraryFilterState:]([PXForYouGadgetDataSourceManager alloc], "initWithSharedLibraryStatusProvider:libraryFilterState:", v13, v10);
  v19.receiver = self;
  v19.super_class = (Class)PXForYouGadgetViewController;
  v15 = -[PXGadgetUIViewController initWithLayout:dataSourceManager:](&v19, sel_initWithLayout_dataSourceManager_, v12, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    objc_storeStrong((id *)&v16->_sharedLibraryStatusProvider, v13);
    objc_storeStrong((id *)&v16->_libraryFilterState, a4);
    objc_storeStrong((id *)&v16->_badgeManager, a5);
    v16->_sharedLibrarySuggestionsAllowed = PLIsSharedLibrarySuggestionsEnabled();
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addDeferredKeyObserver:", v16);

    v16->_featuredContentAllowed = PLIsFeaturedContentAllowed();
  }

  return v16;
}

- (PXForYouGadgetViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouGadgetViewController.m"), 121, CFSTR("%s is not available as initializer"), "-[PXForYouGadgetViewController init]");

  abort();
}

- (void)reloadContent
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController reloadContent](&v2, sel_reloadContent);
}

- (void)_reloadContentDueToSettingsChangeWithDelay
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadContent, 0);
  -[PXForYouGadgetViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadContent, 0, 0.5);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {
    +[PXForYouSettings keyPathsAffectingGadgetVisibility](PXForYouSettings, "keyPathsAffectingGadgetVisibility");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if (v9)
      -[PXForYouGadgetViewController _reloadContentDueToSettingsChangeWithDelay](self, "_reloadContentDueToSettingsChangeWithDelay");
  }
  else
  {

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXContentUnavailablePlaceholderManager *v10;
  void *v11;
  PXContentUnavailablePlaceholderManager *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PXForYouGadgetViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_21313);

  -[PXForYouGadgetViewController libraryFilterState](self, "libraryFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerChangeObserver:context:", self, PXLibraryFilterStateObservationContext_21314);

  PXLocalizedStringFromTable(CFSTR("PXForYouNoContentTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("EMPTY_FOR_YOU_MESSAGE_%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [PXContentUnavailablePlaceholderManager alloc];
  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXContentUnavailablePlaceholderManager initWithGadgetDataSourceManager:customTitle:customMessage:](v10, "initWithGadgetDataSourceManager:customTitle:customMessage:", v11, v5, v9);
  -[PXGadgetUIViewController setPlaceholderManager:](self, "setPlaceholderManager:", v12);

  -[PXForYouGadgetViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventSourceWillAppear:sender:", 18, self);

  PXRegisterPreferencesObserver(self);
  -[PXForYouGadgetViewController setFeaturedContentAllowed:](self, "setFeaturedContentAllowed:", PLIsFeaturedContentAllowed());
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v4 = (void *)MEMORY[0x1E0DC37E0];
  -[PXForYouGadgetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXForYouGadgetViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setVisibleRectEdgeInsets:", -200.0, 0.0, -200.0, 0.0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventSourceDidDisappear:sender:", 18, self);

  PXUnregisterPreferencesObserver(self);
}

- (void)rootGadgetControllerWillAppear
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  -[PXForYouGadgetViewController presentedViewController](self, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[PXForYouGadgetViewController rootGadgetControllerHasAppearedOnce](self, "rootGadgetControllerHasAppearedOnce"), v4, !v5))
  {
    -[PXForYouGadgetViewController setRootGadgetControllerHasAppearedOnce:](self, "setRootGadgetControllerHasAppearedOnce:", 1);
    -[PXForYouGadgetViewController badgeManager](self, "badgeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unreadBadgeCount");

    if (v7)
      -[PXForYouGadgetViewController reloadContent](self, "reloadContent");
    -[PXForYouGadgetViewController _userDidViewForYouContent](self, "_userDidViewForYouContent");
  }
}

- (void)rootGadgetControllerDidDisappear
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXSetForYouLastExitedDate(v3);

  -[PXForYouGadgetViewController _userDidViewForYouContent](self, "_userDidViewForYouContent");
}

- (void)configureSectionHeader:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXForYouGadgetViewController;
  v3 = a3;
  -[PXGadgetUIViewController configureSectionHeader:](&v4, sel_configureSectionHeader_, v3);
  objc_msgSend(v3, "setShouldShowDividerOnFirstSection:", 1, v4.receiver, v4.super_class);

}

- (int64_t)scrollAnimationIdentifier
{
  return 1;
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  if ((a4 & 0x10) != 0)
    -[PXForYouGadgetViewController _handleTapToRadar](self, "_handleTapToRadar");
  v7.receiver = self;
  v7.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController gadget:didChange:](&v7, sel_gadget_didChange_, v6, a4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_21313 == a5
    || (void *)PXLibraryFilterStateObservationContext_21314 == a5)
  {
    if ((a4 & 3) != 0)
      -[PXForYouGadgetViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXForYouGadgetViewController;
    -[PXGadgetUIViewController observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (void)_updateNavigationBarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXForYouGadgetViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSharedLibraryOrPreview"))
  {
    -[PXForYouGadgetViewController libraryFilterState](self, "libraryFilterState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibrarySwitchLibraryButtonItems(v4, objc_msgSend(v3, "hasPreview"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v5);

  }
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canShowInternalUI");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.circle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v10, 0, self, sel__handleTapToRadar);
    objc_msgSend(v13, "addObject:", v11);

  }
  -[PXForYouGadgetViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItems:", v13);

}

- (void)_handleTapToRadar
{
  void *v3;
  PXFeedbackTapToRadarViewController *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int, int, void *);
  void *v9;
  PXForYouGadgetViewController *v10;
  id v11;

  +[PXFeedbackTapToRadarUtilities captureScreenshot](PXFeedbackTapToRadarUtilities, "captureScreenshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PXFeedbackTapToRadarViewController);
  -[PXFeedbackTapToRadarViewController setRequestScreenshotPermission:](v4, "setRequestScreenshotPermission:", 1);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __49__PXForYouGadgetViewController__handleTapToRadar__block_invoke;
  v9 = &unk_1E5125978;
  v10 = self;
  v11 = v3;
  v5 = v3;
  -[PXFeedbackTapToRadarViewController setFileRadarHandler:](v4, "setFileRadarHandler:", &v6);
  -[PXGadgetUIViewController presentGadgetViewController:animated:completion:](self, "presentGadgetViewController:animated:completion:", v4, 1, 0, v6, v7, v8, v9, v10);

}

- (id)_suggestionDumpURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  double v26;
  int v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd-'T'-HH-mm-ss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Suggestion_Dump_%@.txt"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Suggestion Dump\n\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v14);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(v9, "appendString:", CFSTR("Found no existing suggestions.\n"));
    goto LABEL_17;
  }
  v36 = v11;
  v37 = v8;
  objc_msgSend(v9, "appendFormat:", CFSTR("Found %lu existing suggestions:\n"), objc_msgSend(v15, "count"));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v17)
    goto LABEL_15;
  v18 = v17;
  v32 = v7;
  v33 = v5;
  v34 = v4;
  v35 = v2;
  v19 = 0;
  v20 = *(_QWORD *)v40;
  do
  {
    v21 = 0;
    v22 = v19;
    do
    {
      if (*(_QWORD *)v40 != v20)
        objc_enumerationMutation(v16);
      v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
      objc_msgSend(v23, "creationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v24;
      if (!v22)
      {
        v25 = CFSTR("\n");
LABEL_11:
        objc_msgSend(v9, "appendFormat:", CFSTR("%@Generation starting at %@ \n"), v25, v19);
        goto LABEL_12;
      }
      objc_msgSend(v24, "timeIntervalSinceDate:", v22);
      v25 = CFSTR("\n\n");
      if (v26 > 300.0)
        goto LABEL_11;
LABEL_12:
      objc_msgSend(v9, "appendFormat:", CFSTR("  %@\n"), v23);

      ++v21;
      v22 = v19;
    }
    while (v18 != v21);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  }
  while (v18);

  v4 = v34;
  v2 = v35;
  v7 = v32;
  v5 = v33;
LABEL_15:

  v11 = v36;
  v8 = v37;
LABEL_17:
  v38 = 0;
  v27 = objc_msgSend(v9, "writeToURL:atomically:encoding:error:", v8, 1, 4, &v38);
  v28 = v38;
  if (v27)
  {
    v29 = v8;
  }
  else
  {
    PLUIGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v28;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEBUG, "Failed to save suggesiton dump, error: %@", buf, 0xCu);
    }

    v29 = 0;
  }

  return v29;
}

- (void)_userDidViewForYouContent
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXForYouBadgeManager setLastSeenBadgeDate:](PXForYouBadgeManager, "setLastSeenBadgeDate:", v3);

  -[PXForYouGadgetViewController badgeManager](self, "badgeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:", &__block_literal_global_21235);

  objc_msgSend(MEMORY[0x1E0D71BA8], "userDidViewCloudFeedContent:", 3);
}

- (void)navigateToSharedAlbumActivityFeedAnimated:(BOOL)a3 configuration:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PXForYouGadgetViewController *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  PXForYouGadgetViewController *v21;
  id v22;
  _QWORD v23[4];
  PXForYouGadgetViewController *v24;
  id v25;
  _QWORD v26[4];
  PXForYouGadgetViewController *v27;
  id v28;
  uint8_t buf[4];
  PXForYouGadgetViewController *v30;
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_class();
  -[PXForYouGadgetViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_sharedAlbumFeedViewControllerWithTraitCollection:", v11);
  v12 = (PXForYouGadgetViewController *)objc_claimAutoreleasedReturnValue();

  if ((-[PXForYouGadgetViewController conformsToProtocol:](v12, "conformsToProtocol:", &unk_1EEBEAD80) & 1) == 0)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "%@ doesn't conform to PLCloudFeedNavigating", buf, 0xCu);
    }

  }
  if ((-[PXForYouGadgetViewController conformsToProtocol:](v12, "conformsToProtocol:", &unk_1EEBE97A8) & 1) == 0)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "%@ doesn't conform to PXNavigableCloudFeedViewController", buf, 0xCu);
    }

  }
  v15 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __99__PXForYouGadgetViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke;
    v26[3] = &unk_1E5148CE0;
    v28 = v8;
    v27 = v12;
    -[PXForYouGadgetViewController performWhenReadyToNavigate:](v27, "performWhenReadyToNavigate:", v26);
    -[PXForYouGadgetViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "standardAppearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEdgeAppearance:", v18);

  }
  -[PXForYouGadgetViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    PXAssertGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = self;
      _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "missing navigation controller for %@", buf, 0xCu);
    }

  }
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __99__PXForYouGadgetViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke_313;
  v23[3] = &unk_1E5148CE0;
  v24 = v12;
  v25 = v9;
  v21 = v12;
  v22 = v9;
  objc_msgSend(v19, "px_pushViewController:animated:completion:", v21, v6, v23);

}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "type");
  return v3 <= 0x19 && ((1 << v3) & 0x3140600) != 0;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  char v15;
  void *v16;
  PXSurveyRadarReporterViewController *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  PXForYouGadgetViewController *v28;
  id v29;
  unint64_t v30;
  SEL v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  unint64_t v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  PXForYouGadgetViewController *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v9, "type");
  switch(v11)
  {
    case 24:
      -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_2;
      v34[3] = &unk_1E5119960;
      v35 = v9;
      v37 = a4;
      v14 = v10;
      v36 = v14;
      v15 = objc_msgSend(v12, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 17, 0, v34);

      if ((v15 & 1) == 0)
      {
        PXSurveyQuestionRadarConfiguration(CFSTR("Photos Challenge Submission"), MEMORY[0x1E0C9AA60]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PXSurveyRadarReporterViewController initWithConfiguration:completionHandler:]([PXSurveyRadarReporterViewController alloc], "initWithConfiguration:completionHandler:", v16, 0);
        v32[0] = v13;
        v32[1] = 3221225472;
        v32[2] = __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_3;
        v32[3] = &unk_1E5148A40;
        v33 = v14;
        -[PXForYouGadgetViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, v32);

      }
      v18 = v35;
      goto LABEL_11;
    case 20:
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke;
      v38[3] = &unk_1E5137700;
      v39 = v10;
      -[PXForYouGadgetViewController navigateToSharedAlbumActivityFeedAnimated:configuration:completion:](self, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", (a4 >> 1) & 1, 0, v38);
      v18 = v39;
LABEL_11:

      goto LABEL_17;
    case 18:
      (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
      goto LABEL_17;
  }
  v19 = -[PXForYouGadgetViewController _gadgetTypeForDestinationType:](self, "_gadgetTypeForDestinationType:", objc_msgSend(v9, "type"));
  if (v19)
  {
    v20 = v19;
    -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_4;
    v26[3] = &unk_1E5119988;
    v27 = v9;
    v30 = a4;
    v31 = a2;
    v28 = self;
    v29 = v10;
    objc_msgSend(v21, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", v20, 0, v26);

    v18 = v27;
    goto LABEL_11;
  }
  PXAssertGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "publicDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = self;
    v42 = 2112;
    v43 = v25;
    _os_log_error_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "For you %@ failed to navigate to destination %@", buf, 0x16u);

  }
  PLUIGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "publicDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = self;
    v42 = 2114;
    v43 = v24;
    _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "For you %@ failed to navigate to destination %{public}@", buf, 0x16u);

  }
  (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 2, 0);
LABEL_17:

}

- (unint64_t)_gadgetTypeForDestinationType:(int64_t)a3
{
  unint64_t v3;

  v3 = 20;
  if (a3 != 25)
    v3 = 0;
  if ((unint64_t)(a3 - 9) >= 2)
    return v3;
  else
    return 5;
}

- (id)px_navigationDestination
{
  return -[PXProgrammaticNavigationDestination initWithType:revealMode:]([PXProgrammaticNavigationDestination alloc], "initWithType:revealMode:", 18, 0);
}

- (void)navigationHelperDidNotFindValidGadget:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXForYouGadgetViewController;
  -[PXGadgetUIViewController navigationHelperDidNotFindValidGadget:](&v6, sel_navigationHelperDidNotFindValidGadget_, a3);
  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "didLoadRemainingGadgets"))
  {
    -[PXForYouGadgetViewController libraryFilterState](self, "libraryFilterState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "viewMode"))
      objc_msgSend(v5, "setViewMode:", 0);

  }
}

- (void)preferencesDidChange
{
  -[PXForYouGadgetViewController setFeaturedContentAllowed:](self, "setFeaturedContentAllowed:", PLIsFeaturedContentAllowed());
  -[PXForYouGadgetViewController setSharedLibrarySuggestionsAllowed:](self, "setSharedLibrarySuggestionsAllowed:", PLIsSharedLibrarySuggestionsEnabled());
}

- (void)setFeaturedContentAllowed:(BOOL)a3
{
  if (self->_featuredContentAllowed != a3)
  {
    self->_featuredContentAllowed = a3;
    -[PXForYouGadgetViewController _reloadContentDueToSettingsChangeWithDelay](self, "_reloadContentDueToSettingsChangeWithDelay");
  }
}

- (void)setSharedLibrarySuggestionsAllowed:(BOOL)a3
{
  if (self->_sharedLibrarySuggestionsAllowed != a3)
  {
    self->_sharedLibrarySuggestionsAllowed = a3;
    -[PXForYouGadgetViewController _reloadContentDueToSettingsChangeWithDelay](self, "_reloadContentDueToSettingsChangeWithDelay");
  }
}

- (void)ppt_navigateToFirstInvitationCMM:(BOOL)a3 withCompleteHandler:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouGadgetViewController.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PXForYouGadgetViewController_ppt_navigateToFirstInvitationCMM_withCompleteHandler___block_invoke;
  v11[3] = &unk_1E5119A00;
  v13 = a3;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 1, 0, v11);

}

- (void)ppt_navigateToLatestMemoryWithWillPresentHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__PXForYouGadgetViewController_ppt_navigateToLatestMemoryWithWillPresentHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5119A28;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 5, 0, v11);

}

- (void)ppt_navigateToContentSyndicationGridViewControllerWithCompleteHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouGadgetViewController.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__PXForYouGadgetViewController_ppt_navigateToContentSyndicationGridViewControllerWithCompleteHandler___block_invoke;
  v9[3] = &unk_1E51199D8;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 21, 0, v9);

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXForYouBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (BOOL)rootGadgetControllerHasAppearedOnce
{
  return self->_rootGadgetControllerHasAppearedOnce;
}

- (void)setRootGadgetControllerHasAppearedOnce:(BOOL)a3
{
  self->_rootGadgetControllerHasAppearedOnce = a3;
}

- (BOOL)featuredContentAllowed
{
  return self->_featuredContentAllowed;
}

- (BOOL)sharedLibrarySuggestionsAllowed
{
  return self->_sharedLibrarySuggestionsAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __102__PXForYouGadgetViewController_ppt_navigateToContentSyndicationGridViewControllerWithCompleteHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ppt_presentSeeAllViewController");
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __99__PXForYouGadgetViewController_ppt_navigateToLatestMemoryWithWillPresentHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ppt_transitionToFirstItemWithWillPresentHandler:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

void __85__PXForYouGadgetViewController_ppt_navigateToFirstInvitationCMM_withCompleteHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__21188;
    v18 = __Block_byref_object_dispose__21189;
    v19 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__PXForYouGadgetViewController_ppt_navigateToFirstInvitationCMM_withCompleteHandler___block_invoke_343;
    v12[3] = &unk_1E51199B0;
    v13 = *(_BYTE *)(a1 + 48);
    v12[4] = &v14;
    objc_msgSend(v5, "enumerateGadgetsUsingBlock:", v12);
    if (v15[5])
    {
      objc_msgSend(v4, "navigationHelper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15[5];
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __85__PXForYouGadgetViewController_ppt_navigateToFirstInvitationCMM_withCompleteHandler___block_invoke_2;
      v10[3] = &unk_1E51199D8;
      v9 = *(id *)(a1 + 40);
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v9;
      objc_msgSend(v7, "navigateToGadgetWithIdDeferIfNeeded:animated:nestedNavigationBlock:", v8, 0, v10);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __85__PXForYouGadgetViewController_ppt_navigateToFirstInvitationCMM_withCompleteHandler___block_invoke_343(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v15;
    v10 = v9;
    v11 = *(unsigned __int8 *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v9, "invitation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "shareType") == 1)
      {
        v12 = 0;
        goto LABEL_11;
      }
      if (*(_BYTE *)(a1 + 40))
      {

        v13 = 0;
        goto LABEL_16;
      }
    }
    objc_msgSend(v10, "invitation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shareType"))
    {
      v14 = 0;
      v13 = 0;
      goto LABEL_12;
    }
    v12 = 1;
LABEL_11:
    objc_msgSend(v10, "uniqueGadgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;
    if (!v12)
    {
LABEL_13:
      if (!v11)
      {
        if (!v14)
          goto LABEL_16;
        goto LABEL_15;
      }

      if (v14)
      {
LABEL_15:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v13);
        *a3 = 1;
      }
LABEL_16:

      v8 = v15;
      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_17:

}

void __85__PXForYouGadgetViewController_ppt_navigateToFirstInvitationCMM_withCompleteHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "presentDetailViewAnimated:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "navigateToDestination:options:completionHandler:", a1[4], a1[6], a1[5]);
}

uint64_t __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__PXForYouGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE9B41A0))
  {
    objc_msgSend(v3, "navigateToDestination:options:completionHandler:", a1[4], a1[7], a1[6]);
  }
  else
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Gadget %@ is not a navigation participant", (uint8_t *)&v10, 0xCu);

    }
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Gadget %{public}@ is not a navigation participant", (uint8_t *)&v10, 0xCu);

    }
    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t __99__PXForYouGadgetViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __99__PXForYouGadgetViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke_313(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __57__PXForYouGadgetViewController__userDidViewForYouContent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUnreadBadgeCount:", 0);
}

void __49__PXForYouGadgetViewController__handleTapToRadar__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v31 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("[\n"));
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = (void *)objc_opt_new();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __49__PXForYouGadgetViewController__handleTapToRadar__block_invoke_2;
  v32[3] = &unk_1E51198F8;
  v36 = v10;
  v37 = 0x7FEFFFFFFFFFFFFFLL;
  v13 = v7;
  v33 = v13;
  v14 = v11;
  v34 = v14;
  v35 = &v38;
  objc_msgSend(v12, "enumerateGadgetsUsingBlock:", v32);

  objc_msgSend(v13, "appendString:", CFSTR("]"));
  objc_msgSend(*(id *)(a1 + 32), "placeholderManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "placeholderManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "wantsPlaceholder");

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "placeholderManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeholderTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "placeholderManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placeholderMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("title=\"%@\" subtitle=\"%@\"), v20, v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = CFSTR("No Placeholder Needed");
    }
  }
  else
  {
    v23 = CFSTR("nil");
  }
  objc_msgSend(*(id *)(a1 + 32), "_suggestionDumpURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v14, "addObject:", v24);
  +[PXFeedbackTapToRadarUtilities defaultDescription](PXFeedbackTapToRadarUtilities, "defaultDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v26, "appendString:", CFSTR("---For You Feed Tap-To-Radar---\n"));
  objc_msgSend(v26, "appendFormat:", CFSTR("Number of Gadgets: %lu\n"), v39[3]);
  objc_msgSend(v26, "appendFormat:", CFSTR("Gadgets: %@"), v13);
  objc_msgSend(v26, "appendFormat:", CFSTR("Placeholder: %@"), v23);
  if (a2 && *(_QWORD *)(a1 + 40))
  {
    v43[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_11:
      v28 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_14;
    }
  }
  else
  {
    v27 = 0;
    if (!a3)
      goto LABEL_11;
  }
  v42 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  if (objc_msgSend(v14, "count"))
    v29 = v14;
  else
    v29 = 0;
  LOWORD(v30) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", CFSTR("For You - [TTR] <Insert Bug Title>"), v26, CFSTR("Other Bug"), CFSTR("937059"), CFSTR("Photos UI For You"), CFSTR("all"), 0, v27, v29, v30, v28, 0);

  _Block_object_dispose(&v38, 8);
}

void __49__PXForYouGadgetViewController__handleTapToRadar__block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "localizedTitle");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E5149688;
  }
  objc_msgSend(v13, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE9FAD30);

  if (v5)
  {
    objc_msgSend(v13, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXForYouRankableDebugDescription(v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("*Not PXForYouRankable*");
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  objc_msgSend(v13, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Class:%@   Title:%@   Height:%.02f (%@)\n"), v9, v3, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "debugURLsForDiagnostics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v12);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

@end
