@implementation PLPrimaryResourceDataStoreImageRecipe

- (id)_resourceGenerationAffectsRecipesForLibraryID:(id)a3
{
  id v4;
  void *v5;
  unsigned int recipeID;
  BOOL v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  recipeID = self->_recipeID;
  v7 = recipeID - 65937 > 0xE || ((1 << (recipeID + 111)) & 0x4AD3) == 0;
  if (!v7 || ((v8 = recipeID - 65737, v9 = v8 > 8, v10 = (1 << v8) & 0x155, !v9) ? (v11 = v10 == 0) : (v11 = 1), !v11))
  {
    +[PLResourceGenerator fileAndTableBackedThumbnailManagerRecipesForLibraryID:](PLResourceGenerator, "fileAndTableBackedThumbnailManagerRecipesForLibraryID:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionOrderedSet:", v12);

  }
  return v5;
}

- (id)_mediaConversionServiceOptionsForAsset:(id)a3 url:(id)a4 conversionServiceOptions:(id)a5 adjustmentData:(id)a6 largeAdjustmentData:(id)a7 isHighPriority:(BOOL)a8 reason:(id)a9
{
  PLPrimaryResourceDataStoreImageRecipe *v15;
  PLPrimaryResourceDataStoreImageRecipe *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PLPrimaryResourceDataStoreImageRecipe *v29;
  NSObject *v30;
  unsigned int recipeID;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  id v47;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  PLPrimaryResourceDataStoreImageRecipe *v76;
  PLPrimaryResourceDataStoreImageRecipe *v77;
  _BOOL4 v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  uint8_t buf[4];
  PLPrimaryResourceDataStoreImageRecipe *v87;
  __int16 v88;
  PLPrimaryResourceDataStoreImageRecipe *v89;
  uint64_t v90;

  v78 = a8;
  v90 = *MEMORY[0x1E0C80C00];
  v15 = (PLPrimaryResourceDataStoreImageRecipe *)a3;
  v16 = (PLPrimaryResourceDataStoreImageRecipe *)a4;
  v17 = a5;
  v80 = a6;
  v79 = a7;
  v18 = (void *)MEMORY[0x1E0C99E08];
  v19 = a9;
  objc_msgSend(v18, "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17)
    objc_msgSend(v20, "addEntriesFromDictionary:", v17);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47CE0]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D47D78]);

  -[PLPrimaryResourceDataStoreImageRecipe uniformTypeIdentifier](v15, "uniformTypeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v87 = v15;
      v88 = 2112;
      v89 = v16;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Unable to determine type identifier for asset %{public}@, URL = %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D75130], "typeRequiresRasterizationDPI:", v24))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0D75130], "defaultRasterizationDPI"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D47D70]);

  }
  if (v16
    && -[PLPrimaryResourceDataStoreImageRecipe isRAW](v15, "isRAW")
    && (PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v15) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0D75130];
    -[PLPrimaryResourceDataStoreImageRecipe metadataFromMediaPropertiesOrOriginalResource](v15, "metadataFromMediaPropertiesOrOriginalResource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    v76 = v16;
    objc_msgSend(v26, "hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:metadata:error:", v16, v27, &v81);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (PLPrimaryResourceDataStoreImageRecipe *)v81;

    if (v28)
    {
      if (objc_msgSend(v28, "BOOLValue"))
        objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47D90]);
    }
    else
    {
      PLBackendGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v87 = v76;
        v88 = 2112;
        v89 = v29;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Failed to query image properties of input URL %@. Error: %@", buf, 0x16u);
      }

    }
    v16 = v76;
  }
  recipeID = self->_recipeID;
  if (recipeID - 65937 > 0xE)
    goto LABEL_27;
  if (((1 << (recipeID + 111)) & 0x4AD1) != 0)
  {
LABEL_28:
    v41 = (void *)MEMORY[0x1E0C99DA0];
    v42 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "raise:format:", v42, CFSTR("%@ not yet implemented for recipe: %@"), v43, self);
LABEL_29:

    goto LABEL_30;
  }
  if (recipeID != 65938)
  {
LABEL_27:
    switch(recipeID)
    {
      case 0x100C9u:
        objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E375D218, *MEMORY[0x1E0D47CF8]);
        if (v78)
          v49 = 4;
        else
          v49 = 2;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D47D30]);

        objc_msgSend(MEMORY[0x1E0D47C00], "standardPolicy");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0D47D48]);

        objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E3764328, *MEMORY[0x1E0D47D88]);
        break;
      case 0x100CAu:
      case 0x100CCu:
      case 0x100CEu:
      case 0x100D0u:
      case 0x100D2u:
      case 0x100D4u:
        goto LABEL_30;
      case 0x100CBu:
      case 0x100CFu:
      case 0x100D1u:
      case 0x100D5u:
        goto LABEL_28;
      case 0x100CDu:
        objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E375D218, *MEMORY[0x1E0D47CF8]);
        if (v78)
          v52 = 4;
        else
          v52 = 2;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D47D30]);

        objc_msgSend(MEMORY[0x1E0D47C28], "standardPolicy");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D47D48]);

        -[PLPrimaryResourceDataStoreImageRecipe maxPixelCountForAssetWidth:height:](self, "maxPixelCountForAssetWidth:height:", -[PLPrimaryResourceDataStoreImageRecipe width](v15, "width"), -[PLPrimaryResourceDataStoreImageRecipe height](v15, "height"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0D47D40]);

        break;
      case 0x100D3u:
        objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E375D218, *MEMORY[0x1E0D47CF8]);
        v56 = (void *)MEMORY[0x1E0C99DA0];
        v57 = *MEMORY[0x1E0C99768];
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "raise:format:", v57, CFSTR("%@ not supported for generation on this platform for recipe: %@"), v43, self);
        goto LABEL_29;
      default:
        if (recipeID == 66137)
          goto LABEL_28;
        break;
    }
    goto LABEL_30;
  }
  objc_msgSend(v80, "adjustmentDictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
  {
    v74 = 0;
    v37 = 0;
    v39 = 0;
    v40 = v78;
    goto LABEL_46;
  }
  objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v35, "isEqual:", CFSTR("com.apple.photos")) & 1) == 0)
  {
    v75 = v34;
    v61 = v35;
    v62 = v33;
    PLBackendGetLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v87 = self;
      _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_ERROR, "This adjustment data cannot be processed by Photos. Recipe: %@", buf, 0xCu);
    }

    v33 = v62;
    v35 = v61;
    v64 = v75;
    goto LABEL_55;
  }
  if (!v34)
  {
    if (v79)
    {
      v65 = v35;
      v72 = v33;
      v77 = v16;
      v66 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v79, "fileURL");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "path");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "dataWithContentsOfFile:", v68);
      v69 = objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        v70 = *MEMORY[0x1E0D47C80];
        v82[0] = *MEMORY[0x1E0D47C78];
        v82[1] = v70;
        v74 = (void *)v69;
        v83[0] = v69;
        v83[1] = v65;
        v35 = v65;
        v82[2] = *MEMORY[0x1E0D47C88];
        v37 = v73;
        v83[2] = v73;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v77;
        goto LABEL_26;
      }
      PLBackendGetLog();
      v71 = objc_claimAutoreleasedReturnValue();
      v16 = v77;
      v35 = v65;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v87 = self;
        _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_ERROR, "AdjustmentDataBlob could not be retrieved for recipe: %@", buf, 0xCu);
      }
      v64 = v71;
      v33 = v72;
    }
    else
    {
      PLBackendGetLog();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v87 = self;
        _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_ERROR, "Cannot retrieve any adjustment data for recipe: %@", buf, 0xCu);
      }
    }
LABEL_55:

    v47 = 0;
    goto LABEL_33;
  }
  v72 = v33;
  v36 = *MEMORY[0x1E0D47C80];
  v84[0] = *MEMORY[0x1E0D47C78];
  v84[1] = v36;
  v74 = (void *)v34;
  v85[0] = v34;
  v85[1] = v35;
  v84[2] = *MEMORY[0x1E0D47C88];
  v37 = v73;
  v85[2] = v73;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
  v39 = v35;
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D47CD0]);

  v40 = v78;
  v33 = v72;
LABEL_46:
  if (v40)
    v58 = 4;
  else
    v58 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0D47D30]);

  if (!-[PLPrimaryResourceDataStoreImageRecipe kind](v15, "kind"))
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E375D230, *MEMORY[0x1E0D47D88]);
    objc_msgSend(MEMORY[0x1E0D47C08], "standardPolicy");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0D47D48]);

  }
LABEL_30:
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D47D80]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "BOOLValue");

  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPrimaryResourceDataStoreImageRecipe isPhoto](v15, "isPhoto"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0D47CF0]);

  }
  v47 = v21;
LABEL_33:

  return v47;
}

- (BOOL)_storeResourceWithType:(unsigned int)a3 version:(unsigned int)a4 asset:(id)a5 destURL:(id)a6 error:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v27;
  id v28;
  id v29;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  objc_msgSend(a6, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "width");
  v15 = objc_msgSend(v12, "height");
  LOWORD(v27) = objc_msgSend(v12, "kind");
  +[PLResourceInstaller generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:](PLResourceInstaller, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", v10, v13, 1, v9, v14, v15, self, v27, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[PLResourceRecipe recipeErrorWithCode:version:underlyingError:debugDescription:](self, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47010, v9, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = 0;
    if (!a7)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (objc_msgSend(v12, "bundleScope") == 3)
  {
    +[PLValidatedExternalResource resourceWithExternalResource:](PLSyndicationValidatedExternalResource, "resourceWithExternalResource:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = 3;
    v16 = (void *)v17;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v12, "assetID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "libraryID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(v18, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29 = 0;
  v20 = objc_msgSend(v23, "storeExternalResource:forAsset:options:error:resultingResource:", v16, v12, 0, &v29, &v28);
  v24 = v29;
  v25 = v28;
  if (v20)
  {
    objc_msgSend(v12, "recalculateImageRequestHints");
    v19 = 0;
  }
  else
  {
    -[PLResourceRecipe recipeErrorWithCode:version:underlyingError:debugDescription:](self, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47009, v9, v24, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a7)
LABEL_11:
    *a7 = objc_retainAutorelease(v19);
LABEL_12:

  return v20;
}

- (void)_generateAndStoreUsingMediaConversionServicesForAsset:(id)a3 version:(unsigned int)a4 conversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 isHighPriority:(BOOL)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v14;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  _BOOL4 v71;
  int v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint8_t buf[16];
  _QWORD v90[4];
  id v91;
  PLPrimaryResourceDataStoreImageRecipe *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  int v99;
  char v100;
  _QWORD v101[4];
  id v102;
  PLPrimaryResourceDataStoreImageRecipe *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  int v108;
  uint64_t v109;
  _QWORD v110[3];

  v71 = a8;
  v14 = *(_QWORD *)&a4;
  v110[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v79 = a5;
  v76 = a6;
  v17 = a7;
  v84 = a10;
  v75 = a11;
  objc_msgSend(v16, "assetID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "libraryID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPrimaryResourceDataStoreImageRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v19, "containsObject:", v20);

  if (!(_DWORD)a5)
  {
    v24 = v17;
    v74 = 0;
    v83 = 0;
    v86 = 0;
    v87 = 0;
    v25 = 47004;
LABEL_11:
    -[PLResourceRecipe recipeErrorWithCode:version:underlyingError:debugDescription:](self, "recipeErrorWithCode:version:underlyingError:debugDescription:", v25, v14, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v22 = 0;
    v27 = 0;
    goto LABEL_12;
  }
  -[PLPrimaryResourceDataStoreImageRecipe chooseIngredientsFrom:version:](self, "chooseIngredientsFrom:version:", v16, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Image"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("VideoComplement"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Video"));
  v23 = objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v14 == 2 || (_DWORD)v14 == 3 && objc_msgSend(v16, "hasAdjustments"))
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Adjustment"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("LargeAdjustment"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
    v86 = 0;
  }
  v74 = v21;
  v24 = v17;
  if (!(v22 | v23))
  {
    v25 = 47003;
    goto LABEL_11;
  }
  v26 = 0;
  v27 = 1;
LABEL_12:
  -[PLPrimaryResourceDataStoreImageRecipe uti](self, "uti");
  v28 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v22;
  objc_msgSend((id)v22, "dataStoreKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fileURLForAssetID:", v30);
  v88 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v87, "dataStoreKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "fileURLForAssetID:", v32);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = (void *)v23;
  objc_msgSend((id)v23, "dataStoreKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "fileURLForAssetID:", v34);
  v35 = objc_claimAutoreleasedReturnValue();

  -[PLPrimaryResourceDataStoreImageRecipe expectedFileURLForVersion:asset:](self, "expectedFileURLForVersion:asset:", v14, v16);
  v36 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v28;
  v81 = (void *)v36;
  if (!v28 || !(v88 | v35) || !v36)
  {
    -[PLResourceRecipe recipeErrorWithCode:version:underlyingError:debugDescription:](self, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47006, v14, 0, 0);
    v37 = objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v26 = (void *)v37;
  }
  v38 = objc_msgSend(v16, "hasAdjustments");
  v85 = (void *)v35;
  if ((_DWORD)v14 == 2)
  {
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_recipeID);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(&unk_1E3763140, "containsObject:", v39);

      if (v40)
      {
        if (!v86)
        {
          -[PLResourceRecipe recipeErrorWithCode:version:underlyingError:debugDescription:](self, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47015, 2, 0, 0);
          v41 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v41;
          v42 = v79;
          if (!v79)
            goto LABEL_28;
          goto LABEL_29;
        }
      }
    }
  }
  v42 = v79;
  if (!v79)
  {
LABEL_28:
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0D74498];
    v109 = *MEMORY[0x1E0CB2D50];
    v110[0] = CFSTR("conversionClient is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, 47001, v52);
    v53 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v53;
    goto LABEL_29;
  }
  if (v27)
  {
    objc_msgSend(v16, "managedObjectContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v24;
    -[PLPrimaryResourceDataStoreImageRecipe _mediaConversionServiceOptionsForAsset:url:conversionServiceOptions:adjustmentData:largeAdjustmentData:isHighPriority:reason:](self, "_mediaConversionServiceOptionsForAsset:url:conversionServiceOptions:adjustmentData:largeAdjustmentData:isHighPriority:reason:", v16, v88, v24, v86, v83, v71, v84);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (!v45)
    {
      PLBackendGetLog();
      v57 = objc_claimAutoreleasedReturnValue();
      v56 = v74;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Failed to run the conversion service because options were nil.", buf, 2u);
      }

      -[PLResourceRecipe recipeErrorWithCode:version:underlyingError:debugDescription:](self, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, v14, 0, 0);
      v58 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v59 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v75;
      (*((void (**)(id, _QWORD, uint64_t, uint64_t, void *, _QWORD))v75 + 2))(v75, 0, v58, v59, v60, 0);

      v61 = (void *)v59;
      v26 = (void *)v58;
      v55 = v76;
      goto LABEL_41;
    }
    objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D47D80]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "BOOLValue");

    v49 = (void *)v88;
    v72 = v48;
    if (!v48 || v88)
    {
      if (v85 && !v88)
      {
        v101[0] = MEMORY[0x1E0C809B0];
        v101[1] = 3221225472;
        v101[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke;
        v101[3] = &unk_1E3660270;
        v102 = v16;
        v107 = v75;
        v103 = self;
        v54 = v75;
        v108 = v14;
        v104 = v43;
        v105 = v81;
        v106 = v82;
        v55 = v76;
        objc_msgSend(v76, "extractStillImageFromVideoAtSourceURL:toDestinationURL:options:completionHandler:", v85, v105, v46, v101);

        v88 = 0;
        v61 = v102;
LABEL_40:
        v56 = v74;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      v49 = v85;
      v85 = 0;
    }
    v70 = v44;
    v62 = (void *)objc_opt_new();
    v88 = (uint64_t)v49;
    v69 = *MEMORY[0x1E0D47C68];
    objc_msgSend(v62, "setResourceURL:forRole:", v49);
    if (v72 && v80)
      objc_msgSend(v62, "setResourceURL:forRole:", v80, *MEMORY[0x1E0D47C70]);
    objc_msgSend(v16, "pathManager");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "pathExtension");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "temporaryRenderContentURLForInternalRendersWithExtension:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = (void *)objc_opt_new();
    objc_msgSend(v66, "setResourceURL:forRole:deleteOnDeallocation:", v65, v69, 1);
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2;
    v90[3] = &unk_1E36602C0;
    v91 = v43;
    v98 = v75;
    v99 = v14;
    v92 = self;
    v93 = v66;
    v54 = v75;
    v94 = v81;
    v95 = v65;
    v96 = v16;
    v97 = v82;
    v100 = v72;
    v67 = v65;
    v68 = v66;
    v42 = v79;
    objc_msgSend(v79, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v62, v68, v46, v90);

    v61 = v62;
    v55 = v76;
    v44 = v70;
    goto LABEL_40;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v75;
  (*((void (**)(id, _QWORD, void *, void *, void *, _QWORD))v75 + 2))(v75, 0, v26, v43, v46, 0);
  v55 = v76;
  v44 = v24;
  v56 = v74;
LABEL_42:

}

- (PLPrimaryResourceDataStoreImageRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3;
  PLPrimaryResourceDataStoreImageRecipe *v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreImageRecipe;
  v5 = -[PLPrimaryResourceDataStoreImageRecipe init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "classFromRecipeID:", v3);
    if (v6 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PLPrimaryResourceDataStoreImageRecipe.m"), 494, CFSTR("wrong recipe class passed to recipe initializer."));

    }
    v5->_recipeID = v3;
  }
  return v5;
}

- (id)uti
{
  return +[PLUniformTypeIdentifier jpegUniformTypeIdentifier](PLUniformTypeIdentifier, "jpegUniformTypeIdentifier");
}

- (BOOL)colorSpaceIsNativeForDisplay
{
  return 1;
}

- (BOOL)isMarkedFullSize
{
  BOOL result;
  signed int recipeID;
  BOOL v5;
  unsigned __int16 v6;
  int v7;

  result = 0;
  recipeID = self->_recipeID;
  if (recipeID <= 65937)
  {
    v5 = recipeID == 65737;
    v6 = 213;
  }
  else
  {
    v5 = recipeID == 65938 || recipeID == 66137;
    v6 = 408;
  }
  v7 = v6 | 0x10000;
  if (v5 || recipeID == v7)
    return 1;
  return result;
}

- (id)codecFourCharCodeName
{
  return 0;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  unsigned int recipeID;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  recipeID = self->_recipeID;
  if (recipeID - 65937 <= 0xE && ((1 << (recipeID + 111)) & 0x4AD3) != 0)
    goto LABEL_8;
  if (recipeID - 65737 > 0xC)
  {
LABEL_13:
    if (recipeID != 66137)
    {
      v11 = 0;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (((1 << (recipeID + 55)) & 0x1455) == 0)
  {
    if (recipeID == 65745)
    {
      +[PLColorSpace commonColorSpace_sRGB](PLColorSpace, "commonColorSpace_sRGB");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_8:
  v10 = v6;
LABEL_9:
  v11 = v10;
LABEL_10:

  return v11;
}

- (id)maxPixelCountForAssetWidth:(int64_t)a3 height:(int64_t)a4
{
  void *v5;
  signed int recipeID;

  v5 = 0;
  recipeID = self->_recipeID;
  if (recipeID <= 65748)
  {
    if (recipeID != 65737)
    {
      if (recipeID == 65741)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", 4, a4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (recipeID == 65747)
      {
        v5 = &unk_1E375D260;
      }
      return v5;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4 * a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (recipeID == 65749 || recipeID == 65944 || recipeID == 65938)
    goto LABEL_14;
  return v5;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  unsigned int recipeID;

  recipeID = self->_recipeID;
  switch(recipeID)
  {
    case 0x10192u:
      return &unk_1E3763170;
    case 0x100CDu:
      return &unk_1E3763188;
    case 0x100C9u:
      return &unk_1E3763158;
  }
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  signed int recipeID;
  void *v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  int v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  BOOL (*v46)(id *, void *);
  void *v47;
  NSObject *v48;
  id v49;
  PLPrimaryResourceDataStoreImageRecipe *v50;
  _QWORD v51[4];
  int v52;
  int v53;
  uint8_t buf[4];
  NSObject *v55;
  uint64_t v56;

  v4 = *(_QWORD *)&a4;
  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPrimaryResourceDataStoreImageRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (!v9)
  {
    v16 = 0;
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  recipeID = self->_recipeID;
  if (recipeID > 65746)
  {
    if (recipeID != 65747)
    {
      if (recipeID == 65938)
        -[PLResourceRecipe populateAdjustedRecipeIngredients:asset:version:](self, "populateAdjustedRecipeIngredients:asset:version:", v10, v6, v4);
      goto LABEL_60;
    }
    -[PLPrimaryResourceDataStoreImageRecipe maxPixelCountForAssetWidth:height:](self, "maxPixelCountForAssetWidth:height:", objc_msgSend(v6, "width"), objc_msgSend(v6, "height"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_59;
    if (objc_msgSend(v6, "isVideo")
      && objc_msgSend(v6, "isVideoKeyFrameSet")
      && objc_msgSend(v6, "isLocalVideoKeyFrameValid"))
    {
      PLBackendGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Media analysis video detected, choosing local video key frame for 1K generation", buf, 2u);
      }

      objc_msgSend(v6, "localVideoKeyFrameResource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isLocallyAvailable") & 1) == 0)
      {

        v18 = 0;
        goto LABEL_58;
      }
      objc_msgSend(v6, "localVideoKeyFrameResource");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Choosing source image for 1K generation", buf, 2u);
      }

      objc_msgSend(v6, "resourcesSortedByQuality");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3880];
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke_77;
      v47 = &unk_1E36602E8;
      v48 = v14;
      v49 = v6;
      v50 = self;
      objc_msgSend(v24, "predicateWithBlock:", &v44);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "filteredArrayUsingPredicate:", v25, v44, v45, v46, v47);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v18 = objc_claimAutoreleasedReturnValue();

      v21 = v48;
    }

    if (v18)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("Image"));
    goto LABEL_58;
  }
  if (recipeID == 65737)
  {
    if (objc_msgSend(v6, "isRAWPlusJPEGWithRAWOnTop"))
      v17 = 4;
    else
      v17 = 0;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke;
    v51[3] = &__block_descriptor_40_e28_B16__0__PLInternalResource_8l;
    v52 = v17;
    v53 = v4;
    objc_msgSend(v6, "firstPersistedResourceMatching:", v51);
    v14 = objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v55 = v14;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Resource generation selected image resource for primary image recipe: %@", buf, 0xCu);
      }

      goto LABEL_21;
    }
    if (v19)
    {
      *(_WORD *)buf = 0;
      v27 = "Resource generation failed to find image for primary image recipe";
      v28 = v18;
      v29 = OS_LOG_TYPE_DEBUG;
      v30 = 2;
LABEL_57:
      _os_log_impl(&dword_199541000, v28, v29, v27, buf, v30);
    }
LABEL_58:

    goto LABEL_59;
  }
  if (recipeID != 65741 || objc_msgSend(v6, "bundleScope") != 3)
    goto LABEL_60;
  if (!objc_msgSend(v6, "kind"))
  {
    v31 = objc_msgSend(v6, "isPhotoIris");
    objc_msgSend(v6, "syndicationOriginalResource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isLocallyAvailable");
    v34 = v33;
    if (v31)
    {
      if ((v33 & 1) != 0)
      {
        objc_msgSend(v6, "syndicationOriginalVideoComplementResource");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isLocallyAvailable");

        if (v36)
        {
          objc_msgSend(v6, "syndicationOriginalResource");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v37, CFSTR("Image"));

          objc_msgSend(v6, "syndicationOriginalVideoComplementResource");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = CFSTR("VideoComplement");
          goto LABEL_22;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "syndicationOriginalResource");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isLocallyAvailable");

      if ((v39 & 1) != 0)
      {
        objc_msgSend(v6, "syndicationOriginalVideoComplementResource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isLocallyAvailable");

        if ((v41 & 1) != 0)
          goto LABEL_60;
        PLSyndicationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        objc_msgSend(v6, "uuid");
        v18 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v18;
        v27 = "[resource.recipe] syndication live photo (%{public}@) missing local video complement resource for derivative generation";
      }
      else
      {
        PLSyndicationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        objc_msgSend(v6, "uuid");
        v18 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v18;
        v27 = "[resource.recipe] syndication live photo (%{public}@) missing local image resource for derivative generation";
      }
LABEL_56:
      v28 = v14;
      v29 = OS_LOG_TYPE_ERROR;
      v30 = 12;
      goto LABEL_57;
    }

    if (!v34)
    {
      PLSyndicationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_59;
      objc_msgSend(v6, "uuid");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v18;
      v27 = "[resource.recipe] syndication photo (%{public}@) missing local image resource for derivative generation";
      goto LABEL_56;
    }
    objc_msgSend(v6, "syndicationOriginalResource");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v15 = CFSTR("Image");
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "kind") == 1)
  {
    objc_msgSend(v6, "syndicationOriginalResource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isLocallyAvailable");

    if (v13)
    {
      objc_msgSend(v6, "syndicationOriginalResource");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("Video");
LABEL_22:
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v15);
LABEL_59:

      goto LABEL_60;
    }
    PLSyndicationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    objc_msgSend(v6, "uuid");
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v18;
    v27 = "[resource.recipe] syndication video (%{public}@) missing local video resource for derivative generation";
    goto LABEL_56;
  }
LABEL_60:
  if (objc_msgSend(v10, "count"))
    v42 = v10;
  else
    v42 = 0;
  v16 = v42;

LABEL_64:
  return v16;
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  signed int recipeID;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  recipeID = self->_recipeID;
  if (recipeID <= 65748)
  {
    if (recipeID == 65737)
    {
      objc_msgSend(v6, "pathForNonAdjustedFullsizeImageFile");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
      if (recipeID != 65741)
        goto LABEL_18;
      if (a3 == 2)
        objc_msgSend(v6, "pathForAdjustedLargeThumbnailFile");
      else
        objc_msgSend(v6, "pathForNonAdjustedLargeThumbnailFile");
      v11 = objc_claimAutoreleasedReturnValue();
    }
  }
  else if (recipeID == 65749)
  {
    objc_msgSend(v6, "pathForLocalVideoKeyFrame");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (recipeID == 65938)
  {
    objc_msgSend(v6, "pathForAdjustedFullsizeImageFile");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    if (recipeID != 66137)
      goto LABEL_18;
    objc_msgSend(v6, "pathForAlchemistImage");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v11;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_18:

  return v10;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  -[PLPrimaryResourceDataStoreImageRecipe _generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:videoConversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:](self, "_generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:videoConversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:", a3, *(_QWORD *)&a4, a5, a6, a7, 0);
}

- (void)generateAndStoreForAssetWithPriority:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8 progress:(id *)a9 completion:(id)a10
{
  -[PLPrimaryResourceDataStoreImageRecipe _generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:videoConversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:](self, "_generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:videoConversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:", a3, *(_QWORD *)&a4, a5, a6, 0, a7, a9, a8, a10);
}

- (id)expectedSizeFromWidth:(int64_t)a3 height:(int64_t)a4
{
  void *v4;

  if (-[PLPrimaryResourceDataStoreImageRecipe recipeID](self, "recipeID") == 65747)
  {
    PFScaleFactorForMaximumPixelCount();
    DCIM_NSValueFromCGSize();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)description
{
  return PLResourceRecipeIDDescription(self->_recipeID, 1);
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

uint64_t __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "isLocallyAvailable")
    && objc_msgSend(v3, "resourceType") == *(_DWORD *)(a1 + 32)
    && objc_msgSend(v3, "version") == *(_DWORD *)(a1 + 36))
  {
    v4 = objc_msgSend(v3, "isDerivative") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke_77(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  _BOOL8 v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "unorientedWidth");
  v5 = objc_msgSend(v3, "unorientedHeight");
  v6 = objc_msgSend(a1[4], "longLongValue");
  if (objc_msgSend(a1[5], "hasAdjustments"))
    v7 = 2;
  else
    v7 = 0;
  v8 = !objc_msgSend(a1[5], "isRAWPlusJPEGWithRAWOnTop")
    || (objc_msgSend(v3, "isDerivative") & 1) != 0
    || objc_msgSend(v3, "resourceType") != 0;
  if ((int)objc_msgSend(v3, "localAvailability") < 1
    || objc_msgSend(v3, "resourceType")
    || objc_msgSend(v3, "version") != v7)
  {
    v12 = 0;
  }
  else
  {
    v9 = v5 * v4;
    v10 = objc_msgSend(v3, "recipeID");
    v12 = v10 != objc_msgSend(a1[6], "recipeID") && v9 > v6 && v8;
  }

  return v12;
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int8x16_t v16;
  _QWORD v17[4];
  int8x16_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_49;
    v17[3] = &unk_1E3660248;
    v24 = a2;
    v25 = *(_DWORD *)(a1 + 80);
    v16 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v16.i64[0];
    v18 = vextq_s8(v16, v16, 8uLL);
    v19 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 64);
    v21 = v6;
    v23 = *(id *)(a1 + 72);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v8, "asyncPerformOnContext:identifyingBlock:block:", v9, 0, v17);

  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "asset managed object context is nil, cannot complete storing generated resource", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47001, *(unsigned int *)(a1 + 80), 0, CFSTR("asset managed object context is nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *, void *, _QWORD))(v12 + 16))(v12, 0, v13, v14, v15, 0);

  }
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  int v30;
  char v31;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_54;
    v18[3] = &unk_1E3660298;
    v19 = *(id *)(a1 + 48);
    v29 = a2;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 40);
    v20 = v11;
    v21 = v12;
    v30 = *(_DWORD *)(a1 + 96);
    v22 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 64);
    v24 = *(id *)(a1 + 72);
    v25 = *(id *)(a1 + 80);
    v31 = *(_BYTE *)(a1 + 100);
    v26 = v7;
    v28 = *(id *)(a1 + 88);
    v27 = *(id *)(a1 + 32);
    objc_msgSend(v9, "asyncPerformOnContext:identifyingBlock:block:", v10, 0, v18);

    v13 = v19;
  }
  else
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "asset managed object context is nil, cannot complete storing generated resource", buf, 2u);
    }

    v15 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 40), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47001, *(unsigned int *)(a1 + 96), 0, CFSTR("asset managed object context is nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *, void *, _QWORD))(v15 + 16))(v15, 0, v13, v16, v17, 0);

  }
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_54(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;
  char v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 112) == 1)
  {
    objc_msgSend(*(id *)(a1 + 56), "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v63);
    v8 = v63;

    if ((v7 & 1) == 0)
    {
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v65 = v5;
        v66 = 2112;
        v67 = v8;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset finished but failed to ensure dest dir exists %@ with error: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, *(unsigned int *)(a1 + 120), v8, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_38;
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v62 = 0;
    v12 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v10, v11, &v62);
    v13 = v62;

    if ((v12 & 1) != 0)
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 64), "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v15;
        v66 = 2112;
        v67 = v16;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "_generateAndStoreUsingMediaConversionServicesForAsset moved render from temporary path %@ to dest path %@", buf, 0x16u);

      }
      v17 = 0;
LABEL_29:
      v43 = v17;
      v44 = *(unsigned int *)(a1 + 120);
      v45 = *(_QWORD *)(a1 + 72);
      v46 = *(void **)(a1 + 48);
      v47 = *(_QWORD *)(a1 + 56);
      v58 = v17;
      v48 = objc_msgSend(v46, "_storeResourceWithType:version:asset:destURL:error:", 0, v44, v45, v47, &v58);
      v17 = v58;

      if (v48)
      {
        objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 48), "_resourceGenerationAffectsRecipesForLibraryID:", *(_QWORD *)(a1 + 80));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionOrderedSet:", v49);

        if (*(_BYTE *)(a1 + 124))
        {
          v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v50 = *MEMORY[0x1E0D47C90];
          objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", *MEMORY[0x1E0D47C90]);
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = (void *)v51;
          if (v50 && v51)
            objc_msgSend(v20, "setObject:forKey:", v51, v50);

          v53 = *MEMORY[0x1E0D47C98];
          objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", *MEMORY[0x1E0D47C98]);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)v54;
          if (v53 && v54)
            objc_msgSend(v20, "setObject:forKey:", v54, v53);

        }
        else
        {
          v20 = 0;
        }
      }
      else
      {
        PLBackendGetLog();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset store resource failed", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, *(unsigned int *)(a1 + 120), 0, CFSTR("Store failed"));
        v57 = objc_claimAutoreleasedReturnValue();

        v20 = 0;
        v17 = (id)v57;
      }
      goto LABEL_43;
    }
    v22 = PLIsErrorOrUnderlyingErrorFileExists();
    if (!v22)
    {
      PLBackendGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 64), "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v65 = v35;
        v66 = 2112;
        v67 = v36;
        v68 = 2112;
        v69 = v13;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset finished but failed to move render from temporary path %@ to dest path %@ with error: %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, *(unsigned int *)(a1 + 120), v13, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(a1 + 64);
      v59 = 0;
      v39 = objc_msgSend(v37, "removeItemAtURL:error:", v38, &v59);
      v40 = v59;

      if ((v39 & 1) == 0)
      {
        PLBackendGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 64), "path");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v42;
          v66 = 2112;
          v67 = v13;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset failed to remove file at temporary path %@ with error: %@", buf, 0x16u);

        }
      }

      if (v22)
        goto LABEL_29;
LABEL_38:
      v20 = 0;
      goto LABEL_43;
    }
    v23 = *(void **)(a1 + 56);
    v61 = 0;
    v24 = *MEMORY[0x1E0C99998];
    v60 = 0;
    v25 = objc_msgSend(v23, "getResourceValue:forKey:error:", &v61, v24, &v60);
    v26 = v61;
    v27 = v60;
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if ((v25 & 1) != 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 56), "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v30;
        v66 = 2112;
        v67 = v27;
        v31 = "_generateAndStoreUsingMediaConversionServicesForAsset finished but file already exists at dest path %@, er"
              "ror retrieving file size: %@";
        v32 = v29;
        v33 = OS_LOG_TYPE_ERROR;
LABEL_22:
        _os_log_impl(&dword_199541000, v32, v33, v31, buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 56), "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v26;
      v66 = 2112;
      v67 = v30;
      v31 = "_generateAndStoreUsingMediaConversionServicesForAsset finished but file of size %{public}@ already exists at dest path %@";
      v32 = v29;
      v33 = OS_LOG_TYPE_INFO;
      goto LABEL_22;
    }

    v17 = 0;
    goto LABEL_24;
  }
  PLBackendGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v65 = v19;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "conversion job failed with error: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, *(unsigned int *)(a1 + 120), *(_QWORD *)(a1 + 40), 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0;
LABEL_43:
  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_49(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 96);
  if (*(_QWORD *)(a1 + 88) == 1)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v11 = 0;
    v8 = objc_msgSend(v4, "_storeResourceWithType:version:asset:destURL:error:", 0, v5, v6, v7, &v11);
    v9 = v11;
    if (v8)
    {
      objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_resourceGenerationAffectsRecipesForLibraryID:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionOrderedSet:", v10);

    }
  }
  else
  {
    objc_msgSend(v4, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, v5, *(_QWORD *)(a1 + 64), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

+ (CGSize)scaleOriginalSize:(CGSize)result toShortSideTarget:(double)a4 maxLongSideLength:(double)a5
{
  double height;
  double v6;
  double width;
  double v8;

  if (result.width >= result.height)
    height = result.height;
  else
    height = result.width;
  if (height > a4)
  {
    v6 = a4 / height;
    result.width = round(result.width * v6);
    result.height = round(result.height * v6);
  }
  if (a5 != 0.0)
  {
    if (result.width >= result.height)
      width = result.width;
    else
      width = result.height;
    if (width > a5)
    {
      v8 = a5 / width;
      result.width = round(result.width * v8);
      result.height = round(result.height * v8);
    }
  }
  return result;
}

+ (CGSize)scaleOriginalSize:(CGSize)result toLongSideTarget:(double)a4
{
  double width;
  double v5;

  if (result.width >= result.height)
    width = result.width;
  else
    width = result.height;
  if (width > a4)
  {
    v5 = a4 / width;
    result.width = result.width * v5;
    result.height = result.height * v5;
  }
  return result;
}

@end
