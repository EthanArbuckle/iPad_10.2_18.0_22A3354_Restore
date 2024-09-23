@implementation UIImage(VUISBGraphics)

+ (unint64_t)vui_bytesNeededForSize:()VUISBGraphics scale:withContextType:
{
  return CGBitmapGetAlignedBytesPerRow() * vcvtpd_u64_f64(a2 * a3);
}

+ (uint64_t)vui_imageFromContextWithSize:()VUISBGraphics scale:type:pool:drawing:
{
  return objc_msgSend(a1, "vui_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", a3, a4, a5, 0);
}

+ (id)vui_imageFromContextWithSize:()VUISBGraphics scale:type:pool:drawing:encapsulation:
{
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  size_t AlignedBytesPerRow;
  size_t v20;
  CGColorSpace *DeviceRGB;
  uint32_t v22;
  void *Data;
  CGContext *v24;
  CGDataProvider *v25;
  CGImage *Image;
  uint64_t v27;
  void *v28;
  size_t bitsPerPixel;
  uint64_t v31;
  void *v32;
  CGAffineTransform v33;
  CGRect v34;

  v16 = MEMORY[0x1DF0999A8]();
  v17 = vcvtpd_u64_f64(a1 * a3);
  if (a6 == 2)
    v18 = 8;
  else
    v18 = 32;
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v20 = vcvtpd_u64_f64(a2 * a3);
  v31 = a9;
  v32 = (void *)v16;
  bitsPerPixel = v18;
  if (a6 == 2)
  {
    DeviceRGB = 0;
    v22 = 7;
    if (!a7)
    {
LABEL_6:
      Data = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v22 = 8194;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (!a7)
      goto LABEL_6;
  }
  Data = (void *)CGBitmapAllocateData();
LABEL_9:
  v24 = CGBitmapContextCreate(Data, v17, v20, 8uLL, AlignedBytesPerRow, DeviceRGB, v22);
  v34.size.width = (double)v17;
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.height = (double)v20;
  CGContextClearRect(v24, v34);
  if (a8)
  {
    CGContextTranslateCTM(v24, 0.0, (double)v20);
    CGContextScaleCTM(v24, a3, -a3);
    CGContextGetCTM(&v33, v24);
    CGContextSetBaseCTM();
    UIGraphicsPushContext(v24);
    (*(void (**)(uint64_t))(a8 + 16))(a8);
    UIGraphicsPopContext();
  }
  if (a7 && Data)
  {
    v25 = CGDataProviderCreateWithCFData((CFDataRef)objc_msgSend(a7, "nextSlotWithBytes:length:", Data, AlignedBytesPerRow * v20));
    Image = CGImageCreate(v17, v20, 8uLL, bitsPerPixel, AlignedBytesPerRow, DeviceRGB, v22, v25, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v25);
    CGBitmapFreeData();
  }
  else
  {
    Image = CGBitmapContextCreateImage(v24);
  }
  if (v31)
    v27 = (*(uint64_t (**)(double))(v31 + 16))(a3);
  else
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", Image, 0, a3);
  v28 = (void *)v27;
  CGImageRelease(Image);
  if (DeviceRGB)
    CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v24);
  objc_autoreleasePoolPop(v32);
  return v28;
}

@end
