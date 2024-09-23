@implementation TRIClientTreatment(TRIUtil)

- (id)_triCollectMetadataForAssetsWithTest:()TRIUtil
{
  unsigned int (**v4)(id, void *, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  TRITreatmentQualifiedAssetIndex *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  $61A80719B04F7407D3E47539F1B23CAA v32;
  TRICKAssetMetadata *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  TRICKAssetMetadata *v37;
  void *v38;
  TRICKAssetMetadata *v39;
  TRIRequiredCloudKitAsset *v40;
  void *v41;
  void *v42;
  TRIRequiredCloudKitAsset *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int (**v63)(id, void *, void *, void *);
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  unsigned __int8 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  v6 = (void *)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v65 = a1;
  objc_msgSend(a1, "factorLevelArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
  if (v69)
  {
    v8 = *(_QWORD *)v73;
    v62 = v6;
    v63 = v4;
    v64 = v7;
    v59 = v5;
    v68 = *(_QWORD *)v73;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v73 != v8)
        objc_enumerationMutation(v7);
      v10 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v9);
      objc_msgSend(v10, "factor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasName");

      if ((v12 & 1) == 0)
        break;
      objc_msgSend(v10, "factor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasNamespaceName");

      if ((v14 & 1) == 0)
      {
        TRILogCategory_Server();
        v49 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        objc_msgSend(v65, "treatmentId");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v77 = v50;
        v51 = "Treatment %@ has missing namespace name.";
        goto LABEL_35;
      }
      v71 = 0;
      objc_msgSend(v10, "level");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileOrDirectoryLevelWithIsDir:", &v71);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        if (!objc_msgSend(v16, "hasAsset")
          || (objc_msgSend(v17, "asset"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "hasAssetId"),
              v18,
              (v19 & 1) == 0))
        {
          TRILogCategory_Server();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v65, "treatmentId");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "factor");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "name");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v77 = v46;
            v78 = 2114;
            v79 = v48;
            _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Treatment %@ has missing asset id for factor %{public}@.", buf, 0x16u);

          }
LABEL_31:
          v5 = v59;

LABEL_32:
          v44 = 0;
          goto LABEL_33;
        }
        objc_msgSend(v17, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "assetId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateAssetId();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          TRILogCategory_Server();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v65, "treatmentId");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "asset");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "assetId");
            v55 = v15;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "factor");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "name");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v77 = v53;
            v78 = 2114;
            v79 = v56;
            v80 = 2114;
            v81 = v58;
            _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Treatment %@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

            v7 = v64;
            v15 = v55;

          }
          goto LABEL_31;
        }
        v70 = v15;
        v23 = v71;
        v24 = (void *)MEMORY[0x1D8232A5C]();
        if (v4[2](v4, v22, v10, v17))
        {
          v66 = v23;
          v67 = v24;
          objc_msgSend(v15, "metadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:](TRIAssetMetadataReservedKeys, "isEncryptedForMetadata:", v25);

          v27 = [TRITreatmentQualifiedAssetIndex alloc];
          objc_msgSend(v65, "treatmentId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "asset");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[TRITreatmentQualifiedAssetIndex initWithTreatmentId:index:](v27, "initWithTreatmentId:index:", v28, objc_msgSend(v29, "cloudKitIndex"));

          objc_msgSend(v70, "metadata");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32.var0 = (unint64_t)+[TRIAssetMetadataReservedKeys compressionModeForMetadata:](TRIAssetMetadataReservedKeys, "compressionModeForMetadata:", v31);

          v33 = [TRICKAssetMetadata alloc];
          if (v26)
          {
            objc_msgSend(v10, "factor");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "namespaceName");
            v34 = objc_claimAutoreleasedReturnValue();
            v60 = (void *)v34;
          }
          else
          {
            v34 = 0;
          }
          objc_msgSend(v17, "asset");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "size");
          v37 = v33;
          v38 = (void *)v30;
          v39 = -[TRICKAssetMetadata initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:](v37, "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", v66, v34, v30, v36, v32.var0);

          if (v26)
          {

          }
          v40 = [TRIRequiredCloudKitAsset alloc];
          objc_msgSend(v10, "factor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[TRIRequiredCloudKitAsset initWithFactorName:isInstalled:isOnDemand:assetId:metadata:](v40, "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", v42, 0, objc_msgSend(v17, "isOnDemand"), v22, v39);

          v6 = v62;
          objc_msgSend(v62, "addObject:", v43);

          v4 = v63;
          v7 = v64;
          v24 = v67;
        }
        objc_autoreleasePoolPop(v24);

        v15 = v70;
        v8 = v68;
      }

      if (v69 == ++v9)
      {
        v5 = v59;
        v69 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        if (v69)
          goto LABEL_3;
        goto LABEL_22;
      }
    }
    TRILogCategory_Server();
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

      v5 = v59;
      goto LABEL_32;
    }
    objc_msgSend(v65, "treatmentId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v77 = v50;
    v51 = "Treatment %@ has missing factor name.";
LABEL_35:
    _os_log_error_impl(&dword_1D207F000, v49, OS_LOG_TYPE_ERROR, v51, buf, 0xCu);

    goto LABEL_28;
  }
LABEL_22:

  v44 = v6;
LABEL_33:

  objc_autoreleasePoolPop(v5);
  return v44;
}

- (id)_triRequiredCKAssetsForInstallationWithAssetStore:()TRIUtil subscriptionSettings:aliasToUnaliasMap:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__TRIClientTreatment_TRIUtil___triRequiredCKAssetsForInstallationWithAssetStore_subscriptionSettings_aliasToUnaliasMap___block_invoke;
  v16[3] = &unk_1E9336A50;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  objc_msgSend(a1, "_triCollectMetadataForAssetsWithTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (TRIGenericRequiredAssets)requiredAssetsForInstallationForNamespace:()TRIUtil assetStore:maProvider:subscriptionSettings:aliasToUnaliasMap:
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  TRIGenericRequiredAssets *v18;
  void *v19;
  TRIGenericRequiredAssets *v20;

  if (a7)
    v11 = a7;
  else
    v11 = (void *)MEMORY[0x1E0C9AA70];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a1, "_triRequiredCKAssetsForInstallationWithAssetStore:subscriptionSettings:aliasToUnaliasMap:", v15, v13, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_triRequiredMAAssetsForInstallationWithAssetStore:subscriptionSettings:maProvider:aliasToUnaliasMap:", v15, v13, v14, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [TRIGenericRequiredAssets alloc];
  if (v16)
    v19 = v16;
  else
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = -[TRIGenericRequiredAssets initWithCloudKit:mobileAsset:](v18, "initWithCloudKit:mobileAsset:", v19, v17);

  return v20;
}

- (id)_triRequiredMAAssetsForInstallationWithAssetStore:()TRIUtil subscriptionSettings:maProvider:aliasToUnaliasMap:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *context;
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v27 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  context = (void *)MEMORY[0x1D8232A5C]();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1D8232A5C]();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__58;
  v42 = __Block_byref_object_dispose__58;
  v43 = (id)objc_opt_new();
  v16 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke;
  v37[3] = &unk_1E9336A78;
  v37[4] = a1;
  v37[5] = &v38;
  if ((objc_msgSend(a1, "_triEnumerateMAFactorLevelsWithBlock:", v37) & 1) != 0 && v39[5])
  {
    objc_msgSend(v11, "installedAssetsMatchingFullAssetIds:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v35[0] = v16;
      v35[1] = 3221225472;
      v35[2] = __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_194;
      v35[3] = &unk_1E93363F0;
      v36 = v14;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v35);

      v18 = 0;
    }
    else
    {
      v20 = v13;
      v18 = 1;
    }

  }
  else
  {
    v19 = v13;
    v18 = 1;
  }
  _Block_object_dispose(&v38, 8);

  objc_autoreleasePoolPop(v15);
  v21 = v13;
  if (!v18)
  {
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_2;
    v28[3] = &unk_1E9336AA0;
    v34 = a2;
    v29 = v12;
    v30 = a1;
    v31 = v14;
    v32 = v10;
    v22 = v13;
    v33 = v22;
    if ((objc_msgSend(a1, "_triEnumerateMAFactorLevelsWithBlock:", v28) & 1) != 0)
      v23 = v22;
    else
      v23 = (id)objc_opt_new();
    v21 = v23;

  }
  objc_autoreleasePoolPop(context);

  return v21;
}

- (uint64_t)_triEnumerateMAFactorLevelsWithBlock:()TRIUtil
{
  void (**v4)(id, void *, void *, void *, uint8_t *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a1, "factorLevelArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v23 = v5;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasLevel") & 1) == 0)
        {
          TRILogCategory_Server();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(a1, "treatmentId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v22;
            _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has missing level.", buf, 0xCu);

          }
          v19 = 0;
          goto LABEL_23;
        }
        if (!objc_msgSend(v11, "hasFactor")
          || (objc_msgSend(v11, "factor"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "hasName"),
              v12,
              (v13 & 1) == 0))
        {
          TRILogCategory_Server();
          v14 = objc_claimAutoreleasedReturnValue();
          v5 = v23;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(a1, "treatmentId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v21;
            _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has missing factor name.", buf, 0xCu);

          }
          v19 = 0;
          goto LABEL_24;
        }
        objc_msgSend(v11, "level");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = -[NSObject levelOneOfCase](v14, "levelOneOfCase");
        if (v4)
        {
          if (v15 == 104)
          {
            buf[0] = 0;
            objc_msgSend(v11, "factor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject mobileAssetReferenceValue](v14, "mobileAssetReferenceValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject metadata](v14, "metadata");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v16, v17, v18, buf);

            if (buf[0])
            {
              v19 = 1;
LABEL_23:
              v5 = v23;
LABEL_24:

              goto LABEL_25;
            }
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v19 = 1;
      v5 = v23;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v19 = 1;
  }
LABEL_25:

  objc_autoreleasePoolPop(v5);
  return v19;
}

- (id)unlinkedOnDemandAssets
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "_triCollectMetadataForAssetsWithTest:", &__block_literal_global_35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__TRIClientTreatment_TRIUtil__unlinkedOnDemandAssets__block_invoke_2;
  v6[3] = &unk_1E9332380;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

@end
