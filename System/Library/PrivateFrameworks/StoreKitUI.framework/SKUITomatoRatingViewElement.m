@implementation SKUITomatoRatingViewElement

- (SKUITomatoRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUITomatoRatingViewElement *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  SKUITomatoRatingViewElement *v18;
  uint64_t v19;
  SKUIViewElementText *ratingText;
  _QWORD v22[4];
  SKUITomatoRatingViewElement *v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITomatoRatingViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUITomatoRatingViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v24, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v11->_tomatoRating = v13;

    objc_msgSend(v8, "getAttribute:", CFSTR("freshness"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("certified")))
      {
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("fresh")))
          goto LABEL_13;
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("rotten")))
          goto LABEL_15;
LABEL_17:
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __72__SKUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
        v22[3] = &unk_1E73A2078;
        v18 = v11;
        v23 = v18;
        +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, v22);
        v19 = objc_claimAutoreleasedReturnValue();
        ratingText = v18->_ratingText;
        v18->_ratingText = (SKUIViewElementText *)v19;

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v8, "getAttribute:", CFSTR("certified"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (!v16)
      {
        if (v11->_tomatoRating >= 0.6)
        {
LABEL_13:
          v17 = 1;
LABEL_16:
          v11->_freshness = v17;
          goto LABEL_17;
        }
LABEL_15:
        v17 = 2;
        goto LABEL_16;
      }
    }
    v11->_freshness = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

id __72__SKUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;

  if (!_block_invoke_sRatingFormatter)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v7 = (void *)_block_invoke_sRatingFormatter;
    _block_invoke_sRatingFormatter = (uint64_t)v6;

    objc_msgSend((id)_block_invoke_sRatingFormatter, "setNumberStyle:", 3);
    objc_msgSend((id)_block_invoke_sRatingFormatter, "setMaximumFractionDigits:", 0);
  }
  *a4 = 0;
  v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v9) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288);
  v10 = (void *)objc_msgSend(v8, "initWithFloat:", v9);
  objc_msgSend((id)_block_invoke_sRatingFormatter, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUITomatoRatingViewElement *v4;
  void *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = (SKUITomatoRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUITomatoRatingViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_freshness = -[SKUITomatoRatingViewElement freshness](v4, "freshness");
    -[SKUITomatoRatingViewElement tomatoRating](v4, "tomatoRating");
    self->_tomatoRating = v7;
  }

  return v6;
}

- (int64_t)freshness
{
  return self->_freshness;
}

- (float)tomatoRating
{
  return self->_tomatoRating;
}

- (SKUIViewElementText)ratingText
{
  return self->_ratingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingText, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITomatoRatingViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
