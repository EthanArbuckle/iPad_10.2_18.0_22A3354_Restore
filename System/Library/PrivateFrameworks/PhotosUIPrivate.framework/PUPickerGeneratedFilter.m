@implementation PUPickerGeneratedFilter

- (PUPickerGeneratedFilter)initWithFilter:(id)a3
{
  id v4;
  PUPickerGeneratedFilter *v5;
  PUPickerGeneratedFilter *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSPredicate *assetPredicate;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUPickerGeneratedFilter;
  v5 = -[PUPickerGeneratedFilter init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_allowsSearchSuggestions = objc_msgSend(v4, "allowsSearchSuggestions");
      v6->_allowsAlbums = objc_msgSend(v4, "allowsAlbums");
      objc_msgSend(MEMORY[0x1E0CD2170], "_stickersFilter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_puPickerFilter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_containsStickersFilter = objc_msgSend(v4, "containsFilter:", v8);

      objc_msgSend(v4, "generatedAssetPredicate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      assetPredicate = v6->_assetPredicate;
      v6->_assetPredicate = (NSPredicate *)v10;

      v6->_possibleAssetTypes = objc_msgSend(v4, "generatedPossibleAssetTypes");
      v12 = objc_msgSend(v4, "generatedRequiredAssetTypes");
    }
    else
    {
      *(_WORD *)&v5->_allowsSearchSuggestions = 257;
      v5->_containsStickersFilter = 0;
      v12 = 131070;
      v6->_possibleAssetTypes = 131070;
    }
    v6->_requiredAssetTypes = v12;
  }

  return v6;
}

- (PUPickerGeneratedFilter)initWithUIImagePickerControllerMediaTypes:(id)a3
{
  id v4;
  void *v5;
  PUPickerGeneratedFilter *v6;
  void *v7;
  char v8;

  v4 = a3;
  +[PUPickerGeneratedFilter _pu_legacy_filterForUIImagePickerControllerMediaTypes:](PUPickerGeneratedFilter, "_pu_legacy_filterForUIImagePickerControllerMediaTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUPickerGeneratedFilter initWithFilter:](self, "initWithFilter:", v5);

  objc_msgSend((id)*MEMORY[0x1E0CEC540], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  v6->_pu_legacy_mediaTypesIncludesLivePhoto = v8;
  return v6;
}

- (PUPickerGeneratedFilter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerGeneratedFilter.m"), 60, CFSTR("%s is not available as initializer"), "-[PUPickerGeneratedFilter init]");

  abort();
}

- (unint64_t)searchQueryFilterOptions
{
  unint64_t v2;

  v2 = -[PUPickerGeneratedFilter possibleAssetTypes](self, "possibleAssetTypes");
  if ((v2 & 0x1FC00) != 0)
    return (v2 >> 1) & 2 | ((v2 & 0x3FA) != 0) | 4;
  else
    return (v2 >> 1) & 2 | ((v2 & 0x3FA) != 0);
}

- (unint64_t)genericAssetTypes
{
  unint64_t v2;
  unint64_t v3;

  v2 = -[PUPickerGeneratedFilter possibleAssetTypes](self, "possibleAssetTypes");
  v3 = v2 & 4 | ((v2 & 0x3FA) != 0);
  if ((v2 & 0x1FC00) != 0)
    v3 |= 2uLL;
  if (v3 == 7)
    return -1;
  else
    return v3;
}

- (int64_t)displayAssetMediaType
{
  unint64_t v2;
  int64_t v3;

  v2 = -[PUPickerGeneratedFilter possibleAssetTypes](self, "possibleAssetTypes");
  v3 = 2 * ((v2 & 0x3FE) == 0);
  if ((v2 & 0x1FC00) == 0)
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

- (int64_t)noContentPlaceholderType
{
  unint64_t v2;
  int64_t v3;

  v2 = -[PUPickerGeneratedFilter possibleAssetTypes](self, "possibleAssetTypes");
  v3 = 2 * ((v2 & 0x3FE) == 0);
  if ((v2 & 0x1FC00) == 0)
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

- (int64_t)displayAssetMediaTypeConsideringAssetObjectIDs:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CD1620]);
    v10 = (void *)objc_msgSend(v9, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v6, v7, *MEMORY[0x1E0CD1B90], 0, 0, 0);
    v11 = objc_msgSend(v10, "countOfAssetsWithMediaType:", 1);
    v12 = objc_msgSend(v10, "countOfAssetsWithMediaType:", 2);
    if (v12)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v11)
      v14 = v13;
    else
      v14 = 2 * (v12 != 0);

  }
  else
  {
    v14 = -[PUPickerGeneratedFilter displayAssetMediaType](self, "displayAssetMediaType");
  }

  return v14;
}

- (BOOL)allowsSearchSuggestions
{
  return self->_allowsSearchSuggestions;
}

- (BOOL)allowsAlbums
{
  return self->_allowsAlbums;
}

- (BOOL)containsStickersFilter
{
  return self->_containsStickersFilter;
}

- (NSPredicate)assetPredicate
{
  return self->_assetPredicate;
}

- (unint64_t)possibleAssetTypes
{
  return self->_possibleAssetTypes;
}

- (unint64_t)requiredAssetTypes
{
  return self->_requiredAssetTypes;
}

- (BOOL)pu_legacy_mediaTypesIncludesLivePhoto
{
  return self->_pu_legacy_mediaTypesIncludesLivePhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPredicate, 0);
}

+ (id)_pu_legacy_filterForUIImagePickerControllerMediaTypes:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v16 = objc_alloc(MEMORY[0x1E0CD21C8]);
    objc_msgSend(a1, "_imagesFilter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v17;
    objc_msgSend(a1, "_videosFilter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithFilterType:subfilters:", 0, v19);

    v21 = objc_alloc(MEMORY[0x1E0CD21C8]);
    v34[0] = v20;
    objc_msgSend(a1, "_excludingStreamedVideosFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = v34;
LABEL_10:
    objc_msgSend(v23, "arrayWithObjects:count:", v24, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    v15 = v13;
    goto LABEL_11;
  }
  if (!v8)
  {
    if (!v10)
    {
      v29 = 0;
      goto LABEL_12;
    }
    v25 = objc_alloc(MEMORY[0x1E0CD21C8]);
    objc_msgSend(a1, "_videosFilter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    objc_msgSend(a1, "_loopingVideosFilter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v25, "initWithFilterType:subfilters:", 0, v28);

    v21 = objc_alloc(MEMORY[0x1E0CD21C8]);
    v31[0] = v20;
    objc_msgSend(a1, "_excludingStreamedVideosFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = v31;
    goto LABEL_10;
  }
  v12 = objc_alloc(MEMORY[0x1E0CD21C8]);
  objc_msgSend(a1, "_imagesFilter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v22;
  objc_msgSend(a1, "_excludingLoopingVideosFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v20;
LABEL_11:
  v29 = (void *)objc_msgSend(v14, "initWithFilterType:subfilters:", 1, v15);

LABEL_12:
  return v29;
}

+ (id)_imagesFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD21B8]), "initWithMediaType:", 1);
}

+ (id)_videosFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD21B8]), "initWithMediaType:", 2);
}

+ (id)_loopingVideosFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD21C0]), "initWithPlaybackStyle:", 5);
}

+ (id)_excludingLoopingVideosFilter
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CD21C8]);
  objc_msgSend(a1, "_loopingVideosFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFilterType:subfilters:", 2, v5);

  return v6;
}

+ (id)_excludingStreamedVideosFilter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD21B0]), "initWithFilterType:", 5);
  v3 = objc_alloc(MEMORY[0x1E0CD21C8]);
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFilterType:subfilters:", 2, v4);

  return v5;
}

@end
