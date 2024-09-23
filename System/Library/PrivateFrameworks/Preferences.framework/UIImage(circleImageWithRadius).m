@implementation UIImage(circleImageWithRadius)

+ (id)circleImageWithDiameter:()circleImageWithRadius color:
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  CGContext *CurrentContext;
  id v11;
  CGColor *v12;
  void *v13;
  CGSize v15;
  CGRect v16;

  v5 = (void *)MEMORY[0x1E0CEA950];
  v6 = a4;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  v15.width = a1;
  v15.height = a1;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v9);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v11 = objc_retainAutorelease(v6);
  v12 = (CGColor *)objc_msgSend(v11, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v12);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a1;
  v16.size.height = a1;
  CGContextFillEllipseInRect(CurrentContext, v16);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

@end
