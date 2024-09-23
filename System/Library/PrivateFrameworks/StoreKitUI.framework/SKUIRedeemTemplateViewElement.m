@implementation SKUIRedeemTemplateViewElement

- (SKUIRedeemTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIRedeemTemplateViewElement *v11;
  uint64_t v12;
  NSString *initialCode;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIRedeemTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("code"));
    v12 = objc_claimAutoreleasedReturnValue();
    initialCode = v11->_initialCode;
    v11->_initialCode = (NSString *)v12;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIRedeemTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *initialCode;
  objc_super v10;

  v4 = (SKUIRedeemTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemTemplateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIRedeemTemplateViewElement initialCode](v4, "initialCode");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    initialCode = self->_initialCode;
    self->_initialCode = v7;

  }
  return v6;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCode, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
