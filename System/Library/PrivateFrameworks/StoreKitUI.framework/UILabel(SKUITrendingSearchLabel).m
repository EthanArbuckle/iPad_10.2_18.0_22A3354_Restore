@implementation UILabel(SKUITrendingSearchLabel)

+ (id)SKUITrending_defaultTitleColor
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        +[UILabel(SKUITrendingSearchLabel) SKUITrending_defaultTitleColor].cold.1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)SKUITrending_defaultTitleFont
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        +[UILabel(SKUITrendingSearchLabel) SKUITrending_defaultTitleFont].cold.1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 22.0, *MEMORY[0x1E0DC1430]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)SKUITrending_titleLabelWithElement:()SKUITrendingSearchLabel
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        +[UILabel(SKUITrendingSearchLabel) SKUITrending_titleLabelWithElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
        if (v4)
          goto LABEL_5;
LABEL_11:
        v13 = 0;
        goto LABEL_12;
      }
    }
  }
  if (!v4)
    goto LABEL_11;
LABEL_5:
  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v13, "setNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
  objc_msgSend(v13, "setTextAlignment:", 1);
  objc_msgSend(v4, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(a1, "SKUITrending_defaultTitleFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SKUIViewElementPlainColorWithStyle(v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(a1, "SKUITrending_defaultTitleColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attributedStringWithDefaultFont:foregroundColor:style:", v15, v16, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAttributedText:", v18);
LABEL_12:

  return v13;
}

+ (id)SKUITrending_defaultLabelWithText:()SKUITrendingSearchLabel
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
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)))
  {
    +[UILabel(SKUITrendingSearchLabel) SKUITrending_defaultLabelWithText:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    if (!v4)
      goto LABEL_8;
  }
  else if (!v4)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "length"))
    goto LABEL_8;
  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(a1, "SKUITrending_defaultTitleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  objc_msgSend(v13, "setText:", v4);
  objc_msgSend(v13, "setTextAlignment:", 1);
  objc_msgSend(a1, "SKUITrending_defaultTitleColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v15);

LABEL_9:
  return v13;
}

+ (void)SKUITrending_defaultTitleColor
{
  OUTLINED_FUNCTION_1();
}

+ (void)SKUITrending_defaultTitleFont
{
  OUTLINED_FUNCTION_1();
}

+ (void)SKUITrending_titleLabelWithElement:()SKUITrendingSearchLabel .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)SKUITrending_defaultLabelWithText:()SKUITrendingSearchLabel .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
