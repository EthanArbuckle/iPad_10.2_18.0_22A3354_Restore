@implementation SKUIStyledImageDataConsumer

+ (id)appIconConsumerWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        +[SKUIStyledImageDataConsumer(SKUILegacy) appIconConsumerWithSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 1, width, height);
}

+ (id)applePackIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) applePackIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 36.0;
  if (v12 == 1)
    v13 = 47.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)brickConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) brickConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
  {
    v13 = 103.0;
    v14 = 210.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

    if (v17 <= 375.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;

      v13 = 100.0;
      if (v20 <= 320.0)
        v13 = 78.0;
      v14 = dbl_1BBED1950[v20 > 320.0];
    }
    else
    {
      v13 = 86.0;
      v14 = 175.0;
    }
  }
  objc_msgSend(a1, "brickConsumerWithBrickSize:", v14, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)brickConsumerWithBrickSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUIStyledImageDataConsumer(SKUILegacy) brickConsumerWithBrickSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 2, width, height);
}

+ (id)cardIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) cardIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 72.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cardProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) cardProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 72.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)categoryIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) categoryIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 33.0, 33.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftComposeProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftComposeProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 75.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftResultIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftResultIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 72.0;
  if (v12 == 1)
    v13 = 144.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftResultProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftResultProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 72.0;
  if (v12 == 1)
    v13 = 144.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftThemeIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftThemeIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)giftThemeProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftThemeProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)gridIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) gridIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 75.0, 75.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)listIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) listIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)lockupIconConsumerWithSize:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIStyledImageDataConsumer(SKUILegacy) lockupIconConsumerWithSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", SKUILockupImageSizeForLockupSize(a3, 12));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)lockupProductImageConsumerWithSize:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIStyledImageDataConsumer(SKUILegacy) lockupProductImageConsumerWithSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(a1, "productImageConsumerWithSize:", SKUILockupImageSizeForLockupSize(a3, 12));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mixedTopChartsNewsstandConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) mixedTopChartsNewsstandConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 67.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newsstandRoomNewsstandConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) newsstandRoomNewsstandConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom") == 1;

  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1BBED1960[v12], dbl_1BBED1970[v12]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newsstandSwooshNewsstandConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) newsstandSwooshNewsstandConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 107.0;
  if (v12 != 1)
    v13 = 100.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1BBED1980[v12 == 1], v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)parentBundleIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) parentBundleIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 72.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)productImageConsumerWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        +[SKUIStyledImageDataConsumer(SKUILegacy) productImageConsumerWithSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 5, width, height);
}

+ (id)productPageProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) productPageProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 100.0;
  if (v12 == 1)
    v13 = 170.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)purchasedIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) purchasedIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)purchasedProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) purchasedProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 57.0;
  if (v12 == 1)
    v13 = 72.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)roomIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) roomIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 75.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)roomProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) roomProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 75.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)safariBannerIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) safariBannerIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "roomIconConsumer");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)safariBannerProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) safariBannerProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "roomProductImageConsumer");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shareSheetIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) shareSheetIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 100.0, 100.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)swooshNewsstandConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) swooshNewsstandConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 200.0;
  if (v12 != 1)
    v13 = 107.0;
  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1BBED1990[v12 == 1], v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)topChartsIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) topChartsIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 64.0;
  if (v12 == 1)
    v13 = 75.0;
  objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)topChartsNewsstandConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) topChartsNewsstandConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom") == 1;

  objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1BBED1960[v12], dbl_1BBED1970[v12]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updatesIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) updatesIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updatesProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) updatesProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)wishlistIconConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) wishlistIconConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)wishlistProductImageConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) wishlistProductImageConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(a1, "productImageConsumerWithSize:", 64.0, 64.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)manageMessagesConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) manageMessagesConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 29.0, 22.0);
}

+ (id)categoriesMessagesConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) categoriesMessagesConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 35.0, 26.0);
}

+ (id)purchasedMessagesConsumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIStyledImageDataConsumer(SKUILegacy) purchasedMessagesConsumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 64.0, 48.0);
}

+ (BOOL)isImageCompressionEnabled
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUIStyledImageDataConsumer isImageCompressionEnabled].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (isImageCompressionEnabled_onceToken != -1)
    dispatch_once(&isImageCompressionEnabled_onceToken, &__block_literal_global_25);
  return isImageCompressionEnabled_isImageCompressionEnabled;
}

uint64_t __56__SKUIStyledImageDataConsumer_isImageCompressionEnabled__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("SKUIImageCompressionEnabled"), (CFStringRef)*MEMORY[0x1E0DAFE10], 0);
  isImageCompressionEnabled_isImageCompressionEnabled = (_DWORD)result != 0;
  return result;
}

- (SKUIStyledImageDataConsumer)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIStyledImageDataConsumer *v11;
  SKUIStyledImageDataConsumer *v12;
  uint64_t v13;
  UITraitCollection *startingTraitCollection;
  objc_super v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIStyledImageDataConsumer init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStyledImageDataConsumer;
  v11 = -[SKUIStyledImageDataConsumer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_imageContentMode = 0;
    objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
    v13 = objc_claimAutoreleasedReturnValue();
    startingTraitCollection = v12->_startingTraitCollection;
    v12->_startingTraitCollection = (UITraitCollection *)v13;

  }
  return v12;
}

- (SKUIStyledImageDataConsumer)initWithSize:(CGSize)a3 treatment:(int64_t)a4
{
  double height;
  double width;
  SKUIStyledImageDataConsumer *v7;
  void *v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SKUIStyledImageDataConsumer;
  v7 = -[SKUIStyledImageDataConsumer init](&v10, sel_init);
  if (v7)
  {
    if ((unint64_t)a4 <= 0xF && ((1 << a4) & 0x8026) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStyledImageDataConsumer setBorderColor:](v7, "setBorderColor:", v8);

      -[SKUIStyledImageDataConsumer setBorderWidths:](v7, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
    }
    -[SKUIStyledImageDataConsumer setImageSize:](v7, "setImageSize:", width, height);
    -[SKUIStyledImageDataConsumer setImageTreatment:](v7, "setImageTreatment:", a4);
    -[SKUIStyledImageDataConsumer setImageContentMode:](v7, "setImageContentMode:", 0);
  }
  return v7;
}

- (SKUIStyledImageDataConsumer)initWithViewElement:(id)a3
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
  SKUIStyledImageDataConsumer *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  IKColor *iKBackgroundColor;
  void *v21;
  uint64_t v22;
  UIColor *backgroundColor;
  void *v24;
  unint64_t imageTreatment;
  UIEdgeInsets *p_borderWidths;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  uint64_t v38;
  UIColor *borderColor;
  UIColor *v40;
  void *v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  uint64_t v47;
  UIColor *v48;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  uint64_t v54;
  UIColor *shadowColor;
  CGFloat v56;
  CGFloat v57;
  double v58;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStyledImageDataConsumer initWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIStyledImageDataConsumer init](self, "init");
  if (v13)
  {
    objc_msgSend(v4, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_imageContentMode = objc_msgSend(v14, "fillImage") == 1;
    objc_msgSend(v14, "elementPadding");
    v13->_imagePadding.top = v15;
    v13->_imagePadding.left = v16;
    v13->_imagePadding.bottom = v17;
    v13->_imagePadding.right = v18;
    objc_msgSend(v14, "ikBackgroundColor");
    v19 = objc_claimAutoreleasedReturnValue();
    iKBackgroundColor = v13->_iKBackgroundColor;
    v13->_iKBackgroundColor = (IKColor *)v19;

    objc_msgSend(v14, "ikBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "color");
    v22 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v13->_backgroundColor;
    v13->_backgroundColor = (UIColor *)v22;

    objc_msgSend(v14, "imageTreatment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_imageTreatment = SKUIImageTreatmentForString(v24);

    imageTreatment = v13->_imageTreatment;
    if (imageTreatment <= 0x10)
    {
      if (((1 << imageTreatment) & 0x10026) != 0)
      {
        p_borderWidths = &v13->_borderWidths;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v13->_borderWidths.top = _Q0;
        v13->_borderWidths.bottom = 1.0;
        v32 = 1.0;
LABEL_9:
        p_borderWidths->right = v32;
        objc_msgSend(v14, "borderMargins");
        v13->_borderMargins.top = v33;
        v13->_borderMargins.left = v34;
        v13->_borderMargins.bottom = v35;
        v13->_borderMargins.right = v36;
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v13->_borderWidths.top, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(*(float64x2_t *)&v13->_borderWidths.bottom, *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) == 0)
        {
          objc_msgSend(v14, "ikBorderColor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "color");
          v38 = objc_claimAutoreleasedReturnValue();
          borderColor = v13->_borderColor;
          v13->_borderColor = (UIColor *)v38;

          if (!v13->_borderColor)
          {
            v40 = v13->_backgroundColor;
            if (v40)
            {
              switch(SKUIColorSchemeStyleForColor(v40))
              {
                case 0:
                case 2:
                  goto LABEL_13;
                case 1:
                case 3:
                  v41 = (void *)MEMORY[0x1E0DC3658];
                  v42 = 0.15;
                  v43 = 1.0;
                  goto LABEL_18;
                default:
                  break;
              }
            }
            else
            {
LABEL_13:
              v41 = (void *)MEMORY[0x1E0DC3658];
              v42 = 0.2;
              v43 = 0.0;
LABEL_18:
              objc_msgSend(v41, "colorWithWhite:alpha:", v43, v42);
              v47 = objc_claimAutoreleasedReturnValue();
              v48 = v13->_borderColor;
              v13->_borderColor = (UIColor *)v47;

            }
          }
          objc_msgSend(v14, "borderRadius");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "edgeInsetsValue");
          v13->_borderRadii.top = v50;
          v13->_borderRadii.left = v51;
          v13->_borderRadii.bottom = v52;
          v13->_borderRadii.right = v53;

        }
        objc_msgSend(v4, "shadowColor");
        v54 = objc_claimAutoreleasedReturnValue();
        shadowColor = v13->_shadowColor;
        v13->_shadowColor = (UIColor *)v54;

        objc_msgSend(v4, "shadowOffset");
        v13->_shadowOffset.width = v56;
        v13->_shadowOffset.height = v57;
        objc_msgSend(v4, "shadowRadius");
        v13->_shadowRadius = v58;

        goto LABEL_21;
      }
      if (imageTreatment == 3)
      {
        p_borderWidths = &v13->_borderWidths;
        v13->_borderWidths.top = 0.0;
        v13->_borderWidths.left = 0.0;
        v13->_borderWidths.bottom = 1.0;
        v32 = 0.0;
        goto LABEL_9;
      }
    }
    p_borderWidths = &v13->_borderWidths;
    objc_msgSend(v14, "borderWidths");
    v13->_borderWidths.top = v44;
    v13->_borderWidths.left = v45;
    v13->_borderWidths.bottom = v46;
    goto LABEL_9;
  }
LABEL_21:

  return v13;
}

- (id)imageForColor:(id)a3
{
  return -[SKUIStyledImageDataConsumer imageForColor:size:](self, "imageForColor:size:", a3, self->_imageSize.width, self->_imageSize.height);
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v10;
  _QWORD v12[4];
  id v13;
  SKUIStyledImageDataConsumer *v14;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    v10 = 0;
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__SKUIStyledImageDataConsumer_imageForColor_size___block_invoke;
    v12[3] = &unk_1E73A4EA0;
    v13 = v7;
    v14 = self;
    -[SKUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v12, width, height, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __50__SKUIStyledImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v9;
  CGRect v10;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "set");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_defaultPlaceholderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set");

  }
  v10.origin.x = a2;
  v10.origin.y = a3;
  v10.size.width = a4;
  v10.size.height = a5;
  UIRectFill(v10);
}

- (id)imageForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__SKUIStyledImageDataConsumer_imageForImage___block_invoke;
  v14[3] = &unk_1E73A4EC8;
  v15 = v4;
  width = self->_imageSize.width;
  height = self->_imageSize.height;
  v11 = v4;
  -[SKUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v14, v6, v8, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __45__SKUIStyledImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (BOOL)isImagePlaceholderAvailable
{
  unint64_t imageTreatment;
  double top;
  double left;
  double bottom;
  double right;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  imageTreatment = self->_imageTreatment;
  if (imageTreatment > 0x10)
    return 0;
  if (((1 << imageTreatment) & 0x1CD06) != 0)
    return 1;
  if (((1 << imageTreatment) & 0xA9) == 0)
    return 0;
  top = self->_borderWidths.top;
  left = self->_borderWidths.left;
  bottom = self->_borderWidths.bottom;
  right = self->_borderWidths.right;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIStyledImageDataConsumer isImagePlaceholderAvailable].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = left == right;
  if (top != bottom)
    v16 = 0;
  return left == top && v16;
}

- (id)imagePlaceholderForColor:(id)a3
{
  UIColor *v4;
  SKUIImagePlaceholder *v5;
  SKUIImagePlaceholder *v6;
  UIColor *v7;
  CGFloat v8;
  void *v9;
  SKUIImagePlaceholder *v10;
  UIColor *v11;
  UIColor *v12;
  double v13;
  double top;
  double left;
  double bottom;
  double right;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  SKUIImagePlaceholder *v28;
  UIColor *borderColor;
  double v30;
  UIColor *v31;
  SKUIImagePlaceholder *v33;
  UIColor *v34;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    -[SKUIStyledImageDataConsumer _defaultPlaceholderColor](self, "_defaultPlaceholderColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v5 = 0;
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      top = self->_borderWidths.top;
      left = self->_borderWidths.left;
      bottom = self->_borderWidths.bottom;
      right = self->_borderWidths.right;
      if (os_variant_has_internal_content())
      {
        if (_os_feature_enabled_impl())
        {
          v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
          if (v18)
            -[SKUIStyledImageDataConsumer isImagePlaceholderAvailable].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
      if (left == right && top == bottom && left == top)
      {
        v28 = [SKUIImagePlaceholder alloc];
        borderColor = self->_borderColor;
        v30 = self->_borderWidths.left;
        v31 = v4;
        goto LABEL_20;
      }
      v5 = 0;
      break;
    case 1:
    case 2:
    case 0xALL:
    case 0xBLL:
    case 0xFLL:
    case 0x10:
      v6 = [SKUIImagePlaceholder alloc];
      v7 = self->_borderColor;
      v8 = self->_borderWidths.top;
      -[SKUIStyledImageDataConsumer _placeholderCornerPathBlock](self, "_placeholderCornerPathBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      v11 = v4;
      v12 = v7;
      v13 = v8;
      goto LABEL_5;
    case 8:
      v28 = [SKUIImagePlaceholder alloc];
      v30 = 0.0;
      v31 = v4;
      borderColor = 0;
LABEL_20:
      v5 = -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerRadius:](v28, "initWithBackgroundColor:borderColor:borderWidth:cornerRadius:", v31, borderColor, v30, 0.0);
      break;
    case 0xELL:
      v33 = [SKUIImagePlaceholder alloc];
      v34 = self->_borderColor;
      -[SKUIStyledImageDataConsumer _placeholderCornerPathBlock](self, "_placeholderCornerPathBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0.0;
      v10 = v33;
      v11 = v34;
      v12 = 0;
LABEL_5:
      v5 = -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:](v10, "initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:", v11, v12, v9, v13);

      break;
    default:
      break;
  }

  return v5;
}

- (id)_placeholderCornerPathBlock
{
  void *v3;
  id result;
  CGFloat top;
  _QWORD aBlock[5];

  v3 = 0;
  switch(self->_imageTreatment)
  {
    case 1:
      result = &__block_literal_global_9;
      break;
    case 2:
      result = &__block_literal_global_11;
      break;
    case 0xALL:
    case 0xBLL:
      result = &__block_literal_global_12;
      break;
    case 0xELL:
      top = self->_borderRadii.top;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4;
      aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
      *(CGFloat *)&aBlock[4] = top;
      v3 = _Block_copy(aBlock);
      goto LABEL_8;
    case 0xFLL:
      result = &__block_literal_global_13;
      break;
    case 0x10:
      result = &__block_literal_global_14;
      break;
    default:
LABEL_8:
      result = v3;
      break;
  }
  return result;
}

id __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke(double a1, double a2, double a3, double a4)
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if (a4 >= a3)
    v16 = a4;
  else
    v16 = a3;
  objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, v16 / 57.0 * 13.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_2(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 10.0);
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:");
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_5(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, CGRectGetHeight(*(CGRect *)&a1) * 0.5);
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_6(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 6.0);
}

- (BOOL)_backgroundIsOpaque
{
  UIColor *backgroundColor;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    LOBYTE(backgroundColor) = CGColorGetAlpha(-[UIColor CGColor](backgroundColor, "CGColor")) == 1.0;
  return (char)backgroundColor;
}

- (id)_defaultPlaceholderColor
{
  UIColor *backgroundColor;
  UIColor *v4;
  float v5;
  void *v6;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    switch(SKUIColorSchemeStyleForColor(backgroundColor))
    {
      case 0:
      case 2:
        v4 = self->_backgroundColor;
        v5 = -0.2;
        goto LABEL_6;
      case 1:
      case 3:
        v4 = self->_backgroundColor;
        v5 = 0.15;
LABEL_6:
        SKUIColorByAdjustingBrightness(v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v6 = 0;
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_drawBordersWithImageRect:(CGRect)a3 bounds:(CGRect)a4
{
  UIColor *borderColor;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double bottom;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double left;
  double v29;
  double rect;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  borderColor = self->_borderColor;
  if (borderColor)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v10 = a3.size.height;
    v11 = a3.size.width;
    v12 = a3.origin.y;
    v13 = a3.origin.x;
    -[UIColor set](borderColor, "set");
    if (x >= v13)
      v14 = x;
    else
      v14 = v13;
    rect = v14;
    if (y < v12)
      y = v12;
    if (height >= v10)
      v15 = v10;
    else
      v15 = height;
    if (width >= v11)
      v16 = v11;
    else
      v16 = width;
    v29 = v16;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;

    left = self->_borderWidths.left;
    v20 = self->_borderWidths.top / v19;
    bottom = self->_borderWidths.bottom;
    v22 = self->_borderWidths.right / v19;
    if (v20 > 0.00000011920929)
    {
      v31.size.width = v29;
      v31.origin.x = rect;
      v31.origin.y = y;
      v31.size.height = self->_borderWidths.top / v19;
      UIRectFillUsingBlendMode(v31, kCGBlendModeNormal);
    }
    v23 = y + v20;
    v24 = v15;
    v25 = v15 - v20;
    v26 = bottom / v19;
    if (v22 > 0.00000011920929)
    {
      v32.origin.x = rect + v29 - v22;
      v32.size.height = v25 - v26;
      v32.origin.y = v23;
      v32.size.width = v22;
      UIRectFillUsingBlendMode(v32, kCGBlendModeNormal);
    }
    v27 = left / v19;
    if (v26 > 0.00000011920929)
    {
      v33.origin.y = y + v24 - v26;
      v33.size.width = v29;
      v33.origin.x = rect;
      v33.size.height = v26;
      UIRectFillUsingBlendMode(v33, kCGBlendModeNormal);
    }
    if (v27 > 0.00000011920929)
    {
      v34.size.height = v25 - v26;
      v34.origin.x = rect;
      v34.origin.y = v23;
      v34.size.width = v27;
      UIRectFillUsingBlendMode(v34, kCGBlendModeNormal);
    }
  }
}

- (id)_outputImageWithInputSize:(CGSize)a3 outputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double x;
  double y;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGSize *p_shadowOffset;
  double v81;
  CGFloat v82;
  double shadowRadius;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  void *v88;
  double v89;
  CGFloat v90;
  CGContext *CurrentContext;
  double v92;
  CGColor *v93;
  uint64_t v94;
  CGFloat top;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  CGFloat right;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  CGSize v113;
  CGSize v114;
  CGRect v115;
  CGRect v116;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v10 = a5;
  v11 = (void *)MEMORY[0x1BCCE6C7C]();
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      right = self->_imagePadding.right;
      v101 = *(_OWORD *)&self->_imagePadding.left;
      top = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      goto LABEL_3;
    case 1:
      v108 = self->_imagePadding.right;
      v102 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      x = v28;
      y = v29;
      v23 = v30;
      v24 = v31;
      if (os_variant_has_internal_content())
      {
        if (_os_feature_enabled_impl())
        {
          v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
          if (v32)
            __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      if (v24 >= v23)
        v40 = v24;
      else
        v40 = v23;
      v26 = v40 / 57.0 * 13.5;
      goto LABEL_16;
    case 2:
      v109 = self->_imagePadding.right;
      v103 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      *(double *)&v49 = 10.0;
      goto LABEL_28;
    case 4:
      v110 = self->_imagePadding.right;
      v104 = *(_OWORD *)&self->_imagePadding.left;
      v97 = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      -[SKUIStyledImageDataConsumer _leftToRightGradient:contentRect:drawBlock:](self, "_leftToRightGradient:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v50, v51, v52, v53, *(_QWORD *)&v97, v104, *(_QWORD *)&v110);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 6:
      v111 = self->_imagePadding.right;
      v105 = *(_OWORD *)&self->_imagePadding.left;
      v98 = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      -[SKUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v54, v55, v56, v57, *(_QWORD *)&v98, v105, *(_QWORD *)&v111);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "imageWithRenderingMode:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 8:
      -[SKUIStyledImageDataConsumer _dynamicUberImageWithBounds:inputSize:drawBlock:](self, "_dynamicUberImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 9:
      -[SKUIStyledImageDataConsumer _uberBannerImageWithBounds:inputSize:drawBlock:](self, "_uberBannerImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0xALL:
    case 0xBLL:
      v108 = self->_imagePadding.right;
      v102 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      x = v115.origin.x;
      y = v115.origin.y;
      v23 = v115.size.width;
      v24 = v115.size.height;
      v25 = CGRectGetWidth(v115) * 0.5;
      v116.origin.x = x;
      v116.origin.y = y;
      v116.size.width = v23;
      v116.size.height = v24;
      v26 = CGRectGetHeight(v116) * 0.5;
      if (v25 >= v26)
        v26 = v25;
LABEL_16:
      -[SKUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, x, y, v23, v24, *(_QWORD *)&v26, v102, *(_QWORD *)&v108);
      goto LABEL_30;
    case 0xCLL:
      right = self->_imagePadding.right;
      v101 = *(_OWORD *)&self->_imagePadding.left;
      top = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      v13 = v59;
      v15 = v60;
      v17 = v61;
      v19 = v62;
      goto LABEL_24;
    case 0xDLL:
      width = v8 + self->_imagePadding.left + self->_imagePadding.right;
      height = v7 + self->_imagePadding.top + self->_imagePadding.bottom;
      v101 = *(_OWORD *)&self->_imagePadding.left;
      right = self->_imagePadding.right;
      top = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      v13 = v63;
      v15 = v64;
      v17 = v65;
      v19 = v66;
      if (self->_imagePadding.bottom < 0.00000011920929)
      {
LABEL_3:
        -[SKUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v13, v15, v17, v19, *(_QWORD *)&top, v101, *(_QWORD *)&right);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_24:
        -[SKUIStyledImageDataConsumer _radialBlurImageWithBounds:contentRect:drawBlock:](self, "_radialBlurImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v13, v15, v17, v19, *(_QWORD *)&top, v101, *(_QWORD *)&right);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_31;
    case 0xELL:
      v112 = self->_borderWidths.right;
      v106 = *(_OWORD *)&self->_borderWidths.left;
      v99 = self->_borderWidths.top;
      SKUIImageRectForBoundsAndPadding();
      -[SKUIStyledImageDataConsumer _roundedBorderWithBounds:contentRect:drawBlock:](self, "_roundedBorderWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v67, v68, v69, v70, *(_QWORD *)&v99, v106, *(_QWORD *)&v112);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 0xFLL:
      v109 = self->_imagePadding.right;
      v103 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      v42 = v71;
      v44 = v72;
      v46 = v73;
      v48 = v74;
      v100 = v74 * 0.5;
      goto LABEL_29;
    case 0x10:
      v109 = self->_imagePadding.right;
      v103 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      v42 = v75;
      v44 = v76;
      v46 = v77;
      v48 = v78;
      *(double *)&v49 = 6.0;
LABEL_28:
      v100 = *(double *)&v49;
LABEL_29:
      -[SKUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, v42, v44, v46, v48, *(_QWORD *)&v100, v103, *(_QWORD *)&v109);
LABEL_30:
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_31:
      v27 = (void *)v20;
      break;
    default:
      v27 = 0;
      break;
  }
  p_shadowOffset = &self->_shadowOffset;
  if (self->_shadowOffset.width != *MEMORY[0x1E0C9D820]
    || self->_shadowOffset.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v27, "size");
    v82 = v81 + (fabs(p_shadowOffset->width) + self->_shadowRadius) * 2.0;
    objc_msgSend(v27, "size");
    shadowRadius = self->_shadowRadius;
    v84 = fabs(self->_shadowOffset.height) + shadowRadius;
    v86 = v85 + v84 * 2.0;
    v87 = shadowRadius + fabs(p_shadowOffset->width);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "scale");
    v90 = v89;
    v113.width = v82;
    v113.height = v86;
    UIGraphicsBeginImageContextWithOptions(v113, 0, v90);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
    v92 = self->_shadowRadius;
    v93 = -[UIColor CGColor](self->_shadowColor, "CGColor");
    v114.width = p_shadowOffset->width;
    v114.height = self->_shadowOffset.height;
    CGContextSetShadowWithColor(CurrentContext, v114, v92, v93);
    objc_msgSend(v27, "drawAtPoint:", v87, v84);
    UIGraphicsGetImageFromCurrentImageContext();
    v94 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v27 = (void *)v94;
  }
  objc_autoreleasePoolPop(v11);

  return v27;
}

- (id)_imageWithSize:(CGSize)a3 isOpaque:(BOOL)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  void (**v8)(id, _QWORD);
  void *v9;
  double v10;
  CGFloat v11;
  uint64_t HasASTCSupport;
  uint64_t v13;
  void *v14;
  CGSize v16;

  height = a3.height;
  width = a3.width;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  v16.width = width;
  v16.height = height;
  UIGraphicsBeginImageContextWithOptions(v16, a4, v11);
  if (!+[SKUIStyledImageDataConsumer isImageCompressionEnabled](SKUIStyledImageDataConsumer, "isImageCompressionEnabled"))
  {
    v8[2](v8, 0);
    goto LABEL_5;
  }
  HasASTCSupport = SKUIGraphicsDeviceHasASTCSupport();
  v8[2](v8, HasASTCSupport);
  if (!(_DWORD)HasASTCSupport)
  {
LABEL_5:
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  SKUIGraphicsGetASTCImageFromCurrentImageContext(v11);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v14 = (void *)v13;
  UIGraphicsEndImageContext();

  return v14;
}

- (id)_arcRoundedImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 cornerRadius:(double)a5 drawBlock:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__SKUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke;
  v18[3] = &unk_1E73A4FD0;
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  v24 = a5;
  v14 = v13;
  v18[4] = self;
  v19 = v14;
  -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", 0, v18, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    objc_msgSend(v16, "setCornerRadius:", a5);
    objc_msgSend(v16, "setCornerType:", 1);
    if (self->_borderColor)
    {
      objc_msgSend(v16, "setBorderColor:");
      objc_msgSend(v16, "setBorderWidth:", 1.0);
    }

  }
  return v15;
}

void __93__SKUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineWidth:", 1.0);
  objc_msgSend(v5, "addClip");
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    if (v4)
    {
      objc_msgSend(v4, "set");
      objc_msgSend(v5, "strokeWithBlendMode:alpha:", 0, 1.0);
    }
  }

}

- (id)_scaledImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  v15 = -[SKUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__SKUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_1E73A4FF8;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v19[4] = self;
  v20 = v14;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v16 = v14;
  -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __76__SKUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "set");
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  return objc_msgSend(*(id *)(a1 + 32), "_drawBordersWithImageRect:bounds:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)_radialBlurImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  v15 = -[SKUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__SKUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_1E73A4FF8;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v19[4] = self;
  v20 = v14;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v16 = v14;
  -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __80__SKUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v9;
  double v10;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  CGGradient *v13;
  float v14;
  double v15;
  uint64_t v16;
  float64x2_t *v17;
  float64x2_t *v18;
  float64x2_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  CGFloat v26;
  float v27;
  CGFloat components[4];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat locations[2];
  uint64_t v36;
  __int128 v37;
  _OWORD v38[4];
  uint64_t v39;
  CGPoint v40;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "set");
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v3)
  {
    v37 = 0u;
    memset(v38, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    v38[3] = _Q0;
    objc_msgSend(v3, "getRed:green:blue:alpha:", &v37, (char *)&v37 + 8, v38, 0);
    *(_OWORD *)((char *)&v38[1] + 8) = v37;
    *((_QWORD *)&v38[2] + 1) = *(_QWORD *)&v38[0];
    v10 = *(double *)(a1 + 64);
    v9 = *(double *)(a1 + 72);
    *(_OWORD *)locations = xmmword_1BBED1CE8;
    v36 = 0x3FF0000000000000;
    *(_OWORD *)components = v37;
    components[2] = *(CGFloat *)v38;
    components[3] = 0.0;
    v29 = v37;
    v30 = *(_QWORD *)&v38[0];
    v31 = 0x3FE3333340000000;
    v32 = v37;
    v33 = *(_QWORD *)&v38[0];
    v34 = 0x3FF0000000000000;
    CurrentContext = UIGraphicsGetCurrentContext();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v13 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 3uLL);
    v14 = v10 * 0.25;
    v15 = ceilf(v14);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = (float64x2_t *)(v16 + 200);
    v18 = (float64x2_t *)(v16 + 168);
    v19 = *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = -0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v17, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(v17[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)v20 = v17[1].f64[0];
    v21 = v20 + v15;
    v22 = 0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v18, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(v18[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)v22 = v18[1].f64[0];
    v23 = v21 - v22;
    v24 = v10 * 0.5;
    v40.x = floorf(v24);
    v25 = v10 * 1.70000005;
    v26 = ceilf(v25);
    v27 = v10 * 1.89999998;
    v40.y = v9 - v26 - v23;
    CGContextDrawRadialGradient(CurrentContext, v13, v40, v26, v40, ceilf(v27), 2u);
    CGColorSpaceRelease(DeviceRGB);
    CGGradientRelease(v13);
  }
}

- (id)_roundedBorderWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  v15 = -[SKUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__SKUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_1E73A4FF8;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __78__SKUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  double Width;
  double v3;
  double Height;
  double v5;
  double v6;
  CGFloat v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(*(_QWORD *)(a1 + 32) + 8));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setFill");
  objc_msgSend(v8, "fill");
  Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  v3 = floor((Width - CGRectGetWidth(*(CGRect *)(a1 + 80))) * 0.5);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  v5 = floor((Height - CGRectGetHeight(*(CGRect *)(a1 + 80))) * 0.5);
  v6 = CGRectGetWidth(*(CGRect *)(a1 + 80));
  v7 = CGRectGetHeight(*(CGRect *)(a1 + 80));
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v3, v5, v6, v7);

}

- (id)_uberBannerImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  CGFloat y;
  CGFloat x;
  id v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;

  height = a4.height;
  width = a4.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = -[SKUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SKUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke;
  v17[3] = &unk_1E73A5020;
  v19 = x;
  v20 = y;
  v21 = v8;
  v22 = v7;
  v23 = width;
  v24 = height;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v13, v17, v8, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __78__SKUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  CGContext *CurrentContext;
  double v4;
  double v5;
  double v6;
  CGColorSpace *DeviceRGB;
  CGGradient *v8;
  double MidX;
  CGFloat v10;
  CGFloat v11;
  float v12;
  CGContext *v13;
  double v14;
  float v15;
  double v16;
  float v17;
  _OWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  CGFloat locations[3];
  uint64_t v23;
  CGPoint v24;
  CGPoint v25;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "set");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));
    v5 = *(double *)(a1 + 80);
    v4 = *(double *)(a1 + 88);
    v6 = *(double *)(a1 + 72);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      *(_OWORD *)locations = xmmword_1BBED1340;
      memset(v19, 0, sizeof(v19));
      v20 = 0;
      v21 = 0x3FF0000000000000;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v8 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v19, locations, 2uLL);
      CGColorSpaceRelease(DeviceRGB);
      MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
      v10 = MidX + CGRectGetWidth(*(CGRect *)(a1 + 48)) * -0.25;
      v11 = CGRectGetMidY(*(CGRect *)(a1 + 48)) + 40.0;
      v12 = *(double *)(a1 + 64) * 0.9;
      v13 = UIGraphicsGetCurrentContext();
      v24.x = v10;
      v24.y = v11;
      v25.x = v10;
      v25.y = v11;
      CGContextDrawRadialGradient(v13, v8, v24, 0.0, v25, v12, 2u);
      CGGradientRelease(v8);
    }
  }
  else
  {
    v5 = *(double *)(a1 + 80);
    v4 = *(double *)(a1 + 88);
    v6 = *(double *)(a1 + 72);
  }
  v14 = (double)(int)(v6 + -8.0 + -8.0);
  v15 = (v6 - v14) * 0.5;
  v16 = floorf(v15);
  v17 = v5 * (v14 / v4);
  return (*(uint64_t (**)(double, double, double))(*(_QWORD *)(a1 + 40) + 16))(15.0, v16, ceilf(v17));
}

- (id)_dynamicUberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  height = a4.height;
  width = a4.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35[2] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->_startingTraitCollection, "userInterfaceLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3E88];
  v35[0] = v13;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollectionWithTraitsFromCollections:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0DC3E88];
  v34[0] = v13;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "traitCollectionWithTraitsFromCollections:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIColor resolvedColorWithTraitCollection:](self->_backgroundColor, "resolvedColorWithTraitCollection:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v22, v12, x, y, v8, v7, width, height);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor resolvedColorWithTraitCollection:](self->_backgroundColor, "resolvedColorWithTraitCollection:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqual:", v22))
  {
    v25 = v23;
  }
  else
  {
    v25 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    -[SKUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v24, v12, x, y, v8, v7, width, height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageAsset");
    v33 = v17;
    v27 = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerImage:withTraitCollection:", v23, v29);

    objc_msgSend(v25, "imageAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerImage:withTraitCollection:", v26, v31);

    v12 = v27;
    v17 = v33;

  }
  return v25;
}

- (id)_uberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 backgroundColor:(id)a5 drawBlock:(id)a6
{
  CGFloat height;
  CGFloat width;
  double v9;
  double v10;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;

  height = a4.height;
  width = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a5;
  v15 = a6;
  v16 = -[SKUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__SKUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke;
  v21[3] = &unk_1E73A5020;
  v24 = x;
  v25 = y;
  v26 = v10;
  v27 = v9;
  v28 = width;
  v29 = height;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v16, v21, v10, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __88__SKUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  void *v9;
  float v15;
  double v16;
  void *v17;
  __int128 v18;
  _OWORD v19[4];
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "set");
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80) * (v4 / *(double *)(a1 + 88));
  v6 = ceilf(v5);
  v7 = (*(double *)(a1 + 64) - v6) * 0.5;
  v8 = floorf(v7);
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v8, v3, v6, v4);
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    v18 = 0u;
    memset(v19, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    v19[3] = _Q0;
    objc_msgSend(v9, "getRed:green:blue:alpha:", &v18, (char *)&v18 + 8, v19, 0);
    *(_OWORD *)((char *)&v19[1] + 8) = v18;
    *((_QWORD *)&v19[2] + 1) = *(_QWORD *)&v19[0];
    v15 = v4 * 0.48;
    v16 = ceilf(v15);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3820]), "initVerticalWithValues:", &v18);
    v21.origin.x = v8;
    v21.origin.y = v3;
    v21.size.width = v6;
    v21.size.height = v4;
    objc_msgSend(v17, "fillRect:", v8, CGRectGetMaxY(v21) - v16, v6, v16);

  }
}

- (id)_leftToRightGradient:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  _BOOL8 v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a5;
  if (-[IKColor colorType](self->_iKBackgroundColor, "colorType") == 3)
  {
    v15 = -[SKUIStyledImageDataConsumer _backgroundIsOpaque](self, "_backgroundIsOpaque");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__SKUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke;
    v18[3] = &unk_1E73A4FF8;
    v18[4] = self;
    v20 = v12;
    v21 = v11;
    v22 = v10;
    v23 = v9;
    v19 = v14;
    v24 = x;
    v25 = y;
    v26 = width;
    v27 = height;
    -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v18, v10, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __74__SKUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  CGGradient *v16;
  _OWORD v17[2];
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  CGFloat locations[2];
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  CGPoint v32;
  CGPoint v33;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set");

    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  __asm { FMOV            V0.2D, #1.0 }
  v30 = _Q0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "gradientColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "gradientColors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "getRed:green:blue:alpha:", &v26, (char *)&v26 + 8, &v27, (char *)&v27 + 8);
  objc_msgSend(v12, "getRed:green:blue:alpha:", (char *)&v28 + 8, &v29, (char *)&v29 + 8, &v30);
  v13 = *(double *)(a1 + 64);
  *(_OWORD *)locations = xmmword_1BBED1D00;
  v25 = 0x3FF0000000000000;
  v17[0] = v26;
  v17[1] = v27;
  v18 = *((_QWORD *)&v28 + 1);
  v19 = v29;
  v20 = v30;
  v21 = *((_QWORD *)&v28 + 1);
  v22 = v29;
  v23 = v30;
  CurrentContext = UIGraphicsGetCurrentContext();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v16 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v17, locations, 3uLL);
  v32.x = 0.0;
  v32.y = 0.5;
  v33.y = 0.5;
  v33.x = v13;
  CGContextDrawLinearGradient(CurrentContext, v16, v32, v33, 0);
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v16);

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (UIEdgeInsets)borderWidths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderWidths.top;
  left = self->_borderWidths.left;
  bottom = self->_borderWidths.bottom;
  right = self->_borderWidths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderWidths:(UIEdgeInsets)a3
{
  self->_borderWidths = a3;
}

- (UIEdgeInsets)borderMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderMargins.top;
  left = self->_borderMargins.left;
  bottom = self->_borderMargins.bottom;
  right = self->_borderMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderMargins:(UIEdgeInsets)a3
{
  self->_borderMargins = a3;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (UIEdgeInsets)imagePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imagePadding.top;
  left = self->_imagePadding.left;
  bottom = self->_imagePadding.bottom;
  right = self->_imagePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  self->_imagePadding = a3;
}

- (int64_t)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(int64_t)a3
{
  self->_imageTreatment = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startingTraitCollection, 0);
  objc_storeStrong((id *)&self->_iKBackgroundColor, 0);
}

+ (void)isImageCompressionEnabled
{
  OUTLINED_FUNCTION_1();
}

- (void)init
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)isImagePlaceholderAvailable
{
  OUTLINED_FUNCTION_1();
}

void __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
