@implementation PLPrimaryResourceDataStoreVideoRecipe

- (PLPrimaryResourceDataStoreVideoRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3;
  PLPrimaryResourceDataStoreVideoRecipe *v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreVideoRecipe;
  v5 = -[PLPrimaryResourceDataStoreVideoRecipe init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "classFromRecipeID:", v3);
    if (v6 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PLPrimaryResourceDataStoreVideoRecipe.m"), 48, CFSTR("wrong recipe class passed to recipe initializer."));

    }
    v5->_recipeID = v3;
  }
  return v5;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return 0;
}

- (id)codecFourCharCodeName
{
  unsigned int recipeID;
  void *v5;

  recipeID = self->_recipeID;
  if (recipeID - 0x20000 > 9)
  {
LABEL_2:
    if (recipeID - 131272 <= 8 && ((1 << (recipeID + 56)) & 0x1A9) != 0)
      goto LABEL_10;
    if (recipeID != 131475)
      return 0;
LABEL_13:
    +[PLCodec HEVCfourCharCode](PLCodec, "HEVCfourCharCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (((1 << self->_recipeID) & 0x289) == 0)
  {
    if (recipeID == 131077)
      goto LABEL_13;
    goto LABEL_2;
  }
LABEL_10:
  +[PLCodec H264fourCharCode](PLCodec, "H264fourCharCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)uti
{
  void *v2;
  BOOL v3;
  id *v4;
  void *v5;

  v2 = 0;
  v4 = (id *)MEMORY[0x1E0CEC558];
  switch(self->_recipeID)
  {
    case 0x20000u:
    case 0x20005u:
      goto LABEL_10;
    case 0x20001u:
    case 0x20002u:
    case 0x20004u:
    case 0x20006u:
    case 0x20008u:
      goto LABEL_12;
    case 0x20003u:
    case 0x20007u:
    case 0x20009u:
      goto LABEL_11;
    default:
      v3 = (MEMORY[0x1E0CEC558] - 131272) > 8 || ((1 << (MEMORY[0x1E0CEC558] + 56)) & 0x1A9) == 0;
      if (v3 && MEMORY[0x1E0CEC558] != 131475)
        goto LABEL_12;
LABEL_10:
      v4 = (id *)MEMORY[0x1E0CEC5B0];
LABEL_11:
      objc_msgSend(*v4, "identifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
  }
}

- (id)supportedVersionsForLocalResourceGeneration
{
  unsigned int recipeID;

  recipeID = self->_recipeID;
  if (recipeID == 131272 || recipeID == 0x20000)
    return &unk_1E3763F50;
  else
    return (id)MEMORY[0x1E0C9AA60];
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
  if (recipeID > 131271)
  {
    v5 = recipeID == 131280;
    v6 = 200;
  }
  else
  {
    v5 = recipeID == 0x20000;
    v6 = 3;
  }
  v7 = v6 | 0x20000;
  if (v5 || recipeID == v7)
    return 1;
  return result;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int recipeID;
  void *v11;
  id v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PLPrimaryResourceDataStoreVideoRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    recipeID = self->_recipeID;
    if (recipeID == 131272 || recipeID == 0x20000)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLResourceRecipe populateAdjustedRecipeIngredients:asset:version:](self, "populateAdjustedRecipeIngredients:asset:version:", v11, v6, v4);
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v11, "count"))
      v13 = v11;
    else
      v13 = 0;
    v12 = v13;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_mediaConversionServiceOptionsForAsset:(id)a3 conversionServiceOptions:(id)a4 adjustmentData:(id)a5 largeAdjustmentData:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int recipeID;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  PLPrimaryResourceDataStoreVideoRecipe *v49;
  uint64_t v50;

  v9 = a7;
  v50 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v14)
    objc_msgSend(v18, "addEntriesFromDictionary:", v14);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D47D78]);
  recipeID = self->_recipeID;
  if (recipeID - 0x20000 <= 9)
  {
    if (((1 << self->_recipeID) & 0x2A8) != 0)
      goto LABEL_10;
    if (recipeID == 0x20000)
      goto LABEL_15;
  }
  if (recipeID - 131272 > 8)
    goto LABEL_7;
  if (((1 << (recipeID + 56)) & 0x1A8) == 0)
  {
    if (recipeID != 131272)
    {
LABEL_7:
      if (recipeID != 131475)
        goto LABEL_12;
      goto LABEL_10;
    }
LABEL_15:
    objc_msgSend(v15, "adjustmentDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v26;
    if (!v26)
      goto LABEL_11;
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqual:", CFSTR("com.apple.photos")) & 1) == 0)
    {
      PLBackendGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = self;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "This adjustment data cannot be processed by Photos. Recipe: %@", buf, 0xCu);
      }

      goto LABEL_26;
    }
    if (v9)
      v29 = 4;
    else
      v29 = 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D47D30]);

    objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E3760320, *MEMORY[0x1E0D47D88]);
    if (v27)
    {
      v31 = *MEMORY[0x1E0D47C80];
      v46[0] = *MEMORY[0x1E0D47C78];
      v46[1] = v31;
      v47[0] = v27;
      v47[1] = v28;
      v46[2] = *MEMORY[0x1E0D47C88];
      v32 = v43;
      v47[2] = v43;
      v33 = (void *)MEMORY[0x1E0C99D80];
      v34 = v47;
      v35 = v46;
LABEL_22:
      objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D47CD0]);

      goto LABEL_11;
    }
    if (v16)
    {
      v38 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v16, "fileURL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "dataWithContentsOfFile:", v39);
      v27 = objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v40 = *MEMORY[0x1E0D47C80];
        v44[0] = *MEMORY[0x1E0D47C78];
        v44[1] = v40;
        v45[0] = v27;
        v45[1] = v28;
        v44[2] = *MEMORY[0x1E0D47C88];
        v32 = v43;
        v45[2] = v43;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = v45;
        v35 = v44;
        goto LABEL_22;
      }
      PLBackendGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = self;
        v41 = "Adjustment datablob could not be retrieved for recipe: %@";
        goto LABEL_34;
      }
    }
    else
    {
      PLBackendGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = self;
        v41 = "Cannot retrieve any adjustment data for recipe: %@";
LABEL_34:
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
      }
    }
LABEL_26:

    v24 = 0;
    goto LABEL_13;
  }
LABEL_10:
  v21 = (void *)MEMORY[0x1E0C99DA0];
  v22 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "raise:format:", v22, CFSTR("%@ not yet implemented for recipe: %@"), v23, self);
LABEL_11:

LABEL_12:
  v24 = v19;
LABEL_13:

  return v24;
}

- (void)_generateAndStoreUsingMediaConversionServicesForAsset:(id)a3 version:(unsigned int)a4 conversionClient:(id)a5 conversionServiceOptions:(id)a6 isHighPriority:(BOOL)a7 progress:(id *)a8 reason:(id)a9 completion:(id)a10
{
  uint64_t v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void (**v60)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _BOOL4 v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  __int128 v94;
  void *v95;
  _QWORD v96[4];
  id v97;
  id v98;
  PLPrimaryResourceDataStoreVideoRecipe *v99;
  id v100;
  int v101;
  _QWORD v102[3];
  _QWORD v103[3];
  uint64_t v104;
  const __CFString *v105;
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  uint8_t buf[4];
  PLPrimaryResourceDataStoreVideoRecipe *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  void *v117;
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];
  _QWORD v121[6];

  v82 = a7;
  v12 = *(_QWORD *)&a4;
  v121[3] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v91 = a6;
  v88 = a9;
  v83 = a10;
  -[PLPrimaryResourceDataStoreVideoRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "containsObject:", v17);

  v95 = v14;
  v89 = v15;
  if ((v18 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v120[0] = *MEMORY[0x1E0CB2D50];
    NSStringFromPLErrorCode();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v23;
    v121[1] = self;
    v120[1] = CFSTR("recipe");
    v120[2] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 47004, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v85 = 0;
    v87 = 0;
    v93 = 0;
LABEL_14:

    v27 = 0;
    v20 = 0;
    v28 = 0;
    goto LABEL_15;
  }
  -[PLPrimaryResourceDataStoreVideoRecipe chooseIngredientsFrom:version:](self, "chooseIngredientsFrom:version:", v14, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Video"));
  v20 = objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v12 == 2 || (_DWORD)v12 == 3 && objc_msgSend(v14, "hasAdjustments"))
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Adjustment"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("LargeAdjustment"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v87 = 0;
    v93 = 0;
  }
  if (objc_msgSend(v14, "isPhotoIris"))
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VideoComplement"));
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v85 = v19;
  if (!(v20 | v27))
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D74498];
    v118[0] = *MEMORY[0x1E0CB2D50];
    NSStringFromPLErrorCode();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v23;
    v119[1] = self;
    v118[1] = CFSTR("recipe");
    v118[2] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v119[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 47003, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v26 = 0;
  v28 = 1;
LABEL_15:
  -[PLPrimaryResourceDataStoreVideoRecipe uti](self, "uti");
  v31 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v20;
  objc_msgSend((id)v20, "dataStoreKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "assetID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "fileURLForAssetID:", v33);
  *((_QWORD *)&v94 + 1) = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v27, "dataStoreKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "assetID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "fileURLForAssetID:", v35);
  *(_QWORD *)&v94 = objc_claimAutoreleasedReturnValue();

  -[PLPrimaryResourceDataStoreVideoRecipe expectedFileURLForVersion:asset:](self, "expectedFileURLForVersion:asset:", v12, v95);
  v36 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v31;
  v92 = (void *)v36;
  v84 = (void *)v27;
  if (v31 && v94 != 0 && v36)
  {
    v37 = (void *)v26;
    v38 = v89;
  }
  else
  {
    PLBackendGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v26;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v111 = (PLPrimaryResourceDataStoreVideoRecipe *)v31;
      v112 = 2112;
      v113 = *((_QWORD *)&v94 + 1);
      v114 = 2112;
      v115 = v94;
      v116 = 2112;
      v117 = v92;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Unable to generate local resources, targetUTI = %@, sourceURLVideo = %@, sourceURLVideoComplement = %@, destURL = %@", buf, 0x2Au);
    }

    v41 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0D74498];
    v108[0] = *MEMORY[0x1E0CB2D50];
    NSStringFromPLErrorCode();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v43;
    v109[1] = self;
    v108[1] = CFSTR("recipe");
    v108[2] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v109[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 47006, v45);
    v46 = objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v37 = (void *)v46;
    v38 = v89;
  }
  v47 = v95;
  v48 = objc_msgSend(v95, "hasAdjustments");
  if ((_DWORD)v12 == 2)
  {
    if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_recipeID);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(&unk_1E3763F68, "containsObject:", v49);

      if (v50)
      {
        if (!v93)
        {
          v51 = (void *)MEMORY[0x1E0CB35C8];
          v52 = *MEMORY[0x1E0D74498];
          v53 = *MEMORY[0x1E0CB2D50];
          v106[0] = *MEMORY[0x1E0CB2D50];
          NSStringFromPLErrorCode();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v107[0] = v54;
          v107[1] = self;
          v106[1] = CFSTR("recipe");
          v106[2] = CFSTR("version");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v107[2] = v55;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 3);
          v56 = v38;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", v52, 47015, v57);
          v58 = objc_claimAutoreleasedReturnValue();

          v38 = v56;
          v37 = (void *)v58;
          if (v56)
          {
            v59 = v91;
            v60 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v83;
LABEL_36:
            v68 = v84;
            v47 = v95;
LABEL_38:
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
            v63 = (id)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *, void *, id, _QWORD))v60)[2](v60, 0, v37, v61, v63, 0);
            goto LABEL_48;
          }
LABEL_35:
          v59 = v91;
          v60 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v83;
          v65 = (void *)MEMORY[0x1E0CB35C8];
          v104 = v53;
          v105 = CFSTR("conversionClient is nil");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "errorWithDomain:code:userInfo:", v52, 47001, v66);
          v67 = objc_claimAutoreleasedReturnValue();

          v37 = (void *)v67;
          goto LABEL_36;
        }
      }
    }
  }
  if (!v38)
  {
    v52 = *MEMORY[0x1E0D74498];
    v53 = *MEMORY[0x1E0CB2D50];
    goto LABEL_35;
  }
  v59 = v91;
  if (!v28)
  {
    v60 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v83;
    v68 = v84;
    goto LABEL_38;
  }
  v61 = (void *)objc_opt_new();
  v62 = (void *)*((_QWORD *)&v94 + 1);
  if (!v86)
    v62 = (void *)v94;
  v63 = v62;
  if (v63)
  {
    v64 = *MEMORY[0x1E0D47C68];
    objc_msgSend(v61, "setResourceURL:forRole:", v63, *MEMORY[0x1E0D47C68]);
  }
  else
  {
    PLBackendGetLog();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v111 = self;
      _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_ERROR, "Unable to retrieve sourceURL for recipe: %@", buf, 0xCu);
    }

    v64 = *MEMORY[0x1E0D47C68];
  }
  v70 = (void *)objc_opt_new();
  objc_msgSend(v70, "setResourceURL:forRole:", v92, v64);
  -[PLPrimaryResourceDataStoreVideoRecipe _mediaConversionServiceOptionsForAsset:conversionServiceOptions:adjustmentData:largeAdjustmentData:isHighPriority:reason:](self, "_mediaConversionServiceOptionsForAsset:conversionServiceOptions:adjustmentData:largeAdjustmentData:isHighPriority:reason:", v95, v91, v93, v87, v82, v88);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke;
    v96[3] = &unk_1E3673938;
    v97 = v95;
    v101 = v12;
    v98 = v92;
    v99 = self;
    v60 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v83;
    v100 = v83;
    v38 = v89;
    objc_msgSend(v89, "convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v61, v70, v71, v96);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v72 = v97;
  }
  else
  {
    PLBackendGetLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_ERROR, "Failed to run the conversion service because options were nil.", buf, 2u);
    }

    v74 = (void *)MEMORY[0x1E0CB35C8];
    v75 = *MEMORY[0x1E0D74498];
    v102[0] = *MEMORY[0x1E0CB2D50];
    NSStringFromPLErrorCode();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v76;
    v103[1] = self;
    v102[1] = CFSTR("recipe");
    v102[2] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v77;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "errorWithDomain:code:userInfo:", v75, 47007, v78);
    v79 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v83;
    (*((void (**)(id, _QWORD, uint64_t, void *, void *, _QWORD))v83 + 2))(v83, 0, v79, v72, v80, 0);

    v37 = (void *)v79;
    v38 = v89;
    v47 = v95;
    v71 = 0;
  }

  v68 = v84;
  v59 = v91;
LABEL_48:

}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  id v5;
  void *v6;
  unsigned int recipeID;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  recipeID = self->_recipeID;
  if (recipeID != 131272 && recipeID != 0x20000)
  {
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "pathForFullsizeRenderVideoFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  -[PLPrimaryResourceDataStoreVideoRecipe _generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:](self, "_generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:", a3, *(_QWORD *)&a4, a6, a7, 0, a9);
}

- (void)generateAndStoreForAssetWithPriority:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8 progress:(id *)a9 completion:(id)a10
{
  -[PLPrimaryResourceDataStoreVideoRecipe _generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:](self, "_generateAndStoreUsingMediaConversionServicesForAsset:version:conversionClient:conversionServiceOptions:isHighPriority:progress:reason:completion:", a3, *(_QWORD *)&a4, a6, 0, a7, a9);
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

void __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;

  v6 = a4;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2;
  v13[3] = &unk_1E3673910;
  v19 = a2;
  v14 = *(id *)(a1 + 40);
  v20 = *(_DWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v15 = v9;
  v16 = v10;
  v17 = v6;
  v18 = v11;
  v12 = v6;
  objc_msgSend(v7, "asyncPerformOnContext:identifyingBlock:block:", v8, 0, v13);

}

void __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(unsigned int *)(a1 + 80);
    v6 = objc_msgSend(*(id *)(a1 + 40), "width");
    v7 = objc_msgSend(*(id *)(a1 + 40), "height");
    v8 = *(_QWORD *)(a1 + 48);
    LOWORD(v19) = objc_msgSend(*(id *)(a1 + 40), "kind");
    +[PLResourceInstaller generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:](PLResourceInstaller, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 1, v4, 1, v5, v6, v7, v8, v19, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "assetID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "libraryID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLDataStoreForClassIDAndLibraryID(0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *(_QWORD *)(a1 + 40);
      v20 = 0;
      v21 = 0;
      LODWORD(v10) = objc_msgSend(v12, "storeExternalResource:forAsset:options:error:resultingResource:", v9, v13, 0, &v21, &v20);
      v14 = v21;
      v15 = v20;
      if ((_DWORD)v10)
      {
        objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));
        v16 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47009, *(unsigned int *)(a1 + 80), v14, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47010, *(unsigned int *)(a1 + 80), 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "recipeErrorWithCode:version:underlyingError:debugDescription:", 47007, *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 56), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *, void *, _QWORD))(v17 + 16))(v17, v18, v16, v2, v3, 0);

}

@end
