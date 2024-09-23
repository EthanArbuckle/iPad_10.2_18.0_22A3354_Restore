@implementation PHAStorytellingClientRequestUtils

+ (id)assetCollectionForLocalIdentifier:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 || !v9)
  {
    if (v8)
    {
      objc_msgSend(a1, "_assetCollectionForLocalIdentifier:photoLibrary:", v8, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionAssetIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10, "librarySpecificFetchOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D75CA8], "assetPropertySetsForCuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFetchPropertySets:", v13);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

+ (id)_assetCollectionForLocalIdentifier:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludeLocalMemories:", 1);
  objc_msgSend(v6, "setFetchLimit:", 1);
  v7 = (void *)MEMORY[0x1E0CD13B8];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetCollectionsWithLocalIdentifiers:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
