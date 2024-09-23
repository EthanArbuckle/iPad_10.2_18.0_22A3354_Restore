@implementation PHAsset(PXPlacesAdditions)

- (uint64_t)pk_isContentEqualTo:()PXPlacesAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a1, "hasContentEqualTo:", v4))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = v4 == 0;
  }

  return v5;
}

- (uint64_t)compareTo:()PXPlacesAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)pk_fetchPlacesAssetsInAssetCollection:()PXPlacesAdditions shouldMergeOptionFetchPropertySets:options:
{
  id v7;
  id v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
LABEL_3:
      v10 = (void *)objc_msgSend(v9, "copy");
      goto LABEL_6;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CD1570];
    objc_msgSend(v8, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchOptionsWithPhotoLibrary:orObject:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setIncludePlacesSmartAlbum:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000203, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(v7, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSharingFilter:", objc_msgSend(0, "sharingFilter"));
LABEL_6:
  objc_msgSend(v10, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v10, "setChunkSizeForFetch:", 5000);
  objc_msgSend(v10, "sortDescriptors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("creationDate"), 0);
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v18);

  }
  v19 = *MEMORY[0x1E0CD1A40];
  v23[0] = *MEMORY[0x1E0CD1960];
  v23[1] = v19;
  v23[2] = *MEMORY[0x1E0CD1958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_msgSend(v10, "addFetchPropertySets:", v20);
  else
    objc_msgSend(v10, "setFetchPropertySets:", v20);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
