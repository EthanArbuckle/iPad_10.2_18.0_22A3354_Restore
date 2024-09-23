@implementation PFVideoMetadata

- (BOOL)isSpatial
{
  return objc_msgSend((id)objc_opt_class(), "videoAssetIsSpatial:", self->_asset);
}

- (BOOL)isHDR
{
  return objc_msgSend((id)objc_opt_class(), "videoAssetIsHighDynamicRange:", self->_asset);
}

- (BOOL)isPlayable
{
  return objc_msgSend((id)objc_opt_class(), "videoAssetIsPlayable:", self->_asset);
}

- (BOOL)isDecodable
{
  return objc_msgSend((id)objc_opt_class(), "videoAssetIsDecodable:", self->_asset);
}

- (NSString)firstVideoTrackFormatDebugDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "firstVideoTrackFormatDebugDescriptionForAsset:", self->_asset);
}

- (NSDictionary)outOfBandHints
{
  return (NSDictionary *)objc_msgSend((id)objc_opt_class(), "outOfBandHintsForVideoAsset:", self->_asset);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (void)loadMetadataForAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  os_signpost_id_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C81028];
  v8 = os_signpost_id_make_with_pointer(MEMORY[0x1E0C81028], v5);
  v9 = v7;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_signpost_emit_with_name_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v8, "com.apple.photos.backend.videometadata", "Load metadata for asset asset %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PFVideoMetadata_loadMetadataForAsset_completion___block_invoke;
  v12[3] = &unk_1E45A23A0;
  v13 = &unk_1E45CB288;
  v14 = v5;
  v15 = v6;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v11, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E45CB288, v12);

}

+ (id)metadataItemValueFromAsset:(id)a3 withKey:(id)a4 keySpace:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0C8B220];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadataItemsFromArray:withKey:keySpace:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)firstVideoTrackFormatDebugDescriptionForAsset:(id)a3
{
  void *v3;
  void *v4;

  +[PFVideoMetadataVideoTrackFormatInfo infoForFirstVideoTrackOfAsset:](PFVideoMetadataVideoTrackFormatInfo, "infoForFirstVideoTrackOfAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatDebugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outOfBandHintsForVideoAsset:(id)a3
{
  return +[PFMediaUtilities outOfBandHintsForVideoAsset:](PFMediaUtilities, "outOfBandHintsForVideoAsset:", a3);
}

+ (BOOL)hasValidMetadataForLoopingVideoAsset:(id)a3
{
  id v3;
  id v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v14;

  v3 = a3;
  v14 = 0;
  +[PFVideoMetadata readMetadataType:fromAVAsset:value:error:](PFVideoMetadata, "readMetadataType:fromAVAsset:value:error:", 4, v3, &v14, 0);
  v4 = v14;
  v5 = objc_msgSend(v4, "unsignedIntValue");
  if (v5)
    v6 = v5 == 3;
  else
    v6 = 1;
  if (v6)
  {
    v12 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C8B220];
    objc_msgSend(v3, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadataItemsFromArray:withKey:keySpace:", v8, CFSTR("LOOP"), *MEMORY[0x1E0C8A9F0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CA2440]);

  }
  return v12;
}

+ (id)quickTimeMetadataItemValueFromAsset:(id)a3 withKey:(id)a4
{
  return (id)objc_msgSend(a1, "metadataItemValueFromAsset:withKey:keySpace:", a3, a4, *MEMORY[0x1E0C8A9E8]);
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromFileURL:(id)a4 value:(id *)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v8 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    LOBYTE(a6) = objc_msgSend(a1, "readMetadataType:fromAVAsset:value:error:", v8, v11, a5, a6);
  }
  else if (a6)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to access input media through URL %@"), v10, *MEMORY[0x1E0CB2938]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 1, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromAVAsset:(id)a4 value:(id *)a5 error:(id *)a6
{
  unsigned int v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v8 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  convertTypeToKey(v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "quickTimeMetadataItemValueFromAsset:withKey:", v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is invalid for the media type %s"), v8, "video");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 0, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11 != 0;
}

+ (id)arrayByRemovingMetadataItemOfType:(unsigned __int8)a3 fromArray:(id)a4 error:(id *)a5
{
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  _QWORD v31[3];

  v6 = a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  convertTypeToKey(v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      v13 = *MEMORY[0x1E0C8A9E8];
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
        objc_msgSend(v15, "keySpace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v13);

        if (v17)
        {
          objc_msgSend(v15, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v8);

          if ((v19 & 1) != 0)
            break;
        }
        if (v11 == ++v14)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      v23 = v15;

      if (!v23)
        goto LABEL_16;
      a5 = (id *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(a5, "removeObject:", v23);

    }
    else
    {
LABEL_11:

LABEL_16:
      a5 = (id *)v9;
    }
  }
  else if (a5)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is invalid for the media type %s"), v6, "video");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 0, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

+ (BOOL)videoAssetIsDecodable:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "tracks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0C8A808];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEnabled"))
        {
          objc_msgSend(v9, "mediaType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", v7) & 1) != 0)
          {
            v11 = objc_msgSend(v9, "isDecodable");

            if (!v11)
            {
              v12 = 0;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v12 = 1;
LABEL_14:

  return v12;
}

+ (BOOL)videoAssetIsPlayable:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(a1, "videoAssetIsHighDynamicRange:", v4)
    && !+[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback](PFMediaCapabilities, "currentDeviceIsEligibleForHDRPlayback"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "isPlayable");
  }

  return v5;
}

+ (BOOL)videoAssetIsHighDynamicRange:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PFVideoMetadata_videoAssetIsHighDynamicRange___block_invoke;
  v6[3] = &unk_1E45A23C8;
  v6[4] = &v7;
  v6[5] = a1;
  +[PFMediaUtilities enumerateVideoTrackFormatDescriptionsInAsset:withBlock:](PFMediaUtilities, "enumerateVideoTrackFormatDescriptionsInAsset:withBlock:", v4, v6);
  LOBYTE(a1) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

+ (BOOL)videoAssetIsSpatial:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PFVideoMetadata_videoAssetIsSpatial___block_invoke;
  v6[3] = &unk_1E45A23C8;
  v6[4] = &v7;
  v6[5] = a1;
  +[PFMediaUtilities enumerateVideoTrackFormatDescriptionsInAsset:withBlock:](PFMediaUtilities, "enumerateVideoTrackFormatDescriptionsInAsset:withBlock:", v4, v6);
  LOBYTE(a1) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

+ (BOOL)videoTrackIsSpatial:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C8A6F8];
  v17[0] = *MEMORY[0x1E0C8A718];
  v17[1] = v4;
  v17[2] = *MEMORY[0x1E0C8A740];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v7 += objc_msgSend(v3, "hasMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
    v6 = v7;
  }

  v10 = objc_msgSend(v5, "count") == v6;
  return v10;
}

+ (BOOL)videoTrackFormatDescriptionIsHighDynamicRange:(opaqueCMFormatDescription *)a3
{
  return (int)CMVideoFormatDescriptionGetVideoDynamicRange() > 1;
}

+ (BOOL)videoTrackFormatDescriptionIsHDR10:(opaqueCMFormatDescription *)a3
{
  return CMVideoFormatDescriptionGetVideoDynamicRange() == 4;
}

+ (BOOL)videoTrackFormatDescriptionIsProResLOG:(opaqueCMFormatDescription *)a3
{
  void *v3;
  BOOL v4;

  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA2218]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)videoTrackFormatDescriptionContainsPortraitData:(opaqueCMFormatDescription *)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  CMMetadataFormatDescriptionGetIdentifiers(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", CFSTR("mdta/com.apple.quicktime.cinematic-video.rendering")))
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("mdta/com.apple.quicktime.cinematic-video.cinematography"));
  else
    v4 = 0;

  return v4;
}

+ (unsigned)videoCodecFourCharCodeNumberForAVAsset:(id)a3
{
  id v3;
  unsigned int v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PFVideoMetadata_videoCodecFourCharCodeNumberForAVAsset___block_invoke;
  v6[3] = &unk_1E45A2B60;
  v6[4] = &v7;
  +[PFMediaUtilities enumerateVideoTrackFormatDescriptionsInAsset:withBlock:](PFMediaUtilities, "enumerateVideoTrackFormatDescriptionsInAsset:withBlock:", v3, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __58__PFVideoMetadata_videoCodecFourCharCodeNumberForAVAsset___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4, _BYTE *a5)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a4;
  *a5 = 1;
  return result;
}

uint64_t __39__PFVideoMetadata_videoAssetIsSpatial___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "videoTrackIsSpatial:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __48__PFVideoMetadata_videoAssetIsHighDynamicRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "videoTrackFormatDescriptionIsHighDynamicRange:");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __51__PFVideoMetadata_loadMetadataForAsset_completion___block_invoke(uint64_t a1)
{
  id v2;
  os_signpost_id_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C81028];
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v3, "com.apple.photos.backend.videometadata", (const char *)&unk_1A17C945B, buf, 2u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v12 = *(void **)(a1 + 40);
        v16 = v10;
        v13 = objc_msgSend(v12, "statusOfValueForKey:error:", v11, &v16);
        v7 = v16;

        if (v13 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v15 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 134218754;
            v22 = v13;
            v23 = 2112;
            v24 = v11;
            v25 = 2112;
            v26 = v15;
            v27 = 2112;
            v28 = v7;
            _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFVideoMetadata: Unexpected AVKeyValueStatus status %td while loading values for key '%@' of AVAsset %@: %@", buf, 0x2Au);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          goto LABEL_18;
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v14 = (id *)objc_opt_new();
  objc_storeStrong(v14 + 1, *(id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_18:
}

@end
