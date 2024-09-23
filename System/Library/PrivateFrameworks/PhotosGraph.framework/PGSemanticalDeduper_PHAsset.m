@implementation PGSemanticalDeduper_PHAsset

- (id)sceneprintByItemIdentifierWithItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[5];

  v53[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v5;
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CD1A60];
    v53[0] = *MEMORY[0x1E0CD19C0];
    v53[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFetchPropertySets:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v36 = v3;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v11)
    {
      v12 = v11;
      LOBYTE(v13) = 0;
      v14 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v16, "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          if ((v13 & 1) != 0)
            v13 = 1;
          else
            v13 = objc_msgSend(v16, "isGuestAsset");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(v6, "setIncludeGuestAssets:", v13);
    v34 = v6;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v9, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v22);
          objc_msgSend(v23, "sceneprintProperties");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sceneprint");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)MEMORY[0x1E0CB3710];
            v27 = objc_opt_class();
            v38 = 0;
            objc_msgSend(v26, "unarchivedObjectOfClass:fromData:error:", v27, v25, &v38);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v38;
            if (v28)
            {
              objc_msgSend(v23, "clsIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v28, v30);
              goto LABEL_23;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v23, "uuid");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v48 = v30;
              v49 = 2112;
              v50 = v29;
              _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving sceneprint for asset %@: %@", buf, 0x16u);
LABEL_23:

            }
            goto LABEL_28;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v23, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v48 = v31;
            _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Sceneprint unavailable for asset %@", buf, 0xCu);

          }
LABEL_28:

          ++v22;
        }
        while (v20 != v22);
        v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        v20 = v32;
      }
      while (v32);
    }

    v3 = v36;
  }
  else
  {
    v37 = (id)MEMORY[0x1E0C9AA70];
  }

  return v37;
}

@end
