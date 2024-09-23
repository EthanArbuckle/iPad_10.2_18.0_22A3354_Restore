@implementation PKAddressTextField

- (PKAddressTextField)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PKAddressTextField *v5;
  PKAddressTextField *v6;
  void *v7;
  uint64_t v8;
  UIColor *invalidColor;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKAddressTextField;
  v5 = -[PKAddressTextField initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    if (a4 == 2)
      PKBridgeTextColor();
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_defaultColor, v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
    v8 = objc_claimAutoreleasedReturnValue();
    invalidColor = v6->_invalidColor;
    v6->_invalidColor = (UIColor *)v8;

    PKUISmallExclamationMarkImage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    objc_msgSend(v11, "setTintColor:", v6->_invalidColor);
    objc_msgSend(v11, "setContentMode:", 7);
    objc_msgSend(v10, "size");
    v13 = v12 + 20.0;
    objc_msgSend(v10, "size");
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v13, v14);
    -[PKAddressTextField setRightView:](v6, "setRightView:", v11);
    -[PKAddressTextField setRightViewMode:](v6, "setRightViewMode:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressTextField setFont:](v6, "setFont:", v15);

    -[PKAddressTextField setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67878]);
  }
  return v6;
}

- (void)insertTextSuggestion:(id)a3
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "inputText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAddressTextField setText:](self, "setText:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_addressDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "addressTextField:textDidChange:", self, v5);

}

- (void)setIsInvalid:(BOOL)a3 showErrorGlyph:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;

  v4 = a4;
  if (self->_isInvalid != a3)
  {
    self->_isInvalid = a3;
    v6 = 1;
    if (a3)
      v6 = 2;
    -[PKAddressTextField setTextColor:](self, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___PKAddressTextField__style[v6]));
  }
  if (v4)
    v7 = 3;
  else
    v7 = 0;
  -[PKAddressTextField setRightViewMode:](self, "setRightViewMode:", v7);
}

- (PKUniqueAddressField)addressField
{
  return self->_addressField;
}

- (void)setAddressField:(id)a3
{
  objc_storeStrong((id *)&self->_addressField, a3);
}

- (PKContactFieldConfiguration)contactFieldConfiguration
{
  return self->_contactFieldConfiguration;
}

- (void)setContactFieldConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactFieldConfiguration, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (PKAddressTextFieldDelegate)addressDelegate
{
  return (PKAddressTextFieldDelegate *)objc_loadWeakRetained((id *)&self->_addressDelegate);
}

- (void)setAddressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_addressDelegate, a3);
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (void)setDefaultColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultColor, a3);
}

- (UIColor)invalidColor
{
  return self->_invalidColor;
}

- (void)setInvalidColor:(id)a3
{
  objc_storeStrong((id *)&self->_invalidColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidColor, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
  objc_destroyWeak((id *)&self->_addressDelegate);
  objc_storeStrong((id *)&self->_contactFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_addressField, 0);
}

@end
