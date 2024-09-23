@implementation SKUIStarRatingViewElement

- (SKUIStarRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIStarRatingViewElement *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStarRatingViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIStarRatingViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v25, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      *(float *)&v14 = v14 / 5.0;
      v11->_ratingValue = *(float *)&v14;
    }
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if ((objc_msgSend(CFSTR("large"), "isEqualToString:", v15) & 1) != 0)
      {
        v16 = 2;
LABEL_13:
        v11->_starType = v16;
        goto LABEL_14;
      }
      if (!objc_msgSend(CFSTR("large"), "isEqualToString:", v15))
      {
LABEL_14:
        objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if ((objc_msgSend(CFSTR("yes"), "isEqualToString:", v17) & 1) != 0)
            LOBYTE(v18) = 0;
          else
            v18 = objc_msgSend(CFSTR("true"), "isEqualToString:", v17) ^ 1;
          v11->_enabled = v18;
        }
        -[SKUIViewElement firstChildForElementType:](v11, "firstChildForElementType:", 138);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = v9;
          +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "string");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          if (v22)
            objc_storeStrong((id *)&v11->_text, v20);

          v9 = v24;
        }

        goto LABEL_24;
      }
    }
    v16 = 1;
    goto LABEL_13;
  }
LABEL_24:

  return v11;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SKUIViewElementText)text
{
  SKUIViewElementText *text;
  SKUIViewElementText *v3;
  void *v4;

  text = self->_text;
  if (text)
  {
    v3 = text;
  }
  else
  {
    -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v3 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIStarRatingViewElement *v4;
  void *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = (SKUIStarRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIStarRatingViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIStarRatingViewElement ratingValue](v4, "ratingValue");
    self->_ratingValue = v7;
    objc_storeStrong((id *)&self->_text, v4->_text);
  }

  return v6;
}

- (int64_t)starType
{
  return self->_starType;
}

- (float)ratingValue
{
  return self->_ratingValue;
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
  v1 = "-[SKUIStarRatingViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
