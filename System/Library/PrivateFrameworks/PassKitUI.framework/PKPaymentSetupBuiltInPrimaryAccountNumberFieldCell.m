@implementation PKPaymentSetupBuiltInPrimaryAccountNumberFieldCell

- (PKPaymentSetupBuiltInPrimaryAccountNumberFieldCell)init
{
  PKPaymentSetupBuiltInPrimaryAccountNumberFieldCell *v2;
  PKPaymentSetupBuiltInPrimaryAccountNumberFieldCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupBuiltInPrimaryAccountNumberFieldCell;
  v2 = -[PKPaymentSetupFieldCell init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKPaymentSetupFieldCell editableTextField](v2, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextContentType:", *MEMORY[0x1E0DC5410]);

  }
  return v3;
}

- (void)setPaymentSetupField:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupBuiltInPrimaryAccountNumberFieldCell;
  -[PKPaymentSetupFieldCell setPaymentSetupField:](&v3, sel_setPaymentSetupField_, a3);
}

@end
