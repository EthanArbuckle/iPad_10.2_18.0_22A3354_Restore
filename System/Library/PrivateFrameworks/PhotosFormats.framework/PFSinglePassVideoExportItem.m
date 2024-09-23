@implementation PFSinglePassVideoExportItem

- (PFSinglePassVideoExportItem)init
{
  PFSinglePassVideoExportItem *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *exportItemStateQueue;
  uint64_t v8;
  NSProgress *progress;
  id v10;
  uint64_t v11;
  PFVideoExportRangeCoordinator *availableRangeCoordinator;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PFSinglePassVideoExportItem;
  v2 = -[PFSinglePassVideoExportItem init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v2->_identifier, v4);
    v2->_state = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.pfvideoexport.state", v5);
    exportItemStateQueue = v2->_exportItemStateQueue;
    v2->_exportItemStateQueue = (OS_dispatch_queue *)v6;

    v2->_minimumChunkLength = 102400;
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v8;

    objc_initWeak(&location, v2);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __35__PFSinglePassVideoExportItem_init__block_invoke;
    v14[3] = &unk_1E45A4450;
    v10 = v4;
    v15 = v10;
    objc_copyWeak(&v16, &location);
    -[NSProgress setCancellationHandler:](v2->_progress, "setCancellationHandler:", v14);
    v11 = objc_opt_new();
    availableRangeCoordinator = v2->_availableRangeCoordinator;
    v2->_availableRangeCoordinator = (PFVideoExportRangeCoordinator *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)dealloc
{
  OpaqueVTCompressionSession *compressionSession;
  void *v4;
  NSURL *destinationFileURL;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  objc_super v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    CFRelease(compressionSession);
    self->_compressionSession = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldDeleteDestinationURLOnDeallocation)
  {
    destinationFileURL = self->_destinationFileURL;
    if (destinationFileURL)
    {
      -[NSURL path](destinationFileURL, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

      if (v7)
      {
        -[NSURL path](self->_destinationFileURL, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v9 = objc_msgSend(v4, "removeItemAtPath:error:", v8, &v13);
        v10 = v13;

        if ((v9 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[NSURL path](self->_destinationFileURL, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v15 = v11;
          v16 = 2112;
          v17 = v10;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to remove temp file %{public}@: %@", buf, 0x16u);

        }
      }
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)PFSinglePassVideoExportItem;
  -[PFSinglePassVideoExportItem dealloc](&v12, sel_dealloc);
}

- (BOOL)preflight
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AVAsset tracks](self->_inputAsset, "tracks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x1E0C8A808];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (self->_videoTrack
          || (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "mediaType"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v12 = objc_msgSend(v11, "isEqual:", v8),
              v11,
              !v12))
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          -[PFSinglePassVideoExportItem setVideoTrack:](self, "setVideoTrack:", v10);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[PFSinglePassVideoExportItem videoTrack](self, "videoTrack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v3, "count"))
      -[PFSinglePassVideoExportItem setAdditionalTracks:](self, "setAdditionalTracks:", v3);
    v14 = 1;
  }
  else
  {
    v14 = 4;
  }
  self->_state = v14;

  return v13 != 0;
}

- (void)setTargetOutputFileSize:(unint64_t)a3
{
  id v4;

  self->_targetOutputFileSize = a3;
  -[PFSinglePassVideoExportItem progress](self, "progress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalUnitCount:", a3);

}

- (BOOL)startConversionWithError:(id *)a3 outputAvailableHandler:(id)a4
{
  id v6;
  _BOOL4 v7;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = -[PFSinglePassVideoExportItem setupConversionWithError:](self, "setupConversionWithError:", a3);
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__PFSinglePassVideoExportItem_startConversionWithError_outputAvailableHandler___block_invoke;
    v9[3] = &unk_1E45A4478;
    v9[4] = self;
    v10 = v6;
    -[PFSinglePassVideoExportItem startReadingInputAssetWithOutputAvailableHandler:](self, "startReadingInputAssetWithOutputAvailableHandler:", v9);

  }
  return v7;
}

- (id)outputDataInRange:(_NSRange)a3 waitUntilAvailableWithTimeout:(unint64_t)a4 error:(id *)a5
{
  NSUInteger location;
  unint64_t state;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSUInteger length;
  unint64_t v17;
  void *v18;
  char v19;
  id v20;
  NSObject *exportItemStateQueue;
  void *v22;
  _QWORD block[8];
  id v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  const __CFString *v29;
  _QWORD v30[2];
  NSRange v31;

  location = a3.location;
  v30[1] = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state <= 4 && ((1 << state) & 0x13) != 0)
  {
    if (a5)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v29 = CFSTR("PFVideoExportErrorStateKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 1, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  length = a3.length;
  v17 = -[PFSinglePassVideoExportItem targetOutputFileSize](self, "targetOutputFileSize");
  if (length <= 0x500000 && location + length <= v17)
  {
    -[PFSinglePassVideoExportItem availableRangeCoordinator](self, "availableRangeCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v19 = objc_msgSend(v18, "waitForAvailabilityOfRange:timeout:error:", location, length, a4, &v24);
    v20 = v24;

    if ((v19 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v26 = __Block_byref_object_copy__10165;
      v27 = __Block_byref_object_dispose__10166;
      v28 = 0;
      exportItemStateQueue = self->_exportItemStateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__PFSinglePassVideoExportItem_outputDataInRange_waitUntilAvailableWithTimeout_error___block_invoke;
      block[3] = &unk_1E45A44A0;
      block[6] = location;
      block[7] = length;
      block[4] = self;
      block[5] = buf;
      dispatch_sync(exportItemStateQueue, block);
      v12 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v12 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v20);
    }

    return v12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31.location = location;
    v31.length = length;
    NSStringFromRange(v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = -[PFSinglePassVideoExportItem targetOutputFileSize](self, "targetOutputFileSize");
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid range %{public}@ requested, available length = %llu", buf, 0x16u);

    if (a5)
      goto LABEL_15;
LABEL_7:
    v12 = 0;
    return v12;
  }
  if (!a5)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 3, 0);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (BOOL)setupConversionWithError:(id *)a3
{
  PFSinglePassVideoExportItem *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  AVAsset *inputAsset;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const opaqueCMFormatDescription *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  PFSinglePassVideoExportItem *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  OSStatus v47;
  OSStatus v48;
  char v49;
  double v50;
  float v51;
  AVAsset *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  dispatch_group_t v61;
  OS_dispatch_group *inputReadingCompletionGroup;
  void *v63;
  AVAssetTrack *videoTrack;
  void *v65;
  PFSinglePassVideoExportItem *v66;
  void *v67;
  NSArray *additionalReaderTrackOutputs;
  id v69;
  AVAsset *v70;
  NSString *v72;
  AVAsset *v73;
  NSString *identifier;
  NSURL *destinationFileURL;
  void *v76;
  NSString *v77;
  AVAsset *v78;
  PFSinglePassVideoExportItem *v79;
  uint64_t v80;
  void *v81;
  NSString *v82;
  NSURL *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  PFSinglePassVideoExportItem *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  _QWORD v99[4];
  id v100;
  PFSinglePassVideoExportItem *v101;
  id v102;
  _OWORD v103[3];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  VTSessionRef v108[3];
  VTSessionRef session;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  _BYTE buf[24];
  uint64_t v116;
  __int16 v117;
  void *v118;
  _QWORD v119[2];
  _BYTE v120[128];
  uint64_t v121;
  _QWORD v122[4];

  v3 = self;
  v122[1] = *MEMORY[0x1E0C80C00];
  -[PFSinglePassVideoExportItem videoTrack](self, "videoTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalSize");
  v6 = v5;
  v8 = v7;

  inputAsset = v3->_inputAsset;
  v114 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", inputAsset, &v114);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v114;
  if (v10)
  {
    -[PFSinglePassVideoExportItem setAssetReader:](v3, "setAssetReader:", v10);
    -[PFSinglePassVideoExportItem videoTrack](v3, "videoTrack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formatDescriptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const opaqueCMFormatDescription *)objc_msgSend(v13, "firstObject");

    CMFormatDescriptionGetExtensions(v14);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("BitsPerComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 <= 8)
      v17 = 875704438;
    else
      v17 = 2016686640;
    v121 = *MEMORY[0x1E0CA9040];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0C8B000];
    -[PFSinglePassVideoExportItem videoTrack](v3, "videoTrack");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "assetReaderTrackOutputWithTrack:outputSettings:", v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PFSinglePassVideoExportItem setVideoReaderTrackOutput:](v3, "setVideoReaderTrackOutput:", v22);
    objc_msgSend(v22, "setAlwaysCopiesSampleData:", 0);
    objc_msgSend(v10, "addOutput:", v22);
    v92 = v22;
    objc_msgSend(v22, "setMaximizePowerEfficiency:", -[PFSinglePassVideoExportItem maximizePowerEfficiency](v3, "maximizePowerEfficiency"));
    v91 = v19;
    if (-[NSArray count](v3->_additionalTracks, "count"))
    {
      v89 = v11;
      v23 = v10;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFSinglePassVideoExportItem setAdditionalReaderTrackOutputs:](v3, "setAdditionalReaderTrackOutputs:", v24);
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v25 = v3->_additionalTracks;
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v111 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            if (!-[PFSinglePassVideoExportItem isAPACAudioTrack:](v3, "isAPACAudioTrack:", v30))
            {
              objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v30, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setAlwaysCopiesSampleData:", 0);
              objc_msgSend(v23, "addOutput:", v31);
              v119[0] = v31;
              v32 = v3;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v30, "isEnabled"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v119[1] = v33;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v34);

              v3 = v32;
              objc_msgSend(v31, "setMaximizePowerEfficiency:", -[PFSinglePassVideoExportItem maximizePowerEfficiency](v32, "maximizePowerEfficiency"));

            }
          }
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
        }
        while (v27);
      }

      v10 = v23;
      v11 = v89;
      v19 = v91;
    }
    if ((objc_msgSend(v10, "startReading") & 1) != 0)
    {
      v35 = (int)v6;
      v36 = (int)v8;
      v90 = v3;
      -[PFSinglePassVideoExportItem destinationFileURL](v3, "destinationFileURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        v38 = (void *)MEMORY[0x1E0C99E98];
        NSTemporaryDirectory();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0CB3940];
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFSinglePassVideoExportItem identifier](v90, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@-%@.mov"), v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "stringByAppendingPathComponent:", v43);
        v44 = v11;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "fileURLWithPath:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFSinglePassVideoExportItem setDestinationFileURL:](v90, "setDestinationFileURL:", v46);

        v11 = v44;
        v36 = (int)v8;

        v19 = v91;
        -[PFSinglePassVideoExportItem setShouldDeleteDestinationURLOnDeallocation:](v90, "setShouldDeleteDestinationURLOnDeallocation:", 1);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        identifier = v90->_identifier;
        destinationFileURL = v90->_destinationFileURL;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = identifier;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = destinationFileURL;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Setting up asset writer for %{public}@ with destination URL %@", buf, 0x16u);
      }
      session = 0;
      v47 = VTCompressionSessionCreate(0, (int)v6, v36, 0x61766331u, 0, 0, 0, 0, 0, (VTCompressionSessionRef *)&session);
      if (v47)
      {
        v48 = v47;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v48;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create compression session, result = %d", buf, 8u);
        }
        v90->_state = 4;
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 6, 0);
          v49 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v49 = 0;
        }
        v53 = v11;
      }
      else
      {
        v90->_compressionSession = (OpaqueVTCompressionSession *)session;
        -[AVAssetTrack nominalFrameRate](v90->_videoTrack, "nominalFrameRate");
        v51 = *(float *)&v50;
        v52 = v90->_inputAsset;
        if (v52)
          -[AVAsset duration](v52, "duration");
        else
          memset(v108, 0, sizeof(v108));
        *(float *)&v50 = v51;
        +[PFSinglePassVideoExportItemStatistics statisticsWithTargetPlaybackDuration:frameRate:targetOutputTotalBytes:](PFSinglePassVideoExportItemStatistics, "statisticsWithTargetPlaybackDuration:frameRate:targetOutputTotalBytes:", v108, v90->_targetOutputFileSize, v50);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFSinglePassVideoExportItem setStatistics:](v90, "setStatistics:");
        v54 = -[PFSinglePassVideoExportItem estimatedOutputBitRate](v90, "estimatedOutputBitRate");
        v90->_currentEncodingBitRate = v54;
        -[PFSinglePassVideoExportItem bitRateControllerForTargetEncodingBitRate:](v90, "bitRateControllerForTargetEncodingBitRate:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFSinglePassVideoExportItem setBitRateController:](v90, "setBitRateController:", v55);

        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CECEF0], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v90->_currentEncodingBitRate));
        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CECF48], (CFTypeRef)*MEMORY[0x1E0CA8D88]);
        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CED238], (CFTypeRef)*MEMORY[0x1E0CA8EB0]);
        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CED290], (CFTypeRef)*MEMORY[0x1E0CA8F18]);
        if (v51 > 30.0)
          -[PFSinglePassVideoExportItem configureDroppableFrameRateForCompressionSession:inputWidth:inputHeight:](v90, "configureDroppableFrameRateForCompressionSession:inputWidth:inputHeight:", session, v35, v36);
        VTCompressionSessionPrepareToEncodeFrames((VTCompressionSessionRef)session);
        v56 = (void *)MEMORY[0x1E0C8B018];
        -[PFSinglePassVideoExportItem destinationFileURL](v90, "destinationFileURL");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = *MEMORY[0x1E0C8A2E8];
        v107 = v11;
        objc_msgSend(v56, "assetWriterWithURL:fileType:error:", v57, v58, &v107);
        v59 = v11;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v107;

        if (v60)
        {
          -[PFSinglePassVideoExportItem setAssetWriter:](v90, "setAssetWriter:", v60);
          -[PFSinglePassVideoExportItem configureOutputMetadataForAssetWriter:](v90, "configureOutputMetadataForAssetWriter:", v60);
          objc_msgSend(v60, "setWritesSinglePassUsingPredeterminedFileSize:mediaDataSize:", -[PFSinglePassVideoExportItem targetOutputFileSize](v90, "targetOutputFileSize"), -[PFSinglePassVideoExportItem targetOutputMediaDataSize](v90, "targetOutputMediaDataSize"));
          v61 = dispatch_group_create();
          inputReadingCompletionGroup = v90->_inputReadingCompletionGroup;
          v90->_inputReadingCompletionGroup = (OS_dispatch_group *)v61;

          objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[PFSinglePassVideoExportItem setVideoWriterInput:](v90, "setVideoWriterInput:", v63);
          videoTrack = v90->_videoTrack;
          if (videoTrack)
          {
            -[AVAssetTrack preferredTransform](videoTrack, "preferredTransform");
          }
          else
          {
            v105 = 0u;
            v106 = 0u;
            v104 = 0u;
          }
          v103[0] = v104;
          v103[1] = v105;
          v103[2] = v106;
          objc_msgSend(v63, "setTransform:", v103);
          -[AVAssetTrack metadata](v90->_videoTrack, "metadata");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setMetadata:", v65);

          v66 = v90;
          objc_msgSend(v63, "setMaximizePowerEfficiency:", -[PFSinglePassVideoExportItem maximizePowerEfficiency](v90, "maximizePowerEfficiency"));
          objc_msgSend(v60, "addInput:", v63);
          dispatch_group_enter((dispatch_group_t)v90->_inputReadingCompletionGroup);
          if (v90->_additionalReaderTrackOutputs)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[PFSinglePassVideoExportItem setAdditionalWriterInputs:](v90, "setAdditionalWriterInputs:", v67);
            additionalReaderTrackOutputs = v90->_additionalReaderTrackOutputs;
            v99[0] = MEMORY[0x1E0C809B0];
            v99[1] = 3221225472;
            v99[2] = __56__PFSinglePassVideoExportItem_setupConversionWithError___block_invoke;
            v99[3] = &unk_1E45A44C8;
            v100 = v60;
            v101 = v90;
            v102 = v67;
            v69 = v67;
            -[NSArray enumerateObjectsUsingBlock:](additionalReaderTrackOutputs, "enumerateObjectsUsingBlock:", v99);

            v66 = v90;
          }
          v70 = v66->_inputAsset;
          if (v70)
          {
            -[AVAsset duration](v70, "duration");
          }
          else
          {
            v97 = 0uLL;
            v98 = 0;
          }
          v95 = v97;
          v96 = v98;
          objc_msgSend(v60, "setOverallDurationHint:", &v95);
          v49 = objc_msgSend(v60, "startWriting");
          if ((v49 & 1) != 0)
          {
            v66->_state = 2;
            *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
            *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            objc_msgSend(v60, "startSessionAtSourceTime:", buf);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              -[PFSinglePassVideoExportItem destinationFileURL](v66, "destinationFileURL");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v60, "status");
              objc_msgSend(v60, "error");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v84;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v85;
              *(_WORD *)&buf[22] = 2112;
              v116 = (uint64_t)v86;
              _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to start writing to %@: status: %ld, error: %@", buf, 0x20u);

              v66 = v90;
            }
            v66->_state = 4;
            if (a3)
            {
              objc_msgSend(v60, "error");
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

          v19 = v91;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v82 = v90->_identifier;
            v83 = v90->_destinationFileURL;
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v82;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            v116 = (uint64_t)v53;
            _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create writer for %{public}@ for output URL %@: %{public}@", buf, 0x20u);
          }
          v90->_state = 4;
          v49 = 0;
          if (a3)
            *a3 = objc_retainAutorelease(v53);
        }

      }
      v11 = v53;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v76 = v10;
        v77 = v3->_identifier;
        v78 = v3->_inputAsset;
        v79 = v3;
        v80 = objc_msgSend(v76, "status");
        objc_msgSend(v76, "error");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v77;
        v10 = v76;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v78;
        *(_WORD *)&buf[22] = 2048;
        v116 = v80;
        v3 = v79;
        v117 = 2114;
        v118 = v81;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to start reading from asset %{public}@ %@: status: %ld, error: %{public}@", buf, 0x2Au);

      }
      v3->_state = 4;
      if (a3)
      {
        objc_msgSend(v10, "error");
        v49 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = 0;
      }
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v72 = v3->_identifier;
      v73 = v3->_inputAsset;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v72;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v73;
      *(_WORD *)&buf[22] = 2114;
      v116 = (uint64_t)v11;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create asset reader for %{public}@ %@: %{public}@", buf, 0x20u);
    }
    v3->_state = 4;
    if (a3)
    {
      v11 = objc_retainAutorelease(v11);
      v49 = 0;
      *a3 = v11;
    }
    else
    {
      v49 = 0;
    }
  }

  return v49;
}

- (void)configureOutputMetadataForAssetWriter:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PFSinglePassVideoExportItem additionalMetadata](self, "additionalMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[AVAsset metadata](self->_inputAsset, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v4, "containsObject:", v18);

        if ((v19 & 1) == 0)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[PFSinglePassVideoExportItem additionalMetadata](self, "additionalMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v20);

  }
  objc_msgSend(v21, "setMetadata:", v11);

}

- (BOOL)isAPACAudioTrack:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  const opaqueCMFormatDescription *v7;
  FourCharCode MediaSubType;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "mediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8A7A0]);

  v9 = 0;
  if (v5)
  {
    objc_msgSend(v3, "formatDescriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "firstObject");

    MediaSubType = CMFormatDescriptionGetMediaSubType(v7);
    if (MediaSubType == 1634754915 || MediaSubType == 1902211171 || MediaSubType == 1667330147)
      v9 = 1;
  }

  return v9;
}

- (void)configureDroppableFrameRateForCompressionSession:(OpaqueVTCompressionSession *)a3 inputWidth:(int)a4 inputHeight:(int)a5
{
  OSStatus v8;
  OSStatus v9;
  const __CFString *v10;
  int v11;
  void *v12;
  id v13;
  OSStatus v14;
  CFDictionaryRef supportedPropertyDictionaryOut;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  OSStatus v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  supportedPropertyDictionaryOut = 0;
  v8 = VTSessionCopySupportedPropertyDictionary(a3, &supportedPropertyDictionaryOut);
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v9;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to query compression session for supported properties, status = %d", buf, 8u);
    }
  }
  else
  {
    v10 = (const __CFString *)*MEMORY[0x1E0CECF08];
    v11 = CFDictionaryContainsKey(supportedPropertyDictionaryOut, (const void *)*MEMORY[0x1E0CECF08]);
    CFRelease(supportedPropertyDictionaryOut);
    if (!v11)
      v10 = (const __CFString *)*MEMORY[0x1E0CECEF8];
    v12 = &unk_1E45CA838;
    if (a5 * a4 > 2073600)
      v12 = &unk_1E45CA820;
    v13 = v12;
    v14 = VTSessionSetProperty(a3, v10, v13);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v13;
      v20 = 1024;
      v21 = v14;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Configuring droppable frame rate: setting %{public}@ to %{public}@, status = %d", buf, 0x1Cu);
    }

  }
}

- (int64_t)estimatedOutputBitRate
{
  AVAsset *inputAsset;
  double v4;
  double v5;
  double v6;
  float v7;
  CMTime time;

  inputAsset = self->_inputAsset;
  if (inputAsset)
    -[AVAsset duration](inputAsset, "duration");
  else
    memset(&time, 0, sizeof(time));
  if (CMTimeGetSeconds(&time) >= 1.0)
    return -[PFSinglePassVideoExportItemStatistics targetEncodingBitRate](self->_statistics, "targetEncodingBitRate");
  -[AVAssetTrack naturalSize](self->_videoTrack, "naturalSize");
  v6 = v4 * v5 * 1.5;
  -[AVAssetTrack nominalFrameRate](self->_videoTrack, "nominalFrameRate");
  return (uint64_t)(v6 * v7 * 0.1);
}

- (void)startReadingInputAssetWithOutputAvailableHandler:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  AVAssetWriterInput *videoWriterInput;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSArray *additionalReaderTrackOutputs;
  NSObject *inputReadingCompletionGroup;
  id v17;
  void *v18;
  _QWORD block[5];
  id v20;
  _QWORD v21[5];
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[6];
  __int128 buf;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PFSinglePassVideoExportItem inputAsset](self, "inputAsset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Start reading input asset %@", (uint8_t *)&buf, 0xCu);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.pfvideoexport.conversion", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x2020000000;
  v37 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke;
  v34[3] = &unk_1E45A4B68;
  v34[4] = self;
  v34[5] = &buf;
  v9 = (void *)MEMORY[0x1A1B0CFA4](v34);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  videoWriterInput = self->_videoWriterInput;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_270;
  v23[3] = &unk_1E45A4518;
  v23[4] = self;
  v28 = v30;
  v11 = v9;
  v26 = v11;
  v12 = v4;
  v27 = v12;
  v13 = v7;
  v24 = v13;
  v29 = v32;
  v14 = v6;
  v25 = v14;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](videoWriterInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", v14, v23);
  additionalReaderTrackOutputs = self->_additionalReaderTrackOutputs;
  if (additionalReaderTrackOutputs)
  {
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_274;
    v21[3] = &unk_1E45A4568;
    v21[4] = self;
    v22 = v14;
    -[NSArray enumerateObjectsUsingBlock:](additionalReaderTrackOutputs, "enumerateObjectsUsingBlock:", v21);

  }
  inputReadingCompletionGroup = self->_inputReadingCompletionGroup;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_276;
  block[3] = &unk_1E45A4590;
  block[4] = self;
  v20 = v12;
  v17 = v12;
  dispatch_group_notify(inputReadingCompletionGroup, v14, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)processCompressedSampleBuffer:(opaqueCMSampleBuffer *)a3 presentationTimeStamp:(id *)a4
{
  int64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  PFProportionalIntegralController *bitRateController;
  uint64_t v16;
  int64_t v17;
  int64_t currentEncodingBitRate;
  double v19;
  double v20;
  double v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  CMTime v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[AVAssetWriterInput appendSampleBuffer:](self->_videoWriterInput, "appendSampleBuffer:");
  -[PFSinglePassVideoExportItemStatistics setProcessedOutputFrameCount:](self->_statistics, "setProcessedOutputFrameCount:", -[PFSinglePassVideoExportItemStatistics processedOutputFrameCount](self->_statistics, "processedOutputFrameCount")+ 1);
  -[PFSinglePassVideoExportItemStatistics setProcessedVideoSampleBytes:](self->_statistics, "setProcessedVideoSampleBytes:", -[PFSinglePassVideoExportItemStatistics processedVideoSampleBytes](self->_statistics, "processedVideoSampleBytes")+ CMSampleBufferGetTotalSampleSize(a3));
  v27 = *(CMTime *)a4;
  -[PFSinglePassVideoExportItemStatistics setLastProcessedInputFramePresentationTime:](self->_statistics, "setLastProcessedInputFramePresentationTime:", CMTimeGetSeconds(&v27));
  v7 = -[PFSinglePassVideoExportItemStatistics effectiveEncodingBitRate](self->_statistics, "effectiveEncodingBitRate");
  v8 = v7 - -[PFProportionalIntegralController setPoint](self->_bitRateController, "setPoint");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v19 = (double)-[PFSinglePassVideoExportItemStatistics effectiveEncodingBitRate](self->_statistics, "effectiveEncodingBitRate")/ 1000000.0;
    v20 = (double)self->_currentEncodingBitRate / 1000000.0;
    v21 = (double)-[PFSinglePassVideoExportItem estimatedOutputBitRate](self, "estimatedOutputBitRate") / 1000000.0;
    v22 = -[PFSinglePassVideoExportItemStatistics processedOutputFrameCount](self->_statistics, "processedOutputFrameCount");
    v23 = -[PFSinglePassVideoExportItemStatistics processedVideoSampleBytes](self->_statistics, "processedVideoSampleBytes");
    v24 = -[PFSinglePassVideoExportItemStatistics processedAdditionalSampleBytes](self->_statistics, "processedAdditionalSampleBytes")+ v23;
    v25 = -[PFSinglePassVideoExportItemStatistics processedVideoSampleBytes](self->_statistics, "processedVideoSampleBytes");
    v26 = -[PFSinglePassVideoExportItemStatistics processedAdditionalSampleBytes](self->_statistics, "processedAdditionalSampleBytes");
    LODWORD(v27.value) = 134219776;
    *(double *)((char *)&v27.value + 4) = v19;
    LOWORD(v27.flags) = 2048;
    *(double *)((char *)&v27.flags + 2) = v20;
    HIWORD(v27.epoch) = 2048;
    v28 = v21;
    v29 = 2048;
    v30 = (double)v8 / 1000000.0;
    v31 = 2048;
    v32 = v22;
    v33 = 2048;
    v34 = v24;
    v35 = 2048;
    v36 = v25;
    v37 = 2048;
    v38 = v26;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Effective/selected/target bit rate: %.2fmbit/s / %.2fmbit/s / %.2fmbit/s , error = %.2fmbit/s, output frame count = %ld, sample bytes = %lu, video bytes = %lu, additional bytes = %lu", (uint8_t *)&v27, 0x52u);
  }
  v9 = (float)-[PFSinglePassVideoExportItemStatistics processedOutputFrameCount](self->_statistics, "processedOutputFrameCount");
  -[PFSinglePassVideoExportItemStatistics frameRate](self->_statistics, "frameRate");
  v11 = (float)(v9 / v10);
  -[PFSinglePassVideoExportItem bitRateController](self, "bitRateController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithTimestamp:error:feedback:", v8, -[PFSinglePassVideoExportItemStatistics effectiveEncodingBitRate](self->_statistics, "effectiveEncodingBitRate"), v11);

  if (-[PFSinglePassVideoExportItemStatistics processedOutputFrameCount](self->_statistics, "processedOutputFrameCount") >= 11&& -[PFProportionalIntegralController outputReady](self->_bitRateController, "outputReady"))
  {
    v13 = -[PFProportionalIntegralController output](self->_bitRateController, "output");
    v14 = -[PFProportionalIntegralController setPoint](self->_bitRateController, "setPoint");
    bitRateController = self->_bitRateController;
    v16 = v13 >= v14
        ? -[PFProportionalIntegralController setPoint](bitRateController, "setPoint")
        : -[PFProportionalIntegralController output](bitRateController, "output");
    v17 = v16;
    currentEncodingBitRate = self->_currentEncodingBitRate;
    if (v16 != currentEncodingBitRate)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v27.value) = 134218240;
        *(double *)((char *)&v27.value + 4) = (double)currentEncodingBitRate / 1000000.0;
        LOWORD(v27.flags) = 2048;
        *(double *)((char *)&v27.flags + 2) = (double)v17 / 1000000.0;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Adjusting encoding bit rate from %.2fmbit/s to %.2fmbit/s", (uint8_t *)&v27, 0x16u);
      }
      self->_currentEncodingBitRate = v17;
      self->_needsCurrentEncodingBitRateUpdate = 1;
    }
  }
}

- (void)setupOutputFileSourceWithOutputAvailableHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSString *identifier;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD handler[5];
  id v24;
  id v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_state == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFSinglePassVideoExportItem destinationFileURL](self, "destinationFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3608];
      -[PFSinglePassVideoExportItem destinationFileURL](self, "destinationFileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v9, "fileHandleForReadingFromURL:error:", v10, &v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v25;

      if (v11)
      {
        -[PFSinglePassVideoExportItem setConversionOutputFileHandle:](self, "setConversionOutputFileHandle:", v11);
        self->_state = 3;
        v13 = dispatch_queue_create("com.apple.pfvideoexport.output-vnode-source", 0);
        -[PFSinglePassVideoExportItem conversionOutputFileHandle](self, "conversionOutputFileHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "fileDescriptor");
        v16 = dispatch_source_create(MEMORY[0x1E0C80DE8], v15, 4uLL, v13);

        v17 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke;
        handler[3] = &unk_1E45A4590;
        handler[4] = self;
        v18 = v4;
        v24 = v18;
        dispatch_source_set_event_handler(v16, handler);
        v21[0] = v17;
        v21[1] = 3221225472;
        v21[2] = __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke_2;
        v21[3] = &unk_1E45A4590;
        v21[4] = self;
        v22 = v18;
        dispatch_source_set_cancel_handler(v16, v21);
        -[PFSinglePassVideoExportItem setOutputFileSizeChangeSource:](self, "setOutputFileSizeChangeSource:", v16);
        dispatch_activate(v16);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          identifier = self->_identifier;
          -[NSURL path](self->_destinationFileURL, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = identifier;
          v28 = 2112;
          v29 = v20;
          v30 = 2114;
          v31 = v12;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to open output file handle for %{public}@ %@: %{public}@", buf, 0x20u);

        }
        -[PFSinglePassVideoExportItem _cancel](self, "_cancel");
      }

    }
  }

}

- (void)notifyDataAvailableToHandler:(id)a3 ignoreMinimumChunkLength:(BOOL)a4
{
  void (**v6)(id, uint64_t, unint64_t, unint64_t, _QWORD);
  NSObject *exportItemStateQueue;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = (void (**)(id, uint64_t, unint64_t, unint64_t, _QWORD))a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  exportItemStateQueue = self->_exportItemStateQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PFSinglePassVideoExportItem_notifyDataAvailableToHandler_ignoreMinimumChunkLength___block_invoke;
  v15[3] = &unk_1E45A4B68;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_sync(exportItemStateQueue, v15);
  v8 = v17[3];
  if (v8 != -[PFSinglePassVideoExportItem outputFileLastEndOffset](self, "outputFileLastEndOffset"))
  {
    v9 = v17[3];
    -[PFSinglePassVideoExportItem progress](self, "progress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompletedUnitCount:", v9);

    v11 = -[PFSinglePassVideoExportItem outputFileLastEndOffset](self, "outputFileLastEndOffset");
    v12 = v17[3];
    v13 = v12 - -[PFSinglePassVideoExportItem outputFileLastEndOffset](self, "outputFileLastEndOffset");
    if (a4 || v13 >= -[PFSinglePassVideoExportItem minimumChunkLength](self, "minimumChunkLength"))
    {
      -[PFSinglePassVideoExportItem setOutputFileLastEndOffset:](self, "setOutputFileLastEndOffset:", v17[3]);
      -[PFSinglePassVideoExportItem statistics](self, "statistics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addMeasurementForBytesDelivered:", v13);

      v6[2](v6, 2, v11, v13, 0);
    }
  }
  _Block_object_dispose(&v16, 8);

}

- (id)bitRateControllerForTargetEncodingBitRate:(int64_t)a3
{
  PFProportionalIntegralController *v3;

  v3 = -[PFProportionalIntegralController initWithSetPoint:]([PFProportionalIntegralController alloc], "initWithSetPoint:", (uint64_t)((double)a3 * 0.95));
  -[PFProportionalIntegralController setOutputMax:](v3, "setOutputMax:", -[PFProportionalIntegralController setPoint](v3, "setPoint"));
  -[PFProportionalIntegralController setOutputMin:](v3, "setOutputMin:", (uint64_t)((double)-[PFProportionalIntegralController setPoint](v3, "setPoint") * 0.6));
  -[PFProportionalIntegralController setIntegralErrorMin:](v3, "setIntegralErrorMin:", -2000000);
  -[PFProportionalIntegralController setIntegralErrorMax:](v3, "setIntegralErrorMax:", 2000000);
  -[PFProportionalIntegralController setProportionalGain:](v3, "setProportionalGain:", 0.045);
  -[PFProportionalIntegralController setIntegralGain:](v3, "setIntegralGain:", 0.002);
  return v3;
}

- (void)_cancel
{
  PFSinglePassVideoExportItem *v2;
  unint64_t state;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSArray *additionalReaderTrackOutputs;
  _QWORD v8[5];
  uint8_t buf[4];
  PFSinglePassVideoExportItem *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if ((state & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138543362;
      v10 = v2;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Export item %{public}@ cancellation requested", buf, 0xCu);
    }
    v2->_didCancel = 1;
    v2->_state = 4;
    objc_sync_exit(v2);

    -[PFSinglePassVideoExportItem assetWriter](v2, "assetWriter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelWriting");

    -[PFSinglePassVideoExportItem assetReader](v2, "assetReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelReading");

    dispatch_group_leave((dispatch_group_t)v2->_inputReadingCompletionGroup);
    additionalReaderTrackOutputs = v2->_additionalReaderTrackOutputs;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__PFSinglePassVideoExportItem__cancel__block_invoke;
    v8[3] = &unk_1E45A45B8;
    v8[4] = v2;
    -[NSArray enumerateObjectsUsingBlock:](additionalReaderTrackOutputs, "enumerateObjectsUsingBlock:", v8);
    -[PFVideoExportRangeCoordinator cancel](v2->_availableRangeCoordinator, "cancel");
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 138543618;
      v10 = v2;
      v11 = 2048;
      v12 = state;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring cancellation request of export item %{public}@ in state %ld", buf, 0x16u);
    }
    objc_sync_exit(v2);

  }
}

- (double)inputAssetDuration
{
  void *v2;
  void *v3;
  double Seconds;
  CMTime time;

  -[PFSinglePassVideoExportItem inputAsset](self, "inputAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)targetOutputFileSize
{
  return self->_targetOutputFileSize;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)additionalMetadata
{
  return self->_additionalMetadata;
}

- (void)setAdditionalMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)exportItemStateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExportItemStateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (AVAsset)inputAsset
{
  return (AVAsset *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInputAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (AVAssetTrack)videoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVideoTrack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)additionalTracks
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAdditionalTracks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSFileHandle)conversionOutputFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConversionOutputFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSURL)destinationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDestinationFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)shouldDeleteDestinationURLOnDeallocation
{
  return self->_shouldDeleteDestinationURLOnDeallocation;
}

- (void)setShouldDeleteDestinationURLOnDeallocation:(BOOL)a3
{
  self->_shouldDeleteDestinationURLOnDeallocation = a3;
}

- (unint64_t)outputFileLastEndOffset
{
  return self->_outputFileLastEndOffset;
}

- (void)setOutputFileLastEndOffset:(unint64_t)a3
{
  self->_outputFileLastEndOffset = a3;
}

- (int64_t)targetOutputMediaDataSize
{
  return self->_targetOutputMediaDataSize;
}

- (void)setTargetOutputMediaDataSize:(int64_t)a3
{
  self->_targetOutputMediaDataSize = a3;
}

- (PFSinglePassVideoExportItemStatistics)statistics
{
  return (PFSinglePassVideoExportItemStatistics *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStatistics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PFProportionalIntegralController)bitRateController
{
  return (PFProportionalIntegralController *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBitRateController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (AVAssetReader)assetReader
{
  return (AVAssetReader *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAssetReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (AVAssetReaderTrackOutput)videoReaderTrackOutput
{
  return (AVAssetReaderTrackOutput *)objc_getProperty(self, a2, 144, 1);
}

- (void)setVideoReaderTrackOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSArray)additionalReaderTrackOutputs
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAdditionalReaderTrackOutputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (AVAssetWriterInput)videoWriterInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 168, 1);
}

- (void)setVideoWriterInput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)additionalWriterInputs
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAdditionalWriterInputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (OS_dispatch_source)outputFileSizeChangeSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOutputFileSizeChangeSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (unint64_t)minimumChunkLength
{
  return self->_minimumChunkLength;
}

- (void)setMinimumChunkLength:(unint64_t)a3
{
  self->_minimumChunkLength = a3;
}

- (OS_dispatch_group)inputReadingCompletionGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 200, 1);
}

- (void)setInputReadingCompletionGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (PFVideoExportRangeCoordinator)availableRangeCoordinator
{
  return (PFVideoExportRangeCoordinator *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAvailableRangeCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (OpaqueVTCompressionSession)compressionSession
{
  return self->_compressionSession;
}

- (void)setCompressionSession:(OpaqueVTCompressionSession *)a3
{
  self->_compressionSession = a3;
}

- (int64_t)currentEncodingBitRate
{
  return self->_currentEncodingBitRate;
}

- (void)setCurrentEncodingBitRate:(int64_t)a3
{
  self->_currentEncodingBitRate = a3;
}

- (BOOL)needsCurrentEncodingBitRateUpdate
{
  return self->_needsCurrentEncodingBitRateUpdate;
}

- (void)setNeedsCurrentEncodingBitRateUpdate:(BOOL)a3
{
  self->_needsCurrentEncodingBitRateUpdate = a3;
}

- (BOOL)maximizePowerEfficiency
{
  return self->_maximizePowerEfficiency;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  self->_maximizePowerEfficiency = a3;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableRangeCoordinator, 0);
  objc_storeStrong((id *)&self->_inputReadingCompletionGroup, 0);
  objc_storeStrong((id *)&self->_outputFileSizeChangeSource, 0);
  objc_storeStrong((id *)&self->_additionalWriterInputs, 0);
  objc_storeStrong((id *)&self->_videoWriterInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_additionalReaderTrackOutputs, 0);
  objc_storeStrong((id *)&self->_videoReaderTrackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_bitRateController, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_destinationFileURL, 0);
  objc_storeStrong((id *)&self->_conversionOutputFileHandle, 0);
  objc_storeStrong((id *)&self->_additionalTracks, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
  objc_storeStrong((id *)&self->_inputAsset, 0);
  objc_storeStrong((id *)&self->_exportItemStateQueue, 0);
  objc_storeStrong((id *)&self->_additionalMetadata, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __38__PFSinglePassVideoExportItem__cancel__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 200));
}

void __85__PFSinglePassVideoExportItem_notifyDataAvailableToHandler_ignoreMinimumChunkLength___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "conversionOutputFileHandle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "seekToEndOfFile");

}

uint64_t __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDataAvailableToHandler:ignoreMinimumChunkLength:", *(_QWORD *)(a1 + 40), 0);
}

void __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "notifyDataAvailableToHandler:ignoreMinimumChunkLength:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*v2, "assetWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  v5 = *v2;
  objc_sync_enter(v5);
  if (*((_BYTE *)*v2 + 11))
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 16);
      objc_msgSend(*(id *)(v8 + 96), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v9;
      v29 = 2112;
      v30 = (uint64_t)v10;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Completion for %{public}@ %@, item was cancelled", buf, 0x16u);

    }
    objc_sync_exit(v5);

  }
  else
  {
    objc_sync_exit(v5);

    v11 = *(_QWORD *)(a1 + 32);
    if (v4 == 2)
    {
      *(_QWORD *)(v11 + 48) = 5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(v12 + 16);
        objc_msgSend(*(id *)(v12 + 96), "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v13;
        v29 = 2112;
        v30 = (uint64_t)v14;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Completion for %{public}@ %@", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      *(_QWORD *)(v11 + 48) = 4;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(v22 + 16);
        objc_msgSend(*(id *)(v22 + 160), "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v23;
        v29 = 2048;
        v30 = v4;
        v31 = 2114;
        v32 = v24;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsuccessful writer completion for %{public}@, status: %ld, error: %{public}@", buf, 0x20u);

      }
      if (v4 == 4)
        v15 = 5;
      else
        v15 = 0;
      objc_msgSend(*(id *)(a1 + 32), "assetWriter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "assetWriter", *MEMORY[0x1E0CB3388]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "error");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), v15, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 16);
      v9 = *(_QWORD *)(v7 + 64);
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "leave group - did finish already set, ID %{public}@ for %@", (uint8_t *)&v11, 0x16u);
    }
LABEL_4:
    objc_sync_exit(v2);

    return;
  }
  *(_BYTE *)(v3 + 24) = 1;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 11))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(v4 + 16);
      v6 = *(_QWORD *)(v4 + 64);
      v11 = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "leave group - item already in failed state, ID %{public}@ for %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_4;
  }
  objc_sync_exit(v2);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "inputAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "leave group %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "markAsFinished");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 200));
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_270(uint64_t a1)
{
  __int128 v2;
  const __CFString *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  __CVBuffer *ImageBuffer;
  uint64_t v12;
  OSStatus v13;
  OSStatus v14;
  void *v15;
  CMTimeValue v16;
  uint64_t v17;
  OpaqueVTCompressionSession *v18;
  OpaqueVTCompressionSession *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  CMTime duration;
  _QWORD outputHandler[4];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  opaqueCMSampleBuffer *v29;
  CMTime v30;
  CMTime v31;
  CMTime completeUntilPresentationTimeStamp;
  CMTime buf;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "isReadyForMoreMediaData"))
    return;
  v3 = (const __CFString *)*MEMORY[0x1E0CECEF0];
  v4 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v2 = 67109120;
  v22 = v2;
  while (1)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "setupOutputFileSourceWithOutputAvailableHandler:", *(_QWORD *)(a1 + 64));
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "firstObject");
      memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
      objc_msgSend(v5, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        objc_msgSend(v7, "CMTimeValue");
      else
        memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));

      v15 = *(void **)(a1 + 32);
      v31 = completeUntilPresentationTimeStamp;
      objc_msgSend(v15, "processCompressedSampleBuffer:presentationTimeStamp:", v6, &v31);
      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) && !objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        return;
      }

      goto LABEL_19;
    }
    v9 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copyNextSampleBuffer");
    if (!v9)
      break;
    v10 = v9;
    memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
    CMSampleBufferGetPresentationTimeStamp(&completeUntilPresentationTimeStamp, v9);
    memset(&v31, 0, sizeof(v31));
    CMSampleBufferGetDuration(&v31, v10);
    ImageBuffer = CMSampleBufferGetImageBuffer(v10);
    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v12 + 9))
      goto LABEL_26;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(v12 + 224);
      LODWORD(buf.value) = 134217984;
      *(CMTimeValue *)((char *)&buf.value + 4) = v16;
      _os_log_debug_impl(&dword_1A16EE000, v4, OS_LOG_TYPE_DEBUG, "Bit rate update to %ld", (uint8_t *)&buf, 0xCu);
      v12 = *(_QWORD *)(a1 + 32);
    }
    v13 = VTSessionSetProperty(*(VTSessionRef *)(v12 + 216), v3, (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v12 + 224), v22));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
    if (!v13)
    {
      v12 = *(_QWORD *)(a1 + 32);
LABEL_26:
      v19 = *(OpaqueVTCompressionSession **)(v12 + 216);
      outputHandler[0] = MEMORY[0x1E0C809B0];
      outputHandler[1] = 3221225472;
      outputHandler[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_271;
      outputHandler[3] = &unk_1E45A44F0;
      v29 = v10;
      v30 = completeUntilPresentationTimeStamp;
      v25 = *(id *)(a1 + 48);
      v20 = *(id *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 32);
      v26 = v20;
      v27 = v21;
      v28 = *(_QWORD *)(a1 + 72);
      buf = completeUntilPresentationTimeStamp;
      duration = v31;
      VTCompressionSessionEncodeFrameWithOutputHandler(v19, ImageBuffer, &buf, &duration, 0, 0, outputHandler);

      return;
    }
    v14 = v13;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      buf.value = __PAIR64__(v14, v22);
      _os_log_error_impl(&dword_1A16EE000, v4, OS_LOG_TYPE_ERROR, "Unable to adjust bit rate, status = %d", (uint8_t *)&buf, 8u);
    }
    CFRelease(v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
LABEL_19:
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "isReadyForMoreMediaData", v22) & 1) == 0)
      return;
  }
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (!*(_BYTE *)(v17 + 24))
  {
    *(_BYTE *)(v17 + 24) = 1;
    v18 = *(OpaqueVTCompressionSession **)(*(_QWORD *)(a1 + 32) + 216);
    completeUntilPresentationTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
    VTCompressionSessionCompleteFrames(v18, &completeUntilPresentationTimeStamp);
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_274(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v8 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_275;
  v12[3] = &unk_1E45A4540;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v10;
  v11 = v6;
  v15 = v11;
  v16 = v17;
  objc_msgSend(v9, "requestMediaDataWhenReadyOnQueue:usingBlock:", v8, v12);

  _Block_object_dispose(v17, 8);
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_276(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_277;
  v8 = &unk_1E45A4590;
  v2 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v3 = (void (**)(_QWORD))MEMORY[0x1A1B0CFA4](&v5);
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v3[2](v3);
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    objc_msgSend(*(id *)(a1 + 32), "assetWriter", v5, v6, v7, v8, v9);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWritingWithCompletionHandler:", v3);
  }

}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_277(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 216));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  objc_msgSend(*(id *)(a1 + 32), "outputFileSizeChangeSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "outputFileSizeChangeSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_275(uint64_t a1)
{
  id v2;
  uint64_t v3;
  opaqueCMSampleBuffer *v4;
  opaqueCMSampleBuffer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
  {
    while (1)
    {
      v2 = *(id *)(a1 + 40);
      objc_sync_enter(v2);
      v3 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v3 + 11))
        break;
      objc_sync_exit(v2);

      v4 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(a1 + 48), "copyNextSampleBuffer");
      if (!v4)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (!*(_BYTE *)(v8 + 24))
        {
          *(_BYTE *)(v8 + 24) = 1;
          objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
          dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 200));
        }
        return;
      }
      v5 = v4;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setProcessedAdditionalSampleBytes:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "processedAdditionalSampleBytes")+ CMSampleBufferGetTotalSampleSize(v4));
      objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v5);
      CFRelease(v5);
      if ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData") & 1) == 0)
        return;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 64);
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "additional track processing - item was cancelled, ID %{public}@ for %@", (uint8_t *)&v9, 0x16u);
    }
    objc_sync_exit(v2);

  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_271(uint64_t a1, CMTimeFlags a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  Float64 Seconds;
  CMTimeValue v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CMTime time;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16);
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = v12;
      LOWORD(time.flags) = 1024;
      *(CMTimeFlags *)((char *)&time.flags + 2) = a2;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to encode frame for %{public}@, status = %d", (uint8_t *)&time, 0x12u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (a4)
  {
    v17[0] = a4;
    time = *(CMTime *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &time);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2;
    v13[3] = &unk_1E45A4B40;
    v9 = *(NSObject **)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = v8;
    v10 = v8;
    dispatch_async(v9, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    time = *(CMTime *)(a1 + 72);
    Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 134217984;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Frame drop at presentation time %f", (uint8_t *)&time, 0xCu);
  }
}

uint64_t __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __56__PFSinglePassVideoExportItem_setupConversionWithError___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  v6 = (void *)MEMORY[0x1E0C8B020];
  objc_msgSend(v9, "mediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetWriterInputWithMediaType:outputSettings:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMarksOutputTrackAsEnabled:", v5);
  objc_msgSend(a1[4], "addInput:", v8);
  objc_msgSend(v8, "setMaximizePowerEfficiency:", objc_msgSend(a1[5], "maximizePowerEfficiency"));
  objc_msgSend(a1[6], "addObject:", v8);
  dispatch_group_enter(*((dispatch_group_t *)a1[5] + 25));

}

void __85__PFSinglePassVideoExportItem_outputDataInRange_waitUntilAvailableWithTimeout_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "conversionOutputFileHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seekToFileOffset:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "readDataOfLength:", *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __79__PFSinglePassVideoExportItem_startConversionWithError_outputAvailableHandler___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, void *a5)
{
  id v9;
  NSRange v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  NSRange v27;
  NSRange v28;
  NSRange v29;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a2 == (void *)3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v20 = 138543362;
    v21 = v12;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Finished converting asset %{public}@";
    v15 = 12;
LABEL_13:
    _os_log_debug_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v20, v15);
    goto LABEL_9;
  }
  if (a2 != (void *)2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v20 = 138543874;
    v21 = v19;
    v22 = 2048;
    v23 = a2;
    v24 = 2112;
    v25 = v9;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Error reading converting video %{public}@, status = %ld, error = %@";
    v15 = 32;
    goto LABEL_13;
  }
  v27.location = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "availableRange");
  v29.location = a3;
  v29.length = a4;
  v10 = NSUnionRange(v27, v29);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v28.location = a3;
    v28.length = a4;
    NSStringFromRange(v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromRange(v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v17;
    v22 = 2114;
    v23 = v18;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "New data range available: %{public}@, setting available total range to %{public}@", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "availableRangeCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateAvailableRange:", v10.location, v10.length);

LABEL_9:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, void *, NSUInteger, NSUInteger, id))(v16 + 16))(v16, a2, a3, a4, v9);

}

void __35__PFSinglePassVideoExportItem_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFSinglePassVideoExportItem item %{public}@ cancelled", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cancel");

}

@end
