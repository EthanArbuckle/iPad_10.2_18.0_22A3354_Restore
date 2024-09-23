@implementation PXStoryViewModel

- (id)makeDefaultActionsMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  PXStoryViewModel *v6;
  id v7;
  _QWORD v9[6];

  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = sub_1A6F72A1C;
  v9[5] = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1A6B9D0F0;
  v9[3] = &block_descriptor_5;
  v5 = _Block_copy(v9);
  v6 = self;
  swift_release();
  v7 = objc_msgSend(v3, sel_menuWithDeferredConfiguration_, v5);
  _Block_release(v5);

  return v7;
}

- (void)addInternalActionsTo:(id)a3
{
  objc_class *v4;
  PXMenuBuilder v5;
  NSMutableArray *menuItems;

  v4 = (objc_class *)a3;
  v5._menuItems = (NSMutableArray *)self;
  menuItems = v5._menuItems;
  v5.super.isa = v4;
  PXStoryViewModel.addInternalActions(to:)(v5);

}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v6;
  void (**v7)(void *, void *);
  id v8;
  id v9;
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
  _BOOL4 v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v45)(void *, void *);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD aBlock[4];
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXStoryViewModel_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke;
  aBlock[3] = &unk_1E51485B0;
  v46 = v6;
  v52 = v46;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (a3 == 14)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[PXStoryViewModel lastMainModelChangeDate](self, "lastMainModelChangeDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("Playback Started: %@\n"), v11);
    v7[2](v7, v12);

  }
  -[PXStoryViewModel diagnosticTextForHUDType:](self, "diagnosticTextForHUDType:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v13);

  -[PXStoryViewModel mainModel](self, "mainModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "diagnosticTextForHUDType:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v15);

  -[PXStoryViewModel musicPlayer](self, "musicPlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "diagnosticTextForHUDType:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v17);

  -[PXStoryViewModel pacingController](self, "pacingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "diagnosticTextForHUDType:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v19);

  if (a3 == 14)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    v21 = -[PXStoryViewModel shouldPreventDisplaySleep](self, "shouldPreventDisplaySleep");
    v22 = CFSTR("No 😴");
    if (v21)
      v22 = CFSTR("Yes 😳");
    v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("Prevent Sleep: %@\n"), v22);
    v7[2](v7, v23);

    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    PXStoryViewModeDescription(-[PXStoryViewModel viewMode](self, "viewMode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("View Mode: %@\n"), v25);
    v7[2](v7, v26);

  }
  -[PXStoryViewModel errorRepository](self, "errorRepository");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorsByComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");

  for (i = 0; i != 20; ++i)
  {
    -[PXStoryViewModel diagnosticHUDContentProviderForType:](self, "diagnosticHUDContentProviderForType:", i);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "diagnosticErrorsByComponentForHUDType:", i);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      objc_msgSend(v29, "addEntriesFromDictionary:", v32);

  }
  if (objc_msgSend(v29, "count"))
  {
    v45 = v7;
    objc_msgSend(v46, "appendString:", CFSTR("\n⚠️ Errors:\n"));
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v29, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v29, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localizedDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          PXStoryErrorDetailsDescription(v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "appendFormat:", CFSTR("• %@: %@ / %@\n"), v39, v41, v42);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v36);
    }

    v7 = v45;
  }
  v43 = (void *)objc_msgSend(v46, "copy");

  return v43;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (NSString)diagnosticDescriptionForAllHUDTypes
{
  return (NSString *)PXStoryDiagnosticDescriptionForAllHUDTypes(self, 0);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryDiagnosticDescriptionForAllHUDTypes(self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttachmentWithText:name:", v5, CFSTR("HUD"));
  -[PXStoryViewModel mainModel](self, "mainModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubprovider:", v6);

  -[PXStoryViewModel relatedController](self, "relatedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubprovider:", v7);

  -[PXStoryViewModel pacingController](self, "pacingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubprovider:", v8);

  -[PXStoryViewModel memoryDebugInfo](self, "memoryDebugInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v11, "addAttachmentWithDictionary:name:", v9, CFSTR("MemoryInfoAndCuration"));
  v10 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5EF0), "initWithRootProvider:", self);
  objc_msgSend(v10, "setName:", CFSTR("Visual Diagnostics"));
  objc_msgSend(v10, "setIsPrivateDataAllowed:", objc_msgSend(v4, "includeImagesInVisualDiagnosticsForTTR"));
  objc_msgSend(v11, "addSubprovider:", v10);

}

- (id)memoryDebugInfo
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  -[PXStoryViewModel mainAssetCollection](self, "mainAssetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photosGraphProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:](PXMemoriesRelatedDiagnosticsHelper, "preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:", v5, v6, objc_msgSend(v3, "photosGraphVersion"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v3, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "curationDebugInformationForAssetCollectionWithLocalIdentifier:options:error:", v9, &unk_1E53EFF80, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v8, "addEntriesFromDictionary:", v10);
    +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("memorySummary"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  PXStoryTimelineVisualDiagnosticsProvider *v8;
  void *v9;
  PXStoryTimelineVisualDiagnosticsProvider *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = [PXStoryTimelineVisualDiagnosticsProvider alloc];
  -[PXStoryViewModel mainModel](self, "mainModel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel extendedTraitCollection](self, "extendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  v10 = -[PXStoryTimelineVisualDiagnosticsProvider initWithModel:screenScale:](v8, "initWithModel:screenScale:", v11);
  -[PXStoryTimelineVisualDiagnosticsProvider addVisualDiagnosticsToContext:completionHandler:](v10, "addVisualDiagnosticsToContext:completionHandler:", v7, v6);

}

void __70__PXStoryViewModel_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v3);
  }

}

- (PXStoryViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModel.m"), 208, CFSTR("%s is not available as initializer"), "-[PXStoryViewModel init]");

  abort();
}

- (PXStoryViewModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4 timeSource:(id)a5 mediaProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  PXStoryPausableLoadingCoordinator *v27;
  void *v28;
  void *v29;
  PXStoryModel *v30;
  void *v31;
  PXStoryViewLayoutSpecManager *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  PXStoryResourcesPreloadingCoordinator *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_class *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  PXInfoUpdater *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  dispatch_queue_t v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  PXStoryViewChromeTitleInfo *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  PXStoryViewAccessibilityHUDContentProvider *v69;
  void *v70;
  void *v71;
  char *v72;
  PXStoryModel *v73;
  uint64_t v74;
  void *v75;
  id v77;
  id v78;
  _QWORD v79[4];
  char *v80;
  PXStoryModel *v81;
  objc_super v82;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v82.receiver = self;
  v82.super_class = (Class)PXStoryViewModel;
  v15 = -[PXStoryViewModel init](&v82, sel_init);
  if (v15)
  {
    v77 = v14;
    objc_msgSend(v11, "log");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLog:", v16);

    objc_msgSend(v15, "setLogContext:", objc_msgSend(v11, "logContext"));
    objc_storeStrong((id *)v15 + 58, a3);
    v17 = v15 + 704;
    objc_storeStrong((id *)v15 + 88, a4);
    objc_storeStrong((id *)v15 + 89, a5);
    objc_storeStrong((id *)v15 + 90, a6);
    v15[97] = objc_msgSend(v11, "isAllowedToPlayAnyMusicOrSound");
    *(_OWORD *)(v15 + 920) = 0u;
    *(_OWORD *)(v15 + 936) = 0u;
    *(_OWORD *)(v15 + 952) = 0u;
    *(_OWORD *)(v15 + 968) = 0u;
    *((_QWORD *)v15 + 123) = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v15 + 56);
    *((_QWORD *)v15 + 56) = v19;

    objc_msgSend(v11, "storyQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v15 + 24);
    *((_QWORD *)v15 + 24) = v21;

    *((_QWORD *)v15 + 26) = objc_msgSend(v11, "initialViewMode");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("PXStoryVolume"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = v13;
    if (v24)
    {
      objc_msgSend(v24, "floatValue");
      v26 = v25;
    }
    else
    {
      v26 = 1.0;
    }
    *((double *)v15 + 69) = v26;
    v27 = objc_alloc_init(PXStoryPausableLoadingCoordinator);
    v28 = (void *)*((_QWORD *)v15 + 76);
    *((_QWORD *)v15 + 76) = v27;

    objc_msgSend(*((id *)v15 + 76), "pauseTimelineWork");
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:]([PXStoryModel alloc], "initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:", *((_QWORD *)v15 + 58), *v17, *((_QWORD *)v15 + 76), objc_msgSend(v29, "fullsizePaperTrailOptions"));
    *((_QWORD *)v15 + 27) = -[PXStoryModel desiredPlayState](v30, "desiredPlayState");
    objc_msgSend(v11, "presentingViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v15 + 63, v31);

    v32 = -[PXFeatureSpecManager initWithExtendedTraitCollection:]([PXStoryViewLayoutSpecManager alloc], "initWithExtendedTraitCollection:", *v17);
    v33 = (void *)*((_QWORD *)v15 + 72);
    *((_QWORD *)v15 + 72) = v32;

    objc_msgSend(*((id *)v15 + 72), "setStoryConfigurationOptions:", objc_msgSend(v11, "options"));
    objc_msgSend(*((id *)v15 + 72), "registerChangeObserver:context:", v15, ViewLayoutSpecManagerObservationContext);
    *((_QWORD *)v15 + 32) = -268435457;
    if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
      *((_QWORD *)v15 + 32) &= ~0x20000000uLL;
    objc_msgSend(v29, "addDeferredKeyObserver:", v15);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)*((_QWORD *)v15 + 75);
    *((_QWORD *)v15 + 75) = v34;

    v36 = -[PXStoryResourcesPreloadingCoordinator initWithQueue:]([PXStoryResourcesPreloadingCoordinator alloc], "initWithQueue:", *((_QWORD *)v15 + 24));
    v37 = (void *)*((_QWORD *)v15 + 91);
    *((_QWORD *)v15 + 91) = v36;

    objc_msgSend(v11, "errorReporter");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v15 + 54);
    *((_QWORD *)v15 + 54) = v38;

    objc_msgSend(v11, "errorRepository");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v15 + 92);
    *((_QWORD *)v15 + 92) = v40;

    objc_msgSend(*((id *)v15 + 92), "registerChangeObserver:context:", v15, ErrorRepositoryObservationContext);
    objc_msgSend(v11, "volumeController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (!v42)
    {
      +[PXDeviceVolumeController sharedInstance](PXDeviceVolumeController, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)v15 + 77, v43);
    if (!v42)

    objc_msgSend(v11, "userDefaults");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (!v44)
    {
      +[PXUserDefaultsStandardDataSource sharedInstance](PXUserDefaultsStandardDataSource, "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)v15 + 78, v45);
    if (!v44)

    +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "registerObserver:queue:", v15, *((_QWORD *)v15 + 24));

    *((_QWORD *)v15 + 61) = 0x7FFFFFFFFFFFFFFFLL;
    v47 = objc_alloc(MEMORY[0x1E0CB3940]);
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v47, "initWithFormat:", CFSTR("changeOrigin-%@-%p"), v49, v15);
    v51 = (void *)*((_QWORD *)v15 + 74);
    *((_QWORD *)v15 + 74) = v50;

    v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v53 = (void *)*((_QWORD *)v15 + 82);
    *((_QWORD *)v15 + 82) = v52;

    v54 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v55 = (void *)*((_QWORD *)v15 + 83);
    *((_QWORD *)v15 + 83) = v54;

    v56 = -[PXInfoUpdater initWithInfoProvider:infoKind:]([PXInfoUpdater alloc], "initWithInfoProvider:infoKind:", v15, CFSTR("PXStoryViewModelMainAssetInfoKind"));
    v57 = (void *)*((_QWORD *)v15 + 80);
    *((_QWORD *)v15 + 80) = v56;

    objc_msgSend(*((id *)v15 + 80), "setObserver:", v15);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v58 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v58, QOS_CLASS_USER_INITIATED, 0);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = dispatch_queue_create("PXStoryViewModel.mainAssetlocationQueue", v59);
    v61 = (void *)*((_QWORD *)v15 + 81);
    *((_QWORD *)v15 + 81) = v60;

    v15[177] = 1;
    if ((objc_msgSend(v11, "wantsFeedbackAction") & 1) != 0)
    {
      +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v15[173] = objc_msgSend(v62, "canShowInternalUI");

    }
    else
    {
      v15[173] = 0;
    }
    v15[181] = 0;
    objc_msgSend(*((id *)v15 + 78), "persistedValueForKey:", CFSTR("PXStoryViewModelAutoReplay"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v63, "BOOLValue") & 1) != 0)
      v64 = 1;
    else
      v64 = objc_msgSend(v15, "assetCollectionForcesAutoReplay");
    v15[174] = v64;
    v65 = objc_alloc_init(PXStoryViewChromeTitleInfo);
    v66 = (void *)*((_QWORD *)v15 + 67);
    *((_QWORD *)v15 + 67) = v65;

    v67 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v15, sel__setNeedsUpdate);
    v68 = (void *)*((_QWORD *)v15 + 73);
    *((_QWORD *)v15 + 73) = v67;

    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateViewMode);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateAXStoredPlayState);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateSpecManager);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateViewModeTransition);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateDesiredPlayState);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateDiagnosticHUDState);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateWantsRelatedOverlayScrollable);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updatePlaybackFractionCompleted);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updatePlaybackDuration);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateMainAssetCollection);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updatePhotosGridEffectProvider);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateViewLayoutSpec);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateViewModelControllers);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateMainModelControllers);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateMainModelProperties);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateControllersActiveness);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateSongControllerFailedAssets);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateLegibilityOverlayOpacity);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateIsAnyMenuOpen);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateShouldAutoHideChrome);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateShouldAutoHideMuteToggleButton);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateShouldPreventDisplaySleep);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateErrorIndicator);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateHUDSettings);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateIsInSelectMode);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateCanToggleSelectMode);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateRecentlyUsedSongs);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateOutroFractionCompleted);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateMainAsset);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateDisplayTitleAndSubtitle);
    objc_msgSend(*((id *)v15 + 73), "addUpdateSelector:", sel__updateWantsSoloPlayback);
    v69 = -[PXStoryViewAccessibilityHUDContentProvider initWithViewModel:]([PXStoryViewAccessibilityHUDContentProvider alloc], "initWithViewModel:", v15);
    v70 = (void *)*((_QWORD *)v15 + 16);
    *((_QWORD *)v15 + 16) = v69;

    objc_msgSend(v15, "HUDObservable");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "registerChangeObserver:context:", v15, HUDObservableObservationContext);

    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __91__PXStoryViewModel_initWithConfiguration_extendedTraitCollection_timeSource_mediaProvider___block_invoke;
    v79[3] = &unk_1E5132A08;
    v72 = v15;
    v80 = v72;
    v81 = v30;
    v73 = v30;
    objc_msgSend(v72, "performChanges:", v79);
    objc_msgSend(v72, "_registerForAccessibilityEvents");
    *((_QWORD *)v72 + 13) = 1;
    v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 0);
    v75 = (void *)*((_QWORD *)v72 + 85);
    *((_QWORD *)v72 + 85) = v74;

    v14 = v77;
    v13 = v78;
  }

  return (PXStoryViewModel *)v15;
}

- (void)dealloc
{
  objc_super v3;

  -[PXStoryViewModel _unregisterForAccessibilityEvents](self, "_unregisterForAccessibilityEvents");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewModel;
  -[PXStoryViewModel dealloc](&v3, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryViewModel storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewModel;
  -[PXStoryViewModel performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewModel;
  -[PXStoryViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (BOOL)allowsRelated
{
  void *v3;
  int v4;

  -[PXStoryViewModel mainConfiguration](self, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldReplayAtEnd") & 1) != 0
    || -[PXStoryViewModel shouldAutoReplayPreference](self, "shouldAutoReplayPreference")
    || (objc_msgSend(v3, "isAppleMusicPreview") & 1) != 0
    || (objc_msgSend(v3, "isPresentedForAirPlay") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isExportPreview") ^ 1;
  }

  return v4;
}

- (unint64_t)endBehavior
{
  void *v3;
  unint64_t v4;

  -[PXStoryViewModel mainConfiguration](self, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isExportPreview") & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "shouldReplayAtEnd") & 1) != 0
         || (objc_msgSend(v3, "isAppleMusicPreview") & 1) != 0
         || -[PXStoryViewModel viewMode](self, "viewMode") == 4)
  {
    if (-[PXStoryViewModel assetCollectionForcesAutoReplay](self, "assetCollectionForcesAutoReplay"))
      v4 = 3;
    else
      v4 = 2;
  }
  else if ((objc_msgSend(v3, "isPresentedForAirPlay") & 1) != 0)
  {
    v4 = 4;
  }
  else if (-[PXStoryViewModel shouldAutoReplayPreference](self, "shouldAutoReplayPreference"))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setViewMode:(int64_t)a3
{
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x2000);
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
    -[PXStoryViewModel _invalidateShouldPreventDisplaySleep](self, "_invalidateShouldPreventDisplaySleep");
    -[PXStoryViewModel _invalidateCanToggleSelectMode](self, "_invalidateCanToggleSelectMode");
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    -[PXStoryViewModel _invalidateAXStoredPlayState](self, "_invalidateAXStoredPlayState");
    -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
  }
}

- (void)setViewModeTransition:(id)a3
{
  PXStoryViewModeTransition *v5;
  PXStoryViewModeTransition *viewModeTransition;
  PXStoryViewModeTransition *v7;

  v5 = (PXStoryViewModeTransition *)a3;
  viewModeTransition = self->_viewModeTransition;
  if (viewModeTransition != v5)
  {
    v7 = v5;
    -[PXStoryViewModeTransition registerChangeObserver:context:](viewModeTransition, "registerChangeObserver:context:", self, ViewModeTransitionObservationContext_184241);
    objc_storeStrong((id *)&self->_viewModeTransition, a3);
    -[PXStoryViewModeTransition registerChangeObserver:context:](self->_viewModeTransition, "registerChangeObserver:context:", self, ViewModeTransitionObservationContext_184241);
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x400000000);
    v5 = v7;
  }

}

- (void)setSwipeDownInteractionState:(id *)a3
{
  $7EB315E18061A6B6A8676FCFC08B39C2 *p_swipeDownInteractionState;
  __int128 v6;
  CGPoint location;
  __int128 v8;
  CGPoint var1;
  CGPoint v10;
  CGPoint var2;
  __int128 v12;
  _OWORD v13[4];
  double var5;
  _OWORD v15[4];
  double lastTimestamp;

  p_swipeDownInteractionState = &self->_swipeDownInteractionState;
  v6 = *(_OWORD *)&self->_swipeDownInteractionState.coordinateSpace;
  v15[2] = self->_swipeDownInteractionState.velocity;
  v15[3] = v6;
  lastTimestamp = self->_swipeDownInteractionState.lastTimestamp;
  location = self->_swipeDownInteractionState.location;
  v15[0] = self->_swipeDownInteractionState.initialLocation;
  v15[1] = location;
  v8 = *(_OWORD *)&a3->var3;
  v13[2] = a3->var2;
  v13[3] = v8;
  var5 = a3->var5;
  var1 = a3->var1;
  v13[0] = a3->var0;
  v13[1] = var1;
  if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)v15, (uint64_t)v13) & 1) == 0)
  {
    p_swipeDownInteractionState->initialLocation = a3->var0;
    v10 = a3->var1;
    var2 = a3->var2;
    v12 = *(_OWORD *)&a3->var3;
    p_swipeDownInteractionState->lastTimestamp = a3->var5;
    p_swipeDownInteractionState->velocity = var2;
    *(_OWORD *)&p_swipeDownInteractionState->coordinateSpace = v12;
    p_swipeDownInteractionState->location = v10;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x800000000);
    -[PXStoryViewModel _invalidateViewModeTransition](self, "_invalidateViewModeTransition");
  }
}

- (void)setSwipeDownTriggeringDismissal:(BOOL)a3
{
  if (self->_swipeDownTriggeringDismissal != a3)
    self->_swipeDownTriggeringDismissal = a3;
}

- (void)setSwipeDownDismissalPreviewEnabled:(BOOL)a3
{
  if (self->_swipeDownDismissalPreviewEnabled != a3)
  {
    self->_swipeDownDismissalPreviewEnabled = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x8000000000);
  }
}

- (void)setSwipeDownDismissalPreviewFraction:(double)a3
{
  if (self->_swipeDownDismissalPreviewFraction != a3)
    self->_swipeDownDismissalPreviewFraction = a3;
}

- (void)setIsActive:(BOOL)a3
{
  id v4;

  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 1);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    -[PXStoryViewModel _invalidateShouldPreventDisplaySleep](self, "_invalidateShouldPreventDisplaySleep");
    -[PXStoryViewModel _invalidateWantsSoloPlayback](self, "_invalidateWantsSoloPlayback");
    if (self->_isActive && !self->_hasBeenActiveOnce)
    {
      self->_hasBeenActiveOnce = 1;
      -[PXStoryViewModel loadingCoordinator](self, "loadingCoordinator");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resumeTimelineWork");

    }
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 2);
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
    -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
    -[PXStoryViewModel _invalidateShouldPreventDisplaySleep](self, "_invalidateShouldPreventDisplaySleep");
    -[PXStoryViewModel _invalidateWantsSoloPlayback](self, "_invalidateWantsSoloPlayback");
    if (-[PXStoryViewModel pausingPlaybackShowsChrome](self, "pausingPlaybackShowsChrome"))
    {
      if (!self->_desiredPlayState)
        -[PXStoryViewModel performChanges:](self, "performChanges:", &__block_literal_global_250_184420);
    }
  }
}

- (void)_invalidateWantsSoloPlayback
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsSoloPlayback);

}

- (void)_updateWantsSoloPlayback
{
  void *v3;
  uint64_t v4;

  if (-[PXStoryViewModel desiredPlayState](self, "desiredPlayState") == 1
    && -[PXStoryViewModel isActive](self, "isActive"))
  {
    -[PXStoryViewModel mainConfiguration](self, "mainConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowPlayingMultipleStoriesSimultaneously") ^ 1;

  }
  else
  {
    v4 = 0;
  }
  -[PXStoryViewModel setWantsSoloPlayback:](self, "setWantsSoloPlayback:", v4);
}

- (void)setWantsSoloPlayback:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  if (self->_wantsSoloPlayback != a3)
  {
    v3 = a3;
    self->_wantsSoloPlayback = a3;
    v5 = (void *)objc_opt_class();
    if (v3)
      objc_msgSend(v5, "registerViewModelDesiringSoloPlayback:", self);
    else
      objc_msgSend(v5, "unregisterViewModelDesiringSoloPlayback:", self);
  }
}

- (void)setPlaybackFractionCompleted:(double)a3
{
  if (self->_playbackFractionCompleted != a3)
  {
    self->_playbackFractionCompleted = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 4);
    -[PXStoryViewModel setIsAtPlaybackStart:](self, "setIsAtPlaybackStart:", self->_playbackFractionCompleted <= 0.0);
    -[PXStoryViewModel setIsAtPlaybackEnd:](self, "setIsAtPlaybackEnd:", self->_playbackFractionCompleted >= 1.0);
  }
}

- (void)setCurrentPlaybackTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentPlaybackTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime;
  CMTime time1;

  p_currentPlaybackTime = &self->_currentPlaybackTime;
  time1 = *(CMTime *)a3;
  currentPlaybackTime = self->_currentPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentPlaybackTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_currentPlaybackTime->epoch = a3->var3;
    *(_OWORD *)&p_currentPlaybackTime->value = v6;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setPlaybackDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_playbackDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 playbackDuration;
  CMTime time1;

  p_playbackDuration = &self->_playbackDuration;
  time1 = *(CMTime *)a3;
  playbackDuration = self->_playbackDuration;
  if (CMTimeCompare(&time1, (CMTime *)&playbackDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_playbackDuration->epoch = a3->var3;
    *(_OWORD *)&p_playbackDuration->value = v6;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x200000000000);
  }
}

- (void)setOutroFractionCompleted:(double)a3
{
  if (self->_outroFractionCompleted != a3)
  {
    self->_outroFractionCompleted = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x1000000000000);
    -[PXStoryViewModel setWantsPlaybackEndDarkening:](self, "setWantsPlaybackEndDarkening:", self->_outroFractionCompleted > 0.0);
  }
}

- (void)setShouldAutoHideChrome:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (self->_shouldAutoHideChrome != a3)
  {
    v3 = a3;
    self->_shouldAutoHideChrome = a3;
    -[PXStoryViewModel _cancelAutoHideChromeTimer](self, "_cancelAutoHideChromeTimer");
    if (v3)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chromeAutoHideDelay");
      v7 = v6;

      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0C99E88];
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __44__PXStoryViewModel_setShouldAutoHideChrome___block_invoke;
      v15 = &unk_1E5141230;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v8, "timerWithTimeInterval:repeats:block:", 0, &v12, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewModel setAutoHideChromeTimer:](self, "setAutoHideChromeTimer:", v9, v12, v13, v14, v15);

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewModel autoHideChromeTimer](self, "autoHideChromeTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTimer:forMode:", v11, *MEMORY[0x1E0C99860]);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_cancelAutoHideChromeTimer
{
  void *v3;

  -[PXStoryViewModel autoHideChromeTimer](self, "autoHideChromeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXStoryViewModel setAutoHideChromeTimer:](self, "setAutoHideChromeTimer:", 0);
}

- (void)_autoHideChrome
{
  -[PXStoryViewModel _cancelAutoHideChromeTimer](self, "_cancelAutoHideChromeTimer");
  if (-[PXStoryViewModel shouldAutoHideChrome](self, "shouldAutoHideChrome"))
    -[PXStoryViewModel performChanges:](self, "performChanges:", &__block_literal_global_254_184418);
}

- (void)setIsAtPlaybackStart:(BOOL)a3
{
  if (self->_isAtPlaybackStart != a3)
  {
    self->_isAtPlaybackStart = a3;
    -[PXStoryViewModel _invalidateShouldAutoHideMuteToggleButton](self, "_invalidateShouldAutoHideMuteToggleButton");
  }
}

- (void)setIsAtPlaybackEnd:(BOOL)a3
{
  unint64_t v4;
  PXStoryViewModel *v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_isAtPlaybackEnd != a3)
  {
    self->_isAtPlaybackEnd = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x200000);
    -[PXStoryViewModel _invalidateShouldPreventDisplaySleep](self, "_invalidateShouldPreventDisplaySleep");
    v4 = -[PXStoryViewModel endBehavior](self, "endBehavior");
    switch(v4)
    {
      case 4uLL:
        v5 = self;
        v6 = 0;
        goto LABEL_8;
      case 3uLL:
        v5 = self;
        v6 = 1;
        v7 = 0;
        goto LABEL_10;
      case 2uLL:
        v5 = self;
        v6 = 1;
LABEL_8:
        v7 = 1;
LABEL_10:
        -[PXStoryViewModel rewindToBeginning:rewindMusic:](v5, "rewindToBeginning:rewindMusic:", v6, v7);
        break;
    }
  }
}

- (void)toggleAutoReplayPreference
{
  -[PXStoryViewModel setShouldAutoReplayPreference:](self, "setShouldAutoReplayPreference:", -[PXStoryViewModel shouldAutoReplayPreference](self, "shouldAutoReplayPreference") ^ 1);
}

- (void)setShouldAutoReplayPreference:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  if (self->_shouldAutoReplayPreference != a3)
  {
    v3 = a3;
    self->_shouldAutoReplayPreference = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x4000000000);
    if (!-[PXStoryViewModel assetCollectionForcesAutoReplay](self, "assetCollectionForcesAutoReplay"))
    {
      -[PXStoryViewModel userDefaults](self, "userDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPersistedValue:forKey:", v6, CFSTR("PXStoryViewModelAutoReplay"));

    }
    -[PXStoryViewModel _invalidateWantsRelatedOverlayScrollable](self, "_invalidateWantsRelatedOverlayScrollable");
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
  }
}

- (BOOL)assetCollectionForcesAutoReplay
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;

  -[PXStoryViewModel mainConfiguration](self, "mainConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (objc_msgSend(v4, "isGenerative"))
    v5 = objc_msgSend(v4, "subcategory") == 1100;
  else
    v5 = 0;

  return v5;
}

- (void)setIsActionMenuOpen:(BOOL)a3
{
  if (self->_isActionMenuOpen != a3)
  {
    self->_isActionMenuOpen = a3;
    -[PXStoryViewModel setMenuIsOpen:withIdentifier:](self, "setMenuIsOpen:withIdentifier:");
  }
}

- (void)setMenuIsOpen:(BOOL)a3 withIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *openMenuIdentifiers;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  openMenuIdentifiers = self->_openMenuIdentifiers;
  v10 = v6;
  if (v4)
  {
    if (!openMenuIdentifiers)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v9 = self->_openMenuIdentifiers;
      self->_openMenuIdentifiers = v8;

      v6 = v10;
      openMenuIdentifiers = self->_openMenuIdentifiers;
    }
    -[NSMutableSet addObject:](openMenuIdentifiers, "addObject:", v6);
  }
  else
  {
    -[NSMutableSet removeObject:](openMenuIdentifiers, "removeObject:", v6);
  }
  -[PXStoryViewModel _invalidateIsAnyMenuOpen](self, "_invalidateIsAnyMenuOpen");

}

- (void)setIsAnyMenuOpen:(BOOL)a3
{
  if (self->_isAnyMenuOpen != a3)
  {
    self->_isAnyMenuOpen = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x4000000000000);
    -[PXStoryViewModel _invalidateShouldAutoHideChrome](self, "_invalidateShouldAutoHideChrome");
  }
}

- (void)setWantsChromeVisible:(BOOL)a3
{
  if (self->_wantsChromeVisible != a3)
  {
    self->_wantsChromeVisible = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 8);
    -[PXStoryViewModel _invalidateShouldAutoHideChrome](self, "_invalidateShouldAutoHideChrome");
    -[PXStoryViewModel _invalidateShouldAutoHideMuteToggleButton](self, "_invalidateShouldAutoHideMuteToggleButton");
    -[PXStoryViewModel hideMuteToggleButtonWhenChromeIsHidden](self, "hideMuteToggleButtonWhenChromeIsHidden");
  }
}

- (void)setNeedsStatusBarVisible:(BOOL)a3
{
  if (self->_needsStatusBarVisible != a3)
  {
    self->_needsStatusBarVisible = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x2000000000000);
  }
}

- (void)setChromeVisibilityFraction:(double)a3
{
  if (self->_chromeVisibilityFraction != a3)
  {
    self->_chromeVisibilityFraction = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x4000);
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)setChromeItems:(unint64_t)a3
{
  if (self->_chromeItems != a3)
  {
    self->_chromeItems = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x400000);
  }
}

- (void)setAllowedChromeItems:(unint64_t)a3
{
  if (self->_allowedChromeItems != a3)
  {
    self->_allowedChromeItems = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x40000000000);
  }
}

- (void)setChromeItemsToBeDisplayedExternally:(unint64_t)a3
{
  if (self->_chromeItemsToBeDisplayedExternally != a3)
  {
    self->_chromeItemsToBeDisplayedExternally = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x400000000000);
  }
}

- (void)setBufferingIndicatorVisibilityFraction:(double)a3
{
  void *v4;
  int v5;

  if (self->_bufferingIndicatorVisibilityFraction != a3)
  {
    self->_bufferingIndicatorVisibilityFraction = a3;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useBottomLegibilityGradientForBufferingIndicator");

    if (v5)
      -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
  }
}

- (void)setMuteToggleButtonVisibilityFraction:(double)a3
{
  self->_muteToggleButtonVisibilityFraction = a3;
}

- (void)setMaximumIndividualTopChromeItemVisibilityFraction:(double)a3
{
  if (self->_maximumIndividualTopChromeItemVisibilityFraction != a3)
  {
    self->_maximumIndividualTopChromeItemVisibilityFraction = a3;
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
  }
}

- (void)setWantsScrubberVisible:(BOOL)a3
{
  if (self->_wantsScrubberVisible != a3)
  {
    self->_wantsScrubberVisible = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x2000000);
  }
}

- (void)setScrubberVisibilityFraction:(double)a3
{
  if (self->_scrubberVisibilityFraction != a3)
  {
    self->_scrubberVisibilityFraction = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x1000000);
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
  }
}

- (void)setStyleSwitcherVisibilityFraction:(double)a3
{
  if (self->_styleSwitcherVisibilityFraction != a3)
  {
    self->_styleSwitcherVisibilityFraction = a3;
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
  }
}

- (void)setWantsRelatedOverlayVisible:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_wantsRelatedOverlayVisible != a3)
  {
    self->_wantsRelatedOverlayVisible = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x8000);
    if (self->_wantsRelatedOverlayVisible)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "wantsRelatedCountdown"))
        v5 = -[PXStoryViewModel shouldSimplifyUIForAccessibility](self, "shouldSimplifyUIForAccessibility") ^ 1;
      else
        v5 = 0;
      -[PXStoryViewModel setShouldCountDownToUpNext:](self, "setShouldCountDownToUpNext:", v5);

    }
    else
    {
      -[PXStoryViewModel setShouldCountDownToUpNext:](self, "setShouldCountDownToUpNext:", 0);
    }
    -[PXStoryViewModel _invalidateWantsRelatedOverlayScrollable](self, "_invalidateWantsRelatedOverlayScrollable");
    -[PXStoryViewModel _invalidateShouldAutoHideChrome](self, "_invalidateShouldAutoHideChrome");
    -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
    if (self->_wantsRelatedOverlayVisible)
    {
      -[PXStoryViewModel setHighlightedRelatedIndex:](self, "setHighlightedRelatedIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      -[PXStoryViewModel setWantsPlaybackEndDarkening:](self, "setWantsPlaybackEndDarkening:", 0);
      -[PXStoryViewModel setWantsRelatedOverlayNavigationButtonsVisible:](self, "setWantsRelatedOverlayNavigationButtonsVisible:", 0);
    }
    if (self->_wantsRelatedOverlayVisible)
    {
      -[PXStoryViewModel mainModel](self, "mainModel");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewModel setModelCoveredByRelated:](self, "setModelCoveredByRelated:", v6);

    }
    else
    {
      -[PXStoryViewModel setModelCoveredByRelated:](self, "setModelCoveredByRelated:", 0);
    }
  }
}

- (void)setModelCoveredByRelated:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoveredByRelated);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_modelCoveredByRelated, obj);
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
    v5 = obj;
  }

}

- (void)setWantsRelatedOverlayScrollable:(BOOL)a3
{
  if (self->_wantsRelatedOverlayScrollable != a3)
  {
    self->_wantsRelatedOverlayScrollable = a3;
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)setRelatedOverlayVisibilityFraction:(double)a3
{
  if (self->_relatedOverlayVisibilityFraction != a3)
  {
    self->_relatedOverlayVisibilityFraction = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x10000);
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)setFadeOutOverlayVisibilityFraction:(double)a3
{
  if (self->_fadeOutOverlayVisibilityFraction != a3)
  {
    self->_fadeOutOverlayVisibilityFraction = a3;
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
  }
}

- (void)setIsRelatedOverlayScrolledIntoView:(BOOL)a3
{
  if (self->_isRelatedOverlayScrolledIntoView != a3)
  {
    self->_isRelatedOverlayScrolledIntoView = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x8000000);
  }
}

- (void)setWantsRelatedOverlayNavigationButtonsVisible:(BOOL)a3
{
  if (self->_wantsRelatedOverlayNavigationButtonsVisible != a3)
  {
    self->_wantsRelatedOverlayNavigationButtonsVisible = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x40000000000000);
  }
}

- (void)setShouldCountDownToUpNext:(BOOL)a3
{
  if (self->_shouldCountDownToUpNext != a3)
  {
    self->_shouldCountDownToUpNext = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x10000000);
  }
}

- (void)setWantsPlaybackEndDarkening:(BOOL)a3
{
  if (self->_wantsPlaybackEndDarkening != a3)
  {
    self->_wantsPlaybackEndDarkening = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x800000000000);
  }
}

- (void)setPlaybackEndDarkening:(double)a3
{
  if (self->_playbackEndDarkening != a3)
  {
    self->_playbackEndDarkening = a3;
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
  }
}

- (void)setSolidLegibilityOverlayOpacity:(double)a3
{
  if (self->_solidLegibilityOverlayOpacity != a3)
  {
    self->_solidLegibilityOverlayOpacity = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x20000);
  }
}

- (void)setTopGradientLegibilityOverlayOpacity:(double)a3
{
  if (self->_topGradientLegibilityOverlayOpacity != a3)
  {
    self->_topGradientLegibilityOverlayOpacity = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x80000000000);
  }
}

- (void)setBottomGradientLegibilityOverlayOpacity:(double)a3
{
  if (self->_bottomGradientLegibilityOverlayOpacity != a3)
  {
    self->_bottomGradientLegibilityOverlayOpacity = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x100000000000);
  }
}

- (void)setCustomGeneralChromeTitleConfiguration:(id)a3
{
  PXStoryViewChromeTitleConfiguration *v4;
  BOOL v5;
  PXStoryViewChromeTitleConfiguration *v6;
  PXStoryViewChromeTitleConfiguration *customGeneralChromeTitleConfiguration;
  PXStoryViewChromeTitleConfiguration *v8;

  v8 = (PXStoryViewChromeTitleConfiguration *)a3;
  v4 = self->_customGeneralChromeTitleConfiguration;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXStoryViewChromeTitleConfiguration isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXStoryViewChromeTitleConfiguration *)-[PXStoryViewChromeTitleConfiguration copy](v8, "copy");
      customGeneralChromeTitleConfiguration = self->_customGeneralChromeTitleConfiguration;
      self->_customGeneralChromeTitleConfiguration = v6;

      -[PXStoryViewModel _invalidateSpecManager](self, "_invalidateSpecManager");
    }
  }

}

- (void)setMainAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  PXDisplayAssetCollection *v6;

  v5 = (PXDisplayAssetCollection *)a3;
  if (self->_mainAssetCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mainAssetCollection, a3);
    -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
    -[PXStoryViewModel signalChange:](self, "signalChange:", 16);
    v5 = v6;
  }

}

- (void)setViewLayoutSpec:(id)a3
{
  PXStoryViewLayoutSpec *v5;
  char v6;
  PXStoryViewLayoutSpec *v7;

  v7 = (PXStoryViewLayoutSpec *)a3;
  v5 = self->_viewLayoutSpec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryViewLayoutSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewLayoutSpec, a3);
      -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
      -[PXStoryViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setActionPerformer:(id)a3
{
  id v4;
  PXStoryViewActionPerformer **p_actionPerformer;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_actionPerformer = &self->_actionPerformer;
  WeakRetained = objc_loadWeakRetained((id *)p_actionPerformer);

  if (WeakRetained != v4)
  {
    v7 = objc_loadWeakRetained((id *)p_actionPerformer);

    if (v7)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_loadWeakRetained((id *)p_actionPerformer);
        v10 = 138412290;
        v11 = v9;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "overriding action performer %@", (uint8_t *)&v10, 0xCu);

      }
    }
    objc_storeWeak((id *)p_actionPerformer, v4);
  }

}

- (void)_setMainModel:(id)a3 changeOrigin:(unint64_t)a4
{
  PXStoryModel *v7;
  PXStoryModel **p_mainModel;
  PXStoryModel *v9;
  PXStoryModel *v10;
  char v11;
  void *v12;
  char v13;
  const __CFString *v14;
  const __CFString *v15;
  NSObject *v16;
  _BOOL4 v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  objc_class *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  v9 = self->_mainModel;
  if (v9 == v7)
  {

  }
  else
  {
    v10 = v9;
    v11 = -[PXStoryModel isEqual:](v7, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
      -[PXStoryModel unregisterChangeObserver:context:](*p_mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_184240);
      objc_storeStrong((id *)&self->_mainModel, a3);
      -[PXStoryModel registerChangeObserver:context:](*p_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_184240);
      -[PXStoryViewModel signalChange:](self, "signalChange:", 64);
      -[PXStoryModel currentAssetCollection](*p_mainModel, "currentAssetCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 2)
      {
        v13 = 0;
        v14 = CFSTR("autoPlayRelated");
        v15 = CFSTR("com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStartedByAutoplayedRelated");
      }
      else if (a4 == 1)
      {
        v13 = 0;
        v14 = CFSTR("userSelectedRelated");
        v15 = CFSTR("com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStartedByUserSelectingRelated");
      }
      else if (a4)
      {
        v15 = 0;
        v14 = 0;
        v13 = 1;
      }
      else
      {
        v13 = 0;
        v14 = CFSTR("initialization");
        v15 = CFSTR("com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStarted");
      }
      PLStoryGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      v40 = v12;
      if (v12)
      {
        if (v17)
        {
          objc_msgSend(v12, "px_cheapLogIdentifier");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v46 = v18;
          v47 = 2114;
          v48 = v19;
          v49 = 2114;
          v50 = v14;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "Started fullscreen playback for asset collection==%{public}@, uuid==%{public}@, origin==%{public}@", buf, 0x20u);

        }
      }
      else if (v17)
      {
        *(_DWORD *)buf = 138543362;
        v46 = v14;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "Started fullscreen playback for arbitrary set of assets, origin==%{public}@", buf, 0xCu);
      }

      -[PXStoryModel configuration](*p_mainModel, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isAllowedToPlayAnyMusicOrSound") & 1) != 0)
      {
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "appleMusicPromptTrigger");

        if (v22 == 1)
          +[PXAppleMusicPrompter showPromptsIfNeededWithCompletion:](PXAppleMusicPrompter, "showPromptsIfNeededWithCompletion:", 0);
      }
      else
      {

      }
      v23 = (_QWORD *)MEMORY[0x1E0D09830];
      if ((v13 & 1) == 0)
      {
        v24 = (void *)MEMORY[0x1E0D09910];
        v43 = *MEMORY[0x1E0D09830];
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sendEvent:withPayload:", v15, v28);

        v23 = v26;
      }
      -[PXStoryModel untruncatedCuratedAssets](*p_mainModel, "untruncatedCuratedAssets");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = objc_msgSend(v29, "count");
      }
      else
      {
        -[PXStoryModel curatedAssets](*p_mainModel, "curatedAssets");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v32, "count");

      }
      objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", v31, 0, 10, 50, 100, 200, 300, 500, 1000, 2000, 5000, 10000, 20000, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStartedWith%@CuratedAssets"), v33);
      v35 = (void *)MEMORY[0x1E0D09910];
      v41 = *v23;
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sendEvent:withPayload:", v34, v38);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewModel setLastMainModelChangeDate:](self, "setLastMainModelChangeDate:", v39);

      -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
      -[PXStoryViewModel _invalidateDesiredPlayState](self, "_invalidateDesiredPlayState");
      -[PXStoryViewModel _invalidateShouldAutoHideChrome](self, "_invalidateShouldAutoHideChrome");
      -[PXStoryViewModel _invalidatePlaybackFractionCompleted](self, "_invalidatePlaybackFractionCompleted");
      -[PXStoryViewModel _invalidatePlaybackDuration](self, "_invalidatePlaybackDuration");
      -[PXStoryViewModel _invalidateOutroFractionCompleted](self, "_invalidateOutroFractionCompleted");
      -[PXStoryViewModel _invalidateMainAssetCollection](self, "_invalidateMainAssetCollection");
      -[PXStoryViewModel _invalidateMainModelControllers](self, "_invalidateMainModelControllers");
      -[PXStoryViewModel _invalidateRecentlyUsedSongs](self, "_invalidateRecentlyUsedSongs");
      -[PXStoryViewModel _invalidateMainAsset](self, "_invalidateMainAsset");
      -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");

    }
  }

}

- (void)setRelatedModels:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *relatedModels;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_relatedModels;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      relatedModels = self->_relatedModels;
      self->_relatedModels = v6;

      -[PXStoryViewModel signalChange:](self, "signalChange:", 256);
      -[PXStoryViewModel _invalidateWantsRelatedOverlayScrollable](self, "_invalidateWantsRelatedOverlayScrollable");
    }
  }

}

- (void)setViewEnvironmentModel:(id)a3
{
  PXStoryViewEnvironmentModel **p_viewEnvironmentModel;
  id v5;
  char v6;
  id obj;

  obj = a3;
  p_viewEnvironmentModel = &self->_viewEnvironmentModel;
  v5 = objc_loadWeakRetained((id *)p_viewEnvironmentModel);
  if (v5 == obj)
  {

  }
  else
  {
    v6 = objc_msgSend(obj, "isEqual:", v5);

    if ((v6 & 1) == 0)
      objc_storeWeak((id *)p_viewEnvironmentModel, obj);
  }

}

- (void)setDidSelectAnyRelated:(BOOL)a3
{
  self->_didSelectAnyRelated = a3;
}

- (void)setLastSkipSegmentActionDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastSkipSegmentActionDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastSkipSegmentActionDate, a3);
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x4000000);
  }

}

- (void)setEdgeToHighlight:(unint64_t)a3
{
  if (self->_edgeToHighlight != a3)
  {
    self->_edgeToHighlight = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x80000000);
  }
}

- (void)setIsPerformingCrossfadeTransitionToRelated:(BOOL)a3
{
  if (self->_isPerformingCrossfadeTransitionToRelated != a3)
  {
    self->_isPerformingCrossfadeTransitionToRelated = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x20000000000000);
  }
}

- (void)togglePlayback
{
  -[PXStoryViewModel setDesiredPlayState:](self, "setDesiredPlayState:", -[PXStoryViewModel desiredPlayState](self, "desiredPlayState") == 0);
}

- (BOOL)skipToSegmentWithOffset:(int64_t)a3
{
  return -[PXStoryViewModel skipToSegmentWithOffset:byTappingEdge:](self, "skipToSegmentWithOffset:byTappingEdge:", a3, 0);
}

- (BOOL)skipToSegmentWithOffset:(int64_t)a3 byTappingEdge:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  id v9;
  uint64_t v10;
  char v11;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[PXStoryViewModel mainModel](self, "mainModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PXStoryViewModel_skipToSegmentWithOffset_byTappingEdge___block_invoke;
  v14[3] = &unk_1E5132A70;
  v14[4] = &v15;
  v14[5] = a3;
  objc_msgSend(v8, "performChanges:", v14);

  if (*((_BYTE *)v16 + 24))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    -[PXStoryViewModel setLastSkipSegmentActionDate:](self, "setLastSkipSegmentActionDate:", v9);

    if (v4)
    {
      if (a3 <= 0)
      {
        if ((a3 & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModel.m"), 1077, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
        v10 = 2;
      }
      else
      {
        v10 = 8;
      }
      -[PXStoryViewModel setEdgeToHighlight:](self, "setEdgeToHighlight:", v10);
    }
  }
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v11;
}

- (BOOL)skipToBeginningOfSegmentWithIdentifier:(int64_t)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PXStoryViewModel mainModel](self, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PXStoryViewModel_skipToBeginningOfSegmentWithIdentifier___block_invoke;
  v6[3] = &unk_1E5132A70;
  v6[4] = &v7;
  v6[5] = a3;
  objc_msgSend(v4, "performChanges:", v6);

  LOBYTE(a3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

- (void)toggleChrome
{
  -[PXStoryViewModel setWantsChromeVisible:](self, "setWantsChromeVisible:", -[PXStoryViewModel wantsChromeVisible](self, "wantsChromeVisible") ^ 1);
}

- (void)toggleHUD
{
  -[PXStoryViewModel performChanges:](self, "performChanges:", &__block_literal_global_280_184391);
}

- (void)cycleHUDType
{
  -[PXStoryViewModel performChanges:](self, "performChanges:", &__block_literal_global_281_184390);
}

- (void)liveResizeWillStart
{
  id v2;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_282_184389);

}

- (void)liveResizeDidEnd
{
  id v2;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_283_184388);

}

- (void)setOverlayController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayController, a3);
}

- (void)setRelatedController:(id)a3
{
  PXStoryRelatedController *v5;
  PXStoryRelatedController *relatedController;
  PXStoryRelatedController *v7;

  v5 = (PXStoryRelatedController *)a3;
  relatedController = self->_relatedController;
  if (relatedController != v5)
  {
    v7 = v5;
    -[PXStoryController performChanges:](relatedController, "performChanges:", &__block_literal_global_285);
    objc_storeStrong((id *)&self->_relatedController, a3);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v7;
  }

}

- (void)setMusicPlayer:(id)a3
{
  PXStoryMusicPlayer *v5;
  PXStoryMusicPlayer **p_musicPlayer;
  PXStoryMusicPlayer *musicPlayer;
  PXStoryMusicPlayer *v8;

  v5 = (PXStoryMusicPlayer *)a3;
  p_musicPlayer = &self->_musicPlayer;
  musicPlayer = self->_musicPlayer;
  if (musicPlayer != v5)
  {
    v8 = v5;
    -[PXStoryMusicPlayer unregisterChangeObserver:context:](musicPlayer, "unregisterChangeObserver:context:", self, MusicPlayerObservationContext);
    -[PXStoryMusicPlayer performChanges:](*p_musicPlayer, "performChanges:", &__block_literal_global_287_184387);
    objc_storeStrong((id *)&self->_musicPlayer, a3);
    -[PXStoryMusicPlayer registerChangeObserver:context:](*p_musicPlayer, "registerChangeObserver:context:", self, MusicPlayerObservationContext);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v8;
  }

}

- (void)setPacingController:(id)a3
{
  PXStoryPacingController *v5;
  PXStoryPacingController *pacingController;
  PXStoryPacingController *v7;

  v5 = (PXStoryPacingController *)a3;
  pacingController = self->_pacingController;
  if (pacingController != v5)
  {
    v7 = v5;
    -[PXStoryController performChanges:](pacingController, "performChanges:", &__block_literal_global_289_184386);
    objc_storeStrong((id *)&self->_pacingController, a3);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v7;
  }

}

- (void)setResourcesPreloadingController:(id)a3
{
  PXStoryViewResourcesPreloadingController *v5;
  PXStoryViewResourcesPreloadingController *resourcesPreloadingController;
  PXStoryViewResourcesPreloadingController *v7;

  v5 = (PXStoryViewResourcesPreloadingController *)a3;
  resourcesPreloadingController = self->_resourcesPreloadingController;
  if (resourcesPreloadingController != v5)
  {
    v7 = v5;
    -[PXStoryController performChanges:](resourcesPreloadingController, "performChanges:", &__block_literal_global_291_184385);
    objc_storeStrong((id *)&self->_resourcesPreloadingController, a3);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v7;
  }

}

- (void)setSongController:(id)a3
{
  objc_storeStrong((id *)&self->_songController, a3);
}

- (void)setAudioSessionController:(id)a3
{
  PXStoryAudioSessionController *v5;
  PXStoryAudioSessionController *v6;

  v5 = (PXStoryAudioSessionController *)a3;
  if (self->_audioSessionController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_audioSessionController, a3);
    v5 = v6;
  }

}

- (void)setPersistenceController:(id)a3
{
  PXStoryPersistenceController *v5;
  PXStoryPersistenceController *persistenceController;
  PXStoryPersistenceController *v7;

  v5 = (PXStoryPersistenceController *)a3;
  persistenceController = self->_persistenceController;
  if (persistenceController != v5)
  {
    v7 = v5;
    -[PXStoryController performChanges:](persistenceController, "performChanges:", &__block_literal_global_293);
    objc_storeStrong((id *)&self->_persistenceController, a3);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v7;
  }

}

- (void)setBufferingController:(id)a3
{
  PXStoryViewBufferingController *v5;
  PXStoryViewBufferingController *bufferingController;
  PXStoryViewBufferingController *v7;

  v5 = (PXStoryViewBufferingController *)a3;
  bufferingController = self->_bufferingController;
  if (bufferingController != v5)
  {
    v7 = v5;
    -[PXStoryController performChanges:](bufferingController, "performChanges:", &__block_literal_global_295);
    objc_storeStrong((id *)&self->_bufferingController, a3);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v7;
  }

}

- (void)setMuteStateController:(id)a3
{
  objc_storeStrong((id *)&self->_muteStateController, a3);
}

- (void)setValidationController:(id)a3
{
  PXStoryValidationController *v5;
  PXStoryValidationController *validationController;
  PXStoryValidationController *v7;

  v5 = (PXStoryValidationController *)a3;
  validationController = self->_validationController;
  if (validationController != v5)
  {
    v7 = v5;
    -[PXStoryController performChanges:](validationController, "performChanges:", &__block_literal_global_297_184384);
    objc_storeStrong((id *)&self->_validationController, a3);
    -[PXStoryViewModel _invalidateControllersActiveness](self, "_invalidateControllersActiveness");
    v5 = v7;
  }

}

- (void)setRelatedConfigurations:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *relatedConfigurations;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  void *v19;

  v16 = (NSArray *)a3;
  v4 = self->_relatedConfigurations;
  v5 = v16;
  if (v4 == v16)
    goto LABEL_4;
  v6 = -[NSArray isEqual:](v16, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSArray *)-[NSArray copy](v16, "copy");
    relatedConfigurations = self->_relatedConfigurations;
    self->_relatedConfigurations = v7;

    -[PXStoryViewModel signalChange:](self, "signalChange:", 512);
    -[PXStoryViewModel recentlyUsedFlexSongIDs](self, "recentlyUsedFlexSongIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryViewModel recentlyUsedAppleMusicSongIDs](self, "recentlyUsedAppleMusicSongIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryViewModel extendedTraitCollection](self, "extendedTraitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v18 = v12;
    v13 = v10;
    v14 = v12;
    v5 = v19;
    PXMap();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewModel setRelatedModels:](self, "setRelatedModels:", v15);

LABEL_4:
  }

}

- (void)setMainConfiguration:(id)a3
{
  PXStoryConfiguration *v5;
  char v6;
  PXStoryConfiguration *v7;

  v7 = (PXStoryConfiguration *)a3;
  v5 = self->_mainConfiguration;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryConfiguration isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mainConfiguration, a3);
      -[PXStoryViewModel _invalidateSpecManager](self, "_invalidateSpecManager");
      -[PXStoryViewModel signalChange:](self, "signalChange:", 128);
    }
  }

}

- (void)selectRelatedAtIndex:(int64_t)a3
{
  -[PXStoryViewModel _changeMainModelToRelatedAtIndex:changeOrigin:](self, "_changeMainModelToRelatedAtIndex:changeOrigin:", a3, 1);
}

- (void)autoPlayUpNext
{
  void *v3;
  uint64_t v4;

  -[PXStoryViewModel relatedConfigurations](self, "relatedConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[PXStoryViewModel _changeMainModelToRelatedAtIndex:changeOrigin:](self, "_changeMainModelToRelatedAtIndex:changeOrigin:", 0, 2);
}

- (void)setSelectedRelatedIndex:(int64_t)a3
{
  if (self->_selectedRelatedIndex != a3)
  {
    self->_selectedRelatedIndex = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x20000000000);
  }
}

- (void)_changeMainModelToRelatedAtIndex:(int64_t)a3 changeOrigin:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  __int128 v19;
  _OWORD v20[2];
  CMTime time;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXStoryViewModel relatedModels](self, "relatedModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "timeRange");
  }
  else
  {
    memset(v20, 0, sizeof(v20));
    v19 = 0u;
  }
  time = *(CMTime *)((char *)v20 + 8);
  v11 = CMTimeGetSeconds(&time) > 0.0;

  if (v11)
  {
    -[PXStoryViewModel setSelectedRelatedIndex:](self, "setSelectedRelatedIndex:", a3);
    objc_initWeak((id *)&time, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PXStoryViewModel__changeMainModelToRelatedAtIndex_changeOrigin___block_invoke;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v18, (id *)&time);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[PXStoryViewModel setDidSelectAnyRelated:](self, "setDidSelectAnyRelated:", 1);
    -[PXStoryViewModel _setMainModel:changeOrigin:](self, "_setMainModel:changeOrigin:", v8, a4);
    -[PXStoryViewModel relatedConfigurations](self, "relatedConfigurations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewModel setMainConfiguration:](self, "setMainConfiguration:", v13);

    -[PXStoryViewModel setRelatedConfigurations:](self, "setRelatedConfigurations:", 0);
    -[PXStoryViewModel setWantsChromeVisible:](self, "setWantsChromeVisible:", -[PXStoryViewModel shouldSimplifyUIForAccessibility](self, "shouldSimplifyUIForAccessibility"));
    -[PXStoryViewModel setWantsRelatedOverlayVisible:](self, "setWantsRelatedOverlayVisible:", 0);
    objc_msgSend(v8, "performChanges:", &__block_literal_global_300);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)&time);
  }
  else
  {
    PLStoryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "currentAssetCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "px_cheapLogIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v16;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_FAULT, "Can't select related for asset collection %{public}@ because it's not ready", (uint8_t *)&time, 0xCu);

    }
  }

}

- (void)_resetSelectedRelatedIndex
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__PXStoryViewModel__resetSelectedRelatedIndex__block_invoke;
  v2[3] = &unk_1E5146E78;
  v2[4] = self;
  -[PXStoryViewModel performChanges:](self, "performChanges:", v2);
}

- (void)rewindToBeginning:(BOOL)a3
{
  -[PXStoryViewModel rewindToBeginning:rewindMusic:](self, "rewindToBeginning:rewindMusic:", a3, 1);
}

- (void)rewindToBeginning:(BOOL)a3 rewindMusic:(BOOL)a4
{
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  -[PXStoryViewModel storyQueue](self, "storyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke;
  v8[3] = &unk_1E5132D28;
  v8[4] = self;
  v9 = a3;
  v10 = a4;
  dispatch_async(v7, v8);

}

- (void)_replayMusic
{
  id v2;

  -[PXStoryViewModel musicPlayer](self, "musicPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_301_184379);

}

- (void)setIsScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  char v12;
  double v13;
  uint64_t v14;

  if (self->_isScrubbing != a3)
  {
    v3 = a3;
    self->_isScrubbing = a3;
    -[PXStoryViewModel mainModel](self, "mainModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "firstSegmentIdentifier");
    -[PXStoryViewModel scrubberPosition](self, "scrubberPosition");
    v8 = &v14;
    if (v13 <= 0.5)
      v8 = (uint64_t *)&v12;
    v9 = *v8;

    v10 = -[PXStoryViewModel desiredPlayState](self, "desiredPlayState");
    if (v3 || v7 != v9)
    {
      -[PXStoryViewModel _updateScrubberFeedbackGeneratorWithShouldImpact:shouldPrepare:](self, "_updateScrubberFeedbackGeneratorWithShouldImpact:shouldPrepare:", 0, v3);
    }
    else
    {
      v11 = v10;
      -[PXStoryViewModel _updateScrubberFeedbackGeneratorWithShouldImpact:shouldPrepare:](self, "_updateScrubberFeedbackGeneratorWithShouldImpact:shouldPrepare:", v10 == 1, 0);
      if (v11 == 1)
        -[PXStoryViewModel _replayMusic](self, "_replayMusic");
    }
    -[PXStoryViewModel _invalidateShouldAutoHideChrome](self, "_invalidateShouldAutoHideChrome");
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x800000);
  }
}

- (void)_updateScrubberFeedbackGeneratorWithShouldImpact:(BOOL)a3 shouldPrepare:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  if (a3)
  {
    -[PXStoryViewModel scrubberFeedbackGenerator](self, "scrubberFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "impactOccurred");

  }
  if (v4)
  {
    -[PXStoryViewModel scrubberFeedbackGenerator](self, "scrubberFeedbackGenerator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepare");

  }
}

- (void)setScrubberPosition:(id *)a3
{
  BOOL v3;
  __int128 v4;

  if (a3->var0 != self->_scrubberPosition.firstSegmentIdentifier
    || (a3->var1 == self->_scrubberPosition.secondSegmentMixFactor
      ? (v3 = a3->var2 == self->_scrubberPosition.secondSegmentIdentifier)
      : (v3 = 0),
        !v3))
  {
    v4 = *(_OWORD *)&a3->var0;
    self->_scrubberPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&self->_scrubberPosition.firstSegmentIdentifier = v4;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x40000);
  }
}

- (void)setCanToggleSelectMode:(BOOL)a3
{
  if (self->_canToggleSelectMode != a3)
  {
    self->_canToggleSelectMode = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x100000000);
  }
}

- (void)setIsInSelectMode:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x200000000);
    if (!-[PXStoryViewModel isReadingFromPhotosGridViewModel](self, "isReadingFromPhotosGridViewModel"))
    {
      -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __38__PXStoryViewModel_setIsInSelectMode___block_invoke;
      v6[3] = &unk_1E5132D70;
      v7 = a3;
      v6[4] = self;
      objc_msgSend(v5, "performChanges:", v6);

    }
  }
}

- (void)selectAllGridItems
{
  id v2;

  -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_303_184378);

}

- (void)deselectAllGridItems
{
  id v2;

  -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_304_184377);

}

- (void)setShouldPreventDisplaySleep:(BOOL)a3
{
  void *v4;
  _BOOL4 shouldPreventDisplaySleep;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_shouldPreventDisplaySleep != a3)
  {
    self->_shouldPreventDisplaySleep = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x20000000);
    +[PXApplicationState sharedState](PXApplicationState, "sharedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    shouldPreventDisplaySleep = self->_shouldPreventDisplaySleep;
    -[PXStoryViewModel preventedDisplaySleepToken](self, "preventedDisplaySleepToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (shouldPreventDisplaySleep)
    {

      if (v7)
      {
        PXAssertGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          v11 = 138412290;
          v12 = CFSTR("self.preventedDisplaySleepToken == nil");
          _os_log_fault_impl(&dword_1A6789000, v8, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", (uint8_t *)&v11, 0xCu);
        }

      }
      objc_msgSend(v4, "beginDisablingIdleTimerForReason:", CFSTR("Interactive memory playback (PXStoryViewModel)"));
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v9;
    }
    else if (v6)
    {
      objc_msgSend(v4, "endDisablingIdleTimer:", v6);
      v9 = 0;
    }
    else
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = 138412290;
        v12 = CFSTR("token != nil");
        _os_log_fault_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", (uint8_t *)&v11, 0xCu);
      }

      v9 = 0;
      v7 = 0;
    }
    -[PXStoryViewModel setPreventedDisplaySleepToken:](self, "setPreventedDisplaySleepToken:", v9);

  }
}

- (void)setIsPerformingViewControllerTransition:(BOOL)a3
{
  if (self->_isPerformingViewControllerTransition != a3)
  {
    self->_isPerformingViewControllerTransition = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x1000000000);
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)setViewControllerDismissalTargetPlacement:(id)a3
{
  PXGItemPlacement *v5;
  char v6;
  PXGItemPlacement *v7;

  v7 = (PXGItemPlacement *)a3;
  v5 = self->_viewControllerDismissalTargetPlacement;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGItemPlacement isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewControllerDismissalTargetPlacement, a3);
      -[PXStoryViewModel signalChange:](self, "signalChange:", 0x2000000000);
    }
  }

}

- (void)setDisplayTitle:(id)a3
{
  NSAttributedString *v5;
  char v6;
  NSAttributedString *v7;

  v7 = (NSAttributedString *)a3;
  v5 = self->_displayTitle;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSAttributedString isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayTitle, a3);
      -[PXStoryViewModel signalChange:](self, "signalChange:", 0x8000000000000);
    }
  }

}

- (void)setDisplaySubtitle:(id)a3
{
  NSAttributedString *v5;
  char v6;
  NSAttributedString *v7;

  v7 = (NSAttributedString *)a3;
  v5 = self->_displaySubtitle;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSAttributedString isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displaySubtitle, a3);
      -[PXStoryViewModel signalChange:](self, "signalChange:", 0x10000000000000);
    }
  }

}

- (void)setChromeTitleInfo:(id)a3
{
  PXStoryViewChromeTitleInfo *v5;
  BOOL v6;
  PXStoryViewChromeTitleInfo *v7;

  v7 = (PXStoryViewChromeTitleInfo *)a3;
  v5 = self->_chromeTitleInfo;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryViewChromeTitleInfo isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_chromeTitleInfo, a3);
      -[PXStoryViewModel signalChange:](self, "signalChange:", 0x8000000000000);
    }
  }

}

- (void)setShowSongInTitleWhenPaused:(BOOL)a3
{
  if (self->_showSongInTitleWhenPaused != a3)
  {
    self->_showSongInTitleWhenPaused = a3;
    -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
  }
}

- (void)setHasAnyError:(BOOL)a3
{
  id v4;

  if (self->_hasAnyError != a3)
  {
    self->_hasAnyError = a3;
    if (a3)
    {
      +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewModel setShouldShowErrorIndicator:](self, "setShouldShowErrorIndicator:", objc_msgSend(v4, "canShowInternalUI"));

    }
    else
    {
      -[PXStoryViewModel setShouldShowErrorIndicator:](self, "setShouldShowErrorIndicator:", 0);
    }
  }
}

- (void)setShouldShowErrorIndicator:(BOOL)a3
{
  if (self->_shouldShowErrorIndicator != a3)
  {
    self->_shouldShowErrorIndicator = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)setDisplayedError:(id)a3
{
  NSError *v4;
  char v5;
  NSError *v6;
  NSError *displayedError;
  NSError *v8;

  v8 = (NSError *)a3;
  v4 = self->_displayedError;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSError isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSError *)-[NSError copy](v8, "copy");
      displayedError = self->_displayedError;
      self->_displayedError = v6;

      -[PXStoryViewModel signalChange:](self, "signalChange:", 0x100000);
    }
  }

}

- (void)setIsHUDVisible:(BOOL)a3
{
  if (self->_isHUDVisible != a3)
  {
    self->_isHUDVisible = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 1024);
    -[PXStoryViewModel _invalidateHUDSettings](self, "_invalidateHUDSettings");
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)setDiagnosticHUDType:(int64_t)a3
{
  if (self->_diagnosticHUDType != a3)
  {
    self->_diagnosticHUDType = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 2048);
    -[PXStoryViewModel _invalidateHUDSettings](self, "_invalidateHUDSettings");
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)_invalidateHUDSettings
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHUDSettings);

}

- (void)_updateHUDSettings
{
  _BOOL8 v3;
  int64_t v4;
  id v5;

  v3 = -[PXStoryViewModel isHUDVisible](self, "isHUDVisible");
  v4 = -[PXStoryViewModel diagnosticHUDType](self, "diagnosticHUDType");
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 != objc_msgSend(v5, "isHUDVisible") || objc_msgSend(v5, "defaultHUDType") != v4)
  {
    objc_msgSend(v5, "setIsHUDVisible:", v3);
    objc_msgSend(v5, "setDefaultHUDType:", v4);
    objc_msgSend(v5, "save");
  }

}

- (id)diagnosticHUDContentProviderForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[PXStoryViewModel diagnosticHUDContentProvidersByType](self, "diagnosticHUDContentProvidersByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[PXStoryViewModel mainModel](self, "mainModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "diagnosticHUDContentProviderForType:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)setDiagnosticHUDContentProvider:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PXStoryViewModel diagnosticHUDContentProvidersByType](self, "diagnosticHUDContentProvidersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  -[PXStoryViewModel signalChange:](self, "signalChange:", 4096);
}

- (void)setMuted:(BOOL)a3 reason:(int64_t)a4
{
  double v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (self->_isMuted != a3)
  {
    self->_isMuted = a3;
    self->_lastMutedChangeReason = a4;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x400000000000000);
    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
    -[PXStoryViewModel _invalidateDisplayTitleAndSubtitle](self, "_invalidateDisplayTitleAndSubtitle");
    if (!-[PXStoryViewModel wantsChromeVisible](self, "wantsChromeVisible"))
    {
      if (-[PXStoryViewModel canShowMuteToggleButtonWhenChromeIsHidden](self, "canShowMuteToggleButtonWhenChromeIsHidden")|| (-[PXStoryViewModel muteToggleButtonVisibilityFraction](self, "muteToggleButtonVisibilityFraction"), v6 > 0.0))
      {
        -[PXStoryViewModel temporarilyShowMuteToggleButtonWhenChromeIsHidden](self, "temporarilyShowMuteToggleButtonWhenChromeIsHidden");
      }
    }
    if ((unint64_t)(a4 - 1) <= 3)
    {
      v7 = off_1E5133028[a4 - 1];
      if (self->_isMuted)
        v8 = CFSTR("Muted");
      else
        v8 = CFSTR("Unmuted");
      v9 = (void *)MEMORY[0x1E0D09910];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.photos.memory.interactiveMemoryPlayback%@DueTo%@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0D09830];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendEvent:withPayload:", v10, v13);

    }
  }
}

- (void)setVolume:(double)a3
{
  void *v5;
  void *v6;

  if (self->_volume != a3)
  {
    self->_volume = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("PXStoryVolume"));

    -[PXStoryViewModel _invalidateMainModelProperties](self, "_invalidateMainModelProperties");
  }
}

- (void)setCanShowMuteToggleButtonWhenChromeIsHidden:(BOOL)a3
{
  if (self->_canShowMuteToggleButtonWhenChromeIsHidden != a3)
  {
    self->_canShowMuteToggleButtonWhenChromeIsHidden = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x800000000000000);
    -[PXStoryViewModel _invalidateShouldAutoHideMuteToggleButton](self, "_invalidateShouldAutoHideMuteToggleButton");
  }
}

- (void)temporarilyShowMuteToggleButtonWhenChromeIsHidden
{
  -[PXStoryViewModel setCanShowMuteToggleButtonWhenChromeIsHidden:](self, "setCanShowMuteToggleButtonWhenChromeIsHidden:", 1);
  -[PXStoryViewModel _resetShouldAutoHideMuteToggleButton](self, "_resetShouldAutoHideMuteToggleButton");
}

- (void)hideMuteToggleButtonWhenChromeIsHidden
{
  -[PXStoryViewModel setCanShowMuteToggleButtonWhenChromeIsHidden:](self, "setCanShowMuteToggleButtonWhenChromeIsHidden:", 0);
  -[PXStoryViewModel _cancelMuteToggleButtonAutoHideTimer](self, "_cancelMuteToggleButtonAutoHideTimer");
}

- (void)setShouldAutoHideMuteToggleButton:(BOOL)a3
{
  if (self->_shouldAutoHideMuteToggleButton != a3)
  {
    self->_shouldAutoHideMuteToggleButton = a3;
    if (a3)
      -[PXStoryViewModel _scheduleMuteToggleButtonAutoHide](self, "_scheduleMuteToggleButtonAutoHide");
    else
      -[PXStoryViewModel _cancelMuteToggleButtonAutoHideTimer](self, "_cancelMuteToggleButtonAutoHideTimer");
  }
}

- (void)_scheduleMuteToggleButtonAutoHide
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[PXStoryViewModel _cancelMuteToggleButtonAutoHideTimer](self, "_cancelMuteToggleButtonAutoHideTimer");
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "muteToggleButtonAutoHideDelay");
  v5 = v4;

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0C99E88];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__PXStoryViewModel__scheduleMuteToggleButtonAutoHide__block_invoke;
  v13 = &unk_1E5141230;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 0, &v10, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel setAutoHideMuteToggleButtonTimer:](self, "setAutoHideMuteToggleButtonTimer:", v7, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel autoHideMuteToggleButtonTimer](self, "autoHideMuteToggleButtonTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", v9, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_cancelMuteToggleButtonAutoHideTimer
{
  void *v3;

  -[PXStoryViewModel autoHideMuteToggleButtonTimer](self, "autoHideMuteToggleButtonTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXStoryViewModel setAutoHideMuteToggleButtonTimer:](self, "setAutoHideMuteToggleButtonTimer:", 0);
}

- (void)_autoHideMuteToggleButton
{
  _QWORD v3[5];

  -[PXStoryViewModel _cancelMuteToggleButtonAutoHideTimer](self, "_cancelMuteToggleButtonAutoHideTimer");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PXStoryViewModel__autoHideMuteToggleButton__block_invoke;
  v3[3] = &unk_1E5146E78;
  v3[4] = self;
  -[PXStoryViewModel performChanges:](self, "performChanges:", v3);
}

- (void)setHighlightedRelatedIndex:(int64_t)a3
{
  if (self->_highlightedRelatedIndex != a3)
  {
    self->_highlightedRelatedIndex = a3;
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x100000000000000);
  }
}

- (BOOL)checkIfShouldPreventAdvancingAndReturnReason:(id *)a3
{
  const char *v5;
  _BOOL4 v6;

  if (-[PXStoryViewModel isAnyMenuOpen](self, "isAnyMenuOpen"))
  {
    if (a3)
    {
      v5 = "isAnyMenuOpen";
LABEL_7:
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v6 = -[PXStoryViewModel isScrubbing](self, "isScrubbing");
  if (v6)
  {
    if (a3)
    {
      v5 = "isScrubbing";
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)setIsUserPerformingRemoteGesture:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isUserPerformingRemoteGesture != a3)
  {
    v3 = a3;
    self->_isUserPerformingRemoteGesture = a3;
    -[PXStoryViewModel _invalidateShouldAutoHideChrome](self, "_invalidateShouldAutoHideChrome");
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x200000000000000);
    -[PXStoryViewModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryViewModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryViewModelChangedIsUserPerformingRemoteGesture", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryViewModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryViewModelChangedIsUserPerformingRemoteGesture", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryViewModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryViewModelChangedIsUserPerformingRemoteGesture", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)_setNeedsUpdate
{
  -[PXStoryViewModel signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateSpecManager
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSpecManager);

}

- (void)_updateSpecManager
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryViewModel viewLayoutSpecManager](self, "viewLayoutSpecManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel mainConfiguration](self, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStoryConfigurationOptions:", objc_msgSend(v3, "options"));

  -[PXStoryViewModel customGeneralChromeTitleConfiguration](self, "customGeneralChromeTitleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomGeneralChromeTitleConfiguration:", v4);

}

- (void)_invalidateMainModelProperties
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModelProperties);

}

- (void)_updateMainModelProperties
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = v3;
  v4 = v3;
  -[PXStoryViewModel modelChangeOrigin](self, "modelChangeOrigin", v6, 3221225472, __46__PXStoryViewModel__updateMainModelProperties__block_invoke, &unk_1E51337A8, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:origin:", &v6, v5);

}

- (void)_invalidateViewMode
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewMode);

}

- (void)_updateViewMode
{
  id v3;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel setViewMode:](self, "setViewMode:", objc_msgSend(v3, "viewMode"));

}

- (void)_invalidateViewModeTransition
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewModeTransition);

}

- (void)_updateViewModeTransition
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel setViewModeTransition:](self, "setViewModeTransition:", v4);

  -[PXStoryViewModel viewModeTransition](self, "viewModeTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PXStoryViewModel__updateViewModeTransition__block_invoke;
  v6[3] = &unk_1E5132DD8;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)_invalidateDesiredPlayState
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDesiredPlayState);

}

- (void)_updateDesiredPlayState
{
  id v3;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel setDesiredPlayState:](self, "setDesiredPlayState:", objc_msgSend(v3, "desiredPlayState"));

}

- (void)_invalidatePlaybackFractionCompleted
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaybackFractionCompleted);

}

- (void)_updatePlaybackFractionCompleted
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackFractionCompleted");
  -[PXStoryViewModel setPlaybackFractionCompleted:](self, "setPlaybackFractionCompleted:");
  if (v3)
  {
    objc_msgSend(v3, "nominalPlaybackTime");
  }
  else
  {
    v6 = 0uLL;
    v7 = 0;
  }
  v4 = v6;
  v5 = v7;
  -[PXStoryViewModel setCurrentPlaybackTime:](self, "setCurrentPlaybackTime:", &v4);

}

- (void)_invalidatePlaybackDuration
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaybackDuration);

}

- (void)_updatePlaybackDuration
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "playbackDuration");
  }
  else
  {
    v7 = 0uLL;
    v8 = 0;
  }
  v5 = v7;
  v6 = v8;
  -[PXStoryViewModel setPlaybackDuration:](self, "setPlaybackDuration:", &v5);

}

- (void)_invalidateOutroFractionCompleted
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOutroFractionCompleted);

}

- (void)_updateOutroFractionCompleted
{
  id v3;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outroFractionCompleted");
  -[PXStoryViewModel setOutroFractionCompleted:](self, "setOutroFractionCompleted:");

}

- (void)_invalidateMainAssetCollection
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainAssetCollection);

}

- (void)_updateMainAssetCollection
{
  void *v3;
  id v4;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel setMainAssetCollection:](self, "setMainAssetCollection:", v3);

}

- (void)_invalidateViewLayoutSpec
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewLayoutSpec);

}

- (void)_updateViewLayoutSpec
{
  void *v3;
  id v4;

  -[PXStoryViewModel viewLayoutSpecManager](self, "viewLayoutSpecManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel setViewLayoutSpec:](self, "setViewLayoutSpec:", v3);

}

- (void)_invalidateViewModelControllers
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewModelControllers);

}

- (void)_updateViewModelControllers
{
  PXStoryOverlayController *v3;
  PXStoryRelatedController *v4;
  PXStoryViewResourcesPreloadingController *v5;
  PXStoryViewBufferingController *v6;
  PXStoryMuteStateController *v7;
  void *v8;
  void *v9;
  PXStoryMuteStateController *v10;
  void *v11;
  PXStoryValidationController *v12;

  v3 = -[PXStoryOverlayController initWithViewModel:]([PXStoryOverlayController alloc], "initWithViewModel:", self);
  -[PXStoryViewModel setOverlayController:](self, "setOverlayController:", v3);

  v4 = -[PXStoryRelatedController initWithViewModel:]([PXStoryRelatedController alloc], "initWithViewModel:", self);
  -[PXStoryViewModel setRelatedController:](self, "setRelatedController:", v4);

  v5 = -[PXStoryViewResourcesPreloadingController initWithViewModel:]([PXStoryViewResourcesPreloadingController alloc], "initWithViewModel:", self);
  -[PXStoryViewModel setResourcesPreloadingController:](self, "setResourcesPreloadingController:", v5);

  v6 = -[PXStoryViewBufferingController initWithViewModel:]([PXStoryViewBufferingController alloc], "initWithViewModel:", self);
  -[PXStoryViewModel setBufferingController:](self, "setBufferingController:", v6);

  v7 = [PXStoryMuteStateController alloc];
  -[PXStoryViewModel volumeController](self, "volumeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel userDefaults](self, "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryMuteStateController initWithViewModel:volumeController:userDefaults:](v7, "initWithViewModel:volumeController:userDefaults:", self, v8, v9);
  -[PXStoryViewModel setMuteStateController:](self, "setMuteStateController:", v10);

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "wantsValidation");

  if ((_DWORD)v8)
  {
    v12 = -[PXStoryValidationController initWithViewModel:]([PXStoryValidationController alloc], "initWithViewModel:", self);
    -[PXStoryViewModel setValidationController:](self, "setValidationController:", v12);

  }
}

- (void)_invalidateMainModelControllers
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModelControllers);

}

- (void)_updateMainModelControllers
{
  uint64_t v3;
  PXStoryMusicPlayer *v4;
  PXStoryPacingController *v5;
  void *v6;
  void *v7;
  PXStoryPacingController *v8;
  PXStorySongController *v9;
  PXStoryPersistenceController *v10;
  PXStoryAudioSessionController *v11;
  id v12;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = objc_claimAutoreleasedReturnValue();
  v12 = (id)v3;
  if (self->_isAllowedToPlayAnyMusicOrSound)
  {
    v4 = -[PXStoryMusicPlayer initWithModel:targetDurationMatchesTimeline:]([PXStoryMusicPlayer alloc], "initWithModel:targetDurationMatchesTimeline:", v3, -[PXStoryViewModel assetCollectionForcesAutoReplay](self, "assetCollectionForcesAutoReplay") ^ 1);
    -[PXStoryViewModel setMusicPlayer:](self, "setMusicPlayer:", v4);

  }
  else
  {
    -[PXStoryViewModel setMusicPlayer:](self, "setMusicPlayer:", 0);
  }
  if (!self->_isAllowedToPlayAnyMusicOrSound)
    objc_msgSend(v12, "performChanges:", &__block_literal_global_336);
  v5 = [PXStoryPacingController alloc];
  -[PXStoryViewModel timeSource](self, "timeSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel musicPlayer](self, "musicPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryPacingController initWithModel:timeSource:cueSource:](v5, "initWithModel:timeSource:cueSource:", v12, v6, v7);
  -[PXStoryViewModel setPacingController:](self, "setPacingController:", v8);

  v9 = -[PXStorySongController initWithModel:]([PXStorySongController alloc], "initWithModel:", v12);
  -[PXStoryViewModel setSongController:](self, "setSongController:", v9);

  v10 = -[PXStoryPersistenceController initWithModel:]([PXStoryPersistenceController alloc], "initWithModel:", v12);
  -[PXStoryViewModel setPersistenceController:](self, "setPersistenceController:", v10);

  v11 = -[PXStoryAudioSessionController initWithModel:]([PXStoryAudioSessionController alloc], "initWithModel:", v12);
  -[PXStoryViewModel setAudioSessionController:](self, "setAudioSessionController:", v11);

}

- (void)_invalidateControllersActiveness
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateControllersActiveness);

}

- (void)_updateControllersActiveness
{
  BOOL v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  BOOL v18;
  _QWORD v19[4];
  BOOL v20;
  _QWORD v21[4];
  id v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  _QWORD v27[4];
  BOOL v28;
  BOOL v29;
  _QWORD v30[4];
  BOOL v31;
  _QWORD v32[4];
  id v33;
  PXStoryViewModel *v34;
  BOOL v35;

  v3 = -[PXStoryViewModel isActive](self, "isActive");
  v4 = -[PXStoryViewModel viewMode](self, "viewMode") == 2;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel relatedController](self, "relatedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke;
  v32[3] = &unk_1E5132E20;
  v35 = v3;
  v8 = v5;
  v33 = v8;
  v34 = self;
  objc_msgSend(v6, "performChanges:", v32);

  -[PXStoryViewModel musicPlayer](self, "musicPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_2;
  v30[3] = &__block_descriptor_33_e37_v16__0___PXMutableStoryMusicPlayer__8l;
  v31 = v3;
  objc_msgSend(v9, "performChanges:", v30);

  -[PXStoryViewModel pacingController](self, "pacingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_3;
  v27[3] = &__block_descriptor_34_e42_v16__0___PXStoryMutablePacingController__8l;
  v28 = v3;
  v29 = v4;
  objc_msgSend(v10, "performChanges:", v27);

  -[PXStoryViewModel resourcesPreloadingController](self, "resourcesPreloadingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_4;
  v24[3] = &unk_1E5132E88;
  v26 = v3;
  v12 = v8;
  v25 = v12;
  objc_msgSend(v11, "performChanges:", v24);

  -[PXStoryViewModel persistenceController](self, "persistenceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_5;
  v21[3] = &unk_1E5132EB0;
  v23 = v3;
  v22 = v12;
  v14 = v12;
  objc_msgSend(v13, "performChanges:", v21);

  -[PXStoryViewModel bufferingController](self, "bufferingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_6;
  v19[3] = &__block_descriptor_33_e49_v16__0___PXStoryMutableViewBufferingController__8l;
  v20 = v3;
  objc_msgSend(v15, "performChanges:", v19);

  -[PXStoryViewModel validationController](self, "validationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_7;
  v17[3] = &__block_descriptor_33_e46_v16__0___PXStoryMutableValidationController__8l;
  v18 = v3;
  objc_msgSend(v16, "performChanges:", v17);

}

- (void)_invalidateLegibilityOverlayOpacity
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLegibilityOverlayOpacity);

}

- (void)_updateLegibilityOverlayOpacity
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  float v17;
  double v18;
  int64_t v19;
  void *v20;
  double v21;
  void *v22;
  _QWORD v23[5];

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "scrubberDimsMainContent"))
    -[PXStoryViewModel scrubberVisibilityFraction](self, "scrubberVisibilityFraction");
  -[PXStoryViewModel chromeVisibilityFraction](self, "chromeVisibilityFraction");
  objc_msgSend(v4, "legibilityGradientOpacity");
  -[PXStoryViewModel styleSwitcherVisibilityFraction](self, "styleSwitcherVisibilityFraction");
  -[PXStoryViewModel maximumIndividualTopChromeItemVisibilityFraction](self, "maximumIndividualTopChromeItemVisibilityFraction");
  PXFloatByLinearlyInterpolatingFloats();
  v6 = v5;
  if (objc_msgSend(v4, "useBottomLegibilityGradientForBufferingIndicator"))
    -[PXStoryViewModel bufferingIndicatorVisibilityFraction](self, "bufferingIndicatorVisibilityFraction");
  v7 = 0.0;
  PXFloatByLinearlyInterpolatingFloats();
  v9 = v8;
  objc_msgSend(v4, "legibilityRelatedDimming");
  -[PXStoryViewModel relatedOverlayVisibilityFraction](self, "relatedOverlayVisibilityFraction");
  PXFloatByLinearlyInterpolatingFloats();
  v11 = v10;
  -[PXStoryViewModel playbackEndDarkening](self, "playbackEndDarkening");
  v13 = v12;
  -[PXStoryViewModel mainModel](self, "mainModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewModeTransition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "hasSourceOrDestinationViewMode:", 2))
  {
    v16 = objc_msgSend(v15, "destinationViewMode");
    objc_msgSend(v15, "fractionCompleted");
    v18 = v17;
    if (v16 == 2)
      v7 = v18;
    else
      v7 = 1.0 - v18;
  }
  else
  {
    v19 = -[PXStoryViewModel viewMode](self, "viewMode");
    if (v19 == 2)
    {
      v7 = 1.0;
    }
    else if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModel.m"), 1920, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  if (-[PXStoryViewModel swipeDownDismissalPreviewEnabled](self, "swipeDownDismissalPreviewEnabled"))
  {
    -[PXStoryViewModel swipeDownDismissalPreviewFraction](self, "swipeDownDismissalPreviewFraction");
    v7 = v7 * (1.0 - v21);
  }
  if (v11 < v13)
    v11 = v13;
  -[PXStoryViewModel setTopGradientLegibilityOverlayOpacity:](self, "setTopGradientLegibilityOverlayOpacity:", v6 * (1.0 - v7));
  -[PXStoryViewModel setBottomGradientLegibilityOverlayOpacity:](self, "setBottomGradientLegibilityOverlayOpacity:", v9 * (1.0 - v7));
  -[PXStoryViewModel setSolidLegibilityOverlayOpacity:](self, "setSolidLegibilityOverlayOpacity:", v11 * (1.0 - v7));
  -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__PXStoryViewModel__updateLegibilityOverlayOpacity__block_invoke;
  v23[3] = &__block_descriptor_40_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
  *(double *)&v23[4] = v7;
  objc_msgSend(v22, "performChanges:", v23);

}

- (void)_invalidateWantsRelatedOverlayScrollable
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsRelatedOverlayScrollable);

}

- (void)_updateWantsRelatedOverlayScrollable
{
  _BOOL8 v3;
  id v4;

  if (-[PXStoryViewModel wantsRelatedOverlayVisible](self, "wantsRelatedOverlayVisible"))
  {
    -[PXStoryViewModel relatedModels](self, "relatedModels");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      v3 = -[PXStoryViewModel allowsRelated](self, "allowsRelated");
    else
      v3 = 0;
    -[PXStoryViewModel setWantsRelatedOverlayScrollable:](self, "setWantsRelatedOverlayScrollable:", v3);

  }
  else
  {
    -[PXStoryViewModel setWantsRelatedOverlayScrollable:](self, "setWantsRelatedOverlayScrollable:", 0);
  }
}

- (void)_invalidateIsAnyMenuOpen
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsAnyMenuOpen);

}

- (void)_updateIsAnyMenuOpen
{
  -[PXStoryViewModel setIsAnyMenuOpen:](self, "setIsAnyMenuOpen:", -[NSMutableSet count](self->_openMenuIdentifiers, "count") != 0);
}

- (void)_invalidateShouldAutoHideChrome
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldAutoHideChrome);

}

- (void)_updateShouldAutoHideChrome
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "chromeAllowAutoHide");

  if (v4 && -[PXStoryViewModel wantsChromeVisible](self, "wantsChromeVisible"))
  {
    -[PXStoryViewModel mainModel](self, "mainModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isActuallyPlaying")
      || -[PXStoryViewModel wantsRelatedOverlayVisible](self, "wantsRelatedOverlayVisible")
      || -[PXStoryViewModel shouldSimplifyUIForAccessibility](self, "shouldSimplifyUIForAccessibility")
      || -[PXStoryViewModel isAnyMenuOpen](self, "isAnyMenuOpen")
      || -[PXStoryViewModel isUserPerformingRemoteGesture](self, "isUserPerformingRemoteGesture"))
    {
      v5 = 0;
    }
    else
    {
      v5 = -[PXStoryViewModel isScrubbing](self, "isScrubbing") ^ 1;
    }
    -[PXStoryViewModel setShouldAutoHideChrome:](self, "setShouldAutoHideChrome:", v5);

  }
  else
  {
    -[PXStoryViewModel setShouldAutoHideChrome:](self, "setShouldAutoHideChrome:", 0);
  }
}

- (void)_resetShouldAutoHideMuteToggleButton
{
  -[PXStoryViewModel setShouldAutoHideMuteToggleButton:](self, "setShouldAutoHideMuteToggleButton:", 0);
  -[PXStoryViewModel _invalidateShouldAutoHideMuteToggleButton](self, "_invalidateShouldAutoHideMuteToggleButton");
}

- (void)_invalidateShouldAutoHideMuteToggleButton
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldAutoHideMuteToggleButton);

}

- (void)_updateShouldAutoHideMuteToggleButton
{
  uint64_t v3;

  if (-[PXStoryViewModel canShowMuteToggleButtonWhenChromeIsHidden](self, "canShowMuteToggleButtonWhenChromeIsHidden")
    && !-[PXStoryViewModel isAtPlaybackStart](self, "isAtPlaybackStart"))
  {
    v3 = -[PXStoryViewModel wantsChromeVisible](self, "wantsChromeVisible") ^ 1;
  }
  else
  {
    v3 = 0;
  }
  -[PXStoryViewModel setShouldAutoHideMuteToggleButton:](self, "setShouldAutoHideMuteToggleButton:", v3);
}

- (void)_invalidateShouldPreventDisplaySleep
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldPreventDisplaySleep);

}

- (void)_updateShouldPreventDisplaySleep
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[PXStoryViewModel viewMode](self, "viewMode") == 1 || -[PXStoryViewModel viewMode](self, "viewMode") == 5;
  if (-[PXStoryViewModel isActive](self, "isActive")
    && -[PXStoryViewModel desiredPlayState](self, "desiredPlayState") == 1)
  {
    v4 = v3 & ~-[PXStoryViewModel isAtPlaybackEnd](self, "isAtPlaybackEnd");
  }
  else
  {
    v4 = 0;
  }
  -[PXStoryViewModel setShouldPreventDisplaySleep:](self, "setShouldPreventDisplaySleep:", v4);
}

- (void)_invalidateErrorIndicator
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateErrorIndicator);

}

- (void)_updateErrorIndicator
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _PXStoryInternalErrorRecoveryAttempter *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[PXStoryViewModel errorRepository](self, "errorRepository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v5, "simulatedError");
    switch(v6)
    {
      case 3:
        PXStoryPublicErrorCreateSimulatedCriticalError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v13;
        v14 = (uint64_t *)&v31;
        break;
      case 2:
        PXStoryPublicErrorCreateSimulatedError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v13;
        v14 = (uint64_t *)&v32;
        break;
      case 1:
        PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("Simulated internal error."), v7, v8, v9, v10, v11, v12, (uint64_t)v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v13;
        v14 = v33;
        break;
      default:
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v31, v32, v33[0]);
    v15 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v15;
  }
LABEL_9:
  if (objc_msgSend(v4, "count"))
  {
    PXStoryPublicErrorForErrors(v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "canShowInternalUI");

    if (v18)
    {
      if (!v16)
      {
        PXStoryInternalErrorForErrors(v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v16, "localizedFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB2D68]);

      objc_msgSend(v16, "localizedRecoverySuggestion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D80]);

      objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v16, "localizedRecoveryOptions");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (void *)v22;
      else
        v24 = (void *)MEMORY[0x1E0C9AA60];
      -[PXStoryViewModel _internalRecoveryOptions](self, "_internalRecoveryOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CB2D78]);

      v27 = -[_PXStoryInternalErrorRecoveryAttempter initWithRecoveryAttempter:]([_PXStoryInternalErrorRecoveryAttempter alloc], "initWithRecoveryAttempter:", self);
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB3148]);

      v28 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v16, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, objc_msgSend(v16, "code"), v19);
      v30 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v30;
    }
  }
  else
  {
    v16 = 0;
  }
  -[PXStoryViewModel setHasAnyError:](self, "setHasAnyError:", v16 != 0);
  -[PXStoryViewModel setDisplayedError:](self, "setDisplayedError:", v16);

}

- (void)_invalidateDiagnosticHUDState
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDiagnosticHUDState);

}

- (void)_updateDiagnosticHUDState
{
  uint64_t v3;
  id v4;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHUDEnabled"))
    v3 = objc_msgSend(v4, "isHUDVisible");
  else
    v3 = 0;
  -[PXStoryViewModel setIsHUDVisible:](self, "setIsHUDVisible:", v3);
  -[PXStoryViewModel setDiagnosticHUDType:](self, "setDiagnosticHUDType:", objc_msgSend(v4, "defaultHUDType"));

}

- (void)setPhotosGridViewModel:(id)a3
{
  PXPhotosViewModel *v5;
  PXPhotosViewModel *photosGridViewModel;
  PXPhotosViewModel *v7;

  v5 = (PXPhotosViewModel *)a3;
  photosGridViewModel = self->_photosGridViewModel;
  if (photosGridViewModel != v5)
  {
    v7 = v5;
    -[PXPhotosViewModel unregisterChangeObserver:context:](photosGridViewModel, "unregisterChangeObserver:context:", self, PhotosGridViewModelObservationContext);
    objc_storeStrong((id *)&self->_photosGridViewModel, a3);
    -[PXPhotosViewModel registerChangeObserver:context:](self->_photosGridViewModel, "registerChangeObserver:context:", self, PhotosGridViewModelObservationContext);
    -[PXStoryViewModel signalChange:](self, "signalChange:", 0x80000000000000);
    -[PXStoryViewModel _invalidateCanToggleSelectMode](self, "_invalidateCanToggleSelectMode");
    -[PXStoryViewModel _invalidateIsInSelectMode](self, "_invalidateIsInSelectMode");
    -[PXStoryViewModel _invalidateLegibilityOverlayOpacity](self, "_invalidateLegibilityOverlayOpacity");
    -[PXStoryViewModel _invalidatePhotosGridEffectProvider](self, "_invalidatePhotosGridEffectProvider");
    v5 = v7;
  }

}

- (void)_invalidateCanToggleSelectMode
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCanToggleSelectMode);

}

- (void)_updateCanToggleSelectMode
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  if (-[PXStoryViewModel viewMode](self, "viewMode") == 2
    && (-[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "canEnterSelectMode"),
        v3,
        v4))
  {
    -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canExitSelectMode");

  }
  else
  {
    v6 = 0;
  }
  -[PXStoryViewModel setCanToggleSelectMode:](self, "setCanToggleSelectMode:", v6);
}

- (void)_invalidatePhotosGridEffectProvider
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePhotosGridEffectProvider);

}

- (void)_updatePhotosGridEffectProvider
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "colorGradeKind");

  -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke;
  v6[3] = &unk_1E5140A00;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)_invalidateAXStoredPlayState
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAXStoredPlayState);

}

- (void)_updateAXStoredPlayState
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[5];

  v3 = -[PXStoryViewModel viewMode](self, "viewMode");
  v4 = v3;
  if (v3 == 1)
  {
    if (self->_axStoredPlayStateLastViewModeOnUpdate == 4 && self->_axStoredPlayStateHasStoredPlayState)
    {
      self->_axStoredPlayStateHasStoredPlayState = 0;
      -[PXStoryViewModel mainModel](self, "mainModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__PXStoryViewModel__updateAXStoredPlayState__block_invoke_2;
      v9[3] = &unk_1E5142E50;
      v9[4] = self;
      v8 = v9;
      goto LABEL_9;
    }
  }
  else if (v3 == 4
         && self->_axStoredPlayStateLastViewModeOnUpdate == 1
         && -[PXStoryViewModel shouldSimplifyUIForAccessibility](self, "shouldSimplifyUIForAccessibility"))
  {
    -[PXStoryViewModel mainModel](self, "mainModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_axStoredPlayState = objc_msgSend(v5, "desiredPlayState");

    self->_axStoredPlayStateHasStoredPlayState = 1;
    -[PXStoryViewModel mainModel](self, "mainModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &__block_literal_global_355;
LABEL_9:
    objc_msgSend(v6, "performChanges:", v8);

  }
  self->_axStoredPlayStateLastViewModeOnUpdate = v4;
}

- (id)_gridEffectForAsset:(id)a3 colorGradingEffect:(id)a4 entityManager:(id)a5
{
  id v7;
  PXStoryColorNormalizationEffect *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PXStoryColorNormalizationEffect *v13;
  id v14;
  void *v15;
  PXStoryColorNormalizationEffect *v16;
  void *v17;
  PXStoryColorNormalizationEffect *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (PXStoryColorNormalizationEffect *)a4;
  v9 = a5;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "enableBrowseViewColorNormalization")
    || !objc_msgSend(v10, "colorNormalizationMode"))
  {
    goto LABEL_19;
  }
  v11 = objc_msgSend(v10, "colorNormalizationMode");
  if (!v8 && !objc_msgSend(v10, "enableColorNormalizationWithoutColorGrade"))
  {
    v13 = 0;
    v18 = 0;
LABEL_20:
    v16 = v18;
    goto LABEL_21;
  }
  if (v11 != 2)
  {
    if (v11 == 4)
    {
      +[PXStoryColorNormalizationAdjustment dummyNormalization](PXStoryColorNormalizationAdjustment, "dummyNormalization");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_8;
    }
    goto LABEL_19;
  }
  PXDisplayAssetColorNormalizationData();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17 ? (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752C0]), "initWithAnalysisData:", v17) : 0;

  if (!v12)
  {
LABEL_19:
    v13 = 0;
    v18 = v8;
    goto LABEL_20;
  }
LABEL_8:
  v13 = -[PXStoryColorNormalizationEffect initWithEntityManager:]([PXStoryColorNormalizationEffect alloc], "initWithEntityManager:", v9);
  -[PXStoryColorNormalizationEffect setAssetNormalization:](v13, "setAssetNormalization:", v12);
  objc_msgSend(v10, "colorNormalizationIntensity");
  -[PXGColorGradingEffect setIntensity:](v13, "setIntensity:");

  if (!v8 || !v13)
  {
    if (v13)
      v18 = v13;
    else
      v18 = v8;
    goto LABEL_20;
  }
  v14 = objc_alloc((Class)off_1E50B28D0);
  v20[0] = v13;
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (PXStoryColorNormalizationEffect *)objc_msgSend(v14, "initWithEffects:", v15);

LABEL_21:
  return v16;
}

- (void)_invalidateIsInSelectMode
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsInSelectMode);

}

- (void)_updateIsInSelectMode
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__PXStoryViewModel__updateIsInSelectMode__block_invoke;
  v2[3] = &unk_1E5132F60;
  v2[4] = self;
  -[PXStoryViewModel _readFromPhotosGridViewModel:](self, "_readFromPhotosGridViewModel:", v2);
}

- (void)_invalidateRecentlyUsedSongs
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRecentlyUsedSongs);

}

- (void)_updateRecentlyUsedSongs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSongResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_storyResourceSongAsset");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v10)
  {
    objc_msgSend(v10, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "catalog");
    if (v7 == 4)
    {
      -[PXStoryViewModel recentlyUsedFlexSongIDs](self, "recentlyUsedFlexSongIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 != 2)
      {
LABEL_7:

        v5 = v10;
        goto LABEL_8;
      }
      -[PXStoryViewModel recentlyUsedAppleMusicSongIDs](self, "recentlyUsedAppleMusicSongIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(v8, "addObject:", v6);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_invalidateSongControllerFailedAssets
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSongControllerFailedAssets);

}

- (void)_updateSongControllerFailedAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[PXStoryViewModel musicPlayer](self, "musicPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "failedAudioAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryViewModel songController](self, "songController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PXStoryViewModel__updateSongControllerFailedAssets__block_invoke;
  v7[3] = &unk_1E5132F88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

}

- (void)_readFromPhotosGridViewModel:(id)a3
{
  BOOL isReadingFromPhotosGridViewModel;
  id v6;
  void *v7;

  isReadingFromPhotosGridViewModel = self->_isReadingFromPhotosGridViewModel;
  self->_isReadingFromPhotosGridViewModel = 1;
  v6 = a3;
  -[PXStoryViewModel photosGridViewModel](self, "photosGridViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v6, v7);

  self->_isReadingFromPhotosGridViewModel = isReadingFromPhotosGridViewModel;
}

- (void)_invalidateDisplayTitleAndSubtitle
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDisplayTitleAndSubtitle);

}

- (void)_updateDisplayTitleAndSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC12PhotosUICore27PXPhotosCollectionTitleInfo *v11;
  void *v12;
  id v13;
  void (**v14)(void *, void *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  void *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PXStoryViewChromeTitleInfo *v44;
  void *v45;
  void *v46;
  void (**v47)(void *, void *);
  void *v48;
  void *v49;
  __CFString *v50;
  id v51;
  void *v52;
  int v53;
  __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  _TtC12PhotosUICore27PXPhotosCollectionTitleInfo *v63;
  void *v64;
  void *v65;
  void *v66;
  void (**v67)(void *, void *);
  void *v68;
  uint64_t v69;
  void *v70;
  PXStoryViewModel *v71;
  void *v72;
  void *v73;
  _QWORD aBlock[4];
  id v75;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel viewLayoutSpec](self, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel mainModel](self, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "songResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "px_storyResourceSongAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v69 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "px_storyResourceSongAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryViewModel mainAssetCollection](self, "mainAssetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPhotosCollectionTitleInfo initWithAssetCollection:]([_TtC12PhotosUICore27PXPhotosCollectionTitleInfo alloc], "initWithAssetCollection:", v10);
  objc_msgSend(off_1E50B3470, "defaultHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PXStoryViewModel__updateDisplayTitleAndSubtitle__block_invoke;
  aBlock[3] = &unk_1E5132FB0;
  v13 = v12;
  v75 = v13;
  v14 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PXPhotosCollectionTitleInfo title](v11, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosCollectionTitleInfo subtitle](v11, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v14;
  v14[2](v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = v3;
  v64 = v10;
  v65 = v6;
  v70 = v9;
  v71 = self;
  v63 = v11;
  v68 = v13;
  v66 = v18;
  if (objc_msgSend(v3, "shouldUseAssetCollectionForTitleAndSubtitle"))
  {
    objc_msgSend(v16, "localizedUppercaseString");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedUppercaseString");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v21 = v20;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_7;
  }
  if (-[PXStoryViewModel wantsRelatedOverlayVisible](self, "wantsRelatedOverlayVisible")
    || -[PXStoryViewModel viewMode](self, "viewMode") == 2)
  {
    v19 = v16;
    v20 = v18;
    goto LABEL_6;
  }
  v62 = v16;
  -[PXStoryViewModel mainAssetInfoUpdater](self, "mainAssetInfoUpdater");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "info");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    v46 = (void *)v69;
    v48 = 0;
    v25 = v62;
    v43 = v66;
    v47 = v67;
    v45 = v70;
    goto LABEL_24;
  }
  -[__CFString objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("PXStoryViewModelMainAssetInfoLocationDescriptionKey"));
  v50 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v60 = v29;
  -[__CFString objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("PXStoryViewModelMainAssetInfoDateDescriptionKey"));
  v51 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel mainConfiguration](self, "mainConfiguration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "preferAssetLocationAndCreationDateForClipTitleAndSubtitle");

  if (v53)
  {
    v54 = &stru_1E5149688;
    if (v50)
      v54 = v50;
    v19 = v54;
    v22 = 0;
    v55 = v51;
    goto LABEL_37;
  }
  v24 = v50;
  if (!v50)
  {
    v23 = v51;
    v19 = (__CFString *)v51;
    v22 = 1;
    v55 = (void *)v69;
    goto LABEL_39;
  }
  v19 = v50;
  v56 = -[PXStoryViewModel desiredPlayState](v71, "desiredPlayState");
  if (-[PXStoryViewModel showSongInTitleWhenPaused](v71, "showSongInTitleWhenPaused")
    || v56 == 1 && !-[PXStoryViewModel isMuted](v71, "isMuted"))
  {
    v22 = 1;
    v55 = (void *)v69;
LABEL_37:
    v24 = v50;
    v23 = v51;
    goto LABEL_39;
  }
  v22 = 0;
  v23 = v51;
  v55 = v51;
  v24 = v50;
LABEL_39:
  v21 = v55;

  v16 = v62;
LABEL_7:
  v61 = v23;
  v25 = v16;
  if (objc_msgSend(v72, "simulateLongChromeStrings"))
  {
    -[__CFString px_stringByRepeating:](v19, "px_stringByRepeating:", 10);
    v26 = objc_claimAutoreleasedReturnValue();

    -[__CFString px_stringByRepeating:](v21, "px_stringByRepeating:", 10);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (__CFString *)v27;
    v19 = (__CFString *)v26;
  }
  if (v19)
    v28 = v19;
  else
    v28 = &stru_1E5149688;
  v29 = v28;

  if (v21)
    v30 = v21;
  else
    v30 = &stru_1E5149688;
  v31 = v30;

  v32 = -[PXStoryViewModel wantsRelatedOverlayVisible](v71, "wantsRelatedOverlayVisible");
  v33 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v32)
  {
    objc_msgSend(v3, "playbackEndTitleAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithString:attributes:", v29, v34);

    v36 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v3, "playbackEndSubtitleAttributes");
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v42 = (void *)v37;
    v40 = (void *)objc_msgSend(v36, "initWithString:attributes:", v31, v37);

    v41 = 0;
    v39 = (uint64_t)v31;
    goto LABEL_23;
  }
  objc_msgSend(v3, "chromeTitleAttributes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v33, "initWithString:attributes:", v29, v38);

  if (!v22 || !-[__CFString length](v31, "length") || !objc_msgSend(v9, "length"))
  {
    v36 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v3, "chromeSubtitleAttributes");
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(v3, "chromeSongStringWithTitle:artist:", v31, v9);
  v39 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "chromeSongAttributedStringWithString:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chromeSongSymbolName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  v57 = (void *)v39;
  PXAttributedStringWithLanguageAwareLineHeightAdjustments(v35);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  PXAttributedStringWithLanguageAwareLineHeightAdjustments(v40);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryViewModel setDisplayTitle:](v71, "setDisplayTitle:", v59);
  -[PXStoryViewModel setDisplaySubtitle:](v71, "setDisplaySubtitle:", v58);
  v43 = v66;
  v44 = -[PXStoryViewChromeTitleInfo initWithCollectionTitle:collectionSubtitle:locationName:dateName:songName:artistName:title:subtitle:subtitleSymbolName:]([PXStoryViewChromeTitleInfo alloc], "initWithCollectionTitle:collectionSubtitle:locationName:dateName:songName:artistName:title:subtitle:subtitleSymbolName:", v25, v66, v24, v61, v69, v70, v29, v39, v41);
  -[PXStoryViewModel setChromeTitleInfo:](v71, "setChromeTitleInfo:", v44);

  v45 = v70;
  v46 = (void *)v69;
  v10 = v64;
  v6 = v65;
  v11 = v63;
  v47 = v67;
  v48 = v57;
LABEL_24:

}

- (void)_invalidateMainAsset
{
  id v2;

  -[PXStoryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainAsset);

}

- (void)setMainAsset:(id)a3
{
  PXDisplayAsset *v5;
  char v6;
  PXDisplayAsset *v7;

  v7 = (PXDisplayAsset *)a3;
  v5 = self->_mainAsset;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXDisplayAsset isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mainAsset, a3);
      -[PXStoryViewModel signalChange:](self, "signalChange:", 0x1000000000000000);
    }
  }

}

- (void)_updateMainAsset
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  -[PXStoryViewModel mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(v3, "getMainVisibleClipIdentifier:assetReferece:", 0, &v12);
  v5 = v12;
  v6 = v5;
  if ((v4 & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_6:
    -[PXStoryViewModel setMainAsset:](self, "setMainAsset:", 0);
    -[PXStoryViewModel mainAssetInfoUpdater](self, "mainAssetInfoUpdater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateInfo");
    goto LABEL_7;
  }
  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModel mainAsset](self, "mainAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[PXStoryViewModel setMainAsset:](self, "setMainAsset:", v8);
    -[PXStoryViewModel mainAssetInfoUpdater](self, "mainAssetInfoUpdater");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateInfo");

  }
LABEL_7:

}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXStoryViewModelMainAssetInfoKind")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModel.m"), 2368, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXStoryViewModel mainAsset](self, "mainAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_initWeak(&location, self);
    -[PXStoryViewModel mainAssetInfoUpdateQueue](self, "mainAssetInfoUpdateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PXStoryViewModel_requestInfoOfKind_withResultHandler___block_invoke;
    block[3] = &unk_1E5147230;
    v15 = v9;
    objc_copyWeak(&v18, &location);
    v16 = v10;
    v17 = v8;
    dispatch_async(v11, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

  return v9;
}

- (id)_mainAssetInfoUpdateQueue_infoForAsset:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "localizedGeoDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PXStoryViewModelMainAssetInfoLocationDescriptionKey"));

  -[PXStoryViewModel mainAssetInfoUpdateQueue_titleDateFormatter](self, "mainAssetInfoUpdateQueue_titleDateFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localCreationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("PXStoryViewModelMainAssetInfoDateDescriptionKey"));

  return v6;
}

- (NSDateFormatter)mainAssetInfoUpdateQueue_titleDateFormatter
{
  NSDateFormatter *mainAssetInfoUpdateQueue_titleDateFormatter;
  NSDateFormatter *v4;
  void *v5;
  NSDateFormatter *v6;

  mainAssetInfoUpdateQueue_titleDateFormatter = self->_mainAssetInfoUpdateQueue_titleDateFormatter;
  if (!mainAssetInfoUpdateQueue_titleDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v4, "setLocale:", v5);

    -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 0);
    v6 = self->_mainAssetInfoUpdateQueue_titleDateFormatter;
    self->_mainAssetInfoUpdateQueue_titleDateFormatter = v4;

    mainAssetInfoUpdateQueue_titleDateFormatter = self->_mainAssetInfoUpdateQueue_titleDateFormatter;
  }
  return mainAssetInfoUpdateQueue_titleDateFormatter;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[PXStoryViewModel mainAssetInfoUpdater](self, "mainAssetInfoUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModel.m"), 2400, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PXStoryViewModel_infoUpdaterDidUpdate___block_invoke;
  v8[3] = &unk_1E5146E78;
  v8[4] = self;
  -[PXStoryViewModel performChanges:](self, "performChanges:", v8);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PXStoryViewModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5132FD8;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryViewModel performChanges:](self, "performChanges:", v5);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD block[5];

  v5 = a4;
  NSStringFromSelector(sel_defaultHUDType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_4:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PXStoryViewModel_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_5;
  }
  NSStringFromSelector(sel_isHUDVisible);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (id)_internalRecoveryOptions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryInternalRecovery_FileRadar_AlertAction"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryInternalRecovery_HideError_AlertAction"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  _QWORD v13[5];

  objc_msgSend(a3, "underlyingErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedRecoveryOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = a4 - v9;
  if (a4 < v9)
  {
    objc_msgSend(v7, "recoveryAttempter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attemptRecoveryFromError:optionIndex:", v7, a4);
LABEL_6:

    goto LABEL_8;
  }
  if (v10 == 1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__PXStoryViewModel_attemptRecoveryFromError_optionIndex___block_invoke;
    v13[3] = &unk_1E5146E78;
    v13[4] = self;
    -[PXStoryViewModel performChanges:](self, "performChanges:", v13);
    goto LABEL_8;
  }
  if (!v10)
  {
    -[PXStoryViewModel actionPerformer](self, "actionPerformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performActionForChromeActionMenuItem:withValue:sender:", 8, 0, 0);
    goto LABEL_6;
  }
LABEL_8:

  return 1;
}

- (void)_attachAccessibilityHUDIfNeeded
{
  -[PXStoryViewAccessibilityHUDContentProvider attachToAccessibilityIfNeeded](self->_accessibilityHUDContentProvider, "attachToAccessibilityIfNeeded");
}

- (void)_registerForAccessibilityEvents
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilityStatusDidChange, *MEMORY[0x1E0DC46F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__accessibilityStatusDidChange, *MEMORY[0x1E0DC4608], 0);

  -[PXStoryViewModel _accessibilityStatusDidChange](self, "_accessibilityStatusDidChange");
}

- (void)_accessibilityStatusDidChange
{
  _BOOL8 v3;

  v3 = UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
  -[PXStoryViewModel setShouldSimplifyUIForAccessibility:](self, "setShouldSimplifyUIForAccessibility:", v3);
}

- (void)setShouldSimplifyUIForAccessibility:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_shouldSimplifyUIForAccessibility != a3)
  {
    v3 = a3;
    self->_shouldSimplifyUIForAccessibility = a3;
    PLStoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = v6;
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "UI simplification for accessibility %@", buf, 0xCu);

    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__PXStoryViewModel_setShouldSimplifyUIForAccessibility___block_invoke;
    v8[3] = &unk_1E5133000;
    v8[4] = self;
    v9 = v3;
    -[PXStoryViewModel performChanges:](self, "performChanges:", v8);
  }
}

- (unint64_t)HUDVisibiltyChangeDescriptor
{
  return 1024;
}

- (unint64_t)HUDContentChangeDescriptor
{
  return 7172;
}

- (unint64_t)HUDStoryModelChangeDescriptor
{
  return 64;
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (a3 == 14)
  {
    v6 = -[PXStoryViewModel shouldSimplifyUIForAccessibility](self, "shouldSimplifyUIForAccessibility");
    v7 = CFSTR("NO");
    if (v6)
      v7 = CFSTR("YES");
    v8 = v7;
    objc_msgSend(v5, "appendFormat:", CFSTR("UI Simplified For AX: %@\n"), v8);

  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (void)networkStatusMonitor:(id)a3 didChangeBestAvailableNetworkType:(id)a4
{
  id v4;

  if (a4.var0 != 1)
  {
    -[PXStoryViewModel errorReporter](self, "errorReporter", a3, a4.var0, *(_QWORD *)&a4.var1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:forComponent:", 0, CFSTR("NetworkReachablity"));

  }
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (BOOL)isHUDVisible
{
  return self->_isHUDVisible;
}

- (int64_t)diagnosticHUDType
{
  return self->_diagnosticHUDType;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (double)playbackFractionCompleted
{
  return self->_playbackFractionCompleted;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 848);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 872);
  return self;
}

- (BOOL)isAtPlaybackEnd
{
  return self->_isAtPlaybackEnd;
}

- (double)outroFractionCompleted
{
  return self->_outroFractionCompleted;
}

- (BOOL)wantsChromeVisible
{
  return self->_wantsChromeVisible;
}

- (BOOL)needsStatusBarVisible
{
  return self->_needsStatusBarVisible;
}

- (double)chromeVisibilityFraction
{
  return self->_chromeVisibilityFraction;
}

- (unint64_t)chromeItems
{
  return self->_chromeItems;
}

- (unint64_t)allowedChromeItems
{
  return self->_allowedChromeItems;
}

- (unint64_t)chromeItemsToBeDisplayedExternally
{
  return self->_chromeItemsToBeDisplayedExternally;
}

- (double)bufferingIndicatorVisibilityFraction
{
  return self->_bufferingIndicatorVisibilityFraction;
}

- (double)muteToggleButtonVisibilityFraction
{
  return self->_muteToggleButtonVisibilityFraction;
}

- (double)maximumIndividualTopChromeItemVisibilityFraction
{
  return self->_maximumIndividualTopChromeItemVisibilityFraction;
}

- (BOOL)wantsRelatedOverlayVisible
{
  return self->_wantsRelatedOverlayVisible;
}

- (BOOL)wantsRelatedOverlayScrollable
{
  return self->_wantsRelatedOverlayScrollable;
}

- (double)relatedOverlayVisibilityFraction
{
  return self->_relatedOverlayVisibilityFraction;
}

- (double)fadeOutOverlayVisibilityFraction
{
  return self->_fadeOutOverlayVisibilityFraction;
}

- (BOOL)isRelatedOverlayScrolledIntoView
{
  return self->_isRelatedOverlayScrolledIntoView;
}

- (BOOL)wantsRelatedOverlayNavigationButtonsVisible
{
  return self->_wantsRelatedOverlayNavigationButtonsVisible;
}

- (BOOL)shouldCountDownToUpNext
{
  return self->_shouldCountDownToUpNext;
}

- (BOOL)wantsPlaybackEndDarkening
{
  return self->_wantsPlaybackEndDarkening;
}

- (double)playbackEndDarkening
{
  return self->_playbackEndDarkening;
}

- (double)solidLegibilityOverlayOpacity
{
  return self->_solidLegibilityOverlayOpacity;
}

- (double)topGradientLegibilityOverlayOpacity
{
  return self->_topGradientLegibilityOverlayOpacity;
}

- (double)bottomGradientLegibilityOverlayOpacity
{
  return self->_bottomGradientLegibilityOverlayOpacity;
}

- (PXStoryViewChromeTitleConfiguration)customGeneralChromeTitleConfiguration
{
  return self->_customGeneralChromeTitleConfiguration;
}

- (PXStoryViewModeTransition)viewModeTransition
{
  return self->_viewModeTransition;
}

- ($74445421B386A896E969A1525619931B)swipeDownInteractionState
{
  CGPoint var2;
  CGPoint var0;

  var2 = self[13].var2;
  retstr->var2 = self[13].var1;
  *(CGPoint *)&retstr->var3 = var2;
  *(_QWORD *)&retstr->var5 = self[13].var3;
  var0 = self[13].var0;
  retstr->var0 = *(CGPoint *)&self[12].var4;
  retstr->var1 = var0;
  return self;
}

- (BOOL)isPerformingViewControllerTransition
{
  return self->_isPerformingViewControllerTransition;
}

- (PXGItemPlacement)viewControllerDismissalTargetPlacement
{
  return self->_viewControllerDismissalTargetPlacement;
}

- (BOOL)swipeDownTriggeringDismissal
{
  return self->_swipeDownTriggeringDismissal;
}

- (BOOL)swipeDownDismissalPreviewEnabled
{
  return self->_swipeDownDismissalPreviewEnabled;
}

- (double)swipeDownDismissalPreviewFraction
{
  return self->_swipeDownDismissalPreviewFraction;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (BOOL)wantsScrubberVisible
{
  return self->_wantsScrubberVisible;
}

- (double)scrubberVisibilityFraction
{
  return self->_scrubberVisibilityFraction;
}

- ($7DA682ECC7253F641496E0B6E9C98204)scrubberPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 896);
  return self;
}

- (NSDate)lastSkipSegmentActionDate
{
  return self->_lastSkipSegmentActionDate;
}

- (unint64_t)edgeToHighlight
{
  return self->_edgeToHighlight;
}

- (double)styleSwitcherVisibilityFraction
{
  return self->_styleSwitcherVisibilityFraction;
}

- (PXDisplayAssetCollection)mainAssetCollection
{
  return self->_mainAssetCollection;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  return self->_viewLayoutSpec;
}

- (PXStoryViewActionPerformer)actionPerformer
{
  return (PXStoryViewActionPerformer *)objc_loadWeakRetained((id *)&self->_actionPerformer);
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryViewEnvironmentModel)viewEnvironmentModel
{
  return (PXStoryViewEnvironmentModel *)objc_loadWeakRetained((id *)&self->_viewEnvironmentModel);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryConfiguration)mainConfiguration
{
  return self->_mainConfiguration;
}

- (NSArray)relatedModels
{
  return self->_relatedModels;
}

- (NSArray)relatedConfigurations
{
  return self->_relatedConfigurations;
}

- (int64_t)selectedRelatedIndex
{
  return self->_selectedRelatedIndex;
}

- (BOOL)didSelectAnyRelated
{
  return self->_didSelectAnyRelated;
}

- (BOOL)shouldPreventDisplaySleep
{
  return self->_shouldPreventDisplaySleep;
}

- (BOOL)isAnyMenuOpen
{
  return self->_isAnyMenuOpen;
}

- (BOOL)isActionMenuOpen
{
  return self->_isActionMenuOpen;
}

- (BOOL)shouldShowErrorIndicator
{
  return self->_shouldShowErrorIndicator;
}

- (NSError)displayedError
{
  return self->_displayedError;
}

- (BOOL)canToggleSelectMode
{
  return self->_canToggleSelectMode;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (PXAnonymousViewController)presentingViewController
{
  return (PXAnonymousViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PXDisplayAsset)mainAsset
{
  return self->_mainAsset;
}

- (NSAttributedString)displayTitle
{
  return self->_displayTitle;
}

- (NSAttributedString)displaySubtitle
{
  return self->_displaySubtitle;
}

- (PXStoryViewChromeTitleInfo)chromeTitleInfo
{
  return self->_chromeTitleInfo;
}

- (BOOL)showSongInTitleWhenPaused
{
  return self->_showSongInTitleWhenPaused;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (int64_t)lastMutedChangeReason
{
  return self->_lastMutedChangeReason;
}

- (double)volume
{
  return self->_volume;
}

- (BOOL)canShowMuteToggleButtonWhenChromeIsHidden
{
  return self->_canShowMuteToggleButtonWhenChromeIsHidden;
}

- (BOOL)isPerformingCrossfadeTransitionToRelated
{
  return self->_isPerformingCrossfadeTransitionToRelated;
}

- (PXPhotosViewModel)photosGridViewModel
{
  return self->_photosGridViewModel;
}

- (int64_t)highlightedRelatedIndex
{
  return self->_highlightedRelatedIndex;
}

- (BOOL)isUserPerformingRemoteGesture
{
  return self->_isUserPerformingRemoteGesture;
}

- (BOOL)shouldSimplifyUIForAccessibility
{
  return self->_shouldSimplifyUIForAccessibility;
}

- (BOOL)wantsFeedbackAction
{
  return self->_wantsFeedbackAction;
}

- (BOOL)shouldAutoReplayPreference
{
  return self->_shouldAutoReplayPreference;
}

- (PXStoryViewLayoutSpecManager)viewLayoutSpecManager
{
  return self->_viewLayoutSpecManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- (NSMapTable)diagnosticHUDContentProvidersByType
{
  return self->_diagnosticHUDContentProvidersByType;
}

- (BOOL)hasAnyError
{
  return self->_hasAnyError;
}

- (BOOL)isReadingFromPhotosGridViewModel
{
  return self->_isReadingFromPhotosGridViewModel;
}

- (BOOL)isAtPlaybackStart
{
  return self->_isAtPlaybackStart;
}

- (PXStoryPausableLoadingCoordinator)loadingCoordinator
{
  return self->_loadingCoordinator;
}

- (PXVolumeController)volumeController
{
  return self->_volumeController;
}

- (PXUserDefaultsDataSource)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)wantsSoloPlayback
{
  return self->_wantsSoloPlayback;
}

- (PXApplicationDisabledIdleTimerToken)preventedDisplaySleepToken
{
  return self->_preventedDisplaySleepToken;
}

- (void)setPreventedDisplaySleepToken:(id)a3
{
  objc_storeStrong((id *)&self->_preventedDisplaySleepToken, a3);
}

- (PXInfoUpdater)mainAssetInfoUpdater
{
  return self->_mainAssetInfoUpdater;
}

- (OS_dispatch_queue)mainAssetInfoUpdateQueue
{
  return self->_mainAssetInfoUpdateQueue;
}

- (NSMutableSet)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (NSMutableSet)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (PXStoryModel)modelCoveredByRelated
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_modelCoveredByRelated);
}

- (BOOL)shouldAutoHideMuteToggleButton
{
  return self->_shouldAutoHideMuteToggleButton;
}

- (UIImpactFeedbackGenerator)scrubberFeedbackGenerator
{
  return self->_scrubberFeedbackGenerator;
}

- (NSTimer)autoHideMuteToggleButtonTimer
{
  return self->_autoHideMuteToggleButtonTimer;
}

- (void)setAutoHideMuteToggleButtonTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoHideMuteToggleButtonTimer, a3);
}

- (NSTimer)autoHideChromeTimer
{
  return self->_autoHideChromeTimer;
}

- (void)setAutoHideChromeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoHideChromeTimer, a3);
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PXStoryPacingTimeSource)timeSource
{
  return self->_timeSource;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXStoryResourcesPreloadingCoordinator)resourcesPreloadingCoordinator
{
  return self->_resourcesPreloadingCoordinator;
}

- (PXStoryErrorRepository)errorRepository
{
  return self->_errorRepository;
}

- (BOOL)shouldAutoHideChrome
{
  return self->_shouldAutoHideChrome;
}

- (PXStoryAudioSessionController)audioSessionController
{
  return self->_audioSessionController;
}

- (PXStoryOverlayController)overlayController
{
  return self->_overlayController;
}

- (PXStoryRelatedController)relatedController
{
  return self->_relatedController;
}

- (PXStoryMusicPlayer)musicPlayer
{
  return self->_musicPlayer;
}

- (PXStoryPacingController)pacingController
{
  return self->_pacingController;
}

- (PXStorySongController)songController
{
  return self->_songController;
}

- (PXStoryViewResourcesPreloadingController)resourcesPreloadingController
{
  return self->_resourcesPreloadingController;
}

- (PXStoryPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (PXStoryViewBufferingController)bufferingController
{
  return self->_bufferingController;
}

- (PXStoryMuteStateController)muteStateController
{
  return self->_muteStateController;
}

- (PXStoryValidationController)validationController
{
  return self->_validationController;
}

- (PXPhotosViewInteraction)photosGridViewInteraction
{
  return self->_photosGridViewInteraction;
}

- (void)setPhotosGridViewInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_photosGridViewInteraction, a3);
}

- (NSDate)lastMainModelChangeDate
{
  return self->_lastMainModelChangeDate;
}

- (void)setLastMainModelChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMainModelChangeDate, a3);
}

- (BOOL)pausingPlaybackShowsChrome
{
  return self->_pausingPlaybackShowsChrome;
}

- (void)setPausingPlaybackShowsChrome:(BOOL)a3
{
  self->_pausingPlaybackShowsChrome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMainModelChangeDate, 0);
  objc_storeStrong((id *)&self->_photosGridViewInteraction, 0);
  objc_storeStrong((id *)&self->_validationController, 0);
  objc_storeStrong((id *)&self->_muteStateController, 0);
  objc_storeStrong((id *)&self->_bufferingController, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_resourcesPreloadingController, 0);
  objc_storeStrong((id *)&self->_songController, 0);
  objc_storeStrong((id *)&self->_pacingController, 0);
  objc_storeStrong((id *)&self->_musicPlayer, 0);
  objc_storeStrong((id *)&self->_relatedController, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_errorRepository, 0);
  objc_storeStrong((id *)&self->_resourcesPreloadingCoordinator, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_autoHideChromeTimer, 0);
  objc_storeStrong((id *)&self->_autoHideMuteToggleButtonTimer, 0);
  objc_storeStrong((id *)&self->_scrubberFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_modelCoveredByRelated);
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_mainAssetInfoUpdateQueue, 0);
  objc_storeStrong((id *)&self->_mainAssetInfoUpdater, 0);
  objc_storeStrong((id *)&self->_preventedDisplaySleepToken, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_loadingCoordinator, 0);
  objc_storeStrong((id *)&self->_diagnosticHUDContentProvidersByType, 0);
  objc_storeStrong(&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewLayoutSpecManager, 0);
  objc_storeStrong((id *)&self->_photosGridViewModel, 0);
  objc_storeStrong((id *)&self->_chromeTitleInfo, 0);
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_mainAsset, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_displayedError, 0);
  objc_storeStrong((id *)&self->_relatedConfigurations, 0);
  objc_storeStrong((id *)&self->_relatedModels, 0);
  objc_storeStrong((id *)&self->_mainConfiguration, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_viewEnvironmentModel);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_destroyWeak((id *)&self->_actionPerformer);
  objc_storeStrong((id *)&self->_viewLayoutSpec, 0);
  objc_storeStrong((id *)&self->_mainAssetCollection, 0);
  objc_storeStrong((id *)&self->_lastSkipSegmentActionDate, 0);
  objc_storeStrong((id *)&self->_viewControllerDismissalTargetPlacement, 0);
  objc_storeStrong((id *)&self->_viewModeTransition, 0);
  objc_storeStrong((id *)&self->_customGeneralChromeTitleConfiguration, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_mainAssetInfoUpdateQueue_titleDateFormatter, 0);
  objc_storeStrong((id *)&self->_openMenuIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDContentProvider, 0);
}

uint64_t __56__PXStoryViewModel_setShouldSimplifyUIForAccessibility___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldAutoHideChrome");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", 1);
  return result;
}

uint64_t __57__PXStoryViewModel_attemptRecoveryFromError_optionIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowErrorIndicator:", 0);
}

uint64_t __48__PXStoryViewModel_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__PXStoryViewModel_settings_changedValueForKey___block_invoke_2;
  v3[3] = &unk_1E5146E78;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __48__PXStoryViewModel_settings_changedValueForKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDiagnosticHUDState");
}

void __49__PXStoryViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 != MainModelObservationContext_184240)
  {
    if (v4 == ViewLayoutSpecManagerObservationContext)
    {
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v14 = v3;
        objc_msgSend(*(id *)(a1 + 32), "_invalidateViewLayoutSpec");
        goto LABEL_56;
      }
    }
    else if (v4 == ErrorRepositoryObservationContext)
    {
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v14 = v3;
        objc_msgSend(*(id *)(a1 + 32), "_invalidateErrorIndicator");
        goto LABEL_56;
      }
    }
    else if (v4 == PhotosGridViewModelObservationContext)
    {
      v11 = *(_QWORD *)(a1 + 48);
      v14 = v3;
      if ((v11 & 0x200000) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_invalidateCanToggleSelectMode");
        v3 = v14;
        v11 = *(_QWORD *)(a1 + 48);
      }
      if ((v11 & 4) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_invalidateIsInSelectMode");
        goto LABEL_56;
      }
    }
    else if (v4 == ViewModeTransitionObservationContext_184241)
    {
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v14 = v3;
        objc_msgSend(*(id *)(a1 + 32), "_invalidateLegibilityOverlayOpacity");
        goto LABEL_56;
      }
    }
    else
    {
      if (v4 == HUDObservableObservationContext)
      {
        v14 = v3;
        v12 = objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDType") == 17;
        v3 = v14;
        if (!v12)
          goto LABEL_57;
        objc_msgSend(*(id *)(a1 + 32), "_attachAccessibilityHUDIfNeeded");
        goto LABEL_56;
      }
      if (v4 != MusicPlayerObservationContext)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryViewModel.m"), 2481, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      if ((*(_BYTE *)(a1 + 48) & 4) != 0)
      {
        v14 = v3;
        objc_msgSend(*(id *)(a1 + 32), "_invalidateSongControllerFailedAssets");
LABEL_56:
        v3 = v14;
        goto LABEL_57;
      }
    }
    goto LABEL_57;
  }
  v14 = v3;
  objc_msgSend(*(id *)(a1 + 32), "mainModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changesOrigins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modelChangeOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  v9 = *(_QWORD *)(a1 + 48);
  if ((v9 & 0x10000) != 0 && (v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateViewMode");
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((v9 & 2) != 0)
    v10 = v8;
  else
    v10 = 1;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateDesiredPlayState");
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((v9 & 0x10000000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldAutoHideChrome");
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((v9 & 0x80001) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackFractionCompleted");
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((v9 & 0x20000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackDuration");
    v9 = *(_QWORD *)(a1 + 48);
    if ((v9 & 0x400000000000) == 0)
    {
LABEL_24:
      if ((v9 & 0x800) == 0)
        goto LABEL_25;
      goto LABEL_40;
    }
  }
  else if ((v9 & 0x400000000000) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidateOutroFractionCompleted");
  v9 = *(_QWORD *)(a1 + 48);
  if ((v9 & 0x800) == 0)
  {
LABEL_25:
    if ((v9 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMainAssetCollection");
  v9 = *(_QWORD *)(a1 + 48);
  if ((v9 & 0x8000) == 0)
  {
LABEL_26:
    if ((v9 & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4096);
  v9 = *(_QWORD *)(a1 + 48);
  if ((v9 & 0x400000) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000000000) == 0)
      goto LABEL_28;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateViewModeTransition");
  v9 = *(_QWORD *)(a1 + 48);
  if ((v9 & 0x100000000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_43:
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePhotosGridEffectProvider");
  v9 = *(_QWORD *)(a1 + 48);
  if ((v9 & 0x200) != 0)
  {
LABEL_29:
    objc_msgSend(*(id *)(a1 + 32), "_invalidateDisplayTitleAndSubtitle");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateRecentlyUsedSongs");
    v9 = *(_QWORD *)(a1 + 48);
  }
LABEL_30:
  if ((v9 & 0x18000400000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateLegibilityOverlayOpacity");
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((v9 & 0x8000000000000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "rewindToBeginning:", 1);
    v9 = *(_QWORD *)(a1 + 48);
  }
  v3 = v14;
  if ((v9 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateMainAsset");
    goto LABEL_56;
  }
LABEL_57:

}

uint64_t __41__PXStoryViewModel_infoUpdaterDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDisplayTitleAndSubtitle");
}

void __56__PXStoryViewModel_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_mainAssetInfoUpdateQueue_infoForAsset:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

id __50__PXStoryViewModel__updateDisplayTitleAndSubtitle__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "displayableTextForTitle:intent:", a2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__PXStoryViewModel__updateSongControllerFailedAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailedAudioAssets:", *(_QWORD *)(a1 + 32));
}

void __41__PXStoryViewModel__updateIsInSelectMode__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "photosGridViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsInSelectMode:", objc_msgSend(v2, "isInSelectMode"));

}

uint64_t __44__PXStoryViewModel__updateAXStoredPlayState__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
}

uint64_t __44__PXStoryViewModel__updateAXStoredPlayState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 0);
}

void __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  id v13;
  id location;
  _QWORD v15[5];
  id v16;

  v3 = a2;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 40) == 1 || (objc_msgSend(v4, "disableColorGrading") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mainModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorGradingRepository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorLookupCubeForColorGradeKind:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__184277;
  v15[4] = __Block_byref_object_dispose__184278;
  v16 = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke_352;
  v10[3] = &unk_1E5132F18;
  v12 = v15;
  v9 = v6;
  v11 = v9;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v3, "setEffectProvider:", v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  _Block_object_dispose(v15, 8);

}

id __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke_352(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && *(_QWORD *)(a1 + 32))
  {
    v7 = objc_msgSend(objc_alloc((Class)off_1E50B28B0), "initWithEntityManager:", v5);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setColorLookupCube:", *(_QWORD *)(a1 + 32));
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_gridEffectForAsset:colorGradingEffect:entityManager:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __51__PXStoryViewModel__updateLegibilityOverlayOpacity__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitleBackgroundOpacity:", *(double *)(a1 + 32));
}

void __48__PXStoryViewModel__updateControllersActiveness__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "wantsRelated"))
      v4 = objc_msgSend(*(id *)(a1 + 40), "allowsRelated");
    else
      v4 = 0;
    v3 = v7;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "setIsActive:", v4);
  if (objc_msgSend(v7, "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 40), "recentlyUsedFlexSongIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecentlyUsedFlexSongIDs:", v5);

    objc_msgSend(*(id *)(a1 + 40), "recentlyUsedAppleMusicSongIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecentlyUsedAppleMusicSongIDs:", v6);

  }
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_3(uint64_t a1, void *a2)
{
  _BOOL8 v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = *(_BYTE *)(a1 + 33) == 0;
  else
    v2 = 0;
  return objc_msgSend(a2, "setIsActive:", v2);
}

void __48__PXStoryViewModel__updateControllersActiveness__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (*(_BYTE *)(a1 + 40))
    v3 = objc_msgSend(*(id *)(a1 + 32), "wantsResourcesPreloading");
  else
    v3 = 0;
  objc_msgSend(v4, "setIsActive:", v3);

}

void __48__PXStoryViewModel__updateControllersActiveness__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (*(_BYTE *)(a1 + 40))
    v3 = objc_msgSend(*(id *)(a1 + 32), "wantsPersistence");
  else
    v3 = 0;
  objc_msgSend(v4, "setIsActive:", v3);

}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __47__PXStoryViewModel__updateMainModelControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMusicReadinessStatus:", 3);
}

void __45__PXStoryViewModel__updateViewModeTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _OWORD v5[4];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "swipeDownInteractionState");
  }
  else
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
  }
  v5[2] = v9;
  v5[3] = v10;
  v6 = v11;
  v5[0] = v7;
  v5[1] = v8;
  objc_msgSend(v3, "setSwipeDownInteractionState:", v5);

}

void __46__PXStoryViewModel__updateMainModelProperties__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "setDesiredPlayState:", objc_msgSend(*(id *)(a1 + 32), "desiredPlayState"));
  objc_msgSend(v9, "setViewMode:", objc_msgSend(*(id *)(a1 + 32), "viewMode"));
  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherVisibilityFraction");
  objc_msgSend(v9, "setStyleSwitcherVisibilityFraction:");
  objc_msgSend(v9, "setIsHUDVisible:", objc_msgSend(*(id *)(a1 + 32), "isHUDVisible"));
  objc_msgSend(v9, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDType"));
  objc_msgSend(v9, "setAllowsScrolling:", objc_msgSend(*(id *)(a1 + 32), "wantsRelatedOverlayScrollable") ^ 1);
  objc_msgSend(v9, "setIsPerformingViewControllerTransition:", objc_msgSend(*(id *)(a1 + 32), "isPerformingViewControllerTransition"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "isMuted");
  v4 = 0.0;
  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "volume", 0.0);
  objc_msgSend(v9, "setVolume:", v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "modelCoveredByRelated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1.0;
  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "relatedOverlayVisibilityFraction", 1.0);
    v7 = 1.0 - v8;
  }
  objc_msgSend(v9, "setTitleOpacity:", v7);

  objc_msgSend(*(id *)(a1 + 32), "chromeVisibilityFraction");
  objc_msgSend(v9, "setChromeVisibilityFraction:");

}

uint64_t __45__PXStoryViewModel__autoHideMuteToggleButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCanShowMuteToggleButtonWhenChromeIsHidden:", 0);
}

void __53__PXStoryViewModel__scheduleMuteToggleButtonAutoHide__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_autoHideMuteToggleButton");

}

uint64_t __40__PXStoryViewModel_deselectAllGridItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __38__PXStoryViewModel_selectAllGridItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAll");
}

uint64_t __38__PXStoryViewModel_setIsInSelectMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  result = objc_msgSend(a2, "attemptSetInSelectMode:", *(unsigned __int8 *)(a1 + 40));
  if ((result & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__PXStoryViewModel_setIsInSelectMode___block_invoke_2;
    v5[3] = &unk_1E5146E78;
    v5[4] = v4;
    return objc_msgSend(v4, "performChanges:", v5);
  }
  return result;
}

uint64_t __38__PXStoryViewModel_setIsInSelectMode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsInSelectMode");
}

uint64_t __32__PXStoryViewModel__replayMusic__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replay");
}

uint64_t __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int16 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke_2;
  v3[3] = &unk_1E5132D00;
  v3[4] = v1;
  v4 = *(_WORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

void __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skipToBeginningOfSegmentWithIdentifier:", objc_msgSend(v4, "firstSegmentIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", objc_msgSend(*(id *)(a1 + 32), "shouldSimplifyUIForAccessibility"));
  objc_msgSend(*(id *)(a1 + 32), "setWantsRelatedOverlayVisible:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:", *(unsigned __int8 *)(a1 + 40));
  if (*(_BYTE *)(a1 + 41) && *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mainConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAppleMusicPreview");

    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_replayMusic");
  }
}

uint64_t __46__PXStoryViewModel__resetSelectedRelatedIndex__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedRelatedIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

void __66__PXStoryViewModel__changeMainModelToRelatedAtIndex_changeOrigin___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetSelectedRelatedIndex");

}

void __66__PXStoryViewModel__changeMainModelToRelatedAtIndex_changeOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDesiredPlayState:", 1);
  objc_msgSend(v2, "setTitleOpacity:", 1.0);

}

PXStoryModel *__45__PXStoryViewModel_setRelatedConfigurations___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  PXStoryModel *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "musicCurationProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "expected music provider for related configuration %@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "setRecentlyUsedFlexSongIDs:", a1[5]);
  objc_msgSend(v4, "setRecentlyUsedAppleMusicSongIDs:", a1[6]);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:]([PXStoryModel alloc], "initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:", v3, a1[7], 0, objc_msgSend(v6, "fullsizePaperTrailOptions"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__PXStoryViewModel_setRelatedConfigurations___block_invoke_298;
  v11[3] = &unk_1E51337A8;
  v12 = v3;
  v13 = v6;
  v8 = v6;
  v9 = v3;
  -[PXStoryModel performChanges:](v7, "performChanges:", v11);

  return v7;
}

void __45__PXStoryViewModel_setRelatedConfigurations___block_invoke_298(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setViewMode:", 3);
  if (objc_msgSend(*(id *)(a1 + 32), "options") == 4)
    v3 = 2;
  else
    v3 = 3;
  objc_msgSend(v6, "setThumbnailStyle:", v3);
  objc_msgSend(v6, "setIsHUDVisible:", objc_msgSend(*(id *)(a1 + 40), "areRelatedHUDsVisible"));
  objc_msgSend(v6, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 40), "defaultHUDType"));
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "renderTitlesForRelated");

  if ((v5 & 1) == 0)
    objc_msgSend(v6, "setTitleOpacity:", 0.0);

}

uint64_t __44__PXStoryViewModel_setValidationController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __43__PXStoryViewModel_setBufferingController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __45__PXStoryViewModel_setPersistenceController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __53__PXStoryViewModel_setResourcesPreloadingController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __40__PXStoryViewModel_setPacingController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __35__PXStoryViewModel_setMusicPlayer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __41__PXStoryViewModel_setRelatedController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __36__PXStoryViewModel_liveResizeDidEnd__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInLiveResize:", 0);
}

uint64_t __39__PXStoryViewModel_liveResizeWillStart__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInLiveResize:", 1);
}

void __32__PXStoryViewModel_cycleHUDType__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isHUDVisible") & 1) != 0)
  {
    +[PXStorySettings possibleDefaultHUDTypes](PXStorySettings, "possibleDefaultHUDTypes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "diagnosticHUDType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "indexOfObject:", v3);

    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = (v4 + 1) % (unint64_t)objc_msgSend(v2, "count");
    objc_msgSend(v2, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiagnosticHUDType:", objc_msgSend(v6, "integerValue"));

  }
  else
  {
    objc_msgSend(v7, "setIsHUDVisible:", 1);
  }

}

void __29__PXStoryViewModel_toggleHUD__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsHUDVisible:", objc_msgSend(v2, "isHUDVisible") ^ 1);
  if (objc_msgSend(v2, "isHUDVisible") && !objc_msgSend(v2, "diagnosticHUDType"))
    objc_msgSend(v2, "cycleHUDType");

}

uint64_t __59__PXStoryViewModel_skipToBeginningOfSegmentWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "skipToBeginningOfSegmentWithIdentifier:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __58__PXStoryViewModel_skipToSegmentWithOffset_byTappingEdge___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "skipToSegmentWithOffset:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __35__PXStoryViewModel__autoHideChrome__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsChromeVisible:", 0);
}

void __44__PXStoryViewModel_setShouldAutoHideChrome___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_autoHideChrome");

}

uint64_t __40__PXStoryViewModel_setDesiredPlayState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsChromeVisible:", 1);
}

void __91__PXStoryViewModel_initWithConfiguration_extendedTraitCollection_timeSource_mediaProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_setMainModel:changeOrigin:", v4, 0);
  objc_msgSend(*(id *)(a1 + 32), "_invalidateViewLayoutSpec");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateViewModelControllers");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDiagnosticHUDState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateErrorIndicator");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMainAsset");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDisplayTitleAndSubtitle");
  objc_msgSend(v5, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(v5, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 14);
  objc_msgSend(v5, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 17);

}

+ (void)registerViewModelDesiringSoloPlayback:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  dispatch_time_t v11;
  _QWORD v12[6];

  v5 = a3;
  if (PFOSVariantHasInternalDiagnostics())
  {
    v6 = (void *)_viewModelsDesiringPlayback;
    if (!_viewModelsDesiringPlayback)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)_viewModelsDesiringPlayback;
      _viewModelsDesiringPlayback = v7;

      v6 = (void *)_viewModelsDesiringPlayback;
    }
    objc_msgSend(v6, "addObject:", v5);
    objc_msgSend(v5, "mainConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowPlayingMultipleStoriesSimultaneously");

    if ((v10 & 1) == 0)
    {
      v11 = dispatch_time(0, 1000000000);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__PXStoryViewModel_registerViewModelDesiringSoloPlayback___block_invoke;
      v12[3] = &__block_descriptor_48_e5_v8__0l;
      v12[4] = a2;
      v12[5] = a1;
      dispatch_after(v11, MEMORY[0x1E0C80D38], v12);
    }
  }

}

+ (void)unregisterViewModelDesiringSoloPlayback:(id)a3
{
  objc_msgSend((id)_viewModelsDesiringPlayback, "removeObject:", a3);
}

void __58__PXStoryViewModel_registerViewModelDesiringSoloPlayback___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PXFilter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(*(Class *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412546;
      v6 = v4;
      v7 = 2112;
      v8 = v2;
      _os_log_fault_impl(&dword_1A6789000, v3, OS_LOG_TYPE_FAULT, "Multiple instances of %@ are attempting to play simultaneously: %@", (uint8_t *)&v5, 0x16u);

    }
  }

}

uint64_t __58__PXStoryViewModel_registerViewModelDesiringSoloPlayback___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wantsSoloPlayback");
}

@end
