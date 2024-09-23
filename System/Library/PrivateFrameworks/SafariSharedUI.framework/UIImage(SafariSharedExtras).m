@implementation UIImage(SafariSharedExtras)

- (uint64_t)safari_transparencyAnalysisResult
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  CGImage *CGImageRepresentation;
  CGColorSpace *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  vImageConverter *v12;
  uint32_t bitsPerPixel;
  vImagePixelCount width;
  uint64_t v15;
  vImagePixelCount v16;
  vImagePixelCount height;
  id v19;
  unsigned int (**v20)(_QWORD, _QWORD);
  vImagePixelCount v21;
  id v22;
  unsigned int (**v23)(_QWORD, _QWORD);
  int v24;
  void *data;
  _QWORD v26[4];
  id v27;
  vImagePixelCount v28;
  _QWORD v29[4];
  id v30;
  vImagePixelCount v31;
  _QWORD v32[5];
  vImage_Buffer v33;
  vImage_Buffer src;
  vImage_CGImageFormat f2;
  _QWORD v36[5];
  vImage_Buffer buf;
  vImage_CGImageFormat format;
  vImagePixelCount *histogram[4];
  _BYTE v40[2048];
  _BYTE v41[2048];
  _BYTE v42[2048];
  _QWORD v43[259];

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v43[256] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(v0, &transparencyAnalysisResultKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
  {
    CGImageRepresentation = (CGImage *)_UIImageGetCGImageRepresentation();
    if (!CGImageHasAlpha())
    {
      v3 = 1;
      goto LABEL_7;
    }
    *((_DWORD *)&format.renderingIntent + 1) = 0;
    format.bitsPerComponent = CGImageGetBitsPerComponent(CGImageRepresentation);
    format.bitsPerPixel = CGImageGetBitsPerPixel(CGImageRepresentation);
    format.colorSpace = CGImageGetColorSpace(CGImageRepresentation);
    format.bitmapInfo = CGImageGetBitmapInfo(CGImageRepresentation);
    format.version = 0;
    format.decode = CGImageGetDecode(CGImageRepresentation);
    format.renderingIntent = CGImageGetRenderingIntent(CGImageRepresentation);
    if (vImageBuffer_InitWithCGImage(&buf, &format, 0, CGImageRepresentation, 0))
    {
      v3 = 0;
LABEL_7:
      objc_msgSend(v0, "safari_setTransparencyAnalysisResult:", v3);
      goto LABEL_8;
    }
    data = buf.data;
    v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v7 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
    v8 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke;
    v36[3] = &__block_descriptor_40_e5_v8__0l;
    v36[4] = v6;
    objc_msgSend(v7, "setHandler:", v36);
    *(_QWORD *)&f2.bitsPerComponent = 0x2000000008;
    f2.colorSpace = v6;
    f2.bitmapInfo = 3;
    memset(&f2.version, 0, 20);
    src = buf;
    if (vImageCGImageFormat_IsEqual(&format, &f2))
    {
      v9 = v8;
      v10 = 0;
      goto LABEL_11;
    }
    v12 = vImageConverter_CreateWithCGImageFormat(&format, &f2, 0, 0, 0);
    v3 = (uint64_t)v12;
    if (!v12)
    {
LABEL_43:

      if (data)
        free(data);
      goto LABEL_7;
    }
    bitsPerPixel = f2.bitsPerPixel;
    width = buf.width;
    if (buf.rowBytes == buf.width * f2.bitsPerPixel)
    {
      if (!vImageConverter_MustOperateOutOfPlace(v12, 0, 0, 0))
      {
        v10 = 0;
        goto LABEL_38;
      }
      width = buf.width;
      bitsPerPixel = f2.bitsPerPixel;
    }
    if (vImageBuffer_Init(&src, buf.height, width, bitsPerPixel, 0))
    {
      v10 = 0;
      goto LABEL_39;
    }
    v10 = src.data;
LABEL_38:
    if (!vImageConvert_AnyToAny((const vImageConverterRef)v3, &buf, &src, 0, 0))
    {
      v9 = v8;
      vImageConverter_Release((vImageConverterRef)v3);
LABEL_11:
      bzero(v43, 0x800uLL);
      bzero(v42, 0x800uLL);
      bzero(v41, 0x800uLL);
      bzero(v40, 0x800uLL);
      histogram[0] = v43;
      histogram[1] = (vImagePixelCount *)v42;
      histogram[2] = (vImagePixelCount *)v41;
      histogram[3] = (vImagePixelCount *)v40;
      if (!vImageHistogramCalculation_ARGB8888(&src, histogram, 0))
      {
        v11 = 0;
        v3 = 1;
        while (!*(_QWORD *)&v40[v11])
        {
          v11 += 8;
          if (v11 == 2040)
            goto LABEL_41;
        }
        v15 = 0;
        v3 = 3;
        while (!*(_QWORD *)&v40[v15])
        {
          v15 += 8;
          if (v15 == 1640)
            goto LABEL_41;
        }
        height = src.height;
        v16 = src.width;
        if (src.width < 0x11 || src.height < 0x11)
          goto LABEL_48;
        v32[0] = v9;
        v32[1] = 3221225472;
        v32[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_2;
        v32[3] = &__block_descriptor_72_e11_B24__0Q8Q16l;
        v32[4] = src.data;
        v33 = src;
        v29[0] = v9;
        v29[1] = 3221225472;
        v29[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_3;
        v29[3] = &unk_1E54441B0;
        v19 = (id)MEMORY[0x1A85D45E4](v32);
        v30 = v19;
        v31 = v16 - 1;
        v20 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](v29);
        v21 = height - 1;
        v26[0] = v9;
        v26[1] = 3221225472;
        v26[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_4;
        v26[3] = &unk_1E54441B0;
        v22 = v19;
        v27 = v22;
        v28 = v21;
        v23 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](v26);
        if (!v20[2](v20, 0))
          goto LABEL_46;
        if (v20[2](v20, v21)
          && v23[2](v23, 0)
          && (((uint64_t (*)(_QWORD, vImagePixelCount))v23[2])(v23, v16 - 1) & 1) != 0)
        {
          v24 = 0;
          v3 = 4;
        }
        else
        {
LABEL_46:
          v3 = 0;
          v24 = 1;
        }

        if (v24)
LABEL_48:
          v3 = 2;
        goto LABEL_41;
      }
LABEL_40:
      v3 = 0;
LABEL_41:
      if (v10)
        free(v10);
      goto LABEL_43;
    }
LABEL_39:
    vImageConverter_Release((vImageConverterRef)v3);
    goto LABEL_40;
  }
  v3 = objc_msgSend(v1, "integerValue");
LABEL_8:

  return v3;
}

- (void)safari_setTransparencyAnalysisResult:()SafariSharedExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &transparencyAnalysisResultKey, v2, (void *)1);

}

+ (id)safari_largestSizedBitmapImageOrSVGFromImages:()SafariSharedExtras
{
  id v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v3;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "size", (_QWORD)v23);
        v14 = v13;
        v16 = v15;
        v17 = objc_msgSend(v12, "safari_isSVGImage");
        v18 = v17;
        if (v7 && ((v17 ^ 1 | v9) & 1) != 0)
        {
          if (((v9 ^ v17) & 1) != 0)
            continue;
          if ((v14 < v4 || v16 <= v5) && (v14 <= v4 || v16 < v5))
            continue;
        }
        v21 = v12;

        v4 = v14;
        v7 = v21;
        v9 = v18;
        v5 = v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v7;
}

+ (id)safari_imageWithSize:()SafariSharedExtras actions:
{
  objc_msgSend(a1, "safari_imageWithSize:flipped:actions:", 1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)safari_imageWithSize:()SafariSharedExtras flipped:actions:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a6;
  objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredRange:", 2);
  objc_msgSend(v9, "setOpaque:", 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v9, a1, a2);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__UIImage_SafariSharedExtras__safari_imageWithSize_flipped_actions___block_invoke;
  v14[3] = &unk_1E5444100;
  v11 = v8;
  v15 = v11;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)safari_imageWithSVGData:()SafariSharedExtras
{
  uint64_t v0;
  void *v1;

  v0 = CGSVGDocumentCreateFromData();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_imageWithCGSVGDocument:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    CGSVGDocumentRelease();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (BOOL)safari_isSVGImage
{
  return objc_msgSend(a1, "_CGSVGDocument") != 0;
}

- (void)safari_setThemeColor:()SafariSharedExtras
{
  objc_setAssociatedObject(a1, (const void *)themeColorKey, a3, (void *)1);
}

- (id)safari_themeColor
{
  return objc_getAssociatedObject(a1, (const void *)themeColorKey);
}

- (BOOL)safari_transparencyAnalysisResultIsNotOpaque
{
  return (objc_msgSend(a1, "safari_transparencyAnalysisResult") & 0xFFFFFFFFFFFFFFFDLL) != 1;
}

- (double)safari_longestEdgeInPixels
{
  double result;
  double v2;

  objc_msgSend(a1, "size", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  if (result <= v2)
    return v2;
  return result;
}

- (uint64_t)safari_isGrayscale
{
  void *v2;
  void *v3;
  uint64_t v4;
  CGImage *CGImageRepresentation;
  CGColorSpace *ColorSpace;
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  char *Data;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  unsigned __int8 *v16;
  unint64_t v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  _BOOL4 v23;
  int v24;
  int v25;
  int v26;
  double v28;
  const void *v29;
  void *v30;
  CGRect v32;

  objc_getAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_isGrayscale]::isGrayscaleImageKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    CGImageRepresentation = (CGImage *)_UIImageGetCGImageRepresentation();
    ColorSpace = CGImageGetColorSpace(CGImageRepresentation);
    if (CGColorSpaceGetModel(ColorSpace))
    {
      Width = CGImageGetWidth(CGImageRepresentation);
      Height = CGImageGetHeight(CGImageRepresentation);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v10 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, DeviceRGB, 1u);
      CGColorSpaceRelease(DeviceRGB);
      v32.size.width = (double)Width;
      v32.size.height = (double)Height;
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      CGContextDrawImage(v10, v32, CGImageRepresentation);
      Data = (char *)CGBitmapContextGetData(v10);
      v12 = Height * Width;
      if ((uint64_t)(4 * Height * Width) < 1)
      {
        v14 = 0;
        v28 = 0.0;
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v15 = (double)v12;
        v16 = (unsigned __int8 *)(Data + 1);
        v17 = (unint64_t)&Data[4 * v12];
        do
        {
          v18 = v16 - 1;
          v19 = *(v16 - 1);
          v20 = v16[1];
          v21 = v16[2];
          if (v21 > 0x18)
            ++v13;
          v22 = v19 - v20;
          if (v19 - v20 < 0)
            v22 = v20 - v19;
          if (v22 <= 0x18)
          {
            v24 = *v16;
            v25 = v20 - v24;
            if (v25 < 0)
              v25 = -v25;
            v26 = v19 - v24;
            if (v26 < 0)
              v26 = -v26;
            v23 = v26 > 0x18;
            if (v25 > 0x18)
              v23 = 1;
          }
          else
          {
            v23 = 1;
          }
          if (v21 >= 0x19 && v23 && (double)++v14 / v15 >= 0.03)
            break;
          v16 += 4;
        }
        while ((unint64_t)(v18 + 4) < v17);
        v28 = (double)v13;
      }
      CGContextRelease(v10);
      v4 = (double)v14 / v28 < 0.03;
      v29 = (const void *)-[UIImage(SafariSharedExtras) safari_isGrayscale]::isGrayscaleImageKey;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(a1, v29, v30, (void *)1);

    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

- (id)safari_makeGrayscale
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_makeGrayscale]::grayscaleImageKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", _UIImageGetCGImageRepresentation());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C9E260];
    v13[0] = &unk_1E547A2C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0D8A0C0];
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extent");
    objc_msgSend(v7, "imageByAdoptingCGImage:", objc_msgSend(v8, "createCGImage:fromRect:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", objc_msgSend(v9, "CGImage"));
    objc_setAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_makeGrayscale]::grayscaleImageKey, v10, (void *)1);
    v3 = v10;

  }
  return v3;
}

- (double)safari_computeAverageLuminance
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  CGImage *CGImageRepresentation;
  void *v7;

  objc_getAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_computeAverageLuminance]::averageLuminanceKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    CGImageRepresentation = (CGImage *)_UIImageGetCGImageRepresentation();
    v5 = WBSComputeAverageLuminance(CGImageRepresentation);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, &-[UIImage(SafariSharedExtras) safari_computeAverageLuminance]::averageLuminanceKey, v7, (void *)1);

  }
  return v5;
}

@end
