@implementation PHAsset(PXDisplayAssetAdoption)

- (BOOL)isInCloud
{
  return objc_msgSend(a1, "cloudPlaceholderKind") == 2;
}

- (double)bestCropRectForAspectRatioV2:()PXDisplayAssetAdoption verticalContentMode:cropMode:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "pixelWidth");
  v5 = objc_msgSend(a1, "pixelHeight");
  if (!v4)
    return *(double *)off_1E50B86D0;
  v6 = v5;
  if (!v5)
    return *(double *)off_1E50B86D0;
  v7 = (void *)MEMORY[0x1E0D750F0];
  objc_msgSend(a1, "preferredCropRect");
  v36 = v8;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(a1, "acceptableCropRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(a1, "normalizedFaceAreaRect");
  objc_msgSend(v7, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", v4, v6, a2, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v36, v10, v12, v14, v16, v18, v20, v22, v23,
    v24,
    v25,
    v26);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  if (CGRectIsEmpty(v40))
  {
    PXAssertGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      NSStringFromCGRect(v42);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v34;
      _os_log_error_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "The result is empty: \"%@\", buf, 0xCu);

    }
  }
  v41.origin.x = 0.0;
  v41.origin.y = 0.0;
  v41.size.width = 1.0;
  v41.size.height = 1.0;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  if (!CGRectContainsRect(v41, v44))
  {
    PXAssertGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      NSStringFromCGRect(v43);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v35;
      _os_log_error_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "The result: \"%@\" is not contained in the unit rect", buf, 0xCu);

    }
  }
  return x;
}

- (uint64_t)originalFileSize
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "originalMetadataProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "originalFilesize");

  return v3;
}

- (id)localizedGeoDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v6;

  v6 = 0;
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photosOneUpProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedGeoDescriptionIsHome:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PXLocalizedStringFromTable(CFSTR("PXPHOTOBROWSER_TITLE_AT_HOME"), CFSTR("PhotosUICore"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (__CFString)localizedDetailedGeoDescriptionForRTL:()PXDisplayAssetAdoption
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  char v15;

  v15 = 0;
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photosOneUpProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeNamesForLocalizedDetailedDescriptionIsHome:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    PXLocalizedStringFromTable(CFSTR("PXPHOTOBROWSER_TITLE_AT_HOME"), CFSTR("PhotosUICore"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "count"))
  {
    PXLocalizedStringFromTable(CFSTR("PXOneUpPlaceNamesDelimiter"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("⁩"), v8, CFSTR("⁨"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (a3)
      v11 = CFSTR("\u200F");
    else
      v11 = CFSTR("\u200E");
    objc_msgSend(v6, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@%@%@"), v11, CFSTR("⁨"), v13, CFSTR("⁩"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E5149688;
  }

  return v7;
}

- (uint64_t)defaultImageProviderClass
{
  return objc_opt_class();
}

- (uint64_t)isContentEqualTo:()PXDisplayAssetAdoption
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a1, "hasContentEqualTo:", v4))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = v4 == 0;
  }

  return v5;
}

- (uint64_t)thumbnailVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "modificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v4 = objc_msgSend(a1, "pixelWidth") ^ v3;
  v5 = v4 ^ (objc_msgSend(a1, "pixelHeight") << 32);

  return v5;
}

- (uint64_t)bestCropRectForAspectRatio:()PXDisplayAssetAdoption
{
  return objc_msgSend(a1, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 3);
}

- (double)bestCropRectForAspectRatio:()PXDisplayAssetAdoption verticalContentMode:cropMode:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D750F0];
  v9 = objc_msgSend(a1, "pixelWidth");
  v10 = objc_msgSend(a1, "pixelHeight");
  objc_msgSend(a1, "preferredCropRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "acceptableCropRect");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(a1, "normalizedFaceAreaRect");
  objc_msgSend(v8, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a4, a5, v9, v10, a2, v12, v14, v16, v18, v20, v22, v24, v26, v27, v28, v29,
    v30);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  if (CGRectIsEmpty(v44))
  {
    PXAssertGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      NSStringFromCGRect(v46);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v38;
      _os_log_error_impl(&dword_1A6789000, v35, OS_LOG_TYPE_ERROR, "The result is empty: \"%@\", buf, 0xCu);

    }
  }
  v45.origin.x = 0.0;
  v45.origin.y = 0.0;
  v45.size.width = 1.0;
  v45.size.height = 1.0;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (!CGRectContainsRect(v45, v48))
  {
    PXAssertGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      NSStringFromCGRect(v47);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v39;
      _os_log_error_impl(&dword_1A6789000, v36, OS_LOG_TYPE_ERROR, "The result: \"%@\" is not contained in the unit rect", buf, 0xCu);

    }
  }
  return x;
}

- (id)importDate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "curationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAutoPlaybackEligibilityEstimated
{
  double v1;

  objc_msgSend(a1, "highlightVisibilityScore");
  return v1 == 0.0;
}

- (uint64_t)isEligibleForAutoPlayback
{
  uint64_t v2;
  _BOOL8 v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  double v9;
  void *v10;
  float v11;

  if (!objc_msgSend(a1, "isAutoPlaybackEligibilityEstimated"))
  {
    objc_msgSend(a1, "highlightVisibilityScore");
    v5 = 0.763358779;
    return v4 >= v5;
  }
  v2 = objc_msgSend(a1, "playbackStyle");
  if (v2 == 5)
    return 1;
  if (v2 == 4)
  {
    objc_msgSend(a1, "duration");
    v5 = 2.0;
    return v4 >= v5;
  }
  if (v2 != 3 || (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    return 0;
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minAutoplaySuggestionScore");
  v9 = v8;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoplaySuggestionScore");
  v3 = v9 < v11;

  return v3;
}

- (float)audioScore
{
  void *v2;
  float v3;
  float v4;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioScore");
  v4 = v3;

  return v4;
}

- (void)livePhotoVideoDuration
{
  void *v4;
  id v5;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photoIrisProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "photoIrisVideoDuration");
    v4 = v5;
  }

}

- (void)livePhotoStillDisplayTime
{
  void *v4;
  id v5;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photoIrisProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "photoIrisStillDisplayTime");
    v4 = v5;
  }

}

- (id)fetchColorNormalizationData
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNormalizationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
