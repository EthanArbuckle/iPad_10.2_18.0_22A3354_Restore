@implementation PKPaymentSetupFieldCell

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldCell;
  v4 = a3;
  -[PKTableViewCell pk_applyAppearance:](&v6, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "tintColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupFieldCell setEditableTextFieldCameraCapturedTextColor:](self, "setEditableTextFieldCameraCapturedTextColor:", v5);
}

+ (id)paymentSetupFieldCellForField:(id)a3 fromTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D6AF58]);

  if (v9)
    a1 = (id)objc_opt_class();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D6AF00]);

  if (v11)
    a1 = (id)objc_opt_class();
  if (objc_msgSend(v6, "isFieldTypeLabel"))
    a1 = (id)objc_opt_class();
  if (objc_msgSend(v6, "isFieldTypePicker"))
  {
    objc_msgSend(v6, "pickerFieldObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "pickerType");

    if (v13 == 3)
      a1 = (id)objc_opt_class();
  }
  objc_msgSend(a1, "reuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
    v15 = objc_alloc_init((Class)a1);
  objc_msgSend(v15, "setPaymentSetupField:", v6);
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v16);

  return v15;
}

- (PKPaymentSetupFieldCell)init
{
  void *v3;
  PKPaymentSetupFieldCell *v4;
  PKUITextField *v5;
  PKUITextField *textField;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIListContentConfiguration *referenceConfiguration;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *defaultLeadingBarButtonGroups;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *defaultTrailingBarButtonGroups;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *defaultCenterBarButtonGroups;
  uint64_t v25;
  UIColor *editableTextFieldTextColor;
  uint64_t v27;
  UIColor *editableTextFieldDisabledTextColor;
  uint64_t v29;
  UIColor *editableTextFieldCameraCapturedTextColor;
  void *v31;
  objc_super v33;

  objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentSetupFieldCell;
  v4 = -[PKPaymentSetupFieldCell initWithStyle:reuseIdentifier:](&v33, sel_initWithStyle_reuseIdentifier_, 0, v3);

  if (v4)
  {
    v5 = objc_alloc_init(PKUITextField);
    textField = v4->_textField;
    v4->_textField = v5;

    -[PKUITextField setAllowsTextFromCamera:](v4->_textField, "setAllowsTextFromCamera:", 0);
    -[PKPaymentSetupFieldCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_textField);

    -[PKPaymentSetupFieldCell setEnabled:](v4, "setEnabled:", 1);
    -[PKPaymentSetupFieldCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 0);
    -[PKPaymentSetupFieldCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[PKPaymentSetupFieldCell editableTextField](v4, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v4, sel__editableTextFieldDidBeginEditing_, 0x10000);

    -[PKPaymentSetupFieldCell editableTextField](v4, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", v4, sel__editableTextFieldValueChanged_, 0x20000);

    -[PKPaymentSetupFieldCell editableTextField](v4, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v4, sel__editableTextFieldDidEndEditing_, 0x40000);

    -[PKPaymentSetupFieldCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[PKPaymentSetupFieldCell setShouldDrawFullWidthSeperator:](v4, "setShouldDrawFullWidthSeperator:", 0);
    -[PKPaymentSetupFieldCell setShouldDrawSeperator:](v4, "setShouldDrawSeperator:", 1);
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    referenceConfiguration = v4->_referenceConfiguration;
    v4->_referenceConfiguration = (UIListContentConfiguration *)v11;

    -[PKPaymentSetupFieldCell editableTextField](v4, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputAssistantItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingBarButtonGroups");
    v15 = objc_claimAutoreleasedReturnValue();
    defaultLeadingBarButtonGroups = v4->_defaultLeadingBarButtonGroups;
    v4->_defaultLeadingBarButtonGroups = (NSArray *)v15;

    -[PKPaymentSetupFieldCell editableTextField](v4, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputAssistantItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingBarButtonGroups");
    v19 = objc_claimAutoreleasedReturnValue();
    defaultTrailingBarButtonGroups = v4->_defaultTrailingBarButtonGroups;
    v4->_defaultTrailingBarButtonGroups = (NSArray *)v19;

    -[PKPaymentSetupFieldCell editableTextField](v4, "editableTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "inputAssistantItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_centerBarButtonGroups");
    v23 = objc_claimAutoreleasedReturnValue();
    defaultCenterBarButtonGroups = v4->_defaultCenterBarButtonGroups;
    v4->_defaultCenterBarButtonGroups = (NSArray *)v23;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = objc_claimAutoreleasedReturnValue();
    editableTextFieldTextColor = v4->_editableTextFieldTextColor;
    v4->_editableTextFieldTextColor = (UIColor *)v25;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = objc_claimAutoreleasedReturnValue();
    editableTextFieldDisabledTextColor = v4->_editableTextFieldDisabledTextColor;
    v4->_editableTextFieldDisabledTextColor = (UIColor *)v27;

    -[PKPaymentSetupFieldCell tintColor](v4, "tintColor");
    v29 = objc_claimAutoreleasedReturnValue();
    editableTextFieldCameraCapturedTextColor = v4->_editableTextFieldCameraCapturedTextColor;
    v4->_editableTextFieldCameraCapturedTextColor = (UIColor *)v29;

    PKProvisioningSecondaryBackgroundColor();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldCell setBackgroundColor:](v4, "setBackgroundColor:", v31);

    v4->_hidePrediction = 0;
    v4->_canResignFirstResponder = 1;
    v4->_isShowingError = 0;
  }
  return v4;
}

- (PKPaymentSetupFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[PKPaymentSetupFieldCell initWithSetupField:](self, "initWithSetupField:", 0, a4);
}

- (PKPaymentSetupFieldCell)initWithSetupField:(id)a3
{
  id v4;
  PKPaymentSetupFieldCell *v5;
  PKPaymentSetupFieldCell *v6;

  v4 = a3;
  v5 = -[PKPaymentSetupFieldCell init](self, "init");
  v6 = v5;
  if (v5)
    -[PKPaymentSetupFieldCell setPaymentSetupField:](v5, "setPaymentSetupField:", v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldCell;
  -[PKPaymentSetupFieldCell dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSString *v25;
  _BOOL4 IsAccessibilityCategory;
  double minimumTextLabelWidth;
  double v28;
  double MaxY;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat MaxX;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v48.receiver = self;
  v48.super_class = (Class)PKPaymentSetupFieldCell;
  -[PKPaymentSetupFieldCell layoutSubviews](&v48, sel_layoutSubviews);
  -[PKPaymentSetupFieldCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPaymentSetupFieldCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v46 = v7;
    v47 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "frame");
    objc_msgSend(v4, "sizeThatFits:", v9, v11);
    v12 = -[PKPaymentSetupFieldCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UIListContentConfiguration directionalLayoutMargins](self->_referenceConfiguration, "directionalLayoutMargins");
    v16 = v15;
    v17 = v13;
    v19 = v18;
    v20 = v14;
    if (v12)
      v21 = v14;
    else
      v21 = v13;
    if (objc_msgSend(v4, "textAlignment") != 2 || v12)
    {
      if (!v12)
        v17 = v20;
      objc_msgSend(v4, "textAlignment");
    }
    v45 = v47 + v21;
    v22 = v9 - (v21 + v17);
    v44 = v11 - (v16 + v19);
    objc_msgSend(v3, "sizeThatFits:", v22);
    v42 = v23;
    -[PKPaymentSetupFieldCell traitCollection](self, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "preferredContentSizeCategory");
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

    minimumTextLabelWidth = 0.0;
    if (!IsAccessibilityCategory)
      minimumTextLabelWidth = self->_minimumTextLabelWidth;
    v43 = v46 + v16;
    UIRectCenteredYInRect();
    MaxY = v28;
    v31 = v30;
    UIRectCenteredYInRect();
    v34 = v33;
    if (IsAccessibilityCategory)
    {
      v35 = v45;
      v36 = v45;
      if (v12)
      {
        v49.origin.x = v45;
        v49.origin.y = v43;
        v49.size.height = v44;
        v49.size.width = v22;
        v36 = CGRectGetMaxX(v49) - v22;
      }
      objc_msgSend(v3, "setFrame:", v36, v46 + 22.0, v22, v34);
      v50.origin.x = v36;
      v50.origin.y = v46 + 22.0;
      v50.size.width = v22;
      v50.size.height = v34;
      MaxY = CGRectGetMaxY(v50);
    }
    else
    {
      v37 = v32;
      v38 = fmin(fmax(v42, minimumTextLabelWidth), v22 + -122.0);
      v35 = v45;
      if ((v12 & 1) != 0)
      {
        v51.origin.x = v45;
        v51.origin.y = v43;
        v51.size.height = v44;
        v51.size.width = v22;
        MaxX = CGRectGetMaxX(v51);
        v40 = MaxX - v38;
        objc_msgSend(v3, "setFrame:", MaxX - v38, v37, v38, v34);
        v22 = v40 - v45 + -22.0;
      }
      else
      {
        objc_msgSend(v3, "setFrame:", v45, v32, v38, v33);
        v52.origin.x = v45;
        v52.origin.y = v37;
        v52.size.width = v38;
        v52.size.height = v34;
        v41 = CGRectGetMaxX(v52) + 22.0;
        v53.origin.x = v45;
        v53.origin.y = v43;
        v53.size.height = v44;
        v53.size.width = v22;
        v22 = CGRectGetMaxX(v53) - v41;
        v35 = v41;
      }
    }
    objc_msgSend(v4, "setFrame:", v35, MaxY, v22, v31);

  }
}

- (BOOL)usesCustomInputView
{
  if ((-[PKPaymentSetupField isFieldTypeDate](self->_paymentSetupField, "isFieldTypeDate") & 1) != 0)
    return 1;
  else
    return -[PKPaymentSetupField isFieldTypePicker](self->_paymentSetupField, "isFieldTypePicker");
}

- (void)setPaymentSetupField:(id)a3
{
  PKPaymentSetupField *v5;
  PKPaymentSetupField **p_paymentSetupField;
  PKPaymentSetupField *paymentSetupField;
  _QWORD *v8;
  void *v9;
  void *v10;
  PKPaymentSetupField *v11;

  v5 = (PKPaymentSetupField *)a3;
  p_paymentSetupField = &self->_paymentSetupField;
  paymentSetupField = self->_paymentSetupField;
  if (paymentSetupField != v5)
  {
    v11 = v5;
    v8 = (_QWORD *)MEMORY[0x1E0D6AED0];
    if (paymentSetupField)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, *v8, *p_paymentSetupField);

    }
    objc_storeStrong((id *)&self->_paymentSetupField, a3);
    if (*p_paymentSetupField)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__paymentSetupFieldCurrentValueChangedNotification_, *v8, *p_paymentSetupField);

    }
    -[PKPaymentSetupFieldCell _updateDisplay:](self, "_updateDisplay:", 1);
    v5 = v11;
  }

}

- (void)setMinimumTextLabelWidth:(double)a3
{
  if (self->_minimumTextLabelWidth != a3)
  {
    self->_minimumTextLabelWidth = a3;
    -[PKPaymentSetupFieldCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (-[PKPaymentSetupField source](self->_paymentSetupField, "source") == 1
      && -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled"))
    {
      -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextColor:", self->_editableTextFieldCameraCapturedTextColor);
    }
    else
    {
      -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v4 = -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled");
      v5 = 6;
      if (v4)
        v5 = 5;
      objc_msgSend(v6, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___PKPaymentSetupFieldCell__textField[v5]));
    }

  }
}

- (void)setHidePrediction:(BOOL)a3
{
  id v4;

  if (self->_hidePrediction != a3)
  {
    self->_hidePrediction = a3;
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidePrediction:", self->_hidePrediction);

  }
}

- (void)setEditableTextFieldCameraCapturedTextColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;
  UIColor *editableTextFieldCameraCapturedTextColor;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  UIColor *v11;

  v4 = (UIColor *)a3;
  v5 = v4;
  if (self->_editableTextFieldCameraCapturedTextColor != v4)
  {
    v11 = v4;
    v6 = (UIColor *)-[UIColor copy](v4, "copy");
    editableTextFieldCameraCapturedTextColor = self->_editableTextFieldCameraCapturedTextColor;
    self->_editableTextFieldCameraCapturedTextColor = v6;

    v8 = -[PKPaymentSetupField source](self->_paymentSetupField, "source");
    v5 = v11;
    if (v8 == 1)
    {
      v9 = -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled");
      v5 = v11;
      if (v9)
      {
        -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTextColor:", self->_editableTextFieldCameraCapturedTextColor);

        v5 = v11;
      }
    }
  }

}

- (void)_updateDisplay:(BOOL)a3
{
  uint64_t v4;
  PKPaymentSetupField *paymentSetupField;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PKPaymentSetupField *v12;
  NSObject *v13;
  int v14;
  PKPaymentSetupField *v15;
  int v16;
  PKPaymentSetupField *v17;
  void *v18;
  uint8_t v19[16];

  if (a3)
    -[PKPaymentSetupFieldCell _applyDefaultValues](self, "_applyDefaultValues");
  v4 = PKUIGetMinScreenWidthType();
  paymentSetupField = self->_paymentSetupField;
  if (v4)
    -[PKPaymentSetupField localizedDisplayName](paymentSetupField, "localizedDisplayName");
  else
    -[PKPaymentSetupField compactLocalizedDisplayName](paymentSetupField, "compactLocalizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[PKPaymentSetupField localizedPlaceholder](self->_paymentSetupField, "localizedPlaceholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaceholder:", v8);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  v11 = -[PKPaymentSetupField isFieldTypeText](self->_paymentSetupField, "isFieldTypeText");
  v12 = self->_paymentSetupField;
  if (v11)
  {
    -[PKPaymentSetupField textFieldObject](v12, "textFieldObject");
    v13 = objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldCell _updateDisplayForFieldTypeText:](self, "_updateDisplayForFieldTypeText:", v13);
  }
  else
  {
    v14 = -[PKPaymentSetupField isFieldTypeDate](v12, "isFieldTypeDate");
    v15 = self->_paymentSetupField;
    if (v14)
    {
      -[PKPaymentSetupField dateFieldObject](v15, "dateFieldObject");
      v13 = objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldCell _updateDisplayForFieldTypeDate:](self, "_updateDisplayForFieldTypeDate:", v13);
    }
    else
    {
      v16 = -[PKPaymentSetupField isFieldTypePicker](v15, "isFieldTypePicker");
      v17 = self->_paymentSetupField;
      if (v16)
      {
        -[PKPaymentSetupField pickerFieldObject](v17, "pickerFieldObject");
        v13 = objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldCell _updateDisplayForFieldTypePicker:](self, "_updateDisplayForFieldTypePicker:", v13);
      }
      else
      {
        if (-[PKPaymentSetupField fieldType](v17, "fieldType"))
          goto LABEL_13;
        PKLogFacilityTypeGetObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Error: PKPaymentSetupFieldTypeUnknown field type cells are not currently supported!", v19, 2u);
        }
      }
    }
  }

LABEL_13:
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIsAccessibilityElement:", -[PKPaymentSetupField preventVoiceOver](self->_paymentSetupField, "preventVoiceOver") ^ 1);

  -[PKPaymentSetupFieldCell _pullCurrentValueFromField](self, "_pullCurrentValueFromField");
}

- (void)_applyDefaultValues
{
  NSString *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  PKDatePicker *dateInputView;
  PKDatePicker *v14;
  UIPickerView *pickerInputView;
  UIPickerView *v16;
  id v17;

  v3 = (NSString *)*MEMORY[0x1E0DC4A88];
  v4 = (NSString *)*MEMORY[0x1E0DC48F0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48F0], 2, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v17);
  objc_msgSend(v5, "setBaselineAdjustment:", 1);
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v5, "setText:", 0);
  PKFontForDefaultDesign(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);
  objc_msgSend(v7, "setText:", 0);
  objc_msgSend(v7, "setSecureTextEntry:", 0);
  objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", 0);
  PKLocalizedPaymentString(CFSTR("REQUIRED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v8);

  objc_msgSend(v7, "setClearButtonMode:", 1);
  objc_msgSend(v7, "setAutocorrectionType:", 1);
  objc_msgSend(v7, "setAutocapitalizationType:", 1);
  objc_msgSend(v7, "setKeyboardType:", 0);
  objc_msgSend(v7, "setInputView:", 0);
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v7, "setHidePrediction:", self->_hidePrediction);
  objc_msgSend(v7, "inputAssistantItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrailingBarButtonGroups:", self->_defaultTrailingBarButtonGroups);
  objc_msgSend(v9, "setLeadingBarButtonGroups:", self->_defaultLeadingBarButtonGroups);
  objc_msgSend(v9, "_setCenterBarButtonGroups:", self->_defaultCenterBarButtonGroups);
  if (-[PKPaymentSetupField source](self->_paymentSetupField, "source") == 1
    && -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled"))
  {
    v10 = &OBJC_IVAR___PKPaymentSetupFieldCell__editableTextFieldCameraCapturedTextColor;
  }
  else
  {
    v11 = -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled");
    v12 = 6;
    if (v11)
      v12 = 5;
    v10 = &OBJC_IVAR___PKPaymentSetupFieldCell__textField[v12];
  }
  objc_msgSend(v7, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v10));
  dateInputView = self->_dateInputView;
  if (dateInputView)
  {
    -[PKDatePicker setDelegate:](dateInputView, "setDelegate:", 0);
    v14 = self->_dateInputView;
    self->_dateInputView = 0;

  }
  pickerInputView = self->_pickerInputView;
  if (pickerInputView)
  {
    -[UIPickerView setDelegate:](pickerInputView, "setDelegate:", 0);
    -[UIPickerView setDataSource:](self->_pickerInputView, "setDataSource:", 0);
    v16 = self->_pickerInputView;
    self->_pickerInputView = 0;

  }
}

- (void)_updateDisplayForFieldTypeText:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  if ((objc_msgSend(v24, "isNumericFractional") & 1) != 0)
  {
    v6 = 8;
  }
  else if (objc_msgSend(v24, "isNumeric"))
  {
    v6 = 11;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v24, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF10]))
  {
    v8 = (id *)MEMORY[0x1E0DC5448];
LABEL_18:
    v9 = *v8;
    v10 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF58]))
  {
    v8 = (id *)MEMORY[0x1E0DC5410];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF48]))
  {
    v9 = (id)*MEMORY[0x1E0DC5490];
    v10 = 1;
    v6 = 5;
    goto LABEL_19;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF70]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AEE0]))
  {
    v8 = (id *)MEMORY[0x1E0DC5478];
    goto LABEL_18;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF78]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AEE8]))
  {
    v8 = (id *)MEMORY[0x1E0DC5480];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF80]))
  {
    v8 = (id *)MEMORY[0x1E0DC5488];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF50]))
  {
    v8 = (id *)MEMORY[0x1E0DC5470];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF18]))
  {
    v8 = (id *)MEMORY[0x1E0DC5400];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF68]))
  {
    v8 = (id *)MEMORY[0x1E0DC5408];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF30]))
  {
    v8 = (id *)MEMORY[0x1E0DC5438];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF38]))
  {
    v8 = (id *)MEMORY[0x1E0DC5428];
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF28]))
  {
    v8 = (id *)MEMORY[0x1E0DC5418];
    goto LABEL_18;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF88]) & 1) != 0)
  {
    v9 = 0;
    v10 = 0;
    v6 = 8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AF40]))
      v6 = 8;
  }
LABEL_19:
  v11 = objc_msgSend(v24, "isSecureText");
  v12 = objc_msgSend(v24, "isSecureVisibleText");
  v13 = PKSensitiveFieldBroadcastingEnabled();
  v14 = (v13 ^ 1) & v11;
  v15 = (v13 ^ 1) & v12;
  v16 = -[PKPaymentSetupFieldCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v17 = objc_msgSend(v4, "textAlignment");
  v18 = objc_msgSend(v4, "clearButtonMode");
  v19 = objc_msgSend(v24, "alignment");
  v20 = 2;
  if (v16)
    v20 = 0;
  v21 = 2;
  if (!v16)
    v21 = 0;
  if (v19 != 1)
    v21 = v17;
  if (v19 == 2)
    v22 = v20;
  else
    v22 = v21;
  if (v19 == 2)
    v23 = 0;
  else
    v23 = v18;
  objc_msgSend(v4, "setKeyboardType:", v6);
  objc_msgSend(v4, "setTextContentType:", v9);
  objc_msgSend(v4, "setContentsIsSingleValue:", v10);
  objc_msgSend(v4, "setSecureTextEntry:", v14);
  objc_msgSend(v4, "setDisplaySecureTextUsingPlainText:", v15);
  objc_msgSend(v4, "setSmartInsertDeleteType:", 1);
  objc_msgSend(v4, "setTextAlignment:", v22);
  objc_msgSend(v4, "setClearButtonMode:", v23);
  if ((v14 & v15) == 1)
    objc_msgSend(v4, "setAutocapitalizationType:", 1);
  objc_msgSend(v4, "pkui_setExcludedFromScreenCapture:andBroadcasting:", v14 & v15, v14 & v15);
  if (objc_msgSend(v24, "hasDisplayFormat"))
    objc_msgSend(v4, "setAutocapitalizationType:", 3);

}

- (void)_updateDisplayForFieldTypeDate:(id)a3
{
  PKDatePicker *v4;
  PKDatePicker *dateInputView;
  void *v6;
  uint64_t v7;
  void *v8;
  PKDatePicker *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  PKDatePicker *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PKDatePicker *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  if (!self->_dateInputView)
  {
    v4 = objc_alloc_init(PKDatePicker);
    dateInputView = self->_dateInputView;
    self->_dateInputView = v4;

  }
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  objc_msgSend(v6, "setSecureTextEntry:", 1);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplaySecureTextUsingPlainText:", 1);

  -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](self->_dateInputView, "pkui_setExcludedFromScreenCapture:andBroadcasting:", objc_msgSend(v31, "isSecureText"), objc_msgSend(v31, "isSecureText"));
  v9 = self->_dateInputView;
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v10 = objc_claimAutoreleasedReturnValue();
  -[PKDatePicker setUsesDarkAppearance:](v9, "setUsesDarkAppearance:", objc_msgSend((id)v10, "keyboardAppearance") == 1);

  objc_msgSend(v31, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D6AEF8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v31, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D6AF20]);

    if (v13)
      v7 = 2;
    else
      v7 = 0;
  }
  v14 = self->_dateInputView;
  v15 = objc_msgSend(v31, "showsDay");
  v16 = objc_msgSend(v31, "showsMonth");
  v17 = objc_msgSend(v31, "showsYear");
  objc_msgSend(v31, "locale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "calendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDatePicker reconfigureToShowDay:month:year:style:locale:calendar:](v14, "reconfigureToShowDay:month:year:style:locale:calendar:", v15, v16, v17, v7, v18, v19);

  -[PKDatePicker setDelegate:](self->_dateInputView, "setDelegate:", self);
  v20 = self->_dateInputView;
  -[PKTableViewCell customAccessoryColor](self, "customAccessoryColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[PKDatePicker setBackgroundColor:](v20, "setBackgroundColor:", v21);
  }
  else
  {
    -[PKPaymentSetupFieldCell backgroundColor](self, "backgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDatePicker setBackgroundColor:](v20, "setBackgroundColor:", v22);

  }
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInputView:", self->_dateInputView);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "inputAssistantItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v25, "setTrailingBarButtonGroups:", MEMORY[0x1E0C9AA60]);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "inputAssistantItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_setCenterBarButtonGroups:", v26);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "inputAssistantItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLeadingBarButtonGroups:", v26);

}

- (void)_updateDisplayForFieldTypePicker:(id)a3
{
  UIPickerView *v4;
  UIPickerView *pickerInputView;
  void *v6;
  void *v7;
  UIPickerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (!self->_pickerInputView)
  {
    v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    pickerInputView = self->_pickerInputView;
    self->_pickerInputView = v4;

  }
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecureTextEntry:", 1);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", 1);

  -[UIPickerView setDelegate:](self->_pickerInputView, "setDelegate:", self);
  -[UIPickerView setDataSource:](self->_pickerInputView, "setDataSource:", self);
  v8 = self->_pickerInputView;
  -[PKTableViewCell customAccessoryColor](self, "customAccessoryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIPickerView setBackgroundColor:](v8, "setBackgroundColor:", v9);
  }
  else
  {
    -[PKPaymentSetupFieldCell backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerView setBackgroundColor:](v8, "setBackgroundColor:", v10);

  }
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInputView:", self->_pickerInputView);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputAssistantItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v13, "setTrailingBarButtonGroups:", MEMORY[0x1E0C9AA60]);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inputAssistantItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setCenterBarButtonGroups:", v14);

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inputAssistantItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeadingBarButtonGroups:", v14);

}

- (void)_paymentSetupFieldCurrentValueChangedNotification:(id)a3
{
  _QWORD block[5];

  if (!self->_ignoreCurrentValueChangedNotifications)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PKPaymentSetupFieldCell__paymentSetupFieldCurrentValueChangedNotification___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __77__PKPaymentSetupFieldCell__paymentSetupFieldCurrentValueChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplay:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPaymentSetupFieldCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  PKFloatCeilToPixel();
  v10 = v9;
  v11 = width + PKTableViewCellTextInset() * -2.0;
  -[PKPaymentSetupFieldCell layoutMargins](self, "layoutMargins");
  v14 = height - (v12 + v13);
  if (IsAccessibilityCategory)
  {
    v11 = v11 + -22.0;
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeThatFits:", v11, v14);

    PKFloatCeilToPixel();
    v17 = v16 + 0.0 + 20.0;
  }
  else
  {
    v17 = 0.0;
  }
  -[PKPaymentSetupFieldCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pkui_sizeThatFits:forceWordWrap:", 1, v11, v14);

  PKFloatCeilToPixel();
  v20 = v17 + v19 + 20.0;
  objc_msgSend((id)objc_opt_class(), "minimumCellHeight");
  if (v20 <= v21)
  {
    objc_msgSend((id)objc_opt_class(), "minimumCellHeight");
    v20 = v22;
  }
  v23 = v10;
  v24 = v20;
  result.height = v24;
  result.width = v23;
  return result;
}

+ (double)minimumCellHeight
{
  return 44.0;
}

- (double)heightForWidth:(double)a3
{
  double v3;

  -[PKPaymentSetupFieldCell sizeThatFits:](self, "sizeThatFits:", a3, 3.40282347e38);
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupFieldCell;
  -[PKTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKPaymentSetupFieldCell _updateDisplay:](self, "_updateDisplay:", 1);
  -[PKPaymentSetupFieldCell setEnabled:](self, "setEnabled:", 1);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "becomeFirstResponder");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaymentSetupFieldCell;
    return -[PKPaymentSetupFieldCell becomeFirstResponder](&v7, sel_becomeFirstResponder);
  }
}

- (void)setCanResignFirstResponder:(BOOL)a3
{
  self->_canResignFirstResponder = a3;
}

- (BOOL)canResignFirstResponder
{
  return self->_canResignFirstResponder;
}

- (BOOL)resignFirstResponder
{
  unsigned __int8 v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldCell;
  v3 = -[PKPaymentSetupFieldCell resignFirstResponder](&v8, sel_resignFirstResponder);
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUserInteractionEnabled");

  if (v5)
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "resignFirstResponder");

  }
  return v3;
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupFieldCell;
  -[PKPaymentSetupFieldCell _separatorFrame](&v15, sel__separatorFrame);
  if (self->_shouldDrawSeperator)
  {
    v5 = v3;
    v6 = v4;
    if (self->_shouldDrawFullWidthSeperator)
    {
      -[PKPaymentSetupFieldCell bounds](self, "bounds");
      Width = CGRectGetWidth(v16);
      v8 = 0.0;
    }
    else
    {
      -[UIListContentConfiguration directionalLayoutMargins](self->_referenceConfiguration, "directionalLayoutMargins");
      v10 = v9;
      v11 = -[PKPaymentSetupFieldCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      -[PKPaymentSetupFieldCell bounds](self, "bounds");
      CGRectGetWidth(v17);
      if (v11)
        v8 = 0.0;
      else
        v8 = v10;
      -[PKPaymentSetupFieldCell bounds](self, "bounds");
      Width = CGRectGetWidth(v18) - v10;
    }
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    Width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v12 = v8;
  v13 = v5;
  v14 = v6;
  result.size.height = v14;
  result.size.width = Width;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)editableTextField
{
  return self->_textField;
}

- (void)updatePaymentSetupFieldWithCurrentCellValue
{
  -[PKPaymentSetupFieldCell _pushCurrentValueToField](self, "_pushCurrentValueToField");
  -[PKPaymentSetupFieldCell _pullCurrentValueFromField](self, "_pullCurrentValueFromField");
}

- (void)updatePaymentSetupFieldWithFormatting
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKPaymentSetupField textFieldObject](self->_paymentSetupField, "textFieldObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByApplyingDisplayFormat:allowPartialFractional:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setText:", v5);
  objc_msgSend(v3, "sendActionsForControlEvents:", 0x20000);

}

- (void)_updateTextFieldStylingWithForceUpdate:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  char v7;
  int v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (self->_shouldUpdateTextFieldStyling || a3)
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField", a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = -[PKPaymentSetupField isReadonly](self->_paymentSetupField, "isReadonly");
      v8 = -[PKPaymentSetupField isOptional](self->_paymentSetupField, "isOptional");
      v9 = -[PKPaymentSetupField submissionStringMeetsAllRequirements](self->_paymentSetupField, "submissionStringMeetsAllRequirements");
      v10 = -[PKPaymentSetupField submissionStringMeetsValidationRegex](self->_paymentSetupField, "submissionStringMeetsValidationRegex");
      if (v8)
        v11 = v10;
      else
        v11 = v9;
      if ((v7 & 1) != 0 || (v11 & 1) != 0)
      {
        self->_isShowingError = 0;
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        self->_isShowingError = 1;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v12;
      objc_msgSend(v14, "setTextColor:", v12);

    }
    else
    {
      -[PKPaymentSetupFieldCell resetTextFieldStyling](self, "resetTextFieldStyling");
    }

  }
}

- (void)resetTextFieldStyling
{
  void *v3;
  id v4;

  -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  self->_shouldUpdateTextFieldStyling = 0;
  self->_isShowingError = 0;

}

- (void)_pushCurrentValueToField
{
  int v3;
  PKPaymentSetupField *paymentSetupField;
  void *v5;
  PKPaymentSetupField *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKPaymentSetupField *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;

  self->_ignoreCurrentValueChangedNotifications = 1;
  v3 = -[PKPaymentSetupField isFieldTypeDate](self->_paymentSetupField, "isFieldTypeDate");
  paymentSetupField = self->_paymentSetupField;
  if (v3)
  {
    -[PKDatePicker date](self->_dateInputView, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = paymentSetupField;
LABEL_14:
    -[PKPaymentSetupField setCurrentValue:](v6, "setCurrentValue:", v5);
    goto LABEL_15;
  }
  if (!-[PKPaymentSetupField isFieldTypePicker](self->_paymentSetupField, "isFieldTypePicker"))
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v5, "length");
    v13 = self->_paymentSetupField;
    if (!v12)
    {
LABEL_11:
      v15 = 4;
LABEL_12:
      -[PKPaymentSetupField setSource:](v13, "setSource:", v15);
      goto LABEL_13;
    }
    v14 = -[PKPaymentSetupField source](v13, "source");
    if (v14 > 4)
    {
LABEL_13:
      v6 = self->_paymentSetupField;
      goto LABEL_14;
    }
    if (((1 << v14) & 0x13) != 0)
    {
      v13 = self->_paymentSetupField;
      goto LABEL_11;
    }
    -[PKPaymentSetupField defaultValue](self->_paymentSetupField, "defaultValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    v18 = v16;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      if (!v17 || !v18)
      {

LABEL_24:
        v13 = self->_paymentSetupField;
        v15 = 3;
        goto LABEL_12;
      }
      v20 = objc_msgSend(v17, "isEqualToString:", v18);

      if (!v20)
        goto LABEL_24;
    }
    v13 = self->_paymentSetupField;
    v15 = 2;
    goto LABEL_12;
  }
  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerFieldObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIPickerView selectedRowInComponent:](self->_pickerInputView, "selectedRowInComponent:", 0);
  objc_msgSend(v5, "pickerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v8 < objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setCurrentValue:", v10);

LABEL_15:
  self->_ignoreCurrentValueChangedNotifications = 0;
}

- (void)_pullCurrentValueFromField
{
  int v3;
  PKPaymentSetupField *paymentSetupField;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;

  v3 = -[PKPaymentSetupField isFieldTypeDate](self->_paymentSetupField, "isFieldTypeDate");
  paymentSetupField = self->_paymentSetupField;
  if (v3)
  {
    -[PKPaymentSetupField currentValue](paymentSetupField, "currentValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      -[PKPaymentSetupField displayString](self->_paymentSetupField, "displayString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v8);

    }
    else
    {
      objc_msgSend(v6, "setText:", 0);
    }

    -[PKPaymentSetupField currentValue](self->_paymentSetupField, "currentValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      || (-[PKPaymentSetupField dateFieldObject](self->_paymentSetupField, "dateFieldObject"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "defaultDate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          v16))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PKDatePicker setDate:](self->_dateInputView, "setDate:", v16);
    }
    goto LABEL_13;
  }
  if (!-[PKPaymentSetupField isFieldTypePicker](paymentSetupField, "isFieldTypePicker"))
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField displayString](self->_paymentSetupField, "displayString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v17);

LABEL_13:
    goto LABEL_14;
  }
  -[PKPaymentSetupField currentValue](self->_paymentSetupField, "currentValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField displayString](self->_paymentSetupField, "displayString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    -[PKPaymentSetupField pickerFieldObject](self->_paymentSetupField, "pickerFieldObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pickerItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField currentValue](self->_paymentSetupField, "currentValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "indexOfObject:", v14);

    -[UIPickerView selectRow:inComponent:animated:](self->_pickerInputView, "selectRow:inComponent:animated:", v15, 0, 0);
  }
LABEL_14:
  if (-[PKPaymentSetupField source](self->_paymentSetupField, "source") == 1
    && -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled"))
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", self->_editableTextFieldCameraCapturedTextColor);
  }
  else
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v19 = -[PKPaymentSetupFieldCell isEnabled](self, "isEnabled");
    v20 = 6;
    if (v19)
      v20 = 5;
    objc_msgSend(v21, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___PKPaymentSetupFieldCell__textField[v20]));
  }

}

- (void)_editableTextFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  char v8;
  id v9;

  if (-[PKPaymentSetupFieldCell usesCustomInputView](self, "usesCustomInputView", a3))
    -[PKPaymentSetupFieldCell updatePaymentSetupFieldWithCurrentCellValue](self, "updatePaymentSetupFieldWithCurrentCellValue");
  if (-[PKPaymentSetupField isFieldTypeText](self->_paymentSetupField, "isFieldTypeText"))
  {
    -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    self->_shouldUpdateTextFieldStyling = v6 != 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "fieldCellEditableTextFieldDidBeginEditing:", self);

  }
}

- (void)_editableTextFieldDidEndEditing:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  if (-[PKPaymentSetupField isFieldTypeText](self->_paymentSetupField, "isFieldTypeText", a3))
    -[PKPaymentSetupFieldCell _updateTextFieldStylingWithForceUpdate:](self, "_updateTextFieldStylingWithForceUpdate:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "fieldCellEditableTextFieldDidEndEditing:", self);

  }
}

- (void)_editableTextFieldValueChanged:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  if ((-[PKPaymentSetupField isFieldTypeDate](self->_paymentSetupField, "isFieldTypeDate", a3) & 1) == 0
    && (-[PKPaymentSetupField isFieldTypePicker](self->_paymentSetupField, "isFieldTypePicker") & 1) == 0)
  {
    -[PKPaymentSetupFieldCell _pushCurrentValueToField](self, "_pushCurrentValueToField");
  }
  if (-[PKPaymentSetupField isFieldTypeText](self->_paymentSetupField, "isFieldTypeText"))
    -[PKPaymentSetupFieldCell _updateTextFieldStylingWithForceUpdate:](self, "_updateTextFieldStylingWithForceUpdate:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "fieldCellEditableTextFieldValueDidChange:", self);

  }
}

- (void)_configureKeyboardAccessories
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSArray *v7;
  NSArray *configuredKeyboardAccessories;
  id WeakRetained;
  id v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  int v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupField textFieldObject](self->_paymentSetupField, "textFieldObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "keyboardAccessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = PKEqualObjects();

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "keyboardAccessories");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      configuredKeyboardAccessories = self->_configuredKeyboardAccessories;
      self->_configuredKeyboardAccessories = v7;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          v32 = v4;
          v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v4, "keyboardAccessories");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v35 != v15)
                  objc_enumerationMutation(v12);
                v17 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "unsignedIntegerValue");
                v18 = objc_loadWeakRetained((id *)&self->_delegate);
                v19 = objc_msgSend(v18, "fieldCell:supportsKeyboardAccessory:", self, v17);

                if (v19)
                  v20 = v17 == 1;
                else
                  v20 = 0;
                if (v20)
                {
                  v21 = (void *)objc_msgSend(MEMORY[0x1E0DC3520], "pkui_createPlainMinimalButtonConfiguration");
                  PKLocalizedPaymentString(CFSTR("MANUAL_ENTRY_CAMERA_CAPTURE_PROMPT"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setTitle:", v22);

                  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard.viewfinder"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setImage:", v23);

                  objc_msgSend(v21, "setImagePlacement:", 2);
                  objc_msgSend(v21, "setImagePadding:", 8.0);
                  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setBaseForegroundColor:", v24);

                  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setConfiguration:", v21);
                  objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__keyboardAccessoryButtonTapped_, 0x2000);
                  objc_msgSend(v25, "setTag:", 1);
                  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v25);
                  objc_msgSend(v33, "addObject:", v26);

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            }
            while (v14);
          }

          v27 = objc_msgSend(v33, "count");
          v4 = v32;
          if (v27)
          {
            if (v27 == 1)
            {
              v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
              objc_msgSend(v33, "insertObject:atIndex:", v28, 0);

              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
              objc_msgSend(v33, "insertObject:atIndex:", v29, 2);

            }
            v30 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
            objc_msgSend(v30, "setItems:", v33);
            objc_msgSend(v30, "sizeToFit");
            -[PKPaymentSetupFieldCell editableTextField](self, "editableTextField");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setInputAccessoryView:", v30);

          }
        }
      }
      else
      {

      }
    }
  }

}

- (void)_keyboardAccessoryButtonTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "fieldCell:didTapKeyboardAccessory:", self, objc_msgSend(v7, "tag"));

  }
}

- (void)datePicker:(id)a3 didChangeDate:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;

  -[PKPaymentSetupFieldCell updatePaymentSetupFieldWithCurrentCellValue](self, "updatePaymentSetupFieldWithCurrentCellValue", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "fieldCellEditableTextFieldValueDidChange:", self);

  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  BOOL v8;

  if (-[PKPaymentSetupFieldCell isEnabled](self, "isEnabled", a3)
    && ((WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
         v5 = objc_opt_respondsToSelector(),
         WeakRetained,
         (v5 & 1) == 0)
     || (v6 = objc_loadWeakRetained((id *)&self->_delegate),
         v7 = objc_msgSend(v6, "fieldCellEditableTextFieldShouldBeginEditing:", self),
         v6,
         v7)))
  {
    if (-[PKPaymentSetupField isFieldTypeDate](self->_paymentSetupField, "isFieldTypeDate")
      && -[PKPaymentSetupField source](self->_paymentSetupField, "source") == 1)
    {
      -[PKPaymentSetupField setSource:](self->_paymentSetupField, "setSource:", 0);
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[PKPaymentSetupFieldCell _configureKeyboardAccessories](self, "_configureKeyboardAccessories");
  return v8;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  PKPaymentSetupFieldCellDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  BOOL v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_msgSend(v7, "fieldCellEditableTextFieldShouldClear:", self);

    if (!v8)
      return 0;
  }
  v9 = 1;
  self->_ignoreCurrentValueChangedNotifications = 1;
  -[PKPaymentSetupField setCurrentValue:](self->_paymentSetupField, "setCurrentValue:", 0);
  self->_ignoreCurrentValueChangedNotifications = 0;
  -[PKPaymentSetupField setSource:](self->_paymentSetupField, "setSource:", 4);
  -[PKPaymentSetupFieldCell resetTextFieldStyling](self, "resetTextFieldStyling");
  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  PKPaymentSetupFieldCellDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  char v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "fieldCellEditableTextFieldShouldReturn:", self);

  return v8;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  PKPaymentSetupField *paymentSetupField;
  NSUInteger v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSUInteger v43;
  void *v44;
  int v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v78;
  __CFString *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  unint64_t v89;
  __CFString *v90;
  unint64_t v91;
  _BYTE v92[12];
  NSUInteger v93;
  NSUInteger v94;
  void *v95;
  id obj;
  id obja;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  length = a4.length;
  location = a4.location;
  v108 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((-[PKPaymentSetupField isFieldTypeDate](self->_paymentSetupField, "isFieldTypeDate") & 1) == 0
    && (-[PKPaymentSetupField isFieldTypePicker](self->_paymentSetupField, "isFieldTypePicker") & 1) == 0)
  {
    objc_msgSend(v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v14 = (__CFString *)v10;
    v15 = -[__CFString length](v14, "length");
    v90 = v14;
    v91 = v15;
    if (v13)
    {
      *(_QWORD *)&v92[4] = v13;
      *(_DWORD *)v92 = 0;
      v16 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByTrimmingCharactersInSet:](v14, "stringByTrimmingCharactersInSet:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v14;
      v14 = (__CFString *)v18;

      v20 = -[__CFString length](v14, "length");
      if (!v20)
      {
        LOBYTE(v11) = 1;
LABEL_100:

        goto LABEL_101;
      }
      v16 = v20;
      *(_DWORD *)&v92[8] = 0;
      *(_QWORD *)v92 = v20 < v91;
    }
    v89 = v16;
    -[PKPaymentSetupField textFieldObject](self->_paymentSetupField, "textFieldObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "maxLength");
    if (v21)
      v23 = v22 == 0;
    else
      v23 = 1;
    v24 = v23 || v16 == 0;
    v93 = length;
    v95 = v21;
    if (v24)
    {
      v11 = 1;
      if (!v21)
        goto LABEL_46;
    }
    else
    {
      obj = (id)v22;
      objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v21, "keepPaddingCharactersForSubmission");
      if ((v26 & 1) == 0 && objc_msgSend(v21, "hasDisplayFormat"))
      {
        v79 = v14;
        v81 = v12;
        v83 = v10;
        v85 = v9;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        objc_msgSend(v21, "displayFormatPaddingCharacters");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v103;
          do
          {
            v31 = 0;
            v32 = v25;
            do
            {
              if (*(_QWORD *)v103 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v31), &stru_1E3E7D690);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              ++v31;
              v32 = v25;
            }
            while (v29 != v31);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
          }
          while (v29);
        }

        v10 = v83;
        v9 = v85;
        v14 = v79;
        v12 = v81;
      }
      v11 = objc_msgSend(v25, "length") <= (unint64_t)obj;

      if (!v21)
      {
LABEL_46:
        if (v21 && v11)
        {
          if (objc_msgSend(v21, "hasDisplayFormat"))
          {
            objc_msgSend(v21, "displayFormatPaddingCharacters");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (location)
            {
              v43 = v93;
              do
              {
                objc_msgSend(v12, "substringWithRange:", location, v43 != 0);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v42, "containsObject:", v44);

                if (!v45)
                  break;
                ++v43;
                --location;
              }
              while (location);
              v21 = v95;
            }
            else
            {
              v43 = v93;
            }
            obja = v42;
            if (v14)
              v46 = v14;
            else
              v46 = &stru_1E3E7D690;
            objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, v43, v46);
            v47 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "selectedTextRange");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = (void *)v47;
            objc_msgSend(v21, "stringByApplyingDisplayFormat:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v48;
            if (objc_msgSend(v21, "isNumericFractional")
              && (v49 = objc_msgSend(v48, "length"), v49 == objc_msgSend(v12, "length")))
            {
              v50 = 0;
              v11 = 1;
              v51 = v78;
            }
            else
            {
              objc_msgSend(v9, "setText:", v48);
              if (objc_msgSend(v12, "length") && v43 + location == objc_msgSend(v12, "length"))
              {
                objc_msgSend(v9, "endOfDocument");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v94 = v43;
                v80 = v14;
                objc_msgSend(v12, "substringToIndex:", location);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                if (v91)
                {
                  -[__CFString substringToIndex:](v90, "substringToIndex:", 1);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = objc_msgSend(v48, "rangeOfString:options:range:", v54, 0, objc_msgSend(v53, "length"), objc_msgSend(v48, "length") - objc_msgSend(v53, "length"));

                  v21 = v95;
                  v56 = 0;
                  if (v55 != 0x7FFFFFFFFFFFFFFFLL)
                    v56 = v55 - objc_msgSend(v53, "length");
                }
                else
                {
                  v56 = 0;
                }
                v57 = location + v91 + v56;
                if (v57 >= objc_msgSend(v48, "length"))
                  v57 = objc_msgSend(v48, "length");
                objc_msgSend(v48, "substringToIndex:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = obja;
                v84 = v10;
                v86 = v9;
                v82 = v12;
                if (objc_msgSend(v21, "isNumericFractional"))
                {
                  objc_msgSend(v21, "decimalSeparator");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(obja, "containsObject:", v60) & 1) == 0)
                  {
                    objc_msgSend(obja, "arrayByAddingObject:", v60);
                    v61 = objc_claimAutoreleasedReturnValue();

                    v59 = (void *)v61;
                  }

                }
                v100 = 0u;
                v101 = 0u;
                v98 = 0u;
                v99 = 0u;
                obja = v59;
                v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
                if (v62)
                {
                  v63 = v62;
                  v64 = 0;
                  v65 = 0;
                  v66 = *(_QWORD *)v99;
                  do
                  {
                    for (i = 0; i != v63; ++i)
                    {
                      if (*(_QWORD *)v99 != v66)
                        objc_enumerationMutation(obja);
                      v68 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
                      v69 = objc_msgSend(v68, "length");
                      objc_msgSend(v53, "componentsSeparatedByString:", v68);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      v64 += (objc_msgSend(v70, "count") - 1) * v69;

                      objc_msgSend(v58, "componentsSeparatedByString:", v68);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 += (objc_msgSend(v71, "count") - 1) * v69;

                    }
                    v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
                  }
                  while (v63);
                }
                else
                {
                  v64 = 0;
                  v65 = 0;
                }

                objc_msgSend(v87, "end");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = v86;
                objc_msgSend(v86, "positionFromPosition:offset:", v72, v89 - v94 - v64 + v65);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v52)
                {
                  objc_msgSend(v86, "endOfDocument");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                }

                v12 = v82;
                v10 = v84;
                v14 = v80;
              }
              v51 = v78;
              objc_msgSend(v9, "textRangeFromPosition:toPosition:", v52, v52);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setSelectedTextRange:", v73);

              objc_msgSend(v9, "sendActionsForControlEvents:", 0x20000);
              v11 = 0;
              v50 = 1;
              v21 = v95;
            }

            if (!v50)
              goto LABEL_98;
          }
          else
          {
            v11 = 1;
          }
        }
        if ((*(_DWORD *)v92 & v11) != 1 || *(_QWORD *)&v92[4] != 0)
          goto LABEL_99;
        if (objc_msgSend(v9, "isSecureTextEntry")
          && !objc_msgSend(v9, "displaySecureTextUsingPlainText"))
        {
          LOBYTE(v11) = 1;
          goto LABEL_99;
        }
        objc_msgSend(v9, "setText:", v14);
        objc_msgSend(v9, "endOfDocument");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textRangeFromPosition:toPosition:", v75, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSelectedTextRange:", v76);

        v21 = v95;
        objc_msgSend(v9, "sendActionsForControlEvents:", 0x20000);

LABEL_98:
        LOBYTE(v11) = 0;
LABEL_99:

        goto LABEL_100;
      }
    }
    if (!v11)
      goto LABEL_46;
    v33 = -[PKPaymentSetupField source](self->_paymentSetupField, "source");
    if ((unint64_t)(v33 - 2) >= 2)
    {
      v36 = v93;
      if (v33 != 1)
        goto LABEL_38;
      paymentSetupField = self->_paymentSetupField;
    }
    else
    {
      v34 = objc_msgSend(v12, "length");
      paymentSetupField = self->_paymentSetupField;
      v36 = v93;
      if (location || v93 != v34)
      {
        v37 = 3;
LABEL_37:
        -[PKPaymentSetupField setSource:](paymentSetupField, "setSource:", v37);
LABEL_38:
        v38 = objc_msgSend(v12, "length");
        if (location || v36 != v38)
          -[PKPaymentSetupFieldCell _updateTextFieldStylingWithForceUpdate:](self, "_updateTextFieldStylingWithForceUpdate:", 0);
        else
          -[PKPaymentSetupFieldCell resetTextFieldStyling](self, "resetTextFieldStyling");
        objc_msgSend(v21, "allowedCharacters");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        v11 = 1;
        if (v39 && v14)
        {
          objc_msgSend(v39, "invertedSet");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[__CFString rangeOfCharacterFromSet:options:](v14, "rangeOfCharacterFromSet:options:", v41, 0) == 0x7FFFFFFFFFFFFFFFLL;

        }
        v21 = v95;
        goto LABEL_46;
      }
    }
    v37 = 4;
    goto LABEL_37;
  }
  LOBYTE(v11) = 0;
LABEL_101:

  return v11;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  int v5;

  -[PKPaymentSetupField textFieldObject](self->_paymentSetupField, "textFieldObject", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNumericFractional");

  if (v5)
    -[PKPaymentSetupFieldCell updatePaymentSetupFieldWithFormatting](self, "updatePaymentSetupFieldWithFormatting");
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFieldTypePicker");

  if (!v6)
    return 0;
  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerFieldObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pickerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFieldTypePicker");

  if (v8)
  {
    -[PKPaymentSetupFieldCell paymentSetupField](self, "paymentSetupField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerFieldObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pickerItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id WeakRetained;
  char v7;
  id v8;

  -[PKPaymentSetupFieldCell updatePaymentSetupFieldWithCurrentCellValue](self, "updatePaymentSetupFieldWithCurrentCellValue", a3, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "fieldCellEditableTextFieldValueDidChange:", self);

  }
}

- (PKPaymentSetupFieldCellDelegate)delegate
{
  return (PKPaymentSetupFieldCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupField)paymentSetupField
{
  return self->_paymentSetupField;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)minimumTextLabelWidth
{
  return self->_minimumTextLabelWidth;
}

- (BOOL)shouldDrawSeperator
{
  return self->_shouldDrawSeperator;
}

- (void)setShouldDrawSeperator:(BOOL)a3
{
  self->_shouldDrawSeperator = a3;
}

- (BOOL)shouldDrawFullWidthSeperator
{
  return self->_shouldDrawFullWidthSeperator;
}

- (void)setShouldDrawFullWidthSeperator:(BOOL)a3
{
  self->_shouldDrawFullWidthSeperator = a3;
}

- (UIColor)editableTextFieldTextColor
{
  return self->_editableTextFieldTextColor;
}

- (void)setEditableTextFieldTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (UIColor)editableTextFieldDisabledTextColor
{
  return self->_editableTextFieldDisabledTextColor;
}

- (void)setEditableTextFieldDisabledTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (UIColor)editableTextFieldCameraCapturedTextColor
{
  return self->_editableTextFieldCameraCapturedTextColor;
}

- (BOOL)hidePrediction
{
  return self->_hidePrediction;
}

- (BOOL)isShowingError
{
  return self->_isShowingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableTextFieldCameraCapturedTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextFieldDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextFieldTextColor, 0);
  objc_storeStrong((id *)&self->_paymentSetupField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_referenceConfiguration, 0);
  objc_storeStrong((id *)&self->_configuredKeyboardAccessories, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_defaultCenterBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_defaultTrailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_defaultLeadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_pickerInputView, 0);
  objc_storeStrong((id *)&self->_dateInputView, 0);
}

@end
