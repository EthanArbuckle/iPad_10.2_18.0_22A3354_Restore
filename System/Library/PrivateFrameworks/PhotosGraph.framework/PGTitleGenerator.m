@implementation PGTitleGenerator

- (PGTitleGenerator)initWithMomentNode:(id)a3 referenceDateInterval:(id)a4 keyAsset:(id)a5 curatedAssetCollection:(id)a6 assetCollection:(id)a7 type:(int64_t)a8 titleGenerationContext:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  PGTitleGenerator *v23;

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  if (a3)
    objc_msgSend(v16, "setWithObject:", a3);
  else
    objc_msgSend(v16, "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](self, "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v22, v21, v20, v19, v18, a8, v17);

  return v23;
}

- (PGTitleGenerator)initWithMomentNodes:(id)a3 referenceDateInterval:(id)a4 keyAsset:(id)a5 curatedAssetCollection:(id)a6 assetCollection:(id)a7 type:(int64_t)a8 titleGenerationContext:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  PGTitleGenerator *v19;
  PGTitleGenerator *v20;
  PGTitleGeneratorDateMatching *v21;
  PGTitleGeneratorDateMatching *dateMatching;
  id v25;
  id v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v26 = a5;
  v25 = a6;
  v17 = a7;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PGTitleGenerator;
  v19 = -[PGTitleGenerator init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_lineBreakBehavior = 1;
    objc_storeStrong((id *)&v19->_momentNodes, a3);
    objc_storeStrong((id *)&v20->_assetCollection, a7);
    objc_storeStrong((id *)&v20->_keyAsset, a5);
    objc_storeStrong((id *)&v20->_curatedAssetCollection, a6);
    v21 = -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:momentNodes:titleGenerationContext:]([PGTitleGeneratorDateMatching alloc], "initWithType:referenceDateInterval:momentNodes:titleGenerationContext:", a8, v16, v15, v18);
    dateMatching = v20->_dateMatching;
    v20->_dateMatching = v21;

    v20->_preferredTitleType = 0;
    objc_storeStrong((id *)&v20->_titleGenerationContext, a9);
  }

  return v20;
}

- (PGTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  return -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](self, "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", a3, 0, 0, 0, 0, a4, a5);
}

- (PGTitleGenerator)initWithMomentNode:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  return -[PGTitleGenerator initWithMomentNode:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](self, "initWithMomentNode:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", a3, 0, 0, 0, 0, a4, a5);
}

- (PGTitle)title
{
  PGTitle *title;

  title = self->_title;
  if (!title)
  {
    -[PGTitleGenerator _generateTitleAndSubtitle](self, "_generateTitleAndSubtitle");
    title = self->_title;
  }
  return title;
}

- (PGTitle)subtitle
{
  if (!self->_title)
    -[PGTitleGenerator _generateTitleAndSubtitle](self, "_generateTitleAndSubtitle");
  return self->_subtitle;
}

- (void)_generateTitleAndSubtitle
{
  void *v3;
  void *v4;
  PGTitle **p_subtitle;
  uint64_t *v6;
  PGTitle *v7;
  void *title;
  PGTitle *v9;
  PGTitle *v10;
  uint64_t v11;
  void *v12;
  PGTitle *v13;
  PGTitle *v14;
  void *v15;
  PGTitle *v16;
  PGTitle *subtitle;
  void *v18;
  NSObject *v19;
  PGTitle *v20;
  PGTitle *v21;
  PGTitle *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__39772;
  v36 = __Block_byref_object_dispose__39773;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__39772;
  v30 = __Block_byref_object_dispose__39773;
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__PGTitleGenerator__generateTitleAndSubtitle__block_invoke;
  v25[3] = &unk_1E842E4B0;
  v25[4] = &v32;
  v25[5] = &v26;
  -[PGTitleGenerator _generateTitleAndSubtitleWithResult:](self, "_generateTitleAndSubtitleWithResult:", v25);
  objc_msgSend((id)v33[5], "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v27[5], "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v3, "length")
    || -[PGTitleGenerator _triggerDefaultTitleGenerationIfNil](self, "_triggerDefaultTitleGenerationIfNil"))
  {
    p_subtitle = &self->_subtitle;
    objc_storeStrong((id *)&self->_subtitle, (id)v27[5]);
    if (v3 && objc_msgSend(v3, "length"))
    {
      v6 = v33;
LABEL_7:
      v7 = (PGTitle *)(id)v6[5];
      title = self->_title;
      self->_title = v7;
LABEL_8:

      goto LABEL_19;
    }
    if (-[PGTitleGenerator _triggerDefaultTitleGenerationIfNil](self, "_triggerDefaultTitleGenerationIfNil"))
    {
      -[PGTitleGenerator _defaultTitle](self, "_defaultTitle");
      v9 = (PGTitle *)objc_claimAutoreleasedReturnValue();
      v10 = self->_title;
      self->_title = v9;

      if (!objc_msgSend(v4, "length"))
      {
        -[PGTitleGenerator _defaultTimeTitle](self, "_defaultTimeTitle");
        v11 = objc_claimAutoreleasedReturnValue();
        title = *p_subtitle;
        *p_subtitle = (PGTitle *)v11;
        goto LABEL_8;
      }
    }
  }
  else
  {
    if (-[PGTitleGenerator _useSplitTimeTitlesIfNeeded](self, "_useSplitTimeTitlesIfNeeded"))
    {
      -[PGTitleGenerator _splitTimeTitles](self, "_splitTimeTitles");
      title = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(title, "count"))
      {
        objc_msgSend(title, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v12, 5);
        v13 = (PGTitle *)objc_claimAutoreleasedReturnValue();
        v14 = self->_title;
        self->_title = v13;

        if ((unint64_t)objc_msgSend(title, "count") >= 2)
        {
          objc_msgSend(title, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v15, 5);
          v16 = (PGTitle *)objc_claimAutoreleasedReturnValue();
          subtitle = self->_subtitle;
          self->_subtitle = v16;

        }
      }
      goto LABEL_8;
    }
    if (v4 && objc_msgSend(v4, "length"))
    {
      v6 = v27;
      goto LABEL_7;
    }
  }
LABEL_19:
  if (!self->_title && (self->_preferredTitleType & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = v33[5];
      v24 = v27[5];
      *(_DWORD *)buf = 138412546;
      v39 = v23;
      v40 = 2112;
      v41 = v24;
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "Title and subtitle are nil, which should never happen. \"%@\" \"%@\". Will use empty string for title", buf, 0x16u);
    }

    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", &stru_1E8436F28, 0);
    v20 = (PGTitle *)objc_claimAutoreleasedReturnValue();
    v21 = self->_title;
    self->_title = v20;

    v22 = self->_subtitle;
    self->_subtitle = 0;

  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, void *);

  v6 = (void (**)(id, void *, void *))a3;
  -[PGTitleGenerator _defaultTitle](self, "_defaultTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator _defaultTimeTitle](self, "_defaultTimeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v4, v5);

}

- (id)_defaultTitle
{
  NSSet *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  PGTitleGeneratorDateMatching *v8;
  uint64_t v9;
  void *v10;
  PGTitleGeneratorDateMatching *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v17[16];

  v3 = self->_momentNodes;
  if (-[NSSet count](v3, "count"))
  {
    if (self->_preferredTitleType == 3)
    {
      -[PGTitleGenerator _defaultLocationTitle](self, "_defaultLocationTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PGTitleGenerator dateMatching](self, "dateMatching");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [PGTitleGeneratorDateMatching alloc];
      v9 = objc_msgSend(v7, "type");
      objc_msgSend(v7, "referenceDateInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:momentNodes:lineBreakBehavior:isForHighlight:titleGenerationContext:](v8, "initWithType:referenceDateInterval:momentNodes:lineBreakBehavior:isForHighlight:titleGenerationContext:", v9, v10, self->_momentNodes, -[PGTitleGenerator lineBreakBehavior](self, "lineBreakBehavior"), self->_isForHighlight, self->_titleGenerationContext);

      -[PGTitleGeneratorDateMatching title](v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v12;
      if (!v12
        || (objc_msgSend(v12, "stringValue"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "length"),
            v13,
            !v14))
      {
        -[PGTitleGenerator _defaultLocationTitle](self, "_defaultLocationTitle");
        v15 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v15;
      }

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Cannot generate title with no Moment Nodes", v17, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (id)_defaultLocationTitle
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  PGLocationTitleOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (self->_preferredTitleType == 1)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__39772;
  v18 = __Block_byref_object_dispose__39773;
  v19 = 0;
  -[PGTitleGenerator _addressNodeFromKeyAsset](self, "_addressNodeFromKeyAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator _addressNodesFromCuratedAssetCollection](self, "_addressNodesFromCuratedAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_curatedAssetCollection && !objc_msgSend(v5, "count")
    || (-[PGTitleGenerator _ratioOfAssetsWithoutLocation](self, "_ratioOfAssetsWithoutLocation"), v7 >= 0.9))
  {
    v12 = 0;
  }
  else
  {
    v8 = objc_alloc_init(PGLocationTitleOptions);
    -[PGLocationTitleOptions setMomentNodes:](v8, "setMomentNodes:", self->_momentNodes);
    -[PGLocationTitleOptions setKeyAssetAddressNode:](v8, "setKeyAssetAddressNode:", v4);
    -[PGLocationTitleOptions setCurationAddressNodes:](v8, "setCurationAddressNodes:", v6);
    -[PGLocationTitleOptions setLineBreakBehavior:](v8, "setLineBreakBehavior:", self->_lineBreakBehavior);
    if (self->_isForHighlight)
    {
      -[PGLocationTitleOptions setUseBusinessItems:](v8, "setUseBusinessItems:", 1);
      -[PGLocationTitleOptions setUseDistrict:](v8, "setUseDistrict:", 1);
      -[PGLocationTitleOptions setAllowFamilyHome:](v8, "setAllowFamilyHome:", 0);
      -[PGLocationTitleOptions setAoiDisplayType:](v8, "setAoiDisplayType:", 2);
    }
    if (self->_preferredTitleType == 3)
      -[PGLocationTitleOptions setShowAllCities:](v8, "setShowAllCities:", 1);
    -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerationContext serviceManager](self->_titleGenerationContext, "serviceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__PGTitleGenerator__defaultLocationTitle__block_invoke;
    v13[3] = &unk_1E84330E0;
    v13[4] = self;
    v13[5] = &v14;
    +[PGLocationTitleUtility generateLocationTitleWithOptions:locationHelper:serviceManager:result:](PGLocationTitleUtility, "generateLocationTitleWithOptions:locationHelper:serviceManager:result:", v8, v9, v10, v13);

    v11 = (void *)v15[5];
    if (v11 && objc_msgSend(v11, "length"))
    {
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v15[5], 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  _Block_object_dispose(&v14, 8);

  return v12;
}

- (id)_defaultTimeTitle
{
  void *v2;
  PGTimeTitleOptions *v4;
  void *v5;

  if ((self->_preferredTitleType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v2 = 0;
  }
  else
  {
    v4 = objc_alloc_init(PGTimeTitleOptions);
    -[PGTimeTitleOptions setMomentNodes:](v4, "setMomentNodes:", self->_momentNodes);
    -[PGTimeTitleOptions setAllowedFormats:](v4, "setAllowedFormats:", -[PGTitleGenerator _allowedTimeTitleFormats](self, "_allowedTimeTitleFormats"));
    -[PGTimeTitleOptions setLocale:](v4, "setLocale:", self->_locale);
    -[PGTimeTitleOptions setFilterDates:](v4, "setFilterDates:", self->_preferredTitleType != 1);
    -[PGTimeTitleOptions setFeaturedYearNodes:](v4, "setFeaturedYearNodes:", self->_featuredYearNodes);
    if (!-[PGTitleGeneratorDateMatching type](self->_dateMatching, "type"))
      -[PGTimeTitleOptions setLocationNodes:](v4, "setLocationNodes:", self->_usedLocationNodes);
    +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v5, 5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_splitTimeTitles
{
  void *v2;
  PGTimeTitleOptions *v4;

  if ((self->_preferredTitleType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v2 = 0;
  }
  else
  {
    v4 = objc_alloc_init(PGTimeTitleOptions);
    -[PGTimeTitleOptions setMomentNodes:](v4, "setMomentNodes:", self->_momentNodes);
    -[PGTimeTitleOptions setAllowedFormats:](v4, "setAllowedFormats:", -[PGTitleGenerator _allowedTimeTitleFormats](self, "_allowedTimeTitleFormats"));
    -[PGTimeTitleOptions setLocale:](v4, "setLocale:", self->_locale);
    -[PGTimeTitleOptions setFilterDates:](v4, "setFilterDates:", self->_preferredTitleType != 1);
    -[PGTimeTitleOptions setFeaturedYearNodes:](v4, "setFeaturedYearNodes:", self->_featuredYearNodes);
    +[PGTimeTitleUtility splitTimeTitleWithOptions:](PGTimeTitleUtility, "splitTimeTitleWithOptions:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (unint64_t)_allowedTimeTitleFormats
{
  if (self->_preferredTitleType == 1)
    return 1;
  else
    return -[PGTitleGeneratorDateMatching allowedTimeTitleFormats](self->_dateMatching, "allowedTimeTitleFormats");
}

- (BOOL)_triggerDefaultTitleGenerationIfNil
{
  return 0;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 1;
}

- (id)_addressNodeFromKeyAsset
{
  PHAsset *keyAsset;
  void *v4;
  NSSet *momentNodes;
  void *v7;
  void *v8;
  NSObject *v9;
  NSSet *v10;
  int v11;
  NSSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  keyAsset = self->_keyAsset;
  if (!keyAsset)
    return 0;
  -[PHAsset setCanUseLocationCoordinateForLocation:](keyAsset, "setCanUseLocationCoordinateForLocation:", 1);
  +[PGAssetLocationResolver closestAssetLocationForAsset:inAssetCollection:](PGAssetLocationResolver, "closestAssetLocationForAsset:inAssetCollection:", self->_keyAsset, self->_assetCollection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  momentNodes = self->_momentNodes;
  if (v4)
    +[PGAssetLocationResolver closestAddressNodeFromMomentNodes:toLocation:withMaximumDistance:allowRemoteLocations:](PGAssetLocationResolver, "closestAddressNodeFromMomentNodes:toLocation:withMaximumDistance:allowRemoteLocations:", momentNodes, v4, 0, 1.79769313e308);
  else
    +[PGCommonTitleUtility bestAddressNodeForMomentNodes:](PGCommonTitleUtility, "bestAddressNodeForMomentNodes:", momentNodes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_momentNodes;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cannot find address node in moment node %@.", (uint8_t *)&v11, 0xCu);
    }

  }
  return v7;
}

- (id)_fetchAssetsFromCuratedAssetCollection
{
  PHAssetCollection *curatedAssetCollection;
  PHFetchResult *curatedAssets;
  void *v5;
  void *v6;
  PHFetchResult *v7;
  PHFetchResult *v8;

  curatedAssetCollection = self->_curatedAssetCollection;
  if (curatedAssetCollection)
  {
    curatedAssets = self->_curatedAssets;
    if (!curatedAssets)
    {
      -[PHAssetCollection photoLibrary](curatedAssetCollection, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "librarySpecificFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setIncludeGuestAssets:", 1);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", self->_curatedAssetCollection, v6);
      v7 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
      v8 = self->_curatedAssets;
      self->_curatedAssets = v7;

      curatedAssets = self->_curatedAssets;
    }
    curatedAssetCollection = curatedAssets;
  }
  return curatedAssetCollection;
}

- (double)_ratioOfAssetsWithoutLocation
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PGTitleGenerator _fetchAssetsFromCuratedAssetCollection](self, "_fetchAssetsFromCuratedAssetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = v3;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = (void *)MEMORY[0x1E0D71860];
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "locationCoordinate", (_QWORD)v15);
          v8 += objc_msgSend(v11, "canUseCoordinate:") ^ 1;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
      v12 = (double)v8;
    }
    else
    {
      v12 = 0.0;
    }

    v13 = v12 / (double)v4;
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)_addressNodesFromCuratedAssetCollection
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_curatedAssetCollection)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerator _fetchAssetsFromCuratedAssetCollection](self, "_fetchAssetsFromCuratedAssetCollection");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x1CAA4EB2C](v5);
          objc_msgSend(v9, "location", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            +[PGAssetLocationResolver closestAddressNodeFromMomentNodes:toLocation:withMaximumDistance:allowRemoteLocations:](PGAssetLocationResolver, "closestAddressNodeFromMomentNodes:toLocation:withMaximumDistance:allowRemoteLocations:", self->_momentNodes, v11, 0, 30000.0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v3, "addObject:", v12);

          }
          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v6 = v5;
      }
      while (v5);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (PGTitleGeneratorDateMatching)dateMatching
{
  return self->_dateMatching;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PGTitleGenerationContext)titleGenerationContext
{
  return self->_titleGenerationContext;
}

- (NSSet)usedLocationNodes
{
  return self->_usedLocationNodes;
}

- (void)setUsedLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_usedLocationNodes, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (unint64_t)preferredTitleType
{
  return self->_preferredTitleType;
}

- (void)setPreferredTitleType:(unint64_t)a3
{
  self->_preferredTitleType = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (BOOL)isForHighlight
{
  return self->_isForHighlight;
}

- (void)setIsForHighlight:(BOOL)a3
{
  self->_isForHighlight = a3;
}

- (PGGraphYearNodeCollection)featuredYearNodes
{
  return self->_featuredYearNodes;
}

- (void)setFeaturedYearNodes:(id)a3
{
  objc_storeStrong((id *)&self->_featuredYearNodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearNodes, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_usedLocationNodes, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_dateMatching, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
}

void __41__PGTitleGenerator__defaultLocationTitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 88);
  *(_QWORD *)(v9 + 88) = v6;

}

void __45__PGTitleGenerator__generateTitleAndSubtitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

@end
