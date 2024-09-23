@implementation _UIImageCGImageContent

- (BOOL)isEqual:(id)a3
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v4 = (unint64_t *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = atomic_load((unint64_t *)&self->_imageRef);
    v6 = atomic_load(v4 + 5);
    v10.receiver = self;
    v10.super_class = (Class)_UIImageCGImageContent;
    v7 = -[_UIImageContent isEqual:](&v10, sel_isEqual_, v4);
    if (v5 == v6)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)sizeInPixels
{
  CGImage *v2;
  double Width;
  double Height;
  double v5;
  CGSize result;

  v2 = -[_UIImageCGImageContent CGImage](objc_retainAutorelease(self), "CGImage");
  Width = (double)CGImageGetWidth(v2);
  Height = (double)CGImageGetHeight(v2);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (CGImage)CGImage
{
  return (CGImage *)atomic_load((unint64_t *)&self->_imageRef);
}

- (BOOL)isHDR
{
  CGColorSpace *ColorSpace;

  ColorSpace = CGImageGetColorSpace(-[_UIImageCGImageContent CGImage](objc_retainAutorelease(self), "CGImage"));
  return CGColorSpaceUsesITUR_2100TF(ColorSpace);
}

- (BOOL)isCGImage
{
  return 1;
}

- (unint64_t)hash
{
  return CFHash(-[_UIImageCGImageContent CGImage](objc_retainAutorelease(self), "CGImage"));
}

- (id)renditionApplyingEffect:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGImage *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD aBlock[7];
  objc_super v16;

  if (a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UIImageCGImageContent;
    -[_UIImageContent renditionApplyingEffect:](&v16, sel_renditionApplyingEffect_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIImageContent size](self, "size");
    v6 = v5;
    v8 = v7;
    v9 = -[_UIImageCGImageContent CGImage](objc_retainAutorelease(self), "CGImage");
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke;
    aBlock[3] = &__block_descriptor_56_e20_v16__0__CGContext__8l;
    aBlock[4] = v6;
    aBlock[5] = v8;
    aBlock[6] = v9;
    v11 = _Block_copy(aBlock);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke_2;
    v14[3] = &__block_descriptor_40_e15___CGImage__8__0l;
    v14[4] = v9;
    +[_UIImageContentRenditionResult resultWithDrawingProvider:CGImageProvider:rbSymbolConfigurationProvider:]((uint64_t)_UIImageContentRenditionResult, v11, v14, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)hasCGImage
{
  return 1;
}

- (id)imageRendererFormat
{
  void *v3;
  _UIImageCGImageContent *v4;
  CGImage *v5;
  CGColorSpace *ColorSpace;
  void *v7;
  uint64_t v8;

  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(self);
  v5 = -[_UIImageCGImageContent CGImage](v4, "CGImage");
  ColorSpace = CGImageGetColorSpace(v5);
  if ((CGImageGetBitmapInfo(v5) & 0x100) != 0)
  {
    v7 = v3;
    v8 = 1;
LABEL_10:
    objc_msgSend(v7, "setPreferredRange:", v8);
    goto LABEL_11;
  }
  if (-[_UIImageCGImageContent isHDR](v4, "isHDR"))
  {
    if (CGColorSpaceIsHLGBased(ColorSpace))
    {
      v7 = v3;
      v8 = 101;
    }
    else
    {
      v7 = v3;
      v8 = 100;
    }
    goto LABEL_10;
  }
  if (!CGColorSpaceSupportsOutput(ColorSpace))
  {
    v7 = v3;
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "_setOverrideColorSpace:", ColorSpace);
  objc_msgSend(v3, "_setOverrideBitsPerComponent:", CGImageGetBitsPerComponent(v5));
LABEL_11:
  objc_msgSend(v3, "setOpaque:", CGImageHasAlpha() ^ 1);
  -[_UIImageContent scale](v4, "scale");
  objc_msgSend(v3, "setScale:");
  return v3;
}

- (_UIImageCGImageContent)initWithCGImageSource:(CGImageSource *)a3 CGImage:(CGImage *)a4 scale:(double)a5
{
  CFTypeID v10;
  id v11;
  void *v13;
  void *v14;
  objc_super v15;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 688, CFSTR("Need an imageRef"));

  }
  v10 = CFGetTypeID(a4);
  if (v10 != CGImageGetTypeID())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 689, CFSTR("imageRef passed is not a CGImageRef"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_UIImageCGImageContent;
  v11 = -[_UIImageContent initWithScale:](&v15, sel_initWithScale_, a5);
  if (v11)
  {
    atomic_store((unint64_t)CGImageRetain(a4), (unint64_t *)v11 + 5);
    objc_msgSend(v11, "_setCGImageSource:", a3);
  }
  return (_UIImageCGImageContent *)v11;
}

- (_UIImageCGImageContent)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  return -[_UIImageCGImageContent initWithCGImageSource:CGImage:scale:](self, "initWithCGImageSource:CGImage:scale:", CGImageGetImageSource(), a3, a4);
}

- (void)dealloc
{
  CGImage *v3;
  objc_super v4;

  v3 = (CGImage *)atomic_load((unint64_t *)&self->_imageRef);
  CGImageRelease(v3);
  v4.receiver = self;
  v4.super_class = (Class)_UIImageCGImageContent;
  -[_UIImageCGImageContent dealloc](&v4, sel_dealloc);
}

- (_UIImageCGImageContent)initWithCGImageSource:(CGImageSource *)a3 scale:(double)a4
{
  CGImageRef ImageAtIndex;
  CGImage *v8;
  _UIImageCGImageContent *v9;
  _UIImageCGImageContent *v10;

  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    v8 = ImageAtIndex;
    v9 = -[_UIImageCGImageContent initWithCGImageSource:CGImage:scale:](self, "initWithCGImageSource:CGImage:scale:", a3, ImageAtIndex, a4);
    CGImageRelease(v8);
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = atomic_load((unint64_t *)&self->_imageRef);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p CGImageRef:%p>"), v4, self, v5);
}

- (_UIImageCGImageContent)contentWithCGImage:(CGImage *)a3
{
  _UIImageCGImageContent *v5;

  v5 = [_UIImageCGImageContent alloc];
  -[_UIImageContent scale](self, "scale");
  return -[_UIImageCGImageContent initWithCGImage:scale:](v5, "initWithCGImage:scale:", a3);
}

- (id)contentPreparedForDisplay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _UIImageCGImageContent *v9;
  _UIImageCGImageContent *v10;
  void *v11;

  -[_UIImageContent _existingPreparedContentForDisplay](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[_UIImageCGImageContent _activeDecompressorCreatingIfNecessary](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      goto LABEL_6;
    v7 = objc_msgSend(v5, "waitForImageRef");
    if (!v7
      || (v8 = v7,
          v9 = [_UIImageCGImageContent alloc],
          -[_UIImageContent scale](self, "scale"),
          v10 = -[_UIImageCGImageContent initWithCGImage:scale:](v9, "initWithCGImage:scale:", v8),
          -[_UIImageCGImageContent _contentWithCARenderRef](v10),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
LABEL_6:
      -[_UIImageCGImageContent _contentWithCARenderRef](self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[_UIImageContent _cachePreparedContent:forDisplayOfContent:]((uint64_t)_UIImageCGImageContent, v11, self);
    objc_setAssociatedObject(self, CFSTR("com.apple.UIKit.active-decompressor"), 0, (void *)0x301);
    v4 = v11;

  }
  return v4;
}

- (id)_activeDecompressorCreatingIfNecessary
{
  id v1;
  void *v2;
  _UINewCGImageDecompressor *v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    objc_getAssociatedObject(v1, CFSTR("com.apple.UIKit.active-decompressor"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v3 = [_UINewCGImageDecompressor alloc];
      v4 = objc_retainAutorelease(v1);
      v5 = objc_msgSend(v4, "CGImage");
      objc_opt_self();
      _UIImageDecompressionCompletionQueue();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = -[_UINewCGImageDecompressor initWithSourceImage:completionQueue:](v3, v5, v6);

      objc_setAssociatedObject(v4, CFSTR("com.apple.UIKit.active-decompressor"), v2, (void *)1);
    }
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_QWORD)_contentWithCARenderRef
{
  id v1;
  void *v2;
  uint64_t v3;
  _UIImagePreparedCGImageContent *v4;
  double v5;
  double v6;
  _QWORD *v7;
  void *v9;
  objc_super v10;

  if (a1
    && ((v1 = objc_retainAutorelease(a1),
         v2 = (void *)objc_msgSend(v1, "CGImage"),
         !objc_msgSend(MEMORY[0x1E0DE7910], "instancesRespondToSelector:", sel_CA_copyRenderValueWithColorspace_))? (v3 = objc_msgSend(v2, "CA_copyRenderValue")): (v3 = objc_msgSend(v2, "CA_copyRenderValueWithColorspace:", CGImageGetColorSpace((CGImageRef)v2))), v3))
  {
    v4 = [_UIImagePreparedCGImageContent alloc];
    objc_msgSend(v1, "scale");
    if (v4)
    {
      v6 = v5;
      if (!v2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithCARenderRef_CGImage_scale_, v4, CFSTR("_UIImageContent.m"), 655, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalImageRef != NULL"));

      }
      v10.receiver = v4;
      v10.super_class = (Class)_UIImagePreparedCGImageContent;
      v7 = objc_msgSendSuper2(&v10, sel_initWithCGImage_scale_, v2, v6);
      if (v7)
        v7[6] = CARenderRetain();
    }
    else
    {
      v7 = 0;
    }
    CARenderRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)prepareContentForDisplayWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD aBlock[5];
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v4 = a3;
  -[_UIImageContent _existingPreparedContentForDisplay](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_self();
    _UIImageDecompressionCompletionQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke;
    block[3] = &unk_1E16B2F48;
    v21 = v4;
    v20 = v5;
    dispatch_async(v6, block);

    v7 = v21;
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_2;
    aBlock[3] = &unk_1E16B1D18;
    aBlock[4] = self;
    v9 = v4;
    v18 = v9;
    v10 = _Block_copy(aBlock);
    -[_UIImageCGImageContent _activeDecompressorCreatingIfNecessary](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_4;
      v14[3] = &unk_1E16C4E40;
      v14[4] = self;
      v15 = v9;
      v16 = v10;
      -[_UINewCGImageDecompressor decompressAsync:]((uint64_t)v11, v14);

    }
    else
    {
      AsyncFallbackPreparationQueue();
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v12, v10);

    }
    v7 = v18;
  }

  return 1;
}

- (id)typeName
{
  return CFSTR("CGImage");
}

- (double)imageMaximumHeadroom
{
  CGImage *v2;
  CGColorSpace *ColorSpace;
  _BOOL4 v4;
  double result;
  CGColorSpace *v6;
  _BOOL4 IsHLGBased;

  v2 = -[_UIImageCGImageContent CGImage](objc_retainAutorelease(self), "CGImage");
  ColorSpace = CGImageGetColorSpace(v2);
  v4 = CGColorSpaceUsesITUR_2100TF(ColorSpace);
  result = 1.0;
  if (v4)
  {
    if (CGImageGetHeadroom())
    {
      return 0.0;
    }
    else
    {
      v6 = CGImageGetColorSpace(v2);
      IsHLGBased = CGColorSpaceIsHLGBased(v6);
      result = 8.0;
      if (IsHLGBased)
        return 5.0;
    }
  }
  return result;
}

- (id)makeSDRVersion
{
  _UIImageCGImageContent *v3;
  CGImage *v4;
  _UIImageCGImageContent *v5;
  CGImageSource *v6;
  const __CFDictionary *v7;
  CGImage *ImageAtIndex;
  CGColorSpace *ColorSpace;
  CGColorSpace *v11;
  unint64_t Width;
  unint64_t Height;
  uint32_t v14;
  CGContext *v15;
  _UIImageCGImageContent *v16;
  _UIImageCGImageContent *v17;
  uint64_t v18;
  _QWORD v19[2];
  CGRect v20;

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!-[_UIImageCGImageContent isHDR](self, "isHDR"))
    return self;
  v3 = objc_retainAutorelease(self);
  v4 = -[_UIImageCGImageContent CGImage](v3, "CGImage");
  v5 = objc_retainAutorelease(v3);
  v6 = -[_UIImageContent CGImageSource](v5, "CGImageSource");
  if (!v6)
    goto LABEL_7;
  v18 = *MEMORY[0x1E0CBD1A0];
  v19[0] = *MEMORY[0x1E0CBD1B8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, v7);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
  {
    CFRelease(ImageAtIndex);

LABEL_7:
    v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    Width = CGImageGetWidth(v4);
    Height = CGImageGetHeight(v4);
    if (CGImageHasAlpha())
      v14 = 4353;
    else
      v14 = 4357;
    v15 = CGBitmapContextCreate(0, Width, Height, 0x10uLL, 0, v11, v14);
    CGColorSpaceRelease(v11);
    CGContextSetBlendMode(v15, kCGBlendModeCopy);
    v20.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v20.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v20.size.width = (double)Width;
    v20.size.height = (double)Height;
    CGContextDrawImage(v15, v20, v4);
    ImageAtIndex = CGBitmapContextCreateImage(v15);
    CGContextRelease(v15);
    goto LABEL_11;
  }

  if (!ImageAtIndex)
    goto LABEL_7;
LABEL_11:
  v16 = [_UIImageCGImageContent alloc];
  -[_UIImageContent scale](v5, "scale");
  v17 = -[_UIImageCGImageContent initWithCGImageSource:CGImage:scale:](v16, "initWithCGImageSource:CGImage:scale:", v6, ImageAtIndex);
  CFRelease(ImageAtIndex);
  return v17;
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v7;
  double v8;
  void *v10;
  UIGraphicsImageRenderer *v11;
  id v12;
  CGImage *v13;
  const void *v15;
  CFTypeRef v16;
  _QWORD v17[7];

  height = a3.height;
  width = a3.width;
  -[_UIImageContent size](self, "size", a3.width, a3.height, a4);
  if (width == v8 && height == v7)
  {
    v15 = (const void *)atomic_load((unint64_t *)&self->_imageRef);
    v16 = CFRetain(v15);
    return (CGImage *)CFAutorelease(v16);
  }
  else if (width <= 0.0 || height <= 0.0)
  {
    return 0;
  }
  else
  {
    -[_UIImageCGImageContent imageRendererFormat](self, "imageRendererFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v10, width, height);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56___UIImageCGImageContent__provideCGImageWithSize_scale___block_invoke;
    v17[3] = &unk_1E16C4E18;
    *(double *)&v17[5] = width;
    *(double *)&v17[6] = height;
    v17[4] = self;
    -[UIGraphicsImageRenderer imageWithActions:](v11, "imageWithActions:", v17);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (CGImage *)objc_msgSend(v12, "CGImage");

    return v13;
  }
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  CGImage *v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11 = -[_UIImageCGImageContent CGImage](objc_retainAutorelease(self), "CGImage");
  v12.origin.x = v9;
  v12.origin.y = v10;
  v12.size.width = width;
  v12.size.height = height;
  CGContextDrawImage(a5, v12, v11);
}

- (id)contentOptimizedForImageSize:(CGSize)a3
{
  double height;
  double width;
  _UIImageCGImageContent *v5;
  _UIImageCGImageContent *v6;
  CGImageSource *v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  CGImage *Thumb;
  _UIImageCGImageContent *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  height = a3.height;
  width = a3.width;
  v20[4] = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(self);
  -[_UIImageCGImageContent CGImage](v5, "CGImage");
  v6 = objc_retainAutorelease(v5);
  v7 = -[_UIImageContent CGImageSource](v6, "CGImageSource");
  -[_UIImageContent scale](v6, "scale");
  v9 = v8;
  -[_UIImageCGImageContent sizeInPixels](v6, "sizeInPixels");
  v10 = width * v9;
  if (width * v9 < height * v9)
    v10 = height * v9;
  v11 = vcvtpd_u64_f64(v10);
  if (!v7)
  {
    Thumb = (CGImage *)CGImageCreateThumb();
    if (Thumb)
      goto LABEL_5;
LABEL_7:
    v17 = 0;
    return v17;
  }
  v12 = *MEMORY[0x1E0CBD178];
  v19[0] = *MEMORY[0x1E0CBD180];
  v19[1] = v12;
  v20[0] = MEMORY[0x1E0C9AAB0];
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = *MEMORY[0x1E0CBD2A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = *MEMORY[0x1E0CBD190];
  v20[2] = v13;
  v20[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (const __CFDictionary *)objc_msgSend(v14, "mutableCopy");

  Thumb = CGImageSourceCreateThumbnailAtIndex(v7, 0, v15);
  if (!Thumb)
    goto LABEL_7;
LABEL_5:
  v17 = -[_UIImageCGImageContent initWithCGImage:scale:]([_UIImageCGImageContent alloc], "initWithCGImage:scale:", Thumb, v9);
  CGImageRelease(Thumb);
  return v17;
}

- (BOOL)optimizeContentForImageSize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  NSObject *v9;
  id v10;
  void *v12;
  _QWORD block[5];
  id v14;
  CGFloat v15;
  CGFloat v16;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1067, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != NULL"));

  }
  AsyncFallbackPreparationQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___UIImageCGImageContent_optimizeContentForImageSize_completionHandler___block_invoke;
  block[3] = &unk_1E16C4158;
  block[4] = self;
  v14 = v8;
  v15 = width;
  v16 = height;
  v10 = v8;
  dispatch_async(v9, block);

  return 1;
}

@end
