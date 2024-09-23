@implementation PUWatchFaceHelper

+ (CGRect)screenBoundsForWatchType:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  sub_1AAC21178(a3);
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (PUWatchFaceHelper)init
{
  return (PUWatchFaceHelper *)sub_1AAC211FC();
}

@end
