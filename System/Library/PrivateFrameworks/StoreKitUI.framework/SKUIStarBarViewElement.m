@implementation SKUIStarBarViewElement

- (SKUIStarBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIStarBarViewElement *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStarBarViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIStarBarViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_numberOfRatings = objc_msgSend(v12, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("numStars"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_numberOfStars = objc_msgSend(v13, "integerValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v11->_value = v15;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIStarBarViewElement *v4;
  void *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = (SKUIStarBarViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIStarBarViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_numberOfRatings = -[SKUIStarBarViewElement numberOfRatings](v4, "numberOfRatings");
    self->_numberOfStars = -[SKUIStarBarViewElement numberOfStars](v4, "numberOfStars");
    -[SKUIStarBarViewElement value](v4, "value");
    self->_value = v7;
  }

  return v6;
}

- (int64_t)numberOfRatings
{
  return self->_numberOfRatings;
}

- (int64_t)numberOfStars
{
  return self->_numberOfStars;
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
  v1 = "-[SKUIStarBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
