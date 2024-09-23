@implementation SKUITemplateDefinitionViewElement

- (SKUIViewElement)contentViewElement
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
        -[SKUITemplateDefinitionViewElement contentViewElement].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 26);
  return (SKUIViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)definitionMode
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
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITemplateDefinitionViewElement definitionMode].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUITemplateDefinitionViewElement attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("mode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)definitionType
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
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITemplateDefinitionViewElement definitionType].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUITemplateDefinitionViewElement attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (SKUIPredicateListViewElement)predicateListViewElement
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
        -[SKUITemplateDefinitionViewElement predicateListViewElement].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 89);
  return (SKUIPredicateListViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)contentViewElement
{
  OUTLINED_FUNCTION_1();
}

- (void)definitionMode
{
  OUTLINED_FUNCTION_1();
}

- (void)definitionType
{
  OUTLINED_FUNCTION_1();
}

- (void)predicateListViewElement
{
  OUTLINED_FUNCTION_1();
}

@end
