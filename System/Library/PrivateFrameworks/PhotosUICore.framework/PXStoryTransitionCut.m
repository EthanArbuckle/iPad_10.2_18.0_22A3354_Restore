@implementation PXStoryTransitionCut

+ (id)cut
{
  id v2;
  CMTime v4;

  v2 = objc_alloc((Class)a1);
  CMTimeMakeWithSeconds(&v4, 0.0, 600);
  return (id)objc_msgSend(v2, "initWithIdentifier:kind:duration:event:", 0, 1, &v4, 0);
}

@end
