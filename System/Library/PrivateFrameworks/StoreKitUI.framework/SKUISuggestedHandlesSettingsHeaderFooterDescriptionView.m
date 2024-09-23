@implementation SKUISuggestedHandlesSettingsHeaderFooterDescriptionView

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
        +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView prefetchResourcesForSettingsHeaderFooterDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

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
        +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView preferredSizeForSettingsHeaderFooterDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
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
      +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView requestLayoutForSettingsHeaderFooterDescription:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView sizeThatFitsWidth:settingsHeaderFooterDescription:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = v7;
  objc_msgSend(v16, "suggestedHandles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  v19 = *MEMORY[0x1E0DC4B20];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B20]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_scaledValueForValue:", 30.0);
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_scaledValueForValue:", 22.0);
  v25 = v24;
  objc_msgSend(a1, "_helpLabelWithDescription:forWidth:", v16, a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "_firstLineBaselineFrameOriginY");
  v28 = v25 - v27;
  objc_msgSend(v26, "_lastLineBaselineFrameOriginY");
  v30 = v28 + v29 + v22 * (double)v18;

  v31 = a3;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SKUISuggestedHandlesSettingsHeaderFooterDescription *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUISuggestedHandlesSettingsHeaderFooterDescription *description;
  SKUISuggestedHandlesSettingsHeaderFooterDescription *v17;
  UILabel *v18;
  UILabel *label;
  NSMutableArray *v20;
  NSMutableArray *buttons;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  SKUISuggestedHandlesSettingsHeaderFooterDescriptionView *v27;

  v7 = (SKUISuggestedHandlesSettingsHeaderFooterDescription *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView reloadWithSettingsHeaderFooterDescription:width:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  description = self->_description;
  self->_description = v7;
  v17 = v7;

  objc_msgSend((id)objc_opt_class(), "_helpLabelWithDescription:forWidth:", self->_description, a4);
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  self->_label = v18;

  -[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView addSubview:](self, "addSubview:", self->_label);
  v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  buttons = self->_buttons;
  self->_buttons = v20;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B20]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISuggestedHandlesSettingsHeaderFooterDescription suggestedHandles](self->_description, "suggestedHandles");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __115__SKUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke;
  v25[3] = &unk_1E739FF18;
  v26 = v22;
  v27 = self;
  v24 = v22;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v25);

}

void __115__SKUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0DC3518];
  v6 = a2;
  objc_msgSend(v5, "buttonWithType:", 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTitle:forState:", v7, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleColor:forState:", v8, 0);

  objc_msgSend(v11, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v11, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 0);

  objc_msgSend(v11, "setTag:", a3);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__buttonAction_, 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "addObject:", v11);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v11);

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
        -[SKUISuggestedHandlesSettingsHeaderFooterDescriptionView setImage:forArtworkRequest:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

void __73__SKUISuggestedHandlesSettingsHeaderFooterDescriptionView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(a1 + 40)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v3 = a2;
  objc_msgSend(v3, "titleLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_firstBaselineOffsetFromTop");
  v5 = v4;
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(*(CGRect *)(a1 + 48)), 1.0);
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) - v5, v6, v7);

}

- (void)_buttonAction:(id)a3
{
  -[SKUISuggestedHandlesSettingsHeaderFooterDescription selectedHandleAtIndex:](self->_description, "selectedHandleAtIndex:", objc_msgSend(a3, "tag"));
}

+ (id)_helpLabelWithDescription:(id)a3 forWidth:(double)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v5 = (objc_class *)MEMORY[0x1E0DC3990];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "helpText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", v8);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v10);

  objc_msgSend(v7, "sizeThatFits:", a4, 1.0);
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v11);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

+ (void)prefetchResourcesForSettingsHeaderFooterDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForSettingsHeaderFooterDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
