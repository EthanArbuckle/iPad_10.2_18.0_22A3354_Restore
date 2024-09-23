@implementation SKUIColorScheme

- (SKUIColorScheme)initWithColorSchemeDictionary:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIColorScheme *v13;
  void *v14;
  uint64_t v15;
  UIColor *backgroundColor;
  void *v17;
  uint64_t v18;
  UIColor *primaryTextColor;
  void *v20;
  uint64_t v21;
  UIColor *secondaryTextColor;
  uint64_t v23;
  UIColor *highlightedTextColor;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIColorScheme initWithColorSchemeDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SKUIColorScheme;
  v13 = -[SKUIColorScheme init](&v30, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("backgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SKUIColorWithHTMLCode(v14);
      v15 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v13->_backgroundColor;
      v13->_backgroundColor = (UIColor *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("primaryTextColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SKUIColorWithHTMLCode(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      primaryTextColor = v13->_primaryTextColor;
      v13->_primaryTextColor = (UIColor *)v18;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("titleTextColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SKUIColorWithHTMLCode(v20);
      v21 = objc_claimAutoreleasedReturnValue();
      secondaryTextColor = v13->_secondaryTextColor;
      v13->_secondaryTextColor = (UIColor *)v21;

    }
    v28 = 0.0;
    v29 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
    -[UIColor getHue:saturation:brightness:alpha:](v13->_primaryTextColor, "getHue:saturation:brightness:alpha:", &v29, &v28, &v27, &v26);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v29, v28, v27 + dbl_1BBED1060[v27 < 0.5], v26);
    v23 = objc_claimAutoreleasedReturnValue();
    highlightedTextColor = v13->_highlightedTextColor;
    v13->_highlightedTextColor = (UIColor *)v23;

  }
  return v13;
}

- (int64_t)schemeStyle
{
  return SKUIColorSchemeStyleForColor(self->_backgroundColor);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[UIColor copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[UIColor copyWithZone:](self->_highlightedTextColor, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[UIColor copyWithZone:](self->_primaryTextColor, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[UIColor copyWithZone:](self->_secondaryTextColor, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIColorScheme)initWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIColorScheme *v13;
  uint64_t v14;
  uint64_t v15;
  UIColor *backgroundColor;
  uint64_t v17;
  UIColor *primaryTextColor;
  uint64_t v19;
  UIColor *secondaryTextColor;
  objc_super v22;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIColorScheme initWithCoder:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIColorScheme;
  v13 = -[SKUIColorScheme init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("bgc"));
    v15 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v13->_backgroundColor;
    v13->_backgroundColor = (UIColor *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("ptc"));
    v17 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v13->_primaryTextColor;
    v13->_primaryTextColor = (UIColor *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("ttc"));
    v19 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v13->_secondaryTextColor;
    v13->_secondaryTextColor = (UIColor *)v19;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *backgroundColor;
  id v5;

  backgroundColor = self->_backgroundColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", backgroundColor, CFSTR("bgc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryTextColor, CFSTR("ptc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryTextColor, CFSTR("ttc"));

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithColorSchemeDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
