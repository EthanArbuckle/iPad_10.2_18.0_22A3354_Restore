@implementation SKUIItemViewElement

- (SKUIItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIItemViewElement *v11;
  uint64_t v12;
  uint64_t v13;
  __objc2_class *v14;
  uint64_t v15;
  SKUIViewElementText *itemText;
  void *v17;
  SKUIItemViewElement *v18;
  void *v19;
  SKUIItemViewElement *v20;
  void *v22;
  char isKindOfClass;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItemViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIItemViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v24, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (!v11)
    goto LABEL_11;
  v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v9, "parent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {

      }
      else
      {
        objc_msgSend(v9, "parent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_7;
      }
    }
    v14 = SKUIBrowseItemViewElement;
    goto LABEL_17;
  }
LABEL_7:
  v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = SKUIStackItemViewElement;
LABEL_17:
      v18 = (SKUIItemViewElement *)objc_msgSend([v14 alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
      goto LABEL_18;
    }
  }
  +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  itemText = v11->_itemText;
  v11->_itemText = (SKUIViewElementText *)v15;

  objc_msgSend(v8, "getAttribute:", CFSTR("selected"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_selected = objc_msgSend(v17, "BOOLValue");

LABEL_11:
  v18 = v11;
LABEL_18:
  v20 = v18;

  return v20;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIItemViewElement *v4;
  void *v5;
  void *v6;
  SKUIViewElementText *v7;
  SKUIViewElementText *itemText;
  objc_super v10;

  v4 = (SKUIItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIItemViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIItemViewElement itemText](v4, "itemText");
    v7 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
    itemText = self->_itemText;
    self->_itemText = v7;

    self->_selected = -[SKUIItemViewElement isSelected](v4, "isSelected");
  }

  return v6;
}

- (SKUIViewElementText)itemText
{
  return self->_itemText;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemText, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItemViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
