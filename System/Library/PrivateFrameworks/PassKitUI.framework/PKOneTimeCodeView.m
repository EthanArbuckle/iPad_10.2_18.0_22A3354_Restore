@implementation PKOneTimeCodeView

- (PKOneTimeCodeView)initWithCodeLength:(int64_t)a3 delegate:(id)a4
{
  id v6;
  PKOneTimeCodeView *v7;
  PKOneTimeCodeView *v8;
  NSString *v9;
  NSString *value;
  void *v11;
  uint64_t v12;
  NSCharacterSet *nonNumericCharSet;
  PKOneTimeCodeDigitFieldView *v14;
  PKOneTimeCodeDigitFieldView *templateField;
  UITextField *v16;
  UITextField *invisibleTextField;
  PKIconTextLabel *v18;
  PKIconTextLabel *entryErrorLabel;
  PKIconTextLabel *v20;
  void *v21;
  PKIconTextLabel *v22;
  void *v23;
  id v24;
  uint64_t v25;
  PKOneTimeCodeDigitFieldView *v26;
  uint64_t v27;
  NSArray *codeFields;
  uint64_t v29;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v32;

  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PKOneTimeCodeView;
  v7 = -[PKOneTimeCodeView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_codeLength = (double)a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    value = v8->_value;
    v8->_value = v9;

    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invertedSet");
    v12 = objc_claimAutoreleasedReturnValue();
    nonNumericCharSet = v8->_nonNumericCharSet;
    v8->_nonNumericCharSet = (NSCharacterSet *)v12;

    v14 = -[PKOneTimeCodeDigitFieldView initWithIndex:]([PKOneTimeCodeDigitFieldView alloc], "initWithIndex:", 0);
    templateField = v8->_templateField;
    v8->_templateField = v14;

    -[PKOneTimeCodeDigitFieldView setText:](v8->_templateField, "setText:", CFSTR("5"));
    v16 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    invisibleTextField = v8->_invisibleTextField;
    v8->_invisibleTextField = v16;

    -[UITextField setHidden:](v8->_invisibleTextField, "setHidden:", 1);
    -[UITextField setDelegate:](v8->_invisibleTextField, "setDelegate:", v8);
    -[UITextField setKeyboardType:](v8->_invisibleTextField, "setKeyboardType:", 4);
    -[UITextField setTextContentType:](v8->_invisibleTextField, "setTextContentType:", *MEMORY[0x1E0DC5460]);
    -[PKOneTimeCodeView addSubview:](v8, "addSubview:", v8->_invisibleTextField);
    v18 = objc_alloc_init(PKIconTextLabel);
    entryErrorLabel = v8->_entryErrorLabel;
    v8->_entryErrorLabel = v18;

    v20 = v8->_entryErrorLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setTextColor:](v20, "setTextColor:", v21);

    v22 = v8->_entryErrorLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setTextFont:](v22, "setTextFont:", v23);

    -[PKOneTimeCodeView addSubview:](v8, "addSubview:", v8->_entryErrorLabel);
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v8->_codeLength > 0.0)
    {
      v25 = 0;
      do
      {
        v26 = -[PKOneTimeCodeDigitFieldView initWithIndex:]([PKOneTimeCodeDigitFieldView alloc], "initWithIndex:", v25);
        -[PKOneTimeCodeDigitFieldView setPrimary:](v26, "setPrimary:", v25 == 0);
        -[PKOneTimeCodeView addSubview:](v8, "addSubview:", v26);
        objc_msgSend(v24, "addObject:", v26);

        ++v25;
      }
      while (v8->_codeLength > (double)v25);
    }
    v27 = objc_msgSend(v24, "copy");
    codeFields = v8->_codeFields;
    v8->_codeFields = (NSArray *)v27;

    -[PKOneTimeCodeView setEntrySpacing:](v8, "setEntrySpacing:", 8.0);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v8, sel__passcodeFieldTapped_);
    tapGestureRecognizer = v8->_tapGestureRecognizer;
    v8->_tapGestureRecognizer = (UITapGestureRecognizer *)v29;

    -[PKOneTimeCodeView addGestureRecognizer:](v8, "addGestureRecognizer:", v8->_tapGestureRecognizer);
    -[PKOneTimeCodeView _updateLabels](v8, "_updateLabels");

  }
  return v8;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  UITextField *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double codeLength;
  BOOL v16;
  id WeakRetained;
  void *v18;

  length = a4.length;
  location = a4.location;
  v9 = (UITextField *)a3;
  v10 = a5;
  v11 = v10;
  if (self->_invisibleTextField != v9
    || self->_disableEntry
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("\n")) & 1) != 0
    || objc_msgSend(v11, "rangeOfCharacterFromSet:", self->_nonNumericCharSet) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = 0;
  }
  else
  {
    -[UITextField text](v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (double)(unint64_t)objc_msgSend(v13, "length");
    codeLength = self->_codeLength;
    v16 = codeLength >= v14;
    if (codeLength >= v14)
    {
      -[PKOneTimeCodeView setEntryError:](self, "setEntryError:", 0);
      objc_storeStrong((id *)&self->_value, v13);
      -[PKOneTimeCodeView _updateLabels](self, "_updateLabels");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = (void *)-[NSString copy](self->_value, "copy");
      objc_msgSend(WeakRetained, "oneTimeCodeView:didEnterCode:", self, v18);

    }
  }

  return v16;
}

- (BOOL)becomeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_invisibleTextField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[UITextField resignFirstResponder](self->_invisibleTextField, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[UITextField isFirstResponder](self->_invisibleTextField, "isFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return !self->_disableEntry;
}

- (BOOL)isSecureTextEntry
{
  return -[UITextField isSecureTextEntry](self->_invisibleTextField, "isSecureTextEntry");
}

- (BOOL)hasText
{
  return -[NSString length](self->_value, "length") != 0;
}

- (id)currentCode
{
  return (id)-[NSString copy](self->_value, "copy");
}

- (void)clearCurrentCode
{
  NSString *v3;
  NSString *value;
  void *v5;
  id WeakRetained;

  v3 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  value = self->_value;
  self->_value = v3;

  -[PKOneTimeCodeView _updateLabels](self, "_updateLabels");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)-[NSString copy](self->_value, "copy");
  objc_msgSend(WeakRetained, "oneTimeCodeView:didEnterCode:", self, v5);

}

- (void)setEntrySpacing:(double)a3
{
  if (self->_entrySpacing != a3)
  {
    self->_entrySpacing = a3;
    -[PKOneTimeCodeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDisableEntry:(BOOL)a3
{
  if (self->_disableEntry != a3)
    self->_disableEntry = a3;
}

- (void)setEntryError:(unint64_t)a3
{
  if (self->_entryError != a3)
  {
    self->_entryError = a3;
    -[PKOneTimeCodeView _updateLabels](self, "_updateLabels");
    -[PKOneTimeCodeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKOneTimeCodeView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKOneTimeCodeView;
  -[PKOneTimeCodeView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKOneTimeCodeView bounds](self, "bounds");
  -[PKOneTimeCodeView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double y;
  NSUInteger v8;
  double entrySpacing;
  double v10;
  unint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  width = a3.size.width;
  y = a3.origin.y;
  v8 = -[NSArray count](self->_codeFields, "count");
  entrySpacing = self->_entrySpacing;
  v10 = 0.0;
  if (-[NSArray count](self->_codeFields, "count"))
    v10 = (width - fmax(entrySpacing * (double)(v8 - 1), 0.0)) / (double)-[NSArray count](self->_codeFields, "count");
  if (-[NSArray count](self->_codeFields, "count"))
  {
    v11 = 0;
    v12 = 0.0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_codeFields, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v14 = v10 + v12;
      if (++v11 < -[NSArray count](self->_codeFields, "count"))
        v14 = v14 + self->_entrySpacing;
      if (!a4)
        objc_msgSend(v13, "setFrame:", v12, y, v10, v10);

      v12 = v14;
    }
    while (v11 < -[NSArray count](self->_codeFields, "count"));
  }
  v15 = v10 + 0.0;
  if (-[PKIconTextLabel hasContent](self->_entryErrorLabel, "hasContent"))
  {
    -[PKIconTextLabel sizeThatFits:](self->_entryErrorLabel, "sizeThatFits:", width, 1.79769313e308);
    PKRectCenteredXInRect();
    v15 = v15 + v19 + 16.0;
    if (a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!a4)
LABEL_14:
    -[PKIconTextLabel setFrame:](self->_entryErrorLabel, "setFrame:", v16, v17, v18, v19);
LABEL_15:
  v20 = width;
  v21 = v15;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKOneTimeCodeView;
  -[PKOneTimeCodeView setBackgroundColor:](&v14, sel_setBackgroundColor_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_codeFields;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setBackgroundColor:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)_updateLabels
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKIconTextLabel *entryErrorLabel;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t entryError;
  uint64_t v20;
  int v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("INVALID_SMS_OTP_CODE");
  switch(self->_entryError)
  {
    case 0uLL:
    case 1uLL:

      v5 = 0;
      v23 = 0;
      goto LABEL_11;
    case 2uLL:
      goto LABEL_7;
    case 3uLL:
      v4 = CFSTR("EXPIRED_SMS_OTP_CODE");
      goto LABEL_7;
    case 4uLL:
      v4 = CFSTR("ATTEMPT_LIMIT_REACHED_SMS_OTP_CODE");
      goto LABEL_7;
    case 5uLL:
      v4 = CFSTR("REQUEST_LIMIT_REACHED_SMS_OTP_CODE");
LABEL_7:
      PKLocalizedPaymentString(&v4->isa);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0DC3888];
    -[PKIconTextLabel textFont](self->_entryErrorLabel, "textFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithFont:scale:", v7, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "imageWithConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel textColor](self->_entryErrorLabel, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithTintColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "imageWithRenderingMode:", 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
LABEL_11:
  entryErrorLabel = self->_entryErrorLabel;
  objc_msgSend(v5, "pk_attributedString", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKIconTextLabel setText:](entryErrorLabel, "setText:", v13);

  -[PKIconTextLabel setIcon:](self->_entryErrorLabel, "setIcon:", v23);
  if (self->_codeLength > 0.0)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if (v15 >= -[NSString length](self->_value, "length"))
      {
        v16 = 0;
      }
      else
      {
        -[NSString substringWithRange:](self->_value, "substringWithRange:", v15, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSArray objectAtIndexedSubscript:](self->_codeFields, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      entryError = self->_entryError;
      if (entryError)
        v20 = 2;
      else
        v20 = (v16 == 0) & (v14 ^ 1u);
      if (entryError)
        v21 = 0;
      else
        v21 = (v16 == 0) & (v14 ^ 1);
      v14 |= v21;
      objc_msgSend(v17, "setHighligtType:", v20);
      objc_msgSend(v18, "setText:", v16);

      ++v15;
    }
    while (self->_codeLength > (double)v15);
  }
  -[PKOneTimeCodeView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_passcodeFieldTapped:(id)a3
{
  if (-[PKOneTimeCodeView canBecomeFirstResponder](self, "canBecomeFirstResponder", a3))
    -[PKOneTimeCodeView becomeFirstResponder](self, "becomeFirstResponder");
}

- (id)_firstCodeField
{
  return -[NSArray firstObject](self->_codeFields, "firstObject");
}

- (double)codeLength
{
  return self->_codeLength;
}

- (double)entrySpacing
{
  return self->_entrySpacing;
}

- (BOOL)disableEntry
{
  return self->_disableEntry;
}

- (unint64_t)entryError
{
  return self->_entryError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonNumericCharSet, 0);
  objc_storeStrong((id *)&self->_invisibleTextField, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_entryErrorLabel, 0);
  objc_storeStrong((id *)&self->_templateField, 0);
  objc_storeStrong((id *)&self->_codeFields, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
