@implementation PHAsset(PUDisplayAssetAdoption)

- (uint64_t)isContentEqualTo:()PUDisplayAssetAdoption
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

- (uint64_t)contentChangeFromDisplayAsset:()PUDisplayAssetAdoption
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(a1, "contentChangeFromAsset:", v4);
  else
    v5 = 1;

  return v5;
}

- (void)photoIrisStillDisplayTime
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  objc_msgSend(a1, "photoIrisProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "photoIrisStillDisplayTime");
    v4 = v5;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }

}

- (void)photoIrisVideoDuration
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  objc_msgSend(a1, "photoIrisProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "photoIrisVideoDuration");
    v4 = v5;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }

}

- (BOOL)isAnimatedImage
{
  return (objc_msgSend(a1, "hasAdjustments") & 1) == 0 && objc_msgSend(a1, "playbackStyle") == 2;
}

- (uint64_t)originalFilesize
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "originalMetadataProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "originalFilesize");

  return v3;
}

- (uint64_t)isContentAdjustmentAllowed
{
  return objc_msgSend(a1, "canPerformEditOperation:", 2);
}

- (uint64_t)isInPlaceVideoTrimAllowed
{
  return 1;
}

- (uint64_t)isTrimmableType
{
  if ((objc_msgSend(a1, "isLivePhoto") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isVideo");
}

- (uint64_t)livePhotoVisibilityState
{
  void *v2;
  unsigned int v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photoIrisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "photoIrisVisibilityState");

  return v3;
}

- (id)videoObjectBuilder
{
  void *v1;
  int v2;
  void *v3;

  objc_msgSend(a1, "pl_managedAsset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isDefaultAdjustedSlomo");
  objc_msgSend(MEMORY[0x1E0D71B20], "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v1, v2 ^ 1u);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)originalEXIFOrientation
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "originalMetadataProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "originalExifOrientation");

  return v3;
}

- (uint64_t)containsAllMetadata
{
  return 1;
}

- (uint64_t)isResourceDownloadPossible
{
  return 1;
}

- (uint64_t)isCloudPhotoLibraryEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "photoLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isCloudPhotoLibraryEnabled");

  return v2;
}

- (id)pathForOriginalImageFile
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pl_managedAsset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForOriginalFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pathForOriginalVideoFile
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "pl_managedAsset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForVideoFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)pathForTrimmedVideoFile
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "pl_managedAsset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForTrimmedVideoFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (double)videoKeyFrameSourceTime
{
  uint64_t v4;
  void *v5;
  void *v6;
  double result;
  __int128 v8;

  v4 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)a2 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(v4 + 16);
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  v8 = 0uLL;
  objc_msgSend(a1, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "bestKeyFrameTime");
  else
    v8 = 0uLL;

  if ((BYTE12(v8) & 1) != 0)
  {
    result = *(double *)&v8;
    *(_OWORD *)a2 = v8;
    *(_QWORD *)(a2 + 16) = 0;
  }
  return result;
}

- (id)accessibilityDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "descriptionProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessibilityDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
