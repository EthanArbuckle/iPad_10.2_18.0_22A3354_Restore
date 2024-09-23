@implementation PBFDataStoreArchivalUtilities

+ (id)fileManager
{
  if (fileManager_onceToken_90 != -1)
    dispatch_once(&fileManager_onceToken_90, &__block_literal_global_91);
  return (id)fileManager_fileManager_89;
}

void __44__PBFDataStoreArchivalUtilities_fileManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fileManager_fileManager_89;
  fileManager_fileManager_89 = v0;

}

+ (BOOL)transformDataStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  uint64_t v37;
  id v38;
  BOOL v39;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  int v50;
  int v51;
  unsigned int v52;
  id obj;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _QWORD v89[3];
  _QWORD v90[3];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:", a3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "stripScreenshots");
  v9 = objc_msgSend(v7, "stripDescriptors");
  v10 = objc_msgSend(v7, "stripContentsOfConfigurations");
  v48 = v7;
  v11 = objc_msgSend(v7, "reapNonLatestEntries");
  objc_msgSend(a1, "fileManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0 && (v9 & 1) == 0 && (v10 & 1) == 0 && !v11)
    goto LABEL_54;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v49, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  if (!v57)
    goto LABEL_53;
  v56 = *(_QWORD *)v82;
  v51 = v9;
  v52 = v8;
  v55 = v10;
  v50 = v11;
  while (2)
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v82 != v56)
        objc_enumerationMutation(obj);
      v60 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v13);
      objc_msgSend(v60, "setupEnvironmentIfNecessary");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v41 = (void *)v14;
        v42 = (void *)MEMORY[0x1E0CB35C8];
        v43 = *MEMORY[0x1E0CB2D68];
        v90[0] = CFSTR("PBFPosterExtensionStoreCoordinator could not be setup; cannot archive something we cannot read.");
        v44 = *MEMORY[0x1E0CB32F0];
        v89[0] = v43;
        v89[1] = v44;
        objc_msgSend(v60, "containerURL");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v89[2] = *MEMORY[0x1E0CB3388];
        v90[1] = v45;
        v90[2] = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "pbf_generalErrorWithCode:userInfo:", 7, v46);
        v38 = (id)objc_claimAutoreleasedReturnValue();

        v39 = v38 == 0;
        if (a5 && v38)
        {
          v38 = objc_retainAutorelease(v38);
          v39 = 0;
          *a5 = v38;
        }
        goto LABEL_55;
      }
      if (v11)
      {
        objc_msgSend(v60, "reapEverythingExceptLatestVersion");
        if (!v9)
        {
LABEL_13:
          if (!v10)
            goto LABEL_14;
          goto LABEL_27;
        }
      }
      else if (!v9)
      {
        goto LABEL_13;
      }
      v15 = v8;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(v60, "dynamicDescriptorStoreCoordinatorsWithError:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v78 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "posterUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "teardownDynamicDescriptorStoreCoordinatorForPosterUUID:error:", v22, 0);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        }
        while (v19);
      }

      objc_msgSend(v60, "teardownAllStaticDescriptorStoreCoordinators");
      v8 = v15;
      v10 = v55;
      if (!v55)
      {
LABEL_14:
        if (!(_DWORD)v8)
          goto LABEL_16;
LABEL_15:
        objc_msgSend(v60, "enumerateDescriptorStoreCoordinators:", &__block_literal_global_95);
        objc_msgSend(v60, "enumerateConfigurationStoreCoordinators:", &__block_literal_global_96);
        goto LABEL_16;
      }
LABEL_27:
      v54 = v13;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v60, "configurationStoreCoordinatorsWithError:", 0);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
      if (v61)
      {
        v59 = *(_QWORD *)v74;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v74 != v59)
              objc_enumerationMutation(v58);
            v62 = v23;
            v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v23);
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            objc_msgSend(v24, "allPosterPaths");
            v63 = (id)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
            if (v25)
            {
              v26 = v25;
              v64 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v70 != v64)
                    objc_enumerationMutation(v63);
                  v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
                  objc_msgSend(v28, "contentsURL");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D7FB50], "expectedConfigurationFilesForPath:", v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v29, 0, 1, 0);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = 0u;
                  v66 = 0u;
                  v67 = 0u;
                  v68 = 0u;
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
                  if (v32)
                  {
                    v33 = v32;
                    v34 = *(_QWORD *)v66;
                    do
                    {
                      for (k = 0; k != v33; ++k)
                      {
                        if (*(_QWORD *)v66 != v34)
                          objc_enumerationMutation(v31);
                        v36 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
                        if ((objc_msgSend(v30, "containsObject:", v36) & 1) == 0)
                          objc_msgSend(v12, "removeItemAtURL:error:", v36, 0);
                      }
                      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
                    }
                    while (v33);
                  }

                }
                v26 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
              }
              while (v26);
            }

            v23 = v62 + 1;
          }
          while (v62 + 1 != v61);
          v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
        }
        while (v61);
      }

      v9 = v51;
      v8 = v52;
      v10 = v55;
      v11 = v50;
      v13 = v54;
      if (v52)
        goto LABEL_15;
LABEL_16:
      objc_msgSend(v60, "invalidate");
      ++v13;
    }
    while (v13 != v57);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    v57 = v37;
    if (v37)
      continue;
    break;
  }
LABEL_53:

LABEL_54:
  v38 = 0;
  v39 = 1;
LABEL_55:

  return v39;
}

uint64_t __71__PBFDataStoreArchivalUtilities_transformDataStoreAtURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reapSnapshots");
}

uint64_t __71__PBFDataStoreArchivalUtilities_transformDataStoreAtURL_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reapSnapshots");
}

@end
