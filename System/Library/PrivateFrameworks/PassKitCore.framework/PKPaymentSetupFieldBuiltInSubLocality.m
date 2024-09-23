@implementation PKPaymentSetupFieldBuiltInSubLocality

- (PKPaymentSetupFieldBuiltInSubLocality)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldBuiltInSubLocality;
  return -[PKPaymentSetupFieldText initWithIdentifier:type:](&v5, sel_initWithIdentifier_type_, CFSTR("subLocality"), a4);
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
