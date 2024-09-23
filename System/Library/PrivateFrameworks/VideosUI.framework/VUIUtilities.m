@implementation VUIUtilities

+ (id)getCurrentQueueLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", dispatch_queue_get_label(0), 4);
}

+ (BOOL)isSUIEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)getOSVersion
{
  if (getOSVersion_onceToken != -1)
    dispatch_once(&getOSVersion_onceToken, &__block_literal_global_49);
  return (id)getOSVersion_osVersion;
}

+ (BOOL)isTVApp
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TVWatchList")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.tv")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TV"));
  }

  return v4;
}

void __28__VUIUtilities_getOSVersion__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  uint64_t v3;
  void *v4;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)getOSVersion_osVersion;
      getOSVersion_osVersion = v3;

    }
    CFRelease(v1);
  }
}

+ (BOOL)isInRetailDemoMode
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CFDA50], "isRunningInStoreDemoMode");
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUIUtilities::isInRetailDemoMode=%hhd", (uint8_t *)v5, 8u);
  }

  return v2;
}

void __84__VUIUtilities_scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBC68, *MEMORY[0x1E0DC4908]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBC78, *MEMORY[0x1E0DC4930]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBC88, *MEMORY[0x1E0DC4920]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBC98, *MEMORY[0x1E0DC4918]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBCA8, *MEMORY[0x1E0DC4900]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBCB8, *MEMORY[0x1E0DC48F8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBCC8, *MEMORY[0x1E0DC48F0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBCD8, *MEMORY[0x1E0DC48D8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBCE8, *MEMORY[0x1E0DC48D0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBCF8, *MEMORY[0x1E0DC48C8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBD08, *MEMORY[0x1E0DC48C0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA0BBD18, *MEMORY[0x1E0DC48B8]);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale;
  scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale = v0;

}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4 maximumContentSizeCategory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  float v20;
  float v21;

  v7 = a4;
  v8 = a5;
  if (scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken != -1)
    dispatch_once(&scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__onceToken, &__block_literal_global_92);
  objc_msgSend(v7, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (id)*MEMORY[0x1E0DC4938];
  if (!v9 || objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0DC4938]))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  if (v11 != v8
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, (UIContentSizeCategory)v10) == NSOrderedAscending)
  {
    v15 = v8;

    v10 = v15;
  }
  objc_msgSend((id)scaleContentSizeValue_forTraitCollection_maximumContentSizeCategory__sContentSizeCategoryScale, "objectForKeyedSubscript:", v10);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &unk_1EA0BBC98;
  if (v16)
    v18 = (void *)v16;
  v19 = v18;

  objc_msgSend(v19, "floatValue");
  v21 = v20;

  return ceil(v21 * a3);
}

+ (id)placeholderImageResourceName:(int64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  __CFString **v6;

  v3 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "userInterfaceStyle");

  }
  v6 = VUIImageResourceMapGenericPlaceholder16x9;
  if (v3 != 1)
    v6 = VUIImageResourceMapDarkGenericPlaceholder16x9;
  return *v6;
}

+ (unint64_t)minimumNumberOfItemsToEnableSeeAllButton
{
  return 10;
}

+ (BOOL)isIpadInterface
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 == 1;
}

+ (double)imageCornerRadiusWithStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 2)
    return dbl_1DA1C2150[a3];
  return result;
}

+ (id)randomColor
{
  double v2;
  double v3;

  v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  v3 = (double)arc4random_uniform(0xFFu) / 255.0;
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2, v3, (double)arc4random_uniform(0xFFu) / 255.0, 0.4);
}

+ (BOOL)shouldInvalidateLayoutWithPreviousTraitCollection:(id)a3 newTraitCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_msgSend(v5, "horizontalSizeClass");
    if (v7 == objc_msgSend(v6, "horizontalSizeClass"))
    {
      v8 = objc_msgSend(v5, "verticalSizeClass");
      v9 = v8 != objc_msgSend(v6, "verticalSizeClass");
    }
    else
    {
      v9 = 1;
    }
    objc_msgSend(v5, "preferredContentSizeCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != v12;

  }
  else
  {
    v10 = 0;
    v9 = 0;
  }

  return v9 || v10;
}

+ (CGSize)imageSizeWithAspectRatio:(double)a3 scaleToSize:(CGSize)a4
{
  double width;
  double height;
  CGSize result;

  if (a3 == 0.0 || a4.height != 0.0)
  {
    if (a4.width == 0.0)
      a4.width = round(a4.height * a3);
  }
  else
  {
    a4.height = round(a4.width / a3);
  }
  width = a4.width;
  height = a4.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (double)scaleContentSizeValue:(double)a3 forTraitCollection:(id)a4
{
  id v5;
  double v6;
  double v7;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v5, *MEMORY[0x1E0DC4938], a3);
  v7 = v6;

  return v7;
}

+ (BOOL)isIpadPortrait
{
  _BOOL4 v2;

  v2 = +[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface");
  if (v2)
    LOBYTE(v2) = (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation") - 1) < 2;
  return v2;
}

+ (int64_t)textAlignmentWithSemanticContentAttribute:(int64_t)a3
{
  void *v4;
  _BOOL4 v5;

  if (a3 == 4)
    return 2;
  if (a3 == 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceLayoutDirection") == 1;

  return 2 * v5;
}

+ (id)VideosUIBundle
{
  if (VideosUIBundle_onceToken != -1)
    dispatch_once(&VideosUIBundle_onceToken, &__block_literal_global_27_0);
  return (id)VideosUIBundle_bundle;
}

void __30__VUIUtilities_VideosUIBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.VideosUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VideosUIBundle_bundle;
  VideosUIBundle_bundle = v0;

}

+ (BOOL)isInFullscreenOrPipPlayback
{
  void *v2;
  char v3;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaybackUIBeingShown");

  return v3;
}

+ (BOOL)isPortraitIgnoringFlatOrientation:(int64_t)a3 viewSize:(CGSize)a4
{
  if ((unint64_t)(a3 - 5) >= 2)
    return (unint64_t)(a3 - 1) < 2;
  else
    return a4.width < a4.height;
}

+ (void)gradientConfigForCollection:(id)a3 gradientMask:(int64_t)a4 properties:(id)a5 configuration:(id *)a6
{
  char v7;
  id v9;
  double v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;

  v7 = a4;
  v9 = a5;
  objc_msgSend(a3, "contentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v47 = v16;
  objc_msgSend(v9, "minPadding");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v9, "minLengths");
  v46 = v25;
  v27 = v26;

  v28 = *MEMORY[0x1E0DC49E8];
  v29 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v30 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v31 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v32 = -(v18 - v11);
  if (v11 >= v18)
    v32 = *MEMORY[0x1E0DC49E8];
  v33 = v28 + v18 - v11;
  if (v11 >= v18)
    v33 = *MEMORY[0x1E0DC49E8];
  if ((v7 & 1) != 0)
    v34 = v27;
  else
    v34 = v32;
  if ((v7 & 1) != 0)
    v28 = v32;
  else
    v33 = *MEMORY[0x1E0DC49E8];
  v35 = -(v22 - v15);
  if (v15 >= v22)
    v35 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v36 = v22 - v15 + v30;
  if (v15 >= v22)
    v36 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  if ((v7 & 4) != 0)
    v37 = v27;
  else
    v37 = v35;
  if ((v7 & 4) != 0)
    v30 = v35;
  else
    v36 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v38 = -(v20 - v13);
  if (v13 >= v20)
    v38 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v39 = v20 - v13 + v29;
  if (v13 >= v20)
    v39 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if ((v7 & 8) != 0)
    v40 = v46;
  else
    v40 = v38;
  if ((v7 & 8) != 0)
    v29 = v38;
  else
    v39 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v41 = -(v24 - v47);
  if (v47 >= v24)
    v41 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  a6->var0.top = v34;
  a6->var0.left = v40;
  v42 = v24 - v47 + v31;
  if (v47 >= v24)
    v42 = v31;
  if ((v7 & 0x10) != 0)
    v43 = v46;
  else
    v43 = v41;
  a6->var0.bottom = v37;
  a6->var0.right = v43;
  a6->var1.top = v33;
  a6->var1.left = v39;
  if ((v7 & 0x10) != 0)
    v44 = v42;
  else
    v44 = v31;
  a6->var1.bottom = v36;
  a6->var1.right = v44;
  a6->var2.top = v28;
  a6->var2.left = v29;
  if ((v7 & 0x10) != 0)
    v45 = v41;
  else
    v45 = v31;
  a6->var2.bottom = v30;
  a6->var2.right = v45;
}

+ (TVCornerRadii)imageCornerRadiiWithStyle:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  TVCornerRadii result;

  v3 = (void *)MEMORY[0x1E0DB1848];
  objc_msgSend((id)objc_opt_class(), "imageCornerRadiusWithStyle:", a3);
  objc_msgSend(v3, "radiiFromRadius:");
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

+ (id)colorFromRGBStr:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("("));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5);

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(")"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v7);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "substringWithRange:", v6 + 1, v8 + ~v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == 3)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (double)objc_msgSend(v12, "integerValue") / 255.0;

        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (double)objc_msgSend(v14, "integerValue") / 255.0;

        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (double)objc_msgSend(v16, "integerValue") / 255.0;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v13, v15, v17, 1.0);
        v18 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v18;
      }

    }
  }

  return v4;
}

+ (id)colorFromHexStr:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;

  v3 = a3;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "hasPrefix:", CFSTR("#")))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("#"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCharactersToBeSkipped:", v5);

    objc_msgSend(v4, "scanHexInt:", &v8);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v8) / 255.0, (double)BYTE1(v8) / 255.0, (double)v8 / 255.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)interfaceStyleFromTheme:(id)a3 defaultInterfaceStyle:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (interfaceStyleFromTheme_defaultInterfaceStyle__onceToken != -1)
    dispatch_once(&interfaceStyleFromTheme_defaultInterfaceStyle__onceToken, &__block_literal_global_43);
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend((id)interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = objc_msgSend(v7, "unsignedIntegerValue");

    }
  }

  return a4;
}

void __62__VUIUtilities_interfaceStyleFromTheme_defaultInterfaceStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("light");
  v2[1] = CFSTR("dark");
  v3[0] = &unk_1EA0B9BF8;
  v3[1] = &unk_1EA0B9C10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap;
  interfaceStyleFromTheme_defaultInterfaceStyle__sTypeMap = v0;

}

+ (BOOL)isRemoteApp
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TVRemoteUIService"));
  return (char)v2;
}

+ (id)gradientLayerLocationsFromSpacings:(id)a3 height:(double)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  float v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = 0.0;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "floatValue", (_QWORD)v17);
        v11 = v11 + v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 / a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

+ (BOOL)isStoreOrPressDemoMode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VUIUtilities_isStoreOrPressDemoMode__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isStoreOrPressDemoMode_onceToken[0] != -1)
    dispatch_once(isStoreOrPressDemoMode_onceToken, block);
  return isStoreOrPressDemoMode_isInDemoMode;
}

uint64_t __38__VUIUtilities_isStoreOrPressDemoMode__block_invoke(uint64_t a1)
{
  char v1;
  uint64_t result;
  BOOL v3;
  char v4;
  Boolean keyExistsAndHasValidFormat;

  v1 = objc_msgSend(*(id *)(a1 + 32), "isInRetailDemoMode");
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("PressDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = (_DWORD)result == 0;
  else
    v3 = 1;
  if (v3)
    v4 = v1;
  else
    v4 = 1;
  isStoreOrPressDemoMode_isInDemoMode = v4;
  return result;
}

+ (CGRect)vuiRectCenteredXInRect:(CGRect)a3 boundsToCenterIn:(CGRect)a4 offset:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  VUIRoundValue();
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (BOOL)shouldPlayerTabsUseVerticalLayoutForSize:(CGSize)a3 isPhoneSizeClass:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v7;
  uint64_t v8;
  BOOL result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "orientation");

  result = 1;
  if (!+[VUIUtilities isPortraitIgnoringFlatOrientation:viewSize:](VUIUtilities, "isPortraitIgnoringFlatOrientation:viewSize:", v8, width, height)&& (!objc_msgSend(MEMORY[0x1E0DC69D0], "isPad") || !v4))
  {
    return 0;
  }
  return result;
}

@end
