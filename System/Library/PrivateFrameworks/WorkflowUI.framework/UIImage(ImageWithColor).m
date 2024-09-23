@implementation UIImage(ImageWithColor)

+ (id)wf_imageWithColor:()ImageWithColor
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  CGColor *v6;
  void *v7;
  CGSize v9;
  CGRect v10;

  v3 = a3;
  v9.width = 1.0;
  v9.height = 1.0;
  UIGraphicsBeginImageContext(v9);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  CGContextFillRect(CurrentContext, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v7;
}

@end
