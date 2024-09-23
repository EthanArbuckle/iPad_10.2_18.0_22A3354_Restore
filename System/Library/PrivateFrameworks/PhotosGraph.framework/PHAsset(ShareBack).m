@implementation PHAsset(ShareBack)

- (uint64_t)timeZone
{
  return 0;
}

- (double)horizontalAccuracy
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "coarseLocationProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "gpsHorizontalAccuracy");
  v3 = v2;

  return v3;
}

@end
