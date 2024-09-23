@implementation SKUICheckboxFieldSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
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
        +[SKUICheckboxFieldSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
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
        +[SKUICheckboxFieldSettingDescriptionView preferredSizeForSettingDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
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
      +[SKUICheckboxFieldSettingDescriptionView requestLayoutForSettingDescription:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUICheckboxFieldSettingDescriptionView sizeThatFitsWidth:settingDescription:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SKUIFieldSettingDescription *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIFieldSettingDescription *settingDescription;
  SKUIFieldSettingDescription *v16;
  void *v17;
  _QWORD v18[5];

  v6 = (SKUIFieldSettingDescription *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUICheckboxFieldSettingDescriptionView reloadWithSettingDescription:width:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  settingDescription = self->_settingDescription;
  self->_settingDescription = v6;
  v16 = v6;

  -[SKUISettingDescription viewElement](v16, "viewElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__SKUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v18[3] = &unk_1E73A12A8;
  v18[4] = self;
  objc_msgSend(v17, "enumerateChildrenUsingBlock:", v18);
  -[SKUICheckboxFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

void __86__SKUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(v4, "elementType");
  if (v3 == 18)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addInputWithElement:", v4);
  }
  else if (v3 == 138)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addLabelWithElement:", v4);
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v3)
      -[SKUICheckboxFieldSettingDescriptionView setContentInset:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
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
        -[SKUICheckboxFieldSettingDescriptionView setImage:forArtworkRequest:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (void)tintColorDidChange
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_switchValueChanged:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[UISwitch isOn](self->_switch, "isOn"));
  -[SKUIFieldSettingDescription setFieldValue:forKey:](self->_settingDescription, "setFieldValue:forKey:", v4, CFSTR("selected"));

}

- (void)_addInputWithElement:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    -[SKUICheckboxFieldSettingDescriptionView _addSwitchWithElement:](self, "_addSwitchWithElement:", v5);

}

- (void)_addLabelWithElement:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  v8 = self->_label;
  objc_msgSend(v5, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v8, "setText:", v10);

  v11 = self->_label;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[SKUICheckboxFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_label);
}

- (void)_addSwitchWithElement:(id)a3
{
  objc_class *v4;
  id v5;
  UISwitch *v6;
  UISwitch *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0DC3D18];
  v5 = a3;
  v6 = (UISwitch *)objc_alloc_init(v4);
  v7 = self->_switch;
  self->_switch = v6;

  v8 = objc_msgSend(v5, "isSelected");
  -[SKUIFieldSettingDescription fieldValueForKey:](self->_settingDescription, "fieldValueForKey:", CFSTR("selected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v8 = objc_msgSend(v9, "BOOLValue");
  -[UISwitch setOn:](self->_switch, "setOn:", v8);
  -[UISwitch addTarget:action:forControlEvents:](self->_switch, "addTarget:action:forControlEvents:", self, sel__switchValueChanged_, 4096);
  -[SKUICheckboxFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_switch);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadWithSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
