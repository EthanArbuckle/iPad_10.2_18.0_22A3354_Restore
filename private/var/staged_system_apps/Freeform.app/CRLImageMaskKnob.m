@implementation CRLImageMaskKnob

- (id)knobImage
{
  return +[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("ios-canvas-handle-mask"));
}

@end
