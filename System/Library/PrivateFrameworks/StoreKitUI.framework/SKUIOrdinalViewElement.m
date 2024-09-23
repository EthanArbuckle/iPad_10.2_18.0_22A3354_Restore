@implementation SKUIOrdinalViewElement

- (SKUIOrdinalViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIOrdinalViewElement *v11;
  uint64_t v12;
  SKUIViewElementText *text;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOrdinalViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIOrdinalViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    text = v11->_text;
    v11->_text = (SKUIViewElementText *)v12;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIOrdinalViewElement *v4;
  void *v5;
  void *v6;
  SKUIViewElementText *v7;
  SKUIViewElementText *text;
  objc_super v10;

  v4 = (SKUIOrdinalViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIOrdinalViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIOrdinalViewElement text](v4, "text");
    v7 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v7;

  }
  return v6;
}

- (SKUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIOrdinalViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
