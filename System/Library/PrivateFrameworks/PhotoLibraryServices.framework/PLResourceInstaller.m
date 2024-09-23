@implementation PLResourceInstaller

+ (unint64_t)derivativeCPLTypeFromRecipeID:(unsigned int)a3 version:(unsigned int)a4
{
  void *v8;
  char v9;
  unint64_t result;
  unint64_t v11;
  void *v12;

  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDerivative");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 50, CFSTR("only derivative recipes support mapping to CPL type."));

  }
  if ((int)a3 <= 131274)
  {
    result = 2;
    switch(a3)
    {
      case 0x100C9u:
        return result;
      case 0x100CAu:
      case 0x100CCu:
      case 0x100CEu:
        return 0;
      case 0x100CBu:
        result = 3;
        break;
      case 0x100CDu:
        result = 4;
        break;
      case 0x100CFu:
        result = 5;
        break;
      default:
        switch(a3)
        {
          case 0x20003u:
            result = 16;
            break;
          case 0x20005u:
            result = 21;
            break;
          case 0x20007u:
            return 6;
          case 0x20009u:
            return 7;
          default:
            return 0;
        }
        break;
    }
    return result;
  }
  if ((int)a3 <= 131474)
  {
    if (a3 == 131275)
      return 6;
    if (a3 == 131277)
      return 7;
    return 0;
  }
  if (a3 == 131475)
    return 28;
  if (a3 != 327683)
    return 0;
  v11 = 27;
  if (a4 != 2)
    v11 = 0;
  if (a4)
    return v11;
  else
    return 10;
}

+ (unint64_t)nonDerivativeCPLTypeFromResourceType:(unsigned int)a3 version:(unsigned int)a4 uniformTypeIdentifier:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  _QWORD *v10;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;

  v7 = a5;
  v8 = v7;
  if (a4 == 2)
  {
    if (a3 >= 8)
      goto LABEL_11;
    v10 = &unk_199B9AED8;
LABEL_10:
    v9 = v10[a3];
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    if (a3 >= 4)
      goto LABEL_11;
    v10 = &unk_199B9AF18;
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 0;
  switch(a3)
  {
    case 0u:
    case 1u:
      v9 = 1;
      break;
    case 2u:
      v9 = 8;
      break;
    case 3u:
      v9 = 18;
      break;
    case 4u:
      v9 = 17;
      break;
    case 5u:
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceXMPType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if ((v15 & 1) != 0)
      {
        v9 = 9;
      }
      else
      {
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "isEqualToString:", v18);

        if (v19)
          v9 = 22;
        else
          v9 = 0;
      }
      break;
    case 0xAu:
      v9 = 23;
      break;
    case 0xBu:
      v9 = 24;
      break;
    default:
      break;
  }
LABEL_12:

  return v9;
}

+ (unsigned)recipeIDFromCPLResourceType:(unint64_t)a3 assetType:(signed __int16)a4 fromAdjustedSet:(BOOL)a5
{
  unsigned int result;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;

  result = 0;
  switch(a3)
  {
    case 2uLL:
      v9 = 65737;
      v10 = 65938;
      v11 = !a5;
      goto LABEL_15;
    case 3uLL:
      return 65739;
    case 4uLL:
      return 65741;
    case 5uLL:
      return 65743;
    case 6uLL:
      v12 = 131079;
      v13 = 131275;
      goto LABEL_11;
    case 7uLL:
      v12 = 131081;
      v13 = 131277;
LABEL_11:
      if (a4)
        result = v12;
      else
        result = v13;
      break;
    case 8uLL:
    case 9uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
      return result;
    case 0xAuLL:
    case 0x1BuLL:
      result = 327683;
      break;
    case 0x10uLL:
      v11 = !a5;
      v9 = 131075;
      v10 = 0x20000;
LABEL_15:
      if (v11)
        result = v9;
      else
        result = v10;
      break;
    case 0x13uLL:
      result = 131272;
      break;
    case 0x15uLL:
      result = 131077;
      break;
    case 0x1CuLL:
      result = 131475;
      break;
    default:
      if (a3 == 1000)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1000, a4, a5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 289, CFSTR("Unexpected CPL type: CPLResourceTypeAdjustmentOriginalResource"));

        result = 0;
      }
      break;
  }
  return result;
}

+ (BOOL)_isPenultimateVersionFromCPLType:(unint64_t)a3
{
  return a3 == 15 || a3 == 25 || a3 == 20;
}

+ (void)_recipeAndDerivativeStateFromCPLResourceType:(unint64_t)a3 fromAdjustedSet:(BOOL)a4 assetType:(signed __int16)a5 recipeID:(unsigned int *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void *v12;

  v7 = a5;
  v8 = a4;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outRecipeID"));

  }
  *a6 = objc_msgSend((id)objc_opt_class(), "recipeIDFromCPLResourceType:assetType:fromAdjustedSet:", a3, v7, v8);
}

+ (unsigned)resourceTypeFromCPLType:(unint64_t)a3 assetType:(signed __int16)a4
{
  unsigned int result;
  void *v7;
  unsigned __int16 v8;

  result = 31;
  switch(a3)
  {
    case 1uLL:
      if (a4 >= 3)
        v8 = 31;
      else
        v8 = a4;
      result = v8;
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 0xFuLL:
      result = 0;
      break;
    case 6uLL:
    case 7uLL:
    case 0x10uLL:
    case 0x15uLL:
    case 0x19uLL:
    case 0x1CuLL:
      if (a4)
        result = 1;
      else
        result = 3;
      break;
    case 8uLL:
      result = 2;
      break;
    case 9uLL:
    case 0x16uLL:
      result = 5;
      break;
    case 0xAuLL:
    case 0x1BuLL:
      result = 9;
      break;
    case 0xBuLL:
    case 0xCuLL:
      return result;
    case 0xDuLL:
      result = 6;
      break;
    case 0xEuLL:
      result = 7;
      break;
    case 0x11uLL:
      result = 4;
      break;
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      result = 3;
      break;
    case 0x17uLL:
      result = 10;
      break;
    case 0x18uLL:
      result = 11;
      break;
    case 0x1AuLL:
      result = 13;
      break;
    default:
      if (a3 == 1000)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1000, a4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 417, CFSTR("Unexpected CPL type: CPLResourceTypeAdjustmentOriginalResource"));

        result = 31;
      }
      break;
  }
  return result;
}

+ (void)_applyColorSpaceAndCodecUsingFileToExternalResource:(id)a3 managedObjectContext:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

    if (v7)
    {
      if (objc_msgSend(v10, "resourceType") == 1 || objc_msgSend(v10, "resourceType") == 3)
      {
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "plVideoCodecFourCharCodeString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v10, "setCodecFourCharCode:", v9);

      }
    }
  }

}

+ (void)_applyCodecToNonDerivativeExternalResource:(id)a3 fromCloudMaster:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2477;
  v25 = __Block_byref_object_dispose__2478;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __87__PLResourceInstaller_CPL___applyCodecToNonDerivativeExternalResource_fromCloudMaster___block_invoke;
  v18 = &unk_1E3677C68;
  v20 = &v21;
  v7 = v6;
  v19 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x19AEC174C](&v15);
  if (objc_msgSend(v5, "resourceType", v15, v16, v17, v18) == 1)
  {
    v8[2](v8);
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v22[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "plVideoCodecFourCharCodeString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v5, "setCodecFourCharCode:", v10);

  }
  else
  {
    if (objc_msgSend(v5, "resourceType") != 3)
      goto LABEL_10;
    v11 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v7, "uniformTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC508]);

    if (v14)
      +[PLCodec HEVCfourCharCode](PLCodec, "HEVCfourCharCode");
    else
      +[PLCodec H264fourCharCode](PLCodec, "H264fourCharCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCodecFourCharCode:", v9);
  }

LABEL_10:
  _Block_object_dispose(&v21, 8);

}

+ (id)validatedExternalResourceFromExternalResourceCloudAttributes:(id)a3 cplType:(unint64_t)a4 assetType:(signed __int16)a5 uti:(id)a6 resourceWidth:(unint64_t)a7 resourceHeight:(unint64_t)a8 resourceFingerprint:(id)a9 resourceStableHash:(id)a10 resourceSize:(unint64_t)a11 isAvailable:(BOOL)a12 fromAdjustedSet:(BOOL)a13 resourceURL:(id)a14 cloudMaster:(id)a15 isForMigration:(BOOL)a16 context:(id)a17
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v40;
  unsigned int v44;
  unsigned int v45;

  v44 = a5;
  v20 = a3;
  v21 = a6;
  v22 = a9;
  v23 = a10;
  v24 = a14;
  v25 = a15;
  v26 = a17;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalResourceCloudAttributes"));

  }
  v27 = v20;
  objc_msgSend(v27, "setVersion:", objc_msgSend((id)objc_opt_class(), "resourceVersionFromCPLType:fromAdjustedSet:", a4, a13));
  objc_msgSend(v27, "setResourceType:", objc_msgSend((id)objc_opt_class(), "resourceTypeFromCPLType:assetType:", a4, v44));
  objc_msgSend(v27, "setCplType:", a4);
  if (v21)
  {
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v21);
    v28 = v21;
    v29 = v24;
    v30 = v23;
    v31 = v22;
    v32 = v26;
    v33 = v25;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUniformTypeIdentifier:", v34);

    v25 = v33;
    v26 = v32;
    v22 = v31;
    v23 = v30;
    v24 = v29;
    v21 = v28;
  }
  v45 = 0;
  objc_msgSend(a1, "_recipeAndDerivativeStateFromCPLResourceType:fromAdjustedSet:assetType:recipeID:", a4, a13, v44, &v45);
  objc_msgSend(v27, "setRecipeID:", v45);
  objc_msgSend(v27, "setUnorientedWidth:", a7);
  objc_msgSend(v27, "setUnorientedHeight:", a8);
  objc_msgSend(v27, "setFileURL:", v24);
  objc_msgSend(v27, "setFingerprint:", v22);
  objc_msgSend(v27, "setStableHash:", v23);
  objc_msgSend(v27, "setDataLength:", a11);
  objc_msgSend(v27, "setRemoteAvailability:", a12);
  if (objc_msgSend(v27, "hasRecipe"))
  {
    if (a16)
    {
      if (objc_msgSend(v27, "hasRecipe"))
      {
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", v45);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "codecFourCharCodeName");
        v36 = v26;
        v37 = v25;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setCodecFourCharCode:", v38);

        v25 = v37;
        v26 = v36;

      }
    }
    else
    {
      objc_msgSend(a1, "_applyColorSpaceAndCodecUsingFileToExternalResource:managedObjectContext:", v27, v26);
    }
  }
  else
  {
    objc_msgSend(a1, "_applyCodecToNonDerivativeExternalResource:fromCloudMaster:", v27, v25);
  }

  return v27;
}

+ (BOOL)isValidCPLResourceTypeForPersistence:(unint64_t)a3
{
  return a3 != 1000;
}

+ (unsigned)resourceVersionFromCPLType:(unint64_t)a3 fromAdjustedSet:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  unsigned int v6;

  v4 = a4;
  v5 = objc_msgSend(a1, "_isPenultimateVersionFromCPLType:", a3);
  if (v4)
    v6 = 2;
  else
    v6 = 0;
  if (v5)
    return 1;
  else
    return v6;
}

+ (id)generateExternalResourceFromCPLResource:(id)a3 cloudMaster:(id)a4 masterResources:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLValidatedExternalCloudResource *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int16 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  void *v54;
  PLValidatedExternalCloudResource *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 565, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v10)
      goto LABEL_3;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cloudMaster"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_32;
LABEL_3:
  v56 = a1;
  v12 = objc_alloc_init(PLValidatedExternalCloudResource);
  objc_msgSend(v10, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalCloudResource setMasterDateCreated:](v12, "setMasterDateCreated:", v13);

  v55 = v12;
  -[PLValidatedExternalCloudResource setCloudLocalState:](v12, "setCloudLocalState:", 3);
  objc_msgSend(v10, "uniformTypeIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_5;
  v15 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v10, "originalFilename");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resourceModelTypeForFilenameExtension:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_5:
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "conformsToImage") & 1) != 0)
    {
      v52 = 0;
    }
    else
    {
      if ((objc_msgSend(v19, "conformsToMovie") & 1) != 0)
      {
        v20 = 1;
      }
      else if (objc_msgSend(v19, "conformsToAudio"))
      {
        v20 = 2;
      }
      else
      {
        v20 = 3;
      }
      v52 = v20;
    }

    goto LABEL_14;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v14 = v11;
  v35 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (!v35)
    goto LABEL_30;
  v36 = v35;
  v37 = v10;
  v38 = *(_QWORD *)v58;
LABEL_18:
  v39 = 0;
  while (1)
  {
    if (*(_QWORD *)v58 != v38)
      objc_enumerationMutation(v14);
    v40 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v39);
    if (objc_msgSend(v40, "resourceType") == 1)
      break;
    if (v36 == ++v39)
    {
      v36 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v36)
        goto LABEL_18;
      v52 = 0;
      v10 = v37;
      goto LABEL_14;
    }
  }
  objc_msgSend(v40, "identity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "fileUTI");
  v42 = objc_claimAutoreleasedReturnValue();

  if (v42)
  {

    v14 = (id)v42;
    v10 = v37;
    goto LABEL_5;
  }
  objc_msgSend(v40, "identity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "fileURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "pathExtension");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v37;
  if (!v45)
  {
LABEL_30:
    v52 = 0;
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D752F0], "resourceModelTypeForFilenameExtension:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "identifier");
  v47 = objc_claimAutoreleasedReturnValue();

  v14 = (id)v47;
  if (v47)
    goto LABEL_5;
  v52 = 0;
LABEL_15:
  objc_msgSend(v9, "identity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageDimensions");
  v23 = v22;
  v25 = v24;
  v53 = objc_msgSend(v9, "resourceType");
  objc_msgSend(v21, "fileUTI");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v9;
  objc_msgSend(v21, "fingerPrint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stableHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v21, "fileSize");
  v30 = objc_msgSend(v21, "isAvailable");
  objc_msgSend(v10, "managedObjectContext");
  v31 = v10;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v51) = 0;
  LOWORD(v50) = v30;
  objc_msgSend(v56, "validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:", v55, v53, v52, v26, (unint64_t)v23, (unint64_t)v25, v27, v28, v29, v50, 0, v31, v51, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)generateExternalResourceFromCPLResource:(id)a3 asset:(id)a4 fromAdjustedSet:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  PLValidatedExternalCloudResource *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PLValidatedExternalCloudResource *v44;
  BOOL v45;
  id v46;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 616, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller+CPL.m"), 617, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

LABEL_3:
  v12 = objc_alloc_init(PLValidatedExternalCloudResource);
  objc_msgSend(v11, "master");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v12;
  -[PLValidatedExternalCloudResource setMasterDateCreated:](v12, "setMasterDateCreated:", v14);

  objc_msgSend(v9, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageDimensions");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v15, "fileUTI");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v21 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v15, "fileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pathExtension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resourceModelTypeForFilenameExtension:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "pathForCPLResourceType:adjusted:", objc_msgSend(v9, "resourceType"), v5);
  v25 = objc_claimAutoreleasedReturnValue();
  v46 = a1;
  v45 = v5;
  v43 = (void *)v20;
  v41 = (void *)v25;
  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v25, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  v39 = objc_msgSend(v9, "resourceType");
  v26 = objc_msgSend(v11, "kind");
  objc_msgSend(v15, "fingerPrint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stableHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v15, "fileSize");
  v30 = objc_msgSend(v15, "isAvailable");
  objc_msgSend(v11, "master");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v40 = v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v38) = 0;
  BYTE1(v37) = v45;
  LOBYTE(v37) = v30;
  objc_msgSend(v46, "validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:", v44, v39, v26, v43, (unint64_t)v17, (unint64_t)v19, v27, v28, v29, v37, v42, v31, v38, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

void __87__PLResourceInstaller_CPL___applyCodecToNonDerivativeExternalResource_fromCloudMaster___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaMetadata");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("data"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v7 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v7);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

+ (unint64_t)_getURLDataLength:(id)a3
{
  unint64_t result;
  int v4;
  id v5;

  result = (unint64_t)a3;
  if (a3)
  {
    v5 = 0;
    v4 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99998], 0);
    result = 0;
    if (v4)
      return objc_msgSend(v5, "longLongValue");
  }
  return result;
}

+ (id)_validatedExternalResourceFromSupplementalFileURL:(id)a3 withUTI:(id)a4 ptpTrashedState:(int64_t)a5 index:(id)a6 asset:(id)a7
{
  id v11;
  id v12;
  id v13;
  PLValidatedExternalResource *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PLValidatedExternalResource *v22;
  uint64_t v23;
  uint64_t v25;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = 0;
  if (v11 && a4)
  {
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "conformsToImage"))
    {
      objc_msgSend(v11, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "width");
      v18 = objc_msgSend(v13, "height");
      LOWORD(v25) = objc_msgSend(v13, "kind");
      objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 4, v16, 1, 0, v17, v18, 0, v25, 0);
      v14 = (PLValidatedExternalResource *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(v11, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "fileLengthForFilePath:", v20);

      if (v21 < 1)
      {
        v14 = 0;
      }
      else
      {
        v14 = objc_alloc_init(PLValidatedExternalResource);
        -[PLValidatedExternalResource setVersion:](v14, "setVersion:", 0);
        -[PLValidatedExternalResource setRecipeID:](v14, "setRecipeID:", 0);
        -[PLValidatedExternalResource setFileURL:](v14, "setFileURL:", v11);
        -[PLValidatedExternalResource setDataLength:](v14, "setDataLength:", v21);
        -[PLValidatedExternalResource setUniformTypeIdentifier:](v14, "setUniformTypeIdentifier:", v15);
        if (objc_msgSend(v15, "conformsToAudio"))
        {
          v22 = v14;
          v23 = 2;
        }
        else
        {
          v22 = v14;
          v23 = 5;
        }
        -[PLValidatedExternalResource setResourceType:](v22, "setResourceType:", v23);
      }
    }
    -[PLValidatedExternalResource setSidecarIndex:](v14, "setSidecarIndex:", v12);

  }
  return v14;
}

+ (id)_validatedExternalResourceIfPresentForAudioOrUnknownAsset:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PLValidatedExternalResource *v9;
  void *v10;
  PLValidatedExternalResource *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v5, "uniformTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainFileURL");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(a1, "_getURLDataLength:", v7))
    {
      +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(PLValidatedExternalResource);
      -[PLValidatedExternalResource setVersion:](v9, "setVersion:", 0);
      -[PLValidatedExternalResource setRecipeID:](v9, "setRecipeID:", 0);
      -[PLValidatedExternalResource setFileURL:](v9, "setFileURL:", v8);
      -[PLValidatedExternalResource setUniformTypeIdentifier:](v9, "setUniformTypeIdentifier:", v10);
      if (objc_msgSend(v10, "conformsToAudio"))
      {
        v11 = v9;
        v12 = 2;
      }
      else
      {
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v18 = v14;
          v19 = 2048;
          v20 = (int)objc_msgSend(v5, "kind");
          v21 = 2114;
          v22 = v8;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Inserting resource with PLResourceTypeUnknown on asset uuid: %{public}@, kind: %ld, from URL: %{public}@", buf, 0x20u);

        }
        v11 = v9;
        v12 = 31;
      }
      -[PLValidatedExternalResource setResourceType:](v11, "setResourceType:", v12);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)_validatedExternalResourceForComputeResourceAtPath:(id)a3 recipe:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v14;

  v6 = a3;
  v7 = a4;
  if (v6
    && ((v14 = 0,
         objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, &v14),
         v8,
         v9)
      ? (v10 = v14 == 0)
      : (v10 = 0),
        v10))
  {
    objc_msgSend(a1, "_validatedExternalResourceForComputeResourceWithRecipe:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFileURL:", v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_validatedExternalResourceForComputeResourceWithRecipe:(id)a3
{
  id v3;
  PLValidatedExternalResource *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(PLValidatedExternalResource);
  -[PLValidatedExternalResource setVersion:](v4, "setVersion:", 3);
  v5 = objc_msgSend(v3, "recipeID");

  -[PLValidatedExternalResource setRecipeID:](v4, "setRecipeID:", v5);
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setUniformTypeIdentifier:](v4, "setUniformTypeIdentifier:", v7);

  -[PLValidatedExternalResource setResourceType:](v4, "setResourceType:", 14);
  return v4;
}

+ (id)_validatedExternalResourceAtPath:(id)a3 recipe:(id)a4 type:(unsigned int)a5 version:(unsigned int)a6 identifier:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  BOOL v17;
  const __CFString *v18;
  PLValidatedExternalResource *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v39[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v12)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v12, &v35);

    if (v16)
      v17 = v35 == 0;
    else
      v17 = 0;
    if (v17)
    {
      v19 = objc_alloc_init(PLValidatedExternalResource);
      -[PLValidatedExternalResource setVersion:](v19, "setVersion:", v8);
      -[PLValidatedExternalResource setRecipeID:](v19, "setRecipeID:", objc_msgSend(v13, "recipeID"));
      +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLValidatedExternalResource setUniformTypeIdentifier:](v19, "setUniformTypeIdentifier:", v31);

      -[PLValidatedExternalResource setResourceType:](v19, "setResourceType:", v9);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLValidatedExternalResource setFileURL:](v19, "setFileURL:", v32);

      -[PLValidatedExternalResource fileURL](v19, "fileURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLValidatedExternalResource setDataLength:](v19, "setDataLength:", objc_msgSend(a1, "_getURLDataLength:", v33));

      objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v35)
        v18 = CFSTR("is directory");
      else
        v18 = CFSTR("does not exist");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("file %@ at path: %@"), v18, v12);
      v19 = (PLValidatedExternalResource *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D732B8];
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D74498];
      v38 = *MEMORY[0x1E0CB2938];
      v39[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 47001, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "failureWithError:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0D732B8];
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D74498];
    v36 = *MEMORY[0x1E0CB2938];
    v37 = CFSTR("nil path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 47006, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "failureWithError:", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

+ (BOOL)recoverSupplementalResourcesForAsset:(id)a3 usingSidecarFinder:(id)a4 outResourcesStoreCount:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v36;
  id v37;
  os_signpost_id_t spid;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t *v43;
  id obj;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[16];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finder"));

  }
  PLImageManagerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, v10);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ResourceModel", "RecoverSupplementalResources", buf, 2u);
  }

  if ((objc_msgSend(v10, "isPhotoIris") & 1) == 0
    && ((objc_msgSend(MEMORY[0x1E0D73310], "maskForRecoverSupplementalResourcesForAsset"),
         objc_msgSend(v10, "savedAssetType"),
         (PLValidatedSavedAssetTypeApplies() & 1) != 0)
     || objc_msgSend(v10, "isCloudPhotoLibraryAsset")
     && (objc_msgSend(v10, "master"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v32, !v32)))
  {
    v42 = v13 - 1;
    v43 = a5;
    spid = v13;
    objc_msgSend(v10, "mainFileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByDeletingLastPathComponent");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "filename");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    v41 = (void *)v17;
    objc_msgSend(v11, "collectSidecarURLsForAssetFilename:inDirectory:context:removeWhenDone:", v18, v17, v19, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v21;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v22)
    {
      v23 = v22;
      v37 = v11;
      v24 = 0;
      v25 = *(_QWORD *)v47;
      while (2)
      {
        v26 = 0;
        v39 = v24 + v23;
        v40 = v24;
        do
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v26);
          v28 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v10, "additionalAttributes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "originalOrientation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          LODWORD(v27) = objc_msgSend(a1, "installSupplementalResourceForExistingFileAtURL:ptpTrashedState:index:forAsset:imageOrientation:resultingResource:error:", v27, 0, 0, v10, v30, 0, &v45);

          objc_autoreleasePoolPop(v28);
          if (!(_DWORD)v27)
          {
            v20 = 0;
            v31 = v40 + v26;
            goto LABEL_21;
          }
          ++v26;
        }
        while (v23 != v26);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        v31 = v39;
        v24 = v39;
        if (v23)
          continue;
        break;
      }
      v20 = 1;
LABEL_21:
      v11 = v37;
    }
    else
    {
      v31 = 0;
    }

    v33 = v15;
    v34 = v33;
    if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v34, OS_SIGNPOST_INTERVAL_END, spid, "ResourceModel", "RecoverSupplementalResources", buf, 2u);
    }

    if (v43)
      *v43 = v31;

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

+ (BOOL)installSupplementalResourceForExistingFileAtURL:(id)a3 ptpTrashedState:(int64_t)a4 index:(id)a5 forAsset:(id)a6 imageOrientation:(id)a7 resultingResource:(id *)a8 error:(id *)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = (void *)MEMORY[0x1E0D752F0];
  v17 = a5;
  objc_msgSend(v14, "pathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resourceModelTypeForFilenameExtension:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_validatedExternalResourceFromSupplementalFileURL:withUTI:ptpTrashedState:index:asset:", v14, v20, a4, v17, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate a supplemental resource from fileURL: %@"), v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D74600];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 1, v25);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v32[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v22, v15, 2, &v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v29;

  if (a8)
  {
    objc_msgSend(v23, "anyObject");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a8 = v25;
LABEL_5:

  }
  if (a9 && v24)
    *a9 = objc_retainAutorelease(v24);

  return v24 == 0;
}

+ (BOOL)_installInternalResourcesForExistingAsset:(id)a3 assumeNoExistingResources:(BOOL)a4 referencedResourceURLs:(id)a5 includeLegacyCloudResources:(BOOL)a6 outResourcesStoreCount:(unint64_t *)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL4 v11;
  id v13;
  id v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v29[8];
  id v30;
  uint8_t buf[16];

  v9 = a6;
  v11 = a4;
  v13 = a3;
  v14 = a5;
  PLImageManagerGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, v13);
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "ResourceModel", "InstallResources", buf, 2u);
  }

  if (v9 && (objc_msgSend(v13, "master"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    +[PLCloudResource validatedExternalResourcesUsingLegacyCloudResourcesFromAssetWithCloudMaster:](PLCloudResource, "validatedExternalResourcesUsingLegacyCloudResourcesFromAssetWithCloudMaster:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "externalResourcesForExistingAsset:referencedResourceURLs:", v13, v14);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
  if (v11)
    v22 = 1;
  else
    v22 = 2;
  v30 = 0;
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v20, v13, v22, &v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v30;
  v25 = v18;
  v26 = v25;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v16, "ResourceModel", "InstallResources", v29, 2u);
  }

  if (a7)
    *a7 = objc_msgSend(v23, "count");
  if (a8 && v24)
    *a8 = objc_retainAutorelease(v24);

  return v24 == 0;
}

+ (void)_applyImageIOMetadataToExternalResource:(id)a3 fromFileURL:(id)a4 fileExists:(BOOL)a5 assumedWidth:(int64_t)a6 assumedHeight:(int64_t)a7 recipe:(id)a8 assetKind:(signed __int16)a9
{
  _BOOL4 v12;
  id v14;
  const __CFURL *v15;
  id v16;
  CGImageSource *v17;
  CGImageSource *v18;
  void *v19;
  uint64_t v20;
  const __CFDictionary *v21;
  CFDictionaryRef v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v12 = a5;
  v40[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (const __CFURL *)a4;
  v16 = a8;
  if (v15 && v12 && (v17 = CGImageSourceCreateWithURL(v15, 0)) != 0)
  {
    v18 = v17;
    CGImageSourceGetType(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CBD278];
    v39[0] = *MEMORY[0x1E0CBD240];
    v39[1] = v20;
    v40[0] = MEMORY[0x1E0C9AAA0];
    v40[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = CGImageSourceCopyPropertiesAtIndex(v18, 0, v21);
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

      -[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUnorientedWidth:", objc_msgSend(v25, "integerValue"));

      -[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUnorientedHeight:", objc_msgSend(v26, "integerValue"));

      if (v24)
      {
        PLExifPixelXDimensionFromImageProperties(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "integerValue");

        PLExifPixelYDimensionFromImageProperties(v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "integerValue");

        if (v28 > objc_msgSend(v14, "unorientedWidth") && v30 > objc_msgSend(v14, "unorientedHeight"))
        {
          objc_msgSend(v14, "setUnorientedWidth:", v28);
          objc_msgSend(v14, "setUnorientedHeight:", v30);
        }
      }
    }
    CFRelease(v18);

    if (v19)
      goto LABEL_18;
  }
  else if (v16)
  {
    objc_msgSend(v16, "expectedSizeFromWidth:height:", a6, a7);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
    {
      v33 = MEMORY[0x19AEBFD0C](v31);
      v35 = v34;
      objc_msgSend(v14, "setUnorientedWidth:", (uint64_t)v33);
      a7 = (uint64_t)v35;
    }
    else
    {
      objc_msgSend(v14, "setUnorientedWidth:", a6);
    }
    objc_msgSend(v14, "setUnorientedHeight:", a7);

  }
  else
  {
    objc_msgSend(v14, "setUnorientedWidth:", a6);
    objc_msgSend(v14, "setUnorientedHeight:", a7);
  }
  -[__CFURL pathExtension](v15, "pathExtension");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "resourceModelTypeForFilenameExtension:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v16, "uti");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_18:
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v19);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  objc_msgSend(v14, "setUniformTypeIdentifier:", v38);

}

+ (id)_predicateForUnrecoverableResources
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("fileSystemBookmark"));
}

+ (id)onDemand_installPrimaryImageResourceWithRecipe:(id)a3 version:(unsigned int)a4 forAsset:(id)a5
{
  return (id)objc_msgSend(a1, "onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:requireFileToBePresent:", a3, *(_QWORD *)&a4, a5, 1);
}

+ (id)onDemand_installPrimaryImageResourceWithRecipe:(id)a3 version:(unsigned int)a4 forAsset:(id)a5 requireFileToBePresent:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipe"));

  }
  objc_msgSend(v11, "expectedFileURLForVersion:asset:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 > 2)
        v24 = CFSTR("cur");
      else
        v24 = off_1E3662340[v8];
      v25 = v24;
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      v32 = 2114;
      v33 = v11;
      v34 = 2114;
      v35 = v25;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unable to resolve expected file url for asset %{public}@, recipe: %{public}@, version: %{public}@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  objc_msgSend(v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "width");
  v17 = objc_msgSend(v12, "height");
  LOWORD(v28) = objc_msgSend(v12, "kind");
  objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v15, v6, v8, v16, v17, v11, v28, 0);
  v18 = objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v12, "assetID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "libraryID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v29 = 0;
    objc_msgSend(v21, "storeExternalResource:forAsset:options:error:resultingResource:", v18, v12, 0, 0, &v29);
    v22 = v29;
  }
  else
  {
    v22 = 0;
  }

LABEL_15:
  return v22;
}

+ (id)onDemand_installAdjustedFullSizeRenderResourceAtFilePath:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    }
    objc_msgSend(a1, "generateAdjustedFullSizeRenderResourceForFilePath:requireFileToBePresent:basedOnFullSizeWidth:andHeight:", v7, 0, objc_msgSend(v9, "width"), objc_msgSend(v9, "height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "assetID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "libraryID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v17 = 0;
        objc_msgSend(v13, "storeExternalResource:forAsset:options:error:resultingResource:", v10, v9, 0, 0, &v17);
        v14 = v17;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)onDemand_installOriginalVideoComplementResourceIfPresentForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  id v16;

  v5 = a3;
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v5, "pathForVideoComplementFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setResourceType:", 3);
    objc_msgSend(v9, "setVersion:", 0);
    objc_msgSend(v5, "assetID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16 = 0;
      objc_msgSend(v12, "storeExternalResource:forAsset:options:error:resultingResource:", v9, v5, 0, 0, &v16);
      v13 = v16;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)onDemand_installAdjustedFullSizeVideoComplementResourceIfPresentForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  id v16;

  v5 = a3;
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v5, "pathForFullsizeRenderVideoFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setResourceType:", 3);
    objc_msgSend(v9, "setVersion:", 2);
    objc_msgSend(v9, "setRecipeID:", 131272);
    objc_msgSend(v5, "assetID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16 = 0;
      objc_msgSend(v12, "storeExternalResource:forAsset:options:error:resultingResource:", v9, v5, 0, 0, &v16);
      v13 = v16;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:(id)a3
{
  id v5;
  PLValidatedExternalResource *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v6 = objc_alloc_init(PLValidatedExternalResource);
  if (v6)
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 131272);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setResourceType:](v6, "setResourceType:", 3);
    -[PLValidatedExternalResource setVersion:](v6, "setVersion:", 2);
    -[PLValidatedExternalResource setRecipeID:](v6, "setRecipeID:", 131272);
    objc_msgSend(v7, "codecFourCharCodeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setCodecFourCharCode:](v6, "setCodecFourCharCode:", v8);

    objc_msgSend(v7, "uti");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setUniformTypeIdentifier:](v6, "setUniformTypeIdentifier:", v9);

    objc_msgSend(v5, "assetID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16 = 0;
      objc_msgSend(v12, "storeExternalResource:forAsset:options:error:resultingResource:", v6, v5, 0, 0, &v16);
      v13 = v16;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)onDemand_installOriginalAdjustmentResourceIfPresentForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v5, "pathForOriginalAdjustmentFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "generateValidatedExternalOtherResourceOfType:forFilePath:uti:requireFileToBePresent:version:", 5, v6, v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setRecipeID:", 0);
    objc_msgSend(v5, "assetID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "libraryID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v18 = 0;
      objc_msgSend(v14, "storeExternalResource:forAsset:options:error:resultingResource:", v11, v5, 0, 0, &v18);
      v15 = v18;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)onDemand_installOriginalSOCImagePresentForAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  uint64_t v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E375E8F8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (objc_msgSend(v7, "pathForSpatialOverCaptureContentFile"),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = objc_msgSend(v7, "originalWidth");
    v12 = objc_msgSend(v7, "originalHeight");
    LOWORD(v20) = objc_msgSend(v7, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 10, v10, 1, 0, v11, v12, 0, v20, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "assetID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v21 = 0;
        objc_msgSend(v16, "storeExternalResource:forAsset:options:error:resultingResource:", v13, v7, 0, 0, &v21);
        v17 = v21;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installOriginalSOCVideoPresentForAsset:(id)a3 referencedResourceURLs:(id)a4
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
  id v17;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 537, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E375E8F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    || (objc_msgSend(v7, "pathForSpatialOverCaptureContentFile"),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setResourceType:", 10);
      objc_msgSend(v13, "setVersion:", 0);
      objc_msgSend(v13, "setTrashedStateFromURL");
      objc_msgSend(v7, "assetID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v20 = 0;
        objc_msgSend(v16, "storeExternalResource:forAsset:options:error:resultingResource:", v13, v7, 0, 0, &v20);
        v17 = v20;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installOriginalSOCVideoComplementPresentForAsset:(id)a3 referencedResourceURLs:(id)a4
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
  id v17;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E375E910);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v7, "pathForVideoComplementSpatialOverCaptureContentFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setResourceType:", 11);
    objc_msgSend(v13, "setVersion:", 0);
    objc_msgSend(v13, "setTrashedStateFromURL");
    objc_msgSend(v7, "assetID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v20 = 0;
      objc_msgSend(v16, "storeExternalResource:forAsset:options:error:resultingResource:", v13, v7, 0, 0, &v20);
      v17 = v20;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installLocalVideoKeyFrameForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65749);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "width");
  v7 = objc_msgSend(v4, "height");
  LOWORD(v14) = objc_msgSend(v4, "kind");
  objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, 0, 0, 3, v6, v7, v5, v14, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier jpegUniformTypeIdentifier](PLUniformTypeIdentifier, "jpegUniformTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUniformTypeIdentifier:", v9);

  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v10, v4, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)onDemand_installOriginalResourceForSyndicationAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "additionalAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syndicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "[sync] cannot install resource on asset missing syndication identifier, uuid: %{public}@";
LABEL_12:
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "bundleScope") != 3)
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "[sync] cannot install resource on asset that is not in syndication bundle scope, uuid: %{public}@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v7 = objc_msgSend(v4, "kind");
  if (v7 == 3)
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    objc_msgSend(v4, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v16;
    v17 = "[sync] cannot install resource on asset with unknown type, uuid: %{public}@";
    goto LABEL_12;
  }
  if (v7 == 2)
    v8 = 2;
  else
    v8 = v7 == 1;
  objc_msgSend(v4, "mainFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniformTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "generatedValidatedExternalSyndicationResourceOfType:version:recipeID:fileURL:requireFileToBePresent:uniformTypeIdentifier:", v8, 0, 0, v9, 0, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v19 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v13, v4, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v15;
}

+ (id)onDemand_installOriginalVideoComplementForSyndicationAsset:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "additionalAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syndicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    v12 = "Cannot install syndication resource on asset that is missing syndication identifier, uuid: %{public}@";
LABEL_10:
    v13 = v10;
    v14 = 12;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "bundleScope") != 3)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    v12 = "Cannot install syndication resource on asset that is not in syndication bundle scope, uuid: %{public}@";
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "kind") - 1 > 2)
  {
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "pathForVideoComplementFile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generatedValidatedExternalSyndicationResourceOfType:version:recipeID:fileURL:requireFileToBePresent:uniformTypeIdentifier:", 3, 0, 0, v19, 0, v21);
    v10 = objc_claimAutoreleasedReturnValue();

    v24 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v22, v6, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  PLBackendGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v11;
    v27 = 2050;
    v28 = (int)objc_msgSend(v6, "kind");
    v12 = "Only images can be live photos, cannot install syndication video complement, uuid: %{public}@, type: %{public}ld";
    v13 = v10;
    v14 = 22;
LABEL_11:
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);

  }
LABEL_12:
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)onDemand_installExistingAdjustedResourceAtFilePath:(id)a3 withType:(unsigned int)a4 recipe:(id)a5 forAsset:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[2];

  v10 = *(_QWORD *)&a4;
  v35[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v13)
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 648, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    }
    v17 = objc_msgSend(v16, "width");
    v18 = objc_msgSend(v16, "height");
    v32 = 0;
    LOWORD(v30) = objc_msgSend(v16, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", v10, v13, 1, 2, v17, v18, v14, v30, &v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v32;
    if (v19)
    {
      v35[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v20;
      +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v21, v16, 2, &v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v31;

      if (v22)
      {
        objc_msgSend(v22, "anyObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v23)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0D74600];
          v33 = *MEMORY[0x1E0CB2938];
          v34 = CFSTR("resource was not stored");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 1, v27);
          v23 = (id)objc_claimAutoreleasedReturnValue();

        }
        v24 = 0;
      }

      v20 = v23;
      if (!a7)
        goto LABEL_15;
    }
    else
    {
      v24 = 0;
      if (!a7)
        goto LABEL_15;
    }
    *a7 = objc_retainAutorelease(v20);
LABEL_15:

    goto LABEL_16;
  }
  v24 = 0;
LABEL_16:

  return v24;
}

+ (id)onDemand_installEmptyComputeResourceWithRecipe:(id)a3 forAsset:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a1, "_validatedExternalResourceForComputeResourceWithRecipe:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    v13 = 0;
    v14 = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v11, v8, 2, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (v12)
  {
    objc_msgSend(v12, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D74600];
      v20 = *MEMORY[0x1E0CB2938];
      v21 = CFSTR("resource was not stored");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1, v17);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
  }

  if (a5)
LABEL_10:
    *a5 = objc_retainAutorelease(v13);
LABEL_11:

  return v14;
}

+ (id)onDemand_installExistingComputeResourceAtFilePath:(id)a3 recipe:(id)a4 forAsset:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0CEC4A0];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_validatedExternalResourceAtPath:recipe:type:version:identifier:", v11, v10, 14, 3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isSuccess"))
  {
    objc_msgSend(v13, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_storeValidatedLocalExternalResource:forAsset:", v14, v8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v13, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "failureWithError:", v14);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)onDemand_installExistingAdjustmentSuggestionResourceAtFilePath:(id)a3 recipe:(id)a4 forAsset:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0CEC508];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_validatedExternalResourceAtPath:recipe:type:version:identifier:", v11, v10, 15, 3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isSuccess"))
  {
    objc_msgSend(v13, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_storeValidatedLocalExternalResource:forAsset:", v14, v8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v13, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "failureWithError:", v14);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)onDemand_installResourceWithResourceIdentity:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  PLValidatedExternalResource *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 707, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 708, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nonPersistedResource"));

LABEL_3:
  v9 = objc_alloc_init(PLValidatedExternalResource);
  if (v9)
  {
    v10 = objc_msgSend(v7, "recipeID");
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setResourceType:](v9, "setResourceType:", objc_msgSend(v7, "resourceType"));
    -[PLValidatedExternalResource setVersion:](v9, "setVersion:", objc_msgSend(v7, "version"));
    -[PLValidatedExternalResource setRecipeID:](v9, "setRecipeID:", v10);
    objc_msgSend(v11, "codecFourCharCodeName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setCodecFourCharCode:](v9, "setCodecFourCharCode:", v12);

    objc_msgSend(v11, "uti");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setUniformTypeIdentifier:](v9, "setUniformTypeIdentifier:", v13);

    objc_msgSend(v8, "assetID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v21 = 0;
      objc_msgSend(v16, "storeExternalResource:forAsset:options:error:resultingResource:", v9, v8, 0, 0, &v21);
      v17 = v21;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)generateAdjustedFullSizeRenderResourceForFilePath:(id)a3 requireFileToBePresent:(BOOL)a4 basedOnFullSizeWidth:(int64_t)a5 andHeight:(int64_t)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v8 = a4;
  v10 = a3;
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65938);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v14) = 0;
  objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v10, v8, 2, a5, a6, v11, v14, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_speculativePathForPenultimateFullsizeRenderImageFileForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "pathForPenultimateFullsizeRenderImageFileWithUTI:", CFSTR("public.heic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(v3, "pathForPenultimateFullsizeRenderImageFile");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_validatedExternalResourcesFromLocalImageOrVideoAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PLValidatedExternalResource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  PLValidatedExternalResource *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  void *v106;
  void *v107;
  id v108;

  v6 = a3;
  v108 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v6, "hasAdjustments");
  v7 = objc_msgSend(v6, "width");
  v8 = objc_msgSend(v6, "height");
  if (!objc_msgSend(v6, "kind"))
  {
    objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E928);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v6, "mainFileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(a1, "_getURLDataLength:", v9);
    if (v10)
    {
      v11 = v10;
      v12 = objc_alloc_init(PLValidatedExternalResource);
      -[PLValidatedExternalResource setResourceType:](v12, "setResourceType:", 0);
      -[PLValidatedExternalResource setVersion:](v12, "setVersion:", 0);
      -[PLValidatedExternalResource setFileURL:](v12, "setFileURL:", v9);
      -[PLValidatedExternalResource setDataLength:](v12, "setDataLength:", v11);
      objc_msgSend(v6, "originalUniformTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLValidatedExternalResource setUniformTypeIdentifier:](v12, "setUniformTypeIdentifier:", v14);
      -[PLValidatedExternalResource setUnorientedWidth:](v12, "setUnorientedWidth:", objc_msgSend(v6, "originalWidth"));
      -[PLValidatedExternalResource setUnorientedHeight:](v12, "setUnorientedHeight:", objc_msgSend(v6, "originalHeight"));
      objc_msgSend(v107, "addObject:", v12);
    }
    else
    {
      objc_msgSend(v6, "additionalAttributes");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "deferredPhotoIdentifier");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (v90)
        v91 = objc_msgSend(v6, "deferredProcessingNeeded") == 1
           || objc_msgSend(v6, "deferredProcessingNeeded") == 5;
      else
        v91 = 0;

      v95 = objc_msgSend(v6, "deferredProcessingNeeded");
      if (!v91 && v95 != 10)
        goto LABEL_8;
      objc_msgSend(v6, "pathForDeferredProcessingPreviewFile");
      v12 = (PLValidatedExternalResource *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_7:

LABEL_8:
        goto LABEL_9;
      }
      if (v91)
        v96 = 202;
      else
        v96 = 210;
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (v96 + 65741));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v6, "originalWidth");
      v99 = objc_msgSend(v6, "originalHeight");
      LOWORD(v100) = objc_msgSend(v6, "kind");
      objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v12, 1, 0, v98, v99, v97, v100, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v107, "addObject:", v14);

    }
    goto LABEL_7;
  }
LABEL_9:
  if ((objc_msgSend(v6, "cameraProcessingAdjustmentState") & 1) == 0)
    goto LABEL_21;
  if (objc_msgSend(v6, "kind"))
  {
    if (objc_msgSend(v6, "kind") != 1)
      goto LABEL_21;
    objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E8F8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(v6, "pathForSpatialOverCaptureContentFile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v16, v106);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
      goto LABEL_20;
    objc_msgSend(v17, "setResourceType:", 10);
    objc_msgSend(v18, "setVersion:", 0);
    objc_msgSend(v18, "setTrashedStateFromURL");
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "deferredProcessingNeeded") == 1
    || objc_msgSend(v6, "deferredProcessingNeeded") == 6)
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65946);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForSpatialOverCaptureContentFile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v6, "originalHeight");
    v21 = objc_msgSend(v6, "originalWidth");
    LOWORD(v100) = objc_msgSend(v6, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 10, v19, 0, 0, v20, v21, v16, v100, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    objc_msgSend(v107, "addObject:", v18);
    goto LABEL_20;
  }
  objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E8F8);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    || (objc_msgSend(v6, "pathForSpatialOverCaptureContentFile"),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v93 = objc_msgSend(v6, "originalWidth");
    v94 = objc_msgSend(v6, "originalHeight");
    LOWORD(v100) = objc_msgSend(v6, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 10, v16, 1, 0, v93, v94, 0, v100, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_21:
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65737);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForNonAdjustedFullsizeImageFile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v6, "originalWidth");
  v25 = objc_msgSend(v6, "originalHeight");
  LOWORD(v100) = objc_msgSend(v6, "kind");
  objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v23, 1, 0, v24, v25, v22, v100, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v107, "addObject:", v26);

  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65741);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForNonAdjustedLargeThumbnailFile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "originalWidth");
  v30 = objc_msgSend(v6, "originalHeight");
  LOWORD(v101) = objc_msgSend(v6, "kind");
  objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v28, 1, 0, v29, v30, v27, v101, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v107;
  if (v31)
    objc_msgSend(v107, "addObject:", v31);

  if (objc_msgSend(v6, "kindSubtype") == 2)
  {
    objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E940);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      objc_msgSend(v6, "pathForVideoComplementFile");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v34, v106);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      objc_msgSend(v35, "setResourceType:", 3);
      objc_msgSend(v36, "setVersion:", 0);
      objc_msgSend(v107, "addObject:", v36);
    }

    if ((objc_msgSend(v6, "cameraProcessingAdjustmentState") & 1) != 0)
    {
      objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E910);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        objc_msgSend(v6, "pathForVideoComplementSpatialOverCaptureContentFile");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v38, v106);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        objc_msgSend(v39, "setResourceType:", 11);
        objc_msgSend(v40, "setVersion:", 0);
        objc_msgSend(v40, "setTrashedStateFromURL");
        objc_msgSend(v107, "addObject:", v40);
      }

    }
  }
  if (v105)
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65937);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForSubstandardFullsizeRenderImageFile");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v102) = objc_msgSend(v6, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v42, 1, 2, v7, v8, v41, v102, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      objc_msgSend(v107, "addObject:", v43);

    if (objc_msgSend(v6, "hasUnrenderedAsyncAdjustments"))
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65941);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathForAsyncAdjustedRenderPreviewImageFile");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v103) = objc_msgSend(v6, "kind");
      objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v45, 1, 2, v7, v8, v44, v103, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v107;
      if (v46)
        objc_msgSend(v107, "addObject:", v46);

    }
    v47 = !v43 && !objc_msgSend(v6, "hasUnrenderedAsyncAdjustments")
       || objc_msgSend(v6, "kind") != 0;
    objc_msgSend(v6, "pathForAdjustedFullsizeImageFile");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generateAdjustedFullSizeRenderResourceForFilePath:requireFileToBePresent:basedOnFullSizeWidth:andHeight:", v48, v47, v7, v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
      objc_msgSend(v32, "addObject:", v49);

    objc_msgSend(a1, "_speculativePathForPenultimateFullsizeRenderImageFileForAsset:", v6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v103) = objc_msgSend(v6, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v50, 1, 1, v7, v8, 0, v103, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
      objc_msgSend(v32, "addObject:", v51);

    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65741);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForAdjustedLargeThumbnailFile");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v104) = objc_msgSend(v6, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v53, 1, 2, v7, v8, v52, v104, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
      objc_msgSend(v32, "addObject:", v54);

    objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pathForAdjustmentSecondaryDataFile");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generateValidatedExternalOtherResourceOfType:forFilePath:uti:requireFileToBePresent:version:", 7, v57, v56, 1, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      objc_msgSend(v32, "addObject:", v58);

    if (objc_msgSend(v6, "kindSubtype") == 2)
    {
      v59 = objc_msgSend(v6, "hasUnrenderedAsyncAdjustments");
      objc_msgSend(v6, "pathForFullsizeRenderVideoFile");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v60, v106);
      v61 = (PLValidatedExternalResource *)objc_claimAutoreleasedReturnValue();
      if (!v61 && v59)
      {
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 131272);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_alloc_init(PLValidatedExternalResource);
        objc_msgSend(v62, "codecFourCharCodeName");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLValidatedExternalResource setCodecFourCharCode:](v61, "setCodecFourCharCode:", v63);

        objc_msgSend(v62, "uti");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLValidatedExternalResource setUniformTypeIdentifier:](v61, "setUniformTypeIdentifier:", v64);

      }
      if (v61)
      {
        -[PLValidatedExternalResource setResourceType:](v61, "setResourceType:", 3);
        -[PLValidatedExternalResource setVersion:](v61, "setVersion:", 2);
        -[PLValidatedExternalResource setRecipeID:](v61, "setRecipeID:", 131272);
        objc_msgSend(v32, "addObject:", v61);
      }

      objc_msgSend(v6, "pathForPenultimateFullsizeRenderVideoFile");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v65, v106);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v66)
      {
        objc_msgSend(v66, "setResourceType:", 3);
        objc_msgSend(v67, "setVersion:", 1);
        objc_msgSend(v32, "addObject:", v67);
      }

    }
  }
  if (objc_msgSend(v6, "kind") == 1)
  {
    objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E958);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "path");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generateVideoResourcesFromVideoAsset:referencedVideoPath:", v6, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObjectsFromArray:", v70);

    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65948);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForTransientVideoPosterFramePreview");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v6, "width");
    v74 = objc_msgSend(v6, "height");
    LOWORD(v102) = objc_msgSend(v6, "kind");
    objc_msgSend(a1, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v72, 1, 2, v73, v74, v71, v102, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
      objc_msgSend(v32, "addObject:", v75);

  }
  objc_msgSend(v108, "objectForKeyedSubscript:", &unk_1E375E970);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "path");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v77)
  {
    objc_msgSend(v6, "pathForOriginalAdjustmentFile");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "identifier");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "generateValidatedExternalOtherResourceOfType:forFilePath:uti:requireFileToBePresent:version:", 5, v77, v80, 1, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (v81)
  {
    objc_msgSend(v81, "setRecipeID:", 0);
    objc_msgSend(v32, "addObject:", v82);
  }
  objc_msgSend(v6, "pathForXMPFile");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceXMPType");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "identifier");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_validatedExternalResourceFromSupplementalFileURL:withUTI:ptpTrashedState:index:asset:", v84, v86, 0, 0, v6);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(v82, "setRecipeID:", 0);
    objc_msgSend(v107, "addObject:", v87);
  }

  return v107;
}

+ (id)_storeValidatedLocalExternalResource:(id)a3 forAsset:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20[0] = v5;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v8, v7, 2, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  if (v9)
  {
    objc_msgSend(v9, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v10)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D74600];
      v18 = *MEMORY[0x1E0CB2938];
      v19 = CFSTR("resource was not stored");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 1, v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)validatedExternalResourceForLocalVideoIfPresentAtPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PLValidatedExternalResource *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(a1, "_getURLDataLength:", v8);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc_init(PLValidatedExternalResource);
      objc_msgSend(v11, "plVideoCodecFourCharCodeString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[PLValidatedExternalResource setCodecFourCharCode:](v12, "setCodecFourCharCode:", v13);
      +[PLManagedAsset dimensionsForAVAsset:](PLManagedAsset, "dimensionsForAVAsset:", v11);
      v15 = v14;
      -[PLValidatedExternalResource setUnorientedWidth:](v12, "setUnorientedWidth:", (uint64_t)v16);
      -[PLValidatedExternalResource setUnorientedHeight:](v12, "setUnorientedHeight:", (uint64_t)v15);
      -[PLValidatedExternalResource setFileURL:](v12, "setFileURL:", v8);
      -[PLValidatedExternalResource setDataLength:](v12, "setDataLength:", v10);
      v17 = (void *)MEMORY[0x1E0D752F0];
      objc_msgSend(v6, "pathExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resourceModelTypeForFilenameExtension:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLValidatedExternalResource setUniformTypeIdentifier:](v12, "setUniformTypeIdentifier:", v21);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)generateVideoResourcesFromVideoAsset:(id)a3 referencedVideoPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  int v26;
  void *v27;
  PLValidatedExternalResource *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(v6, "pathForOriginalFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setResourceType:", 1);
    objc_msgSend(v13, "setVersion:", 0);
    objc_msgSend(v8, "addObject:", v13);
  }

  objc_msgSend(v6, "pathForNonAdjustedLargeVideoFile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setResourceType:", 1);
    objc_msgSend(v16, "setVersion:", 0);
    objc_msgSend(v16, "setRecipeID:", 131077);
    objc_msgSend(v8, "addObject:", v16);
  }

  objc_msgSend(v6, "pathForNonAdjustedMediumVideoFile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "setResourceType:", 1);
    objc_msgSend(v19, "setVersion:", 0);
    objc_msgSend(v19, "setRecipeID:", 131079);
    objc_msgSend(v8, "addObject:", v19);
  }

  objc_msgSend(v6, "pathForNonAdjustedMediumHDRVideoFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v20, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "setResourceType:", 1);
    objc_msgSend(v22, "setVersion:", 0);
    objc_msgSend(v22, "setRecipeID:", 131475);
    objc_msgSend(v8, "addObject:", v22);
  }

  objc_msgSend(v6, "pathForNonAdjustedSmallVideoFile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v23, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "setResourceType:", 1);
    objc_msgSend(v25, "setVersion:", 0);
    objc_msgSend(v25, "setRecipeID:", 131081);
    objc_msgSend(v8, "addObject:", v25);
  }

  if (objc_msgSend(v6, "hasAdjustments"))
  {
    v26 = objc_msgSend(v6, "hasUnrenderedAsyncAdjustments");
    objc_msgSend(v6, "pathForFullsizeRenderVideoFile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v27, v9);
    v28 = (PLValidatedExternalResource *)objc_claimAutoreleasedReturnValue();
    if (!v28 && v26)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 0x20000);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(PLValidatedExternalResource);
      objc_msgSend(v29, "codecFourCharCodeName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLValidatedExternalResource setCodecFourCharCode:](v28, "setCodecFourCharCode:", v30);

      objc_msgSend(v29, "uti");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLValidatedExternalResource setUniformTypeIdentifier:](v28, "setUniformTypeIdentifier:", v31);

    }
    if (v28)
    {
      -[PLValidatedExternalResource setResourceType:](v28, "setResourceType:", 1);
      -[PLValidatedExternalResource setVersion:](v28, "setVersion:", 2);
      -[PLValidatedExternalResource setRecipeID:](v28, "setRecipeID:", 0x20000);
      objc_msgSend(v8, "addObject:", v28);
    }

    objc_msgSend(v6, "pathForPenultimateFullsizeRenderVideoFile");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v32, v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      objc_msgSend(v33, "setResourceType:", 1);
      objc_msgSend(v34, "setVersion:", 1);
      objc_msgSend(v8, "addObject:", v34);
    }

    objc_msgSend(v6, "pathForAdjustedLargeVideoFile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v35, v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      objc_msgSend(v36, "setResourceType:", 1);
      objc_msgSend(v37, "setVersion:", 2);
      objc_msgSend(v37, "setRecipeID:", 131077);
      objc_msgSend(v8, "addObject:", v37);
    }

    objc_msgSend(v6, "pathForAdjustedMediumVideoFile");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v38, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "setResourceType:", 1);
      objc_msgSend(v40, "setVersion:", 2);
      objc_msgSend(v40, "setRecipeID:", 131079);
      objc_msgSend(v8, "addObject:", v40);
    }

    objc_msgSend(v6, "pathForAdjustedMediumHDRVideoFile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v41, v9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "setResourceType:", 1);
      objc_msgSend(v43, "setVersion:", 2);
      objc_msgSend(v43, "setRecipeID:", 131475);
      objc_msgSend(v8, "addObject:", v43);
    }

    objc_msgSend(v6, "pathForAdjustedSmallVideoFile");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "validatedExternalResourceForLocalVideoIfPresentAtPath:context:", v44, v9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "setResourceType:", 1);
      objc_msgSend(v46, "setVersion:", 2);
      objc_msgSend(v46, "setRecipeID:", 131081);
      objc_msgSend(v8, "addObject:", v46);
    }

  }
  return v8;
}

+ (id)_validatedExternalResourcesFromSharedStreamAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requiredExternalResourcesForMigratingOrImportingAsset:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)resetImageRequestHintsInContext:(id)a3
{
  return objc_msgSend(a1, "resetImageRequestHintsInContext:allowOneTimeThumbRebuild:", a3, 0);
}

+ (BOOL)resetImageRequestHintsInContext:(id)a3 allowOneTimeThumbRebuild:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLEnumerateAndSaveController *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PLEnumerateAndSaveController *v21;
  BOOL v22;
  id v23;
  NSObject *v24;
  signed int v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *context;
  id v31;
  _QWORD v32[5];
  BOOL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  unsigned int *v40;
  uint64_t v41;
  int v42;
  uint8_t buf[4];
  id v44;
  _QWORD v45[4];

  v45[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  context = (void *)MEMORY[0x19AEC1554]();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = CFSTR("modernResources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  v39 = 0;
  v40 = (unsigned int *)&v39;
  v41 = 0x3020000000;
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLResourceInstaller resetImageRequestHintsInContext:allowOneTimeThumbRebuild:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionAuthor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PLEnumerateAndSaveController alloc];
  objc_msgSend(v5, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke;
  v34[3] = &unk_1E3669318;
  v17 = v10;
  v35 = v17;
  v18 = v12;
  v36 = v18;
  v19 = v13;
  v37 = v19;
  v20 = v11;
  v38 = v20;
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_3;
  v32[3] = &unk_1E3669340;
  v33 = a4;
  v32[4] = &v39;
  v21 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v14, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v17, v8, v5, v15, 1, 1, v34, 0, v32);

  v31 = 0;
  v22 = -[PLEnumerateAndSaveController processObjectsWithError:](v21, "processObjectsWithError:", &v31);
  v23 = v31;
  if (v22)
  {
    PLMigrationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = atomic_load(v40 + 10);
      *(_DWORD *)buf = 134217984;
      v44 = (id)v25;
      v26 = "Reset %ld asset image request hints.";
      v27 = v24;
      v28 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_199541000, v27, v28, v26, buf, 0xCu);
    }
  }
  else
  {
    PLMigrationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v23;
      v26 = "Error resetting image request hints, %@";
      v27 = v24;
      v28 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  _Block_object_dispose(&v39, 8);
  objc_autoreleasePoolPop(context);

  return v22;
}

+ (BOOL)reconsiderSavedAssetTypeInStore:(id)a3 migrator:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
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
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  void *context;
  id v30;
  uint8_t buf[4];
  id v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isCloudPhotoLibraryEnabled") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    context = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("PhotoData"), CFSTR("CPLAssets"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContextForMigrationInStore:name:concurrencyType:", v5, "+[PLResourceInstaller reconsiderSavedAssetTypeInStore:migrator:]", *MEMORY[0x1E0C97C38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C97AB0];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "batchUpdateRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCameraAsset"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v14;
    v15 = (void *)MEMORY[0x1E0CB3880];
    v28 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@*"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K LIKE %@"), CFSTR("directory"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setPredicate:", v19);
    v33 = CFSTR("savedAssetType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudPhotoLibraryAsset"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPropertiesToUpdate:", v21);

    objc_msgSend(v12, "setResultType:", 2);
    v30 = 0;
    objc_msgSend(v9, "executeRequest:error:", v12, &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v30;
    v7 = v22 != 0;
    PLMigrationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v22, "result");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v26;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Fixing savedAssetType successful with result %@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v23;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Batch update request failed, reconsidering savedAssetType, error: %@", buf, 0xCu);
    }

    objc_msgSend(v9, "reset");
    objc_autoreleasePoolPop(context);
  }

  return v7;
}

+ (BOOL)resetInternalResourcesInStore:(id)a3 resetUTIs:(BOOL)a4 resetCodecs:(BOOL)a5 resetMasters:(BOOL)a6 migrator:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;
  _BOOL4 v19;
  void *v20;
  void *v21;

  v11 = a3;
  v12 = a7;
  v13 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v12, "managedObjectContextForMigrationInStore:name:concurrencyType:", v11, "+[PLResourceInstaller resetInternalResourcesInStore:resetUTIs:resetCodecs:resetMasters:migrator:]", *MEMORY[0x1E0C97C38]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(a1, "_predicateForUnrecoverableResources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v16, v15, v14, 0);

  v18 = !a6;
  LOBYTE(v19) = !a6 && v17;
  if (!v18 && v17)
  {
    +[PLCloudResource entityName](PLCloudResource, "entityName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v20, 0, v14, 0);

    if (v19)
    {
      +[PLCloudMaster entityName](PLCloudMaster, "entityName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v21, 0, v14, 0);

    }
  }

  objc_autoreleasePoolPop(v13);
  return v19;
}

+ (BOOL)createInternalResourcesForExistingAssetsWithNoExistingResourcesInStore:(id)a3 migrator:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = *MEMORY[0x1E0C97C38];
  v7 = a4;
  objc_msgSend(v7, "managedObjectContextForMigrationInStore:name:concurrencyType:", a3, "+[PLResourceInstaller createInternalResourcesForExistingAssetsWithNoExistingResourcesInStore:migrator:]", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:migrator:", v8, v7);

  return (char)a1;
}

+ (BOOL)removeLegacyCloudResourcesInStore:(id)a3 migrator:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a4, "managedObjectContextForMigrationInStore:name:concurrencyType:", a3, "+[PLResourceInstaller removeLegacyCloudResourcesInStore:migrator:]", *MEMORY[0x1E0C97C38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudResource entityName](PLCloudResource, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v5, 0, v4, 0);

  return v6;
}

+ (BOOL)installInternalResourcesForExistingAsset:(id)a3 assumeNoExistingResources:(BOOL)a4 referencedResourceURLs:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "_installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:includeLegacyCloudResources:outResourcesStoreCount:error:", a3, a4, a5, 0, 0, a6);
}

+ (BOOL)installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:(id)a3 migrator:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLSidecarFinder *v15;
  void *v16;
  PLEnumerateAndSaveController *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  PLSidecarFinder *v23;
  PLEnumerateAndSaveController *v24;
  BOOL v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
  void *context;
  unint64_t v34;
  id v35;
  _QWORD v36[4];
  PLSidecarFinder *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  _QWORD v45[8];

  v45[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLImageManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v34 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LibraryMigration", ", buf, 2u);
  }
  spid = v8;

  context = (void *)MEMORY[0x19AEC1554]();
  v11 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = CFSTR("modernResources");
  v45[1] = CFSTR("additionalAttributes");
  v45[2] = CFSTR("master");
  v45[3] = CFSTR("master.resources");
  v45[4] = CFSTR("master.mediaMetadata");
  v45[5] = CFSTR("resources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v14);

  v15 = objc_alloc_init(PLSidecarFinder);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLResourceInstaller installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:migrator:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [PLEnumerateAndSaveController alloc];
  objc_msgSend(v6, "pathManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke;
  v39[3] = &unk_1E3672FF8;
  v20 = v6;
  v40 = v20;
  v21 = v16;
  v41 = v21;
  v22 = v5;
  v42 = v22;
  v36[0] = v19;
  v36[1] = 3221225472;
  v36[2] = __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke_2;
  v36[3] = &unk_1E3669368;
  v38 = a1;
  v23 = v15;
  v37 = v23;
  v24 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v17, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v21, v13, v22, v18, 1, 1, v39, 0, v36);

  v35 = 0;
  v25 = -[PLEnumerateAndSaveController processObjectsWithError:](v24, "processObjectsWithError:", &v35);
  v26 = v35;
  if (!v25)
  {
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v26;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to finish batch processing to migrate resources with error: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(context);
  v28 = v10;
  v29 = v28;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, spid, "LibraryMigration", ", buf, 2u);
  }

  return v25;
}

+ (id)externalResourcesForExistingAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceInstaller.m"), 1466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isCloudSharedAsset"))
  {
    objc_msgSend(a1, "_validatedExternalResourcesFromSharedStreamAsset:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v10;
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    goto LABEL_9;
  }
  if (!objc_msgSend(v7, "kind") || objc_msgSend(v7, "kind") == 1)
  {
    objc_msgSend(a1, "_validatedExternalResourcesFromLocalImageOrVideoAsset:referencedResourceURLs:", v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(a1, "_validatedExternalResourceIfPresentForAudioOrUnknownAsset:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v9, "addObject:", v11);
LABEL_9:

  return v9;
}

+ (id)generateValidatedExternalImageResourceOfType:(unsigned int)a3 forFilePath:(id)a4 requireFileToBePresent:(BOOL)a5 version:(unsigned int)a6 basedOnFullSizeWidth:(int64_t)a7 andHeight:(int64_t)a8 recipe:(id)a9 assetKind:(signed __int16)a10 error:(id *)a11
{
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  PLValidatedExternalResource *v25;
  uint64_t v27;
  uint64_t v30;
  _QWORD v31[2];

  v11 = *(_QWORD *)&a6;
  v12 = a5;
  v13 = *(_QWORD *)&a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a9;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(a1, "_getURLDataLength:", v17);
    v19 = v18 != 0;
    if (!v12)
      goto LABEL_9;
  }
  else
  {
    v19 = 0;
    v18 = 0;
    v17 = 0;
    if (!v12)
    {
LABEL_9:
      v25 = objc_alloc_init(PLValidatedExternalResource);
      -[PLValidatedExternalResource setResourceType:](v25, "setResourceType:", v13);
      -[PLValidatedExternalResource setVersion:](v25, "setVersion:", v11);
      -[PLValidatedExternalResource setRecipeID:](v25, "setRecipeID:", objc_msgSend(v16, "recipeID"));
      if (v19)
      {
        -[PLValidatedExternalResource setFileURL:](v25, "setFileURL:", v17);
        -[PLValidatedExternalResource setDataLength:](v25, "setDataLength:", v18);
      }
      LOWORD(v27) = a10;
      objc_msgSend((id)objc_opt_class(), "_applyImageIOMetadataToExternalResource:fromFileURL:fileExists:assumedWidth:assumedHeight:recipe:assetKind:", v25, v17, v19, a7, a8, v16, v27);
      -[PLValidatedExternalResource setTrashedStateFromURL](v25, "setTrashedStateFromURL");
      goto LABEL_12;
    }
  }
  if (v19)
    goto LABEL_9;
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = *MEMORY[0x1E0CB28A8];
  v30 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("file does not exist at path: %@"), v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 4, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (a11)
    *a11 = objc_retainAutorelease(v24);

  v25 = 0;
LABEL_12:

  return v25;
}

+ (id)generateValidatedExternalOtherResourceOfType:(unsigned int)a3 forFilePath:(id)a4 uti:(id)a5 requireFileToBePresent:(BOOL)a6 version:(unsigned int)a7
{
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  PLValidatedExternalResource *v17;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(a1, "_getURLDataLength:", v14);
    v16 = v15 != 0;
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v14 = 0;
    v16 = 0;
    v15 = 0;
    if (!v8)
    {
LABEL_7:
      v17 = objc_alloc_init(PLValidatedExternalResource);
      -[PLValidatedExternalResource setResourceType:](v17, "setResourceType:", v10);
      -[PLValidatedExternalResource setVersion:](v17, "setVersion:", v7);
      -[PLValidatedExternalResource setUniformTypeIdentifier:](v17, "setUniformTypeIdentifier:", v13);
      -[PLValidatedExternalResource setDataLength:](v17, "setDataLength:", v15);
      -[PLValidatedExternalResource setFileURL:](v17, "setFileURL:", v14);
      goto LABEL_8;
    }
  }
  if (v16)
    goto LABEL_7;
  v17 = 0;
LABEL_8:

  return v17;
}

+ (id)generatedValidatedExternalSyndicationResourceOfType:(unsigned int)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 fileURL:(id)a6 requireFileToBePresent:(BOOL)a7 uniformTypeIdentifier:(id)a8
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  PLSyndicationValidatedExternalResource *v16;
  uint64_t v17;

  v9 = a7;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v14 = a6;
  v15 = a8;
  v16 = objc_alloc_init(PLSyndicationValidatedExternalResource);
  -[PLValidatedExternalResource setResourceType:](v16, "setResourceType:", v12);
  -[PLValidatedExternalResource setVersion:](v16, "setVersion:", v11);
  -[PLValidatedExternalResource setRecipeID:](v16, "setRecipeID:", v10);
  -[PLValidatedExternalResource setUniformTypeIdentifier:](v16, "setUniformTypeIdentifier:", v15);

  if (v14
    && (-[PLValidatedExternalResource setFileURL:](v16, "setFileURL:", v14),
        (v17 = objc_msgSend(a1, "_getURLDataLength:", v14)) != 0))
  {
    -[PLValidatedExternalResource setDataLength:](v16, "setDataLength:", v17);
  }
  else if (v9)
  {

    v16 = 0;
  }

  return v16;
}

id __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextForMigrationWithName:persistentStoreCoordinator:concurrencyType:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "transactionAuthor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionAuthor:", v6);

  return v5;
}

void __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0;
  v19 = 0;
  v7 = *(void **)(a1 + 40);
  v17 = 0;
  v8 = objc_msgSend(v7, "_installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:includeLegacyCloudResources:outResourcesStoreCount:error:", v6, 1, 0, 1, &v19, &v17);
  v9 = v17;
  if (!v8
    || (v11 = *(_QWORD *)(a1 + 32),
        v10 = *(void **)(a1 + 40),
        v16 = v9,
        v12 = objc_msgSend(v10, "recoverSupplementalResourcesForAsset:usingSidecarFinder:outResourcesStoreCount:error:", v6, v11, &v18, &v16), v13 = v16, v9, v9 = v13, (v12 & 1) == 0))
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v15;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Error creating internal resources for asset during migration for UUID: %@, reason: %@", buf, 0x16u);

    }
    *a4 = 1;
  }

}

id __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(v2, "setName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setPersistentStoreCoordinator:", *(_QWORD *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_2;
  v7[3] = &unk_1E3677530;
  v3 = v2;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "performBlockAndWait:", v7);
  v4 = v10;
  v5 = v3;

  return v5;
}

void __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unsigned int *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v4, "setThumbnailIndex:", 4294967293);
    v4 = v7;
  }
  objc_msgSend(v4, "setImageRequestHints:", 0);
  objc_msgSend(v7, "recalculateImageRequestHints");
  v5 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));

}

void __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));

}

@end
