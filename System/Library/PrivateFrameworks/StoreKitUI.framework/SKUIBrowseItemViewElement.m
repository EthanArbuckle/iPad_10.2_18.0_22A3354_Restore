@implementation SKUIBrowseItemViewElement

- (SKUIBrowseItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIBrowseItemViewElement *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseItemViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIBrowseItemViewElement;
  v11 = -[SKUIItemViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("expands"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(&v11->super._selected + 1) = objc_msgSend(v12, "BOOLValue");

  }
  return v11;
}

- (SKUIImageViewElement)decorationImage
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 29);
}

- (NSArray)metadata
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SKUIBrowseItemViewElement_metadata__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __37__SKUIBrowseItemViewElement_metadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 138)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIBrowseItemViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUIBrowseItemViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIBrowseItemViewElement;
  -[SKUIItemViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    *(&self->super._selected + 1) = -[SKUIBrowseItemViewElement expands](v4, "expands");

  return v6;
}

- (int64_t)pageComponentType
{
  return 16;
}

- (BOOL)expands
{
  return *(&self->super._selected + 1);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrowseItemViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
