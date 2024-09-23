@implementation PLPublishCloudSharedAssetsJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLPublishCloudSharedAssetsJob;
  -[PLDaemonJob encodeToXPCObject:](&v13, sel_encodeToXPCObject_, v4);
  -[PLPublishCloudSharedAssetsJob publishAlbumCloudGUID](self, "publishAlbumCloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLPublishCloudSharedAssetsJob originalAssetUUIDs](self, "originalAssetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  -[PLPublishCloudSharedAssetsJob stillImageOnlyAssetUUIDs](self, "stillImageOnlyAssetUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyIsNewAlbum, -[PLPublishCloudSharedAssetsJob isNewAlbum](self, "isNewAlbum"));
  -[PLPublishCloudSharedAssetsJob batchCommentText](self, "batchCommentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLPublishCloudSharedAssetsJob customExportsInfo](self, "customExportsInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLPublishCloudSharedAssetsJob customExportsInfo](self, "customExportsInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetDictionary();

  }
  -[PLPublishCloudSharedAssetsJob trimmedVideoPathInfo](self, "trimmedVideoPathInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLPublishCloudSharedAssetsJob trimmedVideoPathInfo](self, "trimmedVideoPathInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetDictionary();

  }
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPublishCloudSharedAssetsJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v15, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLStringFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPublishAlbumCloudGUID:", v8);

    PLArrayFromXPCDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOriginalAssetUUIDs:", v9);

    PLArrayFromXPCDictionary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStillImageOnlyAssetUUIDs:", v10);

    objc_msgSend(v7, "setIsNewAlbum:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyIsNewAlbum));
    PLStringFromXPCDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBatchCommentText:", v11);

    PLDictionaryFromXPCDictionary();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomExportsInfo:", v12);

    PLDictionaryFromXPCDictionary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTrimmedVideoPathInfo:", v13);

  }
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLPublishCloudSharedAssetsJob publishAlbumCloudGUID](self, "publishAlbumCloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPublishCloudSharedAssetsJob originalAssetUUIDs](self, "originalAssetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLPublishCloudSharedAssetsJob isNewAlbum](self, "isNewAlbum"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[PLPublishCloudSharedAssetsJob batchCommentText](self, "batchCommentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (albumGUID=%@ originalAssetUUIDs=%@ isNewAlbum=%@ batchComment=%@)"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)daemonOperation
{
  return 6;
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 0;
}

- (void)runDaemonSide
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  PLPublishCloudSharedAssetsJob *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = (id)objc_opt_class();
    v12 = 2112;
    v13 = self;
    v4 = v11;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLPublishCloudSharedAssetsJob runDaemonSide]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "highPriorityOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PLPublishCloudSharedAssetsJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

- (void)executeDaemonOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PLPublishCloudSharedAssetsJob originalAssetUUIDs](self, "originalAssetUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__64724;
  v25[4] = __Block_byref_object_dispose__64725;
  v26 = 0;
  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__64724;
  v23[4] = __Block_byref_object_dispose__64725;
  v24 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke;
  v17[3] = &unk_1E3676268;
  v21 = v25;
  v17[4] = self;
  v10 = v6;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  v20 = v5;
  v22 = v23;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_61;
  v13[3] = &unk_1E3677830;
  v12 = v20;
  v14 = v12;
  v15 = v25;
  v16 = v23;
  objc_msgSend(v10, "performTransactionAndWait:completionHandler:", v17, v13);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

}

- (BOOL)retrieveURLsFromAssetWithUUID:(id)a3 withExportedFileURL:(id)a4 primaryURL:(id *)a5 videoComplementURL:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLPhotoSharingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v10;
    v40 = 2114;
    v41 = v9;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Determining URLs to share for exported file URL: %@, asset UUID: \"%{public}@\", buf, 0x16u);
  }

  objc_msgSend(v10, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D75488]))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v10);
    objc_msgSend(v13, "imagePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoPath");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14)
      v17 = v15 == 0;
    else
      v17 = 1;
    v18 = !v17;
    if (v17)
    {
      v31 = (void *)v15;
      v32 = v14;
      v33 = v9;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, 0, 5, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "pathExtension");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v24);
      }

      PLPhotoSharingGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v9 = v33;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v39 = v10;
        v40 = 2114;
        v41 = v29;
        v42 = 2114;
        v43 = v33;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to determine URLs to share for exported file URL: %@, with path extensions: (%{public}@), asset UUID: \"%{public}@\", buf, 0x20u);

      }
      v16 = v31;
      v14 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    *a5 = objc_retainAutorelease(v10);
    v18 = 1;
  }

  return v18;
}

- (NSString)publishAlbumCloudGUID
{
  return self->_publishAlbumCloudGUID;
}

- (void)setPublishAlbumCloudGUID:(id)a3
{
  objc_storeStrong((id *)&self->_publishAlbumCloudGUID, a3);
}

- (NSArray)originalAssetUUIDs
{
  return self->_originalAssetUUIDs;
}

- (void)setOriginalAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_originalAssetUUIDs, a3);
}

- (NSArray)stillImageOnlyAssetUUIDs
{
  return self->_stillImageOnlyAssetUUIDs;
}

- (void)setStillImageOnlyAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_stillImageOnlyAssetUUIDs, a3);
}

- (NSDictionary)customExportsInfo
{
  return self->_customExportsInfo;
}

- (void)setCustomExportsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_customExportsInfo, a3);
}

- (NSDictionary)trimmedVideoPathInfo
{
  return self->_trimmedVideoPathInfo;
}

- (void)setTrimmedVideoPathInfo:(id)a3
{
  objc_storeStrong((id *)&self->_trimmedVideoPathInfo, a3);
}

- (BOOL)isNewAlbum
{
  return self->_isNewAlbum;
}

- (void)setIsNewAlbum:(BOOL)a3
{
  self->_isNewAlbum = a3;
}

- (NSString)batchCommentText
{
  return self->_batchCommentText;
}

- (void)setBatchCommentText:(id)a3
{
  objc_storeStrong((id *)&self->_batchCommentText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchCommentText, 0);
  objc_storeStrong((id *)&self->_trimmedVideoPathInfo, 0);
  objc_storeStrong((id *)&self->_customExportsInfo, 0);
  objc_storeStrong((id *)&self->_stillImageOnlyAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_originalAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_publishAlbumCloudGUID, 0);
}

void __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  id v44;
  int v45;
  NSObject *v46;
  id v47;
  dispatch_semaphore_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  BOOL v52;
  NSObject *v53;
  uint64_t v54;
  char v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  char v60;
  _BOOL4 v61;
  NSObject *v62;
  uint64_t v63;
  char v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  char v76;
  NSObject *v77;
  void *v78;
  void *v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  const char *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  int v111;
  uint64_t v112;
  NSObject *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  NSObject *obj;
  unsigned int v126;
  _BOOL4 v127;
  uint64_t v128;
  uint64_t v129;
  void *context;
  void *v131;
  void *v132;
  void *v133;
  os_log_t oslog;
  NSObject *osloga;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  NSObject *v142;
  char v143[24];
  char v144[24];
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  __int128 v151;
  uint64_t v152;
  __int128 v153;
  uint64_t v154;
  _QWORD v155[4];
  NSObject *v156;
  id v157;
  NSObject *v158;
  _BYTE *v159;
  id v160;
  id v161;
  id v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE buf[24];
  id v172;
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    objc_msgSend(*(id *)(a1 + 32), "publishAlbumCloudGUID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v1, *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isNewAlbum"))
        +[PLPhotoSharingHelper publishCloudSharedAlbumToServer:](PLPhotoSharingHelper, "publishCloudSharedAlbumToServer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "originalAssetUUIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", v5, 1, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "count");
      objc_msgSend(*(id *)(a1 + 32), "originalAssetUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v7 != v9)
      {
        PLPhotoSharingGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = objc_msgSend(v6, "count");
          objc_msgSend(*(id *)(a1 + 32), "originalAssetUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = objc_msgSend(v12, "count");
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "ERROR: Only found %lu originalAssets, expected %lu", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      obj = v6;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v167, v174, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v168;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v168 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
            objc_msgSend(v16, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "setObject:forKey:", v16, v17);

          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v167, v174, 16);
        }
        while (v13);
      }

      objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "mutableAssets");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "batchCommentText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v18, "length");

      v19 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(*(id *)(a1 + 32), "stillImageOnlyAssetUUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "originalAssetUUIDs");
      v165 = 0u;
      v166 = 0u;
      v163 = 0u;
      v164 = 0u;
      v124 = (id)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v163, v173, 16);
      if (v129)
      {
        v128 = *(_QWORD *)v164;
        v118 = (void *)*MEMORY[0x1E0C89EA8];
        v117 = *MEMORY[0x1E0C8A2E0];
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v164 != v128)
            {
              v22 = v21;
              objc_enumerationMutation(v124);
              v21 = v22;
            }
            v137 = v21;
            v23 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * v21);
            objc_msgSend(v138, "objectForKey:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              context = (void *)MEMORY[0x19AEC1554]();
              v25 = objc_msgSend(v24, "isVideo");
              v126 = objc_msgSend(v24, "playbackVariation");
              objc_msgSend(*(id *)(a1 + 32), "customExportsInfo");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "uuid");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", v27);
              v131 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(a1 + 32), "trimmedVideoPathInfo");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "uuid");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKey:", v29);
              v140 = (void *)objc_claimAutoreleasedReturnValue();

              if (v140)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
                v142 = objc_claimAutoreleasedReturnValue();
                PLPhotoSharingGetLog();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v142;
                  _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Original video is trimmed, use the trimmed file %@", buf, 0xCu);
                }
                v139 = 0;
                oslog = 0;
                v127 = 0;
LABEL_26:
                v31 = 1;
LABEL_27:

                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "UUIDString");
                v136 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSObject pathExtension](v142, "pathExtension");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "publishAlbumCloudGUID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "pathManager");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:](PLCloudSharedAssetSaveJob, "nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:", v123, v33, v34, v132, v136);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v139)
                {
                  objc_msgSend(v35, "URLByDeletingLastPathComponent");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "lastPathComponent");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "stringByDeletingPathExtension");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v139, "pathExtension");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "uppercaseString");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "stringByAppendingPathExtension:", v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v36, "URLByAppendingPathComponent:", v41);
                  v133 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v133 = 0;
                }
                if (v140)
                  v45 = 1;
                else
                  v45 = v25 ^ 1;
                if (((v31 | v45) & 1) == 0
                  && objc_msgSend(v24, "isDefaultAdjustedSlomo")
                  && objc_msgSend(v24, "isPlayableVideo:", 0))
                {
                  PLPhotoSharingGetLog();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v35;
                    _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEFAULT, "Original is a slow-mo, flatten the video to %@", buf, 0xCu);
                  }

                  v47 = v118;
                  v48 = dispatch_semaphore_create(0);
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x2020000000;
                  LOBYTE(v172) = 0;
                  +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v24, 1);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v155[0] = MEMORY[0x1E0C809B0];
                  v155[1] = 3221225472;
                  v155[2] = __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_53;
                  v155[3] = &unk_1E366F758;
                  v156 = v142;
                  v50 = v35;
                  v157 = v50;
                  v159 = buf;
                  v51 = v48;
                  v158 = v51;
                  v153 = *MEMORY[0x1E0CA2E68];
                  v154 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
                  v151 = v153;
                  v152 = v154;
                  +[PLVideoTranscoder transcodeVideoWithObjectBuilder:outputURL:startTime:endTime:presetName:outputFileType:metadata:completionHandler:](PLVideoTranscoder, "transcodeVideoWithObjectBuilder:outputURL:startTime:endTime:presetName:outputFileType:metadata:completionHandler:", v49, v50, &v153, &v151, v47, v117, 0, v155);
                  dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);
                  v52 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;

                  _Block_object_dispose(buf, 8);
                  if (!v52)
                    goto LABEL_103;
LABEL_52:
                  v61 = v127;
                  if (!v133)
                    v61 = 0;
                  if (v61)
                  {
                    PLPhotoSharingGetLog();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v139;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v133;
                      _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_DEFAULT, "Moving video complement from %@ to %@, for an in-place video complement creation later", buf, 0x16u);
                    }

                    v63 = *(_QWORD *)(a1 + 48);
                    v148 = 0;
                    v64 = objc_msgSend(MEMORY[0x1E0D73208], "secureMoveItemAtURL:toURL:capabilities:error:", v139, v133, v63, &v148);
                    v65 = v148;
                    if ((v64 & 1) != 0)
                    {
                      v66 = v133;

                      v139 = v66;
                      v67 = 2;
                      goto LABEL_60;
                    }
                    PLPhotoSharingGetLog();
                    v87 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v139, "path");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v133, "path");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v88;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v89;
                      *(_WORD *)&buf[22] = 2112;
                      v172 = v65;
                      _os_log_impl(&dword_199541000, v87, OS_LOG_TYPE_ERROR, "Unable to move \"%@\" to \"%@\": %@", buf, 0x20u);

                    }
LABEL_103:

                    v86 = oslog;
LABEL_104:

                    objc_autoreleasePoolPop(context);
                    goto LABEL_105;
                  }
                  v67 = 0;
LABEL_60:
                  if (oslog)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v147 = 0;
                    objc_msgSend(v68, "removeItemAtURL:error:", oslog, &v147);
                    v69 = v147;

                    if (v69)
                    {
                      PLPhotoSharingGetLog();
                      v70 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)&buf[4] = oslog;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v69;
                        _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_DEFAULT, "Unable to opportunistically clean up temporary directory: \"%@\" Error: %@", buf, 0x16u);
                      }

                    }
                  }
                  *(_QWORD *)&v153 = 0;
                  v71 = *(_QWORD *)(a1 + 40);
                  v72 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudSharedAsset");
                  v146 = 0;
                  +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:", v71, v35, v72, 2, v136, 0, &v153, &v146);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = v146;
                  +[PLPhotoSharingHelper photoSharingOriginalFilenameForAsset:](PLPhotoSharingHelper, "photoSharingOriginalFilenameForAsset:", v24);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "setOriginalFilename:", v75);

                  if (!v73)
                  {
                    PLPhotoSharingGetLog();
                    osloga = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(osloga, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v35;
                      _os_log_impl(&dword_199541000, osloga, OS_LOG_TYPE_ERROR, "ERROR: couldn't insert new asset for file at %@", buf, 0xCu);
                    }
                    goto LABEL_102;
                  }
                  if (objc_msgSend(v73, "isVideo"))
                  {
                    v145 = 0;
                    v76 = objc_msgSend(v73, "isPlayableVideo:", &v145);
                    osloga = v145;
                    if ((v76 & 1) == 0)
                    {
                      PLPhotoSharingGetLog();
                      v77 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)&buf[4] = v35;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = osloga;
                        _os_log_impl(&dword_199541000, v77, OS_LOG_TYPE_ERROR, "ERROR: can't play new asset for file at %@, with codec: %@", buf, 0x16u);
                      }

LABEL_102:
                      oslog = 0;
                      goto LABEL_103;
                    }
                  }
                  else
                  {
                    osloga = 0;
                  }
                  objc_msgSend(v73, "setVisibilityState:", 2);
                  PLPhotoSharingGetLog();
                  v90 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v23;
                    _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_DEFAULT, "Generating new thumbnails for asset with UUID %@", buf, 0xCu);
                  }

                  objc_msgSend(v73, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, (_QWORD)v153, v74, 1);
                  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "additionalAttributes");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "originalFilename");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "additionalAttributes");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "setOriginalFilename:", v93);

                  objc_msgSend(v73, "setCloudAssetGUID:", v91);
                  objc_msgSend(v73, "setCloudBatchID:", v121);
                  objc_msgSend(v73, "setCloudBatchPublishDate:", v122);
                  objc_msgSend(v73, "setCloudPlaceholderKind:", 5);
                  objc_msgSend(v73, "setCloudIsMyAsset:", 1);
                  objc_msgSend(v73, "setCloudIsDeletable:", 1);
                  objc_msgSend(v73, "setPlaybackVariationAndLoopingPlaybackStyleWithPlaybackVariation:", v126);
                  if ((v45 & 1) == 0)
                  {
                    objc_msgSend(v24, "uuid");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "setOriginalAssetsUUID:", v95);

                    PLPhotoSharingGetLog();
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v73, "originalAssetsUUID");
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v97;
                      _os_log_impl(&dword_199541000, v96, OS_LOG_TYPE_DEFAULT, "Saved original video uuid %@ for later playback", buf, 0xCu);

                    }
                  }
                  if (v139)
                  {
                    objc_msgSend(v24, "mediaGroupUUID");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "photoIrisVideoDuration");
                    objc_msgSend(v24, "photoIrisStillDisplayTime");
                    objc_msgSend(v73, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v98, 0, v139, v144, v143, v67);

                  }
                  objc_msgSend(v120, "addObject:", v73);
                  PLPhotoSharingGetLog();
                  v99 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v35, "path");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)&buf[4] = v142;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v100;
                    *(_WORD *)&buf[22] = 2112;
                    v172 = v91;
                    _os_log_impl(&dword_199541000, v99, OS_LOG_TYPE_DEFAULT, "Created copy of original asset at %@ to %@ and assigned it new cloudAssetGUID %@", buf, 0x20u);

                  }
                  objc_msgSend(*(id *)(a1 + 56), "addObject:", v73);
                  if (v119 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
                  {
                    objc_msgSend(*(id *)(a1 + 32), "batchCommentText");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PLCloudSharedComment insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:](PLCloudSharedComment, "insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:", v73, 0, v101, 0, 1, *(_QWORD *)(a1 + 40));
                    v102 = objc_claimAutoreleasedReturnValue();
                    v103 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
                    v104 = *(void **)(v103 + 40);
                    *(_QWORD *)(v103 + 40) = v102;

                    v105 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v105, "setIsCaption:", v106);

                    v107 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v107, "setIsBatchComment:", v108);

                  }
                  +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v73, 1, 0, 0);

                  goto LABEL_102;
                }
                if (v31)
                {
                  PLPhotoSharingGetLog();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v142;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v35;
                    _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEFAULT, "Moving result from %@ to %@", buf, 0x16u);
                  }

                  v54 = *(_QWORD *)(a1 + 48);
                  v150 = 0;
                  v55 = objc_msgSend(MEMORY[0x1E0D73208], "secureMoveItemAtURL:toURL:capabilities:error:", v142, v35, v54, &v150);
                  v56 = v150;
                  if ((v55 & 1) == 0)
                  {
                    PLPhotoSharingGetLog();
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    {
                      -[NSObject path](v142, "path");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "path");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v58;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v59;
                      *(_WORD *)&buf[22] = 2112;
                      v172 = v56;
                      _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Unable to move \"%@\" to \"%@\": %@", buf, 0x20u);

                    }
LABEL_49:

                    goto LABEL_103;
                  }
                }
                else
                {
                  v149 = 0;
                  v60 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v142, v35, &v149);
                  v56 = v149;
                  if ((v60 & 1) == 0)
                  {
                    PLPhotoSharingGetLog();
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    {
                      -[NSObject path](v142, "path");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "path");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v78;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v79;
                      *(_WORD *)&buf[22] = 2112;
                      v172 = v56;
                      _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Unable to copy \"%@\" to \"%@\": %@", buf, 0x20u);

                    }
                    goto LABEL_49;
                  }
                }

                goto LABEL_52;
              }
              if (v131)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
                v30 = objc_claimAutoreleasedReturnValue();
                v42 = *(void **)(a1 + 32);
                v162 = 0;
                v161 = 0;
                v43 = objc_msgSend(v42, "retrieveURLsFromAssetWithUUID:withExportedFileURL:primaryURL:videoComplementURL:", v23, v30, &v162, &v161);
                v142 = v162;
                v44 = v161;
                if (v43)
                {
                  v139 = v44;
                  v127 = v44 != 0;
                  -[NSObject URLByDeletingLastPathComponent](v30, "URLByDeletingLastPathComponent");
                  oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
                  goto LABEL_26;
                }
                v85 = v44;

                v86 = v142;
                goto LABEL_104;
              }
              v80 = objc_msgSend(v24, "isLoopingVideo");
              if (v80)
              {
                PLPhotoSharingGetLog();
                v81 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v126;
                  _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_DEFAULT, "Sharing looping video with playback variation %ld", buf, 0xCu);
                }

                if (v25)
                {
                  objc_msgSend(v24, "pathForVideoFile");
                  v30 = objc_claimAutoreleasedReturnValue();
                  PLPhotoSharingGetLog();
                  v82 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v30;
                    v83 = v82;
                    v84 = "Original is a looping video, use the original file %@";
                    goto LABEL_117;
                  }
LABEL_118:

                  if (v30)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v30, 0);
                    v142 = objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v24, "canPlayPhotoIris")
                      && (objc_msgSend(v24, "uuid"),
                          v110 = (void *)objc_claimAutoreleasedReturnValue(),
                          v111 = objc_msgSend(v116, "containsObject:", v110),
                          v110,
                          ((v80 | v111) & 1) == 0))
                    {
                      objc_msgSend((id)objc_opt_class(), "videoComplementURLForSharingFromAsset:", v24);
                      v139 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v139 = 0;
                    }
                    oslog = 0;
                    v127 = 0;
                    v31 = 0;
                    goto LABEL_27;
                  }
                  PLPhotoSharingGetLog();
                  v86 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v23;
                    _os_log_impl(&dword_199541000, v86, OS_LOG_TYPE_ERROR, "No local file path on disk to support sharing asset %@", buf, 0xCu);
                  }
                  goto LABEL_104;
                }
                objc_msgSend(v24, "pathForFullsizeRenderVideoFile");
                v30 = objc_claimAutoreleasedReturnValue();
                PLPhotoSharingGetLog();
                v82 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_118;
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v30;
                v83 = v82;
                v84 = "Original is a regular photo, use the full size render video file %@";
              }
              else if ((v25 & 1) != 0)
              {
                if ((objc_msgSend(v24, "isPlayableVideo:", 0) & 1) != 0)
                  objc_msgSend(v24, "pathForVideoFile");
                else
                  objc_msgSend(v24, "pathForMediumVideoFile");
                v30 = objc_claimAutoreleasedReturnValue();
                PLPhotoSharingGetLog();
                v82 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_118;
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v30;
                v83 = v82;
                v84 = "Original is a video, use the video file %@";
              }
              else
              {
                v160 = 0;
                v109 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:](PLResourceChooser, "fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:", v24, 0, 0, 1, &v160, 0);
                v30 = v160;
                PLPhotoSharingGetLog();
                v82 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_118;
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v30;
                v83 = v82;
                v84 = "Original is not a video, use the large displayable image file %@";
              }
LABEL_117:
              _os_log_impl(&dword_199541000, v83, OS_LOG_TYPE_DEFAULT, v84, buf, 0xCu);
              goto LABEL_118;
            }
LABEL_105:

            v21 = v137 + 1;
          }
          while (v129 != v137 + 1);
          v112 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v163, v173, 16);
          v129 = v112;
        }
        while (v112);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "updateCloudLastInterestingChangeDateWithDate:", v122);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "updateCloudLastContributionDateWithDate:", v122);

      v113 = obj;
    }
    else
    {
      PLPhotoSharingGetLog();
      v114 = objc_claimAutoreleasedReturnValue();
      v113 = v114;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "publishAlbumCloudGUID");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v115;
        _os_log_impl(&dword_199541000, v114, OS_LOG_TYPE_ERROR, "ERROR: couldn't find album with cloud GUID %@ to publish assets from", buf, 0xCu);

        v113 = v114;
      }
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v113, OS_LOG_TYPE_ERROR, "ERROR: sharingPersonID is nil, ending job", buf, 2u);
    }
  }

}

uint64_t __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_61(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    result = +[PLPhotoSharingHelper enqueueCloudSharedAssetsForPublishToServer:inSharedAlbum:](PLPhotoSharingHelper, "enqueueCloudSharedAssetsForPublishToServer:inSharedAlbum:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      return +[PLPhotoSharingHelper publishCloudSharedCommentToServer:](PLPhotoSharingHelper, "publishCloudSharedCommentToServer:");
  }
  return result;
}

void __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "could not generate trimmed video for %@ to %@ error %@", (uint8_t *)&v11, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "generated trimmed video of %@ to %@ ", (uint8_t *)&v11, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __46__PLPublishCloudSharedAssetsJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  objc_super v3;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperation");
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)PLPublishCloudSharedAssetsJob;
  objc_msgSendSuper2(&v3, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (void)publishBatchOfOriginalAssetUUIDs:(id)a3 toSharedAlbum:(id)a4 withAssetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 isNewAlbum:(BOOL)a8 batchCommentText:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  if (a4)
  {
    v9 = a8;
    v15 = a9;
    v16 = a7;
    v17 = a6;
    v18 = a5;
    v19 = a4;
    v20 = a3;
    v24 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v24, "setOriginalAssetUUIDs:", v20);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __170__PLPublishCloudSharedAssetsJob_publishBatchOfOriginalAssetUUIDs_toSharedAlbum_withAssetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_isNewAlbum_batchCommentText___block_invoke;
    v25[3] = &unk_1E366F438;
    v26 = v21;
    v22 = v21;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v25);

    objc_msgSend(v24, "setStillImageOnlyAssetUUIDs:", v22);
    objc_msgSend(v19, "cloudGUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setPublishAlbumCloudGUID:", v23);
    objc_msgSend(v24, "setIsNewAlbum:", v9);
    objc_msgSend(v24, "setBatchCommentText:", v15);

    objc_msgSend(v24, "setCustomExportsInfo:", v17);
    objc_msgSend(v24, "setTrimmedVideoPathInfo:", v16);

    objc_msgSend(v24, "run");
  }
}

+ (id)videoComplementURLForSharingFromAsset:(id)a3
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "uuid");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Determining video complement path to use. UUID: \"%@\", buf, 0xCu);

  }
  v18 = 0;
  v6 = objc_msgSend(v3, "isPlayableVideo:", &v18);
  v7 = (__CFString *)v18;
  if (v6)
  {
    v8 = objc_msgSend(v3, "hasAdjustedVideoComplement");
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v10 = CFSTR("adjusted");
      else
        v10 = CFSTR("original");
      objc_msgSend(v3, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Using the %@ original video component. UUID: \"%@\", buf, 0x16u);

    }
    if ((v8 & 1) != 0)
      objc_msgSend(v3, "pathForFullsizeRenderVideoFile");
    else
      objc_msgSend(v3, "pathForVideoComplementFile");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Falling back to medium, since the original video component is unsupported. Codec: \"%@\", UUID: \"%@\", buf, 0x16u);

    }
    objc_msgSend(v3, "pathForMediumVideoFile");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __170__PLPublishCloudSharedAssetsJob_publishBatchOfOriginalAssetUUIDs_toSharedAlbum_withAssetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_isNewAlbum_batchCommentText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("useStillImageOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

@end
