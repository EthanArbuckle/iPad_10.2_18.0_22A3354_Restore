@implementation UIImage(SBFImageCGBitmapDrawing)

- (id)sbf_memoryMappedImageWithPool:()SBFImageCGBitmapDrawing
{
  id v4;
  void *v5;
  id v6;
  CGImage *v7;
  size_t Height;
  size_t BytesPerRow;
  unint64_t v10;
  unint64_t v11;
  CGDataProvider *DataProvider;
  const __CFData *v13;
  const __CFData *v14;
  unint64_t Length;
  void *v16;
  const __CFData *v18;
  const __CFData *v19;
  CGDataProviderRef v20;
  CGDataProvider *v21;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  CGImageRef v24;
  CGImage *v25;
  id v26;
  double v27;
  size_t bitsPerPixel;
  size_t BitsPerComponent;
  size_t Width;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D773FD4]();
  v6 = objc_retainAutorelease(a1);
  v7 = (CGImage *)objc_msgSend(v6, "CGImage");
  Height = CGImageGetHeight(v7);
  BytesPerRow = CGImageGetBytesPerRow(v7);
  v10 = objc_msgSend(v4, "slotLength");
  if (BytesPerRow * Height <= v10
    && (v11 = v10, (DataProvider = CGImageGetDataProvider(v7)) != 0)
    && (v13 = CGDataProviderCopyData(DataProvider)) != 0)
  {
    v14 = v13;
    Length = CFDataGetLength(v13);
    if (Length <= v11)
    {
      objc_msgSend(v4, "nextSlotWithBytes:length:", CFDataGetBytePtr(v14), Length);
      v18 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && (v20 = CGDataProviderCreateWithCFData(v18)) != 0)
      {
        v21 = v20;
        Width = CGImageGetWidth(v7);
        BitsPerComponent = CGImageGetBitsPerComponent(v7);
        bitsPerPixel = CGImageGetBitsPerPixel(v7);
        ColorSpace = CGImageGetColorSpace(v7);
        BitmapInfo = CGImageGetBitmapInfo(v7);
        v24 = CGImageCreate(Width, Height, BitsPerComponent, bitsPerPixel, BytesPerRow, ColorSpace, BitmapInfo, v21, 0, 0, kCGRenderingIntentDefault);
        if (v24)
        {
          v25 = v24;
          v26 = objc_alloc(MEMORY[0x1E0CEA638]);
          objc_msgSend(v6, "scale");
          v16 = (void *)objc_msgSend(v26, "initWithCGImage:scale:orientation:", v25, objc_msgSend(v6, "imageOrientation"), v27);
          CGImageRelease(v25);
        }
        else
        {
          v16 = 0;
        }
        CGDataProviderRelease(v21);
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    v16 = 0;
  }
  objc_autoreleasePoolPop(v5);

  return v16;
}

+ (id)sbf_imageFromContextWithSize:()SBFImageCGBitmapDrawing scale:type:pool:drawing:encapsulation:
{
  return (id)_SBFCGBitmapImageCreate(a6, 0, a7, a8, a9, a1, a2, a3);
}

+ (uint64_t)sbf_bytesNeededForSize:()SBFImageCGBitmapDrawing scale:withContextType:
{
  unint64_t v6;

  v6 = vcvtpd_u64_f64(a2 * a3);
  _SBFGraphicsContextComponentsCountForType(a6);
  return CGBitmapGetAlignedBytesPerRow() * v6;
}

+ (id)sbf_imageFromContextWithSize:()SBFImageCGBitmapDrawing scale:type:pool:drawing:
{
  return (id)_SBFCGBitmapImageCreate(a6, 0, a7, a8, 0, a1, a2, a3);
}

+ (id)sbf_imageFromBGRAContextWithSize:()SBFImageCGBitmapDrawing scale:colorSpace:withAlpha:pool:drawing:encapsulation:
{
  return (id)_SBFCGBitmapImageCreate(a7 ^ 1u, a6, a8, a9, a10, a1, a2, a3);
}

- (uint64_t)sbf_imageByDrawingIntoContextOfType:()SBFImageCGBitmapDrawing
{
  return objc_msgSend(a1, "sbf_downscaledImageByDrawingIntoContextOfType:downscaleFactor:", 1.0);
}

- (id)sbf_downscaledImageByDrawingIntoContextOfType:()SBFImageCGBitmapDrawing downscaleFactor:
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  objc_msgSend(a1, "sbf_CGImageBackedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(a1, "scale");
  v13 = v12 / a2;
  v14 = (void *)objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__UIImage_SBFImageCGBitmapDrawing__sbf_downscaledImageByDrawingIntoContextOfType_downscaleFactor___block_invoke;
  v18[3] = &unk_1E200E188;
  v19 = v7;
  v15 = v7;
  objc_msgSend(v14, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", a4, 0, v18, v9, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
