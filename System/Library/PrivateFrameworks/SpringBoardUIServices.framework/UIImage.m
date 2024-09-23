@implementation UIImage

void __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGContext *CurrentContext;
  void *v11;
  id v12;
  CGImage *v13;
  void *Data;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  size_t v31;
  size_t v32;
  size_t v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;
  CGRect v37;

  v25 = *(_QWORD *)(a1 + 104);
  UIRectCenteredIntegralRectScale();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor", v25));
  if (*(_BYTE *)(a1 + 120) || !*(_QWORD *)(a1 + 40))
  {
    v36.origin.x = v3;
    v36.origin.y = v5;
    v36.size.width = v7;
    v36.size.height = v9;
    CGContextFillRect(CurrentContext, v36);
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      objc_msgSend(v11, "shadowSettings");
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
    }
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 40), "_flatImageWithColor:", *(_QWORD *)(a1 + 32));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (CGImage *)objc_msgSend(v12, "CGImage");
    v37.origin.x = v3;
    v37.origin.y = v5;
    v37.size.width = v7;
    v37.size.height = v9;
    CGContextDrawImage(CurrentContext, v37, v13);

  }
  Data = CGBitmapContextGetData(CurrentContext);
  Width = CGBitmapContextGetWidth(CurrentContext);
  Height = CGBitmapContextGetHeight(CurrentContext);
  BytesPerRow = CGBitmapContextGetBytesPerRow(CurrentContext);
  v18 = (void *)MEMORY[0x1E0CEA638];
  v19 = *(double *)(a1 + 104);
  v20 = *(_QWORD *)(a1 + 112);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_2;
  v26[3] = &unk_1E4C3F5C8;
  v21 = *(_QWORD *)(a1 + 56);
  v27 = *(id *)(a1 + 48);
  v28 = *(_QWORD *)(a1 + 104);
  v29 = *(_QWORD *)(a1 + 112);
  v30 = Data;
  v31 = Height;
  v32 = Width;
  v33 = BytesPerRow;
  objc_msgSend(v18, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", v20, v21, v26, *(double *)(a1 + 72), *(double *)(a1 + 80), v19);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

uint64_t __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __98__UIImage_SBUILegibilityAdditions__sbui_strikeImageForLegibilitySettings_strength_size_type_pool___block_invoke(uint64_t result)
{
  double v1;
  uint64_t v2;
  double v3;

  v1 = *(double *)(result + 40) * *(double *)(result + 48);
  if (v1 > 0.00000011920929)
  {
    v2 = result;
    do
    {
      if (v1 + 0.00000011920929 <= 1.0)
        v3 = v1;
      else
        v3 = 1.0;
      result = objc_msgSend(*(id *)(v2 + 32), "drawInRect:blendMode:alpha:", 0, *(double *)(v2 + 56), *(double *)(v2 + 64), *(double *)(v2 + 72), *(double *)(v2 + 80), v3);
      v1 = v1 + -1.0;
    }
    while (v1 > 0.00000011920929);
  }
  return result;
}

vImage_Error __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_2(uint64_t a1)
{
  CGContext *CurrentContext;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  uint32_t v9;
  const vImage_Buffer *v10;
  double v12;
  vImage_Buffer dest;

  CurrentContext = UIGraphicsGetCurrentContext();
  dest.data = CGBitmapContextGetData(CurrentContext);
  dest.width = CGBitmapContextGetWidth(CurrentContext);
  dest.height = CGBitmapContextGetHeight(CurrentContext);
  dest.rowBytes = CGBitmapContextGetBytesPerRow(CurrentContext);
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "shadowSettings");
    v4 = v12 * 0.2;
  }
  else
  {
    v4 = 0.0;
  }
  v5 = v4 * *(double *)(a1 + 40);
  v6 = v5 * 3.0 * 2.50662827 * 0.25 + 0.5;
  v7 = v5 < 2.0;
  v8 = 4.25994241;
  if (!v7)
    v8 = v6;
  v9 = vcvtmd_u64_f64(v8) | 1;
  v10 = (const vImage_Buffer *)(a1 + 56);
  if ((unint64_t)(*(_QWORD *)(a1 + 48) - 3) > 1)
    return vImageTentConvolve_ARGB8888(v10, &dest, 0, 0, 0, v9, v9, 0, 8u);
  else
    return vImageTentConvolve_Planar8(v10, &dest, 0, 0, 0, v9, v9, 0, 8u);
}

@end
