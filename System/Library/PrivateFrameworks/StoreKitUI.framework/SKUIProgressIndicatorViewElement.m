@implementation SKUIProgressIndicatorViewElement

- (SKUIProgressIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIProgressIndicatorViewElement *v11;
  void *v12;
  float v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProgressIndicatorViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIProgressIndicatorViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v11->_value = v13;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIProgressIndicatorViewElement *v4;
  SKUIProgressIndicatorViewElement *v5;
  SKUIProgressIndicatorViewElement *v6;
  float v7;
  objc_super v9;

  v4 = (SKUIProgressIndicatorViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIProgressIndicatorViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIProgressIndicatorViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SKUIProgressIndicatorViewElement value](v4, "value");
    self->_value = v7;
  }

  return v6;
}

- (float)value
{
  return self->_value;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProgressIndicatorViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
