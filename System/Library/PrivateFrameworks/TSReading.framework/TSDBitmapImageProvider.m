@implementation TSDBitmapImageProvider

+ (CGImage)CGImageForImageData:(id)a3
{
  objc_opt_class();
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", a3, 1);
  return (CGImage *)objc_msgSend((id)TSUDynamicCast(), "CGImageForNaturalSize");
}

+ (CGImage)temporaryCGImageForImageData:(id)a3
{
  const __CFString *v4;
  TSDBitmapImageProvider *v5;

  v4 = (const __CFString *)objc_msgSend(a3, "type");
  if (UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x24BDC17A0]))
    v5 = -[TSDImageProvider initWithImageData:]([TSDBitmapImageProvider alloc], "initWithImageData:", a3);
  else
    v5 = 0;
  return -[TSDBitmapImageProvider CGImageForNaturalSize](v5, "CGImageForNaturalSize");
}

+ (CGImageSource)temporaryCGImageSourceForImageData:(id)a3
{
  const __CFString *v4;
  TSDBitmapImageProvider *v5;

  v4 = (const __CFString *)objc_msgSend(a3, "type");
  if (UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x24BDC17A0]))
    v5 = -[TSDImageProvider initWithImageData:]([TSDBitmapImageProvider alloc], "initWithImageData:", a3);
  else
    v5 = 0;
  return -[TSDBitmapImageProvider CGImageSource](v5, "CGImageSource");
}

+ (id)TSUImageForImageData:(id)a3
{
  id result;

  result = (id)objc_msgSend(a1, "CGImageForImageData:", a3);
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:", result);
  return result;
}

+ (CGSize)naturalSizeForImageData:(id)a3
{
  void *v4;
  double v5;
  double v6;
  CGSize result;

  objc_opt_class();
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", a3, 1);
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    objc_msgSend(v4, "naturalSize");
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)i_commonInit
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDBitmapImageProvider;
  -[TSDImageProvider i_commonInit](&v5, sel_i_commonInit);
  if (self->mImageLock)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBitmapImageProvider i_commonInit]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 181, CFSTR("called i_common init twice on same object!"));
  }
  self->mImageLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  __dmb(0xBu);
}

- (void)dealloc
{
  CGImageSource *mImageSource;
  NSObject *mImageLock;
  objc_super v5;

  CGImageRelease(self->mImage);
  mImageSource = self->mImageSource;
  if (mImageSource)
    CFRelease(mImageSource);
  CGImageRelease(self->mHalfSizeImage);
  CGImageRelease(self->mQuarterSizeImage);
  mImageLock = self->mImageLock;
  if (mImageLock)
    dispatch_release(mImageLock);
  v5.receiver = self;
  v5.super_class = (Class)TSDBitmapImageProvider;
  -[TSDImageProvider dealloc](&v5, sel_dealloc);
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  -[TSDBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isValid
{
  _QWORD block[5];

  -[TSDBitmapImageProvider p_loadSourceRefIfNecessary](self, "p_loadSourceRefIfNecessary");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TSDBitmapImageProvider_isValid__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  if (self->mCheckIfValidToken != -1)
    dispatch_once(&self->mCheckIfValidToken, block);
  return self->mIsValid;
}

void __33__TSDBitmapImageProvider_isValid__block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGImage *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56) || *(_QWORD *)(v2 + 128) || *(_QWORD *)(v2 + 136))
  {
    *(_BYTE *)(v2 + 97) = 1;
  }
  else
  {
    v3 = (CGImage *)objc_msgSend((id)v2, "p_newImageFromSource:", *(_QWORD *)(v2 + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 97) = v3 != 0;
    CGImageRelease(v3);
  }
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v10;
  uint64_t v11;
  CGImage *v12;
  CGImage *v13;
  double MinY;
  CGFloat MaxY;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!-[TSDBitmapImageProvider isValid](self, "isValid"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBitmapImageProvider drawImageInContext:rect:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 234, CFSTR("shouldn't be drawing an invalid image provider"));
  }
  v12 = -[TSDBitmapImageProvider CGImageForSize:inContext:orLayer:](self, "CGImageForSize:inContext:orLayer:", a3, 0, width, height);
  if (v12)
  {
    v13 = v12;
    CGContextSaveGState(a3);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinY = CGRectGetMinY(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MaxY = CGRectGetMaxY(v18);
    CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
    CGContextScaleCTM(a3, 1.0, -1.0);
    -[TSDBitmapImageProvider orientation](self, "orientation");
    TSUImageOrientationTransform();
    CGContextConcatCTM(a3, &v16);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    CGContextDrawImage(a3, v19, v13);
    CGContextRestoreGState(a3);
  }
}

- (CGImage)CGImageForNaturalSize
{
  -[TSDBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
  return self->mImage;
}

- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orLayer:(id)a5
{
  double height;
  double width;
  void *BitmapQualityInfo;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  TSDBitmapImageProvider *v32;
  uint64_t v33;
  CGAffineTransform v34;

  height = a3.height;
  width = a3.width;
  -[TSDBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  BitmapQualityInfo = (void *)TSDCGContextGetBitmapQualityInfo((uint64_t)a4);
  if (a4)
  {
    if (a5)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBitmapImageProvider CGImageForSize:inContext:orLayer:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 288, CFSTR("using context to determine requested image size. layer should be nil"));
    }
    if ((TSDCGContextIsPrintContext((uint64_t)a4) & 1) != 0 || TSDCGContextIsPDFContext((uint64_t)a4))
    {
      -[TSDBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
      if (!BitmapQualityInfo)
        return self->mImage;
    }
    v13 = TSDCGContextAssociatedScreenScale((uint64_t)a4);
    v14 = TSDMultiplySizeScalar(width, height, v13);
    v16 = v15;
    CGContextGetCTM(&v34, a4);
    v17 = TSDTransformScale(&v34.a);
    v18 = v14;
    v19 = v16;
  }
  else
  {
    if (!a5)
      goto LABEL_11;
    objc_msgSend(a5, "contentsScale");
    v17 = v20;
    v18 = width;
    v19 = height;
  }
  width = TSDMultiplySizeScalar(v18, v19, v17);
  height = v21;
LABEL_11:
  if (BitmapQualityInfo)
    return (CGImage *)objc_msgSend(BitmapQualityInfo, "degradedImageRefForProvider:ofSize:", self, width, height);
  -[TSDBitmapImageProvider naturalSize](self, "naturalSize");
  v24 = v23;
  v26 = v25;
  v27 = TSDMultiplySizeScalar(v23, v25, 0.25);
  v29 = v28;
  v30 = TSDMultiplySizeScalar(v24, v26, 0.5);
  if (width > v27 || v29 < 1.0 || height > v29 || v27 < 1.0)
  {
    if (width <= v30 && v31 >= 1.0 && height <= v31 && v30 >= 1.0)
    {
      v32 = self;
      v33 = 1;
      return -[TSDBitmapImageProvider p_resampledImageOfSizeType:](v32, "p_resampledImageOfSizeType:", v33, v30);
    }
    -[TSDBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
    return self->mImage;
  }
  v32 = self;
  v33 = 2;
  return -[TSDBitmapImageProvider p_resampledImageOfSizeType:](v32, "p_resampledImageOfSizeType:", v33, v30);
}

- (CGImage)CGImageForSize:(CGSize)a3 lowQuality:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  double v15;
  id v16;
  id v17;
  id v18;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[TSDBitmapImageProvider naturalSize](self, "naturalSize");
  v10 = v9;
  if (width >= v8)
  {
    if (height >= v9)
    {
      width = v8;
      if (!-[TSDBitmapImageProvider isOpaque](self, "isOpaque"))
        return -[TSDBitmapImageProvider CGImageForNaturalSize](self, "CGImageForNaturalSize");
    }
    else
    {
      width = v8;
    }
  }
  v11 = width;
  v12 = ceilf(v11);
  if (height >= v10)
    v13 = v10;
  else
    v13 = height;
  v14 = v13;
  v15 = ceilf(v14);
  v16 = -[TSDImageProvider imageData](self, "imageData");
  v17 = TSDResampledImageFromProvider(self, 0, (void *)objc_msgSend((id)objc_msgSend(v16, "filename"), "lastPathComponent"), objc_msgSend(v16, "context"), v4 | 0x14, v12, v15);
  if (v17)
    v18 = v17;
  else
    v18 = v16;
  return +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v18);
}

- (CGImage)p_loadOrCreateResampledImageWithScale:(unint64_t)a3 andCGImage:(CGImage *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  uint64_t v12;
  const __CFDictionary *v13;
  CGImageSource *v14;
  CGImageSource *v15;
  CGImage *ThumbnailAtIndex;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  -[TSDBitmapImageProvider naturalSize](self, "naturalSize");
  v9 = TSDMultiplySizeScalar(v7, v8, (double)a3 / 100.0);
  if (v9 <= v10)
    v9 = v10;
  v11 = v9;
  v12 = *MEMORY[0x24BDD9788];
  v18[0] = *MEMORY[0x24BDD9778];
  v18[1] = v12;
  v19[0] = MEMORY[0x24BDBD1C8];
  v19[1] = MEMORY[0x24BDBD1C0];
  v18[2] = *MEMORY[0x24BDD9808];
  v19[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", vcvtps_u32_f32(v11));
  v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = -[TSDBitmapImageProvider p_newCGImageSourceForTemporaryUse](self, "p_newCGImageSourceForTemporaryUse");
  if (v14)
  {
    v15 = v14;
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v14, 0, v13);
    CFRelease(v15);
  }
  else
  {
    ThumbnailAtIndex = 0;
  }
  *a4 = ThumbnailAtIndex;
  return ThumbnailAtIndex;
}

- (CGImage)p_resampledImageOfSizeType:(int)a3
{
  CGImage *mQuarterSizeImage;
  TSDBitmapImageProvider *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
LABEL_13:
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBitmapImageProvider p_resampledImageOfSizeType:]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapImageProvider.m"), 466, CFSTR("Couldn't resample image for faster rendering"));
        return self->mImage;
      }
      mQuarterSizeImage = self->mQuarterSizeImage;
      if (!mQuarterSizeImage)
      {
        v6 = self;
        v7 = 25;
        goto LABEL_12;
      }
LABEL_9:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
      return mQuarterSizeImage;
    }
    mQuarterSizeImage = self->mHalfSizeImage;
    if (mQuarterSizeImage)
      goto LABEL_9;
    v6 = self;
    v7 = 50;
  }
  else
  {
    mQuarterSizeImage = self->mImage;
    if (mQuarterSizeImage)
      goto LABEL_9;
    v6 = self;
    v7 = 100;
  }
LABEL_12:
  mQuarterSizeImage = -[TSDBitmapImageProvider p_loadOrCreateResampledImageWithScale:andCGImage:](v6, "p_loadOrCreateResampledImageWithScale:andCGImage:", v7);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
  if (!mQuarterSizeImage)
    goto LABEL_13;
  return mQuarterSizeImage;
}

- (int64_t)orientation
{
  -[TSDBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  return self->mOrientation;
}

- (BOOL)isOpaque
{
  -[TSDBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  return self->mIsOpaque;
}

- (unint64_t)imageGamut
{
  unint64_t result;
  CGColorSpace *ColorSpace;

  -[TSDBitmapImageProvider p_loadImageMetadata](self, "p_loadImageMetadata");
  result = self->mImageGamut;
  if (!result)
  {
    -[TSDBitmapImageProvider p_loadFullSizedImageIfNecessary](self, "p_loadFullSizedImageIfNecessary");
    result = (unint64_t)self->mImage;
    if (result)
    {
      ColorSpace = CGImageGetColorSpace((CGImageRef)result);
      if (CGColorSpaceIsWideGamutRGB(ColorSpace))
        result = 1;
      else
        result = 2;
      self->mImageGamut = result;
    }
  }
  return result;
}

- (unint64_t)imageDPI
{
  unint64_t result;
  CGImageSource *v4;
  CGImageSource *v5;
  CFDictionaryRef v6;
  unint64_t v7;

  result = self->mDPI;
  if (!result)
  {
    v4 = -[TSDBitmapImageProvider p_newCGImageSourceForTemporaryUse](self, "p_newCGImageSourceForTemporaryUse");
    if (v4)
    {
      v5 = v4;
      v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
      CFRelease(v5);
      v7 = objc_msgSend((id)-[__CFDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDD93C0]), "unsignedIntegerValue");
      if (v6)
        CFRelease(v6);
      if (v7)
        result = v7;
      else
        result = 72;
      self->mDPI = result;
    }
    else
    {
      return self->mDPI;
    }
  }
  return result;
}

- (CGSize)dpiAdjustedFillSize
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = -[TSDBitmapImageProvider imageDPI](self, "imageDPI");
  -[TSDBitmapImageProvider naturalSize](self, "naturalSize");
  if (v3 >= 0x49)
  {
    v6 = TSDMultiplySizeScalar(v4, v5, 72.0 / (double)v3);
    v4 = TSDCeilSize(v6);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)dpiAdjustedNaturalSize
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[TSDBitmapImageProvider imageDPI](self, "imageDPI");
  v4 = 1.0;
  if (v3 >= 0x79)
    v4 = 72.0 / (double)v3;
  if (objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](self, "imageData"), "filename"), "tsu_containsSubstring:", CFSTR("@2x")))v4 = 0.5;
  -[TSDBitmapImageProvider naturalSize](self, "naturalSize");
  if (v4 != 1.0 && fabs(v4 + -1.0) >= 0.000000999999997)
  {
    v7 = TSDMultiplySizeScalar(v5, v6, v4);
    v5 = TSDCeilSize(v7);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)hasFlushableContent
{
  return self->mImage || self->mImageSource || self->mHalfSizeImage || self->mQuarterSizeImage != 0;
}

- (void)flush
{
  CGImage *mImage;
  CGImageSource *mImageSource;
  CGImage *mHalfSizeImage;
  CGImage *mQuarterSizeImage;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
  mImage = self->mImage;
  if (mImage)
  {
    CGImageRelease(mImage);
    self->mImage = 0;
  }
  mImageSource = self->mImageSource;
  if (mImageSource)
  {
    CFRelease(mImageSource);
    self->mImageSource = 0;
  }
  if (self->super.mLoadState == 1)
    self->super.mLoadState = 0;
  mHalfSizeImage = self->mHalfSizeImage;
  if (mHalfSizeImage)
  {
    CGImageRelease(mHalfSizeImage);
    self->mHalfSizeImage = 0;
  }
  mQuarterSizeImage = self->mQuarterSizeImage;
  if (mQuarterSizeImage)
  {
    CGImageRelease(mQuarterSizeImage);
    self->mQuarterSizeImage = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
}

- (void)p_loadFullSizedImageIfNecessary
{
  CGImageSource *mImageSource;
  CGImage *v4;
  int v5;

  if (!self->mImage && self->super.mLoadState != 2)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
    if (self->mImage || self->super.mLoadState == 2)
    {
LABEL_16:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
      return;
    }
    mImageSource = self->mImageSource;
    if (mImageSource)
    {
      CFRetain(self->mImageSource);
    }
    else
    {
      mImageSource = -[TSDBitmapImageProvider p_newCGImageSource](self, "p_newCGImageSource");
      if (!mImageSource)
      {
        v4 = 0;
LABEL_12:
        self->mImage = v4;
        if (v4)
          v5 = 1;
        else
          v5 = 2;
        self->super.mLoadState = v5;
        goto LABEL_16;
      }
    }
    v4 = -[TSDBitmapImageProvider p_newImageFromSource:](self, "p_newImageFromSource:", mImageSource);
    if (v4)
      -[TSDBitmapImageProvider p_configureOrientationAndSizeFromImageSource:andImage:](self, "p_configureOrientationAndSizeFromImageSource:andImage:", mImageSource, v4);
    CFRelease(mImageSource);
    goto LABEL_12;
  }
}

- (void)p_loadSourceRefIfNecessary
{
  CGImageSource *v3;
  int v4;

  if (!self->mImageSource && self->super.mLoadState != 2)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->mImageLock, 0xFFFFFFFFFFFFFFFFLL);
    if (!self->mImageSource && self->super.mLoadState != 2)
    {
      v3 = -[TSDBitmapImageProvider p_newCGImageSource](self, "p_newCGImageSource");
      if (v3)
      {
        -[TSDBitmapImageProvider p_configureOrientationAndSizeFromImageSource:andImage:](self, "p_configureOrientationAndSizeFromImageSource:andImage:", v3, 0);
        v4 = 1;
      }
      else
      {
        v4 = 2;
      }
      self->mImageSource = v3;
      self->super.mLoadState = v4;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->mImageLock);
  }
}

- (CGImageSource)p_newCGImageSource
{
  return (CGImageSource *)objc_msgSend(-[TSDImageProvider imageData](self, "imageData"), "newCGImageSource");
}

- (CGImage)p_newImageFromSource:(CGImageSource *)a3
{
  void *v4;
  uint64_t v5;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  return CGImageSourceCreateImageAtIndex(a3, 0, (CFDictionaryRef)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x24BDD97D0], 0));
}

- (void)p_configureOrientationAndSizeFromImageSource:(CGImageSource *)a3 andImage:(CGImage *)a4
{
  CFDictionaryRef v7;
  const __CFDictionary *v8;
  int v9;
  void *Value;
  double Height;
  double Width;
  double v13;
  void *v14;
  double v15;
  const void *v16;
  BOOL v17;
  unsigned int v18;
  double v19;

  v7 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  if (!v7)
  {
    v9 = 0;
LABEL_12:
    if (!a4)
    {
      a4 = -[TSDBitmapImageProvider p_newImageFromSource:](self, "p_newImageFromSource:", a3);
      self->mImage = a4;
    }
    Width = (double)CGImageGetWidth(a4);
    Height = (double)CGImageGetHeight(a4);
    goto LABEL_15;
  }
  v8 = v7;
  v9 = objc_msgSend((id)-[__CFDictionary objectForKey:](v7, "objectForKey:", *MEMORY[0x24BDD9698]), "intValue");
  Value = (void *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BDD96C8]);
  Height = 0.0;
  Width = 0.0;
  if (Value)
  {
    objc_msgSend(Value, "tsu_CGFloatValue");
    Width = v13;
  }
  v14 = (void *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BDD96C0]);
  if (v14)
  {
    objc_msgSend(v14, "tsu_CGFloatValue");
    Height = v15;
  }
  v16 = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BDD9630]);
  if (v16)
    v17 = CFEqual(v16, (CFTypeRef)*MEMORY[0x24BDBD268]) != 0;
  else
    v17 = 1;
  self->mIsOpaque = v17;
  CFRelease(v8);
  if (Width == 0.0 || Height == 0.0)
    goto LABEL_12;
LABEL_15:
  v18 = v9 - 1;
  if ((v9 - 1) >= 8)
  {
    self->mOrientation = 0;
  }
  else
  {
    self->mOrientation = p_configureOrientationAndSizeFromImageSource_andImage____orientationMapping[v18];
    if (v18 >= 4)
      v19 = Height;
    else
      v19 = Width;
    if (v18 >= 4)
      Height = Width;
    Width = v19;
  }
  self->mNaturalSize.width = Width;
  self->mNaturalSize.height = Height;
}

+ (id)p_cacheStringForData:(id)a3
{
  return 0;
}

+ (void)clearCacheForData:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if ((objc_msgSend(a3, "isApplicationData") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(a1, "p_cacheStringForData:", a3);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "stringByAppendingString:", CFSTR("-50.png"));
      v8 = objc_msgSend(v6, "stringByAppendingString:", CFSTR("-25.png"));
      if (objc_msgSend(v6, "isAbsolutePath"))
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        objc_msgSend(v9, "removeItemAtPath:error:", v7, 0);
        objc_msgSend(v9, "removeItemAtPath:error:", v8, 0);
      }
      else
      {
        v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "context"), "documentRoot");
        objc_msgSend(v10, "writeData:atDocumentCachePath:", 0, v7);
        objc_msgSend(v10, "writeData:atDocumentCachePath:", 0, v8);
      }
    }
  }
}

+ (CGImageSource)p_newImageSourceFromCacheForData:(id)a3 withFilenameSuffix:(id)a4
{
  CGImageSource *result;
  void *v8;

  result = (CGImageSource *)objc_msgSend(a1, "p_cacheStringForData:");
  if (result)
  {
    v8 = (void *)-[CGImageSource stringByAppendingString:](result, "stringByAppendingString:", a4);
    if (objc_msgSend(v8, "isAbsolutePath"))
      return (CGImageSource *)objc_msgSend(a1, "p_newImageSourceFromFilePath:", v8);
    else
      return (CGImageSource *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "context"), "documentRoot"), "newImageSourceForDocumentCachePath:", v8);
  }
  return result;
}

+ (CGImageSource)p_newImageSourceFromFilePath:(id)a3
{
  CGImageSource *result;
  CGImageSource *v4;
  void *v5;
  uint64_t v6;
  CGImageSource *v7;

  result = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)a3, kCFURLPOSIXPathStyle, 0);
  if (result)
  {
    v4 = result;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = CGImageSourceCreateWithURL(v4, (CFDictionaryRef)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x24BDD97D0], 0));
    CFRelease(v4);
    return v7;
  }
  return result;
}

- (CGImageSource)p_newCGImageSourceForTemporaryUse
{
  CGImageSource *mImageSource;

  mImageSource = self->mImageSource;
  if (!mImageSource)
    return -[TSDBitmapImageProvider p_newCGImageSource](self, "p_newCGImageSource");
  CFRetain(self->mImageSource);
  return mImageSource;
}

- (CGImageSource)p_newImageOfSize:(CGSize)a3 andWriteToCacheWithSuffix:(id)a4
{
  double height;
  double width;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float v14;
  uint64_t v15;
  const __CFDictionary *v16;
  CGImageSource *v17;
  CGImageSource *v18;
  CGImage *ThumbnailAtIndex;
  id *v20;
  void *v21;
  const __CFString *v22;
  const __CFURL *v23;
  CGImageDestination *v24;
  CGImageDestination *v25;
  void *v26;
  uint64_t v27;
  CGImageSource *v28;
  char v29;
  __CFData *v30;
  CGImageDestination *v31;

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v10 = *MEMORY[0x24BDD9778];
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v12 = *MEMORY[0x24BDD9788];
  if (width <= height)
    v13 = height;
  else
    v13 = width;
  v14 = v13;
  v15 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", vcvtps_u32_f32(v14));
  v16 = (const __CFDictionary *)objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v10, v11, v12, v15, *MEMORY[0x24BDD9808], 0);
  v17 = -[TSDBitmapImageProvider p_newCGImageSourceForTemporaryUse](self, "p_newCGImageSourceForTemporaryUse");
  if (v17)
  {
    v18 = v17;
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v17, 0, v16);
    CFRelease(v18);
    if (ThumbnailAtIndex)
    {
      v20 = (id *)MEMORY[0x24BDF84F8];
      if (a4
        && (v21 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "p_cacheStringForData:", -[TSDImageProvider imageData](self, "imageData")), "stringByAppendingString:", a4), (a4 = v21) != 0))
      {
        if (objc_msgSend(v21, "isAbsolutePath"))
        {
          v22 = (const __CFString *)objc_msgSend(*v20, "identifier");
          v23 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)a4, kCFURLPOSIXPathStyle, 0);
          v24 = CGImageDestinationCreateWithURL(v23, v22, 1uLL, 0);
          if (v24)
          {
            v25 = v24;
            CGImageDestinationAddImage(v24, ThumbnailAtIndex, 0);
            CGImageDestinationFinalize(v25);
            CFRelease(v25);
            v26 = (void *)MEMORY[0x24BDBCE70];
            v27 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v28 = CGImageSourceCreateWithURL(v23, (CFDictionaryRef)objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x24BDD97D0], 0));
            CFRelease(v23);
LABEL_19:
            CGImageRelease(ThumbnailAtIndex);
            return v28;
          }
          CFRelease(v23);
        }
        v29 = 0;
      }
      else
      {
        v29 = 1;
      }
      v30 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v31 = CGImageDestinationCreateWithData(v30, (CFStringRef)objc_msgSend(*v20, "identifier"), 1uLL, 0);
      CGImageDestinationAddImage(v31, ThumbnailAtIndex, 0);
      CGImageDestinationFinalize(v31);
      CFRelease(v31);
      v28 = CGImageSourceCreateWithData(v30, 0);
      if ((v29 & 1) == 0 && (objc_msgSend(a4, "isAbsolutePath") & 1) == 0)
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](self, "imageData"), "context"), "documentRoot"), "writeData:atDocumentCachePath:", v30, a4);

      goto LABEL_19;
    }
  }
  return 0;
}

- (CGImageSource)CGImageSource
{
  -[TSDBitmapImageProvider p_loadSourceRefIfNecessary](self, "p_loadSourceRefIfNecessary");
  return self->mImageSource;
}

@end
