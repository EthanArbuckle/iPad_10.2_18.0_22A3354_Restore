@implementation PKPaymentPreferenceDetailedCellTextField

- (PKPaymentPreferenceDetailedCellTextField)init
{
  PKPaymentPreferenceDetailedCellTextField *v2;
  uint64_t v3;
  UIColor *defaultColor;
  uint64_t v5;
  UIColor *invalidColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferenceDetailedCellTextField;
  v2 = -[PKPaymentPreferenceDetailedCellTextField init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = objc_claimAutoreleasedReturnValue();
    defaultColor = v2->_defaultColor;
    v2->_defaultColor = (UIColor *)v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
    v5 = objc_claimAutoreleasedReturnValue();
    invalidColor = v2->_invalidColor;
    v2->_invalidColor = (UIColor *)v5;

  }
  return v2;
}

- (void)setIsInvalid:(BOOL)a3
{
  uint64_t v3;

  if (self->_isInvalid != a3)
  {
    self->_isInvalid = a3;
    v3 = 1;
    if (!a3)
      v3 = 0;
    -[PKPaymentPreferenceDetailedCellTextField setTextColor:](self, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPaymentPreferenceDetailedCellTextField__defaultColor[v3]));
  }
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidColor, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
}

@end
