@implementation SKUIContextActionsBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIContextActionsBlurEffect effectWithStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___SKUIContextActionsBlurEffect;
  objc_msgSendSuper2(&v14, sel_effectWithStyle_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)effectSettings
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
  double v12;
  double v13;
  void *v14;
  objc_super v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIContextActionsBlurEffect effectSettings].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIContextActionsBlurEffect;
  -[UIBlurEffect effectSettings](&v16, sel_effectSettings);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScale:", 0.5);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v12 = 0.0;
    objc_msgSend(v11, "setBlurRadius:", 0.0);
    v13 = 0.4;
  }
  else
  {
    objc_msgSend(v11, "setBlurRadius:", 8.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColorTint:", v14);

    objc_msgSend(v11, "setColorTintAlpha:", 0.2);
    v12 = 0.025;
    v13 = 0.1;
  }
  objc_msgSend(v11, "setGrayscaleTintLevel:", 0.0);
  objc_msgSend(v11, "setGrayscaleTintAlpha:", v13);
  objc_msgSend(v11, "setZoom:", v12);
  return v11;
}

+ (void)effectWithStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)effectSettings
{
}

@end
