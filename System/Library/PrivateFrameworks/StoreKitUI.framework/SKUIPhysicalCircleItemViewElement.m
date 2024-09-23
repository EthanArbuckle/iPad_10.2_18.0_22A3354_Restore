@implementation SKUIPhysicalCircleItemViewElement

- (SKUIPhysicalCircleItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIPhysicalCircleItemViewElement *v11;
  void *v12;
  uint64_t v13;
  NSString *itemIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPhysicalCircleItemViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPhysicalCircleItemViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("size"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_circleSize = objc_msgSend(v12, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v13 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v11->_itemIdentifier;
    v11->_itemIdentifier = (NSString *)v13;

  }
  return v11;
}

- (SKUIImageViewElement)imageElement
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SKUILabelViewElement)titleElement
{
  return (SKUILabelViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIPhysicalCircleItemViewElement *v4;
  SKUIPhysicalCircleItemViewElement *v5;
  SKUIPhysicalCircleItemViewElement *v6;
  NSString *v7;
  NSString *itemIdentifier;
  objc_super v10;

  v4 = (SKUIPhysicalCircleItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIPhysicalCircleItemViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIPhysicalCircleItemViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_circleSize = -[SKUIPhysicalCircleItemViewElement circleSize](v4, "circleSize");
    -[SKUIPhysicalCircleItemViewElement itemIdentifier](v4, "itemIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    itemIdentifier = self->_itemIdentifier;
    self->_itemIdentifier = v7;

  }
  return v6;
}

- (int64_t)circleSize
{
  return self->_circleSize;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPhysicalCircleItemViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
