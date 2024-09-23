@implementation UIColor(TPTelephonyUIUtilities)

- (id)tpImageFromColor
{
  CGContext *CurrentContext;
  void *v3;
  CGSize v5;
  CGRect v6;

  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContext(v5);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  CGContextFillRect(CurrentContext, v6);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v3;
}

@end
