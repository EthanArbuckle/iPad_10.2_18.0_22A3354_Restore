@implementation PXOneSidedRegion(PXStory)

- (uint64_t)initWithEdge:()PXStory tiltedInset:rect:
{
  double v7;
  double v8;
  double v9;

  v7 = 0.0;
  if (a6 <= 3)
    v7 = dbl_1A7C09AD0[a6];
  __sincos_stret(v7);
  PXRectGetCenter();
  PXPointMultiplyWithFloat();
  PXPointAdd();
  PXPointDenormalize();
  PXPointMultiplyWithFloat();
  PXPointAdd();
  return objc_msgSend(a1, "initWithSideAngle:point:width:offset:", a3 + v7, v8, v9, 1.0, a4);
}

@end
