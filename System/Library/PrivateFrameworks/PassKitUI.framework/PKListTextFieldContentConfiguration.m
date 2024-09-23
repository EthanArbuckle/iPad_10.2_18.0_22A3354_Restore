@implementation PKListTextFieldContentConfiguration

+ (id)cellConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTextProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackingConfig:", v2);
  objc_msgSend(v5, "setReturnKeyType:", 0);
  objc_msgSend(v5, "setClearsOnBeginEditing:", 0);
  objc_msgSend(v5, "setClearsOnInsertion:", 0);
  objc_msgSend(v5, "setFocusTextField:", 1);
  objc_msgSend(v5, "textProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(v5, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setErrorColor:", v8);

  return v5;
}

+ (id)valueCellConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "cellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 1);
  objc_msgSend(v2, "setFocusTextField:", 0);
  objc_msgSend(v2, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTextProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v3, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v2;
}

- (PKListTextFieldContentConfiguration)initWithBackingConfig:(id)a3
{
  id v5;
  PKListTextFieldContentConfiguration *v6;
  PKListTextFieldContentConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKListTextFieldContentConfiguration;
  v6 = -[PKListTextFieldContentConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingConfig, a3);

  return v7;
}

- (NSString)text
{
  return -[UIListContentConfiguration text](self->_backingConfig, "text");
}

- (UIListContentTextProperties)textProperties
{
  return -[UIListContentConfiguration textProperties](self->_backingConfig, "textProperties");
}

- (NSString)secondaryText
{
  return -[UIListContentConfiguration secondaryText](self->_backingConfig, "secondaryText");
}

- (UIListContentTextProperties)secondaryTextProperties
{
  return -[UIListContentConfiguration secondaryTextProperties](self->_backingConfig, "secondaryTextProperties");
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[UIListContentConfiguration directionalLayoutMargins](self->_backingConfig, "directionalLayoutMargins");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)textToSecondaryTextVerticalPadding
{
  double result;

  -[UIListContentConfiguration textToSecondaryTextVerticalPadding](self->_backingConfig, "textToSecondaryTextVerticalPadding");
  return result;
}

- (double)textToSecondaryTextHorizontalPadding
{
  double result;

  -[UIListContentConfiguration textToSecondaryTextHorizontalPadding](self->_backingConfig, "textToSecondaryTextHorizontalPadding");
  return result;
}

- (void)setText:(id)a3
{
  -[UIListContentConfiguration setText:](self->_backingConfig, "setText:", a3);
}

- (void)setSecondaryText:(id)a3
{
  -[UIListContentConfiguration setSecondaryText:](self->_backingConfig, "setSecondaryText:", a3);
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  -[UIListContentConfiguration setDirectionalLayoutMargins:](self->_backingConfig, "setDirectionalLayoutMargins:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (void)setTextToSecondaryTextVerticalPadding:(double)a3
{
  -[UIListContentConfiguration setTextToSecondaryTextVerticalPadding:](self->_backingConfig, "setTextToSecondaryTextVerticalPadding:", a3);
}

- (void)setTextToSecondaryTextHorizontalPadding:(double)a3
{
  -[UIListContentConfiguration setTextToSecondaryTextHorizontalPadding:](self->_backingConfig, "setTextToSecondaryTextHorizontalPadding:", a3);
}

- (id)makeContentView
{
  return -[PKListTextFieldContentView initWithConfiguration:]([PKListTextFieldContentView alloc], "initWithConfiguration:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[UIListContentConfiguration copyWithZone:](self->_backingConfig, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 24), self->_placeholderText);
  *(_QWORD *)(v5 + 32) = self->_returnKeyType;
  *(_BYTE *)(v5 + 18) = self->_focusTextField;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  PKListTextFieldContentConfiguration *v4;
  PKListTextFieldContentConfiguration *v5;
  BOOL v6;

  v4 = (PKListTextFieldContentConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKListTextFieldContentConfiguration _isEqualToListTextFieldContentConfiguration:](self, "_isEqualToListTextFieldContentConfiguration:", v5);

  return v6;
}

- (BOOL)_isEqualToListTextFieldContentConfiguration:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  int v9;

  v4 = a3;
  if (v4 && PKEqualObjects())
  {
    v5 = (void *)v4[3];
    v6 = self->_placeholderText;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      LOBYTE(v9) = 0;
      if (!v6 || !v7)
        goto LABEL_11;
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (!v9)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_focusTextField);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v4 + 18));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = PKEqualObjects();
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v9) = 0;
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_backingConfig);
  objc_msgSend(v3, "safelyAddObject:", self->_placeholderText);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_focusTextField);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash();
  return v5;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (BOOL)clearsOnBeginEditing
{
  return self->_clearsOnBeginEditing;
}

- (void)setClearsOnBeginEditing:(BOOL)a3
{
  self->_clearsOnBeginEditing = a3;
}

- (BOOL)clearsOnInsertion
{
  return self->_clearsOnInsertion;
}

- (void)setClearsOnInsertion:(BOOL)a3
{
  self->_clearsOnInsertion = a3;
}

- (BOOL)focusTextField
{
  return self->_focusTextField;
}

- (void)setFocusTextField:(BOOL)a3
{
  self->_focusTextField = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)errorColor
{
  return self->_errorColor;
}

- (void)setErrorColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)hasErrorHandler
{
  return self->_hasErrorHandler;
}

- (void)setHasErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hasErrorHandler, 0);
  objc_storeStrong((id *)&self->_errorColor, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_backingConfig, 0);
}

@end
