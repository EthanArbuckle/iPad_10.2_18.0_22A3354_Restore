@implementation PXStorySongsAutoEditDecisionListsProducer

- (PXStorySongsAutoEditDecisionListsProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStorySongsAutoEditDecisionListsProducer.m"), 79, CFSTR("%s is not available as initializer"), "-[PXStorySongsAutoEditDecisionListsProducer init]");

  abort();
}

- (PXStorySongsAutoEditDecisionListsProducer)initWithAssetCollection:(id)a3 displayAssets:(id)a4 movieHighlights:(id)a5 chapterCollection:(id)a6 targetOverallDurationInfo:(id *)a7 configuration:(id)a8 storyConfiguration:(id)a9
{
  id v16;
  id v17;
  id v18;
  PXStorySongsAutoEditDecisionListsProducer *v19;
  PXStorySongsAutoEditDecisionListsProducer *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  OS_dispatch_queue *queue;
  const char *v26;
  objc_class *v27;
  id v28;
  os_log_t v29;
  OS_os_log *log;
  uint64_t v31;
  PFRandomNumberGenerator *randomNumberGenerator;
  PFStoryAutoEditConfiguration *v33;
  PFStoryAutoEditConfiguration *configuration;
  PXStoryAutoEditMomentsProvider *v35;
  PFStoryAutoEditConfiguration *v36;
  PXDisplayAssetCollection *assetCollection;
  void *v38;
  uint64_t v39;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  PXStoryAutoEditClipComposabilityProvider *v41;
  void *v42;
  uint64_t v43;
  PXStoryAutoEditClipComposabilityProvider *composabilityProvider;
  uint64_t v45;
  NSMutableArray *ttrUnitTestsForFailedDurationConstraints;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v49 = a4;
  v48 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v51.receiver = self;
  v51.super_class = (Class)PXStorySongsAutoEditDecisionListsProducer;
  v19 = -[PXStorySongsAutoEditDecisionListsProducer init](&v51, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_assetCollection, a3);
    objc_storeStrong((id *)&v20->_displayAssets, a4);
    objc_storeStrong((id *)&v20->_movieHighlights, a5);
    objc_storeStrong((id *)&v20->_chapterCollection, a6);
    *(_OWORD *)&v20->_targetOverallDurationInfo.kind = *(_OWORD *)&a7->var0;
    v21 = *(_OWORD *)&a7->var1.var0.var1;
    v22 = *(_OWORD *)&a7->var1.var1.var0;
    v23 = *(_OWORD *)&a7->var1.var2.var1;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a7->var1.var1.var3;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.maximumDuration.timescale = v23;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.timescale = v21;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.value = v22;
    px_dispatch_queue_create_serial();
    v24 = objc_claimAutoreleasedReturnValue();
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v24;

    v26 = (const char *)*MEMORY[0x1E0D744D8];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = os_log_create(v26, (const char *)objc_msgSend(v28, "UTF8String"));
    log = v20->_log;
    v20->_log = (OS_os_log *)v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75238]), "initWithSeed:", 0);
    randomNumberGenerator = v20->_randomNumberGenerator;
    v20->_randomNumberGenerator = (PFRandomNumberGenerator *)v31;

    if (v17)
    {
      v33 = (PFStoryAutoEditConfiguration *)v17;
    }
    else
    {
      +[PXStoryAutoEditConfigurationFactory autoEditConfiguration](PXStoryAutoEditConfigurationFactory, "autoEditConfiguration");
      v33 = (PFStoryAutoEditConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    configuration = v20->_configuration;
    v20->_configuration = v33;

    v35 = [PXStoryAutoEditMomentsProvider alloc];
    v36 = v20->_configuration;
    assetCollection = v20->_assetCollection;
    -[PXStorySongsAutoEditDecisionListsProducer displayAssets](v20, "displayAssets");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PXStoryAutoEditMomentsProvider initWithConfiguration:assetCollection:displayAssets:](v35, "initWithConfiguration:assetCollection:displayAssets:", v36, assetCollection, v38);
    momentsProvider = v20->_momentsProvider;
    v20->_momentsProvider = (PXStoryAutoEditMomentsProvider *)v39;

    v41 = [PXStoryAutoEditClipComposabilityProvider alloc];
    -[PXStorySongsAutoEditDecisionListsProducer displayAssets](v20, "displayAssets");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[PXStoryAutoEditClipComposabilityProvider initWithDisplayAssets:chapterCollection:](v41, "initWithDisplayAssets:chapterCollection:", v42, v20->_chapterCollection);
    composabilityProvider = v20->_composabilityProvider;
    v20->_composabilityProvider = (PXStoryAutoEditClipComposabilityProvider *)v43;

    objc_storeStrong((id *)&v20->_storyConfiguration, a9);
    v45 = objc_opt_new();
    ttrUnitTestsForFailedDurationConstraints = v20->_ttrUnitTestsForFailedDurationConstraints;
    v20->_ttrUnitTestsForFailedDurationConstraints = (NSMutableArray *)v45;

  }
  return v20;
}

- (id)requestAutoEditDecisionListsWithOptions:(unint64_t)a3 songs:(id)a4 colorGradeCategoriesBySong:(id)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PXStoryProducerResult *v23;
  void *v24;
  PXStoryProducerResult *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  os_signpost_id_t v34;
  OS_os_log *v35;
  NSObject *v36;
  void *v37;
  NSObject *queue;
  id v39;
  void (**v40)(id, void *);
  uint64_t v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  PXStorySongsAutoEditDecisionListsProducer *v47;
  void (**v48)(id, void *);
  uint64_t v49;
  os_signpost_id_t v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  v12 = objc_msgSend(v9, "count");
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    PLStoryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_INFO, "No songs available. Auto-edit cannot produce any clips.", buf, 2u);
    }

    PXStoryErrorCreateWithCodeDebugFormat(8, CFSTR("Auto-edit cannot produce any clips without song."), v15, v16, v17, v18, v19, v20, v42);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXStorySongsAutoEditDecisionListsProducer displayAssets](self, "displayAssets");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    if (v13)
    {
LABEL_8:
      v23 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", 0);
      -[PXStoryProducerResult error:](v23, "error:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v24);
      v25 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    PLStoryGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_INFO, "No displayable assets available. Auto-edit cannot produce any clips.", buf, 2u);
    }

    PXStoryErrorCreateWithCodeDebugFormat(8, CFSTR("Auto-edit cannot produce any clips without display assets."), v27, v28, v29, v30, v31, v32, v42);
    v33 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v33;
    if (v33)
      goto LABEL_8;
  }
  v34 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v35 = self->_log;
  v36 = v35;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v35))
  {
    *(_DWORD *)buf = 134217984;
    v52 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PXStoryAutoEditDecisionList.MultipleRequest", "Count=%ld", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__PXStorySongsAutoEditDecisionListsProducer_requestAutoEditDecisionListsWithOptions_songs_colorGradeCategoriesBySong_resultHandler___block_invoke;
  block[3] = &unk_1E5139768;
  v49 = v12;
  v39 = v37;
  v44 = v39;
  v45 = v9;
  v46 = v10;
  v47 = self;
  v48 = v11;
  v50 = v34;
  dispatch_async(queue, block);
  v40 = v48;
  v23 = (PXStoryProducerResult *)v39;

  v24 = v44;
  v25 = v23;
LABEL_16:

  return v25;
}

- (id)requestDefaultAutoEditDecisionListsWithColorGradeCategory:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  os_signpost_id_t v9;
  OS_os_log *v10;
  NSObject *v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v10 = self->_log;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXStoryAutoEditDecisionList.SingleRequest", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__PXStorySongsAutoEditDecisionListsProducer_requestDefaultAutoEditDecisionListsWithColorGradeCategory_options_resultHandler___block_invoke;
  block[3] = &unk_1E513ABE0;
  block[4] = self;
  v21 = v7;
  v14 = v12;
  v22 = v14;
  v23 = v8;
  v24 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(queue, block);
  v17 = v23;
  v18 = v14;

  return v18;
}

- (id)decisionListForSong:(id)a3 pace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__222924;
  v24 = __Block_byref_object_dispose__222925;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PXStorySongsAutoEditDecisionListsProducer_decisionListForSong_pace_colorGradeCategory___block_invoke;
  block[3] = &unk_1E5138630;
  block[4] = self;
  v16 = v8;
  v18 = &v20;
  v19 = a4;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(queue, block);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)_decisionListForSong:(id)a3 pace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PXStoryConcreteMutableAutoEditClipCatalog *v11;
  Float64 v12;
  void *v13;
  uint64_t v14;
  PXStoryConcreteAutoEditDecisionList *v15;
  PXStoryConcreteAutoEditDecisionList *v16;
  CMTime v18;
  _OWORD v19[5];
  CMTime v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v8 = a5;
  v9 = a3;
  -[PXStorySongsAutoEditDecisionListsProducer displayAssets](self, "displayAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXStoryConcreteAutoEditClipCatalog initWithCapacity:]([PXStoryConcreteMutableAutoEditClipCatalog alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  -[PXStorySongsAutoEditDecisionListsProducer _populateClips:forSongPace:colorGradeCategory:](self, "_populateClips:forSongPace:colorGradeCategory:", v11, a4, v8);
  -[PXStorySongsAutoEditDecisionListsProducer _composeClips:forSongPace:](self, "_composeClips:forSongPace:", v11, a4);
  -[PXStorySongsAutoEditDecisionListsProducer _populateModulesInClips:](self, "_populateModulesInClips:", v11);
  -[PXStorySongsAutoEditDecisionListsProducer _populateMotionStylesAndTransitionsInClips:forSongPace:colorGradeCategory:](self, "_populateMotionStylesAndTransitionsInClips:forSongPace:colorGradeCategory:", v11, a4, v8);
  -[PXStorySongsAutoEditDecisionListsProducer _adjustDurationOfClips:forSongPace:](self, "_adjustDurationOfClips:forSongPace:", v11, a4);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  -[PXStorySongsAutoEditDecisionListsProducer _optimizeOverallDurationOfClips:forSong:](self, "_optimizeOverallDurationOfClips:forSong:", v11, v9);
  -[PXStorySongsAutoEditDecisionListsProducer _adjustAudioPlaybackForClips:](self, "_adjustAudioPlaybackForClips:", v11);
  -[PXStorySongsAutoEditDecisionListsProducer _adjustAudioTransitionForClips:](self, "_adjustAudioTransitionForClips:", v11);
  memset(&v20, 0, sizeof(v20));
  -[PFStoryAutoEditConfiguration outroDurationForSongPace:](self->_configuration, "outroDurationForSongPace:", a4);
  CMTimeMakeWithSeconds(&v20, v12, 600);
  -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "disableNUp") ^ 1;

  v15 = [PXStoryConcreteAutoEditDecisionList alloc];
  v19[2] = v23;
  v19[3] = v24;
  v19[4] = v25;
  v19[0] = v21;
  v19[1] = v22;
  v18 = v20;
  v16 = -[PXStoryConcreteAutoEditDecisionList initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:](v15, "initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:", v8, v9, v11, v19, &v18, v14);

  return v16;
}

- (void)_populateClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  id v9;
  os_signpost_id_t v10;
  OS_os_log *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  unsigned __int8 v20;
  PXStoryConcreteAutoEditClip *v21;
  OS_os_log *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[4];
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v11 = self->_log;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    v13 = -[PXDisplayAssetFetchResult count](self->_displayAssets, "count");
    PFStoryRecipeSongPaceDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    v35 = 2114;
    v36 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.Clips", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);

  }
  v24 = v9;

  if (-[PXDisplayAssetFetchResult count](self->_displayAssets, "count") >= 1)
  {
    v15 = 0;
    v27 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 48);
    v28 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 32);
    v16 = *(_QWORD *)(MEMORY[0x1E0D759A0] + 64);
    v25 = *MEMORY[0x1E0D759A0];
    v26 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 16);
    do
    {
      -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PXStorySongsAutoEditDecisionListsProducer _playbackStyleForAsset:songPace:](self, "_playbackStyleForAsset:songPace:", v17, a4);
      if (v18 == 3)
      {
        if (v15 && v15 + 1 != -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"))
          v18 = 3;
        else
          v18 = 1;
      }
      -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "disableVideoPlayback");

      if (((v18 != 1) & v20) != 0)
        v18 = 1;
      v21 = -[PXStoryConcreteAutoEditClip initWithDisplayAsset:]([PXStoryConcreteAutoEditClip alloc], "initWithDisplayAsset:", v17);
      -[PXStoryConcreteAutoEditClip setPlaybackStyle:](v21, "setPlaybackStyle:", v18);
      v29[2] = v28;
      v29[3] = v27;
      v30 = v16;
      v29[0] = v25;
      v29[1] = v26;
      -[PXStoryConcreteAutoEditClip setDurationInfo:](v21, "setDurationInfo:", v29);
      objc_msgSend(v8, "addClip:", v21);

      ++v15;
    }
    while (v15 < -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"));
  }
  v22 = self->_log;
  v23 = v22;
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.Clips", ", buf, 2u);
  }

}

- (void)_composeClips:(id)a3 forSongPace:(int64_t)a4
{
  os_signpost_id_t v6;
  OS_os_log *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  PFStoryAutoEditConfiguration *configuration;
  double Seconds;
  PFStoryAutoEditConfiguration *v23;
  double v24;
  PFStoryAutoEditConfiguration *v25;
  double v26;
  PFStoryAutoEditConfiguration *v27;
  double v28;
  PFStoryAutoEditConfiguration *v29;
  __int128 v30;
  int64_t kind;
  __int128 v32;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  PFStoryAutoEditConfiguration *v35;
  PFStoryAutoEditConfiguration *v36;
  PFStoryAutoEditConfiguration *v37;
  PFStoryAutoEditConfiguration *v38;
  double v39;
  int v40;
  int v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  char v55;
  uint64_t v56;
  double v57;
  double v58;
  uint64_t v59;
  char v60;
  void *v61;
  uint64_t v62;
  float v63;
  float v64;
  float v65;
  float v66;
  NSObject *v67;
  double v68;
  float v69;
  unint64_t v70;
  double v71;
  unint64_t v72;
  NSObject *v73;
  uint64_t v74;
  OS_os_log *v75;
  NSObject *v76;
  os_signpost_id_t spid;
  unint64_t v78;
  id v79;
  _QWORD v80[7];
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  CMTime v89;
  int v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  CMTime v96;
  __int128 v97;
  _QWORD v98[4];
  __int128 v99;
  uint64_t v100;
  CMTime v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  CMTime v107;
  __int128 v108;
  _QWORD v109[4];
  __int128 v110;
  uint64_t v111;
  CMTime v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  CMTime v118;
  __int128 v119;
  _QWORD v120[4];
  __int128 v121;
  uint64_t v122;
  CMTime v123;
  __int128 v124;
  _QWORD v125[4];
  __int128 v126;
  uint64_t v127;
  CMTime v128;
  __int128 v129;
  _QWORD v130[4];
  __int128 v131;
  uint64_t v132;
  CMTime v133;
  __int128 v134;
  _QWORD v135[4];
  __int128 v136;
  uint64_t v137;
  CMTime time;
  _QWORD v139[5];
  _BYTE buf[32];
  _DWORD v141[6];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v6 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v7 = self->_log;
  v8 = v7;
  spid = v6;
  v78 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    v9 = objc_msgSend(v79, "numberOfClips");
    PFStoryRecipeSongPaceDescription();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PXStoryAutoEditDecisionList.NUps", "Count=%ld pace=%{public}@", buf, 0x16u);

  }
  -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "disableNUp");

  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"));
    if (-[PXDisplayAssetFetchResult count](self->_displayAssets, "count"))
    {
      v14 = 0;
      do
      {
        -[PXStoryAutoEditClipComposabilityProvider composabilityScoresForDisplayAssetIndex:](self->_composabilityProvider, "composabilityScoresForDisplayAssetIndex:", v14);
        if (v16 > 0.0 || v15 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v13, "count");
          v139[0] = MEMORY[0x1E0C809B0];
          v139[1] = 3221225472;
          v139[2] = __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke;
          v139[3] = &unk_1E5138658;
          v139[4] = self;
          v19 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v17, 0, v18, 1024, v139);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "insertObject:atIndex:", v20, v19);

        }
        ++v14;
      }
      while (v14 < -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"));
    }
  }
  configuration = self->_configuration;
  if (configuration)
  {
    -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](configuration, "durationInfoForPlaybackStyle:songPace:", 1, a4);
  }
  else
  {
    v137 = 0;
    v136 = 0u;
    v134 = 0u;
    memset(v135, 0, sizeof(v135));
  }
  time = *(CMTime *)&v135[1];
  Seconds = CMTimeGetSeconds(&time);
  v23 = self->_configuration;
  if (v23)
  {
    -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](v23, "durationInfoForPlaybackStyle:songPace:", 4, a4);
  }
  else
  {
    v132 = 0;
    v131 = 0u;
    v129 = 0u;
    memset(v130, 0, sizeof(v130));
  }
  v133 = *(CMTime *)&v130[1];
  v24 = CMTimeGetSeconds(&v133);
  v25 = self->_configuration;
  if (v25)
  {
    -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](v25, "durationInfoForPlaybackStyle:songPace:", 3, a4);
  }
  else
  {
    v127 = 0;
    v126 = 0u;
    v124 = 0u;
    memset(v125, 0, sizeof(v125));
  }
  v128 = *(CMTime *)&v125[1];
  v26 = CMTimeGetSeconds(&v128);
  v27 = self->_configuration;
  if (v27)
  {
    -[PFStoryAutoEditConfiguration longOverallDuration](v27, "longOverallDuration");
  }
  else
  {
    v122 = 0;
    v121 = 0u;
    v119 = 0u;
    memset(v120, 0, sizeof(v120));
  }
  v123 = *(CMTime *)&v120[1];
  v28 = CMTimeGetSeconds(&v123);
  v29 = self->_configuration;
  if (v29)
  {
    -[PFStoryAutoEditConfiguration longOverallDuration](v29, "longOverallDuration");
  }
  else
  {
    v117 = 0;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
  }
  *(_OWORD *)&v118.value = v113;
  v118.epoch = v114;
  *(double *)&v30 = CMTimeGetSeconds(&v118);
  kind = self->_targetOverallDurationInfo.kind;
  switch(kind)
  {
    case 4:
      v36 = self->_configuration;
      if (v36)
      {
        -[PFStoryAutoEditConfiguration mediumOverallDuration](v36, "mediumOverallDuration", *(double *)&v30);
      }
      else
      {
        v100 = 0;
        v99 = 0u;
        v97 = 0u;
        memset(v98, 0, sizeof(v98));
      }
      v101 = *(CMTime *)&v98[1];
      v28 = CMTimeGetSeconds(&v101);
      v38 = self->_configuration;
      if (v38)
      {
        -[PFStoryAutoEditConfiguration mediumOverallDuration](v38, "mediumOverallDuration");
      }
      else
      {
        v95 = 0;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
      }
      *(_OWORD *)&v96.value = v91;
      v96.epoch = v92;
      *(double *)&v30 = CMTimeGetSeconds(&v96);
      break;
    case 3:
      goto LABEL_32;
    case 2:
      v30 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.value;
      v32 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.epoch;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&buf[16] = v32;
      flags = self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.flags;
      v141[0] = self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.timescale;
      if ((flags & 0x1D) == 1)
      {
        epoch = self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.epoch;
        v89.value = *(_QWORD *)&buf[24];
        v89.timescale = v141[0];
        v89.flags = flags;
        v89.epoch = epoch;
        v28 = CMTimeGetSeconds(&v89);
        v89 = *(CMTime *)buf;
        *(double *)&v30 = CMTimeGetSeconds(&v89);
        break;
      }
LABEL_32:
      v35 = self->_configuration;
      if (v35)
      {
        -[PFStoryAutoEditConfiguration shortOverallDuration](v35, "shortOverallDuration", *(double *)&v30);
      }
      else
      {
        v111 = 0;
        v110 = 0u;
        v108 = 0u;
        memset(v109, 0, sizeof(v109));
      }
      v112 = *(CMTime *)&v109[1];
      v28 = CMTimeGetSeconds(&v112);
      v37 = self->_configuration;
      if (v37)
      {
        -[PFStoryAutoEditConfiguration shortOverallDuration](v37, "shortOverallDuration");
      }
      else
      {
        v106 = 0;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
      }
      *(_OWORD *)&v107.value = v102;
      v107.epoch = v103;
      *(double *)&v30 = CMTimeGetSeconds(&v107);
      break;
  }
  if (*(double *)&v30 < v28)
    v39 = *(double *)&v30;
  else
    v39 = v28;
  v89.value = 0;
  *(_QWORD *)&v89.timescale = &v89;
  v89.epoch = 0x2020000000;
  v90 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke_2;
  v80[3] = &unk_1E5138680;
  v80[4] = &v89;
  v80[5] = &v85;
  v80[6] = &v81;
  objc_msgSend(v79, "enumerateClipsUsingBlock:", v80);
  v40 = *(_DWORD *)(*(_QWORD *)&v89.timescale + 24);
  v41 = *((_DWORD *)v86 + 6);
  v42 = *((_DWORD *)v82 + 6);
  -[PFStoryAutoEditConfiguration diptychDurationMultiplier](self->_configuration, "diptychDurationMultiplier");
  v44 = v43;
  -[PFStoryAutoEditConfiguration triptychDurationMultiplier](self->_configuration, "triptychDurationMultiplier");
  v46 = v45;
  -[PFStoryAutoEditConfiguration composabilityTargetDurationMultiplier](self->_configuration, "composabilityTargetDurationMultiplier");
  v48 = v47;
  PLStoryGetLog();
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v24 * (double)v41 + (double)v40 * Seconds + (double)v42 * v26;
  v51 = v28 * v48;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v52 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v50;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v52;
    _os_log_impl(&dword_1A6789000, v49, OS_LOG_TYPE_DEBUG, "Target duration: %0.2f, current duration: %0.2f, composable clips: %lu", buf, 0x20u);
  }

  v53 = -[PFStoryAutoEditConfiguration composabilityMinimumNUpCount](self->_configuration, "composabilityMinimumNUpCount");
  -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "nUpCompositionIgnoresOverallTargetDuration");

  v56 = 0;
  v57 = Seconds * (2.0 - v44);
  v58 = Seconds * (3.0 - v46);
  while (1)
  {
    v59 = objc_msgSend(v13, "count");
    v60 = v50 > v39 ? 1 : v55;
    if (!v59 || (v60 & 1) == 0)
      break;
    objc_msgSend(v13, "lastObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "unsignedIntegerValue");

    objc_msgSend(v13, "removeLastObject");
    -[PXStoryAutoEditClipComposabilityProvider composabilityScoresForDisplayAssetIndex:](self->_composabilityProvider, "composabilityScoresForDisplayAssetIndex:", v62);
    v64 = v63;
    v66 = v65;
    PLStoryGetLog();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v62;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v66;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v64;
      _os_log_impl(&dword_1A6789000, v67, OS_LOG_TYPE_DEBUG, "Asset: %lu, Triptych score: %0.2f, diptych score: %0.2f", buf, 0x20u);
    }

    if (v56 >= v53 && v50 <= v51)
    {
      -[PFStoryAutoEditConfiguration composabilityScoreThreshold](self->_configuration, "composabilityScoreThreshold");
      v69 = v64 >= v66 ? v64 : v66;
      if (v68 >= v69)
        break;
    }
    if (v66 <= v64)
    {
      v72 = -[PXStorySongsAutoEditDecisionListsProducer _composeClips:inAssetRange:](self, "_composeClips:inAssetRange:", v79, v62, 2);
      if (v72 == 3)
      {
        v50 = v50 - (v58 - v57);
      }
      else
      {
        if (v72 != 2)
          goto LABEL_77;
        v50 = v50 - v57;
      }
      ++v56;
    }
    else
    {
      v70 = -[PXStorySongsAutoEditDecisionListsProducer _composeClips:inAssetRange:](self, "_composeClips:inAssetRange:", v79, v62, 3);
      if (v70 == 3)
        v71 = v58;
      else
        v71 = 0.0;
      v50 = v50 - v71;
      if (v70 == 3)
        ++v56;
    }
LABEL_77:
    PLStoryGetLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      v74 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218752;
      *(double *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v50;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v56;
      LOWORD(v141[0]) = 2048;
      *(_QWORD *)((char *)v141 + 2) = v74;
      _os_log_impl(&dword_1A6789000, v73, OS_LOG_TYPE_DEBUG, "Target duration: %0.2f, current duration: %0.2f, composed clips: %lu, remaining composable clips: %lu", buf, 0x2Au);
    }

  }
  v75 = self->_log;
  v76 = v75;
  if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v75))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v76, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditDecisionList.NUps", ", buf, 2u);
  }

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

}

- (unint64_t)_composeClips:(id)a3 inAssetRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  float v52;
  float v53;
  double v54;
  double v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "disableNUp");

  if ((v9 & 1) == 0)
  {
    -[PXStoryAutoEditMomentsProvider momentForDisplayAssetIndex:](self->_momentsProvider, "momentForDisplayAssetIndex:", location);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = location + length;
    v13 = objc_msgSend(v11, "assetIndexRange");
    if (location + length > v13 + v14)
      goto LABEL_7;
    if (!location)
      goto LABEL_7;
    if (v12 == -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"))
      goto LABEL_7;
    -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", location);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "indexOfClipForDisplayAsset:", v15);

    -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v12 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v7, "indexOfClipForDisplayAsset:", v17);

    if (v18 == v16)
      goto LABEL_7;
    v59 = v18 - v16;
    v60 = v18;
    v61 = v16;
    if (v18 < v16)
    {
      v10 = 0;
    }
    else
    {
      v45 = v11;
      v10 = 0;
      v46 = v18 + 1;
      do
      {
        objc_msgSend(v7, "clipAtIndex:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "playbackStyle") != 1)
        {
          v10 = 0;
          v11 = v45;
          goto LABEL_48;
        }
        objc_msgSend(v20, "displayAssets");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v10 += objc_msgSend(v47, "count");

        ++v16;
      }
      while (v46 != v16);
      if (v10 > 3)
      {
        v10 = 0;
        v11 = v45;
        goto LABEL_8;
      }
      v11 = v45;
      if (length == 2 && v10 == 3)
      {
        objc_msgSend(v7, "clipAtIndex:", v61);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "displayAssets");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", location);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "indexOfObject:", v50);

        -[PXStoryAutoEditClipComposabilityProvider composabilityScoresForDisplayAssetIndex:](self->_composabilityProvider, "composabilityScoresForDisplayAssetIndex:", location - v51);
        v53 = v52;
        -[PFStoryAutoEditConfiguration composabilityScoreThreshold](self->_configuration, "composabilityScoreThreshold");
        v55 = v54;

        if (v55 > v53)
        {
LABEL_7:
          v10 = 0;
LABEL_8:

          goto LABEL_9;
        }
        v10 = 3;
      }
    }
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "autoEditUseMomentRecipes"))
    {
      v57 = v11;
      v56 = -[PFStoryAutoEditConfiguration composabilityMaximumNUpRunCount](self->_configuration, "composabilityMaximumNUpRunCount");
      v21 = v61;
      if (v61 >= 1)
      {
        v21 = v61;
        while (1)
        {
          v22 = v21 - 1;
          objc_msgSend(v7, "clipAtIndex:", v21 - 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "displayAssets");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

          if (v25 < 2)
            break;
          --v21;
          if ((unint64_t)(v22 + 1) <= 1)
          {
            v21 = 0;
            break;
          }
        }
      }
      v26 = v60;
      do
      {
        v27 = v26++;
        if (v26 >= objc_msgSend(v7, "numberOfClips"))
          break;
        objc_msgSend(v7, "clipAtIndex:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "displayAssets");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

      }
      while (v30 > 1);
      v31 = v61 - (v60 + v21) + v27 + 1;
      v11 = v57;
      if (v31 > v56)
        goto LABEL_46;
    }
    if (objc_msgSend(v20, "autoEditUseMomentRecipes"))
    {
      v58 = v11;
      v32 = -[PFStoryAutoEditConfiguration composabilityMinimum1UpRunCount](self->_configuration, "composabilityMinimum1UpRunCount");
      v33 = (v61 - v32) & ~((v61 - v32) >> 63);
      v34 = v61;
      if (v61 > v33)
      {
        v34 = v61;
        do
        {
          v35 = v34 - 1;
          objc_msgSend(v7, "clipAtIndex:", v34 - 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "displayAssets");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          if (v38 != 1)
            break;
          --v34;
        }
        while (v35 > v33);
      }
      v39 = v60;
      do
      {
        v40 = v39;
        v41 = v39 + 1;
        if (v39 + 1 >= objc_msgSend(v7, "numberOfClips"))
          break;
        if (v40 >= v32 + v60)
          break;
        objc_msgSend(v7, "clipAtIndex:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "displayAssets");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        v39 = v40 + 1;
      }
      while (v44 == 1);
      if (v61 - v34 >= 1 && v61 - v34 < v32)
      {
        v10 = 0;
        v11 = v58;
LABEL_48:

        goto LABEL_8;
      }
      v11 = v58;
      if (v40 - v60 >= 1 && v40 - v60 < v32)
      {
LABEL_46:
        v10 = 0;
        goto LABEL_48;
      }
    }
    objc_msgSend(v7, "composeClipsInRange:", v61, v59 + 1);
    goto LABEL_48;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (void)_populateModulesInClips:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  PXStoryRecipeClipModuleProvider *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  id v14;
  PXStoryRecipeClipModuleProvider *v15;
  OS_os_log *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  PXStoryRecipeClipModuleProvider *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v4, "numberOfClips");
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXStoryAutoEditDecisionList.Modules", "Count=%ld", buf, 0xCu);
  }

  v8 = -[PXStoryRecipeClipModuleProvider initWithConfiguration:]([PXStoryRecipeClipModuleProvider alloc], "initWithConfiguration:", self->_configuration);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "autoEditModuleLengthMax");

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "autoEditEmptySpaceLengthMax");

  momentsProvider = self->_momentsProvider;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke;
  v18[3] = &unk_1E51386F0;
  v18[4] = self;
  v14 = v4;
  v19 = v14;
  v15 = v8;
  v20 = v15;
  v21 = v10;
  v22 = v12;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](momentsProvider, "enumerateMomentsUsingBlock:", v18);
  v16 = self->_log;
  v17 = v16;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_END, v5, "PXStoryAutoEditDecisionList.Modules", ", buf, 2u);
  }

}

- (void)_populateMotionStylesAndTransitionsInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "autoEditUseMomentRecipes");

  if (v10)
  {
    -[PXStorySongsAutoEditDecisionListsProducer _populateMomentRecipesInClips:forSongPace:colorGradeCategory:](self, "_populateMomentRecipesInClips:forSongPace:colorGradeCategory:", v12, a4, v8);
  }
  else
  {
    -[PXStorySongsAutoEditDecisionListsProducer _populateMotionStylesInClips:forSongPace:colorGradeCategory:](self, "_populateMotionStylesInClips:forSongPace:colorGradeCategory:", v12, a4, v8);
    -[PXStorySongsAutoEditDecisionListsProducer _populateTransitionsInClips:forSongPace:colorGradeCategory:](self, "_populateTransitionsInClips:forSongPace:colorGradeCategory:", v12, a4, v8);
  }
  -[PXStorySongsAutoEditDecisionListsProducer chapterCollection](self, "chapterCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStorySongsAutoEditDecisionListsProducer _adjustTransitionsInClips:forChapterCollection:](self, "_adjustTransitionsInClips:forChapterCollection:", v12, v11);

}

- (void)_populateMomentRecipesInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  id v9;
  os_signpost_id_t v10;
  OS_os_log *v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  PXStoryMomentRecipeProvider *v16;
  PFStoryAutoEditConfiguration *v17;
  uint64_t v18;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  id v20;
  PXStoryMomentRecipeProvider *v21;
  PFStoryAutoEditConfiguration *v22;
  PXStoryMomentRecipeProvider *v23;
  id v24;
  OS_os_log *v25;
  NSObject *v26;
  os_signpost_id_t spid;
  _QWORD v28[4];
  PXStoryMomentRecipeProvider *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  PXStoryMomentRecipeProvider *v33;
  PFStoryAutoEditConfiguration *v34;
  int64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v11 = self->_log;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    v14 = objc_msgSend(v8, "numberOfClips");
    PFStoryRecipeSongPaceDescription();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v37 = v14;
    v38 = 2114;
    v39 = v15;
    v40 = 2114;
    v41 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.MomentRecipes", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);

  }
  spid = v10;

  v16 = -[PXStoryMomentRecipeProvider initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:]([PXStoryMomentRecipeProvider alloc], "initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:", self->_configuration, v9, a4, self->_randomNumberGenerator);
  v17 = self->_configuration;
  v18 = MEMORY[0x1E0C809B0];
  momentsProvider = self->_momentsProvider;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke;
  v31[3] = &unk_1E5138760;
  v31[4] = self;
  v20 = v8;
  v32 = v20;
  v21 = v16;
  v33 = v21;
  v22 = v17;
  v34 = v22;
  v35 = a4;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](momentsProvider, "enumerateMomentsUsingBlock:", v31);
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_5;
  v28[3] = &unk_1E51387D8;
  v23 = v21;
  v29 = v23;
  v24 = v20;
  v30 = v24;
  objc_msgSend(v24, "enumerateClipsUsingBlock:", v28);
  v25 = self->_log;
  v26 = v25;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v26, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditDecisionList.MomentRecipes", ", buf, 2u);
  }

}

- (void)_populateMotionStylesInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  id v9;
  os_signpost_id_t v10;
  OS_os_log *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  PXStoryRecipeClipMotionStyleProvider *v15;
  PFStoryAutoEditConfiguration *configuration;
  PFRandomNumberGenerator *randomNumberGenerator;
  void *v18;
  PXStoryRecipeClipMotionStyleProvider *v19;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  id v21;
  PXStoryRecipeClipMotionStyleProvider *v22;
  OS_os_log *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  PXStoryRecipeClipMotionStyleProvider *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v11 = self->_log;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    v13 = objc_msgSend(v8, "numberOfClips");
    PFStoryRecipeSongPaceDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.MotionStyles", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);

  }
  v15 = [PXStoryRecipeClipMotionStyleProvider alloc];
  configuration = self->_configuration;
  randomNumberGenerator = self->_randomNumberGenerator;
  -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXStoryRecipeClipMotionStyleProvider initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:storyConfiguration:](v15, "initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:storyConfiguration:", configuration, v9, a4, randomNumberGenerator, v18);

  momentsProvider = self->_momentsProvider;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke;
  v25[3] = &unk_1E5138848;
  v25[4] = self;
  v21 = v8;
  v26 = v21;
  v22 = v19;
  v27 = v22;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](momentsProvider, "enumerateMomentsUsingBlock:", v25);
  v23 = self->_log;
  v24 = v23;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.MotionStyles", ", buf, 2u);
  }

}

- (void)_populateTransitionsInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8;
  id v9;
  os_signpost_id_t v10;
  OS_os_log *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  PXStoryRecipeClipTransitionProvider *v15;
  PFStoryAutoEditConfiguration *v16;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  id v18;
  PXStoryRecipeClipTransitionProvider *v19;
  PFStoryAutoEditConfiguration *v20;
  OS_os_log *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  PXStoryRecipeClipTransitionProvider *v25;
  PFStoryAutoEditConfiguration *v26;
  int64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v11 = self->_log;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    v13 = objc_msgSend(v8, "numberOfClips");
    PFStoryRecipeSongPaceDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.Transitions", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);

  }
  v15 = -[PXStoryRecipeClipTransitionProvider initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:]([PXStoryRecipeClipTransitionProvider alloc], "initWithConfiguration:colorGradeCategory:songPace:randomNumberGenerator:", self->_configuration, v9, a4, self->_randomNumberGenerator);
  v16 = self->_configuration;
  momentsProvider = self->_momentsProvider;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke;
  v23[3] = &unk_1E5138760;
  v23[4] = self;
  v18 = v8;
  v24 = v18;
  v19 = v15;
  v25 = v19;
  v20 = v16;
  v26 = v20;
  v27 = a4;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](momentsProvider, "enumerateMomentsUsingBlock:", v23);
  v21 = self->_log;
  v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.Transitions", ", buf, 2u);
  }

}

- (_NSRange)_clipRangeForMoment:(id)a3 inClips:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSObject *v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;
  _NSRange result;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "firstGlobalIndex");
  v9 = objc_msgSend(v6, "lastGlobalIndex");
  -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "indexOfClipForDisplayAsset:", v10);

  -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "indexOfClipForDisplayAsset:", v12);

  if (v13 < v11)
  {
    PLStoryGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134219010;
      v27 = v8;
      v28 = 2048;
      v29 = v9;
      v30 = 2048;
      v31 = v11;
      v32 = 2048;
      v33 = v13;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_FAULT, "Out of order clips detected. firstAssetIdx: %lu, lastAssetIdx: %lu, firstClipIdx: %lu, lastClipIdx: %lu, moment: %@", buf, 0x34u);
    }

    if (-[PXDisplayAssetFetchResult count](self->_displayAssets, "count") >= 1)
    {
      v19 = 0;
      *(_QWORD *)&v18 = 134218498;
      v25 = v18;
      do
      {
        -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v19, v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PLStoryGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = v20;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "alternateUUID");
          else
            objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = v25;
          v27 = v19;
          v28 = 2112;
          v29 = (uint64_t)v23;
          v30 = 2112;
          v31 = (uint64_t)v22;
          _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "  #%ti: %@ %@", buf, 0x20u);

        }
        ++v19;
      }
      while (v19 < -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"));
    }
    PLStoryGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEBUG, "Swapping first and last clip index.", buf, 2u);
    }

    v14 = v11;
  }
  else
  {
    v14 = v13;
    v13 = v11;
  }

  v15 = v14 - v13 + 1;
  v16 = v13;
  result.length = v15;
  result.location = v16;
  return result;
}

- (void)_adjustTransitionsInClips:(id)a3 forChapterCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  char v16;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "numberOfChapters"))
  {
    -[PXStorySongsAutoEditDecisionListsProducer _indexesOfClips:atChapterBeginningInChapterCollection:](self, "_indexesOfClips:atChapterBeginningInChapterCollection:", v12, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "forcedTransitionKindAtChapterBoundary");
    v10 = objc_msgSend(v8, "disableUnsupportedTransitionsAtChapterBoundary");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__PXStorySongsAutoEditDecisionListsProducer__adjustTransitionsInClips_forChapterCollection___block_invoke;
    v13[3] = &unk_1E51388C0;
    v14 = v7;
    v15 = v9;
    v16 = v10;
    v11 = v7;
    objc_msgSend(v12, "enumerateMutableClipsUsingBlock:", v13);

  }
}

- (id)_indexesOfClips:(id)a3 atChapterBeginningInChapterCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "numberOfClips");
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v5, "clipAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayAssets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v6, "containsChapterBeginningWithAsset:", v12))
        objc_msgSend(v8, "addIndex:", i);

    }
  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (void)_adjustDurationOfClips:(id)a3 forSongPace:(int64_t)a4
{
  id v6;
  os_signpost_id_t v7;
  OS_os_log *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  PFStoryAutoEditConfiguration *v12;
  uint64_t v13;
  PFStoryAutoEditConfiguration *v14;
  PFStoryAutoEditConfiguration *v15;
  uint64_t v16;
  OS_os_log *v17;
  NSObject *v18;
  _QWORD v19[6];
  _QWORD v20[4];
  PFStoryAutoEditConfiguration *v21;
  _QWORD v22[4];
  PFStoryAutoEditConfiguration *v23;
  _QWORD v24[5];
  PFStoryAutoEditConfiguration *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v8 = self->_log;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    v10 = objc_msgSend(v6, "numberOfClips");
    PFStoryRecipeSongPaceDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXStoryAutoEditDecisionList.Durations", "Count=%ld pace=%{public}@", buf, 0x16u);

  }
  v12 = self->_configuration;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke;
  v24[3] = &unk_1E51388E8;
  v24[4] = self;
  v14 = v12;
  v25 = v14;
  objc_msgSend(v6, "enumerateMutableClipsUsingBlock:", v24);
  if (objc_msgSend(v6, "numberOfClips") >= 1)
  {
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_2;
    v22[3] = &unk_1E5138788;
    v15 = v14;
    v23 = v15;
    objc_msgSend(v6, "updateClipAtIndex:usingBlock:", 0, v22);
    v16 = objc_msgSend(v6, "numberOfClips") - 1;
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_3;
    v20[3] = &unk_1E5138788;
    v21 = v15;
    objc_msgSend(v6, "updateClipAtIndex:usingBlock:", v16, v20);

  }
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_4;
  v19[3] = &unk_1E5138910;
  v19[4] = self;
  v19[5] = a4;
  objc_msgSend(v6, "enumeratePairsOfMutableClipsUsingBlock:", v19);
  v17 = self->_log;
  v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryAutoEditDecisionList.Durations", ", buf, 2u);
  }

}

- (void)_adjustAudioPlaybackForClips:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  void *v8;
  id v9;
  OS_os_log *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v4, "numberOfClips");
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXStoryAutoEditDecisionList.AudioMode", "Count=%ld", buf, 0xCu);
  }

  -[PXStorySongsAutoEditDecisionListsProducer storyConfiguration](self, "storyConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PXStorySongsAutoEditDecisionListsProducer__adjustAudioPlaybackForClips___block_invoke;
  v12[3] = &unk_1E51388E8;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  objc_msgSend(v4, "enumerateMutableClipsUsingBlock:", v12);
  v10 = self->_log;
  v11 = v10;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v5, "PXStoryAutoEditDecisionList.AudioMode", ", buf, 2u);
  }

}

- (void)_adjustAudioTransitionForClips:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OS_os_log *v18;
  NSObject *v19;
  _QWORD v20[9];
  char v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v4, "numberOfClips");
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXStoryAutoEditDecisionList.AudioCuts", "Count=%ld", buf, 0xCu);
  }

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "wantsAudioJLCuts");
  objc_msgSend(v8, "audioJCutDuration");
  v11 = v10;
  objc_msgSend(v8, "audioLCutDuration");
  v13 = v12;
  v14 = objc_msgSend(v8, "wantsAudioFade");
  objc_msgSend(v8, "audioFadeMinDuration");
  v16 = v15;
  objc_msgSend(v8, "audioFadeMaxDuration");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__PXStorySongsAutoEditDecisionListsProducer__adjustAudioTransitionForClips___block_invoke;
  v20[3] = &unk_1E5138938;
  v20[4] = self;
  v21 = v9;
  v20[5] = v11;
  v20[6] = v13;
  v22 = v14;
  v20[7] = v16;
  v20[8] = v17;
  objc_msgSend(v4, "enumeratePairsOfMutableClipsUsingBlock:", v20);
  v18 = self->_log;
  v19 = v18;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_END, v5, "PXStoryAutoEditDecisionList.AudioCuts", ", buf, 2u);
  }

}

- ($336525CEFD5B2F1C5550B48E7B6054AC)_optimizeOverallDurationOfClips:(SEL)a3 forSong:(id)a4
{
  id v8;
  CMTimeFlags v9;
  CMTimeEpoch v10;
  os_signpost_id_t v11;
  OS_os_log *v12;
  NSObject *v13;
  unint64_t v14;
  CMTimeValue v15;
  void *v16;
  int64_t kind;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  PFStoryAutoEditConfiguration *configuration;
  PFStoryAutoEditConfiguration *v23;
  PFStoryAutoEditConfiguration *v24;
  unint64_t v25;
  NSObject *v26;
  PFStoryAutoEditConfiguration *v27;
  NSObject *v28;
  $336525CEFD5B2F1C5550B48E7B6054AC *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  PFStoryAutoEditConfiguration *v33;
  void *v34;
  void *v35;
  NSMutableArray *ttrUnitTestsForFailedDurationConstraints;
  void *v37;
  void *v38;
  uint64_t v39;
  CMTime *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  OS_os_log *v59;
  NSObject *v60;
  $336525CEFD5B2F1C5550B48E7B6054AC *result;
  CMTimeFlags v62;
  $336525CEFD5B2F1C5550B48E7B6054AC *v63;
  os_signpost_id_t spid;
  id v65;
  id v66;
  _QWORD v67[4];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CMTime v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CMTime v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  CMTime v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  CMTime v90;
  CMTime v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  CMTime v95;
  _QWORD v96[4];
  id v97;
  CMTimeValue v98;
  CMTimeScale v99;
  CMTimeFlags v100;
  CMTimeEpoch v101;
  CMTime v102;
  _BYTE time2[32];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  CMTime buf[2];
  _OWORD v108[2];
  CMTimeValue v109;
  CMTimeScale v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v66 = a4;
  v8 = a5;
  objc_msgSend(v8, "pace");
  PXAudioAssetExportableDurationWithDefaultEntryPoint(v8, (uint64_t)&v98);
  v109 = v98;
  v9 = v100;
  v110 = v99;
  if ((v100 & 1) != 0)
  {
    v10 = v101;
  }
  else
  {
    v10 = 0;
    v110 = 0;
    v109 = 0;
    v9 = 5;
  }
  v11 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v12 = self->_log;
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v12))
  {
    v15 = objc_msgSend(v66, "numberOfClips");
    PFStoryRecipeSongPaceDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf[0].value) = 134218242;
    *(CMTimeValue *)((char *)&buf[0].value + 4) = v15;
    LOWORD(buf[0].flags) = 2114;
    *(_QWORD *)((char *)&buf[0].flags + 2) = v16;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXStoryAutoEditDecisionList.OverallDuration", "Count=%ld pace=%{public}@", (uint8_t *)buf, 0x16u);

    v14 = v11 - 1;
  }

  kind = self->_targetOverallDurationInfo.kind;
  v18 = (_OWORD *)MEMORY[0x1E0D759B0];
  v19 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
  *(_OWORD *)&retstr->var1.var1.var3 = v19;
  *(_OWORD *)&retstr->var1.var2.var1 = v18[4];
  v20 = v18[1];
  *(_OWORD *)&retstr->var0 = *v18;
  *(_OWORD *)&retstr->var1.var0.var1 = v20;
  if (kind)
  {
    spid = v11;
    v21 = (void *)objc_opt_new();
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke;
    v96[3] = &unk_1E513BD30;
    v65 = v21;
    v97 = v65;
    objc_msgSend(v66, "enumerateClipsUsingBlock:", v96);
    switch(self->_targetOverallDurationInfo.kind)
    {
      case 1:
      case 5:
        memset(&v102, 0, sizeof(v102));
        configuration = self->_configuration;
        if (configuration)
        {
          -[PFStoryAutoEditConfiguration longOverallDuration](configuration, "longOverallDuration");
        }
        else
        {
          v75 = 0u;
          memset(&v76, 0, sizeof(v76));
          v73 = 0u;
          v74 = 0u;
        }
        buf[0] = v76;
        *(_QWORD *)time2 = v109;
        *(_DWORD *)&time2[8] = v110;
        *(_DWORD *)&time2[12] = v9;
        *(_QWORD *)&time2[16] = v10;
        CMTimeMinimum(&v102, buf, (CMTime *)time2);
        buf[0] = v102;
        if ((objc_msgSend(v65, "solveForMaximumDuration:", buf) & 1) != 0)
          goto LABEL_48;
        memset(v108, 0, sizeof(v108));
        memset(buf, 0, sizeof(buf));
        if (v65)
          objc_msgSend(v65, "constrainedOverallDurationInfo");
        *(_OWORD *)time2 = *(_OWORD *)((char *)v108 + 8);
        *(_QWORD *)&time2[16] = *((_QWORD *)&v108[1] + 1);
        v91 = v102;
        if (CMTimeCompare((CMTime *)time2, &v91) < 1)
          goto LABEL_77;
        v25 = v14;
        PLStoryGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          goto LABEL_45;
        goto LABEL_44;
      case 2:
        memset(&v102, 0, sizeof(v102));
        if ((self->_targetOverallDurationInfo.specificDurationInfo.maximumDuration.flags & 0x1D) == 1)
        {
          buf[0] = (CMTime)self->_targetOverallDurationInfo.specificDurationInfo.maximumDuration;
          *(_QWORD *)time2 = v109;
          *(_DWORD *)&time2[8] = v110;
          *(_DWORD *)&time2[12] = v9;
          *(_QWORD *)&time2[16] = v10;
          CMTimeMinimum(&v102, buf, (CMTime *)time2);
        }
        else
        {
          v27 = self->_configuration;
          if (v27)
          {
            -[PFStoryAutoEditConfiguration longOverallDuration](v27, "longOverallDuration");
          }
          else
          {
            v79 = 0u;
            memset(&v80, 0, sizeof(v80));
            v77 = 0u;
            v78 = 0u;
          }
          buf[0] = v80;
          *(_QWORD *)time2 = v109;
          *(_DWORD *)&time2[8] = v110;
          *(_DWORD *)&time2[12] = v9;
          *(_QWORD *)&time2[16] = v10;
          CMTimeMinimum(&v91, buf, (CMTime *)time2);
          v102 = v91;
        }
        buf[0] = v102;
        if ((objc_msgSend(v65, "solveForMaximumDuration:", buf) & 1) != 0)
          goto LABEL_48;
        memset(v108, 0, sizeof(v108));
        memset(buf, 0, sizeof(buf));
        if (v65)
          objc_msgSend(v65, "constrainedOverallDurationInfo");
        *(_OWORD *)time2 = *(_OWORD *)((char *)v108 + 8);
        *(_QWORD *)&time2[16] = *((_QWORD *)&v108[1] + 1);
        v91.value = v109;
        v91.timescale = v110;
        v91.flags = v9;
        v91.epoch = v10;
        if (CMTimeCompare((CMTime *)time2, &v91) >= 1)
        {
          v25 = v14;
          PLStoryGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
LABEL_44:
            *(CMTime *)time2 = v102;
            PXStoryTimeDescription((CMTime *)time2);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = *(_OWORD *)&buf[1].timescale;
            v105 = v108[0];
            v106 = v108[1];
            *(_OWORD *)time2 = *(_OWORD *)&buf[0].value;
            *(_OWORD *)&time2[16] = *(_OWORD *)&buf[0].epoch;
            PFStoryOverallDurationInfoDescription();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)time2 = 138412546;
            *(_QWORD *)&time2[4] = v34;
            *(_WORD *)&time2[12] = 2114;
            *(_QWORD *)&time2[14] = v35;
            _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_INFO, "Failed to constrain maximum duration of auto edit clips for the Long duration to %@ or less. Actual overall duration: %{public}@", time2, 0x16u);

          }
LABEL_45:

          ttrUnitTestsForFailedDurationConstraints = self->_ttrUnitTestsForFailedDurationConstraints;
          PFStoryRecipeSongPaceDescription();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(CMTime *)time2 = v102;
          objc_msgSend(v65, "diagnosticSwiftCodeForDurationUnitTestNamed:maximumDuration:", v37, time2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](ttrUnitTestsForFailedDurationConstraints, "addObject:", v38);

          v14 = v25;
        }
        goto LABEL_77;
      case 3:
        memset(&v102, 0, sizeof(v102));
        v23 = self->_configuration;
        if (v23)
        {
          -[PFStoryAutoEditConfiguration shortOverallDuration](v23, "shortOverallDuration");
        }
        else
        {
          v94 = 0u;
          memset(&v95, 0, sizeof(v95));
          v92 = 0u;
          v93 = 0u;
        }
        buf[0] = v95;
        *(_QWORD *)time2 = v109;
        *(_DWORD *)&time2[8] = v110;
        *(_DWORD *)&time2[12] = v9;
        *(_QWORD *)&time2[16] = v10;
        CMTimeMinimum(&v102, buf, (CMTime *)time2);
        buf[0] = v102;
        if (!objc_msgSend(v65, "solveForMaximumDuration:", buf))
          goto LABEL_77;
        goto LABEL_48;
      case 4:
        memset(&v91, 0, sizeof(v91));
        v24 = self->_configuration;
        if (v24)
        {
          -[PFStoryAutoEditConfiguration mediumOverallDuration](v24, "mediumOverallDuration");
        }
        else
        {
          v89 = 0u;
          memset(&v90, 0, sizeof(v90));
          v87 = 0u;
          v88 = 0u;
        }
        buf[0] = v90;
        *(_QWORD *)time2 = v109;
        *(_DWORD *)&time2[8] = v110;
        *(_DWORD *)&time2[12] = v9;
        *(_QWORD *)&time2[16] = v10;
        CMTimeMinimum(&v91, buf, (CMTime *)time2);
        buf[0] = v91;
        if ((objc_msgSend(v65, "solveForMaximumDuration:", buf) & 1) != 0)
          goto LABEL_48;
        memset(v108, 0, sizeof(v108));
        memset(buf, 0, sizeof(buf));
        if (v65)
          objc_msgSend(v65, "constrainedOverallDurationInfo");
        PLStoryGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(CMTime *)time2 = v91;
          PXStoryTimeDescription((CMTime *)time2);
          v62 = v9;
          v29 = retstr;
          v30 = v14;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = *(_OWORD *)&buf[1].timescale;
          v105 = v108[0];
          v106 = v108[1];
          *(_OWORD *)time2 = *(_OWORD *)&buf[0].value;
          *(_OWORD *)&time2[16] = *(_OWORD *)&buf[0].epoch;
          PFStoryOverallDurationInfoDescription();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)time2 = 138412546;
          *(_QWORD *)&time2[4] = v31;
          *(_WORD *)&time2[12] = 2114;
          *(_QWORD *)&time2[14] = v32;
          _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_INFO, "Failed to constrain maximum duration of auto edit clips for the Medium duration to %@ or less. Actual overall duration: %{public}@", time2, 0x16u);

          v14 = v30;
          retstr = v29;
          v9 = v62;
        }

        memset(&v86, 0, sizeof(v86));
        v33 = self->_configuration;
        if (v33)
        {
          -[PFStoryAutoEditConfiguration longOverallDuration](v33, "longOverallDuration");
        }
        else
        {
          v85 = 0;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
        }
        *(_OWORD *)time2 = v84;
        *(_QWORD *)&time2[16] = v85;
        v102.value = v109;
        v102.timescale = v110;
        v102.flags = v9;
        v102.epoch = v10;
        CMTimeMinimum(&v86, (CMTime *)time2, &v102);
        *(CMTime *)time2 = v86;
        if ((objc_msgSend(v65, "solveForMaximumDuration:", time2) & 1) != 0)
        {
LABEL_48:
          v63 = retstr;
          if (objc_msgSend(v66, "numberOfClips") >= 1)
          {
            v39 = 0;
            v40 = (CMTime *)MEMORY[0x1E0CA2E68];
            do
            {
              memset(v108, 0, 24);
              memset(buf, 0, sizeof(buf));
              if (v65)
                objc_msgSend(v65, "constrainedDurationInfoAtIndex:", v39);
              *(CMTime *)time2 = buf[0];
              v102 = *v40;
              if (CMTimeCompare((CMTime *)time2, &v102) <= 0)
              {
                PXAssertGetLog();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)time2 = 0;
                  _os_log_error_impl(&dword_1A6789000, v41, OS_LOG_TYPE_ERROR, "constrained minimum duration should never be 0", time2, 2u);
                }

              }
              *(CMTime *)time2 = buf[1];
              v102 = *v40;
              if (CMTimeCompare((CMTime *)time2, &v102) <= 0)
              {
                PXAssertGetLog();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)time2 = 0;
                  _os_log_error_impl(&dword_1A6789000, v42, OS_LOG_TYPE_ERROR, "constrained preferred duration should never be 0", time2, 2u);
                }

              }
              *(CMTime *)time2 = buf[1];
              v102 = buf[0];
              if (CMTimeCompare((CMTime *)time2, &v102) < 0)
              {
                PXAssertGetLog();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)time2 = 0;
                  _os_log_error_impl(&dword_1A6789000, v43, OS_LOG_TYPE_ERROR, "constrained preferred duration must be >= the minimum duration", time2, 2u);
                }

              }
              PLStoryGetLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(CMTime *)time2 = buf[1];
                PXStoryTimeDescription((CMTime *)time2);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)time2 = 134218242;
                *(_QWORD *)&time2[4] = v39;
                *(_WORD *)&time2[12] = 2114;
                *(_QWORD *)&time2[14] = v45;
                _os_log_impl(&dword_1A6789000, v44, OS_LOG_TYPE_DEBUG, "constrained duration [%lu] %{public}@", time2, 0x16u);

              }
              v67[0] = MEMORY[0x1E0C809B0];
              v67[1] = 3221225472;
              v67[2] = __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke_171;
              v67[3] = &__block_descriptor_104_e38_v16__0___PXStoryMutableAutoEditClip__8l;
              v70 = *(_OWORD *)&buf[1].timescale;
              v71 = v108[0];
              v72 = *(_QWORD *)&v108[1];
              v68 = *(_OWORD *)&buf[0].value;
              v69 = *(_OWORD *)&buf[0].epoch;
              objc_msgSend(v66, "updateClipAtIndex:usingBlock:", v39++, v67);
            }
            while (v39 < objc_msgSend(v66, "numberOfClips"));
          }
          v46 = v65;
          if (v65)
          {
            objc_msgSend(v65, "constrainedOverallDurationInfo");
          }
          else
          {
            memset(v108, 0, sizeof(v108));
            memset(buf, 0, sizeof(buf));
          }
          v47 = v108[0];
          *(_OWORD *)&v63->var1.var1.var0 = *(_OWORD *)&buf[1].timescale;
          *(_OWORD *)&v63->var1.var1.var3 = v47;
          *(_OWORD *)&v63->var1.var2.var1 = v108[1];
          v48 = *(_OWORD *)&buf[0].epoch;
          *(_OWORD *)&v63->var0 = *(_OWORD *)&buf[0].value;
          *(_OWORD *)&v63->var1.var0.var1 = v48;
        }
        else
        {
          if (v65)
          {
            objc_msgSend(v65, "constrainedOverallDurationInfo");
          }
          else
          {
            v105 = 0u;
            v106 = 0u;
            v104 = 0u;
            memset(time2, 0, sizeof(time2));
          }
          v49 = v14;
          *(_OWORD *)&buf[1].timescale = v104;
          v108[0] = v105;
          v108[1] = v106;
          *(_OWORD *)&buf[0].value = *(_OWORD *)time2;
          *(_OWORD *)&buf[0].epoch = *(_OWORD *)&time2[16];
          PLStoryGetLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(CMTime *)time2 = v86;
            PXStoryTimeDescription((CMTime *)time2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = *(_OWORD *)&buf[1].timescale;
            v105 = v108[0];
            v106 = v108[1];
            *(_OWORD *)time2 = *(_OWORD *)&buf[0].value;
            *(_OWORD *)&time2[16] = *(_OWORD *)&buf[0].epoch;
            PFStoryOverallDurationInfoDescription();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)time2 = 138412546;
            *(_QWORD *)&time2[4] = v51;
            *(_WORD *)&time2[12] = 2114;
            *(_QWORD *)&time2[14] = v52;
            _os_log_impl(&dword_1A6789000, v50, OS_LOG_TYPE_INFO, "Also failed to constrain to backup Long duration of %@ or less. Actual overall duration: %{public}@", time2, 0x16u);

          }
          v53 = self->_ttrUnitTestsForFailedDurationConstraints;
          PFStoryRecipeSongPaceDescription();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(CMTime *)time2 = v86;
          objc_msgSend(v65, "diagnosticSwiftCodeForDurationUnitTestNamed:maximumDuration:", v54, time2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v53, "addObject:", v55);

          v14 = v49;
LABEL_77:
          PLStoryGetLog();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            PFStoryOverallDurationKindDescription();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            PFStoryRecipeSongPaceDescription();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf[0].value) = 138543618;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v57;
            LOWORD(buf[0].flags) = 2114;
            *(_QWORD *)((char *)&buf[0].flags + 2) = v58;
            _os_log_impl(&dword_1A6789000, v56, OS_LOG_TYPE_INFO, "Unable to constrain clip durations to '%{public}@' for the song pace '%{public}@'.", (uint8_t *)buf, 0x16u);

          }
          v46 = v65;
        }
        v59 = self->_log;
        v60 = v59;
        if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v59))
        {
          LOWORD(buf[0].value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v60, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditDecisionList.OverallDuration", ", (uint8_t *)buf, 2u);
        }

        break;
      default:
        goto LABEL_77;
    }
  }

  return result;
}

- (int64_t)_playbackStyleForAsset:(id)a3 songPace:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PFStoryAutoEditConfiguration *configuration;
  CMTime v18;
  CMTime time1;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;

  v6 = a3;
  v7 = objc_msgSend(v6, "playbackStyle");
  switch(v7)
  {
    case 0:
      v7 = 1;
      break;
    case 1:
    case 2:
    case 4:
    case 5:
      break;
    case 3:
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "forceLivePhotoVideo");

      if ((v10 & 1) != 0)
      {
        v7 = 3;
      }
      else
      {
        -[PXStorySongsAutoEditDecisionListsProducer movieHighlights](self, "movieHighlights");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "movieHighlightsForDisplayAsset:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        *(_OWORD *)&v27.value = PXStoryTimeZero;
        v27.epoch = 0;
        objc_msgSend(v12, "livePhoto");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "timeRange");
          v27 = v26;
        }
        else if (objc_msgSend(v6, "isEligibleForAutoPlayback"))
        {
          objc_msgSend(v12, "defaultHighlight");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "timeRange");
            v27 = v25;
          }

        }
        v24 = 0;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        configuration = self->_configuration;
        if (configuration)
          -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](configuration, "durationInfoForPlaybackStyle:songPace:", 3, a4);
        time1 = v27;
        *(_OWORD *)&v18.value = v20;
        v18.epoch = v21;
        if (CMTimeCompare(&time1, &v18) < 0)
          v7 = 1;
        else
          v7 = 3;

      }
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)_movieHighlightForAsset:(id)a3 playbackStyle:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXStorySongsAutoEditDecisionListsProducer movieHighlights](self, "movieHighlights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "movieHighlightsForDisplayAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_16;
  switch(a4)
  {
    case 3:
      PXStoryMovieHighlightForPlaybackStyle(v8, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        PLStoryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412546;
          v14 = v6;
          v15 = 2112;
          v16 = v8;
          v11 = "No highlight for live photo: %@, curation: %@";
          goto LABEL_14;
        }
LABEL_15:

        goto LABEL_16;
      }
      break;
    case 5:
      PXStoryMovieHighlightForPlaybackStyle(v8, 5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        PLStoryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412546;
          v14 = v6;
          v15 = 2112;
          v16 = v8;
          v11 = "No highlight for looping video: %@, curation: %@";
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      break;
    case 4:
      PXStoryMovieHighlightForPlaybackStyle(v8, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        PLStoryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412546;
          v14 = v6;
          v15 = 2112;
          v16 = v8;
          v11 = "No highlight for video: %@, curation: %@";
LABEL_14:
          _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x16u);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      break;
    default:
LABEL_16:
      v9 = 0;
      break;
  }

  return v9;
}

- ($19C3178046A4CD95E25554FCB23DE520)_durationInfoForClip:(SEL)a3 durationMultiplier:(id)a4 songPace:(double)a5 transitionIn:(int64_t)a6 transitionOut:(double *)a7
{
  uint64_t v14;
  PFStoryAutoEditConfiguration *configuration;
  void *v16;
  void *v17;
  CMTimeEpoch epoch;
  NSObject *v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  NSObject *v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var2;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  int32_t v26;
  __int128 v27;
  __int128 v28;
  CMTimeEpoch v29;
  __int128 v30;
  void *v31;
  void *v32;
  CMTimeScale timescale;
  CMTimeFlags v34;
  Float64 *v35;
  double v36;
  double v37;
  NSObject *v38;
  void *v39;
  CMTimeValue v40;
  CMTimeFlags v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  CMTimeValue v48;
  void *v49;
  double v50;
  CMTimeValue v51;
  double v52;
  double v53;
  NSObject *v54;
  Float64 v55;
  CMTimeValue v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  $19C3178046A4CD95E25554FCB23DE520 *result;
  Float64 Seconds;
  Float64 v65;
  Float64 v66;
  Float64 v67;
  Float64 v68;
  Float64 v69;
  Float64 v70;
  Float64 v71;
  void *v72;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v73;
  CMTimeValue value;
  CMTimeFlags v75;
  CMTimeEpoch v76;
  CMTimeFlags flags;
  CMTimeFlags v78;
  void *v79;
  CMTimeEpoch v81;
  double *v82;
  id v83;
  CMTime v84;
  CMTime v85;
  CMTime v86;
  CMTime v87;
  CMTime v88;
  CMTime rhs;
  CMTime v90;
  CMTime v91;
  CMTime lhs;
  CMTime var0;
  CMTime time2;
  __int128 time;
  _BYTE time_16[32];
  CMTime v97;
  CMTime time1[3];
  CMTime v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v83 = a4;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStorySongsAutoEditDecisionListsProducer.m"), 1113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("songPace != PFStoryRecipeSongPaceUnknown"));

  }
  v82 = a7;
  v14 = objc_msgSend(v83, "playbackStyle");
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  retstr->var2.var3 = 0;
  configuration = self->_configuration;
  if (configuration)
    -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](configuration, "durationInfoForPlaybackStyle:songPace:", v14, a6);
  objc_msgSend(v83, "displayAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == 4 && (objc_msgSend(v17, "mediaSubtypes") & 0x60000) != 0)
  {
    time = *(_OWORD *)&retstr->var0.var0;
    *(_QWORD *)time_16 = retstr->var0.var3;
    CMTimeMultiplyByRatio(time1, (CMTime *)&time, 3, 2);
    retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time1[0];
    CMTimeMake(&rhs, 1, 1);
    time = *(_OWORD *)&retstr->var1.var0;
    *(_QWORD *)time_16 = retstr->var1.var3;
    CMTimeAdd(time1, (CMTime *)&time, &rhs);
    *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&time1[0].value;
    epoch = time1[0].epoch;
    retstr->var1.var3 = time1[0].epoch;
    time = *(_OWORD *)&retstr->var1.var0;
    *(_QWORD *)time_16 = epoch;
    time2 = (CMTime)retstr->var0;
    CMTimeMaximum(time1, (CMTime *)&time, &time2);
    retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time1[0];
    time = *(_OWORD *)&retstr->var2.var0;
    *(_QWORD *)time_16 = retstr->var2.var3;
    time2 = (CMTime)retstr->var1;
    CMTimeMaximum(time1, (CMTime *)&time, &time2);
    retstr->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time1[0];
  }
  time1[0] = (CMTime)retstr->var0;
  time = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)time_16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  if (CMTimeCompare(time1, (CMTime *)&time) <= 0)
  {
    PXAssertGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(time1[0].value) = 0;
      _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "default minimum duration should never be 0", (uint8_t *)time1, 2u);
    }

  }
  p_var1 = &retstr->var1;
  time1[0] = (CMTime)retstr->var1;
  time = *(_OWORD *)&retstr->var0.var0;
  *(_QWORD *)time_16 = retstr->var0.var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0)
  {
    PXAssertGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var1->var0;
      time1[0].epoch = retstr->var1.var3;
      Seconds = CMTimeGetSeconds(time1);
      time1[0] = (CMTime)retstr->var0;
      v65 = CMTimeGetSeconds(time1);
      LODWORD(time1[0].value) = 134218240;
      *(Float64 *)((char *)&time1[0].value + 4) = Seconds;
      LOWORD(time1[0].flags) = 2048;
      *(Float64 *)((char *)&time1[0].flags + 2) = v65;
      _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "default preferred duration (%0.2fs) must be >= the minimum duration (%0.2fs)", (uint8_t *)time1, 0x16u);
    }

  }
  p_var2 = &retstr->var2;
  time1[0] = (CMTime)retstr->var2;
  time = *(_OWORD *)&p_var1->var0;
  *(_QWORD *)time_16 = retstr->var1.var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0)
  {
    PXAssertGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var2->var0;
      time1[0].epoch = retstr->var2.var3;
      v66 = CMTimeGetSeconds(time1);
      *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var1->var0;
      time1[0].epoch = retstr->var1.var3;
      v67 = CMTimeGetSeconds(time1);
      LODWORD(time1[0].value) = 134218240;
      *(Float64 *)((char *)&time1[0].value + 4) = v66;
      LOWORD(time1[0].flags) = 2048;
      *(Float64 *)((char *)&time1[0].flags + 2) = v67;
      _os_log_error_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "default maximum duration (%0.2fs) must be >= the preferred duration (%0.2fs)", (uint8_t *)time1, 0x16u);
    }

  }
  v24 = *(_OWORD *)&retstr->var2.var0;
  *(_OWORD *)&time_16[16] = *(_OWORD *)&retstr->var1.var1;
  *(_OWORD *)&v97.value = v24;
  v97.epoch = retstr->var2.var3;
  v25 = *(_OWORD *)&retstr->var0.var3;
  time = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)time_16 = v25;
  v26 = llround(a5 * 600.0);
  memset(&time2, 0, sizeof(time2));
  time1[0] = *(CMTime *)&time_16[8];
  CMTimeMultiplyByRatio(&time2, time1, v26, 600);
  memset(&var0, 0, sizeof(var0));
  memset(&v99, 0, sizeof(v99));
  if (a5 < 1.0)
  {
    *(_OWORD *)&time1[0].value = time;
    time1[0].epoch = *(_QWORD *)time_16;
    CMTimeMultiplyByRatio(&var0, time1, v26, 600);
    time1[0] = v97;
    CMTimeMultiplyByRatio(&v99, time1, v26, 600);
  }
  else
  {
    memset(time1, 0, 24);
    lhs = time2;
    v91 = *(CMTime *)&time_16[8];
    CMTimeSubtract(time1, &lhs, &v91);
    *(_OWORD *)&v91.value = time;
    v91.epoch = *(_QWORD *)time_16;
    v90 = time1[0];
    CMTimeAdd(&lhs, &v91, &v90);
    var0 = lhs;
    v91 = v97;
    v90 = time1[0];
    CMTimeAdd(&lhs, &v91, &v90);
    v99 = lhs;
  }
  v27 = *(_OWORD *)&var0.value;
  time1[0] = var0;
  time1[1] = time2;
  v28 = *(_OWORD *)&v99.value;
  time1[2] = v99;
  v29 = v99.epoch;
  v30 = *(_OWORD *)&time1[0].epoch;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time2.timescale;
  *(_OWORD *)&retstr->var2.var0 = v28;
  retstr->var2.var3 = v29;
  *(_OWORD *)&retstr->var0.var0 = v27;
  *(_OWORD *)&retstr->var0.var3 = v30;
  v99.timescale = 0;
  v99.value = 0;
  v79 = v17;
  if ((unint64_t)(v14 - 3) > 1)
  {
    v81 = 0;
    v34 = 0;
    timescale = 0;
    v40 = 0;
    v76 = 0;
    v41 = 0;
    v35 = v82;
  }
  else
  {
    -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v17, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "timeRange");
      v99.value = time1[0].value;
      flags = time1[0].flags;
      v99.timescale = time1[0].timescale;
      value = time1[1].value;
      v76 = time1[0].epoch;
      timescale = time1[1].timescale;
      v34 = time1[1].flags;
      v81 = time1[1].epoch;
      v35 = v82;
      if (v14 == 4)
      {
        memset(time1, 0, 48);
        time = *(_OWORD *)&p_var1->var0;
        *(_QWORD *)time_16 = retstr->var1.var3;
        v36 = CMTimeGetSeconds((CMTime *)&time);
        time = *(_OWORD *)&retstr->var0.var0;
        *(_QWORD *)time_16 = retstr->var0.var3;
        v37 = CMTimeGetSeconds((CMTime *)&time);
        time = *(_OWORD *)&p_var2->var0;
        *(_QWORD *)time_16 = retstr->var2.var3;
        objc_msgSend(v32, "bestTimeRangeForPreferredDuration:min:max:", v36, v37, CMTimeGetSeconds((CMTime *)&time));
        PLStoryGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          time = *(_OWORD *)&time1[0].value;
          *(_OWORD *)time_16 = *(_OWORD *)&time1[0].epoch;
          *(_OWORD *)&time_16[16] = *(_OWORD *)&time1[1].timescale;
          PXStoryTimeRangeDescription((uint64_t)&time);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(time) = 138412290;
          *(_QWORD *)((char *)&time + 4) = v39;
          _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_DEBUG, "Best video clip playback range: %@", (uint8_t *)&time, 0xCu);

          p_var1 = &retstr->var1;
        }

        if ((time1[0].flags & 1) != 0
          && (time1[1].flags & 1) != 0
          && !time1[1].epoch
          && (time1[1].value & 0x8000000000000000) == 0)
        {
          time = *(_OWORD *)&time1[1].value;
          *(_QWORD *)time_16 = 0;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (CMTimeCompare((CMTime *)&time, &time2))
          {
            time2 = time1[1];
            var0 = (CMTime)retstr->var0;
            CMTimeMaximum((CMTime *)&time, &time2, &var0);
            *(_OWORD *)&p_var1->var0 = time;
            p_var1->var3 = *(_QWORD *)time_16;
          }
        }
      }
      v40 = value;
      v41 = flags;
    }
    else
    {
      v81 = 0;
      v34 = 0;
      timescale = 0;
      v40 = 0;
      v76 = 0;
      v41 = 0;
      v35 = v82;
    }

  }
  PLStoryGetLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    time1[0] = (CMTime)retstr->var0;
    PXStoryTimeDescription(time1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    time1[0] = (CMTime)*p_var1;
    PXStoryTimeDescription(time1);
    v73 = p_var1;
    v75 = v34;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var2->var0;
    time1[0].epoch = retstr->var2.var3;
    PXStoryTimeDescription(time1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    time1[0].value = v99.value;
    time1[0].timescale = v99.timescale;
    time1[0].flags = v41;
    time1[0].epoch = v76;
    time1[1].value = v40;
    time1[1].timescale = timescale;
    time1[1].flags = v75;
    time1[1].epoch = v81;
    PXStoryTimeRangeDescription((uint64_t)time1);
    v78 = v41;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time1[0].value) = 138413058;
    *(CMTimeValue *)((char *)&time1[0].value + 4) = (CMTimeValue)v43;
    LOWORD(time1[0].flags) = 2112;
    *(_QWORD *)((char *)&time1[0].flags + 2) = v44;
    HIWORD(time1[0].epoch) = 2112;
    time1[1].value = (CMTimeValue)v45;
    LOWORD(time1[1].timescale) = 2112;
    *(_QWORD *)((char *)&time1[1].timescale + 2) = v46;
    _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_DEBUG, "video clip duration min: %@, pref: %@, max: %@, playback range: %@", (uint8_t *)time1, 0x2Au);

    v41 = v78;
    v35 = v82;

    v34 = v75;
    p_var1 = v73;

  }
  if ((v41 & 1) != 0 && (v34 & 1) != 0 && !v81 && (v40 & 0x8000000000000000) == 0)
  {
    time1[0].value = v40;
    time1[0].timescale = timescale;
    time1[0].flags = v34;
    time1[0].epoch = 0;
    time = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)time_16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    if (CMTimeCompare(time1, (CMTime *)&time))
    {
      memset(&time2, 0, sizeof(time2));
      CMTimeMakeWithSeconds(&v88, *v35 + *a8, 600);
      time1[0].value = v40;
      time1[0].timescale = timescale;
      time1[0].flags = v34;
      time1[0].epoch = 0;
      time = *(_OWORD *)&v88.value;
      *(_QWORD *)time_16 = v88.epoch;
      CMTimeSubtract(&time2, time1, (CMTime *)&time);
      time1[0] = time2;
      time = *(_OWORD *)&retstr->var0.var0;
      *(_QWORD *)time_16 = retstr->var0.var3;
      if (CMTimeCompare(time1, (CMTime *)&time) < 0)
      {
        PLStoryGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          time1[0].value = v99.value;
          time1[0].timescale = v99.timescale;
          time1[0].flags = v41;
          time1[0].epoch = v76;
          time1[1].value = v40;
          time1[1].timescale = timescale;
          time1[1].flags = v34;
          time1[1].epoch = 0;
          PXStoryTimeRangeDescription((uint64_t)time1);
          v48 = v40;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = *v35;
          v51 = *(_QWORD *)a8;
          LODWORD(time1[0].value) = 138543874;
          *(CMTimeValue *)((char *)&time1[0].value + 4) = (CMTimeValue)v49;
          LOWORD(time1[0].flags) = 2048;
          *(double *)((char *)&time1[0].flags + 2) = v50;
          HIWORD(time1[0].epoch) = 2048;
          time1[1].value = v51;
          _os_log_impl(&dword_1A6789000, v47, OS_LOG_TYPE_DEBUG, "Playback range %{public}@ too small for transitions %0.1fs/%0.1fs", (uint8_t *)time1, 0x20u);

          v40 = v48;
        }

        if (*a8 >= *v35)
        {
          *a8 = 0.0;
          v53 = *v35;
          v52 = 0.0;
        }
        else
        {
          *v35 = 0.0;
          v52 = *a8;
          v53 = 0.0;
        }
        CMTimeMakeWithSeconds(&v87, v53 + v52, 600);
        time1[0].value = v40;
        time1[0].timescale = timescale;
        time1[0].flags = v34;
        time1[0].epoch = 0;
        time = *(_OWORD *)&v87.value;
        *(_QWORD *)time_16 = v87.epoch;
        CMTimeSubtract(&var0, time1, (CMTime *)&time);
        time2 = var0;
        time1[0] = var0;
        time = *(_OWORD *)&retstr->var0.var0;
        *(_QWORD *)time_16 = retstr->var0.var3;
        if (CMTimeCompare(time1, (CMTime *)&time) < 0)
        {
          *a8 = 0.0;
          *v35 = 0.0;
          time2.value = v40;
          time2.timescale = timescale;
          time2.flags = v34;
          time2.epoch = 0;
        }
      }
      time1[0] = (CMTime)retstr->var0;
      time = *(_OWORD *)&time2.value;
      *(_QWORD *)time_16 = time2.epoch;
      CMTimeMinimum(&var0, time1, (CMTime *)&time);
      retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)var0;
      time1[0] = (CMTime)*p_var1;
      time = *(_OWORD *)&time2.value;
      *(_QWORD *)time_16 = time2.epoch;
      CMTimeMinimum(&var0, time1, (CMTime *)&time);
      *(CMTime *)p_var1 = var0;
      *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var2->var0;
      time1[0].epoch = retstr->var2.var3;
      time = *(_OWORD *)&time2.value;
      *(_QWORD *)time_16 = time2.epoch;
      CMTimeMinimum(&var0, time1, (CMTime *)&time);
      *(_OWORD *)&p_var2->var0 = *(_OWORD *)&var0.value;
      retstr->var2.var3 = var0.epoch;
    }
  }
  CMTimeMakeWithSeconds(&v86, *v35, 600);
  time1[0] = (CMTime)retstr->var0;
  time = *(_OWORD *)&v86.value;
  *(_QWORD *)time_16 = v86.epoch;
  CMTimeAdd(&time2, time1, (CMTime *)&time);
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time2;
  CMTimeMakeWithSeconds(&v85, *v35, 600);
  time1[0] = (CMTime)*p_var1;
  time = *(_OWORD *)&v85.value;
  *(_QWORD *)time_16 = v85.epoch;
  CMTimeAdd(&time2, time1, (CMTime *)&time);
  *(CMTime *)p_var1 = time2;
  CMTimeMakeWithSeconds(&v84, *v35, 600);
  *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var2->var0;
  time1[0].epoch = retstr->var2.var3;
  time = *(_OWORD *)&v84.value;
  *(_QWORD *)time_16 = v84.epoch;
  CMTimeAdd(&time2, time1, (CMTime *)&time);
  *(_OWORD *)&p_var2->var0 = *(_OWORD *)&time2.value;
  retstr->var2.var3 = time2.epoch;
  PLStoryGetLog();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    v55 = *v35;
    v56 = *(_QWORD *)a8;
    time1[0] = (CMTime)retstr->var0;
    PXStoryTimeDescription(time1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    time1[0] = (CMTime)*p_var1;
    PXStoryTimeDescription(time1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var2->var0;
    time1[0].epoch = retstr->var2.var3;
    PXStoryTimeDescription(time1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time1[0].value) = 134219010;
    *(Float64 *)((char *)&time1[0].value + 4) = v55;
    LOWORD(time1[0].flags) = 2048;
    *(_QWORD *)((char *)&time1[0].flags + 2) = v56;
    HIWORD(time1[0].epoch) = 2112;
    time1[1].value = (CMTimeValue)v57;
    LOWORD(time1[1].timescale) = 2112;
    *(_QWORD *)((char *)&time1[1].timescale + 2) = v58;
    WORD1(time1[1].epoch) = 2112;
    *(CMTimeEpoch *)((char *)&time1[1].epoch + 4) = (CMTimeEpoch)v59;
    _os_log_impl(&dword_1A6789000, v54, OS_LOG_TYPE_DEBUG, "video clip duration with transition %0.1fs/%0.1fs => min: %@, pref: %@, max: %@", (uint8_t *)time1, 0x34u);

  }
  time1[0] = (CMTime)retstr->var0;
  time = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)time_16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  if (CMTimeCompare(time1, (CMTime *)&time) <= 0)
  {
    PXAssertGetLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(time1[0].value) = 0;
      _os_log_error_impl(&dword_1A6789000, v60, OS_LOG_TYPE_ERROR, "minimum duration should never be 0", (uint8_t *)time1, 2u);
    }

  }
  time1[0] = (CMTime)*p_var1;
  time = *(_OWORD *)&retstr->var0.var0;
  *(_QWORD *)time_16 = retstr->var0.var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0)
  {
    PXAssertGetLog();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      time1[0] = (CMTime)*p_var1;
      v68 = CMTimeGetSeconds(time1);
      time1[0] = (CMTime)retstr->var0;
      v69 = CMTimeGetSeconds(time1);
      LODWORD(time1[0].value) = 134218240;
      *(Float64 *)((char *)&time1[0].value + 4) = v68;
      LOWORD(time1[0].flags) = 2048;
      *(Float64 *)((char *)&time1[0].flags + 2) = v69;
      _os_log_error_impl(&dword_1A6789000, v61, OS_LOG_TYPE_ERROR, "preferred duration (%0.2fs) must be >= minimum duration (%0.2fs)", (uint8_t *)time1, 0x16u);
    }

  }
  *(_OWORD *)&time1[0].value = *(_OWORD *)&p_var2->var0;
  time1[0].epoch = retstr->var2.var3;
  time = *(_OWORD *)&p_var1->var0;
  *(_QWORD *)time_16 = p_var1->var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0)
  {
    PXAssertGetLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      time1[0] = (CMTime)*p_var2;
      v70 = CMTimeGetSeconds(time1);
      time1[0] = (CMTime)*p_var1;
      v71 = CMTimeGetSeconds(time1);
      LODWORD(time1[0].value) = 134218240;
      *(Float64 *)((char *)&time1[0].value + 4) = v70;
      LOWORD(time1[0].flags) = 2048;
      *(Float64 *)((char *)&time1[0].flags + 2) = v71;
      _os_log_error_impl(&dword_1A6789000, v62, OS_LOG_TYPE_ERROR, "maximum duration (%0.2fs) must be >= preferred duration (%0.2fs)", (uint8_t *)time1, 0x16u);
    }

  }
  return result;
}

- (float)_volumeGainForAsset:(id)a3 movieHighlight:(id)a4 audioMode:(int64_t)a5
{
  float v5;
  id v7;
  void *v8;
  void *v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;

  v5 = 0.0;
  if ((unint64_t)a5 >= 2)
  {
    v7 = a4;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a5 == 3)
      objc_msgSend(v8, "foregroundAudioLoudnessTarget");
    else
      objc_msgSend(v8, "backgroundAudioLoudnessTarget");
    v11 = v10;
    objc_msgSend(v7, "loudness");
    v13 = v11 - v12;
    objc_msgSend(v7, "peakVolume");
    v15 = v14;

    v16 = fmin(fmax((float)(log10f(v15) * -20.0), 0.0), 12.0);
    v17 = __exp10(fminf(v13, v16) / 20.0);
    v5 = fminf(v17, 1.0);

  }
  return v5;
}

- (void)_audioCutsFromClip:(id)a3 toClip:(id)a4 useJCut:(BOOL *)a5 useLCut:(BOOL *)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    if (!v11)
      goto LABEL_13;
    objc_msgSend(v11, "audioInfo");
    v13 = v14;
LABEL_10:
    if (v13 > 1)
    {
      *a5 = -[PXStorySongsAutoEditDecisionListsProducer _canOverlapAudioFromClip:withPreviousClip:](self, "_canOverlapAudioFromClip:withPreviousClip:", v12, v10);
LABEL_14:
      *a6 = 0;
      goto LABEL_15;
    }
LABEL_13:
    *a5 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v10, "audioInfo");
  if (!v12)
  {
    if (v15 >= 2)
      goto LABEL_16;
    goto LABEL_13;
  }
  objc_msgSend(v12, "audioInfo");
  v13 = v14;
  if (v15 < 2)
    goto LABEL_10;
  if (v15 == 3 && v14 == 3)
    goto LABEL_13;
  if (v14 <= 1)
  {
LABEL_16:
    *a6 = -[PXStorySongsAutoEditDecisionListsProducer _canOverlapAudioFromClip:withNextClip:](self, "_canOverlapAudioFromClip:withNextClip:", v10, v12);
    *a5 = 0;
    goto LABEL_15;
  }
  *a5 = -[PXStorySongsAutoEditDecisionListsProducer _canOverlapAudioFromClip:withPreviousClip:](self, "_canOverlapAudioFromClip:withPreviousClip:", v12, v10);
  *a6 = -[PXStorySongsAutoEditDecisionListsProducer _canOverlapAudioFromClip:withNextClip:](self, "_canOverlapAudioFromClip:withNextClip:", v10, v12);
LABEL_15:

}

- (BOOL)_canOverlapAudioFromClip:(id)a3 withPreviousClip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  unint64_t v21;
  unint64_t v22;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    objc_msgSend(v7, "displayAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "playbackStyle");

    -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "displayAssets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v13, objc_msgSend(v6, "playbackStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "audioJCutStrategy");

    if (v16 == 3)
    {
      LODWORD(v16) = objc_msgSend(v11, "hasVoice");
      objc_msgSend(v6, "audioInfo");
      v17 = objc_msgSend(v14, "hasVoice");
      v18 = objc_msgSend(v14, "hasFace");
      if ((_DWORD)v16 && v21 >= 2)
        LOBYTE(v16) = (v17 | v18) ^ 1;
    }
    else if (v16 == 2)
    {
      LODWORD(v16) = objc_msgSend(v11, "hasVoice");
      objc_msgSend(v6, "audioInfo");
      v19 = objc_msgSend(v14, "hasVoice");
      if ((_DWORD)v16)
      {
        if (v22 < 2)
          LOBYTE(v16) = 1;
        else
          LOBYTE(v16) = v19 ^ 1;
      }
    }
    else if (v16 != 1)
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_canOverlapAudioFromClip:(id)a3 withNextClip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  unint64_t v21;
  unint64_t v22;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    objc_msgSend(v7, "displayAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "playbackStyle");

    -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "displayAssets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v13, objc_msgSend(v6, "playbackStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "audioLCutStrategy");

    if (v16 == 3)
    {
      LODWORD(v16) = objc_msgSend(v11, "hasVoice");
      objc_msgSend(v6, "audioInfo");
      v17 = objc_msgSend(v14, "hasVoice");
      v18 = objc_msgSend(v14, "hasFace");
      if ((_DWORD)v16 && v21 >= 2)
        LOBYTE(v16) = (v17 | v18) ^ 1;
    }
    else if (v16 == 2)
    {
      LODWORD(v16) = objc_msgSend(v11, "hasVoice");
      objc_msgSend(v6, "audioInfo");
      v19 = objc_msgSend(v14, "hasVoice");
      if ((_DWORD)v16)
      {
        if (v22 < 2)
          LOBYTE(v16) = 1;
        else
          LOBYTE(v16) = v19 ^ 1;
      }
    }
    else if (v16 != 1)
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (PXStoryAutoEditMomentsProvider)diagnosticsMomentsProvider
{
  return self->_momentsProvider;
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  objc_msgSend(v6, "addTitlePageWithTitle:subtitle:", CFSTR("Auto Edit Visual Diagnostics"), &stru_1E5149688);
  -[PXStorySongsAutoEditDecisionListsProducer _addMomentsGraph:](self, "_addMomentsGraph:", v6);
  -[PXStorySongsAutoEditDecisionListsProducer _addComposabilityGraph:](self, "_addComposabilityGraph:", v6);
  -[PXStorySongsAutoEditDecisionListsProducer _addTimeConstraintGraph:](self, "_addTimeConstraintGraph:", v6);

  v7[2](v7, 1, 0);
}

- (void)_addMomentsGraph:(id)a3
{
  objc_msgSend(a3, "addTitlePageWithTitle:subtitle:", CFSTR("Moments"), CFSTR("Graph"));
}

- (void)_addComposabilityGraph:(id)a3
{
  objc_msgSend(a3, "addTitlePageWithTitle:subtitle:", CFSTR("Composability"), CFSTR("Graph"));
}

- (void)_addTimeConstraintGraph:(id)a3
{
  objc_msgSend(a3, "addTitlePageWithTitle:subtitle:", CFSTR("Time Contraints"), CFSTR("Graph"));
}

- (id)debugQuickLookObject
{
  return +[PXVisualDiagnosticsFactory debugQuickLookObjectWithRootProvider:](PXVisualDiagnosticsFactory, "debugQuickLookObjectWithRootProvider:", self);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *queue;
  uint64_t v14;
  PXStorySongsAutoEditDecisionListsProducer *v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self;
  v5 = self->_ttrUnitTestsForFailedDurationConstraints;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed_duration_test%d"), v7 + v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAttachmentWithSwiftCode:name:", v10, v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v7 = (v7 + v9);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](v15->_ttrUnitTestsForFailedDurationConstraints, "removeAllObjects");
  -[PXStoryMovieHighlightsCollection diagnosticDescription](v15->_movieHighlights, "diagnosticDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "addAttachmentWithText:name:", v12, CFSTR("MovieHighlights"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__222924;
  v21 = __Block_byref_object_dispose__222925;
  v22 = 0;
  queue = v15->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PXStorySongsAutoEditDecisionListsProducer_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = v15;
  block[5] = &v17;
  dispatch_sync(queue, block);
  v14 = v18[5];
  if (v14)
    objc_msgSend(v4, "addAttachmentWithText:name:", v14, CFSTR("ComposabilityProvider"));
  _Block_object_dispose(&v17, 8);

}

- (BOOL)handlesDiagnosticTextForHUDType:(int64_t)a3
{
  return (unint64_t)(a3 - 8) < 3;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  __CFString *v4;

  switch(a3)
  {
    case 8:
      -[PXStorySongsAutoEditDecisionListsProducer _diagnosticTextForAutoEditHUDAtDisplaySize:](self, "_diagnosticTextForAutoEditHUDAtDisplaySize:", a4.width, a4.height);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[PXStorySongsAutoEditDecisionListsProducer _diagnosticTextForComposabilityHUDAtDisplaySize:](self, "_diagnosticTextForComposabilityHUDAtDisplaySize:", a4.width, a4.height);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[PXStorySongsAutoEditDecisionListsProducer _diagnosticTextForMomentsHUDAtDisplaySize:](self, "_diagnosticTextForMomentsHUDAtDisplaySize:", a4.width, a4.height);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = &stru_1E5149688;
      break;
  }
  return v4;
}

- (id)_diagnosticTextForAutoEditHUDAtDisplaySize:(CGSize)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  NSArray *lastGeneratedAutoEditDecisionLists;
  id v9;
  NSArray *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "appendString:", CFSTR("AutoEdit - Overview\n"));
  v5 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.epoch;
  v18 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.value;
  v19 = v5;
  v20 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.maximumDuration.timescale;
  v6 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.timescale;
  v16 = *(_OWORD *)&self->_targetOverallDurationInfo.kind;
  v17 = v6;
  PFStoryOverallDurationInfoDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Target Overall Duration: %@\n"), v7);

  lastGeneratedAutoEditDecisionLists = self->_lastGeneratedAutoEditDecisionLists;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForAutoEditHUDAtDisplaySize___block_invoke;
  v14[3] = &unk_1E5138980;
  v9 = v4;
  v15 = v9;
  v10 = lastGeneratedAutoEditDecisionLists;
  -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v14);
  v11 = v15;
  v12 = v9;

  return v12;
}

- (id)_diagnosticTextForMomentsHUDAtDisplaySize:(CGSize)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PXStoryAutoEditMomentsProvider *momentsProvider;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  PXStoryAutoEditMomentsProvider *v18;
  id v19;
  PXStoryAutoEditMomentsProvider *v20;
  id v21;
  PXStoryAutoEditMomentsProvider *v22;
  id v23;
  PXStoryAutoEditMomentsProvider *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  void *v35;
  PXStoryAutoEditMomentsProvider *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "appendString:", CFSTR("AutoEdit - Moments\n"));
  -[PXStoryAutoEditMomentsProvider statistics](self->_momentsProvider, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("- count: %d\n"), -[PXStoryAutoEditMomentsProvider count](self->_momentsProvider, "count"));
  objc_msgSend(v5, "averageAssetCount");
  objc_msgSend(v4, "appendFormat:", CFSTR("- avg length: %.2f\n"), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("- min length: %d\n"), objc_msgSend(v5, "minimumAssetCount"));
  objc_msgSend(v4, "appendFormat:", CFSTR("- max length: %d\n"), objc_msgSend(v5, "maximumAssetCount"));
  objc_msgSend(v4, "appendString:", CFSTR("- moment counts:\n "));
  momentsProvider = self->_momentsProvider;
  v8 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke;
  v56[3] = &unk_1E51389A8;
  v9 = v4;
  v57 = v9;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](momentsProvider, "enumerateMomentsUsingBlock:", v56);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  objc_msgSend(v5, "clusteringDistanceCalculator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationWeight");
  v12 = v11;
  objc_msgSend(v5, "clusteringDistanceCalculator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeWeight");
  v15 = v14;
  objc_msgSend(v5, "clusteringDistanceCalculator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "faceWeight");
  objc_msgSend(v9, "appendFormat:", CFSTR("- moment weighted distances (l: %.3f, t: %.3f, f: %.3f):\n "), v12, v15, v17);

  v18 = self->_momentsProvider;
  v54[0] = v8;
  v54[1] = 3221225472;
  v54[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_2;
  v54[3] = &unk_1E51389A8;
  v19 = v9;
  v55 = v19;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](v18, "enumerateMomentsUsingBlock:", v54);
  objc_msgSend(v19, "appendString:", CFSTR("\n"));
  objc_msgSend(v19, "appendString:", CFSTR("- moment unweighted location distances:\n "));
  v20 = self->_momentsProvider;
  v52[0] = v8;
  v52[1] = 3221225472;
  v52[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_3;
  v52[3] = &unk_1E51389A8;
  v21 = v19;
  v53 = v21;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](v20, "enumerateMomentsUsingBlock:", v52);
  objc_msgSend(v21, "appendString:", CFSTR("\n"));
  objc_msgSend(v21, "appendString:", CFSTR("- moment unweighted time distances:\n "));
  v22 = self->_momentsProvider;
  v50[0] = v8;
  v50[1] = 3221225472;
  v50[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_4;
  v50[3] = &unk_1E51389A8;
  v23 = v21;
  v51 = v23;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](v22, "enumerateMomentsUsingBlock:", v50);
  objc_msgSend(v23, "appendString:", CFSTR("\n"));
  objc_msgSend(v23, "appendString:", CFSTR("- moment unweighted face distances:\n "));
  v24 = self->_momentsProvider;
  v48[0] = v8;
  v48[1] = 3221225472;
  v48[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_5;
  v48[3] = &unk_1E51389A8;
  v25 = v23;
  v49 = v25;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](v24, "enumerateMomentsUsingBlock:", v48);
  objc_msgSend(v25, "appendString:", CFSTR("\n"));
  objc_msgSend(v5, "clusteringDuration");
  objc_msgSend(v25, "appendFormat:", CFSTR("- clustering duration: %.2f\n"), v26);
  objc_msgSend(v5, "memoryCategoryName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR("- clustering properties (%@):\n"), v27);

  objc_msgSend(v5, "clusteringProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "algorithm");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR("  - algorithm: %@\n"), v29);

  objc_msgSend(v5, "clusteringProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "algorithmProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR("  - algorithmProperties: %@\n"), v31);

  objc_msgSend(v5, "clusteringProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "distanceWeights");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR("  - distanceWeights: %@\n"), v33);

  objc_msgSend(v25, "appendString:", CFSTR("\nModules\n"));
  v34 = self->_lastGeneratedAutoEditDecisionLists;
  v35 = (void *)objc_opt_new();
  v36 = self->_momentsProvider;
  v46[0] = v8;
  v46[1] = 3221225472;
  v46[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_6;
  v46[3] = &unk_1E51389A8;
  v37 = v35;
  v47 = v37;
  -[PXStoryAutoEditMomentsProvider enumerateMomentsUsingBlock:](v36, "enumerateMomentsUsingBlock:", v46);
  v43[0] = v8;
  v43[1] = 3221225472;
  v43[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_8;
  v43[3] = &unk_1E51389F8;
  v44 = v37;
  v38 = v25;
  v45 = v38;
  v39 = v37;
  -[NSArray enumerateObjectsUsingBlock:](v34, "enumerateObjectsUsingBlock:", v43);
  v40 = v45;
  v41 = v38;

  return v41;
}

- (id)_diagnosticTextForComposabilityHUDAtDisplaySize:(CGSize)a3
{
  id v4;
  int64_t v5;
  float v6;
  float v7;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "appendString:", CFSTR("AutoEdit - Composability\n"));
  objc_msgSend(v4, "appendFormat:", CFSTR("- count: %d\n"), -[PXStoryAutoEditClipComposabilityProvider count](self->_composabilityProvider, "count"));
  objc_msgSend(v4, "appendString:", CFSTR("- scores:\n "));
  if (-[PXStoryAutoEditClipComposabilityProvider count](self->_composabilityProvider, "count") >= 1)
  {
    v5 = 0;
    do
    {
      -[PXStoryAutoEditClipComposabilityProvider composabilityScoresForDisplayAssetIndex:](self->_composabilityProvider, "composabilityScoresForDisplayAssetIndex:", v5);
      objc_msgSend(v4, "appendFormat:", CFSTR("%d: diptych: %.2f, triptych: %.2f\n"), v5++, v6, v7);
    }
    while (-[PXStoryAutoEditClipComposabilityProvider count](self->_composabilityProvider, "count") > v5);
  }
  objc_msgSend(v4, "appendString:", CFSTR("\n"));
  return v4;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[PXStoryAutoEditMomentsProvider error](self->_momentsProvider, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Moments"));

  -[PXStoryAutoEditClipComposabilityProvider error](self->_composabilityProvider, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Composability"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (PXStoryMovieHighlightsCollection)movieHighlights
{
  return self->_movieHighlights;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)targetOverallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[2].var1.var0.var1;
  v4 = *(_OWORD *)&self[1].var1.var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1.var1.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (PXStoryAutoEditMomentsProvider)momentsProvider
{
  return self->_momentsProvider;
}

- (void)setMomentsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_momentsProvider, a3);
}

- (PXStoryAutoEditClipComposabilityProvider)composabilityProvider
{
  return self->_composabilityProvider;
}

- (void)setComposabilityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_composabilityProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_movieHighlights, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_ttrUnitTestsForFailedDurationConstraints, 0);
  objc_storeStrong((id *)&self->_lastGeneratedAutoEditDecisionLists, 0);
  objc_storeStrong((id *)&self->_composabilityProvider, 0);
  objc_storeStrong((id *)&self->_momentsProvider, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[%d]"), objc_msgSend(a2, "count"));
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "totalWeightedClusteringDistance");
  return objc_msgSend(v2, "appendFormat:", CFSTR("[%.1f]"), v3);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "locationClusteringDistance");
  return objc_msgSend(v2, "appendFormat:", CFSTR("[%.1f]"), v3);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "timeClusteringDistance");
  return objc_msgSend(v2, "appendFormat:", CFSTR("[%.1f]"), v3);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "faceClusteringDistance");
  return objc_msgSend(v2, "appendFormat:", CFSTR("[%.1f]"), v3);
}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_7;
  v5[3] = &unk_1E51389D0;
  v6 = *(id *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "enumerateAssetsUsingBlock:", v5);

}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_9;
  v7[3] = &unk_1E51387D8;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateClipsUsingBlock:", v7);
  *a4 = 1;

}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  const __CFString *v18;
  __int16 v19;
  __int16 v20;
  const __CFString *v21;
  id v22;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "displayAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v22, "integerValue");
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v6, "displayAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v6, "moduleInfo");
  if (v14 > 3)
    v15 = CFSTR("??");
  else
    v15 = off_1E511F160[v14];
  v16 = v15;
  objc_msgSend(v6, "moduleInfo");
  if ((v17 & 1) != 0)
    v18 = CFSTR(" - start");
  else
    v18 = &stru_1E5149688;
  objc_msgSend(v6, "moduleInfo");
  v20 = v19;

  v21 = CFSTR(" - empty space break");
  if ((v20 & 0x100) == 0)
    v21 = &stru_1E5149688;
  objc_msgSend(v11, "appendFormat:", CFSTR("Clip %ld (%lu assets) moment: %ld module: %@%@%@\n"), a3, v13, v10, v16, v18, v21);

}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

void __88__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForAutoEditHUDAtDisplaySize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "overallDurationInfo");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByPaddingToLength:withString:startingAtIndex:", 2, CFSTR(" "), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "numberOfClips");
  PFStoryDurationInfoDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "song");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXAudioAssetShortDescription(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@ %ld Clips: %@; Song:%@;\n"),
    v10,
    v11,
    v12,
    v14,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);

}

void __87__PXStorySongsAutoEditDecisionListsProducer_collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "diagnosticDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _OWORD v4[4];
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "durationInfo");
  }
  else
  {
    v5 = 0;
    memset(v4, 0, sizeof(v4));
  }
  return objc_msgSend(v2, "addClipWithDurationInfo:", v4);
}

uint64_t __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke_171(uint64_t a1, void *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];
  uint64_t v6;

  v2 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v2;
  v6 = *(_QWORD *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return objc_msgSend(a2, "setDurationInfo:", v5);
}

void __76__PXStorySongsAutoEditDecisionListsProducer__adjustAudioTransitionForClips___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  _OWORD v16[3];
  uint64_t v17;
  _OWORD v18[3];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  CMTime time;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int16 v44;

  v5 = a2;
  v6 = a3;
  v44 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_audioCutsFromClip:toClip:useJCut:useLCut:", v5, v6, (char *)&v44 + 1, &v44);
  v43 = 0;
  v7 = 0uLL;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  if (v5)
  {
    objc_msgSend(v5, "audioInfo");
    v7 = 0uLL;
  }
  v39 = 0;
  v37 = v7;
  v38 = v7;
  v36 = v7;
  if (v6)
    objc_msgSend(v6, "audioInfo");
  v8 = 0.0;
  v9 = 0.0;
  if (HIBYTE(v44) && *(_BYTE *)(a1 + 72))
  {
    v10 = *(double *)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "durationInfo");
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
    }
    *(_OWORD *)&time.value = v30;
    time.epoch = v31;
    *(double *)&v7 = CMTimeGetSeconds(&time);
    v9 = fmin(v10, *(double *)&v7);
  }
  *((double *)&v37 + 1) = v9;
  if ((_BYTE)v44 && *(_BYTE *)(a1 + 72))
  {
    v11 = *(double *)(a1 + 48);
    if (v6)
    {
      objc_msgSend(v6, "durationInfo");
    }
    else
    {
      v28 = 0;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
    }
    *(_OWORD *)&v29.value = v24;
    v29.epoch = v25;
    *(double *)&v7 = CMTimeGetSeconds(&v29);
    v8 = fmin(v11, *(double *)&v7);
  }
  *(double *)&v42 = v8;
  if (!*(_BYTE *)(a1 + 73))
  {
    v12 = 0.0;
LABEL_25:
    *(_QWORD *)&v7 = 0;
    goto LABEL_30;
  }
  v12 = 0.0;
  if ((unint64_t)v36 < 2)
    goto LABEL_24;
  if (v5)
  {
    objc_msgSend(v5, "transitionInfo");
    v13 = *((double *)&v22 + 1);
    v14 = *(_BYTE *)(a1 + 73) == 0;
  }
  else
  {
    v14 = 0;
    v22 = 0u;
    v23 = 0u;
    v13 = 0.0;
  }
  v12 = fmin(fmax(*(double *)(a1 + 56), v9 + v13), *(double *)(a1 + 64));
  *(_QWORD *)&v7 = 0;
  if (!v14)
  {
LABEL_24:
    if ((unint64_t)v40 < 2)
      goto LABEL_25;
    if (v5)
    {
      objc_msgSend(v5, "transitionInfo", *(double *)&v7);
      v15 = *((double *)&v20 + 1);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v15 = 0.0;
    }
    *(double *)&v7 = fmin(fmax(*(double *)(a1 + 56), v8 + v15), *(double *)(a1 + 64));
  }
LABEL_30:
  *((double *)&v38 + 1) = v12;
  v43 = v7;
  v18[0] = v40;
  v18[1] = v41;
  v18[2] = v42;
  v19 = v7;
  objc_msgSend(v5, "setAudioInfo:", v18);
  v16[0] = v36;
  v16[1] = v37;
  v16[2] = v38;
  v17 = v39;
  objc_msgSend(v6, "setAudioInfo:", v16);

}

void __74__PXStorySongsAutoEditDecisionListsProducer__adjustAudioPlaybackForClips___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD v17[2];
  int v18;
  __int128 v19;
  __int128 v20;
  int v21;

  v3 = a2;
  objc_msgSend(v3, "displayAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_movieHighlightForAsset:playbackStyle:", v5, objc_msgSend(v3, "playbackStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0;
  v7 = (void *)objc_opt_class();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioQualityMin");
  v10 = v9;
  v11 = objc_msgSend(v3, "playbackStyle");
  LODWORD(v12) = v10;
  v13 = objc_msgSend(v7, "audioModeDecisionForAsset:minimumAudioScore:playbackStyle:movieHighlight:storyConfiguration:", v5, v11, v6, *(_QWORD *)(a1 + 40), v12);
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "_volumeGainForAsset:movieHighlight:audioMode:", v5, v6, v13);
  v17[0] = v13;
  v17[1] = v15;
  v18 = v16;
  objc_msgSend(v3, "setAudioInfo:", v17);

}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "displayAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chapterCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsChapterBeginningWithAsset:", v5);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "chapterBeginDurationMultiplier");
      objc_msgSend(v10, "setDurationMultiplier:");
    }

  }
  else
  {
    v8 = v4 == 2;
    if (v4 >= 2)
    {
      v9 = *(void **)(a1 + 40);
      if (v8)
        objc_msgSend(v9, "diptychDurationMultiplier");
      else
        objc_msgSend(v9, "triptychDurationMultiplier");
      objc_msgSend(v10, "setDurationMultiplier:");
    }
  }

}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "initialDurationMultiplier");
  objc_msgSend(v3, "setDurationMultiplier:");

}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "finalDurationMultiplier");
  objc_msgSend(v3, "setDurationMultiplier:");

}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _OWORD v12[2];
  _OWORD v13[3];
  CMTime v14;
  CMTime v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CMTime v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  double v28;
  _OWORD v29[4];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  double v40;
  CMTime rhs;
  CMTime lhs;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "transitionInfo");
      v7 = *((double *)&v38 + 1);
    }
    else
    {
      v38 = 0u;
      v39 = 0u;
      v7 = 0.0;
    }
    v40 = v7;
    objc_msgSend(v6, "transitionInfo");
    v37 = v36;
    objc_msgSend(v6, "durationMultiplier");
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v8, "_durationInfoForClip:durationMultiplier:songPace:transitionIn:transitionOut:", v6, *(_QWORD *)(a1 + 40), &v40, &v37);
    }
    else
    {
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
    }
    v29[2] = v33;
    v29[3] = v34;
    v30 = v35;
    v29[0] = v31;
    v29[1] = v32;
    objc_msgSend(v6, "setDurationInfo:", v29);
    v9 = v37;
    objc_msgSend(v6, "transitionInfo");
    if (v9 < v28)
    {
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v6, "transitionInfo");
      if (v37 == 0.0)
        *(_QWORD *)&v16 = 1;
      *((double *)&v16 + 1) = v37;
      v27[0] = v16;
      v27[1] = v17;
      objc_msgSend(v6, "setTransitionInfo:", v27);
    }
    v10 = v40;
    if (v5)
    {
      objc_msgSend(v5, "transitionInfo");
      if (v10 >= *((double *)&v25 + 1))
        goto LABEL_25;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v5, "transitionInfo");
      v10 = v40;
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      if (v40 >= 0.0)
        goto LABEL_25;
      v23 = 0uLL;
      v24 = 0uLL;
    }
    if (v10 == 0.0)
      *(_QWORD *)&v23 = 1;
    memset(&v22, 0, sizeof(v22));
    if (v5)
    {
      objc_msgSend(v5, "transitionInfo");
      v11 = *((double *)&v20 + 1);
      v10 = v40;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v11 = 0.0;
    }
    CMTimeMakeWithSeconds(&v22, v11 - v10, 600);
    v18 = 0u;
    memset(&v19, 0, sizeof(v19));
    v16 = 0u;
    v17 = 0u;
    if (v5)
      objc_msgSend(v5, "durationInfo");
    lhs = v19;
    rhs = v22;
    CMTimeAdd(&v15, &lhs, &rhs);
    v19 = v15;
    v13[2] = v18;
    v14 = v15;
    v13[0] = v16;
    v13[1] = v17;
    objc_msgSend(v5, "setDurationInfo:", v13);
    *((double *)&v23 + 1) = v40;
    v12[0] = v23;
    v12[1] = v24;
    objc_msgSend(v5, "setTransitionInfo:", v12);
  }
LABEL_25:

}

void __92__PXStorySongsAutoEditDecisionListsProducer__adjustTransitionsInClips_forChapterCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3 + 1);
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3);
  v8 = v7;
  if ((v6 & 1) != 0 || v7)
  {
    v15 = 0u;
    v16 = 0u;
    if (v5)
      objc_msgSend(v5, "transitionInfo");
    v9 = *(char *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
    {
      v11 = 0;
      v12 = 0;
      if (v9 < 9)
        v13 = v9 - 1 + 1;
      else
        v13 = 0;
      if ((unint64_t)(v13 - 5) <= 3)
      {
        v11 = qword_1A7C0C1D0[v13 - 5];
        v12 = 1;
      }
      *(_QWORD *)&v15 = v13;
      *((_QWORD *)&v15 + 1) = 0x3FE0000000000000;
      *(_QWORD *)&v16 = v12;
      *((_QWORD *)&v16 + 1) = v11;
      goto LABEL_17;
    }
    if (!*(_BYTE *)(a1 + 41))
      goto LABEL_17;
    if (v6)
    {
      v10 = (0x13u >> v15) & 1;
      if ((unint64_t)v15 > 9)
        LOBYTE(v10) = 1;
      if (!v8)
        goto LABEL_15;
    }
    else
    {
      LOBYTE(v10) = 1;
      if (!v8)
        goto LABEL_15;
    }
    if ((unint64_t)(v15 - 5) < 5 || (_QWORD)v15 == 3)
      goto LABEL_16;
LABEL_15:
    if ((v10 & 1) == 0)
LABEL_16:
      *(_QWORD *)&v15 = 1;
LABEL_17:
    v14[0] = v15;
    v14[1] = v16;
    objc_msgSend(v5, "setTransitionInfo:", v14);
  }

}

void __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_clipRangeForMoment:inClips:", a2, *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_2;
  v10[3] = &unk_1E5138898;
  v11 = v6;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v12 = v8;
  v13 = v9;
  objc_msgSend(v7, "provideTransitionsForMomentClipRange:withClipCatalog:usingBlock:", v3, v5, v11, v10);

}

void __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_2(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v9[1] = 3221225472;
  v5 = a2[1];
  v11 = *a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_3;
  v9[3] = &unk_1E5138870;
  v12 = v5;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v13 = v8;
  objc_msgSend(v6, "updateClipAtIndex:usingBlock:", a3, v9);

}

void __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[2];
  __int128 v8;

  v8 = *(_OWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = a2;
  objc_msgSend(v3, "durationForTransitionKind:songPace:", v2, v4);
  v7[0] = v2;
  v7[1] = v6;
  objc_msgSend(v5, "setTransitionInfo:", v7);

}

void __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_clipRangeForMoment:inClips:", a2, *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_2;
  v8[3] = &unk_1E5138820;
  v9 = v6;
  objc_msgSend(v7, "provideMotionStylesForMomentClipRange:withClipCatalog:usingBlock:", v3, v5, v9, v8);

}

uint64_t __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_2(uint64_t a1, __int128 *a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_3;
  v5[3] = &__block_descriptor_56_e38_v16__0___PXStoryMutableAutoEditClip__8l;
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  return objc_msgSend(v3, "updateClipAtIndex:usingBlock:", a3, v5);
}

uint64_t __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "setMotionInfo:", &v3);
}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_clipRangeForMoment:inClips:", a2, *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_2;
  v10[3] = &unk_1E5138738;
  v11 = v6;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v12 = v8;
  v13 = v9;
  objc_msgSend(v7, "provideRecipeForMomentClipRange:withClipCatalog:usingBlock:", v3, v5, v11, v10);

}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_6;
  v5[3] = &unk_1E51387B0;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v4, "provideDebugInfoForClip:usingBlock:", a3, v5);

}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_7;
  v7[3] = &unk_1E5138788;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateClipAtIndex:usingBlock:", v4, v7);

}

uint64_t __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDebugInfo:", *(_QWORD *)(a1 + 32));
}

uint64_t __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_2(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  uint64_t v9;
  uint64_t result;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  __int128 v20;
  uint64_t v21;

  v8 = *(void **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_3;
  v19[3] = &__block_descriptor_64_e38_v16__0___PXStoryMutableAutoEditClip__8l;
  v19[4] = a4;
  v20 = *a2;
  v21 = *((_QWORD *)a2 + 2);
  result = objc_msgSend(v8, "updateClipAtIndex:usingBlock:", a5, v19);
  v11 = a5 < 1;
  v12 = a5 - 1;
  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "durationForTransitionKind:songPace:", *(_QWORD *)a3, *(_QWORD *)(a1 + 48));
    *((_QWORD *)a3 + 1) = v13;
    v14 = *(void **)(a1 + 32);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_4;
    v16[3] = &__block_descriptor_64_e38_v16__0___PXStoryMutableAutoEditClip__8l;
    v15 = a3[1];
    v17 = *a3;
    v18 = v15;
    return objc_msgSend(v14, "updateClipAtIndex:usingBlock:", v12, v16);
  }
  return result;
}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) == 2)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoEditDoublePlaceMultiplier");
    objc_msgSend(v3, "setDurationMultiplier:");

  }
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "setMotionInfo:", &v5);

}

uint64_t __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_4(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setTransitionInfo:", v4);
}

void __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_clipRangeForMoment:inClips:", a2, *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_2;
  v10[3] = &unk_1E51386C8;
  v11 = v6;
  objc_msgSend(v7, "provideModulesForMomentClipRange:withClipCatalog:maxModuleLength:maxEmptySpaceLength:usingBlock:", v3, v5, v11, v9, v8, v10);

}

uint64_t __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_2(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  void *v5;
  _QWORD v7[5];
  char v8;
  char v9;

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_3;
  v7[3] = &__block_descriptor_42_e38_v16__0___PXStoryMutableAutoEditClip__8l;
  v7[4] = a3;
  v8 = a2;
  v9 = a4;
  return objc_msgSend(v5, "updateClipAtIndex:usingBlock:", a5, v7);
}

void __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setModuleInfo:", v2, v3);

}

uint64_t __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  float v14;

  v4 = a1;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a3;
  objc_msgSend(v5, "composabilityScoresForDisplayAssetIndex:", objc_msgSend(a2, "unsignedIntValue"));
  v8 = v7;
  v10 = v9;
  v11 = *(void **)(*(_QWORD *)(v4 + 32) + 56);
  LODWORD(v4) = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v11, "composabilityScoresForDisplayAssetIndex:", v4);
  if (v8 >= v10)
    v14 = v8;
  else
    v14 = v10;
  if (v12 < v13)
    v12 = v13;
  if (v14 < v12)
    return -1;
  else
    return v14 > v12;
}

uint64_t __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "playbackStyle");
  switch(result)
  {
    case 1:
      v4 = a1 + 32;
      goto LABEL_5;
    case 2:
    case 4:
    case 5:
      v4 = a1 + 40;
      goto LABEL_5;
    case 3:
      v4 = a1 + 48;
LABEL_5:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 24);
      break;
    default:
      return result;
  }
  return result;
}

void __89__PXStorySongsAutoEditDecisionListsProducer_decisionListForSong_pace_colorGradeCategory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_decisionListForSong:pace:colorGradeCategory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __125__PXStorySongsAutoEditDecisionListsProducer_requestDefaultAutoEditDecisionListsWithColorGradeCategory_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  PXStoryProducerResult *v4;
  void *v5;
  PXStoryProducerResult *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_decisionListForSong:pace:colorGradeCategory:", 0, 2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  v3 = *(_QWORD *)(a1 + 56);
  v4 = [PXStoryProducerResult alloc];
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXStoryProducerResult initWithObject:](v4, "initWithObject:", v5);
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v3 + 16))(v3, v6);

  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryAutoEditDecisionList.SingleRequest", ", v10, 2u);
  }

}

void __132__PXStorySongsAutoEditDecisionListsProducer_requestAutoEditDecisionListsWithOptions_songs_colorGradeCategoriesBySong_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  PXStoryProducerResult *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  __int128 v28;
  _BYTE buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 72));
  if (*(uint64_t *)(a1 + 72) >= 1)
  {
    v4 = 0;
    *(_QWORD *)&v3 = 134218242;
    v28 = v3;
    do
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled", v28, *(_OWORD *)buf, *(_QWORD *)&buf[16], v30) & 1) != 0)
        goto LABEL_23;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        objc_msgSend(v5, "colorGradeCategory");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "autoEditSongPaceOverride");

      if (!v11)
      {
        if (!v5)
        {
          PLStoryGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v17 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v28;
            *(_QWORD *)&buf[4] = v4;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v17;
            v13 = v12;
            v14 = OS_LOG_TYPE_ERROR;
            v15 = "Falling back to medium song pace for nil song at index %lu. Songs: %@";
            v16 = 22;
LABEL_14:
            _os_log_impl(&dword_1A6789000, v13, v14, v15, buf, v16);
          }
LABEL_15:

          v11 = 2;
          goto LABEL_16;
        }
        v11 = objc_msgSend(v5, "pace");
        if (!v11)
        {
          PLStoryGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v13 = v12;
            v14 = OS_LOG_TYPE_DEBUG;
            v15 = "Falling back to medium song pace for song with unknown pace";
            v16 = 2;
            goto LABEL_14;
          }
          goto LABEL_15;
        }
      }
LABEL_16:
      objc_msgSend(*(id *)(a1 + 56), "_decisionListForSong:pace:colorGradeCategory:", v5, v11, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v18);
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

      ++v4;
    }
    while (v4 < *(_QWORD *)(a1 + 72));
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "autoEditProductionSimulatedDelay");
  v21 = v20;

  if (v21 > 0.0)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v21);
  v22 = (void *)objc_msgSend(v2, "copy");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 64), v22);
  v23 = *(_QWORD *)(a1 + 64);
  v24 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v22);
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v23 + 16))(v23, v24);

  v25 = *(id *)(*(_QWORD *)(a1 + 56) + 24);
  v26 = v25;
  v27 = *(_QWORD *)(a1 + 80);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PXStoryAutoEditDecisionList.MultipleRequest", ", buf, 2u);
  }

LABEL_23:
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)audioModeDecisionForAsset:(id)a3 minimumAudioScore:(float)a4 playbackStyle:(int64_t)a5 movieHighlight:(id)a6 storyConfiguration:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  int v23;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v11 = a3;
  v12 = a6;
  if (!objc_msgSend(a7, "isAllowedToPlayAnyMusicOrSound"))
  {
    v14 = 10;
    v13 = 1;
    goto LABEL_19;
  }
  if (a5 != 1)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "loudness");
      if (v16 >= 0.0 || (objc_msgSend(v12, "peakVolume"), v17 <= 0.0))
      {
        v13 = 0;
        v14 = 3;
      }
      else
      {
        if (objc_msgSend(v12, "hasMusic") && (objc_msgSend(v15, "muteBackgroundMusic") & 1) != 0)
        {
          v14 = 4;
        }
        else
        {
          objc_msgSend(v12, "audioQualityScore");
          if (v18 >= a4)
          {
            objc_msgSend(v11, "audioScore");
            if (v19 >= a4)
            {
              switch(a5)
              {
                case 5:
                  v22 = objc_msgSend(v15, "loopingVideoAudioStrategy");
                  break;
                case 4:
                  if ((objc_msgSend(v11, "mediaSubtypes") & 0x20000) != 0)
                    v22 = objc_msgSend(v15, "slomoVideoAudioStrategy");
                  else
                    v22 = objc_msgSend(v15, "videoAudioStrategy");
                  break;
                case 3:
                  v22 = objc_msgSend(v15, "livePhotoAudioStrategy");
                  break;
                default:
LABEL_29:
                  v13 = 1;
LABEL_32:
                  v14 = 7;
                  goto LABEL_18;
              }
              switch(v22)
              {
                case 0:
                  goto LABEL_29;
                case 1:
                  v13 = 2;
                  goto LABEL_32;
                case 2:
                  v13 = 3;
                  goto LABEL_32;
                case 3:
                  if (objc_msgSend(v12, "hasVoice"))
                    v13 = 3;
                  else
                    v13 = 2;
                  v14 = 8;
                  goto LABEL_18;
                case 4:
                  v23 = objc_msgSend(v12, "hasVoice");
                  if ((v23 & objc_msgSend(v12, "hasFace")) != 0)
                    v13 = 3;
                  else
                    v13 = 2;
                  goto LABEL_46;
                case 5:
                  if (objc_msgSend(v12, "hasVoice"))
                  {
                    if (objc_msgSend(v12, "hasFace"))
                      v13 = 3;
                    else
                      v13 = 1;
                  }
                  else
                  {
                    v13 = 2;
                  }
LABEL_46:
                  v14 = 9;
                  break;
                default:
                  v14 = 0;
                  v13 = 0;
                  break;
              }
              goto LABEL_18;
            }
            v14 = 6;
          }
          else
          {
            v14 = 5;
          }
        }
        v13 = 1;
      }
    }
    else
    {
      v13 = 0;
      v14 = 2;
    }
LABEL_18:

    goto LABEL_19;
  }
  v13 = 0;
  v14 = 1;
LABEL_19:

  v20 = v13;
  v21 = v14;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

@end
