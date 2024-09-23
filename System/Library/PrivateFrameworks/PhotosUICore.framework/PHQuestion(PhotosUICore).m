@implementation PHQuestion(PhotosUICore)

- (uint64_t)px_requestConfigurationWithResultHandler:()PhotosUICore
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "_px_fetchRequestIdAndIncrement");
  objc_msgSend((id)objc_opt_class(), "_px_requestQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke;
  block[3] = &unk_1E5148F60;
  block[4] = a1;
  v10 = v4;
  v11 = v5;
  v7 = v4;
  dispatch_async(v6, block);

  return v5;
}

- (id)_px_fetchOptions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _LimitedFetchOptionsForPhotoLibrary(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (PXSurveyQuestionTextConfiguration)_px_requestQueue_fetchConfiguration
{
  uint64_t v2;
  PXSurveyQuestionTextConfiguration *v3;
  NSObject *v4;
  void *v5;
  PXSurveyQuestionTextConfiguration *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "displayType") == 6)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForTextWithScalingForLongText:", objc_msgSend(a1, "type") == 30);
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "displayType") == 8)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForAlbum");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!objc_msgSend(a1, "entityType"))
  {
    if (objc_msgSend(a1, "type") == 29)
      objc_msgSend(a1, "_px_requestQueue_configurationForExternalAssetRelevance");
    else
      objc_msgSend(a1, "_px_requestQueue_configurationForAsset");
    v2 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v3 = (PXSurveyQuestionTextConfiguration *)v2;
    if (v2)
      return v3;
    goto LABEL_23;
  }
  if (objc_msgSend(a1, "entityType") == 1)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForPerson");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "entityType") == 5)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForPersonGroup");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "entityType") == 2)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForMemory");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "entityType") == 3)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForTrip");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "entityType") == 7)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForMoment");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "entityType") == 8)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForDayHighlight");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_23:
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1, "entityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v5;
    v11 = 1024;
    v12 = objc_msgSend(a1, "entityType");
    v13 = 2112;
    v14 = a1;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Could not find entity (%@) of type %hu backing question (%@)", (uint8_t *)&v9, 0x1Cu);

  }
  v6 = [PXSurveyQuestionTextConfiguration alloc];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeInvalidQuestionText"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXSurveyQuestionTextConfiguration initWithTitle:questionText:shouldScaleForLongText:](v6, "initWithTitle:questionText:shouldScaleForLongText:", v7, CFSTR("😱"), 0);

  return v3;
}

- (PXSurveyQuestionTextConfiguration)_px_requestQueue_configurationForTextWithScalingForLongText:()PhotosUICore
{
  void *v5;
  void *v6;
  PXSurveyQuestionTextConfiguration *v7;
  void *v8;
  PXSurveyQuestionTextConfiguration *v9;

  objc_msgSend(a1, "additionalInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D77FF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PXSurveyQuestionTextConfiguration alloc];
  objc_msgSend(a1, "px_displayTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSurveyQuestionTextConfiguration initWithTitle:questionText:shouldScaleForLongText:](v7, "initWithTitle:questionText:shouldScaleForLongText:", v8, v6, a3);

  return v9;
}

- (PXSurveyQuestionMapConfiguration)_px_requestQueue_configurationForAsset
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  __objc2_class *v12;
  PXSurveyQuestionMapConfiguration *v13;
  void *v14;
  PXSurveyQuestionMapConfiguration *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHFetchResult<PHAsset *> * _Nullable _AssetFetchForQuestion(PHQuestion *__strong)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PHQuestion+PhotosUICore.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("question"));

  }
  if (objc_msgSend(v1, "type") != 18)
  {
    v9 = objc_msgSend(v1, "type");
    objc_msgSend(v1, "photoLibrary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "entityIdentifier");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v9 == 1)
    {
      v3 = v3;
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHFetchOptions *_LimitedFetchOptionsForPhotoLibraryAssetGroup(PHPhotoLibrary *__strong)");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PHQuestion+PhotosUICore.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

      }
      objc_msgSend(v3, "librarySpecificFetchOptions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFetchLimit:", 9);

    }
    else
    {
      _LimitedFetchOptionsForPhotoLibrary(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)MEMORY[0x1E0CD1390];
    *(_QWORD *)buf = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchAssetsWithLocalIdentifiers:options:", v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v24);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v24;
  if (v2)
  {
    objc_msgSend(v1, "entityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _LimitedFetchOptionsForPhotoLibrary(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIncludeGuestAssets:", 1);
    v6 = (void *)MEMORY[0x1E0CD1390];
    *(_QWORD *)buf = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetsWithSyndicationIdentifiers:options:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    goto LABEL_13;
  }
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Failed to open the syndication photo library: %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_13:

  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (objc_msgSend(v1, "displayType") == 7)
    {
      v12 = PXSurveyQuestionWallpaperConfiguration;
    }
    else
    {
      if (objc_msgSend(v1, "displayType") == 4)
      {
        objc_msgSend(v11, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = [PXSurveyQuestionMapConfiguration alloc];
          objc_msgSend(v1, "px_displayTitle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "location");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PXSurveyQuestionMapConfiguration initWithTitle:location:](v15, "initWithTitle:location:", v16, v17);

LABEL_22:
          goto LABEL_23;
        }
      }
      v12 = PXSurveyQuestionAssetConfiguration;
    }
    v18 = [v12 alloc];
    objc_msgSend(v1, "px_displayTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (PXSurveyQuestionMapConfiguration *)objc_msgSend(v18, "initWithTitle:asset:", v16, v11);
    goto LABEL_22;
  }
  v13 = 0;
LABEL_23:

  return v13;
}

- (PXSurveyQuestionPersonConfiguration)_px_requestQueue_configurationForPerson
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXSurveyQuestionPersonConfiguration *v8;
  void *v9;
  PXSurveyQuestionPersonConfiguration *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD16C0];
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_px_fetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchPersonsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [PXSurveyQuestionPersonConfiguration alloc];
    objc_msgSend(a1, "px_displayTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXSurveyQuestionPersonConfiguration initWithTitle:person:](v8, "initWithTitle:person:", v9, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PXSurveyQuestionPersonGroupConfiguration)_px_requestQueue_configurationForPersonGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PXSurveyQuestionPersonGroupConfiguration *v9;
  void *v10;
  PXSurveyQuestionPersonGroupConfiguration *v11;

  objc_msgSend(a1, "additionalInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("personUUIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "count");
  if (v8 == objc_msgSend(v6, "count"))
  {
    v9 = [PXSurveyQuestionPersonGroupConfiguration alloc];
    objc_msgSend(a1, "px_displayTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSurveyQuestionPersonGroupConfiguration initWithTitle:personGroup:](v9, "initWithTitle:personGroup:", v10, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_px_requestQueue_configurationForMemory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD13B8];
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_px_fetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetCollectionsWithType:localIdentifiers:options:", 4, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForMemory:assetCollection:customKeyAssetIdentifier:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PXSurveyQuestionCustomizableAssetGroupConfiguration)_px_requestQueue_configurationForExternalAssetRelevance
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PXSurveyQuestionCustomizableAssetGroupConfiguration *v26;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "additionalInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetCollectionsWithType:localIdentifiers:options:", 3, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(a1, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v12);
    if (!objc_msgSend(v13, "count"))
    {
      v26 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v28 = v10;
    v14 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(a1, "entityIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localIdentifierWithUUID:", v15);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "additionalInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D78008]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAA0]);

    if ((_DWORD)v14)
    {
      objc_msgSend(a1, "photoLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "librarySpecificFetchOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CD1390];
      v30[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fetchAssetsWithLocalIdentifiers:options:", v21, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_10;
      objc_msgSend(v13, "addObject:", v23);

    }
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(a1, "_px_localizedQuestionTextForExternalAssetRelevance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)v29;
      v26 = -[PXSurveyQuestionCustomizableAssetGroupConfiguration initWithTitle:assetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:]([PXSurveyQuestionCustomizableAssetGroupConfiguration alloc], "initWithTitle:assetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:", v24, v19, &unk_1E53EB9A0, v29);

      v10 = v28;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v26 = 0;
    v10 = v28;
    v25 = (void *)v29;
    goto LABEL_11;
  }
  v26 = 0;
LABEL_13:

  return v26;
}

- (PXSurveyQuestionAssetGroupConfiguration)_px_requestQueue_configurationForMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXSurveyQuestionAssetGroupConfiguration *v8;
  void *v9;
  PXSurveyQuestionAssetGroupConfiguration *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD13B8];
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_px_fetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetCollectionsWithType:localIdentifiers:options:", 3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [PXSurveyQuestionAssetGroupConfiguration alloc];
    objc_msgSend(a1, "px_displayTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXSurveyQuestionAssetGroupConfiguration initWithTitle:assetCollection:](v8, "initWithTitle:assetCollection:", v9, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_px_requestQueue_configurationForDayHighlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_px_fetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assets.uuid CONTAINS %@"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForMemory:assetCollection:customKeyAssetIdentifier:", 0, v6, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_px_requestQueue_configurationForTrip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_px_fetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dayGroupAssets.uuid CONTAINS %@"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "_px_requestQueue_configurationForMemory:assetCollection:customKeyAssetIdentifier:", 0, v6, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PXSurveyQuestionMemoryConfiguration)_px_requestQueue_configurationForMemory:()PhotosUICore assetCollection:customKeyAssetIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  PXSurveyQuestionMemoryConfiguration *v16;
  PXSurveyQuestionMemoryConfiguration *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "px_displayTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v12 = v8;
  else
    v12 = v9;
  v13 = v12;
  if (objc_msgSend(a1, "type") == 15 || objc_msgSend(a1, "type") == 16)
  {
    objc_msgSend(a1, "additionalInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D780B8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = -[PXSurveyQuestionMemoryConfiguration initWithTitle:memory:songAdamId:customKeyAssetIdentifier:]([PXSurveyQuestionMemoryConfiguration alloc], "initWithTitle:memory:songAdamId:customKeyAssetIdentifier:", v11, v13, v15, v10);
    else
      v16 = -[PXSurveyQuestionTextConfiguration initWithTitle:questionText:shouldScaleForLongText:]([PXSurveyQuestionTextConfiguration alloc], "initWithTitle:questionText:shouldScaleForLongText:", CFSTR("This Photos Challenge Special Edition question is no longer valid. Please select Skip."), CFSTR("⚠️"), 0);
    v17 = v16;

  }
  else
  {
    v17 = -[PXSurveyQuestionMemoryConfiguration initWithTitle:memory:songAdamId:customKeyAssetIdentifier:]([PXSurveyQuestionMemoryConfiguration alloc], "initWithTitle:memory:songAdamId:customKeyAssetIdentifier:", v11, v13, 0, v10);
  }

  return v17;
}

- (PXSurveyQuestionAlbumConfiguration)_px_requestQueue_configurationForAlbum
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXSurveyQuestionAlbumConfiguration *v8;
  void *v9;
  PXSurveyQuestionAlbumConfiguration *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD13B8];
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_px_fetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [PXSurveyQuestionAlbumConfiguration alloc];
    objc_msgSend(a1, "px_displayTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXSurveyQuestionAlbumConfiguration initWithTitle:album:](v8, "initWithTitle:album:", v9, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)px_displayTitle
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("QUESTION TEXT PLACEHOLDER FOR TYPE (%d)"), objc_msgSend(a1, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(a1, "type"))
  {
    case 1u:
      objc_msgSend(a1, "additionalInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contactName"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromPersonContactMatchingContactName:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 3u:
      objc_msgSend(a1, "additionalInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D78060]);
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromMeaningLabel:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 4u:
      objc_msgSend(a1, "additionalInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("businessName"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromBusinessName:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 5u:
      objc_msgSend(a1, "additionalInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D780D8]);
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "additionalInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D77FF0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

      objc_msgSend(a1, "_px_localizedQuestionTextFromRelationshipLabel:initial:", v4, v11);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 6u:
      objc_msgSend(a1, "additionalInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("publicEventName"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromPublicEventName:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 7u:
      objc_msgSend(a1, "additionalInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("localizedHolidayName"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromHolidayName:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 8u:
      objc_msgSend(a1, "_px_localizedQuestionTextForFrequentLocation");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0xAu:
      objc_msgSend(a1, "additionalInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ageCategory"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromAgeCategory:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xBu:
      objc_msgSend(a1, "_px_localizedQuestionTextForMemoryQuality");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0xCu:
      objc_msgSend(a1, "additionalInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("tripName"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextForTripKeyAssetWithTripName:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xDu:
      objc_msgSend(a1, "additionalInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D77FF0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 != 0;

      objc_msgSend(a1, "_px_localizedQuestionTextForPetInitial:", v19);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0xEu:
      objc_msgSend(a1, "_px_localizedQuestionTextForFeaturedPhoto");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0xFu:
      objc_msgSend(a1, "additionalInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("songTitle"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromMemoryMusicQualitySongTitle:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x10u:
      objc_msgSend(a1, "additionalInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("songTitle"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromMemoryMusicEnergySongTitle:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x11u:
      objc_msgSend(a1, "_px_localizedQuestionTextForSocialGroups");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x12u:
      objc_msgSend(a1, "_px_localizedQuestionTextForSyndicatedAssets");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x13u:
      objc_msgSend(a1, "additionalInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("personActivityMeaningLabel"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextFromPersonActivityMeaningLabel:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x14u:
      objc_msgSend(a1, "_px_localizedQuestionTextForSharedLibraryAssets");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x15u:
      objc_msgSend(a1, "_px_localizedQuestionTextForSharedLibraryStart");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x16u:
      objc_msgSend(a1, "_px_localizedQuestionTextForWallpaper");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x17u:
      objc_msgSend(a1, "_px_localizedQuestionTextForCameraLibrarySwitch");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x18u:
      objc_msgSend(a1, "_px_localizedQuestionTextForAlbumClassification");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x19u:
      objc_msgSend(a1, "_px_localizedQuestionTextForExhaustiveMomentLabelling");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x1Au:
      objc_msgSend(a1, "additionalInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("tripTitle"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextForTripTitlingForTitle:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x1Bu:
      objc_msgSend(a1, "additionalInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("localizedLocationName"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextForLocationRepresentativeAsset:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x1Cu:
      objc_msgSend(a1, "additionalInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("highlightTitle"));
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_px_localizedQuestionTextForHighlightTitlingForTitle:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v26 = (void *)v5;

      v2 = (void *)v4;
      goto LABEL_32;
    case 0x1Du:
      objc_msgSend(a1, "_px_localizedQuestionTextForExternalAssetRelevance");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0x1Eu:
      objc_msgSend(a1, "_px_localizedQuestionTextForStoryPromptSuggestions");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_31:
      v26 = (void *)v14;
LABEL_32:

      v2 = v26;
      break;
    default:
      return v2;
  }
  return v2;
}

- (id)_px_localizedQuestionTextFromMeaningLabel:()PhotosUICore
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Hiking")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningHikingQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Climbing")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningClimbingQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Beaching")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningBeachingQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Diving")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningDivingQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WinterSport")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningWinterSportQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Entertainment")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningEntertainmentQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AmusementPark")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningAmusementParkQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Performance")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningPerformanceQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Concert")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningConcertQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Festival")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningFestivalQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Theater")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningTheaterQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Dance")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningDanceQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SportEvent")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningSportEventQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NightOut")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningNightOutQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Museum")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningMuseumQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Celebration")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningCelebrationQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Birthday")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningBirthdayQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Anniversary")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningAnniversaryQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Wedding")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningWeddingQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HolidayEvent")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningHolidayEventQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gathering")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningGatheringQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Restaurant")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningRestaurantQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Breakfast")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningBreakfastQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Lunch")))
  {
    v4 = CFSTR("PXInternalPhotosChallengeMeaningLunchQuestionText");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Dinner")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MEANING QUESTION TEXT PLACEHOLDER (%@)"), v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    v4 = CFSTR("PXInternalPhotosChallengeMeaningDinnerQuestionText");
  }
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_52:
  v6 = (void *)v5;

  return v6;
}

- (id)_px_localizedQuestionTextFromPersonActivityMeaningLabel:()PhotosUICore
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PersonBeachWater")))
  {
    v4 = CFSTR("PXInternalPhotosChallengePersonActivityMeaningPersonBeachWaterQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PersonToys")))
  {
    v4 = CFSTR("PXInternalPhotosChallengePersonActivityMeaningPersonToysQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PersonPlayground")))
  {
    v4 = CFSTR("PXInternalPhotosChallengePersonActivityMeaningPersonPlaygroundQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PersonActionSwimming")))
  {
    v4 = CFSTR("PXInternalPhotosChallengePersonActivityMeaningPersonActionSwimmingQuestionText");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PersonActionPlayingOnASwing")))
  {
    v4 = CFSTR("PXInternalPhotosChallengePersonActivityMeaningPersonActionPlayingOnASwingQuestionText");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("PersonActionPlayingOnASlide")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PERSON ACTIVITY MEANING QUESTION TEXT PLACEHOLDER (%@)"), v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v4 = CFSTR("PXInternalPhotosChallengePersonActivityMeaningPersonActionPlayingOnASlideQuestionText");
  }
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v6 = (void *)v5;

  return v6;
}

- (id)_px_localizedQuestionTextFromRelationshipLabel:()PhotosUICore initial:
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FAMILY")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipFamilyQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("FRIEND")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipFriendQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("COWORKER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipCoworkerQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PARTNER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipPartnerQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PARENT")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipParentQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SIBLING")))
  {
    if ((a4 & 1) != 0)
      v6 = CFSTR("PXInternalPhotosChallengeRelationshipSiblingInitialQuestionText");
    else
      v6 = CFSTR("PXInternalPhotosChallengeRelationshipSiblingQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SISTER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipSisterQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("BROTHER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipBrotherQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("FATHER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipFatherQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("MOTHER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipMotherQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ALUMNI")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipAlumniQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CHILD")))
  {
    if ((a4 & 1) != 0)
      v6 = CFSTR("PXInternalPhotosChallengeRelationshipChildInitialQuestionText");
    else
      v6 = CFSTR("PXInternalPhotosChallengeRelationshipChildQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SON")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipSonQuestionText");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("DAUGHTER")))
  {
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipDaughterQuestionText");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("ME")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RELATIONSHIP QUESTION TEXT PLACEHOLDER (%@)"), v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    v6 = CFSTR("PXInternalPhotosChallengeRelationshipMeQuestionText");
  }
  PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_36:
  v8 = (void *)v7;

  return v8;
}

- (__CFString)_px_localizedQuestionTextFromBusinessName:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeBusinessItemQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("BUSINESS ITEM QUESTION TEXT PLACEHOLDER");
  }
  return v5;
}

- (__CFString)_px_localizedQuestionTextFromPublicEventName:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengePublicEventQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("PUBLIC EVENT QUESTION TEXT PLACEHOLDER");
  }
  return v5;
}

- (id)_px_localizedQuestionTextForWallpaper
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeWallpaperQuestionText"), CFSTR("PhotosUICore"));
}

- (id)_px_localizedQuestionTextForMemoryQuality
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryQualityQuestionText"), CFSTR("PhotosUICore"));
}

- (__CFString)_px_localizedQuestionTextFromMemoryMusicQualitySongTitle:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("MEMORY MUSIC QUALITY QUESTION TEXT PLACEHOLDER");
  }
  return v5;
}

- (__CFString)_px_localizedQuestionTextFromMemoryMusicEnergySongTitle:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicEnergyQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("MEMORY MUSIC ENERGY QUESTION TEXT PLACEHOLDER");
  }
  return v5;
}

- (id)_px_localizedQuestionTextForTripKeyAssetWithTripName:()PhotosUICore
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeTripKeyAssetQuestionText"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__CFString)_px_localizedQuestionTextFromHolidayName:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHolidayQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("HOLIDAY QUESTION TEXT PLACEHOLDER");
  }
  return v5;
}

- (id)_px_localizedQuestionTextForFrequentLocation
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonFrequentLocationMessage"), CFSTR("PhotosUICore"));
}

- (__CFString)_px_localizedQuestionTextFromPersonContactMatchingContactName:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengePersonContactMatchingQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("PERSON CONTACT MATCHING QUESTION TEXT PLACEHOLDER");
  }
  return v5;
}

- (__CFString)_px_localizedQuestionTextFromAgeCategory:()PhotosUICore
{
  __CFString *v3;
  void *v4;

  v3 = CFSTR("PERSON AGE CATEGORY MATCHING QUESTION TEXT PLACEHOLDER");
  switch(objc_msgSend(a3, "unsignedIntegerValue"))
  {
    case 0:
      return v3;
    default:
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengePersonAgeCategoryQuestionText"), CFSTR("PhotosUICore"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v3;
}

- (id)_px_localizedQuestionTextForPetInitial:()PhotosUICore
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (a3)
    v3 = CFSTR("PXInternalPhotosChallengePetInitialQuestionText");
  else
    v3 = CFSTR("PXInternalPhotosChallengePetQuestionText");
  PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_px_localizedQuestionTextForFeaturedPhoto
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeFeaturedPhotoQuestionText"), CFSTR("PhotosUICore"));
}

- (id)_px_localizedQuestionTextForSocialGroups
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSocialGroupsQuestionText"), CFSTR("PhotosUICore"));
}

- (id)_px_localizedQuestionTextForSyndicatedAssets
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSyndicatedAssetsQuestionText"), CFSTR("PhotosUICore"));
}

- (id)_px_localizedQuestionTextForSharedLibraryAssets
{
  return PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAssetsQuestionText"));
}

- (id)_px_localizedQuestionTextForSharedLibraryStart
{
  return PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryStartQuestionText"));
}

- (id)_px_localizedQuestionTextForCameraLibrarySwitch
{
  return PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeCameraLibrarySwitchQuestionText"));
}

- (id)_px_localizedQuestionTextForAlbumClassification
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationQuestionText"), CFSTR("PhotosUICore"));
}

- (id)_px_localizedQuestionTextForExhaustiveMomentLabelling
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeExhaustiveMomentLabelling"), CFSTR("PhotosUICore"));
}

- (id)_px_localizedQuestionTextForTripTitlingForTitle:()PhotosUICore
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeTripTitlingQuestionText"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_px_localizedQuestionTextForExternalAssetRelevance
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeExternalAssetRelevanceText"), CFSTR("PhotosUICore"));
}

- (__CFString)_px_localizedQuestionTextForLocationRepresentativeAsset:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    v3 = a3;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeLocationRepresentativeAssetQuestionText"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("LOCATION REPRESENTATIVE ASSET TEXT PLACEHOLDER");
  }
  return v5;
}

- (id)_px_localizedQuestionTextForHighlightTitlingForTitle:()PhotosUICore
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeDayHighlightTitlingQuestionText"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_px_localizedQuestionTextForStoryPromptSuggestions
{
  return PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsQuestionText"));
}

- (BOOL)px_assetCollectionAndAssetFetchResultForAsset:()PhotosUICore assetCollection:assetFetchResult:
{
  id v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuestion+PhotosUICore.m"), 757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

    if (a5)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuestion+PhotosUICore.m"), 756, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  if (!a4)
    goto LABEL_14;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuestion+PhotosUICore.m"), 758, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetFetchResult"));

LABEL_4:
  if (objc_msgSend(a1, "type") == 18)
  {
    PXContentSyndicationCollectionAndFetchResultForAsset(v9, a4, a5);
    v10 = 1;
  }
  else
  {
    objc_msgSend(v9, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v9, 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSortDescriptors:", v17);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      v10 = v19 != 0;
      if (v19)
      {
        *a4 = objc_retainAutorelease(v14);
        *a5 = objc_retainAutorelease(v18);
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

+ (id)_px_requestQueue
{
  if (_px_requestQueue_onceToken != -1)
    dispatch_once(&_px_requestQueue_onceToken, &__block_literal_global_41575);
  return (id)_px_requestQueue_queue;
}

+ (id)_px_configurationCache
{
  if (_px_configurationCache_onceToken != -1)
    dispatch_once(&_px_configurationCache_onceToken, &__block_literal_global_129_41574);
  return (id)_px_configurationCache_cache;
}

+ (uint64_t)_px_fetchRequestIdAndIncrement
{
  id v2;
  uint64_t v3;

  if (_px_fetchRequestIdAndIncrement_onceToken != -1)
    dispatch_once(&_px_fetchRequestIdAndIncrement_onceToken, &__block_literal_global_130);
  v2 = a1;
  objc_sync_enter(v2);
  v3 = _px_fetchRequestIdAndIncrement__px_requestId++;
  objc_sync_exit(v2);

  return v3;
}

@end
