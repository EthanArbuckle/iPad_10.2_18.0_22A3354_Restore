@implementation PHAssetCollection(PXMediaTypeAggregatingAdoption)

- (uint64_t)aggregateMediaType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = objc_msgSend(a1, "estimatedPhotosCount");
  v3 = objc_msgSend(a1, "estimatedVideosCount");
  result = objc_msgSend(a1, "estimatedAssetCount");
  if (result)
  {
    if (v3 || v2 != result)
    {
      if (v3 == result && v2 == 0)
        return 2;
      else
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end
