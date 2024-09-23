@implementation SKUIContentUnavailableTemplateElement

- (SKUIButtonViewElement)button
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
        -[SKUIContentUnavailableTemplateElement button].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 12);
  return (SKUIButtonViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (SKUIImageViewElement)image
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
        -[SKUIContentUnavailableTemplateElement image].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
  return (SKUIImageViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (SKUILabelViewElement)messageLabel
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIContentUnavailableTemplateElement messageLabel].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__27;
  v18 = __Block_byref_object_dispose__27;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__SKUIContentUnavailableTemplateElement_messageLabel__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUILabelViewElement *)v11;
}

void __53__SKUIContentUnavailableTemplateElement_messageLabel__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUILabelViewElement)titleLabel
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIContentUnavailableTemplateElement titleLabel].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__27;
  v18 = __Block_byref_object_dispose__27;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SKUIContentUnavailableTemplateElement_titleLabel__block_invoke;
  v13[3] = &unk_1E73A01D0;
  v13[4] = &v14;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUILabelViewElement *)v11;
}

void __51__SKUIContentUnavailableTemplateElement_titleLabel__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentUnavailableTemplateElement pageComponentType].cold.1();
  }
  return 24;
}

- (void)button
{
  OUTLINED_FUNCTION_1();
}

- (void)image
{
  OUTLINED_FUNCTION_1();
}

- (void)messageLabel
{
  OUTLINED_FUNCTION_1();
}

- (void)titleLabel
{
  OUTLINED_FUNCTION_1();
}

- (void)pageComponentType
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIContentUnavailableTemplateElement pageComponentType]";
  OUTLINED_FUNCTION_1();
}

@end
