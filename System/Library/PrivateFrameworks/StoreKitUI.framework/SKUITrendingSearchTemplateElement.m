@implementation SKUITrendingSearchTemplateElement

- (NSArray)buttons
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
  id v12;
  _QWORD v14[4];
  id v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITrendingSearchTemplateElement buttons].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__SKUITrendingSearchTemplateElement_buttons__block_invoke;
  v14[3] = &unk_1E73A12A8;
  v12 = v11;
  v15 = v12;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v14);

  return (NSArray *)v12;
}

void __44__SKUITrendingSearchTemplateElement_buttons__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (SKUIIKViewElementTypeIsButton(objc_msgSend(v3, "elementType")))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

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
  void *v11;
  void *v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITrendingSearchTemplateElement titleLabel].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SKUILabelViewElement *)v11;
}

- (void)buttons
{
}

- (void)titleLabel
{
}

@end
