@implementation SKUIActivityIndicatorViewElement

- (SKUIActivityIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIActivityIndicatorViewElement *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIActivityIndicatorViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIActivityIndicatorViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("period"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "doubleValue");
    else
      v14 = -1.0;
    v11->_period = v14;

  }
  return v11;
}

- (SKUIImageViewElement)image
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (double)period
{
  return self->_period;
}

- (SKUILabelViewElement)text
{
  return (SKUILabelViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
}

- (BOOL)isDisabled
{
  return 1;
}

- (int64_t)pageComponentType
{
  return 24;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIActivityIndicatorViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
