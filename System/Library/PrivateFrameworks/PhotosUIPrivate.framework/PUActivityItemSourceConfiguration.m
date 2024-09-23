@implementation PUActivityItemSourceConfiguration

- (PUActivityItemSourceConfiguration)initWithAsset:(id)a3 availableSharingVariants:(id)a4 activityType:(id)a5 preferences:(id)a6
{
  int64_t var6;
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  PUActivityItemSourceConfiguration *v15;
  PUActivityItemSourceConfiguration *v16;
  uint64_t v17;
  NSDictionary *sharingVariants;
  uint64_t v19;
  NSString *activityType;
  objc_super v22;

  var6 = a6.var6;
  v7 = *(_QWORD *)&a6.var0;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PUActivityItemSourceConfiguration;
  v15 = -[PUActivityItemSourceConfiguration init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_asset, a3);
    v17 = objc_msgSend(v13, "copy");
    sharingVariants = v16->_sharingVariants;
    v16->_sharingVariants = (NSDictionary *)v17;

    v19 = objc_msgSend(v14, "copy");
    activityType = v16->_activityType;
    v16->_activityType = (NSString *)v19;

    *(_QWORD *)&v16->_sharingPreferences.excludeLiveness = v7;
    v16->_sharingPreferences.preferredExportFormat = var6;
    -[PUActivityItemSourceConfiguration _configure](v16, "_configure");
  }

  return v16;
}

- (void)_configure
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int v6;
  _BOOL4 requiresAssetExport;
  int64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  void *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  BOOL v41;
  int64_t v42;
  PHAssetExportRequestOptions *assetExportRequestOptions;
  void *v44;
  void *v45;
  _BOOL4 v46;
  _BOOL4 v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[PUActivityItemSourceConfiguration asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSourceConfiguration activityType](self, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_requiresAssetExport = -[PUActivityItemSourceConfiguration _requiresAssetExportForAsset:forActivityType:](self, "_requiresAssetExportForAsset:forActivityType:", v3, v4);
  v5 = -[PUActivityItemSourceConfiguration _requiresAssetsLibraryURLForAsset:forActivityType:](self, "_requiresAssetsLibraryURLForAsset:forActivityType:", v3, v4);
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D96DA0]);
  requiresAssetExport = self->_requiresAssetExport;
  v8 = 3;
  if (self->_requiresAssetExport)
    v8 = 0;
  if (v5)
    v8 = 2;
  if (v6)
    v8 = 1;
  self->_outputType = v8;
  if (requiresAssetExport)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CD1418]);
    v10 = (void *)objc_opt_class();
    -[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences");
    v12 = v11;
    -[PUActivityItemSourceConfiguration sharingVariants](self, "sharingVariants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "shouldProvideAlternateVariantForActivityType:forAsset:inPreferredExportFormat:withAvailableSharingVariants:", v4, v3, v12, v13);

    v15 = (void *)objc_opt_class();
    -[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences");
    v17 = v16;
    -[PUActivityItemSourceConfiguration sharingVariants](self, "sharingVariants");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "shouldProvideCompatibleFormatForActivityType:forAsset:inPreferredExportFormat:withAvailableSharingVariants:", v4, v3, v17, v18);

    if ((-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") & 0x10000000000) != 0)
      goto LABEL_15;
    v20 = 1;
    if (v19)
      v20 = 2;
    v21 = v14 ? 3 : v20;
    if (objc_msgSend((id)objc_opt_class(), "_shouldExportAsUnmodifiedOriginalForActivityType:", v4))
    {
LABEL_15:
      v22 = 1;
      v21 = 1;
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v9, "setVariant:", v21);
    v23 = -[PUActivityItemSourceConfiguration _wantsLivePhotoBundleForActivityType:](self, "_wantsLivePhotoBundleForActivityType:", v4);
    v47 = -[PUActivityItemSourceConfiguration _wantsAssetBundleForActivityType:](self, "_wantsAssetBundleForActivityType:", v4);
    objc_msgSend(v9, "setIncludeAllAssetResources:");
    objc_msgSend(v9, "setFlattenSlomoVideos:", -[PUActivityItemSourceConfiguration _shouldFlattenSlomoVideoForActivityType:](self, "_shouldFlattenSlomoVideoForActivityType:", v4));
    -[PUActivityItemSourceConfiguration _videoExportPresetForActivityType:](self, "_videoExportPresetForActivityType:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoExportPreset:", v24);
    -[PUActivityItemSourceConfiguration _videoExportFileTypeForActivityType:](self, "_videoExportFileTypeForActivityType:", v4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoExportFileType:");
    self->_maxFileSizeLimit = objc_msgSend((id)objc_opt_class(), "maxFileSizeLimitForActivityType:asset:", v4, v3);
    if ((v22 & 1) == 0)
      objc_msgSend(v9, "setDontAllowRAW:", objc_msgSend((id)objc_opt_class(), "_dontAllowRAWForActivityType:", v4));
    v46 = v23;
    objc_msgSend(v9, "setTreatLivePhotoAsStill:", !v23);
    objc_msgSend(v9, "setShouldStripLocation:", (v22 ^ 1) & (-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 8));
    objc_msgSend(v9, "setShouldStripCaption:", ((unsigned __int16)v22 ^ 1) & (-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 16));
    objc_msgSend(v9, "setShouldStripAccessibilityDescription:", ((unsigned __int16)v22 ^ 1) & (-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 24));
    objc_msgSend(v9, "setShouldExportUnmodifiedOriginalResources:", v22);
    v25 = (void *)MEMORY[0x1E0D752F0];
    -[PHAsset uniformTypeIdentifier](self->_asset, "uniformTypeIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "typeWithIdentifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "conformsToType:", *MEMORY[0x1E0CEC580]))
      v28 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BC88]);
    else
      v28 = 0;
    objc_msgSend(v9, "setAllowMetadataConversionsForPNG:", v28);
    objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "locationBakingComparisonStrategy");
    if (v30 == 1)
      v31 = 1;
    else
      v31 = 2 * (v30 == 2);
    objc_msgSend(v9, "setLocationComparisonStrategy:", v31);
    if (objc_msgSend(v29, "disableMetadataCorrections"))
    {
      PLShareSheetGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "uuid");
        v44 = v24;
        v33 = v14;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v34;
        _os_log_impl(&dword_1AAB61000, v32, OS_LOG_TYPE_DEFAULT, "Based on internal debug settings, disabling metadata corrections asset: %{public}@.", buf, 0xCu);

        v14 = v33;
        v24 = v44;
      }

      objc_msgSend(v9, "setDisableMetadataCorrections:", objc_msgSend(v29, "disableMetadataCorrections"));
    }
    objc_msgSend(v9, "setForceDateTimeMetadataBaking:", objc_msgSend(v29, "forceDateTimeMetadataBaking"));
    objc_msgSend(v9, "setForceLocationMetadataBaking:", objc_msgSend(v29, "forceLocationMetadataBaking"));
    objc_msgSend(v9, "setForceCaptionMetadataBaking:", objc_msgSend(v29, "forceCaptionMetadataBaking"));
    objc_msgSend(v9, "setForceAccessibilityDescriptionMetadataBaking:", objc_msgSend(v29, "forceAccessibilityDescriptionMetadataBaking"));
    if (objc_msgSend(v9, "shouldExportUnmodifiedOriginalResources"))
      v35 = objc_msgSend(v29, "shouldUpdateFileCreationDatesForUnmodifiedOriginalExports");
    else
      v35 = objc_msgSend(v29, "shouldUpdateFileCreationDatesForRegularExports");
    objc_msgSend(v9, "setDisableUpdatingFileCreationDatesOnExportedFileURLs:", v35 ^ 1u);
    v36 = -[PHAsset canPlayLoopingVideo](self->_asset, "canPlayLoopingVideo");
    v37 = v36 & ~-[PHAsset isMediaSubtype:](self->_asset, "isMediaSubtype:", 8);
    if ((_DWORD)v22)
      v38 = v37;
    else
      v38 = v36;
    if (-[PHAsset playbackStyle](self->_asset, "playbackStyle") == 4)
      v39 = 1;
    else
      v39 = v38;
    v40 = 3;
    if (!v46)
      v40 = 1;
    v41 = v39 == 0;
    v42 = 2;
    if (v41)
      v42 = v40;
    if (v47)
      v42 = 4;
    assetExportRequestOptions = self->_assetExportRequestOptions;
    if (v14)
      v42 = 5;
    self->_assetExportKind = v42;
    self->_assetExportRequestOptions = (PHAssetExportRequestOptions *)v9;

  }
}

- (BOOL)_requiresAssetsLibraryURLForAsset:(id)a3 forActivityType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sendAssetURLsToMessages");

  if (v8
    && objc_msgSend(v5, "isVideo")
    && (objc_msgSend(v5, "canPlayAutoloop") & 1) == 0
    && (objc_msgSend(v5, "isStreamedVideo") & 1) == 0
    && objc_msgSend(v5, "isHighFrameRateVideo")
    && (objc_msgSend(MEMORY[0x1E0CD1390], "isOriginalKnownUnsupportedFormatForAsset:failureInfo:", v5, 0) & 1) == 0)
  {
    v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D96DC0]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_requiresAssetExportForAsset:(id)a3 forActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_activitiesThatDontRequireAssetExport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  LOBYTE(self) = -[PUActivityItemSourceConfiguration _requiresAssetsLibraryURLForAsset:forActivityType:](self, "_requiresAssetsLibraryURLForAsset:forActivityType:", v7, v6);
  return self | v9 ^ 1;
}

- (BOOL)_shouldFlattenSlomoVideoForActivityType:(id)a3
{
  PHAsset *asset;
  id v5;
  BOOL v6;
  char v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  asset = self->_asset;
  v5 = a3;
  v6 = -[PUActivityItemSourceConfiguration _requiresAssetsLibraryURLForAsset:forActivityType:](self, "_requiresAssetsLibraryURLForAsset:forActivityType:", asset, v5);
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DA0]);
  v8 = -[PUActivityItemSourceConfiguration _wantsAssetBundleForActivityType:](self, "_wantsAssetBundleForActivityType:", v5);

  v9 = 0;
  if (-[PHAsset isHighFrameRateVideo](self->_asset, "isHighFrameRateVideo")
    && (v7 & 1) == 0
    && !v6
    && !v8)
  {
    -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
    -[PHAsset adjustmentProperties](self->_asset, "adjustmentProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D75308];
    objc_msgSend(v10, "formatIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formatVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v11, "isRecognizedSlowMotionFormatWithIdentifier:version:", v12, v13);

    if ((v11 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[PUActivityItemSourceConfiguration _customAccessibilityLabel](self, "_customAccessibilityLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14 != 0;

    }
  }
  return v9;
}

- (id)_videoExportPresetForActivityType:(id)a3
{
  id v4;
  id *v5;
  id v6;

  v4 = a3;
  if (!-[PUActivityItemSourceConfiguration _shouldFlattenSlomoVideoForActivityType:](self, "_shouldFlattenSlomoVideoForActivityType:", v4))goto LABEL_7;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BC88]) & 1) == 0)
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D96DC0]))
    {
      v5 = (id *)MEMORY[0x1E0C89E88];
      goto LABEL_6;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = (id *)MEMORY[0x1E0C89EA8];
LABEL_6:
  v6 = *v5;
LABEL_8:

  return v6;
}

- (id)_videoExportFileTypeForActivityType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (-[PUActivityItemSourceConfiguration _shouldFlattenSlomoVideoForActivityType:](self, "_shouldFlattenSlomoVideoForActivityType:", v4)&& objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BC88]))
  {
    v5 = (id)*MEMORY[0x1E0C8A2E0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_customAccessibilityLabel
{
  void *v2;
  void *v3;

  -[PHAsset descriptionProperties](self->_asset, "descriptionProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_wantsLivePhotoBundleForActivityType:(id)a3
{
  id v4;
  char v5;
  PHAssetPlaybackStyle v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  char v12;

  v4 = a3;
  v5 = -[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences");
  v6 = -[PHAsset playbackStyle](self->_asset, "playbackStyle");
  v7 = -[PHAsset isMediaSubtype:](self->_asset, "isMediaSubtype:", 8);
  if ((-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") & 0x10000000000) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend((id)objc_opt_class(), "_shouldExportAsUnmodifiedOriginalForActivityType:", v4);
  v9 = v6 == 3;
  v10 = v7 ^ 1;
  if (v6 == 3)
    v10 = 1;
  if (!v10)
    v9 = v8;
  if (v9 && (v5 & 1) == 0)
    v12 = objc_msgSend((id)objc_opt_class(), "isLivePhotoBundleSupportedByActivityType:", v4);
  else
    v12 = 0;

  return v12;
}

- (BOOL)_wantsAssetBundleForActivityType:(id)a3
{
  id v4;
  int v5;
  _BOOL8 v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "isAssetBundleSupportedByActivityType:", v4);

  if (v5)
    return ((unint64_t)-[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences") >> 32) & 1;
  else
    LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PUActivityItemSourceConfiguration *v4;
  PUActivityItemSourceConfiguration *v5;
  BOOL v6;

  v4 = (PUActivityItemSourceConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[PUActivityItemSourceConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v18;
  int64_t v19;
  int v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[PUActivityItemSourceConfiguration asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_4;
  -[PUActivityItemSourceConfiguration activityType](self, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_4;
  v11 = -[PUActivityItemSourceConfiguration sharingPreferences](self, "sharingPreferences");
  v13 = v12;
  v15 = objc_msgSend(v4, "sharingPreferences") ^ v11;
  if ((v15 & 0x101010101) != 0)
    goto LABEL_4;
  v16 = 0;
  if ((v15 & 0x10000000000) == 0 && v13 == v14)
  {
    v18 = -[PUActivityItemSourceConfiguration maxFileSizeLimit](self, "maxFileSizeLimit");
    if (v18 != objc_msgSend(v4, "maxFileSizeLimit")
      || (v19 = -[PUActivityItemSourceConfiguration outputType](self, "outputType"),
          v19 != objc_msgSend(v4, "outputType"))
      || (v20 = -[PUActivityItemSourceConfiguration requiresAssetExport](self, "requiresAssetExport"),
          v20 != objc_msgSend(v4, "requiresAssetExport"))
      || (v21 = -[PUActivityItemSourceConfiguration assetExportKind](self, "assetExportKind"),
          v21 != objc_msgSend(v4, "assetExportKind")))
    {
LABEL_4:
      v16 = 0;
      goto LABEL_5;
    }
    -[PUActivityItemSourceConfiguration assetExportRequestOptions](self, "assetExportRequestOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[PUActivityItemSourceConfiguration assetExportRequestOptions](self, "assetExportRequestOptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assetExportRequestOptions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v23, "isEqual:", v24);

    }
    else
    {
      v16 = 1;
    }
  }
LABEL_5:

  return v16;
}

- (unint64_t)maxFileSizeLimit
{
  return self->_maxFileSizeLimit;
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (BOOL)requiresAssetExport
{
  return self->_requiresAssetExport;
}

- (int64_t)assetExportKind
{
  return self->_assetExportKind;
}

- (PHAssetExportRequestOptions)assetExportRequestOptions
{
  return self->_assetExportRequestOptions;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- ($9D9B13A340AA60ED2DD68408BD7D962F)sharingPreferences
{
  int64_t preferredExportFormat;
  uint64_t v3;
  $9D9B13A340AA60ED2DD68408BD7D962F result;

  preferredExportFormat = self->_sharingPreferences.preferredExportFormat;
  v3 = *(_QWORD *)&self->_sharingPreferences.excludeLiveness;
  result.var6 = preferredExportFormat;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  return result;
}

- (void)setSharingPreferences:(id)a3
{
  self->_sharingPreferences = ($3FD7B82E0D0D833B9D006DE3CA1215AC)a3;
}

- (NSDictionary)sharingVariants
{
  return self->_sharingVariants;
}

- (void)setSharingVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingVariants, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetExportRequestOptions, 0);
}

+ (BOOL)isLivePhotoBundleSupportedByActivityType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_activitiesThatSupportLivePhotoBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "savePhotosBundlesToFilesWithoutExtractingMedia");

  if (v6)
  {
    v7 = *MEMORY[0x1E0D7BD30];
    v12[0] = *MEMORY[0x1E0D96E10];
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  v10 = objc_msgSend(v4, "containsObject:", v3);

  return v10;
}

+ (BOOL)isAssetBundleSupportedByActivityType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_activitiesThatSupportAssetBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "savePhotosBundlesToFilesWithoutExtractingMedia");

  if (v6)
  {
    v7 = *MEMORY[0x1E0D7BD30];
    v12[0] = *MEMORY[0x1E0D96E10];
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  v10 = objc_msgSend(v4, "containsObject:", v3);

  return v10;
}

+ (BOOL)supportsAssetLocalIdentifierForActivityType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7BDE8]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7BCD8]);

  return v4;
}

+ (BOOL)_dontAllowRAWForActivityType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_activitiesThatDontAllowRAW");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)_activitiesThatDontAllowRAW
{
  if (_activitiesThatDontAllowRAW_onceToken != -1)
    dispatch_once(&_activitiesThatDontAllowRAW_onceToken, &__block_literal_global_29743);
  return (id)_activitiesThatDontAllowRAW__activitiesThatDontAllowRAW;
}

+ (BOOL)_shouldExportAsUnmodifiedOriginalForActivityType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D7BD30]);
}

+ (id)_activitiesThatSupportLivePhotoBundles
{
  if (_activitiesThatSupportLivePhotoBundles_onceToken != -1)
    dispatch_once(&_activitiesThatSupportLivePhotoBundles_onceToken, &__block_literal_global_29);
  return (id)_activitiesThatSupportLivePhotoBundles__activitiesSupportingLivePhotoBundles;
}

+ (id)_activitiesThatSupportAssetBundles
{
  if (_activitiesThatSupportAssetBundles_onceToken != -1)
    dispatch_once(&_activitiesThatSupportAssetBundles_onceToken, &__block_literal_global_30);
  return (id)_activitiesThatSupportAssetBundles__activitiesSupportingAssetBundles;
}

+ (id)_activitiesThatDontRequireAssetExport
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PUActivityItemSourceConfiguration__activitiesThatDontRequireAssetExport__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_activitiesThatDontRequireAssetExport_onceToken != -1)
    dispatch_once(&_activitiesThatDontRequireAssetExport_onceToken, block);
  return (id)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
}

+ (id)_photosInternalActivities
{
  if (_photosInternalActivities_onceToken != -1)
    dispatch_once(&_photosInternalActivities_onceToken, &__block_literal_global_31);
  return (id)_photosInternalActivities__internalActivities;
}

+ (id)_photosActionSheetActivities
{
  if (_photosActionSheetActivities_onceToken != -1)
    dispatch_once(&_photosActionSheetActivities_onceToken, &__block_literal_global_32);
  return (id)_photosActionSheetActivities__internalActivities;
}

+ (id)_systemActivitiesThatDontSupportMomentShareLinks
{
  if (_systemActivitiesThatDontSupportMomentShareLinks_onceToken != -1)
    dispatch_once(&_systemActivitiesThatDontSupportMomentShareLinks_onceToken, &__block_literal_global_33);
  return (id)_systemActivitiesThatDontSupportMomentShareLinks__internalActivities;
}

+ (id)_activitiesThatDontSupportMomentShareLinks
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PUActivityItemSourceConfiguration__activitiesThatDontSupportMomentShareLinks__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_activitiesThatDontSupportMomentShareLinks_onceToken != -1)
    dispatch_once(&_activitiesThatDontSupportMomentShareLinks_onceToken, block);
  return (id)_activitiesThatDontSupportMomentShareLinks__momentShareUnsupportedActivities;
}

+ (id)_activitiesThatOnlySupportMomentShareLinks
{
  if (_activitiesThatOnlySupportMomentShareLinks_onceToken != -1)
    dispatch_once(&_activitiesThatOnlySupportMomentShareLinks_onceToken, &__block_literal_global_34);
  return (id)_activitiesThatOnlySupportMomentShareLinks__momentShareExclusiveActivities;
}

+ (id)_activitiesThatSupportHEIFHEVC
{
  if (_activitiesThatSupportHEIFHEVC_onceToken != -1)
    dispatch_once(&_activitiesThatSupportHEIFHEVC_onceToken, &__block_literal_global_35);
  return (id)_activitiesThatSupportHEIFHEVC__activitiesSupportingHEIFHEVC;
}

+ (id)_activitiesThatSupportSpatial
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PUActivityItemSourceConfiguration__activitiesThatSupportSpatial__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_activitiesThatSupportSpatial_onceToken != -1)
    dispatch_once(&_activitiesThatSupportSpatial_onceToken, block);
  return (id)_activitiesThatSupportSpatial__activitiesSupportingSpatial;
}

+ (BOOL)shouldProvideCompatibleFormatForActivityType:(id)a3 forAsset:(id)a4 inPreferredExportFormat:(int64_t)a5 withAvailableSharingVariants:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (v11
    && (objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E59BB070),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    if (a5)
    {
      v14 = a5 == 2;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_activitiesThatSupportHEIFHEVC");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "containsObject:", v9) & 1) != 0
        || (objc_msgSend((id)objc_opt_class(), "_photosInternalActivities"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "containsObject:", v9),
            v17,
            v18))
      {
        v19 = 0;
        v20 = 1;
      }
      else
      {
        v20 = 0;
        v19 = 1;
      }
      objc_msgSend((id)objc_opt_class(), "_activitiesThatSupportSpatial");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v9);
      v23 = v20 | objc_msgSend(v10, "isSpatialMedia") ^ 1;
      if (v22)
        v24 = 0;
      else
        v24 = v19;
      if (v23)
        v25 = v19;
      else
        v25 = v24;

      v14 = v25 != 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)shouldProvideAlternateVariantForActivityType:(id)a3 forAsset:(id)a4 inPreferredExportFormat:(int64_t)a5 withAvailableSharingVariants:(id)a6
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  int v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  LOBYTE(v12) = 0;
  if (v9 && v10)
  {
    if (shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants__onceToken != -1)
      dispatch_once(&shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants__onceToken, &__block_literal_global_39);
    if (objc_msgSend(v10, "canPlayLoopingVideo"))
    {
      v13 = objc_msgSend((id)shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___alternateVariantRequiredActivities, "containsObject:", v9);
      if (a5)
        v12 = 0;
      else
        v12 = v13;
      if (v11 && v12)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E59BB088);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = v14 != 0;

      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

+ (BOOL)shouldExcludeAlternateVariantForActivityType:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    if (shouldExcludeAlternateVariantForActivityType__onceToken != -1)
      dispatch_once(&shouldExcludeAlternateVariantForActivityType__onceToken, &__block_literal_global_41);
    if ((objc_msgSend((id)shouldExcludeAlternateVariantForActivityType___alternateVariantExcludedActivities, "containsObject:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_photosInternalActivities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "containsObject:", v3);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (unint64_t)maxFileSizeLimitForActivityType:(id)a3 asset:(id)a4
{
  id v5;
  unint64_t v6;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D7BC88])
    && objc_msgSend(v5, "playbackStyle") == 2)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D719E0], "maxGIFSizeForPublishing");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isMomentShareLinkSupportedByActivityType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_activitiesThatDontSupportMomentShareLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

+ (BOOL)isIndividualItemPreparationSupportedByActivityType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_activitiesThatOnlySupportMomentShareLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

+ (id)descriptionForOutputType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("unknown");
  else
    return off_1E589F688[a3];
}

+ (id)descriptionForAssetExportKind:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("unknown");
  else
    return off_1E589F6A8[a3];
}

void __82__PUActivityItemSourceConfiguration_shouldExcludeAlternateVariantForActivityType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D96E10];
  v3[0] = *MEMORY[0x1E0D96D88];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shouldExcludeAlternateVariantForActivityType___alternateVariantExcludedActivities;
  shouldExcludeAlternateVariantForActivityType___alternateVariantExcludedActivities = v1;

}

void __144__PUActivityItemSourceConfiguration_shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D7BD68];
  v3[0] = *MEMORY[0x1E0D96DB0];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___alternateVariantRequiredActivities;
  shouldProvideAlternateVariantForActivityType_forAsset_inPreferredExportFormat_withAvailableSharingVariants___alternateVariantRequiredActivities = v1;

}

void __66__PUActivityItemSourceConfiguration__activitiesThatSupportSpatial__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activitiesThatSupportHEIFHEVC");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D96DA0];
  v6[0] = *MEMORY[0x1E0D96DB0];
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_activitiesThatSupportSpatial__activitiesSupportingSpatial;
  _activitiesThatSupportSpatial__activitiesSupportingSpatial = v4;

}

void __67__PUActivityItemSourceConfiguration__activitiesThatSupportHEIFHEVC__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D96D88];
  v6[0] = *MEMORY[0x1E0D96DC0];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D96E10];
  v6[2] = *MEMORY[0x1E0D96E00];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D96E18];
  v6[4] = *MEMORY[0x1E0D7BD30];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E0D96DA8];
  v6[7] = CFSTR("com.apple.journal.JournalShareExtension");
  v3 = *MEMORY[0x1E0D7BE60];
  v6[8] = *MEMORY[0x1E0D7BE68];
  v6[9] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_activitiesThatSupportHEIFHEVC__activitiesSupportingHEIFHEVC;
  _activitiesThatSupportHEIFHEVC__activitiesSupportingHEIFHEVC = v4;

}

void __79__PUActivityItemSourceConfiguration__activitiesThatOnlySupportMomentShareLinks__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D7BCC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_activitiesThatOnlySupportMomentShareLinks__momentShareExclusiveActivities;
  _activitiesThatOnlySupportMomentShareLinks__momentShareExclusiveActivities = v0;

}

void __79__PUActivityItemSourceConfiguration__activitiesThatDontSupportMomentShareLinks__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "_photosInternalActivities");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "_activitiesThatDontRequireAssetExport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_photosActionSheetActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_systemActivitiesThatDontSupportMomentShareLinks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addObjectsFromArray:", v5);
  objc_msgSend(v8, "addObjectsFromArray:", v6);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D96D88]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D96DA0]);
  objc_msgSend(v8, "allObjects");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_activitiesThatDontSupportMomentShareLinks__momentShareUnsupportedActivities;
  _activitiesThatDontSupportMomentShareLinks__momentShareUnsupportedActivities = v9;

}

void __85__PUActivityItemSourceConfiguration__systemActivitiesThatDontSupportMomentShareLinks__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D96DC8];
  v6[0] = *MEMORY[0x1E0D96E00];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D7BD30];
  v6[2] = *MEMORY[0x1E0D96E10];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D7BD98];
  v6[4] = *MEMORY[0x1E0D7BCD8];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0D7BDE8];
  v6[6] = *MEMORY[0x1E0D96D90];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_systemActivitiesThatDontSupportMomentShareLinks__internalActivities;
  _systemActivitiesThatDontSupportMomentShareLinks__internalActivities = v4;

}

void __65__PUActivityItemSourceConfiguration__photosActionSheetActivities__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[38];

  v20[37] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D7BDC0];
  v20[0] = *MEMORY[0x1E0D7BC58];
  v20[1] = v0;
  v1 = *MEMORY[0x1E0D7BC70];
  v20[2] = *MEMORY[0x1E0D7BC68];
  v20[3] = v1;
  v2 = *MEMORY[0x1E0D7BCB8];
  v20[4] = *MEMORY[0x1E0D7BC90];
  v20[5] = v2;
  v3 = *MEMORY[0x1E0D7BCF0];
  v20[6] = *MEMORY[0x1E0D7BCC8];
  v20[7] = v3;
  v4 = *MEMORY[0x1E0D7BCF8];
  v20[8] = *MEMORY[0x1E0D7BD00];
  v20[9] = v4;
  v5 = *MEMORY[0x1E0D7BCE0];
  v20[10] = *MEMORY[0x1E0D7BD38];
  v20[11] = v5;
  v6 = *MEMORY[0x1E0D7BD40];
  v20[12] = *MEMORY[0x1E0D7BCE8];
  v20[13] = v6;
  v7 = *MEMORY[0x1E0D7BE18];
  v20[14] = *MEMORY[0x1E0D7BE10];
  v20[15] = v7;
  v8 = *MEMORY[0x1E0D7BCB0];
  v20[16] = *MEMORY[0x1E0D7BE58];
  v20[17] = v8;
  v9 = *MEMORY[0x1E0D7BC98];
  v20[18] = *MEMORY[0x1E0D7BD50];
  v20[19] = v9;
  v10 = *MEMORY[0x1E0D7BE30];
  v20[20] = *MEMORY[0x1E0D7BDB8];
  v20[21] = v10;
  v11 = *MEMORY[0x1E0D7BE70];
  v20[22] = *MEMORY[0x1E0D7BE40];
  v20[23] = v11;
  v12 = *MEMORY[0x1E0D7BEB8];
  v20[24] = *MEMORY[0x1E0D7BEA8];
  v20[25] = v12;
  v13 = *MEMORY[0x1E0D7BDE0];
  v20[26] = *MEMORY[0x1E0D7BEC0];
  v20[27] = v13;
  v14 = *MEMORY[0x1E0D7BE00];
  v20[28] = *MEMORY[0x1E0D7BDF8];
  v20[29] = v14;
  v15 = *MEMORY[0x1E0D7BE88];
  v20[30] = *MEMORY[0x1E0D7BEB0];
  v20[31] = v15;
  v16 = *MEMORY[0x1E0D7BE90];
  v20[32] = *MEMORY[0x1E0D7BE78];
  v20[33] = v16;
  v17 = *MEMORY[0x1E0D7BE20];
  v20[34] = *MEMORY[0x1E0D7BEA0];
  v20[35] = v17;
  v20[36] = *MEMORY[0x1E0D7BE28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 37);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)_photosActionSheetActivities__internalActivities;
  _photosActionSheetActivities__internalActivities = v18;

}

void __62__PUActivityItemSourceConfiguration__photosInternalActivities__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[22];

  v12[21] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D7BD48];
  v12[0] = *MEMORY[0x1E0D96E08];
  v12[1] = v0;
  v1 = *MEMORY[0x1E0D7BE08];
  v12[2] = *MEMORY[0x1E0D7BDF0];
  v12[3] = v1;
  v2 = *MEMORY[0x1E0D7BD58];
  v12[4] = *MEMORY[0x1E0D7BDB0];
  v12[5] = v2;
  v3 = *MEMORY[0x1E0D7BE38];
  v12[6] = *MEMORY[0x1E0D7BD08];
  v12[7] = v3;
  v4 = *MEMORY[0x1E0D7BC78];
  v12[8] = *MEMORY[0x1E0D7BC60];
  v12[9] = v4;
  v5 = *MEMORY[0x1E0D7BC88];
  v12[10] = *MEMORY[0x1E0D7BD98];
  v12[11] = v5;
  v6 = *MEMORY[0x1E0D7BE60];
  v12[12] = *MEMORY[0x1E0D7BE50];
  v12[13] = v6;
  v7 = *MEMORY[0x1E0D7BDF8];
  v12[14] = *MEMORY[0x1E0D7BDE0];
  v12[15] = v7;
  v8 = *MEMORY[0x1E0D7BDA8];
  v12[16] = *MEMORY[0x1E0D7BE00];
  v12[17] = v8;
  v9 = *MEMORY[0x1E0D7BD10];
  v12[18] = *MEMORY[0x1E0D7BDA0];
  v12[19] = v9;
  v12[20] = *MEMORY[0x1E0D7BD18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 21);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_photosInternalActivities__internalActivities;
  _photosInternalActivities__internalActivities = v10;

}

void __74__PUActivityItemSourceConfiguration__activitiesThatDontRequireAssetExport__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[20];

  v17[19] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D7BD48];
  v17[0] = *MEMORY[0x1E0D7BC80];
  v17[1] = v2;
  v3 = *MEMORY[0x1E0D7BE38];
  v17[2] = *MEMORY[0x1E0D7BD08];
  v17[3] = v3;
  v4 = *MEMORY[0x1E0D7BDF0];
  v17[4] = *MEMORY[0x1E0D96E30];
  v17[5] = v4;
  v5 = *MEMORY[0x1E0D7BDB0];
  v17[6] = *MEMORY[0x1E0D7BE08];
  v17[7] = v5;
  v6 = *MEMORY[0x1E0D7BC78];
  v17[8] = *MEMORY[0x1E0D7BC60];
  v17[9] = v6;
  v7 = *MEMORY[0x1E0D7BE50];
  v17[10] = *MEMORY[0x1E0D7BD88];
  v17[11] = v7;
  v8 = *MEMORY[0x1E0D7BDF8];
  v17[12] = *MEMORY[0x1E0D7BDE0];
  v17[13] = v8;
  v9 = *MEMORY[0x1E0D7BDA8];
  v17[14] = *MEMORY[0x1E0D7BE00];
  v17[15] = v9;
  v10 = *MEMORY[0x1E0D7BD10];
  v17[16] = *MEMORY[0x1E0D7BDA0];
  v17[17] = v10;
  v17[18] = *MEMORY[0x1E0D7BD18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 19);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  _activitiesThatDontRequireAssetExport__activitiesNotRequiringExport = v11;

  v13 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  objc_msgSend(*(id *)(a1 + 32), "_photosActionSheetActivities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_activitiesThatDontRequireAssetExport__activitiesNotRequiringExport;
  _activitiesThatDontRequireAssetExport__activitiesNotRequiringExport = v15;

}

void __71__PUActivityItemSourceConfiguration__activitiesThatSupportAssetBundles__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D7BD80];
  v3[0] = *MEMORY[0x1E0D96D88];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_activitiesThatSupportAssetBundles__activitiesSupportingAssetBundles;
  _activitiesThatSupportAssetBundles__activitiesSupportingAssetBundles = v1;

}

void __75__PUActivityItemSourceConfiguration__activitiesThatSupportLivePhotoBundles__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D96DC0];
  v5[0] = *MEMORY[0x1E0D96D88];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D7BE48];
  v5[2] = *MEMORY[0x1E0D96E08];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D7BE60];
  v5[4] = *MEMORY[0x1E0D7BC88];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0D7BD98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_activitiesThatSupportLivePhotoBundles__activitiesSupportingLivePhotoBundles;
  _activitiesThatSupportLivePhotoBundles__activitiesSupportingLivePhotoBundles = v3;

}

void __64__PUActivityItemSourceConfiguration__activitiesThatDontAllowRAW__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0D7BC88], *MEMORY[0x1E0D96DB0], 0);
  v2 = (void *)_activitiesThatDontAllowRAW__activitiesThatDontAllowRAW;
  _activitiesThatDontAllowRAW__activitiesThatDontAllowRAW = v1;

}

@end
