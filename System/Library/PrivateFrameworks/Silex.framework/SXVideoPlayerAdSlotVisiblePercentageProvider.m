@implementation SXVideoPlayerAdSlotVisiblePercentageProvider

- (double)visiblePercentageOfObject:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "mode");
  result = 0.0;
  if (v3 == 1)
    return 1.0;
  return result;
}

@end
