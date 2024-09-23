@implementation PUPhotosGridViewControllerPadImagePickerSpec

- (unsigned)thumbnailImageFormat
{
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  if (*(double *)&PUMainScreenScale_screenScale <= 1.0)
    return 3311;
  else
    return 3319;
}

- (BOOL)displaysAvalancheStacks
{
  return 0;
}

- (BOOL)canCommitPreview
{
  return 0;
}

@end
