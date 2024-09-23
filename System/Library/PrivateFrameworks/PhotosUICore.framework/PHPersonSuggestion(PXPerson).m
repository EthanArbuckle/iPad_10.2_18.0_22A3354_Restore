@implementation PHPersonSuggestion(PXPerson)

- (uint64_t)requestFaceCropImageWithTargetSize:()PXPerson displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:
{
  id v18;
  PXPeopleFaceCropFetchOptions *v19;
  void *v20;
  PXPeopleFaceCropFetchOptions *v21;
  void *v22;
  uint64_t v23;

  v18 = a10;
  v19 = [PXPeopleFaceCropFetchOptions alloc];
  objc_msgSend(a1, "keyFace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PXPeopleFaceCropFetchOptions initWithFace:targetSize:displayScale:](v19, "initWithFace:targetSize:displayScale:", v20, a2, a3, a4);

  -[PXPeopleFaceCropFetchOptions setCropFactor:](v21, "setCropFactor:", a6);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v21, "setCornerStyle:", a7);
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v21, "setShouldCacheResult:", a8);
  -[PXPeopleFaceCropFetchOptions setIsSynchronous:](v21, "setIsSynchronous:", a9);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "requestFaceCropForOptions:resultHandler:", v21, v18);

  return v23;
}

- (uint64_t)numberOfAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setShouldPrefetchCount:", 1);
  v5 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(a1, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetsForPerson:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  return v8;
}

- (id)name
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_localizedName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_longStyleLocalizedName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_longStyleLocalizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_localIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "keyFace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)isVerified
{
  return 0;
}

- (uint64_t)isPersonModel
{
  return 0;
}

- (uint64_t)detectionType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "detectionType");

  return v2;
}

- (uint64_t)px_isHuman
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "px_isHuman");

  return v2;
}

- (uint64_t)px_isPet
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "px_isPet");

  return v2;
}

- (id)px_keyPhotoDate
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyFace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_standardLibrarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
  v12[0] = *MEMORY[0x1E0CD1A08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFetchPropertySets:", v4);

  v5 = (void *)MEMORY[0x1E0CD1390];
  v11 = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetsForFaces:options:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
