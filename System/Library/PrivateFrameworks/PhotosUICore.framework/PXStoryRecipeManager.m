@implementation PXStoryRecipeManager

- (PXStoryRecipeManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeManager.m"), 313, CFSTR("%s is not available as initializer"), "-[PXStoryRecipeManager init]");

  abort();
}

- (PXStoryRecipeManager)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  PXStoryPassthroughDetailedSaliencyProducerFactory *v6;
  PXStoryRecipeManager *v7;

  v4 = a3;
  objc_msgSend(v4, "detailedSaliencyProducer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[PXStoryPassthroughDetailedSaliencyProducerFactory initWithDetailedSaliencyProducer:]([PXStoryPassthroughDetailedSaliencyProducerFactory alloc], "initWithDetailedSaliencyProducer:", v5);
  else
    v6 = 0;
  v7 = -[PXStoryRecipeManager initWithConfiguration:assetsProducerFactory:persistableRecipeProducerFactory:songsProducerFactory:movieHighlightsProducerFactory:detailedSaliencyProducerFactory:chapterCollectionProducerFactory:stylesProducerFactory:autoEditDecisionListsProducerFactory:autoCurationProducerFactory:](self, "initWithConfiguration:assetsProducerFactory:persistableRecipeProducerFactory:songsProducerFactory:movieHighlightsProducerFactory:detailedSaliencyProducerFactory:chapterCollectionProducerFactory:stylesProducerFactory:autoEditDecisionListsProducerFactory:autoCurationProducerFactory:", v4, 0, 0, 0, 0, v6, 0, 0, 0, 0);

  return v7;
}

- (PXStoryRecipeManager)initWithConfiguration:(id)a3 assetsProducerFactory:(id)a4 persistableRecipeProducerFactory:(id)a5 songsProducerFactory:(id)a6 movieHighlightsProducerFactory:(id)a7 detailedSaliencyProducerFactory:(id)a8 chapterCollectionProducerFactory:(id)a9 stylesProducerFactory:(id)a10 autoEditDecisionListsProducerFactory:(id)a11 autoCurationProducerFactory:(id)a12
{
  PXStoryDefaultAssetsProducerFactory *v17;
  PXStoryDefaultPersistableRecipeProducerFactory *v18;
  PXStoryDefaultSongsProducerFactory *v19;
  PXStoryDefaultPersistableRecipeProducerFactory *v20;
  PXStoryDefaultSongsProducerFactory *v21;
  PXStoryDefaultMovieHighlightsProducerFactory *v22;
  PXStoryDefaultDetailedSaliencyProducerFactory *v23;
  PXStoryDefaultChapterCollectionProducerFactory *v24;
  PXStoryDefaultMovieHighlightsProducerFactory *v25;
  PXStoryDefaultStylesProducerFactory *v26;
  PXStoryDefaultDetailedSaliencyProducerFactory *v27;
  PXStoryDefaultChapterCollectionProducerFactory *v28;
  PXStoryDefaultAutoCurationProducerFactory *v29;
  PXStoryRecipeManager *v30;
  void *v31;
  PXStoryDefaultAssetsProducerFactory *v32;
  PXStoryDefaultPersistableRecipeProducerFactory *v33;
  PXStoryDefaultSongsProducerFactory *v34;
  PXStoryDefaultMovieHighlightsProducerFactory *v35;
  PXStoryDefaultDetailedSaliencyProducerFactory *v36;
  PXStoryDefaultChapterCollectionProducerFactory *v37;
  PXStoryDefaultStylesProducerFactory *v38;
  PXStoryDefaultAutoEditDecisionListsProducerFactory *v39;
  PXStoryDefaultAutoCurationProducerFactory *v40;
  PXStoryDefaultSongResourceProducerFactory *v41;
  PXStorySongResourceProducerFactory *songResourceProducerFactory;
  NSSet *v43;
  NSSet *additionalSongs;
  NSDictionary *v45;
  NSDictionary *additionalAutoEditDecisionListsBySong;
  uint64_t v47;
  OS_dispatch_queue *storyQueue;
  uint64_t v49;
  PXStoryErrorReporter *errorReporter;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  PXStoryRecipeAssetEdits *v54;
  PXStoryRecipeAssetEdits *recipeAssetEdits;
  uint64_t v56;
  PXUpdater *updater;
  uint64_t v58;
  NSDate *loadingStartDate;
  char v60;
  uint64_t v61;
  PXStoryRecipeManager *v62;
  PXStoryDefaultChapterCollectionProducerFactory *v63;
  PXStoryDefaultDetailedSaliencyProducerFactory *v64;
  PXStoryDefaultMovieHighlightsProducerFactory *v65;
  PXStoryDefaultSongsProducerFactory *v66;
  PXStoryDefaultPersistableRecipeProducerFactory *v67;
  void (**v68)(void);
  uint64_t v69;
  PXStoryProducerMonitor *detailedSaliencyProducerMonitor;
  PXStoryDefaultAutoCurationProducerFactory *v72;
  PXStoryDefaultStylesProducerFactory *v74;
  PXStoryDefaultAutoEditDecisionListsProducerFactory *obj;
  id v76;
  _QWORD v77[4];
  PXStoryRecipeManager *v78;
  id v79;
  _QWORD aBlock[4];
  PXStoryRecipeManager *v81;
  objc_super v82;

  v76 = a3;
  v17 = (PXStoryDefaultAssetsProducerFactory *)a4;
  v18 = (PXStoryDefaultPersistableRecipeProducerFactory *)a5;
  v19 = (PXStoryDefaultSongsProducerFactory *)a6;
  v20 = v18;
  v21 = v19;
  v22 = (PXStoryDefaultMovieHighlightsProducerFactory *)a7;
  v23 = (PXStoryDefaultDetailedSaliencyProducerFactory *)a8;
  v24 = (PXStoryDefaultChapterCollectionProducerFactory *)a9;
  v25 = v22;
  v26 = (PXStoryDefaultStylesProducerFactory *)a10;
  v27 = v23;
  v28 = v24;
  obj = (PXStoryDefaultAutoEditDecisionListsProducerFactory *)a11;
  v29 = (PXStoryDefaultAutoCurationProducerFactory *)a12;
  v82.receiver = self;
  v82.super_class = (Class)PXStoryRecipeManager;
  v30 = -[PXStoryRecipeManager init](&v82, sel_init);
  if (v30)
  {
    v74 = v26;
    objc_msgSend(v76, "log");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setLog:](v30, "setLog:", v31);

    -[PXStoryRecipeManager setLogContext:](v30, "setLogContext:", objc_msgSend(v76, "logContext"));
    v32 = v17;
    if (!v17)
      v32 = objc_alloc_init(PXStoryDefaultAssetsProducerFactory);
    objc_storeStrong((id *)&v30->_assetsProducerFactory, v32);
    if (!v17)

    v33 = v20;
    if (!v20)
      v33 = objc_alloc_init(PXStoryDefaultPersistableRecipeProducerFactory);
    objc_storeStrong((id *)&v30->_persistableRecipeProducerFactory, v33);
    if (!v20)

    v34 = v21;
    if (!v21)
      v34 = objc_alloc_init(PXStoryDefaultSongsProducerFactory);
    objc_storeStrong((id *)&v30->_songsProducerFactory, v34);
    if (!v21)

    v35 = v25;
    if (!v25)
      v35 = objc_alloc_init(PXStoryDefaultMovieHighlightsProducerFactory);
    objc_storeStrong((id *)&v30->_movieHighlightsProducerFactory, v35);
    if (!v25)

    v36 = v27;
    if (!v27)
      v36 = objc_alloc_init(PXStoryDefaultDetailedSaliencyProducerFactory);
    objc_storeStrong((id *)&v30->_detailedSaliencyProducerFactory, v36);
    if (!v27)

    v37 = v28;
    if (!v28)
      v37 = objc_alloc_init(PXStoryDefaultChapterCollectionProducerFactory);
    objc_storeStrong((id *)&v30->_chapterCollectionProducerFactory, v37);
    if (!v28)

    v38 = v26;
    if (!v26)
      v38 = objc_alloc_init(PXStoryDefaultStylesProducerFactory);
    objc_storeStrong((id *)&v30->_stylesProducerFactory, v38);
    if (!v26)

    v39 = obj;
    if (!obj)
      v39 = -[PXStoryDefaultAutoEditDecisionListsProducerFactory initWithStoryConfiguration:]([PXStoryDefaultAutoEditDecisionListsProducerFactory alloc], "initWithStoryConfiguration:", v76);
    objc_storeStrong((id *)&v30->_autoEditDecisionListsProducerFactory, v39);
    if (!obj)

    v40 = v29;
    if (!v29)
      v40 = objc_alloc_init(PXStoryDefaultAutoCurationProducerFactory);
    objc_storeStrong((id *)&v30->_autoCurationProducerFactory, v40);
    v72 = v29;
    if (!v29)

    v41 = objc_alloc_init(PXStoryDefaultSongResourceProducerFactory);
    songResourceProducerFactory = v30->_songResourceProducerFactory;
    v30->_songResourceProducerFactory = (PXStorySongResourceProducerFactory *)v41;

    v43 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    additionalSongs = v30->_additionalSongs;
    v30->_additionalSongs = v43;

    v45 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    additionalAutoEditDecisionListsBySong = v30->_additionalAutoEditDecisionListsBySong;
    v30->_additionalAutoEditDecisionListsBySong = v45;

    objc_msgSend(v76, "storyQueue");
    v47 = objc_claimAutoreleasedReturnValue();
    storyQueue = v30->_storyQueue;
    v30->_storyQueue = (OS_dispatch_queue *)v47;

    objc_msgSend(v76, "errorReporter");
    v49 = objc_claimAutoreleasedReturnValue();
    errorReporter = v30->_errorReporter;
    v30->_errorReporter = (PXStoryErrorReporter *)v49;

    v51 = (_OWORD *)MEMORY[0x1E0D759B0];
    v52 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
    *(_OWORD *)&v30->_overallDurationInfo.specificDurationInfo.preferredDuration.value = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
    *(_OWORD *)&v30->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v52;
    *(_OWORD *)&v30->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = v51[4];
    v53 = v51[1];
    *(_OWORD *)&v30->_overallDurationInfo.kind = *v51;
    *(_OWORD *)&v30->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v53;
    v54 = objc_alloc_init(PXStoryRecipeAssetEdits);
    recipeAssetEdits = v30->_recipeAssetEdits;
    v30->_recipeAssetEdits = v54;

    v56 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v30, sel__setNeedsUpdate);
    updater = v30->_updater;
    v30->_updater = (PXUpdater *)v56;

    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAssetsProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAssets);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAssetCollection);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updatePersistableRecipeProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updatePersistableRecipe);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updatePersistedSongProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updatePersistedSong);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateCuratedSongsProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateCuratedSongs);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAllAssets);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateCuratedAssets);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateKeyAsset);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateMovieHighlightsProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateMovieHighlights);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateDetailedSaliencyProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateDetailedSaliency);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateChapterCollectionProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateChapterCollectionResult);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateChapterCollection);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAutoCurationProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateCurationLengths);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateOverallDurationInfo);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateManuallyCuratedAssets);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAutoEditDecisionListsProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateInitialAutoEditDecisionList);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAutoEditDecisionLists);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAdditionalAutoEditDecisionLists);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateInitialStyleProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateInitialStyle);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAutoEditStylesProducer);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateAutoEditStyles);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateProducerMonitors);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateProducersLikelyToKeepUp);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateRecipe);
    -[PXUpdater addUpdateSelector:](v30->_updater, "addUpdateSelector:", sel__updateRecipeAttributes);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v58 = objc_claimAutoreleasedReturnValue();
    loadingStartDate = v30->_loadingStartDate;
    v30->_loadingStartDate = (NSDate *)v58;

    v60 = -[PXStoryConfiguration options](v30->_configuration, "options");
    v61 = MEMORY[0x1E0C809B0];
    if ((v60 & 3) == 0)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke;
      aBlock[3] = &unk_1E512FFE8;
      v62 = v30;
      v81 = v62;
      v63 = v28;
      v64 = v27;
      v65 = v25;
      v66 = v21;
      v67 = v20;
      v68 = (void (**)(void))_Block_copy(aBlock);
      v68[2]();
      v69 = objc_claimAutoreleasedReturnValue();
      detailedSaliencyProducerMonitor = v62->_detailedSaliencyProducerMonitor;
      v62->_detailedSaliencyProducerMonitor = (PXStoryProducerMonitor *)v69;

      v20 = v67;
      v21 = v66;
      v25 = v65;
      v27 = v64;
      v28 = v63;

    }
    v77[0] = v61;
    v77[1] = 3221225472;
    v77[2] = __305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke_2;
    v77[3] = &unk_1E5130010;
    v78 = v30;
    v79 = v76;
    -[PXStoryRecipeManager performChanges:](v78, "performChanges:", v77);

    v26 = v74;
    v29 = v72;
  }

  return v30;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress cancel](self->_assetsProgress, "cancel");
  -[NSProgress cancel](self->_persistableRecipeProgress, "cancel");
  -[NSProgress cancel](self->_curatedSongsProgress, "cancel");
  -[NSProgress cancel](self->_persistedSongProgress, "cancel");
  -[NSProgress cancel](self->_initialStyleProgress, "cancel");
  -[NSProgress cancel](self->_initialAutoEditDecisionListProgress, "cancel");
  -[NSProgress cancel](self->_autoEditStylesProgress, "cancel");
  -[NSProgress cancel](self->_autoEditDecisionListsProgress, "cancel");
  -[NSProgress cancel](self->_detailedSaliencyProgress, "cancel");
  -[NSProgress cancel](self->_chapterCollectionProgress, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRecipeManager;
  -[PXStoryRecipeManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, configuration: %@>"), v5, self, v6);

  return (NSString *)v7;
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryRecipeManager;
  -[PXStoryRecipeManager performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryRecipeManager;
  -[PXStoryRecipeManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryRecipeManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setConfiguration:(id)a3
{
  PXStoryConfiguration *v5;
  char v6;
  PXStoryConfiguration *v7;
  PXStoryConfiguration *v8;
  PXStoryConfiguration *configuration;
  void *v10;
  void *v11;
  void *v12;
  PXStoryConfiguration *v13;

  v13 = (PXStoryConfiguration *)a3;
  v5 = self->_configuration;
  if (v5 == v13)
  {

LABEL_9:
    v7 = v13;
    goto LABEL_10;
  }
  v6 = -[PXStoryConfiguration isEqual:](v13, "isEqual:", v5);

  v7 = v13;
  if ((v6 & 1) == 0)
  {
    v8 = (PXStoryConfiguration *)-[PXStoryConfiguration copy](v13, "copy");
    configuration = self->_configuration;
    self->_configuration = v8;

    -[PXStoryConfiguration storyQueue](v13, "storyQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeManager.m"), 446, CFSTR("queue mismatch"));

    }
    self->_defaultRequestOptions = 0;
    if ((-[PXStoryConfiguration options](self->_configuration, "options") & 1) != 0)
      self->_defaultRequestOptions |= 2uLL;
    -[PXStoryRecipeManager _invalidateInitialStyleProducer](self, "_invalidateInitialStyleProducer");
    -[PXStoryRecipeManager _invalidateAssetCollection](self, "_invalidateAssetCollection");
    -[PXStoryRecipeManager _invalidateAssetsProducer](self, "_invalidateAssetsProducer");
    -[PXStoryRecipeManager _invalidatePersistableRecipeProducer](self, "_invalidatePersistableRecipeProducer");
    -[PXStoryRecipeManager _invalidateCuratedSongsProducer](self, "_invalidateCuratedSongsProducer");
    -[PXStoryRecipeManager _invalidateMovieHighlightsProducer](self, "_invalidateMovieHighlightsProducer");
    -[PXStoryRecipeManager _invalidateDetailedSaliencyProducer](self, "_invalidateDetailedSaliencyProducer");
    -[PXStoryRecipeManager _invalidateChapterCollectionProducer](self, "_invalidateChapterCollectionProducer");
    -[PXStoryRecipeManager _invalidateAutoCurationProducer](self, "_invalidateAutoCurationProducer");
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)shouldAvoidSynchronousProductions
{
  void *v2;
  BOOL v3;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "options") & 0xC) != 0;

  return v3;
}

- (void)setFinalizedProducers:(unint64_t)a3
{
  if (self->_finalizedProducers != a3)
  {
    self->_finalizedProducers = a3;
    -[PXStoryRecipeManager setRemainingProducers:](self, "setRemainingProducers:", ~(_WORD)a3 & 0x1FFF);
    -[PXStoryRecipeManager _invalidateRecipeAttributes](self, "_invalidateRecipeAttributes");
  }
}

- (void)setRemainingProducers:(unint64_t)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_remainingProducers != a3)
  {
    self->_remainingProducers = a3;
    -[PXStoryRecipeManager log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXStoryRecipeManager logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryRecipeManager.remainingProducers", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXStoryRecipeManager logContext](self, "logContext");
        PXStoryProducersDescription(self->_remainingProducers);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218242;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManager.remainingProducers", "Context=%{signpost.telemetry:string2}lu Remaining=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);

      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryRecipeManager logContext](self, "logContext");
        PXStoryProducersDescription(self->_remainingProducers);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218242;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.remainingProducers", "Context=%{signpost.telemetry:string2}lu Remaining=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);

      }
    }

  }
}

- (void)setProducersWithInitialResults:(unint64_t)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_producersWithInitialResults != a3)
  {
    self->_producersWithInitialResults = a3;
    -[PXStoryRecipeManager log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXStoryRecipeManager logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryRecipeManager.producersWithInitialResults", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXStoryRecipeManager logContext](self, "logContext");
        PXStoryProducersDescription(self->_producersWithInitialResults);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218242;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManager.producersWithInitialResults", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);

      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryRecipeManager logContext](self, "logContext");
        PXStoryProducersDescription(self->_producersWithInitialResults);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218242;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.producersWithInitialResults", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);

      }
    }

  }
}

- (void)setProducersLikelyToKeepUp:(unint64_t)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_producersLikelyToKeepUp != a3)
  {
    self->_producersLikelyToKeepUp = a3;
    -[PXStoryRecipeManager _invalidateRecipeAttributes](self, "_invalidateRecipeAttributes");
    -[PXStoryRecipeManager log](self, "log");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        v17 = 134217984;
        v18 = -[PXStoryRecipeManager logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryRecipeManager.producersLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = v4;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXStoryRecipeManager logContext](self, "logContext");
        PXStoryProducersDescription(self->_producersLikelyToKeepUp);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218242;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManager.producersLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);

      }
    }

    v12 = v7;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryRecipeManager logContext](self, "logContext");
        PXStoryProducersDescription(self->_producersLikelyToKeepUp);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218242;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.producersLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);

      }
    }

  }
}

- (unint64_t)producersRequiredForPlayback
{
  return 6465;
}

- (unint64_t)producersToMonitor
{
  return 4096;
}

- (unint64_t)optionalProducers
{
  return 1024;
}

- (BOOL)wantsAutoEditResults
{
  void *v2;
  BOOL v3;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "options") & 1) == 0;

  return v3;
}

- (void)setAssetsProducer:(id)a3
{
  PXStoryAssetsProducer *v5;
  char v6;
  PXStoryAssetsProducer *v7;

  v7 = (PXStoryAssetsProducer *)a3;
  v5 = self->_assetsProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryAssetsProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetsProducer, a3);
      -[PXStoryRecipeManager _invalidateAssets](self, "_invalidateAssets");
    }
  }

}

- (BOOL)requiresAssetsSynchronously
{
  return !-[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
}

- (void)setAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (PXDisplayAssetCollection *)a3;
  if (self->_assetCollection != v5)
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    -[PXStoryRecipeManager log](self, "log");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        v21 = 134217984;
        v22 = -[PXStoryRecipeManager logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryRecipeManager.assetCollection", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v21, 0xCu);
      }
    }

    v9 = v6;
    v10 = os_signpost_id_make_with_pointer(v9, self);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        v12 = -[PXStoryRecipeManager logContext](self, "logContext");
        -[PXDisplayAssetCollection uuid](v5, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDisplayAssetCollection localizedTitle](v5, "localizedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218498;
        v22 = v12;
        v23 = 2114;
        v24 = v13;
        v25 = 2114;
        v26 = v14;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_EVENT, v11, "PXStoryRecipeManager.assetCollection", "Context=%{signpost.telemetry:string2}lu uuid:%{public}@ title:%{public}@", (uint8_t *)&v21, 0x20u);

      }
    }

    v15 = v9;
    v16 = os_signpost_id_make_with_pointer(v15, self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        v18 = -[PXStoryRecipeManager logContext](self, "logContext");
        -[PXDisplayAssetCollection uuid](v5, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDisplayAssetCollection localizedTitle](v5, "localizedTitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218498;
        v22 = v18;
        v23 = 2114;
        v24 = v19;
        v25 = 2114;
        v26 = v20;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryRecipeManager.assetCollection", "Context=%{signpost.telemetry:string2}lu uuid:%{public}@ title:%{public}@", (uint8_t *)&v21, 0x20u);

      }
    }

    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
  }

}

- (void)setAssetsProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_assetsProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_assetsProgress = &self->_assetsProgress;
  if (*p_assetsProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_assetsProgress, "cancel");
    objc_storeStrong((id *)p_assetsProgress, a3);
    v5 = v7;
  }

}

- (void)setAssetsResult:(id)a3
{
  PXStoryProducerResult *v5;
  void *v6;
  BOOL v7;
  PXStoryProducerResult *v8;

  v8 = (PXStoryProducerResult *)a3;
  v5 = self->_assetsResult;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[PXStoryProducerResult isEqual:](v8, "isEqual:", v5);

  if (!v7)
  {
    objc_storeStrong((id *)&self->_assetsResult, a3);
    -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v8, 1);
    -[PXStoryProducerResult object](v8, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setAssetsDataSourceManager:](self, "setAssetsDataSourceManager:", v6);
LABEL_4:

  }
}

- (void)setAssetsDataSourceManager:(id)a3
{
  PXAssetsDataSourceManager *v5;
  void *v6;
  PXAssetsDataSourceManager *v7;
  char v8;
  PXAssetsDataSourceManager *v9;

  v9 = (PXAssetsDataSourceManager *)a3;
  v5 = self->_assetsDataSourceManager;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXAssetsDataSourceManager isEqual:](v5, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    -[PXAssetsDataSourceManager unregisterChangeObserver:context:](self->_assetsDataSourceManager, "unregisterChangeObserver:context:", self, AssetsDataSourceManagerObservationContext);
    objc_storeStrong((id *)&self->_assetsDataSourceManager, a3);
    -[PXAssetsDataSourceManager registerChangeObserver:context:](v9, "registerChangeObserver:context:", self, AssetsDataSourceManagerObservationContext);
    -[PXStoryRecipeManager signalChange:](self, "signalChange:", 16);
    -[PXAssetsDataSourceManager dataSource](v9, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setAssetsDataSource:](self, "setAssetsDataSource:", v6);
LABEL_4:

  }
}

- (void)setAssetsDataSource:(id)a3
{
  PXAssetsDataSource *v5;
  PXStoryProducerResult *v6;
  PXAssetsDataSource *v7;
  char v8;
  id v9;
  void *v10;
  PXAssetsDataSource *v11;

  v11 = (PXAssetsDataSource *)a3;
  v5 = self->_assetsDataSource;
  v6 = (PXStoryProducerResult *)v11;
  if (v5 == v11)
  {
LABEL_6:

    goto LABEL_7;
  }
  v7 = v5;
  v8 = -[PXAssetsDataSource isEqual:](v5, "isEqual:", v11);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assetsDataSource, a3);
    v6 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v11);
    if ((-[PXAssetsDataSource areAllSectionsConsideredAccurate](v11, "areAllSectionsConsideredAccurate") & 1) == 0)
      v9 = -[PXStoryProducerResult flags:](v6, "flags:", 1);
    -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v6, 2);
    -[PXAssetsDataSource firstAssetCollection](v11, "firstAssetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setAssetCollection:](self, "setAssetCollection:", v10);

    -[PXStoryRecipeManager _invalidateCuratedAssets](self, "_invalidateCuratedAssets");
    -[PXStoryRecipeManager _invalidateAllAssets](self, "_invalidateAllAssets");
    -[PXStoryRecipeManager _invalidateKeyAsset](self, "_invalidateKeyAsset");
    goto LABEL_6;
  }
LABEL_7:

}

- (void)setPersistableRecipeProducer:(id)a3
{
  PXStoryPersistableRecipeProducer *v5;
  char v6;
  PXStoryPersistableRecipeProducer *v7;

  v7 = (PXStoryPersistableRecipeProducer *)a3;
  v5 = self->_persistableRecipeProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryPersistableRecipeProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_persistableRecipeProducer, a3);
      -[PXStoryRecipeManager _invalidatePersistableRecipe](self, "_invalidatePersistableRecipe");
    }
  }

}

- (BOOL)requiresPersistableRecipeSynchronously
{
  -[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
  return 0;
}

- (void)setPersistableRecipeProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_persistableRecipeProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_persistableRecipeProgress = &self->_persistableRecipeProgress;
  if (*p_persistableRecipeProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_persistableRecipeProgress, "cancel");
    objc_storeStrong((id *)p_persistableRecipeProgress, a3);
    v5 = v7;
  }

}

- (void)setHasInitialPersistableRecipeBeenProduced:(BOOL)a3
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
  if (self->_hasInitialPersistableRecipeBeenProduced != a3)
  {
    v3 = a3;
    self->_hasInitialPersistableRecipeBeenProduced = a3;
    -[PXStoryRecipeManager log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryRecipeManager logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryRecipeManager.hasInitialPersistableRecipeBeenProduced", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryRecipeManager logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryRecipeManager.hasInitialPersistableRecipeBeenProduced", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryRecipeManager logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.hasInitialPersistableRecipeBeenProduced", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    -[PXStoryRecipeManager _invalidateInitialStyleProducer](self, "_invalidateInitialStyleProducer");
  }
}

- (void)setPersistableRecipeResult:(id)a3
{
  PXStoryProducerResult *v5;
  PXStoryProducerResult *v6;
  PXStoryProducerResult *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = (PXStoryProducerResult *)a3;
  v6 = self->_persistableRecipeResult;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryProducerResult isEqual:](v5, "isEqual:", v6);

    if (!v8)
    {
      objc_storeStrong((id *)&self->_persistableRecipeResult, a3);
      -[PXStoryProducerResult object](v5, "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "miroInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "containsAnyData"))
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __51__PXStoryRecipeManager_setPersistableRecipeResult___block_invoke;
        v11[3] = &unk_1E5130830;
        v12 = v10;
        -[PXStoryRecipeManager performChanges:](self, "performChanges:", v11);

      }
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _invalidateManuallyCuratedAssets](self, "_invalidateManuallyCuratedAssets");
      -[PXStoryRecipeManager _invalidatePersistedSongProducer](self, "_invalidatePersistedSongProducer");
      -[PXStoryRecipeManager _invalidatePersistedSong](self, "_invalidatePersistedSong");
      -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v5, 4);

    }
  }

}

- (void)setPersistedSongProducer:(id)a3
{
  NSProgress *v5;
  NSProgress *v6;
  char v7;
  NSProgress *v8;

  v8 = (NSProgress *)a3;
  v5 = self->_persistedSongProgress;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSProgress isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_persistedSongProducer, a3);
      -[PXStoryRecipeManager _invalidatePersistedSong](self, "_invalidatePersistedSong");
    }
  }

}

- (void)setPersistedSongResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_persistedSongResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 8);
      objc_storeStrong((id *)&self->_persistedSongResult, a3);
      -[PXStoryRecipeManager _invalidateAutoEditDecisionLists](self, "_invalidateAutoEditDecisionLists");
      -[PXStoryRecipeManager _invalidateCuratedSongs](self, "_invalidateCuratedSongs");
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _invalidateInitialAutoEditDecisionList](self, "_invalidateInitialAutoEditDecisionList");
      -[PXStoryRecipeManager _invalidateInitialStyleProducer](self, "_invalidateInitialStyleProducer");
    }
  }

}

- (void)setPersistedSongProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_persistedSongProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_persistedSongProgress = &self->_persistedSongProgress;
  if (*p_persistedSongProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_persistedSongProgress, "cancel");
    objc_storeStrong((id *)p_persistedSongProgress, a3);
    v5 = v7;
  }

}

- (void)setInitialAutoEditDecisionListResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_initialAutoEditDecisionListResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 256);
      objc_storeStrong((id *)&self->_initialAutoEditDecisionListResult, a3);
      -[PXStoryRecipeManager _invalidateInitialStyleProducer](self, "_invalidateInitialStyleProducer");
    }
  }

}

- (void)setCuratedSongsProducer:(id)a3
{
  PXStorySongsProducer *v5;
  char v6;
  PXStorySongsProducer *v7;

  v7 = (PXStorySongsProducer *)a3;
  v5 = self->_curatedSongsProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStorySongsProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_curatedSongsProducer, a3);
      -[PXStorySongsProducer setLogContext:](v7, "setLogContext:", -[PXStoryRecipeManager logContext](self, "logContext"));
      -[PXStoryRecipeManager _invalidateCuratedSongs](self, "_invalidateCuratedSongs");
    }
  }

}

- (BOOL)requiresSongsSynchronously
{
  -[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
  return 0;
}

- (void)setCuratedSongsProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *v6;

  v5 = (NSProgress *)a3;
  if (self->_curatedSongsProgress != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_curatedSongsProgress, a3);
    v5 = v6;
  }

}

- (void)setCuratedSongsResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_curatedSongsResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_curatedSongsResult, a3);
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _invalidateAutoEditDecisionLists](self, "_invalidateAutoEditDecisionLists");
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _invalidateInitialAutoEditDecisionList](self, "_invalidateInitialAutoEditDecisionList");
      -[PXStoryRecipeManager _invalidateInitialStyleProducer](self, "_invalidateInitialStyleProducer");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 16);
    }
  }

}

- (PXAudioAssetFetchResult)curatedSongs
{
  void *v2;
  void *v3;
  void *v4;

  -[PXStoryRecipeManager curatedSongsResult](self, "curatedSongsResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "curatedAudioAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAudioAssetFetchResult *)v4;
}

- (id)fallbackSongResource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXStoryRecipeManager curatedSongsResult](self, "curatedSongsResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fallbackCuratedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setMovieHighlightsProducer:(id)a3
{
  PXStoryMovieHighlightsProducer *v5;
  char v6;
  PXStoryMovieHighlightsProducer *v7;

  v7 = (PXStoryMovieHighlightsProducer *)a3;
  v5 = self->_movieHighlightsProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryMovieHighlightsProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_movieHighlightsProducer, a3);
      -[PXStoryRecipeManager setHaveFinalMovieHighlightsBeenProduced:](self, "setHaveFinalMovieHighlightsBeenProduced:", 0);
      -[PXStoryRecipeManager _invalidateMovieHighlights](self, "_invalidateMovieHighlights");
    }
  }

}

- (BOOL)requiresMovieHighlightsSynchronously
{
  -[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
  return 0;
}

- (void)setMovieHighlightsProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_movieHighlightsProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_movieHighlightsProgress = &self->_movieHighlightsProgress;
  if (*p_movieHighlightsProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_movieHighlightsProgress, "cancel");
    objc_storeStrong((id *)p_movieHighlightsProgress, a3);
    v5 = v7;
  }

}

- (void)setHaveFinalMovieHighlightsBeenProduced:(BOOL)a3
{
  if (self->_haveFinalMovieHighlightsBeenProduced != a3)
  {
    self->_haveFinalMovieHighlightsBeenProduced = a3;
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
  }
}

- (void)setMovieHighlightsResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_movieHighlightsResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_movieHighlightsResult, a3);
      -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 32);
    }
  }

}

- (void)setDetailedSaliencyProducer:(id)a3
{
  PXStoryDetailedSaliencyProducer *v5;
  char v6;
  void *v7;
  PXStoryDetailedSaliencyProducer *v8;

  v8 = (PXStoryDetailedSaliencyProducer *)a3;
  v5 = self->_detailedSaliencyProducer;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = -[PXStoryDetailedSaliencyProducer isEqual:](v8, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_detailedSaliencyProducer, a3);
      -[PXStoryRecipeManager setHasFinalDetailedSaliencyBeenProduced:](self, "setHasFinalDetailedSaliencyBeenProduced:", 0);
      -[PXStoryRecipeManager detailedSaliencyProducerMonitor](self, "detailedSaliencyProducerMonitor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "performChanges:", &__block_literal_global_162122);

      -[PXStoryRecipeManager _invalidateDetailedSaliency](self, "_invalidateDetailedSaliency");
    }
  }

}

- (BOOL)requiresDetailedSaliencySynchronously
{
  -[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
  return 0;
}

- (void)setDetailedSaliencyProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_detailedSaliencyProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_detailedSaliencyProgress = &self->_detailedSaliencyProgress;
  if (*p_detailedSaliencyProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_detailedSaliencyProgress, "cancel");
    objc_storeStrong((id *)p_detailedSaliencyProgress, a3);
    v5 = v7;
  }

}

- (void)setHasFinalDetailedSaliencyBeenProduced:(BOOL)a3
{
  if (self->_hasFinalDetailedSaliencyBeenProduced != a3)
  {
    self->_hasFinalDetailedSaliencyBeenProduced = a3;
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
  }
}

- (void)setDetailedSaliencyResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_detailedSaliencyResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_detailedSaliencyResult, a3);
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 4096);
    }
  }

}

- (void)setChapterCollectionProducer:(id)a3
{
  PXStoryChapterCollectionProducer *v5;
  char v6;
  PXStoryChapterCollectionProducer *v7;

  v7 = (PXStoryChapterCollectionProducer *)a3;
  v5 = self->_chapterCollectionProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryChapterCollectionProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_chapterCollectionProducer, a3);
      -[PXStoryRecipeManager setHasFinalChapterCollectionBeenProduced:](self, "setHasFinalChapterCollectionBeenProduced:", 0);
      -[PXStoryRecipeManager _invalidateChapterCollectionResult](self, "_invalidateChapterCollectionResult");
    }
  }

}

- (BOOL)requiresChapterCollectionSynchronously
{
  -[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
  return 0;
}

- (void)setChapterCollectionProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_chapterCollectionProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_chapterCollectionProgress = &self->_chapterCollectionProgress;
  if (*p_chapterCollectionProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_chapterCollectionProgress, "cancel");
    objc_storeStrong((id *)p_chapterCollectionProgress, a3);
    v5 = v7;
  }

}

- (void)setHasFinalChapterCollectionBeenProduced:(BOOL)a3
{
  if (self->_hasFinalChapterCollectionBeenProduced != a3)
  {
    self->_hasFinalChapterCollectionBeenProduced = a3;
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
  }
}

- (void)setChapterCollectionResult:(id)a3
{
  PXStoryProducerResult *v5;
  void *v6;
  BOOL v7;
  PXStoryProducerResult *v8;

  v8 = (PXStoryProducerResult *)a3;
  v5 = self->_chapterCollectionResult;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[PXStoryProducerResult isEqual:](v8, "isEqual:", v5);

  if (!v7)
  {
    objc_storeStrong((id *)&self->_chapterCollectionResult, a3);
    -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v8, 2048);
    -[PXStoryProducerResult object](self->_chapterCollectionResult, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setChapterCollectionManager:](self, "setChapterCollectionManager:", v6);
LABEL_4:

  }
}

- (void)setChapterCollectionManager:(id)a3
{
  PXStoryChapterCollectionManager *v5;
  PXStoryChapterCollectionManager *chapterCollectionManager;
  PXStoryChapterCollectionManager *v7;

  v5 = (PXStoryChapterCollectionManager *)a3;
  chapterCollectionManager = self->_chapterCollectionManager;
  if (chapterCollectionManager != v5)
  {
    v7 = v5;
    -[PXStoryChapterCollectionManager unregisterChangeObserver:context:](chapterCollectionManager, "unregisterChangeObserver:context:", self, ChapterCollectionManagerObservationContext);
    objc_storeStrong((id *)&self->_chapterCollectionManager, a3);
    -[PXStoryChapterCollectionManager registerChangeObserver:context:](self->_chapterCollectionManager, "registerChangeObserver:context:", self, ChapterCollectionManagerObservationContext);
    -[PXStoryRecipeManager _invalidateChapterCollection](self, "_invalidateChapterCollection");
    v5 = v7;
  }

}

- (void)setChapterCollection:(id)a3
{
  PXStoryChapterCollection *v5;
  PXStoryChapterCollection *v6;

  v5 = (PXStoryChapterCollection *)a3;
  if (self->_chapterCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_chapterCollection, a3);
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    v5 = v6;
  }

}

- (void)setOverallDurationInfo:(id *)a3
{
  $CB4B158ACF455F403B0A07378ECB5A93 *p_overallDurationInfo;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  $D70FB0A9BAA55738CF7BFE78637B0097 specificDurationInfo;
  CMTime time2;
  CMTime time1;
  _BYTE buf[48];
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  p_overallDurationInfo = &self->_overallDurationInfo;
  if (a3->var0 != self->_overallDurationInfo.kind)
    goto LABEL_5;
  v6 = *(_OWORD *)&a3->var1.var0.var3;
  v7 = *(_OWORD *)&a3->var1.var2.var0;
  *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var1.var1.var1;
  v33 = v7;
  *(_QWORD *)&v34 = a3->var1.var2.var3;
  *(_OWORD *)buf = *(_OWORD *)&a3->var1.var0.var0;
  *(_OWORD *)&buf[16] = v6;
  specificDurationInfo = self->_overallDurationInfo.specificDurationInfo;
  time1 = (CMTime)a3->var1.var0;
  time2 = (CMTime)self->_overallDurationInfo.specificDurationInfo.minimumDuration;
  if (CMTimeCompare(&time1, &time2)
    || (time1 = *(CMTime *)&buf[24],
        time2 = (CMTime)specificDurationInfo.preferredDuration,
        CMTimeCompare(&time1, &time2))
    || (*(_OWORD *)&time1.value = v33,
        time1.epoch = v34,
        time2 = (CMTime)specificDurationInfo.maximumDuration,
        CMTimeCompare(&time1, &time2)))
  {
LABEL_5:
    *(_OWORD *)&p_overallDurationInfo->kind = *(_OWORD *)&a3->var0;
    v8 = *(_OWORD *)&a3->var1.var0.var1;
    v9 = *(_OWORD *)&a3->var1.var1.var0;
    v10 = *(_OWORD *)&a3->var1.var2.var1;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a3->var1.var1.var3;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.maximumDuration.timescale = v10;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.minimumDuration.timescale = v8;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.preferredDuration.value = v9;
    -[PXStoryRecipeManager signalChange:](self, "signalChange:", 128, *(_OWORD *)&specificDurationInfo.minimumDuration.value, specificDurationInfo.minimumDuration.epoch);
    -[PXStoryRecipeManager log](self, "log");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, self);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        v14 = -[PXStoryRecipeManager logContext](self, "logContext");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v14;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PXStoryRecipeManagerChangedOverallDurationInfo", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    v15 = v11;
    v16 = os_signpost_id_make_with_pointer(v15, self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        v18 = -[PXStoryRecipeManager logContext](self, "logContext");
        v19 = *(_OWORD *)&a3->var1.var1.var3;
        *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var1.var1.var0;
        v33 = v19;
        v34 = *(_OWORD *)&a3->var1.var2.var1;
        v20 = *(_OWORD *)&a3->var1.var0.var1;
        *(_OWORD *)buf = *(_OWORD *)&a3->var0;
        *(_OWORD *)&buf[16] = v20;
        PFStoryOverallDurationInfoDescription();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_EVENT, v17, "PXStoryRecipeManagerChangedOverallDurationInfo", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);

      }
    }

    v22 = v15;
    v23 = os_signpost_id_make_with_pointer(v22, self);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v24 = v23;
      if (os_signpost_enabled(v22))
      {
        v25 = -[PXStoryRecipeManager logContext](self, "logContext");
        v26 = *(_OWORD *)&a3->var1.var1.var3;
        *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var1.var1.var0;
        v33 = v26;
        v34 = *(_OWORD *)&a3->var1.var2.var1;
        v27 = *(_OWORD *)&a3->var1.var0.var1;
        *(_OWORD *)buf = *(_OWORD *)&a3->var0;
        *(_OWORD *)&buf[16] = v27;
        PFStoryOverallDurationInfoDescription();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PXStoryRecipeManagerChangedOverallDurationInfo", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);

      }
    }

    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    -[PXStoryRecipeManager _invalidateManuallyCuratedAssets](self, "_invalidateManuallyCuratedAssets");
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
  }
}

- (void)setCurationLengthsProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_curationLengthsProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_curationLengthsProgress = &self->_curationLengthsProgress;
  if (*p_curationLengthsProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_curationLengthsProgress, "cancel");
    objc_storeStrong((id *)p_curationLengthsProgress, a3);
    v5 = v7;
  }

}

- (void)setAutoCurationProducer:(id)a3
{
  PXStoryAutoCurationProducer *v5;
  char v6;
  PXStoryAutoCurationProducer *v7;

  v7 = (PXStoryAutoCurationProducer *)a3;
  v5 = self->_autoCurationProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryAutoCurationProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_autoCurationProducer, a3);
      -[PXStoryRecipeManager _invalidateCurationLengths](self, "_invalidateCurationLengths");
    }
  }

}

- (void)setCurationLengthsResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_curationLengthsResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_curationLengthsResult, a3);
      -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
    }
  }

}

- (void)setDefaultCurationLength:(unint64_t)a3
{
  if (self->_defaultCurationLength != a3)
  {
    self->_defaultCurationLength = a3;
    -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
    -[PXStoryRecipeManager signalChange:](self, "signalChange:", 32);
  }
}

- (void)setAvailableCurationLengths:(unint64_t)a3
{
  if (self->_availableCurationLengths != a3)
  {
    self->_availableCurationLengths = a3;
    -[PXStoryRecipeManager signalChange:](self, "signalChange:", 32);
  }
}

- (void)setCuratedAssets:(id)a3
{
  id v5;
  NSString *cachedAssetsCountHUDDescription;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_areFetchResultsEqual(v5, self->_curatedAssets) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_curatedAssets, a3);
    cachedAssetsCountHUDDescription = self->_cachedAssetsCountHUDDescription;
    self->_cachedAssetsCountHUDDescription = 0;

    -[PXStoryRecipeManager _invalidateMovieHighlights](self, "_invalidateMovieHighlights");
    -[PXStoryRecipeManager _invalidateDetailedSaliency](self, "_invalidateDetailedSaliency");
    -[PXStoryRecipeManager _invalidateChapterCollectionResult](self, "_invalidateChapterCollectionResult");
    -[PXStoryRecipeManager _invalidateAutoEditDecisionListsProducer](self, "_invalidateAutoEditDecisionListsProducer");
    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    -[PXStoryRecipeManager _invalidateCurationLengths](self, "_invalidateCurationLengths");
    -[PXStoryRecipeManager _invalidateManuallyCuratedAssets](self, "_invalidateManuallyCuratedAssets");
    -[PXStoryRecipeManager _invalidateProducerMonitors](self, "_invalidateProducerMonitors");
    -[PXStoryRecipeManager log](self, "log");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = 134218240;
        v11 = -[PXStoryRecipeManager logContext](self, "logContext");
        v12 = 2048;
        v13 = objc_msgSend(v5, "count");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManagerSetCuratedAssets", "Context=%{signpost.telemetry:string2}lu curatedAssets:%ld", (uint8_t *)&v10, 0x16u);
      }
    }

  }
}

- (void)setUntruncatedCuratedAssets:(id)a3
{
  id v5;

  v5 = a3;
  if ((_areFetchResultsEqual(v5, self->_untruncatedCuratedAssets) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_untruncatedCuratedAssets, a3);
    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
  }

}

- (void)setAllAssets:(id)a3
{
  NSString *cachedAssetsCountHUDDescription;
  id v6;

  v6 = a3;
  if ((_areFetchResultsEqual(v6, self->_allAssets) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_allAssets, a3);
    cachedAssetsCountHUDDescription = self->_cachedAssetsCountHUDDescription;
    self->_cachedAssetsCountHUDDescription = 0;

    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    -[PXStoryRecipeManager _invalidateCurationLengths](self, "_invalidateCurationLengths");
  }

}

- (void)setKeyAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_keyAsset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_keyAsset, a3);
    -[PXStoryRecipeManager _invalidateChapterCollectionResult](self, "_invalidateChapterCollectionResult");
    -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    v5 = v6;
  }

}

- (void)setInitialStyleProducer:(id)a3
{
  PXStoryStylesProducer *v5;
  char v6;
  PXStoryStylesProducer *v7;

  v7 = (PXStoryStylesProducer *)a3;
  v5 = self->_initialStyleProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStylesProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_initialStyleProducer, a3);
      -[PXStoryRecipeManager setHasInitialStyleBeenProduced:](self, "setHasInitialStyleBeenProduced:", 0);
      -[PXStoryRecipeManager _invalidateInitialStyle](self, "_invalidateInitialStyle");
    }
  }

}

- (BOOL)requiresInitialStyleSynchronously
{
  return !-[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
}

- (void)setInitialStyleProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_initialStyleProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_initialStyleProgress = &self->_initialStyleProgress;
  if (*p_initialStyleProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_initialStyleProgress, "cancel");
    objc_storeStrong((id *)p_initialStyleProgress, a3);
    v5 = v7;
  }

}

- (void)setInitialStyleResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_initialStyleResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_initialStyleResult, a3);
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 64);
    }
  }

}

- (void)setAutoEditDecisionListsProducer:(id)a3
{
  PXStoryAutoEditDecisionListsProducer *v5;
  char v6;
  PXStoryAutoEditDecisionListsProducer *v7;

  v7 = (PXStoryAutoEditDecisionListsProducer *)a3;
  v5 = self->_autoEditDecisionListsProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryAutoEditDecisionListsProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_autoEditDecisionListsProducer, a3);
      -[PXStoryRecipeManager _invalidateAutoEditDecisionLists](self, "_invalidateAutoEditDecisionLists");
      -[PXStoryRecipeManager _invalidateAdditionalAutoEditDecisionLists](self, "_invalidateAdditionalAutoEditDecisionLists");
      -[PXStoryRecipeManager _invalidateInitialAutoEditDecisionList](self, "_invalidateInitialAutoEditDecisionList");
    }
  }

}

- (BOOL)requiresAutoEditDecisionListsSynchronously
{
  -[PXStoryRecipeManager shouldAvoidSynchronousProductions](self, "shouldAvoidSynchronousProductions");
  return 0;
}

- (void)setAutoEditDecisionListsProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_autoEditDecisionListsProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_autoEditDecisionListsProgress = &self->_autoEditDecisionListsProgress;
  if (*p_autoEditDecisionListsProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_autoEditDecisionListsProgress, "cancel");
    objc_storeStrong((id *)p_autoEditDecisionListsProgress, a3);
    v5 = v7;
  }

}

- (void)setAutoEditDecisionListsResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_autoEditDecisionListsResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_autoEditDecisionListsResult, a3);
      -[PXStoryRecipeManager _invalidateAutoEditStylesProducer](self, "_invalidateAutoEditStylesProducer");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 512);
    }
  }

}

- (void)setAutoEditStylesProducer:(id)a3
{
  PXStoryStylesProducer *v5;
  char v6;
  PXStoryStylesProducer *v7;

  v7 = (PXStoryStylesProducer *)a3;
  v5 = self->_autoEditStylesProducer;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStylesProducer isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_autoEditStylesProducer, a3);
      -[PXStoryRecipeManager _updateAutoEditStyles](self, "_updateAutoEditStyles");
    }
  }

}

- (void)setAutoEditStylesProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_autoEditStylesProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_autoEditStylesProgress = &self->_autoEditStylesProgress;
  if (*p_autoEditStylesProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_autoEditStylesProgress, "cancel");
    objc_storeStrong((id *)p_autoEditStylesProgress, a3);
    v5 = v7;
  }

}

- (void)setAutoEditStylesResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_autoEditStylesResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_autoEditStylesResult, a3);
      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
      -[PXStoryRecipeManager _handleResult:forProducer:](self, "_handleResult:forProducer:", v7, 128);
    }
  }

}

- (void)setRecipe:(id)a3
{
  PXStoryRecipe *v5;
  PXStoryRecipe *v6;
  PXStoryRecipe *v7;
  char v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  PXStoryRecipe *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (PXStoryRecipe *)a3;
  v6 = self->_recipe;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryRecipe isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_recipe, a3);
      -[PXStoryRecipeManager _invalidateRecipeAttributes](self, "_invalidateRecipeAttributes");
      -[PXStoryRecipeManager signalChange:](self, "signalChange:", 1);
      -[PXStoryRecipeManager log](self, "log");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          v24 = 134217984;
          v25 = -[PXStoryRecipeManager logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PXStoryRecipeManagerChangedRecipe", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v24, 0xCu);
        }
      }

      v12 = v9;
      v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          v15 = -[PXStoryRecipeManager logContext](self, "logContext");
          -[PXStoryRecipe curatedAssets](v5, "curatedAssets");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          v24 = 134218496;
          v25 = v15;
          v26 = 2048;
          v27 = v5;
          v28 = 2048;
          v29 = v17;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryRecipeManagerChangedRecipe", "Context=%{signpost.telemetry:string2}lu %p curatedAssets:%ld", (uint8_t *)&v24, 0x20u);

        }
      }

      v18 = v12;
      v19 = os_signpost_id_make_with_pointer(v18, self);
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v20 = v19;
        if (os_signpost_enabled(v18))
        {
          v21 = -[PXStoryRecipeManager logContext](self, "logContext");
          -[PXStoryRecipe curatedAssets](v5, "curatedAssets");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");
          v24 = 134218496;
          v25 = v21;
          v26 = 2048;
          v27 = v5;
          v28 = 2048;
          v29 = v23;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PXStoryRecipeManagerChangedRecipe", "Context=%{signpost.telemetry:string2}lu %p curatedAssets:%ld", (uint8_t *)&v24, 0x20u);

        }
      }

    }
  }

}

- (void)setIsRecipeFinal:(BOOL)a3
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
  if (self->_isRecipeFinal != a3)
  {
    v3 = a3;
    self->_isRecipeFinal = a3;
    -[PXStoryRecipeManager signalChange:](self, "signalChange:", 2);
    -[PXStoryRecipeManager log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v16 = 134217984;
        v17 = -[PXStoryRecipeManager logContext](self, "logContext");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryRecipeManagerChangedIsRecipeFinal", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    v8 = v5;
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = -[PXStoryRecipeManager logContext](self, "logContext");
        v16 = 134218240;
        v17 = v11;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryRecipeManagerChangedIsRecipeFinal", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    v12 = v8;
    v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = -[PXStoryRecipeManager logContext](self, "logContext");
        v16 = 134218240;
        v17 = v15;
        v18 = 1024;
        v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManagerChangedIsRecipeFinal", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

  }
}

- (void)setRecipeAttributes:(unint64_t)a3
{
  unint64_t recipeAttributes;
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
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  recipeAttributes = self->_recipeAttributes;
  if (recipeAttributes == a3)
    return;
  if ((recipeAttributes & 2) == 0 || !(((self->_recipeAttributes & 1) == 0) | a3 & 1))
  {
    if ((((self->_recipeAttributes & 2) == 0) & (((self->_recipeAttributes & 1) == 0) | a3)) != 0)
      goto LABEL_10;
LABEL_7:
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PXStoryComponentAttributesDescription(recipeAttributes);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryComponentAttributesDescription(a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 138412546;
      *(_QWORD *)&v31[4] = v29;
      v32 = 2112;
      v33 = v30;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Invalid story component attributes change (%@ -> %@)", v31, 0x16u);

    }
    -[PXStoryRecipeManager errorReporter](self, "errorReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Invalid timeline attributes change."), v8, v9, v10, v11, v12, v13, *(uint64_t *)v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:forComponent:", v14, CFSTR("Timeline Manager"));

    goto LABEL_10;
  }
  if ((a3 & 2) == 0)
    goto LABEL_7;
LABEL_10:
  self->_recipeAttributes = a3;
  -[PXStoryRecipeManager signalChange:](self, "signalChange:", 4);
  -[PXStoryRecipeManager log](self, "log");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, self);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v15))
    {
      v18 = -[PXStoryRecipeManager logContext](self, "logContext");
      *(_DWORD *)v31 = 134217984;
      *(_QWORD *)&v31[4] = v18;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PXStoryRecipeManagerChangedRecipeAttributes", "Context=%{signpost.telemetry:string2}lu ", v31, 0xCu);
    }
  }

  v19 = v15;
  v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      v22 = -[PXStoryRecipeManager logContext](self, "logContext");
      PXStoryComponentAttributesDescription(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 134218242;
      *(_QWORD *)&v31[4] = v22;
      v32 = 2114;
      v33 = v23;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_EVENT, v21, "PXStoryRecipeManagerChangedRecipeAttributes", "Context=%{signpost.telemetry:string2}lu %{public}@", v31, 0x16u);

    }
  }

  v24 = v19;
  v25 = os_signpost_id_make_with_pointer(v24, self);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v26 = v25;
    if (os_signpost_enabled(v24))
    {
      v27 = -[PXStoryRecipeManager logContext](self, "logContext");
      PXStoryComponentAttributesDescription(a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 134218242;
      *(_QWORD *)&v31[4] = v27;
      v32 = 2114;
      v33 = v28;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PXStoryRecipeManagerChangedRecipeAttributes", "Context=%{signpost.telemetry:string2}lu %{public}@", v31, 0x16u);

    }
  }

  -[PXStoryRecipeManager setIsRecipeFinal:](self, "setIsRecipeFinal:", (self->_recipeAttributes >> 1) & 1);
}

- (void)_handleResult:(id)a3 forProducer:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXStoryRecipeManager setProducersWithInitialResults:](self, "setProducersWithInitialResults:", -[PXStoryRecipeManager producersWithInitialResults](self, "producersWithInitialResults") | a4);
  if (objc_msgSend(v6, "isDegraded"))
    v7 = -[PXStoryRecipeManager finalizedProducers](self, "finalizedProducers") & ~a4;
  else
    v7 = -[PXStoryRecipeManager finalizedProducers](self, "finalizedProducers") | a4;
  -[PXStoryRecipeManager setFinalizedProducers:](self, "setFinalizedProducers:", v7);
  objc_msgSend(v6, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0D09910];
    v18 = *MEMORY[0x1E0D09838];
    v19[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:withPayload:", CFSTR("com.apple.photos.memory.interactiveMemoryRecipeErrorOccurred"), v11);

  }
  -[PXStoryRecipeManager errorReporter](self, "errorReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryProducerName(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setError:forComponent:", v9, v13);

  -[PXStoryRecipeManager _monitorForProducer:](self, "_monitorForProducer:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__PXStoryRecipeManager__handleResult_forProducer___block_invoke;
  v16[3] = &unk_1E5130078;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v14, "performChanges:", v16);

}

- (void)setRecipeAssetEdits:(id)a3
{
  PXStoryRecipeAssetEdits *v5;
  PXStoryRecipeAssetEdits *v6;
  PXStoryRecipeAssetEdits *v7;
  BOOL v8;
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
  PXStoryRecipeAssetEdits *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (PXStoryRecipeAssetEdits *)a3;
  v6 = self->_recipeAssetEdits;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryRecipeAssetEdits isEqual:](v6, "isEqual:", v5);

    if (!v8)
    {
      objc_storeStrong((id *)&self->_recipeAssetEdits, a3);
      -[PXStoryRecipeManager signalChange:](self, "signalChange:", 64);
      -[PXStoryRecipeManager log](self, "log");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          v20 = 134217984;
          v21 = -[PXStoryRecipeManager logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PXStoryRecipeManagerChangedAssetEdits", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
        }
      }

      v12 = v9;
      v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          v15 = -[PXStoryRecipeManager logContext](self, "logContext");
          v20 = 134218242;
          v21 = v15;
          v22 = 2114;
          v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryRecipeManagerChangedAssetEdits", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

      v16 = v12;
      v17 = os_signpost_id_make_with_pointer(v16, self);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v18 = v17;
        if (os_signpost_enabled(v16))
        {
          v19 = -[PXStoryRecipeManager logContext](self, "logContext");
          v20 = 134218242;
          v21 = v19;
          v22 = 2114;
          v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryRecipeManagerChangedAssetEdits", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

      -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
    }
  }

}

- (void)setPersistedRecipeAssetEdits:(id)a3
{
  PXStoryRecipeAssetEdits *v5;
  PXStoryRecipeAssetEdits **p_persistedRecipeAssetEdits;
  PXStoryRecipeAssetEdits *v7;
  PXStoryRecipeAssetEdits *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int ResultsEqual;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[5];

  v5 = (PXStoryRecipeAssetEdits *)a3;
  p_persistedRecipeAssetEdits = &self->_persistedRecipeAssetEdits;
  v7 = self->_persistedRecipeAssetEdits;
  if (v7 == v5)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[PXStoryRecipeAssetEdits isEqual:](v7, "isEqual:", v5);

    if (!v9)
    {
      -[PXStoryRecipeAssetEdits userCuratedAssets](*p_persistedRecipeAssetEdits, "userCuratedAssets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeAssetEdits userCuratedAssets](v5, "userCuratedAssets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ResultsEqual = _areFetchResultsEqual(v10, v11);

      if (ResultsEqual)
      {
        -[PXStoryRecipeAssetEdits keyAsset](*p_persistedRecipeAssetEdits, "keyAsset");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[PXStoryRecipeAssetEdits keyAsset](v5, "keyAsset");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
        {

          objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, a3);
          -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
          goto LABEL_11;
        }
        v15 = v14;
        v16 = objc_msgSend(v13, "isEqual:", v14);

        objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, a3);
        -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
        if ((v16 & 1) != 0)
          goto LABEL_11;
      }
      else
      {
        objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, a3);
        -[PXStoryRecipeManager _invalidateOverallDurationInfo](self, "_invalidateOverallDurationInfo");
      }
      -[PXStoryRecipeManager assetsDataSourceManager](self, "assetsDataSourceManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __53__PXStoryRecipeManager_setPersistedRecipeAssetEdits___block_invoke;
      v18[3] = &unk_1E5145F88;
      v18[4] = self;
      objc_msgSend(v17, "performChanges:", v18);

    }
  }
LABEL_11:

}

- (void)applyTargetOverallDurationInfo:(id *)a3
{
  int64_t var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  uint64_t *v40;
  id v41[4];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  id location;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int64_t v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  if (!a3->var0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeManager.m"), 1183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetOverallDurationInfo.kind != PFStoryOverallDurationKindUndefined"));

    var0 = a3->var0;
  }
  if (var0 == 2)
  {
    -[PXStoryRecipeManager manuallyCuratedAssets](self, "manuallyCuratedAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PXStoryRecipeManager manuallyCuratedAssets](self, "manuallyCuratedAssets");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager applyCustomUserAssets:](self, "applyCustomUserAssets:", v34);

    }
    else
    {
      PXAssertGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v47) = 0;
        _os_log_error_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "Attempting to switch back to manual custom curation without any stored, this is not supported.", (uint8_t *)&v47, 2u);
      }

    }
  }
  else
  {
    +[PXProgressIndicatorAlertController beginShowingModalProgressWithConfiguration:](PXProgressIndicatorAlertController, "beginShowingModalProgressWithConfiguration:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__161771;
    v56 = __Block_byref_object_dispose__161772;
    v57 = 0;
    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (char *)PXSyncCallbackBegin();

    -[PXStoryRecipeManager log](self, "log");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
    v13 = v11;
    v14 = v13;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v15 = a3->var0;
      v16 = *(_OWORD *)&a3->var0;
      v48 = *(_OWORD *)&a3->var1.var0.var1;
      v17 = *(_OWORD *)&a3->var1.var1.var3;
      v49 = *(_OWORD *)&a3->var1.var1.var0;
      v50 = v17;
      v51 = *(_OWORD *)&a3->var1.var2.var1;
      v47 = v16;
      PFStoryOverallDurationInfoDescription();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v60 = v12;
      v61 = 1024;
      v62 = 1000;
      v63 = 2048;
      v64 = v15;
      v65 = 2114;
      v66 = v18;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "PXStoryRecipeCuratedAssets", "Context=%{signpost.telemetry:string2}lu Goal=%{signpost.description:attribute}d Kind=%{signpost.description:attribute}ld TargetOverallDuration=%{signpost.description:attribute,public}@", buf, 0x26u);

    }
    _ProducerRequestBegin(self, "CuratedAssets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager autoCurationProducer](self, "autoCurationProducer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __55__PXStoryRecipeManager_applyTargetOverallDurationInfo___block_invoke;
    v35[3] = &unk_1E51300C8;
    v41[1] = v10;
    v21 = v8;
    v36 = v21;
    v22 = v14;
    v37 = v22;
    v41[2] = v12;
    v41[3] = v10;
    v23 = v19;
    v38 = v23;
    v40 = &v52;
    objc_copyWeak(v41, &location);
    v24 = *(_OWORD *)&a3->var1.var0.var1;
    v42 = *(_OWORD *)&a3->var0;
    v43 = v24;
    v25 = *(_OWORD *)&a3->var1.var1.var3;
    v44 = *(_OWORD *)&a3->var1.var1.var0;
    v45 = v25;
    v46 = *(_OWORD *)&a3->var1.var2.var1;
    v26 = v7;
    v39 = v26;
    v27 = *(_OWORD *)&a3->var0;
    v48 = *(_OWORD *)&a3->var1.var0.var1;
    v28 = *(_OWORD *)&a3->var1.var1.var3;
    v49 = *(_OWORD *)&a3->var1.var1.var0;
    v50 = v28;
    v51 = *(_OWORD *)&a3->var1.var2.var1;
    v47 = v27;
    objc_msgSend(v20, "requestCuratedAssetsWithOptions:targetOverallDurationInfo:resultHandler:", 0, &v47, v35);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v53[5];
    v53[5] = v29;

    -[PXStoryRecipeManager setAssetsAutoCurationProgress:](self, "setAssetsAutoCurationProgress:", v53[5]);
    objc_destroyWeak(v41);

    _Block_object_dispose(&v52, 8);
    objc_destroyWeak(&location);

  }
}

- (void)setAssetsAutoCurationProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_assetsAutoCurationProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_assetsAutoCurationProgress = &self->_assetsAutoCurationProgress;
  if (*p_assetsAutoCurationProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_assetsAutoCurationProgress, "cancel");
    objc_storeStrong((id *)p_assetsAutoCurationProgress, a3);
    v5 = v7;
  }

}

- (void)_handleCuratedAssetsResult:(id)a3 targetOverallDurationInfo:(id *)a4
{
  id v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v6 = a3;
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = (uint64_t)__77__PXStoryRecipeManager__handleCuratedAssetsResult_targetOverallDurationInfo___block_invoke;
    v21[3] = (uint64_t)&unk_1E51300F0;
    v21[4] = (uint64_t)self;
    v8 = *(_OWORD *)&a4->var1.var1.var3;
    v25 = *(_OWORD *)&a4->var1.var1.var0;
    v26 = v8;
    v27 = *(_OWORD *)&a4->var1.var2.var1;
    v9 = *(_OWORD *)&a4->var1.var0.var1;
    v23 = *(_OWORD *)&a4->var0;
    v24 = v9;
    v22 = v6;
    -[PXStoryRecipeManager performChanges:](self, "performChanges:", v21);

  }
  else
  {
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    if (v10)
    {
      v18 = v10;
    }
    else
    {
      PXStoryErrorCreateWithCodeDebugFormat(16, CFSTR("Target Duration Curation Failed"), v11, v12, v13, v14, v15, v16, v21[0]);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    -[PXStoryRecipeManager errorReporter](self, "errorReporter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setError:forComponent:", v19, CFSTR("TargetDurationCuration"));

  }
}

- (void)applyManuallyCuratedAssets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  -[PXStoryRecipeManager recipeAssetEdits](self, "recipeAssetEdits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customUserAssetsEdit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") > 0;

  -[PXStoryRecipeManager _applyManuallyCuratedAssets:setAsCustomUserAssets:](self, "_applyManuallyCuratedAssets:setAsCustomUserAssets:", v8, v7);
}

- (void)applyCustomUserAssets:(id)a3
{
  -[PXStoryRecipeManager _applyManuallyCuratedAssets:setAsCustomUserAssets:](self, "_applyManuallyCuratedAssets:setAsCustomUserAssets:", a3, 1);
}

- (void)_applyManuallyCuratedAssets:(id)a3 setAsCustomUserAssets:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_manuallyCuratedAssets, a3);
  v8 = *MEMORY[0x1E0D759A0];
  v19 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 16);
  v9 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 48);
  v20 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 32);
  v21 = v9;
  v22 = *(_QWORD *)(MEMORY[0x1E0D759A0] + 64);
  v18 = v8;
  -[PXStoryRecipeManager recipeAssetEdits](self, "recipeAssetEdits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 2;
  v11 = (void *)objc_msgSend(v10, "copyWithOverallDurationInfo:userCuratedAssets:", &v17, v7);

  if (v4)
  {
    v12 = objc_msgSend(v11, "copyWithCustomUserAssets:", v7);

    v11 = (void *)v12;
  }
  -[PXStoryRecipeManager assetsDataSource](self, "assetsDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") >= 1 && v14 && (objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "copyWithKeyAsset:", v15);

    v11 = (void *)v16;
  }
  -[PXStoryRecipeManager setRecipeAssetEdits:](self, "setRecipeAssetEdits:", v11);

}

- (void)applyManuallyRemovedAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v6, "removeIndex:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  PXDisplayAssetFetchResultSubfetchResultWithIndexSet();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager applyManuallyCuratedAssets:](self, "applyManuallyCuratedAssets:", v13);

}

- (void)applyKeyAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXStoryRecipeManager recipeAssetEdits](self, "recipeAssetEdits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copyWithKeyAsset:", v4);

  -[PXStoryRecipeManager setRecipeAssetEdits:](self, "setRecipeAssetEdits:", v5);
}

- (void)ensureAutoEditDecisionListForSong:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29[4];
  id location;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryRecipeManager additionalSongs](self, "additionalSongs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v5, "setByAddingObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setAdditionalSongs:](self, "setAdditionalSongs:", v6);

    objc_initWeak(&location, self);
    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (char *)PXSyncCallbackBegin();

    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager log](self, "log");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
    v12 = v10;
    v13 = v12;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 134218240;
      v32 = v11;
      v33 = 2048;
      v34 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v8, "PXStoryRecipeSingleAdditionalAutoEditDecisionList", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
    }

    _ProducerRequestBegin(self, "SingleAdditionalAutoEditDecisionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager autoEditDecisionListsProducer](self, "autoEditDecisionListsProducer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXAudioAssetFetchResultWithAsset(v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __58__PXStoryRecipeManager_ensureAutoEditDecisionListForSong___block_invoke;
    v25 = &unk_1E5130140;
    v29[1] = v8;
    v17 = v9;
    v26 = v17;
    v18 = v13;
    v27 = v18;
    v29[2] = v11;
    v29[3] = v8;
    v19 = v14;
    v28 = v19;
    objc_copyWeak(v29, &location);
    v20 = (id)objc_msgSend(v15, "requestAutoEditDecisionListsWithOptions:songs:colorGradeCategoriesBySong:resultHandler:", 4, v16, 0, &v22);

    -[PXStoryRecipeManager storyQueue](self, "storyQueue", v22, v23, v24, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PXSyncCallbackEnd();

    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
  }

}

- (void)_invalidateAdditionalAutoEditDecisionLists
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAdditionalAutoEditDecisionLists);

}

- (void)_updateAdditionalAutoEditDecisionLists
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27[4];
  id location;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PXStoryRecipeManager additionalSongs](self, "additionalSongs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_initWeak(&location, self);
    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (char *)PXSyncCallbackBegin();

    -[PXStoryRecipeManager storyQueue](self, "storyQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager log](self, "log");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
    v9 = v7;
    v10 = v9;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 134218240;
      v30 = v8;
      v31 = 2048;
      v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "PXStoryRecipeAdditionalAutoEditDecisionLists", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
    }

    _ProducerRequestBegin(self, "AdditionalAutoEditDecisionLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager autoEditDecisionListsProducer](self, "autoEditDecisionListsProducer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXAudioAssetFetchResultWithArray(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __62__PXStoryRecipeManager__updateAdditionalAutoEditDecisionLists__block_invoke;
    v23 = &unk_1E5130140;
    v27[1] = v5;
    v15 = v6;
    v24 = v15;
    v16 = v10;
    v25 = v16;
    v27[2] = v8;
    v27[3] = v5;
    v17 = v11;
    v26 = v17;
    objc_copyWeak(v27, &location);
    v18 = (id)objc_msgSend(v12, "requestAutoEditDecisionListsWithOptions:songs:colorGradeCategoriesBySong:resultHandler:", 0, v14, 0, &v20);

    -[PXStoryRecipeManager storyQueue](self, "storyQueue", v20, v21, v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXSyncCallbackEnd();

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }

}

- (void)_handleAdditionalAutoEditDecisionListsResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  PXStoryRecipeManager *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryRecipeManager additionalAutoEditDecisionListsBySong](self, "additionalAutoEditDecisionListsBySong");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = v4;
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "song");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);
        }
        else
        {
          PLStoryGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v26 = self;
            v27 = 2112;
            v28 = v12;
            _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "%@ received additional AEDL with no song! %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__PXStoryRecipeManager__handleAdditionalAutoEditDecisionListsResult___block_invoke;
  v18[3] = &unk_1E5130168;
  v18[4] = self;
  v19 = v17;
  v20 = v6;
  v15 = v6;
  v16 = v17;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v18);

}

- (void)setAdditionalAutoEditDecisionListsBySong:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *additionalAutoEditDecisionListsBySong;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_additionalAutoEditDecisionListsBySong;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      additionalAutoEditDecisionListsBySong = self->_additionalAutoEditDecisionListsBySong;
      self->_additionalAutoEditDecisionListsBySong = v6;

      -[PXStoryRecipeManager _invalidateRecipe](self, "_invalidateRecipe");
    }
  }

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
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
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  PXStoryRecipeManager *v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PXStoryRecipeManager diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", 3, *MEMORY[0x1E0C9D820], v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "addAttachmentWithText:name:", v7, CFSTR("recipe_manager_diagnostic"));
  -[PXStoryRecipeManager diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", 9, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "addAttachmentWithText:name:", v8, CFSTR("moments_diagnostic"));
  v48 = (void *)v8;
  -[PXStoryRecipeManager diagnosticsMomentsProvider](self, "diagnosticsMomentsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_diagnosticSwiftCodeForMomentsUnitTest");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "addAttachmentWithSwiftCode:name:", v10, CFSTR("moments_testcase"));
  -[PXStoryRecipeManager diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", 8, v5, v6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "addAttachmentWithText:name:", v11, CFSTR("autoedit_diagnostic"));
  v46 = (void *)v11;
  -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recipe");
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D752B0]);
    objc_msgSend(v15, "archivedJSONDataWithRecipe:options:", v14, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAttachmentWithData:name:", v16, CFSTR("recipe.json"));

  }
  v47 = (void *)v10;
  v50 = (void *)v7;
  -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0x1E0CB3000uLL;
  v45 = (void *)v14;
  if (v19)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "song");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pace");
    PFStoryRecipeSongPaceDescription();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "colorGradeCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("autoEdit_decisionList_%d_%@_%@"), 0, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "diagnosticDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAttachmentWithText:name:", v26, v25);

    objc_msgSend(v19, "decisionPapertrail");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAttachmentWithText:name:", v27, CFSTR("autoedit_papertrail"));

    v53 = 1;
  }
  else
  {
    v53 = 0;
  }
  v44 = v19;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v49 = self;
  -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "object");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v29;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v30)
  {
    v31 = v30;
    v52 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        v33 = v4;
        if (*(_QWORD *)v55 != v52)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v35 = *(void **)(v20 + 2368);
        objc_msgSend(v34, "song");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "pace");
        PFStoryRecipeSongPaceDescription();
        v37 = v20;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "colorGradeCategory");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("autoEdit_decisionList_%d_%@_%@"), v53 + i, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v37;
        objc_msgSend(v34, "diagnosticDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v33;
        objc_msgSend(v33, "addAttachmentWithText:name:", v41, v40);

      }
      v53 = (v53 + i);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v31);
  }

  -[PXStoryRecipeManager autoEditDecisionListsProducer](v49, "autoEditDecisionListsProducer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v42);

  -[PXStoryRecipeManager recipe](v49, "recipe");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v43);

}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;
  if (-[PXStoryAutoEditDecisionListsProducer handlesDiagnosticTextForHUDType:](self->_autoEditDecisionListsProducer, "handlesDiagnosticTextForHUDType:"))-[PXStoryAutoEditDecisionListsProducer diagnosticTextForHUDType:displaySize:](self->_autoEditDecisionListsProducer, "diagnosticTextForHUDType:displaySize:", a3, width, height);
  else
    -[PXStoryRecipeManager _diagnosticTextForGenericHUDAtDisplaySize:](self, "_diagnosticTextForGenericHUDAtDisplaySize:", width, height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_diagnosticTextForGenericHUDAtDisplaySize:(CGSize)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, const __CFString *, void *, void *, _QWORD *);
  void *v8;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD aBlock[4];
  id v40;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (_diagnosticTextForGenericHUDAtDisplaySize__onceToken != -1)
    dispatch_once(&_diagnosticTextForGenericHUDAtDisplaySize__onceToken, &__block_literal_global_274_161953);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_2;
  aBlock[3] = &unk_1E51301B0;
  v6 = v4;
  v40 = v6;
  v7 = (void (**)(void *, const __CFString *, void *, void *, _QWORD *))_Block_copy(aBlock);
  -[PXStoryRecipeManager assetsProgress](self, "assetsProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager assetsResult](self, "assetsResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_3;
  v38[3] = &unk_1E51301D8;
  v38[4] = self;
  v7[2](v7, CFSTR("Assets"), v8, v9, v38);

  -[PXStoryRecipeManager persistableRecipeProgress](self, "persistableRecipeProgress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v5;
  v37[1] = 3221225472;
  v37[2] = __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_4;
  v37[3] = &unk_1E5130200;
  v37[4] = self;
  v7[2](v7, CFSTR("Previously Persisted Recipe"), v10, v11, v37);

  -[PXStoryRecipeManager persistedSongProgress](self, "persistedSongProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Persisted Song"), v12, v13, __block_literal_global_323_161955);

  -[PXStoryRecipeManager initialAutoEditDecisionListProgress](self, "initialAutoEditDecisionListProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Initial EDL"), v14, v15, __block_literal_global_329);

  -[PXStoryRecipeManager initialStyleProgress](self, "initialStyleProgress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager initialStyleResult](self, "initialStyleResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Persisted Style"), v16, v17, __block_literal_global_337);

  -[PXStoryRecipeManager curatedSongsProgress](self, "curatedSongsProgress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager curatedSongsResult](self, "curatedSongsResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Curated Songs"), v18, v19, __block_literal_global_343_161957);

  -[PXStoryRecipeManager autoEditDecisionListsProgress](self, "autoEditDecisionListsProgress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Auto EDLs"), v20, v21, __block_literal_global_348_161959);

  -[PXStoryRecipeManager autoEditStylesProgress](self, "autoEditStylesProgress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager autoEditStylesResult](self, "autoEditStylesResult");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Auto Edit Styles"), v22, v23, __block_literal_global_353);

  PXStoryComponentAttributesDescription(-[PXStoryRecipeManager recipeAttributes](self, "recipeAttributes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\nAttributes: %@\n"), v24);

  -[PXStoryRecipeManager loadingReadyForPlaybackDate](self, "loadingReadyForPlaybackDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter;
    -[PXStoryRecipeManager loadingReadyForPlaybackDate](self, "loadingReadyForPlaybackDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager loadingStartDate](self, "loadingStartDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v28);
    objc_msgSend(v26, "stringFromTimeInterval:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\nReady For Playback In: %@\n"), v29);

  }
  -[PXStoryRecipeManager loadingFinalDate](self, "loadingFinalDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = (void *)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter;
    -[PXStoryRecipeManager loadingFinalDate](self, "loadingFinalDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager loadingStartDate](self, "loadingStartDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceDate:", v33);
    objc_msgSend(v31, "stringFromTimeInterval:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\nFinal In: %@\n"), v34);

  }
  v35 = (void *)objc_msgSend(v6, "copy");

  return v35;
}

- (id)_shortDescriptionOfPersistableRecipe:(id)a3
{
  id v3;
  id v4;
  id v5;
  void (**v6)(void *, uint64_t, const __CFString *);
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXStoryRecipeManager__shortDescriptionOfPersistableRecipe___block_invoke;
  aBlock[3] = &unk_1E51485D8;
  v5 = v4;
  v13 = v5;
  v6 = (void (**)(void *, uint64_t, const __CFString *))_Block_copy(aBlock);
  v6[2](v6, objc_msgSend(v3, "numberOfAssets"), CFSTR("assets"));
  objc_msgSend(v3, "currentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("Y\n");
  if (!v7)
    v8 = CFSTR("N\n");
  objc_msgSend(v5, "appendFormat:", CFSTR("Custom Style?: %@"), v8);

  v6[2](v6, objc_msgSend(v3, "numberOfPresentations"), CFSTR("presentations"));
  objc_msgSend(v3, "autoEditDecisionLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, objc_msgSend(v9, "count"), CFSTR("AEDLs"));

  if (v3)
    objc_msgSend(v3, "overallDurationInfo");
  objc_msgSend(v5, "appendFormat:", CFSTR("v%li.%li"), objc_msgSend(v3, "majorVersion"), objc_msgSend(v3, "minorVersion"));
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void (**v4)(void *, const __CFString *, void *);
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD aBlock[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__161771;
  v28 = __Block_byref_object_dispose__161772;
  v29 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXStoryRecipeManager_diagnosticErrorsByComponentForHUDType___block_invoke;
  aBlock[3] = &unk_1E5130368;
  aBlock[4] = &v24;
  v4 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  -[PXStoryRecipeManager assetsResult](self, "assetsResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Assets"), v6);

  -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Persistable Recipe"), v8);

  -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Persisted Song"), v10);

  -[PXStoryRecipeManager curatedSongsResult](self, "curatedSongsResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Curated Songs"), v12);

  -[PXStoryRecipeManager initialStyleResult](self, "initialStyleResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Initial Style"), v14);

  -[PXStoryRecipeManager autoEditStylesResult](self, "autoEditStylesResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("AE Styles"), v16);

  -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Initial EDL"), v18);

  -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "error");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Auto EDL"), v20);

  v21 = (void *)objc_msgSend((id)v25[5], "copy");
  _Block_object_dispose(&v24, 8);

  return v21;
}

- (PXStoryAutoEditMomentsProvider)diagnosticsMomentsProvider
{
  void *v2;
  void *v3;

  -[PXStoryRecipeManager autoEditDecisionListsProducer](self, "autoEditDecisionListsProducer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "diagnosticsMomentsProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (PXStoryAutoEditMomentsProvider *)v3;
}

- (void)_setNeedsUpdate
{
  -[PXStoryRecipeManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateAssetCollection
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetCollection);

}

- (void)_updateAssetCollection
{
  void *v3;
  id v4;

  -[PXStoryRecipeManager assetsDataSource](self, "assetsDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager setAssetCollection:](self, "setAssetCollection:", v3);

}

- (void)_invalidateAssetsProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetsProducer);

}

- (void)_updateAssetsProducer
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryRecipeManager assetsProducerFactory](self, "assetsProducerFactory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsProducerForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager setAssetsProducer:](self, "setAssetsProducer:", v4);

}

- (void)_invalidateAssets
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssets);

}

- (void)_updateAssets
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  uint64_t *v23;
  id v24[4];
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161771;
  v30 = __Block_byref_object_dispose__161772;
  v31 = 0;
  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "options") & 1) == 0;

  if (v4)
    v5 = -[PXStoryRecipeManager requiresAssetsSynchronously](self, "requiresAssetsSynchronously");
  else
    v5 = 2;
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager log](self, "log");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v10 = v8;
  v11 = v10;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218240;
    v33 = v9;
    v34 = 2048;
    v35 = v5;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "PXStoryRecipeAssets", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "Assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager assetsProducer](self, "assetsProducer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__PXStoryRecipeManager__updateAssets__block_invoke;
  v19[3] = &unk_1E5135250;
  v24[1] = v7;
  v14 = v6;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v24[2] = v9;
  v24[3] = v7;
  v16 = v12;
  v22 = v16;
  v23 = &v26;
  objc_copyWeak(v24, &location);
  objc_msgSend(v13, "requestAssetsWithOptions:storyQueue:resultHandler:", v5, v14, v19);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v27[5];
  v27[5] = v17;

  PXSyncCallbackEnd();
  -[PXStoryRecipeManager setAssetsProgress:](self, "setAssetsProgress:", v27[5]);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

}

- (void)_handleAssetsResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PXStoryRecipeManager__handleAssetsResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidatePersistableRecipeProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistableRecipeProducer);

}

- (void)_updatePersistableRecipeProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager persistableRecipeProducerFactory](self, "persistableRecipeProducerFactory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistableRecipeProducerForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setPersistableRecipeProducer:](self, "setPersistableRecipeProducer:", v6);

  }
}

- (void)_invalidatePersistableRecipe
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistableRecipe);

}

- (void)_updatePersistableRecipe
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  uint64_t *v23;
  id v24[4];
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161771;
  v30 = __Block_byref_object_dispose__161772;
  v31 = 0;
  v3 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
  v4 = -[PXStoryRecipeManager requiresPersistableRecipeSynchronously](self, "requiresPersistableRecipeSynchronously");
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager log](self, "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v9 = v3 | v4;
  v10 = v7;
  v11 = v10;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218240;
    v33 = v8;
    v34 = 2048;
    v35 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "PXStoryRecipePersistableRecipe", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "PersistableRecipe");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager persistableRecipeProducer](self, "persistableRecipeProducer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__PXStoryRecipeManager__updatePersistableRecipe__block_invoke;
  v19[3] = &unk_1E5135250;
  v24[1] = v6;
  v14 = v5;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v24[2] = v8;
  v24[3] = v6;
  v16 = v12;
  v22 = v16;
  v23 = &v26;
  objc_copyWeak(v24, &location);
  objc_msgSend(v13, "requestPersistableRecipeWithOptions:resultHandler:", v9, v19);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v27[5];
  v27[5] = v17;

  PXSyncCallbackEnd();
  -[PXStoryRecipeManager setPersistableRecipeProgress:](self, "setPersistableRecipeProgress:", v27[5]);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

}

- (void)_handlePersistableRecipeResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXStoryRecipeManager__handlePersistableRecipeResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidatePersistedSongProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistedSongProducer);

}

- (void)_updatePersistedSongProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager songResourceProducerFactory](self, "songResourceProducerFactory");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "songResourceProducerForPersistableRecipe:configuration:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setPersistedSongProducer:](self, "setPersistedSongProducer:", v9);

  }
}

- (void)_invalidatePersistedSong
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistedSong);

}

- (void)_updatePersistedSong
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  uint64_t *v23;
  id v24[4];
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161771;
  v30 = __Block_byref_object_dispose__161772;
  v31 = 0;
  v3 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
  v4 = -[PXStoryRecipeManager requiresSongsSynchronously](self, "requiresSongsSynchronously");
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager log](self, "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v9 = v3 | v4;
  v10 = v7;
  v11 = v10;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218240;
    v33 = v8;
    v34 = 2048;
    v35 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "PXStoryRecipePersistedSong", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "PersistedSong");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager persistedSongProducer](self, "persistedSongProducer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__PXStoryRecipeManager__updatePersistedSong__block_invoke;
  v19[3] = &unk_1E5135250;
  v24[1] = v6;
  v14 = v5;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v24[2] = v8;
  v24[3] = v6;
  v16 = v12;
  v22 = v16;
  v23 = &v26;
  objc_copyWeak(v24, &location);
  objc_msgSend(v13, "requestSongResourceWithOptions:resultHandler:", v9, v19);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v27[5];
  v27[5] = v17;

  PXSyncCallbackEnd();
  -[PXStoryRecipeManager setPersistedSongProgress:](self, "setPersistedSongProgress:", v27[5]);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

}

- (void)_handlePersistedSongResourceResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PXStoryRecipeManager__handlePersistedSongResourceResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (PXStorySongResource)initialSongResource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "songsConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PXStoryRecipeManager curatedSongs](self, "curatedSongs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") < 1)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(v7, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  return (PXStorySongResource *)v5;
}

- (void)_invalidateCuratedSongsProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCuratedSongsProducer);

}

- (void)_updateCuratedSongsProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager songsProducerFactory](self, "songsProducerFactory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "songsProducerForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setCuratedSongsProducer:](self, "setCuratedSongsProducer:", v6);

  }
}

- (void)_invalidateCuratedSongs
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCuratedSongs);

}

- (void)_updateCuratedSongs
{
  void *v3;
  char v4;
  void *v5;
  BOOL v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  id v27;
  uint64_t *v28;
  id v29[4];
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PXStoryRecipeManager finalizedProducers](self, "finalizedProducers");

    if ((v4 & 0x10) == 0)
    {
      -[PXStoryRecipeManager initialSongResource](self, "initialSongResource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5
        && (v6 = -[PXStoryRecipeManager wantsAutoEditResults](self, "wantsAutoEditResults"), v5, !v6))
      {
        +[PXStoryProducerResult nullResult](PXStoryProducerResult, "nullResult");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[PXStoryRecipeManager _handleSongsResult:](self, "_handleSongsResult:", v23);

      }
      else
      {
        v31 = 0;
        v32 = &v31;
        v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__161771;
        v35 = __Block_byref_object_dispose__161772;
        v36 = 0;
        v7 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
        v8 = -[PXStoryRecipeManager requiresSongsSynchronously](self, "requiresSongsSynchronously");
        objc_initWeak(&location, self);
        -[PXStoryRecipeManager storyQueue](self, "storyQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (char *)PXSyncCallbackBegin();
        -[PXStoryRecipeManager log](self, "log");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
        v13 = v7 | v8;
        v14 = v11;
        v15 = v14;
        if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_DWORD *)buf = 134218240;
          v38 = v12;
          v39 = 2048;
          v40 = v13;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "PXStoryRecipeSongs", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
        }

        _ProducerRequestBegin(self, "Songs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryRecipeManager curatedSongsProducer](self, "curatedSongsProducer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __43__PXStoryRecipeManager__updateCuratedSongs__block_invoke;
        v24[3] = &unk_1E5135250;
        v29[1] = v10;
        v18 = v9;
        v25 = v18;
        v19 = v15;
        v26 = v19;
        v29[2] = v12;
        v29[3] = v10;
        v20 = v16;
        v27 = v20;
        v28 = &v31;
        objc_copyWeak(v29, &location);
        objc_msgSend(v17, "requestSongsWithOptions:resultHandler:", v13, v24);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v32[5];
        v32[5] = v21;

        PXSyncCallbackEnd();
        -[PXStoryRecipeManager setCuratedSongsProgress:](self, "setCuratedSongsProgress:", v32[5]);
        objc_destroyWeak(v29);

        objc_destroyWeak(&location);
        _Block_object_dispose(&v31, 8);

      }
    }
  }
}

- (void)_handleSongsResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PXStoryRecipeManager__handleSongsResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateAutoCurationProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAutoCurationProducer);

}

- (void)_updateAutoCurationProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager autoCurationProducerFactory](self, "autoCurationProducerFactory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autoCurationProducerForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setAutoCurationProducer:](self, "setAutoCurationProducer:", v6);

  }
}

- (void)_invalidateCurationLengths
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurationLengths);

}

- (void)_updateCurationLengths
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  id v23;
  uint64_t *v24;
  id v25[4];
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PXStoryRecipeManager allAssets](self, "allAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__161771;
      v31 = __Block_byref_object_dispose__161772;
      v32 = 0;
      objc_initWeak(&location, self);
      -[PXStoryRecipeManager storyQueue](self, "storyQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (char *)PXSyncCallbackBegin();
      -[PXStoryRecipeManager log](self, "log");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
      v9 = v7;
      v10 = v9;
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_DWORD *)buf = 134218240;
        v34 = v8;
        v35 = 2048;
        v36 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "PXStoryRecipeCurationLengths", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
      }

      _ProducerRequestBegin(self, "CurationLengths");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager autoCurationProducer](self, "autoCurationProducer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager allAssets](self, "allAssets");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __46__PXStoryRecipeManager__updateCurationLengths__block_invoke;
      v20[3] = &unk_1E5135250;
      v25[1] = v6;
      v15 = v5;
      v21 = v15;
      v16 = v10;
      v22 = v16;
      v25[2] = v8;
      v25[3] = v6;
      v17 = v11;
      v23 = v17;
      v24 = &v27;
      objc_copyWeak(v25, &location);
      objc_msgSend(v12, "requestCurationLengthsWithOptions:allAssets:curatedAssets:resultHandler:", 0, v13, v14, v20);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v28[5];
      v28[5] = v18;

      -[PXStoryRecipeManager setCurationLengthsProgress:](self, "setCurationLengthsProgress:", v28[5]);
      objc_destroyWeak(v25);

      objc_destroyWeak(&location);
      _Block_object_dispose(&v27, 8);

    }
  }
}

- (void)_handleCurationLengthsResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryRecipeManager__handleCurationLengthsResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateMovieHighlightsProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMovieHighlightsProducer);

}

- (void)_updateMovieHighlightsProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager movieHighlightsProducerFactory](self, "movieHighlightsProducerFactory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "movieHighlightsProducerWithConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setMovieHighlightsProducer:](self, "setMovieHighlightsProducer:", v6);

  }
}

- (void)_invalidateMovieHighlights
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMovieHighlights);

}

- (void)_updateMovieHighlights
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  id v25;
  uint64_t *v26;
  id v27[4];
  id location;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__161771;
  v33 = __Block_byref_object_dispose__161772;
  v34 = 0;
  v3 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
  v4 = -[PXStoryRecipeManager requiresMovieHighlightsSynchronously](self, "requiresMovieHighlightsSynchronously");
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager movieHighlightsResult](self, "movieHighlightsResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryRecipeManager log](self, "log");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v11 = v3 | v4;
  v12 = v9;
  v13 = v12;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134218240;
    v36 = v10;
    v37 = 2048;
    v38 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "PXStoryRecipeMovieHighlights", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "MovieHighlights");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager movieHighlightsProducer](self, "movieHighlightsProducer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__PXStoryRecipeManager__updateMovieHighlights__block_invoke;
  v22[3] = &unk_1E5135250;
  v27[1] = v6;
  v17 = v5;
  v23 = v17;
  v18 = v13;
  v24 = v18;
  v27[2] = v10;
  v27[3] = v6;
  v19 = v14;
  v25 = v19;
  v26 = &v29;
  objc_copyWeak(v27, &location);
  objc_msgSend(v15, "requestMovieHighlightsForAssets:partialCollection:options:resultHandler:", v16, v8, v11, v22);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v30[5];
  v30[5] = v20;

  -[PXStoryRecipeManager setMovieHighlightsProgress:](self, "setMovieHighlightsProgress:", v30[5]);
  objc_destroyWeak(v27);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v29, 8);

}

- (void)_handleMovieHighlightsResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryRecipeManager__handleMovieHighlightsResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateDetailedSaliencyProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDetailedSaliencyProducer);

}

- (void)_updateDetailedSaliencyProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager detailedSaliencyProducerFactory](self, "detailedSaliencyProducerFactory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailedSaliencyProducerForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setDetailedSaliencyProducer:](self, "setDetailedSaliencyProducer:", v6);

  }
}

- (void)_invalidateDetailedSaliency
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDetailedSaliency);

}

- (void)_updateDetailedSaliency
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  id v23;
  uint64_t *v24;
  id v25[4];
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__161771;
  v31 = __Block_byref_object_dispose__161772;
  v32 = 0;
  v3 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
  v4 = -[PXStoryRecipeManager requiresDetailedSaliencySynchronously](self, "requiresDetailedSaliencySynchronously");
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager log](self, "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v9 = v3 | v4;
  v10 = v7;
  v11 = v10;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218240;
    v34 = v8;
    v35 = 2048;
    v36 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "PXStoryRecipeDetailedSaliency", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "DetailedSaliency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager detailedSaliencyProducer](self, "detailedSaliencyProducer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__PXStoryRecipeManager__updateDetailedSaliency__block_invoke;
  v20[3] = &unk_1E5135250;
  v25[1] = v6;
  v15 = v5;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  v25[2] = v8;
  v25[3] = v6;
  v17 = v12;
  v23 = v17;
  v24 = &v27;
  objc_copyWeak(v25, &location);
  objc_msgSend(v13, "requestDetailedSaliencyForDisplayAssets:options:resultHandler:", v14, v9, v20);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v28[5];
  v28[5] = v18;

  -[PXStoryRecipeManager setDetailedSaliencyProgress:](self, "setDetailedSaliencyProgress:", v28[5]);
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);

}

- (void)_handleDetailedSaliencyResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PXStoryRecipeManager__handleDetailedSaliencyResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateChapterCollectionProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChapterCollectionProducer);

}

- (void)_updateChapterCollectionProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager chapterCollectionProducerFactory](self, "chapterCollectionProducerFactory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chapterCollectionProducerForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setChapterCollectionProducer:](self, "setChapterCollectionProducer:", v6);

  }
}

- (void)_invalidateChapterCollectionResult
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChapterCollectionResult);

}

- (void)_updateChapterCollectionResult
{
  void *v3;
  void *v4;
  unint64_t v5;
  _BOOL4 v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  id v26;
  uint64_t *v27;
  id v28[4];
  id location;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryRecipeManager keyAsset](self, "keyAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__161771;
      v34 = __Block_byref_object_dispose__161772;
      v35 = 0;
      v5 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
      v6 = -[PXStoryRecipeManager requiresChapterCollectionSynchronously](self, "requiresChapterCollectionSynchronously");
      objc_initWeak(&location, self);
      -[PXStoryRecipeManager storyQueue](self, "storyQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (char *)PXSyncCallbackBegin();
      -[PXStoryRecipeManager log](self, "log");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
      v11 = v5 | v6;
      v12 = v9;
      v13 = v12;
      if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_DWORD *)buf = 134218240;
        v37 = v10;
        v38 = 2048;
        v39 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v8, "PXStoryRecipeChapterCollection", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
      }

      _ProducerRequestBegin(self, "ChapterCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager chapterCollectionProducer](self, "chapterCollectionProducer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager keyAsset](self, "keyAsset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __54__PXStoryRecipeManager__updateChapterCollectionResult__block_invoke;
      v23[3] = &unk_1E5135250;
      v28[1] = v8;
      v18 = v7;
      v24 = v18;
      v19 = v13;
      v25 = v19;
      v28[2] = v10;
      v28[3] = v8;
      v20 = v14;
      v26 = v20;
      v27 = &v30;
      objc_copyWeak(v28, &location);
      objc_msgSend(v15, "requestChapterCollectionForKeyAsset:curatedAssets:options:resultHandler:", v16, v17, v11, v23);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v31[5];
      v31[5] = v21;

      -[PXStoryRecipeManager setChapterCollectionProgress:](self, "setChapterCollectionProgress:", v31[5]);
      objc_destroyWeak(v28);

      objc_destroyWeak(&location);
      _Block_object_dispose(&v30, 8);

    }
  }
}

- (void)_handleChapterCollectionResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXStoryRecipeManager__handleChapterCollectionResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateChapterCollection
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChapterCollection);

}

- (void)_updateChapterCollection
{
  void *v3;
  id v4;

  -[PXStoryRecipeManager chapterCollectionManager](self, "chapterCollectionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chapterCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager setChapterCollection:](self, "setChapterCollection:", v3);

}

- (void)_invalidateOverallDurationInfo
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOverallDurationInfo);

}

- (void)_updateOverallDurationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  _OWORD v14[5];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  -[PXStoryRecipeManager overallDurationInfo](self, "overallDurationInfo");
  -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "overallDurationInfo");
    v23 = v18;
    v24 = v19;
    v25 = v20;
    v21 = v16;
    v22 = v17;
  }

  -[PXStoryRecipeManager curationLengthsResult](self, "curationLengthsResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    if ((unint64_t)v21 <= 1)
    {
      v7 = -[PXStoryRecipeManager defaultCurationLength](self, "defaultCurationLength");
      if (v7 > 4)
        v8 = 0;
      else
        v8 = qword_1A7C0A8F8[v7];
      *(_QWORD *)&v21 = v8;
    }
  }
  -[PXStoryRecipeManager recipeAssetEdits](self, "recipeAssetEdits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "overallDurationInfo");
    if (v15)
    {
      -[PXStoryRecipeManager persistedRecipeAssetEdits](self, "persistedRecipeAssetEdits");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        v12 = v11;
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if (!v13)
          goto LABEL_16;
      }
      objc_msgSend(v10, "overallDurationInfo");
      v23 = v18;
      v24 = v19;
      v25 = v20;
      v21 = v16;
      v22 = v17;
    }
  }
LABEL_16:
  v14[2] = v23;
  v14[3] = v24;
  v14[4] = v25;
  v14[0] = v21;
  v14[1] = v22;
  -[PXStoryRecipeManager setOverallDurationInfo:](self, "setOverallDurationInfo:", v14);

}

- (void)_invalidateAllAssets
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAllAssets);

}

- (void)_updateAllAssets
{
  void *v3;
  void *v4;
  _OWORD v5[2];

  -[PXStoryRecipeManager assetsDataSource](self, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
    -[PXStoryRecipeManager setAllAssets:](self, "setAllAssets:", 0);
  }
  else
  {
    if (v3)
      objc_msgSend(v3, "firstSectionIndexPath");
    else
      memset(v5, 0, sizeof(v5));
    objc_msgSend(v3, "uncuratedAssetsInSectionIndexPath:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setAllAssets:](self, "setAllAssets:", v4);

  }
}

- (void)_invalidateCuratedAssets
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCuratedAssets);

}

- (void)_updateCuratedAssets
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXStoryRecipeManager assetsDataSource](self, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (v3)
  {
    objc_msgSend(v3, "firstSectionIndexPath");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  objc_msgSend(v3, "assetsInSectionIndexPath:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "count"))
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PXStoryRecipeManager assetCollection](self, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Assets datasource contains a section, but it has 0 curated assets %@ %@", buf, 0x16u);

    }
    goto LABEL_10;
  }
LABEL_11:
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance", v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "curatedAssetsLimit");

  if (objc_msgSend(v5, "count") <= v9 || v5 == 0)
  {
    v11 = 0;
  }
  else
  {
    PXDisplayAssetFetchResultSubfetchResultWithRange();
    v11 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXStoryRecipeManager setCuratedAssets:](self, "setCuratedAssets:", v5);
  -[PXStoryRecipeManager setUntruncatedCuratedAssets:](self, "setUntruncatedCuratedAssets:", v11);

}

- (void)_invalidateKeyAsset
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateKeyAsset);

}

- (void)_updateKeyAsset
{
  void *v3;
  id v4;

  -[PXStoryRecipeManager assetsDataSource](self, "assetsDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager setKeyAsset:](self, "setKeyAsset:", v3);

}

- (void)_invalidateManuallyCuratedAssets
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateManuallyCuratedAssets);

}

- (void)_updateManuallyCuratedAssets
{
  uint64_t v3;
  PXDisplayAssetFetchResult *v4;
  PXDisplayAssetFetchResult *manuallyCuratedAssets;
  id v6;
  uint64_t v7;

  if (!self->_manuallyCuratedAssets)
  {
    -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") <= 0)
    {

    }
    else
    {
      -[PXStoryRecipeManager overallDurationInfo](self, "overallDurationInfo");
      v3 = v7;

      if (v3 == 2)
      {
        -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
        v4 = (PXDisplayAssetFetchResult *)objc_claimAutoreleasedReturnValue();
        manuallyCuratedAssets = self->_manuallyCuratedAssets;
        self->_manuallyCuratedAssets = v4;

      }
    }
  }
}

- (void)_invalidateInitialStyleProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInitialStyleProducer);

}

- (void)_updateInitialStyleProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  if (!-[PXStoryRecipeManager hasInitialPersistableRecipeBeenProduced](self, "hasInitialPersistableRecipeBeenProduced")
    || (-[PXStoryRecipeManager configuration](self, "configuration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "options"),
        v3,
        (v4 & 2) != 0))
  {
    -[PXStoryRecipeManager stylesProducerFactory](self, "stylesProducerFactory");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "initialStyleProducerForAssetCollection:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setInitialStyleProducer:](self, "setInitialStyleProducer:", v13);
    goto LABEL_6;
  }
  -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryRecipeManager initialSongResource](self, "initialSongResource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_storyResourceSongAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "flags");

  if ((v12 & 4) == 0)
  {
    -[PXStoryRecipeManager stylesProducerFactory](self, "stylesProducerFactory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "initialStyleProducerForPersistableRecipe:songResource:autoEditDecisionList:", v9, v10, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager setInitialStyleProducer:](self, "setInitialStyleProducer:", v14);

LABEL_6:
  }

}

- (void)_invalidateInitialStyle
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInitialStyle);

}

- (void)_updateInitialStyle
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  uint64_t *v23;
  id v24[4];
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161771;
  v30 = __Block_byref_object_dispose__161772;
  v31 = 0;
  v3 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
  v4 = -[PXStoryRecipeManager requiresInitialStyleSynchronously](self, "requiresInitialStyleSynchronously");
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager log](self, "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v9 = v3 | v4;
  v10 = v7;
  v11 = v10;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218240;
    v33 = v8;
    v34 = 2048;
    v35 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v6, "PXStoryRecipeInitialStyle", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "InitialStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager initialStyleProducer](self, "initialStyleProducer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__PXStoryRecipeManager__updateInitialStyle__block_invoke;
  v19[3] = &unk_1E5135250;
  v24[1] = v6;
  v14 = v5;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v24[2] = v8;
  v24[3] = v6;
  v16 = v12;
  v22 = v16;
  v23 = &v26;
  objc_copyWeak(v24, &location);
  objc_msgSend(v13, "requestStylesWithOptions:resultHandler:", v9, v19);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v27[5];
  v27[5] = v17;

  PXSyncCallbackEnd();
  -[PXStoryRecipeManager setInitialStyleProgress:](self, "setInitialStyleProgress:", v27[5]);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

}

- (void)_handleInitialStyleResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXStoryRecipeManager__handleInitialStyleResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateAutoEditStylesProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAutoEditStylesProducer);

}

- (void)_updateAutoEditStylesProducer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "options");

  if ((v4 & 2) == 0)
  {
    -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PXStoryRecipeManager stylesProducerFactory](self, "stylesProducerFactory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stylesProducerForAutoEditDecisionLists:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager setAutoEditStylesProducer:](self, "setAutoEditStylesProducer:", v7);

    }
  }
}

- (void)_invalidateAutoEditStyles
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAutoEditStyles);

}

- (void)_updateAutoEditStyles
{
  void *v3;
  unint64_t v4;
  _BOOL4 v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  id v23;
  uint64_t *v24;
  id v25[4];
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!-[PXStoryRecipeManager wantsAutoEditResults](self, "wantsAutoEditResults"))
  {
    +[PXStoryProducerResult nullResult](PXStoryProducerResult, "nullResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager _handleAutoEditStylesResult:](self, "_handleAutoEditStylesResult:", v3);

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__161771;
  v31 = __Block_byref_object_dispose__161772;
  v32 = 0;
  v4 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
  v5 = -[PXStoryRecipeManager requiresAutoEditStylesSynchronously](self, "requiresAutoEditStylesSynchronously");
  objc_initWeak(&location, self);
  -[PXStoryRecipeManager storyQueue](self, "storyQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (char *)PXSyncCallbackBegin();
  -[PXStoryRecipeManager log](self, "log");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
  v10 = v4 | v5;
  v11 = v8;
  v12 = v11;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 134218240;
    v34 = v9;
    v35 = 2048;
    v36 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "PXStoryRecipeStyles", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
  }

  _ProducerRequestBegin(self, "Styles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager autoEditStylesProducer](self, "autoEditStylesProducer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__PXStoryRecipeManager__updateAutoEditStyles__block_invoke;
  v20[3] = &unk_1E5135250;
  v25[1] = v7;
  v15 = v6;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v25[2] = v9;
  v25[3] = v7;
  v17 = v13;
  v23 = v17;
  v24 = &v27;
  objc_copyWeak(v25, &location);
  objc_msgSend(v14, "requestStylesWithOptions:resultHandler:", v10, v20);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v28[5];
  v28[5] = v18;

  PXSyncCallbackEnd();
  -[PXStoryRecipeManager setAutoEditStylesProgress:](self, "setAutoEditStylesProgress:", v28[5]);
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);

}

- (void)_handleAutoEditStylesResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXStoryRecipeManager__handleAutoEditStylesResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateAutoEditDecisionListsProducer
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAutoEditDecisionListsProducer);

}

- (void)_updateAutoEditDecisionListsProducer
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _OWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[PXStoryRecipeManager configuration](self, "configuration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "options") & 2) != 0)
    goto LABEL_8;
  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || !-[PXStoryRecipeManager haveFinalMovieHighlightsBeenProduced](self, "haveFinalMovieHighlightsBeenProduced"))
  {

LABEL_8:
    return;
  }
  v4 = -[PXStoryRecipeManager hasFinalChapterCollectionBeenProduced](self, "hasFinalChapterCollectionBeenProduced");

  if (v4)
  {
    -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager movieHighlightsResult](self, "movieHighlightsResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryRecipeManager chapterCollection](self, "chapterCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    -[PXStoryRecipeManager overallDurationInfo](self, "overallDurationInfo");
    -[PXStoryRecipeManager autoEditDecisionListsProducerFactory](self, "autoEditDecisionListsProducerFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeManager assetCollection](self, "assetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v16;
    v13[3] = v17;
    v13[4] = v18;
    v13[0] = v14;
    v13[1] = v15;
    objc_msgSend(v9, "autoEditDecisionListsProducerForAssetCollection:displayAssets:movieHighlights:chapterCollection:targetOverallDurationInfo:", v10, v5, v7, v8, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryRecipeManager setAutoEditDecisionListsProducer:](self, "setAutoEditDecisionListsProducer:", v11);
  }
}

- (void)_invalidateInitialAutoEditDecisionList
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInitialAutoEditDecisionList);

}

- (void)_updateInitialAutoEditDecisionList
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  unint64_t v32;
  _QWORD aBlock[4];
  id v34;
  NSObject *v35;
  id v36;
  uint64_t *v37;
  id v38[4];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  id location;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[PXStoryRecipeManager initialSongResource](self, "initialSongResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "px_storyResourceSongAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "flags");

    if ((v6 & 4) == 0)
    {
      v7 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
      v8 = -[PXStoryRecipeManager requiresAutoEditDecisionListsSynchronously](self, "requiresAutoEditDecisionListsSynchronously");
      -[PXStoryRecipeManager storyQueue](self, "storyQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__161771;
      v43 = __Block_byref_object_dispose__161772;
      v44 = 0;
      v10 = (char *)PXSyncCallbackBegin();
      -[PXStoryRecipeManager log](self, "log");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
      v32 = v7 | v8;
      v13 = v11;
      v14 = v13;
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_DWORD *)buf = 134218240;
        v49 = v12;
        v50 = 2048;
        v51 = v32;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "PXStoryRecipeInitialAutoEditDecisionList", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
      }

      _ProducerRequestBegin(self, "InitialAutoEditDecisionList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__PXStoryRecipeManager__updateInitialAutoEditDecisionList__block_invoke;
      aBlock[3] = &unk_1E5135250;
      v38[1] = v10;
      v16 = v9;
      v34 = v16;
      v30 = v14;
      v35 = v30;
      v38[2] = v12;
      v38[3] = v10;
      v31 = v15;
      v36 = v31;
      v37 = &v39;
      objc_copyWeak(v38, &location);
      v17 = _Block_copy(aBlock);
      -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "object");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recipe");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (PXStorySongResourceIsNullResource(v4))
      {
        -[PXStoryRecipeManager autoEditDecisionListsProducer](self, "autoEditDecisionListsProducer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "currentStyle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "originalColorGradeCategory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "requestDefaultAutoEditDecisionListsWithColorGradeCategory:options:resultHandler:", v23, v32, v17);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v40[5];
        v40[5] = v24;
      }
      else
      {
        objc_msgSend(v4, "px_storyResourceSongAsset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        PXAudioAssetFetchResultWithAsset(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "currentStyle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "originalColorGradeCategory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v46 = v21;
          v47 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        -[PXStoryRecipeManager autoEditDecisionListsProducer](self, "autoEditDecisionListsProducer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "requestAutoEditDecisionListsWithOptions:songs:colorGradeCategoriesBySong:resultHandler:", v32, v22, v23, v17);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v40[5];
        v40[5] = v28;

      }
      PXSyncCallbackEnd();
      -[PXStoryRecipeManager setInitialAutoEditDecisionListProgress:](self, "setInitialAutoEditDecisionListProgress:", v40[5]);

      objc_destroyWeak(v38);
      _Block_object_dispose(&v39, 8);

      objc_destroyWeak(&location);
    }
  }

}

- (void)_handleInitialAutoEditDecisionListResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PXStoryRecipeManager__handleInitialAutoEditDecisionListResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateAutoEditDecisionLists
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAutoEditDecisionLists);

}

- (void)_updateAutoEditDecisionLists
{
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  char *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  id v35;
  uint64_t *v36;
  id v37[4];
  id location;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[2];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__161771;
  v43 = __Block_byref_object_dispose__161772;
  v44 = 0;
  -[PXStoryRecipeManager curatedSongs](self, "curatedSongs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDegraded");

    if ((v5 & 1) == 0)
    {
      v6 = -[PXStoryRecipeManager defaultRequestOptions](self, "defaultRequestOptions");
      v7 = -[PXStoryRecipeManager requiresAutoEditDecisionListsSynchronously](self, "requiresAutoEditDecisionListsSynchronously");
      objc_initWeak(&location, self);
      -[PXStoryRecipeManager storyQueue](self, "storyQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (char *)PXSyncCallbackBegin();
      -[PXStoryRecipeManager log](self, "log");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)-[PXStoryRecipeManager logContext](self, "logContext");
      v11 = v6 | v7;
      v12 = v10;
      v13 = v12;
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_DWORD *)buf = 134218240;
        v47 = v31;
        v48 = 2048;
        v49 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "PXStoryRecipeAutoEditDecisionLists", "Context=%{signpost.telemetry:string2}lu requestOptions:%lu", buf, 0x16u);
      }
      v30 = v11;

      _ProducerRequestBegin(self, "AutoEditDecisionLists");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "object");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_storyResourceSongAsset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "shouldStylesAlwaysIncludePersistedSong");
      if (v17)
        v20 = v19;
      else
        v20 = 0;
      if (v20 == 1)
      {
        v21 = objc_msgSend(v3, "containsObject:", v17);

        if ((v21 & 1) != 0)
        {
LABEL_13:
          -[PXStoryRecipeManager autoEditDecisionListsProducer](self, "autoEditDecisionListsProducer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __52__PXStoryRecipeManager__updateAutoEditDecisionLists__block_invoke;
          v32[3] = &unk_1E5135250;
          v37[1] = v9;
          v25 = v8;
          v33 = v25;
          v26 = v13;
          v34 = v26;
          v37[2] = v31;
          v37[3] = v9;
          v27 = v14;
          v35 = v27;
          v36 = &v39;
          objc_copyWeak(v37, &location);
          objc_msgSend(v24, "requestAutoEditDecisionListsWithOptions:songs:colorGradeCategoriesBySong:resultHandler:", v30, v3, 0, v32);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v40[5];
          v40[5] = v28;

          PXSyncCallbackEnd();
          -[PXStoryRecipeManager setAutoEditDecisionListsProgress:](self, "setAutoEditDecisionListsProgress:", v40[5]);
          objc_destroyWeak(v37);

          objc_destroyWeak(&location);
          goto LABEL_14;
        }
        PXAudioAssetFetchResultWithAsset(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v18;
        v45[1] = v3;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PXAudioAssetFetchResultWithFetchResults(v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v23;
      }

      goto LABEL_13;
    }
  }
LABEL_14:

  _Block_object_dispose(&v39, 8);
}

- (void)_handleAutoEditDecisionListsResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PXStoryRecipeManager__handleAutoEditDecisionListsResult___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateProducerMonitors
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateProducerMonitors);

}

- (void)_updateProducerMonitors
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  id v9;
  _QWORD v10[4];
  float v11;

  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "estimatedMinimumDurationPerCuratedAsset");
  v7 = v6;

  if (v4 < 1)
    v8 = 0.0;
  else
    v8 = 1.0 / (v7 * (double)v4);
  -[PXStoryRecipeManager detailedSaliencyProducerMonitor](self, "detailedSaliencyProducerMonitor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__PXStoryRecipeManager__updateProducerMonitors__block_invoke_2;
  v10[3] = &__block_descriptor_36_e41_v16__0___PXStoryMutableProducerMonitor__8l;
  v11 = v8;
  objc_msgSend(v9, "performChanges:", v10);

}

- (void)_invalidateProducersLikelyToKeepUp
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateProducersLikelyToKeepUp);

}

- (void)_updateProducersLikelyToKeepUp
{
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[2];
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  PXStoryRecipeManager *v9;
  uint64_t *v10;
  unint64_t v11;
  SEL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = -[PXStoryRecipeManager producersToMonitor](self, "producersToMonitor");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __54__PXStoryRecipeManager__updateProducersLikelyToKeepUp__block_invoke;
  v8 = &unk_1E5141158;
  v11 = v4;
  v12 = a2;
  v9 = self;
  v10 = &v13;
  v17 = 0;
  v5 = 1;
  do
  {
    ((void (*)(_QWORD *, unint64_t, char *))v7)(v6, v5, &v17);
    if (v5 > 0xFFF)
      break;
    v5 *= 2;
  }
  while (!v17);
  -[PXStoryRecipeManager setProducersLikelyToKeepUp:](self, "setProducersLikelyToKeepUp:", v14[3]);
  _Block_object_dispose(&v13, 8);
}

- (void)_invalidateRecipe
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRecipe);

}

- (void)_updateRecipe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PXStoryRecipe *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXStoryRecipe *v13;
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
  PXStoryStyleConfigurationList *v27;
  _BYTE v28[88];

  -[PXStoryRecipeManager initialStyleResult](self, "initialStyleResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryRecipeManager autoEditStylesResult](self, "autoEditStylesResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v7 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v7;
  if (v5)
    v27 = -[PXStoryStyleConfigurationList initWithAutoEditStyleConfigurations:initialStyleConfiguration:]([PXStoryStyleConfigurationList alloc], "initWithAutoEditStyleConfigurations:initialStyleConfiguration:", v7, v5);
  else
    v27 = 0;
  -[PXStoryRecipeManager _collectAutoEditDecisionListsBySong](self, "_collectAutoEditDecisionListsBySong");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PXStoryRecipe alloc];
  -[PXStoryRecipeManager assetCollection](self, "assetCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager keyAsset](self, "keyAsset");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager curatedAssets](self, "curatedAssets");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager untruncatedCuratedAssets](self, "untruncatedCuratedAssets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager allAssets](self, "allAssets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager movieHighlightsResult](self, "movieHighlightsResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "object");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager detailedSaliencyResult](self, "detailedSaliencyResult");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "object");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager chapterCollection](self, "chapterCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager overallDurationInfo](self, "overallDurationInfo");
  -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recipe");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager initialSongResource](self, "initialSongResource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeManager fallbackSongResource](self, "fallbackSongResource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXStoryRecipe initWithAssetCollection:keyAsset:curatedAssets:untruncatedCuratedAssets:allAssets:movieHighlights:detailedSaliency:chapterCollection:overallDurationInfo:styleConfigurationList:sourcePersistableRecipe:initialSongResource:fallbackSongResource:autoEditDecisionListsBySong:](v8, "initWithAssetCollection:keyAsset:curatedAssets:untruncatedCuratedAssets:allAssets:movieHighlights:detailedSaliency:chapterCollection:overallDurationInfo:styleConfigurationList:sourcePersistableRecipe:initialSongResource:fallbackSongResource:autoEditDecisionListsBySong:", v20, v26, v21, v19, v18, v16, v15, v14, v28, v27, v10, v11, v12, v22);
  -[PXStoryRecipeManager setRecipe:](self, "setRecipe:", v13);

  -[PXStoryRecipeManager _invalidateRecipeAttributes](self, "_invalidateRecipeAttributes");
}

- (void)_invalidateRecipeAttributes
{
  id v2;

  -[PXStoryRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRecipeAttributes);

}

- (void)_updateRecipeAttributes
{
  char v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v3 = -[PXStoryRecipeManager recipeAttributes](self, "recipeAttributes");
  v4 = -[PXStoryRecipeManager producersWithInitialResults](self, "producersWithInitialResults");
  v5 = -[PXStoryRecipeManager producersRequiredForPlayback](self, "producersRequiredForPlayback") & ~v4;
  v6 = -[PXStoryRecipeManager producersLikelyToKeepUp](self, "producersLikelyToKeepUp");
  v7 = -[PXStoryRecipeManager producersToMonitor](self, "producersToMonitor");
  v8 = 0;
  if (!v5 && v6 == v7)
  {
    -[PXStoryRecipeManager loadingReadyForPlaybackDate](self, "loadingReadyForPlaybackDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager setLoadingReadyForPlaybackDate:](self, "setLoadingReadyForPlaybackDate:", v10);

    }
    v8 = 1;
  }
  v11 = -[PXStoryRecipeManager finalizedProducers](self, "finalizedProducers");
  if ((~-[PXStoryRecipeManager optionalProducers](self, "optionalProducers") & ~v11 & 0x1FFFLL) == 0
    || (v3 & 2) != 0)
  {
    v8 |= 2uLL;
    -[PXStoryRecipeManager loadingFinalDate](self, "loadingFinalDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipeManager setLoadingFinalDate:](self, "setLoadingFinalDate:", v13);

    }
  }
  -[PXStoryRecipeManager setRecipeAttributes:](self, "setRecipeAttributes:", v8);
}

- (id)_monitorForProducer:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 4096)
    return 0;
  -[PXStoryRecipeManager detailedSaliencyProducerMonitor](self, "detailedSaliencyProducerMonitor", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_resultForProducer:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v4 = 0;
  v10 = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          return v4;
        case 0x800uLL:
          -[PXStoryRecipeManager chapterCollectionResult](self, "chapterCollectionResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 0x1000uLL:
          -[PXStoryRecipeManager detailedSaliencyResult](self, "detailedSaliencyResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x80uLL:
          -[PXStoryRecipeManager autoEditStylesResult](self, "autoEditStylesResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 0x100uLL:
          -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 0x200uLL:
          -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult");
          v5 = objc_claimAutoreleasedReturnValue();
LABEL_25:
          v4 = (void *)v5;
          return v4;
      }
    }
  }
  else
  {
    if ((uint64_t)a3 <= 15)
    {
      switch(a3)
      {
        case 1uLL:
          -[PXStoryRecipeManager assetsResult](self, "assetsResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 2uLL:
          return v4;
        case 4uLL:
          -[PXStoryRecipeManager persistableRecipeResult](self, "persistableRecipeResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 8uLL:
          -[PXStoryRecipeManager persistedSongResult](self, "persistedSongResult");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        default:
          goto LABEL_27;
      }
    }
    switch(a3)
    {
      case 0x10uLL:
        -[PXStoryRecipeManager curatedSongsResult](self, "curatedSongsResult");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      case 0x20uLL:
        -[PXStoryRecipeManager movieHighlightsResult](self, "movieHighlightsResult");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      case 0x40uLL:
        -[PXStoryRecipeManager initialStyleResult](self, "initialStyleResult");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
    }
  }
LABEL_27:
  PXAssertGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_fault_impl(&dword_1A6789000, v7, OS_LOG_TYPE_FAULT, "unexpected producer %lu", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (NSDictionary)resultsByComponent
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  _QWORD v8[2];
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  PXStoryRecipeManager *v12;
  char v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __42__PXStoryRecipeManager_resultsByComponent__block_invoke;
  v10 = &unk_1E51460E8;
  v4 = v3;
  v11 = v4;
  v12 = self;
  v13 = 0;
  v5 = 1;
  do
  {
    ((void (*)(_QWORD *, unint64_t, char *))v9)(v8, v5, &v13);
    if (v5 > 0xFFF)
      break;
    v5 *= 2;
  }
  while (!v13);
  v6 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v6;
}

- (id)_collectAutoEditDecisionListsBySong
{
  id v3;
  void *v4;
  void *v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[PXStoryRecipeManager initialAutoEditDecisionListResult](self, "initialAutoEditDecisionListResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "song");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  }
  -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[PXStoryRecipeManager autoEditDecisionListsResult](self, "autoEditDecisionListsResult", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "object");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v20, "song");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

  }
  -[PXStoryRecipeManager additionalAutoEditDecisionListsBySong](self, "additionalAutoEditDecisionListsBySong");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v23 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v23, "addEntriesFromDictionary:", v22);
    v24 = objc_msgSend(v23, "copy");

    v3 = (id)v24;
  }

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  PXStoryRecipeManager *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  PXStoryRecipeManager *v26;
  _QWORD block[5];
  id v28;

  v6 = a4;
  v9 = a3;
  if ((void *)AssetsDataSourceManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PXStoryRecipeManager assetsDataSourceManager](self, "assetsDataSourceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXStoryRecipeManager storyQueue](self, "storyQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C80D38];

      if (v13 == v14)
      {
        -[PXStoryRecipeManager _storyQueue_handleChangedAssetsDataSource:](self, "_storyQueue_handleChangedAssetsDataSource:", v12);
      }
      else
      {
        -[PXStoryRecipeManager storyQueue](self, "storyQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__PXStoryRecipeManager_observable_didChange_context___block_invoke;
        block[3] = &unk_1E5148D08;
        block[4] = self;
        v28 = v12;
        dispatch_async(v15, block);

      }
    }
  }
  else if ((void *)ChapterCollectionManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_2;
      v25 = &unk_1E5130830;
      v26 = self;
      v10 = &v22;
      goto LABEL_11;
    }
  }
  else
  {
    if ((void *)ProducerMonitorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeManager.m"), 2541, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_3;
      v20 = &unk_1E5130830;
      v21 = self;
      v10 = &v17;
LABEL_11:
      -[PXStoryRecipeManager performChanges:](self, "performChanges:", v10, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }

}

- (void)_storyQueue_handleChangedAssetsDataSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXStoryRecipeManager__storyQueue_handleChangedAssetsDataSource___block_invoke;
  v6[3] = &unk_1E5130010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryRecipeManager performChanges:](self, "performChanges:", v6);

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryRecipe)recipe
{
  return self->_recipe;
}

- (unint64_t)recipeAttributes
{
  return self->_recipeAttributes;
}

- (BOOL)isRecipeFinal
{
  return self->_isRecipeFinal;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (unint64_t)availableCurationLengths
{
  return self->_availableCurationLengths;
}

- (PXStoryRecipeAssetEdits)recipeAssetEdits
{
  return self->_recipeAssetEdits;
}

- (PXDisplayAssetFetchResult)manuallyCuratedAssets
{
  return self->_manuallyCuratedAssets;
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  return self->_chapterCollectionManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (unint64_t)defaultRequestOptions
{
  return self->_defaultRequestOptions;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (BOOL)isAssetCollectionFinal
{
  return self->_isAssetCollectionFinal;
}

- (void)setIsAssetCollectionFinal:(BOOL)a3
{
  self->_isAssetCollectionFinal = a3;
}

- (unint64_t)producersWithInitialResults
{
  return self->_producersWithInitialResults;
}

- (unint64_t)finalizedProducers
{
  return self->_finalizedProducers;
}

- (unint64_t)remainingProducers
{
  return self->_remainingProducers;
}

- (unint64_t)producersLikelyToKeepUp
{
  return self->_producersLikelyToKeepUp;
}

- (PXStoryAssetsProducer)assetsProducer
{
  return self->_assetsProducer;
}

- (NSProgress)assetsProgress
{
  return self->_assetsProgress;
}

- (PXStoryProducerResult)assetsResult
{
  return self->_assetsResult;
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (NSString)cachedAssetsCountHUDDescription
{
  return self->_cachedAssetsCountHUDDescription;
}

- (void)setCachedAssetsCountHUDDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAssetsCountHUDDescription, a3);
}

- (PXStoryPersistableRecipeProducer)persistableRecipeProducer
{
  return self->_persistableRecipeProducer;
}

- (NSProgress)persistableRecipeProgress
{
  return self->_persistableRecipeProgress;
}

- (PXStoryProducerResult)persistableRecipeResult
{
  return self->_persistableRecipeResult;
}

- (BOOL)hasInitialPersistableRecipeBeenProduced
{
  return self->_hasInitialPersistableRecipeBeenProduced;
}

- (PXStorySongsProducer)curatedSongsProducer
{
  return self->_curatedSongsProducer;
}

- (NSProgress)curatedSongsProgress
{
  return self->_curatedSongsProgress;
}

- (PXStoryProducerResult)curatedSongsResult
{
  return self->_curatedSongsResult;
}

- (PXStorySongResourceProducer)persistedSongProducer
{
  return self->_persistedSongProducer;
}

- (NSProgress)persistedSongProgress
{
  return self->_persistedSongProgress;
}

- (PXStoryProducerResult)persistedSongResult
{
  return self->_persistedSongResult;
}

- (void)setInitialSongResource:(id)a3
{
  objc_storeStrong((id *)&self->_initialSongResource, a3);
}

- (PXStoryMovieHighlightsProducer)movieHighlightsProducer
{
  return self->_movieHighlightsProducer;
}

- (NSProgress)movieHighlightsProgress
{
  return self->_movieHighlightsProgress;
}

- (PXStoryProducerResult)movieHighlightsResult
{
  return self->_movieHighlightsResult;
}

- (BOOL)haveFinalMovieHighlightsBeenProduced
{
  return self->_haveFinalMovieHighlightsBeenProduced;
}

- (PXStoryProducerMonitor)detailedSaliencyProducerMonitor
{
  return self->_detailedSaliencyProducerMonitor;
}

- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer
{
  return self->_detailedSaliencyProducer;
}

- (NSProgress)detailedSaliencyProgress
{
  return self->_detailedSaliencyProgress;
}

- (PXStoryProducerResult)detailedSaliencyResult
{
  return self->_detailedSaliencyResult;
}

- (BOOL)hasFinalDetailedSaliencyBeenProduced
{
  return self->_hasFinalDetailedSaliencyBeenProduced;
}

- (PXStoryChapterCollectionProducer)chapterCollectionProducer
{
  return self->_chapterCollectionProducer;
}

- (NSProgress)chapterCollectionProgress
{
  return self->_chapterCollectionProgress;
}

- (PXStoryProducerResult)chapterCollectionResult
{
  return self->_chapterCollectionResult;
}

- (BOOL)hasFinalChapterCollectionBeenProduced
{
  return self->_hasFinalChapterCollectionBeenProduced;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXStoryAutoCurationProducer)autoCurationProducer
{
  return self->_autoCurationProducer;
}

- (NSProgress)curationLengthsProgress
{
  return self->_curationLengthsProgress;
}

- (NSProgress)assetsAutoCurationProgress
{
  return self->_assetsAutoCurationProgress;
}

- (PXStoryProducerResult)curationLengthsResult
{
  return self->_curationLengthsResult;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)overallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[9].var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[9].var1.var1.var3;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[10].var0;
  v4 = *(_OWORD *)&self[9].var1.var1.var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[9].var1.var0.var1;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (unint64_t)defaultCurationLength
{
  return self->_defaultCurationLength;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PXDisplayAssetFetchResult)untruncatedCuratedAssets
{
  return self->_untruncatedCuratedAssets;
}

- (PXDisplayAssetFetchResult)allAssets
{
  return self->_allAssets;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXStoryStylesProducer)initialStyleProducer
{
  return self->_initialStyleProducer;
}

- (NSProgress)initialStyleProgress
{
  return self->_initialStyleProgress;
}

- (PXStoryProducerResult)initialStyleResult
{
  return self->_initialStyleResult;
}

- (BOOL)hasInitialStyleBeenProduced
{
  return self->_hasInitialStyleBeenProduced;
}

- (void)setHasInitialStyleBeenProduced:(BOOL)a3
{
  self->_hasInitialStyleBeenProduced = a3;
}

- (PXStoryStylesProducer)autoEditStylesProducer
{
  return self->_autoEditStylesProducer;
}

- (BOOL)requiresAutoEditStylesSynchronously
{
  return self->_requiresAutoEditStylesSynchronously;
}

- (NSProgress)autoEditStylesProgress
{
  return self->_autoEditStylesProgress;
}

- (PXStoryProducerResult)autoEditStylesResult
{
  return self->_autoEditStylesResult;
}

- (PXStoryAutoEditDecisionListsProducer)autoEditDecisionListsProducer
{
  return self->_autoEditDecisionListsProducer;
}

- (NSProgress)autoEditDecisionListsProgress
{
  return self->_autoEditDecisionListsProgress;
}

- (PXStoryProducerResult)autoEditDecisionListsResult
{
  return self->_autoEditDecisionListsResult;
}

- (NSProgress)initialAutoEditDecisionListProgress
{
  return self->_initialAutoEditDecisionListProgress;
}

- (void)setInitialAutoEditDecisionListProgress:(id)a3
{
  objc_storeStrong((id *)&self->_initialAutoEditDecisionListProgress, a3);
}

- (PXStoryProducerResult)initialAutoEditDecisionListResult
{
  return self->_initialAutoEditDecisionListResult;
}

- (NSDate)loadingStartDate
{
  return self->_loadingStartDate;
}

- (void)setLoadingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStartDate, a3);
}

- (NSDate)loadingReadyForPlaybackDate
{
  return self->_loadingReadyForPlaybackDate;
}

- (void)setLoadingReadyForPlaybackDate:(id)a3
{
  objc_storeStrong((id *)&self->_loadingReadyForPlaybackDate, a3);
}

- (NSDate)loadingFinalDate
{
  return self->_loadingFinalDate;
}

- (void)setLoadingFinalDate:(id)a3
{
  objc_storeStrong((id *)&self->_loadingFinalDate, a3);
}

- (PXStoryRecipeAssetEdits)persistedRecipeAssetEdits
{
  return self->_persistedRecipeAssetEdits;
}

- (NSSet)additionalSongs
{
  return self->_additionalSongs;
}

- (void)setAdditionalSongs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (NSDictionary)additionalAutoEditDecisionListsBySong
{
  return self->_additionalAutoEditDecisionListsBySong;
}

- (PXStoryAssetsProducerFactory)assetsProducerFactory
{
  return self->_assetsProducerFactory;
}

- (PXStoryPersistableRecipeProducerFactory)persistableRecipeProducerFactory
{
  return self->_persistableRecipeProducerFactory;
}

- (PXStorySongsProducerFactory)songsProducerFactory
{
  return self->_songsProducerFactory;
}

- (PXStoryMovieHighlightsProducerFactory)movieHighlightsProducerFactory
{
  return self->_movieHighlightsProducerFactory;
}

- (PXStoryDetailedSaliencyProducerFactory)detailedSaliencyProducerFactory
{
  return self->_detailedSaliencyProducerFactory;
}

- (PXStoryChapterCollectionProducerFactory)chapterCollectionProducerFactory
{
  return self->_chapterCollectionProducerFactory;
}

- (PXStoryStylesProducerFactory)stylesProducerFactory
{
  return self->_stylesProducerFactory;
}

- (PXStoryAutoEditDecisionListsProducerFactory)autoEditDecisionListsProducerFactory
{
  return self->_autoEditDecisionListsProducerFactory;
}

- (PXStoryAutoCurationProducerFactory)autoCurationProducerFactory
{
  return self->_autoCurationProducerFactory;
}

- (PXStorySongResourceProducerFactory)songResourceProducerFactory
{
  return self->_songResourceProducerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResourceProducerFactory, 0);
  objc_storeStrong((id *)&self->_autoCurationProducerFactory, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsProducerFactory, 0);
  objc_storeStrong((id *)&self->_stylesProducerFactory, 0);
  objc_storeStrong((id *)&self->_chapterCollectionProducerFactory, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducerFactory, 0);
  objc_storeStrong((id *)&self->_movieHighlightsProducerFactory, 0);
  objc_storeStrong((id *)&self->_songsProducerFactory, 0);
  objc_storeStrong((id *)&self->_persistableRecipeProducerFactory, 0);
  objc_storeStrong((id *)&self->_assetsProducerFactory, 0);
  objc_storeStrong((id *)&self->_additionalAutoEditDecisionListsBySong, 0);
  objc_storeStrong((id *)&self->_additionalSongs, 0);
  objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_loadingFinalDate, 0);
  objc_storeStrong((id *)&self->_loadingReadyForPlaybackDate, 0);
  objc_storeStrong((id *)&self->_loadingStartDate, 0);
  objc_storeStrong((id *)&self->_initialAutoEditDecisionListResult, 0);
  objc_storeStrong((id *)&self->_initialAutoEditDecisionListProgress, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsResult, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsProgress, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsProducer, 0);
  objc_storeStrong((id *)&self->_autoEditStylesResult, 0);
  objc_storeStrong((id *)&self->_autoEditStylesProgress, 0);
  objc_storeStrong((id *)&self->_autoEditStylesProducer, 0);
  objc_storeStrong((id *)&self->_initialStyleResult, 0);
  objc_storeStrong((id *)&self->_initialStyleProgress, 0);
  objc_storeStrong((id *)&self->_initialStyleProducer, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_untruncatedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_curationLengthsResult, 0);
  objc_storeStrong((id *)&self->_assetsAutoCurationProgress, 0);
  objc_storeStrong((id *)&self->_curationLengthsProgress, 0);
  objc_storeStrong((id *)&self->_autoCurationProducer, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_chapterCollectionResult, 0);
  objc_storeStrong((id *)&self->_chapterCollectionProgress, 0);
  objc_storeStrong((id *)&self->_chapterCollectionProducer, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyResult, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProgress, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducerMonitor, 0);
  objc_storeStrong((id *)&self->_movieHighlightsResult, 0);
  objc_storeStrong((id *)&self->_movieHighlightsProgress, 0);
  objc_storeStrong((id *)&self->_movieHighlightsProducer, 0);
  objc_storeStrong((id *)&self->_initialSongResource, 0);
  objc_storeStrong((id *)&self->_persistedSongResult, 0);
  objc_storeStrong((id *)&self->_persistedSongProgress, 0);
  objc_storeStrong((id *)&self->_persistedSongProducer, 0);
  objc_storeStrong((id *)&self->_curatedSongsResult, 0);
  objc_storeStrong((id *)&self->_curatedSongsProgress, 0);
  objc_storeStrong((id *)&self->_curatedSongsProducer, 0);
  objc_storeStrong((id *)&self->_persistableRecipeResult, 0);
  objc_storeStrong((id *)&self->_persistableRecipeProgress, 0);
  objc_storeStrong((id *)&self->_persistableRecipeProducer, 0);
  objc_storeStrong((id *)&self->_cachedAssetsCountHUDDescription, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetsResult, 0);
  objc_storeStrong((id *)&self->_assetsProgress, 0);
  objc_storeStrong((id *)&self->_assetsProducer, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_chapterCollectionManager, 0);
  objc_storeStrong((id *)&self->_manuallyCuratedAssets, 0);
  objc_storeStrong((id *)&self->_recipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

uint64_t __66__PXStoryRecipeManager__storyQueue_handleChangedAssetsDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetsDataSource:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__PXStoryRecipeManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storyQueue_handleChangedAssetsDataSource:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChapterCollection");
}

uint64_t __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateProducersLikelyToKeepUp");
}

void __42__PXStoryRecipeManager_resultsByComponent__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "_resultForProducer:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  PXStoryProducerName(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __54__PXStoryRecipeManager__updateProducersLikelyToKeepUp__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if ((a2 & ~*(_QWORD *)(a1 + 48)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_monitorForProducer:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      PXStoryProducerName(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXStoryRecipeManager.m"), 2367, CFSTR("no monitor for producer %@"), v8);

      v4 = 0;
    }
    if (objc_msgSend(v4, "isLikelyToKeepUp"))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= a2;

  }
}

uint64_t __47__PXStoryRecipeManager__updateProducerMonitors__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setEstimatedFractionCompletedPlaybackSpeed:", a3);
}

uint64_t __59__PXStoryRecipeManager__handleAutoEditDecisionListsResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAutoEditDecisionListsResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setAutoEditDecisionListsProgress:", 0);
  return result;
}

void __52__PXStoryRecipeManager__updateAutoEditDecisionLists__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __52__PXStoryRecipeManager__updateAutoEditDecisionLists__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeAutoEditDecisionLists", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleAutoEditDecisionListsResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __65__PXStoryRecipeManager__handleInitialAutoEditDecisionListResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setInitialAutoEditDecisionListResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setInitialAutoEditDecisionListProgress:", 0);
  return result;
}

void __58__PXStoryRecipeManager__updateInitialAutoEditDecisionList__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __58__PXStoryRecipeManager__updateInitialAutoEditDecisionList__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeInitialAutoEditDecisionList", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleInitialAutoEditDecisionListResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __52__PXStoryRecipeManager__handleAutoEditStylesResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAutoEditStylesResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setAutoEditStylesProgress:", 0);
  return result;
}

void __45__PXStoryRecipeManager__updateAutoEditStyles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __45__PXStoryRecipeManager__updateAutoEditStyles__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeStyles", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleAutoEditStylesResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __50__PXStoryRecipeManager__handleInitialStyleResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setInitialStyleResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setHasInitialStyleBeenProduced:", 1);
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setInitialStyleProgress:", 0);
  return result;
}

void __43__PXStoryRecipeManager__updateInitialStyle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __43__PXStoryRecipeManager__updateInitialStyle__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeInitialStyle", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleInitialStyleResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __55__PXStoryRecipeManager__handleChapterCollectionResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setChapterCollectionResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasFinalChapterCollectionBeenProduced:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "setChapterCollectionProgress:", 0);
  }
  return result;
}

void __54__PXStoryRecipeManager__updateChapterCollectionResult__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __54__PXStoryRecipeManager__updateChapterCollectionResult__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeChapterCollection", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleChapterCollectionResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __54__PXStoryRecipeManager__handleDetailedSaliencyResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setDetailedSaliencyResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasFinalDetailedSaliencyBeenProduced:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "setDetailedSaliencyProgress:", 0);
  }
  return result;
}

void __47__PXStoryRecipeManager__updateDetailedSaliency__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __47__PXStoryRecipeManager__updateDetailedSaliency__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeDetailedSaliency", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleDetailedSaliencyResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __53__PXStoryRecipeManager__handleMovieHighlightsResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setMovieHighlightsResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHaveFinalMovieHighlightsBeenProduced:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "setMovieHighlightsProgress:", 0);
  }
  return result;
}

void __46__PXStoryRecipeManager__updateMovieHighlights__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __46__PXStoryRecipeManager__updateMovieHighlights__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeMovieHighlights", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleMovieHighlightsResult:", *(_QWORD *)(a1 + 48));

  }
}

void __53__PXStoryRecipeManager__handleCurationLengthsResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCurationLengthsResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAvailableCurationLengths:", objc_msgSend(v2, "availableCurationLengths"));
  objc_msgSend(*(id *)(a1 + 32), "setDefaultCurationLength:", objc_msgSend(v2, "defaultCurationLength"));
  if ((objc_msgSend(*(id *)(a1 + 40), "isDegraded") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setCurationLengthsProgress:", 0);

}

void __46__PXStoryRecipeManager__updateCurationLengths__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __46__PXStoryRecipeManager__updateCurationLengths__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeCurationLengths", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleCurationLengthsResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __43__PXStoryRecipeManager__handleSongsResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCuratedSongsResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setCuratedSongsProgress:", 0);
  return result;
}

void __43__PXStoryRecipeManager__updateCuratedSongs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __43__PXStoryRecipeManager__updateCuratedSongs__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeSongs", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleSongsResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __59__PXStoryRecipeManager__handlePersistedSongResourceResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPersistedSongResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setPersistedSongProgress:", 0);
  return result;
}

void __44__PXStoryRecipeManager__updatePersistedSong__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __44__PXStoryRecipeManager__updatePersistedSong__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipePersistedSong", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handlePersistedSongResourceResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __55__PXStoryRecipeManager__handlePersistableRecipeResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPersistableRecipeResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setHasInitialPersistableRecipeBeenProduced:", 1);
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setPersistableRecipeProgress:", 0);
  return result;
}

void __48__PXStoryRecipeManager__updatePersistableRecipe__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __48__PXStoryRecipeManager__updatePersistableRecipe__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipePersistableRecipe", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handlePersistableRecipeResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __44__PXStoryRecipeManager__handleAssetsResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetsResult:", *(_QWORD *)(a1 + 40));
}

void __37__PXStoryRecipeManager__updateAssets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __37__PXStoryRecipeManager__updateAssets__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)&v15[4] = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeAssets", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleAssetsResult:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __62__PXStoryRecipeManager_diagnosticErrorsByComponentForHUDType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t __61__PXStoryRecipeManager__shortDescriptionOfPersistableRecipe___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR("%li %@\n"), a2, a3);
  return result;
}

void __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id *v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v11;
  if (v12)
  {
    (*((void (**)(id, void *))v11 + 2))(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString hasSuffix:](v14, "hasSuffix:", CFSTR("\n")))
    {
      -[__CFString substringWithRange:](v14, "substringWithRange:", 0, -[__CFString length](v14, "length") - 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (__CFString *)v15;
    }
  }
  else
  {
    v14 = CFSTR("n/a");
  }
  if ((objc_msgSend(v10, "flags") & 1) != 0)
    v16 = CFSTR("Degraded");
  else
    v16 = CFSTR("Final");
  objc_msgSend(v10, "productionDuration");
  objc_msgSend((id)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter, "stringFromTimeInterval:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = CFSTR("❌");
  }
  else
  {
    v19 = CFSTR("🔳");
    if (!v9 && v12)
    {
      v24 = *(void **)(a1 + 32);
      v20 = (id *)(a1 + 32);
      objc_msgSend(v24, "appendFormat:", CFSTR("%@:\n"), v29);
      v19 = CFSTR("✅");
LABEL_16:
      objc_msgSend(*v20, "appendFormat:", CFSTR("\t%@\n"), v14);
      goto LABEL_17;
    }
  }
  v21 = *(void **)(a1 + 32);
  v20 = (id *)(a1 + 32);
  objc_msgSend(v21, "appendFormat:", CFSTR("%@:\n"), v29);
  if (!v9)
    goto LABEL_16;
  v22 = *v20;
  objc_msgSend(v9, "fractionCompleted");
  objc_msgSend(v22, "appendFormat:", CFSTR("\tProgress: %0.1f%%\n"), v23 * 100.0);
  if (v12)
    goto LABEL_16;
LABEL_17:
  objc_msgSend(*v20, "appendFormat:", CFSTR("\t%@ %@ %@\n"), v19, v16, v17);
  if (v18)
  {
    v25 = *v20;
    objc_msgSend(v18, "localizedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorDetailsDescription(v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendFormat:", CFSTR("\tError: %@ / %@\n"), v26, v27);

  }
  objc_msgSend(*v20, "appendString:", CFSTR("\n"));

}

uint64_t __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(*(id *)(a1 + 32), "cachedAssetsCountHUDDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "librarySpecificFetchOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchCustomUserAssetsInMemory:options:", v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchUserCuratedAssetsInMemory:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CustomUser: %lu, UserCurated: %lu, RawCurated: %lu"), v11, v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "curatedAssets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Curated: %lu"), objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "allAssets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("All: %lu"), objc_msgSend(v21, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCachedAssetsCountHUDDescription:", v23);

  }
  return objc_msgSend(*(id *)(a1 + 32), "cachedAssetsCountHUDDescription");
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "recipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_shortDescriptionOfPersistableRecipe:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v3, "miroInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "containsAnyData");

  if ((_DWORD)v6)
  {
    objc_msgSend(v3, "miroInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\nMiro: %@"), v10);

  }
  return v7;
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_10(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "count");

  return (id)objc_msgSend(v4, "initWithFormat:", CFSTR("Count: %li"), v5);
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_9(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "count");

  return (id)objc_msgSend(v4, "initWithFormat:", CFSTR("Count: %li"), v5);
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "curatedAudioAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Curated Songs: %li"), objc_msgSend(v5, "count"));
  return v6;
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "originalColorGradeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customColorGradeKind");
  PFStoryColorGradeKindToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "songResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_storyResourceSongAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioAssetShortDescription(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Persisted Style:\n\t%@\n\t%@\n\t%@\n"), v4, v5, v8);

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

__CFString *__66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("Loaded");
  else
    v3 = CFSTR("Not Loaded");
  v4 = v3;

  return v4;
}

__CFString *__66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;

  if (a2)
  {
    objc_msgSend(a2, "px_storyResourceSongAsset");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PXAudioAssetShortDescription(v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("None");
  }
  return v3;
}

void __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke()
{
  PXStoryDurationFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(PXStoryDurationFormatter);
  v1 = (void *)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter;
  _diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter = (uint64_t)v0;

}

void __69__PXStoryRecipeManager__handleAdditionalAutoEditDecisionListsResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_handleResult:forProducer:", *(_QWORD *)(a1 + 40), 1024);
  v2 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setAdditionalAutoEditDecisionListsBySong:", v2);

}

void __62__PXStoryRecipeManager__updateAdditionalAutoEditDecisionLists__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 72);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __62__PXStoryRecipeManager__updateAdditionalAutoEditDecisionLists__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  switch(v2)
  {
    case 2:
      v10 = *(id *)(a1 + 32);
      v4 = v10;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
        goto LABEL_15;
      v11 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v11;
      v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
      v8 = v4;
      v9 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_14;
    case 1:
      v12 = *(id *)(a1 + 32);
      v4 = v12;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
        goto LABEL_15;
      v13 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v13;
      v7 = "Context=%{signpost.telemetry:string2}lu ";
      goto LABEL_13;
    case 0:
      v3 = *(id *)(a1 + 32);
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v3))
        goto LABEL_15;
      v6 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v6;
      v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
      v8 = v4;
      v9 = OS_SIGNPOST_EVENT;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeAdditionalAutoEditDecisionLists", v7, (uint8_t *)&v15, 0xCu);
LABEL_15:

      break;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAdditionalAutoEditDecisionListsResult:", *(_QWORD *)(a1 + 48));

}

void __58__PXStoryRecipeManager_ensureAutoEditDecisionListForSong___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(id *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 72);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  PXPerformWithSyncTokenOnQueue();
  objc_destroyWeak(&v7);

}

void __58__PXStoryRecipeManager_ensureAutoEditDecisionListForSong___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  switch(v2)
  {
    case 2:
      v10 = *(id *)(a1 + 32);
      v4 = v10;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
        goto LABEL_15;
      v11 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v11;
      v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
      v8 = v4;
      v9 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_14;
    case 1:
      v12 = *(id *)(a1 + 32);
      v4 = v12;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
        goto LABEL_15;
      v13 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v13;
      v7 = "Context=%{signpost.telemetry:string2}lu ";
      goto LABEL_13;
    case 0:
      v3 = *(id *)(a1 + 32);
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v3))
        goto LABEL_15;
      v6 = *(_QWORD *)(a1 + 64);
      v15 = 134217984;
      v16 = v6;
      v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
      v8 = v4;
      v9 = OS_SIGNPOST_EVENT;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeSingleAdditionalAutoEditDecisionList", v7, (uint8_t *)&v15, 0xCu);
LABEL_15:

      break;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAdditionalAutoEditDecisionListsResult:", *(_QWORD *)(a1 + 48));

}

void __77__PXStoryRecipeManager__handleCuratedAssetsResult_targetOverallDurationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "recipeAssetEdits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(a1 + 96);
  v8[2] = *(_OWORD *)(a1 + 80);
  v8[3] = v4;
  v8[4] = *(_OWORD *)(a1 + 112);
  v5 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v5;
  v6 = (void *)objc_msgSend(v2, "copyWithOverallDurationInfo:userCuratedAssets:", v8, v3);

  v7 = (void *)objc_msgSend(v6, "copyWithCustomUserAssets:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRecipeAssetEdits:", v7);

}

void __55__PXStoryRecipeManager_applyTargetOverallDurationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 88);
  v6 = *(id *)(a1 + 48);
  v7 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 72));
  v4 = *(_OWORD *)(a1 + 136);
  v11 = *(_OWORD *)(a1 + 120);
  v12 = v4;
  v13 = *(_OWORD *)(a1 + 152);
  v14 = *(_OWORD *)(a1 + 168);
  v10 = *(_OWORD *)(a1 + 104);
  PXPerformWithSyncTokenOnQueue();
  objc_msgSend(*(id *)(a1 + 56), "stopShowing");
  objc_destroyWeak(&v8);

}

void __55__PXStoryRecipeManager_applyTargetOverallDurationInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[5];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    v4 = v10;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_15;
    v11 = *(_QWORD *)(a1 + 72);
    LODWORD(v18[0]) = 134217984;
    *(_QWORD *)((char *)v18 + 4) = v11;
    v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    v12 = *(id *)(a1 + 32);
    v4 = v12;
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12))
      goto LABEL_15;
    v13 = *(_QWORD *)(a1 + 72);
    LODWORD(v18[0]) = 134217984;
    *(_QWORD *)((char *)v18 + 4) = v13;
    v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2)
    goto LABEL_16;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    LODWORD(v18[0]) = 134217984;
    *(_QWORD *)((char *)v18 + 4) = v6;
    v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    v8 = v4;
    v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, v9, v5, "PXStoryRecipeCuratedAssets", v7, (uint8_t *)v18, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled", v18[0]) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_OWORD *)(a1 + 104);
    v17 = *(_OWORD *)(a1 + 136);
    v18[2] = *(_OWORD *)(a1 + 120);
    v18[3] = v17;
    v18[4] = *(_OWORD *)(a1 + 152);
    v18[0] = *(_OWORD *)(a1 + 88);
    v18[1] = v16;
    objc_msgSend(WeakRetained, "_handleCuratedAssetsResult:targetOverallDurationInfo:", v15, v18);

  }
}

void __53__PXStoryRecipeManager_setPersistedRecipeAssetEdits___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assetCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshResultsForAssetCollection:", v4);

}

uint64_t __50__PXStoryRecipeManager__handleResult_forProducer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "producerDidProduceResult:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__PXStoryRecipeManager_setDetailedSaliencyProducer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

void __51__PXStoryRecipeManager_setPersistableRecipeResult___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "curatedAssets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyManuallyCuratedAssets:", v4);

}

PXStoryProducerMonitor *__305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke(uint64_t a1)
{
  PXStoryProducerMonitor *v2;

  v2 = -[PXStoryProducerMonitor initWithStoryQueue:]([PXStoryProducerMonitor alloc], "initWithStoryQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  -[PXStoryProducerMonitor registerChangeObserver:context:](v2, "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), ProducerMonitorObservationContext);
  return v2;
}

void __305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setRemainingProducers:", 0x1FFFLL);
  objc_msgSend(v4, "setConfiguration:", *(_QWORD *)(a1 + 40));

}

@end
