@implementation PLPTPAssetBuilder

- (PLPTPAssetBuilder)initWithAsset:(id)a3 conversionSupport:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PLPTPAssetBuilder *v10;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLPTPAssetBuilder initWithAsset:conversionSupport:fileManager:](self, "initWithAsset:conversionSupport:fileManager:", v8, v7, v9);

  return v10;
}

- (PLPTPAssetBuilder)initWithAsset:(id)a3 conversionSupport:(id)a4 fileManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLPTPAssetBuilder *v12;
  PLPTPAssetBuilder *v13;
  NSMutableArray *v14;
  NSMutableArray *convertedAssets;
  PLPTPAssetBuilder *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PLPTPAssetBuilder;
  v12 = -[PLPTPAssetBuilder init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_asset, a3);
    objc_storeStrong((id *)&v13->_conversionSupport, a4);
    objc_storeStrong((id *)&v13->_fileManager, a5);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    convertedAssets = v13->_convertedAssets;
    v13->_convertedAssets = v14;

    v16 = v13;
  }

  return v13;
}

- (id)pictureTransferProtocolAssets
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[PLPTPAssetBuilder _suppressPtpInfo](self, "_suppressPtpInfo"))
    return MEMORY[0x1E0C9AA60];
  -[PLPTPAssetBuilder _buildCommonAsset](self, "_buildCommonAsset");
  if (!-[PLPTPAssetBuilder _buildOriginalAsset](self, "_buildOriginalAsset"))
    return MEMORY[0x1E0C9AA60];
  -[PLPTPAssetBuilder _buildSidecarAssets](self, "_buildSidecarAssets");
  -[PLPTPAssetBuilder _updateOriginalAssetFormatConversionFromVideoComplement](self, "_updateOriginalAssetFormatConversionFromVideoComplement");
  -[PLPTPAssetBuilder _buildDiagnosticAsset](self, "_buildDiagnosticAsset");
  -[PLPTPAssetBuilder _buildAdjustmentAsset](self, "_buildAdjustmentAsset");
  -[PLPTPAssetBuilder _buildSecondaryAdjustmentDataAsset](self, "_buildSecondaryAdjustmentDataAsset");
  -[PLPTPAssetBuilder _buildFullSizeRenderImageAsset](self, "_buildFullSizeRenderImageAsset");
  -[PLPTPAssetBuilder _buildFullSizeRenderVideoAsset](self, "_buildFullSizeRenderVideoAsset");
  -[PLPTPAssetBuilder buildSpatialOverCaptureContentPtpAsset](self, "buildSpatialOverCaptureContentPtpAsset");
  -[PLPTPAssetBuilder buildSpatialOverCaptureVideoComplementPtpAsset](self, "buildSpatialOverCaptureVideoComplementPtpAsset");
  if (-[PLPTPConversionSupport peerSupportsAdjustmentBaseResources](self->_conversionSupport, "peerSupportsAdjustmentBaseResources")&& -[PLPTPConversionSupport penultimateIsPublic](self->_conversionSupport, "penultimateIsPublic"))
  {
    -[PLPTPAssetBuilder buildPenultimateImagePtpAsset](self, "buildPenultimateImagePtpAsset");
    -[PLPTPAssetBuilder buildPenultimateVideoPtpAsset](self, "buildPenultimateVideoPtpAsset");
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_originalPtpAsset);
  objc_msgSend(v3, "addObjectsFromArray:", self->_sidecarPtpAssets);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_diagnosticPtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_adjustmentPtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_secondaryAdjustmentDataPtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_fullSizeRenderImagePtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_fullSizeRenderVideoPtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_spatialOverCaptureImagePtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_spatialOverCaptureVideoComplementPtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_originalAdjustmentPtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_penultimateImagePtpAsset);
  objc_msgSend(v3, "_pl_addNonNilObject:", self->_penultimateVideoPtpAsset);
  -[PLPTPAssetBuilder updateSiblingAssetTypesOnMutablePTPAssets:](self, "updateSiblingAssetTypesOnMutablePTPAssets:", v3);
  objc_msgSend(v3, "addObjectsFromArray:", self->_convertedAssets);
  PLPTPGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "_pl_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Built assets: %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v3, 1);

  return v6;
}

- (void)updateSiblingAssetTypesOnMutablePTPAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "assetHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(v18, "assetHandle", (_QWORD)v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "assetHandleBySettingSiblingAssetHandleTypes:", v4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAssetHandle:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

}

- (void)_buildCommonAsset
{
  PLMutablePTPAsset *v3;
  PLMutablePTPAsset *currentPtpAsset;
  PLMutablePTPAsset *v5;

  v3 = objc_alloc_init(PLMutablePTPAsset);
  currentPtpAsset = self->_currentPtpAsset;
  self->_currentPtpAsset = v3;

  -[PLPTPAssetBuilder _buildModificationAndCreationDate](self, "_buildModificationAndCreationDate");
  -[PLPTPAssetBuilder _buildIsHDR](self, "_buildIsHDR");
  objc_storeStrong((id *)&self->_commonPtpAsset, self->_currentPtpAsset);
  v5 = self->_currentPtpAsset;
  self->_currentPtpAsset = 0;

}

- (BOOL)_buildOriginalAsset
{
  PLMutablePTPAsset *v3;
  PLMutablePTPAsset *currentPtpAsset;
  BOOL v5;
  void *originalPtpAsset;
  PLMutablePTPAsset *v7;
  void *v10;

  if (self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 172, CFSTR("Unexpected non-nil current PTP asset"));

  }
  v3 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
  currentPtpAsset = self->_currentPtpAsset;
  self->_currentPtpAsset = v3;

  v5 = -[PLPTPAssetBuilder _buildDirectoryPathAndFilename](self, "_buildDirectoryPathAndFilename");
  if (v5)
  {
    -[PLPTPAssetBuilder _buildPhotoKey](self, "_buildPhotoKey");
    -[PLPTPAssetBuilder _buildExifAvailable](self, "_buildExifAvailable");
    -[PLPTPAssetBuilder _buildFileSize](self, "_buildFileSize");
    -[PLPTPAssetBuilder _buildFingerprint](self, "_buildFingerprint");
    -[PLPTPAssetBuilder _buildOriginatingAssetID](self, "_buildOriginatingAssetID");
    -[PLPTPAssetBuilder _buildThumbnailOffsetAndLength](self, "_buildThumbnailOffsetAndLength");
    -[PLPTPAssetBuilder _buildImageDimensions](self, "_buildImageDimensions");
    -[PLPTPAssetBuilder _buildThumbnailDimensions](self, "_buildThumbnailDimensions");
    -[PLPTPAssetBuilder _buildOrientation](self, "_buildOrientation");
    -[PLPTPAssetBuilder _durationOfTheAsset](self, "_durationOfTheAsset");
    -[PLPTPAssetBuilder _buildGPSInformation](self, "_buildGPSInformation");
    -[PLPTPAssetBuilder _buildGroupUUID](self, "_buildGroupUUID");
    -[PLPTPAssetBuilder _buildBurst](self, "_buildBurst");
    -[PLPTPAssetBuilder _buildSlowMo](self, "_buildSlowMo");
    -[PLPTPAssetBuilder _buildTimelapse](self, "_buildTimelapse");
    -[PLPTPAssetBuilder _buildRelatedUUID](self, "_buildRelatedUUID");
    -[PLPTPAssetBuilder _buildDeletedFlag](self, "_buildDeletedFlag");
    -[PLPTPAssetBuilder _buildSpatialOverCaptureGroupIdentifier](self, "_buildSpatialOverCaptureGroupIdentifier");
    -[PLPTPAssetBuilder _buildVideoCodec](self, "_buildVideoCodec");
    +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, -[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"), 0);
    originalPtpAsset = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPTPAssetBuilder updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:](self, "updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:", self->_currentPtpAsset, originalPtpAsset, 0, CFSTR("original"));
    objc_storeStrong((id *)&self->_originalPtpAsset, self->_currentPtpAsset);
    v7 = self->_currentPtpAsset;
    self->_currentPtpAsset = 0;

  }
  else
  {
    originalPtpAsset = self->_originalPtpAsset;
    self->_originalPtpAsset = 0;
  }

  return v5;
}

- (void)updateAssetForFormatConversion:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  void *v7;
  id v8;

  v8 = a3;
  -[PLPTPConversionSupport conversionResultForAsset:sourceHints:forceLegacyConversion:assetTypeLabel:](self->_conversionSupport, "conversionResultForAsset:sourceHints:forceLegacyConversion:assetTypeLabel:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[PLPTPConversionSupport peerSupportsTranscodeChoice](self->_conversionSupport, "peerSupportsTranscodeChoice"))-[PLPTPAssetBuilder _updateAssetForTranscodeChoice:withConversionResult:](self, "_updateAssetForTranscodeChoice:withConversionResult:", v8, v7);
    else
      -[PLPTPAssetBuilder _updateAsset:withConversionResult:](self, "_updateAsset:withConversionResult:", v8, v7);
  }

}

- (void)_updateAssetForTranscodeChoice:(id)a3 withConversionResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v22;

  v22 = a3;
  v6 = a4;
  objc_msgSend(v22, "setVideoCodec:", objc_msgSend(v6, "inputVideoCodec"));
  objc_msgSend(v6, "inputContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentType:", v7);

  if (objc_msgSend(v6, "requiresConversion"))
  {
    objc_msgSend(v22, "setConversionGroup:", 1);
    v8 = (void *)objc_msgSend(v22, "mutableCopy");
    objc_msgSend(v8, "setConversionGroup:", 2);
    objc_msgSend(v22, "assetHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetHandleBySettingRequiresConversion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssetHandle:", v10);

    objc_msgSend(v22, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_pl_stringByReplacingPathExtension:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilename:", v13);

    objc_msgSend(v22, "originalFilename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pl_stringByReplacingPathExtension:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOriginalFilename:", v16);

    objc_msgSend(v22, "createdFilename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCreatedFilename:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "estimatedFileLength"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObjectCompressedSize:", v20);

    objc_msgSend(v8, "setVideoCodec:", objc_msgSend(v6, "outputVideoCodec"));
    objc_msgSend(v6, "outputContentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentType:", v21);

    -[NSMutableArray addObject:](self->_convertedAssets, "addObject:", v8);
  }

}

- (void)_updateAsset:(id)a3 withConversionResult:(id)a4
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "outputVideoCodec"))
    objc_msgSend(v19, "setVideoCodec:", objc_msgSend(v5, "outputVideoCodec"));
  objc_msgSend(v5, "outputContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentType:", v6);

  if (objc_msgSend(v5, "requiresConversion"))
  {
    objc_msgSend(v19, "assetHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetHandleBySettingRequiresConversion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAssetHandle:", v8);

    objc_msgSend(v19, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_pl_stringByReplacingPathExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFilename:", v11);

    objc_msgSend(v19, "originalFilename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pl_stringByReplacingPathExtension:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOriginalFilename:", v14);

    objc_msgSend(v19, "createdFilename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_pl_stringByReplacingPathExtension:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCreatedFilename:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "estimatedFileLength"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObjectCompressedSize:", v18);

  }
}

- (void)_updateOriginalAssetFormatConversionFromVideoComplement
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  PLMutablePTPAsset *v7;
  PLMutablePTPAsset *originalPtpAsset;
  NSObject *v9;
  PLMutablePTPAsset *v10;
  int v11;
  PLMutablePTPAsset *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_irisSidecarRequiresFormatConversion)
  {
    -[PLPTPAsset assetHandle](self->_originalPtpAsset, "assetHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "requiresConversion");

    if ((v4 & 1) == 0)
    {
      +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, -[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPTPConversionSupport conversionResultForAsset:sourceHints:forceLegacyConversion:assetTypeLabel:](self->_conversionSupport, "conversionResultForAsset:sourceHints:forceLegacyConversion:assetTypeLabel:", self->_originalPtpAsset, v5, 1, CFSTR("originalAssetFromVideoComplement"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_originalPtpAsset, "mutableCopy");
        -[PLPTPAssetBuilder _updateAsset:withConversionResult:](self, "_updateAsset:withConversionResult:", v7, v6);
        originalPtpAsset = self->_originalPtpAsset;
        self->_originalPtpAsset = v7;

      }
      else
      {
        PLPTPGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = self->_originalPtpAsset;
          v11 = 138412290;
          v12 = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unexpected nil PLPTPConversionResult for forced conversion for original asset %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
  }
}

- (BOOL)_suppressPtpInfo
{
  BOOL v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D73310], "maskForSuppressPtpInfo");
  -[PLPTPTransferableAsset savedAssetType](self->_asset, "savedAssetType");
  if ((PLValidatedSavedAssetTypeApplies() & 1) != 0)
    return 1;
  -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 0;
  }
  else
  {
    -[PLPTPTransferableAsset filename](self->_asset, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 == 0;

  }
  return v3;
}

- (BOOL)_buildDirectoryPathAndFilename
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *filenameForPTP;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 308, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PLPTPTransferableAsset filename](self->_asset, "filename");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v6, v7, -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize"), 0);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  filenameForPTP = self->_filenameForPTP;
  self->_filenameForPTP = v8;

  -[PLPTPTransferableAsset pathForOriginalFile](self->_asset, "pathForOriginalFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[PLMutablePTPAsset setFullDirectoryPath:](self->_currentPtpAsset, "setFullDirectoryPath:", v11);
  objc_msgSend(v10, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PLPTPGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PLPTPTransferableAsset isInFlight](self->_asset, "isInFlight");
      v17 = CFSTR("NO");
      v21 = 138412802;
      v22 = v10;
      v23 = 2112;
      if (v16)
        v17 = CFSTR("YES");
      v24 = v15;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "The original name for the photo at path %@ with object ID %@ is nil. Was the photo inflight ? %@", (uint8_t *)&v21, 0x20u);

    }
    goto LABEL_15;
  }
  -[PLMutablePTPAsset setOriginalFilename:](self->_currentPtpAsset, "setOriginalFilename:", v12);
  -[PLMutablePTPAsset setFilename:](self->_currentPtpAsset, "setFilename:", self->_filenameForPTP);
  -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
    v14 = objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setCreatedFilename:](self->_currentPtpAsset, "setCreatedFilename:", v14);
LABEL_15:

  }
  return v12 != 0;
}

- (void)_buildExifAvailable
{
  void *v4;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 339, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLMutablePTPAsset setExifAvailable:](self->_currentPtpAsset, "setExifAvailable:", -[PLPTPTransferableAsset isPhoto](self->_asset, "isPhoto"));
}

- (void)_buildFileSize
{
  off_t st_size;
  void *v4;
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  stat v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 351, CFSTR("Unexpected nil current PTP asset"));

  }
  st_size = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
  if (!st_size)
  {
    if (-[PLPTPTransferableAsset isPhoto](self->_asset, "isPhoto")
      && -[PLPTPTransferableAsset cloudPhotoLibraryEnabled](self->_asset, "cloudPhotoLibraryEnabled"))
    {
      st_size = -[PLPTPTransferableAsset ptpCloudMasterOriginalFileSize](self->_asset, "ptpCloudMasterOriginalFileSize");
    }
    else
    {
      st_size = 0;
    }
  }
  if ((-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo") & 1) == 0 && st_size)
    goto LABEL_14;
  memset(&v13.st_size, 0, 48);
  -[PLPTPTransferableAsset mainFileURL](self->_asset, "mainFileURL", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = stat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v13);

  if (!v6)
  {
    st_size = v13.st_size;
    if (!v13.st_size)
      return;
    goto LABEL_14;
  }
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[PLPTPTransferableAsset mainFileURL](self->_asset, "mainFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to stat asset at path %@", buf, 0xCu);

  }
  if (st_size)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", st_size);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setObjectCompressedSize:](self->_currentPtpAsset, "setObjectCompressedSize:", v10);

  }
}

- (void)_buildFingerprint
{
  void *v3;
  void *v4;
  void *v6;
  id v7;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 375, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalStableHash");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v7)
  {
    -[PLMutablePTPAsset setFingerprint:](self->_currentPtpAsset, "setFingerprint:", v7);
    v4 = v7;
  }

}

- (void)_buildOriginatingAssetID
{
  void *v3;
  void *v4;
  void *v6;
  id v7;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 385, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originatingAssetIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v7)
  {
    -[PLMutablePTPAsset setOriginatingAssetID:](self->_currentPtpAsset, "setOriginatingAssetID:", v7);
    v4 = v7;
  }

}

- (void)_buildThumbnailOffsetAndLength
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  id v10;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 395, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedThumbnailOffset");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPTPTransferableAsset embeddedThumbnailOffset](self->_asset, "embeddedThumbnailOffset"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbOffset:](self->_currentPtpAsset, "setThumbOffset:", v4);

  }
  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "embeddedThumbnailLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "longValue") < 1)
  {
    if (!objc_msgSend(v10, "integerValue"))
      -[PLMutablePTPAsset setThumbOffset:](self->_currentPtpAsset, "setThumbOffset:", &unk_1E37602F0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbCompressedSize:](self->_currentPtpAsset, "setThumbCompressedSize:", v7);

  }
  else
  {
    -[PLMutablePTPAsset setThumbCompressedSize:](self->_currentPtpAsset, "setThumbCompressedSize:", v6);
  }

}

- (void)_buildImageDimensions
{
  double v3;
  double v4;
  int v5;
  double v6;
  double v7;
  void *v9;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 417, CFSTR("Unexpected nil current PTP asset"));

  }
  v3 = (double)-[PLPTPTransferableAsset originalWidth](self->_asset, "originalWidth");
  v4 = (double)-[PLPTPTransferableAsset originalHeight](self->_asset, "originalHeight");
  v5 = -[PLPTPTransferableAsset originalOrientation](self->_asset, "originalOrientation") - 5;
  if ((v5 & 0xFFFC) != 0)
    v6 = v4;
  else
    v6 = v3;
  if ((v5 & 0xFFFC) != 0)
    v7 = v3;
  else
    v7 = v4;
  -[PLMutablePTPAsset setImagePixSize:](self->_currentPtpAsset, "setImagePixSize:", v7, v6);
}

- (void)_buildThumbnailDimensions
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  id v12;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 432, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedThumbnailWidth");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedThumbnailHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v12, "doubleValue");
    v8 = v7;
    objc_msgSend(v5, "doubleValue");
    -[PLMutablePTPAsset setThumbPixSize:](self->_currentPtpAsset, "setThumbPixSize:", v8, v9);
  }

}

- (void)_buildOrientation
{
  void *v4;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 444, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLMutablePTPAsset setDesiredOrientation:](self->_currentPtpAsset, "setDesiredOrientation:", (int)-[PLPTPTransferableAsset originalOrientation](self->_asset, "originalOrientation"));
}

- (void)_buildPhotoKey
{
  PLPTPAssetHandle *v3;
  PLPTPAssetHandle *v4;
  void *v6;
  id v7;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 450, CFSTR("Unexpected nil current PTP asset"));

  }
  v3 = [PLPTPAssetHandle alloc];
  -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v3, "initWithType:assetID:sidecarID:requiresConversion:", 0, v7, 0, 0);
  -[PLMutablePTPAsset setAssetHandle:](self->_currentPtpAsset, "setAssetHandle:", v4);

}

- (void)_buildModificationAndCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 457, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset modificationDate](self->_asset, "modificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  EXIFStringFromDate(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PLMutablePTPAsset setModificationDateString:](self->_currentPtpAsset, "setModificationDateString:", v4);

  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exifTimestampString");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    ExifDateStringToDate(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    EXIFStringFromDate(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_8;
  }
  -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  EXIFStringFromDate(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_8:
    -[PLMutablePTPAsset setCaptureDateString:](self->_currentPtpAsset, "setCaptureDateString:", v7);

  }
}

- (void)_buildIsHDR
{
  unsigned int v3;
  void *v5;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 482, CFSTR("Unexpected nil current PTP asset"));

  }
  v3 = -[PLPTPTransferableAsset hdrType](self->_asset, "hdrType");
  if (v3 <= 0xB && ((0xC3Du >> v3) & 1) != 0)
    -[PLMutablePTPAsset setIsHDR:](self->_currentPtpAsset, "setIsHDR:", (0xC2Cu >> v3) & 1);
}

- (void)_durationOfTheAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  id v8;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 501, CFSTR("Unexpected nil current PTP asset"));

  }
  if ((-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo") & 1) != 0
    || -[PLPTPTransferableAsset isAudio](self->_asset, "isAudio"))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[PLPTPTransferableAsset duration](self->_asset, "duration");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = v4;
      objc_msgSend(v4, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setDurationString:](self->_currentPtpAsset, "setDurationString:", v5);

      v4 = v8;
    }

  }
}

- (void)_buildGPSInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 514, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset location](self->_asset, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "altitude");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%+f,%+f,%+f"), v5, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setLocationString:](self->_currentPtpAsset, "setLocationString:", v10);

    v3 = v13;
  }

}

- (void)_buildGroupUUID
{
  void *v4;
  id v5;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 525, CFSTR("Unexpected nil current PTP asset"));

  }
  if (-[PLPTPAssetBuilder _hasIrisSidecarFile](self, "_hasIrisSidecarFile"))
  {
    -[PLPTPTransferableAsset mediaGroupUUID](self->_asset, "mediaGroupUUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setGroupUUID:](self->_currentPtpAsset, "setGroupUUID:", v5);

  }
}

- (BOOL)_hasIrisSidecarFile
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PLPTPTransferableAsset isPhotoIris](self->_asset, "isPhotoIris"))
    return 0;
  -[PLPTPTransferableAsset mediaGroupUUID](self->_asset, "mediaGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PLPTPTransferableAsset ptpPhotoIrisSidecar](self->_asset, "ptpPhotoIrisSidecar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_buildBurst
{
  void *v3;
  char v4;
  void *v6;
  void *v7;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 545, CFSTR("Unexpected nil current PTP asset"));

  }
  if (-[PLPTPTransferableAsset isAvalanchePhoto](self->_asset, "isAvalanchePhoto"))
  {
    -[PLPTPTransferableAsset avalancheUUID](self->_asset, "avalancheUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = v3;
      -[PLMutablePTPAsset setBurstUUID:](self->_currentPtpAsset, "setBurstUUID:", v3);
      v4 = -[PLPTPTransferableAsset avalanchePickType](self->_asset, "avalanchePickType");
      if ((v4 & 4) != 0)
        -[PLMutablePTPAsset setBurstPicked:](self->_currentPtpAsset, "setBurstPicked:", 1);
      if ((v4 & 8) != 0)
        -[PLMutablePTPAsset setBurstFavorite:](self->_currentPtpAsset, "setBurstFavorite:", 1);
      v3 = v7;
      if ((v4 & 0x20) != 0)
      {
        -[PLMutablePTPAsset setBurstFirstPicked:](self->_currentPtpAsset, "setBurstFirstPicked:", 1);
        v3 = v7;
      }
    }

  }
}

- (void)_buildSlowMo
{
  void *v4;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 568, CFSTR("Unexpected nil current PTP asset"));

  }
  if (-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"))
  {
    if (-[PLPTPTransferableAsset kindSubtype](self->_asset, "kindSubtype") == 101)
      -[PLMutablePTPAsset setHighFrameRateVideo:](self->_currentPtpAsset, "setHighFrameRateVideo:", 1);
  }
}

- (void)_buildTimelapse
{
  void *v4;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 577, CFSTR("Unexpected nil current PTP asset"));

  }
  if (-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"))
  {
    if (-[PLPTPTransferableAsset kindSubtype](self->_asset, "kindSubtype") == 102)
      -[PLMutablePTPAsset setTimeLapseVideo:](self->_currentPtpAsset, "setTimeLapseVideo:", 1);
  }
}

- (void)_buildRelatedUUID
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  id v8;
  id v9;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 585, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset uuid](self->_asset, "uuid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  v9 = v3;
  -[PLMutablePTPAsset setRelatedUUID:](self->_currentPtpAsset, "setRelatedUUID:", v3);

}

- (id)spatialOverCaptureInformation
{
  PLSpatialOverCaptureInformation *cachedSpatialOverCaptureInformation;
  void *v4;
  PLSpatialOverCaptureInformation *v5;
  PLSpatialOverCaptureInformation *v6;

  cachedSpatialOverCaptureInformation = self->_cachedSpatialOverCaptureInformation;
  if (!cachedSpatialOverCaptureInformation)
  {
    -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spatialOverCaptureInformation");
    v5 = (PLSpatialOverCaptureInformation *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedSpatialOverCaptureInformation;
    self->_cachedSpatialOverCaptureInformation = v5;

    cachedSpatialOverCaptureInformation = self->_cachedSpatialOverCaptureInformation;
  }
  return cachedSpatialOverCaptureInformation;
}

- (void)_buildSpatialOverCaptureGroupIdentifier
{
  void *v3;
  void *v5;
  id v6;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 605, CFSTR("Unexpected nil current PTP asset"));

  }
  if (-[PLPTPAssetBuilder hasSpatialOverCaptureContent](self, "hasSpatialOverCaptureContent"))
  {
    -[PLPTPAssetBuilder spatialOverCaptureInformation](self, "spatialOverCaptureInformation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spatialOverCaptureGroupIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setSpatialOverCaptureGroupIdentifier:](self->_currentPtpAsset, "setSpatialOverCaptureGroupIdentifier:", v3);

  }
}

- (void)_buildSpatialOverCaptureLivePhotoPairingIdentifier
{
  void *v3;
  void *v5;
  id v6;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 613, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPAssetBuilder spatialOverCaptureInformation](self, "spatialOverCaptureInformation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spatialOverCaptureLivePhotoPairingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMutablePTPAsset setGroupUUID:](self->_currentPtpAsset, "setGroupUUID:", v3);

}

- (void)_buildDeletedFlag
{
  void *v4;
  id v5;

  if (!self->_currentPtpAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 620, CFSTR("Unexpected nil current PTP asset"));

  }
  -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLMutablePTPAsset setDeleted:](self->_currentPtpAsset, "setDeleted:", objc_msgSend(v5, "ptpTrashedState") & 1);

}

- (void)_buildSidecarAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PLPTPTransferableAsset *asset;
  PLFileManager *fileManager;
  NSArray *v9;
  NSArray *sidecarPtpAssets;
  NSArray *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  NSArray *v15;

  if (-[PLPTPAssetBuilder _hasIrisSidecarFile](self, "_hasIrisSidecarFile"))
  {
    -[PLPTPTransferableAsset ptpPhotoIrisSidecar](self->_asset, "ptpPhotoIrisSidecar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  asset = self->_asset;
  fileManager = self->_fileManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__PLPTPAssetBuilder__buildSidecarAssets__block_invoke;
  v13[3] = &unk_1E36738A8;
  v13[4] = self;
  v14 = v5;
  v9 = v6;
  v15 = v9;
  v12 = v5;
  +[PLPTPUtilities enumerateAvailableSidecarFilesOnAsset:withFileManager:usingBlock:](PLPTPUtilities, "enumerateAvailableSidecarFilesOnAsset:withFileManager:usingBlock:", asset, fileManager, v13);
  sidecarPtpAssets = self->_sidecarPtpAssets;
  self->_sidecarPtpAssets = v9;
  v11 = v9;

}

- (void)_buildVideoCodec
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"))
  {
    if (!self->_currentPtpAsset)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 652, CFSTR("Unexpected nil current PTP asset"));

    }
    -[PLPTPTransferableAsset ptpExtendedAttributes](self->_asset, "ptpExtendedAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codec");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    if (v7)
    {
      -[PLMutablePTPAsset setVideoCodec:](self->_currentPtpAsset, "setVideoCodec:", objc_msgSend(MEMORY[0x1E0D75130], "fourCharCodeFromString:", v7));
      v5 = v7;
    }

  }
}

- (id)_assetForSidecar:(id)a3 sidecarPath:(id)a4 irisSidecarPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PLPTPAssetHandle *v16;
  void *v17;
  void *v18;
  PLPTPAssetHandle *v19;
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
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PLMutablePTPAsset *currentPtpAsset;
  void *v40;
  SEL v41;
  void *v42;
  void *v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = 0;
  if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v10, 0))
  {
    v41 = a2;
    v12 = (void *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
    objc_msgSend(v9, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "pathExtension");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = [PLPTPAssetHandle alloc];
    -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v16, "initWithType:assetID:sidecarID:requiresConversion:", 3, v17, v18, 0);
    objc_msgSend(v12, "setAssetHandle:", v19);

    if (v14)
    {
      -[NSString _pl_stringByReplacingPathExtension:](self->_filenameForPTP, "_pl_stringByReplacingPathExtension:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFilename:", v20);

      objc_msgSend(v12, "setOriginalFilename:", v14);
      -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_pl_stringByReplacingPathExtension:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCreatedFilename:", v23);

      }
      objc_msgSend(v10, "stringByDeletingLastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFullDirectoryPath:", v24);

    }
    v42 = (void *)v15;
    v43 = v14;
    objc_msgSend(v9, "captureDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    EXIFStringFromDate(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setCaptureDateString:", v26);
    objc_msgSend(v9, "modificationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    EXIFStringFromDate(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setModificationDateString:", v28);
    objc_msgSend(v9, "compressedSize");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObjectCompressedSize:", v29);
    -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRelatedUUID:", v30);

    if (v11)
    {
      objc_msgSend(v9, "fileURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v11, "isEqualToString:", v32);

      if (v33)
      {
        -[PLPTPTransferableAsset mediaGroupUUID](self->_asset, "mediaGroupUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setGroupUUID:", v34);

        -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setLocationString:", v35);

        +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, 1, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPTPAssetBuilder updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:](self, "updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:", v12, v36, 0, CFSTR("video complement sidecar"));
        objc_msgSend(v12, "assetHandle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        self->_irisSidecarRequiresFormatConversion = objc_msgSend(v37, "requiresConversion");

        if (self->_currentPtpAsset)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v41, self, CFSTR("PLPTPAssetBuilder.m"), 702, CFSTR("Unexpected non-nil current PTP asset"));

        }
        objc_storeStrong((id *)&self->_currentPtpAsset, v12);
        -[PLPTPAssetBuilder _buildSpatialOverCaptureGroupIdentifier](self, "_buildSpatialOverCaptureGroupIdentifier");
        currentPtpAsset = self->_currentPtpAsset;
        self->_currentPtpAsset = 0;

      }
    }
    objc_msgSend(v12, "setDeleted:", objc_msgSend(v9, "ptpTrashedState") != 0);

  }
  return v12;
}

- (void)_buildDiagnosticAsset
{
  int v3;
  void *v4;
  void *v5;
  PLMutablePTPAsset *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLMutablePTPAsset *diagnosticPtpAsset;
  void *v16;

  if (objc_msgSend((id)objc_opt_class(), "_shouldIncludeDiagnosticFile") && !self->_diagnosticPtpAsset)
  {
    -[PLPTPTransferableAsset pathForDiagnosticFile](self->_asset, "pathForDiagnosticFile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v16, 0);
    v4 = v16;
    if (v3)
    {
      objc_msgSend(v16, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
      objc_msgSend(v16, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _pl_stringByReplacingPathExtension:](self->_filenameForPTP, "_pl_stringByReplacingPathExtension:", CFSTR("DBG"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setFilename:](v6, "setFilename:", v8);

      -[PLMutablePTPAsset setOriginalFilename:](v6, "setOriginalFilename:", v5);
      -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_pl_stringByReplacingPathExtension:", CFSTR("DBG"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMutablePTPAsset setCreatedFilename:](v6, "setCreatedFilename:", v11);

      }
      -[PLMutablePTPAsset setFullDirectoryPath:](v6, "setFullDirectoryPath:", v7);
      -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v16, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[PLMutablePTPAsset setObjectCompressedSize:](v6, "setObjectCompressedSize:", v13);
      -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setRelatedUUID:](v6, "setRelatedUUID:", v14);

      diagnosticPtpAsset = self->_diagnosticPtpAsset;
      self->_diagnosticPtpAsset = v6;

      v4 = v16;
    }

  }
}

- (void)_buildAdjustmentAsset
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  PLMutablePTPAsset *v8;
  PLPTPAssetHandle *v9;
  void *v10;
  PLPTPAssetHandle *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PLMutablePTPAsset *adjustmentPtpAsset;
  uint64_t v21;

  if (!self->_adjustmentPtpAsset)
  {
    -[PLPTPTransferableAsset pathForAdjustmentFile](self->_asset, "pathForAdjustmentFile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v3, 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v5 = objc_msgSend(MEMORY[0x1E0D750B0], "adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:predictedSize:", v4, &v21);
      objc_msgSend(v3, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
      v9 = [PLPTPAssetHandle alloc];
      -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v9, "initWithType:assetID:sidecarID:requiresConversion:", 1, v10, 0, 0);
      -[PLMutablePTPAsset setAssetHandle:](v8, "setAssetHandle:", v11);

      -[NSString _pl_stringByReplacingPathExtension:](self->_filenameForPTP, "_pl_stringByReplacingPathExtension:", CFSTR("AAE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setFilename:](v8, "setFilename:", v12);

      -[PLMutablePTPAsset setOriginalFilename:](v8, "setOriginalFilename:", v6);
      -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_pl_stringByReplacingPathExtension:", CFSTR("AAE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMutablePTPAsset setCreatedFilename:](v8, "setCreatedFilename:", v15);

      }
      -[PLMutablePTPAsset setFullDirectoryPath:](v8, "setFullDirectoryPath:", v7);
      if ((v5 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v3, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[PLMutablePTPAsset setObjectCompressedSize:](v8, "setObjectCompressedSize:", v16);
      -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setRelatedUUID:](v8, "setRelatedUUID:", v18);

      -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setDeleted:](v8, "setDeleted:", ((unint64_t)objc_msgSend(v19, "ptpTrashedState") >> 1) & 1);

      adjustmentPtpAsset = self->_adjustmentPtpAsset;
      self->_adjustmentPtpAsset = v8;

    }
  }
}

- (void)_buildSecondaryAdjustmentDataAsset
{
  void *v3;
  void *v4;
  PLMutablePTPAsset *v5;
  PLPTPAssetHandle *v6;
  void *v7;
  PLPTPAssetHandle *v8;
  NSString *filenameForPTP;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PLMutablePTPAsset *secondaryAdjustmentDataPtpAsset;
  id v21;

  if (!self->_secondaryAdjustmentDataPtpAsset)
  {
    -[PLPTPTransferableAsset pathForAdjustmentSecondaryDataFile](self->_asset, "pathForAdjustmentSecondaryDataFile");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:"))
    {
      objc_msgSend(v21, "lastPathComponent");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByDeletingLastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
      v6 = [PLPTPAssetHandle alloc];
      -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v6, "initWithType:assetID:sidecarID:requiresConversion:", 2, v7, 0, 0);
      -[PLMutablePTPAsset setAssetHandle:](v5, "setAssetHandle:", v8);

      filenameForPTP = self->_filenameForPTP;
      -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
      -[PLPTPAsset assetHandle](v5, "assetHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "auxiliaryResourceFilenameMarker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", filenameForPTP, v10, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "_pl_stringByReplacingPathExtension:", CFSTR("DAT"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setFilename:](v5, "setFilename:", v15);

      -[PLMutablePTPAsset setOriginalFilename:](v5, "setOriginalFilename:", v3);
      -[PLMutablePTPAsset setFullDirectoryPath:](v5, "setFullDirectoryPath:", v4);
      -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v21, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setObjectCompressedSize:](v5, "setObjectCompressedSize:", v17);

      -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setRelatedUUID:](v5, "setRelatedUUID:", v18);

      -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setDeleted:](v5, "setDeleted:", ((unint64_t)objc_msgSend(v19, "ptpTrashedState") >> 1) & 1);

      secondaryAdjustmentDataPtpAsset = self->_secondaryAdjustmentDataPtpAsset;
      self->_secondaryAdjustmentDataPtpAsset = v5;

    }
  }
}

- (void)_buildFullSizeRenderImageAsset
{
  void *v3;
  void *v4;
  PLMutablePTPAsset *v5;
  PLPTPAssetHandle *v6;
  void *v7;
  PLPTPAssetHandle *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
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
  PLMutablePTPAsset *fullSizeRenderImagePtpAsset;
  id v30;

  -[PLPTPTransferableAsset pathForFullsizeRenderImageFile](self->_asset, "pathForFullsizeRenderImageFile");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo") & 1) == 0
    && -[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v30, 0)&& (-[PLPTPTransferableAsset isAvalanchePhoto](self->_asset, "isAvalanchePhoto") & 1) == 0)
  {
    objc_msgSend(v30, "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
    v6 = [PLPTPAssetHandle alloc];
    -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v6, "initWithType:assetID:sidecarID:requiresConversion:", 4, v7, 0, 0);
    -[PLMutablePTPAsset setAssetHandle:](v5, "setAssetHandle:", v8);

    -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[PLPTPTransferableAsset filename](self->_asset, "filename");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
    -[PLPTPAsset assetHandle](v5, "assetHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auxiliaryResourceFilenameMarker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v12, v13, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLMutablePTPAsset setFilename:](v5, "setFilename:", v20);
    -[PLMutablePTPAsset setOriginalFilename:](v5, "setOriginalFilename:", v3);
    -[PLMutablePTPAsset setFullDirectoryPath:](v5, "setFullDirectoryPath:", v4);
    -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v30, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setObjectCompressedSize:](v5, "setObjectCompressedSize:", v22);
    -[PLMutablePTPAsset setImagePixSize:](v5, "setImagePixSize:", (double)-[PLPTPTransferableAsset width](self->_asset, "width"), (double)-[PLPTPTransferableAsset height](self->_asset, "height"));
    -[PLMutablePTPAsset setThumbOffset:](v5, "setThumbOffset:", &unk_1E37602F0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbCompressedSize:](v5, "setThumbCompressedSize:", v23);

    -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setRelatedUUID:](v5, "setRelatedUUID:", v24);

    +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, 0, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPTPAssetBuilder updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:](self, "updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:", v5, v25, 0, CFSTR("full size render image"));
    -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setLocationString:](v5, "setLocationString:", v26);

    if (-[PLPTPAssetBuilder _hasIrisSidecarFile](self, "_hasIrisSidecarFile"))
    {
      -[PLPTPTransferableAsset mediaGroupUUID](self->_asset, "mediaGroupUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setGroupUUID:](v5, "setGroupUUID:", v27);

    }
    -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setDeleted:](v5, "setDeleted:", ((unint64_t)objc_msgSend(v28, "ptpTrashedState") >> 2) & 1);

    fullSizeRenderImagePtpAsset = self->_fullSizeRenderImagePtpAsset;
    self->_fullSizeRenderImagePtpAsset = v5;

  }
}

- (void)_buildFullSizeRenderVideoAsset
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  PLMutablePTPAsset *v8;
  PLPTPAssetHandle *v9;
  void *v10;
  PLPTPAssetHandle *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v31;
  PLMutablePTPAsset *fullSizeRenderVideoPtpAsset;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PLPTPTransferableAsset pathForFullsizeRenderVideoFile](self->_asset, "pathForFullsizeRenderVideoFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v3, 0))
  {
    if (self->_fullSizeRenderImagePtpAsset
      || !-[PLPTPTransferableAsset isPhotoIris](self->_asset, "isPhotoIris"))
    {
      objc_msgSend(v3, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
      v9 = [PLPTPAssetHandle alloc];
      -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v9, "initWithType:assetID:sidecarID:requiresConversion:", 5, v10, 0, 0);
      -[PLMutablePTPAsset setAssetHandle:](v8, "setAssetHandle:", v11);

      -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        -[PLPTPTransferableAsset filename](self->_asset, "filename");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
      -[PLPTPAsset assetHandle](v8, "assetHandle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "auxiliaryResourceFilenameMarker");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v15, v16, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "pathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uppercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_pl_stringByReplacingPathExtension:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLMutablePTPAsset setFilename:](v8, "setFilename:", v23);
      -[PLMutablePTPAsset setOriginalFilename:](v8, "setOriginalFilename:", v33);
      -[PLMutablePTPAsset setFullDirectoryPath:](v8, "setFullDirectoryPath:", v7);
      -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v3, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setObjectCompressedSize:](v8, "setObjectCompressedSize:", v25);
      -[PLMutablePTPAsset setImagePixSize:](v8, "setImagePixSize:", (double)-[PLPTPTransferableAsset width](self->_asset, "width"), (double)-[PLPTPTransferableAsset height](self->_asset, "height"));
      -[PLMutablePTPAsset setThumbOffset:](v8, "setThumbOffset:", &unk_1E37602F0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setThumbCompressedSize:](v8, "setThumbCompressedSize:", v26);

      -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setRelatedUUID:](v8, "setRelatedUUID:", v27);

      +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, 1, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPTPAssetBuilder updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:](self, "updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:", v8, v28, 0, CFSTR("full size render video"));
      -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setLocationString:](v8, "setLocationString:", v29);

      if (-[PLPTPAssetBuilder _hasIrisSidecarFile](self, "_hasIrisSidecarFile"))
      {
        -[PLPTPTransferableAsset mediaGroupUUID](self->_asset, "mediaGroupUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMutablePTPAsset setGroupUUID:](v8, "setGroupUUID:", v30);

      }
      -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setDeleted:](v8, "setDeleted:", ((unint64_t)objc_msgSend(v31, "ptpTrashedState") >> 3) & 1);

      fullSizeRenderVideoPtpAsset = self->_fullSizeRenderVideoPtpAsset;
      self->_fullSizeRenderVideoPtpAsset = v8;

    }
    else
    {
      PLPTPGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPTPTransferableAsset uuid](self->_asset, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v5;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "Skipping full size render video due to missing full size render image: %@ (UUID: %@)", buf, 0x16u);

      }
    }
  }

}

- (BOOL)hasSpatialOverCaptureContent
{
  void *v3;
  BOOL v4;

  -[PLPTPTransferableAsset pathForSpatialOverCaptureContentFile](self->_asset, "pathForSpatialOverCaptureContentFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v3, 0)&& !-[PLPTPTransferableAsset cameraProcessingAdjustmentTrashedState](self->_asset, "cameraProcessingAdjustmentTrashedState");

  return v4;
}

- (void)buildSpatialOverCaptureContentPtpAsset
{
  PLMutablePTPAsset *v4;
  PLMutablePTPAsset *currentPtpAsset;
  void *v6;
  void *v7;
  uint64_t v8;
  PLPTPAssetHandle *v9;
  void *v10;
  PLPTPAssetHandle *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  PLMutablePTPAsset *spatialOverCaptureImagePtpAsset;
  void *v32;
  id v33;

  if (-[PLPTPAssetBuilder hasSpatialOverCaptureContent](self, "hasSpatialOverCaptureContent"))
  {
    -[PLPTPTransferableAsset pathForSpatialOverCaptureContentFile](self->_asset, "pathForSpatialOverCaptureContentFile");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
    if (self->_currentPtpAsset)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 961, CFSTR("Unexpected non-nil current PTP asset"));

    }
    objc_storeStrong((id *)&self->_currentPtpAsset, v4);
    -[PLPTPAssetBuilder _buildSpatialOverCaptureGroupIdentifier](self, "_buildSpatialOverCaptureGroupIdentifier");
    -[PLPTPAssetBuilder _buildSpatialOverCaptureLivePhotoPairingIdentifier](self, "_buildSpatialOverCaptureLivePhotoPairingIdentifier");
    currentPtpAsset = self->_currentPtpAsset;
    self->_currentPtpAsset = 0;

    objc_msgSend(v33, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"))
      v8 = 7;
    else
      v8 = 6;
    v9 = [PLPTPAssetHandle alloc];
    -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v9, "initWithType:assetID:sidecarID:requiresConversion:", v8, v10, 0, 0);
    -[PLMutablePTPAsset setAssetHandle:](v4, "setAssetHandle:", v11);

    -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[PLPTPTransferableAsset filename](self->_asset, "filename");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
    -[PLPTPAsset assetHandle](v4, "assetHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "auxiliaryResourceFilenameMarker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v15, v16, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "pathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uppercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_pl_stringByReplacingPathExtension:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLMutablePTPAsset setFilename:](v4, "setFilename:", v23);
    -[PLMutablePTPAsset setOriginalFilename:](v4, "setOriginalFilename:", v6);
    -[PLMutablePTPAsset setFullDirectoryPath:](v4, "setFullDirectoryPath:", v7);
    -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v33, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setObjectCompressedSize:](v4, "setObjectCompressedSize:", v25);
    -[PLPTPTransferableAsset spatialOverCaptureSize](self->_asset, "spatialOverCaptureSize");
    -[PLMutablePTPAsset setImagePixSize:](v4, "setImagePixSize:");
    -[PLMutablePTPAsset setThumbOffset:](v4, "setThumbOffset:", &unk_1E37602F0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbCompressedSize:](v4, "setThumbCompressedSize:", v26);

    -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setRelatedUUID:](v4, "setRelatedUUID:", v27);

    -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setLocationString:](v4, "setLocationString:", v28);

    -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setDeleted:](v4, "setDeleted:", ((unint64_t)objc_msgSend(v29, "ptpTrashedState") >> 4) & 1);

    +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, -[PLPTPTransferableAsset isVideo](self->_asset, "isVideo"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPTPAssetBuilder updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:](self, "updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:", v4, v30, 0, CFSTR("spatial over capture"));
    spatialOverCaptureImagePtpAsset = self->_spatialOverCaptureImagePtpAsset;
    self->_spatialOverCaptureImagePtpAsset = v4;

  }
}

- (void)buildSpatialOverCaptureVideoComplementPtpAsset
{
  PLMutablePTPAsset *v4;
  PLMutablePTPAsset *currentPtpAsset;
  void *v6;
  void *v7;
  PLPTPAssetHandle *v8;
  void *v9;
  PLPTPAssetHandle *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  PLMutablePTPAsset *spatialOverCaptureVideoComplementPtpAsset;
  void *v31;
  id v32;

  -[PLPTPTransferableAsset pathForVideoComplementSpatialOverCaptureContentFile](self->_asset, "pathForVideoComplementSpatialOverCaptureContentFile");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLPTPTransferableAsset isPhotoIris](self->_asset, "isPhotoIris")
    && -[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v32, 0)&& !-[PLPTPTransferableAsset cameraProcessingAdjustmentTrashedState](self->_asset, "cameraProcessingAdjustmentTrashedState"))
  {
    v4 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
    if (self->_currentPtpAsset)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAssetBuilder.m"), 1008, CFSTR("Unexpected non-nil current PTP asset"));

    }
    objc_storeStrong((id *)&self->_currentPtpAsset, v4);
    -[PLPTPAssetBuilder _buildSpatialOverCaptureGroupIdentifier](self, "_buildSpatialOverCaptureGroupIdentifier");
    -[PLPTPAssetBuilder _buildSpatialOverCaptureLivePhotoPairingIdentifier](self, "_buildSpatialOverCaptureLivePhotoPairingIdentifier");
    currentPtpAsset = self->_currentPtpAsset;
    self->_currentPtpAsset = 0;

    objc_msgSend(v32, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PLPTPAssetHandle alloc];
    -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v8, "initWithType:assetID:sidecarID:requiresConversion:", 8, v9, 0, 0);
    -[PLMutablePTPAsset setAssetHandle:](v4, "setAssetHandle:", v10);

    -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[PLPTPTransferableAsset filename](self->_asset, "filename");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
    -[PLPTPAsset assetHandle](v4, "assetHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "auxiliaryResourceFilenameMarker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v14, v15, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "pathExtension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uppercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_pl_stringByReplacingPathExtension:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLMutablePTPAsset setFilename:](v4, "setFilename:", v22);
    -[PLMutablePTPAsset setOriginalFilename:](v4, "setOriginalFilename:", v6);
    -[PLMutablePTPAsset setFullDirectoryPath:](v4, "setFullDirectoryPath:", v7);
    -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v32, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setObjectCompressedSize:](v4, "setObjectCompressedSize:", v24);
    -[PLPTPTransferableAsset videoComplementSpatialOverCaptureSize](self->_asset, "videoComplementSpatialOverCaptureSize");
    -[PLMutablePTPAsset setImagePixSize:](v4, "setImagePixSize:");
    -[PLMutablePTPAsset setThumbOffset:](v4, "setThumbOffset:", &unk_1E37602F0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbCompressedSize:](v4, "setThumbCompressedSize:", v25);

    -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setRelatedUUID:](v4, "setRelatedUUID:", v26);

    -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setLocationString:](v4, "setLocationString:", v27);

    -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setDeleted:](v4, "setDeleted:", ((unint64_t)objc_msgSend(v28, "ptpTrashedState") >> 5) & 1);

    +[PLPTPConversionSourceHints hintsForAsset:isVideo:isRender:](PLPTPConversionSourceHints, "hintsForAsset:isVideo:isRender:", self->_asset, 1, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPTPAssetBuilder updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:](self, "updateAssetForFormatConversion:sourceHints:forceLegacyConversion:assetTypeLabel:", v4, v29, 0, CFSTR("spatial over capture video complement"));
    spatialOverCaptureVideoComplementPtpAsset = self->_spatialOverCaptureVideoComplementPtpAsset;
    self->_spatialOverCaptureVideoComplementPtpAsset = v4;

  }
}

- (void)buildOriginalAdjustmentPtpAsset
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  PLMutablePTPAsset *v7;
  PLPTPAssetHandle *v8;
  void *v9;
  PLPTPAssetHandle *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  PLMutablePTPAsset *originalAdjustmentPtpAsset;
  void *v28;

  -[PLPTPTransferableAsset pathForOriginalAdjustmentFile](self->_asset, "pathForOriginalAdjustmentFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v28 = v3;
    v4 = -[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v3, 0);
    v3 = v28;
    if (v4)
    {
      objc_msgSend(v28, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByDeletingLastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
      v8 = [PLPTPAssetHandle alloc];
      -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v8, "initWithType:assetID:sidecarID:requiresConversion:", 9, v9, 0, 0);
      -[PLMutablePTPAsset setAssetHandle:](v7, "setAssetHandle:", v10);

      -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        -[PLPTPTransferableAsset filename](self->_asset, "filename");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
      -[PLPTPAsset assetHandle](v7, "assetHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "auxiliaryResourceFilenameMarker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v14, v15, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "pathExtension");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uppercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_pl_stringByReplacingPathExtension:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLMutablePTPAsset setFilename:](v7, "setFilename:", v22);
      -[PLMutablePTPAsset setOriginalFilename:](v7, "setOriginalFilename:", v5);
      -[PLMutablePTPAsset setFullDirectoryPath:](v7, "setFullDirectoryPath:", v6);
      -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v28, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setObjectCompressedSize:](v7, "setObjectCompressedSize:", v24);
      -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setRelatedUUID:](v7, "setRelatedUUID:", v25);

      -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setDeleted:](v7, "setDeleted:", ((unint64_t)objc_msgSend(v26, "ptpTrashedState") >> 6) & 1);

      originalAdjustmentPtpAsset = self->_originalAdjustmentPtpAsset;
      self->_originalAdjustmentPtpAsset = v7;

      v3 = v28;
    }
  }

}

- (void)buildPenultimateImagePtpAsset
{
  PLMutablePTPAsset *v3;
  void *v4;
  void *v5;
  PLPTPAssetHandle *v6;
  void *v7;
  PLPTPAssetHandle *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
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
  PLMutablePTPAsset *penultimateImagePtpAsset;
  id v30;

  -[PLPTPTransferableAsset pathForPenultimateFullsizeRenderImageFile](self->_asset, "pathForPenultimateFullsizeRenderImageFile");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:"))
  {
    v3 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
    objc_msgSend(v30, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PLPTPAssetHandle alloc];
    -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v6, "initWithType:assetID:sidecarID:requiresConversion:", 10, v7, 0, 0);
    -[PLMutablePTPAsset setAssetHandle:](v3, "setAssetHandle:", v8);

    -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[PLPTPTransferableAsset filename](self->_asset, "filename");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
    -[PLPTPAsset assetHandle](v3, "assetHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auxiliaryResourceFilenameMarker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v12, v13, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLMutablePTPAsset setFilename:](v3, "setFilename:", v20);
    -[PLMutablePTPAsset setOriginalFilename:](v3, "setOriginalFilename:", v4);
    -[PLMutablePTPAsset setFullDirectoryPath:](v3, "setFullDirectoryPath:", v5);
    -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v30, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setObjectCompressedSize:](v3, "setObjectCompressedSize:", v22);
    -[PLMutablePTPAsset setImagePixSize:](v3, "setImagePixSize:", (double)-[PLPTPTransferableAsset width](self->_asset, "width"), (double)-[PLPTPTransferableAsset height](self->_asset, "height"));
    -[PLMutablePTPAsset setThumbOffset:](v3, "setThumbOffset:", &unk_1E37602F0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbCompressedSize:](v3, "setThumbCompressedSize:", v23);

    -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setRelatedUUID:](v3, "setRelatedUUID:", v24);

    -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setLocationString:](v3, "setLocationString:", v25);

    -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setDeleted:](v3, "setDeleted:", ((unint64_t)objc_msgSend(v26, "ptpTrashedState") >> 7) & 1);

    if (-[PLPTPAssetBuilder _hasIrisSidecarFile](self, "_hasIrisSidecarFile"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setGroupUUID:](v3, "setGroupUUID:", v28);

    }
    penultimateImagePtpAsset = self->_penultimateImagePtpAsset;
    self->_penultimateImagePtpAsset = v3;

  }
}

- (void)buildPenultimateVideoPtpAsset
{
  PLMutablePTPAsset *v3;
  void *v4;
  void *v5;
  PLPTPAssetHandle *v6;
  void *v7;
  PLPTPAssetHandle *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
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
  PLMutablePTPAsset *penultimateVideoPtpAsset;
  id v29;

  -[PLPTPTransferableAsset pathForPenultimateFullsizeRenderVideoFile](self->_asset, "pathForPenultimateFullsizeRenderVideoFile");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:"))
  {
    v3 = (PLMutablePTPAsset *)-[PLMutablePTPAsset mutableCopy](self->_commonPtpAsset, "mutableCopy");
    objc_msgSend(v29, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PLPTPAssetHandle alloc];
    -[PLPTPTransferableAsset objectID](self->_asset, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLPTPAssetHandle initWithType:assetID:sidecarID:requiresConversion:](v6, "initWithType:assetID:sidecarID:requiresConversion:", 11, v7, 0, 0);
    -[PLMutablePTPAsset setAssetHandle:](v3, "setAssetHandle:", v8);

    -[PLPTPTransferableAsset originalFilename](self->_asset, "originalFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[PLPTPTransferableAsset filename](self->_asset, "filename");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[PLPTPTransferableAsset dateCreated](self->_asset, "dateCreated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLPTPTransferableAsset originalFilesize](self->_asset, "originalFilesize");
    -[PLPTPAsset assetHandle](v3, "assetHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auxiliaryResourceFilenameMarker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDCFUtilities dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:](PLDCFUtilities, "dcfCompliantNameForFileName:createDate:fileSize:filenameMarker:", v12, v13, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_pl_stringByReplacingPathExtension:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLMutablePTPAsset setFilename:](v3, "setFilename:", v20);
    -[PLMutablePTPAsset setOriginalFilename:](v3, "setOriginalFilename:", v4);
    -[PLMutablePTPAsset setFullDirectoryPath:](v3, "setFullDirectoryPath:", v5);
    -[PLFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v29, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setObjectCompressedSize:](v3, "setObjectCompressedSize:", v22);
    -[PLMutablePTPAsset setImagePixSize:](v3, "setImagePixSize:", (double)-[PLPTPTransferableAsset width](self->_asset, "width"), (double)-[PLPTPTransferableAsset height](self->_asset, "height"));
    -[PLMutablePTPAsset setThumbOffset:](v3, "setThumbOffset:", &unk_1E37602F0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x10000);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setThumbCompressedSize:](v3, "setThumbCompressedSize:", v23);

    -[PLPTPAsset relatedUUID](self->_originalPtpAsset, "relatedUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setRelatedUUID:](v3, "setRelatedUUID:", v24);

    -[PLPTPAsset locationString](self->_originalPtpAsset, "locationString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setLocationString:](v3, "setLocationString:", v25);

    -[PLPTPTransferableAsset ptpAdditionalAttributes](self->_asset, "ptpAdditionalAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMutablePTPAsset setDeleted:](v3, "setDeleted:", ((unint64_t)objc_msgSend(v26, "ptpTrashedState") >> 8) & 1);

    if (-[PLPTPAssetBuilder _hasIrisSidecarFile](self, "_hasIrisSidecarFile"))
    {
      -[PLPTPAsset groupUUID](self->_penultimateImagePtpAsset, "groupUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMutablePTPAsset setGroupUUID:](v3, "setGroupUUID:", v27);

    }
    penultimateVideoPtpAsset = self->_penultimateVideoPtpAsset;
    self->_penultimateVideoPtpAsset = v3;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedAssets, 0);
  objc_storeStrong((id *)&self->_penultimateVideoPtpAsset, 0);
  objc_storeStrong((id *)&self->_penultimateImagePtpAsset, 0);
  objc_storeStrong((id *)&self->_cachedSpatialOverCaptureInformation, 0);
  objc_storeStrong((id *)&self->_originalAdjustmentPtpAsset, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureVideoComplementPtpAsset, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureImagePtpAsset, 0);
  objc_storeStrong((id *)&self->_fullSizeRenderVideoPtpAsset, 0);
  objc_storeStrong((id *)&self->_fullSizeRenderImagePtpAsset, 0);
  objc_storeStrong((id *)&self->_secondaryAdjustmentDataPtpAsset, 0);
  objc_storeStrong((id *)&self->_adjustmentPtpAsset, 0);
  objc_storeStrong((id *)&self->_diagnosticPtpAsset, 0);
  objc_storeStrong((id *)&self->_sidecarPtpAssets, 0);
  objc_storeStrong((id *)&self->_originalPtpAsset, 0);
  objc_storeStrong((id *)&self->_commonPtpAsset, 0);
  objc_storeStrong((id *)&self->_currentPtpAsset, 0);
  objc_storeStrong((id *)&self->_filenameForPTP, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_conversionSupport, 0);
}

void __40__PLPTPAssetBuilder__buildSidecarAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "resourceType") == 5
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "peerSupportsAdjustmentBaseResources"))
  {
    objc_msgSend(*(id *)(a1 + 32), "buildOriginalAdjustmentPtpAsset");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_assetForSidecar:sidecarPath:irisSidecarPath:", v7, v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_pl_addNonNilObject:", v6);

  }
}

+ (id)pictureTransferProtocolAssetsForAsset:(id)a3 withConversionSupport:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  pl_result_with_autoreleasepool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)_shouldIncludeDiagnosticFile
{
  pl_dispatch_once();
  return _shouldIncludeDiagnosticFile_provideDiagnosticFile;
}

uint64_t __49__PLPTPAssetBuilder__shouldIncludeDiagnosticFile__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("PLCameraProvideDiagnosticFile"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if ((_DWORD)result)
    v1 = keyExistsAndHasValidFormat == 0;
  else
    v1 = 1;
  v2 = !v1;
  _shouldIncludeDiagnosticFile_provideDiagnosticFile = v2;
  return result;
}

id __81__PLPTPAssetBuilder_pictureTransferProtocolAssetsForAsset_withConversionSupport___block_invoke(uint64_t a1)
{
  PLPTPAssetBuilder *v1;
  void *v2;

  v1 = -[PLPTPAssetBuilder initWithAsset:conversionSupport:]([PLPTPAssetBuilder alloc], "initWithAsset:conversionSupport:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[PLPTPAssetBuilder pictureTransferProtocolAssets](v1, "pictureTransferProtocolAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
