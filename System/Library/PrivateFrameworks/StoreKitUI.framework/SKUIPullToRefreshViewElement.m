@implementation SKUIPullToRefreshViewElement

- (SKUIPullToRefreshViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIPullToRefreshViewElement *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPullToRefreshViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIPullToRefreshViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);

  return v11;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPullToRefreshViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
