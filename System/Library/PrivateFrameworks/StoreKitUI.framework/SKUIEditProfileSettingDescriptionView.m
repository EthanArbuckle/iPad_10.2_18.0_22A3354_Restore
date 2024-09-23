@implementation SKUIEditProfileSettingDescriptionView

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
        +[SKUIEditProfileSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIEditProfileSettingDescriptionView preferredSizeForSettingDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
      +[SKUIEditProfileSettingDescriptionView requestLayoutForSettingDescription:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIEditProfileSettingDescriptionView sizeThatFitsWidth:settingDescription:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(a1, "_baselineFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_scaledValueForValue:", 48.0);
  v17 = v16 + v16;

  v18 = a3;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SKUIEditProfileSettingDescription **p_settingDescription;
  id v9;
  SKUIClientContext *v10;
  SKUIClientContext *clientContext;
  SKUIImageView *imageView;
  SKUIImageView *v13;
  SKUIImageView *v14;
  void *v15;
  UIButton *v16;
  UIButton *editButton;
  SKUIClientContext *v18;
  void *v19;
  void *v20;
  void *v21;
  UITextField *nameField;
  SKUIClientContext *v23;
  void *v24;
  UITextField *v25;
  UITextField *v26;
  void *v27;
  UITextField *handleField;
  SKUIClientContext *v29;
  void *v30;
  UITextField *v31;
  UITextField *v32;
  void *v33;
  CALayer *v34;
  CALayer *divider1;
  CALayer *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;

  v40 = a3;
  p_settingDescription = &self->_settingDescription;
  objc_storeStrong((id *)&self->_settingDescription, a3);
  v9 = a5;
  objc_msgSend(v9, "clientContext");
  v10 = (SKUIClientContext *)objc_claimAutoreleasedReturnValue();

  clientContext = self->_clientContext;
  self->_clientContext = v10;

  imageView = self->_imageView;
  if (!imageView)
  {
    v13 = objc_alloc_init(SKUIImageView);
    v14 = self->_imageView;
    self->_imageView = v13;

    -[SKUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  -[SKUIEditProfileSettingDescription photo](*p_settingDescription, "photo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIImageView setImage:](imageView, "setImage:", v15);

  if (!self->_editButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
    editButton = self->_editButton;
    self->_editButton = v16;

    v18 = self->_clientContext;
    if (v18)
      -[SKUIClientContext localizedStringForKey:inTable:](v18, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_BUTTON_LABEL"), CFSTR("Settings"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_BUTTON_LABEL"), 0, CFSTR("Settings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](self->_editButton, "setTitle:forState:", v19, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_editButton, "addTarget:action:forControlEvents:", self, sel__editProfilePhoto, 64);
    -[UIButton titleLabel](self->_editButton, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v21);

    -[SKUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_editButton);
  }
  nameField = self->_nameField;
  if (!nameField)
  {
    v23 = self->_clientContext;
    if (v23)
      -[SKUIClientContext localizedStringForKey:inTable:](v23, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_NAME"), CFSTR("Settings"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_NAME"), 0, CFSTR("Settings"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditProfileSettingDescriptionView _textFieldWithPlaceholder:](self, "_textFieldWithPlaceholder:", v24);
    v25 = (UITextField *)objc_claimAutoreleasedReturnValue();
    v26 = self->_nameField;
    self->_nameField = v25;

    -[UITextField setAutocapitalizationType:](self->_nameField, "setAutocapitalizationType:", 1);
    -[UITextField setAutocorrectionType:](self->_nameField, "setAutocorrectionType:", 1);
    -[SKUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_nameField);
    nameField = self->_nameField;
  }
  -[SKUIEditProfileSettingDescription name](*p_settingDescription, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](nameField, "setText:", v27);

  handleField = self->_handleField;
  if (!handleField)
  {
    v29 = self->_clientContext;
    if (v29)
      -[SKUIClientContext localizedStringForKey:inTable:](v29, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE"), CFSTR("Settings"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE"), 0, CFSTR("Settings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditProfileSettingDescriptionView _textFieldWithPlaceholder:](self, "_textFieldWithPlaceholder:", v30);
    v31 = (UITextField *)objc_claimAutoreleasedReturnValue();
    v32 = self->_handleField;
    self->_handleField = v31;

    -[UITextField setAutocapitalizationType:](self->_handleField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](self->_handleField, "setAutocorrectionType:", 1);
    -[UITextField _setPrefix:](self->_handleField, "_setPrefix:", CFSTR("@"));
    -[SKUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_handleField);
    handleField = self->_handleField;
  }
  -[SKUIEditProfileSettingDescription handle](*p_settingDescription, "handle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](handleField, "setText:", v33);

  if (!self->_divider1)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v34 = (CALayer *)objc_claimAutoreleasedReturnValue();
    divider1 = self->_divider1;
    self->_divider1 = v34;

    v36 = self->_divider1;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v36, "setBackgroundColor:", objc_msgSend(v37, "CGColor"));

    -[SKUIEditProfileSettingDescriptionView layer](self, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSublayer:", self->_divider1);

  }
  v39 = -[SKUIEditProfileSettingDescription isEditing](*p_settingDescription, "isEditing");
  -[UIButton setHidden:](self->_editButton, "setHidden:", v39 ^ 1);
  -[UITextField setEnabled:](self->_nameField, "setEnabled:", v39);
  -[UITextField setEnabled:](self->_handleField, "setEnabled:", v39);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", self->_handleField))
    -[SKUIEditProfileSettingDescriptionView _updateHandleTextFieldValidity](self, "_updateHandleTextFieldValidity");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  int v4;
  UITextField *handleField;

  v4 = objc_msgSend(a3, "isEqual:", self->_nameField);
  handleField = self->_handleField;
  if (v4)
    -[UITextField becomeFirstResponder](handleField, "becomeFirstResponder");
  else
    -[UITextField resignFirstResponder](handleField, "resignFirstResponder");
  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqual:", self->_nameField))
  {
    -[SKUIEditProfileSettingDescription setName:](self->_settingDescription, "setName:", v12);
  }
  else if (objc_msgSend(v9, "isEqual:", self->_handleField))
  {
    -[SKUIEditProfileSettingDescriptionView _updateHandleTextFieldValidity](self, "_updateHandleTextFieldValidity");
  }

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  SKUIEditProfileSettingDescription *settingDescription;
  void *v5;
  SKUIEditProfileSettingDescription *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isEqual:", self->_nameField))
  {
    settingDescription = self->_settingDescription;
    objc_msgSend(v7, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditProfileSettingDescription setName:](settingDescription, "setName:", v5);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqual:", self->_handleField))
  {
    v6 = self->_settingDescription;
    objc_msgSend(v7, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditProfileSettingDescription setHandle:](v6, "setHandle:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  int ShouldReverseLayoutDirection;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  UIButton *editButton;
  CGFloat v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  UITextField *nameField;
  void *v42;
  double v43;
  CGFloat v44;
  CALayer *divider1;
  UITextField *handleField;
  SKUIImageView *imageView;
  CGFloat v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v56.receiver = self;
  v56.super_class = (Class)SKUIEditProfileSettingDescriptionView;
  -[SKUIEditProfileSettingDescriptionView layoutSubviews](&v56, sel_layoutSubviews);
  -[SKUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v53 = v5;
  -[SKUIEditProfileSettingDescriptionView bounds](self, "bounds");
  v7 = v6;
  v51 = v8;
  v52 = v6;
  v10 = v9;
  v55 = v11;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  -[UIButton titleLabel](self->_editButton, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);
  objc_msgSend(v14, "_scaledValueForValue:", 16.0);
  v16 = v15;
  -[UIButton sizeThatFits:](self->_editButton, "sizeThatFits:", 1.0, 1.0);
  v18 = v17;
  v20 = v19;
  v57.origin.y = 8.0;
  v57.origin.x = v4;
  v57.size.width = 56.0;
  v57.size.height = 56.0;
  v21 = v16 + CGRectGetMaxY(v57);
  objc_msgSend(v13, "_firstBaselineOffsetFromTop");
  v23 = v21 - v22;
  v58.origin.y = 8.0;
  v58.origin.x = v4;
  v58.size.width = 56.0;
  v58.size.height = 56.0;
  v24 = floor((CGRectGetWidth(v58) - v18) * 0.5);
  v59.origin.y = 8.0;
  v59.origin.x = v4;
  v59.size.width = 56.0;
  v59.size.height = 56.0;
  v25 = CGRectGetMinX(v59) + v24;
  editButton = self->_editButton;
  v27 = v10;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v25, v23, v18, v20, v7, v10, v55, v51);
  -[UIButton setFrame:](editButton, "setFrame:");
  v28 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_nameField, "setFont:", v29);
  -[UITextField setFont:](self->_handleField, "setFont:", v29);
  if (ShouldReverseLayoutDirection)
    v30 = 2;
  else
    v30 = 0;
  -[UITextField setTextAlignment:](self->_nameField, "setTextAlignment:", v30);
  -[UITextField setTextAlignment:](self->_handleField, "setTextAlignment:", v30);
  objc_msgSend((id)objc_opt_class(), "_baselineFontForTextStyle:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_scaledValueForValue:", 30.0);
  v33 = v32;
  objc_msgSend(v31, "_scaledValueForValue:", 18.0);
  v50 = v33 + v34;
  -[UITextField _placeholderLabel](self->_nameField, "_placeholderLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60.origin.y = 8.0;
  v60.origin.x = v4;
  v60.size.width = 56.0;
  v60.size.height = 56.0;
  v36 = CGRectGetMaxX(v60) + 16.0;
  objc_msgSend(v35, "_firstBaselineOffsetFromTop");
  v38 = v33 - v37;
  v49 = v33 - v37;
  v61.origin.x = v52;
  v61.origin.y = v10;
  v61.size.width = v55;
  v61.size.height = v51;
  v39 = CGRectGetWidth(v61) - v36 - v53;
  v62.origin.x = v52;
  v62.origin.y = v10;
  v62.size.width = v55;
  v62.size.height = v51;
  v48 = CGRectGetWidth(v62) - v36;
  -[UITextField sizeThatFits:](self->_nameField, "sizeThatFits:", v39, 1.0);
  v54 = v40;
  nameField = self->_nameField;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v36, v38 + 0.0, v39, v40, v52, v10, v55, v51);
  -[UITextField setFrame:](nameField, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "scale");
  v44 = 1.0 / v43;

  divider1 = self->_divider1;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v36, v50 + 0.0, v48, v44, v52, v27, v55, v51);
  -[CALayer setFrame:](divider1, "setFrame:");
  handleField = self->_handleField;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v36, v50 + 0.0 + v49, v39, v54, v52, v27, v55, v51);
  -[UITextField setFrame:](handleField, "setFrame:");
  imageView = self->_imageView;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4, 8.0, 56.0, 56.0, v52, v27, v55, v51);
  -[SKUIImageView setFrame:](imageView, "setFrame:");

}

+ (id)_baselineFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 0, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateHandleTextFieldValidity
{
  SKUIEditProfileSettingDescription *settingDescription;
  void *v4;
  _BOOL4 v5;
  UITextField *handleField;
  id v7;

  settingDescription = self->_settingDescription;
  -[UITextField text](self->_handleField, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditProfileSettingDescription setHandle:](settingDescription, "setHandle:", v4);

  v5 = -[SKUIEditProfileSettingDescription isHandleValid](self->_settingDescription, "isHandleValid");
  handleField = self->_handleField;
  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](handleField, "setTextColor:", v7);

}

- (void)_editProfilePhoto
{
  -[SKUIEditProfileSettingDescription chooseNewProfilePhoto](self->_settingDescription, "chooseNewProfilePhoto");
}

- (id)_textFieldWithPlaceholder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x1E0DC3DB8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v11, *MEMORY[0x1E0DC1140], 0);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v12);
  objc_msgSend(v7, "setAttributedPlaceholder:", v13);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_handleField, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_divider1, 0);
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
