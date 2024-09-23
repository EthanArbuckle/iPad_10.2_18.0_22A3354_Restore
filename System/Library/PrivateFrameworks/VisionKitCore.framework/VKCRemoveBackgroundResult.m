@implementation VKCRemoveBackgroundResult

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  CGImageRelease(self->_maskImage);
  CGImageRelease(self->_orientedMaskImage);
  v3.receiver = self;
  v3.super_class = (Class)VKCRemoveBackgroundResult;
  -[VKCRemoveBackgroundResult dealloc](&v3, sel_dealloc);
}

- (VKCRemoveBackgroundResult)initWithMADResult:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  VKCRemoveBackgroundResult *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  VKDynamicCast(v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[VKCRemoveBackgroundResult initWithMADMaskResult:request:]((CGRect *)self, v9, v7);
    v10 = self;
  }
  else
  {
    v11 = objc_opt_class();
    VKDynamicCast(v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      self = -[VKCRemoveBackgroundResult initWithMADMatteResult:request:]((id *)&self->super.isa, v12, v7);
      v10 = self;
    }
    else
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCRemoveBackgroundResult initWithMADResult:request:]", 0, 0, CFSTR("Incompatible class type for VKCRemoveBackgroundResult:initWithMadResult: %@"), objc_opt_class());
      v10 = 0;
    }

  }
  return v10;
}

- (CGRect)initWithMADMaskResult:(void *)a3 request:
{
  id v5;
  id v6;
  id *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  size_t v20;
  double v21;
  size_t v22;
  void *v23;
  uint64_t v24;
  CGFloat x;
  void *v26;
  uint64_t v27;
  CGFloat width;
  objc_super v30;
  CGRect v31;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)VKCRemoveBackgroundResult;
    v7 = (id *)-[CGRect init](&v30, sel_init);
    a1 = (CGRect *)v7;
    if (v7)
    {
      objc_storeStrong(v7 + 7, a3);
      objc_msgSend(v5, "sourceRegionOfInterest");
      v12 = VKMFlipRect(v8, v9, v10, v11, 0.0, 0.0, 1.0, 1.0);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      a1[2].origin.x = v12;
      a1[2].origin.y = v13;
      a1[2].size.width = v15;
      a1[2].size.height = v17;
      objc_msgSend(v6, "size");
      v20 = (unint64_t)v19;
      objc_msgSend(v6, "size");
      v22 = (unint64_t)v21;
      v31.origin.x = v12;
      v31.origin.y = v14;
      v31.size.width = v16;
      v31.size.height = v18;
      a1[3] = VNImageRectForNormalizedRect(v31, v20, v22);
      objc_msgSend(v5, "allInstances");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "maskImagesForInstances:error:", v23, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      x = a1[1].origin.x;
      *(_QWORD *)&a1[1].origin.x = v24;

      objc_msgSend(v5, "animatedStickerScore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAnimatedStickerScore:", v26);

      objc_msgSend(v5, "animatedStickerScore");
      v27 = objc_claimAutoreleasedReturnValue();
      width = a1[1].size.width;
      *(_QWORD *)&a1[1].size.width = v27;

      LOBYTE(a1->size.width) = 1;
    }
  }

  return a1;
}

- (id)initWithMADMatteResult:(void *)a3 request:
{
  id v5;
  id v6;
  id *v7;
  double x;
  double y;
  double width;
  double height;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  id v24;
  objc_super v26;
  CGRect v27;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)VKCRemoveBackgroundResult;
    v7 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 7, a3);
      a1[1] = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v5, "pixelBuffer"));
      +[VKCPreDeclare cropRectForMatteResult:](VKCPreDeclare, "cropRectForMatteResult:", v5);
      x = v27.origin.x;
      y = v27.origin.y;
      width = v27.size.width;
      height = v27.size.height;
      if (CGRectIsNull(v27))
      {
        *((_OWORD *)a1 + 4) = VKMRectUnit;
        *((_OWORD *)a1 + 5) = *(_OWORD *)&qword_1D2ED1098;
        vk_sizeForPixelBuffer((__CVBuffer *)a1[1]);
        v12 = VKMRectWithSize();
      }
      else
      {
        *((double *)a1 + 8) = VKMFlipRect(x, y, width, height, 0.0, 0.0, 1.0, 1.0);
        a1[9] = v16;
        a1[10] = v17;
        a1[11] = v18;
        objc_msgSend(v6, "size");
        v19 = VKMRectWithSize();
        VKMRectFromNormalizedSubrect(v19, v20, v21, v22, *((CGFloat *)a1 + 8), *((CGFloat *)a1 + 9), *((CGFloat *)a1 + 10), *((CGFloat *)a1 + 11));
      }
      *((double *)a1 + 12) = v12;
      a1[13] = v13;
      a1[14] = v14;
      a1[15] = v15;
      objc_msgSend(v6, "animatedStickerScore");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = a1[6];
      a1[6] = (id)v23;

    }
  }

  return a1;
}

- (CGImage)maskImage
{
  -[VKCRemoveBackgroundResult generateImageMaskIfNecessaryWithContext:](self, "generateImageMaskIfNecessaryWithContext:", 0);
  return self->_maskImage;
}

- (NSArray)instanceMasks
{
  return (NSArray *)(id)-[NSArray copy](self->_instanceMasks, "copy");
}

- (void)generateImageMaskIfNecessaryWithContext:(id)a3
{
  __CVBuffer *v4;
  __CVBuffer *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v4 = -[VKCRemoveBackgroundResult pixelBuffer](self, "pixelBuffer");
  if (!self->_maskImage)
  {
    v5 = v4;
    v6 = self->_orientedMaskImage || v4 == 0;
    if (!v6 && CVPixelBufferGetPixelFormatType(v4) == 1278226534)
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMaskToAlpha"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("inputImage"));
      if (v23)
        v9 = v23;
      else
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
      v10 = v9;
      CVPixelBufferGetHeight(v5);
      CVPixelBufferGetWidth(v5);
      v11 = VKMRectWithSize();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v8, "outputImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0C9E000];
      self->_maskImage = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:format:colorSpace:", v18, v19, 0, v11, v13, v15, v17);

      -[VKCRemoveBackgroundResult request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageByApplyingCGOrientation:", vk_cgImagePropertyOrientationFromVKOrientation(objc_msgSend(v20, "imageOrientation")));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setValue:forKey:", v21, CFSTR("inputImage"));
      objc_msgSend(v8, "outputImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self->_orientedMaskImage = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:format:colorSpace:", v22, v19, 0, v11, v13, v15, v17);

    }
  }

}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int64_t)imageOrientation
{
  void *v2;
  int64_t v3;

  -[VKCRemoveBackgroundResult request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageOrientation");

  return v3;
}

- (CGImage)createCGImage
{
  __CVBuffer *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t PixelFormatType;
  __CVBuffer *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = -[VKCRemoveBackgroundResult pixelBuffer](self, "pixelBuffer");
  -[VKCRemoveBackgroundResult cropRect](self, "cropRect");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (v3 && VKMRectHasArea(v4, v5, v6, v7))
  {
    CVPixelBufferRetain(v3);
    PixelFormatType = CVPixelBufferGetPixelFormatType(v3);
    if ((_DWORD)PixelFormatType == 1111970369)
    {
      v13 = vk_cgImageFromPixelBuffer(v3);
    }
    else
    {
      v15 = PixelFormatType;
      VKMUIStringForCVPixelBufferType(1111970369);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      VKMUIStringForCVPixelBufferType(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCRemoveBackgroundResult createCGImage]", 0, 0, CFSTR("Pixel format for createCGImage is incorrect, expected: %@, received: %@. Bailing"), v16, v17);

      v13 = 0;
    }
    CVPixelBufferRelease(v3);
  }
  else
  {
    VKMUIStringForRect(v8, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCRemoveBackgroundResult createCGImage]", 0, 0, CFSTR("CreateCGImage is buffer incorrect, buffer: %@, cropRect:%@"), v3, v14);

    return 0;
  }
  return v13;
}

- (CGImageRef)_createCGImageFromBGRAPixelBuffer:(CGFloat)a3 cropRect:(CGFloat)a4
{
  __CVBuffer *v10;
  CGImageRef v11;
  CGRect v13;

  if (!a1)
    return 0;
  v10 = vk_cgImageFromPixelBuffer(a2);
  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  v11 = CGImageCreateWithImageInRect(v10, v13);
  CGImageRelease(v10);
  if (v11)
    CFAutorelease(v11);
  return v11;
}

- (CGImageRef)_memoryFriendlyCreateCGImageFromBGRAPixelBuffer:(CGFloat)a3 cropRect:(CGFloat)a4
{
  char *BaseAddress;
  OSType PixelFormatType;
  const __CFDictionary *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  size_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  CGColorSpace *v21;
  size_t BytesPerRow;
  CGContext *v23;
  CGImageRef Image;
  CGRect v26;
  CGRect v27;

  if (!a1)
    return 0;
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v13 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
  if (!v13)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((pixelFormatDict) != nil)", "-[VKCRemoveBackgroundResult _memoryFriendlyCreateCGImageFromBGRAPixelBuffer:cropRect:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "pixelFormatDict");
    if (BaseAddress)
      goto LABEL_4;
LABEL_9:
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((bufferBaseAddress) != nil)", "-[VKCRemoveBackgroundResult _memoryFriendlyCreateCGImageFromBGRAPixelBuffer:cropRect:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "bufferBaseAddress");
    goto LABEL_4;
  }
  if (!BaseAddress)
    goto LABEL_9;
LABEL_4:
  -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("BitsPerComponent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  CFRelease(v13);
  v26.origin.x = a3;
  v26.origin.y = a4;
  v26.size.width = a5;
  v26.size.height = a6;
  v18 = vcvtmd_u64_f64(CGRectGetMinX(v26));
  v27.origin.x = a3;
  v27.origin.y = a4;
  v27.size.width = a5;
  v27.size.height = a6;
  v19 = vcvtmd_u64_f64(CGRectGetMinY(v27));
  v20 = &BaseAddress[(v15 >> 3) * v18 + CVPixelBufferGetBytesPerRow(pixelBuffer) * v19];
  v21 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v23 = CGBitmapContextCreate(v20, vcvtmd_u64_f64(a5), vcvtmd_u64_f64(a6), v17, BytesPerRow, v21, 0x2002u);
  Image = CGBitmapContextCreateImage(v23);
  CGContextRelease(v23);
  CGColorSpaceRelease(v21);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (Image)
    CFAutorelease(Image);

  return Image;
}

- (const)imageRefForMask:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const void *v7;
  const void *v8;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMaskToAlpha"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("inputImage"));
  objc_msgSend(v4, "valueForKey:", CFSTR("outputImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
  CVPixelBufferGetHeight(a2);
  CVPixelBufferGetWidth(a2);
  v7 = (const void *)objc_msgSend(v6, "createCGImage:fromRect:format:colorSpace:", v5, *MEMORY[0x1E0C9E000], 0, VKMRectWithSize());
  v8 = v7;
  if (v7)
    CFAutorelease(v7);

  return v8;
}

- (void)setMaskImage:(CGImage *)a3
{
  self->_maskImage = a3;
}

- (void)setInstanceMasks:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (CGImage)orientedMaskImage
{
  return self->_orientedMaskImage;
}

- (void)setOrientedMaskImage:(CGImage *)a3
{
  self->_orientedMaskImage = a3;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (BOOL)isMaskResult
{
  if (result)
    return *(_BYTE *)(result + 16) != 0;
  return result;
}

- (uint64_t)setIsMaskResult:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 16) = a2;
  return result;
}

- (VKCRemoveBackgroundRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_instanceMasks, 0);
}

@end
