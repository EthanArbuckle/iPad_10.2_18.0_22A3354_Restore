@implementation PLRebuildableDirectory

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLRebuildableDirectory url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PLRebuildableDirectory url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)gatherAssetsToImport:(id)a3 pendingAssetsCount:(unint64_t *)a4 onDiskURLsToSkip:(id)a5 cameraRollOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  NSFileManager *fm;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  _BOOL8 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t *v36;
  void *v37;
  id obj;
  id v39;
  uint64_t v40;
  unsigned int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v6 = a6;
  v36 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v39 = a5;
  fm = self->_fm;
  -[PLRebuildableDirectory url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](fm, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v13, 1, &__block_literal_global_80943);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PLRebuildableDirectory isPhotoStream](self, "isPhotoStream"))
  {
    v37 = 0;
    goto LABEL_11;
  }
  -[PLRebuildableDirectory url](self, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v46, v12, 0);
  v17 = v46;
  v18 = v17;
  if (!v16)
  {

LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v19 = objc_msgSend(v17, "length");

  if (!v19)
    goto LABEL_7;
LABEL_8:
  PLMigrationGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[PLRebuildableDirectory url](self, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v49 = v21;
    v50 = 2112;
    v51 = v18;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Will rebuild Photo Stream content at %@ for stream ID %@", buf, 0x16u);

  }
  v37 = v18;

LABEL_11:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v14;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v22)
  {
    v23 = v22;
    v40 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x19AEC1554]();
        v41 = 0;
        if (-[PLRebuildableDirectory isPhotoStream](self, "isPhotoStream"))
          v27 = 2;
        else
          v27 = 7;
        v41 = v27;
        if (-[PLRebuildableDirectory isCPLAssets](self, "isCPLAssets", v36))
        {
          v41 = 0;
        }
        else
        {
          if (!+[PLModelMigrator shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:](PLModelMigrator, "shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:", v25, &v41))
          {
            PLMigrationGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              goto LABEL_38;
            goto LABEL_37;
          }
          if (v6 && v41 == 1)
          {
            PLMigrationGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              goto LABEL_38;
LABEL_37:
            objc_msgSend(v25, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = v35;
            _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "Skipping sub level '%@'.", buf, 0xCu);

            goto LABEL_38;
          }
        }
        PLMigrationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v25, "path");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v29;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Searching sub level '%@'.", buf, 0xCu);

        }
        if (v6)
        {
          v30 = 0;
        }
        else
        {
          v30 = 0;
          if (-[PLRebuildableDirectory isPhotoStream](self, "isPhotoStream") && v37)
          {
            -[PLRebuildableDirectory photoLibrary](self, "photoLibrary");
            v31 = v6;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLPhotoStreamAlbum photoStreamAlbumWithStreamID:inPhotoLibrary:createIfNeeded:](PLPhotoStreamAlbum, "photoStreamAlbumWithStreamID:inPhotoLibrary:createIfNeeded:", v37, v32, 1);
            v30 = objc_claimAutoreleasedReturnValue();

            v6 = v31;
          }
        }
        v33 = objc_msgSend(v9, "count");
        -[PLRebuildableDirectory _collectContentsOfDirectoryURL:urlsToSkip:forAddingToAlbum:intoAssetsArray:assetsKind:startTime:](self, "_collectContentsOfDirectoryURL:urlsToSkip:forAddingToAlbum:intoAssetsArray:assetsKind:startTime:", v25, v39, v30, v9, v41, self->_startTime);
        v34 = objc_msgSend(v9, "count");
        if (!v6 && v34 != v33)
          *v36 = objc_msgSend(v9, "count");
LABEL_38:

        objc_autoreleasePoolPop(v26);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v23);
  }

}

- (void)_collectContentsOfDirectoryURL:(id)a3 urlsToSkip:(id)a4 forAddingToAlbum:(id)a5 intoAssetsArray:(id)a6 assetsKind:(int)a7 startTime:(double)a8
{
  uint64_t v9;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v9 = *(_QWORD *)&a7;
  v14 = (void *)MEMORY[0x1E0C99D20];
  v15 = *MEMORY[0x1E0C99A90];
  v16 = *MEMORY[0x1E0C998E8];
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "arrayWithObjects:", v15, v16, 0);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self->_fm, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v20, v25, 1, &__block_literal_global_26_80941);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_opt_class();
  -[PLRebuildableDirectory photoLibrary](self, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pathManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectFileURLs:urlsToSkip:forAddingToAlbum:intoAssetsArray:assetsKind:testCreationDates:startTime:pathManager:", v21, v19, v18, v17, v9, 1, a8, v24);

}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isCPLAssets
{
  return self->_isCPLAssets;
}

- (BOOL)isPhotoStream
{
  return self->_isPhotoStream;
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (NSFileManager)fm
{
  return (NSFileManager *)objc_getProperty(self, a2, 32, 1);
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

uint64_t __122__PLRebuildableDirectory__collectContentsOfDirectoryURL_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_startTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate asset dir '%@': %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

uint64_t __98__PLRebuildableDirectory_gatherAssetsToImport_pendingAssetsCount_onDiskURLsToSkip_cameraRollOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate sub dir '%@': %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

+ (id)rebuildableDirectoryWithURL:(id)a3 isCPLAssets:(BOOL)a4 isPhotoStream:(BOOL)a5 photoLibrary:(id)a6 startTime:(double)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  PLRebuildableDirectory *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *p_super;
  void *v19;
  NSObject *v20;
  void *v21;
  NSFileManager *v22;
  NSFileManager *fm;
  int v25;
  void *v26;
  uint64_t v27;

  v9 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = objc_alloc_init(PLRebuildableDirectory);
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3900];
    objc_msgSend(v12, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scannerWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setCharactersToBeSkipped:", 0);
    if (objc_msgSend(v17, "scanLongLong:", 0) && objc_msgSend(v17, "isAtEnd"))
    {
      PLMigrationGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v19;
        _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_DEFAULT, "Found valid PhotoStream directory at %@", (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Invalid PhotoStream directory at %@", (uint8_t *)&v25, 0xCu);

      }
      p_super = &v14->super;
      v14 = 0;
    }

  }
  if (v14)
  {
    if ((objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      objc_storeStrong((id *)&v14->_url, a3);
      v14->_isCPLAssets = a4;
      v14->_isPhotoStream = v9;
      objc_storeStrong((id *)&v14->_photoLibrary, a6);
      v22 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
      fm = v14->_fm;
      v14->_fm = v22;

      v14->_startTime = a7;
    }
    else
    {

      v14 = 0;
    }
  }

  return v14;
}

+ (void)collectFileURLs:(id)a3 urlsToSkip:(id)a4 forAddingToAlbum:(id)a5 intoAssetsArray:(id)a6 assetsKind:(int)a7 testCreationDates:(BOOL)a8 startTime:(double)a9 pathManager:(id)a10
{
  id v15;
  id v16;
  void *v17;
  double v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  PLFileSystemImportAsset *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  id obj;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  NSObject *v64;
  __int16 v65;
  PLFileSystemImportAsset *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v46 = a4;
  v44 = a5;
  v40 = a6;
  v16 = a10;
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    a9 = v18;

  }
  v42 = v16;
  v19 = objc_msgSend(v16, "isUBF", v40);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v15;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  v21 = v46;
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v58;
    v24 = *MEMORY[0x1E0C999D0];
    v47 = *MEMORY[0x1E0C998E8];
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v58 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (v19)
        {
          v56 = 0;
          objc_msgSend(v26, "getResourceValue:forKey:error:", &v56, v24, 0);
          v27 = v56;
          if ((objc_msgSend(v27, "BOOLValue") & 1) != 0)
            goto LABEL_23;
          if ((objc_msgSend(MEMORY[0x1E0D73278], "isValidOriginalURL:", v26) & 1) == 0)
          {
            PLMigrationGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "lastPathComponent");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v62 = v33;
              _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Skipping URL with invalid filename: %@", buf, 0xCu);

            }
LABEL_23:

            continue;
          }

        }
        if ((objc_msgSend(v21, "containsObject:", v26) & 1) != 0)
          continue;
        v28 = (void *)MEMORY[0x19AEC1554]();
        if (!+[PLManagedAsset isValidFileURLForImport:](PLManagedAsset, "isValidFileURLForImport:", v26))
        {
          PLMigrationGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v26;
            _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "_collectFileURLs: skipping %@, not valid for import", buf, 0xCu);
          }
          goto LABEL_32;
        }
        v55 = 0;
        objc_msgSend(v26, "getResourceValue:forKey:error:", &v55, v47, 0);
        v29 = v55;
        -[NSObject timeIntervalSinceReferenceDate](v29, "timeIntervalSinceReferenceDate");
        if (a9 < v30)
        {
          PLMigrationGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a9);
            v34 = (PLFileSystemImportAsset *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v62 = v26;
            v63 = 2112;
            v64 = v29;
            v65 = 2112;
            v66 = v34;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "File import will skip %@ because it was created on %@, after we started import on %@", buf, 0x20u);
            goto LABEL_30;
          }
        }
        else
        {
          if ((v19 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D73278], "uuidFromURL:", v26);
            v31 = objc_claimAutoreleasedReturnValue();
            if (!v31)
              goto LABEL_31;
LABEL_27:
            objc_msgSend(v45, "objectForKeyedSubscript:", v31);
            v34 = (PLFileSystemImportAsset *)objc_claimAutoreleasedReturnValue();
            if (!v34)
            {
              v34 = -[PLFileSystemImportAsset initWithDestinationAlbum:assetKind:]([PLFileSystemImportAsset alloc], "initWithDestinationAlbum:assetKind:", v44, a7);
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v34, v31);
            }
            -[PLFileSystemImportAsset addURL:](v34, "addURL:", v26);
LABEL_30:

            v21 = v46;
            goto LABEL_31;
          }
          objc_msgSend(v26, "lastPathComponent");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringByDeletingPathExtension");
          v31 = objc_claimAutoreleasedReturnValue();

          v21 = v46;
          if (v31)
            goto LABEL_27;
        }
LABEL_31:

LABEL_32:
        objc_autoreleasePoolPop(v28);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v22);
  }

  v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v37 = MEMORY[0x1E0C809B0];
  if ((v19 & 1) == 0)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke;
    v52[3] = &unk_1E3672EC8;
    v53 = v45;
    v54 = v36;
    objc_msgSend(v53, "enumerateKeysAndObjectsUsingBlock:", v52);

  }
  v49[0] = v37;
  v49[1] = 3221225472;
  v49[2] = __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_3;
  v49[3] = &unk_1E3672EC8;
  v50 = v36;
  v51 = v41;
  v38 = v41;
  v39 = v36;
  objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v49);

}

void __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_2;
  v10[3] = &unk_1E3672EA0;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v10);
  v9[2](v9, *MEMORY[0x1E0D747B0]);
  v9[2](v9, *MEMORY[0x1E0D73E10]);
  v9[2](v9, *MEMORY[0x1E0D74710]);

}

void __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v3, "urls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addURLs:", v6);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  }

}

@end
