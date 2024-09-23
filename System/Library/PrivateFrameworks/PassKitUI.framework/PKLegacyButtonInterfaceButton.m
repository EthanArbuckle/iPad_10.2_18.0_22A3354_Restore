@implementation PKLegacyButtonInterfaceButton

- (PKLegacyButtonInterfaceButton)initWithFrame:(CGRect)a3
{
  PKLegacyButtonInterfaceButton *v3;
  PKLegacyButtonInterfaceButton *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKLegacyButtonInterfaceButton;
  v3 = -[PKLegacyButtonInterfaceButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)PKLegacyButtonInterfaceButton;
    -[PKLegacyButtonInterfaceButton setConfigurationUpdateHandler:](&v6, sel_setConfigurationUpdateHandler_, &__block_literal_global_96);
  }
  return v4;
}

void __47__PKLegacyButtonInterfaceButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsActivityIndicator:", v2[752]);
  objc_msgSend(v3, "setBaseBackgroundColor:", *((_QWORD *)v2 + 95));
  objc_msgSend(v3, "setBaseForegroundColor:", *((_QWORD *)v2 + 96));
  objc_msgSend(v3, "setImage:", *((_QWORD *)v2 + 97));
  objc_msgSend(v3, "updatedConfigurationForButton:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setConfiguration:", v4);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[PKLegacyButtonInterfaceButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)updateBackgroundColorWithColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_overrideBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideBackgroundColor, a3);
    -[PKLegacyButtonInterfaceButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    v5 = v6;
  }

}

- (void)updateTitleColorWithColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_overrideForegroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideForegroundColor, a3);
    -[PKLegacyButtonInterfaceButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    v5 = v6;
  }

}

- (void)updateWithImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[PKLegacyButtonInterfaceButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_overrideForegroundColor, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
}

@end
