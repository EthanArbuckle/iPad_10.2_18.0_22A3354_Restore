@implementation PHMomentShare(PXMediaTypeAggregatingAdoption)

- (uint64_t)aggregateMediaType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = objc_msgSend(a1, "photosCount");
  v3 = objc_msgSend(a1, "videosCount");
  result = objc_msgSend(a1, "assetCount");
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
