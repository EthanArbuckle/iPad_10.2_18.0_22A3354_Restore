@implementation PKPaymentPassDetailContactSupportSectionController

- (PKPaymentPassDetailContactSupportSectionController)initWithDelegate:(id)a3
{
  id v4;
  PKPaymentPassDetailContactSupportSectionController *v5;
  PKPaymentPassDetailContactSupportSectionController *v6;
  uint64_t v7;
  NSString *titleText;
  uint64_t v9;
  UIColor *titleColor;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassDetailContactSupportSectionController;
  v5 = -[PKPaymentPassDetailSectionController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_contactOption = 15;
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_CONTACT_SUPPORT_TITLE"));
    v7 = objc_claimAutoreleasedReturnValue();
    titleText = v6->_titleText;
    v6->_titleText = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v9 = objc_claimAutoreleasedReturnValue();
    titleColor = v6->_titleColor;
    v6->_titleColor = (UIColor *)v9;

  }
  return v6;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ContactSupportSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPaymentPassDetailContactSupportSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "paymentNetworkIdentifier") == 135;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ContactSupportCell"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ContactSupportCell"));
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", self->_titleText);
  objc_msgSend(v7, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", self->_titleColor);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v6, "setSelectionStyle:", 0);

  return v6;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return self->_footerText;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contactSupportSectionControllerDidSelect:", self);

}

- (PKPaymentPassDetailContactSupportSectionControllerDelegate)delegate
{
  return (PKPaymentPassDetailContactSupportSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)contactOption
{
  return self->_contactOption;
}

- (void)setContactOption:(unint64_t)a3
{
  self->_contactOption = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_footerText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
