@implementation PXFileBackedAsset(PhotosUI)

- (double)duration
{
  return 0.0;
}

- (uint64_t)localizedGeoDescription
{
  return 0;
}

- (uint64_t)originalFilesize
{
  return 0;
}

- (uint64_t)modificationDate
{
  return 0;
}

- (uint64_t)isHidden
{
  return 0;
}

- (uint64_t)isLivePhoto
{
  return 0;
}

- (uint64_t)isPhotoIrisPlaceholder
{
  return 0;
}

- (uint64_t)isTemporaryPlaceholder
{
  return 0;
}

- (uint64_t)hasPhotoColorAdjustments
{
  return 0;
}

- (__n128)photoIrisStillDisplayTime
{
  uint64_t v1;
  __n128 result;

  v1 = MEMORY[0x1E0CA2E68];
  result = *(__n128 *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)a1 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v1 + 16);
  return result;
}

- (__n128)photoIrisVideoDuration
{
  uint64_t v1;
  __n128 result;

  v1 = MEMORY[0x1E0CA2E68];
  result = *(__n128 *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)a1 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v1 + 16);
  return result;
}

- (unint64_t)pixelWidth
{
  double v1;

  objc_msgSend(a1, "size");
  return (unint64_t)v1;
}

- (unint64_t)pixelHeight
{
  double v1;

  objc_msgSend(a1, "size");
  return (unint64_t)v1;
}

- (uint64_t)isGuestAsset
{
  return 0;
}

@end
