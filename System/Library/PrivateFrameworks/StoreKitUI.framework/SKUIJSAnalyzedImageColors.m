@implementation SKUIJSAnalyzedImageColors

- (SKUIJSAnalyzedImageColors)initWithAppContext:(id)a3 analyzedImageColors:(id)a4
{
  id v6;
  id v7;
  SKUIJSAnalyzedImageColors *v8;
  SKUIJSColor *v9;
  void *v10;
  uint64_t v11;
  SKUIJSColor *backgroundColor;
  SKUIJSColor *v13;
  void *v14;
  uint64_t v15;
  SKUIJSColor *textPrimaryColor;
  SKUIJSColor *v17;
  void *v18;
  uint64_t v19;
  SKUIJSColor *textSecondaryColor;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSAnalyzedImageColors initWithAppContext:analyzedImageColors:].cold.1();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIJSAnalyzedImageColors;
  v8 = -[IKJSObject initWithAppContext:](&v22, sel_initWithAppContext_, v6);
  if (v8)
  {
    v9 = [SKUIJSColor alloc];
    objc_msgSend(v7, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SKUIJSColor initWithAppContext:color:](v9, "initWithAppContext:color:", v6, v10);
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (SKUIJSColor *)v11;

    v13 = [SKUIJSColor alloc];
    objc_msgSend(v7, "textPrimaryColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SKUIJSColor initWithAppContext:color:](v13, "initWithAppContext:color:", v6, v14);
    textPrimaryColor = v8->_textPrimaryColor;
    v8->_textPrimaryColor = (SKUIJSColor *)v15;

    v17 = [SKUIJSColor alloc];
    objc_msgSend(v7, "textSecondaryColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SKUIJSColor initWithAppContext:color:](v17, "initWithAppContext:color:", v6, v18);
    textSecondaryColor = v8->_textSecondaryColor;
    v8->_textSecondaryColor = (SKUIJSColor *)v19;

    v8->_isBackgroundLight = objc_msgSend(v7, "isBackgroundLight");
  }

  return v8;
}

- (SKUIJSColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SKUIJSColor)textPrimaryColor
{
  return self->_textPrimaryColor;
}

- (SKUIJSColor)textSecondaryColor
{
  return self->_textSecondaryColor;
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSecondaryColor, 0);
  objc_storeStrong((id *)&self->_textPrimaryColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithAppContext:analyzedImageColors:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSAnalyzedImageColors initWithAppContext:analyzedImageColors:]";
}

@end
