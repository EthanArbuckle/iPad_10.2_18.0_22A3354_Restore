@implementation PHAsset(PEAsset)

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

- (uint64_t)isAnimatedImage
{
  if ((objc_msgSend(a1, "hasAdjustments") & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isAnimatedGIF") & 1) != 0)
    return 1;
  return objc_msgSend(a1, "isHEICSequence");
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

- (uint64_t)isResourceDownloadPossible
{
  return 1;
}

@end
