@implementation PLPTPdFormatConversionManager

- (PLPTPdFormatConversionManager)init
{
  PLPTPdFormatConversionManager *v2;
  void *v3;
  void *v4;
  NSURL *temporaryDirectoryURL;
  void *v6;
  uint64_t v7;
  PFMediaCapabilities *legacyCapabilities;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLPTPdFormatConversionManager;
  v2 = -[PLPTPdFormatConversionManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPTPdFormatConversionManager setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:](v2, "setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:", v3);

    v4 = (void *)objc_opt_new();
    -[PLPTPdFormatConversionManager setMediaFormatConversionManager:](v2, "setMediaFormatConversionManager:", v4);

    if (-[PLPTPdFormatConversionManager setupTemporaryDirectory](v2, "setupTemporaryDirectory"))
    {
      temporaryDirectoryURL = v2->_temporaryDirectoryURL;
      -[PLPTPdFormatConversionManager mediaFormatConversionManager](v2, "mediaFormatConversionManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDirectoryForTemporaryFiles:", temporaryDirectoryURL);

      -[PLPTPdFormatConversionManager setInitialized:](v2, "setInitialized:", 1);
    }
    objc_msgSend(MEMORY[0x1E0D75128], "legacyCapabilities");
    v7 = objc_claimAutoreleasedReturnValue();
    legacyCapabilities = v2->_legacyCapabilities;
    v2->_legacyCapabilities = (PFMediaCapabilities *)v7;

  }
  return v2;
}

- (BOOL)setupTemporaryDirectory
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  unsigned __int8 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%d"), v5, getpid());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPTPdFormatConversionManager setTemporaryDirectoryURL:](self, "setTemporaryDirectoryURL:", v9);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v12, &v29);

  if (v13)
  {
    v14 = v29;
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      v17 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Conversion manager temporary directory path already exists: %@", buf, 0xCu);

      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Conversion manager temporary directory path exists but is not directory %@", buf, 0xCu);

    }
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v20 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v28);
  v16 = v28;

  PLPTPGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v25;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unable to create conversion manager temporary directory %@: %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Created conversion manager temporary directory %@", buf, 0xCu);

  }
  v17 = 1;
LABEL_15:

  return v17;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PLPTPdFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to remove temporary directory %@: %{public}@", buf, 0x16u);

    }
  }

  v9.receiver = self;
  v9.super_class = (Class)PLPTPdFormatConversionManager;
  -[PLPTPdFormatConversionManager dealloc](&v9, sel_dealloc);
}

- (id)assetReaderForFormatConvertedPTPAsset:(id)a3 ofManagedAsset:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  PLPTPConversionDestinationAssetReader *v31;
  void *v32;
  NSObject *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  dispatch_block_t v50;
  void *v51;
  PLPTPConversionDestinationAssetReader *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  _QWORD block[4];
  NSObject *v62;
  id v63;
  uint8_t buf[4];
  NSObject *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (-[PLPTPdFormatConversionManager initialized](self, "initialized"))
  {
    v12 = v10;
    objc_msgSend(v9, "assetHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");
    v15 = -[NSObject isVideo](v12, "isVideo");
    -[NSObject mediaGroupUUID](v12, "mediaGroupUUID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject originalWidth](v12, "originalWidth");
    v60 = v11;
    v18 = (double)v17;
    v19 = (double)-[NSObject originalHeight](v12, "originalHeight");
    v20 = v15;
    v59 = v14;
    switch(v14)
    {
      case 0:
        goto LABEL_21;
      case 3:
        goto LABEL_15;
      case 4:
        -[NSObject pathForOriginalFile](v12, "pathForOriginalFile");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPTPdFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v21, 0, v16, (double)v17, v19);
        v22 = objc_claimAutoreleasedReturnValue();

        v23 = (double)-[NSObject width](v12, "width");
        v24 = (double)-[NSObject height](v12, "height");
        objc_msgSend(v9, "filename");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPTPdFormatConversionManager requestForRenderImagePath:imageDimensions:outputFilename:](self, "requestForRenderImagePath:imageDimensions:outputFilename:", v11, v25, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)v22;
        v63 = 0;
        objc_msgSend(MEMORY[0x1E0D47C38], "chainedRequestForAdjustmentRenderRequest:dependingOnRequest:error:", v26, v22, &v63);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v63;
        if (!v28)
        {
          v58 = v29;
          PLPTPGetLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v65 = v11;
            v66 = 2114;
            v67 = (uint64_t)v58;
            _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
          }

          v29 = v58;
        }

        goto LABEL_17;
      case 5:
        objc_msgSend(v9, "filename");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPTPdFormatConversionManager requestForRenderVideoPath:outputFilename:](self, "requestForRenderVideoPath:outputFilename:", v11, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        if (!v28)
          goto LABEL_29;
        goto LABEL_24;
      case 6:
        -[NSObject spatialOverCaptureSize](v12, "spatialOverCaptureSize");
        v18 = v36;
        v19 = v37;
        -[NSObject ptpAdditionalAttributes](v12, "ptpAdditionalAttributes");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "spatialOverCaptureInformation");
        v39 = (void *)v16;
        v40 = v13;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "spatialOverCaptureLivePhotoPairingIdentifier");
        v42 = objc_claimAutoreleasedReturnValue();

        v11 = v60;
        v13 = v40;

        v16 = v42;
        v20 = v15;
        goto LABEL_21;
      case 7:
        -[NSObject spatialOverCaptureSize](v12, "spatialOverCaptureSize");
        v18 = v34;
        v19 = v35;
LABEL_15:
        v20 = 1;
        goto LABEL_21;
      case 8:
        -[NSObject videoComplementSpatialOverCaptureSize](v12, "videoComplementSpatialOverCaptureSize");
        v18 = v43;
        v19 = v44;
        -[NSObject ptpAdditionalAttributes](v12, "ptpAdditionalAttributes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "spatialOverCaptureInformation");
        v46 = (void *)v16;
        v47 = v13;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "spatialOverCaptureLivePhotoPairingIdentifier");
        v49 = objc_claimAutoreleasedReturnValue();

        v11 = v60;
        v13 = v47;

        v20 = 1;
        v16 = v49;
LABEL_21:
        -[PLPTPdFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v11, v20, v16, v18, v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "requiresConversion"))
        {
          objc_msgSend(v28, "setForceFormatConversion:", 1);
          if (!(_DWORD)v15)
          {
LABEL_23:
            if (v28)
              goto LABEL_24;
            goto LABEL_29;
          }
        }
        else if (!(_DWORD)v15)
        {
          goto LABEL_23;
        }
        -[PLPTPdFormatConversionManager mediaFormatConversionManager](self, "mediaFormatConversionManager");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "preflightConversionRequest:", v28);

        objc_msgSend(v28, "enableSinglePassVideoEncodingWithUpdateHandler:", &__block_literal_global_43453);
        if (v28)
        {
LABEL_24:
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __91__PLPTPdFormatConversionManager_assetReaderForFormatConvertedPTPAsset_ofManagedAsset_path___block_invoke_54;
          block[3] = &unk_1E3677AA0;
          v33 = v28;
          v62 = v33;
          v50 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          -[PLPTPdFormatConversionManager mediaFormatConversionManager](self, "mediaFormatConversionManager");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "enqueueConversionRequest:completionHandler:", v33, v50);

          if ((-[NSObject requiresSinglePassVideoConversion](v33, "requiresSinglePassVideoConversion") & 1) != 0
            || (dispatch_block_wait(v50, 0xFFFFFFFFFFFFFFFFLL), -[NSObject status](v33, "status") == 4))
          {
            v32 = (void *)v16;
            v52 = [PLPTPConversionDestinationAssetReader alloc];
            -[NSObject destination](v33, "destination");
            v53 = objc_claimAutoreleasedReturnValue();
            v31 = -[PLPTPConversionDestinationAssetReader initWithDestination:](v52, "initWithDestination:", v53);
          }
          else
          {
            v32 = (void *)v16;
            PLPTPGetLog();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              -[NSObject error](v33, "error");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v65 = v33;
              v66 = 2048;
              v67 = v59;
              v68 = 2114;
              v69 = v55;
              _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "Conversion request %{public}@ for asset type %ld failed: %{public}@", buf, 0x20u);

            }
            v31 = 0;
          }

LABEL_34:
LABEL_35:

          v11 = v60;
          goto LABEL_36;
        }
LABEL_29:
        v32 = (void *)v16;
        v31 = 0;
        goto LABEL_35;
      default:
        v32 = (void *)v16;
        PLPTPGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v65 = 0;
          v66 = 2048;
          v67 = v14;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Ignoring conversion request %{public}@ for unknown asset type %ld", buf, 0x16u);
        }
        v31 = 0;
        goto LABEL_34;
    }
  }
  PLPTPGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v30 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v65 = v30;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Ignoring request %{public}@ to conversion manager in failed state", buf, 0xCu);

  }
  v31 = 0;
LABEL_36:

  return v31;
}

- (id)requestForOriginalAtPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5 originalPairingIdentifier:(id)a6
{
  double height;
  double width;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v11 = a6;
  -[PLPTPdFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, v8, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
    {
      -[PLPTPdFormatConversionManager convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:](self, "convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLivePhotoPairingIdentifier:", v13);
      objc_msgSend(v12, "setLivePhotoPairingIdentifierBehavior:", 4);

    }
    objc_msgSend(v12, "setShouldPadOutputFileToEstimatedLength:", 1);
  }

  return v12;
}

- (id)requestForRenderImagePath:(id)a3 imageDimensions:(CGSize)a4 outputFilename:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  -[PLPTPdFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 0, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setOutputFilename:", v9);
    objc_msgSend(v11, "setLivePhotoPairingIdentifierBehavior:", 1);
    objc_msgSend(v11, "setShouldPadOutputFileToEstimatedLength:", 1);
  }

  return v11;
}

- (id)requestForRenderVideoPath:(id)a3 outputFilename:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PLPTPdFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setOutputFilename:", v6);
    objc_msgSend(v8, "setLivePhotoPairingIdentifierBehavior:", 1);
    objc_msgSend(v8, "setShouldPadOutputFileToEstimatedLength:", 1);
  }

  return v8;
}

- (id)requestForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height;
  double width;
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[PLPTPdFormatConversionManager sourceForPath:isVideo:imageDimensions:](self, "sourceForPath:isVideo:imageDimensions:", v9, v7, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D47C48];
  -[PLPTPdFormatConversionManager effectivePeerMediaCapabilites](self, "effectivePeerMediaCapabilites");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "requestForSource:destinationCapabilities:error:", v10, v12, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (!v13)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
    }

  }
  return v13;
}

- (id)sourceForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height;
  double width;
  _BOOL4 v7;
  void *v8;
  void *v9;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0D47C50], "videoSourceForFileURL:", v8);
  else
    objc_msgSend(MEMORY[0x1E0D47C50], "imageSourceForFileURL:dimensions:", v8, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPTPdFormatConversionManager convertedLivePhotoPairingIdentifiersByOriginalIdentifiers](self, "convertedLivePhotoPairingIdentifiersByOriginalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLPTPdFormatConversionManager convertedLivePhotoPairingIdentifiersByOriginalIdentifiers](self, "convertedLivePhotoPairingIdentifiersByOriginalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);

    PLPTPGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Cached converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
    }

  }
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Using converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  height = a5.height;
  width = a5.width;
  v10 = (void *)MEMORY[0x1E0D47C10];
  v11 = (void *)*MEMORY[0x1E0CEC530];
  v12 = a3;
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "generatePosterFrameExportForVideoURL:outputData:maximumSize:outputFileType:error:", v12, a4, v13, a6, width, height);

  return (char)a6;
}

- (void)invalidate
{
  id v2;

  -[PLPTPdFormatConversionManager mediaFormatConversionManager](self, "mediaFormatConversionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)peerSupportsTranscodeChoice
{
  return -[PFMediaCapabilities supportsTranscodeChoice](self->_peerMediaCapabilities, "supportsTranscodeChoice");
}

- (BOOL)peerSupportsAdjustmentBaseResources
{
  return -[PFMediaCapabilities supportForAdjustmentBaseResources](self->_peerMediaCapabilities, "supportForAdjustmentBaseResources") == 1;
}

- (BOOL)penultimateIsPublic
{
  return 0;
}

- (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  PFMediaCapabilities *v13;
  PFMediaCapabilities *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v13 = self->_legacyCapabilities;
  }
  else
  {
    -[PLPTPdFormatConversionManager effectivePeerMediaCapabilites](self, "effectivePeerMediaCapabilites");
    v13 = (PFMediaCapabilities *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  +[PLPTPConversionHelper conversionResultForAsset:sourceHints:withConversionManager:peerCapabilities:](PLPTPConversionHelper, "conversionResultForAsset:sourceHints:withConversionManager:peerCapabilities:", v10, v11, self->_mediaFormatConversionManager, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "assetHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v18;
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Media conversion result for asset %{public}@ (%{public}@): %{public}@", (uint8_t *)&v20, 0x20u);

  }
  return v15;
}

- (id)effectivePeerMediaCapabilites
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[PLPTPdFormatConversionManager peerSupportsTranscodeChoice](self, "peerSupportsTranscodeChoice");
  v4 = 24;
  if (v3)
    v4 = 8;
  return *(id *)((char *)&self->super.isa + v4);
}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return (PFMediaCapabilities *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerMediaCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PHMediaFormatConversionManager)mediaFormatConversionManager
{
  return (PHMediaFormatConversionManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMediaFormatConversionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURL)temporaryDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)convertedLivePhotoPairingIdentifiersByOriginalIdentifiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedLivePhotoPairingIdentifiersByOriginalIdentifiers, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionManager, 0);
  objc_storeStrong((id *)&self->_peerMediaCapabilities, 0);
  objc_storeStrong((id *)&self->_legacyCapabilities, 0);
}

void __91__PLPTPdFormatConversionManager_assetReaderForFormatConvertedPTPAsset_ofManagedAsset_path___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218242;
    v9 = a2;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Single pass video conversion update, status: %ld, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

@end
