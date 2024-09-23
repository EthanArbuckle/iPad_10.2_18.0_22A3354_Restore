@implementation SKUIDividerPageComponent

- (SKUIDividerPageComponent)initWithCustomPageContext:(id)a3
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
  SKUIDividerPageComponent *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *title;
  objc_super v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDividerPageComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIDividerPageComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v19, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v16;

    }
  }

  return v13;
}

- (SKUIDividerPageComponent)initWithDividerTitle:(id)a3
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
  SKUIDividerPageComponent *v13;
  uint64_t v14;
  NSString *title;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDividerPageComponent initWithDividerTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIDividerPageComponent;
  v13 = -[SKUIDividerPageComponent init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

  }
  return v13;
}

- (SKUIDividerPageComponent)initWithViewElement:(id)a3
{
  id v4;
  SKUIDividerPageComponent *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerPageComponent initWithViewElement:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIDividerPageComponent;
  v5 = -[SKUIPageComponent initWithViewElement:](&v7, sel_initWithViewElement_, v4);

  return v5;
}

- (int64_t)componentType
{
  return 4;
}

- (NSString)dividerTitle
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithDividerTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDividerPageComponent initWithViewElement:]";
  OUTLINED_FUNCTION_1();
}

@end
