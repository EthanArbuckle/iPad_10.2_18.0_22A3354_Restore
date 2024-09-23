@implementation SKUIProductImageDataConsumer

+ (SKUIProductImageDataConsumer)consumerWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat *v14;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUIProductImageDataConsumer consumerWithSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  objc_msgSend(a1, "consumer");
  v14 = (CGFloat *)objc_claimAutoreleasedReturnValue();
  v14[2] = width;
  v14[3] = height;
  return (SKUIProductImageDataConsumer *)v14;
}

+ (id)gridConsumer
{
  int64x2_t *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "consumer");
  v2 = (int64x2_t *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer gridConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v2[1] = vdupq_n_s64(0x4052C00000000000uLL);
  return v2;
}

+ (id)lockupConsumerWithSize:(int64_t)a3 itemKind:(int64_t)a4
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIProductImageDataConsumer lockupConsumerWithSize:itemKind:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(a1, "consumer");
  v15 = objc_claimAutoreleasedReturnValue();
  *(double *)(v15 + 16) = SKUILockupImageSizeForLockupSize(a3, a4);
  *(_QWORD *)(v15 + 24) = v16;
  return (id)v15;
}

+ (id)cardConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer cardConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 64.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 72.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)chartsConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer chartsConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 64.0;
  if (v13 == 1)
    v14 = 67.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)updatesConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer updatesConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 57.0;
  if (v13 == 1)
    v14 = 72.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)purchasedConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer purchasedConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 57.0;
  if (v13 == 1)
    v14 = 72.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)productPageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer productPageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 100.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 170.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)swooshConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer swooshConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 72.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 90.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)giftComposeConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftComposeConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (int64x2_t *)objc_claimAutoreleasedReturnValue();
  v11[1] = vdupq_n_s64(0x4052C00000000000uLL);
  return v11;
}

+ (id)giftComposeLetterboxConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftComposeLetterboxConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (_OWORD *)objc_claimAutoreleasedReturnValue();
  v11[1] = xmmword_1BBED2A50;
  return v11;
}

+ (id)giftComposePosterConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftComposePosterConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = qword_1BBED2A60[(v13 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)giftThemeConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftThemeConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (int64x2_t *)objc_claimAutoreleasedReturnValue();
  v11[1] = vdupq_n_s64(0x404C800000000000uLL);
  return v11;
}

+ (id)giftThemeLetterboxConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftThemeLetterboxConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (_OWORD *)objc_claimAutoreleasedReturnValue();
  v11[1] = xmmword_1BBED2A70;
  return v11;
}

+ (id)giftThemePosterConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftThemePosterConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (int64x2_t *)objc_claimAutoreleasedReturnValue();
  v11[1] = vdupq_n_s64(0x404C800000000000uLL);
  return v11;
}

+ (id)giftResultConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer giftResultConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 72.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 144.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)smartBannerConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        +[SKUIProductImageDataConsumer smartBannerConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 64.0;
  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = 75.0;
  v11[2] = v14;
  v11[3] = v14;
  return v11;
}

+ (id)wishlistConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIProductImageDataConsumer wishlistConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "consumer");
  v11 = (int64x2_t *)objc_claimAutoreleasedReturnValue();
  v11[1] = vdupq_n_s64(0x4050000000000000uLL);
  return v11;
}

- (CGSize)imageSize
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double width;
  double height;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIProductImageDataConsumer imageSize].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)imageForColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductImageDataConsumer imageForColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductImageDataConsumer imageForColor:size:](self, "imageForColor:size:", v4, self->_iconSize.width, self->_iconSize.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  SKUIColorScheme *colorScheme;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[3];

  height = a4.height;
  width = a4.width;
  v41[2] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        -[SKUIProductImageDataConsumer imageForColor:size:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = 0;
  if (width > 0.0 && height > 0.0)
  {
    v40 = 0uLL;
    v39 = 0u;
    v38 = 0u;
    SKUIIconFrameForIconSize((double *)&v40, (double *)&v38, width, height, self->_iconSize.width, self->_iconSize.height, 0.0);
    colorScheme = self->_colorScheme;
    v36 = 0;
    v37 = 0;
    v35 = 0;
    SKUIIconColorsForColorScheme(colorScheme, &v37, &v36, &v35);
    v17 = v37;
    v18 = v36;
    v19 = v35;
    v20 = objc_retainAutorelease(v17);
    v41[0] = objc_msgSend(v20, "CGColor");
    v21 = objc_retainAutorelease(v18);
    v41[1] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBounds:", v38, v39);
    objc_msgSend(v23, "setColors:", v22);
    objc_msgSend(v23, "setLocations:", &unk_1E749BB48);
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    objc_msgSend(v24, "setScale:");

    v26 = objc_alloc(MEMORY[0x1E0DC3828]);
    v27 = (void *)objc_msgSend(v26, "initWithSize:format:", v24, v40);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __51__SKUIProductImageDataConsumer_imageForColor_size___block_invoke;
    v30[3] = &unk_1E73A94E0;
    v32 = v40;
    v33 = v38;
    v34 = v39;
    v30[4] = self;
    v31 = v23;
    v28 = v23;
    objc_msgSend(v27, "imageWithActions:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __51__SKUIProductImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v5)
    objc_msgSend(v5, "setFill");
  objc_msgSend(v6, "clipToRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v6, "fillRect:", 0.0, 0.0, v3, v4);
  objc_msgSend(*(id *)(a1 + 40), "renderInContext:", objc_msgSend(v6, "CGContext"));

}

- (id)imageForImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  SKUIColorScheme *colorScheme;
  id v16;
  BOOL v17;
  void *v18;
  CGFloat v19;
  UIColor *backgroundColor;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  CGSize v26;
  CGRect v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductImageDataConsumer imageForImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v26.width = 0.0;
  v26.height = 0.0;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "size");
  SKUIIconFrameForIconSize(&v26.width, (double *)&v24, v13, v14, self->_iconSize.width, self->_iconSize.height, 0.0);
  colorScheme = self->_colorScheme;
  v23 = 0;
  SKUIIconColorsForColorScheme(colorScheme, 0, 0, &v23);
  v16 = v23;
  v17 = self->_backgroundColor != 0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  UIGraphicsBeginImageContextWithOptions(v26, v17, v19);

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    -[UIColor set](backgroundColor, "set");
    v27.size.width = v26.width;
    v27.size.height = v26.height;
    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    UIRectFill(v27);
  }
  objc_msgSend(v4, "drawInRect:", v24, v25);
  UIGraphicsGetImageFromCurrentImageContext();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductImageDataConsumer copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v13 + 8), self->_backgroundColor);
  objc_storeStrong((id *)(v13 + 32), self->_colorScheme);
  *(CGSize *)(v13 + 16) = self->_iconSize;
  return (id)v13;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (void)consumerWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)gridConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)lockupConsumerWithSize:(uint64_t)a3 itemKind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)cardConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)chartsConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)updatesConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)purchasedConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)productPageConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)swooshConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftComposeConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftComposeLetterboxConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftComposePosterConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftThemeConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftThemeLetterboxConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftThemePosterConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)giftResultConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)smartBannerConsumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)wishlistConsumer
{
  OUTLINED_FUNCTION_1();
}

- (void)imageSize
{
  OUTLINED_FUNCTION_1();
}

- (void)imageForColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)imageForColor:(uint64_t)a3 size:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
