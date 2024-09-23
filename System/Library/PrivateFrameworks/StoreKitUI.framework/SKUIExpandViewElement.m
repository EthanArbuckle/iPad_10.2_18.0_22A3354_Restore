@implementation SKUIExpandViewElement

- (SKUIExpandViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIExpandViewElement *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIExpandViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIExpandViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("open"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_open = objc_msgSend(v12, "BOOLValue");

    v11->_previousIsOpen = v11->_open;
  }

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIExpandViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUIExpandViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIExpandViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_previousIsOpen = self->_open;
    self->_open = -[SKUIExpandViewElement isOpen](v4, "isOpen");
  }
  objc_msgSend(v6, "setPreviousIsOpen:", self->_previousIsOpen);

  return v6;
}

- (int64_t)pageComponentType
{
  return 19;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)previousIsOpen
{
  return self->_previousIsOpen;
}

- (void)setPreviousIsOpen:(BOOL)a3
{
  self->_previousIsOpen = a3;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIExpandViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
