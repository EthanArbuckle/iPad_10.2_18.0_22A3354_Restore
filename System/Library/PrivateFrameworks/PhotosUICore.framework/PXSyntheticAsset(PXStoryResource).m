@implementation PXSyntheticAsset(PXStoryResource)

- (uint64_t)px_storyResourceKind
{
  return 1;
}

- (double)px_storyResourceFetchBestPlaybackRange
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

- (double)px_storyResourceFetchBestPlaybackRect
{
  return *MEMORY[0x1E0C9D628];
}

- (uint64_t)px_storyResourceFetchNormalizationData
{
  return 0;
}

- (uint64_t)px_storyResourceFetchVideoAdjustments
{
  return 0;
}

@end
