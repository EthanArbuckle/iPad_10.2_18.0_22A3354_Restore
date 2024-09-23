@implementation PLFileSystemAssetImporter

- (PLFileSystemAssetImporter)initWithPhotoLibrary:(id)a3 libraryServicesManager:(id)a4
{
  id v8;
  id v9;
  PLFileSystemAssetImporter *v10;
  PLFileSystemAssetImporter *v11;
  uint64_t v12;
  NSString *libraryBundlePath;
  uint64_t v14;
  NSString *photoLibraryStoreUUID;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLFileSystemAssetImporter;
  v10 = -[PLFileSystemAssetImporter init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PLFileSystemAssetImporter.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

    }
    objc_storeWeak((id *)&v11->_libraryServicesManager, v9);
    -[PLFileSystemAssetImporter libraryBundlePathWithPhotoLibrary:](v11, "libraryBundlePathWithPhotoLibrary:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    libraryBundlePath = v11->_libraryBundlePath;
    v11->_libraryBundlePath = (NSString *)v12;

    objc_msgSend(v8, "managedObjectContextStoreUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    photoLibraryStoreUUID = v11->_photoLibraryStoreUUID;
    v11->_photoLibraryStoreUUID = (NSString *)v14;

    v11->_thumbnailBatchFetchSize = 50;
  }

  return v11;
}

- (id)libraryBundlePathWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUBF");

  if (v5)
  {
    objc_msgSend(v3, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 4;
LABEL_6:
    objc_msgSend(v6, "photoDirectoryWithType:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((PLIsEDUMode() & 1) == 0)
  {
    objc_msgSend(v3, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
    goto LABEL_6;
  }
  NSHomeDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Media"));
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NSMutableIndexSet count](self->_thumbIndexes, "count"))
    +[PLThumbnailIndexes recycleThumbnailIndexes:inLibrary:](PLThumbnailIndexes, "recycleThumbnailIndexes:inLibrary:", self->_thumbIndexes, self->_photoLibrary);
  v3.receiver = self;
  v3.super_class = (Class)PLFileSystemAssetImporter;
  -[PLFileSystemAssetImporter dealloc](&v3, sel_dealloc);
}

- (id)_addAssetWithURL:(id)a3 existingOID:(id)a4 assetUUID:(id)a5 isPlaceholder:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  PLPhotoLibrary *photoLibrary;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  BOOL v51;
  void *v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  NSObject *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x19AEC1554]();
  photoLibrary = self->_photoLibrary;
  if (v11)
  {
    +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", v11, photoLibrary);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_8;
  }
  else
  {
    +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v12, photoLibrary);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v15 = (id)v16;
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v10, "path");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v18;
      v57 = 2114;
      v58 = v12;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: EXISTING ASSET (%{public}@ [%{public}@]) (UUID already inserted by asset creation request?)", buf, 0x16u);
LABEL_28:

      goto LABEL_29;
    }
  }
  -[PLPhotoLibrary managedObjectContext](self->_photoLibrary, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLManagedAsset, "insertInManagedObjectContext:", v19);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_30:
    objc_autoreleasePoolPop(v13);
    v47 = 0;
    goto LABEL_31;
  }
LABEL_8:
  v51 = a6;
  v52 = v13;
  v20 = v12;
  objc_msgSend(v10, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFilename:", v21);

  objc_msgSend(v15, "filename");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOriginalFilename:", v22);

  -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isDCIM");

  if (v24)
  {
    -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v27, 31, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDirectory:", v28);

    v29 = (void *)MEMORY[0x1E0D73208];
    objc_msgSend(v10, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "photoDirectoryWithType:", 27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v29) = objc_msgSend(v29, "filePath:hasPrefix:", v30, v32);

    v12 = v20;
    v13 = v52;
    if ((v29 & 1) == 0)
      goto LABEL_16;
    v33 = 4;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0D73208];
    objc_msgSend(v10, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "photoDirectoryWithType:", 27);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "filePath:hasPrefix:", v35, v37))
      v33 = 4;
    else
      v33 = 0;

    -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v40, 31, v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDirectory:", v41);

    v12 = v20;
    v13 = v52;
  }
  objc_msgSend(v15, "setBundleScope:", v33);
LABEL_16:
  if (!v51)
  {
    v54 = 0;
    v42 = *MEMORY[0x1E0C99998];
    v53 = 0;
    v43 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v54, v42, &v53);
    v18 = v54;
    v17 = v53;
    if (v43)
    {
      if (v18)
      {
        objc_msgSend(v15, "setOriginalFilesize:", objc_msgSend(v18, "unsignedLongLongValue"));

        goto LABEL_20;
      }
      PLMigrationGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
    }
    else
    {
      PLMigrationGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
LABEL_27:

        objc_msgSend(v15, "deleteFromDatabaseOnly");
        goto LABEL_28;
      }
    }
    objc_msgSend(v10, "path");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v56 = v49;
    v57 = 2112;
    v58 = v17;
    _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Unable to get file size for \"%@\": %@", buf, 0x16u);

    goto LABEL_27;
  }
LABEL_20:
  objc_msgSend(v10, "pathExtension");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = +[PLManagedAsset isKnownFileExtension:](PLManagedAsset, "isKnownFileExtension:", v44);

  if (v45)
  {
    objc_msgSend(v10, "pathExtension");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUniformTypeIdentifierFromPathExtension:", v46);

  }
  objc_msgSend(v15, "updateAssetKindFromUniformTypeIdentifier");
  objc_autoreleasePoolPop(v13);
  v15 = v15;
  v47 = v15;
LABEL_31:

  return v47;
}

- (id)assetURLisInDatabase:(id)a3 deferredPreviewURL:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableDictionary count](self->_existingUUIDsByUppercasePath, "count"))
  {
    v8 = -[NSString length](self->_libraryBundlePath, "length");
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      objc_msgSend(v7, "path");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v9;
    }
    v13 = v11;
    objc_msgSend(v11, "stringByResolvingSymlinksInPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "hasPrefix:", self->_libraryBundlePath);
    v12 = 0;
    if (objc_msgSend(v10, "length") > v8 && v15)
    {
      if (v7)
      {
        objc_msgSend(v10, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByDeletingLastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v19, 31, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "stringByAppendingPathComponent:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "substringFromIndex:", v8 + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "uppercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_existingUUIDsByUppercasePath, "objectForKey:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)addAssetWithURLs:(id)a3 assetPayload:(id)a4 forceInsert:(BOOL)a5 forceUpdate:(BOOL)a6 fixAddedDate:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  char v67;
  void *v68;
  void *v69;
  BOOL v70;
  NSObject *v71;
  void *v72;
  _BOOL4 v73;
  int v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  NSObject *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  NSObject *v97;
  NSObject *v98;
  char v99;
  void *v100;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  int v107;
  id v108;
  void *v109;
  int v110;
  NSObject *v111;
  id v112;
  NSString *photoLibraryStoreUUID;
  void *v114;
  NSObject *v115;
  int v116;
  void *v117;
  void *v118;
  id WeakRetained;
  id v120;
  uint64_t v121;
  void *v122;
  char v123;
  NSObject *v124;
  void *v125;
  id v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  _BOOL4 v131;
  NSObject *v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  id v144;
  _BOOL4 v145;
  int v147;
  int v148;
  id v149;
  _BOOL4 v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[5];
  id v161;
  id v162;
  NSObject *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  uint64_t *v171;
  int v172;
  BOOL v173;
  char v174;
  BOOL v175;
  BOOL v176;
  int v177;
  char v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  int v182;
  _QWORD v183[4];
  id v184;
  id v185;
  unsigned __int8 v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  id v192;
  int location;
  _BYTE location_4[18];
  __int16 v195;
  NSObject *v196;
  __int16 v197;
  NSString *v198;
  __int16 v199;
  _BOOL4 v200;
  __int16 v201;
  int v202;
  __int16 v203;
  _BOOL4 v204;
  uint64_t v205;

  v7 = a6;
  v8 = a5;
  v205 = *MEMORY[0x1E0C80C00];
  v157 = a3;
  v11 = a4;
  if (v8 && v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot call addAssetWithURLs with both forceInsert and forceUpdate"), 0);
    v126 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v126);
  }
  v152 = v11;
  objc_msgSend(v11, "payloadID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = 0;
  else
    v14 = v7;
  v150 = v14;
  if (v13)
    v15 = 0;
  else
    v15 = v8;
  v187 = 0;
  v188 = &v187;
  v189 = 0x3032000000;
  v190 = __Block_byref_object_copy__23020;
  v191 = __Block_byref_object_dispose__23021;
  v192 = 0;
  +[PLPhotoLibrary masterURLFromSidecarURLs:](PLPhotoLibrary, "masterURLFromSidecarURLs:", v157);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = 0;
  objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:exists:includeUnknownAttributes:", v16, &v186, 0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_initWeak((id *)&location, self);

  v18 = objc_alloc(MEMORY[0x1E0D73248]);
  v183[0] = MEMORY[0x1E0C809B0];
  v183[1] = 3221225472;
  v183[2] = __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke;
  v183[3] = &unk_1E3670E50;
  objc_copyWeak(&v185, (id *)&location);
  v19 = v16;
  v184 = v19;
  v155 = (void *)objc_msgSend(v18, "initWithBlock:", v183);

  objc_destroyWeak(&v185);
  objc_destroyWeak((id *)&location);
  v182 = 0;
  -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isUBF");

  v147 = v15 || v150;
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D73278], "fileIdentifierForValidOriginalURL:", v19);
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject uuid](v22, "uuid");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject resourceType](v22, "resourceType");
    -[NSObject resourceVersion](v22, "resourceVersion");
    -[NSObject recipeId](v22, "recipeId");
    if (PLResourceTypeIsAllowedForUseInFilename())
    {
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = -[NSObject resourceType](v22, "resourceType");
        objc_msgSend(v19, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        location = 67109378;
        *(_DWORD *)location_4 = v25;
        *(_WORD *)&location_4[4] = 2114;
        *(_QWORD *)&location_4[6] = v26;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "addAssetWithURLs: cannot import white-listed resource with type %d as asset primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0x12u);

      }
      v153 = 0;
      v154 = 0;
LABEL_43:

LABEL_44:
LABEL_45:
      objc_msgSend(v157, "allObjects");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "_pl_map:", &__block_literal_global_23054);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v186)
      {
        PLMigrationGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "path");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          location = 138543618;
          *(_QWORD *)location_4 = v49;
          *(_WORD *)&location_4[8] = 2114;
          *(_QWORD *)&location_4[10] = v47;
          _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "addAssetWithURLs: asset couldn't be added (invalid file resources): %{public}@, skipping files: %{public}@", (uint8_t *)&location, 0x16u);

        }
      }
      else
      {
        PLMigrationGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "path");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          location = 138543618;
          *(_QWORD *)location_4 = v50;
          *(_WORD *)&location_4[8] = 2114;
          *(_QWORD *)&location_4[10] = v47;
          _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "addAssetWithURLs: file couldn't be opened (deleted or read failed): %{public}@, skipping files: %{public}@", (uint8_t *)&location, 0x16u);

        }
      }

      goto LABEL_51;
    }
    v153 = 0;
    v154 = 0;
    LOBYTE(v145) = 0;
    v143 = 0;
    LOBYTE(v32) = 0;
    goto LABEL_85;
  }
  objc_msgSend(v156, "UUIDStringForKey:", *MEMORY[0x1E0D74010]);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v27 = v13;

    v23 = v27;
  }
  objc_msgSend(v156, "getInt32:forKey:", &v182, *MEMORY[0x1E0D73F70]);
  v145 = +[PLImageWriter semanticEnhanceSceneIsValid:](PLImageWriter, "semanticEnhanceSceneIsValid:", v182);
  if (+[PLImageWriter isDeferredPhotoPreviewURL:](PLImageWriter, "isDeferredPhotoPreviewURL:", v19))
  {
    objc_msgSend(v155, "objectValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isDeferredPhotoProxy");

    if (v29)
    {
      objc_msgSend(v155, "objectValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "deferredPhotoProcessingIdentifier");
      v31 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
    }
    v153 = (void *)v31;
    if (v31)
      v33 = 1;
    else
      v33 = v145;
    v143 = v33;
    if (v33 == 1)
    {
      objc_msgSend(v19, "pathExtension");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLImageWriter finalizedAssetURLForDeferredPhotoPreviewURL:extension:](PLImageWriter, "finalizedAssetURLForDeferredPhotoPreviewURL:extension:", v19, v34);
      v154 = (void *)objc_claimAutoreleasedReturnValue();

      PLMigrationGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "path");
        v37 = objc_claimAutoreleasedReturnValue();
        location = 138412802;
        *(_QWORD *)location_4 = v36;
        *(_WORD *)&location_4[8] = 2114;
        *(_QWORD *)&location_4[10] = v153;
        v195 = 2112;
        v196 = v37;
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: Found deferred photo preview: %@ with identifier %{public}@ for base asset %@", (uint8_t *)&location, 0x20u);

      }
    }
    else
    {
      PLMigrationGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "path");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        v41 = CFSTR("missing");
        if (v29)
          v41 = CFSTR("has");
        location = 138412546;
        *(_QWORD *)location_4 = v39;
        *(_WORD *)&location_4[8] = 2112;
        *(_QWORD *)&location_4[10] = v41;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "addAssetWithURLs: Found unsupported deferred photo preview: %@ %@ proxy flag, missing identifier. Adding as regular asset", (uint8_t *)&location, 0x16u);

      }
      PLMigrationGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "path");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        location = 138412290;
        *(_QWORD *)location_4 = v42;
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "addAssetWithURLs: Found unsupported deferred photo preview: %@ adding as regular asset", (uint8_t *)&location, 0xCu);

      }
      v153 = 0;
      v154 = 0;
    }

  }
  else
  {
    v153 = 0;
    v154 = 0;
    v143 = 0;
  }
  LODWORD(v32) = +[PLImageWriter isSpatialOverCaptureURL:](PLImageWriter, "isSpatialOverCaptureURL:", v19);
  if ((_DWORD)v32)
  {
    PLMigrationGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543362;
      *(_QWORD *)location_4 = v44;
      _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "addAssetWithURLs: spatial over capture cannot be imported without original asset resource: %{public}@, skipping", (uint8_t *)&location, 0xCu);

    }
    v147 = 0;
  }
  objc_msgSend(v19, "pathExtension");
  v22 = objc_claimAutoreleasedReturnValue();
  if (+[PLPhotoLibrary isAdjustmentEnvelopeExtension:](PLPhotoLibrary, "isAdjustmentEnvelopeExtension:", v22))
  {
    PLMigrationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543362;
      *(_QWORD *)location_4 = v45;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "addAssetWithURLs: cannot import adjustment envelope as asset primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0xCu);

    }
    goto LABEL_43;
  }
  if (v186)
  {
    if (!+[PLPhotoLibrary isVideoFileExtension:](PLPhotoLibrary, "isVideoFileExtension:", v22))
    {
      v177 = 31;
      objc_msgSend(v156, "getUInt16:forKey:", &v177, *MEMORY[0x1E0D73FB8]);
      if (v177 == 4)
      {
        PLMigrationGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "path");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          location = 138543362;
          *(_QWORD *)location_4 = v60;
          _os_log_impl(&dword_199541000, (os_log_t)v32, OS_LOG_TYPE_ERROR, "addAssetWithURLs: cannot import alternate image as asset primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0xCu);

        }
        v147 = 0;
        LOBYTE(v32) = 1;
      }
      goto LABEL_85;
    }
    objc_msgSend(v152, "mediaGroupUUID");
    v54 = (id)objc_claimAutoreleasedReturnValue();
    if (v54)
      goto LABEL_80;
    objc_msgSend(v156, "stringForKey:", *MEMORY[0x1E0D73F88]);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    if (v54)
      goto LABEL_80;
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v19);
    v55 = objc_claimAutoreleasedReturnValue();
    PFVideoComplementMetadataForVideoAVAssetPreloadingValues();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "pairingIdentifier");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v55, 0);
    v135 = (void *)v55;
    v137 = v56;
    if (!v141)
    {
      PLMigrationGetLog();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location) = 0;
        _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Failed to check for existence of variation identifier", (uint8_t *)&location, 2u);
      }

    }
    if (v139)
    {
      if (v56)
      {
        objc_msgSend(v56, "videoDuration");
        if ((v180 & 0x100000000) != 0)
        {
          objc_msgSend(v56, "imageDisplayTime");
          if ((v178 & 1) == 0)
          {
            PLMigrationGetLog();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v19, "path");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              location = 138543362;
              *(_QWORD *)location_4 = v59;
              _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Found invalid still display time on video complement: %{public}@", (uint8_t *)&location, 0xCu);

            }
          }
          v54 = v139;
LABEL_79:

          if (!v54)
          {
LABEL_84:

            goto LABEL_85;
          }
LABEL_80:
          if (!+[PLManagedAsset isOrphanedMediaGroupUUID:](PLManagedAsset, "isOrphanedMediaGroupUUID:", v54))
          {
            PLMigrationGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v19, "path");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              location = 138412546;
              *(_QWORD *)location_4 = v54;
              *(_WORD *)&location_4[8] = 2114;
              *(_QWORD *)&location_4[10] = v65;
              _os_log_impl(&dword_199541000, (os_log_t)v32, OS_LOG_TYPE_ERROR, "addAssetWithURLs: video with identifier %{mediaGroupUUID}@ appears to be compliment resources of an iris asset: %{public}@, skipping", (uint8_t *)&location, 0x16u);

            }
            v147 = 0;
            LOBYTE(v32) = 1;
          }
          goto LABEL_84;
        }
      }
      else
      {
        v179 = 0;
        v180 = 0;
        v181 = 0;
      }
      objc_msgSend(v141, "playbackVariation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "unsignedIntegerValue") == 0;

      if (v62)
      {
        PLMigrationGetLog();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "path");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          location = 138543618;
          *(_QWORD *)location_4 = v139;
          *(_WORD *)&location_4[8] = 2114;
          *(_QWORD *)&location_4[10] = v64;
          _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_DEFAULT, "Video with media group ID %{public}@ does not have playback variation, nor valid still & video duration %{public}@", (uint8_t *)&location, 0x16u);

        }
      }
    }
    v54 = 0;
    goto LABEL_79;
  }
LABEL_85:

  v66 = v186;
  if (v186)
    v67 = v32;
  else
    v67 = 1;
  if ((v67 & 1) == 0)
  {
    v68 = (void *)MEMORY[0x1E0D73208];
    objc_msgSend(v19, "path");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "fileLengthForFilePath:", v69) == 0;

    if (v70)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v19, "path");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        location = 138543362;
        *(_QWORD *)location_4 = v91;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_FAULT, "addAssetWithURLs: attempting to import zero size primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0xCu);

      }
      goto LABEL_44;
    }
    LOBYTE(v32) = 0;
    v66 = v186;
  }
  if ((v32 & 1) != 0 || !v66)
    goto LABEL_45;
  if (!+[PLManagedAsset hasRequiredExtendedAttributesForPersistanceAttributes:](PLManagedAsset, "hasRequiredExtendedAttributesForPersistanceAttributes:", v156))
  {
    PLMigrationGetLog();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "path");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543362;
      *(_QWORD *)location_4 = v72;
      _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_ERROR, "addAssetWithURLs: ERROR - missing required extended attributes for file at URL: %{public}@", (uint8_t *)&location, 0xCu);

    }
  }
  LOWORD(v177) = 0;
  v129 = *MEMORY[0x1E0D73EF8];
  objc_msgSend(v156, "getUInt16:forKey:", &v177);
  v128 = *MEMORY[0x1E0D73F00];
  objc_msgSend(v156, "stringForKey:");
  v130 = objc_claimAutoreleasedReturnValue();
  v73 = -[NSString isEqualToString:](self->_photoLibraryStoreUUID, "isEqualToString:");
  v131 = v73;
  v74 = (unsigned __int16)v177 > 2u && v73;
  if (v74 == 1)
  {
    PLMigrationGetLog();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "path");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543618;
      *(_QWORD *)location_4 = v76;
      *(_WORD *)&location_4[8] = 2114;
      *(_QWORD *)&location_4[10] = v23;
      _os_log_impl(&dword_199541000, v75, OS_LOG_TYPE_ERROR, "addAssetWithURLs: ERROR - previously tried this URL and failed: %{public}@ [%{public}@])", (uint8_t *)&location, 0x16u);

    }
    v147 = 0;
  }
  objc_msgSend(v19, "lastPathComponent");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByDeletingLastPathComponent");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "path");
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset pathForAdjustmentFileWithPathManager:uuid:directory:filename:](PLManagedAsset, "pathForAdjustmentFileWithPathManager:uuid:directory:filename:", v78, v23, v138, v140);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "fileExistsAtPath:", v142);

  if (v80)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v142);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81;
    if (v81)
    {
      objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v83 == 0;

      if (v84)
      {
        -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset pathForAdjustmentDataFileWithPathManager:uuid:directory:filename:](PLManagedAsset, "pathForAdjustmentDataFileWithPathManager:uuid:directory:filename:", v85, v23, v138, v140);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "fileExistsAtPath:", v86);

        if ((v88 & 1) == 0)
        {
          PLMigrationGetLog();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "path");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            location = 138543618;
            *(_QWORD *)location_4 = v90;
            *(_WORD *)&location_4[8] = 2114;
            *(_QWORD *)&location_4[10] = v23;
            _os_log_impl(&dword_199541000, v89, OS_LOG_TYPE_ERROR, "addAssetWithURLs: ERROR - missing adjustment data blob for adjusted asset: %{public}@ [%{public}@])", (uint8_t *)&location, 0x16u);

          }
          v147 = 0;
          v74 = 1;
        }

        v84 = v88 ^ 1;
      }
    }
    else
    {
      v84 = 0;
    }

    v80 = v84;
  }
  v92 = v23;
  v93 = v154;
  if (v143)
  {
    v94 = v19;
  }
  else
  {
    v93 = v19;
    v94 = 0;
  }
  v136 = v93;
  v134 = v94;
  v127 = v80;
  if (((v80 | v15) & 1) != 0)
  {
    v133 = 0;
LABEL_121:
    v23 = v92;
    goto LABEL_149;
  }
  -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "isUBF");

  if (v96)
  {
    if ((v74 & 1) != 0)
    {
      v133 = 0;
      v74 = 1;
      goto LABEL_121;
    }
    -[NSMutableDictionary objectForKey:](self->_existingOIDsByUUID, "objectForKey:", v92);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v133)
    {
      v133 = 0;
      v74 = 0;
      goto LABEL_121;
    }
    PLMigrationGetLog();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v136, "path");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543618;
      *(_QWORD *)location_4 = v100;
      *(_WORD *)&location_4[8] = 2114;
      *(_QWORD *)&location_4[10] = v92;
      _os_log_impl(&dword_199541000, v98, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: EXISTING ASSET (%{public}@ [%{public}@]) (UUID matches existing asset)", (uint8_t *)&location, 0x16u);

    }
    goto LABEL_146;
  }
  -[PLFileSystemAssetImporter assetURLisInDatabase:deferredPreviewURL:](self, "assetURLisInDatabase:deferredPreviewURL:", v136, v134);
  v97 = objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
    v99 = v74;
  else
    v99 = 1;
  if ((v99 & 1) == 0)
  {
    if ((-[NSObject isEqual:](v97, "isEqual:", v92) & 1) != 0)
    {
      PLMigrationGetLog();
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v136, "path");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        location = 138543618;
        *(_QWORD *)location_4 = v102;
        *(_WORD *)&location_4[8] = 2114;
        *(_QWORD *)&location_4[10] = v92;
        _os_log_impl(&dword_199541000, v101, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: DUPLICATE PATH (%{public}@ [%{public}@]) (URL and UUID match database entry)", (uint8_t *)&location, 0x16u);

      }
    }
    else
    {
      PLMigrationGetLog();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v136, "path");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        location = 138543874;
        *(_QWORD *)location_4 = v106;
        *(_WORD *)&location_4[8] = 2114;
        *(_QWORD *)&location_4[10] = v92;
        v195 = 2114;
        v196 = v98;
        _os_log_impl(&dword_199541000, v105, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: DUPLICATE PATH (%{public}@ [%{public}@] -> new UUID %{public}@)", (uint8_t *)&location, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0D73200], "persistUUIDString:forKey:fileURL:", v98, *MEMORY[0x1E0D74010], v19);
    }
    -[NSMutableDictionary objectForKey:](self->_existingOIDsByUUID, "objectForKey:", v98);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_146;
  }
  if ((v74 & 1) != 0)
  {
    v133 = 0;
LABEL_146:
    v74 = 1;
    goto LABEL_147;
  }
  if (-[NSMutableSet containsObject:](self->_existingUUIDs, "containsObject:", v92))
  {
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73200], "persistUUIDString:forKey:fileURL:", v23, *MEMORY[0x1E0D74010], v19);
    PLMigrationGetLog();
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v136, "path");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543874;
      *(_QWORD *)location_4 = v104;
      *(_WORD *)&location_4[8] = 2114;
      *(_QWORD *)&location_4[10] = v92;
      v195 = 2114;
      v196 = v23;
      _os_log_impl(&dword_199541000, v103, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: DUPLICATE UUID (%{public}@ [%{public}@] -> new UUID %{public}@)", (uint8_t *)&location, 0x20u);

    }
    v133 = 0;
    v74 = 0;
    goto LABEL_148;
  }
  v133 = 0;
  v74 = 0;
LABEL_147:
  v23 = v92;
LABEL_148:

LABEL_149:
  v107 = v74 ^ 1 | v147;
  if (!v131)
  {
    if (v107)
    {
      objc_msgSend(MEMORY[0x1E0D73200], "persistString:forKey:fileURL:", self->_photoLibraryStoreUUID, v128, v19);
      if ((_WORD)v177)
        objc_msgSend(MEMORY[0x1E0D73200], "persistUInt16:forKey:fileURL:", 0, v129, v19);
    }
  }
  +[PLDelayedFiledSystemDeletions waitForAllDelayedDeletionsToFinish](PLDelayedFiledSystemDeletions, "waitForAllDelayedDeletionsToFinish");
  v108 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v19, "path");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v108, "fileExistsAtPath:", v109);

  if (v110)
  {
    if ((v107 & ~v127) == 1)
    {
      PLMigrationGetLog();
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v136, "path");
        v112 = (id)objc_claimAutoreleasedReturnValue();
        photoLibraryStoreUUID = self->_photoLibraryStoreUUID;
        v148 = -[NSMutableSet containsObject:](self->_existingUUIDs, "containsObject:", v92);
        -[PLFileSystemAssetImporter assetURLisInDatabase:deferredPreviewURL:](self, "assetURLisInDatabase:deferredPreviewURL:", v136, v134);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        location = 138544898;
        *(_QWORD *)location_4 = v112;
        *(_WORD *)&location_4[8] = 2114;
        *(_QWORD *)&location_4[10] = v92;
        v195 = 2114;
        v196 = v130;
        v197 = 2114;
        v198 = photoLibraryStoreUUID;
        v199 = 1024;
        v200 = v131;
        v201 = 1024;
        v202 = v148;
        v203 = 1024;
        v204 = v114 != 0;
        _os_log_impl(&dword_199541000, v111, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: (%{public}@ [%{public}@], rebuild %{public}@ database %{public}@, same? %d, exists %d, url dupe %d)", (uint8_t *)&location, 0x3Cu);

      }
      PLMigrationGetLog();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        v116 = (unsigned __int16)v177;
        objc_msgSend(v19, "path");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        location = 67109378;
        *(_DWORD *)location_4 = v116 + 1;
        *(_WORD *)&location_4[4] = 2114;
        *(_QWORD *)&location_4[6] = v117;
        _os_log_impl(&dword_199541000, v115, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: PROGRESS - Setting progress flag %d for master URL: %{public}@", (uint8_t *)&location, 0x12u);

      }
      objc_msgSend(MEMORY[0x1E0D73200], "persistUInt16:forKey:fileURL:", (unsigned __int16)(v177 + 1), v129, v19);
      v160[0] = MEMORY[0x1E0C809B0];
      v160[1] = 3221225472;
      v160[2] = __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_49;
      v160[3] = &unk_1E3666970;
      v171 = &v187;
      v160[4] = self;
      v149 = v136;
      v161 = v149;
      v173 = v150;
      v151 = v133;
      v162 = v151;
      v132 = v23;
      v163 = v132;
      v174 = v143;
      v164 = v19;
      v165 = v13;
      v166 = v152;
      v167 = v157;
      v168 = v155;
      v144 = v153;
      v169 = v144;
      v175 = v145;
      v172 = v182;
      v170 = v156;
      v176 = a7;
      v118 = (void *)MEMORY[0x19AEC174C](v160);
      WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      v158[0] = MEMORY[0x1E0C809B0];
      v158[1] = 3221225472;
      v158[2] = __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_51;
      v158[3] = &unk_1E3676CD8;
      v120 = v118;
      v159 = v120;
      objc_msgSend(WeakRetained, "performBlockWithImportMutex:", v158);

      v121 = v188[5];
      if (v121)
      {
        if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks"))
        {
          objc_msgSend((id)v188[5], "avalancheUUID");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          if (v122)
          {
            v123 = objc_msgSend((id)v188[5], "avalanchePickTypeIsVisible");

            if ((v123 & 1) == 0)
              objc_msgSend((id)v188[5], "setVisibilityState:", 2);
          }
        }
      }

      if (!v121)
      {

        v51 = 0;
        v52 = v144;
        v23 = v132;
        goto LABEL_52;
      }
    }
    self->_hasProcessedAnyAssets = 1;
  }
  else
  {
    PLMigrationGetLog();
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "path");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      location = 138543362;
      *(_QWORD *)location_4 = v125;
      _os_log_impl(&dword_199541000, v124, OS_LOG_TYPE_ERROR, "addAssetWithURLs: delayed file deletion in-flight during import, previously found file no longer exists: %{public}@, skipping", (uint8_t *)&location, 0xCu);

    }
  }

LABEL_51:
  v51 = (id)v188[5];
  v52 = v153;
LABEL_52:

  _Block_object_dispose(&v187, 8);
  return v51;
}

- (void)setModificationAndCreationDateOnAsset:(id)a3 withURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v5 = a4;
  objc_msgSend(v31, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "additionalAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exifTimestampString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "additionalAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v31, "additionalAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeZoneOffset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

  }
  else
  {
    v14 = 1;
  }

  if (!v6 || !v7 || !v9 || v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D75140]);
    objc_msgSend(v31, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "libraryBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeZoneLookup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithMediaURL:timeZoneLookup:", v5, v18);

    if (v6)
    {
      if (v7)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(v19, "fileSystemProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setModificationDate:", v26);

      if (v7)
      {
LABEL_10:
        if (v9)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
    objc_msgSend(v19, "utcCreationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDateCreated:", v27);

    LOWORD(v27) = objc_msgSend(v19, "creationDateSource");
    objc_msgSend(v31, "additionalAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDateCreatedSource:", (__int16)v27);

    if (v9)
    {
LABEL_11:
      if (!v14)
      {
LABEL_13:
        objc_msgSend(v31, "dateCreated");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        objc_msgSend(v31, "setSortToken:");

        goto LABEL_14;
      }
LABEL_12:
      objc_msgSend(v19, "timeZoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "additionalAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTimeZoneName:", v20);

      objc_msgSend(v19, "timeZoneOffset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "additionalAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTimeZoneOffset:", v22);

      goto LABEL_13;
    }
LABEL_17:
    objc_msgSend(v19, "creationDateString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "additionalAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setExifTimestampString:", v29);

    if (!v14)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_14:

}

- (BOOL)_setupPhotoAssetAsPhotoIrisIfNeeded:(id)a3 hasVideoComplementResource:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isPhoto") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFileSystemAssetImporter.m"), 722, CFSTR("expect photo asset"));

  }
  if ((objc_msgSend(v7, "isPhotoIris") & 1) == 0)
  {
    if (objc_msgSend(v7, "videoCpDurationValue"))
    {
      objc_msgSend(v7, "setKindSubtype:", 2);
      if (objc_msgSend(v7, "canPlayPhotoIris"))
        v9 = 3;
      else
        v9 = 1;
      if (objc_msgSend(v7, "playbackStyle") != (_DWORD)v9)
        objc_msgSend(v7, "setPlaybackStyle:", v9);
      goto LABEL_17;
    }
    if (!v4)
    {
LABEL_17:
      v8 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v7, "pathForVideoComplementFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!v11 || !v10)
    {
LABEL_24:

      goto LABEL_18;
    }
    v12 = objc_alloc(MEMORY[0x1E0D75318]);
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithPathToVideo:pathToImage:", v10, v13);

    objc_msgSend(v14, "pairingIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v26 = 0uLL;
    v27 = 0;
    if (v14)
    {
      objc_msgSend(v14, "imageDisplayTime");
      v24 = 0uLL;
      v25 = 0;
      objc_msgSend(v14, "originalVideoDuration");
      if (!v16)
        goto LABEL_21;
    }
    else
    {
      v24 = 0uLL;
      v25 = 0;
      if (!v15)
        goto LABEL_21;
    }
    if ((BYTE12(v24) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v24;
      v23 = v25;
      v20 = v26;
      v21 = v27;
      v8 = objc_msgSend(v7, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v16, 0, v18, &v22, &v20, 0);

      goto LABEL_23;
    }
LABEL_21:
    v8 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v8 = 1;
LABEL_18:

  return v8;
}

- (BOOL)_setupPhotoAsset:(id)a3 withURL:(id)a4 isPlaceholder:(BOOL)a5 hasVideoComplementResource:(BOOL)a6
{
  return -[PLFileSystemAssetImporter _setupPhotoAsset:withURL:unknownType:isPlaceholder:hasVideoComplementResource:](self, "_setupPhotoAsset:withURL:unknownType:isPlaceholder:hasVideoComplementResource:", a3, a4, 0, a5, a6);
}

- (BOOL)_setupUnknownAsset:(id)a3 withURL:(id)a4
{
  return -[PLFileSystemAssetImporter _setupPhotoAsset:withURL:unknownType:isPlaceholder:hasVideoComplementResource:](self, "_setupPhotoAsset:withURL:unknownType:isPlaceholder:hasVideoComplementResource:", a3, a4, 1, 0, 0);
}

- (id)_assetAdjustmentsIfExistsForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pathForAdjustmentFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  buf[0] = 0;
  if (v6
    && (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, buf) ? (v9 = buf[0] == 0) : (v9 = 0), v9))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  if (v10)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v10, &v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v33;
    if (!v11)
      goto LABEL_18;
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D75388]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pathForAdjustmentDataFile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v3, "pathForAdjustmentDataFile");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dataWithContentsOfFile:options:error:", v18, 1, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
    }
    v30 = v10;
    v31 = v12;
    v32 = v3;
    v20 = objc_alloc(MEMORY[0x1E0D750B0]);
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D75398]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D753A8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D75380]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D75390]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D753B0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v21, v22, v13, v24, v25, objc_msgSend(v26, "unsignedIntValue"));

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D753B8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend(v19, "setAdjustmentTimestamp:", v27);

    v12 = v31;
    v3 = v32;
    v10 = v30;
    if (!v19)
    {
LABEL_18:
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "PLFileSystemAssetImporter: Failed to create PFAssetAdjustments from '%@'", buf, 0xCu);
      }

      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_setupAdjustmentsFromAdjustmentFileForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v35;
  id v36;
  unsigned __int8 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLFileSystemAssetImporter _assetAdjustmentsIfExistsForAsset:](self, "_assetAdjustmentsIfExistsForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "adjustmentTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "dateCreated");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAdjustmentTimestamp:", v8);

    }
    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    if (objc_msgSend(v4, "isPhoto"))
    {
      objc_msgSend(v4, "pathForBestAvailableFullsizeRenderImageFileOutIsSubstandard:", &v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
      objc_msgSend(v4, "pathForPenultimateFullsizeRenderImageFile");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 && objc_msgSend(v9, "fileExistsAtPath:", v20))
      {
        v21 = v9;
        v36 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v20, 1, &v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v36;
        if (objc_msgSend(v22, "length"))
        {
          v18 = v22;
        }
        else
        {
          PLMigrationGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = v20;
            v40 = 2112;
            v41 = v23;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "PLFileSystemAssetImporter: Unable to read data from file '%@'. %@", buf, 0x16u);
          }

          v18 = 0;
        }

        v9 = v21;
      }
      else
      {
        v18 = 0;
      }
      if (objc_msgSend(v4, "isPhotoIris"))
      {
        objc_msgSend(v4, "pathForFullsizeRenderVideoFile");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v14 = v9;
        v28 = v9;
        v29 = v28;
        buf[0] = 0;
        if (v27)
        {
          v15 = 0;
          if (objc_msgSend(v28, "fileExistsAtPath:isDirectory:", v27, buf) && !buf[0])
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v27, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v15 = 0;
        }

        objc_msgSend(v4, "pathForPenultimateFullsizeRenderVideoFile");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v31 = v29;
        v32 = v31;
        buf[0] = 0;
        if (v30)
        {
          v16 = 0;
          if (objc_msgSend(v31, "fileExistsAtPath:isDirectory:", v30, buf) && !buf[0])
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v30, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v16 = 0;
        }

        objc_msgSend(v4, "setPlaybackStyle:", 3);
        objc_msgSend(v4, "setPlaybackVariationAndLoopingStyleFromAdjustmentRenderTypes:", objc_msgSend(v6, "adjustmentRenderTypes"));
      }
      else
      {
        v14 = v9;
        v15 = 0;
        v16 = 0;
      }
      v17 = 0;
    }
    else
    {
      if (!objc_msgSend(v4, "isVideo"))
      {
        v14 = v9;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
LABEL_45:
        +[PLMutableAssetAdjustmentOptions assetAdjustmentOptionsForFileSystemImport](PLMutableAssetAdjustmentOptions, "assetAdjustmentOptionsForFileSystemImport");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setRenderedContentURL:", v19);
        objc_msgSend(v33, "setPenultimateRenderedJPEGData:", v18);
        objc_msgSend(v33, "setPenultimateRenderedVideoContentURL:", v17);
        objc_msgSend(v33, "setSubstandardRender:", v37);
        objc_msgSend(v33, "setRenderedVideoComplementContentURL:", v15);
        objc_msgSend(v33, "setPenultimateRenderedVideoComplementContentURL:", v16);
        objc_msgSend(v33, "setShouldCheckForLegacyCameraAutoAdjustment:", 1);
        objc_msgSend(v4, "setAdjustments:options:", v6, v33);

        goto LABEL_46;
      }
      objc_msgSend(v4, "pathForFullsizeRenderVideoFile");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13 = v12;
      buf[0] = 0;
      if (v11)
      {
        v35 = 0;
        if (objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, buf) && !buf[0])
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
          v35 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v35 = 0;
      }

      objc_msgSend(v4, "pathForPenultimateFullsizeRenderVideoFile");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v13;
      v25 = v24;
      buf[0] = 0;
      if (v20)
      {
        v17 = 0;
        v14 = v9;
        if (objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v20, buf) && !buf[0])
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v14 = v9;
        v17 = 0;
      }

      v15 = 0;
      v16 = 0;
      v18 = 0;
      v10 = v20;
    }

    v19 = (void *)v35;
    goto LABEL_45;
  }
LABEL_46:

  return v6 != 0;
}

- (BOOL)_setupPhotoAsset:(id)a3 withURL:(id)a4 unknownType:(BOOL)a5 isPlaceholder:(BOOL)a6 hasVideoComplementResource:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v7 = a7;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void *)MEMORY[0x19AEC1554]();
  if (a5)
  {
    v14 = 0;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0D75140]);
    objc_msgSend(v11, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "libraryBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeZoneLookup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v12, 0, 12, v18, 1, 0);

    if (objc_msgSend(v11, "setImageInfoFromImageMetadata:overwriteOriginalProperties:", v14, 1))
    {
      -[PLFileSystemAssetImporter _setupPhotoAssetAsPhotoIrisIfNeeded:hasVideoComplementResource:](self, "_setupPhotoAssetAsPhotoIrisIfNeeded:hasVideoComplementResource:", v11, v7);
      if (objc_msgSend(v14, "cgImageMetadata"))
        objc_msgSend(v11, "setFaceRegionsFromImageMetadata:", objc_msgSend(v14, "cgImageMetadata"));
    }
  }
  if (!-[PLFileSystemAssetImporter _setupAdjustmentsFromAdjustmentFileForAsset:](self, "_setupAdjustmentsFromAdjustmentFileForAsset:", v11)|| (objc_msgSend(v11, "additionalAttributes"), v19 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v19, "unmanagedAdjustment"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v19, !v20))
  {
    objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataForKey:", *MEMORY[0x1E0D73F50]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringForKey:", *MEMORY[0x1E0D73F60]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v24;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "PLFileSystemAssetImporter: setting adjustments, preview image file %@", buf, 0xCu);
      }

      LOBYTE(v27) = 1;
      +[PLImageWriter setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:](PLImageWriter, "setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:", v11, v14, v22, 0, v24, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v27);

    }
    else
    {

      *(_WORD *)buf = 0;
      objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "getUInt16:forKey:", buf, *MEMORY[0x1E0D73EB8]);
    }

  }
  if (!a5)
    objc_msgSend(v11, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);

  objc_autoreleasePoolPop(v13);
  return 1;
}

- (BOOL)_setupVideoAsset:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "setVideoInfoFromFileAtURL:mainFileMetadata:fullSizeRenderURL:overwriteOriginalProperties:", v7, 0, 0, 1);
  if (v8)
  {
    v9 = objc_msgSend(v6, "migrateLegacyVideoAdjustments");
    if ((v9 & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v6, "setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:", 0);
    objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataForKey:", *MEMORY[0x1E0D73F50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringForKey:", *MEMORY[0x1E0D73F60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "setupVideoAsset: Setting up adjustment from extended attributes for asset: %@", (uint8_t *)&v22, 0xCu);

      }
      +[PLImageWriter setAdjustmentsForNewVideo:mainFileMetadata:withAdjustmentsDictionary:cameraAdjustments:renderedContentPath:renderedPosterFramePreviewPath:finalAssetSize:](PLImageWriter, "setAdjustmentsForNewVideo:mainFileMetadata:withAdjustmentsDictionary:cameraAdjustments:renderedContentPath:renderedPosterFramePreviewPath:finalAssetSize:", v6, 0, 0, v12, v13, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      goto LABEL_21;
    }
    if (v10)
    {
      objc_msgSend(v6, "pathForAdjustmentFile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "fileExistsAtPath:", v17) & 1) == 0)
      {
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if (v9)
        {
          if (v19)
          {
            objc_msgSend(v6, "pathForLegacySlalomRegionsArchive");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 138412546;
            v23 = v20;
            v24 = 2112;
            v25 = v17;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "setupVideoAsset: failed to migrate %@ to %@", (uint8_t *)&v22, 0x16u);

          }
        }
        else if (v19)
        {
          v22 = 138412290;
          v23 = v17;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "setupVideoAsset: failed to create default adjustments at %@", (uint8_t *)&v22, 0xCu);
        }

      }
    }
    else if (-[PLFileSystemAssetImporter _setupAdjustmentsFromAdjustmentFileForAsset:](self, "_setupAdjustmentsFromAdjustmentFileForAsset:", v6))
    {
      goto LABEL_21;
    }
    objc_msgSend(v6, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
LABEL_21:

  }
  return v8;
}

- (void)addAvailableThumbnailIndex:(unint64_t)a3
{
  NSMutableIndexSet *thumbIndexes;
  NSMutableIndexSet *v6;
  NSMutableIndexSet *v7;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    thumbIndexes = self->_thumbIndexes;
    if (!thumbIndexes)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v6 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
      v7 = self->_thumbIndexes;
      self->_thumbIndexes = v6;

      thumbIndexes = self->_thumbIndexes;
    }
    -[NSMutableIndexSet addIndex:](thumbIndexes, "addIndex:", a3);
  }
}

- (unint64_t)nextThumbnailIndex
{
  NSMutableIndexSet *thumbIndexes;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[5];
  NSObject *v14;

  thumbIndexes = self->_thumbIndexes;
  if (!thumbIndexes)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_thumbIndexes;
    self->_thumbIndexes = v4;

    thumbIndexes = self->_thumbIndexes;
  }
  if (-[NSMutableIndexSet count](thumbIndexes, "count"))
    goto LABEL_7;
  v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__PLFileSystemAssetImporter_nextThumbnailIndex__block_invoke;
  v13[3] = &unk_1E36669D8;
  v13[4] = self;
  v7 = v6;
  v14 = v7;
  v8 = (void *)MEMORY[0x19AEC174C](v13);
  +[PLThumbnailIndexes getAvailableThumbnailIndexesInLibrary:withCount:handler:](PLThumbnailIndexes, "getAvailableThumbnailIndexesInLibrary:withCount:handler:", self->_photoLibrary, -[PLFileSystemAssetImporter thumbnailBatchFetchSize](self, "thumbnailBatchFetchSize"), v8);
  while (dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL))
    ;

  if (-[NSMutableIndexSet count](self->_thumbIndexes, "count"))
  {
LABEL_7:
    v9 = -[NSMutableIndexSet firstIndex](self->_thumbIndexes, "firstIndex");
    -[NSMutableIndexSet removeIndex:](self->_thumbIndexes, "removeIndex:", v9);
  }
  else
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to get thumbnail index. This is bad.", v12, 2u);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (NSMutableSet)existingUUIDs
{
  return self->_existingUUIDs;
}

- (void)setExistingUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_existingUUIDs, a3);
}

- (NSMutableDictionary)existingUUIDsByUppercasePath
{
  return self->_existingUUIDsByUppercasePath;
}

- (void)setExistingUUIDsByUppercasePath:(id)a3
{
  objc_storeStrong((id *)&self->_existingUUIDsByUppercasePath, a3);
}

- (NSMutableDictionary)existingOIDsByUUID
{
  return self->_existingOIDsByUUID;
}

- (void)setExistingOIDsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_existingOIDsByUUID, a3);
}

- (unint64_t)thumbnailBatchFetchSize
{
  return self->_thumbnailBatchFetchSize;
}

- (void)setThumbnailBatchFetchSize:(unint64_t)a3
{
  self->_thumbnailBatchFetchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingOIDsByUUID, 0);
  objc_storeStrong((id *)&self->_existingUUIDsByUppercasePath, 0);
  objc_storeStrong((id *)&self->_existingUUIDs, 0);
  objc_storeStrong((id *)&self->_thumbIndexes, 0);
  objc_storeStrong((id *)&self->_photoLibraryStoreUUID, 0);
  objc_storeStrong((id *)&self->_libraryBundlePath, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

intptr_t __47__PLFileSystemAssetImporter_nextThumbnailIndex__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addIndexes:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x1E0D75140]);
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained[1], "libraryBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZoneLookup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithImageURL:contentType:timeZoneLookup:", v4, 0, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_49(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  _UNKNOWN **v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  char v59;
  CGImageSource *v60;
  CGImageSource *v61;
  CFDictionaryRef v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  char v73;
  void *v74;
  NSObject *v75;
  int v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  NSObject *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  void *v96;
  int v97;
  char v98;
  uint64_t v99;
  char v100;
  id v101;
  uint64_t v102;
  int v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t v108[128];
  uint8_t buf[4];
  NSObject *v110;
  __int16 v111;
  NSObject *v112;
  __int16 v113;
  uint64_t v114;
  uint64_t v115;

  v1 = a1;
  v115 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(v1 + 132))
    v3 = *(_QWORD *)(v1 + 48);
  else
    v3 = 0;
  objc_msgSend(v2, "_addAssetWithURL:existingOID:assetUUID:isPlaceholder:", *(_QWORD *)(v1 + 40), v3, *(_QWORD *)(v1 + 56), *(unsigned __int8 *)(v1 + 133));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(v1 + 120) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40);
  if (!v7)
    return;
  if (!objc_msgSend(v7, "isInserted"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "addedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40);
      objc_msgSend(v20, "dateCreated");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAddedDate:", v21);

    }
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", *(_QWORD *)(v1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D74010];
  objc_msgSend(v8, "UUIDStringForKey:", *MEMORY[0x1E0D74010]);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 64), "path");
      v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v110 = v10;
      v111 = 2114;
      v112 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: asset uuid: %{public}@ found in file attribute of master with URL: %{public}@", buf, 0x16u);

    }
    if ((objc_msgSend(*(id *)(v1 + 56), "isEqualToString:", v10) & 1) != 0)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0D73200], "persistUUIDString:forKey:fileURL:", *(_QWORD *)(v1 + 56), v9, *(_QWORD *)(v1 + 64));
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 64), "path");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(v1 + 56);
      *(_DWORD *)buf = 138543874;
      v110 = v14;
      v111 = 2114;
      v112 = v10;
      v113 = 2114;
      v114 = v15;
      v16 = "addAssetWithURLs: updated asset UUID attribute on path from filename asset uuid (%{public}@ [%{public}@] -> "
            "new UUID %{public}@)";
      v17 = v13;
      v18 = 32;
LABEL_17:
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:

    }
  }
  else
  {
    v22 = *(_QWORD *)(v1 + 56);
    if (!v22)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "libraryServicesManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "modelMigrator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "archivedAssetUUIDForURL:", *(_QWORD *)(v1 + 40));
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0D73200], "persistUUIDString:forKey:fileURL:", v13, v9, *(_QWORD *)(v1 + 64));
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        objc_msgSend(*(id *)(v1 + 64), "path");
        v26 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v110 = v13;
        v111 = 2114;
        v112 = v26;
        v27 = "addAssetWithURLs: forcing uuid: %{public}@ for master URL: %{public}@";
        v28 = v14;
        v29 = OS_LOG_TYPE_DEFAULT;
        v30 = 22;
      }
      else
      {
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        objc_msgSend(*(id *)(v1 + 64), "path");
        v26 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v26;
        v27 = "addAssetWithURLs: unable to find uuid for master URL: %{public}@";
        v28 = v14;
        v29 = OS_LOG_TYPE_ERROR;
        v30 = 12;
      }
      _os_log_impl(&dword_199541000, v28, v29, v27, buf, v30);

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0D73200], "persistUUIDString:forKey:fileURL:", v22, v9, *(_QWORD *)(v1 + 64));
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(NSObject **)(v1 + 56);
      objc_msgSend(*(id *)(v1 + 64), "path");
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v110 = v23;
      v111 = 2114;
      v112 = v14;
      v16 = "addAssetWithURLs: setting uuid (was nil): %{public}@ for master URL: %{public}@";
      v17 = v13;
      v18 = 22;
      goto LABEL_17;
    }
  }

LABEL_26:
LABEL_27:
  if (*(_QWORD *)(v1 + 72))
  {
    if (*(_QWORD *)(v1 + 56))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setUuid:");
    PLMigrationGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = *(NSObject **)(v1 + 56);
      v33 = *(NSObject **)(v1 + 80);
      *(_DWORD *)buf = 138543618;
      v110 = v32;
      v111 = 2114;
      v112 = v33;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: applying asset metadata from journal payload, uuid: %{public}@, payload: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v1 + 80), "applyPayloadToManagedObject:payloadAttributesToUpdate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "synchronizeWithPersistedFileSystemAttributes");
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v34 = *(id *)(v1 + 88);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
  if (!v35)
  {

    v73 = 0;
    v72 = 0;
    if (*(_BYTE *)(v1 + 133))
      goto LABEL_74;
    goto LABEL_85;
  }
  v36 = v35;
  v98 = 0;
  v95 = 0;
  v100 = 0;
  v37 = 0;
  v97 = 0;
  v38 = *(_QWORD *)v105;
  v94 = *MEMORY[0x1E0CBCB50];
  v39 = &off_1E3659000;
  v99 = v1;
  v101 = v34;
  v102 = *(_QWORD *)v105;
  do
  {
    v40 = 0;
    do
    {
      if (*(_QWORD *)v105 != v38)
        objc_enumerationMutation(v34);
      v41 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v40);
      v42 = v39[476];
      objc_msgSend(v41, "pathExtension");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v42) = objc_msgSend(v42, "isValidFileExtensionForImport:", v43);

      if ((_DWORD)v42 && (objc_msgSend(v41, "isEqual:", *(_QWORD *)(v1 + 64)) & 1) == 0)
      {
        objc_msgSend(v41, "lastPathComponent");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "pathForSpatialOverCaptureContentFile");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "isEqualToString:", v46) & 1) != 0)
        {
          v37 = 1;
          goto LABEL_43;
        }
        v103 = v37;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "pathForVideoComplementSpatialOverCaptureContentFile");
        v47 = v1;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lastPathComponent");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v44, "isEqualToString:", v49);

        if ((v50 & 1) != 0)
        {
          v37 = 1;
          v1 = v47;
          v34 = v101;
          v38 = v102;
          goto LABEL_53;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v47 + 120) + 8) + 40), "pathForDeferredProcessingPreviewFile");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "lastPathComponent");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v44, "isEqualToString:", v52);

        v1 = v47;
        v38 = v102;
        if ((v53 & 1) != 0)
        {
          v100 = 1;
          v34 = v101;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v47 + 120) + 8) + 40), "pathForVideoComplementFile");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "lastPathComponent");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v44, "isEqualToString:", v55);

          v34 = v101;
          if ((v56 & 1) != 0)
          {
            v98 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "pathForDeferredVideoComplementFile");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "lastPathComponent");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v44, "isEqualToString:", v58);

            if ((v59 & 1) == 0)
            {
              v60 = CGImageSourceCreateWithURL((CFURLRef)v41, 0);
              if (v60)
              {
                v61 = v60;
                v62 = CGImageSourceCopyProperties(v60, 0);
                -[__CFDictionary objectForKey:](v62, "objectForKey:", v94);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = v63;
                if (v63)
                {
                  DateCreatedFromExifDictionary(v63);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v45 = 0;
                }
                CFRelease(v61);

                v1 = v99;
              }
              else
              {
                v45 = 0;
              }
              v96 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40);
              objc_msgSend(*(id *)(v99 + 96), "objectValue");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend(v46, "orientation");
              objc_msgSend(*(id *)(*(_QWORD *)(v99 + 32) + 8), "pathManager");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v93) = v65;
              v1 = v99;
              objc_msgSend(v96, "addSidecarFileAtIndex:sidecarURL:withFilename:compressedSize:captureDate:modificationDate:uniformTypeIdentifier:imageOrientation:pathManager:", v97, v41, 0, 0, v45, 0, 0, v93, v66);

              ++v97;
              v37 = v103;
              v38 = v102;
LABEL_43:

LABEL_53:
              v39 = &off_1E3659000;
              goto LABEL_54;
            }
            v98 = 1;
            v95 = 1;
          }
        }
        v37 = v103;
        goto LABEL_53;
      }
LABEL_54:
      ++v40;
    }
    while (v36 != v40);
    v67 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
    v36 = v67;
  }
  while (v67);

  if ((v37 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setCameraProcessingAdjustmentState:", 1);
    objc_msgSend(*(id *)(v1 + 32), "_assetAdjustmentsIfExistsForAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 96), "objectValue");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "spatialOverCaptureIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "additionalAttributes");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setSpatialOverCaptureGroupIdentifier:", v70);

    if (v68)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setCameraProcessingAdjustmentStateFromAdjustmentRenderTypes:", objc_msgSend(v68, "adjustmentRenderTypes"));

  }
  v72 = v98;
  v73 = v95;
  if ((v100 & 1) != 0)
  {
    if (!*(_BYTE *)(v1 + 133))
      goto LABEL_76;
    goto LABEL_74;
  }
  if (*(_BYTE *)(v1 + 133))
  {
LABEL_74:
    if (*(_QWORD *)(v1 + 104))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setDeferredProcessingNeeded:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "additionalAttributes");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setDeferredPhotoIdentifier:", *(_QWORD *)(v1 + 104));

    }
LABEL_76:
    if (*(_BYTE *)(v1 + 134))
    {
      PLMigrationGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = *(_DWORD *)(v1 + 128);
        *(_DWORD *)buf = 67109120;
        LODWORD(v110) = v76;
        _os_log_impl(&dword_199541000, v75, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: asset is SemDev scene %d", buf, 8u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "additionalAttributes");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setDeferredProcessingCandidateOptions:", objc_msgSend(v77, "deferredProcessingCandidateOptions") | 8);

      if (*(_BYTE *)(v1 + 134) && !*(_QWORD *)(v1 + 104))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setDeferredProcessingNeeded:", 10);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "synchronizeWithPersistedFileSystemAttributes");
  }
  if ((v73 & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setVideoDeferredProcessingNeeded:", 1);
LABEL_85:
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "isPhoto"))
  {
    if ((objc_msgSend(*(id *)(v1 + 32), "_setupPhotoAsset:withURL:isPlaceholder:hasVideoComplementResource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), *(_QWORD *)(v1 + 64), *(unsigned __int8 *)(v1 + 133), v72 & 1) & 1) != 0)goto LABEL_95;
LABEL_102:
    PLMigrationGetLog();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v1 + 64), "path");
      v91 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v91;
      _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_ERROR, "Unable to add \"%{public}@\".", buf, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "deleteFromDatabaseOnly");
    v92 = *(_QWORD *)(*(_QWORD *)(v1 + 120) + 8);
    v88 = *(NSObject **)(v92 + 40);
    *(_QWORD *)(v92 + 40) = 0;
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "isVideo"))
    {
      if ((objc_msgSend(*(id *)(v1 + 32), "_setupVideoAsset:withURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), *(_QWORD *)(v1 + 64)) & 1) != 0)goto LABEL_95;
      goto LABEL_102;
    }
    objc_msgSend(*(id *)(v1 + 64), "pathExtension");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = +[PLManagedAsset isValidFileExtensionForImport:](PLManagedAsset, "isValidFileExtensionForImport:", v78);

    if (!v79)
      goto LABEL_102;
    PLMigrationGetLog();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v1 + 64), "path");
      v81 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v81;
      _os_log_impl(&dword_199541000, v80, OS_LOG_TYPE_ERROR, "Unknown asset, importing as an unknown type:\"%{public}@\", buf, 0xCu);

    }
    if ((objc_msgSend(*(id *)(v1 + 32), "_setupUnknownAsset:withURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), *(_QWORD *)(v1 + 64)) & 1) == 0)goto LABEL_102;
LABEL_95:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "setLocationFromPersistedAttributes:", *(_QWORD *)(v1 + 112));
    objc_msgSend(*(id *)(v1 + 32), "setModificationAndCreationDateOnAsset:withURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), *(_QWORD *)(v1 + 64));
    if (*(_BYTE *)(v1 + 135))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "libraryServicesManager");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "modelMigrator");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "fixPossiblyIncorrectAddedDateForAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40));

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "deferredProcessingNeeded")|| objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "videoDeferredProcessingNeeded"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "photoLibrary");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "libraryServicesManager");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "backgroundJobService");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), "photoLibrary");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "signalBackgroundProcessingNeededOnLibrary:", v87);

    }
    objc_msgSend(MEMORY[0x1E0D73200], "persistUInt16:forKey:fileURL:", 0, *MEMORY[0x1E0D73EF8], *(_QWORD *)(v1 + 64));
    PLMigrationGetLog();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 64), "path");
      v89 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v89;
      _os_log_impl(&dword_199541000, v88, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: DONE - remove progress flag: %{public}@", buf, 0xCu);

    }
  }

}

void __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_51(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC1554]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

id __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_53(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
