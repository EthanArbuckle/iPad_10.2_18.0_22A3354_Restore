@implementation PHPerson(PXPerson)

- (uint64_t)requestFaceCropImageWithTargetSize:()PXPerson displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:
{
  id v18;
  PXPeopleFaceCropFetchOptions *v19;
  void *v20;
  uint64_t v21;

  v18 = a10;
  v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", a1, a2, a3, a4);
  -[PXPeopleFaceCropFetchOptions setCropFactor:](v19, "setCropFactor:", a6);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v19, "setCornerStyle:", a7);
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v19, "setShouldCacheResult:", a8);
  -[PXPeopleFaceCropFetchOptions setIsSynchronous:](v19, "setIsSynchronous:", a9);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "requestFaceCropForOptions:resultHandler:", v19, v18);

  return v21;
}

- (uint64_t)numberOfAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  objc_msgSend(v3, "setIncludeTorsoAndFaceDetectionData:", 1);
  v4 = (void *)MEMORY[0x1E0CD1390];
  v9[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsForPersons:options:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (uint64_t)isPersonModel
{
  return 1;
}

- (id)px_keyPhotoDate
{
  void *v2;
  void *v3;
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
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_standardLibrarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v3, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v4);

  objc_msgSend(MEMORY[0x1E0CD1528], "px_fetchKeyFaceForPerson:options:", a1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeHiddenAssets:", 0);
  v15[0] = *MEMORY[0x1E0CD1A08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFetchPropertySets:", v7);

  v8 = (void *)MEMORY[0x1E0CD1390];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsForFaces:options:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)px_isHuman
{
  return +[PXPeopleUtilities isDetectionTypeHuman:](PXPeopleUtilities, "isDetectionTypeHuman:", objc_msgSend(a1, "detectionType"));
}

- (BOOL)px_isPet
{
  return objc_msgSend(a1, "detectionType") > 2;
}

@end
