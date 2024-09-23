@implementation SKUIDividerViewElement

- (SKUIDividerViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIDividerViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIDividerViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
      objc_storeStrong((id *)&v11->_text, v12);

  }
  return v11;
}

- (BOOL)isEnabled
{
  return self->_button != 0;
}

- (int64_t)pageComponentType
{
  return 4;
}

- (SKUIButtonViewElement)button
{
  return (SKUIButtonViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 12);
}

- (int64_t)dividerType
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!self->_dividerTypeWasInitialized)
  {
    -[SKUIDividerViewElement style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dividerType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if ((objc_msgSend(CFSTR("full"), "isEqualToString:", v4) & 1) != 0)
      {
        v5 = 1;
LABEL_10:
        self->_dividerType = v5;
        self->_dividerTypeWasInitialized = 1;

        return self->_dividerType;
      }
      if ((objc_msgSend(CFSTR("inset"), "isEqualToString:", v4) & 1) != 0)
      {
        v5 = 2;
        goto LABEL_10;
      }
      if ((objc_msgSend(CFSTR("borderless"), "isEqualToString:", v4) & 1) != 0)
      {
        v5 = 3;
        goto LABEL_10;
      }
    }
    v5 = 0;
    goto LABEL_10;
  }
  return self->_dividerType;
}

- (SKUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDividerViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
