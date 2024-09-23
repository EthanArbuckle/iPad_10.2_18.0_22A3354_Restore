@implementation PFAssetBundle

- (PFAssetBundle)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ not supported for %@: use initWithPropertyList: or initWithAssetBundleAtURL:"), v5, objc_opt_class());

  return 0;
}

- (PFAssetBundle)initWithPropertyList:(id)a3
{
  id v4;
  PFAssetBundle *v5;
  uint64_t v6;
  NSDictionary *propertyList;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *metadata;
  uint64_t v33;
  NSURL *photoURL;
  uint64_t v35;
  NSURL *videoURL;
  uint64_t v37;
  NSURL *audioURL;
  uint64_t v39;
  NSURL *alternatePhotoURL;
  uint64_t v41;
  NSURL *fullSizePhotoURL;
  uint64_t v43;
  NSURL *fullSizeVideoURL;
  uint64_t v45;
  NSURL *adjustmentDataURL;
  uint64_t v47;
  NSURL *adjustmentBasePhotoURL;
  uint64_t v49;
  NSURL *pairedVideoURL;
  uint64_t v51;
  NSURL *fullSizePairedVideoURL;
  uint64_t v53;
  NSURL *adjustmentBasePairedVideoURL;
  uint64_t v55;
  NSURL *spatialOvercapturePhotoURL;
  uint64_t v57;
  NSURL *spatialOvercapturePairedVideoURL;
  uint64_t v59;
  NSURL *spatialOvercaptureVideoURL;
  uint64_t v61;
  NSURL *adjustmentBaseVideoURL;
  uint64_t v63;
  NSURL *originalAdjustmentDataURL;
  uint64_t v65;
  NSURL *adjustmentSecondaryDataURL;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned __int16 v72;
  unsigned int v73;
  objc_super v74;

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PFAssetBundle;
  v5 = -[PFAssetBundle init](&v74, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    propertyList = v5->_propertyList;
    v5->_propertyList = (NSDictionary *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PFAssetBundlePathMetadataKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataVersionKey"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPlaybackStyleKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataMediaTypeKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataMediaSubtypesKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v14, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPlaybackVariationKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v15, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataVideoComplementVisibilityStateKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v16, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v17, "BOOLValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPairingIdentifierKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v18 = 0;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataTimingInfoKey"), v68);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v19 = 0;
      }
    }
    else
    {
      v11 = 0;
      v13 = 0;
      v69 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v18 = 0;
      v19 = 0;
      v9 = 0;
    }
    v20 = CFSTR("1");
    if (v9)
      v20 = v9;
    v21 = v20;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = (id)objc_msgSend(v8, "mutableCopy");
    else
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = v22;
    v24 = (void *)-[__CFString copy](v21, "copy", v69);

    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("PFAssetBundleMetadataVersionKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("PFAssetBundleMetadataPlaybackStyleKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("PFAssetBundleMetadataMediaTypeKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v70);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("PFAssetBundleMetadataMediaSubtypesKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v71);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, CFSTR("PFAssetBundleMetadataPlaybackVariationKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v72);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("PFAssetBundleMetadataVideoComplementVisibilityStateKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v73);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, CFSTR("PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"));

    objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, CFSTR("PFAssetBundleMetadataPairingIdentifierKey"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, CFSTR("PFAssetBundleMetadataTimingInfoKey"));
    v31 = objc_msgSend(v23, "mutableCopy");
    metadata = v5->_metadata;
    v5->_metadata = (NSMutableDictionary *)v31;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathPhotoKey"), v4);
    v33 = objc_claimAutoreleasedReturnValue();
    photoURL = v5->_photoURL;
    v5->_photoURL = (NSURL *)v33;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathVideoKey"), v4);
    v35 = objc_claimAutoreleasedReturnValue();
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v35;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAudioKey"), v4);
    v37 = objc_claimAutoreleasedReturnValue();
    audioURL = v5->_audioURL;
    v5->_audioURL = (NSURL *)v37;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAlternatePhotoKey"), v4);
    v39 = objc_claimAutoreleasedReturnValue();
    alternatePhotoURL = v5->_alternatePhotoURL;
    v5->_alternatePhotoURL = (NSURL *)v39;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathFullSizePhotoKey"), v4);
    v41 = objc_claimAutoreleasedReturnValue();
    fullSizePhotoURL = v5->_fullSizePhotoURL;
    v5->_fullSizePhotoURL = (NSURL *)v41;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathFullSizeVideoKey"), v4);
    v43 = objc_claimAutoreleasedReturnValue();
    fullSizeVideoURL = v5->_fullSizeVideoURL;
    v5->_fullSizeVideoURL = (NSURL *)v43;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAdjustmentDataKey"), v4);
    v45 = objc_claimAutoreleasedReturnValue();
    adjustmentDataURL = v5->_adjustmentDataURL;
    v5->_adjustmentDataURL = (NSURL *)v45;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAdjustmentBasePhotoKey"), v4);
    v47 = objc_claimAutoreleasedReturnValue();
    adjustmentBasePhotoURL = v5->_adjustmentBasePhotoURL;
    v5->_adjustmentBasePhotoURL = (NSURL *)v47;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathPairedVideoKey"), v4);
    v49 = objc_claimAutoreleasedReturnValue();
    pairedVideoURL = v5->_pairedVideoURL;
    v5->_pairedVideoURL = (NSURL *)v49;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathFullSizePairedVideoKey"), v4);
    v51 = objc_claimAutoreleasedReturnValue();
    fullSizePairedVideoURL = v5->_fullSizePairedVideoURL;
    v5->_fullSizePairedVideoURL = (NSURL *)v51;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAdjustmentBasePairedVideoKey"), v4);
    v53 = objc_claimAutoreleasedReturnValue();
    adjustmentBasePairedVideoURL = v5->_adjustmentBasePairedVideoURL;
    v5->_adjustmentBasePairedVideoURL = (NSURL *)v53;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathSpatialOvercapturePhotoKey"), v4);
    v55 = objc_claimAutoreleasedReturnValue();
    spatialOvercapturePhotoURL = v5->_spatialOvercapturePhotoURL;
    v5->_spatialOvercapturePhotoURL = (NSURL *)v55;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathSpatialOvercapturePairedVideoKey"), v4);
    v57 = objc_claimAutoreleasedReturnValue();
    spatialOvercapturePairedVideoURL = v5->_spatialOvercapturePairedVideoURL;
    v5->_spatialOvercapturePairedVideoURL = (NSURL *)v57;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathSpatialOvercaptureVideoKey"), v4);
    v59 = objc_claimAutoreleasedReturnValue();
    spatialOvercaptureVideoURL = v5->_spatialOvercaptureVideoURL;
    v5->_spatialOvercaptureVideoURL = (NSURL *)v59;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAdjustmentBaseVideoKey"), v4);
    v61 = objc_claimAutoreleasedReturnValue();
    adjustmentBaseVideoURL = v5->_adjustmentBaseVideoURL;
    v5->_adjustmentBaseVideoURL = (NSURL *)v61;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey"), v4);
    v63 = objc_claimAutoreleasedReturnValue();
    originalAdjustmentDataURL = v5->_originalAdjustmentDataURL;
    v5->_originalAdjustmentDataURL = (NSURL *)v63;

    createURLForAbsolutePathKeyInDictionary(CFSTR("PFAssetBundlePathAdjustmentSecondaryDataKey"), v4);
    v65 = objc_claimAutoreleasedReturnValue();
    adjustmentSecondaryDataURL = v5->_adjustmentSecondaryDataURL;
    v5->_adjustmentSecondaryDataURL = (NSURL *)v65;

  }
  return v5;
}

- (PFAssetBundle)initWithAssetBundleAtURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  PFAssetBundle *v24;
  PFAssetBundle *v25;
  void *v26;
  void *v28;
  id v29;
  PFAssetBundle *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _QWORD v43[19];

  v43[17] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("photosasset"));

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "path");
    v8 = 1;
    v37 = 1;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "fileExistsAtPath:isDirectory:", v9, &v37) && !v37)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 == 0;
      if (v10)
      {
        v28 = v9;
        v29 = v4;
        v11 = v7;
        v30 = self;
        v43[0] = CFSTR("PFAssetBundlePathPhotoKey");
        v43[1] = CFSTR("PFAssetBundlePathVideoKey");
        v43[2] = CFSTR("PFAssetBundlePathAudioKey");
        v43[3] = CFSTR("PFAssetBundlePathAlternatePhotoKey");
        v43[4] = CFSTR("PFAssetBundlePathFullSizePhotoKey");
        v43[5] = CFSTR("PFAssetBundlePathFullSizeVideoKey");
        v43[6] = CFSTR("PFAssetBundlePathAdjustmentDataKey");
        v43[7] = CFSTR("PFAssetBundlePathAdjustmentBasePhotoKey");
        v43[8] = CFSTR("PFAssetBundlePathPairedVideoKey");
        v43[9] = CFSTR("PFAssetBundlePathFullSizePairedVideoKey");
        v43[10] = CFSTR("PFAssetBundlePathAdjustmentBasePairedVideoKey");
        v43[11] = CFSTR("PFAssetBundlePathSpatialOvercapturePhotoKey");
        v43[12] = CFSTR("PFAssetBundlePathSpatialOvercapturePairedVideoKey");
        v43[13] = CFSTR("PFAssetBundlePathSpatialOvercaptureVideoKey");
        v43[14] = CFSTR("PFAssetBundlePathAdjustmentBaseVideoKey");
        v43[15] = CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey");
        v43[16] = CFSTR("PFAssetBundlePathAdjustmentSecondaryDataKey");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 17);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v34;
          v16 = MEMORY[0x1E0C81028];
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_msgSend(v32, "stringByAppendingPathComponent:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v31, "fileExistsAtPath:", v20) & 1) == 0
                  && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543618;
                  v39 = v18;
                  v40 = 2114;
                  v41 = v20;
                  _os_log_impl(&dword_1A16EE000, v16, OS_LOG_TYPE_INFO, "[PFAssetBundle] File resource is missing for key %{public}@ even though it's in the manifest: %{public}@ ", buf, 0x16u);
                }
                objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v18);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v14);
        }

        v4 = v29;
        self = v30;
        v7 = v11;
        v9 = v28;
        v8 = 0;
      }

    }
    objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("metadata.plist"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "fileExistsAtPath:isDirectory:", v21, &v37);

    v24 = 0;
    if (!v23)
      goto LABEL_29;
    if (v37)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v21);
    v25 = (PFAssetBundle *)objc_claimAutoreleasedReturnValue();
    v24 = v25;
    if (!v25)
      goto LABEL_29;
    -[PFAssetBundle objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataVersionKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("1")) & 1) != 0)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("PFAssetBundlePathMetadataKey"));

      if (!v8)
      {
        self = -[PFAssetBundle initWithPropertyList:](self, "initWithPropertyList:", v7);
        v24 = self;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {

    }
    v24 = 0;
    goto LABEL_29;
  }
  v24 = 0;
LABEL_30:

  return v24;
}

- (int64_t)playbackStyle
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPlaybackStyleKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPlaybackStyleKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)mediaType
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataMediaTypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataMediaTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (unint64_t)mediaSubtypes
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataMediaSubtypesKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataMediaSubtypesKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (unint64_t)playbackVariation
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPlaybackVariationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPlaybackVariationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (unsigned)videoComplementVisibilityState
{
  void *v3;
  void *v4;
  unsigned __int16 v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataVideoComplementVisibilityStateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataVideoComplementVisibilityStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (NSSet)keywordTitles
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataKeywordTitlesKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataKeywordTitlesKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (NSSet *)v3;
}

- (NSString)assetDescription
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataAssetDescriptionKey"));
}

- (NSString)accessibilityDescription
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataAccessibilityDescriptionKey"));
}

- (NSString)assetTitle
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataAssetTitleKey"));
}

- (NSString)originalFilename
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataOriginalFilenameKey"));
}

- (NSDate)libraryCreationDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryCreationDateKey"));
}

- (NSTimeZone)libraryCreationDateTimeZone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryCreationDateTimeZoneNameKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryCreationDateTimeZoneOffsetSecondsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "integerValue");
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return (NSTimeZone *)v4;
}

- (id)libraryLocation
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  double latitude;
  double longitude;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  CLLocationCoordinate2D v38;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationLatitudeKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  v4 = (void *)v3;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationLongitudeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_23;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationLatitudeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationLongitudeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v38 = CLLocationCoordinate2DMake(v8, v11);
  latitude = v38.latitude;
  longitude = v38.longitude;
  if (!CLLocationCoordinate2DIsValid(v38))
  {
LABEL_8:
    v5 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationAltitudeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationAltitudeKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

  }
  else
  {
    v17 = 0.0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationHorizontalAccuracyKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -1.0;
  v20 = -1.0;
  if (v18)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationHorizontalAccuracyKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v20 = v22;

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationVerticalAccuracyKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationVerticalAccuracyKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v19 = v25;

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationCourseKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -1.0;
  v28 = -1.0;
  if (v26)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationCourseKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v28 = v30;

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationSpeedKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationSpeedKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v27 = v33;

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationTimestampKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataLibraryLocationTimestampKey"));
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v36, latitude, longitude, v17, v20, v19, v28, v27);

LABEL_23:
  return v5;
}

- (BOOL)spatialOvercaptureResourcesPurgeable
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (NSString)livePhotoPairingIdentifier
{
  void *v3;

  if (-[PFAssetBundle isMediaSubtype:](self, "isMediaSubtype:", 8))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataPairingIdentifierKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[PFAssetBundle livePhotoOriginalPairingIdentifier](self, "livePhotoOriginalPairingIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoImageDisplayTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;
  CMTime v7;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PFAssetBundle isMediaSubtype:](self, "isMediaSubtype:", 8);
  if ((_DWORD)result)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFAssetBundleMetadataTimingInfoKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v7, (CFDictionaryRef)v6);
    else
      result = -[PFAssetBundle livePhotoOriginalImageDisplayTime](self, "livePhotoOriginalImageDisplayTime");
    *(CMTime *)retstr = v7;
  }
  return result;
}

- (void)_readLivePhotoVideoMetadataIfNeeded
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *livePhotoOriginalPairingIdentifier;
  $95D729B680665BEAEFA1D6FCA8238556 *p_livePhotoOriginalVideoDuration;
  __int128 v8;
  int64_t v9;

  if (!self->_didReadOriginalPairedVideoMetadata && -[PFAssetBundle isMediaSubtype:](self, "isMediaSubtype:", 8))
  {
    self->_didReadOriginalPairedVideoMetadata = 1;
    -[NSURL path](self->_pairedVideoURL, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PFVideoComplementMetadataForVideoAtPath((uint64_t)v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    livePhotoOriginalPairingIdentifier = self->_livePhotoOriginalPairingIdentifier;
    self->_livePhotoOriginalPairingIdentifier = v5;

    p_livePhotoOriginalVideoDuration = &self->_livePhotoOriginalVideoDuration;
    if (v4)
    {
      objc_msgSend(v4, "videoDuration");
      *(_OWORD *)&p_livePhotoOriginalVideoDuration->value = v8;
      self->_livePhotoOriginalVideoDuration.epoch = v9;
      objc_msgSend(v4, "imageDisplayTime");
    }
    else
    {
      p_livePhotoOriginalVideoDuration->value = 0;
      *(_QWORD *)&self->_livePhotoOriginalVideoDuration.timescale = 0;
      self->_livePhotoOriginalVideoDuration.epoch = 0;
      v8 = 0uLL;
      v9 = 0;
    }
    *(_OWORD *)&self->_livePhotoOriginalImageDisplayTime.value = v8;
    self->_livePhotoOriginalImageDisplayTime.epoch = v9;

  }
}

- (BOOL)isMediaSubtype:(unint64_t)a3
{
  return (a3 & ~-[PFAssetBundle mediaSubtypes](self, "mediaSubtypes")) == 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoOriginalVideoDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PFAssetBundle _readLivePhotoVideoMetadataIfNeeded](self, "_readLivePhotoVideoMetadataIfNeeded");
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_livePhotoOriginalVideoDuration;
  return result;
}

- (NSString)livePhotoOriginalPairingIdentifier
{
  -[PFAssetBundle _readLivePhotoVideoMetadataIfNeeded](self, "_readLivePhotoVideoMetadataIfNeeded");
  return self->_livePhotoOriginalPairingIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoOriginalImageDisplayTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PFAssetBundle _readLivePhotoVideoMetadataIfNeeded](self, "_readLivePhotoVideoMetadataIfNeeded");
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_livePhotoOriginalImageDisplayTime;
  return result;
}

- (void)setKeywordTitles:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("PFAssetBundleMetadataKeywordTitlesKey"));

}

- (void)setAssetDescription:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("PFAssetBundleMetadataAssetDescriptionKey"));

}

- (void)setAccessibilityDescription:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("PFAssetBundleMetadataAccessibilityDescriptionKey"));

}

- (void)setAssetTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("PFAssetBundleMetadataAssetTitleKey"));

}

- (void)setOriginalFilename:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v4, CFSTR("PFAssetBundleMetadataOriginalFilenameKey"));

}

- (void)setLibraryCreationDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v10, CFSTR("PFAssetBundleMetadataLibraryCreationDateKey"));
  if (v10 && v6)
  {
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "secondsFromGMTForDate:", v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v7, CFSTR("PFAssetBundleMetadataLibraryCreationDateTimeZoneNameKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v9, CFSTR("PFAssetBundleMetadataLibraryCreationDateTimeZoneOffsetSecondsKey"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", 0, CFSTR("PFAssetBundleMetadataLibraryCreationDateTimeZoneNameKey"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", 0, CFSTR("PFAssetBundleMetadataLibraryCreationDateTimeZoneOffsetSecondsKey"));
  }

}

- (void)setLibraryLocation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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

  v23 = a3;
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", &stru_1E45A8128, CFSTR("PFAssetBundleMetadataLibraryLocationKey"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = (void *)MEMORY[0x1E0C99E08];
        v5 = v23;
        objc_msgSend(v4, "dictionaryWithCapacity:", 8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "coordinate");
        objc_msgSend(v7, "numberWithDouble:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("PFAssetBundleMetadataLibraryLocationLatitudeKey"));

        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "coordinate");
        objc_msgSend(v9, "numberWithDouble:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("PFAssetBundleMetadataLibraryLocationLongitudeKey"));

        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "altitude");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("PFAssetBundleMetadataLibraryLocationAltitudeKey"));

        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "horizontalAccuracy");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("PFAssetBundleMetadataLibraryLocationHorizontalAccuracyKey"));

        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "verticalAccuracy");
        objc_msgSend(v16, "numberWithDouble:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("PFAssetBundleMetadataLibraryLocationVerticalAccuracyKey"));

        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "course");
        objc_msgSend(v18, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("PFAssetBundleMetadataLibraryLocationCourseKey"));

        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "speed");
        objc_msgSend(v20, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("PFAssetBundleMetadataLibraryLocationSpeedKey"));

        objc_msgSend(v5, "timestamp");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("PFAssetBundleMetadataLibraryLocationTimestampKey"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v6, CFSTR("PFAssetBundleMetadataLibraryLocationKey"));

      }
    }
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_metadata, "removeObjectForKey:", CFSTR("PFAssetBundleMetadataLibraryLocationKey"));
  }

}

- (void)setSpatialOvercaptureResourcesPurgeable:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v3, CFSTR("PFAssetBundleMetadataSpatialOvercaptureResourcesPurgeableKey"));
}

- (BOOL)linkOrCopyURL:(id)a3 toURL:(id)a4 forceCopy:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  char v15;
  void *v16;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    v13 = 0;
  }
  else
  {
    v19 = 0;
    v14 = objc_msgSend(v11, "linkItemAtURL:toURL:error:", v9, v10, &v19);
    v13 = v19;
    if ((v14 & 1) != 0)
    {
      v15 = 1;
      goto LABEL_8;
    }
  }
  v16 = v13;
  v18 = v13;
  v15 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v9, v10, &v18);
  v13 = v18;

  if (a6 && (v15 & 1) == 0)
  {
    v13 = objc_retainAutorelease(v13);
    v15 = 0;
    *a6 = v13;
  }
LABEL_8:

  return v15;
}

- (id)dcfCompliantFilenameBaseForWritingResourceFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PFAssetBundle originalFilename](self, "originalFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "isValidDCFFileName:", v3))
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v4;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Using original filename from metadata as base: %@", buf, 0xCu);
    }
  }
  else
  {
    v4 = 0;
  }
  -[PFAssetBundle photoURL](self, "photoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PFAssetBundle videoURL](self, "videoURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("photosasset"));

    if (v11)
    {
      objc_msgSend(v9, "URLByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend((id)objc_opt_class(), "isValidDCFFileName:", v13))
      {
        objc_msgSend(v13, "stringByDeletingPathExtension");
        v14 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Using bundle URL filename as base: %@", buf, 0xCu);
        }
      }
      else
      {
        v14 = (uint64_t)v4;
      }

      v4 = (void *)v14;
    }

  }
  objc_msgSend(v8, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") || !objc_msgSend((id)objc_opt_class(), "isValidDCFFileName:", v15))
  {
    v16 = v4;
  }
  else
  {
    objc_msgSend(v15, "stringByDeletingPathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v16;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Using primary resource filename as base: %@", buf, 0xCu);
    }
  }
  if (objc_msgSend(v16, "length"))
  {
    v17 = v16;
  }
  else
  {
    v18 = objc_msgSend(v15, "hash");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IMG_%04u"), v18 % 0x2710);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v17;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] DCF compliant name generation: Generated name from hash. Result: %@", buf, 0xCu);
    }
  }

  return v17;
}

- (id)generateCustomFilenamesByPathKey
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssetBundle dcfCompliantFilenameBaseForWritingResourceFiles](self, "dcfCompliantFilenameBaseForWritingResourceFiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __49__PFAssetBundle_generateCustomFilenamesByPathKey__block_invoke;
  v27[3] = &unk_1E45A4810;
  v27[4] = self;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1B0CFA4](v27);
  ((void (**)(_QWORD, NSURL *, void *, _QWORD))v5)[2](v5, self->_photoURL, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("PFAssetBundlePathPhotoKey"));

  ((void (**)(_QWORD, NSURL *, void *, _QWORD))v5)[2](v5, self->_videoURL, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PFAssetBundlePathVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, _QWORD))v5)[2](v5, self->_audioURL, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("PFAssetBundlePathAudioKey"));

  ((void (**)(_QWORD, NSURL *, void *, _QWORD))v5)[2](v5, self->_alternatePhotoURL, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("PFAssetBundlePathAlternatePhotoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_fullSizePhotoURL, v4, CFSTR("E"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PFAssetBundlePathFullSizePhotoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_fullSizeVideoURL, v4, CFSTR("E"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("PFAssetBundlePathFullSizeVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_adjustmentBasePhotoURL, v4, CFSTR("B"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("PFAssetBundlePathAdjustmentBasePhotoKey"));

  ((void (**)(_QWORD, NSURL *, void *, _QWORD))v5)[2](v5, self->_pairedVideoURL, v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("PFAssetBundlePathPairedVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_fullSizePairedVideoURL, v4, CFSTR("E"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("PFAssetBundlePathFullSizePairedVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_adjustmentBasePairedVideoURL, v4, CFSTR("B"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PFAssetBundlePathAdjustmentBasePairedVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_spatialOvercapturePhotoURL, v4, CFSTR("S"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("PFAssetBundlePathSpatialOvercapturePhotoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_spatialOvercapturePairedVideoURL, v4, CFSTR("S"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("PFAssetBundlePathSpatialOvercapturePairedVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_spatialOvercaptureVideoURL, v4, CFSTR("S"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("PFAssetBundlePathSpatialOvercaptureVideoKey"));

  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_adjustmentBaseVideoURL, v4, CFSTR("B"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("PFAssetBundlePathAdjustmentBaseVideoKey"));

  objc_msgSend(CFSTR("aae"), "uppercaseString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("PFAssetBundlePathAdjustmentDataKey"));
  objc_msgSend((id)objc_opt_class(), "insertAuxiliaryResourceTypeMarker:intoFileName:", CFSTR("O"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey"));
  ((void (**)(_QWORD, NSURL *, void *, const __CFString *))v5)[2](v5, self->_adjustmentSecondaryDataURL, v4, CFSTR("A"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByDeletingPathExtension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByAppendingPathExtension:", CFSTR("DAT"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("PFAssetBundlePathAdjustmentSecondaryDataKey"));

  return v3;
}

- (BOOL)writeAllResourceURLsToDirectoryAtURL:(id)a3 updatingManifest:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PFAssetBundle *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v21 = a4;
  -[PFAssetBundle generateCustomFilenamesByPathKey](self, "generateCustomFilenamesByPathKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self;
  -[PFAssetBundle urlsByPathKey](self, "urlsByPathKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v12 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = UTTypeForBundlePathKey(v14);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 & 1) != 0)
          v12 = -[PFAssetBundle _writeFileAtURL:toDirectory:withUpdatedFilename:updateManifest:bundlePathKey:verifyUTIType:error:](v19, "_writeFileAtURL:toDirectory:withUpdatedFilename:updateManifest:bundlePathKey:verifyUTIType:error:", v15, v22, v17, v21, v14, v16, a5);
        else
          v12 = 0;

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)writeToBundleAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  int v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    -[PFAssetBundle createAssetBundleWritingErrorWithDescription:](self, "createAssetBundleWritingErrorWithDescription:", CFSTR("Destination URL for asset bundle is not a file URL: '%@'"), v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    v14 = MEMORY[0x1E0C81028];
    v15 = "[PFAssetBundle] Destination URL for asset bundle is not a file URL: %@";
    goto LABEL_8;
  }
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("photosasset"));

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "fileExistsAtPath:", v10);

    if (v11)
    {
      -[PFAssetBundle createAssetBundleWritingErrorWithDescription:](self, "createAssetBundleWritingErrorWithDescription:", CFSTR("Destination for asset bundle already exists: '%@'"), v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      v14 = MEMORY[0x1E0C81028];
      v15 = "[PFAssetBundle] Destination for asset bundle already exists: '%@'";
LABEL_8:
      _os_log_impl(&dword_1A16EE000, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
      goto LABEL_12;
    }
    v31 = 0;
    v18 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v31);
    v12 = v31;
    v13 = v18 ^ 1;
  }
  else
  {
    objc_msgSend(v6, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFAssetBundle createAssetBundleWritingErrorWithDescription:](self, "createAssetBundleWritingErrorWithDescription:", CFSTR("Destination has extension '%@' but requires '%@'"), v16, CFSTR("photosasset"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "pathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v17;
      v34 = 2112;
      v35 = CFSTR("photosasset");
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Destination has extension '%@' but requires '%@'", buf, 0x16u);

    }
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v12;
  v20 = -[PFAssetBundle writeAllResourceURLsToDirectoryAtURL:updatingManifest:error:](self, "writeAllResourceURLsToDirectoryAtURL:updatingManifest:error:", v6, v19, &v30);
  v21 = v30;

  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("manifest.plist"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v23 = objc_msgSend(v19, "writeToURL:atomically:", v22, 1);
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v25 = -[NSMutableDictionary writeToURL:atomically:](self->_metadata, "writeToURL:atomically:", v24, 1);
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = 0;
LABEL_17:
  if (((v25 | v13) & 1) != 0)
  {
    if (!v25)
      goto LABEL_19;
LABEL_22:
    v26 = *MEMORY[0x1E0C99A00];
    v29 = v21;
    objc_msgSend(v6, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v26, &v29);
    v27 = v29;

    v21 = v27;
    if (!a4)
      goto LABEL_25;
    goto LABEL_23;
  }
  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);
  if (v25)
    goto LABEL_22;
LABEL_19:
  if (!a4)
    goto LABEL_25;
LABEL_23:
  if (v21)
    *a4 = objc_retainAutorelease(v21);
LABEL_25:

  return v25;
}

- (id)urlsByPathKey
{
  void *v3;
  void *v4;
  NSURL *photoURL;
  NSURL *videoURL;
  NSURL *audioURL;
  NSURL *alternatePhotoURL;
  NSURL *fullSizePhotoURL;
  NSURL *fullSizeVideoURL;
  NSURL *adjustmentDataURL;
  NSURL *adjustmentBasePhotoURL;
  NSURL *pairedVideoURL;
  NSURL *fullSizePairedVideoURL;
  NSURL *adjustmentBasePairedVideoURL;
  NSURL *spatialOvercapturePhotoURL;
  NSURL *spatialOvercapturePairedVideoURL;
  NSURL *spatialOvercaptureVideoURL;
  NSURL *adjustmentBaseVideoURL;
  NSURL *originalAdjustmentDataURL;
  NSURL *adjustmentSecondaryDataURL;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  photoURL = self->_photoURL;
  if (photoURL)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", photoURL, CFSTR("PFAssetBundlePathPhotoKey"));
  videoURL = self->_videoURL;
  if (videoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", videoURL, CFSTR("PFAssetBundlePathVideoKey"));
  audioURL = self->_audioURL;
  if (audioURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", audioURL, CFSTR("PFAssetBundlePathAudioKey"));
  alternatePhotoURL = self->_alternatePhotoURL;
  if (alternatePhotoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", alternatePhotoURL, CFSTR("PFAssetBundlePathAlternatePhotoKey"));
  fullSizePhotoURL = self->_fullSizePhotoURL;
  if (fullSizePhotoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", fullSizePhotoURL, CFSTR("PFAssetBundlePathFullSizePhotoKey"));
  fullSizeVideoURL = self->_fullSizeVideoURL;
  if (fullSizeVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", fullSizeVideoURL, CFSTR("PFAssetBundlePathFullSizeVideoKey"));
  adjustmentDataURL = self->_adjustmentDataURL;
  if (adjustmentDataURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", adjustmentDataURL, CFSTR("PFAssetBundlePathAdjustmentDataKey"));
  adjustmentBasePhotoURL = self->_adjustmentBasePhotoURL;
  if (adjustmentBasePhotoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", adjustmentBasePhotoURL, CFSTR("PFAssetBundlePathAdjustmentBasePhotoKey"));
  pairedVideoURL = self->_pairedVideoURL;
  if (pairedVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", pairedVideoURL, CFSTR("PFAssetBundlePathPairedVideoKey"));
  fullSizePairedVideoURL = self->_fullSizePairedVideoURL;
  if (fullSizePairedVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", fullSizePairedVideoURL, CFSTR("PFAssetBundlePathFullSizePairedVideoKey"));
  adjustmentBasePairedVideoURL = self->_adjustmentBasePairedVideoURL;
  if (adjustmentBasePairedVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", adjustmentBasePairedVideoURL, CFSTR("PFAssetBundlePathAdjustmentBasePairedVideoKey"));
  spatialOvercapturePhotoURL = self->_spatialOvercapturePhotoURL;
  if (spatialOvercapturePhotoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", spatialOvercapturePhotoURL, CFSTR("PFAssetBundlePathSpatialOvercapturePhotoKey"));
  spatialOvercapturePairedVideoURL = self->_spatialOvercapturePairedVideoURL;
  if (spatialOvercapturePairedVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", spatialOvercapturePairedVideoURL, CFSTR("PFAssetBundlePathSpatialOvercapturePairedVideoKey"));
  spatialOvercaptureVideoURL = self->_spatialOvercaptureVideoURL;
  if (spatialOvercaptureVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", spatialOvercaptureVideoURL, CFSTR("PFAssetBundlePathSpatialOvercaptureVideoKey"));
  adjustmentBaseVideoURL = self->_adjustmentBaseVideoURL;
  if (adjustmentBaseVideoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", adjustmentBaseVideoURL, CFSTR("PFAssetBundlePathAdjustmentBaseVideoKey"));
  originalAdjustmentDataURL = self->_originalAdjustmentDataURL;
  if (originalAdjustmentDataURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", originalAdjustmentDataURL, CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey"));
  adjustmentSecondaryDataURL = self->_adjustmentSecondaryDataURL;
  if (adjustmentSecondaryDataURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", adjustmentSecondaryDataURL, CFSTR("PFAssetBundlePathAdjustmentSecondaryDataKey"));
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 withUpdatedFilename:(id)a5 updateManifest:(id)a6 bundlePathKey:(id)a7 verifyUTIType:(__CFString *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  id v27;
  __CFString *v28;
  id v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  objc_msgSend(v15, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", v20) & 1) != 0)
  {

    if (!a8)
    {
      v17 = 0;
      goto LABEL_12;
    }
LABEL_7:
    v38 = v20;
    v39 = v16;
    v21 = v18;
    objc_msgSend(v15, "pathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v23 = 1;
    goto LABEL_8;
  }
  if (!a8)
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not write source file at URL %@ to disk. Expected uti type was not supplied.", buf, 0xCu);
    }
    goto LABEL_20;
  }
  if (!v17)
    goto LABEL_7;
  v38 = v20;
  v39 = v16;
  v21 = v18;
  objc_msgSend(v17, "pathExtension");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PFAssetBundle _pathExtension:matchesType:error:](self, "_pathExtension:matchesType:error:", v22, v24, a9);

  if (*a9)
  {
    v26 = MEMORY[0x1E0C81028];
    v27 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      if ((v23 & 1) != 0)
      {
        v28 = &stru_1E45A8128;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(updated filename: %@)"), v17);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v29 = *a9;
      *(_DWORD *)buf = 138543874;
      v42 = v15;
      v43 = 2114;
      v44 = v28;
      v45 = 2114;
      v46 = v29;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not write source file at URL %{public}@ %{public}@ to disk. Error: %{public}@", buf, 0x20u);
      if ((v23 & 1) == 0)

    }
  }

  if (!v25)
  {
    LOBYTE(v30) = 0;
    v18 = v21;
    v20 = v38;
    v16 = v39;
    goto LABEL_30;
  }
  v18 = v21;
  v20 = v38;
  v16 = v39;
LABEL_20:
  if (-[PFAssetBundle _verifyFileSourceExistsAtURL:error:](self, "_verifyFileSourceExistsAtURL:error:", v15, a9))
  {
    v40 = 0;
    v30 = -[PFAssetBundle _writeFileAtURL:toDirectory:withUpdatedFilename:writtenFileURL:error:](self, "_writeFileAtURL:toDirectory:withUpdatedFilename:writtenFileURL:error:", v15, v16, v17, &v40, a9);
    v31 = v40;
    v32 = v31;
    if (v30 && v31)
    {
      objc_msgSend(v31, "lastPathComponent");
      v33 = v20;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, v19);

      v20 = v33;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v32, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v35;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PFAssetBundle] wrote file at path: %@", buf, 0xCu);

        v20 = v33;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v36 = (__CFString *)*a9;
      *(_DWORD *)buf = 138412546;
      v42 = v15;
      v43 = 2114;
      v44 = v36;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not write source file at URL %@ to disk. Error: %{public}@", buf, 0x16u);
    }

  }
  else
  {
    LOBYTE(v30) = 0;
  }
LABEL_30:

  return v30;
}

- (BOOL)_pathExtension:(id)a3 matchesType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[PFUniformTypeUtilities typeWithFilenameExtension:](PFUniformTypeUtilities, "typeWithFilenameExtension:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("aae"), "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    +[PFUniformTypeUtilities supplementalResourceAAEType](PFUniformTypeUtilities, "supplementalResourceAAEType");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  if (v10 && (objc_msgSend(v10, "conformsToType:", v9) & 1) != 0)
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    -[PFAssetBundle createAssetBundleWritingErrorWithDescription:](self, "createAssetBundleWritingErrorWithDescription:", CFSTR("UTType is not %@ for path extension '%@'"), v9, v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Path extension: %@ does not conform to expected UTI: %@.", buf, 0x16u);
    }
    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)_verifyFileSourceExistsAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  const char *v11;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v13);

  if ((v9 & 1) != 0)
  {
    if (!v13)
    {
      LOBYTE(a4) = 1;
      goto LABEL_12;
    }
    if (a4)
    {
      -[PFAssetBundle createAssetBundleWritingErrorWithDescription:](self, "createAssetBundleWritingErrorWithDescription:", CFSTR("Directory exists at '%@'"), v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        v10 = MEMORY[0x1E0C81028];
        v11 = "[PFAssetBundle] Source file is not a file, but a directory at URL: %@.";
LABEL_9:
        _os_log_impl(&dword_1A16EE000, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else if (a4)
  {
    -[PFAssetBundle createAssetBundleWritingErrorWithDescription:](self, "createAssetBundleWritingErrorWithDescription:", CFSTR("No file exists at '%@'"), v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      v10 = MEMORY[0x1E0C81028];
      v11 = "[PFAssetBundle] Source file does not exist at URL: %@.";
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(a4) = 0;
  }
LABEL_12:

  return (char)a4;
}

- (id)createAssetBundleWritingErrorWithDescription:(id)a3
{
  objc_class *v3;
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (__CFString *)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, &v14);

  v6 = CFSTR("Unknown reason");
  if (v5)
    v6 = v5;
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 writtenFileURL:(id *)a5 error:(id *)a6
{
  return -[PFAssetBundle _writeFileAtURL:toDirectory:withUpdatedFilename:writtenFileURL:error:](self, "_writeFileAtURL:toDirectory:withUpdatedFilename:writtenFileURL:error:", a3, a4, 0, a5, a6);
}

- (BOOL)_writeFileAtURL:(id)a3 toDirectory:(id)a4 withUpdatedFilename:(id)a5 writtenFileURL:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  BOOL v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v12, "lastPathComponent");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  objc_msgSend(v13, "URLByAppendingPathComponent:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PFAssetBundle linkOrCopyURL:toURL:forceCopy:error:](self, "linkOrCopyURL:toURL:forceCopy:error:", v12, v18, 0, a7);
  v20 = v19;
  if (a6 && v19)
    *a6 = objc_retainAutorelease(v18);

  return v20;
}

- (PFAssetBundle)initWithOriginalPhotoURL:(id)a3 alternatePhotoURL:(id)a4 fullSizePhotoURL:(id)a5 adjustmentBaseFullSizePhotoURL:(id)a6 spatialOvercapturePhotoURL:(id)a7 originalPairedVideoURL:(id)a8 fullSizePairedVideoURL:(id)a9 adjustmentBaseFullSizePairedVideoURL:(id)a10 spatialOvercapturePairedVideoURL:(id)a11 fullSizeVideoURL:(id)a12 adjustmentsURL:(id)a13 originalAdjustmentsURL:(id)a14 adjustmentsSecondaryDataURL:(id)a15 mediaSubtypes:(unint64_t)a16 playbackStyle:(int64_t)a17 playbackVariation:(unint64_t)a18 videoComplementVisibilityState:(unsigned __int16)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PFAssetBundle *v52;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;

  v24 = a3;
  v63 = a4;
  v62 = a5;
  v61 = a6;
  v60 = a7;
  v59 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v29 = a13;
  v30 = a14;
  v31 = a15;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v24, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("PFAssetBundlePathPhotoKey"));

  }
  v58 = v30;
  if (v63)
  {
    objc_msgSend(v63, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("PFAssetBundlePathAlternatePhotoKey"));

  }
  if (v62)
  {
    objc_msgSend(v62, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("PFAssetBundlePathFullSizePhotoKey"));

  }
  if (v61)
  {
    objc_msgSend(v61, "path");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("PFAssetBundlePathAdjustmentBasePhotoKey"));

  }
  if (v60)
  {
    objc_msgSend(v60, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, CFSTR("PFAssetBundlePathSpatialOvercapturePhotoKey"));

  }
  if (v59)
  {
    objc_msgSend(v59, "path");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v38, CFSTR("PFAssetBundlePathPairedVideoKey"));

  }
  if (v25)
  {
    objc_msgSend(v25, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, CFSTR("PFAssetBundlePathFullSizePairedVideoKey"));

  }
  if (v26)
  {
    objc_msgSend(v26, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, CFSTR("PFAssetBundlePathAdjustmentBasePairedVideoKey"));

  }
  if (v27)
  {
    objc_msgSend(v27, "path");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v41, CFSTR("PFAssetBundlePathSpatialOvercapturePairedVideoKey"));

  }
  if (v28)
  {
    objc_msgSend(v28, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, CFSTR("PFAssetBundlePathFullSizeVideoKey"));

  }
  v54 = v27;
  v55 = v25;
  v57 = v24;
  if (v29)
  {
    objc_msgSend(v29, "path");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v43, CFSTR("PFAssetBundlePathAdjustmentDataKey"));

  }
  v44 = v29;
  if (v58)
  {
    objc_msgSend(v58, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v45, CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey"));

  }
  if (v31)
  {
    objc_msgSend(v31, "path");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v46, CFSTR("PFAssetBundlePathAdjustmentSecondaryDataKey"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("PFAssetBundleMetadataVersionKey"));
  objc_msgSend(v47, "setObject:forKeyedSubscript:", &unk_1E45CA850, CFSTR("PFAssetBundleMetadataMediaTypeKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a16);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, CFSTR("PFAssetBundleMetadataMediaSubtypesKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a17);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, CFSTR("PFAssetBundleMetadataPlaybackStyleKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a18);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v50, CFSTR("PFAssetBundleMetadataPlaybackVariationKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a19);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v51, CFSTR("PFAssetBundleMetadataVideoComplementVisibilityStateKey"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v47, CFSTR("PFAssetBundlePathMetadataKey"));
  v52 = -[PFAssetBundle initWithPropertyList:](self, "initWithPropertyList:", v32);

  return v52;
}

- (PFAssetBundle)initWithOriginalVideoURL:(id)a3 fullSizeRenderedVideoURL:(id)a4 adjustmentBaseVideoURL:(id)a5 spatialOvercaptureVideoURL:(id)a6 adjustmentsURL:(id)a7 originalAdjustmentsURL:(id)a8 mediaSubtypes:(unint64_t)a9 playbackStyle:(int64_t)a10 playbackVariation:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
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
  PFAssetBundle *v33;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v16, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("PFAssetBundlePathVideoKey"));

  }
  if (v17)
  {
    objc_msgSend(v17, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("PFAssetBundlePathFullSizeVideoKey"));

  }
  if (v18)
  {
    objc_msgSend(v18, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("PFAssetBundlePathAdjustmentBaseVideoKey"));

  }
  if (v19)
  {
    objc_msgSend(v19, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("PFAssetBundlePathSpatialOvercaptureVideoKey"));

  }
  if (v20)
  {
    objc_msgSend(v20, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("PFAssetBundlePathAdjustmentDataKey"));

  }
  if (v21)
  {
    objc_msgSend(v21, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("PFAssetBundleMetadataVersionKey"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E45CA868, CFSTR("PFAssetBundleMetadataMediaTypeKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("PFAssetBundleMetadataMediaSubtypesKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("PFAssetBundleMetadataPlaybackStyleKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("PFAssetBundleMetadataPlaybackVariationKey"));

  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E45CA880, CFSTR("PFAssetBundleMetadataVideoComplementVisibilityStateKey"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("PFAssetBundlePathMetadataKey"));
  v33 = -[PFAssetBundle initWithPropertyList:](self, "initWithPropertyList:", v22);

  return v33;
}

- (id)writeDowngradedRepresentationToDirectory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PFVideoComplement *v36;
  void *v37;
  void *v38;
  PFVideoComplement *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v11 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v49);
    v12 = v49;

    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v51 = v6;
        v52 = 2114;
        v53 = v12;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Could not create directory at: %{public}@. Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_32;
    }

  }
  if (-[PFAssetBundle mediaType](self, "mediaType") == 1)
  {
    if (-[PFAssetBundle playbackStyle](self, "playbackStyle") == 5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from an auto-loop", buf, 2u);
      }
      -[PFAssetBundle pairedVideoURL](self, "pairedVideoURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v48 = 0;
      -[PFAssetBundle _writeFileAtURL:toDirectory:writtenFileURL:error:](self, "_writeFileAtURL:toDirectory:writtenFileURL:error:", v13, v6, &v48, &v47);
      v14 = v48;
      v15 = v47;
    }
    else
    {
      v19 = -[PFAssetBundle mediaSubtypes](self, "mediaSubtypes");
      v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
      if ((v19 & 8) != 0)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from a Live Photo", buf, 2u);
        }
        -[PFAssetBundle fullSizePhotoURL](self, "fullSizePhotoURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v26 = v24;
        }
        else
        {
          -[PFAssetBundle photoURL](self, "photoURL");
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v26;

        -[PFAssetBundle fullSizePairedVideoURL](self, "fullSizePairedVideoURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v29;
        }
        else
        {
          -[PFAssetBundle pairedVideoURL](self, "pairedVideoURL");
          v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        v32 = v31;

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByAppendingPathExtension:", CFSTR("pvt"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = [PFVideoComplement alloc];
        v41 = v32;
        objc_msgSend(v32, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PFVideoComplement initWithPathToVideo:pathToImage:](v36, "initWithPathToVideo:pathToImage:", v37, v38);

        objc_msgSend(v6, "URLByAppendingPathComponent:", v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        LODWORD(v32) = -[PFVideoComplement writeToBundleAtURL:error:](v39, "writeToBundleAtURL:error:", v40, &v46);
        v12 = v46;
        v14 = 0;
        if ((_DWORD)v32)
          v14 = v40;

LABEL_31:
        if (v14)
          goto LABEL_35;
        goto LABEL_32;
      }
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from a photo", buf, 2u);
      }
      -[PFAssetBundle fullSizePhotoURL](self, "fullSizePhotoURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        -[PFAssetBundle photoURL](self, "photoURL");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v23;

      v44 = 0;
      v45 = 0;
      -[PFAssetBundle _writeFileAtURL:toDirectory:writtenFileURL:error:](self, "_writeFileAtURL:toDirectory:writtenFileURL:error:", v13, v6, &v45, &v44);
      v14 = v45;
      v15 = v44;
    }
LABEL_30:
    v12 = v15;
    goto LABEL_31;
  }
  if (-[PFAssetBundle mediaType](self, "mediaType") == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Creating downgraded representation from a video", buf, 2u);
    }
    -[PFAssetBundle fullSizeVideoURL](self, "fullSizeVideoURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      -[PFAssetBundle videoURL](self, "videoURL");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v18;

    v42 = 0;
    v43 = 0;
    -[PFAssetBundle _writeFileAtURL:toDirectory:writtenFileURL:error:](self, "_writeFileAtURL:toDirectory:writtenFileURL:error:", v13, v6, &v43, &v42);
    v14 = v43;
    v15 = v42;
    goto LABEL_30;
  }
  v12 = 0;
LABEL_32:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v6;
    v52 = 2112;
    v53 = v12;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFAssetBundle] Could not create downgraded representation in directory: %@. Error: %@.", buf, 0x16u);
  }
  v14 = 0;
LABEL_35:
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  v27 = v14;

  return v27;
}

- (id)writeFolderRepresentationToDirectory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
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
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  float v34;
  BOOL v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  id v54;
  _BOOL4 v55;
  void *v56;
  int v57;
  id *v58;
  void *v59;
  id v60;
  PFAssetBundle *v62;
  void *v63;
  void *v64;
  void *v65;
  id *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PFAssetBundle photoURL](self, "photoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v66 = a4;
  v62 = self;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[PFAssetBundle videoURL](self, "videoURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v63 = v10;
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "URLByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = objc_claimAutoreleasedReturnValue();

  v67 = v6;
  v64 = (void *)v12;
  objc_msgSend(v6, "URLByAppendingPathComponent:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v14;
  LODWORD(v14) = objc_msgSend(v14, "fileExistsAtPath:", v16);

  v68 = v15;
  if ((_DWORD)v14)
  {
    v17 = v15;
    do
    {
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_new();
      v70 = v18;
      v20 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v20, "pathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", &stru_1E45A8128) & 1) == 0)
      {
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isDeclared") & 1) == 0)
            break;
          objc_msgSend(v19, "addObject:", v21);
          objc_msgSend(v20, "stringByDeletingPathExtension");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "pathExtension");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v23;
          if (objc_msgSend(v21, "isEqualToString:", &stru_1E45A8128))
            goto LABEL_12;
        }

      }
      v23 = v20;
LABEL_12:

      v24 = (void *)objc_msgSend(v23, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "rangeOfCharacterFromSet:options:", v25, 4);
      v28 = v27;

      if (v28)
      {
        v29 = objc_msgSend(v24, "length");
        v30 = v29 - v26;
        objc_msgSend(v24, "substringWithRange:", v26, v29 - v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31
          && (v33 = objc_msgSend(v31, "intValue"), objc_msgSend(v32, "floatValue"), v33)
          && (v34 == (float)v33 ? (v35 = v33 == -2147483647) : (v35 = 1),
              !v35 ? (v36 = v33 == 0x7FFFFFFF) : (v36 = 1),
              !v36))
        {
          objc_msgSend(v24, "deleteCharactersInRange:", v26, v30);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %ld"), v33 + 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendString:", v46);

        }
        else
        {
          objc_msgSend(v24, "appendString:", CFSTR(" 2"));
        }

      }
      else
      {
        objc_msgSend(v24, "appendString:", CFSTR(" 2"));
      }
      if (objc_msgSend(v19, "count"))
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v19, "reverseObjectEnumerator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v74 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
              objc_msgSend(v24, "appendString:", CFSTR("."));
              objc_msgSend(v24, "appendString:", v42);
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
          }
          while (v39);
        }

      }
      objc_msgSend(v17, "URLByDeletingLastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "URLByAppendingPathComponent:", v24);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v69, "fileExistsAtPath:", v44);

      v17 = v15;
    }
    while ((v45 & 1) != 0);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v67, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v47;
    v79 = 2114;
    v80 = v48;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFAssetBundle] Generating folder representation at: \"%{public}@\" with folder name: %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v49, "fileExistsAtPath:", v50);

  if ((v51 & 1) == 0)
  {
    objc_msgSend(v15, "path");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v53 = objc_msgSend(v49, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v52, 1, 0, &v72);
    v54 = v72;

    if (!v53)
    {
      v58 = v66;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v78 = v15;
        v79 = 2114;
        v80 = v54;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFAssetBundle] Could not create folder at: %{public}@. Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_48;
    }

  }
  v71 = 0;
  v55 = -[PFAssetBundle writeAllResourceURLsToDirectoryAtURL:updatingManifest:error:](v62, "writeAllResourceURLsToDirectoryAtURL:updatingManifest:error:", v15, 0, &v71);
  v54 = v71;
  if (((v55 | v51) & 1) == 0)
  {
    objc_msgSend(v49, "removeItemAtURL:error:", v15, 0);
    v58 = v66;
LABEL_48:
    v56 = v63;
    goto LABEL_50;
  }
  v56 = v63;
  if (v55)
  {
    v57 = 1;
    v58 = v66;
    if (!v66)
      goto LABEL_54;
LABEL_53:
    *v58 = objc_retainAutorelease(v54);
    goto LABEL_54;
  }
  v58 = v66;
LABEL_50:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v78 = v15;
    v79 = 2112;
    v80 = v54;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFAssetBundle] Could not create folder representation: %@. Error: %@.", buf, 0x16u);
  }
  v57 = 0;
  if (v58)
    goto LABEL_53;
LABEL_54:
  if (v57)
    v59 = v15;
  else
    v59 = 0;
  v60 = v59;

  return v60;
}

- (NSURL)photoURL
{
  return self->_photoURL;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSURL)audioURL
{
  return self->_audioURL;
}

- (NSURL)alternatePhotoURL
{
  return self->_alternatePhotoURL;
}

- (NSURL)fullSizePhotoURL
{
  return self->_fullSizePhotoURL;
}

- (NSURL)fullSizeVideoURL
{
  return self->_fullSizeVideoURL;
}

- (NSURL)adjustmentDataURL
{
  return self->_adjustmentDataURL;
}

- (NSURL)adjustmentBasePhotoURL
{
  return self->_adjustmentBasePhotoURL;
}

- (NSURL)pairedVideoURL
{
  return self->_pairedVideoURL;
}

- (NSURL)fullSizePairedVideoURL
{
  return self->_fullSizePairedVideoURL;
}

- (NSURL)adjustmentBasePairedVideoURL
{
  return self->_adjustmentBasePairedVideoURL;
}

- (NSURL)spatialOvercapturePhotoURL
{
  return self->_spatialOvercapturePhotoURL;
}

- (NSURL)spatialOvercapturePairedVideoURL
{
  return self->_spatialOvercapturePairedVideoURL;
}

- (NSURL)spatialOvercaptureVideoURL
{
  return self->_spatialOvercaptureVideoURL;
}

- (NSURL)adjustmentBaseVideoURL
{
  return self->_adjustmentBaseVideoURL;
}

- (NSURL)originalAdjustmentDataURL
{
  return self->_originalAdjustmentDataURL;
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (void)setLivePhotoOriginalPairingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setLivePhotoOriginalImageDisplayTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoOriginalImageDisplayTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoOriginalImageDisplayTime.value = v3;
}

- (void)setLivePhotoOriginalVideoDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoOriginalVideoDuration.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoOriginalVideoDuration.value = v3;
}

- (NSDictionary)propertyList
{
  return self->_propertyList;
}

- (void)setPropertyList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)didReadOriginalPairedVideoMetadata
{
  return self->_didReadOriginalPairedVideoMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_livePhotoOriginalPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_originalAdjustmentDataURL, 0);
  objc_storeStrong((id *)&self->_adjustmentBaseVideoURL, 0);
  objc_storeStrong((id *)&self->_spatialOvercaptureVideoURL, 0);
  objc_storeStrong((id *)&self->_spatialOvercapturePairedVideoURL, 0);
  objc_storeStrong((id *)&self->_spatialOvercapturePhotoURL, 0);
  objc_storeStrong((id *)&self->_adjustmentBasePairedVideoURL, 0);
  objc_storeStrong((id *)&self->_fullSizePairedVideoURL, 0);
  objc_storeStrong((id *)&self->_pairedVideoURL, 0);
  objc_storeStrong((id *)&self->_adjustmentBasePhotoURL, 0);
  objc_storeStrong((id *)&self->_adjustmentDataURL, 0);
  objc_storeStrong((id *)&self->_fullSizeVideoURL, 0);
  objc_storeStrong((id *)&self->_fullSizePhotoURL, 0);
  objc_storeStrong((id *)&self->_alternatePhotoURL, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
}

id __49__PFAssetBundle_generateCustomFilenamesByPathKey__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (v6)
  {
    objc_msgSend(v6, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "insertAuxiliaryResourceTypeMarker:intoFileName:", v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (UTType)contentType
{
  if (contentType_onceToken != -1)
    dispatch_once(&contentType_onceToken, &__block_literal_global_105);
  return (UTType *)(id)contentType_type;
}

+ (id)insertAuxiliaryResourceTypeMarker:(id)a3 intoFileName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "substringToIndex:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)fileName:(id)a3 matchesRegex:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v7 == 1;
}

+ (BOOL)isValidDCFFileName:(id)a3
{
  uint64_t v4;
  id v5;
  char v6;

  v4 = isValidDCFFileName__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&isValidDCFFileName__onceToken, &__block_literal_global_129_10934);
  v6 = objc_msgSend(a1, "fileName:matchesRegex:", v5, isValidDCFFileName__dcfRegex);

  return v6;
}

void __36__PFAssetBundle_isValidDCFFileName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^ [[A-Z][_][0-9]]{4}   (?# alphanumeric + '_' x4)[0-9]{4}               (?# digit x4)\\.[[A-Z][0-9]]{3,4} $ (?# alphanumeric x3 or x4)"), 3, 0);
  v1 = (void *)isValidDCFFileName__dcfRegex;
  isValidDCFFileName__dcfRegex = v0;

}

void __28__PFAssetBundle_contentType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.photos.asset-bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contentType_type;
  contentType_type = v0;

}

+ (NSString)currentFormatVersion
{
  return (NSString *)CFSTR("1");
}

@end
