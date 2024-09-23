@implementation CIImage

void __90__CIImage_PrivateSmartBlackAndWhite__smartBlackAndWhiteAdjustmentsForValue_andStatistics___block_invoke()
{
  NSLog(CFSTR("There is no need to call smartBlackAndWhiteAdjustmentsForValue:andStatistics:."));
  NSLog(CFSTR("Just use [CIFilter filterWithName:@\"PISmartBlackAndWhiteHDR\"] instead."));
}

void __66__CIImage_PrivateSmartBlackAndWhite__smartBlackAndWhiteStatistics__block_invoke()
{
  NSLog(CFSTR("There is no need to call smartBlackAndWhiteStatistics."));
  NSLog(CFSTR("Just use [CIFilter filterWithName:@\"PISmartBlackAndWhiteHDR\"] instead."));
}

void __67__CIImage_PIVideoReframe__pi_imageByApplyingStabilizationWatermark__block_invoke()
{
  CGColorSpace *DeviceRGB;
  CGContext *v1;
  const CGPath *v2;
  CGRect v3;
  CGRect v4;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v1 = CGBitmapContextCreate(0, 0x28uLL, 0x28uLL, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v3.size.width = 40.0;
  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  v3.size.height = 40.0;
  v4 = CGRectInset(v3, 2.0, 2.0);
  v2 = CGPathCreateWithEllipseInRect(v4, 0);
  CGContextAddPath(v1, v2);
  CGPathRelease(v2);
  CGContextSetLineWidth(v1, 1.0);
  CGContextSetRGBFillColor(v1, 1.0, 0.0, 0.0, 1.0);
  CGContextSetRGBStrokeColor(v1, 0.0, 0.0, 0.0, 1.0);
  CGContextDrawPath(v1, kCGPathFillStroke);
  pi_imageByApplyingStabilizationWatermark_dotImage = (uint64_t)CGBitmapContextCreateImage(v1);
  CGContextRelease(v1);
}

@end
