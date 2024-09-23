@implementation SKUITextFieldSettingDescriptionView

- (void)beginEdits
{
  OUTLINED_FUNCTION_1();
}

- (void)commitEdits
{
  OUTLINED_FUNCTION_1();
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UITextField *textField;
  double v14;
  objc_super v15;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITextFieldSettingDescriptionView setEnabled:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUITextFieldSettingDescriptionView;
  -[SKUIFieldSettingDescriptionView setEnabled:](&v15, sel_setEnabled_, v3);
  textField = self->_textField;
  if (textField)
  {
    -[UITextField setEnabled:](textField, "setEnabled:", v3);
    v14 = 0.5;
    if (v3)
      v14 = 1.0;
    -[UITextField setAlpha:](self->_textField, "setAlpha:", v14);
  }
}

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
        +[SKUITextFieldSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUITextFieldSettingDescriptionView preferredSizeForSettingDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  id v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUITextFieldSettingDescriptionView requestLayoutForSettingDescription:width:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "viewElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__14;
  v38 = __Block_byref_object_dispose__14;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__14;
  v32 = __Block_byref_object_dispose__14;
  v33 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__SKUITextFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke;
  v27[3] = &unk_1E73A01F8;
  v27[4] = &v34;
  v27[5] = &v28;
  objc_msgSend(v16, "enumerateChildrenUsingBlock:", v27);
  if (v35[5] && v29[5])
  {
    v17 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend((id)v35[5], "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v19);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v20);

    objc_msgSend(v17, "sizeThatFits:", 1.0, 1.0);
    v22 = v21;
    objc_msgSend(v7, "aggregateValueForKey:", CFSTR("SKUITextFieldSettingDescriptionFieldLabelWidthKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "doubleValue");
      v22 = fmax(v22, v25);
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v22);
    objc_msgSend(v7, "setAggregateValue:forKey:", v26, CFSTR("SKUITextFieldSettingDescriptionFieldLabelWidthKey"));

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __88__SKUITextFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v4 = objc_msgSend(v6, "elementType");
  if ((unint64_t)(v4 - 139) < 2 || v4 == 58)
  {
    v5 = *(_QWORD *)(a1 + 40);
    goto LABEL_6;
  }
  if (v4 == 138)
  {
    v5 = *(_QWORD *)(a1 + 32);
LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(v5 + 8) + 40), a2);
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
        +[SKUITextFieldSettingDescriptionView sizeThatFitsWidth:settingDescription:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
  id v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  _QWORD v13[5];

  objc_storeStrong((id *)&self->_settingDescription, a3);
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "viewElement");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__SKUITextFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v13[3] = &unk_1E73A12A8;
  v13[4] = self;
  objc_msgSend(v12, "enumerateChildrenUsingBlock:", v13);
  objc_msgSend(v9, "aggregateValueForKey:", CFSTR("SKUITextFieldSettingDescriptionFieldLabelWidthKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  self->_aggregateLabelWidth = v11;
  -[SKUITextFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

void __82__SKUITextFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "elementType");
  if ((unint64_t)(v3 - 139) < 2 || v3 == 58)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addInputWithElement:", v6);
  }
  else
  {
    v4 = v3 == 138;
    v5 = v6;
    if (!v4)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "_addLabelWithElement:", v6);
  }
  v5 = v6;
LABEL_8:

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUITextFieldSettingDescriptionView _updateTextFieldValue:](self, "_updateTextFieldValue:", v4);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUITextFieldSettingDescriptionView _updateTextFieldValue:](self, "_updateTextFieldValue:", v11);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;

  -[SKUIFieldSettingDescription controller](self->_settingDescription, "controller", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(v4, "returnInSettingDescription:", self->_settingDescription);

  return 0;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUITextFieldSettingDescriptionView;
  -[SKUITextFieldSettingDescriptionView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SKUITextFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  UITextField *textField;
  UITextField *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUITextFieldSettingDescriptionView;
  -[SKUITextFieldSettingDescriptionView layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  textField = self->_textField;
  if (self->_label || !textField)
  {
    -[SKUITextFieldSettingDescriptionView _arrangeTextField:andLabel:](self, "_arrangeTextField:andLabel:", textField);
  }
  else
  {
    -[UITextField setFont:](self->_textField, "setFont:", v3);
    v5 = self->_textField;
    -[UITextField _placeholderLabel](v5, "_placeholderLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITextFieldSettingDescriptionView _fillLayoutWithView:labelForBaselinePosition:](self, "_fillLayoutWithView:labelForBaselinePosition:", v5, v6);

  }
}

- (void)_addInputWithElement:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    -[SKUITextFieldSettingDescriptionView _addTextInputWithElement:](self, "_addTextInputWithElement:", v5);

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

  -[SKUITextFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_label);
}

- (void)_addTextInputWithElement:(id)a3
{
  UITextField *v4;
  UITextField *textField;
  UITextField *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
  textField = self->_textField;
  self->_textField = v4;

  -[UITextField setSecureTextEntry:](self->_textField, "setSecureTextEntry:", objc_msgSend(v15, "isSecure"));
  v6 = self->_textField;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](v6, "setTextColor:", v7);

  -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
  -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", 1);
  -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 0);
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", objc_msgSend(v15, "keyboardType"));
  -[SKUITextFieldSettingDescriptionView _currentControllerValue](self, "_currentControllerValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UITextField setText:](self->_textField, "setText:", v8);
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E0DC1140], 0);

  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v15, "placeholderText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v11);

  -[UITextField setAttributedPlaceholder:](self->_textField, "setAttributedPlaceholder:", v14);
  -[SKUITextFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_textField);

}

- (void)_alignView:(id)a3 withBaselineLabel:(id)a4 font:(id)a5 offsetX:(double)a6 fitWidth:(double)a7
{
  id v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  id v27;

  v12 = a5;
  v13 = a4;
  v27 = a3;
  -[SKUITextFieldSettingDescriptionView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v12, "_scaledValueForValue:", 30.0);
  v23 = v22;

  objc_msgSend(v13, "_firstBaselineOffsetFromTop");
  v25 = v24;

  objc_msgSend(v27, "sizeThatFits:", a7, 1.0);
  SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(a6, v23 - v25, a7, v26, v15, v17, v19, v21);
  objc_msgSend(v27, "setFrame:");

}

- (void)_arrangeTextField:(id)a3 andLabel:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  id v22;
  CGRect v23;

  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4A88];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "preferredFontForTextStyle:", v7);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v11 = v10;
  v13 = v12;
  -[SKUITextFieldSettingDescriptionView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[SKUITextFieldSettingDescriptionView _alignView:withBaselineLabel:font:offsetX:fitWidth:](self, "_alignView:withBaselineLabel:font:offsetX:fitWidth:", v8, v8, v22, v11, self->_aggregateLabelWidth);
  v23.origin.x = v15;
  v23.origin.y = v17;
  v23.size.width = v19;
  v23.size.height = v21;
  -[SKUITextFieldSettingDescriptionView _alignView:withBaselineLabel:font:offsetX:fitWidth:](self, "_alignView:withBaselineLabel:font:offsetX:fitWidth:", v9, v8, v22, v11 + self->_aggregateLabelWidth + 16.0, CGRectGetWidth(v23) - (v11 + self->_aggregateLabelWidth + 16.0) - v13);

}

- (id)_currentControllerValue
{
  void *v3;
  void *v4;

  -[SKUIFieldSettingDescription controller](self->_settingDescription, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v3, "valueForSettingDescription:", self->_settingDescription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateTextFieldValue:(id)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = (const __CFString *)a3;
  if (!v4)
    v4 = &stru_1E73A9FB0;
  v7 = (__CFString *)v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("value"), 0);
  -[SKUIInputViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_inputViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v5, 0);
  -[SKUIFieldSettingDescription controller](self->_settingDescription, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(v6, "setValue:forSettingDescription:", v7, self->_settingDescription);

}

- (void)_fillLayoutWithView:(id)a3 labelForBaselinePosition:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4A88];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "preferredFontForTextStyle:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v11 = v10;
  v13 = v12;
  -[SKUITextFieldSettingDescriptionView bounds](self, "bounds");
  -[SKUITextFieldSettingDescriptionView _alignView:withBaselineLabel:font:offsetX:fitWidth:](self, "_alignView:withBaselineLabel:font:offsetX:fitWidth:", v9, v8, v14, v11, CGRectGetWidth(v15) - v11 - v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

- (void)setEnabled:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
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

@end
