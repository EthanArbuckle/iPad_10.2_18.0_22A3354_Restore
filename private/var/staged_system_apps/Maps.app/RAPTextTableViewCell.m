@implementation RAPTextTableViewCell

- (void)_setupViews
{
  UITextField *v3;
  UITextField *valueField;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (UITextField *)objc_alloc_init((Class)UITextField);
  valueField = self->_valueField;
  self->_valueField = v3;

  -[UITextField setClearButtonMode:](self->_valueField, "setClearButtonMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[UITextField setFont:](self->_valueField, "setFont:", v5);

  -[UITextField setAutocorrectionType:](self->_valueField, "setAutocorrectionType:", 1);
  -[UITextField setSpellCheckingType:](self->_valueField, "setSpellCheckingType:", 1);
  -[UITextField setAutocapitalizationType:](self->_valueField, "setAutocapitalizationType:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[UITextField _clearButton](self->_valueField, "_clearButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v13, "setTintColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
  objc_msgSend(v13, "setImage:forState:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 16.0));
  objc_msgSend(v13, "setPreferredSymbolConfiguration:forImageInState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTextTableViewCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_valueField);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "fieldChanged:", UITextFieldTextDidChangeNotification, self->_valueField);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "fieldSelected:", UITextFieldTextDidBeginEditingNotification, self->_valueField);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont", a3));
  -[UITextField setFont:](self->_valueField, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField font](self->_valueField, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", 33.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[UITextField font](self->_valueField, "font"));
  objc_msgSend(v6, "_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  id v5;
  UITextField *valueField;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *topToFirstBaselineConstraint;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *lastBaselineToBottomConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *constraints;
  _QWORD v31[4];

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_valueField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTextTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTextTableViewCell traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  valueField = self->_valueField;
  if (v5 == (id)5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](valueField, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 10.0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_valueField, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -10.0));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField lastBaselineAnchor](valueField, "lastBaselineAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField font](self->_valueField, "font"));
    objc_msgSend(v15, "_scaledValueForValue:", 33.0);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14));
    topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
    self->_topToFirstBaselineConstraint = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField lastBaselineAnchor](self->_valueField, "lastBaselineAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField font](self->_valueField, "font"));
    objc_msgSend(v20, "_scaledValueForValue:", 22.0);
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19));
    lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
    self->_lastBaselineToBottomConstraint = v21;

    v9 = self->_topToFirstBaselineConstraint;
    v12 = self->_lastBaselineToBottomConstraint;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_valueField, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -15.0));
  v31[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_valueField, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 15.0));
  v31[1] = v28;
  v31[2] = v9;
  v31[3] = v12;
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
  constraints = self->_constraints;
  self->_constraints = v29;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (RAPTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPTextTableViewCell *v4;
  RAPTextTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPTextTableViewCell;
  v4 = -[RAPTextTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RAPTextTableViewCell _setupViews](v4, "_setupViews");
    -[RAPTextTableViewCell _setupConstraints](v5, "_setupConstraints");
    -[RAPTextTableViewCell setAccessoryType:](v5, "setAccessoryType:", 0);
    -[RAPTextTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v5->_correctableItemKind = qword_1014A5BC8;
  }
  return v5;
}

- (void)fieldChanged:(id)a3
{
  int64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = -[RAPTextTableViewCell correctableItemKind](self, "correctableItemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_valueField, "text"));
  objc_msgSend(WeakRetained, "valueForCorrectableItemKind:changedTo:", v4, v5);

}

- (void)fieldSelected:(id)a3
{
  -[RAPTextTableViewCell _instrumentTextFieldTap](self, "_instrumentTextFieldTap", a3);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;

  v7 = a3;
  v8 = a5;
  if ((id)-[RAPTextTableViewCell correctableItemKind](self, "correctableItemKind") == (id)2
    && objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("tel:")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("tel:"), "length")));

      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByRemovingPercentEncoding"));
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", v8));

    if (objc_msgSend(v11, "length"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "formattedStringValue"));
      v14 = objc_msgSend(v13, "length");
      v15 = v14 == 0;
      if (v14)
        -[UITextField setText:](self->_valueField, "setText:", v13);

    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)_instrumentTextFieldTap
{
  int64_t correctableItemKind;
  uint64_t v3;

  correctableItemKind = self->_correctableItemKind;
  if (correctableItemKind)
  {
    if (correctableItemKind == 2)
    {
      v3 = 10180;
    }
    else
    {
      if (correctableItemKind != 4)
        return;
      v3 = 10179;
    }
  }
  else
  {
    v3 = 10166;
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v3, -[RAPTextTableViewCell analyticTarget](self, "analyticTarget"), 0);
}

- (void)setCorrectableItemKind:(int64_t)a3
{
  UITextField *valueField;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_correctableItemKind != a3)
  {
    self->_correctableItemKind = a3;
    if (a3)
    {
      if (a3 == 2)
      {
        -[UITextField setKeyboardType:](self->_valueField, "setKeyboardType:", 5);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField textInputTraits](self->_valueField, "textInputTraits"));
        v8 = v6;
        v7 = 1;
LABEL_10:
        objc_msgSend(v6, "setContentsIsSingleValue:", v7);

        return;
      }
      if (a3 == 4)
      {
        valueField = self->_valueField;
        v5 = 3;
LABEL_9:
        -[UITextField setKeyboardType:](valueField, "setKeyboardType:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField textInputTraits](self->_valueField, "textInputTraits"));
        v8 = v6;
        v7 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      -[UITextField setAutocapitalizationType:](self->_valueField, "setAutocapitalizationType:", 1);
    }
    valueField = self->_valueField;
    v5 = 13;
    goto LABEL_9;
  }
}

- (void)setPlaceholder:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_placeholder, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_placeholder, a3);
    -[UITextField setPlaceholder:](self->_valueField, "setPlaceholder:", v5);
  }

}

- (void)setValue:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_value, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_value, a3);
    -[UITextField setText:](self->_valueField, "setText:", v5);
    -[RAPTextTableViewCell setNeedsLayout](self, "setNeedsLayout");
    -[RAPTextTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (int64_t)preferredKeyboardType
{
  return (int64_t)-[UITextField keyboardType](self->_valueField, "keyboardType");
}

- (void)setPreferredKeyboardType:(int64_t)a3
{
  if (-[UITextField keyboardType](self->_valueField, "keyboardType") != (id)a3)
    -[UITextField setKeyboardType:](self->_valueField, "setKeyboardType:", a3);
}

- (RAPTextCellDelegate)delegate
{
  return (RAPTextCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)correctableItemKind
{
  return self->_correctableItemKind;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSString)value
{
  return self->_value;
}

- (int)analyticTarget
{
  return self->_analyticTarget;
}

- (void)setAnalyticTarget:(int)a3
{
  self->_analyticTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_valueField, 0);
}

@end
