@implementation SKUIGroupViewElement

- (SKUIGroupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIGroupViewElement *v11;
  uint64_t v12;
  NSString *type;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGroupViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIGroupViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = objc_claimAutoreleasedReturnValue();
    type = v11->_type;
    v11->_type = (NSString *)v12;

  }
  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGroupViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
