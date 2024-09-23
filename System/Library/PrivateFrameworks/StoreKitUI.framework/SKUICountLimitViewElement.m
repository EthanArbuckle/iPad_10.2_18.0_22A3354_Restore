@implementation SKUICountLimitViewElement

- (SKUICountLimitViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICountLimitViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *entityTypeString;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICountLimitViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICountLimitViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_limitValue = objc_msgSend(v12, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("entityType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = objc_msgSend(v13, "copy");
      entityTypeString = v11->_entityTypeString;
      v11->_entityTypeString = (NSString *)v14;

    }
  }

  return v11;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUICountLimitViewElement *v4;
  SKUICountLimitViewElement *v5;
  SKUICountLimitViewElement *v6;
  void *v7;
  NSString *v8;
  NSString *entityTypeString;
  objc_super v11;

  v4 = (SKUICountLimitViewElement *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SKUICountLimitViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v11, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUICountLimitViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_limitValue = -[SKUICountLimitViewElement limitValue](v4, "limitValue");
    -[SKUICountLimitViewElement entityTypeString](v4, "entityTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;

  }
  return v6;
}

- (int64_t)limitValue
{
  return self->_limitValue;
}

- (NSString)entityTypeString
{
  return self->_entityTypeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTypeString, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICountLimitViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
