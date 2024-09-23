@implementation SKUIPreviewTemplateViewElement

- (SKUIPreviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIPreviewTemplateViewElement *v11;
  void *v12;
  uint64_t v13;
  NSString *previewURLString;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPreviewTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v11->_itemIdentifier = objc_msgSend(v12, "longLongValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("preview-url"));
    v13 = objc_claimAutoreleasedReturnValue();
    previewURLString = v11->_previewURLString;
    v11->_previewURLString = (NSString *)v13;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIPreviewTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *previewURLString;
  objc_super v10;

  v4 = (SKUIPreviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewTemplateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_itemIdentifier = -[SKUIPreviewTemplateViewElement itemIdentifier](v4, "itemIdentifier");
    -[SKUIPreviewTemplateViewElement previewURLString](v4, "previewURLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    previewURLString = self->_previewURLString;
    self->_previewURLString = v7;

  }
  return v6;
}

- (SKUILockupViewElement)previewLockup
{
  return (SKUILockupViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 66);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)previewURLString
{
  return self->_previewURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURLString, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPreviewTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
