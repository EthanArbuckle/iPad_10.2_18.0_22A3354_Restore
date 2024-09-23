@implementation TRIFlatbufferUtils

+ (id)convertFBFactorLevelToProtoFactorLevel:(id)a3 parentDir:(id)a4 namespaceName:(id)a5 isRelativePath:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  void *v58;
  int v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v102;
  void *context;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  uint8_t buf[4];
  void *v116;
  uint64_t v117;

  v6 = a6;
  v117 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v107 = a4;
  v11 = a5;
  v12 = MEMORY[0x1A1AC6B8C]();
  v13 = objc_opt_new();
  v108 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = objc_msgSend(v10, "levelType");
  v16 = MEMORY[0x1E0C809B0];
  v105 = v11;
  v106 = (void *)v13;
  v104 = (void *)v12;
  switch(v15)
  {
    case 0:
      TRILogCategory_ClientFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "name");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v116 = v102;
        _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "Factor level type set to none: %{public}@", buf, 0xCu);

      }
      goto LABEL_5;
    case 1:
      objc_msgSend(v10, "levelAsBoolVal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v108;
      objc_msgSend(v108, "setBooleanValue:", objc_msgSend(v23, "val"));

      v18 = 10;
      goto LABEL_58;
    case 2:
      objc_msgSend(v10, "levelAsStringVal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v108;
      objc_msgSend(v108, "setStringValue:", v20);

      v18 = 11;
      goto LABEL_58;
    case 3:
      objc_msgSend(v10, "levelAsInt64Val");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v108;
      objc_msgSend(v108, "setLongValue:", objc_msgSend(v21, "val"));

      v18 = 13;
      goto LABEL_58;
    case 4:
      objc_msgSend(v10, "levelAsDoubleVal");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "val");
      v19 = v108;
      objc_msgSend(v108, "setDoubleValue:");

      v18 = 15;
      goto LABEL_58;
    case 5:
      context = (void *)MEMORY[0x1A1AC6B8C]();
      v24 = (void *)objc_opt_new();
      objc_msgSend(v10, "levelAsTrialAssetVal");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27)
      {
        objc_msgSend(v25, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v108;
        if (v6)
        {
          objc_msgSend(v107, "stringByAppendingPathComponent:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPath:", v30);

        }
        else
        {
          objc_msgSend(v24, "setPath:", v28);
        }

      }
      else
      {
        objc_msgSend(v24, "setHasPath:", 0);
        v29 = v108;
      }
      if (objc_msgSend(v25, "hasDownloadSize"))
      {
        v48 = objc_msgSend(v25, "downloadSize");
        objc_msgSend(v24, "asset");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setSize:", v48);

      }
      if (objc_msgSend(v25, "hasOnDemandFlag"))
        objc_msgSend(v24, "setIsOnDemand:", objc_msgSend(v25, "isOnDemand"));
      objc_msgSend(v25, "assetName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "length");

      if (v51)
      {
        objc_msgSend(v25, "assetName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "asset");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setName:", v52);

      }
      objc_msgSend(v25, "assetId");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "asset");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setAssetId:", v54);

      v56 = objc_msgSend(v25, "cloudKitMetadataType");
      if (v56 == 1)
      {
        objc_msgSend(v25, "cloudKitMetadataAsTreatment");
        v57 = objc_claimAutoreleasedReturnValue();
        v59 = -[NSObject container](v57, "container");
        if (v59 == 2)
        {
          objc_msgSend(v24, "asset");
          v63 = objc_claimAutoreleasedReturnValue();
          v60 = v63;
          v64 = 2;
        }
        else
        {
          if (v59 != 1)
          {
            if (v59)
            {
LABEL_48:
              v65 = v29;
              if (-[NSObject hasCkIndex](v57, "hasCkIndex"))
              {
                v66 = -[NSObject assetIndex](v57, "assetIndex");
                objc_msgSend(v24, "asset");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "setCloudKitIndex:", v66);

              }
              -[NSObject treatmentId](v57, "treatmentId");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v68, "length");

              if (v69)
              {
                -[NSObject treatmentId](v57, "treatmentId");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "asset");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "setTreatmentId:", v70);

              }
              v29 = v65;
              goto LABEL_53;
            }
            TRILogCategory_ClientFramework();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "name");
              v61 = v29;
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v116 = v62;
              _os_log_impl(&dword_19B89C000, v60, OS_LOG_TYPE_INFO, "CloudKit container unknown for: %{public}@", buf, 0xCu);

              v29 = v61;
            }
LABEL_47:

            goto LABEL_48;
          }
          objc_msgSend(v24, "asset");
          v63 = objc_claimAutoreleasedReturnValue();
          v60 = v63;
          v64 = 1;
        }
        -[NSObject setCloudKitContainer:](v63, "setCloudKitContainer:", v64);
        goto LABEL_47;
      }
      if (v56)
        goto LABEL_54;
      TRILogCategory_ClientFramework();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "name");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v116 = v58;
        _os_log_error_impl(&dword_19B89C000, v57, OS_LOG_TYPE_ERROR, "CloudKit metadata type as none for: %{public}@", buf, 0xCu);

      }
LABEL_53:

LABEL_54:
      v72 = v16;
      v73 = v24;
      if (objc_msgSend(v25, "fileType") == 1)
      {
        v74 = objc_msgSend(v29, "setFileValue:", v24);
        v18 = 100;
      }
      else
      {
        v74 = objc_msgSend(v29, "setDirectoryValue:", v24);
        v18 = 101;
      }
      v75 = v29;
      v76 = (void *)MEMORY[0x1A1AC6B8C](v74);
      v77 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v10, "metadata");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v77, "initWithCapacity:", objc_msgSend(v78, "count"));

      objc_msgSend(v10, "metadata");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v72;
      v113[1] = 3221225472;
      v113[2] = __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke;
      v113[3] = &unk_1E3BFF7B0;
      v114 = v79;
      v81 = v79;
      objc_msgSend(v80, "enumerateObjectsUsingBlock:", v113);

      objc_msgSend(v75, "setMetadata:", v81);
      objc_autoreleasePoolPop(v76);

      objc_autoreleasePoolPop(context);
      v19 = v75;
      v16 = MEMORY[0x1E0C809B0];
LABEL_58:
      v82 = (void *)MEMORY[0x1A1AC6B8C]();
      v83 = (void *)objc_msgSend((id)objc_opt_new(), "init");
      objc_msgSend(v10, "metadata");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = v16;
      v111[1] = 3221225472;
      v111[2] = __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_2;
      v111[3] = &unk_1E3BFF7B0;
      v85 = v83;
      v112 = v85;
      objc_msgSend(v84, "enumerateObjectsUsingBlock:", v111);

      if (objc_msgSend(v85, "count"))
        objc_msgSend(v19, "setMetadata:", v85);

      objc_autoreleasePoolPop(v82);
      objc_msgSend(v106, "setLevel:", v19);
      objc_msgSend(v10, "factorNamespaceName");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "length");

      if (v87)
      {
        objc_msgSend(v10, "factorNamespaceName");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setNamespaceName:", v88);

        v89 = v105;
      }
      else
      {
        v89 = v105;
        objc_msgSend(v14, "setNamespaceName:", v105);
      }
      if (objc_msgSend(v10, "hasNamespaceId"))
      {
        objc_msgSend(v14, "setNamespaceId:", objc_msgSend(v10, "namespaceId"));
      }
      else
      {
        v90 = (void *)MEMORY[0x1E0DC0F18];
        objc_msgSend(v14, "namespaceName");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setNamespaceId:", objc_msgSend(v90, "namespaceIdFromName:", v91));

      }
      objc_msgSend(v10, "name");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setName:", v92);

      objc_msgSend(v10, "alias");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAlias:", v93);

      objc_msgSend(v14, "setType:", v18);
      objc_msgSend(v10, "factorId");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "length");

      if (v95)
      {
        objc_msgSend(v10, "factorId");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setId_p:", v96);

      }
      v97 = (void *)MEMORY[0x1A1AC6B8C]();
      v98 = (void *)objc_opt_new();
      objc_msgSend(v10, "metadata");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v16;
      v109[1] = 3221225472;
      v109[2] = __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_3;
      v109[3] = &unk_1E3BFF7B0;
      v110 = v98;
      v100 = v98;
      objc_msgSend(v99, "enumerateObjectsUsingBlock:", v109);

      objc_msgSend(v14, "setMetadataKeysArray:", v100);
      objc_autoreleasePoolPop(v97);
      objc_msgSend(v106, "setFactor:", v14);

      objc_autoreleasePoolPop(v104);
      return v106;
    case 6:
      v31 = (void *)objc_opt_new();
      objc_msgSend(v10, "levelAsMaRefVal");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "hasIsOnDemand"))
        objc_msgSend(v31, "setIsOnDemand:", objc_msgSend(v32, "isOnDemand"));
      if (objc_msgSend(v32, "hasDownloadSize"))
      {
        v33 = objc_msgSend(v32, "downloadSize");
        objc_msgSend(v31, "asset");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setSize:", v33);

      }
      objc_msgSend(v32, "assetName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "length");

      if (v36)
      {
        objc_msgSend(v32, "assetName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "asset");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setName:", v37);

      }
      v39 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v32, "type");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "specifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "version");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("%@-%@-%@"), v40, v41, v42);
      objc_msgSend(v31, "asset");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setAssetId:", v43);

      objc_msgSend(v10, "name");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_maAutoAssetReferencedInDir:byFactorName:", v107, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v31;
      if (v46)
        objc_msgSend(v31, "setPath:", v46);
      v19 = v108;
      if (objc_msgSend(v32, "hasFileType") && objc_msgSend(v32, "fileType") == 1)
      {
        objc_msgSend(v108, "setFileValue:", v31);
        v18 = 100;
      }
      else
      {
        objc_msgSend(v108, "setDirectoryValue:", v31);
        v18 = 101;
      }
      v16 = MEMORY[0x1E0C809B0];

      goto LABEL_58;
    default:
LABEL_5:
      v18 = 0;
      v19 = v108;
      goto LABEL_58;
  }
}

void __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "val");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, v4);
}

void __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "val");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, v4);
}

void __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_maAutoAssetReferencedInDir:(id)a3 byFactorName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v6, "triFilenameForFactorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/maRefs/%@"), v5, v8);
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v9, 4, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  objc_msgSend(v10, "triTrim");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (v11)
    {
      objc_msgSend(v11, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v18 = objc_msgSend(v11, "code");

        if (v18 == 260)
          goto LABEL_18;
      }
      else
      {

      }
    }
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_19B89C000, v19, OS_LOG_TYPE_ERROR, "Unable to read MA path from reference path: %{public}@: %@", buf, 0x16u);
    }
LABEL_17:

LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v12, "length"))
  {
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_19B89C000, v19, OS_LOG_TYPE_DEFAULT, "Path for factor %{public}@ is empty. This usually means that the level is about to be deleted.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v14 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "Trial asset path does not exist on disk: %{public}@.", buf, 0xCu);
    }

  }
  v16 = v12;
LABEL_19:

  objc_autoreleasePoolPop(v7);
  return v16;
}

@end
