@implementation SKUIButtonFooterSettingsHeaderFooterDescriptionView

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIButtonFooterSettingsHeaderFooterDescriptionView preferredSizeForSettingsHeaderFooterDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIButtonFooterSettingsHeaderFooterDescriptionView prefetchResourcesForSettingsHeaderFooterDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v5)
      +[SKUIButtonFooterSettingsHeaderFooterDescriptionView requestLayoutForSettingsHeaderFooterDescription:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUIButtonFooterSettingsHeaderFooterDescriptionView sizeThatFitsWidth:settingsHeaderFooterDescription:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v7, "viewElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstChildForElementType:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_buttonWithButtonElement:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v20);
  objc_msgSend(v19, "sizeThatFits:", a3, 1.0);
  v22 = v21;
  v24 = v23;
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v21, v23);
  objc_msgSend(v20, "_scaledValueForValue:", 20.0);
  v26 = v25;
  objc_msgSend(v19, "_firstLineBaselineFrameOriginY");
  v28 = v24 + v26 - v27;

  v29 = v22;
  v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKUIViewElement *v17;
  SKUIViewElement *viewElement;
  SKUIButtonViewElement *v19;
  SKUIButtonViewElement *buttonElement;
  UIButton *button;
  UIButton *v22;
  UIButton *v23;
  UIButton *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIButton *v29;
  void *v30;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIButtonFooterSettingsHeaderFooterDescriptionView reloadWithSettingsHeaderFooterDescription:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "viewElement");
  v17 = (SKUIViewElement *)objc_claimAutoreleasedReturnValue();
  viewElement = self->_viewElement;
  self->_viewElement = v17;

  -[SKUIViewElement firstChildForElementType:](self->_viewElement, "firstChildForElementType:", 12);
  v19 = (SKUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  buttonElement = self->_buttonElement;
  self->_buttonElement = v19;

  button = self->_button;
  if (button)
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v22 = self->_button;
    self->_button = 0;

  }
  objc_msgSend((id)objc_opt_class(), "_buttonWithButtonElement:", self->_buttonElement);
  v23 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v24 = self->_button;
  self->_button = v23;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
  -[SKUIButtonViewElement style](self->_buttonElement, "style");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ikColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithIKColor(v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", v28, 0);
  v29 = self->_button;
  objc_msgSend(v28, "colorWithAlphaComponent:", 0.2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v29, "setTitleColor:forState:", v30, 1);

  -[SKUIButtonFooterSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_button);
  -[SKUIButtonFooterSettingsHeaderFooterDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIButtonFooterSettingsHeaderFooterDescriptionView setImage:forArtworkRequest:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_buttonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("headerFooterButton"), CFSTR("identifier"), 0);
  -[SKUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_buttonElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v4, 0);

}

+ (id)_buttonWithButtonElement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0DC3518];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "buttonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:forState:", v7, 0);
  objc_msgSend(v5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v8, 0);

  return v5;
}

- (void)_reloadWithButtonElement:(id)a3 context:(id)a4
{
  id v7;
  UIButton *button;
  UIButton *v9;
  UIButton *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_buttonElement, a3);
  v7 = a4;
  button = self->_button;
  if (button)
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    v9 = self->_button;
    self->_button = 0;

  }
  objc_msgSend((id)objc_opt_class(), "_buttonWithButtonElement:", v18);
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v11 = self->_button;
  self->_button = v10;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
  objc_msgSend(v18, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ikColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithIKColor(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", v15, 0);
  v16 = self->_button;
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v16, "setTitleColor:forState:", v17, 1);

  -[SKUIButtonFooterSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_button);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buttonElement, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

+ (void)preferredSizeForSettingsHeaderFooterDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForSettingsHeaderFooterDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingsHeaderFooterDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadWithSettingsHeaderFooterDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
