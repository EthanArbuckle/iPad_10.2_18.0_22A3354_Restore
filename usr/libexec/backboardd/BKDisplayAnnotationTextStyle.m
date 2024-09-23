@implementation BKDisplayAnnotationTextStyle

- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4
{
  double y;
  double v5;
  double v6;
  id v7;

  y = CGPointZero.y;
  v7 = a3;
  objc_msgSend(v7, "preferredFrameSize");
  objc_msgSend(v7, "setFrame:", CGPointZero.x, y, v5, v6);

}

@end
