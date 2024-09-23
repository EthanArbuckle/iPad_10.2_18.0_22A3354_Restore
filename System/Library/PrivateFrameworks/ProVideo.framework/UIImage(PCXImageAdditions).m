@implementation UIImage(PCXImageAdditions)

- (uint64_t)initPCXImageWithContentsOfURL:()PCXImageAdditions
{
  return objc_msgSend(a1, "initWithData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:"));
}

- (uint64_t)initPCXImageWithSize:()PCXImageAdditions
{
  UIImage *ImageFromCurrentImageContext;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a2, 0, 0.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return objc_msgSend(a1, "initWithCGImage:", -[UIImage CGImage](ImageFromCurrentImageContext, "CGImage"));
}

+ (UIImage)pcxImageWithSize:()PCXImageAdditions flipped:drawingHandler:
{
  CGContext *CurrentContext;
  CGContext *v11;
  char v12;
  UIImage *ImageFromCurrentImageContext;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a1, 0, 0.0);
  if (!a6)
    goto LABEL_9;
  if (a5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    v11 = CurrentContext;
    if (CurrentContext)
    {
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(v11, 0.0, a2);
      CGContextScaleCTM(v11, 1.0, -1.0);
      v12 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = 1;
LABEL_7:
  (*(void (**)(uint64_t, double, double, double, CGFloat))(a6 + 16))(a6, 0.0, 0.0, a1, a2);
  if ((v12 & 1) == 0)
    CGContextRestoreGState(v11);
LABEL_9:
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (uint64_t)pcxImageWithAlpha:()PCXImageAdditions
{
  if (DeviceRGB_once != -1)
    dispatch_once(&DeviceRGB_once, &__block_literal_global_91);
  return objc_msgSend(a1, "pcxImageWithAlpha:colorSpace:", DeviceRGB_result, a2);
}

- (uint64_t)pcxImageWithAlpha:()PCXImageAdditions colorSpace:
{
  double v7;
  CGImage *v8;
  unint64_t Width;
  unint64_t Height;
  void *v11;
  void *v12;
  CGContext *v13;
  CGContext *v14;
  CGImageRef Image;
  CGImage *v16;
  void *v17;
  double v18;
  uint64_t v19;
  CGRect v21;

  if (a2 > 1.0 || a2 < 0.0)
    v7 = 1.0;
  else
    v7 = a2;
  v8 = (CGImage *)objc_msgSend(a1, "CGImage");
  Width = CGImageGetWidth(v8);
  Height = CGImageGetHeight(v8);
  v11 = malloc_type_malloc(4 * Width * Height, 0xFC28748AuLL);
  if (!v11)
    return 0;
  v12 = v11;
  bzero(v11, 4 * Width * Height);
  v13 = CGBitmapContextCreate(v12, Width, Height, 8uLL, 4 * Width, a4, 1u);
  if (v13)
  {
    v14 = v13;
    CGContextScaleCTM(v13, 1.0, -1.0);
    CGContextTranslateCTM(v14, 0.0, -(double)Height);
    CGContextSetBlendMode(v14, kCGBlendModeMultiply);
    CGContextSetAlpha(v14, v7);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = (double)Width;
    v21.size.height = (double)Height;
    CGContextDrawImage(v14, v21, v8);
    Image = CGBitmapContextCreateImage(v14);
    if (Image)
    {
      v16 = Image;
      v17 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(a1, "scale");
      v19 = objc_msgSend(v17, "imageWithCGImage:scale:orientation:", v16, objc_msgSend(a1, "imageOrientation"), v18);
      CGImageRelease(v16);
    }
    else
    {
      v19 = 0;
    }
    CGContextRelease(v14);
  }
  else
  {
    v19 = 0;
  }
  free(v12);
  return v19;
}

@end
