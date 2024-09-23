@implementation SKUISettingsHeaderFooterDescription

- (SKUISettingsHeaderFooterDescription)initWithViewElement:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUISettingsHeaderFooterDescription *v14;
  SKUISettingsHeaderFooterDescription *v15;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUISettingsHeaderFooterDescription initWithViewElement:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = -[SKUISettingsHeaderFooterDescription init](self, "init");
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_viewElement, a3);

  return v15;
}

+ (id)settingsHeaderFooterDescriptionWithViewElement:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUISettingsHeaderFooterDescription settingsHeaderFooterDescriptionWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend(v4, "elementType");
  if (v13 == 41)
  {
    objc_msgSend(a1, "_settingsHeaderFooterDescriptionWithFooterElement:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13 != 48)
    {
      v15 = 0;
      goto LABEL_11;
    }
    objc_msgSend(a1, "_settingsHeaderFooterDescriptionWithHeaderElement:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
LABEL_11:

  return v15;
}

+ (Class)viewClassForSettingsHeaderFooterDescription:(id)a3
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
        +[SKUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "_viewClassForSettingsHeaderFooterDescription:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

- (id)viewElement
{
  return self->_viewElement;
}

+ (id)_settingsHeaderFooterDescriptionWithFooterElement:(id)a3
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
  void *v13;
  uint64_t v14;
  __objc2_class **v15;
  void *v16;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUISettingsHeaderFooterDescription _settingsHeaderFooterDescriptionWithFooterElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "elementType");
    if (v14 == 138)
    {
      v15 = off_1E739E680;
      goto LABEL_11;
    }
    if (v14 == 12)
    {
      v15 = off_1E739E0A0;
LABEL_11:
      v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithViewElement:", v3);
      goto LABEL_12;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

+ (id)_settingsHeaderFooterDescriptionWithHeaderElement:(id)a3
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
  void *v13;
  SKUITextHeaderSettingsHeaderFooterDescription *v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUISettingsHeaderFooterDescription _settingsHeaderFooterDescriptionWithHeaderElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v13, "elementType") == 138)
    v14 = -[SKUISettingsHeaderFooterDescription initWithViewElement:]([SKUITextHeaderSettingsHeaderFooterDescription alloc], "initWithViewElement:", v3);
  else
    v14 = 0;

  return v14;
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)settingsHeaderFooterDescriptionWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)viewClassForSettingsHeaderFooterDescription:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_settingsHeaderFooterDescriptionWithFooterElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_settingsHeaderFooterDescriptionWithHeaderElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
