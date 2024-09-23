@implementation PXStoryResourcesDataSource

- (PXStoryResourcesDataSource)initWithStoryConfiguration:(id)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v6[5];

  v3 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
  v6[3] = v3;
  v6[4] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 64);
  v4 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 16);
  v6[0] = *MEMORY[0x1E0D759B0];
  v6[1] = v4;
  return -[PXStoryResourcesDataSource initWithKeyAsset:displayAssets:availableDisplayAssets:movieHighlights:detailedSaliency:chapterCollection:audioAssets:assetCollection:overallDurationInfo:storyConfiguration:](self, "initWithKeyAsset:displayAssets:availableDisplayAssets:movieHighlights:detailedSaliency:chapterCollection:audioAssets:assetCollection:overallDurationInfo:storyConfiguration:", 0, 0, 0, 0, 0, 0, 0, 0, v6, a3);
}

- (PXStoryResourcesDataSource)initWithKeyAsset:(id)a3 displayAssets:(id)a4 availableDisplayAssets:(id)a5 movieHighlights:(id)a6 detailedSaliency:(id)a7 chapterCollection:(id)a8 audioAssets:(id)a9 assetCollection:(id)a10 overallDurationInfo:(id *)a11 storyConfiguration:(id)a12
{
  unint64_t v19;
  id v20;
  PXStoryResourcesDataSource *v21;
  PXStoryResourcesDataSource *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  PXStoryResourcesDataSource *v27;
  uint64_t (**v28)(_QWORD);
  PXStoryResourcesDataSource *v29;
  uint64_t (**v30)(void *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  void *v35;
  void *v36;
  void *v37;
  PXDisplayAssetCollection *v38;
  PXDisplayAssetCollection *v39;
  PXDisplayAssetCollection *v40;
  char v41;
  PXStoryDisplayAssetCroppingContext *v42;
  PXStoryBaseDisplayAssetCroppingContext *v43;
  id v44;
  id v45;
  void *v46;
  PXStoryDefaultDisplayAssetCroppingContext *v47;
  PXStoryCachingDisplayAssetCroppingContext *v48;
  PXStoryDisplayAssetCroppingContext *croppingContext;
  uint64_t v50;
  char v52;
  uint64_t v53;
  PXDisplayAsset **p_keyAsset;
  id obj;
  id *obja;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  unint64_t v64;
  _QWORD v65[4];
  PXStoryResourcesDataSource *v66;
  _QWORD aBlock[4];
  PXStoryResourcesDataSource *v68;
  objc_super v69;

  v63 = a3;
  v62 = a4;
  v61 = a5;
  v60 = a6;
  v64 = (unint64_t)a7;
  obj = a8;
  v59 = a8;
  v58 = a9;
  v19 = (unint64_t)a10;
  v20 = a12;
  v69.receiver = self;
  v69.super_class = (Class)PXStoryResourcesDataSource;
  v21 = -[PXStoryResourcesDataSource init](&v69, sel_init);
  v22 = v21;
  if (!v21)
    goto LABEL_21;
  v57 = v20;
  p_keyAsset = &v21->_keyAsset;
  objc_storeStrong((id *)&v21->_keyAsset, a3);
  objc_storeStrong((id *)&v22->_displayAssets, a4);
  objc_storeStrong((id *)&v22->_availableDisplayAssets, a5);
  objc_storeStrong((id *)&v22->_audioAssets, a9);
  objc_storeStrong((id *)&v22->_assetCollection, a10);
  objc_storeStrong((id *)&v22->_movieHighlights, a6);
  objc_storeStrong((id *)&v22->_detailedSaliency, a7);
  objc_storeStrong((id *)&v22->_chapterCollection, obj);
  *(_OWORD *)&v22->_overallDurationInfo.kind = *(_OWORD *)&a11->var0;
  v23 = *(_OWORD *)&a11->var1.var0.var1;
  v24 = *(_OWORD *)&a11->var1.var1.var0;
  v25 = *(_OWORD *)&a11->var1.var1.var3;
  *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = *(_OWORD *)&a11->var1.var2.var1;
  *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v25;
  *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v24;
  *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v23;
  v22->_lock._os_unfair_lock_opaque = 0;
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke;
  aBlock[3] = &unk_1E51413D0;
  v27 = v22;
  v68 = v27;
  v28 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  v65[0] = v26;
  v65[1] = 3221225472;
  v65[2] = __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke_2;
  v65[3] = &unk_1E51413F8;
  v29 = v27;
  v66 = v29;
  v30 = (uint64_t (**)(void *, uint64_t))_Block_copy(v65);
  if (v19)
  {
    v29->_initialTitleTextResourceIndex = v28[2](v28);
    v31 = v28[2](v28);
  }
  else
  {
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    v29->_initialTitleTextResourceIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v29->_initialSubtitleTextResourceIndex = v31;
  v32 = -[PXStoryChapterCollection numberOfChapters](v22->_chapterCollection, "numberOfChapters");
  v29->_chapterTitleTextResourceIndexes.location = v30[2](v30, v32);
  v29->_chapterTitleTextResourceIndexes.length = v33;
  v29->_chapterSubtitleTextResourceIndexes.location = v30[2](v30, v32);
  v29->_chapterSubtitleTextResourceIndexes.length = v34;
  v29->_numberOfColorResources = 2;
  objc_msgSend(v57, "userInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v64 | v19 && v35)
  {
    obja = (id *)&v22->_detailedSaliency;
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("defaultCroppingContext"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("cachingCroppingContext"));
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "assetCollection");
    v38 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
    v39 = v22->_assetCollection;
    if (v38 == v39)
    {

    }
    else
    {
      v40 = v39;
      v41 = -[PXDisplayAssetCollection isEqual:](v38, "isEqual:", v39);

      if ((v41 & 1) == 0)
      {

        v42 = (PXStoryDisplayAssetCroppingContext *)v53;
        goto LABEL_14;
      }
    }
    objc_msgSend(v37, "detailedSaliency");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = *obja;
    if (v44 == v45)
    {

      v42 = (PXStoryDisplayAssetCroppingContext *)v53;
      goto LABEL_16;
    }
    v46 = v45;
    v52 = objc_msgSend(v44, "isEqual:", v45);

    v42 = (PXStoryDisplayAssetCroppingContext *)v53;
    if ((v52 & 1) != 0)
    {
LABEL_16:
      croppingContext = v29->_croppingContext;
      v29->_croppingContext = v42;

      goto LABEL_17;
    }
LABEL_14:
    v47 = -[PXStoryDefaultDisplayAssetCroppingContext initWithAssetCollection:detailedSaliency:]([PXStoryDefaultDisplayAssetCroppingContext alloc], "initWithAssetCollection:detailedSaliency:", v22->_assetCollection, *obja);

    v48 = -[PXStoryCachingDisplayAssetCroppingContext initWithCroppingContext:]([PXStoryCachingDisplayAssetCroppingContext alloc], "initWithCroppingContext:", v47);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v48, CFSTR("cachingCroppingContext"));
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v47, CFSTR("defaultCroppingContext"));
    v37 = v47;
    v42 = (PXStoryDisplayAssetCroppingContext *)v48;
    goto LABEL_16;
  }
  v43 = objc_alloc_init(PXStoryBaseDisplayAssetCroppingContext);
  v37 = v29->_croppingContext;
  v29->_croppingContext = (PXStoryDisplayAssetCroppingContext *)v43;
LABEL_17:

  v29->_identifier = sub_1A7ADF414();
  if (*p_keyAsset)
    v50 = -1;
  else
    v50 = 0;
  v29->_initialDisplayAssetIndex = v50;

  v20 = v57;
LABEL_21:

  return v22;
}

- (id)textResourceAtIndex:(int64_t)a3
{
  PXStoryResourcesDataSource *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *cachedTextResources;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v13;

  if (-[PXStoryResourcesDataSource numberOfTextResources](self, "numberOfTextResources") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSource.m"), 127, CFSTR("index %li out of bounds 0 ..< %li"), a3, -[PXStoryResourcesDataSource numberOfTextResources](self, "numberOfTextResources"));

  }
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v6->_cachedTextResources, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[PXStoryResourcesDataSource _createTextResourceAtIndex:](v6, "_createTextResourceAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    cachedTextResources = v6->_cachedTextResources;
    if (!cachedTextResources)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = v6->_cachedTextResources;
      v6->_cachedTextResources = v10;

      cachedTextResources = v6->_cachedTextResources;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](cachedTextResources, "setObject:forKeyedSubscript:", v8, v7);
  }

  objc_sync_exit(v6);
  return v8;
}

- (id)_createTextResourceAtIndex:(int64_t)a3
{
  PXStoryConcreteTextResource *v6;
  void *v7;
  PXStoryConcreteTextResource *v8;
  void *v9;
  uint64_t v10;
  PXStoryConcreteTextResource *v11;
  uint64_t v12;
  NSUInteger location;
  NSUInteger v14;
  BOOL v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  PXStoryConcreteTextResource *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;

  if (-[PXStoryResourcesDataSource initialTitleTextResourceIndex](self, "initialTitleTextResourceIndex") == a3)
  {
    v6 = [PXStoryConcreteTextResource alloc];
    -[PXStoryResourcesDataSource assetCollection](self, "assetCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = 0;
LABEL_5:
    v12 = -[PXStoryConcreteTextResource initWithAssetCollection:type:](v8, "initWithAssetCollection:type:", v9, v10);
    goto LABEL_16;
  }
  if (-[PXStoryResourcesDataSource initialSubtitleTextResourceIndex](self, "initialSubtitleTextResourceIndex") == a3)
  {
    v11 = [PXStoryConcreteTextResource alloc];
    -[PXStoryResourcesDataSource assetCollection](self, "assetCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = v7;
    v10 = 1;
    goto LABEL_5;
  }
  location = self->_chapterTitleTextResourceIndexes.location;
  v15 = a3 >= location;
  v14 = a3 - location;
  v15 = !v15 || v14 >= self->_chapterTitleTextResourceIndexes.length;
  if (v15)
  {
    v16 = self->_chapterSubtitleTextResourceIndexes.location;
    v15 = a3 >= v16;
    v17 = a3 - v16;
    if (!v15 || v17 >= self->_chapterSubtitleTextResourceIndexes.length)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSource.m"), 156, CFSTR("invalid text resource index %li"), a3);

      abort();
    }
    -[PXStoryResourcesDataSource chapterCollection](self, "chapterCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chapterAtIndex:", a3 - self->_chapterSubtitleTextResourceIndexes.location);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [PXStoryConcreteTextResource alloc];
    v21 = v7;
    v22 = 1;
  }
  else
  {
    -[PXStoryResourcesDataSource chapterCollection](self, "chapterCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chapterAtIndex:", a3 - self->_chapterTitleTextResourceIndexes.location);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [PXStoryConcreteTextResource alloc];
    v21 = v7;
    v22 = 0;
  }
  v12 = -[PXStoryConcreteTextResource initWithChapter:type:](v20, "initWithChapter:type:", v21, v22);
LABEL_16:
  v23 = (void *)v12;

  return v23;
}

- (void)enumerateTextResourcesForTitles:(unint64_t)a3 displayAssetResourceAtIndex:(int64_t)a4 usingBlock:(id)a5
{
  char v6;
  id v8;
  id v9;
  void (**v10)(void *, int64_t, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD aBlock[4];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  char v27;

  v6 = a3;
  v8 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PXStoryResourcesDataSource_enumerateTextResourcesForTitles_displayAssetResourceAtIndex_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5141420;
  v20 = v26;
  v9 = v8;
  v19 = v9;
  v21 = &v22;
  v10 = (void (**)(void *, int64_t, _QWORD))_Block_copy(aBlock);
  if ((v6 & 1) != 0 && self->_initialDisplayAssetIndex == a4)
  {
    v10[2](v10, -[PXStoryResourcesDataSource initialTitleTextResourceIndex](self, "initialTitleTextResourceIndex"), 0);
    v10[2](v10, -[PXStoryResourcesDataSource initialSubtitleTextResourceIndex](self, "initialSubtitleTextResourceIndex"), 1);
  }
  if (!*((_BYTE *)v23 + 24))
  {
    -[PXStoryResourcesDataSource chapterCollection](self, "chapterCollection");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if ((v6 & 2) != 0 && v11)
    {
      -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self, "displayAssetResourceAtIndex:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_storyResourceDisplayAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "containsChapterBeginningWithAsset:", v14))
      {
        objc_msgSend(v12, "chapterContainingAsset:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v12, "indexOfChapterWithIdentifier:", v16);
        v10[2](v10, self->_chapterTitleTextResourceIndexes.location + v17, 0);
        v10[2](v10, self->_chapterSubtitleTextResourceIndexes.location + v17, 1);

      }
    }

  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (int64_t)numberOfDisplayAssetResources
{
  void *v2;
  int64_t v3;

  -[PXStoryResourcesDataSource displayAssets](self, "displayAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)displayAssetResourceAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (a3 == -1)
  {
    -[PXStoryResourcesDataSource keyAssetResource](self, "keyAssetResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      return v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSource.m"), 198, CFSTR("key asset resource doesn't exist"));
  }
  else
  {
    -[PXStoryResourcesDataSource displayAssets](self, "displayAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int64_t)indexForDisplayAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t ResultIndexOfObject;
  void *v8;
  __int128 v10;
  NSRange v11;
  NSRange v12;

  v4 = a3;
  -[PXStoryResourcesDataSource displayAssets](self, "displayAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  if (v4)
    objc_msgSend(v4, "indexPath", (unsigned __int128)0);
  v12.length = objc_msgSend(v5, "count", v10);
  v11.location = 0;
  v11.length = 11;
  v12.location = 0;
  if (!NSIntersectionRange(v11, v12).length
    || (objc_msgSend(v4, "asset"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        ResultIndexOfObject = PXSectionedFetchResultIndexOfObjectInRange(),
        v6,
        ResultIndexOfObject == 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ResultIndexOfObject = PXSectionedFetchResultIndexOfObject();

  }
  return ResultIndexOfObject;
}

- (id)movieHighlightsForDisplayAssetAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == -1)
  {
    -[PXStoryResourcesDataSource keyAsset](self, "keyAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  -[PXStoryResourcesDataSource displayAssets](self, "displayAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
LABEL_3:
  -[PXStoryResourcesDataSource movieHighlights](self, "movieHighlights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "movieHighlightsForDisplayAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (int64_t)numberOfSongResources
{
  void *v2;
  int64_t v3;

  -[PXStoryResourcesDataSource audioAssets](self, "audioAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)songResourceAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXStoryResourcesDataSource audioAssets](self, "audioAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)colorResourceAtIndex:(int64_t)a3
{
  void *v7;
  void *v8;

  if (-[PXStoryResourcesDataSource numberOfColorResources](self, "numberOfColorResources") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSource.m"), 247, CFSTR("index %li out of bounds 0 ..< %li"), a3, -[PXStoryResourcesDataSource numberOfColorResources](self, "numberOfColorResources"));

  }
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSource.m"), 251, CFSTR("invalid color resource index %li"), a3);

    abort();
  }
  return -[PXStoryResourcesDataSource backgroundColorResource](self, "backgroundColorResource");
}

- (PXStoryColorResource)backgroundColorResource
{
  os_unfair_lock_s *p_lock;
  PXStoryColorResource *lock_backgroundColorResource;
  void *v5;
  void *v6;
  PXStoryConcreteColorResource *v7;
  PXStoryColorResource *v8;
  PXStoryColorResource *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backgroundColorResource = self->_lock_backgroundColorResource;
  if (!lock_backgroundColorResource)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "wantsHighContrastColors") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PXStoryConcreteColorResource initWithColor:type:]([PXStoryConcreteColorResource alloc], "initWithColor:type:", v6, 1);
    v8 = self->_lock_backgroundColorResource;
    self->_lock_backgroundColorResource = (PXStoryColorResource *)v7;

    lock_backgroundColorResource = self->_lock_backgroundColorResource;
  }
  v9 = lock_backgroundColorResource;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)frameFillingEffectResourceAtIndex:(int64_t)a3
{
  void *v3;
  PXStoryConcreteFrameFillingEffectResource *v4;
  void *v5;
  void *v6;
  PXStoryConcreteFrameFillingEffectResource *v7;

  -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self, "displayAssetResourceAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXStoryConcreteFrameFillingEffectResource alloc];
  objc_msgSend(v3, "px_storyResourceDisplayAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryConcreteFrameFillingEffectResource initWithDisplayAsset:useSmartColor:](v4, "initWithDisplayAsset:useSmartColor:", v5, objc_msgSend(v6, "smartGradientUseSmartColor"));

  return v7;
}

- (int64_t)numberOfResourcesWithKind:(int64_t)a3
{
  void *v6;
  void *v7;
  SEL v8;
  PXStoryResourcesDataSource *v9;
  uint64_t v10;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = a2;
      v9 = self;
      v10 = 280;
      goto LABEL_9;
    case 1:
      return -[PXStoryResourcesDataSource numberOfDisplayAssetResources](self, "numberOfDisplayAssetResources");
    case 2:
      return -[PXStoryResourcesDataSource numberOfSongResources](self, "numberOfSongResources");
    case 3:
      return -[PXStoryResourcesDataSource numberOfTextResources](self, "numberOfTextResources");
    case 4:
      return -[PXStoryResourcesDataSource numberOfColorResources](self, "numberOfColorResources");
    case 5:
      return -[PXStoryResourcesDataSource numberOfFrameFillingEffectResources](self, "numberOfFrameFillingEffectResources");
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = a2;
      v9 = self;
      v10 = 292;
LABEL_9:
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PXStoryResourcesDataSource.m"), v10, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

- (id)resourceWithKind:(int64_t)a3 atIndex:(int64_t)a4
{
  void *v4;
  void *v8;
  void *v9;
  SEL v10;
  PXStoryResourcesDataSource *v11;
  uint64_t v12;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = a2;
      v11 = self;
      v12 = 298;
      goto LABEL_10;
    case 1:
      -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self, "displayAssetResourceAtIndex:", a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 2:
      -[PXStoryResourcesDataSource songResourceAtIndex:](self, "songResourceAtIndex:", a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 3:
      -[PXStoryResourcesDataSource textResourceAtIndex:](self, "textResourceAtIndex:", a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 4:
      -[PXStoryResourcesDataSource colorResourceAtIndex:](self, "colorResourceAtIndex:", a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 5:
      -[PXStoryResourcesDataSource frameFillingEffectResourceAtIndex:](self, "frameFillingEffectResourceAtIndex:", a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = a2;
      v11 = self;
      v12 = 310;
LABEL_10:
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXStoryResourcesDataSource.m"), v12, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

- (BOOL)hasSameResourcesOfKind:(int64_t)a3 as:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v7 = a4;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSource.m"), 317, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      -[PXStoryResourcesDataSource keyAsset](self, "keyAsset");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyAsset");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {

      }
      else
      {
        v13 = objc_msgSend(v15, "isEqual:", v16);

        if (!v13)
          goto LABEL_24;
      }
      -[PXStoryResourcesDataSource displayAssets](self, "displayAssets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayAssets");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 == v20)
        LOBYTE(v13) = 1;
      else
        LOBYTE(v13) = objc_msgSend(v19, "isEqual:", v20);

LABEL_24:
LABEL_25:

      return v13;
    case 2:
      -[PXStoryResourcesDataSource audioAssets](self, "audioAssets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "audioAssets");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v18)
        LOBYTE(v13) = 1;
      else
        LOBYTE(v13) = objc_msgSend(v17, "isEqual:", v18);

      goto LABEL_25;
    case 3:
    case 4:
      v8 = -[PXStoryResourcesDataSource numberOfResourcesWithKind:](self, "numberOfResourcesWithKind:", a3);
      if (objc_msgSend(v7, "numberOfResourcesWithKind:", a3) != v8)
        goto LABEL_9;
      v9 = v8 - 1;
      if (v8 < 1)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        v10 = 0;
        do
        {
          -[PXStoryResourcesDataSource resourceWithKind:atIndex:](self, "resourceWithKind:atIndex:", a3, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "resourceWithKind:atIndex:", a3, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (!v13)
            break;
        }
        while (v9 != v10++);
      }
      goto LABEL_25;
    case 5:
      LOBYTE(v13) = -[PXStoryResourcesDataSource hasSameResourcesOfKind:as:](self, "hasSameResourcesOfKind:as:", 1, v7);
      goto LABEL_25;
    default:
LABEL_9:
      LOBYTE(v13) = 0;
      goto LABEL_25;
  }
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (int64_t)numberOfTextResources
{
  return self->_numberOfTextResources;
}

- (int64_t)numberOfColorResources
{
  return self->_numberOfColorResources;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)overallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].var1.var1.var1;
  v4 = *(_OWORD *)&self[2].var1.var2.var3;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[2].var1.var2.var0;
  *(_OWORD *)&retstr->var1.var1.var3 = v4;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[3].var1.var0.var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1.var0.var3;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  return self;
}

- (PXStoryDisplayAssetCroppingContext)croppingContext
{
  return self->_croppingContext;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (PXDisplayAssetFetchResult)availableDisplayAssets
{
  return self->_availableDisplayAssets;
}

- (PXStoryMovieHighlightsCollection)movieHighlights
{
  return self->_movieHighlights;
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXAudioAssetFetchResult)audioAssets
{
  return self->_audioAssets;
}

- (int64_t)initialTitleTextResourceIndex
{
  return self->_initialTitleTextResourceIndex;
}

- (int64_t)initialSubtitleTextResourceIndex
{
  return self->_initialSubtitleTextResourceIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAssets, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
  objc_storeStrong((id *)&self->_movieHighlights, 0);
  objc_storeStrong((id *)&self->_availableDisplayAssets, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_lock_backgroundColorResource, 0);
  objc_storeStrong((id *)&self->_cachedTextResources, 0);
}

uint64_t __101__PXStoryResourcesDataSource_enumerateTextResourcesForTitles_displayAssetResourceAtIndex_usingBlock___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == 0)
  {
    v3 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v1 + 80);
  *(_QWORD *)(v1 + 80) = result + 1;
  return result;
}

uint64_t __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v2 + 80);
  *(_QWORD *)(v2 + 80) = result + a2;
  return result;
}

@end
