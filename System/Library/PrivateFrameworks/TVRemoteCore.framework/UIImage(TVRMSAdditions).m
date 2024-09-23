@implementation UIImage(TVRMSAdditions)

- (id)rms_jpegDataScaledToSize:()TVRMSAdditions compressionQuality:
{
  double v8;
  double v9;
  double v10;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  id v14;
  CGImage *v15;
  UIImage *v16;
  void *v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(a1, "size");
  v10 = a2 / v8;
  if (a2 / v8 >= a3 / v9)
    v10 = a3 / v9;
  v19.width = v8 * v10;
  width = v19.width;
  v19.height = v9 * v10;
  height = v19.height;
  UIGraphicsBeginImageContextWithOptions(v19, 1, 1.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, height);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v14, "CGColor"));

  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = width;
  v20.size.height = height;
  CGContextFillRect(CurrentContext, v20);
  v15 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = width;
  v21.size.height = height;
  CGContextDrawImage(CurrentContext, v21, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIImageJPEGRepresentation(v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
