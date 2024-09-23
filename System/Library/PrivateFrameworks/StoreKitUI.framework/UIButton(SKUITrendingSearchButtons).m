@implementation UIButton(SKUITrendingSearchButtons)

+ (id)SKUITrending_defaultButtonFont
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
        +[UIButton(SKUITrendingSearchButtons) SKUITrending_defaultButtonFont].cold.1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)SKUITrending_searchButtonWithElement:()SKUITrendingSearchButtons
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[UIButton(SKUITrendingSearchButtons) SKUITrending_searchButtonWithElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "SKUITrending_applyConfigurationFromElement:", v3);

  return v12;
}

+ (id)SKUITrending_searchButtonWithTitle:()SKUITrendingSearchButtons
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
        +[UIButton(SKUITrendingSearchButtons) SKUITrending_searchButtonWithTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(a1, "SKUITrending_searchButtonWithElement:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v4, 0);

  return v13;
}

- (void)SKUITrending_applyConfigurationFromElement:()SKUITrendingSearchButtons
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[UIButton(SKUITrendingSearchButtons) SKUITrending_applyConfigurationFromElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "buttonImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "buttonImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resourceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIImageWithResourceName(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setImage:forState:", v16, 0);
  }
  objc_msgSend(v4, "buttonText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTitle:forState:", v18, 0);
  objc_msgSend(v4, "buttonTitleStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(v4, "style");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  SKUIViewElementPlainColorWithStyle(v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v23);

  objc_msgSend(a1, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v22, "maxTextLines");
  if (v25)
  {
    objc_msgSend(v24, "setFont:", v25);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "SKUITrending_defaultButtonFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v27);

  }
  if (v26 == -1)
    v28 = 1;
  else
    v28 = v26;
  objc_msgSend(v24, "setNumberOfLines:", v28);
  objc_msgSend(v24, "setTextAlignment:", 1);
  objc_msgSend(v24, "setLineBreakMode:", 4);

}

+ (void)SKUITrending_defaultButtonFont
{
  OUTLINED_FUNCTION_1();
}

+ (void)SKUITrending_searchButtonWithElement:()SKUITrendingSearchButtons .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)SKUITrending_searchButtonWithTitle:()SKUITrendingSearchButtons .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)SKUITrending_applyConfigurationFromElement:()SKUITrendingSearchButtons .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
