@implementation PKAppleBalanceCredential

- (PKAppleBalanceCredential)initWithProduct:(id)a3 eligibilitySource:(int64_t)a4
{
  id v7;
  PKAppleBalanceCredential *v8;
  PKAppleBalanceCredential *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAppleBalanceCredential;
  v8 = -[PKPaymentCredential init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_product, a3);
    v9->_eligibilitySource = a4;
    v9->_isFromBackgroundProvisioning = 0;
    -[PKPaymentCredential setCredentialType:](v9, "setCredentialType:", 135);
    -[PKPaymentCredential setCardType:](v9, "setCardType:", 1);
  }

  return v9;
}

- (id)setupProductIdentifier
{
  return -[PKPaymentSetupProduct productIdentifier](self->_product, "productIdentifier");
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (int64_t)eligibilitySource
{
  return self->_eligibilitySource;
}

- (BOOL)isFromBackgroundProvisioning
{
  return self->_isFromBackgroundProvisioning;
}

- (void)setIsFromBackgroundProvisioning:(BOOL)a3
{
  self->_isFromBackgroundProvisioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
