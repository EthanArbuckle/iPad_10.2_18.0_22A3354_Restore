@implementation UIImage(PhotosUICore)

+ (id)px_systemImageNamed:()PhotosUICore
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("PX")))
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v3);
  else
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)px_isLargerThan:()PhotosUICore
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "px_pixelSize");
    objc_msgSend(v4, "px_pixelSize");

    JUMPOUT(0x1A85CD5B8);
  }
  return 1;
}

- (id)px_imageByApplyingAlpha:()PhotosUICore
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id v10;
  CGSize v12;

  if (a2 >= 1.0)
  {
    v10 = a1;
  }
  else
  {
    objc_msgSend(a1, "size");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "scale");
    v9 = v8;
    v12.width = v5;
    v12.height = v7;
    UIGraphicsBeginImageContextWithOptions(v12, 0, v9);
    objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a2);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v10;
}

- (id)px_imageByCroppingRect:()PhotosUICore pixelTargetSize:cornerRadius:
{
  CGImage *v15;
  size_t Width;
  size_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v19;
  id v20;
  const CGPath *v21;
  CGImage *Image;
  void *v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v15 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  Width = CGImageGetWidth(v15);
  Height = CGImageGetHeight(v15);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v19 = CGBitmapContextCreate(0, (unint64_t)a6, (unint64_t)a7, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = a6;
  v25.size.height = a7;
  CGContextClipToRect(v19, v25);
  if (a8 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a6, a7, a8);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const CGPath *)objc_msgSend(v20, "CGPath");

    CGContextAddPath(v19, v21);
    CGContextClip(v19);
  }
  CGContextScaleCTM(v19, a6 / a4, a7 / a5);
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = a4;
  v26.size.height = a5;
  v27.origin.y = -((double)Height - CGRectGetMaxY(v26));
  v27.origin.x = -a2;
  v27.size.width = (double)Width;
  v27.size.height = (double)Height;
  CGContextDrawImage(v19, v27, v15);
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  return v23;
}

- (uint64_t)px_drawInRect:()PhotosUICore withContentMode:
{
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  objc_msgSend(a1, "size");
  if (a3)
  {
    if (a3 == 1)
    {
      PXRectWithAspectRatioFittingRect();
    }
    else
    {
      if (a3 != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImage+PhotosUICore.m"), 186, CFSTR("support for content mode %i not implemented"), a3);

        return objc_msgSend(a1, "drawInRect:", a4, a5, a6, a7);
      }
      PXRectWithAspectRatioFillingRect();
    }
    a4 = v14;
    a5 = v15;
    a6 = v16;
    a7 = v17;
  }
  return objc_msgSend(a1, "drawInRect:", a4, a5, a6, a7);
}

- (PXImageExtraction)px_extractPlayOverlayBackgroundImageFromLocation:()PhotosUICore inViewportWithSize:contentMode:contentsRect:asynchronously:handler:
{
  id v17;
  PXImageExtraction *v18;
  PXImageExtraction *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PXImageExtraction *v24;
  void *v26;
  _QWORD aBlock[4];
  PXImageExtraction *v28;
  uint64_t v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  char v36;

  v17 = a5;
  if (v17)
  {
    if (!a4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImage+PhotosUICore.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    if (!a4)
      goto LABEL_5;
  }
  if (px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken != -1)
    dispatch_once(&px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken, &__block_literal_global_13_194987);
LABEL_5:
  v18 = objc_alloc_init(PXImageExtraction);
  if (px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken_16 != -1)
    dispatch_once(&px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken_16, &__block_literal_global_17_194988);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_3;
  aBlock[3] = &unk_1E51343A0;
  v19 = v18;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v34 = a9;
  v28 = v19;
  v29 = a1;
  v35 = a3;
  v36 = a4;
  v20 = v17;
  v30 = v20;
  v21 = _Block_copy(aBlock);
  v22 = v21;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, uint64_t, PXImageExtraction *))v20 + 2))(v20, v23, 1, v19);
    dispatch_async((dispatch_queue_t)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___extractionQueue, v22);

  }
  else
  {
    (*((void (**)(void *))v21 + 2))(v21);
  }
  v24 = v19;

  return v24;
}

- (id)px_ASTCCompressedImageWithBlockSize:()PhotosUICore
{
  id v4;
  CGImage *v5;
  __CFData *v6;
  CGImageDestinationRef v7;
  CGImageDestination *v8;
  BOOL v9;
  CGImageSource *v10;
  CGImage *ImageAtIndex;
  void *v12;
  double v13;
  void *v14;
  _QWORD block[4];
  int v17;

  v4 = objc_retainAutorelease(a1);
  v5 = (CGImage *)objc_msgSend(v4, "CGImage");
  if (PXCreateASTCCompressImage_onceToken != -1)
    dispatch_once(&PXCreateASTCCompressImage_onceToken, &__block_literal_global_91_194978);
  if (!PXCreateASTCCompressImage_deviceSupportsASTC)
    goto LABEL_11;
  v6 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = CGImageDestinationCreateWithData(v6, CFSTR("org.khronos.ktx"), 1uLL, 0);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PXCreateASTCCompressImage_block_invoke_2;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v17 = a3;
  if (PXCreateASTCCompressImage_onceToken_97 != -1)
    dispatch_once(&PXCreateASTCCompressImage_onceToken_97, block);
  CGImageDestinationAddImage(v8, v5, (CFDictionaryRef)PXCreateASTCCompressImage_properties);
  v9 = CGImageDestinationFinalize(v8);
  CFRelease(v8);
  if (!v9)
  {
LABEL_10:

    goto LABEL_11;
  }
  v10 = CGImageSourceCreateWithData(v6, 0);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);
  CFRelease(v10);

  if (!ImageAtIndex)
  {
LABEL_11:
    v14 = 0;
    return v14;
  }
  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v4, "scale");
  objc_msgSend(v12, "imageWithCGImage:scale:orientation:", ImageAtIndex, objc_msgSend(v4, "imageOrientation"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(ImageAtIndex);
  return v14;
}

- (uint64_t)px_debugImageWithStrokeRect:()PhotosUICore color:
{
  return objc_msgSend(a1, "px_debugImageWithStrokeRect:color:text:", a3, 0);
}

- (id)px_debugImageWithStrokeRect:()PhotosUICore color:text:
{
  id v14;
  id v15;
  CGContext *CurrentContext;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[3];
  CGSize v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29[2] = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = a8;
  objc_msgSend(a1, "size");
  UIGraphicsBeginImageContext(v30);
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v14, "setStroke");
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = a4;
  v31.size.height = a5;
  CGContextStrokeRectWithWidth(CurrentContext, v31, 5.0);
  if (objc_msgSend(v15, "length"))
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    v28[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 40.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = *MEMORY[0x1E0DC1140];
    v29[0] = v18;
    v29[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v15, v19);

    objc_msgSend(v20, "size");
    v22 = v21;
    v24 = v23;
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = a4;
    v32.size.height = a5;
    v25 = CGRectGetMinX(v32) + 6.0;
    v33.origin.x = a2;
    v33.origin.y = a3;
    v33.size.width = a4;
    v33.size.height = a5;
    objc_msgSend(v20, "drawInRect:", v25, CGRectGetMaxY(v33) - v24 + -6.0, v22, v24);

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v26;
}

+ (uint64_t)px_imageNamed:()PhotosUICore
{
  return objc_msgSend(a1, "px_imageNamed:withConfiguration:", a3, 0);
}

+ (id)px_imageNamed:()PhotosUICore withConfiguration:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "px_bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "px_imageNamed:configuration:bundle:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)px_playOverlayImage:()PhotosUICore
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD block[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t v13;

  v12 = v3;
  v13 = v4;
  switch(a3)
  {
    case 0:
      if (px_playOverlayImage__onceToken != -1)
        dispatch_once(&px_playOverlayImage__onceToken, &__block_literal_global_20_194995);
      v5 = &px_playOverlayImage__overlayGlyphMask;
      goto LABEL_31;
    case 1:
      if (px_playOverlayImage__onceToken_23 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_23, &__block_literal_global_24_194996);
      v5 = &px_playOverlayImage__overlayBackgroundMask;
      goto LABEL_31;
    case 2:
      if (px_playOverlayImage__onceToken_27 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_27, &__block_literal_global_28_194997);
      v5 = &px_playOverlayImage__approximationImage;
      goto LABEL_31;
    case 3:
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_4;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = a1;
      if (px_playOverlayImage__onceToken_31 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_31, v11);
      v5 = &px_playOverlayImage__normalButtonImage;
      goto LABEL_31;
    case 4:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_5;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (px_playOverlayImage__onceToken_32 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_32, block);
      v5 = &px_playOverlayImage__highlightedButtonImage;
      goto LABEL_31;
    case 5:
      if (px_playOverlayImage__onceToken_34 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_34, &__block_literal_global_35_194998);
      v5 = &px_playOverlayImage__overlayGlyphMask_33;
      goto LABEL_31;
    case 6:
      if (px_playOverlayImage__onceToken_39 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_39, &__block_literal_global_40_194999);
      v5 = &px_playOverlayImage__approximationImage_38;
      goto LABEL_31;
    case 7:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_8;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = a1;
      if (px_playOverlayImage__onceToken_44 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_44, v9);
      v5 = &px_playOverlayImage__normalButtonImage_43;
      goto LABEL_31;
    case 8:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_9;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      if (px_playOverlayImage__onceToken_46 != -1)
        dispatch_once(&px_playOverlayImage__onceToken_46, v8);
      v5 = &px_playOverlayImage__highlightedButtonImage_45;
LABEL_31:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (uint64_t)_px_createOverlayImageWithGlyphStyle:()PhotosUICore backgroundWhite:backgroundAlpha:glyphAlpha:
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  uint64_t v17;
  CGSize v19;
  CGRect v20;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v10, "size");
  width = v19.width;
  height = v19.height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a1, a2);
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = width;
  v20.size.height = height;
  CGContextFillRect(CurrentContext, v20);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
  objc_msgSend(v11, "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
  objc_msgSend(v11, "drawAtPoint:blendMode:alpha:", 0, v12, v13, a3);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

+ (id)px_roundedCornerMaskImage:()PhotosUICore size:
{
  BOOL v12;
  BOOL v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  CGSize v22;

  v12 = a1 == *(float *)off_1E50B8248
     && a2 == *((float *)off_1E50B8248 + 1)
     && a3 == *((float *)off_1E50B8248 + 2)
     && a4 == *((float *)off_1E50B8248 + 3);
  if (v12 || (a5 == *MEMORY[0x1E0C9D820] ? (v15 = a6 == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v15 = 0), v15))
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;
    v22.width = a5;
    v22.height = a6;
    UIGraphicsBeginImageContextWithOptions(v22, 0, v18);

    objc_msgSend(MEMORY[0x1E0DC3508], "px_bezierPathWithRoundedRect:topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:", 0.0, 0.0, a5, a6, a1, a2, a3, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fill");
    UIGraphicsGetImageFromCurrentImageContext();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v20;
}

@end
