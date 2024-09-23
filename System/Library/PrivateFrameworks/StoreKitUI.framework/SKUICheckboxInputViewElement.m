@implementation SKUICheckboxInputViewElement

- (SKUICheckboxInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICheckboxInputViewElement *v11;
  void *v12;
  char v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICheckboxInputViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUICheckboxInputViewElement;
  v11 = -[SKUIInputViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v13 = objc_msgSend(v12, "BOOLValue");
    else
      v13 = -1;
    v11->_disabled = v13;
    objc_msgSend(v8, "getAttribute:", CFSTR("selected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
      v11->_selected = objc_msgSend(v14, "BOOLValue");

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUICheckboxInputViewElement *v4;
  SKUICheckboxInputViewElement *v5;
  SKUICheckboxInputViewElement *v6;
  objc_super v8;

  v4 = (SKUICheckboxInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUICheckboxInputViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUICheckboxInputViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_disabled = v4->_disabled;
    self->_selected = -[SKUICheckboxInputViewElement isSelected](v4, "isSelected");
  }

  return v6;
}

- (unint64_t)elementType
{
  return 18;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICheckboxInputViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
