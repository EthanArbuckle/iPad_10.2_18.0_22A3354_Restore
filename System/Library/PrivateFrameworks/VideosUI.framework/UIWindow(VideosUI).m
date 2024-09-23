@implementation UIWindow(VideosUI)

+ (double)_newNumColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;

  if (_newNumColumnsForGridStyle_gridType_sizeClass__onceToken != -1)
    dispatch_once(&_newNumColumnsForGridStyle_gridType_sizeClass__onceToken, &__block_literal_global_28_0);
  v8 = (void *)_newNumColumnsForGridStyle_gridType_sizeClass__sGridSpec;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 1.0;
  if ((unint64_t)(a3 - 21) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v11 = v16;

  }
  return v11;
}

+ (uint64_t)vui_paddingForWindowWidth:()VideosUI
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = objc_msgSend((id)objc_opt_class(), "vui_currentSizeClassForWindowWidth:", a1);
  objc_msgSend((id)objc_opt_class(), "_safeAreaInsetsForDeviceWithWindowWidth:", a1);
  return objc_msgSend((id)objc_opt_class(), "_paddingForSizeClass:safeArea:", v2, v3, v4, v5, v6);
}

+ (uint64_t)vui_currentSizeClassForWindowWidth:()VideosUI
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_opt_class(), "_safeAreaInsetsForDeviceWithWindowWidth:", a1);
  return objc_msgSend((id)objc_opt_class(), "_vui_currentSizeClassForWindowWidth:safeArea:", a1, v2, v3, v4, v5);
}

+ (uint64_t)_vui_currentSizeClassForWindowWidth:()VideosUI safeArea:
{
  double v9;

  if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isTV") & 1) != 0)
    return 8;
  v9 = a1 - (a3 + a5);
  if (v9 <= 374.0)
    return 1;
  if (v9 >= 375.0 && v9 <= 460.0)
    return 2;
  if (v9 >= 461.0 && v9 <= 726.0)
    return 3;
  if (v9 >= 727.0 && v9 <= 981.0)
    return 4;
  if (v9 >= 982.0 && v9 <= 1194.0)
    return 5;
  if (v9 >= 1195.0)
    return 6;
  return 0;
}

+ (id)vui_keyWindow
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v0 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v0 = 0;
    }
  }
  return v0;
}

+ (double)vui_padding
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  CGRect v7;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "vui_keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "vui_paddingForWindowWidth:", CGRectGetWidth(v7));
  v5 = v4;

  return v5;
}

+ (uint64_t)vui_numColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  return objc_msgSend((id)objc_opt_class(), "_newNumColumnsForGridStyle:gridType:sizeClass:", a3, a4, a5);
}

+ (uint64_t)vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:windowWidth:
{
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v10 = objc_msgSend((id)objc_opt_class(), "vui_currentSizeClassForWindowWidth:", a1);
  if (a4 == 20)
  {
    v11 = *MEMORY[0x1E0DC49E8];
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "vui_paddingForWindowWidth:", a1);
    v11 = v15;
    v12 = v16;
    v13 = v17;
    v14 = v18;
  }
  return objc_msgSend((id)objc_opt_class(), "_vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:sizeClass:padding:", a4, a5, a6, v10, a1, v11, v12, v13, v14);
}

+ (double)vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGRect v14;

  v9 = (void *)objc_opt_class();
  objc_msgSend(a1, "vui_keyWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", a3, a4, a5, CGRectGetWidth(v14));
  v12 = v11;

  return v12;
}

+ (uint64_t)vui_itemWidthForGridStyle:()VideosUI gridType:
{
  return objc_msgSend((id)objc_opt_class(), "vui_itemWidthForGridStyle:gridType:numGridColumns:", a3, a4, 1);
}

+ (uint64_t)vui_collectionInteritemSpace:()VideosUI gridType:windowWidth:
{
  uint64_t v6;

  v6 = objc_msgSend((id)objc_opt_class(), "vui_currentSizeClassForWindowWidth:", a1);
  return objc_msgSend((id)objc_opt_class(), "_vui_interitemSpaceForSizeClass:gridType:", v6, a5);
}

+ (double)vui_collectionInteritemSpace:()VideosUI gridType:
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGRect v12;

  v7 = (void *)objc_opt_class();
  objc_msgSend(a1, "vui_keyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "vui_collectionInteritemSpace:gridType:windowWidth:", a3, a4, CGRectGetWidth(v12));
  v10 = v9;

  return v10;
}

+ (double)_vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:windowWidth:sizeClass:padding:
{
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  objc_msgSend((id)objc_opt_class(), "_vui_interitemSpaceForSizeClass:gridType:", a11, a9);
  v19 = v18;
  objc_msgSend((id)objc_opt_class(), "vui_numColumnsForGridStyle:gridType:sizeClass:", a8, a9, a11);
  v21 = floor(v20 + 1.0);
  if (v20 - floor(v20) == 0.0)
    v22 = v20;
  else
    v22 = v21;
  return floor(v19 * (double)(a10 - 1) + (a1 - (a3 + a5) - (double)((unint64_t)v22 - 1) * v19)
                                       / v20
                                       * (double)a10);
}

+ (double)_vui_interitemSpaceForSizeClass:()VideosUI gridType:
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 7)
    return dbl_1DA1C1FF8[a3 - 1];
  return result;
}

+ (uint64_t)vui_paddingForSizeClass:()VideosUI
{
  return objc_msgSend((id)objc_opt_class(), "_paddingForSizeClass:safeArea:", a3, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

+ (uint64_t)vui_currentSizeClass
{
  void *v2;
  void *v3;
  uint64_t v4;
  CGRect v6;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "vui_keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = objc_msgSend(v2, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v6));

  return v4;
}

+ (uint64_t)vui_interfaceOrientation
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "windows");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

+ (double)_numColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;

  if (_numColumnsForGridStyle_gridType_sizeClass__onceToken != -1)
    dispatch_once(&_numColumnsForGridStyle_gridType_sizeClass__onceToken, &__block_literal_global_67);
  v8 = (void *)_numColumnsForGridStyle_gridType_sizeClass__sGridSpec;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 1.0;
  if ((unint64_t)(a3 - 21) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v11 = v16;

  }
  return v11;
}

+ (double)_OSXNumColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;

  if (_OSXNumColumnsForGridStyle_gridType_sizeClass__onceToken != -1)
    dispatch_once(&_OSXNumColumnsForGridStyle_gridType_sizeClass__onceToken, &__block_literal_global_32);
  v8 = (void *)_OSXNumColumnsForGridStyle_gridType_sizeClass__sGridSpec;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 1.0;
  if ((unint64_t)(a3 - 21) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v11 = v16;

  }
  return v11;
}

@end
