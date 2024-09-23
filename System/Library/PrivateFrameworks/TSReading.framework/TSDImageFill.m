@implementation TSDImageFill

- (TSDImageFill)initWithImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 size:(CGSize)a6 originalImageData:(id)a7
{
  CGFloat height;
  CGFloat width;
  void *v14;
  uint64_t v15;
  TSDImageFill *v16;
  objc_super v18;

  height = a6.height;
  width = a6.width;
  if (a4 >= 5)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 71, CFSTR("bogus technique"));
  }
  v18.receiver = self;
  v18.super_class = (Class)TSDImageFill;
  v16 = -[TSDImageFill init](&v18, sel_init);
  if (v16)
  {
    v16->mImageData = (TSPData *)a3;
    v16->mOriginalImageData = (TSPData *)a7;
    v16->mTechnique = a4;
    v16->mTintColor = (TSUColor *)objc_msgSend(a5, "copy");
    v16->mFillSize.width = width;
    v16->mFillSize.height = height;
    v16->mTempRenderLock = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.drawing.fills.image", 0);
  }
  return v16;
}

- (TSDImageFill)initWithGenericImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 size:(CGSize)a6 originalImageData:(id)a7
{
  TSDImageFill *result;

  result = -[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:](self, "initWithImageData:technique:tintColor:size:originalImageData:", a3, *(_QWORD *)&a4, a5, a7, a6.width, a6.height);
  if (result)
    result->mInterpretsUntaggedImageDataAsGeneric = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->mImageData && self->mHasIndicatedInterestInProvider)
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "removeInterestInProviderForData:", self->mImageData);
  dispatch_release((dispatch_object_t)self->mTempRenderLock);

  CGImageRelease(self->mTempRenderCopy);
  v3.receiver = self;
  v3.super_class = (Class)TSDImageFill;
  -[TSDImageFill dealloc](&v3, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableImageFill *v4;
  uint64_t mTechnique;
  TSUColor *mTintColor;
  uint64_t v7;

  v4 = +[TSDMutableImageFill allocWithZone:](TSDMutableImageFill, "allocWithZone:", a3);
  mTechnique = self->mTechnique;
  mTintColor = self->mTintColor;
  -[TSDImageFill fillSize](self, "fillSize");
  v7 = -[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:](v4, "initWithImageData:technique:tintColor:size:originalImageData:", 0, mTechnique, mTintColor, 0);
  if (v7)
  {
    *(_QWORD *)(v7 + 16) = self->mImageData;
    *(_QWORD *)(v7 + 24) = self->mOriginalImageData;
    *(_BYTE *)(v7 + 32) = self->mInterpretsUntaggedImageDataAsGeneric;
  }
  return (id)v7;
}

- (double)scale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  if (v4 == 0.0 || v3 == 0.0)
    return 1.0;
  -[TSDImageFill fillSize](self, "fillSize");
  v6 = v5;
  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  v8 = v6 / v7;
  -[TSDImageFill fillSize](self, "fillSize");
  v10 = v9;
  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  v12 = v10 / v11;
  if (vabdd_f64(v8, v12) >= 0.00999999978)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill scale]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 215, CFSTR("The scaled fill size should respect the aspect ratio of the natural size"));
  }
  return fmin(v8, v12);
}

- (CGSize)fillSize
{
  CGSize *p_mFillSize;
  double width;
  double height;
  CGSize result;

  p_mFillSize = &self->mFillSize;
  width = self->mFillSize.width;
  height = self->mFillSize.height;
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    if (-[TSPData isApplicationData](-[TSDImageFill imageData](self, "imageData"), "isApplicationData"))
    {
      -[TSDImageFill p_setFillSizeForApplicationData](self, "p_setFillSizeForApplicationData");
      width = p_mFillSize->width;
      height = p_mFillSize->height;
    }
    else
    {
      objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "dpiAdjustedNaturalSize");
    }
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isOpaque
{
  void *v3;
  double v4;
  BOOL v5;

  -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  objc_opt_class();
  v3 = (void *)TSUDynamicCast();
  if (-[TSDImageFill tintColor](self, "tintColor"))
  {
    -[TSUColor alphaComponent](-[TSDImageFill tintColor](self, "tintColor"), "alphaComponent");
    v5 = v4 == 1.0;
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(v3, "isOpaque") | v5;
}

- (void)p_setFillSizeForApplicationData
{
  TSPData *mOriginalImageData;
  id v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;

  mOriginalImageData = self->mOriginalImageData;
  if (!mOriginalImageData || mOriginalImageData == self->mImageData)
    v4 = -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  else
    v4 = (id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", self->mOriginalImageData, 1);
  v5 = v4;
  objc_opt_class();
  v6 = (void *)TSUDynamicCast();
  if (v6)
    objc_msgSend(v6, "dpiAdjustedFillSize");
  else
    objc_msgSend(v5, "naturalSize");
  self->mFillSize.width = v7;
  self->mFillSize.height = v8;
}

- (id)imageDataAtFillSize
{
  TSPData *v3;
  TSPData *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDImageResamplingOperation *v13;
  TSDImageResamplingOperation *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  uint64_t v24;

  if (-[TSDImageFill originalImageData](self, "originalImageData"))
    v3 = -[TSDImageFill originalImageData](self, "originalImageData");
  else
    v3 = -[TSDImageFill imageData](self, "imageData");
  v4 = v3;
  v5 = (void *)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", v3, 1);
  objc_msgSend(v5, "naturalSize");
  v7 = v6;
  v9 = v8;
  -[TSDImageFill fillSize](self, "fillSize");
  if (v7 != v11 || v9 != v10)
  {
    v13 = [TSDImageResamplingOperation alloc];
    -[TSDImageFill fillSize](self, "fillSize");
    v14 = -[TSDImageResamplingOperation initWithImageProvider:desiredSize:](v13, "initWithImageProvider:desiredSize:", v5);
    -[TSDImageResamplingOperation setDisplayName:](v14, "setDisplayName:", -[TSPData filename](v4, "filename"));
    v15 = -[TSDImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:](v14, "performResampleOperationWithResampleOptions:bitmapContextOptions:", 10, 11);
    if (v15)
      v4 = (TSPData *)v15;

  }
  objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", v4, 1), "naturalSize");
  v17 = v16;
  v19 = v18;
  -[TSDImageFill fillSize](self, "fillSize");
  if (v17 != v21 || v19 != v20)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill imageDataAtFillSize]");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 287, CFSTR("Fill size is incorrect."));
  }
  return v4;
}

- (id)referenceColor
{
  id result;
  void *v4;
  CGContext *v5;
  CGPath *Mutable;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _DWORD *Data;
  id v18;
  CGRect v19;

  result = self->mReferenceColor;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mReferenceColor)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
      if (-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"))
      {
        v5 = TSDBitmapContextCreate(3, 1.0);
        if (v5)
        {
          Mutable = CGPathCreateMutable();
          if (Mutable)
          {
            -[TSDImageFill fillSize](self, "fillSize");
            v8 = v7;
            v10 = v9;
            v19.origin.x = TSDRectWithSize();
            CGPathAddRect(Mutable, 0, v19);
            CGContextScaleCTM(v5, 1.0 / v8, 1.0 / v10);
            -[TSDImageFill paintPath:inContext:](self, "paintPath:inContext:", Mutable, v5);
            CGPathRelease(Mutable);
          }
          else
          {
            v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill referenceColor]");
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 312, CFSTR("invalid nil value for '%s'"), "path");
          }
          Data = CGBitmapContextGetData(v5);
          if (Data)
            v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", (double)BYTE2(*Data) / 255.0, (double)BYTE1(*Data) / 255.0, (double)*Data / 255.0, 1.0);
          CGContextRelease(v5);
        }
        else
        {
          v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill referenceColor]");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 308, CFSTR("invalid nil value for '%s'"), "smallContext");
        }
      }
      else
      {
        v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill referenceColor]");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 302, CFSTR("invalid nil value for '%s'"), "provider");
      }
      v18 = v4;
      __dmb(0xBu);
      self->mReferenceColor = (TSUColor *)v4;
    }
    objc_sync_exit(self);
    return self->mReferenceColor;
  }
  return result;
}

- (unint64_t)hash
{
  return -[TSPData hash](self->mImageData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v24 = v5;
    v25 = v4;
    v26 = v3;
    objc_opt_class();
    v12 = (void *)TSUDynamicCast();
    if (v12)
    {
      v13 = v12;
      LODWORD(v12) = -[TSPData isEqual:](-[TSDImageFill imageData](self, "imageData"), "isEqual:", objc_msgSend(v12, "imageData"));
      if ((_DWORD)v12)
      {
        v14 = -[TSDImageFill technique](self, "technique");
        if (v14 == objc_msgSend(v13, "technique"))
        {
          v15 = -[TSDImageFill tintColor](self, "tintColor");
          v16 = objc_msgSend(v13, "tintColor");
          if (!(v15 | v16) || (LODWORD(v12) = objc_msgSend((id)v15, "isEqual:", v16), (_DWORD)v12))
          {
            -[TSDImageFill fillSize](self, "fillSize", v10, v9, v6, v24, v25, v26, v7, v8);
            v18 = v17;
            v20 = v19;
            objc_msgSend(v13, "fillSize");
            LOBYTE(v12) = v20 == v22 && v18 == v21;
          }
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
    }
  }
  return (char)v12;
}

- (BOOL)drawsInOneStep
{
  char isKindOfClass;

  if (self->mTintColor)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & (self->mTechnique != 2);
}

- (BOOL)canApplyToCALayer
{
  void *v3;

  if (self->mTintColor || (self->mTechnique | 2) == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_opt_class();
    -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
    v3 = (void *)TSUDynamicCast();
    if (v3)
      LOBYTE(v3) = objc_msgSend(v3, "orientation") == 0;
  }
  return (char)v3;
}

- (BOOL)canApplyToCALayerByAddingSublayers
{
  void *v3;

  if (self->mTintColor || self->mTechnique == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_opt_class();
    -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
    v3 = (void *)TSUDynamicCast();
    if (v3)
      LOBYTE(v3) = objc_msgSend(v3, "orientation") == 0;
  }
  return (char)v3;
}

- (int)fillType
{
  return 2;
}

- (BOOL)p_shouldApplyTintedImage
{
  id v3;

  v3 = -[TSDImageFill p_standardSizeCachedImage](self, "p_standardSizeCachedImage");
  if (v3)
    LOBYTE(v3) = -[TSDImageFill tintColor](self, "tintColor") != 0;
  return (char)v3;
}

- (BOOL)shouldBeReappliedToCALayer:(id)a3
{
  void *v6;
  double v7;
  double v8;
  uint64_t v9;

  if (!self->mTechnique)
    return 1;
  if (-[TSDImageFill p_shouldApplyTintedImage](self, "p_shouldApplyTintedImage"))
    return 0;
  objc_opt_class();
  -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  v6 = (void *)TSUDynamicCast();
  objc_msgSend(a3, "bounds");
  v9 = objc_msgSend(v6, "CGImageForSize:inContext:orLayer:", 0, a3, v7, v8);
  return objc_msgSend(a3, "contents") != v9;
}

- (id)p_cachedImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orLayer:(id)a5
{
  double height;
  double width;
  void *v9;
  uint64_t v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v22;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    if (a5)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill p_cachedImageForSize:inContext:orLayer:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 442, CFSTR("using context to determine requested image size. layer should be nil"));
    }
    if ((TSDCGContextIsPrintContext((uint64_t)a4) & 1) != 0 || TSDCGContextIsPDFContext((uint64_t)a4))
      return -[TSDImageFill p_standardSizeCachedImage](self, "p_standardSizeCachedImage");
    v13 = TSDCGContextAssociatedScreenScale((uint64_t)a4);
    width = TSDMultiplySizeScalar(width, height, v13);
    height = v14;
    CGContextGetCTM(&v22, a4);
    v12 = TSDTransformScale(&v22.a);
    goto LABEL_10;
  }
  if (a5)
  {
    objc_msgSend(a5, "contentsScale");
LABEL_10:
    width = TSDMultiplySizeScalar(width, height, v12);
    height = v15;
  }
  -[TSDImageFill fillSize](self, "fillSize");
  v17 = v16;
  v19 = v18;
  if (width <= TSDMultiplySizeScalar(v16, v18, 0.25) && height <= v20)
    return -[TSDImageFill p_quarterSizeCachedImage](self, "p_quarterSizeCachedImage");
  if (width <= TSDMultiplySizeScalar(v17, v19, 0.5))
    return -[TSDImageFill p_halfSizeCachedImage](self, "p_halfSizeCachedImage");
  return -[TSDImageFill p_standardSizeCachedImage](self, "p_standardSizeCachedImage");
}

- (void)applyToCALayer:(id)a3 withScale:(double)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  double v12;
  CGImageRef v13;
  CGImage *v14;
  double *v15;
  uint64_t v16;
  double x;
  double y;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double width;
  double height;
  void *v42;
  uint64_t v43;
  uint64_t *v44;
  CGImage *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CATransform3D v73;
  CATransform3D v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  if (!-[TSDImageFill canApplyToCALayer](self, "canApplyToCALayer")
    && !-[TSDImageFill canApplyToCALayerByAddingSublayers](self, "canApplyToCALayerByAddingSublayers"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill applyToCALayer:withScale:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 472, CFSTR("Applying image fill with unsupported properties to CALayer"));
  }
  objc_opt_class();
  -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  v9 = (void *)TSUDynamicCast();
  v10 = -[TSDImageFill p_shouldApplyTintedImage](self, "p_shouldApplyTintedImage");
  objc_msgSend(a3, "bounds");
  if (v10)
    v13 = (CGImageRef)objc_msgSend(-[TSDImageFill p_cachedImageForSize:inContext:orLayer:](self, "p_cachedImageForSize:inContext:orLayer:", 0, a3, v11, v12), "newImage");
  else
    v13 = CGImageRetain((CGImageRef)objc_msgSend(v9, "CGImageForSize:inContext:orLayer:", 0, a3, v11, v12));
  v14 = v13;
  v15 = (double *)MEMORY[0x24BDBEFB0];
  if (objc_msgSend(a3, "sublayers"))
    v16 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "indexOfObjectPassingTest:", &__block_literal_global_36);
  else
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  x = *v15;
  y = v15[1];
  switch(self->mTechnique)
  {
    case 0:
      v19 = *MEMORY[0x24BDE5C88];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        v21 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        objc_msgSend(v20, "addSublayer:", v21);
      }
      else
      {
        v20 = (void *)objc_msgSend((id)objc_msgSend(a3, "sublayers"), "objectAtIndex:", v16);
        v21 = (void *)objc_msgSend((id)objc_msgSend(v20, "sublayers"), "lastObject");
      }
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      objc_msgSend(a3, "bounds");
      objc_msgSend(v20, "setPosition:", TSDCenterOfRect(v46, v47, v48, v49));
      objc_msgSend(a3, "bounds");
      objc_msgSend(v20, "setBounds:");
      objc_msgSend(v20, "setMasksToBounds:", 1);
      objc_msgSend(v20, "setEdgeAntialiasingMask:", 1);
      objc_msgSend(v20, "bounds");
      v54 = TSDCenterOfRect(v50, v51, v52, v53);
      v56 = v55;
      -[TSDImageFill fillSize](self, "fillSize");
      v58 = TSDRectWithCenterAndSize(v54, v56, v57);
      v60 = v59;
      v62 = v61;
      v64 = v63;
      objc_msgSend(a3, "contentsScale");
      v66 = TSDRoundedRectForScale(v58, v60, v62, v64, v65 * a4);
      v68 = v67;
      v70 = v69;
      v72 = v71;
      objc_msgSend(v21, "setContents:", v14);
      objc_msgSend(v21, "setPosition:", TSDCenterOfRect(v66, v68, v70, v72));
      objc_msgSend(v21, "setBounds:", TSDRectWithSize());
      objc_msgSend(a3, "contentsScale");
      objc_msgSend(v21, "setContentsScale:");
      height = 1.0;
      CATransform3DMakeScale(&v74, a4, a4, 1.0);
      v73 = v74;
      objc_msgSend(v21, "setTransform:", &v73);
      objc_msgSend(v21, "setDelegate:", objc_msgSend(a3, "delegate"));
      objc_msgSend(v21, "setEdgeAntialiasingMask:", 0);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      v45 = 0;
      width = 1.0;
      goto LABEL_19;
    case 1:
      goto LABEL_15;
    case 3:
      v19 = *MEMORY[0x24BDE5C98];
      -[TSDImageFill fillSize](self, "fillSize");
      v23 = v22;
      v25 = v24;
      objc_msgSend(a3, "bounds");
      v27 = v26;
      v29 = v28;
      v30 = TSDRectWithSize();
      v34 = TSDFitOrFillSizeInRect(1, v23, v25, v30, v31, v32, v33);
      v36 = 1.0 / v35;
      v38 = 1.0 / v37;
      v78.origin.x = -(v34 * v36);
      v78.origin.y = -(v39 * v38);
      v78.size.width = v27 * v36;
      v78.size.height = v29 * v38;
      v75.size.width = 1.0;
      v75.size.height = 1.0;
      v75.origin.x = x;
      v75.origin.y = y;
      v76 = CGRectIntersection(v75, v78);
      x = v76.origin.x;
      y = v76.origin.y;
      width = v76.size.width;
      height = v76.size.height;
      v20 = 0;
      goto LABEL_18;
    case 4:
      v20 = 0;
      v44 = (uint64_t *)MEMORY[0x24BDE5C90];
      goto LABEL_17;
    default:
      v42 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill applyToCALayer:withScale:]");
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 565, CFSTR("bogus fill technique to apply to CALayer"));
LABEL_15:
      v20 = 0;
      v44 = (uint64_t *)MEMORY[0x24BDE5C88];
LABEL_17:
      v19 = *v44;
      height = 1.0;
      width = 1.0;
LABEL_18:
      v45 = v14;
LABEL_19:
      if ((CGImage *)objc_msgSend(a3, "contents") != v45)
        objc_msgSend(a3, "setContents:", v45);
      if (objc_msgSend(a3, "contentsGravity") != v19)
        objc_msgSend(a3, "setContentsGravity:", v19);
      objc_msgSend(a3, "contentsRect");
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      if (!CGRectEqualToRect(v77, v79))
        objc_msgSend(a3, "setContentsRect:", x, y, width, height);
      if (objc_msgSend(a3, "backgroundColor"))
        objc_msgSend(a3, "setBackgroundColor:", 0);
      if (v20 && v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v20, "setName:", CFSTR("TSDImageFillSublayer"));
        objc_msgSend(a3, "addSublayer:", v20);
      }
      else if (!v20 && v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sublayers"), "objectAtIndex:", v16), "removeFromSuperlayer");
      }
      CGImageRelease(v14);
      return;
  }
}

uint64_t __41__TSDImageFill_applyToCALayer_withScale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("TSDImageFillSublayer"));
}

- (CGSize)renderedImageSizeForObjectSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  switch(-[TSDImageFill technique](self, "technique"))
  {
    case 0:
    case 2:
      -[TSDImageFill fillSize](self, "fillSize");
      goto LABEL_4;
    case 1:
      break;
    case 3:
    case 4:
      -[TSDImageFill fillSize](self, "fillSize");
      v6 = TSDFitOrFillSizeInSize(-[TSDImageFill technique](self, "technique") == 3, v8, v9, width, height);
LABEL_4:
      width = v6;
      height = v7;
      break;
    default:
      height = 0.0;
      width = 0.0;
      break;
  }
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  void *v11;
  uint64_t v12;
  CGRect v13;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    Mutable = CGPathCreateMutable();
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    CGPathAddRect(Mutable, 0, v13);
    -[TSDImageFill paintPath:inContext:](self, "paintPath:inContext:", Mutable, a4);
    CGPathRelease(Mutable);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill drawSwatchInRect:inContext:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 621, CFSTR("invalid nil value for '%s'"), "ctx");
  }
}

- (CGSize)p_sizeOfFillImageForDestRect:(CGRect)a3 inContext:(CGContext *)a4
{
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v6 = -[TSDImageFill technique](self, "technique");
  -[TSDImageFill fillSize](self, "fillSize");
  if (v6 != 2)
  {
    -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
    v7 = v9;
    v8 = v10;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double x;
  double y;
  double width;
  double height;
  CGImage *v18;
  CGRect PathBoundingBox;

  if (!a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill p_paintPath:inContext:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 648, CFSTR("invalid nil value for '%s'"), "path");
    if (a4)
      return;
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill p_paintPath:inContext:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 649, CFSTR("invalid nil value for '%s'"), "ctx");
    return;
  }
  v7 = -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  if (v7)
  {
    v8 = v7;
    CGContextSaveGState(a4);
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
    CGContextClip(a4);
    objc_opt_class();
    v9 = (objc_opt_isKindOfClass() & 1) == 0 || TSDCGContextGetBitmapQualityInfo((uint64_t)a4) == 0;
    PathBoundingBox = CGPathGetPathBoundingBox(a3);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    if (-[TSDImageFill tintColor](self, "tintColor") && v9 && (objc_msgSend(v8, "isError") & 1) == 0)
    {
      -[TSDImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
      v18 = (CGImage *)objc_msgSend(-[TSDImageFill p_cachedImageForSize:inContext:orLayer:](self, "p_cachedImageForSize:inContext:orLayer:", a4, 0), "newImage");
      -[TSDImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", v18, 0, a4, x, y, width, height);
      CGImageRelease(v18);
    }
    else
    {
      CGContextSaveGState(a4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[TSDImageFill p_sizeOfFillImageForDestRect:inContext:](self, "p_sizeOfFillImageForDestRect:inContext:", a4, x, y, width, height);
        -[TSDImageFill p_drawBitmapImage:withOrientation:inContext:bounds:](self, "p_drawBitmapImage:withOrientation:inContext:bounds:", objc_msgSend(v8, "CGImageForSize:inContext:orLayer:", a4, 0), objc_msgSend(v8, "orientation"), a4, x, y, width, height);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[TSDImageFill p_drawPDFWithProvider:inContext:bounds:](self, "p_drawPDFWithProvider:inContext:bounds:", v8, a4, x, y, width, height);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4, width, height, x, y, width, height);
            objc_msgSend(v8, "drawImageInContext:rect:", a4);
          }
        }
      }
      CGContextRestoreGState(a4);
      if (!v9)
      {
        if (-[TSDImageFill tintColor](self, "tintColor"))
          -[TSUColor paintRect:inContext:](-[TSDImageFill tintColor](self, "tintColor"), "paintRect:inContext:", a4, x, y, width, height);
      }
    }
    CGContextRestoreGState(a4);
  }
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 forShapeRep:(id)a4 inContext:(CGContext *)a5
{
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  objc_opt_class();
  -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  v9 = TSUDynamicCast();
  if (v9)
  {
    v10 = v9;
    -[TSDImageFill fillSize](self, "fillSize");
    v12 = v11;
    v14 = v13;
    objc_msgSend(a4, "layerFrameInScaledCanvas");
    -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a5, v12, v14, v15, v16, v17, v18);
    objc_msgSend(a3, "cacheProvider:ofSize:", v10, v19, v20);
  }
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v7;
  uint64_t v8;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill paintPath:inContext:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 715, CFSTR("invalid nil value for '%s'"), "path");
  }
  -[TSDImageFill p_paintPath:inContext:](self, "p_paintPath:inContext:", a3, a4);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  void *v9;
  uint64_t v10;

  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 0, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill paintPath:naturalBounds:inContext:isPDF:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 722, CFSTR("invalid nil value for '%s'"), "path");
  }
  -[TSDImageFill p_paintPath:inContext:](self, "p_paintPath:inContext:", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CGImage)p_newTintedImageWithScale:(double)a3
{
  id v5;
  double v7;
  double v8;
  double v9;
  char v10;
  CGContext *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGImage *Image;
  CGRect v20;

  v5 = -[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider");
  if (!-[TSDImageFill tintColor](self, "tintColor") || !v5 || (objc_msgSend(v5, "isError") & 1) != 0)
    return 0;
  objc_msgSend(v5, "naturalSize");
  TSDMultiplySizeScalar(v7, v8, a3);
  v9 = TSDRoundedSize();
  if (objc_msgSend(v5, "imageGamut") == 2)
    v10 = 11;
  else
    v10 = 43;
  v11 = TSDBitmapContextCreate(v10, v9);
  v12 = TSDRectWithSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  CGContextSaveGState(v11);
  objc_msgSend(v5, "drawImageInContext:rect:", v11, v12, v14, v16, v18);
  CGContextRestoreGState(v11);
  CGContextSetFillColorWithColor(v11, (CGColorRef)-[TSUColor CGColor](-[TSDImageFill tintColor](self, "tintColor"), "CGColor"));
  v20.origin.x = v12;
  v20.origin.y = v14;
  v20.size.width = v16;
  v20.size.height = v18;
  CGContextFillRect(v11, v20);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

- (CGImage)p_newStandardSizeImage
{
  return -[TSDImageFill p_newTintedImageWithScale:](self, "p_newTintedImageWithScale:", 1.0);
}

- (id)p_standardSizeCachedImage
{
  id result;
  TSUFlushableCachedImage *mStandardSizeTintedImage;
  void *v5;

  result = -[TSDImageFill tintColor](self, "tintColor");
  if (result)
  {
    mStandardSizeTintedImage = self->mStandardSizeTintedImage;
    if (!mStandardSizeTintedImage)
    {
      objc_sync_enter(self);
      if (!self->mStandardSizeTintedImage)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C70]), "initWithDelegate:createImageSelector:", self, sel_p_newStandardSizeImage);
        __dmb(0xBu);
        self->mStandardSizeTintedImage = (TSUFlushableCachedImage *)v5;
        objc_msgSend(v5, "ownerAutoreleasedAccess");

      }
      objc_sync_exit(self);
      mStandardSizeTintedImage = self->mStandardSizeTintedImage;
    }
    return (id)-[TSUFlushableCachedImage ownerAutoreleasedAccess](mStandardSizeTintedImage, "ownerAutoreleasedAccess");
  }
  return result;
}

- (CGImage)p_newHalfSizeImage
{
  return -[TSDImageFill p_newTintedImageWithScale:](self, "p_newTintedImageWithScale:", 0.5);
}

- (id)p_halfSizeCachedImage
{
  id result;
  TSUFlushableCachedImage *mHalfSizeTintedImage;
  void *v5;

  result = -[TSDImageFill tintColor](self, "tintColor");
  if (result)
  {
    mHalfSizeTintedImage = self->mHalfSizeTintedImage;
    if (!mHalfSizeTintedImage)
    {
      objc_sync_enter(self);
      if (!self->mHalfSizeTintedImage)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C70]), "initWithDelegate:createImageSelector:", self, sel_p_newHalfSizeImage);
        __dmb(0xBu);
        self->mHalfSizeTintedImage = (TSUFlushableCachedImage *)v5;
        objc_msgSend(v5, "ownerAutoreleasedAccess");

      }
      objc_sync_exit(self);
      mHalfSizeTintedImage = self->mHalfSizeTintedImage;
    }
    return (id)-[TSUFlushableCachedImage ownerAutoreleasedAccess](mHalfSizeTintedImage, "ownerAutoreleasedAccess");
  }
  return result;
}

- (CGImage)p_newQuarterSizeImage
{
  return -[TSDImageFill p_newTintedImageWithScale:](self, "p_newTintedImageWithScale:", 0.25);
}

- (id)p_quarterSizeCachedImage
{
  id result;
  TSUFlushableCachedImage *mQuarterSizeTintedImage;
  void *v5;

  result = -[TSDImageFill tintColor](self, "tintColor");
  if (result)
  {
    mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;
    if (!mQuarterSizeTintedImage)
    {
      objc_sync_enter(self);
      if (!self->mQuarterSizeTintedImage)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C70]), "initWithDelegate:createImageSelector:", self, sel_p_newQuarterSizeImage);
        __dmb(0xBu);
        self->mQuarterSizeTintedImage = (TSUFlushableCachedImage *)v5;
        objc_msgSend(v5, "ownerAutoreleasedAccess");

      }
      objc_sync_exit(self);
      mQuarterSizeTintedImage = self->mQuarterSizeTintedImage;
    }
    return (id)-[TSUFlushableCachedImage ownerAutoreleasedAccess](mQuarterSizeTintedImage, "ownerAutoreleasedAccess");
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__TSDImageFill_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDImageFill_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageFill mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageFill.m"), 855, CFSTR("nil object after cast"));
  }
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "isEqual:", objc_msgSend(v2, "imageData")) & 1) != 0)
    v5 = 5;
  else
    v5 = TSDMixingTypeBestFromMixingTypes(5, 1);
  v6 = objc_msgSend(*(id *)(a1 + 40), "technique");
  if (v6 != objc_msgSend(v2, "technique"))
    v5 = TSDMixingTypeBestFromMixingTypes(v5, 2);
  v7 = objc_msgSend(*(id *)(a1 + 40), "tintColor");
  if (v7 == objc_msgSend(v2, "tintColor")
    || objc_msgSend(*(id *)(a1 + 40), "tintColor")
    && objc_msgSend(v2, "tintColor")
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "tintColor"), "isEqual:", objc_msgSend(v2, "tintColor")) & 1) != 0)
  {
    return v5;
  }
  else
  {
    return TSDMixingTypeBestFromMixingTypes(v5, 3);
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSDImageFill_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDImageFill *__49__TSDImageFill_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (objc_msgSend(*(id *)(a1 + 40), "tintColor") || objc_msgSend(v2, "tintColor"))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "tintColor");
    if (!v3)
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
    v4 = objc_msgSend(v2, "tintColor");
    if (!v4)
      v4 = objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
    v5 = objc_msgSend(v3, "blendedColorWithFraction:ofColor:", v4, *(double *)(a1 + 48));
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "fillSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v2, "fillSize");
  v12 = TSDMixSizes(v7, v9, v10, v11, *(double *)(a1 + 48));
  return -[TSDImageFill initWithImageData:technique:tintColor:size:originalImageData:]([TSDImageFill alloc], "initWithImageData:technique:tintColor:size:originalImageData:", objc_msgSend(*(id *)(a1 + 40), "imageData"), objc_msgSend(*(id *)(a1 + 40), "technique"), v5, 0, v12, v13);
}

+ (id)presetKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapImageFill_;
}

- (id)p_validatedImageProvider
{
  if (!self->mHasIndicatedInterestInProvider && self->mImageData)
  {
    self->mHasIndicatedInterestInProvider = 1;
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "addInterestInProviderForData:", self->mImageData);
  }
  return (id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", self->mImageData, 1);
}

- (CGRect)p_drawnRectForImageSize:(CGSize)a3 destRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGAffineTransform v33;
  CGRect v34;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  v13 = -[TSDImageFill technique](self, "technique");
  if ((v13 - 3) < 2)
  {
    v14 = TSDFitOrFillSizeInRect(-[TSDImageFill technique](self, "technique") == 3, v11, v10, x, y, width, height);
LABEL_6:
    x = v14;
    y = v15;
    width = v16;
    height = v17;
    goto LABEL_7;
  }
  if (!v13)
  {
    CGContextGetUserSpaceToDeviceSpaceTransform(&v33, a5);
    v18 = TSDIsTransformAxisAligned(&v33.a);
    v19 = TSDCenterOfRect(x, y, width, height);
    v21 = TSDRectWithCenterAndSize(v19, v20, v11);
    x = v21;
    y = v22;
    width = v23;
    height = v24;
    if (v18)
    {
      CGContextConvertRectToDeviceSpace(a5, *(CGRect *)&v21);
      v25 = TSDRoundedPoint();
      v27 = v26;
      v34.size.width = TSDRoundedSize();
      v34.size.height = v28;
      v34.origin.x = v25;
      v34.origin.y = v27;
      *(CGRect *)&v14 = CGContextConvertRectToUserSpace(a5, v34);
      goto LABEL_6;
    }
  }
LABEL_7:
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)p_drawBitmapImage:(CGImage *)a3 withOrientation:(int64_t)a4 inContext:(CGContext *)a5 bounds:(CGRect)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  double v24;
  CGFloat v25;
  CGContext *v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  NSObject *mTempRenderLock;
  CGImage *v40;
  double MinY;
  CGFloat MaxY;
  CGFloat v43;
  CGFloat v44;
  _QWORD block[6];
  CGAffineTransform transform;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  if (a3)
  {
    height = a6.size.height;
    width = a6.size.width;
    y = a6.origin.y;
    x = a6.origin.x;
    -[TSDImageFill fillSize](self, "fillSize");
    v14 = v13;
    v16 = v15;
    -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a5);
    v43 = v17;
    v44 = v18;
    v20 = v19;
    v22 = v21;
    v23 = -[TSDImageFill technique](self, "technique");
    if (v23 > 4 || v23 == 2)
    {
      if (width > v14 || height > v16)
      {
        CGContextTranslateCTM(a5, v43, v44);
        CGContextScaleCTM(a5, 1.0, -1.0);
        v32 = TSDRectWithSize();
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v48 = 0u;
        v49 = 0u;
        v47 = 0u;
        TSUImageOrientationTransform();
        memset(&transform, 0, sizeof(transform));
        CGContextConcatCTM(a5, &transform);
        mTempRenderLock = self->mTempRenderLock;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __67__TSDImageFill_p_drawBitmapImage_withOrientation_inContext_bounds___block_invoke;
        block[3] = &unk_24D82A6D0;
        block[4] = self;
        block[5] = a3;
        dispatch_sync(mTempRenderLock, block);
        v40 = CGImageRetain(self->mTempRenderCopy);
        v52.origin.x = v32;
        v52.origin.y = v34;
        v52.size.width = v36;
        v52.size.height = v38;
        CGContextDrawTiledImage(a5, v52, v40);
        CGImageRelease(v40);
        return;
      }
      v53.origin.x = v43;
      v53.origin.y = v44;
      v53.size.width = v14;
      v53.size.height = v16;
      MinY = CGRectGetMinY(v53);
      v54.origin.x = v43;
      v54.origin.y = v44;
      v54.size.width = v14;
      v54.size.height = v16;
      MaxY = CGRectGetMaxY(v54);
      CGContextTranslateCTM(a5, 0.0, MinY + MaxY);
      CGContextScaleCTM(a5, 1.0, -1.0);
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      TSUImageOrientationTransform();
      memset(&transform, 0, sizeof(transform));
      CGContextConcatCTM(a5, &transform);
      v26 = a5;
      v27 = v43;
      v28 = v44;
      v29 = v14;
      v30 = v16;
    }
    else
    {
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v24 = CGRectGetMinY(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v25 = CGRectGetMaxY(v51);
      CGContextTranslateCTM(a5, 0.0, v24 + v25);
      CGContextScaleCTM(a5, 1.0, -1.0);
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      TSUImageOrientationTransform();
      memset(&transform, 0, sizeof(transform));
      CGContextConcatCTM(a5, &transform);
      v26 = a5;
      v27 = v43;
      v28 = v44;
      v29 = v20;
      v30 = v22;
    }
    CGContextDrawImage(v26, *(CGRect *)&v27, a3);
  }
}

CGImage *__67__TSDImageFill_p_drawBitmapImage_withOrientation_inContext_bounds___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGImage *result;
  uint64_t v4;

  v2 = *(_QWORD **)(a1 + 32);
  result = (CGImage *)v2[14];
  if (!result || v2[15] != *(_QWORD *)(a1 + 40) || (v4 = v2[16], v4 >= 4))
  {
    CGImageRelease(result);
    result = CGImageCreateCopy(*(CGImageRef *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = result;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    v2 = *(_QWORD **)(a1 + 32);
    v4 = v2[16];
  }
  v2[16] = v4 + 1;
  return result;
}

- (void)p_drawPDFWithProvider:(id)a3 inContext:(CGContext *)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPDFDocument *v11;
  CGPDFPageRef Page;
  CGPDFPage *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MinY;
  CGFloat MaxY;
  unsigned int v28;
  CGSize v29;
  double v30;
  double v31;
  CGContext *v32;
  CGContext *v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGImage *Image;
  CGFloat MinX;
  CGFloat v40;
  double v41;
  double v42;
  CGFloat v43;
  CGRect v44;
  CGAffineTransform transform;
  __n128 v46;
  __int128 v47;
  __int128 v48;
  double v49;
  double v50;
  CGAffineTransform v51;
  CGSize v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (CGPDFDocument *)objc_msgSend(a3, "CGPDFDocument");
  if (v11)
  {
    Page = CGPDFDocumentGetPage(v11, 1uLL);
    if (Page)
    {
      v13 = Page;
      CGContextSaveGState(a4);
      memset(&v51, 0, sizeof(v51));
      v49 = 0.0;
      v50 = 0.0;
      v44.origin.x = TSDComputeBoxTransformAndSizeForPDFPage(v13, (uint64_t)&v51, &v49);
      v44.origin.y = v14;
      v44.size.width = v15;
      v44.size.height = v16;
      -[TSDImageFill fillSize](self, "fillSize");
      v41 = v18;
      v42 = v17;
      -[TSDImageFill p_drawnRectForImageSize:destRect:inContext:](self, "p_drawnRectForImageSize:destRect:inContext:", a4);
      v43 = v19;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      MinY = CGRectGetMinY(v53);
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      MaxY = CGRectGetMaxY(v54);
      CGContextTranslateCTM(a4, 0.0, MinY + MaxY);
      CGContextScaleCTM(a4, 1.0, -1.0);
      v28 = -[TSDImageFill technique](self, "technique");
      if (v28 > 4 || v28 == 2)
      {
        v52.width = 1.0;
        v52.height = 1.0;
        v29 = CGContextConvertSizeToDeviceSpace(a4, v52);
        v30 = TSDMultiplySizeScalar(v42, v41, fmax(fabs(v29.width), fabs(v29.height)));
        v31 = TSDCeilSize(v30);
        v32 = TSDBitmapContextCreate(3, v31);
        if (v32)
        {
          v33 = v32;
          v47 = 0u;
          v48 = 0u;
          v46 = 0u;
          v34 = TSDRectWithSize();
          transform = v51;
          TSDComputeDrawTransformForPDFPage((__n128 *)&transform, &v46, v49, v50, v34, v35, v36, v37);
          *(__n128 *)&transform.a = v46;
          *(_OWORD *)&transform.c = v47;
          *(_OWORD *)&transform.tx = v48;
          CGContextConcatCTM(v33, &transform);
          CGContextClipToRect(v33, v44);
          CGContextDrawPDFPage(v33, v13);
          Image = CGBitmapContextCreateImage(v33);
          CGContextRelease(v33);
          if (Image)
          {
            v55.origin.x = x;
            v55.origin.y = y;
            v55.size.width = width;
            v55.size.height = height;
            MinX = CGRectGetMinX(v55);
            v56.origin.x = x;
            v56.origin.y = y;
            v56.size.width = width;
            v56.size.height = height;
            v40 = CGRectGetMaxY(v56);
            CGContextTranslateCTM(a4, MinX, v40);
            v57.origin.x = TSDRectWithSize();
            CGContextDrawTiledImage(a4, v57, Image);
            CGImageRelease(Image);
          }
        }
      }
      else
      {
        v47 = 0u;
        v48 = 0u;
        transform = v51;
        v46 = 0u;
        TSDComputeDrawTransformForPDFPage((__n128 *)&transform, &v46, v49, v50, v43, v21, v23, v25);
        *(__n128 *)&transform.a = v46;
        *(_OWORD *)&transform.c = v47;
        *(_OWORD *)&transform.tx = v48;
        CGContextConcatCTM(a4, &transform);
        CGContextClipToRect(a4, v44);
        CGContextDrawPDFPage(a4, v13);
      }
      CGContextRestoreGState(a4);
    }
  }
}

- (TSPData)imageData
{
  return self->mImageData;
}

- (TSPData)originalImageData
{
  return self->mOriginalImageData;
}

- (int)technique
{
  return self->mTechnique;
}

- (void)setTechnique:(int)a3
{
  self->mTechnique = a3;
}

- (TSUColor)tintColor
{
  return self->mTintColor;
}

- (BOOL)interpretsUntaggedImageDataAsGeneric
{
  return self->mInterpretsUntaggedImageDataAsGeneric;
}

@end
