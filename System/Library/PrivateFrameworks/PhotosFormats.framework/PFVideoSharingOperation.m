@implementation PFVideoSharingOperation

- (PFVideoSharingOperation)initWithVideoURL:(id)a3 adjustmentData:(id)a4
{
  id v6;
  id v7;
  PFVideoSharingOperation *v8;
  PFVideoSharingOperation *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *externalIsolation;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFVideoSharingOperation;
  v8 = -[PFVideoSharingOperation init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PFVideoSharingOperation _setVideoURL:](v8, "_setVideoURL:", v6);
    -[PFVideoSharingOperation _setAdjustments:](v9, "_setAdjustments:", v7);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.PFVideoSharingOperation.isolationQueue", v10);
    externalIsolation = v9->_externalIsolation;
    v9->_externalIsolation = (OS_dispatch_queue *)v11;

  }
  return v9;
}

- (void)main
{
  _BOOL8 v3;

  if (-[PFVideoSharingOperation _ensureVideoProperties](self, "_ensureVideoProperties"))
  {
    -[PFVideoSharingOperation _validateMetadata](self, "_validateMetadata");
    v3 = -[PFVideoSharingOperation _runExport](self, "_runExport");
  }
  else
  {
    v3 = 0;
  }
  -[PFVideoSharingOperation _setSuccess:](self, "_setSuccess:", v3);
}

- (BOOL)_ensureVideoProperties
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  dispatch_semaphore_t v8;
  AVAsset *videoAsset;
  NSObject *v10;
  dispatch_time_t v11;
  BOOL v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  PFVideoSharingOperation *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  -[PFVideoSharingOperation videoURL](self, "videoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C8B3C0];
    -[PFVideoSharingOperation videoURL](self, "videoURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetWithURL:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)&self->_videoAsset, v6);
  if (v4)
  {

  }
  v7 = dispatch_semaphore_create(0);
  v8 = v7;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11321;
  v25 = __Block_byref_object_dispose__11322;
  v26 = 0;
  videoAsset = self->_videoAsset;
  if (!videoAsset)
    goto LABEL_9;
  v30 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__PFVideoSharingOperation__ensureVideoProperties__block_invoke;
  v15[3] = &unk_1E45A4A00;
  v16 = &unk_1E45CB348;
  v17 = self;
  v19 = &v27;
  v20 = &v21;
  v10 = v7;
  v18 = v10;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](videoAsset, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E45CB348, v15);
  v11 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v10, v11);

  if (*((_BYTE *)v28 + 24))
  {
    v12 = 1;
  }
  else
  {
LABEL_9:
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:underlyingError:withDescription:", 2, v22[5], CFSTR("Unable to ensure video properties."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFVideoSharingOperation _setOperationError:](self, "_setOperationError:", v13);

    v12 = *((_BYTE *)v28 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12;
}

- (void)_validateMetadata
{
  NSObject *externalIsolation;
  NSArray *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSString *customAccessibilityLabel;
  uint64_t v17;
  NSString *customCaption;
  NSString *v19;
  uint64_t v20;
  NSDate *customDate;
  uint64_t v22;
  NSDate *v23;
  uint64_t v24;
  NSArray *videoMetadata;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[10];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  NSDate *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__11321;
  v35 = __Block_byref_object_dispose__11322;
  v36 = 0;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PFVideoSharingOperation__validateMetadata__block_invoke;
  block[3] = &unk_1E45A4A28;
  block[4] = self;
  block[5] = &v49;
  block[6] = &v45;
  block[7] = &v41;
  block[8] = &v37;
  block[9] = &v31;
  dispatch_sync(externalIsolation, block);
  if (*((_BYTE *)v50 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping all metadata", buf, 2u);
    }
    v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[AVAsset metadata](self->_videoAsset, "metadata");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (*((_BYTE *)v46 + 24) || *((_BYTE *)v42 + 24) || *((_BYTE *)v38 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v46 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping location from metadata", buf, 2u);
        }
        objc_msgSend(v7, "addObject:", *MEMORY[0x1E0C8A8A0]);
      }
      if (*((_BYTE *)v42 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping caption from metadata", buf, 2u);
        }
        objc_msgSend(v7, "addObject:", *MEMORY[0x1E0C8A898]);
      }
      if (*((_BYTE *)v38 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Stripping accessibility description from metadata", buf, 2u);
        }
        objc_msgSend(v7, "addObject:", *MEMORY[0x1E0C8A878]);
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v55, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v12, "commonKey", (_QWORD)v26);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "member:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14 == 0;

            if (v15)
              -[NSArray addObject:](v4, "addObject:", v12);

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v55, 16);
        }
        while (v9);
      }

    }
    else
    {
      v4 = (NSArray *)v5;
    }
  }
  if (!*((_BYTE *)v38 + 24))
  {
    customAccessibilityLabel = self->_customAccessibilityLabel;
    if (customAccessibilityLabel)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v54 = (NSDate *)customAccessibilityLabel;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom accessibility label to metadata: %{private}@", buf, 0xCu);
        customAccessibilityLabel = self->_customAccessibilityLabel;
      }
      +[PFSharingUtilities addAccessibilityDescription:toAVMetadata:](PFSharingUtilities, "addAccessibilityDescription:toAVMetadata:", customAccessibilityLabel, v4, (_QWORD)v26);
      v17 = objc_claimAutoreleasedReturnValue();

      v4 = (NSArray *)v17;
    }
  }
  if (!*((_BYTE *)v42 + 24))
  {
    customCaption = self->_customCaption;
    if (customCaption)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v19 = self->_customAccessibilityLabel;
        *(_DWORD *)buf = 138477827;
        v54 = (NSDate *)v19;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom caption label to metadata: %{private}@", buf, 0xCu);
        customCaption = self->_customCaption;
      }
      +[PFSharingUtilities addDescription:toAVMetadata:](PFSharingUtilities, "addDescription:toAVMetadata:", customCaption, v4, (_QWORD)v26);
      v20 = objc_claimAutoreleasedReturnValue();

      v4 = (NSArray *)v20;
    }
  }
  customDate = self->_customDate;
  if (customDate)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v54 = customDate;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom date to metadata: %{private}@", buf, 0xCu);
      customDate = self->_customDate;
    }
    +[PFSharingUtilities addCustomDate:toAVMetadata:](PFSharingUtilities, "addCustomDate:toAVMetadata:", customDate, v4, (_QWORD)v26);
    v22 = objc_claimAutoreleasedReturnValue();

    v4 = (NSArray *)v22;
  }
  if (!*((_BYTE *)v46 + 24))
  {
    v23 = (NSDate *)v32[5];
    if (v23)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v54 = v23;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Applying custom location to metadata: %{private}@", buf, 0xCu);
        v23 = (NSDate *)v32[5];
      }
      +[PFSharingUtilities addCustomLocation:toAVMetadata:](PFSharingUtilities, "addCustomLocation:toAVMetadata:", v23, v4, (_QWORD)v26);
      v24 = objc_claimAutoreleasedReturnValue();

      v4 = (NSArray *)v24;
    }
  }
  videoMetadata = self->_videoMetadata;
  self->_videoMetadata = v4;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

- (BOOL)_runExport
{
  NSObject *externalIsolation;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PFVideoAVObjectBuilder *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  const __CFString *v21;
  dispatch_semaphore_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  BOOL v36;
  NSObject *v37;
  uint64_t v38;
  dispatch_semaphore_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  AVAsset *videoAsset;
  void *v47;
  PFVideoAVObjectBuilder *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  char v56;
  _QWORD v57[4];
  NSObject *v58;
  _QWORD v59[6];
  _QWORD v60[4];
  NSObject *v61;
  __int128 *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[6];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD block[9];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint8_t buf[4];
  id v109;
  __int16 v110;
  id v111;
  __int16 v112;
  const __CFString *v113;
  __int128 v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  -[PFVideoSharingOperation videoURL](self, "videoURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__11321;
  v106 = __Block_byref_object_dispose__11322;
  v107 = 0;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__11321;
  v100 = __Block_byref_object_dispose__11322;
  v101 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__11321;
  v94 = __Block_byref_object_dispose__11322;
  v95 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__11321;
  v88 = __Block_byref_object_dispose__11322;
  externalIsolation = self->_externalIsolation;
  v89 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PFVideoSharingOperation__runExport__block_invoke;
  block[3] = &unk_1E45A4A50;
  block[4] = self;
  block[5] = &v102;
  block[6] = &v96;
  block[7] = &v90;
  block[8] = &v84;
  dispatch_sync(externalIsolation, block);
  objc_msgSend(v51, "pathExtension");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v5;
  -[PFVideoSharingOperation _adjustments](self, "_adjustments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = -[PFVideoAVObjectBuilder initWithVideoAsset:videoAdjustments:]([PFVideoAVObjectBuilder alloc], "initWithVideoAsset:videoAdjustments:", self->_videoAsset, v8);
  v49 = v8;
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__11321;
  v81 = __Block_byref_object_dispose__11322;
  v82 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__11321;
  v75 = __Block_byref_object_dispose__11322;
  v76 = 0;
  v10 = (void *)v91[5];
  v11 = *MEMORY[0x1E0C89E98];
  if (!v10)
    v10 = (void *)*MEMORY[0x1E0C89E98];
  v12 = v10;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __37__PFVideoSharingOperation__runExport__block_invoke_2;
  v70[3] = &unk_1E45A4A78;
  v70[4] = &v77;
  v70[5] = &v71;
  -[PFVideoAVObjectBuilder requestExportSessionWithExportPreset:resultHandler:](v9, "requestExportSessionWithExportPreset:resultHandler:", v12, v70);
  v48 = v9;
  if (v72[5])
  {
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:underlyingError:withDescription:", 4, v72[5], CFSTR("AVAssetExportSession could not create session for video asset: %@ with preset %@"), self->_videoAsset, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = v78;
  if (v78[5])
  {
    *(_QWORD *)&v114 = 0;
    *((_QWORD *)&v114 + 1) = &v114;
    v115 = 0x3032000000;
    v116 = __Block_byref_object_copy__11321;
    v117 = __Block_byref_object_dispose__11322;
    v15 = (void *)v85[5];
    if (!v15)
      v15 = v52;
    v16 = v15;
    v118 = v16;
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__11321;
    v68 = __Block_byref_object_dispose__11322;
    v17 = v50;
    v69 = v17;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v109 = v16;
      v110 = 2114;
      v111 = v17;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Preferred outputFileType is %{public}@, file extension: %{public}@", buf, 0x16u);
      v14 = v78;
    }
    objc_msgSend((id)v14[5], "supportedFileTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 40));

    if ((objc_msgSend(v12, "isEqualToString:", v11) & v19 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v20 = *(void **)(*((_QWORD *)&v114 + 1) + 40);
        v21 = CFSTR("Incompatible");
        if (v19)
          v21 = CFSTR("Compatible");
        *(_DWORD *)buf = 138543874;
        v109 = v12;
        v110 = 2114;
        v111 = v20;
        v112 = 2114;
        v113 = v21;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Preset is either not passthrough (%{public}@), or outputFileType (%{public}@) is unsupported (%{public}@), so determining compatible file types...", buf, 0x20u);
      }
      v22 = dispatch_semaphore_create(0);
      v23 = (void *)v78[5];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __37__PFVideoSharingOperation__runExport__block_invoke_24;
      v60[3] = &unk_1E45A4AA0;
      v62 = &v114;
      v63 = &v64;
      v24 = v22;
      v61 = v24;
      objc_msgSend(v23, "determineCompatibleFileTypesWithCompletionHandler:", v60);
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    }
    objc_msgSend((id)v97[5], "URLByAppendingPathComponent:", v103[5]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLByAppendingPathExtension:", v65[5]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v109 = v26;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Output file URL will be %{public}@.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "fileExistsAtPath:", v28);

    if (v29)
    {
      v30 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v26, "path");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v109 = v47;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFVideoSharingOperation] Output file already exists at path: %{public}@. Aborting video remaking.", buf, 0xCu);

      }
      v32 = (void *)objc_opt_class();
      objc_msgSend(v26, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "operationErrorWithCode:underlyingError:withDescription:", 3, 0, CFSTR("Output file already exists at path: %@"), v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = 0;
      v13 = (id)v34;
    }
    else
    {
      objc_msgSend((id)v78[5], "setOutputFileType:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 40));
      objc_msgSend((id)v78[5], "setOutputURL:", v26);
      objc_msgSend((id)v78[5], "setMetadata:", self->_videoMetadata);
      v37 = self->_externalIsolation;
      v38 = MEMORY[0x1E0C809B0];
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __37__PFVideoSharingOperation__runExport__block_invoke_29;
      v59[3] = &unk_1E45A4B68;
      v59[4] = self;
      v59[5] = &v77;
      dispatch_sync(v37, v59);
      v39 = dispatch_semaphore_create(0);
      v40 = (void *)v78[5];
      v57[0] = v38;
      v57[1] = 3221225472;
      v57[2] = __37__PFVideoSharingOperation__runExport__block_invoke_2_30;
      v57[3] = &unk_1E45A4AC8;
      v41 = v39;
      v58 = v41;
      objc_msgSend(v40, "exportAsynchronouslyWithCompletionHandler:", v57);
      dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
      if (objc_msgSend((id)v78[5], "status") == 3)
      {
        v35 = 1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Operation complete.", buf, 2u);
        }
      }
      else
      {
        objc_msgSend((id)v78[5], "error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v109 = v42;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFVideoSharingOperation] Encountered error in export session %@.", buf, 0xCu);
        }
        objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:underlyingError:withDescription:", 5, v42, CFSTR("Error in export session"));
        v43 = objc_claimAutoreleasedReturnValue();

        v35 = 0;
        v13 = (id)v43;
      }
      v44 = self->_externalIsolation;
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __37__PFVideoSharingOperation__runExport__block_invoke_33;
      v53[3] = &unk_1E45A4AF0;
      v53[4] = self;
      v13 = v13;
      v54 = v13;
      v56 = v35;
      v55 = v26;
      dispatch_sync(v44, v53);

    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v114, 8);
    v36 = v35 != 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      videoAsset = self->_videoAsset;
      LODWORD(v114) = 138412290;
      *(_QWORD *)((char *)&v114 + 4) = videoAsset;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFVideoSharingOperation] Could not create export session from video asset: %@", (uint8_t *)&v114, 0xCu);
    }
    -[PFVideoSharingOperation _setOperationError:](self, "_setOperationError:", v13);
    v36 = 0;
  }

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v102, 8);

  return v36;
}

- (float)progress
{
  NSObject *externalIsolation;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PFVideoSharingOperation_progress__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancel
{
  NSObject *externalIsolation;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFVideoSharingOperation;
  -[PFVideoSharingOperation cancel](&v5, sel_cancel);
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PFVideoSharingOperation_cancel__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_sync(externalIsolation, block);
}

- (void)setShouldStripMetadata:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PFVideoSharingOperation_setShouldStripMetadata___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(externalIsolation, v4);
}

- (void)setShouldStripLocation:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PFVideoSharingOperation_setShouldStripLocation___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(externalIsolation, v4);
}

- (void)setCustomLocation:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PFVideoSharingOperation_setCustomLocation___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)setShouldStripCaption:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PFVideoSharingOperation_setShouldStripCaption___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

- (void)setCustomCaption:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PFVideoSharingOperation_setCustomCaption___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PFVideoSharingOperation_setShouldStripAccessibilityDescription___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PFVideoSharingOperation_setCustomAccessibilityLabel___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)setOutputFilename:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[4];
  id v8;
  PFVideoSharingOperation *v9;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PFVideoSharingOperation_setOutputFilename___block_invoke;
  block[3] = &unk_1E45A4B40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)setOutputDirectoryURL:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[4];
  id v8;
  PFVideoSharingOperation *v9;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PFVideoSharingOperation_setOutputDirectoryURL___block_invoke;
  block[3] = &unk_1E45A4B40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)setExportPreset:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[4];
  id v8;
  PFVideoSharingOperation *v9;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PFVideoSharingOperation_setExportPreset___block_invoke;
  block[3] = &unk_1E45A4B40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)setExportFileType:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[4];
  id v8;
  PFVideoSharingOperation *v9;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PFVideoSharingOperation_setExportFileType___block_invoke;
  block[3] = &unk_1E45A4B40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (void)_setSuccess:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PFVideoSharingOperation__setSuccess___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(externalIsolation, v4);
}

- (BOOL)success
{
  NSObject *externalIsolation;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PFVideoSharingOperation_success__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setOperationError:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[4];
  id v8;
  PFVideoSharingOperation *v9;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PFVideoSharingOperation__setOperationError___block_invoke;
  block[3] = &unk_1E45A4B40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (NSError)operationError
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11321;
  v10 = __Block_byref_object_dispose__11322;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PFVideoSharingOperation_operationError__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (NSURL)outputDirectoryURL
{
  return self->_outputDirectoryURL;
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (BOOL)shouldStripMetadata
{
  return self->_shouldStripMetadata;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (CLLocation)customLocation
{
  return self->_customLocation;
}

- (NSDate)customDate
{
  return self->_customDate;
}

- (void)setCustomDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)shouldStripCaption
{
  return self->_shouldStripCaption;
}

- (NSString)customCaption
{
  return self->_customCaption;
}

- (BOOL)shouldStripAccessibilityDescription
{
  return self->_shouldStripAccessibilityDescription;
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (NSString)exportPreset
{
  return self->_exportPreset;
}

- (NSString)exportFileType
{
  return self->_exportFileType;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)_setVideoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSURL)resultingFileURL
{
  return self->_resultingFileURL;
}

- (PFAssetAdjustments)_adjustments
{
  return self->__adjustments;
}

- (void)_setAdjustments:(id)a3
{
  objc_storeStrong((id *)&self->__adjustments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__adjustments, 0);
  objc_storeStrong((id *)&self->_resultingFileURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_exportFileType, 0);
  objc_storeStrong((id *)&self->_exportPreset, 0);
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customCaption, 0);
  objc_storeStrong((id *)&self->_customDate, 0);
  objc_storeStrong((id *)&self->_customLocation, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_externalIsolation, 0);
  objc_storeStrong((id *)&self->_videoMetadata, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

void __41__PFVideoSharingOperation_operationError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 304));
}

void __46__PFVideoSharingOperation__setOperationError___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 32);
  v2 = (id *)(*(_QWORD *)(a1 + 40) + 304);
  if (v1 != *v2)
    objc_storeStrong(v2, v1);
}

uint64_t __34__PFVideoSharingOperation_success__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 297);
  return result;
}

uint64_t __39__PFVideoSharingOperation__setSuccess___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 297))
    *(_BYTE *)(v2 + 297) = v1;
  return result;
}

void __45__PFVideoSharingOperation_setExportFileType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 376);
  if (v2 != v3 && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 376);
    *(_QWORD *)(v5 + 376) = v4;

  }
}

void __43__PFVideoSharingOperation_setExportPreset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 368);
  if (v2 != v3 && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 368);
    *(_QWORD *)(v5 + 368) = v4;

  }
}

void __49__PFVideoSharingOperation_setOutputDirectoryURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 320);
  if (v2 != v3 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v4;

  }
}

void __45__PFVideoSharingOperation_setOutputFilename___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 328);
  if (v2 != v3 && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 328);
    *(_QWORD *)(v5 + 328) = v4;

  }
}

void __55__PFVideoSharingOperation_setCustomAccessibilityLabel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 360);
    *(_QWORD *)(v3 + 360) = v2;

  }
}

uint64_t __66__PFVideoSharingOperation_setShouldStripAccessibilityDescription___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 315) != v2)
    *(_BYTE *)(v1 + 315) = v2;
  return result;
}

void __44__PFVideoSharingOperation_setCustomCaption___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 352);
    *(_QWORD *)(v3 + 352) = v2;

  }
}

uint64_t __49__PFVideoSharingOperation_setShouldStripCaption___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 314) != v2)
    *(_BYTE *)(v1 + 314) = v2;
  return result;
}

void __45__PFVideoSharingOperation_setCustomLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 336);
    *(_QWORD *)(v3 + 336) = v2;

  }
}

uint64_t __50__PFVideoSharingOperation_setShouldStripLocation___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 313))
    *(_BYTE *)(v2 + 313) = v1;
  return result;
}

uint64_t __50__PFVideoSharingOperation_setShouldStripMetadata___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 312))
    *(_BYTE *)(v2 + 312) = v1;
  return result;
}

uint64_t __33__PFVideoSharingOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "cancelExport");
}

_QWORD *__35__PFVideoSharingOperation_progress__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  float v3;

  v1 = result;
  v2 = result[4];
  if (*(_BYTE *)(v2 + 296))
  {
    result = *(_QWORD **)(v2 + 288);
    if (result)
      result = (_QWORD *)objc_msgSend(result, "progress");
    else
      v3 = 1.0;
  }
  else
  {
    v3 = 0.0;
  }
  *(float *)(*(_QWORD *)(v1[5] + 8) + 24) = v3;
  return result;
}

void __37__PFVideoSharingOperation__runExport__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "outputFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "outputDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1 + 32), "exportPreset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "exportFileType");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v17, "copy");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

void __37__PFVideoSharingOperation__runExport__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __37__PFVideoSharingOperation__runExport__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) != 0)
    goto LABEL_12;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Preferred outputFileType is not among the compatible file types", (uint8_t *)&v19, 2u);
  }
  v4 = (void *)*MEMORY[0x1E0C8A2E0];
  if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0C8A2E0]))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "[PFVideoSharingOperation] Found MP4, choosing that.";
LABEL_10:
      _os_log_impl(&dword_1A16EE000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v19, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v4 = (void *)*MEMORY[0x1E0C8A2E8];
  if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0C8A2E8]))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "[PFVideoSharingOperation] Found MOV, choosing that.";
      goto LABEL_10;
    }
LABEL_11:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    goto LABEL_12;
  }
  objc_msgSend(v3, "firstObject");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFVideoSharingOperation] Picking %@, which is the first of the available types.", (uint8_t *)&v19, 0xCu);
  }
LABEL_12:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFilenameExtension");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uppercaseString");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37__PFVideoSharingOperation__runExport__block_invoke_29(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 296) = 1;
}

intptr_t __37__PFVideoSharingOperation__runExport__block_invoke_2_30(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37__PFVideoSharingOperation__runExport__block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 288);
  *(_QWORD *)(v2 + 288) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), *(id *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 392), *(id *)(a1 + 48));
}

void __44__PFVideoSharingOperation__validateMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldStripMetadata");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldStripLocation");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldStripCaption");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldStripAccessibilityDescription");
  objc_msgSend(*(id *)(a1 + 32), "customLocation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

intptr_t __49__PFVideoSharingOperation__ensureVideoProperties__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 248);
        v14 = 0;
        v9 = objc_msgSend(v8, "statusOfValueForKey:error:", v7, &v14);
        v10 = v14;
        if (v9 != 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (id)operationErrorWithCode:(int64_t)a3 underlyingError:(id)a4 withDescription:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v7 = a4;
  if (a5)
  {
    v8 = (objc_class *)MEMORY[0x1E0CB3940];
    v9 = a5;
    a5 = (id)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v13);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB3388]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoSharingOperationErrorDomain"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
