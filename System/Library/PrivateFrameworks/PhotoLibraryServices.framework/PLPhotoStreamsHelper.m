@implementation PLPhotoStreamsHelper

+ (void)deletePhotoStreamAssetsWithLibraryServiceManager:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  char v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a3;
  objc_msgSend(v9, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoDirectoryWithType:", 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "databaseContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v15, "newShortLivedLibraryWithName:", "+[PLPhotoStreamsHelper deletePhotoStreamAssetsWithLibraryServiceManager:withReason:completion:]");
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke;
  v29[3] = &unk_1E3671710;
  v35 = 1;
  v30 = v16;
  v31 = v14;
  v32 = v7;
  v33 = v11;
  v34 = v13;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke_27;
  v24[3] = &unk_1E36755F8;
  v28 = 1;
  v25 = v34;
  v26 = v33;
  v27 = v8;
  v18 = v8;
  v19 = v33;
  v20 = v34;
  v21 = v7;
  v22 = v14;
  v23 = v16;
  objc_msgSend(v23, "performTransaction:completionHandler:", v29, v24);

}

void __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  NSObject *v54;
  void *v55;
  char v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  id obj;
  id obja;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
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
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoStreamAlbums");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v92;
      v59 = *(_QWORD *)v92;
      obj = v2;
      do
      {
        v6 = 0;
        v62 = v4;
        do
        {
          if (*(_QWORD *)v92 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "personID");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
              objc_msgSend(v63, "addObject:", v7);
            }
            else
            {
              v68 = v6;
              PLMyPhotoStreamGetLog();
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v7, "uuid");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v100 = v10;
                _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "found Photo Stream album with no streamID, uuid=%@ . deleting it", buf, 0xCu);

              }
              v89 = 0u;
              v90 = 0u;
              v87 = 0u;
              v88 = 0u;
              v66 = v7;
              objc_msgSend(v7, "assets");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v88;
                do
                {
                  for (i = 0; i != v13; ++i)
                  {
                    if (*(_QWORD *)v88 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                    PLMyPhotoStreamGetLog();
                    v17 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v16, "uuid");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "directory");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v100 = v18;
                      v101 = 2112;
                      v102 = v19;
                      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "deleting photo %@:%@ in Photo Stream album with no stream ID", buf, 0x16u);

                    }
                    objc_msgSend(v16, "deleteWithReason:", *(_QWORD *)(a1 + 48));
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
                }
                while (v13);
              }

              objc_msgSend(v66, "delete");
              v5 = v59;
              v2 = obj;
              v4 = v62;
              v6 = v68;
              v8 = 0;
            }

          }
          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      }
      while (v4);
    }
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[0-9]*$"), 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "contentsOfDirectoryAtPath:error:", *(_QWORD *)(a1 + 64), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v84 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          if (objc_msgSend(v20, "numberOfMatchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length")) == 1)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
      }
      while (v23);
    }

  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obja = v63;
  v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v80;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v80 != v64)
          objc_enumerationMutation(obja);
        v69 = v27;
        v28 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v27);
        PLMyPhotoStreamGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v28, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v100 = v30;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "albumToDelete %@", buf, 0xCu);

        }
        objc_msgSend(v28, "assets");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(a1 + 48);
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "reason");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v28;
        objc_msgSend(v28, "title");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@. Deleting all assets from PhotoStream album: %@."), v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setReason:", v36);

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v37 = v31;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v75, v96, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v76;
          do
          {
            for (k = 0; k != v39; ++k)
            {
              if (*(_QWORD *)v76 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
              PLMyPhotoStreamGetLog();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v42, "uuid");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "directory");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v100 = v44;
                v101 = 2112;
                v102 = v45;
                _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "deleting photo %@:%@", buf, 0x16u);

              }
              objc_msgSend(v42, "deleteWithReason:", *(_QWORD *)(a1 + 48));
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v75, v96, 16);
          }
          while (v39);
        }

        PLMyPhotoStreamGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v67, "title");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v100 = v47;
          _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEBUG, "deleting album %@", buf, 0xCu);

        }
        objc_msgSend(v67, "delete");

        v27 = v69 + 1;
      }
      while (v69 + 1 != v65);
      v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
    }
    while (v65);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v48 = *(id *)(a1 + 40);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v95, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v72 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(*(id *)(a1 + 64), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        PLMyPhotoStreamGetLog();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v53;
          _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEBUG, "removing Photo Stream directory %@", buf, 0xCu);
        }

        v55 = *(void **)(a1 + 56);
        v70 = 0;
        v56 = objc_msgSend(v55, "removeItemAtPath:error:", v53, &v70);
        v57 = v70;
        if ((v56 & 1) == 0 && objc_msgSend(*(id *)(a1 + 56), "fileExistsAtPath:", v53))
        {
          PLMyPhotoStreamGetLog();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v100 = v53;
            v101 = 2112;
            v102 = v57;
            _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Failed to delete Photo Stream Data directory at path %@ : %@", buf, 0x16u);
          }

        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v95, 16);
    }
    while (v50);
  }

}

uint64_t __95__PLPhotoStreamsHelper_deletePhotoStreamAssetsWithLibraryServiceManager_withReason_completion___block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    PLMyPhotoStreamGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "removing Photo Stream data directory %@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v11 = 0;
    v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v11);
    v7 = v11;
    if ((v6 & 1) == 0 && objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", *(_QWORD *)(a1 + 32)))
    {
      PLMyPhotoStreamGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed stream data directory %@ : %@", buf, 0x16u);
      }

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
