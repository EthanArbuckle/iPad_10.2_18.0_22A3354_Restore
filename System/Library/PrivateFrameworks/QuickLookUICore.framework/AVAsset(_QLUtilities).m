@implementation AVAsset(_QLUtilities)

+ (void)assetIsAutoloopMedia:()_QLUtilities completionHandler:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v11[0] = CFSTR("availableMetadataFormats");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__AVAsset__QLUtilities__assetIsAutoloopMedia_completionHandler___block_invoke;
    v8[3] = &unk_1E9EFC3C0;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v9, "loadValuesAsynchronouslyForKeys:completionHandler:", v7, v8);

  }
}

- (uint64_t)ql_canBeRotated
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
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
  objc_msgSend(a1, "tracks", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = *MEMORY[0x1E0C8A808];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "mediaType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v5) && (objc_msgSend(v7, "naturalSize"), v9 > 0.0))
        {
          objc_msgSend(v7, "naturalSize");
          v11 = v10;

          if (v11 > 0.0)
          {
            v12 = 1;
            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (double)ql_imageSizeOfFirstVideoTrack
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject **v8;
  NSObject *v9;
  _OWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "naturalSize");
    v5 = v4;
    v7 = v6;
    memset(v11, 0, sizeof(v11));
    objc_msgSend(v3, "preferredTransform");
    if (vabdd_f64(1.57079633, fabsf(atan2f(0.0, 0.0))) < 0.0001)
      v5 = v7;
  }
  else
  {
    v8 = (NSObject **)MEMORY[0x1E0D83678];
    v9 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11[0]) = 138412290;
      *(_QWORD *)((char *)v11 + 4) = a1;
      _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_ERROR, "Could not determine image size of video because could not obtain track of asset: %@ #Generic", (uint8_t *)v11, 0xCu);
    }
    v5 = *MEMORY[0x1E0C9D820];
  }

  return v5;
}

@end
