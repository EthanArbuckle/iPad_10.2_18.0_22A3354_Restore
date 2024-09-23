@implementation PXStoryMiroMemoryConverter

- (PXStoryMiroMemoryConverter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMiroMemoryConverter.m"), 22, CFSTR("%s is not available as initializer"), "-[PXStoryMiroMemoryConverter init]");

  abort();
}

- (PXStoryMiroMemoryConverter)initWithMemory:(id)a3 keyAsset:(id)a4
{
  id v7;
  id v8;
  PXStoryMiroMemoryConverter *v9;
  PXStoryMiroMemoryConverter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryMiroMemoryConverter;
  v9 = -[PXStoryMiroMemoryConverter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_keyAsset, a4);
    -[PXStoryMiroMemoryConverter _loadSavedMetadataForMemory:](v10, "_loadSavedMetadataForMemory:", v7);
  }

  return v10;
}

- (BOOL)containsAnyData
{
  void *v2;
  BOOL v3;

  -[PXStoryMiroMemoryConverter curatedAssets](self, "curatedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") > 0;

  return v3;
}

- (id)createNewRecipeFromMiroMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (!-[PXStoryMiroMemoryConverter containsAnyData](self, "containsAnyData"))
  {
    v8 = 0;
    v18 = 0;
    if (!a3)
      goto LABEL_8;
LABEL_7:
    *a3 = objc_retainAutorelease(v8);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D752C8], "createRecipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopyWithZone:", 0);

  -[PXStoryMiroMemoryConverter curatedAssets](self, "curatedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  +[PFStoryRecipe_PXStoryExtension addPHAssets:toRecipe:withCategory:error:](PFStoryRecipe_PXStoryExtension, "addPHAssets:toRecipe:withCategory:error:", v7, v6, 3, &v26);
  v8 = v26;

  v9 = *MEMORY[0x1E0D759A0];
  v22 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 16);
  v10 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 48);
  v23 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 32);
  v24 = v10;
  v25 = *(_QWORD *)(MEMORY[0x1E0D759A0] + 64);
  v21 = v9;
  v20 = 2;
  objc_msgSend(v6, "setOverallDurationInfo:", &v20);
  -[PXStoryMiroMemoryConverter flexMusicID](self, "flexMusicID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0D752D0];
    v13 = *MEMORY[0x1E0D759F0];
    -[PXStoryMiroMemoryConverter flexMusicID](self, "flexMusicID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 2, 0, v13, v14, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addAsset:", v15);
    v27 = v13;
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSeedSongIdentifiersByCatalog:", v17);

  }
  v18 = (void *)objc_msgSend(v6, "copyWithZone:", 0);

  if (a3)
    goto LABEL_7;
LABEL_8:

  return v18;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PXStoryMiroMemoryConverter curatedAssets](self, "curatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("< assets:%lu >"), objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_loadSavedMetadataForMemory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  PXDisplayAssetFetchResult *v11;
  void *v12;
  void *v13;
  void *v14;
  PXDisplayAssetFetchResult *curatedAssets;
  PXDisplayAssetFetchResult *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *flexMusicID;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryMiroMemoryConverter _fetchMiroCuratedAssetsInMemory:](self, "_fetchMiroCuratedAssetsInMemory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    PXDisplayAssetFetchResultFromArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMiroMemoryConverter keyAsset](self, "keyAsset");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          -[PXStoryMiroMemoryConverter keyAsset](self, "keyAsset"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v6, "containsObject:", v9),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      -[PXStoryMiroMemoryConverter keyAsset](self, "keyAsset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PXDisplayAssetFetchResultFromAsset();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = v13;
      v23[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PXDisplayAssetFetchResultFromFetchResults();
      v11 = (PXDisplayAssetFetchResult *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v6;
    }
    curatedAssets = self->_curatedAssets;
    self->_curatedAssets = v11;
    v16 = v11;

    v17 = objc_alloc(MEMORY[0x1E0CB3710]);
    objc_msgSend(v4, "movieData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initForReadingFromData:error:", v18, 0);

    objc_msgSend(v19, "setClass:forClassName:", objc_opt_class(), CFSTR("MiroBlueprint"));
    objc_msgSend(v19, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blueprint"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "flexMusicID");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    flexMusicID = self->_flexMusicID;
    self->_flexMusicID = v21;

  }
}

- (id)_fetchMiroCuratedAssetsInMemory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchMovieCuratedAssetsInMemory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "movieStateDataForAsset:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          +[PXStoryMiroAssetInfo infoWithData:](PXStoryMiroAssetInfo, "infoWithData:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isUsed"))
            objc_msgSend(v5, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (NSString)flexMusicID
{
  return self->_flexMusicID;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_flexMusicID, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

@end
