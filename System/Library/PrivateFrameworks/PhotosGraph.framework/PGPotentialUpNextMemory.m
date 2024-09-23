@implementation PGPotentialUpNextMemory

- (PGPotentialUpNextMemory)initWithMemory:(id)a3 photoLibrary:(id)a4 userFeedbackCalculator:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGPotentialUpNextMemory *v12;
  PGPotentialUpNextMemory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPotentialUpNextMemory;
  v12 = -[PGPotentialUpNextMemory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_memory, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_userFeedbackCalculator, a5);
  }

  return v13;
}

- (NSString)memoryLocalIdentifier
{
  return (NSString *)-[PHMemory localIdentifier](self->_memory, "localIdentifier");
}

- (NSString)title
{
  return (NSString *)-[PHMemory title](self->_memory, "title");
}

- (NSString)subtitle
{
  return (NSString *)-[PHMemory subtitle](self->_memory, "subtitle");
}

- (PHAsset)keyAsset
{
  PHAsset *keyAsset;
  void *v4;
  PHMemory *memory;
  void *v6;
  void *v7;
  PHAsset *v8;
  PHAsset *v9;

  keyAsset = self->_keyAsset;
  if (!keyAsset)
  {
    if (self->_noKeyAsset)
    {
      keyAsset = 0;
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0CD1390];
      memory = self->_memory;
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", memory, 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (PHAsset *)objc_claimAutoreleasedReturnValue();
      v9 = self->_keyAsset;
      self->_keyAsset = v8;

      keyAsset = self->_keyAsset;
      if (!keyAsset)
        self->_noKeyAsset = 1;
    }
  }
  return keyAsset;
}

- (NSString)keyAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[PGPotentialUpNextMemory keyAsset](self, "keyAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isBlockedByUserFeedback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PHUserFeedbackCalculator *userFeedbackCalculator;
  void *v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PGPotentialUpNextMemory keyAsset](self, "keyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIncludedDetectionTypes:", &unk_1E84E9A48);
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "uuid", (_QWORD)v20);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      userFeedbackCalculator = self->_userFeedbackCalculator;
      objc_msgSend(v3, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMemory blockableFeatures](self->_memory, "blockableFeatures");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHUserFeedbackCalculator scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:](userFeedbackCalculator, "scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:", v14, v6, v15);
      v17 = v16;

      v18 = objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v17, *MEMORY[0x1E0CD1E58]) ^ 1;
    }
    else
    {
      LOBYTE(v18) = 0;
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
