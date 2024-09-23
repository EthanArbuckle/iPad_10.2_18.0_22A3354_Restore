@implementation PKAccountPaymentFundingDetailsApplePayCash

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKAccountPaymentFundingDetailsApplePayCash;
    v5 = -[PKAccountPaymentFundingDetails isEqual:](&v7, sel_isEqual_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
