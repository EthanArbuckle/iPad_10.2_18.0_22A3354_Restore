@implementation _TUIFlexibleWidthLayoutController

- (double)_layout:(id)a3 lengthForProposedLength:(double)a4
{
  double result;

  _objc_msgSend(a3, "computeWidthForProposedWidth:", a4);
  return result;
}

@end
