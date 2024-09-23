@implementation PXContentSyndicationPhotoKitAssetGroup

- (PXContentSyndicationPhotoKitAssetGroup)initWithAssets:(id)a3
{
  id v4;
  void *v5;
  PXContentSyndicationPhotoKitAssetGroup *v6;
  PXContentSyndicationPhotoKitAssetGroup *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
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
  NSArray *originalAssets;
  uint64_t v32;
  NSArray *userLibraryAssets;
  uint64_t v34;
  NSArray *unsavedSyndicatedAssets;
  uint64_t v36;
  NSArray *unsavedCMMSyndicatedAssets;
  uint64_t v38;
  NSArray *syndicationIdentifiers;
  PXContentSyndicationPhotoKitAssetGroup *v40;
  PXContentSyndicationPhotoKitAssetGroup *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v53.receiver = self;
    v53.super_class = (Class)PXContentSyndicationPhotoKitAssetGroup;
    v6 = -[PXContentSyndicationPhotoKitAssetGroup init](&v53, sel_init);
    v7 = v6;
    if (v6)
    {
      v42 = v6;
      v8 = objc_msgSend(v5, "count");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v43 = v5;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v50;
        v45 = *(_QWORD *)v50;
        do
        {
          v15 = 0;
          v47 = v13;
          do
          {
            if (*(_QWORD *)v50 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
            objc_msgSend(v9, "addObject:", v16);
            if (objc_msgSend(v16, "px_isSyndicatedAsset"))
            {
              objc_msgSend(v16, "fetchPropertySetsIfNeeded");
              objc_msgSend(v16, "curationProperties");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "syndicationIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v48, "addObject:", v18);
              }
              else
              {
                PXAssertGetLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v16, "uuid");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v56 = v29;
                  _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Missing syndicationIdentifier for syndicated asset %@", buf, 0xCu);

                }
              }
              if (objc_msgSend(v16, "px_isUnsavedSyndicatedAsset"))
              {
                v20 = v11;
                v21 = v9;
                v22 = v10;
                objc_msgSend(v46, "addObject:", v16);
                v23 = (void *)MEMORY[0x1E0CD1390];
                v54 = v18;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "librarySpecificFetchOptions");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "fetchAssetsWithSyndicationIdentifiers:options:", v24, v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "firstObject");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v28, "sourceType") == 8)
                  objc_msgSend(v44, "addObject:", v28);

                v10 = v22;
                v9 = v21;
                v11 = v20;
                v14 = v45;
                v13 = v47;
              }

            }
            else
            {
              objc_msgSend(v10, "addObject:", v16);
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v13);
      }

      v30 = objc_msgSend(v9, "copy");
      v7 = v42;
      originalAssets = v42->_originalAssets;
      v42->_originalAssets = (NSArray *)v30;

      v32 = objc_msgSend(v10, "copy");
      userLibraryAssets = v42->_userLibraryAssets;
      v42->_userLibraryAssets = (NSArray *)v32;

      v34 = objc_msgSend(v46, "copy");
      unsavedSyndicatedAssets = v42->_unsavedSyndicatedAssets;
      v42->_unsavedSyndicatedAssets = (NSArray *)v34;

      v36 = objc_msgSend(v44, "copy");
      unsavedCMMSyndicatedAssets = v42->_unsavedCMMSyndicatedAssets;
      v42->_unsavedCMMSyndicatedAssets = (NSArray *)v36;

      v38 = objc_msgSend(v48, "copy");
      syndicationIdentifiers = v42->_syndicationIdentifiers;
      v42->_syndicationIdentifiers = (NSArray *)v38;

      v5 = v43;
    }
    self = v7;
    v40 = self;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (NSArray)originalAssets
{
  return self->_originalAssets;
}

- (NSArray)userLibraryAssets
{
  return self->_userLibraryAssets;
}

- (NSArray)unsavedSyndicatedAssets
{
  return self->_unsavedSyndicatedAssets;
}

- (NSArray)unsavedCMMSyndicatedAssets
{
  return self->_unsavedCMMSyndicatedAssets;
}

- (NSArray)syndicationIdentifiers
{
  return self->_syndicationIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_unsavedCMMSyndicatedAssets, 0);
  objc_storeStrong((id *)&self->_unsavedSyndicatedAssets, 0);
  objc_storeStrong((id *)&self->_userLibraryAssets, 0);
  objc_storeStrong((id *)&self->_originalAssets, 0);
}

@end
