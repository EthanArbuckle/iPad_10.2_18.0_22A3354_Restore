@implementation UIImage(WAImageExtensions)

- (id)WAImageLoaderPreCacheImage
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  CGSize v10;

  objc_msgSend(a1, "size");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "scale");
  v7 = v6;
  v10.width = v3;
  v10.height = v5;
  UIGraphicsBeginImageContextWithOptions(v10, 0, v7);
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

- (void)drawPDFInRect:()WAImageExtensions
{
  CGContext *CurrentContext;
  CGFloat width;
  double height;
  CGFloat v13;
  CGFloat MinX;
  CGFloat MaxY;
  CGRect v16;
  CGRect BoxRect;
  CGRect v18;
  CGRect v19;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGContextBeginTransparencyLayerWithRect(CurrentContext, v16, 0);
  BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)objc_msgSend(a1, "_CGPDFPage"), kCGPDFMediaBox);
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  v13 = a4 / BoxRect.size.width;
  BoxRect.origin.x = a2;
  BoxRect.origin.y = a3;
  BoxRect.size.width = a4;
  BoxRect.size.height = a5;
  MinX = CGRectGetMinX(BoxRect);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  MaxY = CGRectGetMaxY(v18);
  CGContextTranslateCTM(CurrentContext, MinX, MaxY);
  CGContextScaleCTM(CurrentContext, v13, -a5 / height);
  CGContextDrawPDFPage(CurrentContext, (CGPDFPageRef)objc_msgSend(a1, "_CGPDFPage"));
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = width;
  v19.size.height = height;
  UIRectFillUsingBlendMode(v19, kCGBlendModeSourceIn);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

@end
