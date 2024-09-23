@implementation PLLockedResourceTransferRecovery

- (PLLockedResourceTransferRecovery)initWithTransferImportAsset:(id)a3 destinationDirectoryURL:(id)a4
{
  id v7;
  id v8;
  PLLockedResourceTransferRecovery *v9;
  PLLockedResourceTransferRecovery *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLLockedResourceTransferRecovery;
  v9 = -[PLLockedResourceTransferRecovery init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transferAsset, a3);
    objc_storeStrong((id *)&v10->_destinationDirectoryURL, a4);
  }

  return v10;
}

- (BOOL)recoverFromInProgressLockedTransferForImportAsset:(id)a3 pathManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint32_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v74;
  _QWORD v75[5];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  NSObject *v93;
  _BYTE v94[24];
  char v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v72 = a4;
  v69 = v5;
  objc_msgSend(v5, "urls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v70
    || (v8 = (void *)MEMORY[0x1E0D73208],
        -[PLLockedResourceTransferRecovery destinationDirectoryURL](self, "destinationDirectoryURL"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = objc_msgSend(v8, "fileURL:isEqualToFileURL:", v70, v9),
        v9,
        (v8 & 1) != 0))
  {
    *(_QWORD *)v94 = 0;
    *(_QWORD *)&v94[8] = v94;
    *(_QWORD *)&v94[16] = 0x2020000000;
    v95 = 1;
    if (objc_msgSend(v5, "isInterruptedLockedResourceTransfer"))
    {
      objc_msgSend(v5, "lockedResourceTransferMarkerFileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      v12 = objc_msgSend(v11, "removeItemAtURL:error:", v10, &v87);
      v13 = v87;

      if ((v12 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)&v94[8] + 24) = 0;
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v91 = v15;
          v92 = 2112;
          v93 = v13;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] Unable to remove marker file in valid directory (fatal error, bailing out of recovery) at '%@': %@", buf, 0x16u);

        }
      }

    }
    if (*(_BYTE *)(*(_QWORD *)&v94[8] + 24))
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      -[PLLockedResourceTransferRecovery transferAsset](self, "transferAsset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "urls");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v84 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
            PLMigrationGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v21, "path");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v91 = v23;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] recovering from interrupted locked asset transfer, attempting to remove transfer file: '%@'", buf, 0xCu);

            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = 0;
            v25 = objc_msgSend(v24, "removeItemAtURL:error:", v21, &v82);
            v26 = v82;

            if ((v25 & 1) == 0)
            {
              *(_BYTE *)(*(_QWORD *)&v94[8] + 24) = 0;
              PLMigrationGetLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v21, "path");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v91 = v28;
                v92 = 2112;
                v93 = v26;
                _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] error removing in-progress transfer file at: '%@', '%@'", buf, 0x16u);

              }
            }

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
        }
        while (v18);
      }

    }
    -[PLLockedResourceTransferRecovery transferAsset](self, "transferAsset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lockedResourceTransferMarkerFileURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "path");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v31, 1, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(*(_QWORD *)&v94[8] + 24))
      goto LABEL_41;
    if (!objc_msgSend(v72, "isDCIM"))
    {
      v46 = (void *)objc_opt_class();
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke;
      v80[3] = &unk_1E366A630;
      v80[4] = v94;
      objc_msgSend(v46, "enumerateFilesInDirectoryWithType:forMarkerFilePathRelativeToBundle:pathManager:block:", 9, v71, v72, v80);
LABEL_41:
      if (*(_BYTE *)(*(_QWORD *)&v94[8] + 24))
      {
        if (objc_msgSend(v72, "isDCIM"))
        {
          objc_msgSend(&unk_1E37638F0, "arrayByAddingObject:", &unk_1E375E670);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v47 = &unk_1E37638F0;
        }
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v48 = v47;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v77;
          v51 = MEMORY[0x1E0C809B0];
          do
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(_QWORD *)v77 != v50)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
              v54 = (void *)objc_opt_class();
              v55 = objc_msgSend(v53, "integerValue");
              v75[0] = v51;
              v75[1] = 3221225472;
              v75[2] = __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke_51;
              v75[3] = &unk_1E366A630;
              v75[4] = v94;
              objc_msgSend(v54, "enumerateFilesInDirectoryWithType:forMarkerFilePathRelativeToBundle:pathManager:block:", v55, v71, v72, v75);
            }
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          }
          while (v49);
        }

      }
      -[PLLockedResourceTransferRecovery transferAsset](self, "transferAsset");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "lockedResourceTransferMarkerFileURL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(_BYTE *)(*(_QWORD *)&v94[8] + 24))
        goto LABEL_65;
      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0;
        v59 = objc_msgSend(v58, "removeItemAtURL:error:", v57, &v74);
        v60 = v74;

        if ((v59 & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)&v94[8] + 24) = 0;
          PLMigrationGetLog();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v57, "path");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v91 = v62;
            v92 = 2112;
            v93 = v60;
            _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] Unable to remove marker file at '%@': %@", buf, 0x16u);

          }
        }
      }
      else
      {
        PLMigrationGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(0, "path");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = v63;
          _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] Did not find marker file at '%@'", buf, 0xCu);

        }
      }

      if (*(_BYTE *)(*(_QWORD *)&v94[8] + 24))
      {
        PLMigrationGetLog();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          -[PLLockedResourceTransferRecovery destinationDirectoryURL](self, "destinationDirectoryURL");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "path");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "path");
          v67 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v91 = v66;
          v92 = 2112;
          v93 = v67;
          _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] successfully recovered from locked resource transfer for asset files in directory: '%@', based on marker file: '%@'", buf, 0x16u);

        }
        v45 = *(_BYTE *)(*(_QWORD *)&v94[8] + 24) != 0;
      }
      else
      {
LABEL_65:
        v45 = 0;
      }

      _Block_object_dispose(v94, 8);
      goto LABEL_67;
    }
    objc_msgSend((id)objc_opt_class(), "pathToResourceDirectoryForPhotoDirectoryType:fromMarkerFilePathRelativeToBundle:pathManager:", 9, v71, v72);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    v34 = objc_msgSend(v33, "removeItemAtPath:error:", v32, &v81);
    v35 = v81;

    if ((v34 & 1) != 0)
    {
      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v91 = v32;
        v37 = "[lockedResourceTransfer] recovering from interrupted locked asset transfer, removed renders directory: '%@'";
        v38 = v36;
        v39 = OS_LOG_TYPE_DEFAULT;
        v40 = 12;
LABEL_37:
        _os_log_impl(&dword_199541000, v38, v39, v37, buf, v40);
      }
    }
    else
    {
      if ((PLIsErrorFileNotFound() & 1) != 0)
      {
LABEL_39:

        goto LABEL_40;
      }
      *(_BYTE *)(*(_QWORD *)&v94[8] + 24) = 0;
      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v91 = v32;
        v92 = 2112;
        v93 = v35;
        v37 = "[lockedResourceTransfer] Unable to remove marker file in valid directory (fatal error, bailing out of reco"
              "very) at '%@': %@";
        v38 = v36;
        v39 = OS_LOG_TYPE_ERROR;
        v40 = 22;
        goto LABEL_37;
      }
    }

    goto LABEL_39;
  }
  PLMigrationGetLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    -[PLLockedResourceTransferRecovery destinationDirectoryURL](self, "destinationDirectoryURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "path");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v94 = 138412546;
    *(_QWORD *)&v94[4] = v43;
    *(_WORD *)&v94[12] = 2112;
    *(_QWORD *)&v94[14] = v44;
    _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] recovery destination directory: '%@' is not the same as recovery asset directory: '%@'", v94, 0x16u);

  }
  v45 = 0;
LABEL_67:

  return v45;
}

- (PLFileSystemImportAsset)transferAsset
{
  return self->_transferAsset;
}

- (NSURL)destinationDirectoryURL
{
  return self->_destinationDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDirectoryURL, 0);
  objc_storeStrong((id *)&self->_transferAsset, 0);
}

void __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] recovering from interrupted locked asset transfer, attempting to remove transfer render file: '%@'", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v3, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] error removing in-progress transfer render file at: '%@', '%@'", buf, 0x16u);
    }

  }
}

void __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] recovering from interrupted locked asset transfer, attempting to remove transfer derivative file: '%@'", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v3, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] error removing in-progress transfer derivative file at: '%@', '%@'", buf, 0x16u);
    }

  }
}

+ (void)_validateAsset:(id)a3 pathManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v6, "deferredProcessingNeeded") == 11)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v49 = *MEMORY[0x1E0CB2938];
    v50[0] = CFSTR("asset in resource transfer failure state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 46309, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObject:", v12);
  }
  v13 = objc_msgSend(v6, "bundleScope");
  if ((_DWORD)v13)
  {
    if ((_DWORD)v13 == 4)
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v15 = 5;
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
    v15 = 4;
  }
  objc_msgSend(a1, "dontImportMarkerFileURLForAsset:bundleScope:pathManager:", v6, v13, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("marker file exists in current bundle scope at path: %@"), v21);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v47 = *MEMORY[0x1E0CB2938];
    v48 = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v24 = v6;
    v25 = v16;
    v26 = v14;
    v27 = a1;
    v28 = v7;
    v29 = v15;
    v30 = v8;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 46309, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v30;
    v15 = v29;
    v7 = v28;
    a1 = v27;
    v14 = v26;
    v16 = v25;
    v6 = v24;
    objc_msgSend(v8, "addObject:", v32);

  }
  if ((v14 & 1) == 0)
  {
    objc_msgSend(a1, "dontImportMarkerFileURLForAsset:bundleScope:pathManager:", v6, v15, v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "fileExistsAtPath:", v35);

    if (v36)
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v33, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("marker file exists in orphaned bundle scope at path: %@"), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0D74498];
      v45 = *MEMORY[0x1E0CB2938];
      v46 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 46309, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v43);
    }

  }
}

+ (unsigned)oppositeBundleScope:(unsigned __int16)a3
{
  unsigned __int16 v3;

  if (a3 == 4)
    v3 = 0;
  else
    v3 = 5;
  if (a3)
    return v3;
  else
    return 4;
}

+ (BOOL)isStaleResourceURL:(id)a3 asset:(id)a4 resource:(id)a5 pathManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = +[PLLockedResourceTransferRecovery oppositeBundleScope:](PLLockedResourceTransferRecovery, "oppositeBundleScope:", objc_msgSend(v10, "bundleScope"));
  if ((_DWORD)v13 == 5)
  {
    v14 = 0;
  }
  else
  {
    +[PLLockedResourceTransferRecovery destinationURLForResource:asset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "destinationURLForResource:asset:bundleScope:pathManager:", v11, v10, v13, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(MEMORY[0x1E0D73208], "fileURL:isEqualToFileURL:", v15, v9);

  }
  return v14;
}

+ (id)lockedTransferRecoveryMarkerFileExtension
{
  return CFSTR("lockedresourcetransfer");
}

+ (id)dcimDirectoryForAssetDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6
{
  int v7;
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v11, "isDCIM");
  v13 = 0;
  if (v9 && v12)
  {
    objc_msgSend(v11, "photoDirectoryWithType:", 27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v14, 31, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _PLPathContainsPath(v15, v9);
    if (v7 == 4)
    {
      if (!v16)
      {
        objc_msgSend(v15, "stringByAppendingPathComponent:", v9);
        v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v13 = v17;
        goto LABEL_10;
      }
    }
    else if (v16)
    {
      objc_msgSend(v11, "assetMainFilePathWithDirectory:filename:bundleScope:", v9, v10, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByDeletingLastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v19, 27, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      goto LABEL_11;
    }
    v17 = v9;
    goto LABEL_9;
  }
LABEL_11:

  return v13;
}

+ (id)dontImportMarkerFileURLForAsset:(id)a3 bundleScope:(unsigned __int16)a4 pathManager:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  +[PLLockedResourceTransferRecovery lockedTransferRecoveryMarkerFileExtension](PLLockedResourceTransferRecovery, "lockedTransferRecoveryMarkerFileExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "shouldUseFileIdentifierForBundleScope:", v6))
  {
    v11 = objc_alloc(MEMORY[0x1E0D73278]);
    objc_msgSend(v8, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniformTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalFilename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v12, v6, v13, 0, 0, 0, v14);

    objc_msgSend(v9, "readOnlyUrlWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByDeletingPathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathExtension:", v10);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "directory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filename");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dcimDirectoryForAssetDirectory:filename:bundleScope:pathManager:", v19, v20, v6, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v23 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "filename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetMainFilePathWithDirectory:filename:bundleScope:", v15, v21, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringByDeletingPathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathExtension:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v18;

LABEL_7:
  return v23;
}

+ (id)assetDirectoryForAsset:(id)a3 bundleScope:(unsigned __int16)a4 pathManager:(id)a5
{
  int v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "isDCIM");
  objc_msgSend(v7, "directory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "photoDirectoryWithType:", 27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v11, 31, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "directory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _PLPathContainsPath(v12, v13);

    if (v6 == 4)
    {
      if ((v14 & 1) == 0)
      {
        objc_msgSend(v7, "directory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingPathComponent:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v20 = (void *)v16;

        v10 = v20;
      }
    }
    else if (v14)
    {
      objc_msgSend(v7, "directory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetMainFilePathWithDirectory:filename:bundleScope:", v17, v18, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v15, 27, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

  }
  return v10;
}

+ (BOOL)updateAssetPropertiesAndSaveForAsset:(id)a3 moveToDestinationScope:(unsigned __int16)a4 library:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  id v28;
  id v29;
  void *v30;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v7 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setBundleScope:", v7);
  objc_msgSend(v8, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDCIM");

  if (v11)
  {
    objc_msgSend(v9, "pathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLockedResourceTransferRecovery assetDirectoryForAsset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "assetDirectoryForAsset:bundleScope:pathManager:", v8, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDirectory:", v13);
  }
  objc_msgSend(v8, "modernResources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "pathManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLLockedResourceTransferRecovery destinationURLForResource:asset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "destinationURLForResource:asset:bundleScope:pathManager:", v20, v8, v7, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "markAsLocallyAvailableWithFilePath:", v23);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }

  if (!(_DWORD)v7)
    objc_msgSend(v8, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
  objc_msgSend(v9, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hasChanges");

  if (v25)
  {
    objc_msgSend(v9, "managedObjectContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v27 = objc_msgSend(v26, "save:", &v34);
    v28 = v34;

    if ((v27 & 1) == 0)
    {
      v29 = v28;
      v30 = v29;
      if (a6)
        *a6 = objc_retainAutorelease(v29);

    }
  }
  else
  {
    v27 = 1;
  }

  return v27;
}

+ (id)assetMainScopeDirectoryFromMarkerFilePathRelativeToBundle:(id)a3 pathManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  __CFString *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isDCIM"))
  {
    objc_msgSend(v6, "photoDirectoryWithType:", 27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v7, 31, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_PLPathContainsPath(v8, v5))
    {
      objc_msgSend(v8, "pathComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      objc_msgSend(v5, "pathComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == 1)
      {
        v12 = &stru_1E36789C0;
      }
      else
      {
        v13 = 0;
        v12 = &stru_1E36789C0;
        do
        {
          if (v13 >= v10)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByAppendingPathComponent:](v12, "stringByAppendingPathComponent:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v12 = (__CFString *)v15;
          }
          ++v13;
        }
        while (v13 < objc_msgSend(v11, "count") - 1);
      }

    }
    else
    {
      objc_msgSend(v5, "stringByDeletingLastPathComponent");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)pathToResourceDirectoryForPhotoDirectoryType:(unsigned __int8)a3 fromMarkerFilePathRelativeToBundle:(id)a4 pathManager:(id)a5
{
  uint64_t v6;
  id v9;
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
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if ((_DWORD)v6 == 4)
  {
    objc_msgSend(v10, "photoDirectoryWithType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  if ((v6 - 9) >= 2
    && (_DWORD)v6 != 12
    && ((_DWORD)v6 != 30 || !objc_msgSend(v10, "isDCIM")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLLockedResourceTransferRecovery.m"), 310, CFSTR("Unsupported type"));

    v14 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v11, "isDCIM"))
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__25252;
    v38 = __Block_byref_object_dispose__25253;
    v39 = 0;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __128__PLLockedResourceTransferRecovery_pathToResourceDirectoryForPhotoDirectoryType_fromMarkerFilePathRelativeToBundle_pathManager___block_invoke;
    v33[3] = &unk_1E3666F28;
    v33[4] = &v34;
    objc_msgSend(v11, "enumerateBundleScopesWithBlock:", v33);
    v21 = objc_msgSend(v11, "pathRelativeToBundle:isSubpathOfPhotoDirectoryWithType:", v9, 4);
    v22 = v11;
    if ((v21 & 1) == 0)
    {
      v23 = (void *)v35[5];
      objc_msgSend(v11, "photoDirectoryWithType:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingPathComponent:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = objc_msgSend(v23, "path:isSubpathOfPhotoDirectoryWithType:", v25, 4);

      if (!(_DWORD)v23)
        goto LABEL_17;
      v22 = (void *)v35[5];
    }
    v26 = v22;
    if (v26)
    {
      v27 = v26;
      objc_msgSend(v9, "stringByDeletingLastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "photoDirectoryWithType:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByAppendingPathComponent:", v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      _Block_object_dispose(&v34, 8);

      goto LABEL_19;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoDirectoryWithType:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v6 == 9)
  {
    objc_msgSend(v9, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", *MEMORY[0x1E0D74370]);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
  }

LABEL_19:
  return v14;
}

+ (void)enumerateFilesInDirectoryWithType:(unsigned __int8)a3 forMarkerFilePathRelativeToBundle:(id)a4 pathManager:(id)a5 block:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  void (**v40)(id, void *);
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v8 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v40 = (void (**)(id, void *))a6;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLLockedResourceTransferRecovery.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

  }
  if (v8 > 0x1E
    || ((1 << v8) & 0x1610) == 0 && ((_DWORD)v8 != 30 || (objc_msgSend(v12, "isDCIM") & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLLockedResourceTransferRecovery.m"), 321, CFSTR("Unsupported type"));

  }
  objc_msgSend(a1, "pathToResourceDirectoryForPhotoDirectoryType:fromMarkerFilePathRelativeToBundle:pathManager:", v8, v11, v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_msgSend(v11, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByDeletingPathExtension");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isDCIM") && ((_DWORD)v8 == 30 || (_DWORD)v8 == 12))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v41, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v18)
      {
        v19 = v18;
        v20 = v12;
        v21 = *(_QWORD *)v48;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v48 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            if ((objc_msgSend(v23, "hasPrefix:", v42) & 1) != 0)
            {
              objc_msgSend(v41, "stringByAppendingPathComponent:", v23);
              v24 = objc_claimAutoreleasedReturnValue();

              v41 = (void *)v24;
              v12 = v20;
              goto LABEL_22;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          if (v19)
            continue;
          break;
        }
        v12 = v20;
      }
    }
    else
    {
LABEL_22:
      v25 = 0;
      if (objc_msgSend(v12, "isDCIM") && v8 <= 0x1E)
        v25 = (0x40001200u >> v8) & 1;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentsOfDirectoryAtPath:error:", v41, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v27;
      v28 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v28)
      {
        v29 = v28;
        v39 = v12;
        v30 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v17);
            v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            if ((v25 & 1) != 0 || objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "hasPrefix:", v42))
            {
              objc_msgSend(v32, "lastPathComponent");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "lastPathComponent");
              v34 = v11;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v33, "isEqualToString:", v35);

              v11 = v34;
              if ((v36 & 1) == 0)
              {
                objc_msgSend(v41, "stringByAppendingPathComponent:", v32);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v40[2](v40, v37);

              }
            }
          }
          v29 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v29);
        v12 = v39;
      }
    }

  }
}

+ (id)dcimFileURLForAsset:(id)a3 cplResourceType:(unint64_t)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 resourceType:(unsigned int)a7 utiString:(id)a8 bundleScope:(unsigned __int16)a9 pathManager:(id)a10
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v13 = a3;
  v14 = a8;
  v15 = a10;
  if (objc_msgSend(v15, "isDCIM"))
  {
    objc_msgSend(v13, "directory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLockedResourceTransferRecovery dcimDirectoryForAssetDirectory:filename:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "dcimDirectoryForAssetDirectory:filename:bundleScope:pathManager:", v16, v17, a9, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_9;
    if (a4 == 1)
    {
      if (!v18)
      {
        v19 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v13, "filename");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_12:

        goto LABEL_13;
      }
      v20 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v13, "filename");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetMainFilePathWithDirectory:filename:bundleScope:", v18, v21, a9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fileURLWithPath:isDirectory:", v22, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v13, "pathForCPLResourceType:adjusted:", a4, a5 == 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pathExtension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
LABEL_9:
      +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_retainAutorelease(v24);
    objc_msgSend(v21, "UTF8String");
    objc_msgSend(v13, "filename");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLThumbnailManager masterThumbFilename](PLThumbnailManager, "masterThumbFilename");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v25, "UTF8String");
    PLDCIMURLForResourcePropertiesAndPathManager();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v19 = 0;
LABEL_13:

  return v19;
}

+ (id)dcimFileURLForAsset:(id)a3 resource:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v11, "cplType");
  v14 = objc_msgSend(v11, "version");
  v15 = objc_msgSend(v11, "recipeID");
  v16 = objc_msgSend(v11, "resourceType");
  objc_msgSend(v11, "uniformTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v21) = a5;
  objc_msgSend(a1, "dcimFileURLForAsset:cplResourceType:version:recipeID:resourceType:utiString:bundleScope:pathManager:", v12, v13, v14, v15, v16, v18, v21, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)destinationURLForResource:(id)a3 asset:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v12, "shouldUseFileIdentifierForBundleScope:", v7))
  {
    v22 = objc_alloc(MEMORY[0x1E0D73278]);
    objc_msgSend(v11, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniformTypeIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "version");
    v16 = objc_msgSend(v10, "resourceType");
    v17 = objc_msgSend(v10, "recipeID");
    objc_msgSend(v11, "originalFilename");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v22, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v13, v7, v14, v15, v16, v17, v18);

    objc_msgSend(v12, "readOnlyUrlWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "dcimFileURLForAsset:resource:bundleScope:pathManager:", v11, v10, v7, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (void)validateAssetWithUUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PLLockedResourceTransferRecovery_validateAssetWithUUID_inLibrary___block_invoke;
  v10[3] = &unk_1E3677C40;
  v11 = v6;
  v12 = v7;
  v13 = a1;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v10);

}

void __68__PLLockedResourceTransferRecovery_validateAssetWithUUID_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_validateAsset:pathManager:", v4, v3);

  }
}

void __128__PLLockedResourceTransferRecovery_pathToResourceDirectoryForPhotoDirectoryType_fromMarkerFilePathRelativeToBundle_pathManager___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  if (a2 == 4)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
    v7 = v8;
  }

}

@end
