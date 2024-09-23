@implementation VUICoreUtilities

+ (unint64_t)vuiContentSizeCategoryFor:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = vuiContentSizeCategoryFor__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&vuiContentSizeCategoryFor__onceToken, &__block_literal_global_29);
  objc_msgSend((id)vuiContentSizeCategoryFor__sContentSizeCategoryVui, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

+ (id)uiContentSizeCategoryFor:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (uiContentSizeCategoryFor__onceToken != -1)
    dispatch_once(&uiContentSizeCategoryFor__onceToken, &__block_literal_global_44);
  v4 = (void *)uiContentSizeCategoryFor__sVuiContentSizeCategory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)canHandleDecodingOnRenderThread
{
  return 0;
}

+ (unint64_t)vuiUserInterfaceStyleForInterfaceStyle:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4 maximumContentSizeCategory:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  float v19;
  float v20;

  v7 = a4;
  if (scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken != -1)
    dispatch_once(&scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken, &__block_literal_global_46);
  v8 = objc_msgSend(v7, "vuiPreferredContentSizeCategory");
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vuiTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "vuiPreferredContentSizeCategory");

  }
  if (v8 <= a5 || a5 == 0)
    v12 = v8;
  else
    v12 = a5;
  v13 = (void *)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_1E9F3E0B0;
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  objc_msgSend(v18, "floatValue");
  v20 = v19;

  return ceil(v20 * a3);
}

+ (void)image:(id)a3 didCompleteLoadingForCache:(int64_t)a4 requestRecord:(id)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  __CFString *v18;

  if (a5)
  {
    v7 = a5;
    v8 = a3;
    objc_msgSend(v8, "uiImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageType");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)UTTypeCopyPreferredTagWithClass(v10, (CFStringRef)*MEMORY[0x1E0CA5A90]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke;
    v15[3] = &unk_1E9F2BA40;
    v16 = v10;
    v17 = v9;
    v18 = v11;
    v12 = v11;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v7, "didCompleteLoadingFromCache:withResponseBodyBlock:", a4, v15);

  }
}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4
{
  id v5;
  double v6;
  double v7;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v5, 0, a3);
  v7 = v6;

  return v7;
}

+ (BOOL)runningAnInternalBuild
{
  if (runningAnInternalBuild_onceToken != -1)
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_311);
  return runningAnInternalBuild_internalBuild;
}

uint64_t __42__VUICoreUtilities_runningAnInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  runningAnInternalBuild_internalBuild = result;
  return result;
}

void __88__VUICoreUtilities_scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E080, &unk_1E9F3DEB8);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E090, &unk_1E9F3DED0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E0A0, &unk_1E9F3DEE8);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E0B0, &unk_1E9F3DF00);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E0C0, &unk_1E9F3DF18);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E0D0, &unk_1E9F3DF30);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E0E0, &unk_1E9F3DF48);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E0F0, &unk_1E9F3DF60);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E100, &unk_1E9F3DF78);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E110, &unk_1E9F3DF90);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E120, &unk_1E9F3DFA8);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9F3E130, &unk_1E9F3DFC0);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale;
  scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale = v0;

}

void __46__VUICoreUtilities_vuiContentSizeCategoryFor___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[13];
  _QWORD v9[14];

  v9[13] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB410];
  v8[0] = *MEMORY[0x1E0CEB440];
  v8[1] = v0;
  v9[0] = &unk_1E9F3DEA0;
  v9[1] = &unk_1E9F3DEB8;
  v1 = *MEMORY[0x1E0CEB428];
  v8[2] = *MEMORY[0x1E0CEB438];
  v8[3] = v1;
  v9[2] = &unk_1E9F3DED0;
  v9[3] = &unk_1E9F3DEE8;
  v2 = *MEMORY[0x1E0CEB408];
  v8[4] = *MEMORY[0x1E0CEB420];
  v8[5] = v2;
  v9[4] = &unk_1E9F3DF00;
  v9[5] = &unk_1E9F3DF18;
  v3 = *MEMORY[0x1E0CEB3F8];
  v8[6] = *MEMORY[0x1E0CEB400];
  v8[7] = v3;
  v9[6] = &unk_1E9F3DF30;
  v9[7] = &unk_1E9F3DF48;
  v4 = *MEMORY[0x1E0CEB3D8];
  v8[8] = *MEMORY[0x1E0CEB3E0];
  v8[9] = v4;
  v9[8] = &unk_1E9F3DF60;
  v9[9] = &unk_1E9F3DF78;
  v5 = *MEMORY[0x1E0CEB3C8];
  v8[10] = *MEMORY[0x1E0CEB3D0];
  v8[11] = v5;
  v9[10] = &unk_1E9F3DF90;
  v9[11] = &unk_1E9F3DFA8;
  v8[12] = *MEMORY[0x1E0CEB3C0];
  v9[12] = &unk_1E9F3DFC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)vuiContentSizeCategoryFor__sContentSizeCategoryVui;
  vuiContentSizeCategoryFor__sContentSizeCategoryVui = v6;

}

void __45__VUICoreUtilities_uiContentSizeCategoryFor___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[13];
  _QWORD v15[14];

  v15[13] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB440];
  v14[0] = &unk_1E9F3DEA0;
  v14[1] = &unk_1E9F3DEB8;
  v1 = *MEMORY[0x1E0CEB410];
  v15[0] = v0;
  v15[1] = v1;
  v2 = *MEMORY[0x1E0CEB438];
  v14[2] = &unk_1E9F3DED0;
  v14[3] = &unk_1E9F3DEE8;
  v3 = *MEMORY[0x1E0CEB428];
  v15[2] = v2;
  v15[3] = v3;
  v4 = *MEMORY[0x1E0CEB420];
  v14[4] = &unk_1E9F3DF00;
  v14[5] = &unk_1E9F3DF18;
  v5 = *MEMORY[0x1E0CEB408];
  v15[4] = v4;
  v15[5] = v5;
  v6 = *MEMORY[0x1E0CEB400];
  v14[6] = &unk_1E9F3DF30;
  v14[7] = &unk_1E9F3DF48;
  v7 = *MEMORY[0x1E0CEB3F8];
  v15[6] = v6;
  v15[7] = v7;
  v8 = *MEMORY[0x1E0CEB3E0];
  v14[8] = &unk_1E9F3DF60;
  v14[9] = &unk_1E9F3DF78;
  v9 = *MEMORY[0x1E0CEB3D8];
  v15[8] = v8;
  v15[9] = v9;
  v10 = *MEMORY[0x1E0CEB3D0];
  v14[10] = &unk_1E9F3DF90;
  v14[11] = &unk_1E9F3DFA8;
  v11 = *MEMORY[0x1E0CEB3C8];
  v15[10] = v10;
  v15[11] = v11;
  v14[12] = &unk_1E9F3DFC0;
  v15[12] = *MEMORY[0x1E0CEB3C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 13);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)uiContentSizeCategoryFor__sVuiContentSizeCategory;
  uiContentSizeCategoryFor__sVuiContentSizeCategory = v12;

}

void __38__VUICoreUtilities_VideosUICoreBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.VideosUICore"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VideosUICoreBundle_bundle;
  VideosUICoreBundle_bundle = v0;

}

void __34__VUICoreUtilities_VideosUIBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.VideosUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VideosUIBundle_bundle;
  VideosUIBundle_bundle = v0;

}

+ (CGPath)shadowPathWithCornerRadii:(_VUICornerRadii)a3 andScaledSize:(CGSize)a4
{
  double height;
  double width;
  double bottomRight;
  double bottomLeft;
  double topRight;
  double topLeft;
  void *v10;
  void *Mutable;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  bottomRight = a3.bottomRight;
  bottomLeft = a3.bottomLeft;
  topRight = a3.topRight;
  topLeft = a3.topLeft;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1lf, %.1lf}[%.1f %.1f %.1f %.1f]"), *(_QWORD *)&a4.width, *(_QWORD *)&a4.height, *(_QWORD *)&a3.topLeft, *(_QWORD *)&a3.topRight, *(_QWORD *)&a3.bottomRight, *(_QWORD *)&a3.bottomLeft);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)shadowPathWithCornerRadii_andScaledSize__pathsByShape, "objectForKeyedSubscript:", v10);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();

  if (!Mutable)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint((CGMutablePathRef)Mutable, 0, topLeft, height);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, width - (topLeft + topRight), height);
    if (topRight > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, width - topRight, height - topRight, topRight, 1.57079633, 0.0, 1);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, width, bottomRight);
    if (bottomRight > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, width - bottomRight, bottomRight, bottomRight, 0.0, -1.57079633, 1);
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, bottomLeft, 0.0);
    if (bottomLeft > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, bottomLeft, bottomLeft, bottomLeft, -1.57079633, -3.14159265, 1);
    v12 = height - topLeft;
    CGPathAddLineToPoint((CGMutablePathRef)Mutable, 0, 0.0, v12);
    if (topLeft > 0.0)
      CGPathAddArc((CGMutablePathRef)Mutable, 0, topLeft, v12, topLeft, 3.14159265, 1.57079633, 1);
    v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    if (!shadowPathWithCornerRadii_andScaledSize__pathsByShape)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
      shadowPathWithCornerRadii_andScaledSize__pathsByShape = v14;

      v13 = (void *)shadowPathWithCornerRadii_andScaledSize__pathsByShape;
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", Mutable, v10);

  }
  return (CGPath *)Mutable;
}

+ (double)radiusFromCornerRadii:(_VUICornerRadii)a3
{
  return fmax(fmax(a3.topLeft, a3.topRight), fmax(a3.bottomLeft, a3.bottomRight));
}

+ (BOOL)radiiIsZero:(_VUICornerRadii)a3
{
  return a3.topLeft < 2.22044605e-16
      && a3.topRight < 2.22044605e-16
      && a3.bottomLeft < 2.22044605e-16
      && a3.bottomRight < 2.22044605e-16;
}

+ (_VUICornerRadii)radiiFromRadius:(double)a3
{
  _VUICornerRadii result;

  result.bottomRight = a3;
  result.bottomLeft = a3;
  result.topRight = a3;
  result.topLeft = a3;
  return result;
}

+ (id)imageForResource:(id)a3 accessibilityDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  +[VUICoreUtilities _imageForResource:](VUICoreUtilities, "_imageForResource:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[VUICoreUtilities _getImageFromURLorBundle:](VUICoreUtilities, "_getImageFromURLorBundle:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v6)
    objc_msgSend(v7, "setAccessibilityLabel:", v6);

  return v7;
}

+ (id)_imageForResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    +[VUICoreUtilities VideosUIBundle](VUICoreUtilities, "VideosUIBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "vuiImageNamed:inBundle:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "vuiImageNamed:inBundle:", v3, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", v3, 0, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)VideosUICoreBundle
{
  if (VideosUICoreBundle_onceToken != -1)
    dispatch_once(&VideosUICoreBundle_onceToken, &__block_literal_global_5);
  return (id)VideosUICoreBundle_bundle;
}

+ (id)VideosUIBundle
{
  if (VideosUIBundle_onceToken != -1)
    dispatch_once(&VideosUIBundle_onceToken, &__block_literal_global_19);
  return (id)VideosUIBundle_bundle;
}

+ (id)mobileGestaltStringForKey:(__CFString *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  void *v6;

  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2;
  v6[3] = &unk_1E9F2BA18;
  v7 = a1[4];
  v8 = a1[5];
  v10 = v3;
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, v6);

}

void __67__VUICoreUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1DF08E3F0]();
  v3 = (void *)*MEMORY[0x1E0CA5BA8];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CA5BA8]))
  {

  }
  else
  {
    v4 = (void *)*MEMORY[0x1E0CA5BB0];
    v5 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CA5BB0]);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "vuiPNGRepresentation");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "vuiJPEGRepresentation");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  objc_autoreleasePoolPop(v2);
}

+ (double)focusedSizeIncreaseForSize:(CGSize)a3 upscaleFactor:(double)a4
{
  double width;
  BOOL v5;
  double result;

  width = a3.width;
  v5 = a3.width < 180.0;
  result = 70.0;
  if (v5)
    result = 60.0;
  if (a4 > 1.0)
    return result + floor(fmax(width, a3.height) * (a4 + -1.0));
  return result;
}

+ (CGPath)createPathForRadii:(_VUICornerRadii)a3 inRect:(CGRect)a4 isContinuous:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double topRight;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v15;
  id v16;
  CGPath *v17;
  CGPath *Mutable;
  double radius;
  double bottomLeft;
  double topLeft;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  radius = a3.bottomRight;
  bottomLeft = a3.bottomLeft;
  topRight = a3.topRight;
  topLeft = a3.topLeft;
  MinX = CGRectGetMinX(a4);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxY = CGRectGetMaxY(v25);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "radiusFromCornerRadii:", topLeft, topRight, bottomLeft, radius);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", MinX, MinY, MaxX - MinX, MaxY - MinY, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (CGPath *)MEMORY[0x1DF08E048](objc_msgSend(v16, "CGPath"));

    return v17;
  }
  else
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, topLeft + MinX, MinY);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, topRight + MinY, topRight);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MaxX - radius, MaxY, radius);
    CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MaxY - bottomLeft, bottomLeft);
    CGPathAddArcToPoint(Mutable, 0, MinX, MinY, topLeft + MinX, MinY, topLeft);
    return Mutable;
  }
}

+ (id)URLForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_URLForResource:inBundle:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[VUICoreUtilities VideosUICoreBundle](VUICoreUtilities, "VideosUICoreBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_URLForResource:inBundle:", v4, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        +[VUICoreUtilities TVUIKitBundle](VUICoreUtilities, "TVUIKitBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_URLForResource:inBundle:", v4, v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_URLForResource:inBundle:", v4, v9);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)TVUIKitBundle
{
  if (TVUIKitBundle_onceToken != -1)
    dispatch_once(&TVUIKitBundle_onceToken, &__block_literal_global_22);
  return (id)TVUIKitBundle_bundle;
}

void __33__VUICoreUtilities_TVUIKitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TVUIKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TVUIKitBundle_bundle;
  TVUIKitBundle_bundle = v0;

}

+ (id)defaultPlaceholderImageForUserInterfaceStyle:(unint64_t)a3
{
  uint64_t *v3;

  if (a3 == 2)
  {
    if (defaultPlaceholderImageForUserInterfaceStyle____once != -1)
      dispatch_once(&defaultPlaceholderImageForUserInterfaceStyle____once, &__block_literal_global_25);
    v3 = &defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  }
  else
  {
    if (defaultPlaceholderImageForUserInterfaceStyle____once_27 != -1)
      dispatch_once(&defaultPlaceholderImageForUserInterfaceStyle____once_27, &__block_literal_global_28);
    v3 = &defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  }
  return (id)*v3;
}

void __65__VUICoreUtilities_defaultPlaceholderImageForUserInterfaceStyle___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  CGSize v3;
  CGRect v4;

  v3.width = 1.0;
  v3.height = 1.0;
  UIGraphicsBeginImageContext(v3);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.11372549, 0.11372549, 0.11372549, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  UIRectFillUsingBlendMode(v4, kCGBlendModeCopy);
  UIGraphicsGetImageFromCurrentImageContext();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage;
  defaultPlaceholderImageForUserInterfaceStyle____defaultDarkPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

void __65__VUICoreUtilities_defaultPlaceholderImageForUserInterfaceStyle___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  CGSize v3;
  CGRect v4;

  v3.width = 1.0;
  v3.height = 1.0;
  UIGraphicsBeginImageContext(v3);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.921568627, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  UIRectFillUsingBlendMode(v4, kCGBlendModeCopy);
  UIGraphicsGetImageFromCurrentImageContext();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage;
  defaultPlaceholderImageForUserInterfaceStyle____defaultPlaceholderImage = v1;

  UIGraphicsEndImageContext();
}

+ (CGRect)centerRect:(CGRect)result inRect:(CGRect)a4
{
  double v4;
  double v5;

  v4 = round(a4.origin.x + (a4.size.width - result.size.width) * 0.5);
  v5 = round(a4.origin.y + (a4.size.height - result.size.height) * 0.5);
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (id)_vuiCoreResourceMap
{
  if (_vuiCoreResourceMap_onceToken != -1)
    dispatch_once(&_vuiCoreResourceMap_onceToken, &__block_literal_global_59);
  return (id)_vuiCoreResourceMap_sDict;
}

uint64_t __39__VUICoreUtilities__vuiCoreResourceMap__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_vuiCoreResourceMap_sDict;
  _vuiCoreResourceMap_sDict = (uint64_t)v0;

  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-cloud"), CFSTR("button-cloud"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-play"), CFSTR("button-play"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-preview"), CFSTR("button-preview"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-add"), CFSTR("button-add"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-remove"), CFSTR("button-remove"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-add-alt"), CFSTR("button-add-alt"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-artist"), CFSTR("button-artist"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-curator"), CFSTR("button-curator"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-follow"), CFSTR("button-follow"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-checkmark"), CFSTR("button-checkmark"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-more"), CFSTR("button-more"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-rate"), CFSTR("button-rate"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-rated"), CFSTR("button-rated"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-radio"), CFSTR("button-radio"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-shuffle"), CFSTR("button-shuffle"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_dropdown"), CFSTR("button-dropdown"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-open"), CFSTR("button-open"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_logo_white"), CFSTR("common-sense-logo-white"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_logo_black"), CFSTR("common-sense-logo-black"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_white_l"), CFSTR("common-sense-badge-white-l"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_white_m"), CFSTR("common-sense-badge-white-m"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_white_s"), CFSTR("common-sense-badge-white-s"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_black_s"), CFSTR("common-sense-badge-black-s"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_black_m"), CFSTR("common-sense-badge-black-m"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_black_l"), CFSTR("common-sense-badge-black-l"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_chevron"), CFSTR("chevron"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("list-chevron"), CFSTR("list-chevron"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("game_center"), CFSTR("game_center"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("game_controller"), CFSTR("game_controller"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("bluetooth_accessory_mask"), CFSTR("bluetooth_accessory"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("watched-checkmark"), CFSTR("overlay-checkmark"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_radio_small_mask"), CFSTR("radio-s"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_cloud_mask"), CFSTR("cloud-s"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_lockup_badge"), CFSTR("extras-lockup-badge"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_preview_stamp"), CFSTR("extras-preview-stamp"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_lockup_badge_zh"), CFSTR("extras-lockup-badge_zh"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_preview_stamp_zh"), CFSTR("extras-preview-stamp_zh"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ghost_episode_light"), CFSTR("episode-placeholder-light"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ghost_episode_dark"), CFSTR("episode-placeholder-dark"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-brick"), CFSTR("content-gradient-brick"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-flowcase"), CFSTR("content-gradient-flowcase"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-genre-brick"), CFSTR("content-gradient-genre-brick"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-genre-brick-4"), CFSTR("content-gradient-genre-brick-4"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-list-keyframe"), CFSTR("content-gradient-list-keyframe"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cc_mask"), CFSTR("cc"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("hd_mask"), CFSTR("hd"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTRotten"), CFSTR("tomato-splat"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTFresh"), CFSTR("tomato-fresh"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTCertified"), CFSTR("tomato-certified"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTLargeRotten"), CFSTR("tomato-splat-m"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTLargeFresh"), CFSTR("tomato-fresh-m"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTLargeCertified"), CFSTR("tomato-certified-m"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("confirmation-checkmark"), CFSTR("confirmation-checkmark"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cloud-download-icon"), CFSTR("cloud-download-icon"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("download-checkmark"), CFSTR("download-checkmark"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-add"), CFSTR("popover-add"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-chevron-up"), CFSTR("popover-chevron-up"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-chevron-down"), CFSTR("popover-chevron-down"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-share"), CFSTR("popover-share"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-more"), CFSTR("popover-more"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Add"), CFSTR("ActionMenu-Add"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-circleMask"), CFSTR("ActionMenu-circleMask"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-ClearHistory"), CFSTR("ActionMenu-ClearHistory"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-ClearPlayHistory"), CFSTR("ActionMenu-ClearPlayHistory"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Mark"), CFSTR("ActionMenu-Mark"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-MarkAll"), CFSTR("ActionMenu-MarkAll"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Play"), CFSTR("ActionMenu-Play"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Remove"), CFSTR("ActionMenu-Remove"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-RemoveFromUpNext"), CFSTR("ActionMenu-RemoveFromUpNext"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Share"), CFSTR("ActionMenu-Share"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("Actions_CheckGlyph"), CFSTR("Actions-Check"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("Actions_AddGlyph"), CFSTR("Actions-Add"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("itunes-extras-badge"), CFSTR("extras-badge"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("guided-tour-play"), CFSTR("guided-tour-play"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("OnboardingPlayLarge"), CFSTR("onboarding-play-large"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("OnboardingPlaySmall"), CFSTR("onboarding-play-small"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("onboarding-hero"), CFSTR("onboarding-hero"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("onboarding-appicon"), CFSTR("onboarding-appicon"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("library-dropdown"), CFSTR("library-dropdown"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("metadata-ad"), CFSTR("metadata-ad"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("metadata-sdh"), CFSTR("metadata-sdh"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("hdr_mask"), CFSTR("hdr"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("hdr10+_mask"), CFSTR("hdr10+"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("4k_mask"), CFSTR("4k"));
  objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("dolbyvision_mask"), CFSTR("dolby-vision"));
  return objc_msgSend((id)_vuiCoreResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("dolbyatmos_mask"), CFSTR("dolby-atmos"));
}

+ (id)_getImageFromURLorBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;

  v4 = a3;
  +[VUICoreUtilities _vuiCoreResourceMap](VUICoreUtilities, "_vuiCoreResourceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  v10 = (void *)MEMORY[0x1E0CEA638];
  +[VUICoreUtilities VideosUIBundle](VUICoreUtilities, "VideosUIBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vuiImageNamed:inBundle:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vuiImageNamed:inBundle:", v4, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "URLForResource:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "isFileURL"))
  {
    v17 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithContentsOfFile:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v19;
  }
  if (!v12)
  {
    VUICDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[VUICoreUtilities _getImageFromURLorBundle:].cold.1((uint64_t)v4, v20);

  }
  return v12;
}

+ (id)_URLForResource:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("png"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("jpeg"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)runningUiTest
{
  if (runningUiTest_onceToken != -1)
    dispatch_once(&runningUiTest_onceToken, &__block_literal_global_312);
  return runningUiTest_isRunningUiTest;
}

void __33__VUICoreUtilities_runningUiTest__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arguments");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  runningUiTest_isRunningUiTest = objc_msgSend(v1, "containsObject:", CFSTR("-RunningUITest"));

  if (runningUiTest_isRunningUiTest)
  {
    VUICImageLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D951F000, v2, OS_LOG_TYPE_DEFAULT, "TV app is running via a UITest", v3, 2u);
    }

  }
}

+ (id)randomColor
{
  double v2;
  double v3;

  v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v2, v3, (double)arc4random_uniform(0xFFu) / 255.0, 0.400000006);
}

+ (void)vuiColor:(id)a3 getRed:(double *)a4 green:(double *)a5 blue:(double *)a6 alpha:(double *)a7
{
  objc_msgSend(a3, "getRed:green:blue:alpha:", a4, a5, a6, a7);
}

+ (void)_getImageFromURLorBundle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D951F000, a2, OS_LOG_TYPE_ERROR, "resource not found: %@", (uint8_t *)&v2, 0xCu);
}

@end
