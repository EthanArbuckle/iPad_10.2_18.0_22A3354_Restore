@implementation PLCloudMaster

- (id)rm_cloudResourcesForResourceType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PLCloudMaster transientModernResources](self, "transientModernResources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v11, "cplType") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PLCloudMaster assets](self, "assets", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "masterResourceForCPLType:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v5, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)rm_cloudResourceForResourceType:(unint64_t)a3 forAssetUuid:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PLCloudMaster assets](self, "assets", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          objc_msgSend(v12, "masterResourceForCPLType:", a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)rm_assetUUIDToCloudResources
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PLCloudMaster assets](self, "assets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v7, "modernResources");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v15, "isCPLMasterResource"))
                objc_msgSend(v9, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

        if (objc_msgSend(v9, "count"))
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, v8);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  return v18;
}

- (id)allMasterResources
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLCloudMaster transientModernResources](self, "transientModernResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PLCloudMaster assets](self, "assets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "allMasterCPLResources");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)hasResourcesOtherThanForAssetUuid:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudMaster transientModernResources](self, "transientModernResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PLCloudMaster assets](self, "assets", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (!v12)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v7;
}

- (id)rm_applyResourcesFromCPLMasterChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  char v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  void *v89;
  void *context;
  uint64_t v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  PLCloudMaster *v96;
  id v97;
  uint64_t v98;
  id v99;
  id obj;
  id obja;
  int v102;
  uint64_t v103;
  void *v104;
  char v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v7;
  objc_msgSend(v7, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v104 = v8;
  objc_msgSend(v8, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudMaster+RM.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary.pathManager"));

  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v123, v139, 16);
  v96 = self;
  v99 = v11;
  if (v12)
  {
    v13 = v12;
    v88 = 0;
    v105 = 0;
    v102 = 0;
    v87 = *(_QWORD *)v124;
    while (1)
    {
      v14 = 0;
      v86 = v13;
      do
      {
        if (*(_QWORD *)v124 != v87)
          objc_enumerationMutation(v11);
        v91 = v14;
        v15 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v14);
        context = (void *)MEMORY[0x19AEC1554]();
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v128 = v15;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Master resource: %@", buf, 0xCu);
          }

        }
        v17 = objc_msgSend(v15, "resourceType");
        if (v17 != 22)
          goto LABEL_14;
        objc_msgSend(v15, "identity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileUTI");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "isEqualToString:", v21);

        v11 = v99;
        if (!v22)
        {
          v63 = v91;
        }
        else
        {
LABEL_14:
          -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v23;
          if (objc_msgSend(v23, "count"))
          {
            v117 = 0u;
            v118 = 0u;
            v115 = 0u;
            v116 = 0u;
            obj = v23;
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v137, 16);
            if (v24)
            {
              v25 = v24;
              v106 = *(_QWORD *)v116;
              while (1)
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v116 != v106)
                    objc_enumerationMutation(obj);
                  v27 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
                  objc_msgSend(v15, "identity");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "fingerprint");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "fingerPrint");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v29, "isEqualToString:", v30))
                  {
                    v31 = -[PLCloudMaster placeholderState](self, "placeholderState");

                    if (v31 != 1)
                    {
                      if (objc_msgSend(v27, "cloudLocalState") != 3)
                      {
                        if (!*MEMORY[0x1E0D115D0])
                        {
                          __CPLAssetsdOSLogDomain();
                          v32 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v128 = v27;
                            _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Marking master local resource %@ as uploaded", buf, 0xCu);
                          }

                        }
                        objc_msgSend(v27, "setCloudLocalState:", 3);
                        objc_msgSend(v27, "setRemoteAvailability:", objc_msgSend(v28, "isAvailable"));
                        if (!objc_msgSend(v27, "remoteAvailability") && !*MEMORY[0x1E0D115D0])
                        {
                          __CPLAssetsdOSLogDomain();
                          v33 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v128 = v27;
                            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Existing master resource marked as unavailable on pull: %@", buf, 0xCu);
                          }

                        }
                      }
                      if (objc_msgSend(v27, "isLocallyAvailable"))
                        objc_msgSend(v97, "addObject:", v27);
                      goto LABEL_75;
                    }
                  }
                  else
                  {

                  }
                  if (!*MEMORY[0x1E0D115D0])
                  {
                    __CPLAssetsdOSLogDomain();
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v128 = v15;
                      v129 = 2112;
                      v130 = v27;
                      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Applying resource change from updated master cloud resource %@ to local resource %@", buf, 0x16u);
                    }

                  }
                  objc_msgSend(v27, "fingerprint");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v35 || (objc_msgSend(v27, "isDerivative") & 1) == 0)
                  {

                    v105 = 1;
                  }
                  else
                  {
                    v105 |= (int)objc_msgSend(v27, "localAvailability") < 1;
                  }
                  objc_msgSend(v27, "asset");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
                  {
                    objc_msgSend(v27, "asset");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "asset");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "asset");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "storedResourceForCPLResource:asset:adjusted:", v15, v39, 0);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v40, "setCloudLocalState:", 3);
                    objc_msgSend(v40, "fileURL");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "path");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v42)
                    {
                      if (objc_msgSend(v37, "isPlaceholderAsset"))
                      {
                        objc_msgSend(v37, "momentShare");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v43)
                          v44 = objc_msgSend(v94, "fileExistsAtPath:", v42);
                        else
                          v44 = 0;

                      }
                      else
                      {
                        v44 = 0;
                      }
                      objc_msgSend(v104, "pathManager");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "photoDirectoryWithType:", 4);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v42, "hasPrefix:", v49))
                      {
                        if (!*MEMORY[0x1E0D115D0])
                        {
                          __CPLAssetsdOSLogDomain();
                          v50 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v128 = v40;
                            _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_ERROR, "Found a resource change %@ under DCIM. This should not happen, skipping", buf, 0xCu);
                          }

                        }
                        if ((v44 & 1) != 0)
                        {
LABEL_68:

                          self = v96;
                          goto LABEL_69;
                        }
                      }
                      else
                      {
                        if ((v44 & 1) != 0)
                          goto LABEL_68;
                        if (objc_msgSend(v94, "fileExistsAtPath:", v42))
                        {
                          if (!*MEMORY[0x1E0D115D0])
                          {
                            __CPLAssetsdOSLogDomain();
                            v51 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v128 = v40;
                              _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "Removing local master resource %@ due to resource change", buf, 0xCu);
                            }

                          }
                          objc_msgSend(v94, "removeItemAtPath:error:", v42, 0);
                        }
                      }
                      objc_msgSend(v40, "markAsNotLocallyAvailable");
                      goto LABEL_68;
                    }
LABEL_69:

                    goto LABEL_70;
                  }
                  objc_msgSend(v27, "transientCloudMaster");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v45)
                    goto LABEL_71;
                  objc_msgSend(v27, "transientCloudMaster");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLResourceInstaller generateExternalResourceFromCPLResource:cloudMaster:masterResources:](PLResourceInstaller, "generateExternalResourceFromCPLResource:cloudMaster:masterResources:", v15, v46, v99);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v104, "managedObjectContext");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "updateResourceForMasterExternalCPLResource:inManagedObjectContext:", v37, v47);

                  objc_msgSend(v27, "setCloudLocalState:", 3);
LABEL_70:

LABEL_71:
                  if (-[PLCloudMaster placeholderState](self, "placeholderState") == 1)
                  {
                    v52 = v102;
                    if ((v102 & 1) == 0)
                      v52 = 1;
                    v102 = v52;
                  }
LABEL_75:

                }
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v137, 16);
                if (!v25)
                {
                  v11 = v99;
                  v13 = v86;
                  goto LABEL_103;
                }
              }
            }
            v11 = v99;
          }
          else
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v128 = v15;
                _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEBUG, "Creating new master resource from cloud resource %@", buf, 0xCu);
              }

            }
            -[PLCloudMaster rm_assetUUIDToCloudResources](self, "rm_assetUUIDToCloudResources");
            obj = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(obj, "count"))
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(obj, "allKeys");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v128 = v55;
                  _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEFAULT, "Found existing master resources for assets %@", buf, 0xCu);

                }
              }
              v121 = 0u;
              v122 = 0u;
              v119 = 0u;
              v120 = 0u;
              objc_msgSend(obj, "allKeys");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v138, 16);
              if (v57)
              {
                v58 = v57;
                v59 = *(_QWORD *)v120;
                do
                {
                  for (j = 0; j != v58; ++j)
                  {
                    if (*(_QWORD *)v120 != v59)
                      objc_enumerationMutation(v56);
                    +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j), v104);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "storedResourceForCPLResource:asset:adjusted:", v15, v61, 0);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "setCloudLocalState:", 3);
                    if (objc_msgSend(v62, "isLocallyAvailable"))
                      objc_msgSend(v97, "addObject:", v62);

                  }
                  v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v138, 16);
                }
                while (v58);
                v11 = v99;
                v13 = v86;
              }
            }
            else
            {
              +[PLResourceInstaller generateExternalResourceFromCPLResource:cloudMaster:masterResources:](PLResourceInstaller, "generateExternalResourceFromCPLResource:cloudMaster:masterResources:", v15, self, v11);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCloudMaster objectID](self, "objectID");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "managedObjectContext");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = +[PLInternalResource insertResourceForMasterObjectID:withExternalCPLResource:inManagedObjectContext:](PLInternalResource, "insertResourceForMasterObjectID:withExternalCPLResource:inManagedObjectContext:", v64, v56, v65);

            }
            if (objc_msgSend(v15, "resourceType") == 23 || objc_msgSend(v15, "resourceType") == 24)
              v88 = 1;
          }
LABEL_103:
          v63 = v91;

        }
        objc_autoreleasePoolPop(context);
        v14 = v63 + 1;
      }
      while (v14 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v123, v139, 16);
      if (!v13)
      {
        v92 = v102 & 1;
        goto LABEL_108;
      }
    }
  }
  v88 = 0;
  v105 = 0;
  v92 = 0;
LABEL_108:

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  -[PLCloudMaster assets](self, "assets");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  obja = (id)objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v111, v136, 16);
  if (obja)
  {
    v98 = *(_QWORD *)v112;
    do
    {
      v67 = 0;
      do
      {
        if (*(_QWORD *)v112 != v98)
          objc_enumerationMutation(v93);
        v103 = v67;
        v68 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v67);
        if ((v88 & 1) != 0)
          objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v67), "reevaluateCameraProcessingAdjustmentState");
        if ((v105 & 1) != 0)
        {
          if (!objc_msgSend(v68, "isPlaceholderAsset")
            || (objc_msgSend(v68, "momentShare"), (v69 = objc_claimAutoreleasedReturnValue()) == 0)
            || (v70 = (void *)v69, v71 = objc_msgSend(v68, "hasMasterThumb"), v70, (v71 & 1) == 0))
          {
            objc_msgSend(v68, "invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:", v104);
          }
        }
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        objc_msgSend(v68, "allMasterCPLResources");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v107, v135, 16);
        if (v73)
        {
          v74 = v73;
          v75 = *(_QWORD *)v108;
          do
          {
            for (k = 0; k != v74; ++k)
            {
              if (*(_QWORD *)v108 != v75)
                objc_enumerationMutation(v72);
              v77 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
              if (objc_msgSend(v77, "supportsTrashedState")
                && (objc_msgSend(v68, "_isResourceType:inResources:", objc_msgSend(v77, "cplType"), v11) & 1) == 0)
              {
                if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", objc_msgSend(v77, "cplType"));
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "objectID");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "cloudAssetGUID");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v128 = v79;
                    v129 = 2112;
                    v130 = v95;
                    v131 = 2114;
                    v132 = v80;
                    v133 = 2114;
                    v134 = v81;
                    _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_DEFAULT, "Detected master resource %{public}@ removed on master change %@. Expunging resource %{public}@ on asset %{public}@", buf, 0x2Au);

                    v11 = v99;
                  }

                }
                objc_msgSend(v77, "applyTrashedState:", 2);
              }
            }
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v107, v135, 16);
          }
          while (v74);
        }

        v67 = v103 + 1;
        self = v96;
      }
      while ((id)(v103 + 1) != obja);
      obja = (id)objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v111, v136, 16);
    }
    while (obja);
  }

  if (v92)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudMaster scopedIdentifier](self, "scopedIdentifier");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v128 = v83;
        _os_log_impl(&dword_199541000, v82, OS_LOG_TYPE_DEFAULT, "Setting master %@ as non-placeholder", buf, 0xCu);

      }
    }
    -[PLCloudMaster setPlaceholderState:](self, "setPlaceholderState:", 0);
    -[PLCloudMaster setSourceMasterForDuplicationCPLScopedIdentifier:](self, "setSourceMasterForDuplicationCPLScopedIdentifier:", 0);
  }

  return v97;
}

- (void)rm_applyExpungeableResourceStatesFromCPLMasterChange:(id)a3 inPhotoLibrary:(id)a4
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "expungeableResourceStates");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v26;
    v4 = (_BYTE *)MEMORY[0x1E0D115D0];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v20 = v5;
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", objc_msgSend(v6, "resourceType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if (!*v4)
              {
                __CPLAssetsdOSLogDomain();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "objectID");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v30 = v6;
                  v31 = 2112;
                  v32 = v14;
                  _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Setting CPLExpungeableResourceState %@ on resource %@", buf, 0x16u);

                }
              }
              objc_msgSend(v12, "applyTrashedState:", +[PLInternalResource plTrashedStateForCPLExpungedState:](PLInternalResource, "plTrashedStateForCPLExpungedState:", objc_msgSend(v6, "expungedState")));
              objc_msgSend(v6, "expungedDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setTrashedDate:", v15);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
          }
          while (v9);
        }

        v5 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v19);
  }

}

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLCloudMaster cloudMasterGUID](self, "cloudMasterGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithString:](PLJournalEntryPayloadIDFactory, "payloadIDWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadsForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PLAssetJournalEntryPayload *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PLCloudMaster assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (!v6)
    goto LABEL_15;
  v8 = v6;
  v9 = *(_QWORD *)v21;
  *(_QWORD *)&v7 = 138543362;
  v18 = v7;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v11, "payloadID", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (!objc_msgSend(v11, "isValidForJournalPersistence"))
          goto LABEL_13;
        v13 = -[PLAssetJournalEntryPayload initWithCloudMaster:payloadID:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithCloudMaster:payloadID:changedKeys:", self, v12, v4);
        if (v13)
          objc_msgSend(v19, "addObject:", v13);
      }
      else
      {
        PLMigrationGetLog();
        v13 = (PLAssetJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v18;
          v25 = v14;
          _os_log_impl(&dword_199541000, &v13->super.super, OS_LOG_TYPE_ERROR, "Skipping payload for CloudMaster update with nil payloadID for existing object: %{public}@", buf, 0xCu);

        }
      }

LABEL_13:
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v8);
LABEL_15:

  if (objc_msgSend(v19, "count"))
    v15 = v19;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (BOOL)supportsCloudUpload
{
  return 1;
}

- (void)awakeFromInsert
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudMaster;
  -[PLCloudMaster awakeFromInsert](&v5, sel_awakeFromInsert);
  -[PLCloudMaster managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLCloudMasterMediaMetadata, "insertInManagedObjectContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudMaster setMediaMetadata:](self, "setMediaMetadata:", v4);

}

- (void)applyPropertiesFromCPLMasterChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudMaster originalFilename](self, "originalFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setOriginalFilename:](self, "setOriginalFilename:", v8);

  }
  v9 = -[PLCloudMaster fullSizeJPEGSource](self, "fullSizeJPEGSource");
  if (objc_msgSend(v4, "fullSizeJPEGSource") != v9)
    -[PLCloudMaster setFullSizeJPEGSource:](self, "setFullSizeJPEGSource:", (__int16)objc_msgSend(v4, "fullSizeJPEGSource"));
  -[PLCloudMaster creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToDate:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v4, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setCreationDate:](self, "setCreationDate:", v13);

  }
  -[PLCloudMaster importDate](self, "importDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToDate:", v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v4, "importDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setImportDate:](self, "setImportDate:", v17);

  }
  -[PLCloudMaster uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v4, "itemType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setUniformTypeIdentifier:](self, "setUniformTypeIdentifier:", v21);

  }
  v22 = -[PLCloudMaster originalOrientation](self, "originalOrientation");
  if (objc_msgSend(v4, "originalOrientation") != v22)
    -[PLCloudMaster setOriginalOrientation:](self, "setOriginalOrientation:", (__int16)objc_msgSend(v4, "originalOrientation"));
  -[PLCloudMaster mediaMetadata](self, "mediaMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForKey:", CFSTR("data"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetaData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqualToData:", v25);

  if ((v26 & 1) == 0)
  {
    -[PLCloudMaster mediaMetadata](self, "mediaMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaMetaData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setValue:forKey:", v28, CFSTR("data"));

  }
  -[PLCloudMaster mediaMetadataType](self, "mediaMetadataType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetaDataType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "isEqualToString:", v30);

  if ((v31 & 1) == 0)
  {
    objc_msgSend(v4, "mediaMetaDataType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setMediaMetadataType:](self, "setMediaMetadataType:", v32);

  }
  objc_msgSend(v4, "importGroupIdentifier");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PLCloudMaster importSessionID](self, "importSessionID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "importGroupIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqualToString:", v36);

    if ((v37 & 1) == 0)
    {
      objc_msgSend(v4, "importGroupIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudMaster setImportSessionID:](self, "setImportSessionID:", v38);
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      -[PLCloudMaster assets](self, "assets", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v54;
        do
        {
          v43 = 0;
          do
          {
            if (*(_QWORD *)v54 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v43++), "setImportSessionAlbumWithImportSessionID:", v38);
          }
          while (v41 != v43);
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        }
        while (v41);
      }

    }
  }
  -[PLCloudMaster originatingAssetIdentifier](self, "originatingAssetIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingFingerprint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v44, "isEqualToString:", v45);

  if ((v46 & 1) == 0)
  {
    objc_msgSend(v4, "originatingFingerprint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setOriginatingAssetIdentifier:](self, "setOriginatingAssetIdentifier:", v47);

  }
  v48 = -[PLCloudMaster importedBy](self, "importedBy");
  if (v48 != objc_msgSend(v4, "importedBy"))
    -[PLCloudMaster setImportedBy:](self, "setImportedBy:", objc_msgSend(v4, "importedBy"));
  objc_msgSend(v4, "importedByBundleIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v4, "importedByBundleIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster updateImportedByBundleIdentifier:](self, "updateImportedByBundleIdentifier:", v50);

  }
  objc_msgSend(v4, "importedByDisplayName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v4, "importedByDisplayName");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster updateImportedByDisplayName:](self, "updateImportedByDisplayName:", v52);

  }
}

- (void)updateImportedByBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char IsEqual;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudMaster setImportedByBundleIdentifier:](self, "setImportedByBundleIdentifier:", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLCloudMaster assets](self, "assets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "importedByBundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        IsEqual = PLObjectIsEqual();

        if ((IsEqual & 1) == 0)
          objc_msgSend(v10, "setImportedByBundleIdentifier:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)updateImportedByDisplayName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char IsEqual;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudMaster setImportedByDisplayName:](self, "setImportedByDisplayName:", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLCloudMaster assets](self, "assets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "importedByDisplayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        IsEqual = PLObjectIsEqual();

        if ((IsEqual & 1) == 0)
          objc_msgSend(v10, "setImportedByDisplayName:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLCloudMaster allMasterResources](self, "allMasterResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PLCloudMaster cloudMasterGUID](self, "cloudMasterGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Cloud master GUID: %@ cloudLocalState: %d JPEGSource: %d %lu resources\n"), v6, (int)-[PLCloudMaster cloudLocalState](self, "cloudLocalState"), (int)-[PLCloudMaster fullSizeJPEGSource](self, "fullSizeJPEGSource"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)sizeOfOriginal
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  +[PLCloudMaster _originalTypes](PLCloudMaster, "_originalTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x19AEC1554]();
        -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", objc_msgSend(v7, "unsignedIntegerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v15, "isLocallyAvailable"))
              {
                v4 += objc_msgSend(v15, "dataLength");
                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_16:

        objc_autoreleasePoolPop(v8);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)allOriginalsAreUploaded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[PLCloudMaster _originalTypes](PLCloudMaster, "_originalTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x19AEC1554]();
        -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", objc_msgSend(v8, "unsignedIntegerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && objc_msgSend(v11, "cloudLocalState") != 3)
        {

          objc_autoreleasePoolPop(v9);
          v12 = 0;
          goto LABEL_12;
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)allOriginalsAreLocallyAvailableForAssetUuid:(id)a3 useOriginalAltInsteadOfOriginal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[PLCloudMaster _originalTypes](PLCloudMaster, "_originalTypes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x19AEC1554]();
      v14 = objc_msgSend(v12, "integerValue");
      if (v4)
      {
        if (v14 != 1)
          goto LABEL_10;
      }
      else if (v14 != 17)
      {
LABEL_10:
        if (objc_msgSend(v12, "integerValue") != 17)
        {
          -[PLCloudMaster rm_cloudResourceForResourceType:forAssetUuid:](self, "rm_cloudResourceForResourceType:forAssetUuid:", objc_msgSend(v12, "unsignedIntegerValue"), v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15 && (objc_msgSend(v15, "isLocallyAvailable") & 1) == 0)
          {

            objc_autoreleasePoolPop(v13);
            v17 = 0;
            goto LABEL_18;
          }

        }
      }
      objc_autoreleasePoolPop(v13);
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  v17 = 1;
LABEL_18:

  return v17;
}

- (id)cplFullRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  PLCloudMaster *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PLCloudMaster assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v5, objc_msgSend(MEMORY[0x1E0D11440], "cplShouldGenerateDerivatives") ^ 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Can't find any asset for this master: %@", (uint8_t *)&v9, 0xCu);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (id)cplPropertyRecord
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  PLCloudMaster *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLCloudMaster assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster cplMasterPropertyChangeForAsset:](self, "cplMasterPropertyChangeForAsset:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setChangeType:", 2);
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Can't find any asset for this master: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v5 = 0;
  }

  return v5;
}

- (id)cplMasterPropertyChangeForAsset:(id)a3
{
  id v4;
  _BYTE *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PLCloudMaster *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  PLCloudMaster *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  id v36;
  uint8_t buf[4];
  PLCloudMaster *v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = self;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "PLCloudMaster %@", buf, 0xCu);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x1E0D113B0]);
  -[PLCloudMaster scopedIdentifier](self, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScopedIdentifier:", v8);

  -[PLCloudMaster originalFilename](self, "originalFilename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLCloudMaster originalFilename](self, "originalFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilename:", v10);

  }
  objc_msgSend(v7, "setFullSizeJPEGSource:", (int)-[PLCloudMaster fullSizeJPEGSource](self, "fullSizeJPEGSource"));
  -[PLCloudMaster creationDate](self, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreationDate:", v11);

  -[PLCloudMaster importDate](self, "importDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImportDate:", v12);

  -[PLCloudMaster uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemType:", v13);

  objc_msgSend(v7, "setChangeType:", 0);
  -[PLCloudMaster mediaMetadata](self, "mediaMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("data"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "length");
  if (v16 <= objc_msgSend(MEMORY[0x1E0D11410], "maxInlineDataSize"))
    objc_msgSend(v7, "setMediaMetaData:", v15);
  -[PLCloudMaster mediaMetadataType](self, "mediaMetadataType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMediaMetaDataType:", v17);

  -[PLCloudMaster originatingAssetIdentifier](self, "originatingAssetIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOriginatingFingerprint:", v18);

  objc_msgSend(v7, "setImportedBy:", -[PLCloudMaster importedBy](self, "importedBy"));
  -[PLCloudMaster importedByBundleIdentifier](self, "importedByBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImportedByBundleIdentifier:", v19);

  -[PLCloudMaster importedByDisplayName](self, "importedByDisplayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImportedByDisplayName:", v20);

  if (-[PLCloudMaster placeholderState](self, "placeholderState") == 1)
  {
    -[PLCloudMaster sourceMasterForDuplicationCPLScopedIdentifier](self, "sourceMasterForDuplicationCPLScopedIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setResourceCopyFromScopedIdentifier:", v21);

  }
  if (objc_msgSend(v4, "kind") == 1)
  {
    -[PLCloudMaster mediaMetadata](self, "mediaMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "valueForKey:", CFSTR("data"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v23, 0, 0, &v36);
      v24 = (PLCloudMaster *)objc_claimAutoreleasedReturnValue();
      v25 = v36;
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v24);
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setVideoInfoOnMasterFromAVAsset:", v26);
        -[PLCloudMaster codecName](self, "codecName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCodec:", v27);

        objc_msgSend(v7, "setVideoFrameRate:", -[PLCloudMaster videoFrameRate](self, "videoFrameRate"));
LABEL_21:

        goto LABEL_22;
      }
      if (!*v5)
      {
        __CPLAssetsdOSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          -[PLCloudMaster scopedIdentifier](self, "scopedIdentifier");
          v28 = (PLCloudMaster *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          v39 = 2114;
          v40 = v25;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "cplMasterPropertyChangeFromCloudMaster: unable to serialize videoProperties for %{public}@: %{public}@", buf, 0x16u);

        }
        goto LABEL_21;
      }
    }
    else
    {
      if (*v5)
      {
LABEL_24:

        goto LABEL_25;
      }
      __CPLAssetsdOSLogDomain();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_24;
      }
      -[PLCloudMaster scopedIdentifier](self, "scopedIdentifier");
      v24 = (PLCloudMaster *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "cplMasterPropertyChangeFromCloudMaster: unable to find mediaPropertiesData for %{public}@", buf, 0xCu);
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
  objc_msgSend(v4, "importSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "importSessionID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImportGroupIdentifier:", v31);

  }
  if (!*v5)
  {
    __CPLAssetsdOSLogDomain();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = -[PLCloudMaster originalOrientation](self, "originalOrientation");
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = v33;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "Setting original orientation %d to masterChange", buf, 8u);
    }

  }
  objc_msgSend(v7, "setOriginalOrientation:", (int)-[PLCloudMaster originalOrientation](self, "originalOrientation"));
  objc_msgSend(v4, "rm_cplExpungeableMasterResourceStates");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
    objc_msgSend(v7, "setExpungeableResourceStates:", v34);

  return v7;
}

- (id)scopeIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLCloudMaster momentShare](self, "momentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scopeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainScopeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)scopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PLCloudMaster scopeIdentifier](self, "scopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudMaster cloudMasterGUID](self, "cloudMasterGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v3, v4);
  }
  else
  {
    -[PLCloudMaster _promptForNilScopeIdentifierRadar](self, "_promptForNilScopeIdentifierRadar");
    v5 = 0;
  }

  return v5;
}

- (id)fingerprintScheme
{
  void *v2;
  void *v3;

  -[PLCloudMaster cloudMasterGUID](self, "cloudMasterGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0D11398], "fingerprintSchemeForMasterIdentifier:", v2);
  else
    objc_msgSend(MEMORY[0x1E0D11398], "invalidFingerprintScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_promptForNilScopeIdentifierRadar
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLCloudMaster objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLCloudMaster isDeleted](self, "isDeleted");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Found cloud master with nil scope identifier %@ (isDeleted=%@) %@.\n\nSee rdar://problem/41018298"), v4, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

  }
  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: cloud master with nil scope identifier"), v7);

}

- (id)originalFilenameForResourceType:(unint64_t)a3 filePath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  if (a3 - 17 < 2)
  {
    -[PLCloudMaster originalFilename](self, "originalFilename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 - 23 < 2)
  {
    -[PLCloudMaster originalFilename](self, "originalFilename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", *MEMORY[0x1E0D747B0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    -[PLCloudMaster originalFilename](self, "originalFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_9:

  return v11;
}

- (BOOL)isSyncableChange
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLCloudMaster changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[PLCloudMaster listOfSyncedProperties](PLCloudMaster, "listOfSyncedProperties", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (CPLScopedIdentifier)sourceMasterForDuplicationCPLScopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PLCloudMaster sourceMasterForDuplicationIdentifier](self, "sourceMasterForDuplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudMaster sourceMasterForDuplicationScopeIdentifier](self, "sourceMasterForDuplicationScopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v4, v3);
  else
    v5 = 0;

  return (CPLScopedIdentifier *)v5;
}

- (void)setSourceMasterForDuplicationCPLScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setSourceMasterForDuplicationIdentifier:](self, "setSourceMasterForDuplicationIdentifier:", v5);

    objc_msgSend(v7, "scopeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudMaster setSourceMasterForDuplicationScopeIdentifier:](self, "setSourceMasterForDuplicationScopeIdentifier:", v6);

  }
  else
  {
    -[PLCloudMaster setSourceMasterForDuplicationIdentifier:](self, "setSourceMasterForDuplicationIdentifier:", 0);
    -[PLCloudMaster setSourceMasterForDuplicationScopeIdentifier:](self, "setSourceMasterForDuplicationScopeIdentifier:", 0);
  }

}

+ (id)insertIntoPhotoLibrary:(id)a3 withCloudMasterGUID:(id)a4 inMomentShare:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudMaster.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudMaster.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cloudMasterGUID"));

LABEL_3:
  objc_msgSend(v9, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v13, (uint64_t)v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCloudMasterGUID:", v10);
  if (v11)
    objc_msgSend(v14, "setMomentShare:", v11);

  return v14;
}

+ (PLCloudMaster)cloudMasterWithGUID:(id)a3 inMomentShare:(id)a4 prefetchResources:(BOOL)a5 inManagedObjectContext:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[3];

  v7 = a5;
  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    v13 = (void *)MEMORY[0x19AEC1554]();
    v14 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(a1, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudMasterGUID == %@ AND momentShare == %@"), v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);
    objc_msgSend(v16, "setFetchLimit:", 1);
    if (v7)
    {
      v23[0] = CFSTR("assets.modernResources");
      v23[1] = CFSTR("transientModernResources");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRelationshipKeyPathsForPrefetching:", v18);

    }
    v22 = 0;
    objc_msgSend(v12, "executeFetchRequest:error:", v16, &v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v20 = 0;
  }

  return (PLCloudMaster *)v20;
}

+ (id)cloudMastersByScopedIdentifiers:(id)a3 relationshipKeyPathsForPrefetching:(id)a4 inLibrary:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "cloudMastersWithScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pl_indexBy:", &__block_literal_global_75752);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (PLCloudMaster)cloudMasterWithScopedIdentifier:(id)a3 prefetchResources:(BOOL)a4 inLibrary:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v15 = 0;
  v9 = +[PLShare getShareIfNecessary:forCPLRecordWithClass:scopedIdentifier:inLibrary:](PLMomentShare, "getShareIfNecessary:forCPLRecordWithClass:scopedIdentifier:inLibrary:", &v15, objc_opt_class(), v7, v8);
  v10 = v15;
  v11 = 0;
  if (v9)
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudMaster cloudMasterWithGUID:inMomentShare:prefetchResources:inManagedObjectContext:](PLCloudMaster, "cloudMasterWithGUID:inMomentShare:prefetchResources:inManagedObjectContext:", v12, v10, v6, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PLCloudMaster *)v11;
}

+ (id)cloudMastersWithScopedIdentifiers:(id)a3 relationshipKeyPathsForPrefetching:(id)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[PLCloudMaster entityName](PLCloudMaster, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset objectsWithScopedIdentifiers:forEntityName:prefetchResources:relationshipKeyPathsForPrefetching:inLibrary:](PLManagedAsset, "objectsWithScopedIdentifiers:forEntityName:prefetchResources:relationshipKeyPathsForPrefetching:inLibrary:", v9, v10, 0, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)deleteAllCloudMastersInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Deleting all cloud masters locally", buf, 2u);
    }

  }
  v8 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchBatchSize:", 100);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v10);
  objc_msgSend(v11, "setResultType:", 2);
  v16 = 0;
  objc_msgSend(v4, "executeRequest:error:", v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v13)
  {
    if (!*v6)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to batch delete cloud masters: Error: %@", buf, 0xCu);
      }
LABEL_12:

    }
  }
  else if (!*v6)
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "result");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Batch deleted %@ cloud masters", buf, 0xCu);

    }
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v5);
}

+ (void)resetCloudMastersStateInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Resetting cloudLocalState of cloud masters", buf, 2u);
    }

  }
  v8 = objc_alloc(MEMORY[0x1E0C97AB0]);
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntityName:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudLocalState != %d"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setResultType:", 2);
  objc_msgSend(v10, "setPropertiesToUpdate:", &unk_1E3764698);
  v16 = 0;
  objc_msgSend(v4, "executeRequest:error:", v10, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v13)
  {
    if (!*v6)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to batch update cloud masters: %@", buf, 0xCu);
      }
LABEL_12:

    }
  }
  else if (!*v6)
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "result");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Batch updated %@ cloud masters", buf, 0xCu);

    }
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v5);
}

+ (void)deleteOrphanedMastersWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $asset, $asset != nil).@count = 0"), CFSTR("assets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  objc_msgSend(v10, "setResultType:", 2);
  v15 = 0;
  objc_msgSend(v4, "executeRequest:error:", v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v11)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "result");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %@ orphaned cloud masters", buf, 0xCu);

      }
LABEL_8:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to delete orphaned cloud masters %@", buf, 0xCu);
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v5);
}

+ (void)deleteMasterIfNecessary:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      objc_msgSend(v6, "libraryServicesManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudPhotoLibraryManager");
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "allMasterResources");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLInternalResource triggerBackgroundDownloadFailureForResources:cloudPhotoLibraryManager:](PLInternalResource, "triggerBackgroundDownloadFailureForResources:cloudPhotoLibraryManager:", v12, v9);

      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412290;
          v15 = v5;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Deleting master %@", (uint8_t *)&v14, 0xCu);
        }

      }
      objc_msgSend(v6, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteObject:", v5);
      goto LABEL_11;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v5, "assets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v5;
      v16 = 2048;
      v17 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Ignored deleting a master record: %@, master still being referred by %lu assets", (uint8_t *)&v14, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
  }
LABEL_13:

}

+ (id)_originalTypes
{
  if (_originalTypes_onceToken != -1)
    dispatch_once(&_originalTypes_onceToken, &__block_literal_global_59);
  return (id)_originalTypes_originalTypes;
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  return (id)listOfSyncedProperties_result_75692;
}

+ (unint64_t)fullSizeJPEGSourceForUTI:(id)a3 andImageDimensions:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  int v7;

  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

  return !v7
      || objc_msgSend(MEMORY[0x1E0D75130], "rawSourceMaximumPixelCountForBackgroundProcessing") >= (uint64_t)(width * height);
}

+ (id)entityName
{
  return CFSTR("CloudMaster");
}

void __39__PLCloudMaster_listOfSyncedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("creationDate"), CFSTR("importDate"), CFSTR("uniformTypeIdentifier"), CFSTR("originalFilename"), CFSTR("originatingAssetIdentifier"), CFSTR("importedBy"), CFSTR("videoFrameRate"), CFSTR("codecName"), CFSTR("mediaMetadataType"), CFSTR("importedByBundleIdentifier"), CFSTR("importedByDisplayName"), 0);
  v1 = (void *)listOfSyncedProperties_result_75692;
  listOfSyncedProperties_result_75692 = v0;

}

void __31__PLCloudMaster__originalTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E3760020, &unk_1E3760038, &unk_1E3760050, &unk_1E3760068, &unk_1E3760080, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_originalTypes_originalTypes;
  _originalTypes_originalTypes = v0;

}

uint64_t __94__PLCloudMaster_cloudMastersByScopedIdentifiers_relationshipKeyPathsForPrefetching_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scopedIdentifier");
}

@end
