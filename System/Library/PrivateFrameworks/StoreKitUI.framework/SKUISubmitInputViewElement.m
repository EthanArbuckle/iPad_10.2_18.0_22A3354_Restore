@implementation SKUISubmitInputViewElement

- (SKUISubmitInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUISubmitInputViewElement *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISubmitInputViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISubmitInputViewElement;
  v11 = -[SKUIInputViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_storeStrong((id *)&v11->_label, v12);

  }
  return v11;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISubmitInputViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
