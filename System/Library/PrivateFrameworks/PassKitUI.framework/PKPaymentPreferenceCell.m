@implementation PKPaymentPreferenceCell

- (PKPaymentPreferenceCell)initWithReuseIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferenceCell;
  return -[PKPaymentPreferenceCell initWithStyle:reuseIdentifier:](&v4, sel_initWithStyle_reuseIdentifier_, 0, a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPreferenceCell;
  -[PKTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKPaymentPreferenceCell setHasError:](self, "setHasError:", 0);
}

- (void)setHasError:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIColor *v9;
  UIColor *errorColor;
  void *v11;
  void *v12;
  id v13;

  if (self->_hasError != a3)
  {
    v3 = a3;
    self->_hasError = a3;
    if (self->_errorColor)
    {
      if (a3)
      {
LABEL_4:
        PKUIImageNamed(CFSTR("Payment_AlertAccessory"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_flatImageWithColor:", self->_errorColor);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
        -[PKPaymentPreferenceCell setAccessoryView:](self, "setAccessoryView:", v6);
        -[PKPaymentPreferenceCell detailTextLabel](self, "detailTextLabel");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTextColor:", self->_errorColor);

        -[PKPaymentPreferenceCell textLabel](self, "textLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTextColor:", self->_errorColor);

LABEL_7:
        return;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
      errorColor = self->_errorColor;
      self->_errorColor = v9;

      if (v3)
        goto LABEL_4;
    }
    -[PKPaymentPreferenceCell setAccessoryView:](self, "setAccessoryView:", 0);
    -[PKPaymentPreferenceCell detailTextLabel](self, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    -[PKPaymentPreferenceCell textLabel](self, "textLabel");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v6);
    goto LABEL_7;
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentPreferenceCell;
  -[PKPaymentPreferenceCell dealloc](&v2, sel_dealloc);
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorColor, 0);
}

@end
