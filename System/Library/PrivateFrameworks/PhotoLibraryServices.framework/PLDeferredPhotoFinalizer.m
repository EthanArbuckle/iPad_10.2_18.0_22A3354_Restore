@implementation PLDeferredPhotoFinalizer

- (id)initForUseCase:(int64_t)a3
{
  PLDeferredPhotoFinalizer *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *identifierToPendingRecords;
  PLCaptureDeferredPhotoProcessor *finalizer;
  PLCaptureDeferredPhotoProcessor *v8;
  NSObject *v9;
  PAImageConversionServiceClient *v10;
  PAImageConversionServiceClient *imageConversionServiceClient;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLDeferredPhotoFinalizer;
  v4 = -[PLDeferredPhotoFinalizer init](&v14, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifierToPendingRecords = v4->_identifierToPendingRecords;
    v4->_identifierToPendingRecords = v5;

    if ((MEMORY[0x19AEC0720]() & 1) != 0)
    {
      finalizer = v4->_finalizer;
      v4->_finalizer = 0;
    }
    else
    {
      v8 = objc_alloc_init(PLCaptureDeferredPhotoProcessor);
      finalizer = v4->_finalizer;
      v4->_finalizer = v8;
    }

    if (!v4->_finalizer)
    {
      PLDeferredProcessingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to get a shared photo processor", v13, 2u);
      }

    }
    v4->_identifierToPendingRecordsLock._os_unfair_lock_opaque = 0;
    v10 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47BE8]);
    imageConversionServiceClient = v4->_imageConversionServiceClient;
    v4->_imageConversionServiceClient = v10;

    v4->_useCase = a3;
  }
  return v4;
}

- (void)_writeDebugFileFromProxyMetadata:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CGImageMetadata *Mutable;
  CGImageMetadata *v13;
  CFDataRef XMPData;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("{Diagnostic}"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    XMPData = 0;
    goto LABEL_10;
  }
  v8 = (void *)MEMORY[0x19AEC1554]();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    PLDeferredProcessingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "failed to deserialize diagnostics data", buf, 2u);
    }
    goto LABEL_8;
  }
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  Mutable = CGImageMetadataCreateMutable();
  if (!Mutable)
  {
LABEL_8:
    XMPData = 0;
    goto LABEL_9;
  }
  v13 = Mutable;
  CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("http://ns.apple.com/ios_debug"), CFSTR("ios_debug"), 0);
  CGImageMetadataSetValueWithPath(v13, 0, CFSTR("ios_debug:camera_diagnostics_bplist"), v11);
  XMPData = CGImageMetadataCreateXMPData(v13, 0);
  CFRelease(v13);
LABEL_9:

  objc_autoreleasePoolPop(v8);
LABEL_10:
  if (-[__CFData length](XMPData, "length"))
  {
    objc_msgSend(v6, "pathForDiagnosticFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = -[__CFData writeToURL:options:error:](XMPData, "writeToURL:options:error:", v16, 0, &v20);
    v18 = v20;
    if ((v17 & 1) == 0)
    {
      PLCameraGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v16;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to persist diagnostics to URL %{public}@ with error:%@", buf, 0x16u);
      }

    }
  }

}

- (void)requestFinalizationOfAsset:(id)a3 isBackgroundPriority:(BOOL)a4 reason:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, NSObject *);
  void *v13;
  PLCaptureDeferredPhotoProcessor *finalizer;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  PLDeferredPhotoPendingAssetRecord *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *identifierToPendingRecords;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  const char *v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSMutableDictionary *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id *v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  uint64_t v51;
  PLDeferredPhotoPendingAssetRecord *v52;
  NSObject *log;
  os_signpost_id_t spid;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  NSObject *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  __CFString *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v8 = a4;
  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, NSObject *))a6;
  v60 = v11;
  if (objc_msgSend(v10, "deferredProcessingNeeded") != 10)
  {
    v56 = v8;
    objc_msgSend(v10, "additionalAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deferredPhotoIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B088]), "initWithDeferredPhotoIdentifier:", v58);
    objc_msgSend(v10, "uuidDescription");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    finalizer = self->_finalizer;
    if (v59)
    {
      if (finalizer)
      {
        PLBackendGetLog();
        log = objc_claimAutoreleasedReturnValue();
        spid = os_signpost_id_generate(log);
        if (!self->_useCase)
        {
          objc_msgSend(v10, "photoLibrary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "constraintsDirector");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "informAssetDeferredProcessingOccurring");

        }
        objc_msgSend(v10, "additionalAttributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "deferredProcessingCandidateOptions");

        qos_class_self();
        PLShortStringFromQoSClass();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = [PLDeferredPhotoPendingAssetRecord alloc];
        objc_msgSend(v10, "objectID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "photoLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "libraryServicesManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileURLForFullsizeRenderImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mainFileURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        LOBYTE(v51) = (v18 & 8) != 0;
        v52 = -[PLDeferredPhotoPendingAssetRecord initWithAssetObjectID:lsm:requestReason:isBackgroundPriority:signpostId:expectsSecondProcessingCallback:needsSemanticDevelopment:fileURLForFullsizeRenderImage:mainFileURL:logDescription:startTimestamp:deferredmediadQos:completionHandler:](v19, "initWithAssetObjectID:lsm:requestReason:isBackgroundPriority:signpostId:expectsSecondProcessingCallback:needsSemanticDevelopment:fileURLForFullsizeRenderImage:mainFileURL:logDescription:startTimestamp:deferredmediadQos:completionHandler:", v20, v22, v60, v56, spid, (v18 >> 4) & 1, v51, v23, v24, v57, v55, v12);

        os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
        identifierToPendingRecords = self->_identifierToPendingRecords;
        objc_msgSend(v59, "deferredPhotoIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](identifierToPendingRecords, "objectForKey:", v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          PLDeferredProcessingGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v59, "deferredPhotoIdentifier");
            v29 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v63 = v57;
            v64 = 2114;
            v65 = v29;
            v66 = 2114;
            v67 = v55;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Adding another pending asset record for asset: %{public}@ with deferred identifier: %{public}@, QoS: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          PLDeferredProcessingGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v59, "deferredPhotoIdentifier");
            v38 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v63 = v57;
            v64 = 2114;
            v65 = v38;
            v66 = 2114;
            v67 = v55;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "First instance of request finalization for asset: %{public}@ with deferred identifier: %{public}@, QoS %{public}@", buf, 0x20u);

          }
        }

        objc_msgSend(v27, "addObject:", v52);
        v39 = self->_identifierToPendingRecords;
        objc_msgSend(v59, "deferredPhotoIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:", v27, v40);

        os_unfair_lock_unlock(&self->_identifierToPendingRecordsLock);
        v41 = log;
        v36 = v41;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          objc_msgSend(v10, "uuid");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v42;
          _os_signpost_emit_with_name_impl(&dword_199541000, v36, OS_SIGNPOST_INTERVAL_BEGIN, spid, "requestFinalizationOfAsset", "uuid: %{public}@", buf, 0xCu);

        }
        v43 = (id *)MEMORY[0x1E0C89F38];
        if (self->_useCase)
          v43 = (id *)MEMORY[0x1E0C89F40];
        v44 = *v43;
        PLDeferredProcessingGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v59, "deferredPhotoIdentifier");
          v46 = objc_claimAutoreleasedReturnValue();
          PLDeferredPhotoFinalizerUseCaseToString(self->_useCase);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v47;
          v49 = CFSTR("NO");
          *(_DWORD *)buf = 138544642;
          v63 = v57;
          v64 = 2114;
          if (v56)
            v49 = CFSTR("YES");
          v65 = v46;
          v66 = 2114;
          v67 = v55;
          v68 = 2114;
          v69 = v47;
          v70 = 2114;
          v71 = v49;
          v72 = 2114;
          v73 = v60;
          v50 = v49;
          _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEFAULT, "Requesting finalization for asset %{public}@ with deferredPhotoIdentifier: %{public}@, QoS: %{public}@, useCase: %{public}@, backgroundPriority: %{public}@, reason: %{public}@", buf, 0x3Eu);

        }
        -[PLCaptureDeferredPhotoProcessor processPhotoProxy:queuePosition:delegate:](self->_finalizer, "processPhotoProxy:queuePosition:delegate:", v59, v44, self);

LABEL_34:
        goto LABEL_35;
      }
    }
    else if (finalizer)
    {
      PLDeferredProcessingGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (v58)
      {
        if (v31)
        {
          objc_msgSend(v10, "additionalAttributes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "deferredPhotoIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v33;
          _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "deferredPhotoIdentifier not recognized by deferredmediad, attempting promotion of preview: %{public}@", buf, 0xCu);

        }
        goto LABEL_17;
      }
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v63 = v57;
        v34 = "deferredPhotoIdentifier is nil for asset: %{public}@ likely due to asset deletion, bailing out";
        goto LABEL_16;
      }
LABEL_17:

      v61 = 0;
      v35 = objc_msgSend(v10, "promoteDeferredPreviewToFinalImageWithOutError:", &v61);
      v36 = v61;
      if ((v35 & 1) == 0)
      {
        PLDeferredProcessingGetLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v63 = v57;
          v64 = 2112;
          v65 = v36;
          _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview of asset %{public}@ with error: %@", buf, 0x16u);
        }

      }
      v12[2](v12, v36);
      goto LABEL_34;
    }
    PLDeferredProcessingGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v63 = v57;
      v34 = "nil shared photo processor when trying to finalize asset: %{public}@";
LABEL_16:
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  -[PLDeferredPhotoFinalizer performSemanticEnhanceForAsset:isBackgroundPriority:reason:completionHandler:](self, "performSemanticEnhanceForAsset:isBackgroundPriority:reason:completionHandler:", v10, v8, v11, v12);
LABEL_35:

}

- (BOOL)isRenderFromMetadata:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return (v5 >> 3) & 1;
}

- (void)processor:(id)a3 didFinishProcessingPhotoProxy:(id)a4 finalPhoto:(id)a5 error:(id)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *identifierToPendingRecords;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id *v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  id *v45;
  id *v46;
  id obj;
  void *v48;
  _BOOL4 v49;
  id v50;
  os_unfair_lock_t lock;
  os_unfair_lock_t locka;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  PLDeferredPhotoFinalizer *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  _BYTE *v72;
  uint64_t v73;
  char v74;
  BOOL v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  PLDeferredPhotoFinalizer *v81;
  id v82;
  id v83;
  _BYTE *v84;
  _BYTE *v85;
  uint64_t *v86;
  BOOL v87;
  _QWORD v88[8];
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t *v94;
  _BYTE *v95;
  _QWORD v96[8];
  id v97;
  id v98;
  _BYTE *v99;
  uint64_t *v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  char v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  _BYTE v120[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint8_t v124[128];
  _BYTE buf[24];
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v9 = a4;
  v57 = a5;
  obj = a6;
  v55 = a6;
  v61 = v9;
  objc_msgSend(v9, "deferredPhotoIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  PLDeferredProcessingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    qos_class_self();
    PLShortStringFromQoSClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v59;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Received didFinishProcessing callback for identifier: %@ QoS: %{public}@", buf, 0x16u);

  }
  v116 = 0;
  v117 = &v116;
  v118 = 0x2020000000;
  v119 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v126 = __Block_byref_object_copy__29403;
  v127 = __Block_byref_object_dispose__29404;
  v128 = 0;
  objc_msgSend(v57, "fileDataRepresentation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "metadata");
  v12 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v12;
  if (v12)
    v49 = -[PLDeferredPhotoFinalizer isRenderFromMetadata:](self, "isRenderFromMetadata:", v12);
  else
    v49 = 0;
  lock = &self->_identifierToPendingRecordsLock;
  os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
  identifierToPendingRecords = self->_identifierToPendingRecords;
  objc_msgSend(v61, "deferredPhotoIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](identifierToPendingRecords, "objectForKeyedSubscript:", v14);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v56, "firstObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v16 = v56;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v113 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
          v21 = v15;
          v22 = objc_msgSend(v20, "signpostId");
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
          {
            *(_WORD *)v120 = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v22, "requestFinalizationOfAsset", ", v120, 2u);
          }

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
      }
      while (v17);
    }

    os_unfair_lock_unlock(lock);
    objc_msgSend(v58, "assetObjectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "lsm");
    locka = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v58, "expectsSecondProcessingCallback");
    objc_msgSend(v58, "logDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "startTimestamp");
    v27 = v26;
    -[os_unfair_lock_s databaseContext](locka, "databaseContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "newShortLivedLibraryWithName:", "-[PLDeferredPhotoFinalizer processor:didFinishProcessingPhotoProxy:finalPhoto:error:]");

    v30 = objc_msgSend(v58, "needsSemanticDevelopment");
    *(_QWORD *)v120 = 0;
    *(_QWORD *)&v120[8] = v120;
    *(_QWORD *)&v120[16] = 0x3032000000;
    v121 = __Block_byref_object_copy__29403;
    v122 = __Block_byref_object_dispose__29404;
    v123 = 0;
    if (v49)
      objc_msgSend(v58, "fileURLForFullsizeRenderImage");
    else
      objc_msgSend(v58, "mainFileURL");
    v31 = objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(*(_QWORD *)&v120[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v120[8] + 40) = v31;

    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", *(_QWORD *)(*(_QWORD *)&v120[8] + 40));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v109 = &v108;
    v110 = 0x2020000000;
    v111 = 0;
    v35 = MEMORY[0x1E0C809B0];
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke;
    v101[3] = &unk_1E3676268;
    v36 = v23;
    v102 = v36;
    v37 = v29;
    v103 = v37;
    v38 = v25;
    v104 = v38;
    v106 = &v108;
    v39 = v59;
    v105 = v39;
    v107 = &v116;
    objc_msgSend(v37, "performBlockAndWait:", v101);
    if (*((_BYTE *)v109 + 24))
    {
      -[PLDeferredPhotoFinalizer _callCompletionHandlersForPhotoProxy:success:error:](self, "_callCompletionHandlersForPhotoProxy:success:error:", v61, *((unsigned __int8 *)v117 + 24), 0);
LABEL_31:

      _Block_object_dispose(&v108, 8);
      _Block_object_dispose(v120, 8);

      goto LABEL_32;
    }
    if (v55)
    {
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), obj);
      v96[0] = v35;
      v96[1] = 3221225472;
      v96[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_126;
      v96[3] = &unk_1E36679E0;
      v40 = (id *)v96;
      v96[4] = v36;
      v41 = v37;
      v96[5] = v41;
      v96[6] = v38;
      v96[7] = self;
      v97 = v55;
      v99 = buf;
      v100 = &v116;
      v98 = v61;
      objc_msgSend(v41, "performTransactionAndWait:", v96);

    }
    else
    {
      if (!v30)
      {
        v76[0] = v35;
        v76[1] = 3221225472;
        v76[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_132;
        v76[3] = &unk_1E3667A30;
        v77 = v36;
        v78 = v37;
        v79 = v38;
        v84 = v120;
        v85 = buf;
        v80 = v54;
        v81 = self;
        v87 = v49;
        v82 = v53;
        v86 = &v116;
        v83 = v48;
        v62[0] = v35;
        v62[1] = 3221225472;
        v62[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_135;
        v62[3] = &unk_1E3667A58;
        v74 = v24;
        v75 = v49;
        v73 = v27;
        v63 = v79;
        v71 = &v116;
        v64 = v39;
        v65 = self;
        v66 = v78;
        v67 = v77;
        v68 = 0;
        v69 = v58;
        v70 = v61;
        v72 = buf;
        objc_msgSend(v66, "performTransaction:completionHandler:", v76, v62);

        v44 = &v77;
        v45 = &v78;
        v46 = &v79;
        goto LABEL_30;
      }
      v88[0] = v35;
      v88[1] = 3221225472;
      v88[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_127;
      v88[3] = &unk_1E3667A08;
      v40 = (id *)v88;
      v88[4] = v36;
      v42 = v37;
      v88[5] = v42;
      v88[6] = v38;
      v88[7] = self;
      v89 = v61;
      v94 = &v116;
      v90 = v54;
      v91 = v53;
      v43 = v58;
      v95 = buf;
      v92 = v43;
      v93 = 0;
      objc_msgSend(v42, "performTransactionAndWait:", v88);

    }
    v44 = v40 + 4;
    v45 = v40 + 5;
    v46 = v40 + 6;
LABEL_30:

    goto LABEL_31;
  }
  PLDeferredProcessingGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    -[NSMutableDictionary allKeys](self->_identifierToPendingRecords, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v120 = 138543618;
    *(_QWORD *)&v120[4] = v59;
    *(_WORD *)&v120[12] = 2114;
    *(_QWORD *)&v120[14] = v33;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Received finished proxy for an asset we weren't tracking. identifier:%{public}@, current list:%{public}@", v120, 0x16u);

  }
  os_unfair_lock_unlock(lock);
LABEL_32:

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v116, 8);

}

- (void)_transitionDeferredProcessingNeededToNextStateForAsset:(id)a3 originalHeight:(int64_t)a4 originalWidth:(int64_t)a5
{
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = objc_msgSend(v10, "transitionToDeferredProcessingNeededAdjustmentWithOriginalWidth:originalHeight:shouldSignalBackgroundProcessingNeeded:reason:", a5, a4, 0, CFSTR("Deferred photo finalizer transitioned to next processing state"));
  v8 = v10;
  if ((v7 & 1) == 0)
  {
    if ((objc_msgSend(v10, "isSemanticEnhanceProcessingCandidate") & 1) != 0)
    {
      v9 = 7;
      v8 = v10;
LABEL_5:
      objc_msgSend(v8, "setDeferredProcessingNeeded:", v9);
      v8 = v10;
      goto LABEL_6;
    }
    objc_msgSend(v10, "setDeferredProcessingNeeded:", 0);
    v9 = objc_msgSend(v10, "expectedDeferredProcessingNeededOnAssetCreation");
    v8 = v10;
    if ((_DWORD)v9)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)_callCompletionHandlersForPhotoProxy:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  os_unfair_lock_s *p_identifierToPendingRecordsLock;
  NSMutableDictionary *identifierToPendingRecords;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD);
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  p_identifierToPendingRecordsLock = &self->_identifierToPendingRecordsLock;
  os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
  identifierToPendingRecords = self->_identifierToPendingRecords;
  objc_msgSend(v8, "deferredPhotoIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](identifierToPendingRecords, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = self->_identifierToPendingRecords;
  objc_msgSend(v8, "deferredPhotoIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, v15);

  os_unfair_lock_unlock(&self->_identifierToPendingRecordsLock);
  v33 = v9;
  if (v6)
  {
    PLDeferredProcessingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "deferredPhotoIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLShortStringFromQoSClass();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v17;
      v41 = 2114;
      v42 = v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Requesting deletion of intermediates for deferredUUID: %@ QoS: %{public}@", buf, 0x16u);

    }
    -[PLCaptureDeferredPhotoProcessor deletePersistentStorageForPhotoProxy:](self->_finalizer, "deletePersistentStorageForPhotoProxy:", v8);

    v19 = 0;
  }
  else
  {
    v19 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromPLErrorCode();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D50]);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 48001, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v13;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v26), "completionHandler");
        v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v27)[2](v27, v19);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v24);
  }

  if (v6 && !self->_useCase)
  {
    os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
    v28 = -[NSMutableDictionary count](self->_identifierToPendingRecords, "count");
    os_unfair_lock_unlock(p_identifierToPendingRecordsLock);
    if (!v28)
    {
      objc_msgSend(v22, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lsm");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "libraryBundle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintsDirector");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "informAssetsFinishedDeferredProcessing");

    }
  }

}

- (void)deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  PLCaptureDeferredPhotoProcessor *finalizer;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLDeferredPhotoFinalizer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  finalizer = self->_finalizer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__PLDeferredPhotoFinalizer_deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E3667A80;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[PLCaptureDeferredPhotoProcessor persistentlyStoredDeferredPhotoProxiesWithCompletionHandler:](finalizer, "persistentlyStoredDeferredPhotoProxiesWithCompletionHandler:", v11);

}

- (void)_createTTRForNonRecoverableError:(id)a3 assetDescription:(id)a4 asset:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  _QWORD v73[3];
  _QWORD v74[3];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (MEMORY[0x19AEC04BC]())
  {
    v10 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v9, "additionalAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deferredPhotoIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v8;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed during finalization in a NON-recoverable way for asset: %@ with deferredPhotoIdentifier: %@ reason: %@"), v8, v12, v7);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTR Photos: Non-recoverable deferredmediad error when processing the proxy (Error Code: %ld)"), objc_msgSend(v7, "code"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "additionalAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deferredPhotoIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v15;
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("/"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v9;
    objc_msgSend(v9, "pathManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "photoDirectoryWithType:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v19;
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("/Deferred/CaptureContainers"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = *MEMORY[0x1E0C99A90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v20, v21, 0, &__block_literal_global_29472);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v69;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v69 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByAppendingPathComponent:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "fileExistsAtPath:", v29))
          {
            objc_msgSend(v63, "stringByDeletingLastPathComponent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("tmpCaptureContainers"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v13, "directoryExistsAtPath:", v31) & 1) == 0)
            {
              v67 = 0;
              v32 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v31, 0, 0, &v67);
              v33 = v67;
              if ((v32 & 1) == 0)
              {
                PLBackendGetLog();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v64, "uuid");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v76 = v31;
                  v77 = 2112;
                  v78 = v35;
                  v79 = 2112;
                  v80 = v62;
                  _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Failed to create temporary capture containers directory: %@ for asset with uuid: %@ and deferred identifier: %@", buf, 0x20u);

                }
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-copy"), v17);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringByAppendingPathComponent:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = 0;
            objc_msgSend(v13, "copyItemAtPath:toPath:error:", v29, v37, &v66);
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v38);

            goto LABEL_18;
          }

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
        if (v25)
          continue;
        break;
      }
    }
LABEL_18:

    v9 = v64;
    objc_msgSend(v64, "pathForDiagnosticFile");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v13, "fileExistsAtPath:", v39);

    if (v40)
    {
      v41 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v64, "pathForDiagnosticFile");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "fileURLWithPath:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v65, "addObject:", v43);
    }
    objc_msgSend(v64, "mainFileURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v13, "fileExistsAtPath:", v45);

    if (v46)
    {
      objc_msgSend(v64, "mainFileURL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v47);

    }
    objc_msgSend(v64, "uuid");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      v74[0] = CFSTR("currentAssets");
      v73[0] = CFSTR("previewStyle");
      v73[1] = CFSTR("assetLocalIdentifiers");
      objc_msgSend(v64, "uuid");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v50;
      v73[2] = CFSTR("photoLibraryURLString");
      objc_msgSend(v64, "photoLibrary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "pathManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "libraryURL");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "absoluteString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v54;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setUserInfo:", v55);

      v9 = v64;
    }
    else
    {
      v49 = 0;
    }
    v8 = v60;
    v7 = v61;
    +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:radarComponent:diagnosticTTRType:attachments:extensionItem:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:radarComponent:diagnosticTTRType:attachments:extensionItem:", CFSTR("Failure occured while processing Photo"), CFSTR("A higher-quality image couldn't be processed. File a radar with this photo and its intermediate processing files?"), v58, v59, 2, 1, v65, v49);

  }
}

- (void)performSemanticEnhanceForAsset:(id)a3 isBackgroundPriority:(BOOL)a4 reason:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  PAImageConversionServiceClient *imageConversionServiceClient;
  id v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  os_signpost_id_t v48;
  _QWORD v49[4];
  id v50;
  __int128 *p_buf;
  id obj;
  uint8_t v53[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61[5];

  v8 = a4;
  v61[2] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v39 = a6;
  PLDeferredProcessingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "uuidDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[SemDev] performing semantic enhance for asset %{public}@", (uint8_t *)&buf, 0xCu);

  }
  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v10, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "performSemanticEnhanceForAsset", "uuid: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v38 = v17;

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__29403;
  v60 = __Block_byref_object_dispose__29404;
  v61[0] = 0;
  obj = 0;
  -[PLDeferredPhotoFinalizer _createAssetAdjustmentsForAsset:error:](self, "_createAssetAdjustmentsForAsset:error:", v10, &obj);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v61, obj);
  if (v40)
  {
    -[PLDeferredPhotoFinalizer _imageConversionOptionsForAsset:adjustments:isBackgroundPriority:reason:](self, "_imageConversionOptionsForAsset:adjustments:isBackgroundPriority:reason:", v10, v40, v8, v11);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    v21 = (void *)objc_opt_new();
    -[PLDeferredPhotoFinalizer _setupMediaConversionSourceCollections:destinationCollection:forAsset:](self, "_setupMediaConversionSourceCollections:destinationCollection:forAsset:", v20, v21, v10);
    objc_msgSend(v10, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v19;
    objc_msgSend(v10, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "libraryServicesManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v11;
    objc_msgSend(v21, "resourceURLForRole:", *MEMORY[0x1E0D47C68]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    imageConversionServiceClient = self->_imageConversionServiceClient;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2;
    v41[3] = &unk_1E3667AC8;
    v42 = v38;
    v48 = v15;
    v28 = v24;
    v43 = v28;
    v29 = v22;
    v44 = v29;
    v30 = v26;
    v45 = v30;
    v46 = v10;
    v47 = v39;
    -[PAImageConversionServiceClient convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:](imageConversionServiceClient, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v20, v21, v37, v41);

    v11 = v25;
    v31 = v37;
  }
  else
  {
    PLDeferredProcessingGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = v11;
      v34 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(v10, "uuidDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 138412546;
      v54 = v34;
      v55 = 2114;
      v56 = v35;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "[SemDev] adjustments are nil: %@ for asset uuid: %{public}@ ", v53, 0x16u);

      v11 = v33;
    }

    objc_msgSend(v10, "photoLibrary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke;
    v49[3] = &unk_1E3677C68;
    v50 = v10;
    p_buf = &buf;
    objc_msgSend(v36, "performBlockAndWait:", v49);

    (*((void (**)(id, _QWORD))v39 + 2))(v39, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v31 = v50;
  }

  _Block_object_dispose(&buf, 8);
}

- (id)_createAssetAdjustmentsForAsset:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(v5, "pathForCameraMetadataFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (v13)
  {
    +[PLPhotoEditExportProperties exportPropertiesWithImageWidth:imageHeight:exifOrientation:](PLPhotoEditExportProperties, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:", objc_msgSend(v5, "originalWidth"), objc_msgSend(v5, "originalHeight"), (int)objc_msgSend(v5, "orientation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[PLCompositionHelper newIdentityCompositionController](PLCompositionHelper, "newIdentityCompositionController");
    +[PLCompositionHelper compositionController:updateSemanticEnhanceFromCameraMetadata:exportProperties:](PLCompositionHelper, "compositionController:updateSemanticEnhanceFromCameraMetadata:exportProperties:", v16, v13, v15);
    +[PLImageWriter assetAdjustmentsFromCompositionController:exportProperties:](PLImageWriter, "assetAdjustmentsFromCompositionController:exportProperties:", v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLDeferredProcessingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "pathForCameraMetadataFile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v19;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[SemDev] Error deserializing camera metadata from path: %@, error: %@", buf, 0x16u);

    }
    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v17;
}

- (id)_imageConversionOptionsForAsset:(id)a3 adjustments:(id)a4 isBackgroundPriority:(BOOL)a5 reason:(id)a6
{
  _BOOL4 v6;
  void *v9;
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
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[4];

  v6 = a5;
  v26[3] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = *MEMORY[0x1E0D47C78];
  objc_msgSend(v11, "adjustmentData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = *MEMORY[0x1E0D47C80];
  objc_msgSend(v11, "adjustmentFormatIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  v25[2] = *MEMORY[0x1E0D47C88];
  objc_msgSend(v11, "adjustmentFormatVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D47CD0]);

  objc_msgSend(MEMORY[0x1E0D47C08], "standardPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D47D48]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E375E778, *MEMORY[0x1E0D47D88]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D47CE0]);
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "uuidDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ for asset %@"), v10, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D47D78]);
  if (v6)
    v22 = 2;
  else
    v22 = 4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D47D30]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47D00]);
  return v13;
}

- (void)_setupMediaConversionSourceCollections:(id)a3 destinationCollection:(id)a4 forAsset:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "fileURLForCurrentDeferredProcessingPreviewFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D47C68];
  objc_msgSend(v7, "setResourceURL:forRole:deleteOnDeallocation:", v10, *MEMORY[0x1E0D47C68], 0);

  objc_msgSend(v8, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "temporaryRenderContentURLForInternalRendersWithExtension:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResourceURL:forRole:deleteOnDeallocation:", v15, v11, 1);
  PLDeferredProcessingGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "resourceURLForRole:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v17;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "[SemDev] Main source URL: %@, destination URL: %@", (uint8_t *)&v18, 0x16u);

  }
}

- (void)_prepareFinalizedAssetForSemanticDevelopment:(id)a3 finalizedPhotoData:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLDeferredProcessingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uuidDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[SemDev] Transferring finalized DF asset %{public}@ to SemDev proxy slot", buf, 0xCu);

  }
  objc_msgSend(v5, "fileURLForCurrentDeferredProcessingPreviewFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeferredProcessingNeeded:", 10);
  objc_msgSend(v5, "fileURLForCurrentDeferredProcessingPreviewFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    PLDeferredProcessingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[SemDev] already transferred proxy to semdev url: :%@, skipping copy", buf, 0xCu);
    }
  }
  else
  {
    v20 = 0;
    v12 = objc_msgSend(v6, "writeToURL:options:error:", v10, 1073741825, &v20);
    v11 = v20;
    if ((v12 & 1) == 0)
    {
      PLDeferredProcessingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "fileURLForCurrentDeferredProcessingPreviewFile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v14;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "[SemDev] Error copying finalized photo data to semdev url %@, error: %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v16 = objc_msgSend(v15, "removeItemAtURL:error:", v9, &v19);
    v17 = v19;

    if ((v16 & 1) == 0)
    {
      PLDeferredProcessingGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v9;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[SemDev] Error removing proxy photo url: %@, error: %@", buf, 0x16u);
      }

    }
  }

}

- (id)requestFrameDropRecoveryForAsset:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id v28;
  id val;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  id v33;
  PLDeferredPhotoFinalizer *v34;
  id v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  _QWORD v39[4];
  id v40;
  id from;
  _QWORD v42[4];
  id v43;
  id location;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke;
  v42[3] = &unk_1E3677D48;
  objc_copyWeak(&v43, &location);
  objc_msgSend(val, "setCancellationHandler:", v42);
  objc_msgSend(v28, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "uuidDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLDeferredProcessingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    qos_class_self();
    PLShortStringFromQoSClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v7;
    v47 = 2114;
    v48 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[FDR] Requesting frame drop recovery for asset %{public}@, QoS: %{public}@", buf, 0x16u);

  }
  objc_initWeak(&from, val);
  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v6;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "requestFrameDropRecoveryForAsset", "uuid: %{public}@", buf, 0xCu);
  }

  v17 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v28, "pathForDeferredVideoComplementFile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileURLWithPath:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_187;
  v39[3] = &unk_1E3667AF0;
  objc_copyWeak(&v40, &from);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_189;
  v30[3] = &unk_1E3667B18;
  v20 = v7;
  v31 = v20;
  v21 = v16;
  v32 = v21;
  v38 = v14;
  v22 = v6;
  v33 = v22;
  v34 = self;
  v23 = v8;
  v35 = v23;
  v24 = v10;
  v36 = v24;
  v25 = v27;
  v37 = v25;
  -[PLDeferredPhotoFinalizer _requestFrameDropRecoveryForAssetURL:withOptions:progressHandler:andCompletionHandler:](self, "_requestFrameDropRecoveryForAssetURL:withOptions:progressHandler:andCompletionHandler:", v19, 0, v39, v30);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  return val;
}

- (void)_promoteProxyAndRecoverErrors:(id)a3 libraryServicesManager:(id)a4 inError:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PLDeferredPhotoFinalizer *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__29403;
  v29 = __Block_byref_object_dispose__29404;
  v30 = 0;
  objc_msgSend(v11, "databaseContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "newShortLivedLibraryWithName:", "-[PLDeferredPhotoFinalizer _promoteProxyAndRecoverErrors:libraryServicesManager:inError:completionHandler:]");

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __107__PLDeferredPhotoFinalizer__promoteProxyAndRecoverErrors_libraryServicesManager_inError_completionHandler___block_invoke;
  v19[3] = &unk_1E3677970;
  v16 = v15;
  v20 = v16;
  v17 = v10;
  v24 = &v25;
  v21 = v17;
  v22 = self;
  v18 = v12;
  v23 = v18;
  objc_msgSend(v16, "performTransactionAndWait:", v19);
  v13[2](v13, v26[5]);

  _Block_object_dispose(&v25, 8);
}

- (void)_copyFrameRecoveredVideoComplementToFinalSlot:(id)a3 libraryServicesManager:(id)a4 resultURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  PLDeferredPhotoFinalizer *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  objc_msgSend(v11, "databaseContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "newShortLivedLibraryWithName:", "-[PLDeferredPhotoFinalizer _copyFrameRecoveredVideoComplementToFinalSlot:libraryServicesManager:resultURL:completionHandler:]");

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__29403;
  v29 = __Block_byref_object_dispose__29404;
  v30 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __125__PLDeferredPhotoFinalizer__copyFrameRecoveredVideoComplementToFinalSlot_libraryServicesManager_resultURL_completionHandler___block_invoke;
  v19[3] = &unk_1E3677970;
  v16 = v15;
  v20 = v16;
  v17 = v10;
  v21 = v17;
  v18 = v12;
  v23 = self;
  v24 = &v25;
  v22 = v18;
  objc_msgSend(v16, "performTransactionAndWait:", v19);
  v13[2](v13, v26[5]);

  _Block_object_dispose(&v25, 8);
}

- (void)_repushOriginalVideoComplementIfNeeded:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "master");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PLDeferredProcessingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "master");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "[FDR] Marking existing master %{public}@ for asset %{public}@ as not pushed to repush master resource to CPL", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v3, "master");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCloudLocalState:", 0);

    objc_msgSend(v3, "masterResourceForCPLType:", 18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "cloudLocalState"))
      objc_msgSend(v9, "setCloudLocalState:", 0);

  }
}

- (int64_t)_requestFrameDropRecoveryForAssetURL:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(getVCPMediaAnalysisServiceClass(), "sharedAnalysisService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = (int)objc_msgSend(v13, "requestFRCForAssetURL:withOptions:progressHandler:andCompletionHandler:", v9, v10, v11, v12);
  else
    v14 = 0;

  return v14;
}

- (void)_copyOriginalVideoComplementToDiagnosticPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  os_log_type_t v12;
  uint32_t v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForDeferredVideoComplementFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForOriginalVideoComplementDiagnosticFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v4, "copyItemAtPath:toPath:error:", v5, v6, &v14);
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    PLDeferredProcessingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    v11 = "[FDR] Unable to copy original video complement file to diagnostic path with error: %@";
    v10 = v9;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 12;
LABEL_6:
    _os_log_impl(&dword_199541000, v10, v12, v11, buf, v13);
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "pathForOriginalVideoComplementDiagnosticFile");
    v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = CFSTR("PLFrameDropRecoverySaveOriginalVideoComplement");
    v10 = MEMORY[0x1E0C81028];
    v11 = "[FDR] Original video complement file saved to %@ because the user default %@ is set";
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 22;
    goto LABEL_6;
  }
LABEL_8:

}

- (void)cancelOutstandingFrameDropRecoveryRequests
{
  id v2;

  objc_msgSend(getVCPMediaAnalysisServiceClass(), "sharedAnalysisService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_finalizer, 0);
  objc_storeStrong((id *)&self->_identifierToPendingRecords, 0);
}

void __125__PLDeferredPhotoFinalizer__copyFrameRecoveredVideoComplementToFinalSlot_libraryServicesManager_resultURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForVideoComplementFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v9 + 40);
    v10 = -[NSObject copyItemAtPath:toPath:error:](v6, "copyItemAtPath:toPath:error:", v7, v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if ((v10 & 1) != 0)
    {

    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      if ((v12 & 1) == 0)
      {
        PLDeferredProcessingGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v26 = v16;
          v27 = 2112;
          v28 = v17;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "[FDR] Error copying FDR video complement to path: %{public}@: %@", buf, 0x16u);

        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v22 = *(id *)(v18 + 40);
        v19 = objc_msgSend(v4, "promoteProxyToFinalVideoComplementWithOutError:", &v22);
        objc_storeStrong((id *)(v18 + 40), v22);
        if ((v19 & 1) != 0)
          goto LABEL_12;
        PLDeferredProcessingGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v26 = v20;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "[FDR] Error promoting proxy to final video complement: %@", buf, 0xCu);
        }
LABEL_11:

LABEL_12:
        objc_msgSend(v4, "setVideoDeferredProcessingNeeded:", 0);
        objc_msgSend(*(id *)(a1 + 56), "_repushOriginalVideoComplementIfNeeded:", v4);
        PLSendFRCCompletedAnalytics(v4, 1, 0, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
LABEL_13:

        goto LABEL_14;
      }
    }
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
    if (-[NSObject BOOLForKey:](v13, "BOOLForKey:", CFSTR("PLFrameDropRecoverySaveOriginalVideoComplement")))objc_msgSend(*(id *)(a1 + 56), "_copyOriginalVideoComplementToDiagnosticPath:", v4);
    -[NSObject removeItemAtURL:error:](v6, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = *(id *)(v14 + 40);
    objc_msgSend(v4, "installFinalVideoComplementAndRemoveDeferredFilesWithOutError:", &v21);
    objc_storeStrong((id *)(v14 + 40), v21);
    goto LABEL_11;
  }
  if (v5)
  {
    PLDeferredProcessingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:

}

void __107__PLDeferredPhotoFinalizer__promoteProxyAndRecoverErrors_libraryServicesManager_inError_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id obj;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v6 + 40);
    v7 = objc_msgSend(v4, "promoteProxyToFinalVideoComplementWithOutError:", &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    if ((v7 & 1) == 0)
    {
      PLDeferredProcessingGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "[FDR] Error promoting proxy to final video complement: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "setVideoDeferredProcessingNeeded:", 0);
    objc_msgSend(*(id *)(a1 + 48), "_repushOriginalVideoComplementIfNeeded:", v4);
    if (objc_msgSend(*(id *)(a1 + 56), "code")
      || (objc_msgSend(*(id *)(a1 + 56), "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2F90]),
          v10,
          !v11))
    {
      v12 = *(void **)(a1 + 56);
      if (v12)
      {
        v13 = v4;
        v14 = 0;
      }
      else
      {
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v13 = v4;
        v14 = 1;
      }
      v15 = 0;
    }
    else
    {
      v12 = *(void **)(a1 + 56);
      v13 = v4;
      v14 = 1;
      v15 = 1;
    }
    PLSendFRCCompletedAnalytics(v13, v14, v15, v12);
  }
  else if (v5)
  {
    PLDeferredProcessingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }

  }
}

void __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancelOutstandingFrameDropRecoveryRequests");

}

void __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_187(uint64_t a1, double a2)
{
  uint64_t v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t)a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCompletedUnitCount:", v3);

  PLDeferredProcessingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "[FDR] Progress updated to %f", (uint8_t *)&v6, 0xCu);
  }

}

void __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLDeferredProcessingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    qos_class_self();
    PLShortStringFromQoSClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v5;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[FDR] Received frame drop recovery completion handler for asset %{public}@, url %@, QoS: %{public}@", (uint8_t *)&v16, 0x20u);

  }
  v10 = *(id *)(a1 + 40);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 88);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = *(_QWORD *)(a1 + 48);
    v16 = 138543362;
    v17 = v13;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v12, "requestFrameDropRecoveryForAsset", "uuid: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  if (!v5 || v6)
  {
    PLDeferredProcessingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "[FDR] Error performing FDR for asset %{public}@, promoting proxy and bailing out: %@", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "_promoteProxyAndRecoverErrors:libraryServicesManager:inError:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v6, *(_QWORD *)(a1 + 80));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_copyFrameRecoveredVideoComplementToFinalSlot:libraryServicesManager:resultURL:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v5, *(_QWORD *)(a1 + 80));
  }

}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "promoteSemanticEnhancePreviewToFinalImage:", &v6);
  v4 = v6;
  v5 = v6;
  if ((v3 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  id *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__29403;
  v35 = __Block_byref_object_dispose__29404;
  v36 = 0;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 80);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v11, "performSemanticEnhanceForAsset", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLDeferredPhotoFinalizer performSemanticEnhanceForAsset:isBackgroundPriority:reason:completionHandler:]_block_invoke");

  if (a2 == 1)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2_169;
    v27[3] = &unk_1E3676EC8;
    v28 = v13;
    v29 = *(id *)(a1 + 48);
    v30[0] = *(id *)(a1 + 56);
    v30[1] = &v31;
    objc_msgSend(v28, "performTransactionAndWait:", v27);
    v14 = &v28;
    v15 = &v29;
    v16 = (id *)v30;
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_172;
    v23[3] = &unk_1E3676EC8;
    v24 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 48);
    v26[1] = &v31;
    v17 = v8;
    v26[0] = v17;
    objc_msgSend(v13, "performTransactionAndWait:", v23);
    PLDeferredProcessingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v38 = a2;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[SemDev] Media conversion did not succeed for semantic enhance, status: %ld, error: %@", buf, 0x16u);
    }

    v14 = &v24;
    v15 = &v25;
    v16 = (id *)v26;
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v32[5], v19, v20, v21, v22);
  _Block_object_dispose(&v31, 8);

}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2_169(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uuidDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLDeferredProcessingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[SemDev] Media conversion success for semantic enhance adjustment for asset uuid: %{public}@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D73208];
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "mainFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  LOBYTE(v6) = objc_msgSend(v6, "ingestItemAtURL:toURL:type:options:capabilities:error:", v7, v8, 3, 2, v10, &v36);
  v11 = v36;

  v12 = objc_msgSend(v3, "height");
  v13 = objc_msgSend(v3, "width");
  if ((v6 & 1) != 0)
  {
    v14 = v13;
    objc_msgSend(v3, "mainFileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v11;
    v16 = objc_msgSend(v3, "installFinalImageAndRemoveDeferredFilesWithFinalImageURL:outError:", v15, &v34);
    v17 = v34;

    if (v16)
    {
      objc_msgSend(v3, "cleanUpMetadataPath");
      objc_msgSend(v3, "setDeferredProcessingNeeded:", 0);
      objc_msgSend(v3, "additionalAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDeferredProcessingCandidateOptions:", 0);

      objc_msgSend(v3, "transitionToDeferredProcessingNeededAdjustmentWithOriginalWidth:originalHeight:shouldSignalBackgroundProcessingNeeded:reason:", v14, v12, 1, CFSTR("[SemDev] Installed final image and removed deferred files"));
LABEL_22:
      v29 = v17;
      goto LABEL_23;
    }
    v23 = objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", v17);
    PLDeferredProcessingGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v4;
        v39 = 2112;
        v40 = v17;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "[SemDev] Failed to install image for asset: %{public}@, reason: %@", buf, 0x16u);
      }

      goto LABEL_22;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "mainFileURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v4;
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "[SemDev] Asset %{public}@ has already had file written to %@, skipping copy", buf, 0x16u);

    }
    objc_msgSend(v3, "mainFileURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v17;
    v28 = objc_msgSend(v3, "installFinalImageAndRemoveDeferredFilesWithFinalImageURL:outError:", v27, &v33);
    v29 = v33;

    if ((v28 & 1) == 0)
    {
      PLDeferredProcessingGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v4;
        v39 = 2112;
        v40 = v29;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "[SemDev] Error installing final image and removing deferred files for asset %{public}@ with error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v19 = objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", v11);
    PLDeferredProcessingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        objc_msgSend(v3, "mainFileURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v22;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "[SemDev] file already exists, no need to ingest at url: %@", buf, 0xCu);

      }
      goto LABEL_25;
    }
    if (v21)
    {
      v31 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v38 = v31;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "[SemDev] Failed to ingest %@: %@", buf, 0x16u);
    }

    v35 = v11;
    objc_msgSend(v3, "promoteSemanticEnhancePreviewToFinalImage:", &v35);
    v29 = v35;

  }
LABEL_23:
  if (v29)
  {
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(NSObject **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v29;
    v11 = v29;
LABEL_25:

  }
}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_172(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uuidDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "promoteSemanticEnhancePreviewToFinalImage:", &v11);
  v7 = v11;
  v8 = v11;
  if ((v6 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
  PLDeferredProcessingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[SemDev] Media conversion failure for asset %{public}@, promoted preview to final image, error: %@", buf, 0x16u);
  }

}

uint64_t __84__PLDeferredPhotoFinalizer__createTTRForNonRecoverableError_assetDescription_asset___block_invoke(uint64_t a1, void *a2, void *a3)
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
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

void __115__PLDeferredPhotoFinalizer_deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  __int128 v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138543362;
    v15 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "deferredPhotoIdentifier", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotoLibrary requestIdentifierFromDeferredIdentifier:](PLPhotoLibrary, "requestIdentifierFromDeferredIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11);
        PLDeferredProcessingGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if ((v12 & 1) != 0)
        {
          if (v14)
          {
            *(_DWORD *)buf = v15;
            v22 = v10;
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "%{public}@ is still needed for later processing", buf, 0xCu);
          }

        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = v15;
            v22 = v10;
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "%{public}@ is not needed anymore, requesting deletion", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "deletePersistentStorageForPhotoProxy:", v9);
          ++v6;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    PLDeferredProcessingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[6];
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", (uint8_t *)&v14, 0xCu);
    }

    v10 = *(_QWORD *)(a1[8] + 8);
    goto LABEL_12;
  }
  v4 = objc_msgSend(v2, "deferredProcessingNeeded");
  PLDeferredProcessingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      v11 = a1[6];
      v12 = a1[7];
      qos_class_self();
      PLShortStringFromQoSClass();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Already finalized this asset, calling completion handlers with success. asset: %{public}@, deferredIdentifier: %{public}@, QoS: %{public}@", (uint8_t *)&v14, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
    v10 = *(_QWORD *)(a1[8] + 8);
LABEL_12:
    *(_BYTE *)(v10 + 24) = 1;
    goto LABEL_13;
  }
  if (v6)
  {
    v7 = a1[6];
    v14 = 138543618;
    v15 = v7;
    v16 = 1024;
    LODWORD(v17) = objc_msgSend(v3, "deferredProcessingNeeded");
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ with deferred processing state %hu not yet finalized", (uint8_t *)&v14, 0x12u);
  }

LABEL_13:
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_126(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PLDeferredProcessingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", buf, 0xCu);
    }
    goto LABEL_7;
  }
  v3 = objc_msgSend((id)objc_opt_class(), "errorIsRecoverable:", *(_QWORD *)(a1 + 64));
  PLDeferredProcessingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(void **)(a1 + 64);
      qos_class_self();
      PLShortStringFromQoSClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "didFinishProcessingPhotoProxy failed in a recoverable way, will try again later for asset: %{public}@, reason: %@, QoS: %{public}@", buf, 0x20u);

    }
LABEL_7:

    goto LABEL_17;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "didFinishProcessingPhotoProxy failed in a NON-recoverable way for asset: %{public}@, reason: %@", buf, 0x16u);
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v2, "promoteDeferredPreviewToFinalImageWithOutError:", &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  PLDeferredProcessingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 48);
      qos_class_self();
      PLShortStringFromQoSClass();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Successfully promoted deferred preview for asset: %{public}@ QoS: %{public}@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(NSObject **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v19;
    v24 = 2112;
    v25 = v20;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview for asset: %{public}@, reason: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 56), "_createTTRForNonRecoverableError:assetDescription:asset:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v2);
LABEL_17:
  objc_msgSend(*(id *)(a1 + 56), "_callCompletionHandlersForPhotoProxy:success:error:", *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_127(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 72);
    PLDeferredProcessingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[SemDev] DF capture needs semantic development for asset: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 56), "_prepareFinalizedAssetForSemanticDevelopment:finalizedPhotoData:", v2, *(_QWORD *)(a1 + 72));
      objc_msgSend(*(id *)(a1 + 56), "_writeDebugFileFromProxyMetadata:forAsset:", *(_QWORD *)(a1 + 80), v2);
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 88), "requestReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (from AVCaptureDeferredPhotoProcessor didFinish)"), v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 56);
      v11 = objc_msgSend(*(id *)(a1 + 88), "isBackgroundPriority");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_130;
      v22[3] = &unk_1E366BF78;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(void **)(a1 + 64);
      v24 = *(_QWORD *)(a1 + 104);
      v22[4] = v12;
      v23 = v13;
      objc_msgSend(v10, "performSemanticEnhanceForAsset:isBackgroundPriority:reason:completionHandler:", v2, v11, v9, v22);

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 48);
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Finalized photo data representation is nil for asset: %{public}@, error: %@", buf, 0x16u);
      }

      v21 = 0;
      v18 = objc_msgSend(v2, "promoteDeferredPreviewToFinalImageWithOutError:", &v21);
      v9 = v21;
      if (v18)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
      }
      else
      {
        PLDeferredProcessingGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v26 = v20;
          v27 = 2112;
          v28 = v9;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview for asset: %{public}@, reason %@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 56), "_createTTRForNonRecoverableError:assetDescription:asset:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 48), v2);
      objc_msgSend(*(id *)(a1 + 56), "_callCompletionHandlersForPhotoProxy:success:error:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), *(_QWORD *)(a1 + 96));
    }

  }
  else
  {
    PLDeferredProcessingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "_callCompletionHandlersForPhotoProxy:success:error:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), 0);
  }

}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_132(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
  char v40;
  id v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  int v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id obj;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  _BYTE v77[18];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "height");
    v5 = objc_msgSend(v3, "width");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    {
      v6 = v5;
      v7 = *(void **)(a1 + 56);
      if (v7)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        obj = *(id *)(v8 + 40);
        v9 = objc_msgSend(v7, "writeToURL:options:error:");
        objc_storeStrong((id *)(v8 + 40), obj);
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 64), "_writeDebugFileFromProxyMetadata:forAsset:", *(_QWORD *)(a1 + 72), v3);
          if (*(_BYTE *)(a1 + 112))
          {
            if (objc_msgSend(v3, "kindSubtype") == 2)
            {
              objc_msgSend(v3, "fileURLForFullsizeRenderVideo");
              v10 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "fileURLForOriginalVideoComplement");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = 0;
              v13 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v12, v10, &v72);
              v14 = v72;

              if ((v13 & 1) == 0)
              {
                PLDeferredProcessingGetLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v3, "fileURLForOriginalVideoComplement");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v75 = v16;
                  v76 = 2112;
                  *(_QWORD *)v77 = v10;
                  *(_WORD *)&v77[8] = 2112;
                  *(_QWORD *)&v77[10] = v14;
                  _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to copy video complement from %@ to %@ with error: %@", buf, 0x20u);

                }
              }

            }
            else
            {
              v10 = 0;
            }
            objc_msgSend(v3, "setDeferredProcessingNeeded:", 2);
            objc_msgSend(v3, "additionalAttributes");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setDeferredProcessingCandidateOptions:", 0);

            v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            v71 = 0;
            v40 = objc_msgSend(v3, "updateDeferredAdjustmentWithFullSizeRenderImageURL:videoURL:videoPosterURL:error:", v39, v10, 0, &v71);
            v41 = v71;
            if ((v40 & 1) == 0)
            {
              PLDeferredProcessingGetLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                v43 = *(void **)(a1 + 48);
                *(_DWORD *)buf = 138543618;
                v75 = v43;
                v76 = 2112;
                *(_QWORD *)v77 = v41;
                _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Failed to update deferred adjustment (possibly non-fatal, finalizer will continue as if success) for asset: %{public}@ error: %@", buf, 0x16u);
              }

            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;

LABEL_40:
LABEL_41:
            if (objc_msgSend(v3, "deferredProcessingNeeded"))
            {
              PLDeferredProcessingGetLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                v45 = *(void **)(a1 + 48);
                v46 = objc_msgSend(v3, "deferredProcessingNeeded");
                qos_class_self();
                PLShortStringFromQoSClass();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v75 = v45;
                v76 = 1024;
                *(_DWORD *)v77 = v46;
                *(_WORD *)&v77[4] = 2114;
                *(_QWORD *)&v77[6] = v47;
                _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "Scheduling asset: %{public}@ for deferred processing with value: %d QoS: %{public}@", buf, 0x1Cu);

              }
              objc_msgSend(v3, "photoLibrary");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "libraryServicesManager");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "backgroundJobService");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "photoLibrary");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "signalBackgroundProcessingNeededOnLibrary:", v51);

            }
            goto LABEL_45;
          }
          v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
          v70 = *(id *)(v36 + 40);
          v37 = objc_msgSend(v3, "installFinalImageAndRemoveDeferredFilesWithFinalImageURL:outError:", v35, &v70);
          objc_storeStrong((id *)(v36 + 40), v70);
          if (!v37)
          {
            v57 = objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
            PLDeferredProcessingGetLog();
            v58 = objc_claimAutoreleasedReturnValue();
            v10 = v58;
            if (v57)
            {
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                v59 = *(void **)(a1 + 48);
                v60 = *(_QWORD *)(a1 + 80);
                *(_DWORD *)buf = 138543618;
                v75 = v59;
                v76 = 2112;
                *(_QWORD *)v77 = v60;
                _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ has already had file written to %@, skipping copy", buf, 0x16u);
              }

              v61 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
              v62 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
              v69 = *(id *)(v62 + 40);
              v63 = objc_msgSend(v3, "installFinalImageAndRemoveDeferredFilesWithFinalImageURL:outError:", v61, &v69);
              objc_storeStrong((id *)(v62 + 40), v69);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v63;
              goto LABEL_41;
            }
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v64 = *(void **)(a1 + 48);
              v65 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
              *(_DWORD *)buf = 138543618;
              v75 = v64;
              v76 = 2112;
              *(_QWORD *)v77 = v65;
              _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to install image for asset: %{public}@, reason: %@", buf, 0x16u);
            }
            goto LABEL_40;
          }
          objc_msgSend(*(id *)(a1 + 64), "_transitionDeferredProcessingNeededToNextStateForAsset:originalHeight:originalWidth:", v3, v4, v6);
        }
        else
        {
          if (!objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)))
          {
            v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "copy");
            PLDeferredProcessingGetLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v3, "uuid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
              *(_DWORD *)buf = 138543618;
              v75 = v32;
              v76 = 2112;
              *(_QWORD *)v77 = v33;
              _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Failed to write out file data for deferred photo for asset: %{public}@, reason: %@", buf, 0x16u);

            }
            v34 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
            v67 = *(id *)(v34 + 40);
            objc_msgSend(v3, "promoteDeferredPreviewToFinalImageWithOutError:", &v67);
            objc_storeStrong((id *)(v34 + 40), v67);
            objc_msgSend(*(id *)(a1 + 64), "_createTTRForNonRecoverableError:assetDescription:asset:", v10, *(_QWORD *)(a1 + 48), v3);
            goto LABEL_40;
          }
          v26 = *(unsigned __int8 *)(a1 + 112);
          PLDeferredProcessingGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (!v26)
          {
            if (v28)
            {
              v52 = *(void **)(a1 + 48);
              v53 = *(_QWORD *)(a1 + 80);
              *(_DWORD *)buf = 138543618;
              v75 = v52;
              v76 = 2112;
              *(_QWORD *)v77 = v53;
              _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ has already had data written to %@, skipping copy", buf, 0x16u);
            }

            v54 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            v55 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
            v68 = *(id *)(v55 + 40);
            v56 = objc_msgSend(v3, "installFinalImageAndRemoveDeferredFilesWithFinalImageURL:outError:", v54, &v68);
            objc_storeStrong((id *)(v55 + 40), v68);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v56;
            objc_msgSend(*(id *)(a1 + 64), "_transitionDeferredProcessingNeededToNextStateForAsset:originalHeight:originalWidth:", v3, v4, v6);
            goto LABEL_41;
          }
          if (v28)
          {
            v29 = *(void **)(a1 + 48);
            v30 = *(_QWORD *)(a1 + 80);
            *(_DWORD *)buf = 138543618;
            v75 = v29;
            v76 = 2112;
            *(_QWORD *)v77 = v30;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Render for asset %{public}@ has already had data written to %@, skipping copy", buf, 0x16u);
          }

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
        goto LABEL_41;
      }
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    {
      PLDeferredProcessingGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v75 = v18;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "File data representation was nil for deferred photo for asset: %{public}@", buf, 0xCu);
      }

      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v66 = *(id *)(v19 + 40);
      v20 = objc_msgSend(v3, "promoteDeferredPreviewToFinalImageWithOutError:", &v66);
      objc_storeStrong((id *)(v19 + 40), v66);
      if ((v20 & 1) == 0)
      {
        PLDeferredProcessingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = *(void **)(a1 + 48);
          v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v75 = v22;
          v76 = 2112;
          *(_QWORD *)v77 = v23;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview for asset %{public}@, with error: %@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 64), "_createTTRForNonRecoverableError:assetDescription:asset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 48), v3);
    }
  }
  else
  {
    PLDeferredProcessingGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v75 = v25;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", buf, 0xCu);
    }

  }
LABEL_45:

}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_135(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  __CFString *v20;
  double v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 120) && !*(_BYTE *)(a1 + 121))
  {
    PLDeferredProcessingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Expecting second callback for asset: %{public}@, not calling completion handlers yet", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v3 = v2 - *(double *)(a1 + 112);
    PLDeferredProcessingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      qos_class_self();
      PLShortStringFromQoSClass();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v24 = v5;
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      v31 = 2048;
      v32 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Calling completion handlers for asset: %{public}@ deferredIdentifier: %{public}@, success: %{public}@, QoS: %{public}@, duration %.3fs", buf, 0x34u);

    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 40))
      v10 = CFSTR("Tail");
    else
      v10 = CFSTR("Head");
    v11 = v10;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_140;
    v15[3] = &unk_1E3670750;
    v12 = *(void **)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 56);
    v21 = v3;
    v18 = *(id *)(a1 + 72);
    v22 = *(_BYTE *)(a1 + 121);
    v19 = *(id *)(a1 + 80);
    v20 = v11;
    v13 = v11;
    objc_msgSend(v12, "performBlockAndWait:", v15);
    objc_msgSend(*(id *)(a1 + 48), "_callCompletionHandlersForPhotoProxy:success:error:", *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

  }
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_140(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(double *)(a1 + 72);
  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "qosToProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLSendAssetFinalizationAnalytics(v6, v4, v3, v5, *(void **)(a1 + 64), v2);

}

uint64_t __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_130(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlersForPhotoProxy:success:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a2);
}

+ (BOOL)errorIsRecoverable:(id)a3
{
  id v3;
  void *v4;
  int v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  BOOL v15;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D74498]);

  v6 = (_QWORD *)MEMORY[0x1E0CB3388];
  v7 = v3;
  if (v5)
  {
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8A2F8]);

  if (v10)
  {
    objc_msgSend(v7, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "code");
    v15 = v13 == -16825 || v13 >> 1 == 0x7FFFFFFFFFFFDF25;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
