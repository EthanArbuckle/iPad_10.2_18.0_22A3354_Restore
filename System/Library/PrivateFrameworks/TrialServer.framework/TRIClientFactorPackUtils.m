@implementation TRIClientFactorPackUtils

+ (BOOL)_enumerateAssetFactorLevelsInFactorPack:(id)a3 trialAssetBlock:(id)a4 maAssetBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  NSObject *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v7, "selectedNamespace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasName");

  if ((v12 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v24 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFactorPack_trialAssetBlock_maAssetBlock___block_invoke;
    v17[3] = &unk_1E9336328;
    v18 = v7;
    p_buf = &buf;
    v19 = v8;
    v20 = v9;
    objc_msgSend(v18, "enumerateFactorLevelsWithBlock:", v17);
    v13 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) == 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "factorPackId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", (uint8_t *)&buf, 0xCu);

    }
    v13 = 0;
  }
  objc_autoreleasePoolPop(v10);

  return v13;
}

void __97__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFactorPack_trialAssetBlock_maAssetBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(v5, "hasLevel") & 1) == 0)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "factorPackId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    v16 = "Factor pack %{public}@ has missing level.";
LABEL_19:
    _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_10;
  }
  if (objc_msgSend(v5, "hasFactor"))
  {
    objc_msgSend(v5, "factor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasName");

    if ((v7 & 1) != 0)
    {
      buf[0] = 0;
      objc_msgSend(v5, "level");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileOrDirectoryLevelWithIsDir:", buf);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 40);
        if (v10)
        {
          v19 = 0;
          objc_msgSend(v5, "factor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "metadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *, void *, _QWORD, char *))(v10 + 16))(v10, v12, v9, v13, buf[0], &v19);
          goto LABEL_15;
        }
      }
      else if (objc_msgSend(v8, "levelOneOfCase") == 104)
      {
        v17 = *(_QWORD *)(a1 + 48);
        if (v17)
        {
          v19 = 0;
          objc_msgSend(v5, "factor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "mobileAssetReferenceValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "metadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *, void *, char *))(v17 + 16))(v17, v12, v13, v18, &v19);

LABEL_15:
          if (v19)
            *a3 = 1;
        }
      }

      goto LABEL_11;
    }
  }
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "factorPackId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    v16 = "Factor pack %{public}@ has missing factor name.";
    goto LABEL_19;
  }
LABEL_10:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  *a3 = 1;
LABEL_11:

}

+ (void)_enumerateAssetFactorLevelsInFlatBufferStorage:(id)a3 trialAssetBlock:(id)a4 maAssetBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v13, "levels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke;
  v14[3] = &unk_1E9336378;
  v11 = v7;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  objc_autoreleasePoolPop(v9);
}

void __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *, void *);
  void *v44;
  void *v45;
  _QWORD v46[4];
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "levelType") == 5)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "levelAsTrialAssetVal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPath:", v9);

    if (objc_msgSend(v8, "hasDownloadSize"))
    {
      v10 = objc_msgSend(v8, "downloadSize");
      objc_msgSend(v7, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSize:", v10);

    }
    if (objc_msgSend(v8, "hasIsOnDemand"))
      objc_msgSend(v7, "setIsOnDemand:", objc_msgSend(v8, "isOnDemand"));
    objc_msgSend(v8, "assetId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAssetId:", v12);

    v14 = objc_msgSend(v8, "cloudKitMetadataType");
    if (v14 != 1)
    {
      if (v14)
      {
LABEL_31:
        v34 = objc_msgSend(v8, "fileType");
        if (!*(_QWORD *)(a1 + 32))
        {
LABEL_36:

          goto LABEL_37;
        }
        v35 = v34 == 0;
        v36 = (void *)objc_opt_new();
        objc_msgSend(v6, "metadataAsDict");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_191;
        v46[3] = &unk_1E9336350;
        v22 = &v47;
        v47 = v36;
        v23 = v36;
        objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v46);

        buf[0] = 0;
        v38 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, id, _BOOL8, uint8_t *))(v38 + 16))(v38, v39, v7, v23, v35, buf);

LABEL_33:
        if (buf[0])
          *a4 = 1;

        goto LABEL_36;
      }
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v16;
      v50 = 2112;
      v51 = CFSTR("test");
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "cloud kit meta data type as none for: %{public}@: %@", buf, 0x16u);
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v8, "cloudKitMetadataAsTreatment");
    v15 = objc_claimAutoreleasedReturnValue();
    v26 = -[NSObject container](v15, "container");
    if (v26 == 2)
    {
      objc_msgSend(v7, "asset");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 2;
    }
    else if (v26 == 1)
    {
      objc_msgSend(v7, "asset");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 1;
    }
    else
    {
      if (v26)
      {
LABEL_26:
        if (-[NSObject hasAssetIndex](v15, "hasAssetIndex"))
        {
          v31 = -[NSObject assetIndex](v15, "assetIndex");
          objc_msgSend(v7, "asset");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setCloudKitIndex:", v31);

        }
        -[NSObject treatmentId](v15, "treatmentId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "asset");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setTreatmentId:", v16);

        goto LABEL_29;
      }
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "cloudkit container unknown for: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v7, "asset");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 0;
    }
    objc_msgSend(v28, "setCloudKitContainer:", v30);

    goto LABEL_26;
  }
  if (objc_msgSend(v6, "levelType") == 6 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v6, "levelAsMaRefVal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v7, "hasIsOnDemand"))
      objc_msgSend(v8, "setIsOnDemand:", objc_msgSend(v7, "isOnDemand"));
    if (objc_msgSend(v7, "hasDownloadSize"))
      objc_msgSend(v8, "setSize:", objc_msgSend(v7, "downloadSize"));
    objc_msgSend(v7, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssetType:", v17);

    objc_msgSend(v7, "specifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssetSpecifier:", v18);

    objc_msgSend(v7, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssetVersion:", v19);

    v20 = (void *)objc_opt_new();
    objc_msgSend(v6, "metadataAsDict");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = MEMORY[0x1E0C809B0];
    v42 = 3221225472;
    v43 = __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_2;
    v44 = &unk_1E9336350;
    v22 = &v45;
    v45 = v20;
    v23 = v20;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", &v41);

    buf[0] = 0;
    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "name", v41, v42, v43, v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id, uint8_t *))(v24 + 16))(v24, v25, v8, v23, buf);

    goto LABEL_33;
  }
LABEL_37:

}

void __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "val");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "val");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

+ (BOOL)enumerateMetadataForAssetsInFactorPack:(id)a3 flatbufferFactorLevels:(id)a4 assetStore:(id)a5 maProvider:(id)a6 aliasToUnaliasMap:(id)a7 subscribedFactors:(id)a8 ckBlock:(id)a9 maBlock:(id)a10
{
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  int v22;
  int v23;
  uint64_t *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  int v38;
  NSObject *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *context;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  SEL v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t *v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint8_t *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  uint64_t *v76;
  uint8_t v77[8];
  uint8_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v16 = (unint64_t)a3;
  v17 = (unint64_t)a4;
  v46 = a5;
  v49 = a6;
  v18 = a7;
  v19 = a8;
  v47 = a9;
  v48 = a10;
  if (!(v16 | v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIClientFactorPackUtils.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorLevels != nil || factorPack != nil"));

  }
  context = (void *)MEMORY[0x1D8232A5C]();
  v50 = (void *)objc_opt_new();
  v20 = (void *)MEMORY[0x1D8232A5C]();
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__53;
  v87 = __Block_byref_object_dispose__53;
  v88 = (id)objc_opt_new();
  *(_QWORD *)v77 = 0;
  v78 = v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__53;
  v81 = __Block_byref_object_dispose__53;
  v82 = (id)objc_opt_new();
  if (v16)
  {
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke;
    v72[3] = &unk_1E93363A0;
    v73 = v18;
    v74 = v19;
    v75 = (id)v16;
    v76 = &v83;
    v21 = objc_msgSend(a1, "_enumerateAssetFactorLevelsInFactorPack:trialAssetBlock:maAssetBlock:", v75, 0, v72);

    if ((v21 & 1) == 0)
      goto LABEL_20;
  }
  v22 = _os_feature_enabled_impl();
  if (v17)
    v23 = v22;
  else
    v23 = 0;
  if (v23 != 1)
    goto LABEL_17;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_207;
  v68[3] = &unk_1E93363C8;
  v69 = v18;
  v70 = v19;
  v71 = v77;
  objc_msgSend(a1, "_enumerateAssetFactorLevelsInFlatBufferStorage:trialAssetBlock:maAssetBlock:", v17, 0, v68);
  if (v16 && (objc_msgSend((id)v84[5], "isEqualToSet:", *((_QWORD *)v78 + 5)) & 1) == 0)
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v41 = *((_QWORD *)v78 + 5);
      v42 = v84[5];
      *(_DWORD *)buf = 138412546;
      v90 = v41;
      v91 = 2112;
      v92 = v42;
      _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "asset factor levels for flatbuffers: %@ and protobufs: %@ do not match", buf, 0x16u);
    }
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    v24 = v84;
    v25 = *((id *)v78 + 5);
    v26 = v24[5];
    v24[5] = (uint64_t)v25;
LABEL_15:

  }
LABEL_17:
  if (!v84[5])
  {
LABEL_20:
    v28 = 1;
    goto LABEL_23;
  }
  objc_msgSend(v49, "installedAssetsMatchingFullAssetIds:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_209;
    v66[3] = &unk_1E93363F0;
    v67 = v50;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v66);

    v28 = 0;
  }
  else
  {
    v28 = 1;
  }

LABEL_23:
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(&v83, 8);
  objc_autoreleasePoolPop(v20);
  if (!v28)
  {
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    LOBYTE(v86) = 0;
    v30 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_2;
    v59[3] = &unk_1E9336418;
    v31 = v18;
    v60 = v31;
    v32 = (id)v17;
    v61 = v32;
    v33 = (id)v16;
    v62 = v33;
    v65 = &v83;
    v63 = v46;
    v64 = v47;
    v34 = (void *)MEMORY[0x1D8232C48](v59);
    v51[0] = v30;
    v51[1] = 3221225472;
    v51[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_215;
    v51[3] = &unk_1E9336440;
    v52 = v31;
    v57 = a2;
    v58 = a1;
    v35 = v32;
    v53 = v35;
    v36 = v33;
    v54 = v36;
    v55 = v50;
    v56 = v48;
    v37 = (void *)MEMORY[0x1D8232C48](v51);
    v38 = _os_feature_enabled_impl() ^ 1;
    if (!v17)
      LOBYTE(v38) = 1;
    if ((v38 & 1) == 0)
    {
      objc_msgSend(a1, "_enumerateAssetFactorLevelsInFlatBufferStorage:trialAssetBlock:maAssetBlock:", v35, v34, v37);
LABEL_31:
      v29 = *((_BYTE *)v84 + 24) == 0;
LABEL_36:

      _Block_object_dispose(&v83, 8);
      goto LABEL_37;
    }
    if (v16)
    {
      if (objc_msgSend(a1, "_enumerateAssetFactorLevelsInFactorPack:trialAssetBlock:maAssetBlock:", v36, v34, v37))goto LABEL_31;
    }
    else
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v77 = 0;
        _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Could not enumerate factor levels in factor pack since pack file is nil", v77, 2u);
      }

    }
    v29 = 0;
    goto LABEL_36;
  }
  v29 = 0;
LABEL_37:

  objc_autoreleasePoolPop(context);
  return v29;
}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v10;
  v14 = v13;

  if (!objc_msgSend(v8, "isOnDemand")
    || objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14))
  {
    if (objc_msgSend(v8, "hasAssetType")
      && objc_msgSend(v8, "hasAssetSpecifier")
      && (objc_msgSend(v8, "hasAssetVersion") & 1) != 0)
    {
      v15 = objc_alloc(MEMORY[0x1E0DC0AB0]);
      objc_msgSend(v8, "assetType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithType:specifier:version:", v16, v17, v18);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v19);
    }
    else
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "factorPackId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v23;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has MA reference with missing information.", (uint8_t *)&v24, 0xCu);

      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

      *a5 = 1;
    }
  }

}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_207(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v10;
  v14 = v13;

  if (!objc_msgSend(v8, "isOnDemand")
    || objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14))
  {
    if (objc_msgSend(v8, "hasAssetType")
      && objc_msgSend(v8, "hasAssetSpecifier")
      && (objc_msgSend(v8, "hasAssetVersion") & 1) != 0)
    {
      v15 = objc_alloc(MEMORY[0x1E0DC0AB0]);
      objc_msgSend(v8, "assetType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithType:specifier:version:", v16, v17, v18);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v19);
    }
    else
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = 138543362;
        v24 = v14;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has MA reference with missing information.", (uint8_t *)&v23, 0xCu);
      }

      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

      *a5 = 1;
    }
  }

}

uint64_t __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_209(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, _BYTE *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  TRICKAssetMetadata *v35;
  void *v36;
  void *v37;
  TRICKAssetMetadata *v38;
  TRIRequiredCloudKitAsset *v39;
  void *v40;
  void *v41;
  $61A80719B04F7407D3E47539F1B23CAA v42;
  uint64_t v43;
  _BYTE *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = *(void **)(a1 + 32);
  v14 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v14;
  v18 = v17;

  v19 = _os_feature_enabled_impl();
  v20 = *(void **)(a1 + 40);
  if (v20 && v19)
  {
    objc_msgSend(v20, "sourceAsFactorPackId");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "factorPackId");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;
  if (objc_msgSend(v11, "hasAsset")
    && (objc_msgSend(v11, "asset"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "hasAssetId"),
        v23,
        (v24 & 1) != 0))
  {
    v44 = a6;
    objc_msgSend(v11, "asset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "assetId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateAssetId();
    v27 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v27;
    if (v27)
    {
      v28 = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:](TRIAssetMetadataReservedKeys, "isEncryptedForMetadata:", v12);
      v42.var0 = (unint64_t)+[TRIAssetMetadataReservedKeys compressionModeForMetadata:](TRIAssetMetadataReservedKeys, "compressionModeForMetadata:", v12);
      v29 = *(void **)(a1 + 40);
      if (v29)
        v30 = v19;
      else
        v30 = 0;
      if (v30 == 1)
      {
        objc_msgSend(v29, "namespaceName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "selectedNamespace");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v35 = [TRICKAssetMetadata alloc];
      if (v28)
        v36 = v31;
      else
        v36 = 0;
      objc_msgSend(v11, "asset", v42.var0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[TRICKAssetMetadata initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:](v35, "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", a5, v36, 0, objc_msgSend(v37, "size"), v43);

      v39 = -[TRIRequiredCloudKitAsset initWithFactorName:isInstalled:isOnDemand:assetId:metadata:]([TRIRequiredCloudKitAsset alloc], "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", v18, objc_msgSend(*(id *)(a1 + 56), "hasAssetWithIdentifier:type:", v45, 0), objc_msgSend(v11, "isOnDemand"), v45, v38);
      buf[0] = 0;
      (*(void (**)(_QWORD, TRIRequiredCloudKitAsset *, uint64_t, uint8_t *))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v39, objc_msgSend(v11, "hasPath"), buf);
      if (buf[0])
        *v44 = 1;

    }
    else
    {
      TRILogCategory_Server();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "asset");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "assetId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v22;
        v48 = 2112;
        v49 = v41;
        v50 = 2114;
        v51 = v18;
        _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has unsuitable asset id \"{public}%@\" for factor %{public}@.", buf, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      *v44 = 1;
    }

  }
  else
  {
    TRILogCategory_Server();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v47 = v22;
      v48 = 2114;
      v49 = v18;
      _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing asset id for factor %{public}@.", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *a6 = 1;
  }

}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_215(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  TRIMAAssetMetadata *v23;
  uint64_t v24;
  void *v25;
  TRIMAAssetMetadata *v26;
  uint64_t v27;
  TRIRequiredMAAsset *v28;
  uint64_t v29;
  TRIRequiredMAAsset *v30;
  void *v31;
  void *v32;
  void *v33;

  v7 = a3;
  v8 = *(void **)(a1 + 32);
  v9 = a4;
  v10 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v10;
  v14 = v13;

  if ((objc_msgSend(v7, "hasAssetType") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), CFSTR("TRIClientFactorPackUtils.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maRef.hasAssetType"));

  }
  if ((objc_msgSend(v7, "hasAssetSpecifier") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), CFSTR("TRIClientFactorPackUtils.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maRef.hasAssetSpecifier"));

  }
  if ((objc_msgSend(v7, "hasAssetVersion") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), CFSTR("TRIClientFactorPackUtils.m"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maRef.hasAssetVersion"));

  }
  v15 = objc_alloc(MEMORY[0x1E0DC0AB0]);
  objc_msgSend(v7, "assetType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetSpecifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithType:specifier:version:", v16, v17, v18);

  v20 = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:](TRIAssetMetadataReservedKeys, "isEncryptedForMetadata:", v9);
  if (*(_QWORD *)(a1 + 40) && _os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 40), "namespaceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "selectedNamespace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v23 = [TRIMAAssetMetadata alloc];
  v24 = objc_msgSend(v7, "size");
  if (v20)
    v25 = v21;
  else
    v25 = 0;
  v26 = -[TRIMAAssetMetadata initWithDownloadSize:namespaceNameForEncryptionKey:](v23, "initWithDownloadSize:namespaceNameForEncryptionKey:", v24, v25);
  v27 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v19);
  v28 = [TRIRequiredMAAsset alloc];
  if (objc_msgSend(v7, "hasIsOnDemand"))
    v29 = objc_msgSend(v7, "isOnDemand");
  else
    v29 = 0;
  v30 = -[TRIRequiredMAAsset initWithFactorName:isInstalled:isOnDemand:metadata:fullAssetId:](v28, "initWithFactorName:isInstalled:isOnDemand:metadata:fullAssetId:", v14, v27, v29, v26, v19);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

+ (id)requiredAssetsForInstallationWithFactorPack:(id)a3 assetStore:(id)a4 maProvider:(id)a5 subscriptionSettings:(id)a6 aliasToUnaliasMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  TRIGenericRequiredAssets *v30;
  NSObject *v31;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "selectedNamespace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasName");

  if ((v18 & 1) != 0)
  {
    v35 = v13;
    v19 = (void *)MEMORY[0x1E0C9AA60];
    v34 = a1;
    if (v15)
    {
      objc_msgSend(v12, "selectedNamespace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "subscribedFactorsForNamespaceName:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      if (v22)
        v19 = (void *)v22;
    }
    v23 = (void *)objc_opt_new();
    v24 = (void *)objc_opt_new();
    if (v16)
      v25 = v16;
    else
      v25 = (id)MEMORY[0x1E0C9AA70];
    v26 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke;
    v39[3] = &unk_1E9336468;
    v40 = v19;
    v27 = v23;
    v41 = v27;
    v36[0] = v26;
    v36[1] = 3221225472;
    v36[2] = __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke_2;
    v36[3] = &unk_1E9336490;
    v28 = v40;
    v37 = v28;
    v29 = v24;
    v38 = v29;
    v13 = v35;
    v30 = 0;
    if (objc_msgSend(v34, "enumerateMetadataForAssetsInFactorPack:flatbufferFactorLevels:assetStore:maProvider:aliasToUnaliasMap:subscribedFactors:ckBlock:maBlock:", v12, 0, v35, v14, v25, v28, v39, v36))v30 = -[TRIGenericRequiredAssets initWithCloudKit:mobileAsset:]([TRIGenericRequiredAssets alloc], "initWithCloudKit:mobileAsset:", v27, v29);

  }
  else
  {
    TRILogCategory_Server();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "factorPackId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v33;
      _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", buf, 0xCu);

    }
    v30 = 0;
  }

  return v30;
}

void __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!objc_msgSend(v5, "isOnDemand")
    || (v3 = *(void **)(a1 + 32),
        objc_msgSend(v5, "factorName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4),
        v4,
        (_DWORD)v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!objc_msgSend(v5, "isOnDemand")
    || (v3 = *(void **)(a1 + 32),
        objc_msgSend(v5, "factorName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4),
        v4,
        (_DWORD)v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

+ (id)unlinkedOnDemandAssetsWithFactorPack:(id)a3 flatbufferFactorLevels:(id)a4 factorPackPath:(id)a5 assetStore:(id)a6 maProvider:(id)a7 aliasToUnaliasMap:(id)a8 subscribedFactors:(id)a9 unlinkedMAAssetsOnDisk:(id *)a10
{
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  TRIGenericRequiredAssets *v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;

  v17 = (unint64_t)a3;
  v18 = (unint64_t)a4;
  v40 = a5;
  v38 = a6;
  v19 = a7;
  v20 = a8;
  v37 = a9;
  v41 = (void *)v17;
  if (!(v17 | v18))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIClientFactorPackUtils.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPack != nil || factorLevels != nil"));

  }
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  v25 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke;
  v50[3] = &unk_1E932FE30;
  v26 = v24;
  v51 = v26;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v50);
  v39 = v20;
  if (v20)
    v27 = v20;
  else
    v27 = (id)MEMORY[0x1E0C9AA70];
  v48[0] = v25;
  v48[1] = 3221225472;
  v48[2] = __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_2;
  v48[3] = &unk_1E93364B8;
  v28 = v21;
  v49 = v28;
  v42[0] = v25;
  v42[1] = 3221225472;
  v42[2] = __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_3;
  v42[3] = &unk_1E93364E0;
  v29 = v26;
  v43 = v29;
  v30 = v40;
  v44 = v30;
  v31 = v19;
  v45 = v31;
  v32 = v23;
  v46 = v32;
  v33 = v22;
  v47 = v33;
  if (objc_msgSend(a1, "enumerateMetadataForAssetsInFactorPack:flatbufferFactorLevels:assetStore:maProvider:aliasToUnaliasMap:subscribedFactors:ckBlock:maBlock:", v41, v18, v38, v31, v27, v37, v48, v42))
  {
    objc_storeStrong(a10, v23);
    v34 = -[TRIGenericRequiredAssets initWithCloudKit:mobileAsset:]([TRIGenericRequiredAssets alloc], "initWithCloudKit:mobileAsset:", v28, v33);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

uint64_t __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a2, a3);
}

void __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isOnDemand") && (a3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "factorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "factorName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  +[TRIFactorPackStorage relPathForMAReferenceWithFactorName:](TRIFactorPackStorage, "relPathForMAReferenceWithFactorName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isOnDemand"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    if (v13)
    {
      v39 = 0;
      v14 = *(void **)(a1 + 48);
      objc_msgSend(v3, "fullAssetId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createAutoAssetWithId:decryptionKey:error:", v15, 0, &v39);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        TRILogCategory_Server();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v33 = v39;
          objc_msgSend(v3, "fullAssetId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v33;
          v42 = 2114;
          v43 = v34;
          _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to init MAAutoAsset: %{public}@, treating as unlinked: %{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
        goto LABEL_32;
      }
      objc_msgSend(v16, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", CFSTR("test asset presence"), 0, 0, 0, 0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (!v17)
      {
        TRILogCategory_Server();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v16;
          _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Linked MAAutoAsset appears to be missing, treating as unlinked: %{public}@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
        goto LABEL_31;
      }
      v37 = (void *)v17;
      v19 = (id)objc_msgSend(v16, "endLockUsageSync:", CFSTR("test asset presence"));
      v38 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v11, 4, &v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v38;
      objc_msgSend(v20, "triTrim");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        TRILogCategory_Server();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v11;
          _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Unable to read MA path, even though it should exist at path: %{public}@", buf, 0xCu);
        }

        goto LABEL_30;
      }
      if (objc_msgSend(v22, "length"))
      {
        v36 = v21;
        objc_msgSend(v37, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v22);

        if ((v24 & 1) == 0)
        {
          TRILogCategory_Server();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v37, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v35;
            v42 = 2114;
            v43 = v22;
            _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Path vended by MA: %{public}@ differs from path held in cache: %{public}@, re-downloading", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
          v21 = v36;
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "fileExistsAtPath:", v22);

        v21 = v36;
        if ((v26 & 1) != 0)
        {
LABEL_30:

          v18 = v37;
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
        TRILogCategory_Server();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v22;
          _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Asset at path held in cache: %{public}@ doesn't exist, re-downloading", buf, 0xCu);
        }

        v28 = *(void **)(a1 + 64);
      }
      else
      {
        v28 = *(void **)(a1 + 56);
      }
      objc_msgSend(v28, "addObject:", v3);
      goto LABEL_30;
    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
  }
LABEL_33:

}

+ (id)uniqueAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  TRIGenericUniqueRequiredAssets *v11;
  TRIGenericUniqueRequiredAssets *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "cloudKit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke;
  v19[3] = &unk_1E9332380;
  v20 = v4;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);

  objc_msgSend(v3, "mobileAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v7;
  v15 = 3221225472;
  v16 = __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke_2;
  v17 = &unk_1E93318B8;
  v18 = v5;
  v10 = v5;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v14);

  v11 = [TRIGenericUniqueRequiredAssets alloc];
  v12 = -[TRIGenericUniqueRequiredAssets initWithCloudKit:mobileAsset:](v11, "initWithCloudKit:mobileAsset:", v8, v10, v14, v15, v16, v17);

  return v12;
}

void __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

void __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "fullAssetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

+ (id)aliasesInNamespace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  NSObject *v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  NSObject *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D8232A5C]();
    v5 = (void *)MEMORY[0x1E0DC0AD8];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "namespaceDescriptorsDefaultDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadWithNamespaceName:fromDirectory:", v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v8, "namespaceName"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", v3),
          v9,
          v10))
    {
      objc_msgSend(v8, "factorsAbsolutePathAsOwner:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v47 = 0;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v11, 8, &v47);
        v13 = v47;
        if (v12)
        {
          v46 = v13;
          objc_msgSend(MEMORY[0x1E0DC0EA8], "parseFromData:error:", v12, &v46);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v46;

          v40 = v14;
          if (v14)
          {
            v16 = objc_opt_new();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            -[NSObject factorLevelArray](v14, "factorLevelArray");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
            if (v18)
            {
              v19 = v18;
              v34 = v15;
              v35 = v12;
              v41 = v16;
              v36 = v11;
              v37 = v8;
              v38 = v4;
              v39 = v3;
              v20 = *(_QWORD *)v43;
              while (1)
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v43 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                  objc_msgSend(v22, "factor", v34, v35, v36, v37, v38, v39);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v23, "hasName"))
                  {
                    objc_msgSend(v22, "factor");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v24, "hasAlias"))
                    {
                      objc_msgSend(v22, "factor");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "alias");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(v26, "isEqualToString:", &stru_1E9336E60);

                      if ((v27 & 1) != 0)
                        continue;
                      objc_msgSend(v22, "factor");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "name");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "factor");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "alias");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject setObject:forKey:](v41, "setObject:forKey:", v24, v29);

                    }
                  }

                }
                v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
                if (!v19)
                {
                  v30 = 0;
                  v4 = v38;
                  v3 = v39;
                  v11 = v36;
                  v8 = v37;
                  v15 = v34;
                  v12 = v35;
                  v16 = v41;
                  goto LABEL_34;
                }
              }
            }
            v30 = 0;
          }
          else
          {
            TRILogCategory_Server();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v50 = v11;
              v51 = 2114;
              v52 = v15;
              _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Failed to parse treatment from file %{public}@: %{public}@", buf, 0x16u);
            }
            v16 = 0;
            v30 = 1;
          }
LABEL_34:

          v31 = v40;
        }
        else
        {
          TRILogCategory_Server();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v11;
            v51 = 2114;
            v52 = v13;
            _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to read data from file %{public}@: %{public}@", buf, 0x16u);
          }
          v16 = 0;
          v30 = 1;
          v15 = v13;
        }

      }
      else
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v50 = v3;
          _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Unable to read factors URL for namespace: %{public}@", buf, 0xCu);
        }
        v16 = 0;
        v30 = 1;
      }

      objc_autoreleasePoolPop(v4);
      if (!v30)
      {
        v16 = v16;
        v32 = v16;
        goto LABEL_38;
      }
    }
    else
    {

      objc_autoreleasePoolPop(v4);
      v16 = 0;
    }
  }
  else
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Couldn't calculate aliases for namespace name. Provided namespace name is nil", buf, 2u);
    }
  }
  v32 = 0;
LABEL_38:

  return v32;
}

@end
