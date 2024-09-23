@implementation SKUISortDescriptorViewElement

- (SKUISortDescriptorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUISortDescriptorViewElement *v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISortDescriptorViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUISortDescriptorViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("direction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("descending")) ^ 1;
    else
      LOBYTE(v13) = 1;
    v11->_ascending = v13;
    objc_msgSend(v8, "getAttribute:", CFSTR("property"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      objc_storeStrong((id *)&v11->_property, v14);

  }
  return v11;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUISortDescriptorViewElement *v4;
  SKUISortDescriptorViewElement *v5;
  SKUISortDescriptorViewElement *v6;
  NSString *v7;
  NSString *property;
  objc_super v10;

  v4 = (SKUISortDescriptorViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUISortDescriptorViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUISortDescriptorViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_ascending = -[SKUISortDescriptorViewElement isAscending](v4, "isAscending");
    -[SKUISortDescriptorViewElement property](v4, "property");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    property = self->_property;
    self->_property = v7;

  }
  return v6;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISortDescriptorViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
