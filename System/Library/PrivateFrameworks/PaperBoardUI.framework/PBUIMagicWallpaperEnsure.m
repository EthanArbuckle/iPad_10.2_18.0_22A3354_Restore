@implementation PBUIMagicWallpaperEnsure

void ___PBUIMagicWallpaperEnsure_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[3];
  _QWORD v72[3];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)__identifierClassMap;
  __identifierClassMap = (uint64_t)v0;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
    goto LABEL_47;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  MEMORY[0x1BCCA5588]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v2;
  objc_msgSend(v2, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("ProceduralWallpaper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  v53 = (void *)v7;
  if (!v10)
    goto LABEL_35;
  v11 = v10;
  v12 = *(_QWORD *)v62;
  v50 = *(_QWORD *)v62;
  v51 = v9;
  do
  {
    v13 = 0;
    v54 = v11;
    do
    {
      if (*(_QWORD *)v62 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v13);
      objc_msgSend(v14, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("bundle"));

      if (!v16)
      {
        v55 = v13;
        objc_msgSend(v53, "stringByAppendingPathComponent:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          if ((objc_msgSend(v18, "load") & 1) != 0)
          {
            v52 = v17;
            objc_msgSend(v19, "objectForInfoDictionaryKey:", CFSTR("SBProceduralWallpaperClassNames"));
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              v59 = 0u;
              v60 = 0u;
              v57 = 0u;
              v58 = 0u;
              v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v58;
                do
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v58 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                    v27 = (void *)objc_msgSend(v19, "classNamed:", v26);
                    if (v27)
                    {
                      v28 = v27;
                      PBUIMagicWallpaperDictionariesForClass(v27, v19);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "addObjectsFromArray:", v29);

                      v30 = (void *)__identifierClassMap;
                      objc_msgSend(v28, "identifier");
                      v31 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "setObject:forKey:", v28, v31);
                    }
                    else
                    {
                      PBUILogCommon();
                      v31 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        v74 = v26;
                        _os_log_error_impl(&dword_1B71C0000, v31, OS_LOG_TYPE_ERROR, "Unable to load wallpaper class %{public}@, class does not exist in bundle", buf, 0xCu);
                      }
                    }

                  }
                  v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
                }
                while (v23);
                v12 = v50;
                v9 = v51;
              }
            }
            else
            {
              PBUILogCommon();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v74 = v52;
                _os_log_error_impl(&dword_1B71C0000, v34, OS_LOG_TYPE_ERROR, "Unable to load wallpaper plugin, no defined wallpaper class names - %{public}@", buf, 0xCu);
              }

              objc_msgSend(v19, "unload");
            }
            v17 = v52;
            goto LABEL_32;
          }
          PBUILogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v17;
            v32 = v21;
            v33 = "Unable to load wallpaper plugin, bundle load failure - %{public}@";
LABEL_27:
            _os_log_error_impl(&dword_1B71C0000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
          }
        }
        else
        {
          PBUILogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v17;
            v32 = v21;
            v33 = "Unable to load wallpaper plugin, path is not a bundle - %{public}@";
            goto LABEL_27;
          }
        }
LABEL_32:

        v11 = v54;
        v13 = v55;
      }
      ++v13;
    }
    while (v13 != v11);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  }
  while (v11);
LABEL_35:

  v35 = v3;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v38 = v35;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v66 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        objc_msgSend(v43, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("360 VR"));
        v46 = v36;
        if ((v45 & 1) == 0)
        {
          if (objc_msgSend(v44, "isEqualToString:", CFSTR("Pano VR")))
            v46 = v56;
          else
            v46 = v37;
        }
        objc_msgSend(v46, "addObject:", v43);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
    }
    while (v40);
  }

  v71[0] = CFSTR("kSBUIMagicWallpaperPanoVRSectionKey");
  v71[1] = CFSTR("kSBUIMagicWallpaper360VRSectionKey");
  v72[0] = v56;
  v72[1] = v36;
  v71[2] = CFSTR("kSBUIMagicWallpaperDynamicSectionKey");
  v72[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)__wallpaperEnumeration;
  __wallpaperEnumeration = v47;

  v2 = v49;
LABEL_47:

}

@end
