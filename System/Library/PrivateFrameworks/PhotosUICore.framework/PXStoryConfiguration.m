@implementation PXStoryConfiguration

- (void)swift_copyPropertiesFromConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  PXStoryConfiguration *v13;
  char *v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;
  _BYTE v19[24];

  v5 = sub_1A7ADF540();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v11 = &v19[-v10];
  v12 = a3;
  v13 = self;
  v14 = (char *)sub_1A6A99D1C();
  v15 = &v14[OBJC_IVAR____TtCE12PhotosUICoreCSo20PXStoryConfigurationP33_27B58BDBD52885D8CE4F3AB1064A7A5514AssociatedData_environmentValues];
  swift_beginAccess();
  v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v11, v15, v5);

  v17 = (char *)sub_1A6A99D1C();
  v16(v8, v11, v5);
  v18 = &v17[OBJC_IVAR____TtCE12PhotosUICoreCSo20PXStoryConfigurationP33_27B58BDBD52885D8CE4F3AB1064A7A5514AssociatedData_environmentValues];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 40))(v18, v8, v5);
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

- (PXStoryConfiguration)initWithSyntheticAsset
{
  return -[PXStoryConfiguration initWithSyntheticAssetCount:](self, "initWithSyntheticAssetCount:", 1);
}

- (PXStoryConfiguration)initWithSyntheticAssetCount:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  PXStoryConfiguration *v11;
  _QWORD v13[5];

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  if (a3 >= 1)
  {
    v6 = 0;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = objc_alloc((Class)off_1E50B5AF0);
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __63__PXStoryConfiguration_Synthetic__initWithSyntheticAssetCount___block_invoke;
      v13[3] = &__block_descriptor_40_e35_v16__0___PXMutableSyntheticAsset__8l;
      v13[4] = v6;
      v9 = (void *)objc_msgSend(v8, "initWithConfiguration:", v13);
      objc_msgSend(v5, "addObject:", v9);

      ++v6;
    }
    while (a3 != v6);
  }
  PXDisplayAssetFetchResultFromArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXStoryConfiguration initWithAssets:](self, "initWithAssets:", v10);

  return v11;
}

void __63__PXStoryConfiguration_Synthetic__initWithSyntheticAssetCount___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("A%li"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setLabel:", v5);

}

- (PXStoryConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConfiguration.m"), 38, CFSTR("%s is not available as initializer"), "-[PXStoryConfiguration init]");

  abort();
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3
{
  return -[PXStoryConfiguration initWithAssetCollection:keyAsset:](self, "initWithAssetCollection:keyAsset:", a3, 0);
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3 keyAsset:(id)a4
{
  return -[PXStoryConfiguration initWithAssetCollection:keyAsset:referencePersons:](self, "initWithAssetCollection:keyAsset:referencePersons:", a3, a4, 0);
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3 keyAsset:(id)a4 referencePersons:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXStoryErrorRepository *v11;
  PXStoryConfiguration *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PXStoryErrorRepository);
  v12 = -[PXStoryConfiguration initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:](self, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", v10, 0, v9, v8, 0, 0, v11, 0, 0);

  return v12;
}

- (PXStoryConfiguration)initWithAssets:(id)a3
{
  return -[PXStoryConfiguration initWithAssets:keyAsset:persistableRecipe:](self, "initWithAssets:keyAsset:persistableRecipe:", a3, 0, 0);
}

- (PXStoryConfiguration)initWithAssets:(id)a3 keyAsset:(id)a4 persistableRecipe:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXStoryErrorRepository *v11;
  PXStoryConfiguration *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PXStoryErrorRepository);
  v12 = -[PXStoryConfiguration initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:](self, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", 0, v10, v9, 0, v8, 0, v11, 0, 0);

  return v12;
}

- (PXStoryConfiguration)initWithPersistableRecipe:(id)a3
{
  id v4;
  PXStoryErrorRepository *v5;
  PXStoryConfiguration *v6;

  v4 = a3;
  v5 = objc_alloc_init(PXStoryErrorRepository);
  v6 = -[PXStoryConfiguration initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:](self, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", 0, 0, 0, 0, v4, 0, v5, 0, 0);

  return v6;
}

- (BOOL)_checkForceFlexMusicSettingForAssetCollection:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_msgSend(v5, "forceFlexForPHMemory");

    if ((v7 & 1) == 0)
    {
LABEL_3:
      PLStoryGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "[LemMusic][ForceFlex] Not Enabled.", v12, 2u);
      }
      v9 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = objc_msgSend(v5, "forceFlexForNonPHMemory");

    if (!v10)
      goto LABEL_3;
  }
  PLStoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "[LemMusic][ForceFlex] Enabled via Internal Settings UI.", buf, 2u);
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3 assets:(id)a4 keyAsset:(id)a5 referencePersons:(id)a6 persistableRecipe:(id)a7 musicCurationProvider:(id)a8 errorRepository:(id)a9 queue:(id)a10 parentConfiguration:(id)a11
{
  id v17;
  unint64_t v18;
  id v19;
  id v20;
  PXStoryConfiguration *v21;
  PXStoryConfiguration *v22;
  uint64_t v23;
  NSArray *referencePersons;
  uint64_t v25;
  PFStoryRecipe *persistableRecipe;
  OS_dispatch_queue *v27;
  OS_dispatch_queue *storyQueue;
  OS_dispatch_queue *v29;
  id v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *userInfo;
  PXStoryPhotoKitMusicCurationProvider *v33;
  PXStoryMusicCurationProvider *musicCurationProvider;
  void *v35;
  PXDefaultAppleMusicStatusProvider *v36;
  void *appleMusicStatusProvider;
  uint64_t v38;
  PXAppleMusicStatusProvider *v39;
  id v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  unint64_t v47;
  id v48;
  signed int v49;
  uint64_t v50;
  OS_os_log *log;
  void *v52;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  void *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v58 = a4;
  v57 = a5;
  v17 = a6;
  v18 = (unint64_t)a7;
  v19 = a9;
  v20 = a10;
  v56 = a11;
  v60.receiver = self;
  v60.super_class = (Class)PXStoryConfiguration;
  v21 = -[PXStoryConfiguration init](&v60, sel_init);
  v22 = v21;
  if (v21)
  {
    v54 = v19;
    objc_storeStrong((id *)&v21->_assetCollection, a3);
    objc_storeStrong((id *)&v22->_assets, a4);
    objc_storeStrong((id *)&v22->_keyAsset, a5);
    v23 = objc_msgSend(v17, "copy");
    referencePersons = v22->_referencePersons;
    v22->_referencePersons = (NSArray *)v23;

    v25 = objc_msgSend((id)v18, "copyWithZone:", 0);
    persistableRecipe = v22->_persistableRecipe;
    v22->_persistableRecipe = (PFStoryRecipe *)v25;

    if (v20)
    {
      v27 = (OS_dispatch_queue *)v20;
      storyQueue = v22->_storyQueue;
      v22->_storyQueue = v27;
    }
    else
    {
      v29 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v30 = MEMORY[0x1E0C80D38];
      storyQueue = v22->_storyQueue;
      v22->_storyQueue = v29;
    }

    objc_storeStrong((id *)&v22->_errorRepository, a9);
    objc_storeStrong((id *)&v22->_errorReporter, a9);
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v22->_userInfo;
    v22->_userInfo = v31;

    objc_storeStrong((id *)&v22->_parentConfiguration, a11);
    v22->_initialViewMode = 1;
    v22->_songsProducerKind = 0;
    v33 = objc_alloc_init(PXStoryPhotoKitMusicCurationProvider);
    musicCurationProvider = v22->_musicCurationProvider;
    v22->_musicCurationProvider = (PXStoryMusicCurationProvider *)v33;

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "isAppleMusicAllowed"))
    {
      v36 = objc_alloc_init(PXDefaultAppleMusicStatusProvider);
      appleMusicStatusProvider = v22->_appleMusicStatusProvider;
      v22->_appleMusicStatusProvider = (PXAppleMusicStatusProvider *)v36;
    }
    else
    {
      v61 = &unk_1E53EF600;
      v62[0] = &unk_1E53EF618;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
      appleMusicStatusProvider = (void *)objc_claimAutoreleasedReturnValue();
      PXCreateDefaultAppleMusicStatusProviderWithOverrides(appleMusicStatusProvider);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v22->_appleMusicStatusProvider;
      v22->_appleMusicStatusProvider = (PXAppleMusicStatusProvider *)v38;

    }
    v40 = v20;

    v22->_isAllowedToPlayAnyMusicOrSound = 1;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_isAllowedToPlayAppleMusic = objc_msgSend(v41, "shouldShowAppleMusicRelatedUI");

    v22->_shouldForceUsingFlexMusic = -[PXStoryConfiguration _checkForceFlexMusicSettingForAssetCollection:](v22, "_checkForceFlexMusicSettingForAssetCollection:", v59);
    objc_storeStrong((id *)&v22->_launchType, CFSTR("Unknown"));
    v22->_fixedSegmentDuration.value = 0;
    *(_QWORD *)&v22->_fixedSegmentDuration.timescale = 0;
    v22->_fixedSegmentDuration.epoch = 0;
    v22->_allowedInlineTitles = objc_msgSend(v35, "wantsTitles") << 63 >> 63;
    v22->_disableNUp = objc_msgSend(v35, "autoEditDisableNUp");
    v22->_keyAssetAspectRatioOverride = objc_msgSend(v35, "keyAssetAspectRatioOverride");
    v22->_otherAssetsAspectRatioOverride = objc_msgSend(v35, "otherAssetsAspectRatioOverride");
    v22->_disabledClipMotionStyles = objc_msgSend(v35, "disabledClipMotionStyles");
    v22->_isLetterboxingAllowed = 1;
    v22->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle = objc_msgSend(v35, "preferAssetLocationAndCreationDateForClipTitleAndSubtitle");
    v22->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset = objc_msgSend(v35, "forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset");
    objc_msgSend(v35, "noncriticalBufferingTimeout");
    v22->_noncriticalBufferingTimeout = v42;
    v22->_disableVideoPlayback = objc_msgSend(v35, "disableVideoPlayback");
    v22->_movementAnimationCurve = objc_msgSend(v35, "movementAnimationCurve");
    v22->_collectionPersistenceConfirmationStyle = 0;
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v22->_collectionPersistenceConfirmationStyle = objc_msgSend(v43, "playLensCollectionPersistenceConfirmationStyle");

    }
    +[PXStoryConcreteTimelineSettings sharedInstance](PXStoryConcreteTimelineSettings, "sharedInstance", v54);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "kenBurnsPanSpeed");
    v22->_kenBurnsPanSpeed = v45;
    objc_msgSend(v44, "kenBurnsScaleSpeed");
    v22->_kenBurnsScaleSpeed = v46;
    v22->_allowPlayingMultipleStoriesSimultaneously = 0;
    v22->_keyAssetKenBurnsScaleDirection = 0;
    v22->_keyAssetKenBurnsPanDirection = 0;
    v22->_forcedKenBurnsScaleDirection = 0;
    v47 = (unint64_t)v59;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v48 = (id)v47;
    else
      v48 = 0;

    v22->_wantsFeedbackAction = objc_msgSend(v48, "isGenerative");
    v22->_allowsVerticalGestures = 1;
    v22->_videoPlaybackRate = 1.0;
    v22->_curationKind = 2;
    if (!(v47 | v18))
      v22->_nUpCompositionIgnoresOverallTargetDuration = v58 != 0;
    v19 = v55;
    if (initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__onceToken != -1)
      dispatch_once(&initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__onceToken, &__block_literal_global_274902);
    do
      v49 = __ldaxr((unsigned int *)&initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__contextId);
    while (__stlxr(v49 + 1, (unsigned int *)&initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__contextId));
    v22->_logContext = v49;
    PLStoryGetLog();
    v50 = objc_claimAutoreleasedReturnValue();
    log = v22->_log;
    v22->_log = (OS_os_log *)v50;

    -[PXStoryConfiguration log](v22, "log");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setLog:", v52);

    objc_msgSend(v55, "setLogContext:", -[PXStoryConfiguration logContext](v22, "logContext"));
    v20 = v40;
  }

  return v22;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration keyAsset](self, "keyAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, assetCollection=%@ assets=%@ keyAsset=%@ persistableRecipe=%@>"), v5, self, v6, v7, v9, v10);

  return (NSString *)v11;
}

- (PHPhotoLibrary)photoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_18;
    goto LABEL_13;
  }
  -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PFStoryRecipe_PXStoryExtension PHPhotoLibraryForRecipe:](PFStoryRecipe_PXStoryExtension, "PHPhotoLibraryForRecipe:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v4 = (void *)v7;
    goto LABEL_12;
  }
  -[PXStoryConfiguration keyAsset](self, "keyAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v6 = v9;
  }
  else
  {
    -[PXStoryConfiguration assets](self, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "photoLibrary");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = 0;
LABEL_12:

  if (v4)
    goto LABEL_18;
LABEL_13:
  -[PXStoryConfiguration assets](self, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v13, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return (PHPhotoLibrary *)v4;
}

- (PXMediaProvider)mediaProvider
{
  PXStoryConfiguration *v3;
  PXMediaProvider *mediaProvider;
  void *v5;
  id v6;
  PXPhotoKitUIMediaProvider *v7;
  PXMediaProvider *v8;
  PXMediaProvider *v9;
  void *v11;

  v3 = self;
  objc_sync_enter(v3);
  mediaProvider = v3->_mediaProvider;
  if (!mediaProvider)
  {
    -[PXStoryConfiguration photoLibrary](v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PXStoryConfiguration.m"), 201, CFSTR("no media provider could be determined for %@"), v3);

      abort();
    }
    v6 = objc_alloc_init(MEMORY[0x1E0CD15A0]);
    v7 = -[PXPhotoKitUIMediaProvider initWithImageManager:library:]([PXPhotoKitUIMediaProvider alloc], "initWithImageManager:library:", v6, v5);
    v8 = v3->_mediaProvider;
    v3->_mediaProvider = &v7->super.super;

    mediaProvider = v3->_mediaProvider;
  }
  v9 = mediaProvider;
  objc_sync_exit(v3);

  return v9;
}

- (void)setMediaProvider:(id)a3
{
  PXMediaProvider *v4;
  PXMediaProvider *mediaProvider;
  PXStoryConfiguration *obj;

  v4 = (PXMediaProvider *)a3;
  obj = self;
  objc_sync_enter(obj);
  mediaProvider = obj->_mediaProvider;
  obj->_mediaProvider = v4;

  objc_sync_exit(obj);
}

- (BOOL)isAppleMusicPreview
{
  return (-[PXStoryConfiguration options](self, "options") >> 4) & 1;
}

- (BOOL)isExportPreview
{
  return (-[PXStoryConfiguration options](self, "options") >> 7) & 1;
}

- (BOOL)isPresentedForAirPlay
{
  return (-[PXStoryConfiguration options](self, "options") >> 5) & 1;
}

- (BOOL)isRelated
{
  return (-[PXStoryConfiguration options](self, "options") & 0xC) != 0;
}

- (BOOL)shouldDismissAtEnd
{
  return (-[PXStoryConfiguration options](self, "options") >> 8) & 1;
}

- (BOOL)shouldReplayAtEnd
{
  return (-[PXStoryConfiguration options](self, "options") >> 11) & 1;
}

- (BOOL)shouldFadeToBlackAtEnd
{
  return (-[PXStoryConfiguration options](self, "options") >> 12) & 1;
}

- (id)copyWithAdditionalOptions:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[PXStoryConfiguration copy](self, "copy");
  objc_msgSend(v4, "setOptions:", objc_msgSend(v4, "options") | a3);
  return v4;
}

- (id)copyWithStoryQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;

  v4 = a3;
  v15 = objc_alloc((Class)objc_opt_class());
  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration keyAsset](self, "keyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration referencePersons](self, "referencePersons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration musicCurationProvider](self, "musicCurationProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration errorRepository](self, "errorRepository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration parentConfiguration](self, "parentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", v14, v5, v6, v7, v8, v9, v10, v4, v11);

  objc_msgSend(v12, "_copyPropertiesFromConfiguration:", self);
  return v12;
}

- (void)configureWithNavigationSource:(id)a3
{
  const __CFString *v4;
  __CFString *v5;

  v5 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("notification")) & 1) != 0)
  {
    v4 = CFSTR("Notification");
  }
  else if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("widget")))
  {
    v4 = CFSTR("Widget");
  }
  else
  {
    v4 = v5;
  }
  -[PXStoryConfiguration setLaunchType:](self, "setLaunchType:", v4);

}

- (id)copyWithParentConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXStoryConfiguration *v15;
  void *v17;
  id v18;

  v4 = a3;
  -[PXStoryConfiguration parentConfiguration](self, "parentConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "isEqual:", v5);

  if (v7)
  {
LABEL_5:
    v15 = self;
    goto LABEL_6;
  }
  v18 = objc_alloc((Class)objc_opt_class());
  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration keyAsset](self, "keyAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration referencePersons](self, "referencePersons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration musicCurationProvider](self, "musicCurationProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorRepository");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storyQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (PXStoryConfiguration *)objc_msgSend(v18, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", v17, v8, v9, v10, v11, v12, v13, v14, v4);

  -[PXStoryConfiguration _copyPropertiesFromConfiguration:](v15, "_copyPropertiesFromConfiguration:", self);
LABEL_6:

  return v15;
}

- (id)copyWithKeyAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXStoryConfiguration *v15;
  void *v17;
  id v18;

  v4 = a3;
  -[PXStoryConfiguration keyAsset](self, "keyAsset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "isEqual:", v5);

  if (v7)
  {
LABEL_5:
    v15 = self;
    goto LABEL_6;
  }
  v18 = objc_alloc((Class)objc_opt_class());
  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration referencePersons](self, "referencePersons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration musicCurationProvider](self, "musicCurationProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration errorRepository](self, "errorRepository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration storyQueue](self, "storyQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration parentConfiguration](self, "parentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (PXStoryConfiguration *)objc_msgSend(v18, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", v17, v8, v4, v9, v10, v11, v12, v13, v14);

  -[PXStoryConfiguration _copyPropertiesFromConfiguration:](v15, "_copyPropertiesFromConfiguration:", self);
LABEL_6:

  return v15;
}

- (void)_copyPropertiesFromConfiguration:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *userInfo;
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
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  objc_storeStrong((id *)&self->_mediaProvider, *((id *)a3 + 5));
  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
  userInfo = self->_userInfo;
  self->_userInfo = v7;

  objc_msgSend(v5, "timelineProducer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setTimelineProducer:](self, "setTimelineProducer:", v9);

  objc_msgSend(v5, "styleProducer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setStyleProducer:](self, "setStyleProducer:", v10);

  objc_msgSend(v5, "relatedProducer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setRelatedProducer:](self, "setRelatedProducer:", v11);

  objc_msgSend(v5, "autoCurationProducer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setAutoCurationProducer:](self, "setAutoCurationProducer:", v12);

  -[PXStoryConfiguration setOptions:](self, "setOptions:", objc_msgSend(v5, "options"));
  objc_msgSend(v5, "launchType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setLaunchType:](self, "setLaunchType:", v13);

  objc_msgSend(v5, "originalContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setOriginalContainer:](self, "setOriginalContainer:", v14);

  objc_msgSend(v5, "originalCurationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setOriginalCurationContext:](self, "setOriginalCurationContext:", v15);

  objc_msgSend(v5, "songsConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setSongsConfiguration:](self, "setSongsConfiguration:", v16);

  -[PXStoryConfiguration setSongsProducerKind:](self, "setSongsProducerKind:", objc_msgSend(v5, "songsProducerKind"));
  objc_msgSend(v5, "detailedSaliencyProducer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setDetailedSaliencyProducer:](self, "setDetailedSaliencyProducer:", v17);

  -[PXStoryConfiguration setDisableBufferingController:](self, "setDisableBufferingController:", objc_msgSend(v5, "disableBufferingController"));
  objc_msgSend(v5, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setPresentingViewController:](self, "setPresentingViewController:", v18);

  objc_msgSend(v5, "assetCollectionActionPerformerDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setAssetCollectionActionPerformerDelegate:](self, "setAssetCollectionActionPerformerDelegate:", v19);

  objc_msgSend(v5, "containerTapToRadarDiagnosticsProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setContainerTapToRadarDiagnosticsProvider:](self, "setContainerTapToRadarDiagnosticsProvider:", v20);

  -[PXStoryConfiguration setInitialViewMode:](self, "setInitialViewMode:", objc_msgSend(v5, "initialViewMode"));
  objc_msgSend(v5, "musicCurationProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setMusicCurationProvider:](self, "setMusicCurationProvider:", v21);

  objc_msgSend(v5, "log");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setLog:](self, "setLog:", v22);

  objc_msgSend(v5, "appleMusicStatusProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setAppleMusicStatusProvider:](self, "setAppleMusicStatusProvider:", v23);

  objc_msgSend(v5, "fixedSegmentDuration");
  v26 = v28;
  v27 = v29;
  -[PXStoryConfiguration setFixedSegmentDuration:](self, "setFixedSegmentDuration:", &v26);
  -[PXStoryConfiguration setAllowedInlineTitles:](self, "setAllowedInlineTitles:", objc_msgSend(v5, "allowedInlineTitles"));
  -[PXStoryConfiguration setCurationKind:](self, "setCurationKind:", objc_msgSend(v5, "curationKind"));
  -[PXStoryConfiguration setNUpCompositionIgnoresOverallTargetDuration:](self, "setNUpCompositionIgnoresOverallTargetDuration:", objc_msgSend(v5, "nUpCompositionIgnoresOverallTargetDuration"));
  -[PXStoryConfiguration setDisableNUp:](self, "setDisableNUp:", objc_msgSend(v5, "disableNUp"));
  -[PXStoryConfiguration setDisabledClipMotionStyles:](self, "setDisabledClipMotionStyles:", objc_msgSend(v5, "disabledClipMotionStyles"));
  -[PXStoryConfiguration setIsLetterboxingAllowed:](self, "setIsLetterboxingAllowed:", objc_msgSend(v5, "isLetterboxingAllowed"));
  objc_msgSend(v5, "allowedTransitionKinds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setAllowedTransitionKinds:](self, "setAllowedTransitionKinds:", v24);

  -[PXStoryConfiguration setKeyAssetAspectRatioOverride:](self, "setKeyAssetAspectRatioOverride:", objc_msgSend(v5, "keyAssetAspectRatioOverride"));
  -[PXStoryConfiguration setOtherAssetsAspectRatioOverride:](self, "setOtherAssetsAspectRatioOverride:", objc_msgSend(v5, "otherAssetsAspectRatioOverride"));
  -[PXStoryConfiguration setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:](self, "setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:", objc_msgSend(v5, "preferAssetLocationAndCreationDateForClipTitleAndSubtitle"));
  -[PXStoryConfiguration setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:](self, "setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:", objc_msgSend(v5, "forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset"));
  -[PXStoryConfiguration setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:](self, "setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:", objc_msgSend(v5, "usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets"));
  -[PXStoryConfiguration setPreferFaceCrops:](self, "setPreferFaceCrops:", objc_msgSend(v5, "preferFaceCrops"));
  objc_msgSend(v5, "kenBurnsPanSpeed");
  -[PXStoryConfiguration setKenBurnsPanSpeed:](self, "setKenBurnsPanSpeed:");
  objc_msgSend(v5, "kenBurnsScaleSpeed");
  -[PXStoryConfiguration setKenBurnsScaleSpeed:](self, "setKenBurnsScaleSpeed:");
  objc_msgSend(v5, "desiredStartAsset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration setDesiredStartAsset:](self, "setDesiredStartAsset:", v25);

  objc_msgSend(v5, "noncriticalBufferingTimeout");
  -[PXStoryConfiguration setNoncriticalBufferingTimeout:](self, "setNoncriticalBufferingTimeout:");
  -[PXStoryConfiguration setAllowPlayingMultipleStoriesSimultaneously:](self, "setAllowPlayingMultipleStoriesSimultaneously:", objc_msgSend(v5, "allowPlayingMultipleStoriesSimultaneously"));
  -[PXStoryConfiguration setDisableVideoPlayback:](self, "setDisableVideoPlayback:", objc_msgSend(v5, "disableVideoPlayback"));
  -[PXStoryConfiguration setMovementAnimationCurve:](self, "setMovementAnimationCurve:", objc_msgSend(v5, "movementAnimationCurve"));
  -[PXStoryConfiguration setCollectionPersistenceConfirmationStyle:](self, "setCollectionPersistenceConfirmationStyle:", objc_msgSend(v5, "collectionPersistenceConfirmationStyle"));
  -[PXStoryConfiguration setUseLowMemoryMode:](self, "setUseLowMemoryMode:", objc_msgSend(v5, "useLowMemoryMode"));
  -[PXStoryConfiguration setForcedKenBurnsScaleDirection:](self, "setForcedKenBurnsScaleDirection:", objc_msgSend(v5, "forcedKenBurnsScaleDirection"));
  -[PXStoryConfiguration setKeyAssetKenBurnsScaleDirection:](self, "setKeyAssetKenBurnsScaleDirection:", objc_msgSend(v5, "keyAssetKenBurnsScaleDirection"));
  -[PXStoryConfiguration setKeyAssetKenBurnsPanDirection:](self, "setKeyAssetKenBurnsPanDirection:", objc_msgSend(v5, "keyAssetKenBurnsPanDirection"));
  -[PXStoryConfiguration setWantsFeedbackAction:](self, "setWantsFeedbackAction:", objc_msgSend(v5, "wantsFeedbackAction"));
  -[PXStoryConfiguration setAllowsVerticalGestures:](self, "setAllowsVerticalGestures:", objc_msgSend(v5, "allowsVerticalGestures"));
  -[PXStoryConfiguration setActiveStateManagedExternally:](self, "setActiveStateManagedExternally:", objc_msgSend(v5, "activeStateManagedExternally"));
  -[PXStoryConfiguration setIsAllowedToPlayAnyMusicOrSound:](self, "setIsAllowedToPlayAnyMusicOrSound:", objc_msgSend(v5, "isAllowedToPlayAnyMusicOrSound"));
  -[PXStoryConfiguration setShouldForceUsingFlexMusic:](self, "setShouldForceUsingFlexMusic:", objc_msgSend(v5, "shouldForceUsingFlexMusic"));
  -[PXStoryConfiguration setIsAllowedToPlayAppleMusic:](self, "setIsAllowedToPlayAppleMusic:", objc_msgSend(v5, "isAllowedToPlayAppleMusic"));
  objc_msgSend(v5, "videoPlaybackRate");
  -[PXStoryConfiguration setVideoPlaybackRate:](self, "setVideoPlaybackRate:");
  -[PXStoryConfiguration swift_copyPropertiesFromConfiguration:](self, "swift_copyPropertiesFromConfiguration:", v5);

}

- (id)copyWithAssetCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[PXStoryConfiguration errorRepository](self, "errorRepository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration storyQueue](self, "storyQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration parentConfiguration](self, "parentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", v4, 0, 0, 0, 0, 0, v6, v7, v8);

  objc_msgSend(v9, "_copyPropertiesFromConfiguration:", self);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;

  v15 = objc_alloc((Class)objc_opt_class());
  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration keyAsset](self, "keyAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration referencePersons](self, "referencePersons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration persistableRecipe](self, "persistableRecipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration musicCurationProvider](self, "musicCurationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration errorRepository](self, "errorRepository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration storyQueue](self, "storyQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConfiguration parentConfiguration](self, "parentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithAssetCollection:assets:keyAsset:referencePersons:persistableRecipe:musicCurationProvider:errorRepository:queue:parentConfiguration:", v14, v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(v12, "_copyPropertiesFromConfiguration:", self);
  objc_msgSend(v12, "setLogContext:", -[PXStoryConfiguration logContext](self, "logContext"));
  return v12;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXStoryMusicCurationProvider)musicCurationProvider
{
  return self->_musicCurationProvider;
}

- (void)setMusicCurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_musicCurationProvider, a3);
}

- (PXAppleMusicStatusProvider)appleMusicStatusProvider
{
  return self->_appleMusicStatusProvider;
}

- (void)setAppleMusicStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicStatusProvider, a3);
}

- (PXStoryTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (void)setTimelineProducer:(id)a3
{
  objc_storeStrong((id *)&self->_timelineProducer, a3);
}

- (PXStoryStyleProducer)styleProducer
{
  return self->_styleProducer;
}

- (void)setStyleProducer:(id)a3
{
  objc_storeStrong((id *)&self->_styleProducer, a3);
}

- (PXStoryRelatedProducer)relatedProducer
{
  return self->_relatedProducer;
}

- (void)setRelatedProducer:(id)a3
{
  objc_storeStrong((id *)&self->_relatedProducer, a3);
}

- (PXStoryAutoCurationProducer)autoCurationProducer
{
  return self->_autoCurationProducer;
}

- (void)setAutoCurationProducer:(id)a3
{
  objc_storeStrong((id *)&self->_autoCurationProducer, a3);
}

- (PXAnonymousViewController)presentingViewController
{
  return (PXAnonymousViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (PXAssetCollectionActionPerformerDelegate)assetCollectionActionPerformerDelegate
{
  return (PXAssetCollectionActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_assetCollectionActionPerformerDelegate);
}

- (void)setAssetCollectionActionPerformerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_assetCollectionActionPerformerDelegate, a3);
}

- (PXTapToRadarDiagnosticProvider)containerTapToRadarDiagnosticsProvider
{
  return (PXTapToRadarDiagnosticProvider *)objc_loadWeakRetained((id *)&self->_containerTapToRadarDiagnosticsProvider);
}

- (void)setContainerTapToRadarDiagnosticsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_containerTapToRadarDiagnosticsProvider, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int64_t)initialViewMode
{
  return self->_initialViewMode;
}

- (void)setInitialViewMode:(int64_t)a3
{
  self->_initialViewMode = a3;
}

- (BOOL)isAllowedToPlayAnyMusicOrSound
{
  return self->_isAllowedToPlayAnyMusicOrSound;
}

- (void)setIsAllowedToPlayAnyMusicOrSound:(BOOL)a3
{
  self->_isAllowedToPlayAnyMusicOrSound = a3;
}

- (BOOL)shouldForceUsingFlexMusic
{
  return self->_shouldForceUsingFlexMusic;
}

- (void)setShouldForceUsingFlexMusic:(BOOL)a3
{
  self->_shouldForceUsingFlexMusic = a3;
}

- (BOOL)isAllowedToPlayAppleMusic
{
  return self->_isAllowedToPlayAppleMusic;
}

- (void)setIsAllowedToPlayAppleMusic:(BOOL)a3
{
  self->_isAllowedToPlayAppleMusic = a3;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (void)setCurationKind:(int64_t)a3
{
  self->_curationKind = a3;
}

- (BOOL)nUpCompositionIgnoresOverallTargetDuration
{
  return self->_nUpCompositionIgnoresOverallTargetDuration;
}

- (void)setNUpCompositionIgnoresOverallTargetDuration:(BOOL)a3
{
  self->_nUpCompositionIgnoresOverallTargetDuration = a3;
}

- (BOOL)disableNUp
{
  return self->_disableNUp;
}

- (void)setDisableNUp:(BOOL)a3
{
  self->_disableNUp = a3;
}

- (unint64_t)disabledClipMotionStyles
{
  return self->_disabledClipMotionStyles;
}

- (void)setDisabledClipMotionStyles:(unint64_t)a3
{
  self->_disabledClipMotionStyles = a3;
}

- (BOOL)isLetterboxingAllowed
{
  return self->_isLetterboxingAllowed;
}

- (void)setIsLetterboxingAllowed:(BOOL)a3
{
  self->_isLetterboxingAllowed = a3;
}

- (unint64_t)allowedInlineTitles
{
  return self->_allowedInlineTitles;
}

- (void)setAllowedInlineTitles:(unint64_t)a3
{
  self->_allowedInlineTitles = a3;
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (void)setAllowedTransitionKinds:(id)a3
{
  objc_storeStrong((id *)&self->_allowedTransitionKinds, a3);
}

- (int64_t)keyAssetAspectRatioOverride
{
  return self->_keyAssetAspectRatioOverride;
}

- (void)setKeyAssetAspectRatioOverride:(int64_t)a3
{
  self->_keyAssetAspectRatioOverride = a3;
}

- (int64_t)otherAssetsAspectRatioOverride
{
  return self->_otherAssetsAspectRatioOverride;
}

- (void)setOtherAssetsAspectRatioOverride:(int64_t)a3
{
  self->_otherAssetsAspectRatioOverride = a3;
}

- (BOOL)preferAssetLocationAndCreationDateForClipTitleAndSubtitle
{
  return self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle;
}

- (void)setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:(BOOL)a3
{
  self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle = a3;
}

- (BOOL)forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset
{
  return self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset;
}

- (void)setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:(BOOL)a3
{
  self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset = a3;
}

- (BOOL)usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets
{
  return self->_usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets;
}

- (void)setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:(BOOL)a3
{
  self->_usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets = a3;
}

- (BOOL)preferFaceCrops
{
  return self->_preferFaceCrops;
}

- (void)setPreferFaceCrops:(BOOL)a3
{
  self->_preferFaceCrops = a3;
}

- (double)kenBurnsPanSpeed
{
  return self->_kenBurnsPanSpeed;
}

- (void)setKenBurnsPanSpeed:(double)a3
{
  self->_kenBurnsPanSpeed = a3;
}

- (double)kenBurnsScaleSpeed
{
  return self->_kenBurnsScaleSpeed;
}

- (void)setKenBurnsScaleSpeed:(double)a3
{
  self->_kenBurnsScaleSpeed = a3;
}

- (double)noncriticalBufferingTimeout
{
  return self->_noncriticalBufferingTimeout;
}

- (void)setNoncriticalBufferingTimeout:(double)a3
{
  self->_noncriticalBufferingTimeout = a3;
}

- (BOOL)disableVideoPlayback
{
  return self->_disableVideoPlayback;
}

- (void)setDisableVideoPlayback:(BOOL)a3
{
  self->_disableVideoPlayback = a3;
}

- (int64_t)movementAnimationCurve
{
  return self->_movementAnimationCurve;
}

- (void)setMovementAnimationCurve:(int64_t)a3
{
  self->_movementAnimationCurve = a3;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (PXDisplayAssetFetchResult)keyAsset
{
  return self->_keyAsset;
}

- (NSArray)referencePersons
{
  return self->_referencePersons;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (PXStoryErrorRepository)errorRepository
{
  return self->_errorRepository;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (PXStoryConfiguration)parentConfiguration
{
  return self->_parentConfiguration;
}

- (id)originalContainer
{
  return self->_originalContainer;
}

- (void)setOriginalContainer:(id)a3
{
  objc_storeStrong(&self->_originalContainer, a3);
}

- (id)originalCurationContext
{
  return self->_originalCurationContext;
}

- (void)setOriginalCurationContext:(id)a3
{
  objc_storeStrong(&self->_originalCurationContext, a3);
}

- (PXStorySongsConfiguration)songsConfiguration
{
  return self->_songsConfiguration;
}

- (void)setSongsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_songsConfiguration, a3);
}

- (int64_t)songsProducerKind
{
  return self->_songsProducerKind;
}

- (void)setSongsProducerKind:(int64_t)a3
{
  self->_songsProducerKind = a3;
}

- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer
{
  return self->_detailedSaliencyProducer;
}

- (void)setDetailedSaliencyProducer:(id)a3
{
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, a3);
}

- (BOOL)disableBufferingController
{
  return self->_disableBufferingController;
}

- (void)setDisableBufferingController:(BOOL)a3
{
  self->_disableBufferingController = a3;
}

- (NSString)launchType
{
  return self->_launchType;
}

- (void)setLaunchType:(id)a3
{
  objc_storeStrong((id *)&self->_launchType, a3);
}

- (PXVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (PXUserDefaultsDataSource)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 416);
  return self;
}

- (void)setFixedSegmentDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_fixedSegmentDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fixedSegmentDuration.value = v3;
}

- (int64_t)collectionPersistenceConfirmationStyle
{
  return self->_collectionPersistenceConfirmationStyle;
}

- (void)setCollectionPersistenceConfirmationStyle:(int64_t)a3
{
  self->_collectionPersistenceConfirmationStyle = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)wantsFeedbackAction
{
  return self->_wantsFeedbackAction;
}

- (void)setWantsFeedbackAction:(BOOL)a3
{
  self->_wantsFeedbackAction = a3;
}

- (BOOL)allowsVerticalGestures
{
  return self->_allowsVerticalGestures;
}

- (void)setAllowsVerticalGestures:(BOOL)a3
{
  self->_allowsVerticalGestures = a3;
}

- (BOOL)activeStateManagedExternally
{
  return self->_activeStateManagedExternally;
}

- (void)setActiveStateManagedExternally:(BOOL)a3
{
  self->_activeStateManagedExternally = a3;
}

- (unint64_t)forcedKenBurnsScaleDirection
{
  return self->_forcedKenBurnsScaleDirection;
}

- (void)setForcedKenBurnsScaleDirection:(unint64_t)a3
{
  self->_forcedKenBurnsScaleDirection = a3;
}

- (unint64_t)keyAssetKenBurnsScaleDirection
{
  return self->_keyAssetKenBurnsScaleDirection;
}

- (void)setKeyAssetKenBurnsScaleDirection:(unint64_t)a3
{
  self->_keyAssetKenBurnsScaleDirection = a3;
}

- (unint64_t)keyAssetKenBurnsPanDirection
{
  return self->_keyAssetKenBurnsPanDirection;
}

- (void)setKeyAssetKenBurnsPanDirection:(unint64_t)a3
{
  self->_keyAssetKenBurnsPanDirection = a3;
}

- (double)videoPlaybackRate
{
  return self->_videoPlaybackRate;
}

- (void)setVideoPlaybackRate:(double)a3
{
  self->_videoPlaybackRate = a3;
}

- (PXDisplayAsset)desiredStartAsset
{
  return self->_desiredStartAsset;
}

- (void)setDesiredStartAsset:(id)a3
{
  objc_storeStrong((id *)&self->_desiredStartAsset, a3);
}

- (BOOL)allowPlayingMultipleStoriesSimultaneously
{
  return self->_allowPlayingMultipleStoriesSimultaneously;
}

- (void)setAllowPlayingMultipleStoriesSimultaneously:(BOOL)a3
{
  self->_allowPlayingMultipleStoriesSimultaneously = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_desiredStartAsset, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_launchType, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, 0);
  objc_storeStrong((id *)&self->_songsConfiguration, 0);
  objc_storeStrong(&self->_originalCurationContext, 0);
  objc_storeStrong(&self->_originalContainer, 0);
  objc_storeStrong((id *)&self->_parentConfiguration, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_errorRepository, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_allowedTransitionKinds, 0);
  objc_destroyWeak((id *)&self->_containerTapToRadarDiagnosticsProvider);
  objc_destroyWeak((id *)&self->_assetCollectionActionPerformerDelegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_autoCurationProducer, 0);
  objc_storeStrong((id *)&self->_relatedProducer, 0);
  objc_storeStrong((id *)&self->_styleProducer, 0);
  objc_storeStrong((id *)&self->_timelineProducer, 0);
  objc_storeStrong((id *)&self->_appleMusicStatusProvider, 0);
  objc_storeStrong((id *)&self->_musicCurationProvider, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

uint64_t __163__PXStoryConfiguration_initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration___block_invoke()
{
  uint64_t result;

  result = arc4random_uniform(0xF4240u);
  atomic_store(result, (unsigned int *)&initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__contextId);
  return result;
}

- (id)copyForMusicPreviewWithCuratedSongs:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[PXStoryConfiguration copyWithAdditionalOptions:](self, "copyWithAdditionalOptions:", 16);
  objc_msgSend(v5, "setInitialViewMode:", 4);
  objc_msgSend(v4, "previewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSongsConfiguration:", v6);
  return v5;
}

- (PXStoryPhotoKitAssetContainer)photoKitAssetContainer
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  PXStoryPhotoKitAssetContainer *v21;

  -[PXStoryConfiguration assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_6:
    -[PXStoryConfiguration assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v6, 0);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());

      if (!v10)
      {
        v4 = 0;
        goto LABEL_17;
      }
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      if (objc_msgSend(v5, "count") >= 1)
      {
        v11 = 0;
        do
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (objc_msgSend(v5, "count") > v11);
      }
      objc_msgSend(v5, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc(MEMORY[0x1E0CD1620]);
      v17 = (void *)objc_msgSend(v6, "copy");
      v18 = (void *)objc_msgSend(v16, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v17, v15, 0, 0, 0, 0);

      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:subtype:", v18, 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:

  }
  -[PXStoryConfiguration originalContainer](self, "originalContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  if (v4)
    v21 = -[PXStoryPhotoKitAssetContainer initWithAssetCollection:originalContainer:]([PXStoryPhotoKitAssetContainer alloc], "initWithAssetCollection:originalContainer:", v4, v20);
  else
    v21 = 0;

  return v21;
}

@end
