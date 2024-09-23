@implementation PXStoryModel

- (id)photoKitAssetContainerWithAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  PXStoryPhotoKitAssetContainer *v8;

  v4 = a3;
  -[PXStoryModel configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = -[PXStoryPhotoKitAssetContainer initWithAssetCollection:originalContainer:]([PXStoryPhotoKitAssetContainer alloc], "initWithAssetCollection:originalContainer:", v4, v7);
  return v8;
}

- (PXStoryModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  return -[PXStoryModel initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:](self, "initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:", a3, a4, 0, 0);
}

- (PXStoryModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4 loadingCoordinator:(id)a5 paperTrailOptions:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  PXStoryRecipeManager *v16;
  PXStoryStyleManager *v17;
  void *v18;
  PXStoryStyleManager *v19;
  PXStoryTimelineSpecManager *v20;
  void *v21;
  PXStoryLayoutSpecManager *v22;
  PXStoryModel *v23;
  id v24;
  id v25;
  id v26;
  PXStoryRecipeManager *v27;
  PXStoryResourcesDataSourceManager *v29;
  _QWORD v31[4];
  PXStoryRecipeManager *v32;
  id v33;
  id v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "timelineProducer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = -[PXStoryRecipeManager initWithConfiguration:]([PXStoryRecipeManager alloc], "initWithConfiguration:", v9);
  v29 = -[PXStoryResourcesDataSourceManager initWithRecipeManager:]([PXStoryResourcesDataSourceManager alloc], "initWithRecipeManager:", v16);
  v17 = [PXStoryStyleManager alloc];
  objc_msgSend(v9, "errorReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXStoryStyleManager initWithRecipeManager:errorReporter:](v17, "initWithRecipeManager:errorReporter:", v16, v18);

  v20 = -[PXStoryTimelineSpecManager initWithExtendedTraitCollection:configuration:]([PXStoryTimelineSpecManager alloc], "initWithExtendedTraitCollection:configuration:", v10, v9);
  +[PXStoryTimelineManager timelineManagerWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:configuration:loadingCoordinator:paperTrailOptions:](PXStoryTimelineManager, "timelineManagerWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:configuration:loadingCoordinator:paperTrailOptions:", v15, v29, v19, v20, v9, v11, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[PXStoryLayoutSpecManager initWithExtendedTraitCollection:options:storyConfigurationOptions:]([PXStoryLayoutSpecManager alloc], "initWithExtendedTraitCollection:options:storyConfigurationOptions:", v10, 0, objc_msgSend(v9, "options"));
  v23 = -[PXStoryModel initWithTimelineManager:layoutSpecManager:configuration:](self, "initWithTimelineManager:layoutSpecManager:configuration:", v21, v22, v9);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __114__PXStoryModel_Configuration__initWithConfiguration_extendedTraitCollection_loadingCoordinator_paperTrailOptions___block_invoke;
  v31[3] = &unk_1E5120BE0;
  v32 = v16;
  v33 = v21;
  v34 = v9;
  v35 = v10;
  v24 = v10;
  v25 = v9;
  v26 = v21;
  v27 = v16;
  -[PXStoryModel performChanges:](v23, "performChanges:", v31);

  return v23;
}

void __114__PXStoryModel_Configuration__initWithConfiguration_extendedTraitCollection_loadingCoordinator_paperTrailOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 3);
  objc_msgSend(v3, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 8);
  objc_msgSend(v3, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 9);
  objc_msgSend(v3, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 10);
  objc_msgSend(v3, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 40), 7);
  objc_msgSend(v3, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 40), 11);
  if ((objc_msgSend(*(id *)(a1 + 48), "options") & 2) != 0)
  {
    objc_msgSend(v3, "setViewMode:", 3);
    objc_msgSend(v3, "setThumbnailStyle:", objc_msgSend(*(id *)(a1 + 56), "userInterfaceFeature") == 1);
  }

}

- (PXStoryModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryModel.m"), 118, CFSTR("%s is not available as initializer"), "-[PXStoryModel init]");

  abort();
}

- (PXStoryModel)initWithTimelineManager:(id)a3 layoutSpecManager:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  char *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  PXStoryLoadingStatusReporter *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  PXStoryAnimationController *v54;
  void *v55;
  PXVideoSessionManager *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  CMTimeValue v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  _QWORD v73[4];
  char *v74;
  id v75;
  objc_super v76;
  CMTime buf;
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v76.receiver = self;
  v76.super_class = (Class)PXStoryModel;
  v12 = -[PXStoryModel init](&v76, sel_init);
  if (v12)
  {
    objc_msgSend(v11, "log");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLog:", v13);

    objc_msgSend(v12, "setLogContext:", objc_msgSend(v11, "logContext"));
    objc_msgSend(v12, "log");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, v12);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        v68 = objc_msgSend(v12, "logContext");
        objc_msgSend(v11, "assetCollection");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetCollection");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "localizedTitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetCollection");
        v72 = v9;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "uuid");
        v71 = v10;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 134218754;
        *(CMTimeValue *)((char *)&buf.value + 4) = v68;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v18;
        HIWORD(buf.epoch) = 2112;
        v78 = v19;
        v79 = 2114;
        v80 = v21;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_EVENT, v16, "PXStoryModel.init", "Context=%{signpost.telemetry:string2}lu AssetCollection=%{signpost.description:attribute,public}@ Title=%{signpost.description:attribute}@ UUID=%{signpost.description:attribute,public}@ ", (uint8_t *)&buf, 0x2Au);

        v10 = v71;
        v9 = v72;

      }
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "logContext"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v12 + 22);
    *((_QWORD *)v12 + 22) = v22;

    objc_storeStrong((id *)v12 + 83, a3);
    objc_msgSend(*((id *)v12 + 83), "registerChangeObserver:context:", v12, TimelineManagerObservationContext);
    objc_msgSend(*((id *)v12 + 83), "specManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerChangeObserver:context:", v12, TimelineSpecManagerObservationContext);

    objc_msgSend(v9, "resourcesDataSourceManager");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v12 + 55);
    *((_QWORD *)v12 + 55) = v25;

    objc_msgSend(*((id *)v12 + 55), "registerChangeObserver:context:", v12, ResourcesDataSourceManagerObservationContext_149505);
    objc_msgSend(v9, "styleManager");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v12 + 51);
    *((_QWORD *)v12 + 51) = v27;

    objc_msgSend(*((id *)v12 + 51), "registerChangeObserver:context:", v12, StyleManagerObservationContext_149506);
    objc_msgSend(*((id *)v12 + 55), "recipeManager");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v12 + 56);
    *((_QWORD *)v12 + 56) = v29;

    objc_storeStrong((id *)v12 + 72, a4);
    objc_msgSend(*((id *)v12 + 72), "registerChangeObserver:context:", v12, LayoutSpecManagerObservationContext);
    v31 = objc_alloc_init(PXStoryLoadingStatusReporter);
    v32 = (void *)*((_QWORD *)v12 + 64);
    *((_QWORD *)v12 + 64) = v31;

    objc_msgSend(v12, "log");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v12 + 64), "setLog:", v33);

    objc_msgSend(*((id *)v12 + 64), "setLogContext:", objc_msgSend(v12, "logContext"));
    v34 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v12, sel__setNeedsUpdate);
    v35 = (void *)*((_QWORD *)v12 + 73);
    *((_QWORD *)v12 + 73) = v34;

    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateTimeline);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateTimelineAttributes);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateTimelineSpec);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateNominalPlaybackTime);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateCurrentStyle);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateOutroDuration);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateOutroFractionCompleted);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updatePlaybackFractionCompleted);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateCurrentAssetCollection);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateLayoutSpec);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateShouldAspectFitCurrentSegment);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updatePersistencePermission);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updateWantsMusicDucked);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updatePressedFractionAnimator);
    objc_msgSend(*((id *)v12 + 73), "addUpdateSelector:", sel__updatePressAnimationInfo);
    v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v37 = (void *)*((_QWORD *)v12 + 12);
    *((_QWORD *)v12 + 12) = v36;

    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = (void *)*((_QWORD *)v12 + 13);
    *((_QWORD *)v12 + 13) = v38;

    objc_msgSend(*((id *)v12 + 51), "colorGradingRepository");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v12 + 52);
    *((_QWORD *)v12 + 52) = v40;

    *((_QWORD *)v12 + 26) = 0;
    CMTimeMakeWithSeconds(&buf, 0.0, 600);
    v42 = *(_OWORD *)&buf.value;
    *((_QWORD *)v12 + 101) = buf.epoch;
    *(_OWORD *)(v12 + 792) = v42;
    CMTimeMakeWithSeconds(&buf, 0.0, 600);
    v43 = *(_OWORD *)&buf.value;
    *((_QWORD *)v12 + 89) = buf.epoch;
    *(_OWORD *)(v12 + 696) = v43;
    *((_QWORD *)v12 + 84) = 0;
    CMTimeMakeWithSeconds(&buf, 0.0, 600);
    v44 = *(_OWORD *)&buf.value;
    *((_QWORD *)v12 + 107) = buf.epoch;
    *(_OWORD *)(v12 + 840) = v44;
    *((_QWORD *)v12 + 27) = objc_msgSend(v11, "initialViewMode");
    v12[127] = 1;
    *((_OWORD *)v12 + 57) = 0u;
    *((_OWORD *)v12 + 58) = 0u;
    *((_OWORD *)v12 + 56) = 0u;
    *((_QWORD *)v12 + 29) = 1;
    *((_QWORD *)v12 + 33) = 0x3FF0000000000000;
    *((_QWORD *)v12 + 69) = 0x3FF0000000000000;
    objc_msgSend(v9, "storyQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)*((_QWORD *)v12 + 19);
    *((_QWORD *)v12 + 19) = v45;

    v12[136] = (objc_msgSend(v11, "options") & 0x2000) != 0 || *((_QWORD *)v12 + 19) != MEMORY[0x1E0C80D38];
    v12[137] = (objc_msgSend(v11, "options") & 0x8000) != 0;
    v47 = objc_msgSend(v11, "options");
    *((_QWORD *)v12 + 63) = objc_msgSend(v9, "options") & 1 | (2 * ((v47 >> 6) & 1));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)*((_QWORD *)v12 + 74);
    *((_QWORD *)v12 + 74) = v48;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)*((_QWORD *)v12 + 75);
    *((_QWORD *)v12 + 75) = v50;

    objc_msgSend(v11, "errorReporter");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)*((_QWORD *)v12 + 65);
    *((_QWORD *)v12 + 65) = v52;

    v54 = -[PXStoryAnimationController initWithModel:]([PXStoryAnimationController alloc], "initWithModel:", v12);
    v55 = (void *)*((_QWORD *)v12 + 60);
    *((_QWORD *)v12 + 60) = v54;

    v56 = objc_alloc_init(PXVideoSessionManager);
    v57 = (void *)*((_QWORD *)v12 + 61);
    *((_QWORD *)v12 + 61) = v56;

    objc_msgSend(v12, "log");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v12 + 61), "setLog:", v58);

    objc_msgSend(*((id *)v12 + 61), "setLogContext:", objc_msgSend(v12, "logContext"));
    *((_QWORD *)v12 + 69) = 0x3FF0000000000000;
    *((_DWORD *)v12 + 36) = 1065353216;
    v59 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v60 = (void *)*((_QWORD *)v12 + 14);
    *((_QWORD *)v12 + 14) = v59;

    +[PXStoryUIFactory thumbnailActionPerformerWithModel:](PXStoryUIFactory, "thumbnailActionPerformerWithModel:", v12);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)*((_QWORD *)v12 + 30);
    *((_QWORD *)v12 + 30) = v61;

    v63 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    v64 = (void *)*((_QWORD *)v12 + 79);
    *((_QWORD *)v12 + 79) = v63;

    objc_msgSend(*((id *)v12 + 79), "registerChangeObserver:context:", v12, PressedFractionAnimatorObservationContext);
    objc_msgSend(v11, "desiredStartAsset");
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)*((_QWORD *)v12 + 80);
    *((_QWORD *)v12 + 80) = v65;

    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __72__PXStoryModel_initWithTimelineManager_layoutSpecManager_configuration___block_invoke;
    v73[3] = &unk_1E5144868;
    v74 = v12;
    v75 = v11;
    objc_msgSend(v74, "performChanges:", v73);

  }
  return (PXStoryModel *)v12;
}

- (void)performChanges:(id)a3
{
  -[PXStoryModel performChanges:origin:](self, "performChanges:origin:", a3, 0);
}

- (void)performChanges:(id)a3 origin:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  -[PXStoryModel storyQueue](self, "storyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
    -[NSMutableSet addObject:](self->_changesOrigins, "addObject:", v7);
  v9.receiver = self;
  v9.super_class = (Class)PXStoryModel;
  -[PXStoryModel performChanges:](&v9, sel_performChanges_, v6);

}

- (void)didPerformChanges
{
  int v3;
  int v4;
  void *v5;
  objc_super v6;

  v3 = -[PXStoryModel currentChanges](self, "currentChanges");
  v4 = -[PXStoryModel currentChanges](self, "currentChanges");
  if ((v3 & 0x10000) != 0 && (v4 & 0x2000000) == 0)
    -[PXStoryModel _clearLastHitAssetClip](self, "_clearLastHitAssetClip");
  v6.receiver = self;
  v6.super_class = (Class)PXStoryModel;
  -[PXStoryModel didPerformChanges](&v6, sel_didPerformChanges);
  -[PXStoryModel updater](self, "updater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIfNeeded");

}

- (void)didEndChangeHandling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryModel;
  -[PXStoryModel didEndChangeHandling](&v3, sel_didEndChangeHandling);
  -[NSMutableSet removeAllObjects](self->_changesOrigins, "removeAllObjects");
}

- (NSSet)changesOrigins
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_changesOrigins, "copy");
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  void *v2;
  void *v3;

  -[PXStoryModel layoutSpecManager](self, "layoutSpecManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXExtendedTraitCollection *)v3;
}

- (BOOL)isExporting
{
  return -[PXStoryModel options](self, "options") & 1;
}

- (PXStoryChapter)currentChapter
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[PXStoryModel chapterCollectionManager](self, "chapterCollectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chapterCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryModel visibleDisplayAssets](self, "visibleDisplayAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chapterContainingAsset:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        break;
      if (++v6 >= objc_msgSend(v5, "count"))
        goto LABEL_5;
    }
  }

  return (PXStoryChapter *)v8;
}

- (BOOL)currentChapterTitleIsVisible
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[PXStoryModel chapterCollectionManager](self, "chapterCollectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chapterCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryModel visibleDisplayAssets](self, "visibleDisplayAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") < 1)
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "containsChapterBeginningWithAsset:", v7);

      if (v8)
        break;
      if (++v6 >= objc_msgSend(v5, "count"))
        goto LABEL_5;
    }
    -[PXStoryModel timeline](self, "timeline");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryModel visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "indexOfSegmentWithIdentifier:", objc_msgSend(v11, "firstIndex"));

    v9 = v12 != 0;
  }

  return v9;
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  void *v2;
  void *v3;

  -[PXStoryModel recipeManager](self, "recipeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chapterCollectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXStoryChapterCollectionManager *)v3;
}

- (void)_displayCollectionPersistenceConfirmationIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  -[PXStoryModel configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collectionPersistenceConfirmationStyle");

  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryModel setPersistenceConfirmationPresentationDate:](self, "setPersistenceConfirmationPresentationDate:", v5);

    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "displaying persistence confirmation toast", v8, 2u);
    }

    v7 = +[PXToast show:](PXToast, "show:", &__block_literal_global_149772);
  }
}

- (void)setConfiguration:(id)a3
{
  PXStoryConfiguration *v5;
  PXStoryConfiguration *v6;
  char v7;
  PXStoryConfiguration *v8;

  v8 = (PXStoryConfiguration *)a3;
  v5 = self->_configuration;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXStoryConfiguration isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000000);
      -[PXStoryModel _invalidatePersistencePermission](self, "_invalidatePersistencePermission");
    }
  }

}

- (void)setViewMode:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    if (a3 != 3)
      -[PXStoryModel setThumbnailStyle:](self, "setThumbnailStyle:", 0);
    -[PXStoryModel _invalidateOutroFractionCompleted](self, "_invalidateOutroFractionCompleted");
    -[PXStoryModel _invalidatePressedFractionAnimator](self, "_invalidatePressedFractionAnimator");
    -[PXStoryModel signalChange:](self, "signalChange:", 0x10000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v18 = 134217984;
        v19 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedViewMode", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v18, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        PXStoryViewModeDescription(a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218498;
        v19 = v11;
        v20 = 2048;
        v21 = a3;
        v22 = 2114;
        v23 = v12;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedViewMode", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v18, 0x20u);

      }
    }

    v13 = v8;
    v14 = os_signpost_id_make_with_pointer(v13, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        v16 = -[PXStoryModel logContext](self, "logContext");
        PXStoryViewModeDescription(a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218498;
        v19 = v16;
        v20 = 2048;
        v21 = a3;
        v22 = 2114;
        v23 = v17;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryModelChangedViewMode", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v18, 0x20u);

      }
    }

  }
}

- (void)setThumbnailStyle:(int64_t)a3
{
  if (self->_thumbnailStyle != a3)
    self->_thumbnailStyle = a3;
}

- (void)setPrefersExportLayoutMatchesPlayback:(BOOL)a3
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
  if (self->_prefersExportLayoutMatchesPlayback != a3)
  {
    v3 = a3;
    self->_prefersExportLayoutMatchesPlayback = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x80000000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedPrefersExportLayoutMatchesPlayback", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedPrefersExportLayoutMatchesPlayback", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedPrefersExportLayoutMatchesPlayback", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setChromeVisibilityFraction:(double)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  double chromeVisibilityFraction;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  double v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_chromeVisibilityFraction != a3)
  {
    self->_chromeVisibilityFraction = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x1000000000000000);
    -[PXStoryModel log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryModelChangedChromeVisibilityFraction", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXStoryModel logContext](self, "logContext");
        chromeVisibilityFraction = self->_chromeVisibilityFraction;
        v17 = 134218240;
        v18 = v10;
        v19 = 2048;
        v20 = chromeVisibilityFraction;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryModelChangedChromeVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = self->_chromeVisibilityFraction;
        v17 = 134218240;
        v18 = v15;
        v19 = 2048;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedChromeVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }

  }
}

- (void)setTitleOpacity:(double)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  double titleOpacity;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  double v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_titleOpacity != a3)
  {
    self->_titleOpacity = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x1000000000000);
    -[PXStoryModel log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryModelChangedTitleOpacity", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXStoryModel logContext](self, "logContext");
        titleOpacity = self->_titleOpacity;
        v17 = 134218240;
        v18 = v10;
        v19 = 2048;
        v20 = titleOpacity;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryModelChangedTitleOpacity", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = self->_titleOpacity;
        v17 = 134218240;
        v18 = v15;
        v19 = 2048;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedTitleOpacity", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }

  }
}

- (void)setPresentedTitleFrame:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_presentedTitleFrame) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedTitleFrame, a3);
    -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000000000000);
  }

}

- (void)setPresentedSubtitleFrame:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_presentedSubtitleFrame) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedSubtitleFrame, a3);
    -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000000000000);
  }

}

- (void)setTitleAlignment:(int64_t)a3
{
  if (self->_titleAlignment != a3)
  {
    self->_titleAlignment = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000000000000);
  }
}

- (void)setDetailsViewButtonDisplayStyle:(int64_t)a3
{
  if (self->_detailsViewButtonDisplayStyle != a3)
    self->_detailsViewButtonDisplayStyle = a3;
}

- (void)setShouldAutoplayThumbnail:(BOOL)a3
{
  if (self->_shouldAutoplayThumbnail != a3)
  {
    self->_shouldAutoplayThumbnail = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x80000000);
  }
}

- (void)setShouldUseInactiveImageFilter:(BOOL)a3
{
  if (self->_shouldUseInactiveImageFilter != a3)
  {
    self->_shouldUseInactiveImageFilter = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x40000000000000);
  }
}

- (void)setThumbnailAutoplayTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_thumbnailAutoplayTimeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  p_thumbnailAutoplayTimeRange = &self->_thumbnailAutoplayTimeRange;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = *(_OWORD *)&self->_thumbnailAutoplayTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_thumbnailAutoplayTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_thumbnailAutoplayTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_thumbnailAutoplayTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_thumbnailAutoplayTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_thumbnailAutoplayTimeRange->start.value = v8;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x4000000000000);
  }
}

- (void)setShouldAspectFitCurrentSegment:(BOOL)a3
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
  if (self->_shouldAspectFitCurrentSegment != a3)
  {
    v3 = a3;
    self->_shouldAspectFitCurrentSegment = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x1000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedShouldAspectFitCurrentSegment", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedShouldAspectFitCurrentSegment", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedShouldAspectFitCurrentSegment", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setViewModeTransition:(id)a3
{
  PXStoryViewModeTransition *v5;
  PXStoryViewModeTransition *v6;
  PXStoryViewModeTransition *v7;
  char v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  PXStoryViewModeTransition *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (PXStoryViewModeTransition *)a3;
  v6 = self->_viewModeTransition;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryViewModeTransition isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModeTransition, a3);
      -[PXStoryModel signalChange:](self, "signalChange:", 0x400000);
      -[PXStoryModel log](self, "log");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          v20 = 134217984;
          v21 = -[PXStoryModel logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PXStoryModelChangedViewModeTransition", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
        }
      }

      v12 = v9;
      v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          v15 = -[PXStoryModel logContext](self, "logContext");
          v20 = 134218242;
          v21 = v15;
          v22 = 2114;
          v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryModelChangedViewModeTransition", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

      v16 = v12;
      v17 = os_signpost_id_make_with_pointer(v16, self);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v18 = v17;
        if (os_signpost_enabled(v16))
        {
          v19 = -[PXStoryModel logContext](self, "logContext");
          v20 = 134218242;
          v21 = v19;
          v22 = 2114;
          v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryModelChangedViewModeTransition", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

    }
  }

}

- (void)setTimeline:(id)a3
{
  PXStoryTimeline *v5;
  PXStoryTimeline *v6;
  PXStoryTimeline *v7;
  char v8;
  PXStoryTimeline *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  CMTimeValue v16;
  NSObject *v17;
  os_signpost_id_t v18;
  os_signpost_id_t v19;
  CMTimeValue v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _QWORD v26[5];
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime rhs;
  CMTime buf;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (PXStoryTimeline *)a3;
  v6 = self->_timeline;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryTimeline isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = self->_timeline;
      objc_storeStrong((id *)&self->_timeline, a3);
      -[PXStoryModel signalChange:](self, "signalChange:", 16);
      -[PXStoryModel log](self, "log");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = os_signpost_id_make_with_pointer(v10, self);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          LODWORD(buf.value) = 134217984;
          *(CMTimeValue *)((char *)&buf.value + 4) = -[PXStoryModel logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryModelChangedTimeline", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&buf, 0xCu);
        }
      }

      v13 = v10;
      v14 = os_signpost_id_make_with_pointer(v13, self);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v15 = v14;
        if (os_signpost_enabled(v13))
        {
          v16 = -[PXStoryModel logContext](self, "logContext");
          LODWORD(buf.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.value + 4) = v16;
          LOWORD(buf.flags) = 2114;
          *(_QWORD *)((char *)&buf.flags + 2) = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_EVENT, v15, "PXStoryModelChangedTimeline", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&buf, 0x16u);
        }
      }

      v17 = v13;
      v18 = os_signpost_id_make_with_pointer(v17, self);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v19 = v18;
        if (os_signpost_enabled(v17))
        {
          v20 = -[PXStoryModel logContext](self, "logContext");
          LODWORD(buf.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.value + 4) = v20;
          LOWORD(buf.flags) = 2114;
          *(_QWORD *)((char *)&buf.flags + 2) = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PXStoryModelChangedTimeline", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&buf, 0x16u);
        }
      }

      v21 = -[PXStoryModel currentSegmentIdentifier](self, "currentSegmentIdentifier");
      -[PXStoryModel desiredStartAsset](self, "desiredStartAsset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = -[PXStoryTimeline identifierOfFirstSegmentContainingAsset:](v5, "identifierOfFirstSegmentContainingAsset:", v22);
        if (v23)
        {
          v24 = v23;
          -[PXStoryModel setDesiredStartAsset:](self, "setDesiredStartAsset:", 0);
          v21 = v24;
        }
      }
      v29.epoch = 0;
      *(_OWORD *)&v29.value = PXStoryTimeZero;
      *(_OWORD *)&v28.value = PXStoryTimeZero;
      v28.epoch = 0;
      if (-[PXStoryTimeline containsSegmentWithIdentifier:](v9, "containsSegmentWithIdentifier:", v21))
      {
        -[PXStoryModel timeIntoCurrentSegment](self, "timeIntoCurrentSegment");
        -[PXStoryModel timeLeftInCurrentSegment](self, "timeLeftInCurrentSegment");
      }
      if ((-[PXStoryTimeline containsSegmentWithIdentifier:](v5, "containsSegmentWithIdentifier:", v21) & 1) == 0)
      {
        v21 = -[PXStoryTimeline identifierOfSegmentClosestToSegmentWithIdentifier:inTimeline:](v5, "identifierOfSegmentClosestToSegmentWithIdentifier:inTimeline:", v21, v9);
        if (v5)
        {
          -[PXStoryTimeline timeRangeForSegmentWithIdentifier:](v5, "timeRangeForSegmentWithIdentifier:", v21);
        }
        else
        {
          memset(v26, 0, 32);
          v25 = 0u;
        }
        buf = *(CMTime *)&v26[1];
        rhs = v28;
        CMTimeSubtract(&v27, &buf, &rhs);
        v28 = v27;
      }
      buf = v29;
      rhs = v28;
      -[PXStoryModel setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:](self, "setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:", v21, &buf, &rhs, 1, v25, v26[0]);
      -[PXStoryModel _invalidateNominalPlaybackTime](self, "_invalidateNominalPlaybackTime");
      -[PXStoryModel _invalidateOutroDuration](self, "_invalidateOutroDuration");
      -[PXStoryModel _invalidatePlaybackFractionCompleted](self, "_invalidatePlaybackFractionCompleted");
      -[PXStoryModel _callCompletionHandlersPendingTimelineChange](self, "_callCompletionHandlersPendingTimelineChange");

    }
  }

}

- (void)_callCompletionHandlersPendingTimelineChange
{
  void (**v3)(id, uint64_t);

  -[PXStoryModel overallDurationChangeCompletionHandler](self, "overallDurationChangeCompletionHandler");
  v3 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryModel setOverallDurationChangeCompletionHandler:](self, "setOverallDurationChangeCompletionHandler:", 0);
    v3[2](v3, 1);
  }

}

- (void)setTimelineAttributes:(unint64_t)a3
{
  unint64_t timelineAttributes;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  os_signpost_id_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _BYTE v31[12];
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  timelineAttributes = self->_timelineAttributes;
  if (timelineAttributes == a3)
    return;
  if ((timelineAttributes & 2) == 0 || !(((self->_timelineAttributes & 1) == 0) | a3 & 1))
  {
    if ((((self->_timelineAttributes & 2) == 0) & (((self->_timelineAttributes & 1) == 0) | a3)) != 0)
      goto LABEL_10;
LABEL_7:
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PXStoryComponentAttributesDescription(timelineAttributes);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryComponentAttributesDescription(a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 138412546;
      *(_QWORD *)&v31[4] = v29;
      v32 = 2112;
      v33 = (unint64_t)v30;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "PXStoryModelChangedViewMode", v31, 0x16u);

    }
    -[PXStoryModel errorReporter](self, "errorReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Invalid timeline attributes change."), v8, v9, v10, v11, v12, v13, *(uint64_t *)v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:forComponent:", v14, CFSTR("Story Model"));

    goto LABEL_10;
  }
  if ((a3 & 2) == 0)
    goto LABEL_7;
LABEL_10:
  self->_timelineAttributes = a3;
  -[PXStoryModel signalChange:](self, "signalChange:", 0x20000000);
  -[PXStoryModel log](self, "log");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, self);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v15))
    {
      v18 = -[PXStoryModel logContext](self, "logContext");
      *(_DWORD *)v31 = 134217984;
      *(_QWORD *)&v31[4] = v18;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PXStoryModelChangedTimelineAttributes", "Context=%{signpost.telemetry:string2}lu ", v31, 0xCu);
    }
  }

  v19 = v15;
  v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      v22 = -[PXStoryModel logContext](self, "logContext");
      PXStoryComponentAttributesDescription(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 134218498;
      *(_QWORD *)&v31[4] = v22;
      v32 = 2048;
      v33 = a3;
      v34 = 2114;
      v35 = v23;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_EVENT, v21, "PXStoryModelChangedTimelineAttributes", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", v31, 0x20u);

    }
  }

  v24 = v19;
  v25 = os_signpost_id_make_with_pointer(v24, self);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v26 = v25;
    if (os_signpost_enabled(v24))
    {
      v27 = -[PXStoryModel logContext](self, "logContext");
      PXStoryComponentAttributesDescription(a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 134218498;
      *(_QWORD *)&v31[4] = v27;
      v32 = 2048;
      v33 = a3;
      v34 = 2114;
      v35 = v28;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PXStoryModelChangedTimelineAttributes", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", v31, 0x20u);

    }
  }

}

- (void)setTimelineSpec:(id)a3
{
  PXStoryTimelineSpec *v5;
  PXStoryTimelineSpec *v6;

  v5 = (PXStoryTimelineSpec *)a3;
  if (self->_timelineSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_timelineSpec, a3);
    v5 = v6;
  }

}

- (void)setCurrentGridScrollPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_currentGridScrollPosition;

  y = a3.y;
  x = a3.x;
  p_currentGridScrollPosition = &self->_currentGridScrollPosition;
  if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
  {
    p_currentGridScrollPosition->x = x;
    p_currentGridScrollPosition->y = y;
  }
}

- (void)setLayoutSpec:(id)a3
{
  PXStoryLayoutSpec *v5;
  char v6;
  PXStoryLayoutSpec *v7;

  v7 = (PXStoryLayoutSpec *)a3;
  v5 = self->_layoutSpec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryLayoutSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_layoutSpec, a3);
      -[PXStoryModel _invalidatePressedFractionAnimator](self, "_invalidatePressedFractionAnimator");
      -[PXStoryModel signalChange:](self, "signalChange:", 0x2000);
    }
  }

}

- (void)setContentReadinessStatus:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_contentReadinessStatus != a3)
  {
    self->_contentReadinessStatus = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 128);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v20 = 134217984;
        v21 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedContentReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        if ((unint64_t)a3 > 3)
          v12 = CFSTR("??");
        else
          v12 = off_1E51361A0[a3];
        v13 = v12;
        v20 = 134218498;
        v21 = v11;
        v22 = 2048;
        v23 = a3;
        v24 = 2114;
        v25 = v13;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedContentReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);

      }
    }

    v14 = v8;
    v15 = os_signpost_id_make_with_pointer(v14, self);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        v17 = -[PXStoryModel logContext](self, "logContext");
        if ((unint64_t)a3 > 3)
          v18 = CFSTR("??");
        else
          v18 = off_1E51361A0[a3];
        v19 = v18;
        v20 = 134218498;
        v21 = v17;
        v22 = 2048;
        v23 = a3;
        v24 = 2114;
        v25 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXStoryModelChangedContentReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);

      }
    }

  }
}

- (void)setMusicReadinessStatus:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_musicReadinessStatus != a3)
  {
    self->_musicReadinessStatus = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x100000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v20 = 134217984;
        v21 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedMusicReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        if ((unint64_t)a3 > 3)
          v12 = CFSTR("??");
        else
          v12 = off_1E51361A0[a3];
        v13 = v12;
        v20 = 134218498;
        v21 = v11;
        v22 = 2048;
        v23 = a3;
        v24 = 2114;
        v25 = v13;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedMusicReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);

      }
    }

    v14 = v8;
    v15 = os_signpost_id_make_with_pointer(v14, self);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        v17 = -[PXStoryModel logContext](self, "logContext");
        if ((unint64_t)a3 > 3)
          v18 = CFSTR("??");
        else
          v18 = off_1E51361A0[a3];
        v19 = v18;
        v20 = 134218498;
        v21 = v17;
        v22 = 2048;
        v23 = a3;
        v24 = 2114;
        v25 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXStoryModelChangedMusicReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);

      }
    }

  }
}

- (void)setReadinessStatus:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_readinessStatus == a3)
    return;
  if (-[PXStoryModel desiredPlayState](self, "desiredPlayState") == 1)
  {
    if (a3 == 1)
    {
      -[PXStoryModel setBufferingEvents:](self, "setBufferingEvents:", -[PXStoryModel bufferingEvents](self, "bufferingEvents") + 1);
      -[PXStoryModel log](self, "log");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_make_with_pointer(v5, self);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          v28 = 134217984;
          v29 = -[PXStoryModel logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXStoryModel.Buffering", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v28, 0xCu);
        }
      }
    }
    else
    {
      if (a3 != 3 || self->_readinessStatus != 1)
        goto LABEL_13;
      -[PXStoryModel log](self, "log");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_make_with_pointer(v5, self);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v5))
        {
          v10 = -[PXStoryModel logContext](self, "logContext");
          +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 134218496;
          v29 = v10;
          v30 = 2050;
          v31 = objc_msgSend(v11, "bestAvailableNetworkType");
          v32 = 2050;
          v33 = -[PXStoryModel bufferingEvents](self, "bufferingEvents");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryModel.Buffering", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu bufferingEventCount=%{signpost.telemetry:number2,public}lu", (uint8_t *)&v28, 0x20u);

        }
      }
    }

  }
LABEL_13:
  self->_readinessStatus = a3;
  -[PXStoryModel signalChange:](self, "signalChange:", 0x200000);
  -[PXStoryModel log](self, "log");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      v15 = -[PXStoryModel logContext](self, "logContext");
      v28 = 134217984;
      v29 = v15;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXStoryModelChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v28, 0xCu);
    }
  }

  v16 = v12;
  v17 = os_signpost_id_make_with_pointer(v16, self);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      v19 = -[PXStoryModel logContext](self, "logContext");
      if ((unint64_t)a3 > 3)
        v20 = CFSTR("??");
      else
        v20 = off_1E51361A0[a3];
      v21 = v20;
      v28 = 134218498;
      v29 = v19;
      v30 = 2048;
      v31 = a3;
      v32 = 2114;
      v33 = (int64_t)v21;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_EVENT, v18, "PXStoryModelChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v28, 0x20u);

    }
  }

  v22 = v16;
  v23 = os_signpost_id_make_with_pointer(v22, self);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      v25 = -[PXStoryModel logContext](self, "logContext");
      if ((unint64_t)a3 > 3)
        v26 = CFSTR("??");
      else
        v26 = off_1E51361A0[a3];
      v27 = v26;
      v28 = 134218498;
      v29 = v25;
      v30 = 2048;
      v31 = a3;
      v32 = 2114;
      v33 = (int64_t)v27;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PXStoryModelChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v28, 0x20u);

    }
  }

}

- (void)setPlaybackFractionCompleted:(double)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_playbackFractionCompleted != a3)
  {
    if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
    {
      -[PXStoryModel log](self, "log");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_make_with_pointer(v5, self);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          v8 = 134218240;
          v9 = -[PXStoryModel logContext](self, "logContext");
          v10 = 2048;
          v11 = a3;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_EVENT, v7, "playbackFractionCompleted", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v8, 0x16u);
        }
      }

    }
    self->_playbackFractionCompleted = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x80000);
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
    -[PXStoryModel signalChange:](self, "signalChange:", 0x20000);
  }
}

- (void)setPlaybackMaxFractionCompleted:(double)a3
{
  if (self->_playbackMaxFractionCompleted != a3)
    self->_playbackMaxFractionCompleted = a3;
}

- (void)setIsAtPlaybackEnd:(BOOL)a3
{
  if (self->_isAtPlaybackEnd != a3)
  {
    self->_isAtPlaybackEnd = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x40000000000);
  }
}

- (void)setNominalPlaybackTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_nominalPlaybackTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 nominalPlaybackTime;
  CMTime time1;

  p_nominalPlaybackTime = &self->_nominalPlaybackTime;
  time1 = *(CMTime *)a3;
  nominalPlaybackTime = self->_nominalPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&nominalPlaybackTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_nominalPlaybackTime->epoch = a3->var3;
    *(_OWORD *)&p_nominalPlaybackTime->value = v6;
    -[PXStoryModel _invalidatePlaybackFractionCompleted](self, "_invalidatePlaybackFractionCompleted");
    -[PXStoryModel _invalidateOutroFractionCompleted](self, "_invalidateOutroFractionCompleted");
    -[PXStoryModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
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
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 2);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

    -[PXStoryModel _invalidateShouldAspectFitCurrentSegment](self, "_invalidateShouldAspectFitCurrentSegment");
  }
}

- (void)setIsActuallyPlaying:(BOOL)a3
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
  if (self->_isActuallyPlaying != a3)
  {
    v3 = a3;
    self->_isActuallyPlaying = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x10000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsActuallyPlaying", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsActuallyPlaying", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsActuallyPlaying", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsScrolling:(BOOL)a3
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
  if (self->_isScrolling != a3)
  {
    v3 = a3;
    self->_isScrolling = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 8);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsScrolling", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    -[PXStoryModel _invalidateShouldAspectFitCurrentSegment](self, "_invalidateShouldAspectFitCurrentSegment");
  }
}

- (void)setAllowsScrolling:(BOOL)a3
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
  if (self->_allowsScrolling != a3)
  {
    v3 = a3;
    self->_allowsScrolling = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x8000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedAllowsScrolling", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedAllowsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedAllowsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsTouching:(BOOL)a3
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
  if (self->_isTouching != a3)
  {
    v3 = a3;
    self->_isTouching = a3;
    -[PXStoryModel _invalidatePressedFractionAnimator](self, "_invalidatePressedFractionAnimator");
    -[PXStoryModel signalChange:](self, "signalChange:", 0x4000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsTouching", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsTouching", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsTouching", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsHovering:(BOOL)a3
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
  if (self->_isHovering != a3)
  {
    v3 = a3;
    self->_isHovering = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x4000000000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsHovering", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsHovering", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsHovering", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsPresentingAssetPicker:(BOOL)a3
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
  if (self->_isPresentingAssetPicker != a3)
  {
    v3 = a3;
    self->_isPresentingAssetPicker = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x200000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPresentingAssetPicker", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPresentingAssetPicker", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPresentingAssetPicker", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsPresentingMusicEditor:(BOOL)a3
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
  if (self->_isPresentingMusicEditor != a3)
  {
    v3 = a3;
    self->_isPresentingMusicEditor = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x8000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPresentingMusicEditor", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPresentingMusicEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPresentingMusicEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsPresentingColorGradeEditor:(BOOL)a3
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
  if (self->_isPresentingColorGradeEditor != a3)
  {
    v3 = a3;
    self->_isPresentingColorGradeEditor = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x10000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPresentingColorGradeEditor", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPresentingColorGradeEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPresentingColorGradeEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setIsPerformingViewControllerTransition:(BOOL)a3
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
  if (self->_isPerformingViewControllerTransition != a3)
  {
    v3 = a3;
    self->_isPerformingViewControllerTransition = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x400000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPerformingViewControllerTransition", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPerformingViewControllerTransition", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPerformingViewControllerTransition", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setCurrentScrollPosition:(id *)a3
{
  BOOL v3;
  __int128 v4;

  if (a3->var0 != self->_currentScrollPosition.firstSegmentIdentifier
    || (a3->var1 == self->_currentScrollPosition.secondSegmentMixFactor
      ? (v3 = a3->var2 == self->_currentScrollPosition.secondSegmentIdentifier)
      : (v3 = 0),
        !v3))
  {
    v4 = *(_OWORD *)&a3->var0;
    self->_currentScrollPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&self->_currentScrollPosition.firstSegmentIdentifier = v4;
    -[PXStoryModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setCurrentAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  __CFString *v6;
  uint64_t v7;
  NSString *titleCategory;
  PXDisplayAssetCollection *v9;

  v5 = (PXDisplayAssetCollection *)a3;
  if (self->_currentAssetCollection != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_currentAssetCollection, a3);
    -[PXStoryModel signalChange:](self, "signalChange:", 2048);
    v6 = (__CFString *)(id)*MEMORY[0x1E0D75A50];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PXDisplayAssetCollection isFavorite](self->_currentAssetCollection, "isFavorite");

      v6 = CFSTR("<UninitializedMemoryTitleCategory>");
    }
    else
    {
      v7 = 0;
    }
    -[PXStoryModel setCurrentAssetCollectionIsFavorite:](self, "setCurrentAssetCollectionIsFavorite:", v7);
    titleCategory = self->_titleCategory;
    self->_titleCategory = &v6->isa;

    v5 = v9;
  }

}

- (NSString)titleCategory
{
  __CFString *titleCategory;
  void *v4;
  NSString *v5;
  NSString *v6;

  titleCategory = (__CFString *)self->_titleCategory;
  if (titleCategory == CFSTR("<UninitializedMemoryTitleCategory>"))
  {
    -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storyTitleCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_titleCategory;
    self->_titleCategory = v5;

    titleCategory = (__CFString *)self->_titleCategory;
  }
  return (NSString *)titleCategory;
}

- (void)setCurrentAssetCollectionIsFavorite:(BOOL)a3
{
  if (self->_currentAssetCollectionIsFavorite != a3)
  {
    self->_currentAssetCollectionIsFavorite = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x200000000000);
  }
}

- (void)setPersistencePermission:(int64_t)a3
{
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
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_persistencePermission != a3)
  {
    self->_persistencePermission = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x4000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedPersistencePermission", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedPersistencePermission", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedPersistencePermission", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

  }
}

- (void)setCurrentStyle:(id)a3
{
  PXStoryStyle *v5;
  PXStoryStyle *v6;
  PXStoryStyle *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  PXStoryStyle *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (PXStoryStyle *)a3;
  v6 = self->_currentStyle;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryStyle isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentStyle, a3);
      v9 = -[PXStoryStyle customColorGradeKind](v5, "customColorGradeKind");
      if (!v9)
      {
        -[PXStoryStyle originalColorGradeCategory](v5, "originalColorGradeCategory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryModel colorGradingRepository](self, "colorGradingRepository");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "colorGradeKindForColorGradeCategory:", v10);

      }
      -[PXStoryModel setColorGradeKind:](self, "setColorGradeKind:", v9);
      -[PXStoryModel _invalidateOutroDuration](self, "_invalidateOutroDuration");
      -[PXStoryModel signalChange:](self, "signalChange:", 512);
      -[PXStoryModel log](self, "log");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          v23 = 134217984;
          v24 = -[PXStoryModel logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXStoryModelChangedCurrentStyle", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v23, 0xCu);
        }
      }

      v15 = v12;
      v16 = os_signpost_id_make_with_pointer(v15, self);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v15))
        {
          v18 = -[PXStoryModel logContext](self, "logContext");
          v23 = 134218242;
          v24 = v18;
          v25 = 2114;
          v26 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_EVENT, v17, "PXStoryModelChangedCurrentStyle", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v23, 0x16u);
        }
      }

      v19 = v15;
      v20 = os_signpost_id_make_with_pointer(v19, self);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v21 = v20;
        if (os_signpost_enabled(v19))
        {
          v22 = -[PXStoryModel logContext](self, "logContext");
          v23 = 134218242;
          v24 = v22;
          v25 = 2114;
          v26 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PXStoryModelChangedCurrentStyle", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v23, 0x16u);
        }
      }

    }
  }

}

- (void)setStyleSwitcherVisibilityFraction:(double)a3
{
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
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_styleSwitcherVisibilityFraction != a3)
  {
    self->_styleSwitcherVisibilityFraction = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedStyleSwitcherVisibilityFraction", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedStyleSwitcherVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedStyleSwitcherVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }

  }
}

- (void)setColorGradeKind:(int64_t)a3
{
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
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_colorGradeKind != a3)
  {
    self->_colorGradeKind = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x100000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedColorGradeKind", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 2050;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedColorGradeKind", "Context=%{signpost.telemetry:string2}lu %{public}ld", (uint8_t *)&v16, 0x16u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 2050;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedColorGradeKind", "Context=%{signpost.telemetry:string2}lu %{public}ld", (uint8_t *)&v16, 0x16u);
      }
    }

  }
}

- (void)setAudioSession:(id)a3
{
  AVAudioSession *v5;
  AVAudioSession *v6;

  v5 = (AVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_audioSession, a3);
    v5 = v6;
  }

}

- (void)setActiveSongResource:(id)a3
{
  PXStorySongResource *v5;
  PXStorySongResource *v6;

  v5 = (PXStorySongResource *)a3;
  if (self->_activeSongResource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activeSongResource, a3);
    -[PXStoryModel signalChange:](self, "signalChange:", 1024);
    v5 = v6;
  }

}

- (PXStorySongResource)currentSongResource
{
  void *v2;
  void *v3;

  -[PXStoryModel currentStyle](self, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "songResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXStorySongResource *)v3;
}

- (void)setEditorPreviewSong:(id)a3
{
  PXStorySongResource *v5;
  char v6;
  PXStorySongResource *v7;

  v7 = (PXStorySongResource *)a3;
  v5 = self->_editorPreviewSong;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStorySongResource isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_editorPreviewSong, a3);
      -[PXStoryModel signalChange:](self, "signalChange:", 0x800000000000);
    }
  }

}

- (void)setVisibleSegmentIdentifiers:(id)a3
{
  NSIndexSet *v5;
  NSIndexSet *v6;
  NSIndexSet *v7;
  char v8;
  int64_t viewMode;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (NSIndexSet *)a3;
  v6 = self->_visibleSegmentIdentifiers;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSIndexSet isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_visibleSegmentIdentifiers, a3);
      viewMode = self->_viewMode;
      -[PXStoryModel signalChange:](self, "signalChange:", 64);
      if (viewMode != 3)
      {
        -[PXStoryModel log](self, "log");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = os_signpost_id_make_with_pointer(v10, self);
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_DWORD *)buf = 134217984;
            v26 = -[PXStoryModel logContext](self, "logContext");
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryModelChangedVisibleSegmentIdentifiers", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
          }
        }

        v13 = v10;
        v14 = os_signpost_id_make_with_pointer(v13, self);
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v15 = v14;
          if (os_signpost_enabled(v13))
          {
            v16 = -[PXStoryModel logContext](self, "logContext");
            -[NSIndexSet px_shortDescription](v5, "px_shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v26 = v16;
            v27 = 2114;
            v28 = v17;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_EVENT, v15, "PXStoryModelChangedVisibleSegmentIdentifiers", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);

          }
        }

        v18 = v13;
        v19 = os_signpost_id_make_with_pointer(v18, self);
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v20 = v19;
          if (os_signpost_enabled(v18))
          {
            v21 = -[PXStoryModel logContext](self, "logContext");
            -[NSIndexSet px_shortDescription](v5, "px_shortDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v26 = v21;
            v27 = 2114;
            v28 = v22;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PXStoryModelChangedVisibleSegmentIdentifiers", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);

          }
        }

      }
      -[PXStoryModel timelineManager](self, "timelineManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __45__PXStoryModel_setVisibleSegmentIdentifiers___block_invoke;
      v24[3] = &unk_1E512F468;
      v24[4] = self;
      objc_msgSend(v23, "performChanges:", v24);

    }
  }

}

- (void)_clearLastHitAssetClip
{
  -[PXStoryModel setLastHitAssetReference:](self, "setLastHitAssetReference:", 0);
  -[PXStoryModel setLastHitClipIdentifier:](self, "setLastHitClipIdentifier:", 0);
}

- (void)setLastHitClipIdentifier:(int64_t)a3
{
  if (self->_lastHitClipIdentifier != a3)
  {
    self->_lastHitClipIdentifier = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000);
  }
}

- (void)setLastHitAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;
  char v7;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v5 = self->_lastHitAssetReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetReference isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastHitAssetReference, a3);
      -[PXStoryModel signalChange:](self, "signalChange:", 0x2000000);
    }
  }

}

- (void)setDiagnosticHUDContentProvider:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PXStoryModel HUDContentProvidersByType](self, "HUDContentProvidersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  -[PXStoryModel signalChange:](self, "signalChange:", 0x8000);
}

- (id)diagnosticHUDContentProviderForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXStoryModel HUDContentProvidersByType](self, "HUDContentProvidersByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setInLiveResize:(BOOL)a3
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
  if (self->_inLiveResize != a3)
  {
    v3 = a3;
    self->_inLiveResize = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x4000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedInLiveResize", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedInLiveResize", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedInLiveResize", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setShouldPauseTransitions:(BOOL)a3
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
  if (self->_shouldPauseTransitions != a3)
  {
    v3 = a3;
    self->_shouldPauseTransitions = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x40000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedShouldPauseTransitions", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedShouldPauseTransitions", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedShouldPauseTransitions", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (BOOL)skipToSegmentWithOffset:(int64_t)a3
{
  void *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];
  _QWORD v16[5];
  __int128 v17;
  uint64_t v18;
  char v19;

  if (-[PXStoryModel viewMode](self, "viewMode") != 1)
    return 0;
  -[PXStoryModel viewModeTransition](self, "viewModeTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 0;
  if (a3 == -1)
  {
    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = &v17;
    v18 = 0x2020000000;
    v19 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__PXStoryModel_skipToSegmentWithOffset___block_invoke;
    v16[3] = &unk_1E512E120;
    v16[4] = &v17;
    -[PXStoryModel _enumerateVisibleAssetVideoPresentationControllersUsingBlock:](self, "_enumerateVisibleAssetVideoPresentationControllersUsingBlock:", v16);
    if (*(_BYTE *)(*((_QWORD *)&v17 + 1) + 24))
    {
      -[PXStoryModel rewindToBeginningOfCurrentSegment](self, "rewindToBeginningOfCurrentSegment");
      _Block_object_dispose(&v17, 8);
      return 1;
    }
    _Block_object_dispose(&v17, 8);
  }
  -[PXStoryModel timeline](self, "timeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", -[PXStoryModel currentSegmentIdentifier](self, "currentSegmentIdentifier"));
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v10 = v9 + a3, v10 < 0) || v10 >= objc_msgSend(v8, "numberOfSegments"))
  {
    v6 = 0;
  }
  else
  {
    v11 = objc_msgSend(v8, "identifierForSegmentAtIndex:", v10);
    if (v8)
    {
      objc_msgSend(v8, "timeRangeForSegmentWithIdentifier:", v11);
    }
    else
    {
      memset(v15, 0, sizeof(v15));
      v14 = 0u;
    }
    v18 = 0;
    v17 = PXStoryTimeZero;
    v12 = *(_OWORD *)((char *)v15 + 8);
    v13 = *((_QWORD *)&v15[1] + 1);
    -[PXStoryModel setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:](self, "setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:", v11, &v17, &v12, 2);
    v6 = 1;
  }

  return v6;
}

- (void)didStartPresentingAlert
{
  -[PXStoryModel setNumberOfPresentedAlerts:](self, "setNumberOfPresentedAlerts:", -[PXStoryModel numberOfPresentedAlerts](self, "numberOfPresentedAlerts") + 1);
}

- (void)didEndPresentingAlert
{
  -[PXStoryModel setNumberOfPresentedAlerts:](self, "setNumberOfPresentedAlerts:", -[PXStoryModel numberOfPresentedAlerts](self, "numberOfPresentedAlerts") - 1);
}

- (void)setNumberOfPresentedAlerts:(int64_t)a3
{
  self->_numberOfPresentedAlerts = a3;
  -[PXStoryModel setIsPresentingAnyAlert:](self, "setIsPresentingAnyAlert:", a3 > 0);
}

- (void)setIsPresentingAnyAlert:(BOOL)a3
{
  if (self->_isPresentingAnyAlert != a3)
  {
    self->_isPresentingAnyAlert = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x80000000000);
  }
}

- (BOOL)setCurrentSegmentIdentifier:(int64_t)a3 timeIntoSegment:(id *)a4 timeLeftInSegment:(id *)a5 changeSource:(unint64_t)a6
{
  $95D729B680665BEAEFA1D6FCA8238556 *v11;
  void *v12;
  int v13;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeIntoCurrentSegment;
  int64_t var3;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeLeftInCurrentSegment;
  int64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  os_signpost_id_t v28;
  CMTimeValue v29;
  NSObject *v30;
  os_signpost_id_t v31;
  os_signpost_id_t v32;
  CMTimeValue v33;
  NSObject *v34;
  os_signpost_id_t v35;
  os_signpost_id_t v36;
  CMTimeValue v37;
  void *v38;
  void *v40;
  void *v41;
  CMTimeValue v42;
  CMTimeValue v43;
  _QWORD v44[3];
  CMTime time2;
  CMTime time1;
  unint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (self->_currentSegmentIdentifier != a3
    || (v11 = &self->_timeIntoCurrentSegment,
        time1 = *(CMTime *)a4,
        time2 = (CMTime)self->_timeIntoCurrentSegment,
        CMTimeCompare(&time1, &time2))
    || (time1 = (CMTime)*a4,
        *(_OWORD *)&time2.value = *(_OWORD *)&v11->value,
        time2.epoch = self->_timeIntoCurrentSegment.epoch,
        CMTimeCompare(&time1, &time2)))
  {
    -[PXStoryModel timeline](self, "timeline");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsSegmentWithIdentifier:", a3);
    if (v13)
    {
      p_timeIntoCurrentSegment = &self->_timeIntoCurrentSegment;
      time1 = (CMTime)*a4;
      time2 = (CMTime)self->_timeIntoCurrentSegment;
      if (CMTimeCompare(&time1, &time2))
      {
        *(_OWORD *)&time2.value = *(_OWORD *)&p_timeIntoCurrentSegment->value;
        time2.epoch = self->_timeIntoCurrentSegment.epoch;
        var3 = a4->var3;
        *(_OWORD *)&p_timeIntoCurrentSegment->value = *(_OWORD *)&a4->var0;
        self->_timeIntoCurrentSegment.epoch = var3;
        -[PXStoryModel signalChange:](self, "signalChange:", 0x800000000);
        if (self->_currentSegmentIdentifier != a3)
        {
          -[PXStoryModel log](self, "log");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = os_signpost_id_make_with_pointer(v16, self);
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v18 = v17;
            if (os_signpost_enabled(v16))
            {
              v42 = -[PXStoryModel logContext](self, "logContext");
              time1 = time2;
              PXStoryTimeDescription(&time1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              time1 = (CMTime)*a4;
              PXStoryTimeDescription(&time1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(time1.value) = 134219010;
              *(CMTimeValue *)((char *)&time1.value + 4) = v42;
              LOWORD(time1.flags) = 2050;
              *(_QWORD *)((char *)&time1.flags + 2) = a3;
              HIWORD(time1.epoch) = 2114;
              v47 = (unint64_t)v41;
              v48 = 2114;
              v49 = v40;
              v50 = 2050;
              v51 = a6;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_EVENT, v18, "PXStoryModelChangedTimeIntoCurrentSegment", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld timeIntoSegment=%{signpost.description:attribute, public}@ → %{signpost.description:attribute, public}@ changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x34u);

            }
          }

        }
      }
      p_timeLeftInCurrentSegment = &self->_timeLeftInCurrentSegment;
      time1 = (CMTime)*a5;
      time2 = (CMTime)self->_timeLeftInCurrentSegment;
      if (CMTimeCompare(&time1, &time2))
      {
        *(_OWORD *)&time2.value = *(_OWORD *)&p_timeLeftInCurrentSegment->value;
        time2.epoch = self->_timeLeftInCurrentSegment.epoch;
        v20 = a5->var3;
        *(_OWORD *)&p_timeLeftInCurrentSegment->value = *(_OWORD *)&a5->var0;
        self->_timeLeftInCurrentSegment.epoch = v20;
        -[PXStoryModel signalChange:](self, "signalChange:", 0x40000000);
        if (self->_currentSegmentIdentifier != a3)
        {
          -[PXStoryModel log](self, "log");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v22 = os_signpost_id_make_with_pointer(v21, self);
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v23 = v22;
            if (os_signpost_enabled(v21))
            {
              v43 = -[PXStoryModel logContext](self, "logContext");
              time1 = time2;
              PXStoryTimeDescription(&time1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              time1 = (CMTime)*a5;
              PXStoryTimeDescription(&time1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(time1.value) = 134219010;
              *(CMTimeValue *)((char *)&time1.value + 4) = v43;
              LOWORD(time1.flags) = 2050;
              *(_QWORD *)((char *)&time1.flags + 2) = a3;
              HIWORD(time1.epoch) = 2114;
              v47 = (unint64_t)v24;
              v48 = 2114;
              v49 = v25;
              v50 = 2050;
              v51 = a6;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_EVENT, v23, "PXStoryModelChangedTimeLeftInCurrentSegment", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld timeLeftInSegment=%{signpost.description:attribute, public}@ → %{signpost.description:attribute, public}@ changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x34u);

            }
          }

        }
      }
      if (self->_currentSegmentIdentifier != a3)
      {
        -[PXStoryModel setPreviousSegmentIdentifier:](self, "setPreviousSegmentIdentifier:");
        self->_currentSegmentIdentifier = a3;
        -[PXStoryModel signalChange:](self, "signalChange:", 32);
        -[PXStoryModel log](self, "log");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v27 = os_signpost_id_make_with_pointer(v26, self);
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v28 = v27;
          if (os_signpost_enabled(v26))
          {
            v29 = -[PXStoryModel logContext](self, "logContext");
            LODWORD(time1.value) = 134217984;
            *(CMTimeValue *)((char *)&time1.value + 4) = v29;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v26, OS_SIGNPOST_INTERVAL_END, v28, "PXStoryModelChangedCurrentSegmentIdentifier", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&time1, 0xCu);
          }
        }

        v30 = v26;
        v31 = os_signpost_id_make_with_pointer(v30, self);
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v32 = v31;
          if (os_signpost_enabled(v30))
          {
            v33 = -[PXStoryModel logContext](self, "logContext");
            LODWORD(time1.value) = 134218496;
            *(CMTimeValue *)((char *)&time1.value + 4) = v33;
            LOWORD(time1.flags) = 2050;
            *(_QWORD *)((char *)&time1.flags + 2) = a3;
            HIWORD(time1.epoch) = 2050;
            v47 = a6;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v30, OS_SIGNPOST_EVENT, v32, "PXStoryModelChangedCurrentSegmentIdentifier", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x20u);
          }
        }

        v34 = v30;
        v35 = os_signpost_id_make_with_pointer(v34, self);
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v36 = v35;
          if (os_signpost_enabled(v34))
          {
            v37 = -[PXStoryModel logContext](self, "logContext");
            LODWORD(time1.value) = 134218496;
            *(CMTimeValue *)((char *)&time1.value + 4) = v37;
            LOWORD(time1.flags) = 2050;
            *(_QWORD *)((char *)&time1.flags + 2) = a3;
            HIWORD(time1.epoch) = 2050;
            v47 = a6;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PXStoryModelChangedCurrentSegmentIdentifier", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x20u);
          }
        }

        if (a6 == 2)
        {
          -[PXStoryModel loadingStatusReporter](self, "loadingStatusReporter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "notifyUserDidNavigate");

        }
      }
      -[PXStoryModel setLastPlaybackTimeChangeSource:](self, "setLastPlaybackTimeChangeSource:", a6, v40);
      v44[1] = 0;
      v44[2] = 0;
      v44[0] = a3;
      -[PXStoryModel setCurrentScrollPosition:](self, "setCurrentScrollPosition:", v44);
      -[PXStoryModel _invalidateNominalPlaybackTime](self, "_invalidateNominalPlaybackTime");
    }

  }
  else
  {
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)skipToBeginningOfSegmentWithIdentifier:(int64_t)a3
{
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;

  -[PXStoryModel timeline](self, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "timeRangeForSegmentWithIdentifier:", a3);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v12 = 0u;
  }
  v14 = *(_OWORD *)((char *)v13 + 8);
  v15 = *((_QWORD *)&v13[1] + 1);

  v10 = PXStoryTimeZero;
  v11 = 0;
  v8 = v14;
  v9 = v15;
  return -[PXStoryModel setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:](self, "setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:", a3, &v10, &v8, 2);
}

- (BOOL)rewindToBeginning
{
  PXStoryModel *v2;
  void *v3;

  v2 = self;
  -[PXStoryModel timeline](self, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[PXStoryModel skipToBeginningOfSegmentWithIdentifier:](v2, "skipToBeginningOfSegmentWithIdentifier:", objc_msgSend(v3, "firstSegmentIdentifier"));

  return (char)v2;
}

- (BOOL)rewindToBeginningOfCurrentSegment
{
  -[PXStoryModel _enumerateVisibleAssetVideoPresentationControllersUsingBlock:](self, "_enumerateVisibleAssetVideoPresentationControllersUsingBlock:", &__block_literal_global_198_149574);
  return -[PXStoryModel skipToBeginningOfSegmentWithIdentifier:](self, "skipToBeginningOfSegmentWithIdentifier:", -[PXStoryModel currentSegmentIdentifier](self, "currentSegmentIdentifier"));
}

- (void)flickedPastEnd
{
  -[PXStoryModel signalChange:](self, "signalChange:", 0x20000000000);
}

- (void)restartPlaybackFromBeginning
{
  -[PXStoryModel signalChange:](self, "signalChange:", 0x8000000000000);
}

- (void)scrollToPosition:(id *)a3
{
  $7DA682ECC7253F641496E0B6E9C98204 *p_var2;
  int64_t var0;
  void *v7;
  void *v8;
  __int128 v9;
  int64_t var2;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  _OWORD v16[2];
  __int128 v17;
  uint64_t v18;

  p_var2 = ($7DA682ECC7253F641496E0B6E9C98204 *)&a3->var2;
  if (a3->var1 <= 0.5)
    p_var2 = a3;
  var0 = p_var2->var0;
  if (var0 != -[PXStoryModel currentSegmentIdentifier](self, "currentSegmentIdentifier"))
  {
    -[PXStoryModel timeline](self, "timeline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "timeRangeForSegmentWithIdentifier:", var0);
    }
    else
    {
      memset(v16, 0, sizeof(v16));
      v15 = 0u;
    }
    v17 = *(_OWORD *)((char *)v16 + 8);
    v18 = *((_QWORD *)&v16[1] + 1);

    v13 = PXStoryTimeZero;
    v14 = 0;
    v11 = v17;
    v12 = v18;
    -[PXStoryModel setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:](self, "setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:", var0, &v13, &v11, 2);
  }
  v9 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  -[PXStoryModel setCurrentScrollPosition:](self, "setCurrentScrollPosition:", &v9);
}

- (void)setElapsedTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_elapsedTime;
  __int128 v6;
  CMTime v7;
  CMTime time1;

  p_elapsedTime = &self->_elapsedTime;
  time1 = (CMTime)self->_elapsedTime;
  v7 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &v7))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_elapsedTime->epoch = a3->var3;
    *(_OWORD *)&p_elapsedTime->value = v6;
    -[PXStoryModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setIsHUDVisible:(BOOL)a3
{
  if (self->_isHUDVisible != a3)
  {
    self->_isHUDVisible = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x800000);
  }
}

- (void)setDiagnosticHUDType:(int64_t)a3
{
  if (self->_diagnosticHUDType != a3)
  {
    self->_diagnosticHUDType = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x1000000);
  }
}

- (void)setOutroFractionCompleted:(double)a3
{
  if (self->_outroFractionCompleted != a3)
  {
    self->_outroFractionCompleted = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x400000000000);
    if (self->_outroFractionCompleted > 0.0)
      -[PXStoryModel setDidReachOutroOnce:](self, "setDidReachOutroOnce:", 1);
  }
}

- (void)setDidReachOutroOnce:(BOOL)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  double v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_didReachOutroOnce != a3)
  {
    self->_didReachOutroOnce = a3;
    if (a3)
    {
      v17 = *MEMORY[0x1E0D09830];
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXStoryModel volume](self, "volume");
      if (v7 == 0.0)
        v8 = CFSTR("com.apple.photos.memory.interactiveMemoryPlaybackFinishedMuted");
      else
        v8 = CFSTR("com.apple.photos.memory.interactiveMemoryPlaybackFinishedUnmuted");
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v8, v6);
      -[PXStoryModel untruncatedCuratedAssets](self, "untruncatedCuratedAssets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "count");
        -[PXStoryModel curatedAssets](self, "curatedAssets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11 - objc_msgSend(v12, "count");

        if (v13 >= 1)
        {
          PLStoryGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            v15 = 134217984;
            v16 = v13;
            _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_FAULT, "reached outro with %li missed assets", (uint8_t *)&v15, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.memory.interactiveMemoryPlaybackFinishedTruncated"), v6);
        }
      }

    }
  }
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  void *v2;
  void *v3;
  void *v4;

  -[PXStoryModel recipeManager](self, "recipeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "curatedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAssetFetchResult *)v4;
}

- (PXDisplayAssetFetchResult)untruncatedCuratedAssets
{
  void *v2;
  void *v3;
  void *v4;

  -[PXStoryModel recipeManager](self, "recipeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "untruncatedCuratedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAssetFetchResult *)v4;
}

- (void)setLastPlaybackTimeChangeSource:(unint64_t)a3
{
  if (self->_lastPlaybackTimeChangeSource != a3)
  {
    self->_lastPlaybackTimeChangeSource = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x10000000000000);
  }
}

- (PXDisplayAssetFetchResult)visibleDisplayAssets
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  PXStoryModel *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  SEL v31;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXStoryModel timeline](self, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXStoryModel visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __36__PXStoryModel_visibleDisplayAssets__block_invoke;
  v23 = &unk_1E512E1C8;
  v27 = v7;
  v28 = v9;
  v29 = v11;
  v30 = v13;
  v31 = a2;
  v24 = v5;
  v25 = self;
  v26 = v4;
  v15 = v4;
  v16 = v5;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", &v20);

  objc_msgSend(v15, "allObjects", v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAssetFetchResult *)v18;
}

- (BOOL)getMainVisibleClipIdentifier:(int64_t *)a3 assetReferece:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryModel timeline](self, "timeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke;
  v20 = &unk_1E51460E8;
  v21 = v8;
  v10 = v7;
  v22 = v10;
  v11 = v8;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", &v17);

  v12 = objc_msgSend(v10, "count", v17, v18, v19, v20);
  if (v12)
  {
    if ((unint64_t)objc_msgSend(v10, "count") > 2)
      objc_msgSend(v10, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v10, "count") >> 1);
    else
      objc_msgSend(v10, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "integerValue");

    -[PXStoryModel assetReferenceForClipIdentifier:](self, "assetReferenceForClipIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v13 = 0;
  v14 = 0;
  if (a3)
LABEL_8:
    *a3 = v13;
LABEL_9:
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v12 != 0;
}

- (id)assetReferenceForClipIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  void *v12;
  _OWORD v14[2];

  -[PXStoryModel timeline](self, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipWithIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "px_storyResourceKind");

  if (v7 == 1)
  {
    objc_msgSend(v5, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_storyResourceDisplayAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc((Class)off_1E50B1688);
    v11 = *((_OWORD *)off_1E50B8778 + 1);
    v14[0] = *(_OWORD *)off_1E50B8778;
    v14[1] = v11;
    v12 = (void *)objc_msgSend(v10, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v9, 0, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isFirstSegmentVisible
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  _BYTE v11[112];
  CMTime time2;
  CMTime time1;

  -[PXStoryModel timeline](self, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstSegmentIdentifier");

  -[PXStoryModel visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsIndex:", v4);

  if ((v6 & 1) != 0)
    return 1;
  -[PXStoryModel elapsedTime](self, "elapsedTime");
  -[PXStoryModel timeline](self, "timeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "infoForSegmentWithIdentifier:", v4);
  else
    memset(v11, 0, 24);
  time2 = *(CMTime *)v11;
  time1 = *(CMTime *)&v11[88];
  v7 = CMTimeCompare(&time1, &time2) == -1;

  return v7;
}

- (BOOL)isLastSegmentVisible
{
  void *v3;
  void *v4;
  char v5;

  -[PXStoryModel visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel timeline](self, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsIndex:", objc_msgSend(v4, "lastSegmentIdentifier"));

  return v5;
}

- (void)reconfigureWithAssetCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = -[PXStoryConfiguration copyWithAssetCollection:](self->_configuration, "copyWithAssetCollection:", a3);
  -[PXStoryModel setConfiguration:](self, "setConfiguration:", v4);
  -[PXStoryModel recipeManager](self, "recipeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PXStoryModel_reconfigureWithAssetCollection___block_invoke;
  v7[3] = &unk_1E5130830;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

  -[PXStoryModel _completePersistenceRequestsWithSuccess:error:](self, "_completePersistenceRequestsWithSuccess:error:", 1, 0);
}

- (void)requestPersistencePermission:(id)a3
{
  -[PXStoryModel requestPersistencePermissionWithTimeout:completionHandler:](self, "requestPersistencePermissionWithTimeout:completionHandler:", a3, 5.0);
}

- (void)requestPersistencePermissionWithTimeout:(double)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD aBlock[5];
  void (**v19)(id, uint64_t, _QWORD);
  uint8_t *v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[PXStoryModel persistencePermission](self, "persistencePermission") == 1)
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "queuing persistence request", buf, 2u);
    }

    -[PXStoryModel setPersistenceConfirmationPresentationDate:](self, "setPersistenceConfirmationPresentationDate:", 0);
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x2020000000;
    v24 = 0;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke;
    aBlock[3] = &unk_1E512E218;
    v20 = buf;
    aBlock[4] = self;
    v19 = v6;
    v9 = _Block_copy(aBlock);
    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    -[PXStoryModel storyQueue](self, "storyQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_2;
    block[3] = &unk_1E5148A40;
    v12 = v9;
    v17 = v12;
    dispatch_after(v10, v11, block);

    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_3;
    v14[3] = &unk_1E512E240;
    v14[4] = self;
    v13 = v12;
    v15 = v13;
    -[PXStoryModel performChanges:](self, "performChanges:", v14);

    _Block_object_dispose(buf, 8);
  }

}

- (void)reportPersistenceFailureWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXStoryModel_reportPersistenceFailureWithError___block_invoke;
  v6[3] = &unk_1E51337A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryModel performChanges:](self, "performChanges:", v6);

}

- (void)reportNetworkRelatedPlaybackFailure
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bestAvailableNetworkType");

  if (v4 == 1)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(19, 0, CFSTR("Network required for playback"), v5, v6, v7, v8, v9, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryModel errorReporter](self, "errorReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setError:forComponent:", v12, CFSTR("NetworkReachablity"));

  }
}

- (void)prerequestPersistencePermission:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXStoryModel setDidPrerequestPersistencePermission:](self, "setDidPrerequestPersistencePermission:", 1);
  v4[2](v4, 1, 0);

}

- (void)performWithPrerequestedPersistencePermission:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location[2];

  v4 = a3;
  if (-[PXStoryModel didPrerequestPersistencePermission](self, "didPrerequestPersistencePermission"))
  {
    objc_initWeak(location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__PXStoryModel_performWithPrerequestedPersistencePermission___block_invoke;
    v6[3] = &unk_1E5141338;
    v7 = v4;
    objc_copyWeak(&v8, location);
    -[PXStoryModel requestPersistencePermission:](self, "requestPersistencePermission:", v6);
    objc_destroyWeak(&v8);

    objc_destroyWeak(location);
  }
  else
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Persistence permission hasn't been pre-requested. -prerequestPersistencePermission: should be called earlier, at a point where the UI supports cancellation.", (uint8_t *)location, 2u);
    }

  }
}

- (void)_completePersistenceRequestsWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Error requesting persistence success:%d error:%@", buf, 0x12u);
    }

  }
  if (-[NSMutableArray count](self->_persistenceRequests, "count"))
  {
    v8 = (void *)-[NSMutableArray copy](self->_persistenceRequests, "copy");
    -[NSMutableArray removeAllObjects](self->_persistenceRequests, "removeAllObjects");
    -[PXStoryModel storyQueue](self, "storyQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PXStoryModel__completePersistenceRequestsWithSuccess_error___block_invoke;
    block[3] = &unk_1E51473C0;
    v12 = v8;
    v14 = v4;
    v13 = v6;
    v10 = v8;
    dispatch_async(v9, block);

  }
}

- (void)changeOverallDuration:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v6 = a4;
  -[PXStoryModel overallDurationChangeCompletionHandler](self, "overallDurationChangeCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXStoryModel overallDurationChangeCompletionHandler](self, "overallDurationChangeCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0);

  }
  -[PXStoryModel setOverallDurationChangeCompletionHandler:](self, "setOverallDurationChangeCompletionHandler:", v6);
  v9 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 48);
  v14 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 32);
  v15 = v9;
  v16 = *(_QWORD *)(MEMORY[0x1E0D759A0] + 64);
  v10 = *MEMORY[0x1E0D759A0];
  v13 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 16);
  v12 = v10;
  -[PXStoryModel setDesiredPlayState:](self, "setDesiredPlayState:", 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke;
  v11[3] = &unk_1E512E288;
  v11[4] = self;
  v11[5] = a3;
  -[PXStoryModel requestPersistencePermission:](self, "requestPersistencePermission:", v11);

}

- (void)makeCurrentAssetKeyPhoto
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXStoryModel visibleDisplayAssets](self, "visibleDisplayAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryModel makeAssetKeyPhoto:](self, "makeAssetKeyPhoto:", v4);

  }
  else
  {
    PLStoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Can't set key asset when visibleDisplayAssets count = %ld", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)makeAssetKeyPhoto:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PXStoryModel_makeAssetKeyPhoto___block_invoke;
  v6[3] = &unk_1E5147B40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryModel requestPersistencePermission:](self, "requestPersistencePermission:", v6);

}

- (void)removeAssetsFromCuration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PXStoryModel_removeAssetsFromCuration___block_invoke;
  v6[3] = &unk_1E5147B40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryModel requestPersistencePermission:](self, "requestPersistencePermission:", v6);

}

- (void)setWantsMusicDucked:(BOOL)a3
{
  if (self->_wantsMusicDucked != a3)
  {
    self->_wantsMusicDucked = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 256);
  }
}

- (id)beginMusicDucking
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_musicDuckingTokens, "addObject:", v3);
  -[PXStoryModel _invalidateWantsMusicDucked](self, "_invalidateWantsMusicDucked");
  return v3;
}

- (void)endMusicDuckingWithToken:(id)a3
{
  -[NSMutableSet removeObject:](self->_musicDuckingTokens, "removeObject:", a3);
  -[PXStoryModel _invalidateWantsMusicDucked](self, "_invalidateWantsMusicDucked");
}

- (id)diagnosticDescriptionForAllHUDTypes
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = -1;
  do
  {
    v5 = v4 + 1;
    -[PXStoryModel diagnosticHUDContentProviderForType:](self, "diagnosticHUDContentProviderForType:", v4 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "diagnosticTextForHUDType:displaySize:", v4 + 1, 1920.0, 1080.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = CFSTR("None");
      if (v4 <= 0x12)
        v8 = off_1E5136070[v4];
      v9 = v8;
      objc_msgSend(v3, "appendFormat:", CFSTR("=== %@ ===\n"), v9);

      objc_msgSend(v3, "appendString:", v7);
      objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
    }

    ++v4;
  }
  while (v5 != 19);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (void)setOutroDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_outroDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 outroDuration;
  CMTime time1;

  p_outroDuration = &self->_outroDuration;
  time1 = *(CMTime *)a3;
  outroDuration = self->_outroDuration;
  if (CMTimeCompare(&time1, (CMTime *)&outroDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_outroDuration->epoch = a3->var3;
    *(_OWORD *)&p_outroDuration->value = v6;
    -[PXStoryModel _invalidateOutroFractionCompleted](self, "_invalidateOutroFractionCompleted");
  }
}

- (BOOL)checkIfShouldPreventAdvancingAndReturnReason:(id *)a3
{
  const char *v5;
  _BOOL4 v6;

  if (-[PXStoryModel isPresentingAssetPicker](self, "isPresentingAssetPicker"))
  {
    if (a3)
    {
      v5 = "isPresentingAssetPicker";
LABEL_13:
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (-[PXStoryModel isPresentingMusicEditor](self, "isPresentingMusicEditor"))
  {
    if (a3)
    {
      v5 = "isPresentingMusicEditor";
      goto LABEL_13;
    }
LABEL_14:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (-[PXStoryModel isPresentingColorGradeEditor](self, "isPresentingColorGradeEditor"))
  {
    if (a3)
    {
      v5 = "isPresentingColorGradeEditor";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v6 = -[PXStoryModel isPresentingAnyAlert](self, "isPresentingAnyAlert");
  if (v6)
  {
    if (a3)
    {
      v5 = "isPresentingAnyAlert";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  return v6;
}

- (void)setPreviousSegmentIdentifier:(int64_t)a3
{
  if (self->_previousSegmentIdentifier != a3)
  {
    self->_previousSegmentIdentifier = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x100000000000000);
  }
}

- (void)setVolume:(double)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x200000000000000);
  }
}

- (void)setVolumeDuringViewControllerTransition:(float)a3
{
  if (self->_volumeDuringViewControllerTransition != a3)
  {
    self->_volumeDuringViewControllerTransition = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x200000000000000);
  }
}

- (void)setDesiredInfoPanelVisibilityFraction:(double)a3
{
  if (self->_desiredInfoPanelVisibilityFraction != a3)
  {
    self->_desiredInfoPanelVisibilityFraction = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x400000000000000);
  }
}

- (void)setInfoPanelVisibilityFraction:(double)a3
{
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
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_infoPanelVisibilityFraction != a3)
  {
    self->_infoPanelVisibilityFraction = a3;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x800000000000000);
    -[PXStoryModel log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryModel logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedInfoPanelVisibilityFraction", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedInfoPanelVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryModel logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 2048;
        v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedInfoPanelVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }

  }
}

- (void)addVideoPresentationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryModel videoPresentationControllers](self, "videoPresentationControllers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeVideoPresentationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryModel videoPresentationControllers](self, "videoPresentationControllers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_enumerateVisibleAssetVideoPresentationControllersUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id obj;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[PXStoryModel visibleDisplayAssets](self, "visibleDisplayAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v5, "count") >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXStoryModel videoPresentationControllers](self, "videoPresentationControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
      objc_msgSend(v14, "displayAsset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "containsObject:", v16);

      if (v17)
      {
        v19 = 0;
        v4[2](v4, v14, &v19);
        if (v19)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          goto LABEL_6;
        break;
      }
    }
  }

}

- (void)setPressAnimationInfo:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;

  v7 = v3 == self->_pressAnimationInfo.pressedFraction && v4 == self->_pressAnimationInfo.pressedFractionVelocity;
  if (!v7
    || (v5 == self->_pressAnimationInfo.timelineSizeBeforePressing.width
      ? (v8 = v6 == self->_pressAnimationInfo.timelineSizeBeforePressing.height)
      : (v8 = 0),
        !v8))
  {
    self->_pressAnimationInfo.pressedFraction = v3;
    self->_pressAnimationInfo.pressedFractionVelocity = v4;
    self->_pressAnimationInfo.timelineSizeBeforePressing.width = v5;
    self->_pressAnimationInfo.timelineSizeBeforePressing.height = v6;
    -[PXStoryModel signalChange:](self, "signalChange:", 0x8000000000000000);
  }
}

- (void)_setNeedsUpdate
{
  -[PXStoryModel signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateTimeline
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimeline);

}

- (void)_updateTimeline
{
  void *v3;
  id v4;

  -[PXStoryModel timelineManager](self, "timelineManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel setTimeline:](self, "setTimeline:", v3);

}

- (void)_invalidateTimelineAttributes
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimelineAttributes);

}

- (void)_updateTimelineAttributes
{
  id v3;

  -[PXStoryModel timelineManager](self, "timelineManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel setTimelineAttributes:](self, "setTimelineAttributes:", objc_msgSend(v3, "timelineAttributes"));

}

- (void)_invalidateTimelineSpec
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimelineSpec);

}

- (void)_updateTimelineSpec
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryModel timelineManager](self, "timelineManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel setTimelineSpec:](self, "setTimelineSpec:", v4);

}

- (void)_invalidateNominalPlaybackTime
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateNominalPlaybackTime);

}

- (void)_updateNominalPlaybackTime
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  NSObject *v9;
  CMTimeValue v10;
  CMTimeScale v11;
  CMTimeFlags v12;
  CMTimeEpoch v13;
  CMTime v14;
  CMTime v15;
  __int128 v16;
  _OWORD v17[2];
  CMTime time2;
  CMTime time1;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  timescale = 0;
  value = 0;
  v3 = -[PXStoryModel currentSegmentIdentifier](self, "currentSegmentIdentifier");
  if (v3)
  {
    v4 = v3;
    memset(v17, 0, sizeof(v17));
    v16 = 0u;
    -[PXStoryModel timeline](self, "timeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "timeRangeForSegmentWithIdentifier:", v4);
    }
    else
    {
      memset(v17, 0, sizeof(v17));
      v16 = 0u;
    }

    memset(&v15, 0, sizeof(v15));
    -[PXStoryModel timeIntoCurrentSegment](self, "timeIntoCurrentSegment");
    if ((unsigned __int128)0 >> 96
      && (BYTE12(v16) & 1) != 0
      && (BYTE4(v17[1]) & 1) != 0
      && !*((_QWORD *)&v17[1] + 1)
      && (*((_QWORD *)&v17[0] + 1) & 0x8000000000000000) == 0)
    {
      time1 = v15;
      time2 = *(CMTime *)((char *)v17 + 8);
      CMTimeMinimum(&v14, &time1, &time2);
      v15 = v14;
      *(_OWORD *)&time1.value = v16;
      time1.epoch = *(_QWORD *)&v17[0];
      time2 = v14;
      CMTimeAdd(&v14, &time1, &time2);
      value = v14.value;
      flags = v14.flags;
      timescale = v14.timescale;
      epoch = v14.epoch;
      if ((v14.flags & 1) == 0)
      {
        PXAssertGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          LOWORD(time1.value) = 0;
          _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "Unexpected null nominal playback time when current segment identifier is non-null.", (uint8_t *)&time1, 2u);
        }

      }
    }
    else
    {
      epoch = 0;
      flags = 1;
      timescale = 1;
      value = 0;
    }
  }
  else
  {
    epoch = 0;
    flags = 0;
  }
  v10 = value;
  v11 = timescale;
  v12 = flags;
  v13 = epoch;
  -[PXStoryModel setNominalPlaybackTime:](self, "setNominalPlaybackTime:", &v10);
}

- (void)_invalidatePlaybackFractionCompleted
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaybackFractionCompleted);

}

- (void)_updatePlaybackFractionCompleted
{
  void *v3;
  void *v4;
  double Seconds;
  double v6;
  double v7;
  CMTime v8;
  __int128 v9;
  CMTimeEpoch v10;
  CMTimeRange v11;
  CMTime v12;
  CMTimeRange range;

  memset(&v12, 0, sizeof(v12));
  -[PXStoryModel timeline](self, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRange");
  else
    memset(&v11, 0, sizeof(v11));
  range = v11;
  CMTimeRangeGetEnd(&v12, &range);

  -[PXStoryModel nominalPlaybackTime](self, "nominalPlaybackTime");
  *(_OWORD *)&range.start.value = v9;
  range.start.epoch = v10;
  Seconds = CMTimeGetSeconds(&range.start);
  range.start = v12;
  v6 = Seconds / CMTimeGetSeconds(&range.start);
  -[PXStoryModel setPlaybackFractionCompleted:](self, "setPlaybackFractionCompleted:", v6);
  -[PXStoryModel playbackMaxFractionCompleted](self, "playbackMaxFractionCompleted");
  if (v6 >= v7)
    v7 = v6;
  -[PXStoryModel setPlaybackMaxFractionCompleted:](self, "setPlaybackMaxFractionCompleted:", v7);
  -[PXStoryModel setIsAtPlaybackEnd:](self, "setIsAtPlaybackEnd:", v6 >= 1.0);
  v8 = v12;
  -[PXStoryModel setPlaybackDuration:](self, "setPlaybackDuration:", &v8);
}

- (void)_invalidateCurrentAssetCollection
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentAssetCollection);

}

- (void)_updateCurrentAssetCollection
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryModel resourcesDataSourceManager](self, "resourcesDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel setCurrentAssetCollection:](self, "setCurrentAssetCollection:", v4);

}

- (void)_invalidateCurrentStyleAndFocus
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentStyle);

}

- (void)_updateCurrentStyle
{
  void *v3;
  id v4;

  -[PXStoryModel styleManager](self, "styleManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel setCurrentStyle:](self, "setCurrentStyle:", v3);

}

- (void)_invalidateLayoutSpec
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLayoutSpec);

}

- (void)_updateLayoutSpec
{
  void *v3;
  id v4;

  -[PXStoryModel layoutSpecManager](self, "layoutSpecManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel setLayoutSpec:](self, "setLayoutSpec:", v3);

}

- (void)_invalidateShouldAspectFitCurrentSegment
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldAspectFitCurrentSegment);

}

- (void)_updateShouldAspectFitCurrentSegment
{
  if (-[PXStoryModel desiredPlayState](self, "desiredPlayState") == 1
    || -[PXStoryModel isScrolling](self, "isScrolling"))
  {
    -[PXStoryModel setShouldAspectFitCurrentSegment:](self, "setShouldAspectFitCurrentSegment:", 0);
  }
}

- (void)_invalidatePersistencePermission
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistencePermission);

}

- (void)_updatePersistencePermission
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  -[PXStoryModel configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PXStoryPersistableRecipeWriterFactory canPersistForConfiguration:](PXStoryPersistableRecipeWriterFactory, "canPersistForConfiguration:", v3);

  if (v4)
  {
    v5 = 1;
    -[PXStoryModel _completePersistenceRequestsWithSuccess:error:](self, "_completePersistenceRequestsWithSuccess:error:", 1, 0);
    goto LABEL_11;
  }
  v5 = -[NSMutableArray count](self->_persistenceRequests, "count");
  v6 = -[PXStoryModel persistencePermission](self, "persistencePermission");
  if (v6 == 1)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1A6789000, v7, OS_LOG_TYPE_FAULT, "Invalid state transition, persistencePermission was allowed before, but is no longer.", v8, 2u);
    }

    goto LABEL_10;
  }
  if (v6)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (v5)
  {
    -[PXStoryModel _displayCollectionPersistenceConfirmationIfNeeded](self, "_displayCollectionPersistenceConfirmationIfNeeded");
    v5 = 1;
  }
LABEL_11:
  -[PXStoryModel setPersistencePermission:](self, "setPersistencePermission:", v5);
}

- (void)_invalidateWantsMusicDucked
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsMusicDucked);

}

- (void)_updateWantsMusicDucked
{
  -[PXStoryModel setWantsMusicDucked:](self, "setWantsMusicDucked:", -[NSMutableSet count](self->_musicDuckingTokens, "count") != 0);
}

- (void)_invalidateOutroDuration
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOutroDuration);

}

- (void)_updateOutroDuration
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  CMTime v9;
  CMTime v10;
  __int128 v11;
  _OWORD v12[2];
  CMTime v13;
  CMTime time2;
  CMTime time1;

  memset(&v13, 0, sizeof(v13));
  -[PXStoryModel styleManager](self, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "outroDuration");
  else
    memset(&v13, 0, sizeof(v13));

  if ((v13.flags & 0x1D) != 1)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(time1.value) = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Current style's duration is not numeric", (uint8_t *)&time1, 2u);
    }

  }
  -[PXStoryModel timeline](self, "timeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfSegments") >= 1)
  {
    v8 = objc_msgSend(v7, "identifierForSegmentAtIndex:", objc_msgSend(v7, "numberOfSegments") - 1);
    if (v7)
    {
      objc_msgSend(v7, "timeRangeForSegmentWithIdentifier:", v8);
    }
    else
    {
      memset(v12, 0, sizeof(v12));
      v11 = 0u;
    }
    time1 = v13;
    time2 = *(CMTime *)((char *)v12 + 8);
    CMTimeMinimum(&v10, &time1, &time2);
    v13 = v10;
  }
  v9 = v13;
  -[PXStoryModel setOutroDuration:](self, "setOutroDuration:", &v9);

}

- (void)_invalidateOutroFractionCompleted
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOutroFractionCompleted);

}

- (void)_updateOutroFractionCompleted
{
  int64_t v3;
  double v4;
  void *v5;
  void *v6;
  int32_t v7;
  double Seconds;
  CMTime v9;
  __int128 v10;
  _OWORD v11[2];
  CMTime v12;
  CMTime v13[2];
  CMTime rhs;
  CMTime lhs;

  v3 = -[PXStoryModel viewMode](self, "viewMode");
  v4 = 0.0;
  if (v3 != 4)
  {
    -[PXStoryModel nominalPlaybackTime](self, "nominalPlaybackTime", 0.0);
    memset(v13, 0, sizeof(v13));
    -[PXStoryModel outroDuration](self, "outroDuration");
    memset(&v12, 0, sizeof(v12));
    -[PXStoryModel timeline](self, "timeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "timeRange");
    }
    else
    {
      memset(v11, 0, sizeof(v11));
      v10 = 0u;
    }
    lhs = *(CMTime *)((char *)v11 + 8);
    rhs = v13[0];
    CMTimeSubtract(&v12, &lhs, &rhs);

    lhs = v13[1];
    rhs = v12;
    v7 = CMTimeCompare(&lhs, &rhs);
    v4 = 0.0;
    if (v7 >= 1)
    {
      lhs = v13[1];
      rhs = v12;
      CMTimeSubtract(&v9, &lhs, &rhs);
      lhs = v9;
      Seconds = CMTimeGetSeconds(&lhs);
      lhs = v13[0];
      v4 = Seconds / CMTimeGetSeconds(&lhs);
      if (v4 > 1.0)
        v4 = 1.0;
    }
  }
  -[PXStoryModel setOutroFractionCompleted:](self, "setOutroFractionCompleted:", v4);
}

- (void)_invalidatePressedFractionAnimator
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePressedFractionAnimator);

}

- (void)_updatePressedFractionAnimator
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  _QWORD v9[5];

  v3 = 0.0;
  if (-[PXStoryModel isTouching](self, "isTouching") && -[PXStoryModel viewMode](self, "viewMode") == 3)
  {
    -[PXStoryModel layoutSpec](self, "layoutSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "canScaleWhenPressed"))
      v3 = 1.0;
    else
      v3 = 0.0;

  }
  -[PXStoryModel pressedFractionAnimator](self, "pressedFractionAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = v6;

  if (v7 != v3)
  {
    -[PXStoryModel pressedFractionAnimator](self, "pressedFractionAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PXStoryModel__updatePressedFractionAnimator__block_invoke;
    v9[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v9[4] = v3;
    objc_msgSend(v8, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v9, 0.0);

  }
}

- (void)_invalidatePressAnimationInfo
{
  id v2;

  -[PXStoryModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePressAnimationInfo);

}

- (void)_updatePressAnimationInfo
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  -[PXStoryModel pressedFractionAnimator](self, "pressedFractionAnimator");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentationValue");
  v4 = v3;
  -[PXStoryModel pressAnimationInfo](self, "pressAnimationInfo");
  if (v4 == 0.0)
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v7 = v5;
    v8 = v6;
    if (v5 == *MEMORY[0x1E0C9D820] && v6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[PXStoryModel timeline](self, "timeline");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      v7 = v11;
      v8 = v12;

    }
  }
  objc_msgSend(v14, "approximateVelocity");
  -[PXStoryModel setPressAnimationInfo:](self, "setPressAnimationInfo:", v4, v13, v7, v8);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXStoryModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E512F1A0;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryModel performChanges:](self, "performChanges:", v5);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PXStoryModel timeline](self, "timeline");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "diagnosticDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithText:name:", v5, CFSTR("Timeline"));

  objc_msgSend(v11, "objectiveCCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithObjectiveCCode:name:", v6, CFSTR("Timeline"));

  -[PXStoryModel _appleMusicCapabilitiesDebugInformation](self, "_appleMusicCapabilitiesDebugInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithText:name:", v7, CFSTR("AppleMusicCapabilities"));

  -[PXStoryModel _musicCurationDebugInformation](self, "_musicCurationDebugInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithText:name:", v8, CFSTR("MusicCurationDebugInformation"));

  -[PXStoryModel styleManager](self, "styleManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v9);

  -[PXStoryModel timelineManager](self, "timelineManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v10);

}

- (id)_appleMusicCapabilitiesDebugInformation
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  -[PXStoryModel configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleMusicStatusProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "statusForCapability:", 1);
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v6 - 1) > 2)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E5143FE8[v6 - 1];
  v9 = v8;
  v10 = v9;
  if (!v6 && v7)
  {
    -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR(" (Error: %@)"), v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  return v10;
}

- (id)_musicCurationDebugInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  dispatch_time_t v13;
  __CFString *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  __CFString *v24;

  -[PXStoryModel currentSongResource](self, "currentSongResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryModel photoKitAssetContainerWithAssetCollection:](self, "photoKitAssetContainerWithAssetCollection:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__149482;
        v23 = __Block_byref_object_dispose__149483;
        v24 = CFSTR("Unavailable");
        v10 = dispatch_group_create();
        dispatch_group_enter(v10);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __46__PXStoryModel__musicCurationDebugInformation__block_invoke;
        v16[3] = &unk_1E51348C8;
        v18 = &v19;
        v11 = v10;
        v17 = v11;
        v12 = +[PXMusicCurator requestDebugInformationForAudioAsset:assetContainer:resultHandler:](PXMusicCurator, "requestDebugInformationForAudioAsset:assetContainer:resultHandler:", v4, v9, v16);
        v13 = dispatch_time(0, 10000000000);
        if (dispatch_group_wait(v11, v13))
          v14 = CFSTR("Requesting music curation debug information timed out.");
        else
          v14 = (__CFString *)(id)v20[5];

        _Block_object_dispose(&v19, 8);
      }
      else
      {
        v14 = CFSTR("Current asset collection is not a PHAssetCollection.");
      }
    }
    else
    {
      v14 = CFSTR("Asset collection is nil.");
    }
  }
  else
  {
    v14 = CFSTR("Song is nil.");
  }

  return v14;
}

- (id)diagnosticTextForHUDType:(int64_t)a3
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
  _BOOL4 v15;
  const __CFString *v16;
  unint64_t v17;
  __CFString *v18;
  __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  unint64_t v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  void *v29;
  void *v30;
  CMTime v32;
  CMTime time;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXStoryModel _currentAssetCollectionDescriptionForHUDType:](self, "_currentAssetCollectionDescriptionForHUDType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" Asset Collection: %@\n"), v6);

  -[PXStoryModel currentTimeDescription](self, "currentTimeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("             Time: %@\n"), v7);

  -[PXStoryModel currentStyleDescription](self, "currentStyleDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("            Style: %@\n"), v8);

  -[PXStoryModel currentGradeDescription](self, "currentGradeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("            Grade: %@\n"), v9);

  -[PXStoryModel currentSongDescription](self, "currentSongDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("             Song: %@\n"), v10);

  -[PXStoryModel currentSongTagsDescription](self, "currentSongTagsDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("        Song Tags: %@\n"), v11);

  -[PXStoryModel currentSongPaceDescription](self, "currentSongPaceDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("        Song Pace: %@\n"), v12);

  -[PXStoryModel outroDuration](self, "outroDuration");
  time = v32;
  objc_msgSend(v5, "appendFormat:", CFSTR("   Outro Duration: %.2fs\n"), CMTimeGetSeconds(&time));
  if (a3 == 14)
  {
    -[PXStoryModel visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" Visible Segments: %@\n"), v14);

    v15 = -[PXStoryModel allowsScrolling](self, "allowsScrolling");
    v16 = CFSTR("No");
    if (v15)
      v16 = CFSTR("Yes");
    objc_msgSend(v5, "appendFormat:", CFSTR("Scrolling Allowed: %@\n"), v16);
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
    v17 = -[PXStoryModel readinessStatus](self, "readinessStatus");
    if (v17 > 3)
      v18 = CFSTR("??");
    else
      v18 = off_1E51361A0[v17];
    v19 = v18;
    objc_msgSend(v5, "appendFormat:", CFSTR("   Overall Status: %@\n"), v19);

    v20 = -[PXStoryModel musicReadinessStatus](self, "musicReadinessStatus");
    if (v20 > 3)
      v21 = CFSTR("??");
    else
      v21 = off_1E51361A0[v20];
    v22 = v21;
    objc_msgSend(v5, "appendFormat:", CFSTR("     Music Status: %@\n"), v22);

    v23 = -[PXStoryModel contentReadinessStatus](self, "contentReadinessStatus");
    if (v23 > 3)
      v24 = CFSTR("??");
    else
      v24 = off_1E51361A0[v23];
    v25 = v24;
    objc_msgSend(v5, "appendFormat:", CFSTR("   Content Status: %@\n"), v25);

    -[PXStoryModel volume](self, "volume");
    v27 = v26;
    -[PXStoryModel volumeDuringViewControllerTransition](self, "volumeDuringViewControllerTransition");
    objc_msgSend(v5, "appendFormat:", CFSTR("          Volumes: %.2f %.2f\n"), v27, v28);
    -[PXStoryModel timeline](self, "timeline");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("         Timeline: %@\n"), v29);

  }
  v30 = (void *)objc_msgSend(v5, "copy");

  return v30;
}

- (id)_currentAssetCollectionDescriptionForHUDType:(int64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "localizedTitle");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E5149688;
    objc_msgSend(v4, "localizedSubtitle");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1E5149688;
    v12 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ \n%@"), v8, v11);

    objc_msgSend(off_1E50B3470, "defaultHelper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayableTextForTitle:intent:", v12, 1);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (a3 == 14)
    {
      objc_msgSend(v4, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("\n\tUUID: %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n\tType: %@"), v18);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v4;
        objc_msgSend(v19, "photosGraphProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("info"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("osInfo"));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v23 = CFSTR("?");
        if (v22)
          v23 = v22;
        -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("\n\tGenerated on: %@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "pendingState") == 2)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("\n\tlocal: %@"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "isEnriched"))
          v27 = CFSTR("YES");
        else
          v27 = CFSTR("NO");
        objc_msgSend(v26, "stringByAppendingFormat:", CFSTR("\n\tenriched: %@"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "storyTitleCategory");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("\n\tstoryTitleCategory: %@"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "storyColorGradeKind");
        PFStoryColorGradeKindToString();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByAppendingFormat:", CFSTR("\n\tstoryColorGradeKind: %@"), v31);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v14 = CFSTR("-");
  }

  return v14;
}

- (id)currentTimeDescription
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  CMTime v11;

  v3 = -[PXStoryModel desiredPlayState](self, "desiredPlayState");
  v4 = CFSTR("▶︎");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("❚❚");
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PXStoryModel nominalPlaybackTime](self, "nominalPlaybackTime");
  PXStoryTimeDescription(&v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryModel playbackFractionCompleted](self, "playbackFractionCompleted");
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ (%0.1f%%) %@"), v7, v8 * 100.0, v5);

  return v9;
}

- (id)currentStyleDescription
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[PXStoryModel currentStyle](self, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalColorGradeCategory");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("-");
  v5 = v3;

  return v5;
}

- (id)currentGradeDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[PXStoryModel currentStyle](self, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "customColorGradeKind");

  -[PXStoryModel currentStyle](self, "currentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalColorGradeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXStoryModel currentAssetCollection](self, "currentAssetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "storyColorGradeKind");

  }
  else
  {
    v11 = 0;
  }
  -[PXStoryModel colorGradingRepository](self, "colorGradingRepository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "colorGradeKindForColorGradeCategory:", v7);
  v14 = CFSTR("<music> ");
  if (v5)
  {
    if (v7)
    {
      if (v5 != 1 || v11)
      {
        if (v13 != v5)
          v14 = CFSTR("<custom> ");
      }
      else
      {
        v14 = CFSTR("<curation> ");
        v5 = 1;
      }
    }
    else
    {
      v14 = CFSTR("<curation> ");
    }
  }
  else
  {
    v5 = v13;
  }
  objc_msgSend(v3, "appendString:", v14);
  objc_msgSend(v12, "localizedTitleForColorGradeKind:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v15);

  return v3;
}

- (id)currentSongDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  __CFString *v13;
  __CFString *v14;

  -[PXStoryModel currentSongResource](self, "currentSongResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = 0;
      v9 = (void *)v6;
    }
    else
    {
      objc_msgSend(v4, "artistName");
      v11 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)v11;
      if (v11)
      {
        v8 = 0;
        v9 = (void *)v11;
      }
      else
      {
        objc_msgSend(v4, "albumTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 1;
      }
    }
    v12 = objc_msgSend(v4, "catalog");
    if (v12 > 4)
      v13 = CFSTR("Mock");
    else
      v13 = off_1E5133A28[v12];
    v14 = v13;
    v10 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ (%@)"), v9, v14);

    if (v8)
    if (!v7)

  }
  else
  {
    v10 = CFSTR("-");
  }

  return v10;
}

- (id)currentSongTagsDescription
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[PXStoryModel currentSongResource](self, "currentSongResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceSongAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "assetTagsDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("-");
  }

  return v4;
}

- (id)currentSongPaceDescription
{
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  -[PXStoryModel currentSongResource](self, "currentSongResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_storyResourceSongAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "pace");
    PFStoryRecipeSongPaceDescription();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("-");
  }
  v5 = objc_msgSend(v3, "pace");
  v6 = v4;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autoEditSongPaceOverride");

  if (v8)
    v9 = v8 == v5;
  else
    v9 = 1;
  v10 = v6;
  if (!v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    PFStoryRecipeSongPaceDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (overridden from %@)"), v12, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (NSString)windowSceneID
{
  return self->_windowSceneID;
}

- (void)setWindowSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSCopying)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)nominalPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[29];
  return self;
}

- (double)outroFractionCompleted
{
  return self->_outroFractionCompleted;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[30];
  return self;
}

- (unint64_t)lastPlaybackTimeChangeSource
{
  return self->_lastPlaybackTimeChangeSource;
}

- (double)playbackFractionCompleted
{
  return self->_playbackFractionCompleted;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[31];
  return self;
}

- (BOOL)isAtPlaybackEnd
{
  return self->_isAtPlaybackEnd;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (BOOL)isActuallyPlaying
{
  return self->_isActuallyPlaying;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (int64_t)thumbnailStyle
{
  return self->_thumbnailStyle;
}

- (int64_t)detailsViewButtonDisplayStyle
{
  return self->_detailsViewButtonDisplayStyle;
}

- (BOOL)shouldAutoplayThumbnail
{
  return self->_shouldAutoplayThumbnail;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)thumbnailAutoplayTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[19].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[18].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[19].var0.var3;
  return self;
}

- (BOOL)shouldUseInactiveImageFilter
{
  return self->_shouldUseInactiveImageFilter;
}

- (PXStoryThumbnailActionPerformer)thumbnailActionPerformer
{
  return self->_thumbnailActionPerformer;
}

- (BOOL)shouldAspectFitCurrentSegment
{
  return self->_shouldAspectFitCurrentSegment;
}

- (PXStoryViewModeTransition)viewModeTransition
{
  return self->_viewModeTransition;
}

- (BOOL)prefersExportLayoutMatchesPlayback
{
  return self->_prefersExportLayoutMatchesPlayback;
}

- (double)chromeVisibilityFraction
{
  return self->_chromeVisibilityFraction;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (PXDisplayRect)presentedTitleFrame
{
  return self->_presentedTitleFrame;
}

- (PXDisplayRect)presentedSubtitleFrame
{
  return self->_presentedSubtitleFrame;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (CGPoint)currentGridScrollPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentGridScrollPosition.x;
  y = self->_currentGridScrollPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- ($7DA682ECC7253F641496E0B6E9C98204)currentScrollPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = ($BC569A352189BBB700BC3B7A67A9BAFC)self[32];
  return self;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)allowsScrolling
{
  return self->_allowsScrolling;
}

- (BOOL)isTouching
{
  return self->_isTouching;
}

- ($68D3C1A33EB7F0335689E2F183EF80A4)pressAnimationInfo
{
  return self;
}

- (BOOL)isHovering
{
  return self->_isHovering;
}

- (BOOL)isPresentingAssetPicker
{
  return self->_isPresentingAssetPicker;
}

- (BOOL)isPresentingMusicEditor
{
  return self->_isPresentingMusicEditor;
}

- (BOOL)isPresentingColorGradeEditor
{
  return self->_isPresentingColorGradeEditor;
}

- (BOOL)isPerformingViewControllerTransition
{
  return self->_isPerformingViewControllerTransition;
}

- (BOOL)isPresentingAnyAlert
{
  return self->_isPresentingAnyAlert;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (unint64_t)timelineAttributes
{
  return self->_timelineAttributes;
}

- (PXStoryTimelineSpec)timelineSpec
{
  return self->_timelineSpec;
}

- (PXStoryTimeline)gridTimeline
{
  return self->_gridTimeline;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeIntoCurrentSegment
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[33];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeLeftInCurrentSegment
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[34];
  return self;
}

- (int64_t)currentSegmentIdentifier
{
  return self->_currentSegmentIdentifier;
}

- (int64_t)previousSegmentIdentifier
{
  return self->_previousSegmentIdentifier;
}

- (NSIndexSet)visibleSegmentIdentifiers
{
  return self->_visibleSegmentIdentifiers;
}

- (int64_t)lastHitClipIdentifier
{
  return self->_lastHitClipIdentifier;
}

- (PXAssetReference)lastHitAssetReference
{
  return self->_lastHitAssetReference;
}

- (int64_t)readinessStatus
{
  return self->_readinessStatus;
}

- (int64_t)contentReadinessStatus
{
  return self->_contentReadinessStatus;
}

- (int64_t)musicReadinessStatus
{
  return self->_musicReadinessStatus;
}

- (PXStoryStyle)currentStyle
{
  return self->_currentStyle;
}

- (double)styleSwitcherVisibilityFraction
{
  return self->_styleSwitcherVisibilityFraction;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (int64_t)colorGradeKind
{
  return self->_colorGradeKind;
}

- (PXStorySongResource)editorPreviewSong
{
  return self->_editorPreviewSong;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (PXStorySongResource)activeSongResource
{
  return self->_activeSongResource;
}

- (PXDisplayAssetCollection)currentAssetCollection
{
  return self->_currentAssetCollection;
}

- (BOOL)currentAssetCollectionIsFavorite
{
  return self->_currentAssetCollectionIsFavorite;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[35];
  return self;
}

- (PXStoryAnimationController)animationController
{
  return self->_animationController;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (PXStoryLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isAsync
{
  return self->_isAsync;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (BOOL)inLiveResize
{
  return self->_inLiveResize;
}

- (BOOL)shouldPauseTransitions
{
  return self->_shouldPauseTransitions;
}

- (PXStoryLoadingStatusReporter)loadingStatusReporter
{
  return self->_loadingStatusReporter;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (BOOL)isHUDVisible
{
  return self->_isHUDVisible;
}

- (int64_t)diagnosticHUDType
{
  return self->_diagnosticHUDType;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (int64_t)persistencePermission
{
  return self->_persistencePermission;
}

- (BOOL)wantsMusicDucked
{
  return self->_wantsMusicDucked;
}

- (double)volume
{
  return self->_volume;
}

- (float)volumeDuringViewControllerTransition
{
  return self->_volumeDuringViewControllerTransition;
}

- (double)desiredInfoPanelVisibilityFraction
{
  return self->_desiredInfoPanelVisibilityFraction;
}

- (double)infoPanelVisibilityFraction
{
  return self->_infoPanelVisibilityFraction;
}

- (PXStoryLayoutSpecManager)layoutSpecManager
{
  return self->_layoutSpecManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSMapTable)HUDContentProvidersByType
{
  return self->_HUDContentProvidersByType;
}

- (NSHashTable)videoPresentationControllers
{
  return self->_videoPresentationControllers;
}

- (id)overallDurationChangeCompletionHandler
{
  return self->_overallDurationChangeCompletionHandler;
}

- (void)setOverallDurationChangeCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (int64_t)bufferingEvents
{
  return self->_bufferingEvents;
}

- (void)setBufferingEvents:(int64_t)a3
{
  self->_bufferingEvents = a3;
}

- (int64_t)numberOfPresentedAlerts
{
  return self->_numberOfPresentedAlerts;
}

- (PXNumberAnimator)pressedFractionAnimator
{
  return self->_pressedFractionAnimator;
}

- (BOOL)didReachOutroOnce
{
  return self->_didReachOutroOnce;
}

- (BOOL)didPrerequestPersistencePermission
{
  return self->_didPrerequestPersistencePermission;
}

- (void)setDidPrerequestPersistencePermission:(BOOL)a3
{
  self->_didPrerequestPersistencePermission = a3;
}

- (PXDisplayAsset)desiredStartAsset
{
  return self->_desiredStartAsset;
}

- (void)setDesiredStartAsset:(id)a3
{
  objc_storeStrong((id *)&self->_desiredStartAsset, a3);
}

- (NSDate)persistenceConfirmationPresentationDate
{
  return self->_persistenceConfirmationPresentationDate;
}

- (void)setPersistenceConfirmationPresentationDate:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceConfirmationPresentationDate, a3);
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryTimelineManager)timelineManager
{
  return self->_timelineManager;
}

- (double)playbackMaxFractionCompleted
{
  return self->_playbackMaxFractionCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_persistenceConfirmationPresentationDate, 0);
  objc_storeStrong((id *)&self->_desiredStartAsset, 0);
  objc_storeStrong((id *)&self->_pressedFractionAnimator, 0);
  objc_storeStrong(&self->_overallDurationChangeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_videoPresentationControllers, 0);
  objc_storeStrong((id *)&self->_HUDContentProvidersByType, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_layoutSpecManager, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_loadingStatusReporter, 0);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_currentAssetCollection, 0);
  objc_storeStrong((id *)&self->_activeSongResource, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_editorPreviewSong, 0);
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_lastHitAssetReference, 0);
  objc_storeStrong((id *)&self->_visibleSegmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_gridTimeline, 0);
  objc_storeStrong((id *)&self->_timelineSpec, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_presentedSubtitleFrame, 0);
  objc_storeStrong((id *)&self->_presentedTitleFrame, 0);
  objc_storeStrong((id *)&self->_viewModeTransition, 0);
  objc_storeStrong((id *)&self->_thumbnailActionPerformer, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_titleCategory, 0);
  objc_storeStrong((id *)&self->_windowSceneID, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_musicDuckingTokens, 0);
  objc_storeStrong((id *)&self->_persistenceRequests, 0);
  objc_storeStrong((id *)&self->_changesOrigins, 0);
}

void __46__PXStoryModel__musicCurationDebugInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(a3, "localizedDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__PXStoryModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == TimelineManagerObservationContext)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTimeline");
      v3 = v7;
      v5 = *(_QWORD *)(a1 + 48);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTimelineAttributes");
      goto LABEL_21;
    }
  }
  else if (v4 == ResourcesDataSourceManagerObservationContext_149505)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v7 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentAssetCollection");
      goto LABEL_21;
    }
  }
  else if (v4 == StyleManagerObservationContext_149506)
  {
    if ((*(_BYTE *)(a1 + 48) & 4) != 0)
    {
      v7 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleAndFocus");
      goto LABEL_21;
    }
  }
  else if (v4 == LayoutSpecManagerObservationContext)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v7 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateLayoutSpec");
      goto LABEL_21;
    }
  }
  else if (v4 == TimelineSpecManagerObservationContext)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v7 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTimelineSpec");
      goto LABEL_21;
    }
  }
  else
  {
    if (v4 != PressedFractionAnimatorObservationContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryModel.m"), 1702, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((*(_BYTE *)(a1 + 48) & 2) != 0)
    {
      v7 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidatePressAnimationInfo");
LABEL_21:
      v3 = v7;
    }
  }

}

uint64_t __46__PXStoryModel__updatePressedFractionAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __41__PXStoryModel_removeAssetsFromCuration___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v6, "recipeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__PXStoryModel_removeAssetsFromCuration___block_invoke_2;
    v16[3] = &unk_1E5130830;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performChanges:", v16);

  }
  else
  {
    objc_msgSend(v6, "errorReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, CFSTR("unable to remove asset from curation, persistence request failed"), v9, v10, v11, v12, v13, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:forComponent:", v14, CFSTR("CuratedAssetRemoval"));

  }
}

uint64_t __41__PXStoryModel_removeAssetsFromCuration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyManuallyRemovedAssets:", *(_QWORD *)(a1 + 32));
}

void __34__PXStoryModel_makeAssetKeyPhoto___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v6, "recipeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __34__PXStoryModel_makeAssetKeyPhoto___block_invoke_2;
    v16[3] = &unk_1E5130830;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performChanges:", v16);

  }
  else
  {
    objc_msgSend(v6, "errorReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, CFSTR("unable to make asset key photo, persistence request failed"), v9, v10, v11, v12, v13, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:forComponent:", v14, CFSTR("KeyAssetPick"));

  }
}

uint64_t __34__PXStoryModel_makeAssetKeyPhoto___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyKeyAsset:", *(_QWORD *)(a1 + 32));
}

void __56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v6, "recipeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke_2;
    v17[3] = (uint64_t)&__block_descriptor_112_e39_v16__0___PXStoryMutableRecipeManager__8l;
    v8 = *(_OWORD *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 88);
    v20 = *(_OWORD *)(a1 + 72);
    v21 = v9;
    v22 = *(_OWORD *)(a1 + 104);
    v18 = *(_OWORD *)(a1 + 40);
    v19 = v8;
    objc_msgSend(v7, "performChanges:", v17);

  }
  else
  {
    objc_msgSend(v6, "errorReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, CFSTR("unable to change overall duration, persistence request failed"), v11, v12, v13, v14, v15, v17[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setError:forComponent:", v16, CFSTR("OverallDurationPick"));

  }
}

uint64_t __56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke_2(_OWORD *a1, void *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = a1[5];
  v5[2] = a1[4];
  v5[3] = v2;
  v5[4] = a1[6];
  v3 = a1[3];
  v5[0] = a1[2];
  v5[1] = v3;
  return objc_msgSend(a2, "applyTargetOverallDurationInfo:", v5);
}

void __62__PXStoryModel__completePersistenceRequestsWithSuccess_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __61__PXStoryModel_performWithPrerequestedPersistencePermission___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[12];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to realize pre-requested persistence permission: %@", v15, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "errorReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, CFSTR("failed to realize pre-requested persistence permission"), v9, v10, v11, v12, v13, *(uint64_t *)v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:forComponent:", v14, CFSTR("PrerequestedPersistencePermission"));

  }
}

uint64_t __50__PXStoryModel_reportPersistenceFailureWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPersistencePermission:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_completePersistenceRequestsWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistencePermission");
}

void __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  char v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "persistenceConfirmationPresentationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
    if (a2 && v7)
    {
      objc_msgSend(v7, "timeIntervalSinceNow");
      v11 = v10;
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistenceConfirmationDuration");
      v14 = v11 + v13;

      if (v14 < 0.0)
        v14 = 0.0;
      PLStoryGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v23 = -v11;
        v24 = 2048;
        v25 = v14;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "persistence confirmation presented for %0.2fs, delaying by %0.2fs", buf, 0x16u);
      }

      v9 = (uint64_t)(v14 * 1000000000.0);
    }
    v16 = dispatch_time(0, v9);
    objc_msgSend(*(id *)(a1 + 32), "storyQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_214;
    block[3] = &unk_1E5146308;
    v20 = *(id *)(a1 + 40);
    v21 = a2;
    v19 = v5;
    dispatch_after(v16, v17, block);

  }
}

void __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;

  PXStoryErrorCreateWithCodeDebugFormat(24, CFSTR("persistence permission request timed out"), a3, a4, a5, a6, a7, a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistencePermission");
}

uint64_t __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __47__PXStoryModel_reconfigureWithAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setConfiguration:", *(_QWORD *)(a1 + 32));
}

void __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _OWORD v13[3];
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "timeRangeForSegmentWithIdentifier:", a2);
    v3 = *(void **)(a1 + 32);
  }
  objc_msgSend(v3, "size");
  PXRectWithOriginAndSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke_2;
  v14[3] = &unk_1E512E1F0;
  v12 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v13[0] = v16;
  v13[1] = v17;
  v13[2] = v18;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v13, v14, v5, v7, v9, v11);

}

void __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  void *v9;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        v8 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(v7 - 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

void __36__PXStoryModel_visibleDisplayAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[3];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "timeRangeForSegmentWithIdentifier:", a2);
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__PXStoryModel_visibleDisplayAssets__block_invoke_2;
  v9[3] = &unk_1E5139440;
  v5 = v4;
  v13 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8[0] = v14;
  v8[1] = v15;
  v8[2] = v16;
  objc_msgSend(v5, "enumerateClipsInTimeRange:rect:usingBlock:", v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __36__PXStoryModel_visibleDisplayAssets__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v7 - 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "px_storyResourceDisplayAsset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

uint64_t __49__PXStoryModel_rewindToBeginningOfCurrentSegment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performChanges:", &__block_literal_global_200_149576);
}

uint64_t __49__PXStoryModel_rewindToBeginningOfCurrentSegment__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rewind");
}

uint64_t __40__PXStoryModel_skipToSegmentWithOffset___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldRewindOnBackAction");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __45__PXStoryModel_setVisibleSegmentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleSegmentIdentifiers:afterUpdatePass:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), 1);
}

void __65__PXStoryModel__displayCollectionPersistenceConfirmationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryPersistenceConfirmationToastMessage"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v2);

  objc_msgSend(v3, "setIconSystemImageName:", CFSTR("memories.badge.plus"));
  objc_msgSend(v3, "setAutoDismissalDelay:", 3.0);

}

uint64_t __72__PXStoryModel_initWithTimelineManager_layoutSpecManager_configuration___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateTimeline");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTimelineAttributes");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTimelineSpec");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentAssetCollection");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleAndFocus");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateLayoutSpec");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistencePermission");
}

@end
