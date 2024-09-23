@implementation SKUIBorderView

- (void)setColor:(id)a3
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
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBorderView setColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBorderView;
  -[SKUIBorderView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (UIColor)color
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIBorderView color].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIBorderView;
  -[SKUIBorderView backgroundColor](&v12, sel_backgroundColor);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBackgroundColor:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v3)
      -[SKUIBorderView setBackgroundColor:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)setColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)color
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
