@implementation UIImage(SBFImageSizing)

- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:
{
  return objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:canUseIOSurface:", 1);
}

- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:preservingAspectRatio:
{
  return objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", a3, 1);
}

- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:canUseIOSurface:
{
  return objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", 1, a3);
}

- (id)sbf_cropImageWithRect:()SBFImageSizing outputSize:preservingAspectRatio:canUseIOSurface:
{
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _BOOL4 v23;
  _BOOL4 v24;
  id v25;
  CGFloat v27;
  double v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v33;
  void *v34;
  id v35;
  const __CFAllocator *v36;
  int IOSurfaceBackedCVPixelBufferWithAttributes;
  void *v38;
  CFDictionaryRef DictionaryRepresentation;
  OSStatus v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  CGImage *v45;
  CGImage *v46;
  void *v47;
  uint64_t v48;
  CGFloat d;
  uint64_t v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef texture;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v19 = *MEMORY[0x1E0C9D538];
  v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(a1, "size");
  v62.size.width = v21;
  v62.size.height = v22;
  v55.origin.x = a2;
  v55.origin.y = a3;
  v55.size.width = a4;
  v55.size.height = a5;
  v62.origin.x = v19;
  v62.origin.y = v20;
  v23 = CGRectEqualToRect(v55, v62);
  v24 = a5 != a7 || a4 != a6;
  v56.origin.x = a2;
  v56.origin.y = a3;
  v56.size.width = a4;
  v56.size.height = a5;
  if (CGRectIsEmpty(v56)
    || v23 && !v24
    || (BSFloatLessThanOrEqualToFloat() & 1) != 0
    || BSFloatLessThanOrEqualToFloat())
  {
    v25 = a1;
    return v25;
  }
  objc_msgSend(a1, "scale");
  v28 = v27;
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeScale(&v52, v27, v27);
  v51 = v52;
  v57.origin.x = a2;
  v57.origin.y = a3;
  v57.size.width = a4;
  v57.size.height = a5;
  v58 = CGRectApplyAffineTransform(v57, &v51);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  if (!a10)
  {
LABEL_36:
    SBLogCommon();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v51.a) = 0;
      _os_log_impl(&dword_18AB69000, v42, OS_LOG_TYPE_DEFAULT, "Falling back to cropping/resizing on CPU", (uint8_t *)&v51, 2u);
    }

    objc_msgSend(a1, "sbf_CGImageBackedImage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v23)
    {
      v25 = 0;
      v45 = 0;
      if (!v24)
        goto LABEL_46;
    }
    else
    {
      v46 = (CGImage *)objc_msgSend(objc_retainAutorelease(v43), "CGImage");
      v61.origin.x = x;
      v61.origin.y = y;
      v61.size.width = width;
      v61.size.height = height;
      v45 = CGImageCreateWithImageInRect(v46, v61);
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v45, 0, v28);
      if (!v24)
        goto LABEL_46;
    }
    if (v25)
      v47 = v25;
    else
      v47 = v44;
    objc_msgSend(v47, "sbf_resizeImageToSize:preservingAspectRatio:", a9, a6, a7, *(_QWORD *)&d);
    v48 = objc_claimAutoreleasedReturnValue();

    v25 = (id)v48;
LABEL_46:
    if (v45)
      CGImageRelease(v45);

    return v25;
  }
  v50 = 0;
  SBFCreateIOSurfaceForImage(a1, &v50, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
    goto LABEL_32;
  d = v52.d;
  v35 = v33;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  if (CGRectIsEmpty(v59) || (BSFloatLessThanOrEqualToFloat() & 1) != 0 || (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    v25 = 0;
LABEL_16:

    goto LABEL_33;
  }
  v51.a = 0.0;
  pixelTransferSessionOut = 0;
  texture = 0;
  v36 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  IOSurfaceBackedCVPixelBufferWithAttributes = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (IOSurfaceRef)v35, 0, (CVPixelBufferRef *)&v51);
  v38 = 0;
  if (!IOSurfaceBackedCVPixelBufferWithAttributes)
  {
    if (*(_QWORD *)&v51.a)
    {
      IOSurfaceBackedCVPixelBufferWithAttributes = VTPixelTransferSessionCreate(v36, &pixelTransferSessionOut);
      v38 = 0;
      if (!IOSurfaceBackedCVPixelBufferWithAttributes)
      {
        if (pixelTransferSessionOut)
        {
          v60.origin.x = x;
          v60.origin.y = y;
          v60.size.width = width;
          v60.size.height = height;
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v60);
          IOSurfaceBackedCVPixelBufferWithAttributes = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
          CFRelease(DictionaryRepresentation);
          if (IOSurfaceBackedCVPixelBufferWithAttributes)
          {
LABEL_24:
            v38 = 0;
            goto LABEL_25;
          }
          v40 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED7B0], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
          if (v40)
          {
            IOSurfaceBackedCVPixelBufferWithAttributes = v40;
            goto LABEL_24;
          }
          IOSurfaceGetPixelFormat((IOSurfaceRef)v35);
          IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
          v38 = 0;
          if (!IOSurfaceBackedCVPixelBufferWithAttributes && texture)
          {
            IOSurfaceBackedCVPixelBufferWithAttributes = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, *(CVPixelBufferRef *)&v51.a, texture);
            if (IOSurfaceBackedCVPixelBufferWithAttributes)
              goto LABEL_24;
            CVPixelBufferGetIOSurface(texture);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
LABEL_25:
  CVPixelBufferRelease(*(CVPixelBufferRef *)&v51.a);
  CVPixelBufferRelease(texture);
  if (pixelTransferSessionOut)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
  }
  if (IOSurfaceBackedCVPixelBufferWithAttributes)
    v41 = 0;
  else
    v41 = v38;

  if (v41)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "sbf_imageWithIOSurface:scale:orientation:", v41, 0, v28);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v35 = v41;
    goto LABEL_16;
  }
LABEL_32:
  v25 = 0;
LABEL_33:
  if (v50)
    CGImageBlockSetRelease();

  if (!v25)
    goto LABEL_36;
  return v25;
}

- (uint64_t)sbf_scaleImage:()SBFImageSizing
{
  return objc_msgSend(a1, "sbf_scaleImage:canUseIOSurface:", 1);
}

- (id)sbf_scaleImage:()SBFImageSizing canUseIOSurface:
{
  id v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v19;

  if (fabs(a2 + -1.0) >= 2.22044605e-16)
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(a1, "size");
    v11 = v10;
    v13 = v12;
    objc_msgSend(a1, "size");
    v15 = v14;
    v17 = v16;
    CGAffineTransformMakeScale(&v19, a2, a2);
    objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:canUseIOSurface:", a4, v8, v9, v11, v13, v17 * v19.c + v19.a * v15, v17 * v19.d + v19.b * v15);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (id)sbf_resizeImageToSize:()SBFImageSizing preservingAspectRatio:
{
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  id v15;

  objc_msgSend(a1, "size");
  if (v9 == a2 && v10 == a3)
  {
    v15 = a1;
  }
  else
  {
    if (a5)
    {
      v12 = v9;
      v13 = v10;
      v14 = v9 / v10;
      if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        if (v12 >= v13)
          a3 = floor(a2 * v14);
        else
          a2 = floor(a3 * v14);
      }
    }
    objc_msgSend(a1, "sbf_resizeImageToSize:", a2, a3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (id)sbf_resizeImageToSize:()SBFImageSizing
{
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGImage *v20;
  int v21;
  int v22;
  size_t BitsPerComponent;
  uint32_t v24;
  CGColorSpace *v25;
  CGColorSpace *v26;
  id v27;
  CGColorSpace *ColorSpace;
  CGColorSpace *v29;
  CFStringRef *v30;
  size_t v31;
  size_t v32;
  size_t NumberOfComponents;
  CGContext *v34;
  CGImage *Image;
  CGRect v37;
  CGRect v38;

  objc_msgSend(a1, "size");
  if (v7 != a2 || v6 != a3)
  {
    objc_msgSend(a1, "scale");
    v10 = v9;
    UIRectIntegralWithScale();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = objc_retainAutorelease(a1);
    v20 = (CGImage *)objc_msgSend(v19, "CGImage");
    v21 = MGGetBoolAnswer();
    v22 = v21;
    if (!v20 || (v21 & 1) != 0)
    {
      if (v21)
        BitsPerComponent = 16;
      else
        BitsPerComponent = 8;
      if (v21)
        v24 = 4353;
      else
        v24 = 1;
      if (!v20)
        goto LABEL_22;
      if (((v21 ^ 1) & 1) != 0)
        goto LABEL_22;
      ColorSpace = CGImageGetColorSpace(v20);
      if (!ColorSpace)
        goto LABEL_22;
      v29 = ColorSpace;
      if (!CGColorSpaceIsWideGamutRGB(ColorSpace))
        goto LABEL_22;
      v25 = v29;
    }
    else
    {
      BitsPerComponent = CGImageGetBitsPerComponent(v20);
      v24 = CGImageGetBitmapInfo(v20) & 0xFFFFFFE0 | 1;
      v25 = CGImageGetColorSpace(v20);
    }
    v26 = CGColorSpaceRetain(v25);
    if (v26)
    {
LABEL_25:
      v37.origin.x = v12;
      v37.origin.y = v14;
      v37.size.width = v16;
      v37.size.height = v18;
      v31 = (unint64_t)(v10 * CGRectGetWidth(v37));
      v38.origin.x = v12;
      v38.origin.y = v14;
      v38.size.width = v16;
      v38.size.height = v18;
      v32 = (unint64_t)(v10 * CGRectGetHeight(v38));
      NumberOfComponents = CGColorSpaceGetNumberOfComponents(v26);
      v34 = CGBitmapContextCreate(0, v31, v32, BitsPerComponent, (BitsPerComponent >> 3) * v31 + (BitsPerComponent >> 3) * v31 * NumberOfComponents, v26, v24);
      CGContextTranslateCTM(v34, 0.0, (double)v32);
      CGContextScaleCTM(v34, v10, -v10);
      UIGraphicsPushContext(v34);
      objc_msgSend(v19, "drawInRect:", v12, v14, v16, v18);
      UIGraphicsPopContext();
      Image = CGBitmapContextCreateImage(v34);
      CGColorSpaceRelease(v26);
      CGContextRelease(v34);
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v19, "imageOrientation"), v10);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
      return v27;
    }
LABEL_22:
    v30 = (CFStringRef *)MEMORY[0x1E0C9D960];
    if (!v22)
      v30 = (CFStringRef *)MEMORY[0x1E0C9DA10];
    v26 = CGColorSpaceCreateWithName(*v30);
    goto LABEL_25;
  }
  v27 = a1;
  return v27;
}

@end
